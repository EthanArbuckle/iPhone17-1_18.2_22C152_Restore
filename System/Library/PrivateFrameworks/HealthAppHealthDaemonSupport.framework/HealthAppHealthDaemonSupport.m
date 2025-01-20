uint64_t dispatch thunk of PinnedContentState.identifiers.getter()
{
  void *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t sub_250D6F5FC(uint64_t a1)
{
  uint64_t v2 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17050](a1, v2);
}

uint64_t sub_250D6F668()
{
  return sub_250D7FEB0();
}

uint64_t sub_250D6F6E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroy_23Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_250D6F778(uint64_t a1, uint64_t a2)
{
  v3 = *(void (**)(void *))(a1 + 32);
  v5[3] = swift_getObjectType();
  v5[0] = a2;
  swift_unknownObjectRetain();
  v3(v5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

id static PinnedContentStore.clientInterface.getter()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2701E63A0);
  return v0;
}

uint64_t sub_250D6F82C()
{
  uint64_t v0 = sub_250D7FE20();
  __swift_allocate_value_buffer(v0, qword_26B206190);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B206190);
  return sub_250D7FE10();
}

uint64_t objectdestroy_229Tm()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

BOOL PinnedContentDomain.init(rawValue:)()
{
  uint64_t v0 = sub_250D803C0();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

void sub_250D6F9D8(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_250D6FA64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + *(int *)(a1 + 24)) = MEMORY[0x263F8EE80];
  sub_250D80000();
  sub_250D6FB9C(0, (unint64_t *)&unk_26B2060D0);
  sub_250D6FB58((unint64_t *)&qword_26B2060A8, (unint64_t *)&unk_26B2060D0);
  return sub_250D7FFC0();
}

uint64_t sub_250D6FB58(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_250D6FB9C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_250D6FB9C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_250D801B0();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t *sub_250D6FBE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_250D70B2C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    sub_250D70B94();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

id HDCodablePinnedContentState.getPinnedContent()()
{
  sub_250D70B94();
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388]();
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v1)
  {
    sub_250D70B2C();
    MEMORY[0x253388590](&v17);
    char v10 = v17;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, &v9[*(int *)(v7 + 20)], v3);
    sub_250D708FC(&qword_26B206098, (void (*)(uint64_t))sub_250D70B94);
    uint64_t v11 = sub_250D80140();
    uint64_t v12 = (objc_class *)type metadata accessor for PinnedContentState();
    v13 = objc_allocWithZone(v12);
    v13[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = v10;
    *(void *)&v13[OBJC_IVAR___HAHDPinnedContentState_identifiers] = v11;
    v16.receiver = v13;
    v16.super_class = v12;
    id v0 = objc_msgSendSuper2(&v16, sel_init);
    sub_250D70944((uint64_t)v9);
  }
  return v0;
}

void sub_250D6FEF8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t v8 = *(void **)(a3 + 16);
  *(void *)(a3 + 16) = a1;
  id v9 = a1;

  swift_beginAccess();
  char v10 = *(void **)(a4 + 16);
  *(void *)(a4 + 16) = a2;
  id v11 = a2;
}

uint64_t static Logger.pinnedContent.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_26B206130 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_250D7FE20();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_26B206190);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

void sub_250D70038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v7 = (void *)v12[0];
    uint64_t v8 = (void *)sub_250D800E0();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a3;
    *(void *)(v9 + 24) = a4;
    aBlock[4] = sub_250D727D8;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_297;
    char v10 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_fetchPinnedContentInDomain_withCompletion_, v8, v10);
    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v12[4] = 91;
    v12[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v12);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

uint64_t sub_250D7028C@<X0>(void *a1@<X8>)
{
  if (qword_26B205FA8 != -1) {
    swift_once();
  }
  uint64_t v2 = unk_26B2061B0;
  uint64_t v4 = qword_26B2061B8;
  uint64_t v3 = unk_26B2061C0;
  uint64_t v5 = qword_26B2061C8;
  uint64_t v6 = qword_26B2061D0;
  *a1 = qword_26B2061A8;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t HDCodablePinnedContentState.logDescription.getter()
{
  swift_getObjectType();
  sub_250D70B94();
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v16[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CoherentPinnedContentState();
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  char v10 = (char *)&v16[-1] - v9;
  sub_250D70630();
  v16[0] = 0;
  v16[1] = 0xE000000000000000;
  sub_250D802F0();
  swift_bridgeObjectRelease();
  strcpy((char *)v16, "identifiers=");
  BYTE5(v16[1]) = 0;
  HIWORD(v16[1]) = -5120;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, &v10[*(int *)(v5 + 20)], v1);
  sub_250D708FC(&qword_26B206098, (void (*)(uint64_t))sub_250D70B94);
  sub_250D80140();
  MEMORY[0x253388730]();
  sub_250D80120();
  swift_release();
  swift_bridgeObjectRelease();
  sub_250D80120();
  sub_250D72708((uint64_t)v10, (uint64_t)v8);
  sub_250D80100();
  sub_250D80120();
  swift_bridgeObjectRelease();
  sub_250D70944((uint64_t)v10);
  v16[0] = 0;
  v16[1] = 0xE000000000000000;
  sub_250D802F0();
  uint64_t v11 = sub_250D80480();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  v16[0] = v11;
  v16[1] = v13;
  sub_250D80120();
  sub_250D80120();
  swift_bridgeObjectRelease();
  return v16[0];
}

uint64_t sub_250D70630()
{
  swift_getObjectType();
  id v1 = objc_msgSend(v0, sel_pinnedContentStateData);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_250D7FDC0();

    type metadata accessor for CoherentPinnedContentState();
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    return sub_250D80060();
  }
  else
  {
    if (qword_26B206130 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_250D7FE20();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B206190);
    uint64_t v5 = sub_250D7FE00();
    os_log_type_t v6 = sub_250D80230();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v8 = swift_slowAlloc();
      uint64_t v14 = v8;
      *(_DWORD *)uint64_t v7 = 136315394;
      uint64_t v9 = sub_250D80480();
      sub_250D7D4A8(v9, v10, &v14);
      sub_250D80270();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      uint64_t v11 = sub_250D80100();
      sub_250D7D4A8(v11, v12, &v14);
      sub_250D80270();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250D6D000, v5, v6, "[%s]: Underlying data is missing: %s", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x253388EC0](v8, -1, -1);
      MEMORY[0x253388EC0](v7, -1, -1);
    }

    sub_250D7FD48();
    swift_allocError();
    void *v13 = 0xD000000000000016;
    v13[1] = 0x8000000250D819C0;
    return swift_willThrow();
  }
}

uint64_t sub_250D708FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250D70944(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CoherentPinnedContentState();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250D709A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_250D70B2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_250D70B94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_250D70A70(uint64_t a1, uint64_t a2)
{
  sub_250D70B2C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_250D70B94();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

void sub_250D70B2C()
{
  if (!qword_26B205FC8)
  {
    unint64_t v0 = sub_250D7FFF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B205FC8);
    }
  }
}

void sub_250D70B94()
{
  if (!qword_26B2060A0)
  {
    unint64_t v0 = sub_250D7FFB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2060A0);
    }
  }
}

uint64_t type metadata accessor for CoherentPinnedContentState()
{
  uint64_t result = qword_26B205FF8;
  if (!qword_26B205FF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

id sub_250D70D38(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = (void *)sub_250D800E0();
  unsigned __int8 v5 = objc_msgSend(a1, sel_decodeBoolForKey_, v4);

  v3[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = v5;
  sub_250D72670();
  unint64_t v6 = sub_250D80240();
  if (!v6)
  {
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
LABEL_24:
    *(void *)&v3[OBJC_IVAR___HAHDPinnedContentState_identifiers] = v11;

    v26.receiver = v3;
    v26.super_class = (Class)type metadata accessor for PinnedContentState();
    return objc_msgSendSuper2(&v26, sel_init);
  }
  unint64_t v7 = v6;
  if (!(v6 >> 62))
  {
    uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (v8) {
      goto LABEL_4;
    }
LABEL_22:
    uint64_t v11 = (void *)MEMORY[0x263F8EE78];
LABEL_23:
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  id result = (id)sub_250D803A0();
  uint64_t v8 = (uint64_t)result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_4:
  if (v8 >= 1)
  {
    if ((v7 & 0xC000000000000001) != 0)
    {
      uint64_t v10 = 0;
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
      do
      {
        MEMORY[0x2533888D0](v10, v7);
        uint64_t v12 = sub_250D800F0();
        uint64_t v14 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v11 = sub_250D70FD4(0, v11[2] + 1, 1, v11);
        }
        unint64_t v16 = v11[2];
        unint64_t v15 = v11[3];
        if (v16 >= v15 >> 1) {
          uint64_t v11 = sub_250D70FD4((void *)(v15 > 1), v16 + 1, 1, v11);
        }
        ++v10;
        v11[2] = v16 + 1;
        uint64_t v17 = &v11[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      while (v8 != v10);
    }
    else
    {
      v18 = (id *)(v7 + 32);
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
      do
      {
        id v19 = *v18;
        uint64_t v20 = sub_250D800F0();
        uint64_t v22 = v21;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v11 = sub_250D70FD4(0, v11[2] + 1, 1, v11);
        }
        unint64_t v24 = v11[2];
        unint64_t v23 = v11[3];
        if (v24 >= v23 >> 1) {
          uint64_t v11 = sub_250D70FD4((void *)(v23 > 1), v24 + 1, 1, v11);
        }
        v11[2] = v24 + 1;
        v25 = &v11[2 * v24];
        v25[4] = v20;
        v25[5] = v22;
        ++v18;
        --v8;
      }
      while (v8);
    }
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

void *sub_250D70FD4(void *result, int64_t a2, char a3, void *a4)
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
      sub_250D71E5C(0, (unint64_t *)&unk_26B2060B8, MEMORY[0x263F8D310], MEMORY[0x263F8E0F8]);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_250D7257C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_250D71104()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  uint64_t v17 = (id *)(v3 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  unint64_t v16 = (void **)(result + 16);
  char v5 = *(void **)&v0[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = result;
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v1;
  v7[3] = v3;
  v7[4] = v6;
  v7[5] = ObjectType;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_250D727DC;
  *(void *)(v8 + 24) = v7;
  uint64_t v22 = sub_250D72554;
  uint64_t v23 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_250D6F778;
  uint64_t v21 = &block_descriptor_30;
  uint64_t v9 = _Block_copy(&aBlock);
  id v10 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  id v11 = v5;
  swift_release();
  uint64_t v22 = sub_250D78CD0;
  uint64_t v23 = v6;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_250D73850;
  uint64_t v21 = &block_descriptor_33;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_getSynchronousProxyWithHandler_errorHandler_, v9, v12);

  _Block_release(v12);
  _Block_release(v9);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v12)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v17)
  {
    id v13 = *v17;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  else
  {
    swift_beginAccess();
    uint64_t v14 = *v16;
    if (!*v16)
    {
      sub_250D78CEC();
      swift_allocError();
      uint64_t v14 = 0;
    }
    id v15 = v14;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_250D71434(void *a1)
{
  uint64_t v3 = (unsigned __int8 *)(v1 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char v5 = (void *)sub_250D800E0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v4, v5);

  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = *(void *)(*v6 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    sub_250D80350();
    uint64_t v9 = v7 + 40;
    do
    {
      id v10 = objc_allocWithZone(NSString);
      swift_bridgeObjectRetain();
      id v11 = (void *)sub_250D800E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_initWithString_, v11);

      sub_250D80330();
      sub_250D80360();
      sub_250D80370();
      sub_250D80340();
      v9 += 16;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  sub_250D72670();
  uint64_t v12 = (void *)sub_250D80160();
  swift_bridgeObjectRelease();
  id v13 = (void *)sub_250D800E0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v12, v13);
}

void PinnedContentStore.init(healthStore:domain:)(void *a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_250D7FDF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider] = 0;
  *(void *)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_healthStore] = a1;
  uint64_t v8 = (objc_class *)type metadata accessor for PinnedContentStore();
  v25.receiver = v2;
  v25.super_class = v8;
  id v9 = a1;
  id v10 = objc_msgSendSuper2(&v25, sel_init);
  id v11 = v9;
  id v12 = v10;
  sub_250D80480();
  id v13 = self;
  uint64_t v14 = (char *)v12;
  id v15 = objc_msgSend(v13, sel_interfaceWithProtocol_, &unk_2701E63A0);
  unint64_t v16 = (void *)_s09HealthAppA13DaemonSupport18PinnedContentStoreC15serverInterfaceSo14NSXPCInterfaceCvgZ_0();
  sub_250D7FDE0();
  id v17 = objc_allocWithZone(MEMORY[0x263F0A818]);
  v18 = (void *)sub_250D800E0();
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)sub_250D7FDD0();
  id v20 = objc_msgSend(v17, sel_initWithHealthStore_taskIdentifier_exportedObject_exportedInterface_remoteInterface_taskUUID_, v11, v18, v14, v15, v16, v19);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v21 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  uint64_t v22 = *(void **)&v14[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  *(void *)&v14[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider] = v20;

  uint64_t v23 = *(void **)&v14[v21];
  if (v23)
  {
    id v24 = v23;
    objc_msgSend(v24, sel_setShouldRetryOnInterruption_, 0);
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for PinnedContentStore()
{
  return self;
}

uint64_t _s09HealthAppA13DaemonSupport18PinnedContentStoreC15serverInterfaceSo14NSXPCInterfaceCvgZ_0()
{
  id v12 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2701E6340);
  sub_250D71EF4(0, (unint64_t *)&unk_26B206110);
  *(void *)&long long v16 = MEMORY[0x263F8EE78];
  MEMORY[0x253388710]();
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_250D80190();
  }
  sub_250D71EF4(0, (unint64_t *)&qword_26B206120);
  swift_getObjCClassFromMetadata();
  sub_250D801A0();
  uint64_t v0 = sub_250D80180();
  MEMORY[0x253388710](v0);
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_250D80190();
  }
  type metadata accessor for CodablePinnedContentDifference();
  swift_getObjCClassFromMetadata();
  sub_250D801A0();
  uint64_t v1 = sub_250D80180();
  MEMORY[0x253388710](v1);
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_250D80190();
  }
  type metadata accessor for PinnedContentState();
  swift_getObjCClassFromMetadata();
  sub_250D801A0();
  uint64_t v2 = sub_250D80180();
  MEMORY[0x253388710](v2);
  if (*(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_250D80190();
  }
  swift_getObjCClassFromMetadata();
  sub_250D801A0();
  sub_250D80180();
  if (!((unint64_t)v16 >> 62))
  {
    uint64_t v3 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_11;
    }
LABEL_24:
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
LABEL_25:
    swift_bridgeObjectRelease_n();
    sub_250D72028((uint64_t)v6);
    swift_bridgeObjectRelease();
    id v11 = (void *)sub_250D801C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setClasses_forSelector_argumentIndex_ofReply_, v11, sel_remote_applyDifferencesWithDifferences_inDomain_completion_, 0, 0);

    return (uint64_t)v12;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_250D803A0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_24;
  }
LABEL_11:
  if (v3 >= 1)
  {
    uint64_t v5 = v16 + 32;
    uint64_t v6 = (void *)MEMORY[0x263F8EE78];
    uint64_t v7 = MEMORY[0x263F8DB68];
    do
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0)
      {
        uint64_t v18 = 0;
        long long v16 = 0u;
        long long v17 = 0u;
      }
      swift_unknownObjectRelease();
      if (*((void *)&v17 + 1))
      {
        long long v13 = v16;
        long long v14 = v17;
        uint64_t v15 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v6 = sub_250D71D18(0, v6[2] + 1, 1, v6);
        }
        unint64_t v9 = v6[2];
        unint64_t v8 = v6[3];
        if (v9 >= v8 >> 1) {
          uint64_t v6 = sub_250D71D18((void *)(v8 > 1), v9 + 1, 1, v6);
        }
        v6[2] = v9 + 1;
        id v10 = &v6[5 * v9];
        v10[8] = v15;
        *((_OWORD *)v10 + 2) = v13;
        *((_OWORD *)v10 + 3) = v14;
      }
      else
      {
        sub_250D79A00((uint64_t)&v16, (unint64_t *)&unk_269B030D0, v7);
      }
      v5 += 8;
      --v3;
    }
    while (v3);
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_250D71CCC()
{
  return swift_bridgeObjectRetain();
}

void *sub_250D71D18(void *result, int64_t a2, char a3, void *a4)
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
      sub_250D71E5C(0, &qword_26B206188, MEMORY[0x263F8DB68], MEMORY[0x263F8E0F8]);
      id v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      id v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      id v12 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_250D71F30(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_250D71E5C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_250D71EA8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_250D71EF4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_250D71F30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_250D803B0();
  __break(1u);
  return result;
}

uint64_t sub_250D72028(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_250D801D0();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      sub_250D72284(v4, (uint64_t)v5);
      sub_250D72108((uint64_t)v6, (uint64_t)v5);
      sub_250D720B4((uint64_t)v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_250D720B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_250D72108(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_250D802A0();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    while (1)
    {
      sub_250D72284(*(void *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      char v11 = MEMORY[0x253388870](v16, a2);
      sub_250D720B4((uint64_t)v16);
      if (v11) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_250D720B4(a2);
    sub_250D72284(*(void *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_250D72284(a2, (uint64_t)v16);
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_250D722E0((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v15;
    swift_bridgeObjectRelease();
    long long v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_250D72284(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_250D722E0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_250D784E0();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_250D787A8();
      goto LABEL_12;
    }
    sub_250D78974();
  }
  uint64_t v9 = *v3;
  uint64_t result = sub_250D802A0();
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_250D72284(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = MEMORY[0x253388870](v19, v6);
      uint64_t result = sub_250D720B4((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_250D80400();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for CodablePinnedContentDifference()
{
  return self;
}

uint64_t type metadata accessor for PinnedContentState()
{
  return self;
}

uint64_t dispatch thunk of PinnedContentStoring.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

unint64_t PinnedContentDomain.keyValueDomainName.getter()
{
  return 0xD000000000000026;
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

uint64_t sub_250D724F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_250D72554()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_250D7257C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  uint64_t result = sub_250D803B0();
  __break(1u);
  return result;
}

unint64_t sub_250D72670()
{
  unint64_t result = qword_26B206120;
  if (!qword_26B206120)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B206120);
  }
  return result;
}

unint64_t sub_250D726B0()
{
  unint64_t result = qword_26B2060C8;
  if (!qword_26B2060C8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B2060C8);
  }
  return result;
}

uint64_t sub_250D72708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoherentPinnedContentState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t dispatch thunk of PinnedContentStoring.fetchPinnedContent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t _s09HealthAppA13DaemonSupport19PinnedContentDomainO11descriptionSSvg_0()
{
  return 0x7972616D6D7573;
}

uint64_t sub_250D727B0()
{
  return sub_250D71104();
}

void sub_250D727DC(uint64_t a1)
{
  sub_250D70038(a1, v1[2], v1[3], v1[4]);
}

void sub_250D727E8(void *a1, void *a2)
{
  sub_250D6FEF8(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t static PinnedContentState.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_250D72824@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = (unsigned char *)(*a1 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_250D72878(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (unsigned char *)(*a2 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_250D728C8()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_250D72910(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_250D7295C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250D729B8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_250D72A10(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D72A7C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_250D72AD0())()
{
  return j__swift_endAccess;
}

id PinnedContentState.__allocating_init(shouldRespectOrder:identifiers:)(char a1, uint64_t a2)
{
  unint64_t v5 = objc_allocWithZone(v2);
  v5[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = a1;
  *(void *)&v5[OBJC_IVAR___HAHDPinnedContentState_identifiers] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id PinnedContentState.init(shouldRespectOrder:identifiers:)(char a1, uint64_t a2)
{
  v2[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = a1;
  *(void *)&v2[OBJC_IVAR___HAHDPinnedContentState_identifiers] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for PinnedContentState();
  return objc_msgSendSuper2(&v4, sel_init);
}

id PinnedContentState.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_250D70D38(a1);

  return v4;
}

id PinnedContentState.init(coder:)(void *a1)
{
  id v2 = sub_250D70D38(a1);

  return v2;
}

id PinnedContentState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PinnedContentState.init()()
{
}

id PinnedContentState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentState();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PinnedContentState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PinnedContentState);
}

uint64_t dispatch thunk of PinnedContentState.shouldRespectOrder.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PinnedContentState.shouldRespectOrder.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PinnedContentState.shouldRespectOrder.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PinnedContentState.identifiers.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of PinnedContentState.identifiers.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of PinnedContentState.__allocating_init(shouldRespectOrder:identifiers:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of PinnedContentState.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of PinnedContentState.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of PinnedContentStoring.fetchPinnedContent(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PinnedContentStoring.applyDifferences(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of PinnedContentStoring.applyDifferences(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PinnedContentStoring.pinContentWithIdentifier(_:at:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a8 + 48))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStoring.pinContentWithIdentifier(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a6 + 56))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStoring.unpinContentWithIdentifier(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of PinnedContentStoring.unpinContentWithIdentifier(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of PinnedContentStoring.movePinnedContentWithIdentifier(_:to:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t dispatch thunk of PinnedContentStoring.movePinnedContentWithIdentifier(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of PinnedContentStoring.unpinAllContentInDomain(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of PinnedContentStoring.unpinAllContentInDomain()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

id PinnedContentStore.healthStore.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_healthStore);
}

void PinnedContentStore.__allocating_init(healthStore:domain:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  PinnedContentStore.init(healthStore:domain:)(a1);
}

uint64_t static PinnedContentStore.taskIdentifier.getter()
{
  return sub_250D80480();
}

void sub_250D73034(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  unint64_t v8 = *(void **)&v3[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v8)
  {
    uint64_t v9 = ObjectType;
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v3;
    v10[3] = a1;
    v10[4] = a2;
    v10[5] = v9;
    v28 = (uint64_t (*)())sub_250D78C08;
    v29 = v10;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 1107296256;
    objc_super v26 = sub_250D732FC;
    v27 = &block_descriptor;
    uint64_t v11 = _Block_copy(&v24);
    char v12 = v3;
    swift_retain();
    id v13 = v8;
    swift_release();
    id v14 = objc_msgSend(v13, sel_clientQueueObjectHandlerWithCompletion_, v11);
    _Block_release(v11);

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(void **)&v3[v7];
    if (v16)
    {
      uint64_t v17 = v15;
      uint64_t v18 = (void *)swift_allocObject();
      v18[2] = v12;
      v18[3] = sub_250D78C30;
      v18[4] = v17;
      v18[5] = v9;
      v28 = (uint64_t (*)())sub_250D78C3C;
      v29 = v18;
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 1107296256;
      objc_super v26 = sub_250D737E0;
      v27 = &block_descriptor_9;
      uint64_t v19 = _Block_copy(&v24);
      id v20 = v12;
      id v21 = v16;
      swift_retain();
      swift_release();
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = sub_250D78C30;
      *(void *)(v22 + 24) = v17;
      v28 = sub_250D78C48;
      v29 = (void *)v22;
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 1107296256;
      objc_super v26 = sub_250D73850;
      v27 = &block_descriptor_15;
      uint64_t v23 = _Block_copy(&v24);
      swift_retain();
      swift_release();
      objc_msgSend(v21, sel_fetchProxyWithHandler_errorHandler_, v19, v23);
      _Block_release(v23);
      _Block_release(v19);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_250D732FC(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(long long *, void *))(a1 + 32);
  if (a2)
  {
    *((void *)&v9 + 1) = swift_getObjectType();
    *(void *)&long long v8 = a2;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(&v8, a3);
  swift_release();

  return sub_250D79A00((uint64_t)&v8, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
}

void sub_250D733A4(uint64_t a1, void *a2, uint64_t a3)
{
  sub_250D7986C(a1, (uint64_t)v11);
  uint64_t v5 = v12;
  if (!v12)
  {
    uint64_t v10 = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v6 = __swift_project_boxed_opaque_existential_0(v11, v12);
  uint64_t v7 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = sub_250D803E0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (a2) {
LABEL_3:
  }
    a2 = (void *)sub_250D7FDA0();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease();
}

void sub_250D73508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v7 = (void *)v12[0];
    uint64_t v8 = (void *)sub_250D800E0();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a3;
    *(void *)(v9 + 24) = a4;
    aBlock[4] = sub_250D79C58;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_304;
    uint64_t v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_fetchPinnedContentInDomain_withCompletion_, v8, v10);
    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v12[4] = 91;
    v12[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v12);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

uint64_t sub_250D73754(void *a1, uint64_t a2, void (*a3)(long long *, uint64_t))
{
  if (a1)
  {
    *((void *)&v9 + 1) = type metadata accessor for PinnedContentState();
    *(void *)&long long v8 = a1;
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  id v6 = a1;
  a3(&v8, a2);
  return sub_250D79A00((uint64_t)&v8, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
}

uint64_t sub_250D737E0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  v5[3] = swift_getObjectType();
  v5[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v3(v5);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

void sub_250D73850(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_250D738B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  uint64_t v10 = *(void **)&v3[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v10)
  {
    uint64_t v11 = ObjectType;
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = v4;
    v12[3] = a2;
    v12[4] = a3;
    v12[5] = v11;
    v30 = (uint64_t (*)(uint64_t))sub_250D79BB8;
    v31 = v12;
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 1107296256;
    v28 = sub_250D732FC;
    v29 = &block_descriptor_39;
    id v13 = _Block_copy(&v26);
    id v14 = v4;
    swift_retain();
    id v15 = v10;
    swift_release();
    id v16 = objc_msgSend(v15, sel_clientQueueObjectHandlerWithCompletion_, v13);
    _Block_release(v13);

    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = v16;
    uint64_t v18 = *(void **)&v4[v9];
    if (v18)
    {
      uint64_t v19 = v17;
      id v20 = (void *)swift_allocObject();
      v20[2] = v14;
      v20[3] = a1;
      v20[4] = sub_250D79AD0;
      v20[5] = v19;
      v20[6] = v11;
      v30 = sub_250D78D8C;
      v31 = v20;
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 1107296256;
      v28 = sub_250D737E0;
      v29 = &block_descriptor_49;
      id v21 = _Block_copy(&v26);
      uint64_t v22 = v14;
      id v23 = v18;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      uint64_t v24 = swift_allocObject();
      *(void *)(v24 + 16) = sub_250D79AD0;
      *(void *)(v24 + 24) = v19;
      v30 = (uint64_t (*)(uint64_t))sub_250D78C48;
      v31 = (void *)v24;
      uint64_t v26 = MEMORY[0x263EF8330];
      uint64_t v27 = 1107296256;
      v28 = sub_250D73850;
      v29 = &block_descriptor_55;
      uint64_t v25 = _Block_copy(&v26);
      swift_retain();
      swift_release();
      objc_msgSend(v23, sel_fetchProxyWithHandler_errorHandler_, v21, v25);
      _Block_release(v25);
      _Block_release(v21);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_250D73B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v9 = (void *)v29[0];
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
      uint64_t v25 = a4;
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_250D80350();
      uint64_t v11 = (unsigned char *)(a3 + 56);
      do
      {
        uint64_t v15 = *((void *)v11 - 3);
        if (*v11 == 1)
        {
          uint64_t v16 = *((void *)v11 - 2);
          uint64_t v17 = *((void *)v11 - 1);
          uint64_t v18 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          uint64_t v19 = (char *)objc_allocWithZone(v18);
          id v20 = &v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(void *)id v20 = 0;
          *((void *)v20 + 1) = 0;
          *(void *)&v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v17;
          swift_beginAccess();
          *(void *)id v20 = v15;
          *((void *)v20 + 1) = v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v26.receiver = v19;
          v26.super_class = v18;
          objc_msgSendSuper2(&v26, sel_init);
        }
        else
        {
          uint64_t v12 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          id v13 = (char *)objc_allocWithZone(v12);
          id v14 = &v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(void *)id v14 = 0;
          *((void *)v14 + 1) = 0;
          *(void *)&v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v15;
          swift_beginAccess();
          *(void *)id v14 = 0;
          *((void *)v14 + 1) = 0;
          swift_bridgeObjectRelease();
          v28.receiver = v13;
          v28.super_class = v12;
          objc_msgSendSuper2(&v28, sel_init);
        }
        sub_250D80330();
        sub_250D80360();
        sub_250D80370();
        sub_250D80340();
        v11 += 32;
        --v10;
      }
      while (v10);
      a4 = v25;
    }
    type metadata accessor for CodablePinnedContentDifference();
    id v21 = (void *)sub_250D80160();
    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)sub_250D800E0();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a4;
    *(void *)(v23 + 24) = a5;
    aBlock[4] = sub_250D79C58;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_291;
    uint64_t v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_remote_applyDifferencesWithDifferences_inDomain_completion_, v21, v22, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v29[0] = 0;
    v29[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v29);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

uint64_t sub_250D73F94(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  uint64_t v18 = (id *)(v4 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  uint64_t v17 = (void **)(result + 16);
  id v6 = *(void **)&v1[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v7 = result;
  long long v8 = (void *)swift_allocObject();
  v8[2] = v1;
  v8[3] = a1;
  v8[4] = v4;
  v8[5] = v7;
  v8[6] = ObjectType;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_250D78DF4;
  *(void *)(v9 + 24) = v8;
  uint64_t v23 = sub_250D79C5C;
  uint64_t v24 = v9;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  id v21 = sub_250D6F778;
  uint64_t v22 = &block_descriptor_67;
  uint64_t v25 = _Block_copy(&aBlock);
  uint64_t v10 = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v11 = v6;
  swift_release();
  uint64_t v23 = sub_250D78CD0;
  uint64_t v24 = v7;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v20 = 1107296256;
  id v21 = sub_250D73850;
  uint64_t v22 = &block_descriptor_70;
  uint64_t v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  id v13 = v25;
  objc_msgSend(v11, sel_getSynchronousProxyWithHandler_errorHandler_, v25, v12);

  _Block_release(v12);
  _Block_release(v13);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v12)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v18)
  {
    id v14 = *v18;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v14;
  }
  else
  {
    swift_beginAccess();
    uint64_t v15 = *v17;
    if (!*v17)
    {
      sub_250D78CEC();
      swift_allocError();
      uint64_t v15 = 0;
    }
    id v16 = v15;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_250D742CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v9 = (void *)v30[0];
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
      uint64_t v25 = (void *)v30[0];
      uint64_t v26 = a5;
      aBlock[0] = MEMORY[0x263F8EE78];
      sub_250D80350();
      id v11 = (unsigned char *)(a3 + 56);
      do
      {
        uint64_t v15 = *((void *)v11 - 3);
        if (*v11 == 1)
        {
          uint64_t v16 = *((void *)v11 - 2);
          uint64_t v17 = *((void *)v11 - 1);
          uint64_t v18 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          uint64_t v19 = (char *)objc_allocWithZone(v18);
          uint64_t v20 = &v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(void *)uint64_t v20 = 0;
          *((void *)v20 + 1) = 0;
          *(void *)&v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v17;
          swift_beginAccess();
          *(void *)uint64_t v20 = v15;
          *((void *)v20 + 1) = v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v27.receiver = v19;
          v27.super_class = v18;
          objc_msgSendSuper2(&v27, sel_init);
        }
        else
        {
          uint64_t v12 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          id v13 = (char *)objc_allocWithZone(v12);
          id v14 = &v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(void *)id v14 = 0;
          *((void *)v14 + 1) = 0;
          *(void *)&v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v15;
          swift_beginAccess();
          *(void *)id v14 = 0;
          *((void *)v14 + 1) = 0;
          swift_bridgeObjectRelease();
          v29.receiver = v13;
          v29.super_class = v12;
          objc_msgSendSuper2(&v29, sel_init);
        }
        sub_250D80330();
        sub_250D80360();
        sub_250D80370();
        sub_250D80340();
        v11 += 32;
        --v10;
      }
      while (v10);
      a5 = v26;
      uint64_t v9 = v25;
    }
    type metadata accessor for CodablePinnedContentDifference();
    id v21 = (void *)sub_250D80160();
    swift_bridgeObjectRelease();
    uint64_t v22 = (void *)sub_250D800E0();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = a4;
    *(void *)(v23 + 24) = a5;
    aBlock[4] = sub_250D727D8;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_284;
    uint64_t v24 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_remote_applyDifferencesWithDifferences_inDomain_completion_, v21, v22, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v30[0] = 0;
    v30[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v30);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

void sub_250D746D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v12 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  id v13 = *(void **)&v7[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v13)
  {
    uint64_t v14 = ObjectType;
    uint64_t v15 = (void *)swift_allocObject();
    v15[2] = v7;
    v15[3] = a5;
    v15[4] = a6;
    v15[5] = v14;
    v36 = (uint64_t (*)())sub_250D78E38;
    v37 = v15;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v33 = 1107296256;
    v34 = sub_250D732FC;
    v35 = &block_descriptor_76;
    uint64_t v16 = _Block_copy(&aBlock);
    uint64_t v17 = v7;
    swift_retain();
    id v18 = v13;
    swift_release();
    id v19 = objc_msgSend(v18, sel_clientQueueObjectHandlerWithCompletion_, v16);
    _Block_release(v16);

    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v19;
    id v21 = *(void **)&v7[v12];
    if (v21)
    {
      uint64_t v22 = v20;
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v17;
      *(void *)(v23 + 24) = a1;
      *(void *)(v23 + 32) = a2;
      *(void *)(v23 + 40) = a3;
      *(unsigned char *)(v23 + 48) = a4 & 1;
      *(void *)(v23 + 56) = sub_250D79AD0;
      *(void *)(v23 + 64) = v22;
      *(void *)(v23 + 72) = v14;
      v36 = (uint64_t (*)())sub_250D78EA8;
      v37 = (void *)v23;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v33 = 1107296256;
      v34 = sub_250D737E0;
      v35 = &block_descriptor_86;
      uint64_t v24 = _Block_copy(&aBlock);
      uint64_t v25 = v17;
      id v26 = v21;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = sub_250D79AD0;
      *(void *)(v27 + 24) = v22;
      v36 = sub_250D78C48;
      v37 = (void *)v27;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v33 = 1107296256;
      v34 = sub_250D73850;
      v35 = &block_descriptor_92;
      objc_super v28 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v26, sel_fetchProxyWithHandler_errorHandler_, v24, v28);
      _Block_release(v28);
      _Block_release(v24);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_250D749D4(uint64_t a1, void *a2, void *a3, void (*a4)(id, void), uint64_t a5, uint64_t a6, const char *a7)
{
  uint64_t v13 = sub_250D7FE20();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D7986C(a1, (uint64_t)v46);
  if (v47)
  {
    type metadata accessor for PinnedContentState();
    if (swift_dynamicCast())
    {
      id v17 = v44[0];
      id v18 = v44[0];
      a4(v17, 0);

      return;
    }
  }
  else
  {
    sub_250D79A00((uint64_t)v46, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
  }
  if (qword_26B206130 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v13, (uint64_t)qword_26B206190);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v19, v13);
  sub_250D7986C(a1, (uint64_t)v46);
  id v20 = a3;
  id v21 = a2;
  id v22 = v20;
  id v23 = a2;
  uint64_t v24 = sub_250D7FE00();
  os_log_type_t v25 = sub_250D80230();
  int v43 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v41 = a5;
    uint64_t v27 = v26;
    uint64_t v40 = swift_slowAlloc();
    uint64_t v45 = v40;
    *(_DWORD *)uint64_t v27 = 136315906;
    v42 = a4;
    uint64_t v28 = sub_250D80480();
    v44[0] = (id)sub_250D7D4A8(v28, v29, &v45);
    v39 = a7;
    sub_250D80270();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    v44[0] = (id)sub_250D7D4A8(0x7972616D6D7573, 0xE700000000000000, &v45);
    sub_250D80270();

    *(_WORD *)(v27 + 22) = 2080;
    sub_250D7986C((uint64_t)v46, (uint64_t)v44);
    uint64_t v30 = MEMORY[0x263F8EE58] + 8;
    sub_250D71E5C(0, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
    uint64_t v31 = sub_250D80100();
    v44[0] = (id)sub_250D7D4A8(v31, v32, &v45);
    sub_250D80270();
    swift_bridgeObjectRelease();
    sub_250D79A00((uint64_t)v46, (unint64_t *)&qword_269B030B0, v30);
    *(_WORD *)(v27 + 32) = 2080;
    v44[0] = a2;
    id v33 = a2;
    sub_250D79904();
    uint64_t v34 = sub_250D80100();
    v44[0] = (id)sub_250D7D4A8(v34, v35, &v45);
    a4 = v42;
    sub_250D80270();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_250D6D000, v24, (os_log_type_t)v43, v39, (uint8_t *)v27, 0x2Au);
    uint64_t v36 = v40;
    swift_arrayDestroy();
    MEMORY[0x253388EC0](v36, -1, -1);
    MEMORY[0x253388EC0](v27, -1, -1);
  }
  else
  {

    sub_250D79A00((uint64_t)v46, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v37 = a2;
  if (!a2)
  {
    sub_250D78CEC();
    v37 = (void *)swift_allocError();
  }
  id v38 = a2;
  a4(v37, 1);
}

void sub_250D74EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v12 = (void *)v19[0];
    uint64_t v13 = (void *)sub_250D800E0();
    uint64_t v14 = (void *)sub_250D800E0();
    if (a6)
    {
      uint64_t v15 = 0;
    }
    else
    {
      sub_250D71EF4(0, &qword_269B030B8);
      uint64_t v15 = (void *)sub_250D80250();
    }
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a7;
    *(void *)(v16 + 24) = a8;
    aBlock[4] = sub_250D79C58;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_278;
    id v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_remote_pinContentWithIdentifier_inDomain_atIndex_completion_, v13, v14, v15, v17);
    _Block_release(v17);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v19[0] = 0;
    v19[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v19[4] = 91;
    v19[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v19);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

uint64_t sub_250D75168(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  uint64_t v24 = (id *)(v11 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  id v23 = (void **)(result + 16);
  os_log_type_t v25 = *(void **)&v5[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v25) {
    goto LABEL_9;
  }
  uint64_t v13 = result;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v5;
  *(void *)(v14 + 24) = a1;
  *(void *)(v14 + 32) = a2;
  *(void *)(v14 + 40) = a3;
  *(unsigned char *)(v14 + 48) = a4 & 1;
  *(void *)(v14 + 56) = v11;
  *(void *)(v14 + 64) = v13;
  *(void *)(v14 + 72) = ObjectType;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_250D78F6C;
  *(void *)(v15 + 24) = v14;
  uint64_t v30 = sub_250D79C5C;
  uint64_t v31 = v15;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_250D6F778;
  unint64_t v29 = &block_descriptor_104;
  uint64_t v16 = _Block_copy(&aBlock);
  id v17 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v18 = v25;
  swift_release();
  uint64_t v30 = sub_250D78CD0;
  uint64_t v31 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_250D73850;
  unint64_t v29 = &block_descriptor_107;
  uint64_t v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_getSynchronousProxyWithHandler_errorHandler_, v16, v19);

  _Block_release(v19);
  _Block_release(v16);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v19)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v24)
  {
    id v20 = *v24;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v20;
  }
  else
  {
    swift_beginAccess();
    id v21 = *v23;
    if (!*v23)
    {
      sub_250D78CEC();
      swift_allocError();
      id v21 = 0;
    }
    id v22 = v21;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_250D754C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v12 = (void *)v19[0];
    uint64_t v13 = (void *)sub_250D800E0();
    uint64_t v14 = (void *)sub_250D800E0();
    if (a6)
    {
      uint64_t v15 = 0;
    }
    else
    {
      sub_250D71EF4(0, &qword_269B030B8);
      uint64_t v15 = (void *)sub_250D80250();
    }
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = a7;
    *(void *)(v16 + 24) = a8;
    aBlock[4] = sub_250D727E8;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_271;
    id v17 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_remote_pinContentWithIdentifier_inDomain_atIndex_completion_, v13, v14, v15, v17);
    _Block_release(v17);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v19[0] = 0;
    v19[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v19[4] = 91;
    v19[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v19);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

void sub_250D7578C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  uint64_t v10 = *(void **)&v4[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = a3;
    *(void *)(v11 + 24) = a4;
    unint64_t v29 = (uint64_t (*)(uint64_t))sub_250D79C54;
    uint64_t v30 = (void *)v11;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_250D732FC;
    uint64_t v28 = &block_descriptor_113;
    uint64_t v12 = _Block_copy(&aBlock);
    swift_retain();
    id v13 = v10;
    swift_release();
    id v14 = objc_msgSend(v13, sel_clientQueueObjectHandlerWithCompletion_, v12);
    _Block_release(v12);

    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    uint64_t v16 = *(void **)&v4[v9];
    if (v16)
    {
      uint64_t v17 = v15;
      id v18 = (void *)swift_allocObject();
      v18[2] = v4;
      v18[3] = a1;
      v18[4] = a2;
      v18[5] = sub_250D79AD0;
      v18[6] = v17;
      v18[7] = ObjectType;
      unint64_t v29 = sub_250D7908C;
      uint64_t v30 = v18;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v26 = 1107296256;
      uint64_t v27 = sub_250D737E0;
      uint64_t v28 = &block_descriptor_123;
      uint64_t v19 = _Block_copy(&aBlock);
      id v20 = v16;
      id v21 = v4;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      uint64_t v22 = swift_allocObject();
      *(void *)(v22 + 16) = sub_250D79AD0;
      *(void *)(v22 + 24) = v17;
      unint64_t v29 = (uint64_t (*)(uint64_t))sub_250D790A4;
      uint64_t v30 = (void *)v22;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v26 = 1107296256;
      uint64_t v27 = sub_250D73850;
      uint64_t v28 = &block_descriptor_129;
      id v23 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v20, sel_fetchProxyWithHandler_errorHandler_, v19, v23);
      _Block_release(v23);
      _Block_release(v19);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_250D75A5C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = sub_250D7FE20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    id v14 = (void *)v32[0];
    uint64_t v15 = (void *)sub_250D800E0();
    uint64_t v16 = (void *)sub_250D800E0();
    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = a6;
    aBlock[4] = sub_250D79C58;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_265;
    id v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_remote_unpinContentWithIdentifier_inDomain_completion_, v15, v16, v18);
    _Block_release(v18);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26B206130 != -1) {
      swift_once();
    }
    uint64_t v19 = __swift_project_value_buffer(v10, (uint64_t)qword_26B206190);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v19, v10);
    sub_250D724F8(a1, (uint64_t)aBlock);
    id v20 = a2;
    id v21 = sub_250D7FE00();
    os_log_type_t v22 = sub_250D80230();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      uint64_t v30 = v11;
      uint64_t v25 = v24;
      uint64_t v33 = v24;
      *(_DWORD *)uint64_t v23 = 136315650;
      uint64_t v26 = sub_250D80480();
      v32[0] = sub_250D7D4A8(v26, v27, &v33);
      sub_250D80270();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2080;
      v32[0] = sub_250D7D4A8(0x7972616D6D7573, 0xE700000000000000, &v33);
      sub_250D80270();

      *(_WORD *)(v23 + 22) = 2080;
      sub_250D724F8((uint64_t)aBlock, (uint64_t)v32);
      uint64_t v28 = sub_250D80100();
      v32[0] = sub_250D7D4A8(v28, v29, &v33);
      sub_250D80270();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      _os_log_impl(&dword_250D6D000, v21, v22, "[%s]_%s: Proxy is unrecognized type: %s", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x253388EC0](v25, -1, -1);
      MEMORY[0x253388EC0](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v10);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
}

uint64_t sub_250D75EC4(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0;
  uint64_t v19 = (id *)(v6 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  id v18 = (void **)(result + 16);
  id v20 = *(void **)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v20) {
    goto LABEL_9;
  }
  uint64_t v8 = result;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v2;
  v9[3] = a1;
  v9[4] = a2;
  v9[5] = v6;
  v9[6] = v8;
  v9[7] = ObjectType;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_250D790F8;
  *(void *)(v10 + 24) = v9;
  uint64_t v25 = sub_250D79C5C;
  uint64_t v26 = v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_250D6F778;
  uint64_t v24 = &block_descriptor_141;
  uint64_t v11 = _Block_copy(&aBlock);
  uint64_t v12 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v13 = v20;
  swift_release();
  uint64_t v25 = sub_250D78CD0;
  uint64_t v26 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_250D73850;
  uint64_t v24 = &block_descriptor_144;
  id v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_getSynchronousProxyWithHandler_errorHandler_, v11, v14);

  _Block_release(v14);
  _Block_release(v11);
  LOBYTE(v11) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v11)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v19)
  {
    id v15 = *v19;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v15;
  }
  else
  {
    swift_beginAccess();
    uint64_t v16 = *v18;
    if (!*v18)
    {
      sub_250D78CEC();
      swift_allocError();
      uint64_t v16 = 0;
    }
    id v17 = v16;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_250D76210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v9 = (void *)v15[0];
    uint64_t v10 = (void *)sub_250D800E0();
    uint64_t v11 = (void *)sub_250D800E0();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a5;
    *(void *)(v12 + 24) = a6;
    aBlock[4] = sub_250D727D8;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_258;
    id v13 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_remote_unpinContentWithIdentifier_inDomain_completion_, v10, v11, v13);
    _Block_release(v13);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v15[4] = 91;
    v15[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v15);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

void sub_250D7648C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  uint64_t v11 = *(void **)&v5[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a4;
    *(void *)(v12 + 24) = a5;
    uint64_t v31 = (uint64_t (*)())sub_250D79138;
    unint64_t v32 = (void *)v12;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v28 = 1107296256;
    unint64_t v29 = sub_250D732FC;
    uint64_t v30 = &block_descriptor_150;
    id v13 = _Block_copy(&aBlock);
    swift_retain();
    id v14 = v11;
    swift_release();
    id v15 = objc_msgSend(v14, sel_clientQueueObjectHandlerWithCompletion_, v13);
    _Block_release(v13);

    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    id v17 = *(void **)&v5[v10];
    if (v17)
    {
      uint64_t v18 = v16;
      uint64_t v19 = (void *)swift_allocObject();
      v19[2] = v5;
      v19[3] = a1;
      v19[4] = a2;
      v19[5] = a3;
      void v19[6] = sub_250D79AD0;
      v19[7] = v18;
      v19[8] = ObjectType;
      uint64_t v31 = (uint64_t (*)())sub_250D7919C;
      unint64_t v32 = v19;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v28 = 1107296256;
      unint64_t v29 = sub_250D737E0;
      uint64_t v30 = &block_descriptor_160;
      id v20 = _Block_copy(&aBlock);
      id v21 = v17;
      uint64_t v22 = v5;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = sub_250D79AD0;
      *(void *)(v23 + 24) = v18;
      uint64_t v31 = sub_250D790A4;
      unint64_t v32 = (void *)v23;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v28 = 1107296256;
      unint64_t v29 = sub_250D73850;
      uint64_t v30 = &block_descriptor_166;
      uint64_t v24 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v21, sel_fetchProxyWithHandler_errorHandler_, v20, v24);
      _Block_release(v24);
      _Block_release(v20);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_250D76768(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v31 = a6;
  uint64_t v10 = sub_250D7FE20();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&aBlock[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    id v14 = (void *)v33[0];
    id v15 = (void *)sub_250D800E0();
    uint64_t v16 = (void *)sub_250D800E0();
    sub_250D71EF4(0, &qword_269B030B8);
    id v17 = (void *)sub_250D80250();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v31;
    *(void *)(v18 + 24) = a7;
    aBlock[4] = sub_250D79C58;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_252;
    uint64_t v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_remote_movePinnedContentWithIdentifier_inDomain_toIndex_completion_, v15, v16, v17, v19);
    _Block_release(v19);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26B206130 != -1) {
      swift_once();
    }
    uint64_t v20 = __swift_project_value_buffer(v10, (uint64_t)qword_26B206190);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v20, v10);
    sub_250D724F8(a1, (uint64_t)aBlock);
    id v21 = a2;
    uint64_t v22 = sub_250D7FE00();
    os_log_type_t v23 = sub_250D80230();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = swift_slowAlloc();
      uint64_t v31 = v11;
      uint64_t v25 = v24;
      uint64_t v26 = swift_slowAlloc();
      uint64_t v34 = v26;
      *(_DWORD *)uint64_t v25 = 136315650;
      uint64_t v27 = sub_250D80480();
      v33[0] = sub_250D7D4A8(v27, v28, &v34);
      sub_250D80270();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2080;
      v33[0] = sub_250D7D4A8(0x7972616D6D7573, 0xE700000000000000, &v34);
      sub_250D80270();

      *(_WORD *)(v25 + 22) = 2080;
      sub_250D724F8((uint64_t)aBlock, (uint64_t)v33);
      uint64_t v29 = sub_250D80100();
      v33[0] = sub_250D7D4A8(v29, v30, &v34);
      sub_250D80270();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      _os_log_impl(&dword_250D6D000, v22, v23, "[%s]_%s: Proxy is unrecognized type: %s", (uint8_t *)v25, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x253388EC0](v26, -1, -1);
      MEMORY[0x253388EC0](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v10);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
}

uint64_t sub_250D76C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  uint64_t v22 = (id *)(v9 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  id v21 = (void **)(result + 16);
  os_log_type_t v23 = *(void **)&v4[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v23) {
    goto LABEL_9;
  }
  uint64_t v11 = result;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v4;
  v12[3] = a1;
  v12[4] = a2;
  v12[5] = a3;
  void v12[6] = v9;
  v12[7] = v11;
  v12[8] = ObjectType;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = sub_250D79204;
  *(void *)(v13 + 24) = v12;
  unint64_t v28 = sub_250D79C5C;
  uint64_t v29 = v13;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_250D6F778;
  uint64_t v27 = &block_descriptor_178;
  id v14 = _Block_copy(&aBlock);
  id v15 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v16 = v23;
  swift_release();
  unint64_t v28 = sub_250D78CD0;
  uint64_t v29 = v11;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v25 = 1107296256;
  uint64_t v26 = sub_250D73850;
  uint64_t v27 = &block_descriptor_181;
  id v17 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_getSynchronousProxyWithHandler_errorHandler_, v14, v17);

  _Block_release(v17);
  _Block_release(v14);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v14)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v22)
  {
    id v18 = *v22;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v18;
  }
  else
  {
    swift_beginAccess();
    uint64_t v19 = *v21;
    if (!*v21)
    {
      sub_250D78CEC();
      swift_allocError();
      uint64_t v19 = 0;
    }
    id v20 = v19;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_250D76F60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    uint64_t v10 = (void *)v17[0];
    uint64_t v11 = (void *)sub_250D800E0();
    uint64_t v12 = (void *)sub_250D800E0();
    sub_250D71EF4(0, &qword_269B030B8);
    uint64_t v13 = (void *)sub_250D80250();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a6;
    *(void *)(v14 + 24) = a7;
    aBlock[4] = sub_250D727D8;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_245;
    id v15 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_remote_movePinnedContentWithIdentifier_inDomain_toIndex_completion_, v11, v12, v13, v15);
    _Block_release(v15);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v17[0] = 0;
    v17[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v17[4] = 91;
    v17[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v17);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

void sub_250D7722C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  uint64_t v7 = *(void **)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v7)
  {
    uint64_t v8 = ObjectType;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a1;
    *(void *)(v9 + 24) = a2;
    uint64_t v26 = (void (*)(uint64_t))sub_250D79C54;
    uint64_t v27 = (void *)v9;
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 1107296256;
    uint64_t v24 = sub_250D732FC;
    uint64_t v25 = &block_descriptor_187;
    uint64_t v10 = _Block_copy(&v22);
    swift_retain();
    id v11 = v7;
    swift_release();
    id v12 = objc_msgSend(v11, sel_clientQueueObjectHandlerWithCompletion_, v10);
    _Block_release(v10);

    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v14 = *(void **)&v2[v6];
    if (v14)
    {
      uint64_t v15 = v13;
      id v16 = (void *)swift_allocObject();
      void v16[2] = v2;
      v16[3] = sub_250D79AD0;
      v16[4] = v15;
      v16[5] = v8;
      uint64_t v26 = sub_250D7928C;
      uint64_t v27 = v16;
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 1107296256;
      uint64_t v24 = sub_250D737E0;
      uint64_t v25 = &block_descriptor_197;
      id v17 = _Block_copy(&v22);
      id v18 = v14;
      uint64_t v19 = v2;
      swift_retain();
      swift_release();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = sub_250D79AD0;
      *(void *)(v20 + 24) = v15;
      uint64_t v26 = (void (*)(uint64_t))sub_250D790A4;
      uint64_t v27 = (void *)v20;
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 1107296256;
      uint64_t v24 = sub_250D73850;
      uint64_t v25 = &block_descriptor_203;
      id v21 = _Block_copy(&v22);
      swift_retain();
      swift_release();
      objc_msgSend(v18, sel_fetchProxyWithHandler_errorHandler_, v17, v21);
      _Block_release(v21);
      _Block_release(v17);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_250D774E4(uint64_t a1, void *a2, void (*a3)(void *, uint64_t))
{
  sub_250D7986C(a1, (uint64_t)v9);
  if (v10)
  {
    type metadata accessor for PinnedContentState();
    if (swift_dynamicCast())
    {
      id v5 = v8;
      a3(v8, 0);

      return;
    }
  }
  else
  {
    sub_250D79A00((uint64_t)v9, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
  }
  if (a2)
  {
    uint64_t v6 = a2;
  }
  else
  {
    sub_250D78CEC();
    uint64_t v6 = (void *)swift_allocError();
  }
  id v7 = a2;
  a3(v6, 1);
}

void sub_250D775E8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_250D7FE20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    id v12 = (void *)v28[0];
    uint64_t v13 = (void *)sub_250D800E0();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    *(void *)(v14 + 24) = a4;
    aBlock[4] = sub_250D79864;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_239;
    uint64_t v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_remote_unpinAllContentInDomain_withCompletion_, v13, v15);
    _Block_release(v15);
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26B206130 != -1) {
      swift_once();
    }
    uint64_t v16 = __swift_project_value_buffer(v8, (uint64_t)qword_26B206190);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v16, v8);
    sub_250D724F8(a1, (uint64_t)aBlock);
    id v17 = a2;
    id v18 = sub_250D7FE00();
    os_log_type_t v19 = sub_250D80230();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v29 = v21;
      *(_DWORD *)uint64_t v20 = 136315650;
      uint64_t v26 = v9;
      uint64_t v22 = sub_250D80480();
      v28[0] = sub_250D7D4A8(v22, v23, &v29);
      sub_250D80270();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      v28[0] = sub_250D7D4A8(0x7972616D6D7573, 0xE700000000000000, &v29);
      sub_250D80270();

      *(_WORD *)(v20 + 22) = 2080;
      sub_250D724F8((uint64_t)aBlock, (uint64_t)v28);
      uint64_t v24 = sub_250D80100();
      v28[0] = sub_250D7D4A8(v24, v25, &v29);
      sub_250D80270();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      _os_log_impl(&dword_250D6D000, v18, v19, "[%s]_%s: Proxy is unrecognized type: %s", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x253388EC0](v21, -1, -1);
      MEMORY[0x253388EC0](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v8);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
}

uint64_t sub_250D77A30()
{
  id v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  id v17 = (id *)(v3 + 16);
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  uint64_t v16 = (void **)(result + 16);
  id v5 = *(void **)&v0[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = result;
  id v7 = (void *)swift_allocObject();
  v7[2] = v1;
  v7[3] = v3;
  v7[4] = v6;
  v7[5] = ObjectType;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_250D79300;
  *(void *)(v8 + 24) = v7;
  uint64_t v22 = sub_250D79C5C;
  uint64_t v23 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_250D6F778;
  uint64_t v21 = &block_descriptor_215;
  uint64_t v9 = _Block_copy(&aBlock);
  id v10 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  id v11 = v5;
  swift_release();
  uint64_t v22 = sub_250D78CD0;
  uint64_t v23 = v6;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v19 = 1107296256;
  uint64_t v20 = sub_250D73850;
  uint64_t v21 = &block_descriptor_218;
  id v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_getSynchronousProxyWithHandler_errorHandler_, v9, v12);

  _Block_release(v12);
  _Block_release(v9);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v12)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v17)
  {
    id v13 = *v17;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  else
  {
    swift_beginAccess();
    uint64_t v14 = *v16;
    if (!*v16)
    {
      sub_250D78CEC();
      swift_allocError();
      uint64_t v14 = 0;
    }
    id v15 = v14;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_250D77D60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_250D724F8(a1, (uint64_t)aBlock);
  sub_250D726B0();
  if (swift_dynamicCast())
  {
    id v7 = (void *)v12[0];
    uint64_t v8 = (void *)sub_250D800E0();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a3;
    *(void *)(v9 + 24) = a4;
    aBlock[4] = sub_250D727D8;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_250D6F9D8;
    aBlock[3] = &block_descriptor_233;
    id v10 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_unpinAllContentInDomain_withCompletion_, v8, v10);
    _Block_release(v10);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_250D724F8(a1, (uint64_t)aBlock);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_250D802F0();
    swift_bridgeObjectRelease();
    v12[4] = 91;
    v12[5] = 0xE100000000000000;
    sub_250D80480();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D80120();
    sub_250D80120();
    sub_250D724F8((uint64_t)aBlock, (uint64_t)v12);
    sub_250D80100();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80390();
    __break(1u);
  }
}

id sub_250D77FB4(void *a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;

  return a1;
}

id sub_250D78008()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_2701E63A0);
  return v0;
}

id PinnedContentStore.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void PinnedContentStore.init()()
{
}

id PinnedContentStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentStore();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_250D781F8(uint64_t a1, uint64_t a2)
{
}

void sub_250D7821C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_250D78240(uint64_t a1)
{
  return sub_250D73F94(a1);
}

void sub_250D78264(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
}

uint64_t sub_250D7828C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_250D75168(a1, a2, a3, a4 & 1);
}

void sub_250D782B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_250D782D8(uint64_t a1, uint64_t a2)
{
  return sub_250D75EC4(a1, a2);
}

void sub_250D782FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_250D78320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_250D76C08(a1, a2, a3);
}

void sub_250D78344(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_250D78368()
{
  return sub_250D77A30();
}

unint64_t PinnedContentDomain.darwinNotificationName.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t static PinnedContentStore.Failure.== infix(_:_:)()
{
  return 1;
}

uint64_t PinnedContentStore.Failure.hash(into:)()
{
  return sub_250D80460();
}

uint64_t PinnedContentStore.Failure.hashValue.getter()
{
  return sub_250D80470();
}

uint64_t sub_250D7841C()
{
  return 1;
}

uint64_t sub_250D78424()
{
  return sub_250D80470();
}

uint64_t sub_250D78468()
{
  return sub_250D80460();
}

uint64_t sub_250D78490()
{
  return sub_250D80470();
}

uint64_t sub_250D784E0()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_250D79A70();
  uint64_t v3 = sub_250D802D0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }
      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v18 = v6[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v18 = v6[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                id v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v6[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 40 * v16;
      long long v29 = *(_OWORD *)v20;
      long long v30 = *(_OWORD *)(v20 + 16);
      uint64_t v31 = *(void *)(v20 + 32);
      uint64_t result = sub_250D802A0();
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
      *(_OWORD *)uint64_t v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(void *)(v14 + 32) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *id v1 = v4;
  return result;
}

void *sub_250D787A8()
{
  id v1 = v0;
  sub_250D79A70();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250D802C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *id v1 = v4;
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
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_250D72284(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

uint64_t sub_250D78974()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_250D79A70();
  uint64_t v3 = sub_250D802D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_250D72284(*(void *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    uint64_t result = sub_250D802A0();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
    long long v15 = v29[0];
    long long v16 = v29[1];
    *(void *)(v14 + 32) = v30;
    *(_OWORD *)uint64_t v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(void *)(v4 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    id v1 = v0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_250D78C08(uint64_t a1, void *a2)
{
  sub_250D749D4(a1, a2, *(void **)(v2 + 16), *(void (**)(id, void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), "[%s]_%s: Proxy returned pinnedContent=%s with error=%s");
}

void sub_250D78C30(uint64_t a1, void *a2)
{
  sub_250D733A4(a1, a2, *(void *)(v2 + 16));
}

void sub_250D78C3C(uint64_t a1)
{
  sub_250D73508(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_250D78C4C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250D78C84()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250D78CC0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

id sub_250D78CD0(void *a1)
{
  return sub_250D77FB4(a1, v1);
}

unint64_t sub_250D78CEC()
{
  unint64_t result = qword_269B03030;
  if (!qword_269B03030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B03030);
  }
  return result;
}

uint64_t sub_250D78D44()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_250D78D8C(uint64_t a1)
{
  return sub_250D78E0C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_250D73B94);
}

uint64_t sub_250D78DA4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_250D78DF4(uint64_t a1)
{
  return sub_250D78E0C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_250D742CC);
}

uint64_t sub_250D78E0C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_250D78E24()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_250D78E38(uint64_t a1, void *a2)
{
  sub_250D749D4(a1, a2, *(void **)(v2 + 16), *(void (**)(id, void))(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), "[%s]_%s: Proxy returned newContent=%s with error=%s");
}

uint64_t sub_250D78E60()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_250D78EA8(uint64_t a1)
{
  return sub_250D78F84(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))sub_250D74EAC);
}

uint64_t sub_250D78EC0(uint64_t a1)
{
  uint64_t v2 = *(void (**)(_OWORD *, uint64_t))(v1 + 16);
  memset(v4, 0, sizeof(v4));
  v2(v4, a1);
  return sub_250D79A00((uint64_t)v4, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
}

uint64_t sub_250D78F1C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_250D78F6C(uint64_t a1)
{
  return sub_250D78F84(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void, void))sub_250D754C8);
}

uint64_t sub_250D78F84(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void, void, void))
{
  return a2(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(void *)(v2 + 56), *(void *)(v2 + 64), *(void *)(v2 + 72));
}

uint64_t sub_250D78FC4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250D78FD4()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250D7900C()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250D79044()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_250D7908C(uint64_t a1)
{
  return sub_250D79110(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_250D75A5C);
}

uint64_t sub_250D790A8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_250D790F8(uint64_t a1)
{
  return sub_250D79110(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void))sub_250D76210);
}

uint64_t sub_250D79110(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_250D79128()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_250D79138(uint64_t a1, void *a2)
{
  sub_250D774E4(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t sub_250D79154()
{
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_250D7919C(uint64_t a1)
{
  return sub_250D7921C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))sub_250D76768);
}

uint64_t sub_250D791B4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_250D79204(uint64_t a1)
{
  return sub_250D7921C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void, void, void))sub_250D76F60);
}

uint64_t sub_250D7921C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8]);
}

uint64_t sub_250D79238()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t objectdestroyTm()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_250D7928C(uint64_t a1)
{
  sub_250D775E8(a1, *(void **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_250D79298(uint64_t a1)
{
  uint64_t v2 = *(void (**)(unsigned char *, uint64_t))(v1 + 16);
  uint64_t v5 = MEMORY[0x263F8D4F8];
  v4[0] = 0;
  v2(v4, a1);
  return sub_250D79A00((uint64_t)v4, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8);
}

void sub_250D79300(uint64_t a1)
{
  sub_250D77D60(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_250D7930C()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

unint64_t sub_250D79320()
{
  unint64_t result = qword_269B03038;
  if (!qword_269B03038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B03038);
  }
  return result;
}

uint64_t method lookup function for PinnedContentStore(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for PinnedContentStore);
}

uint64_t dispatch thunk of PinnedContentStore.__allocating_init(healthStore:domain:)()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of PinnedContentStore.fetchPinnedContent(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of PinnedContentStore.fetchPinnedContent()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of PinnedContentStore.applyDifferences(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of PinnedContentStore.applyDifferences(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PinnedContentStore.pinContentWithIdentifier(_:at:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v4) + 0xA8))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStore.pinContentWithIdentifier(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))((*MEMORY[0x263F8EED0] & *v4) + 0xB0))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStore.unpinContentWithIdentifier(_:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PinnedContentStore.unpinContentWithIdentifier(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PinnedContentStore.movePinnedContentWithIdentifier(_:to:completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PinnedContentStore.movePinnedContentWithIdentifier(_:to:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of PinnedContentStore.unpinAllContentInDomain(completion:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of PinnedContentStore.unpinAllContentInDomain()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of PinnedContentStore.exportedInterface()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PinnedContentStore.remoteInterface()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of PinnedContentStore.connectionInvalidated()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t getEnumTagSinglePayload for PinnedContentDomain(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for PinnedContentStore.Failure(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x250D79820);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_250D79848()
{
  return 0;
}

ValueMetadata *type metadata accessor for PinnedContentStore.Failure()
{
  return &type metadata for PinnedContentStore.Failure;
}

uint64_t sub_250D79864(void *a1, uint64_t a2)
{
  return sub_250D73754(a1, a2, *(void (**)(long long *, uint64_t))(v2 + 16));
}

uint64_t sub_250D7986C(uint64_t a1, uint64_t a2)
{
  sub_250D71E5C(0, (unint64_t *)&qword_269B030B0, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250D79904()
{
  if (!qword_269B030C0)
  {
    sub_250D7995C();
    unint64_t v0 = sub_250D80260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B030C0);
    }
  }
}

unint64_t sub_250D7995C()
{
  unint64_t result = qword_269B030C8;
  if (!qword_269B030C8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B030C8);
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_250D79A00(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  sub_250D71E5C(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_250D79A70()
{
  if (!qword_269B030E0)
  {
    unint64_t v0 = sub_250D802E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B030E0);
    }
  }
}

void *static PinnedContentDomain.allCases.getter()
{
  return &unk_2701E2D40;
}

uint64_t sub_250D79C70()
{
  uint64_t v0 = _s09HealthAppA13DaemonSupport19PinnedContentDomainO11descriptionSSvg_0();
  uint64_t v2 = v1;
  if (v0 == _s09HealthAppA13DaemonSupport19PinnedContentDomainO11descriptionSSvg_0() && v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = sub_250D803F0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_250D79CF4()
{
  return sub_250D80470();
}

uint64_t sub_250D79D50()
{
  _s09HealthAppA13DaemonSupport19PinnedContentDomainO11descriptionSSvg_0();
  sub_250D80110();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D79DA0()
{
  return sub_250D80470();
}

uint64_t sub_250D79DF8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2 = sub_250D803C0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_250D79E4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s09HealthAppA13DaemonSupport19PinnedContentDomainO11descriptionSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_250D79E74(void *a1@<X8>)
{
  *a1 = &unk_2701E2DA0;
}

uint64_t sub_250D79E88(uint64_t a1, char a2)
{
  type metadata accessor for CoherentPinnedContentState();
  sub_250D70B94();
  uint64_t v5 = v4;
  uint64_t result = sub_250D7FF90();
  if (a2) {
    return result;
  }
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if ((a1 & 0x8000000000000000) == 0 && result >= a1) {
      return a1;
    }
    uint64_t v5 = sub_250D7FF90();
    if (qword_26B206130 == -1) {
      goto LABEL_7;
    }
  }
  swift_once();
LABEL_7:
  uint64_t v7 = sub_250D7FE20();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B206190);
  unint64_t v8 = sub_250D7FE00();
  os_log_type_t v9 = sub_250D80230();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v15 = v11;
    *(_DWORD *)uint64_t v10 = 136315394;
    sub_250D7D4A8(0xD00000000000001ALL, 0x8000000250D80D40, &v15);
    sub_250D80270();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v12 = sub_250D80100();
    sub_250D7D4A8(v12, v13, &v15);
    sub_250D80270();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D6D000, v8, v9, "[%s]: Could not sanitize index: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253388EC0](v11, -1, -1);
    MEMORY[0x253388EC0](v10, -1, -1);
  }

  sub_250D7BD50();
  swift_allocError();
  *(void *)uint64_t v14 = a1;
  *(void *)(v14 + 8) = v5;
  *(unsigned char *)(v14 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_250D7A0EC(uint64_t a1)
{
  uint64_t v2 = v1;
  type metadata accessor for CoherentPinnedContentState();
  sub_250D70B94();
  uint64_t v4 = sub_250D7FF90();
  if (v4 < 0)
  {
    __break(1u);
LABEL_10:
    swift_once();
    goto LABEL_6;
  }
  if ((a1 & 0x8000000000000000) == 0 && v4 > a1) {
    return sub_250D7FF70();
  }
  uint64_t v2 = sub_250D7FF90();
  if (qword_26B206130 != -1) {
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v6 = sub_250D7FE20();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B206190);
  uint64_t v7 = sub_250D7FE00();
  os_log_type_t v8 = sub_250D80230();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_250D7D4A8(0xD00000000000001ALL, 0x8000000250D80D40, &v14);
    sub_250D80270();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v11 = sub_250D80100();
    sub_250D7D4A8(v11, v12, &v14);
    sub_250D80270();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D6D000, v7, v8, "[%s]: Index out of bounds: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253388EC0](v10, -1, -1);
    MEMORY[0x253388EC0](v9, -1, -1);
  }

  sub_250D7BD50();
  swift_allocError();
  *(void *)uint64_t v13 = a1;
  *(void *)(v13 + 8) = v2;
  *(unsigned char *)(v13 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_250D7A354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_250D79E88(a3, 0);
  if (!v3)
  {
    type metadata accessor for CoherentPinnedContentState();
    sub_250D7A618(a1, a2);
    if (v7)
    {
      if (qword_26B206130 != -1) {
        swift_once();
      }
      uint64_t v8 = sub_250D7FE20();
      __swift_project_value_buffer(v8, (uint64_t)qword_26B206190);
      swift_bridgeObjectRetain_n();
      uint64_t v9 = sub_250D7FE00();
      os_log_type_t v10 = sub_250D80230();
      if (os_log_type_enabled(v9, v10))
      {
        uint64_t v11 = swift_slowAlloc();
        uint64_t v12 = swift_slowAlloc();
        uint64_t v16 = v12;
        *(_DWORD *)uint64_t v11 = 136315650;
        sub_250D7D4A8(0xD00000000000001ALL, 0x8000000250D80D40, &v16);
        sub_250D80270();
        *(_WORD *)(v11 + 12) = 2048;
        sub_250D80270();
        *(_WORD *)(v11 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v13 = sub_250D80100();
        sub_250D7D4A8(v13, v14, &v16);
        sub_250D80270();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250D6D000, v9, v10, "[%s]: Attempted to move item to index %ld failed: %s", (uint8_t *)v11, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x253388EC0](v12, -1, -1);
        MEMORY[0x253388EC0](v11, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_250D7BD50();
      swift_allocError();
      *(void *)uint64_t v15 = a1;
      *(void *)(v15 + 8) = a2;
      *(unsigned char *)(v15 + 16) = 0;
      swift_bridgeObjectRetain();
      return swift_willThrow();
    }
    else
    {
      sub_250D70B94();
      return sub_250D7FF50();
    }
  }
  return result;
}

uint64_t sub_250D7A618(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  sub_250D70B94();
  sub_250D6F6E8(&qword_269B03118, (void (*)(uint64_t))sub_250D70B94);
  sub_250D801F0();
  if ((v12 & 1) == 0) {
    return v11;
  }
  sub_250D801E0();
  while (1)
  {
    sub_250D80200();
    if (v13 == v11) {
      return 0;
    }
    uint64_t v4 = (void (*)(uint64_t *, void))sub_250D80220();
    uint64_t v7 = *v5;
    uint64_t v6 = v5[1];
    swift_bridgeObjectRetain();
    v4(&v11, 0);
    if (v7 == a1 && v6 == a2) {
      break;
    }
    char v9 = sub_250D803F0();
    swift_bridgeObjectRelease();
    if (v9) {
      return v13;
    }
    sub_250D80210();
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_250D7A7A8()
{
  qword_26B2061A8 = 0xD000000000000014;
  unk_26B2061B0 = 0x8000000250D81640;
  qword_26B2061B8 = swift_getKeyPath();
  unk_26B2061C0 = 0xD000000000000012;
  qword_26B2061C8 = 0x8000000250D812D0;
  uint64_t result = swift_getKeyPath();
  qword_26B2061D0 = result;
  return result;
}

uint64_t sub_250D7A820(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    sub_250D802F0();
    swift_bridgeObjectRelease();
    uint64_t v4 = 0x207865646E49;
    sub_250D803D0();
    sub_250D80120();
    swift_bridgeObjectRelease();
    sub_250D80120();
    sub_250D803D0();
    sub_250D80120();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_250D802F0();
    swift_bridgeObjectRelease();
    uint64_t v4 = 0x696669746E656449;
    sub_250D80120();
    sub_250D80120();
  }
  return v4;
}

uint64_t sub_250D7A984()
{
  return sub_250D7A820(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_250D7A990()
{
  return sub_250D7FF00();
}

uint64_t sub_250D7AA0C(uint64_t a1)
{
  uint64_t v2 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F16FE0](a1, v2);
}

uint64_t sub_250D7AA8C()
{
  return sub_250D7FF40();
}

uint64_t sub_250D7AAB4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_250D7AAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(int *)(a2 + 24);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_250D7AAF8())()
{
  return nullsub_1;
}

uint64_t sub_250D7AB24(uint64_t a1)
{
  uint64_t v2 = sub_250D6F6E8(&qword_26B205FE8, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17CC8](a1, v2);
}

uint64_t sub_250D7AB90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F16FF0](a1, a2, v4);
}

uint64_t sub_250D7AC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17018](a1, a2, v4);
}

uint64_t sub_250D7AC90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17048](a1, a2, v4);
}

uint64_t sub_250D7AD0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17020](a1, a2, a3, v6);
}

uint64_t sub_250D7ADA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17040](a1, a2, v4);
}

uint64_t sub_250D7AE1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17028](a1, a2, v4);
}

uint64_t sub_250D7AE98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17008](a1, a2, v4);
}

uint64_t sub_250D7AF1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F17000](a1, a2, v4);
}

uint64_t sub_250D7AFA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F16FE8](a1, a2, a3, v6);
}

uint64_t sub_250D7B034(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F16FD0](a1, a2, v4);
}

uint64_t sub_250D7B0B0(uint64_t a1)
{
  uint64_t v2 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F16FF8](a1, v2);
}

uint64_t sub_250D7B11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return MEMORY[0x270F16FD8](a1, a2, v4);
}

uint64_t sub_250D7B19C()
{
  sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
  return sub_250D7FEF0();
}

uint64_t sub_250D7B218()
{
  return sub_250D80050();
}

uint64_t sub_250D7B298()
{
  return sub_250D80060();
}

unint64_t sub_250D7B32C()
{
  unint64_t result = qword_269B030E8;
  if (!qword_269B030E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B030E8);
  }
  return result;
}

uint64_t sub_250D7B380()
{
  return sub_250D6FB58(&qword_269B030F0, &qword_269B030F8);
}

unsigned char *storeEnumTagSinglePayload for PinnedContentDomain(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x250D7B460);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for PinnedContentDomain()
{
  return &type metadata for PinnedContentDomain;
}

uint64_t sub_250D7B498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_250D70B2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_250D70B94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_250D7B574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_250D70B2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_250D70B94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_250D7B640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_250D70B2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_250D70B94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + *(int *)(a3 + 24)) = *(void *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_250D7B714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250D7B728);
}

uint64_t sub_250D7B728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_250D70B2C();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  sub_250D70B94();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_250D7B83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250D7B850);
}

void sub_250D7B850(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_250D70B2C();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    sub_250D70B94();
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return;
    }
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  v11(v12, a2, a2, v10);
}

void sub_250D7B960()
{
  sub_250D70B2C();
  if (v0 <= 0x3F)
  {
    sub_250D70B94();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_250D7BA34()
{
  return sub_250D6F6E8(&qword_26B205FF0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
}

uint64_t sub_250D7BA7C()
{
  return sub_250D6F6E8(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
}

uint64_t sub_250D7BAC4()
{
  return sub_250D6F6E8(&qword_26B205FD8, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
}

uint64_t sub_250D7BB0C()
{
  return sub_250D6F6E8(&qword_26B206090, (void (*)(uint64_t))sub_250D70B94);
}

uint64_t sub_250D7BB54()
{
  return sub_250D6F6E8(&qword_26B205FC0, (void (*)(uint64_t))sub_250D70B2C);
}

uint64_t sub_250D7BB9C()
{
  return sub_250D6F6E8(&qword_26B205FB8, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
}

uint64_t sub_250D7BBE4()
{
  return sub_250D6F6E8(&qword_26B205FD0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
}

uint64_t sub_250D7BC2C()
{
  return sub_250D6F6E8(&qword_26B205FE8, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
}

uint64_t sub_250D7BC74()
{
  return sub_250D6F6E8(&qword_269B03100, (void (*)(uint64_t))sub_250D7BCBC);
}

void sub_250D7BCBC()
{
  if (!qword_269B03108)
  {
    type metadata accessor for CoherentPinnedContentState();
    sub_250D6F6E8(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    unint64_t v0 = sub_250D80040();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B03108);
    }
  }
}

unint64_t sub_250D7BD50()
{
  unint64_t result = qword_269B03110;
  if (!qword_269B03110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B03110);
  }
  return result;
}

uint64_t sub_250D7BDA8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for CoherentPinnedContentState.Failure(uint64_t a1)
{
  return sub_250D7BDC8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_250D7BDC8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s28HealthAppHealthDaemonSupport26CoherentPinnedContentStateV7FailureOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_250D7BDA8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CoherentPinnedContentState.Failure(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_250D7BDA8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_250D7BDC8(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CoherentPinnedContentState.Failure(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_250D7BDC8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CoherentPinnedContentState.Failure(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CoherentPinnedContentState.Failure(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_250D7BF64(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_250D7BF6C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CoherentPinnedContentState.Failure()
{
  return &type metadata for CoherentPinnedContentState.Failure;
}

id CodablePinnedContentDifference.__allocating_init(difference:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v8 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
  uint64_t v9 = (char *)objc_allocWithZone(v8);
  uint64_t v10 = v9;
  uint64_t v11 = &v9[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  if (a4)
  {
    *(void *)&v9[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a3;
    swift_beginAccess();
    *(void *)uint64_t v11 = a1;
    *((void *)v11 + 1) = a2;
    swift_bridgeObjectRelease();
    v14.receiver = v10;
    uint64_t v12 = &v14;
  }
  else
  {
    *(void *)&v9[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a1;
    swift_beginAccess();
    *(void *)uint64_t v11 = 0;
    *((void *)v11 + 1) = 0;
    swift_bridgeObjectRelease();
    uint64_t v15 = v10;
    uint64_t v12 = (objc_super *)&v15;
  }
  v12->super_class = v8;
  return [(objc_super *)v12 init];
}

BOOL static PinnedContentDifference.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return sub_250D7C808(a1, a2, a3, a4 & 1, a5, a6, a7, a8 & 1);
}

BOOL sub_250D7C078(uint64_t a1, uint64_t a2)
{
  return sub_250D7C808(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned char *)(a2 + 24));
}

uint64_t static CodablePinnedContentDifference.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_250D7C0AC()
{
  uint64_t v1 = v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_250D7C0F4(uint64_t a1)
{
  unsigned int v3 = (void *)(v1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  uint64_t result = swift_beginAccess();
  *unsigned int v3 = a1;
  return result;
}

uint64_t (*sub_250D7C140())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_250D7C19C(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  int v4 = (void *)(*a2 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  *int v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D7C208()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_250D7C260(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_250D7C2C0())()
{
  return j__swift_endAccess;
}

id CodablePinnedContentDifference.__allocating_init(index:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (char *)objc_allocWithZone(v3);
  char v8 = &v7[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(void *)char v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v7[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a1;
  swift_beginAccess();
  *(void *)char v8 = a2;
  *((void *)v8 + 1) = a3;
  swift_bridgeObjectRelease();
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

id CodablePinnedContentDifference.init(index:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = &v3[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(void *)char v6 = 0;
  *((void *)v6 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a1;
  swift_beginAccess();
  *(void *)char v6 = a2;
  *((void *)v6 + 1) = a3;
  swift_bridgeObjectRelease();
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for CodablePinnedContentDifference();
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_250D7C440(void *a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = (void *)sub_250D800E0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v4, v5);

  uint64_t v6 = v1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier;
  swift_beginAccess();
  if (*(void *)(v6 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = (void *)sub_250D800E0();
    swift_bridgeObjectRelease();
    objc_super v8 = (void *)sub_250D800E0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);
  }
}

id CodablePinnedContentDifference.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_250D7C884(a1);

  return v4;
}

id CodablePinnedContentDifference.init(coder:)(void *a1)
{
  id v2 = sub_250D7C884(a1);

  return v2;
}

id CodablePinnedContentDifference.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void CodablePinnedContentDifference.init()()
{
}

id CodablePinnedContentDifference.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CodablePinnedContentDifference();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CodablePinnedContentDifference.toPinnedContentDifference()()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  if (v1[1])
  {
    uint64_t v2 = *v1;
    swift_beginAccess();
  }
  else
  {
    id v3 = (uint64_t *)(v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
    swift_beginAccess();
    uint64_t v2 = *v3;
  }
  swift_bridgeObjectRetain();
  return v2;
}

BOOL sub_250D7C808(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a4 & 1) == 0) {
    return (a8 & 1) == 0 && a1 == a5;
  }
  if (a8)
  {
    if (a1 == a5 && a2 == a6) {
      return a3 == a7;
    }
    char v12 = sub_250D803F0();
    BOOL result = 0;
    if (v12) {
      return a3 == a7;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

id sub_250D7C884(void *a1)
{
  id v3 = &v1[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;
  id v4 = v1;
  uint64_t v5 = (void *)sub_250D800E0();
  id v6 = objc_msgSend(a1, sel_decodeIntegerForKey_, v5);

  *(void *)&v4[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v6;
  uint64_t v7 = (void *)sub_250D800E0();
  id v8 = objc_msgSend(a1, sel_decodeObjectForKey_, v7);

  if (v8)
  {
    sub_250D80290();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_250D7CF14((uint64_t)v16, (uint64_t)v17);
  if (v18)
  {
    int v9 = swift_dynamicCast();
    if (v9) {
      uint64_t v10 = v13;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v9) {
      uint64_t v11 = v14;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    sub_250D7CFD4((uint64_t)v17);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  swift_beginAccess();
  *(void *)id v3 = v10;
  *((void *)v3 + 1) = v11;

  swift_bridgeObjectRelease();
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for CodablePinnedContentDifference();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_250D7CA18@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_250D7CA6C(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void *)(*a2 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  uint64_t result = swift_beginAccess();
  *id v3 = v2;
  return result;
}

uint64_t sub_250D7CABC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t initializeBufferWithCopyOfBuffer for PinnedContentDifference(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_250D7CB4C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for PinnedContentDifference(uint64_t a1)
{
  return sub_250D7CB70(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t sub_250D7CB70(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for PinnedContentDifference(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_250D7CB4C(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for PinnedContentDifference(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_250D7CB4C(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  char v10 = *(unsigned char *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  sub_250D7CB70(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PinnedContentDifference(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  char v8 = *(unsigned char *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = v4;
  sub_250D7CB70(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PinnedContentDifference(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PinnedContentDifference(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_250D7CD44(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_250D7CD4C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PinnedContentDifference()
{
  return &type metadata for PinnedContentDifference;
}

uint64_t method lookup function for CodablePinnedContentDifference(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CodablePinnedContentDifference);
}

uint64_t dispatch thunk of CodablePinnedContentDifference.index.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.index.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.index.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.identifier.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.identifier.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.identifier.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.__allocating_init(index:identifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_250D7CF14(uint64_t a1, uint64_t a2)
{
  sub_250D7CF78();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_250D7CF78()
{
  if (!qword_269B030B0)
  {
    unint64_t v0 = sub_250D80260();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B030B0);
    }
  }
}

uint64_t sub_250D7CFD4(uint64_t a1)
{
  sub_250D7CF78();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static LegacyFavoritesManagerSupport.keyValueDomainCategory.getter()
{
  return 0;
}

unint64_t static LegacyFavoritesManagerSupport.keyValueDomainName.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static LegacyFavoritesManagerSupport.keyValueDomainKey.getter()
{
  return 0xD000000000000013;
}

uint64_t static LegacyFavoritesManagerSupport.favoriteIdentifiers(from:)(uint64_t a1)
{
  sub_250D724F8(a1, (uint64_t)&v12);
  sub_250D7D33C();
  if (swift_dynamicCast())
  {
    if (*(void *)(v11 + 16) && (unint64_t v1 = sub_250D7DB40(0xD000000000000013, 0x8000000250D81760), (v2 & 1) != 0))
    {
      sub_250D724F8(*(void *)(v11 + 56) + 32 * v1, (uint64_t)&v12);
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((void *)&v13 + 1))
    {
      sub_250D71EA8(0, (unint64_t *)&unk_26B2060D0, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
      if (swift_dynamicCast()) {
        return v11;
      }
    }
    else
    {
      sub_250D7CFD4((uint64_t)&v12);
    }
  }
  if (qword_26B206130 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_250D7FE20();
  __swift_project_value_buffer(v4, (uint64_t)qword_26B206190);
  uint64_t v5 = sub_250D7FE00();
  os_log_type_t v6 = sub_250D80230();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(void *)&long long v12 = v8;
    *(_DWORD *)uint64_t v7 = 136315394;
    sub_250D7D4A8(0xD00000000000001DLL, 0x8000000250D81110, (uint64_t *)&v12);
    sub_250D80270();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v9 = sub_250D80100();
    sub_250D7D4A8(v9, v10, (uint64_t *)&v12);
    sub_250D80270();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250D6D000, v5, v6, "[%s]: Legacy favorites unreadable: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x253388EC0](v8, -1, -1);
    MEMORY[0x253388EC0](v7, -1, -1);
  }

  sub_250D7D3A8();
  swift_allocError();
  return swift_willThrow();
}

void sub_250D7D33C()
{
  if (!qword_26B2060B0)
  {
    unint64_t v0 = sub_250D800D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B2060B0);
    }
  }
}

unint64_t sub_250D7D3A8()
{
  unint64_t result = qword_269B03130;
  if (!qword_269B03130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B03130);
  }
  return result;
}

unint64_t LegacyFavoritesManagerSupport.Failure.debugDescription.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t static LegacyFavoritesManagerSupport.Failure.== infix(_:_:)()
{
  return 1;
}

uint64_t LegacyFavoritesManagerSupport.Failure.hash(into:)()
{
  return sub_250D80460();
}

uint64_t LegacyFavoritesManagerSupport.Failure.hashValue.getter()
{
  return sub_250D80470();
}

unint64_t sub_250D7D48C()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_250D7D4A8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_250D7D57C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_250D724F8((uint64_t)v12, *a3);
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
      sub_250D724F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_250D7D57C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_250D80280();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_250D7D738(a5, a6);
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
  uint64_t v8 = sub_250D80320();
  if (!v8)
  {
    sub_250D80380();
    __break(1u);
LABEL_17:
    uint64_t result = sub_250D803B0();
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

uint64_t sub_250D7D738(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_250D7D7D0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_250D7D9D0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_250D7D9D0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_250D7D7D0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_250D7D948(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_250D80300();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_250D80380();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_250D80130();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_250D803B0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_250D80380();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_250D7D948(uint64_t a1, uint64_t a2)
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
  sub_250D71EA8(0, &qword_269B03140, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_250D7D9D0(char a1, int64_t a2, char a3, char *a4)
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
    sub_250D71EA8(0, &qword_269B03140, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
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
  long long v13 = a4 + 32;
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
  uint64_t result = sub_250D803B0();
  __break(1u);
  return result;
}

unint64_t sub_250D7DB40(uint64_t a1, uint64_t a2)
{
  sub_250D80450();
  sub_250D80110();
  uint64_t v4 = sub_250D80470();
  return sub_250D7DCF4(a1, a2, v4);
}

unint64_t sub_250D7DBBC()
{
  unint64_t result = qword_269B03138;
  if (!qword_269B03138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B03138);
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyFavoritesManagerSupport()
{
  return &type metadata for LegacyFavoritesManagerSupport;
}

unsigned char *storeEnumTagSinglePayload for LegacyFavoritesManagerSupport.Failure(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x250D7DCBCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyFavoritesManagerSupport.Failure()
{
  return &type metadata for LegacyFavoritesManagerSupport.Failure;
}

unint64_t sub_250D7DCF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_250D803F0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_250D803F0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t HDCodablePinnedContentState.Failure.debugDescription.getter()
{
  return 543516756;
}

id HDCodablePinnedContentState.init(pinnedIdentifiers:)(uint64_t a1)
{
  uint64_t v2 = sub_250D80030();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v6);
  int64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (result)
  {
    *(void *)&v8[*(int *)(v6 + 24)] = MEMORY[0x263F8EE80];
    char v21 = 1;
    id v10 = result;
    sub_250D80000();
    v20[1] = a1;
    sub_250D7E474(0, (unint64_t *)&unk_26B2060D0, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_250D7E16C();
    sub_250D7FFC0();
    sub_250D800C0();
    BOOL v11 = (void *)sub_250D800B0();
    uint64_t v12 = v2;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F32EB8], v2);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v13 = v20[0];
    uint64_t v14 = sub_250D80050();
    if (v13)
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      uint64_t v16 = v14;
      unint64_t v17 = v15;
      uint64_t v18 = sub_250D7FDB0();
      v20[0] = v12;
      int64_t v19 = (void *)v18;
      sub_250D7E1E8(v16, v17);
      objc_msgSend(v10, sel_setPinnedContentStateData_, v19);

      (*(void (**)(char *, void))(v3 + 8))(v5, v20[0]);
    }
    sub_250D70944((uint64_t)v8);
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_250D7E16C()
{
  unint64_t result = qword_26B2060A8;
  if (!qword_26B2060A8)
  {
    sub_250D7E474(255, (unint64_t *)&unk_26B2060D0, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2060A8);
  }
  return result;
}

uint64_t sub_250D7E1E8(uint64_t a1, unint64_t a2)
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

uint64_t HDCodablePinnedContentState.makeCopy()()
{
  swift_getObjectType();
  objc_msgSend(v0, sel_copy);
  sub_250D80290();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  return v2;
}

BOOL HDCodablePinnedContentState.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CoherentPinnedContentState();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v16 - v8;
  sub_250D7986C(a1, (uint64_t)v17);
  if (!v18)
  {
    sub_250D7CFD4((uint64_t)v17);
    return 0;
  }
  sub_250D7E4C0();
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v10 = (void *)v16[1];
  sub_250D70630();
  sub_250D70630();
  char v13 = sub_250D7FF40();
  if (v13)
  {
    id v14 = objc_msgSend(v2, sel_epoch);
    id v15 = objc_msgSend(v10, sel_epoch);

    BOOL v11 = v14 == v15;
  }
  else
  {

    BOOL v11 = 0;
  }
  sub_250D70944((uint64_t)v7);
  sub_250D70944((uint64_t)v9);
  return v11;
}

void sub_250D7E474(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_250D7E4C0()
{
  unint64_t result = qword_269B03148;
  if (!qword_269B03148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B03148);
  }
  return result;
}

BOOL sub_250D7E500(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    swift_unknownObjectRetain();
    sub_250D80290();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = a1;
  }
  BOOL v6 = HDCodablePinnedContentState.isEqual(_:)((uint64_t)v8);

  sub_250D7CFD4((uint64_t)v8);
  return v6;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.setShouldRespectOrder()()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_250D80030();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  BOOL v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v1)
  {
    char v17 = 1;
    sub_250D70B2C();
    sub_250D7FFE0();
    sub_250D800C0();
    id v10 = (void *)sub_250D800B0();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F32EB8], v3);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v11 = sub_250D80050();
    unint64_t v13 = v12;
    uint64_t v16 = sub_250D7FDB0();
    sub_250D7E1E8(v11, v13);
    id v14 = (void *)v16;
    objc_msgSend(v2, sel_setPinnedContentStateData_, v16);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_250D70944((uint64_t)v9);
  }
}

uint64_t sub_250D7E7B8(void *a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  LODWORD(v27) = a5;
  id v30 = a4;
  uint64_t v9 = sub_250D80030();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v5)
  {
    id v24 = a1;
    char v25 = v12;
    uint64_t v26 = v10;
    sub_250D79E88((uint64_t)v30, v27 & 1);
    uint64_t v27 = a3;
    uint64_t v28 = a2;
    uint64_t v29 = a3;
    sub_250D70B94();
    sub_250D7FF60();
    sub_250D800C0();
    uint64_t v16 = (void *)sub_250D800B0();
    char v17 = v25;
    uint64_t v18 = v26;
    (*(void (**)(char *, void, uint64_t))(v26 + 104))(v25, *MEMORY[0x263F32EB8], v9);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    id v30 = v16;
    uint64_t v20 = sub_250D80050();
    unint64_t v22 = v21;
    unint64_t v23 = (void *)sub_250D7FDB0();
    sub_250D7E1E8(v20, v22);
    objc_msgSend(v24, sel_setPinnedContentStateData_, v23);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v9);
    sub_250D70944((uint64_t)v15);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D7EA74(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = a3;
  uint64_t v6 = sub_250D80030();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v10);
  unint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v3)
  {
    uint64_t v21 = a2;
    uint64_t v22 = v23;
    sub_250D70B94();
    sub_250D7FF80();
    swift_bridgeObjectRelease();
    sub_250D800C0();
    uint64_t v13 = (void *)sub_250D800B0();
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F32EB8], v6);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v14 = sub_250D80050();
    unint64_t v16 = v15;
    uint64_t v20 = sub_250D7FDB0();
    sub_250D7E1E8(v14, v16);
    char v17 = (void *)v20;
    objc_msgSend(a1, sel_setPinnedContentStateData_, v20);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_250D70944((uint64_t)v12);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_250D7ECD8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4;
  uint64_t v8 = sub_250D80030();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v4)
  {
    id v25 = a1;
    uint64_t v26 = v11;
    uint64_t v27 = a3;
    sub_250D7A354(a2, a3, v28);
    sub_250D800C0();
    unint64_t v15 = (void *)sub_250D800B0();
    uint64_t v16 = v9;
    char v17 = *(void (**)(char *, void, uint64_t))(v9 + 104);
    uint64_t v18 = v26;
    v17(v26, *MEMORY[0x263F32EB8], v8);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v20 = sub_250D80050();
    unint64_t v22 = v21;
    uint64_t v23 = (void *)sub_250D7FDB0();
    sub_250D7E1E8(v20, v22);
    objc_msgSend(v25, sel_setPinnedContentStateData_, v23);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v8);
    sub_250D70944((uint64_t)v14);
  }
  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.pinContentWithIdentifier(_:at:)(Swift::String _, Swift::Int_optional at)
{
  value = (void *)at.value;
  object = _._object;
  uint64_t countAndFlagsBits = _._countAndFlagsBits;
  BOOL is_nil = at.is_nil;
  swift_bridgeObjectRetain();
  sub_250D7E7B8(v2, countAndFlagsBits, (uint64_t)object, value, is_nil);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.unpinContentWithIdentifier(_:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_250D7EA74(v1, countAndFlagsBits, (uint64_t)object);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.unpinContent(at:)(Swift::Int at)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_250D80030();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v2)
  {
    sub_250D7A0EC(at);
    sub_250D800C0();
    uint64_t v12 = (void *)sub_250D800B0();
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F32EB8], v5);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v13 = sub_250D80050();
    unint64_t v15 = v14;
    uint64_t v18 = sub_250D7FDB0();
    sub_250D7E1E8(v13, v15);
    uint64_t v16 = (void *)v18;
    objc_msgSend(v3, sel_setPinnedContentStateData_, v18);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_250D70944((uint64_t)v11);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.movePinnedContentWithIdentifier(_:to:)(Swift::String _, Swift::Int to)
{
  object = _._object;
  uint64_t countAndFlagsBits = _._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_250D7ECD8(v2, countAndFlagsBits, (uint64_t)object, to);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.unpinAllContentInDomain()()
{
  uint64_t v2 = v0;
  uint64_t v3 = sub_250D80030();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70630();
  if (!v1)
  {
    sub_250D70B94();
    sub_250D7FFA0();
    sub_250D800C0();
    uint64_t v10 = (void *)sub_250D800B0();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F32EB8], v3);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v11 = sub_250D80050();
    unint64_t v13 = v12;
    uint64_t v16 = sub_250D7FDB0();
    sub_250D7E1E8(v11, v13);
    unint64_t v14 = (void *)v16;
    objc_msgSend(v2, sel_setPinnedContentStateData_, v16);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_250D70944((uint64_t)v9);
  }
}

uint64_t HDCodablePinnedContentState.merge(with:)()
{
  uint64_t v2 = sub_250D80030();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CoherentPinnedContentState();
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v19 - v10;
  uint64_t result = sub_250D70630();
  if (!v1)
  {
    id v20 = v0;
    uint64_t v21 = v3;
    sub_250D70630();
    uint64_t v19 = (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState;
    sub_250D708FC(&qword_26B205FB0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    sub_250D7FEF0();
    sub_250D800C0();
    unint64_t v13 = (void *)sub_250D800B0();
    uint64_t v14 = v21;
    (*(void (**)(char *, void, uint64_t))(v21 + 104))(v5, *MEMORY[0x263F32EB8], v2);
    sub_250D708FC(&qword_26B205FE0, v19);
    uint64_t v15 = sub_250D80050();
    unint64_t v17 = v16;
    uint64_t v19 = (void (*)(uint64_t))sub_250D7FDB0();
    sub_250D7E1E8(v15, v17);
    uint64_t v18 = v19;
    objc_msgSend(v20, sel_setPinnedContentStateData_, v19);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v2);
    sub_250D70944((uint64_t)v9);
    return sub_250D70944((uint64_t)v11);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.purgeCoherentMetadataAndIncrementEpoch()()
{
  uint64_t v2 = sub_250D80030();
  uint64_t v31 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v30 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250D70B94();
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CoherentPinnedContentState();
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v27 - v13;
  sub_250D70630();
  if (!v1)
  {
    id v28 = v0;
    sub_250D70B2C();
    MEMORY[0x253388590](&v34);
    uint64_t v29 = v2;
    char v15 = v34;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v14[*(int *)(v9 + 20)], v5);
    sub_250D708FC(&qword_26B206098, (void (*)(uint64_t))sub_250D70B94);
    uint64_t v16 = sub_250D80140();
    *(void *)&v12[*(int *)(v9 + 24)] = MEMORY[0x263F8EE80];
    char v33 = v15;
    uint64_t v17 = v29;
    sub_250D80000();
    uint64_t v32 = v16;
    sub_250D7E474(0, (unint64_t *)&unk_26B2060D0, MEMORY[0x263F8D310], MEMORY[0x263F8D488]);
    sub_250D7E16C();
    sub_250D7FFC0();
    sub_250D70944((uint64_t)v14);
    sub_250D7FB94((uint64_t)v12, (uint64_t)v14);
    sub_250D800C0();
    uint64_t v18 = (void *)sub_250D800B0();
    id v20 = v30;
    uint64_t v19 = v31;
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v30, *MEMORY[0x263F32EB8], v17);
    sub_250D708FC(&qword_26B205FE0, (void (*)(uint64_t))type metadata accessor for CoherentPinnedContentState);
    uint64_t v21 = sub_250D80050();
    unint64_t v23 = v22;
    uint64_t v24 = (void *)sub_250D7FDB0();
    sub_250D7E1E8(v21, v23);
    id v25 = v28;
    objc_msgSend(v28, sel_setPinnedContentStateData_, v24);

    (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v17);
    sub_250D70944((uint64_t)v14);
    uint64_t v26 = (char *)objc_msgSend(v25, sel_epoch);
    if (__OFADD__(v26, 1)) {
      __break(1u);
    }
    else {
      objc_msgSend(v25, sel_setEpoch_, v26 + 1);
    }
  }
}

uint64_t sub_250D7FB94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CoherentPinnedContentState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *_s7FailureOwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s7FailureOwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s7FailureOwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *_s7FailureOwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7FailureOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s7FailureOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HDCodablePinnedContentState.Failure()
{
  return &type metadata for HDCodablePinnedContentState.Failure;
}

unint64_t sub_250D7FD48()
{
  unint64_t result = qword_269B03150;
  if (!qword_269B03150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B03150);
  }
  return result;
}

uint64_t sub_250D7FDA0()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_250D7FDB0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_250D7FDC0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_250D7FDD0()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_250D7FDE0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_250D7FDF0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_250D7FE00()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_250D7FE10()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_250D7FE20()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_250D7FEB0()
{
  return MEMORY[0x270F17010]();
}

uint64_t sub_250D7FEF0()
{
  return MEMORY[0x270F17030]();
}

uint64_t sub_250D7FF00()
{
  return MEMORY[0x270F17038]();
}

uint64_t sub_250D7FF40()
{
  return MEMORY[0x270F174A0]();
}

uint64_t sub_250D7FF50()
{
  return MEMORY[0x270F174B8]();
}

uint64_t sub_250D7FF60()
{
  return MEMORY[0x270F174F0]();
}

uint64_t sub_250D7FF70()
{
  return MEMORY[0x270F174F8]();
}

uint64_t sub_250D7FF80()
{
  return MEMORY[0x270F17500]();
}

uint64_t sub_250D7FF90()
{
  return MEMORY[0x270F17518]();
}

uint64_t sub_250D7FFA0()
{
  return MEMORY[0x270F17520]();
}

uint64_t sub_250D7FFB0()
{
  return MEMORY[0x270F17530]();
}

uint64_t sub_250D7FFC0()
{
  return MEMORY[0x270F17538]();
}

uint64_t sub_250D7FFD0()
{
  return MEMORY[0x270F17638]();
}

uint64_t sub_250D7FFE0()
{
  return MEMORY[0x270F17640]();
}

uint64_t sub_250D7FFF0()
{
  return MEMORY[0x270F17648]();
}

uint64_t sub_250D80000()
{
  return MEMORY[0x270F17650]();
}

uint64_t sub_250D80010()
{
  return MEMORY[0x270F17670]();
}

uint64_t sub_250D80020()
{
  return MEMORY[0x270F17678]();
}

uint64_t sub_250D80030()
{
  return MEMORY[0x270F17930]();
}

uint64_t sub_250D80040()
{
  return MEMORY[0x270F17BC8]();
}

uint64_t sub_250D80050()
{
  return MEMORY[0x270F17C60]();
}

uint64_t sub_250D80060()
{
  return MEMORY[0x270F17C68]();
}

uint64_t sub_250D80070()
{
  return MEMORY[0x270F17CA8]();
}

uint64_t sub_250D80090()
{
  return MEMORY[0x270F17F68]();
}

uint64_t sub_250D800A0()
{
  return MEMORY[0x270F17F78]();
}

uint64_t sub_250D800B0()
{
  return MEMORY[0x270EF30A8]();
}

uint64_t sub_250D800C0()
{
  return MEMORY[0x270F17FA0]();
}

uint64_t sub_250D800D0()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_250D800E0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_250D800F0()
{
  return MEMORY[0x270EF1B18]();
}

uint64_t sub_250D80100()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_250D80110()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_250D80120()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_250D80130()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_250D80140()
{
  return MEMORY[0x270F9D910]();
}

uint64_t sub_250D80150()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_250D80160()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_250D80170()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_250D80180()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_250D80190()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_250D801A0()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_250D801B0()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_250D801C0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_250D801D0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_250D801E0()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_250D801F0()
{
  return MEMORY[0x270F9E098]();
}

uint64_t sub_250D80200()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_250D80210()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_250D80220()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_250D80230()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_250D80240()
{
  return MEMORY[0x270EF2128]();
}

uint64_t sub_250D80250()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_250D80260()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_250D80270()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_250D80280()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_250D80290()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_250D802A0()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_250D802B0()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_250D802C0()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_250D802D0()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_250D802E0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_250D802F0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_250D80300()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_250D80310()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_250D80320()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_250D80330()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_250D80340()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_250D80350()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_250D80360()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_250D80370()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_250D80380()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_250D80390()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_250D803A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_250D803B0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_250D803C0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_250D803D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_250D803E0()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_250D803F0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_250D80400()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_250D80410()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_250D80420()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_250D80430()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_250D80440()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_250D80450()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_250D80460()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_250D80470()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_250D80480()
{
  return MEMORY[0x270FA0128]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}