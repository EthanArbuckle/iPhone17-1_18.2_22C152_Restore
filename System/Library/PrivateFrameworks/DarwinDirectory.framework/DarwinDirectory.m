void sub_24C8981D4()
{
  qword_2697F8840 = (uint64_t)&type metadata for LibSystemDarwinDirectoryProvider;
  *(void *)algn_2697F8848 = &off_26FEF9940;
}

uint64_t sub_24C8981F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(uint64_t), void (*a6)(char *, char *), uint64_t (*a7)(void))
{
  uint64_t v11 = a4(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v16 = (char *)&v18 - v15;
  a5(a1);
  swift_beginAccess();
  a6(v16, v14);
  swift_endAccess();
  return sub_24C898D88((uint64_t)v16, a7);
}

uint64_t sub_24C8982FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);

  return swift_release();
}

uint64_t sub_24C89835C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t (*a3)(void)@<X2>, unint64_t a4@<X8>)
{
  uint64_t v8 = a2(0);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v14 = (_DWORD *)((char *)&v43 - v13);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  v17 = (char *)&v43 - v16;
  MEMORY[0x270FA5388](v15);
  v21 = (_DWORD *)((char *)&v43 - v20);
  uint64_t v22 = *(void *)(a1 + 56);
  v48 = (char *)(a1 + 56);
  char v23 = *(unsigned char *)(a1 + 32);
  uint64_t v24 = 1 << v23;
  uint64_t v25 = -1;
  if (1 << v23 < 64) {
    uint64_t v25 = ~(-1 << (1 << v23));
  }
  unint64_t v26 = v25 & v22;
  if (v26)
  {
    unint64_t v45 = a4;
    uint64_t v46 = v18;
    uint64_t v47 = v4;
    uint64_t v27 = 0;
    unint64_t v28 = __clz(__rbit64(v26));
    a4 = (v26 - 1) & v26;
    int64_t v49 = (unint64_t)(v24 + 63) >> 6;
    while (1)
    {
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v44 = v19;
      uint64_t v30 = *(void *)(v19 + 72);
      sub_24C898DE8(v29 + v30 * v28, (uint64_t)v17, a3);
      sub_24C898E50((uint64_t)v17, (uint64_t)v21, a3);
      swift_bridgeObjectRetain();
      v17 = v48;
      while (a4)
      {
        while (1)
        {
          unint64_t v32 = __clz(__rbit64(a4));
          a4 &= a4 - 1;
          unint64_t v33 = v32 | (v27 << 6);
LABEL_25:
          sub_24C898DE8(*(void *)(a1 + 48) + v33 * v30, (uint64_t)v11, a3);
          sub_24C898E50((uint64_t)v11, (uint64_t)v14, a3);
          if (*v21 < *v14) {
            break;
          }
          sub_24C898D88((uint64_t)v14, a3);
          if (!a4) {
            goto LABEL_9;
          }
        }
        sub_24C898D88((uint64_t)v21, a3);
        sub_24C898E50((uint64_t)v14, (uint64_t)v21, a3);
      }
LABEL_9:
      int64_t v34 = v27 + 1;
      if (__OFADD__(v27, 1))
      {
        __break(1u);
LABEL_39:
        if (v31 < 9) {
          return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v19 + 56))(a4, 1, 1);
        }
        unint64_t v39 = *(void *)(a1 + 88);
        if (v39)
        {
          uint64_t v27 = 4;
          goto LABEL_32;
        }
        unint64_t v39 = *(void *)(a1 + 96);
        if (v39)
        {
          uint64_t v27 = 5;
          goto LABEL_32;
        }
      }
      else
      {
        if (v34 >= v49) {
          goto LABEL_28;
        }
        unint64_t v35 = *(void *)&v17[8 * v34];
        ++v27;
        if (v35) {
          goto LABEL_24;
        }
        uint64_t v27 = v34 + 1;
        if (v34 + 1 >= v49) {
          goto LABEL_28;
        }
        unint64_t v35 = *(void *)&v17[8 * v27];
        if (v35) {
          goto LABEL_24;
        }
        uint64_t v27 = v34 + 2;
        if (v34 + 2 >= v49) {
          goto LABEL_28;
        }
        unint64_t v35 = *(void *)&v17[8 * v27];
        if (v35) {
          goto LABEL_24;
        }
        uint64_t v27 = v34 + 3;
        if (v34 + 3 >= v49) {
          goto LABEL_28;
        }
        unint64_t v35 = *(void *)&v17[8 * v27];
        if (v35) {
          goto LABEL_24;
        }
        int64_t v36 = v34 + 4;
        if (v36 >= v49)
        {
LABEL_28:
          swift_release();
          uint64_t v37 = v45;
          sub_24C898E50((uint64_t)v21, v45, a3);
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v37, 0, 1, v46);
        }
        unint64_t v35 = *(void *)&v17[8 * v36];
        if (v35)
        {
          uint64_t v27 = v36;
LABEL_24:
          a4 = (v35 - 1) & v35;
          unint64_t v33 = __clz(__rbit64(v35)) + (v27 << 6);
          goto LABEL_25;
        }
        while (1)
        {
          uint64_t v27 = v36 + 1;
          if (__OFADD__(v36, 1)) {
            break;
          }
          if (v27 >= v49) {
            goto LABEL_28;
          }
          unint64_t v35 = *(void *)&v17[8 * v27];
          ++v36;
          if (v35) {
            goto LABEL_24;
          }
        }
        __break(1u);
      }
      uint64_t v40 = 0;
      uint64_t v41 = 6;
      if (v49 > 6) {
        uint64_t v41 = v49;
      }
      uint64_t v42 = v41 - 6;
      do
      {
        if (v42 == v40) {
          return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v19 + 56))(a4, 1, 1);
        }
        unint64_t v39 = *(void *)(a1 + 104 + 8 * v40++);
      }
      while (!v39);
      uint64_t v27 = v40 + 5;
LABEL_32:
      a4 = (v39 - 1) & v39;
      unint64_t v28 = __clz(__rbit64(v39)) + (v27 << 6);
    }
  }
  unsigned int v31 = v23 & 0x3F;
  if (v31 > 6)
  {
    int64_t v49 = (unint64_t)(v24 + 63) >> 6;
    unint64_t v39 = *(void *)(a1 + 64);
    if (v39)
    {
      unint64_t v45 = a4;
      uint64_t v46 = v18;
      uint64_t v47 = v4;
      uint64_t v27 = 1;
      goto LABEL_32;
    }
    if (v31 >= 8)
    {
      unint64_t v39 = *(void *)(a1 + 72);
      uint64_t v46 = v18;
      uint64_t v47 = v4;
      unint64_t v45 = a4;
      if (v39)
      {
        uint64_t v27 = 2;
      }
      else
      {
        unint64_t v39 = *(void *)(a1 + 80);
        if (!v39) {
          goto LABEL_39;
        }
        uint64_t v27 = 3;
      }
      goto LABEL_32;
    }
  }
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v19 + 56))(a4, 1, 1);
}

uint64_t sub_24C8987A4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8858);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (int *)((char *)aBlock - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2697F8820 != -1) {
    swift_once();
  }
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = MEMORY[0x263F8EE88];
  uint64_t v4 = (uint64_t *)(v3 + 16);
  aBlock[4] = sub_24C898D1C;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C8982FC;
  aBlock[3] = &block_descriptor_6;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v5);
  swift_beginAccess();
  uint64_t v6 = *v4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_24C89835C(v6, type metadata accessor for LibSystemUserRecord, type metadata accessor for LibSystemUserRecord, (unint64_t)v2);
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t result = (*(uint64_t (**)(int *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v2, 1, v7);
  if (result != 1)
  {
    int v9 = *v2;
    sub_24C898D88((uint64_t)v2, type metadata accessor for LibSystemUserRecord);
    uint64_t result = (v9 + 1);
    if (v9 != -1) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8989E0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8850);
  MEMORY[0x270FA5388](v0 - 8);
  v2 = (int *)((char *)aBlock - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2697F8820 != -1) {
    swift_once();
  }
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = MEMORY[0x263F8EE88];
  uint64_t v4 = (uint64_t *)(v3 + 16);
  aBlock[4] = sub_24C898C98;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C8982FC;
  aBlock[3] = &block_descriptor;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v5);
  swift_beginAccess();
  uint64_t v6 = *v4;
  swift_bridgeObjectRetain();
  swift_release();
  sub_24C89835C(v6, type metadata accessor for LibSystemGroupRecord, type metadata accessor for LibSystemGroupRecord, (unint64_t)v2);
  swift_bridgeObjectRelease();
  uint64_t v7 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t result = (*(uint64_t (**)(int *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v2, 1, v7);
  if (result != 1)
  {
    int v9 = *v2;
    sub_24C898D88((uint64_t)v2, type metadata accessor for LibSystemGroupRecord);
    uint64_t result = (v9 + 1);
    if (v9 != -1) {
      return result;
    }
    __break(1u);
  }
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

uint64_t sub_24C898C60()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C898C98(uint64_t a1, uint64_t a2)
{
  return sub_24C8981F4(a1, a2, v2, type metadata accessor for LibSystemGroupRecord, (void (*)(uint64_t))sub_24C8990D0, (void (*)(char *, char *))sub_24C89D02C, type metadata accessor for LibSystemGroupRecord);
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

uint64_t sub_24C898D1C(uint64_t a1, uint64_t a2)
{
  return sub_24C8981F4(a1, a2, v2, type metadata accessor for LibSystemUserRecord, (void (*)(uint64_t))sub_24C898FBC, (void (*)(char *, char *))sub_24C89CC94, type metadata accessor for LibSystemUserRecord);
}

uint64_t sub_24C898D88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C898DE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C898E50(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C898EC4(uint64_t a1)
{
  uint64_t result = sub_24C898F74(&qword_2697F8860, (void (*)(uint64_t))type metadata accessor for LibSystemGroupRecord);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C898F1C(uint64_t a1)
{
  uint64_t result = sub_24C898F74(&qword_2697F8868, (void (*)(uint64_t))type metadata accessor for LibSystemUserRecord);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C898F74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C898FBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *(_DWORD *)(a1 + 4);
  *(void *)(a2 + 8) = sub_24C8A7708();
  *(void *)(a2 + 16) = v4;
  uint64_t v5 = (int *)type metadata accessor for LibSystemUserRecord(0);
  sub_24C8A7698();
  uint64_t v6 = sub_24C8A7708();
  uint64_t v7 = (uint64_t *)(a2 + v5[7]);
  *uint64_t v7 = v6;
  v7[1] = v8;
  uint64_t v9 = sub_24C8A7708();
  uint64_t v10 = (uint64_t *)(a2 + v5[8]);
  *uint64_t v10 = v9;
  v10[1] = v11;
  *(_DWORD *)(a2 + v5[9]) = *(void *)(a1 + 40);
  uint64_t result = sub_24C8A7708();
  uint64_t v13 = (uint64_t *)(a2 + v5[10]);
  *uint64_t v13 = result;
  v13[1] = v14;
  *(unsigned char *)(a2 + v5[11]) = *(unsigned char *)(a1 + 32);
  return result;
}

uint64_t sub_24C8990D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *(_DWORD *)(a1 + 4);
  *(void *)(a2 + 8) = sub_24C8A7708();
  *(void *)(a2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LibSystemGroupRecord(0);
  sub_24C8A7698();
  uint64_t v6 = 0;
  *(unsigned char *)(a2 + *(int *)(v5 + 32)) = *(unsigned char *)(a1 + 32);
  uint64_t v12 = MEMORY[0x263F8EE88];
  while (1)
  {
    uint64_t result = *(void *)(*(void *)(a1 + 40) + 8 * v6);
    if (!result) {
      break;
    }
    uint64_t v8 = sub_24C8A7708();
    sub_24C89D404(&v11, v8, v9);
    uint64_t result = swift_bridgeObjectRelease();
    if (__OFADD__(v6++, 1))
    {
      __break(1u);
      break;
    }
  }
  *(void *)(a2 + *(int *)(v5 + 28)) = v12;
  return result;
}

ValueMetadata *type metadata accessor for LibSystemDarwinDirectoryProvider()
{
  return &type metadata for LibSystemDarwinDirectoryProvider;
}

uint64_t sub_24C8994E8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for User();
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (_OWORD *)(v2 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v8, (uint64_t)&v13);
  swift_dynamicCast();
  uint64_t v9 = &v7[*(int *)(v5 + 36)];
  *uint64_t v9 = a1;
  v9[1] = a2;
  swift_bridgeObjectRelease();
  uint64_t v14 = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
  sub_24C8A2AA0((uint64_t)v7, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  sub_24C8A2960(&v13, v8);
  return swift_endAccess();
}

id sub_24C899670()
{
  uint64_t v1 = type metadata accessor for Group();
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v16 - v5;
  uint64_t v7 = type metadata accessor for User();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v0 + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50(v10, (uint64_t)v18);
  swift_dynamicCast();
  sub_24C8A29D8((uint64_t)&v9[*(int *)(v7 + 32)], (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
  sub_24C8A2A40((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
  sub_24C8A29D8((uint64_t)v6, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
  uint64_t v11 = (char *)objc_allocWithZone((Class)DDGroup);
  uint64_t v12 = (uint64_t *)&v11[OBJC_IVAR___DDGroup__group];
  v12[3] = v1;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v12);
  sub_24C8A29D8((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
  v17.receiver = v11;
  v17.super_class = (Class)DDGroup;
  id v14 = objc_msgSendSuper2(&v17, sel_init);
  sub_24C8A2A40((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
  sub_24C8A2A40((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
  return v14;
}

void sub_24C899A1C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_24C8A76E8();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);
}

uint64_t sub_24C899A94(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for User();
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (_OWORD *)(v2 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v8, (uint64_t)&v13);
  swift_dynamicCast();
  id v9 = &v7[*(int *)(v5 + 40)];
  *id v9 = a1;
  v9[1] = a2;
  swift_bridgeObjectRelease();
  uint64_t v14 = v5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v13);
  sub_24C8A2AA0((uint64_t)v7, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  sub_24C8A2960(&v13, v8);
  return swift_endAccess();
}

uint64_t sub_24C899D84(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = (_OWORD *)(v1 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v6, (uint64_t)&v10);
  swift_dynamicCast();
  *(void *)&v5[*(int *)(v3 + 48)] = a1;
  swift_bridgeObjectRelease();
  uint64_t v11 = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v10);
  sub_24C8A2AA0((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  sub_24C8A2960(&v10, v6);
  return swift_endAccess();
}

uint64_t sub_24C899ED8()
{
  uint64_t v1 = type metadata accessor for Group();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v33 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v29 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v31 = (uint64_t)&v29 - v8;
  uint64_t v9 = type metadata accessor for User();
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50(v12, (uint64_t)v35);
  swift_dynamicCast();
  uint64_t v13 = *(void *)&v11[*(int *)(v9 + 44)];
  uint64_t v14 = *(void *)(v13 + 16);
  unint64_t v15 = MEMORY[0x263F8EE78];
  if (v14)
  {
    uint64_t v29 = v11;
    v35[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8A7898();
    uint64_t result = sub_24C8A192C(v13);
    int64_t v17 = result;
    int v19 = v18;
    char v21 = v20 & 1;
    uint64_t v30 = v13 + 56;
    while ((v17 & 0x8000000000000000) == 0 && v17 < 1 << *(unsigned char *)(v13 + 32))
    {
      if (((*(void *)(v30 + (((unint64_t)v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
        goto LABEL_11;
      }
      if (*(_DWORD *)(v13 + 36) != v19) {
        goto LABEL_12;
      }
      uint64_t v22 = v31;
      sub_24C8A29D8(*(void *)(v13 + 48) + *(void *)(v32 + 72) * v17, v31, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A2AA0(v22, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A29D8((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
      char v23 = (char *)objc_allocWithZone((Class)DDGroup);
      uint64_t v24 = (uint64_t *)&v23[OBJC_IVAR___DDGroup__group];
      v24[3] = v33;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v24);
      sub_24C8A29D8((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
      v34.receiver = v23;
      v34.super_class = (Class)DDGroup;
      objc_msgSendSuper2(&v34, sel_init);
      sub_24C8A2A40((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A2A40((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A7878();
      sub_24C8A78A8();
      sub_24C8A78B8();
      sub_24C8A7888();
      uint64_t result = sub_24C8A19CC(v17, v19, v21 & 1, v13);
      int64_t v17 = result;
      int v19 = v26;
      char v21 = v27 & 1;
      if (!--v14)
      {
        sub_24C8A2904(result, v26, v27 & 1);
        unint64_t v15 = v35[0];
        swift_bridgeObjectRelease();
        uint64_t v11 = v29;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_9:
    sub_24C8A2A40((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for User);
    uint64_t v28 = sub_24C8A1F58(v15);
    swift_bridgeObjectRelease();
    return v28;
  }
  return result;
}

uint64_t sub_24C89A290(uint64_t a1)
{
  uint64_t v45 = type metadata accessor for Group();
  uint64_t v2 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = type metadata accessor for User();
  MEMORY[0x270FA5388](v40);
  unint64_t v39 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v7 = sub_24C8A77E8();
    if (v7) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
LABEL_23:
    uint64_t v33 = sub_24C8A20C8(v11);
    swift_bridgeObjectRelease();
    objc_super v34 = (_OWORD *)(v38 + OBJC_IVAR___DDUser__user);
    swift_beginAccess();
    sub_24C89AB50((uint64_t)v34, (uint64_t)&v50);
    uint64_t v36 = (uint64_t)v39;
    uint64_t v35 = v40;
    swift_dynamicCast();
    *(void *)(v36 + *(int *)(v35 + 44)) = v33;
    swift_bridgeObjectRelease();
    uint64_t v51 = v35;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v50);
    sub_24C8A2AA0(v36, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    sub_24C8A2960(&v50, v34);
    return swift_endAccess();
  }
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v46 = MEMORY[0x263F8EE78];
  sub_24C8A1228(0, v7 & ~(v7 >> 63), 0);
  if (v6)
  {
    uint64_t result = sub_24C8A7798();
    char v10 = 1;
  }
  else
  {
    uint64_t result = sub_24C8A1D00(a1);
    char v10 = v12 & 1;
  }
  uint64_t v47 = result;
  uint64_t v48 = v9;
  char v49 = v10;
  if ((v7 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    uint64_t v44 = v13;
    unint64_t v14 = 0x2697F8000uLL;
    unint64_t v42 = a1 & 0xC000000000000001;
    uint64_t v43 = v4;
    uint64_t v41 = MEMORY[0x263F8EE58] + 8;
    do
    {
      while (1)
      {
        sub_24C8A1AB0(v47, v48, v49, a1);
        char v27 = v26;
        uint64_t v28 = (uint64_t)v26 + *(void *)(v14 + 2176);
        swift_beginAccess();
        sub_24C89AB50(v28, (uint64_t)&v50);
        swift_dynamicCast();

        uint64_t v29 = v46;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24C8A1228(0, *(void *)(v29 + 16) + 1, 1);
          uint64_t v29 = v46;
        }
        unint64_t v31 = *(void *)(v29 + 16);
        unint64_t v30 = *(void *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          sub_24C8A1228(v30 > 1, v31 + 1, 1);
          uint64_t v29 = v46;
        }
        *(void *)(v29 + 16) = v31 + 1;
        uint64_t result = sub_24C8A2AA0((uint64_t)v4, v29+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v31, (uint64_t (*)(void))type metadata accessor for Group);
        if (v6) {
          break;
        }
        uint64_t v15 = v47;
        uint64_t v16 = v48;
        char v17 = v49;
        unint64_t v18 = v14;
        int64_t v19 = sub_24C8A19CC(v47, v48, v49, a1);
        uint64_t v20 = v2;
        uint64_t v22 = v21;
        char v24 = v23;
        sub_24C8A2904(v15, v16, v17);
        uint64_t v47 = v19;
        uint64_t v48 = v22;
        unint64_t v14 = v18;
        uint64_t v2 = v20;
        unint64_t v6 = v42;
        char v25 = v24 & 1;
        uint64_t v4 = v43;
        char v49 = v25;
        if (!--v7) {
          goto LABEL_22;
        }
      }
      if ((v49 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_24C8A77B8()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88A8);
      uint64_t v32 = (void (*)(long long *, void))sub_24C8A7748();
      sub_24C8A7828();
      v32(&v50, 0);
      --v7;
    }
    while (v7);
LABEL_22:
    sub_24C8A2904(v47, v48, v49);
    swift_bridgeObjectRelease();
    uint64_t v11 = v46;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

void DDUser.init()()
{
}

uint64_t DDUser.isEqual(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for User();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v15[-v7];
  uint64_t v9 = sub_24C89AA74(a1, (uint64_t)v17);
  if (!v18)
  {
    sub_24C89AADC((uint64_t)v17);
    goto LABEL_6;
  }
  type metadata accessor for DDUser(v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    char v13 = 0;
    return v13 & 1;
  }
  char v10 = v16;
  if (v16 == v1)
  {

    char v13 = 1;
  }
  else
  {
    uint64_t v11 = (uint64_t)v1 + OBJC_IVAR___DDUser__user;
    swift_beginAccess();
    sub_24C89AB50(v11, (uint64_t)v17);
    swift_dynamicCast();
    uint64_t v12 = (uint64_t)v10 + OBJC_IVAR___DDUser__user;
    swift_beginAccess();
    sub_24C89AB50(v12, (uint64_t)v17);
    swift_dynamicCast();
    char v13 = _s15DarwinDirectory4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v8, (uint64_t)v6);

    sub_24C8A2A40((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C8A2A40((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for User);
  }
  return v13 & 1;
}

uint64_t sub_24C89AA74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C89AADC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F8870);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DDUser(uint64_t a1)
{
  return sub_24C8A281C(a1, &qword_2697F8890);
}

uint64_t sub_24C89AB50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DDUser.hash.getter()
{
  uint64_t v1 = type metadata accessor for User();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0 + OBJC_IVAR___DDUser__user;
  swift_beginAccess();
  sub_24C89AB50(v4, (uint64_t)v7);
  swift_dynamicCast();
  sub_24C8A7908();
  User.hash(into:)(v7);
  uint64_t v5 = sub_24C8A7948();
  sub_24C8A2A40((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for User);
  return v5;
}

id sub_24C89AE18(void *a1, uint64_t a2, void (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  a3(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = v19 - v8 + 16;
  uint64_t v10 = sub_24C8A76B8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  char v13 = v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  uint64_t v14 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_24C89AB50(v14, (uint64_t)v19);
  id v15 = a1;
  swift_dynamicCast();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v9, v10);
  sub_24C8A2A40((uint64_t)v9, a5);

  uint64_t v16 = (void *)sub_24C8A7678();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);

  return v16;
}

uint64_t sub_24C89B010(void *a1, uint64_t a2, uint64_t (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  uint64_t v8 = a3(0);
  MEMORY[0x270FA5388]();
  uint64_t v10 = v16 - v9 + 16;
  uint64_t v11 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_24C89AB50(v11, (uint64_t)v16);
  id v12 = a1;
  swift_dynamicCast();
  uint64_t v13 = *(unsigned int *)&v10[*(int *)(v8 + 20)];
  sub_24C8A2A40((uint64_t)v10, a5);

  return v13;
}

void sub_24C89B13C(char *a1, uint64_t a2, int a3, uint64_t (*a4)(void), void *a5, uint64_t (*a6)(void))
{
  uint64_t v10 = a4(0);
  MEMORY[0x270FA5388]();
  id v12 = &v16[-v11];
  uint64_t v13 = &a1[*a5];
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v13, (uint64_t)&v17);
  uint64_t v14 = a1;
  swift_dynamicCast();
  *(_DWORD *)&v12[*(int *)(v10 + 20)] = a3;
  uint64_t v18 = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v17);
  sub_24C8A2AA0((uint64_t)v12, (uint64_t)boxed_opaque_existential_0, a6);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  sub_24C8A2960(&v17, v13);
  swift_endAccess();
}

id sub_24C89B2A8(void *a1, uint64_t a2, void (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  a3(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = v15 - v8 + 16;
  uint64_t v10 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_24C89AB50(v10, (uint64_t)v15);
  id v11 = a1;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C8A2A40((uint64_t)v9, a5);

  id v12 = (void *)sub_24C8A76D8();
  swift_bridgeObjectRelease();

  return v12;
}

uint64_t sub_24C89B41C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  uint64_t v10 = a3(0);
  MEMORY[0x270FA5388]();
  id v12 = &v17[-v11];
  uint64_t v13 = (_OWORD *)(v5 + *a4);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v13, (uint64_t)&v18);
  swift_dynamicCast();
  uint64_t v14 = &v12[*(int *)(v10 + 24)];
  void *v14 = a1;
  v14[1] = a2;
  swift_bridgeObjectRelease();
  uint64_t v19 = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v18);
  sub_24C8A2AA0((uint64_t)v12, (uint64_t)boxed_opaque_existential_0, a5);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  sub_24C8A2960(&v18, v13);
  return swift_endAccess();
}

id sub_24C89B590(void *a1, uint64_t a2, void (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  a3(0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = v15 - v8 + 16;
  uint64_t v10 = (uint64_t)a1 + *a4;
  swift_beginAccess();
  sub_24C89AB50(v10, (uint64_t)v15);
  id v11 = a1;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C8A2A40((uint64_t)v9, a5);

  id v12 = (void *)sub_24C8A76D8();
  swift_bridgeObjectRelease();

  return v12;
}

void sub_24C89B704(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v12 = sub_24C8A76E8();
  uint64_t v14 = v13;
  id v15 = a1;
  a7(v12, v14, a4, a5, a6);
}

uint64_t sub_24C89B7A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  uint64_t v10 = a3(0);
  MEMORY[0x270FA5388]();
  uint64_t v12 = &v17[-v11];
  uint64_t v13 = (_OWORD *)(v5 + *a4);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v13, (uint64_t)&v18);
  swift_dynamicCast();
  uint64_t v14 = &v12[*(int *)(v10 + 28)];
  void *v14 = a1;
  v14[1] = a2;
  swift_bridgeObjectRelease();
  uint64_t v19 = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v18);
  sub_24C8A2AA0((uint64_t)v12, (uint64_t)boxed_opaque_existential_0, a5);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  sub_24C8A2960(&v18, v13);
  return swift_endAccess();
}

uint64_t sub_24C89BA90(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = &v9[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unint64_t v6 = (_OWORD *)(v1 + OBJC_IVAR___DDGroup__group);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v6, (uint64_t)&v10);
  swift_dynamicCast();
  *(void *)&v5[*(int *)(v3 + 32)] = a1;
  swift_bridgeObjectRelease();
  uint64_t v11 = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v10);
  sub_24C8A2AA0((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  sub_24C8A2960(&v10, v6);
  return swift_endAccess();
}

id sub_24C89BBE4(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  type metadata accessor for DDGroup(v5);
  sub_24C8A28BC(&qword_2697F88A0, v6, (void (*)(uint64_t))type metadata accessor for DDGroup);
  uint64_t v7 = (void *)sub_24C8A7718();
  swift_bridgeObjectRelease();

  return v7;
}

uint64_t sub_24C89BC88()
{
  uint64_t v1 = type metadata accessor for Group();
  uint64_t v32 = *(void *)(v1 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  id v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v29 - v6;
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v31 = (uint64_t)&v29 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v12 = v0 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_24C89AB50(v12, (uint64_t)v35);
  swift_dynamicCast();
  uint64_t v33 = v1;
  uint64_t v13 = *(void *)&v11[*(int *)(v1 + 36)];
  uint64_t v14 = *(void *)(v13 + 16);
  unint64_t v15 = MEMORY[0x263F8EE78];
  if (v14)
  {
    uint64_t v29 = v11;
    v35[0] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_24C8A7898();
    uint64_t result = sub_24C8A192C(v13);
    int64_t v17 = result;
    int v19 = v18;
    char v21 = v20 & 1;
    uint64_t v30 = v13 + 56;
    while ((v17 & 0x8000000000000000) == 0 && v17 < 1 << *(unsigned char *)(v13 + 32))
    {
      if (((*(void *)(v30 + (((unint64_t)v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v17) & 1) == 0) {
        goto LABEL_11;
      }
      if (*(_DWORD *)(v13 + 36) != v19) {
        goto LABEL_12;
      }
      uint64_t v22 = v31;
      sub_24C8A29D8(*(void *)(v13 + 48) + *(void *)(v32 + 72) * v17, v31, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A2AA0(v22, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A29D8((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
      char v23 = (char *)objc_allocWithZone((Class)DDGroup);
      char v24 = (uint64_t *)&v23[OBJC_IVAR___DDGroup__group];
      v24[3] = v33;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v24);
      sub_24C8A29D8((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
      v34.receiver = v23;
      v34.super_class = (Class)DDGroup;
      objc_msgSendSuper2(&v34, sel_init);
      sub_24C8A2A40((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A2A40((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A7878();
      sub_24C8A78A8();
      sub_24C8A78B8();
      sub_24C8A7888();
      uint64_t result = sub_24C8A19CC(v17, v19, v21 & 1, v13);
      int64_t v17 = result;
      int v19 = v26;
      char v21 = v27 & 1;
      if (!--v14)
      {
        sub_24C8A2904(result, v26, v27 & 1);
        unint64_t v15 = v35[0];
        swift_bridgeObjectRelease();
        uint64_t v11 = v29;
        goto LABEL_9;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_9:
    sub_24C8A2A40((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Group);
    uint64_t v28 = sub_24C8A1F58(v15);
    swift_bridgeObjectRelease();
    return v28;
  }
  return result;
}

void sub_24C89C01C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  type metadata accessor for DDGroup((uint64_t)a1);
  sub_24C8A28BC(&qword_2697F88A0, v6, (void (*)(uint64_t))type metadata accessor for DDGroup);
  uint64_t v7 = sub_24C8A7728();
  id v8 = a1;
  a4(v7);
}

uint64_t sub_24C89C0D4(uint64_t a1)
{
  uint64_t v43 = type metadata accessor for Group();
  uint64_t v2 = *(void *)(v43 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v43);
  uint64_t v5 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v38 = (char *)v37 - v6;
  unint64_t v7 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = sub_24C8A77E8();
    if (v8) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v12 = MEMORY[0x263F8EE78];
LABEL_23:
    uint64_t v32 = sub_24C8A20C8(v12);
    swift_bridgeObjectRelease();
    uint64_t v33 = (_OWORD *)(v37[1] + OBJC_IVAR___DDGroup__group);
    swift_beginAccess();
    sub_24C89AB50((uint64_t)v33, (uint64_t)&v48);
    uint64_t v34 = (uint64_t)v38;
    uint64_t v35 = v43;
    swift_dynamicCast();
    *(void *)(v34 + *(int *)(v35 + 36)) = v32;
    swift_bridgeObjectRelease();
    uint64_t v49 = v35;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v48);
    sub_24C8A2AA0(v34, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
    swift_beginAccess();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v33);
    sub_24C8A2960(&v48, v33);
    return swift_endAccess();
  }
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v44 = MEMORY[0x263F8EE78];
  sub_24C8A1228(0, v8 & ~(v8 >> 63), 0);
  if (v7)
  {
    uint64_t result = sub_24C8A7798();
    char v11 = 1;
  }
  else
  {
    uint64_t result = sub_24C8A1D00(a1);
    char v11 = v13 & 1;
  }
  uint64_t v45 = result;
  uint64_t v46 = v10;
  char v47 = v11;
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0) {
      uint64_t v14 = a1;
    }
    uint64_t v42 = v14;
    unint64_t v40 = a1 & 0xC000000000000001;
    uint64_t v41 = v2;
    unint64_t v39 = v5;
    do
    {
      while (1)
      {
        sub_24C8A1AB0(v45, v46, v47, a1);
        uint64_t v26 = v25;
        uint64_t v27 = (uint64_t)v25 + OBJC_IVAR___DDGroup__group;
        swift_beginAccess();
        sub_24C89AB50(v27, (uint64_t)&v48);
        swift_dynamicCast();

        uint64_t v28 = v44;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24C8A1228(0, *(void *)(v28 + 16) + 1, 1);
          uint64_t v28 = v44;
        }
        unint64_t v30 = *(void *)(v28 + 16);
        unint64_t v29 = *(void *)(v28 + 24);
        if (v30 >= v29 >> 1)
        {
          sub_24C8A1228(v29 > 1, v30 + 1, 1);
          uint64_t v28 = v44;
        }
        *(void *)(v28 + 16) = v30 + 1;
        uint64_t result = sub_24C8A2AA0((uint64_t)v5, v28+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(void *)(v2 + 72) * v30, (uint64_t (*)(void))type metadata accessor for Group);
        if (v7) {
          break;
        }
        uint64_t v15 = v45;
        uint64_t v16 = v46;
        char v17 = v47;
        uint64_t v18 = a1;
        int64_t v19 = sub_24C8A19CC(v45, v46, v47, a1);
        uint64_t v21 = v20;
        char v23 = v22;
        char v24 = v17;
        uint64_t v2 = v41;
        sub_24C8A2904(v15, v16, v24);
        uint64_t v45 = v19;
        uint64_t v46 = v21;
        a1 = v18;
        uint64_t v5 = v39;
        unint64_t v7 = v40;
        char v47 = v23 & 1;
        if (!--v8) {
          goto LABEL_22;
        }
      }
      if ((v47 & 1) == 0) {
        goto LABEL_25;
      }
      if (sub_24C8A77B8()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88A8);
      uint64_t v31 = (void (*)(long long *, void))sub_24C8A7748();
      sub_24C8A7828();
      v31(&v48, 0);
      --v8;
    }
    while (v8);
LABEL_22:
    sub_24C8A2904(v45, v46, v47);
    swift_bridgeObjectRelease();
    uint64_t v12 = v44;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

id _sSo6DDUserC15DarwinDirectoryEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());

  return objc_msgSend(v0, sel_init);
}

void DDGroup.init()()
{
}

uint64_t DDGroup.isEqual(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Group();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v15[-v7];
  uint64_t v9 = sub_24C89AA74(a1, (uint64_t)v17);
  if (!v18)
  {
    sub_24C89AADC((uint64_t)v17);
    goto LABEL_6;
  }
  type metadata accessor for DDGroup(v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    char v13 = 0;
    return v13 & 1;
  }
  uint64_t v10 = v16;
  if (v16 == v1)
  {

    char v13 = 1;
  }
  else
  {
    uint64_t v11 = (uint64_t)v1 + OBJC_IVAR___DDGroup__group;
    swift_beginAccess();
    sub_24C89AB50(v11, (uint64_t)v17);
    swift_dynamicCast();
    uint64_t v12 = (uint64_t)v10 + OBJC_IVAR___DDGroup__group;
    swift_beginAccess();
    sub_24C89AB50(v12, (uint64_t)v17);
    swift_dynamicCast();
    char v13 = _s15DarwinDirectory5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v8, (uint64_t)v6);

    sub_24C8A2A40((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C8A2A40((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Group);
  }
  return v13 & 1;
}

uint64_t sub_24C89C9D4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_24C8A7778();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_24C89AADC((uint64_t)v10);
  return v8 & 1;
}

uint64_t DDGroup.hash.getter()
{
  uint64_t v1 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_24C89AB50(v4, (uint64_t)v9);
  swift_dynamicCast();
  sub_24C8A7908();
  sub_24C8A76B8();
  sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)&v3[*(int *)(v1 + 32)];
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v9, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)&v3[*(int *)(v1 + 36)];
  swift_bridgeObjectRetain();
  sub_24C8A15B4(v9, v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_24C8A7948();
  sub_24C8A2A40((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Group);
  return v7;
}

uint64_t sub_24C89CC94(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (int *)type metadata accessor for LibSystemUserRecord(0);
  uint64_t v6 = *((void *)v5 - 1);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = *v2;
  sub_24C8A7908();
  swift_bridgeObjectRetain();
  sub_24C8A2B70();
  uint64_t v13 = sub_24C8A7948();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v15 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    uint64_t v36 = v11;
    uint64_t v37 = a1;
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v6 + 72);
    while (1)
    {
      sub_24C8A29D8(*(void *)(v12 + 48) + v17 * v15, (uint64_t)v9, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a2)
      {
        BOOL v18 = *((void *)v9 + 1) == *(void *)(a2 + 8) && *((void *)v9 + 2) == *(void *)(a2 + 16);
        if (v18 || (sub_24C8A78E8()) && (sub_24C8A7688())
        {
          uint64_t v19 = v5[7];
          uint64_t v20 = *(void *)&v9[v19];
          uint64_t v21 = *(void *)&v9[v19 + 8];
          char v22 = (void *)(a2 + v19);
          BOOL v23 = v20 == *v22 && v21 == v22[1];
          if (v23 || (sub_24C8A78E8() & 1) != 0)
          {
            uint64_t v24 = v5[8];
            uint64_t v25 = *(void *)&v9[v24];
            uint64_t v26 = *(void *)&v9[v24 + 8];
            uint64_t v27 = (void *)(a2 + v24);
            BOOL v28 = v25 == *v27 && v26 == v27[1];
            if (v28 || (sub_24C8A78E8()) && *(_DWORD *)&v9[v5[9]] == *(_DWORD *)(a2 + v5[9]))
            {
              if ((uint64_t v29 = v5[10],
                    uint64_t v30 = *(void *)&v9[v29],
                    uint64_t v31 = *(void *)&v9[v29 + 8],
                    uint64_t v32 = (void *)(a2 + v29),
                    v30 == *v32)
                && v31 == v32[1]
                || (sub_24C8A78E8() & 1) != 0)
              {
                if (v9[v5[11]] == *(unsigned char *)(a2 + v5[11])) {
                  break;
                }
              }
            }
          }
        }
      }
      sub_24C8A2A40((uint64_t)v9, type metadata accessor for LibSystemUserRecord);
      unint64_t v15 = (v15 + 1) & v16;
      if (((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v11 = v36;
        a1 = v37;
        goto LABEL_29;
      }
    }
    sub_24C8A2A40((uint64_t)v9, type metadata accessor for LibSystemUserRecord);
    swift_bridgeObjectRelease();
    sub_24C8A2A40(a2, type metadata accessor for LibSystemUserRecord);
    sub_24C8A29D8(*(void *)(*v2 + 48) + v17 * v15, v37, type metadata accessor for LibSystemUserRecord);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_29:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24C8A29D8(a2, (uint64_t)v11, type metadata accessor for LibSystemUserRecord);
    uint64_t v38 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    sub_24C89ECBC((uint64_t)v11, v15, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v38;
    swift_bridgeObjectRelease();
    sub_24C8A2AA0(a2, a1, type metadata accessor for LibSystemUserRecord);
    return 1;
  }
}

uint64_t sub_24C89D02C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v25 = (uint64_t)&v23 - v11;
  uint64_t v12 = *v2;
  sub_24C8A7908();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  sub_24C8A76B8();
  sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v27 = *(int *)(v6 + 28);
  uint64_t v13 = *(void *)(a2 + v27);
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v28, v13);
  swift_bridgeObjectRelease();
  uint64_t v26 = *(int *)(v6 + 32);
  sub_24C8A7928();
  uint64_t v14 = sub_24C8A7948();
  uint64_t v15 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v16 = v14 & ~v15;
  if ((*(void *)(v12 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16))
  {
    BOOL v23 = v3;
    uint64_t v24 = a1;
    uint64_t v17 = ~v15;
    uint64_t v18 = *(void *)(v7 + 72);
    do
    {
      sub_24C8A29D8(*(void *)(v12 + 48) + v18 * v16, (uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v10 == *(_DWORD *)a2)
      {
        BOOL v19 = *((void *)v10 + 1) == *(void *)(a2 + 8) && *((void *)v10 + 2) == *(void *)(a2 + 16);
        if (v19 || (sub_24C8A78E8())
          && (sub_24C8A7688() & 1) != 0
          && (sub_24C8A3150(*(void *)&v10[*(int *)(v6 + 28)], *(void *)(a2 + v27)) & 1) != 0
          && v10[*(int *)(v6 + 32)] == *(unsigned char *)(a2 + v26))
        {
          sub_24C8A2A40((uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
          swift_bridgeObjectRelease();
          sub_24C8A2A40(a2, type metadata accessor for LibSystemGroupRecord);
          sub_24C8A29D8(*(void *)(*v23 + 48) + v18 * v16, v24, type metadata accessor for LibSystemGroupRecord);
          return 0;
        }
      }
      sub_24C8A2A40((uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
      unint64_t v16 = (v16 + 1) & v17;
    }
    while (((*(void *)(v12 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v16) & 1) != 0);
    swift_bridgeObjectRelease();
    uint64_t v3 = v23;
    a1 = v24;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v22 = v25;
  sub_24C8A29D8(a2, v25, type metadata accessor for LibSystemGroupRecord);
  v28[0] = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_24C89F02C(v22, v16, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v28[0];
  swift_bridgeObjectRelease();
  sub_24C8A2AA0(a2, a1, type metadata accessor for LibSystemGroupRecord);
  return 1;
}

uint64_t sub_24C89D404(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24C8A7908();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  uint64_t v8 = sub_24C8A7948();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24C8A78E8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24C8A78E8() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24C89F3CC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24C89D5B4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_24C8A77F8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for DDGroup(v10);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_24C8A77E8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v22 = sub_24C89D82C(v7, result + 1);
    uint64_t v28 = v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_24C89E544();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = v22;
      id v24 = v8;
    }
    sub_24C89EA54((uint64_t)v8, v23);
    *uint64_t v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_24C8A7758();
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      type metadata accessor for DDGroup(v12);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_24C8A7768();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v2 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_24C8A7768();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v2;
    uint64_t *v2 = 0x8000000000000000;
    id v8 = a2;
    sub_24C89F568((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_24C89D82C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88C8);
    uint64_t v2 = sub_24C8A7858();
    uint64_t v15 = v2;
    sub_24C8A77A8();
    uint64_t v3 = sub_24C8A7818();
    if (v3)
    {
      type metadata accessor for DDGroup(v3);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v15;
        if (*(void *)(v15 + 24) <= *(void *)(v15 + 16))
        {
          sub_24C89E544();
          uint64_t v2 = v15;
        }
        uint64_t result = sub_24C8A7758();
        uint64_t v5 = v2 + 56;
        uint64_t v6 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v7 = result & ~v6;
        unint64_t v8 = v7 >> 6;
        if (((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
        {
          unint64_t v9 = __clz(__rbit64((-1 << v7) & ~*(void *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v10 = 0;
          unint64_t v11 = (unint64_t)(63 - v6) >> 6;
          do
          {
            if (++v8 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v12 = v8 == v11;
            if (v8 == v11) {
              unint64_t v8 = 0;
            }
            v10 |= v12;
            uint64_t v13 = *(void *)(v5 + 8 * v8);
          }
          while (v13 == -1);
          unint64_t v9 = __clz(__rbit64(~v13)) + (v8 << 6);
        }
        *(void *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
        *(void *)(*(void *)(v2 + 48) + 8 * v9) = v14;
        ++*(void *)(v2 + 16);
      }
      while (sub_24C8A7818());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_24C89DA10()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v28 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88E0);
  uint64_t v6 = sub_24C8A7848();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v27 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    uint64_t v25 = v0;
    int64_t v26 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t v29 = v5;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v14 << 6);
      }
      else
      {
        int64_t v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        uint64_t v20 = v27;
        if (v19 >= v26) {
          goto LABEL_21;
        }
        unint64_t v21 = v27[v19];
        ++v14;
        if (!v21)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v26) {
            goto LABEL_21;
          }
          unint64_t v21 = v27[v14];
          if (!v21)
          {
            int64_t v22 = v19 + 2;
            if (v22 >= v26)
            {
LABEL_21:
              uint64_t v23 = v29;
              swift_release();
              uint64_t v24 = 1 << *(unsigned char *)(v23 + 32);
              if (v24 > 63) {
                bzero(v20, ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v20 = -1 << v24;
              }
              uint64_t v1 = v25;
              *(void *)(v23 + 16) = 0;
              break;
            }
            unint64_t v21 = v27[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v14 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_28;
                }
                if (v14 >= v26) {
                  goto LABEL_21;
                }
                unint64_t v21 = v27[v14];
                ++v22;
                if (v21) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v14 = v22;
          }
        }
LABEL_20:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v16 = __clz(__rbit64(v21)) + (v14 << 6);
      }
      uint64_t v17 = *(void *)(v28 + 72);
      sub_24C8A2AA0(*(void *)(v29 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
      sub_24C8A7908();
      sub_24C8A7938();
      swift_bridgeObjectRetain();
      sub_24C8A76F8();
      swift_bridgeObjectRelease();
      sub_24C8A76B8();
      sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
      sub_24C8A76C8();
      swift_bridgeObjectRetain();
      sub_24C8A76F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24C8A76F8();
      swift_bridgeObjectRelease();
      sub_24C8A7938();
      swift_bridgeObjectRetain();
      sub_24C8A76F8();
      swift_bridgeObjectRelease();
      sub_24C8A7928();
      sub_24C8A7948();
      unint64_t v18 = sub_24C8A7788();
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = sub_24C8A2AA0((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, type metadata accessor for LibSystemUserRecord);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24C89DE2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v36 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88D0);
  uint64_t v6 = sub_24C8A7848();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_37;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v35 = (void *)(v5 + 56);
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  uint64_t v33 = v0;
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v18 >= v34) {
      break;
    }
    int64_t v19 = v35;
    unint64_t v20 = v35[v18];
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v34) {
        goto LABEL_31;
      }
      unint64_t v20 = v35[v14];
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v34)
        {
LABEL_31:
          swift_release();
          uint64_t v1 = v33;
          goto LABEL_33;
        }
        unint64_t v20 = v35[v21];
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_39;
            }
            if (v14 >= v34) {
              goto LABEL_31;
            }
            unint64_t v20 = v35[v14];
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    uint64_t v22 = *(void *)(v36 + 72);
    sub_24C8A2AA0(*(void *)(v5 + 48) + v22 * v17, (uint64_t)v4, type metadata accessor for LibSystemGroupRecord);
    sub_24C8A7908();
    sub_24C8A7938();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    sub_24C8A76B8();
    sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
    sub_24C8A76C8();
    uint64_t v23 = *(void *)&v4[*(int *)(v2 + 28)];
    swift_bridgeObjectRetain();
    sub_24C8A141C((uint64_t)v37, v23);
    swift_bridgeObjectRelease();
    sub_24C8A7928();
    uint64_t result = sub_24C8A7948();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v25) & ~*(void *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v26);
      }
      while (v30 == -1);
      unint64_t v15 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_24C8A2AA0((uint64_t)v4, *(void *)(v7 + 48) + v15 * v22, type metadata accessor for LibSystemGroupRecord);
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v1 = v33;
  int64_t v19 = v35;
LABEL_33:
  uint64_t v31 = 1 << *(unsigned char *)(v5 + 32);
  if (v31 > 63) {
    bzero(v19, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v19 = -1 << v31;
  }
  *(void *)(v5 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_24C89E264()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88D8);
  uint64_t v3 = sub_24C8A7848();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_24C8A7908();
      sub_24C8A76F8();
      uint64_t result = sub_24C8A7948();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *uint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24C89E544()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88C8);
  uint64_t v3 = sub_24C8A7848();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
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
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_24C8A7758();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_24C89E7E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Group();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88B8);
  uint64_t v7 = sub_24C8A7848();
  if (*(void *)(v6 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
    int64_t v9 = (void *)(v6 + 56);
    uint64_t v10 = -1;
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    unint64_t v11 = v10 & *(void *)(v6 + 56);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v14 << 6);
      }
      else
      {
        int64_t v17 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_28:
          __break(1u);
          return result;
        }
        if (v17 >= v12) {
          goto LABEL_22;
        }
        unint64_t v18 = v9[v17];
        ++v14;
        if (!v18)
        {
          int64_t v14 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_22;
          }
          unint64_t v18 = v9[v14];
          if (!v18)
          {
            int64_t v14 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_22;
            }
            unint64_t v18 = v9[v14];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_22:
                swift_release();
                uint64_t v20 = 1 << *(unsigned char *)(v6 + 32);
                if (v20 > 63) {
                  bzero((void *)(v6 + 56), ((unint64_t)(v20 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v9 = -1 << v20;
                }
                *(void *)(v6 + 16) = 0;
                break;
              }
              unint64_t v18 = v9[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v14 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_28;
                  }
                  if (v14 >= v12) {
                    goto LABEL_22;
                  }
                  unint64_t v18 = v9[v14];
                  ++v19;
                  if (v18) {
                    goto LABEL_21;
                  }
                }
              }
              int64_t v14 = v19;
            }
          }
        }
LABEL_21:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }
      sub_24C8A2AA0(*(void *)(v6 + 48) + *(void *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Group);
      uint64_t result = sub_24C89EAD8((uint64_t)v5, v7);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

unint64_t sub_24C89EA54(uint64_t a1, uint64_t a2)
{
  sub_24C8A7758();
  unint64_t result = sub_24C8A7788();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24C89EAD8(uint64_t a1, uint64_t a2)
{
  sub_24C8A7908();
  sub_24C8A76B8();
  sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v4 = type metadata accessor for Group();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a1 + *(int *)(v4 + 32));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v9, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a1 + *(int *)(v4 + 36));
  swift_bridgeObjectRetain();
  sub_24C8A15B4(v9, v6);
  swift_bridgeObjectRelease();
  sub_24C8A7948();
  unint64_t v7 = sub_24C8A7788();
  *(void *)(a2 + 56 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v7;
  uint64_t result = sub_24C8A2AA0(a1, *(void *)(a2 + 48) + *(void *)(*(void *)(v4 - 8) + 72) * v7, (uint64_t (*)(void))type metadata accessor for Group);
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24C89ECBC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = (int *)type metadata accessor for LibSystemUserRecord(0);
  uint64_t v9 = *((void *)v8 - 1);
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0) {
    goto LABEL_34;
  }
  if (a3)
  {
    sub_24C89DA10();
  }
  else
  {
    if (v13 > v12)
    {
      sub_24C89FAD0(type metadata accessor for LibSystemUserRecord, &qword_2697F88E0, type metadata accessor for LibSystemUserRecord);
      goto LABEL_34;
    }
    sub_24C8A02EC();
  }
  uint64_t v14 = *v4;
  sub_24C8A7908();
  sub_24C8A2B70();
  uint64_t v15 = sub_24C8A7948();
  uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v9 + 72);
    do
    {
      sub_24C8A29D8(*(void *)(v14 + 48) + v18 * a2, (uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v11 == *(_DWORD *)a1)
      {
        BOOL v19 = *((void *)v11 + 1) == *(void *)(a1 + 8) && *((void *)v11 + 2) == *(void *)(a1 + 16);
        if (v19 || (sub_24C8A78E8()) && (sub_24C8A7688())
        {
          uint64_t v20 = v8[7];
          uint64_t v21 = *(void *)&v11[v20];
          uint64_t v22 = *(void *)&v11[v20 + 8];
          char v23 = (void *)(a1 + v20);
          BOOL v24 = v21 == *v23 && v22 == v23[1];
          if (v24 || (sub_24C8A78E8() & 1) != 0)
          {
            uint64_t v25 = v8[8];
            uint64_t v26 = *(void *)&v11[v25];
            uint64_t v27 = *(void *)&v11[v25 + 8];
            uint64_t v28 = (void *)(a1 + v25);
            BOOL v29 = v26 == *v28 && v27 == v28[1];
            if (v29 || (sub_24C8A78E8()) && *(_DWORD *)&v11[v8[9]] == *(_DWORD *)(a1 + v8[9]))
            {
              if ((uint64_t v30 = v8[10],
                    uint64_t v31 = *(void *)&v11[v30],
                    uint64_t v32 = *(void *)&v11[v30 + 8],
                    uint64_t v33 = (void *)(a1 + v30),
                    v31 == *v33)
                && v32 == v33[1]
                || (sub_24C8A78E8() & 1) != 0)
              {
                if (v11[v8[11]] == *(unsigned char *)(a1 + v8[11])) {
                  goto LABEL_37;
                }
              }
            }
          }
        }
      }
      sub_24C8A2A40((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      a2 = (a2 + 1) & v17;
    }
    while (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_34:
  uint64_t v34 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24C8A2AA0(a1, *(void *)(v34 + 48) + *(void *)(v9 + 72) * a2, type metadata accessor for LibSystemUserRecord);
  uint64_t v36 = *(void *)(v34 + 16);
  BOOL v37 = __OFADD__(v36, 1);
  uint64_t v38 = v36 + 1;
  if (!v37)
  {
    *(void *)(v34 + 16) = v38;
    return result;
  }
  __break(1u);
LABEL_37:
  sub_24C8A2A40((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
  uint64_t result = sub_24C8A78F8();
  __break(1u);
  return result;
}

uint64_t sub_24C89F02C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v7 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v27 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_21;
  }
  if (a3)
  {
    sub_24C89DE2C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_24C89FAD0(type metadata accessor for LibSystemGroupRecord, &qword_2697F88D0, type metadata accessor for LibSystemGroupRecord);
      goto LABEL_21;
    }
    sub_24C8A06D0();
  }
  uint64_t v12 = *v3;
  sub_24C8A7908();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  sub_24C8A76B8();
  sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v13 = *(int *)(v7 + 28);
  uint64_t v14 = *(void *)(a1 + v13);
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v28, v14);
  swift_bridgeObjectRelease();
  uint64_t v25 = *(int *)(v7 + 32);
  sub_24C8A7928();
  uint64_t v15 = sub_24C8A7948();
  uint64_t v16 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v27 + 72);
    while (1)
    {
      sub_24C8A29D8(*(void *)(v12 + 48) + v18 * a2, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a1)
      {
        BOOL v19 = *((void *)v9 + 1) == *(void *)(a1 + 8) && *((void *)v9 + 2) == *(void *)(a1 + 16);
        if (v19 || (sub_24C8A78E8())
          && (sub_24C8A7688() & 1) != 0
          && (sub_24C8A3150(*(void *)&v9[*(int *)(v7 + 28)], *(void *)(a1 + v13)) & 1) != 0
          && v9[*(int *)(v7 + 32)] == *(unsigned char *)(a1 + v25))
        {
          break;
        }
      }
      sub_24C8A2A40((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      a2 = (a2 + 1) & v17;
      if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_21;
      }
    }
    sub_24C8A2A40((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
    sub_24C8A78F8();
    __break(1u);
  }
LABEL_21:
  uint64_t v20 = *v26;
  *(void *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24C8A2AA0(a1, *(void *)(v20 + 48) + *(void *)(v27 + 72) * a2, type metadata accessor for LibSystemGroupRecord);
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

uint64_t sub_24C89F3CC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_24C89E264();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24C89FD1C();
      goto LABEL_22;
    }
    sub_24C8A0AC0();
  }
  uint64_t v11 = *v4;
  sub_24C8A7908();
  sub_24C8A76F8();
  uint64_t result = sub_24C8A7948();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24C8A78E8(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24C8A78F8();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_24C8A78E8();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void sub_24C89F568(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_24C89E544();
  }
  else
  {
    if (v7 > v6)
    {
      sub_24C89FED0();
      goto LABEL_14;
    }
    sub_24C8A0D70();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_24C8A7758();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for DDGroup(v9);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_24C8A7768();

    if (v12)
    {
LABEL_13:
      sub_24C8A78F8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_24C8A7768();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

uint64_t sub_24C89F6DC(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v7 = (int *)type metadata accessor for Group();
  uint64_t v8 = *((void *)v7 - 1);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  uint64_t v34 = v8;
  uint64_t v35 = v3;
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_26;
  }
  if (a3)
  {
    sub_24C89E7E4();
  }
  else
  {
    if (v12 > v11)
    {
      sub_24C8A007C();
      goto LABEL_26;
    }
    sub_24C8A0FEC();
  }
  uint64_t v13 = *v3;
  sub_24C8A7908();
  sub_24C8A76B8();
  sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v14 = v7[5];
  sub_24C8A7938();
  char v15 = (void *)(a1 + v7[6]);
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v33 = (void *)(a1 + v7[7]);
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v32 = v7[8];
  uint64_t v16 = *(void *)(a1 + v32);
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v36, v16);
  swift_bridgeObjectRelease();
  uint64_t v31 = v7[9];
  uint64_t v17 = *(void *)(a1 + v31);
  swift_bridgeObjectRetain();
  sub_24C8A15B4(v36, v17);
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_24C8A7948();
  uint64_t v19 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v18 & ~v19;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v20 = ~v19;
    uint64_t v21 = *(void *)(v8 + 72);
    while (1)
    {
      sub_24C8A29D8(*(void *)(v13 + 48) + v21 * a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
      if ((sub_24C8A7688() & 1) != 0 && *(_DWORD *)&v10[v7[5]] == *(_DWORD *)(a1 + v14))
      {
        uint64_t v22 = &v10[v7[6]];
        BOOL v23 = *(void *)v22 == *v15 && *((void *)v22 + 1) == v15[1];
        if (v23 || (sub_24C8A78E8() & 1) != 0)
        {
          uint64_t v24 = &v10[v7[7]];
          BOOL v25 = *(void *)v24 == *v33 && *((void *)v24 + 1) == v33[1];
          if (v25 || (sub_24C8A78E8())
            && (sub_24C8A3150(*(void *)&v10[v7[8]], *(void *)(a1 + v32)) & 1) != 0
            && (sub_24C8A33D8(*(void *)&v10[v7[9]], *(void *)(a1 + v31)) & 1) != 0)
          {
            break;
          }
        }
      }
      sub_24C8A2A40((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
      a2 = (a2 + 1) & v20;
      if (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_26;
      }
    }
    sub_24C8A2A40((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C8A78F8();
    __break(1u);
  }
LABEL_26:
  uint64_t v26 = *v35;
  *(void *)(*v35 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24C8A2AA0(a1, *(void *)(v26 + 48) + *(void *)(v34 + 72) * a2, (uint64_t (*)(void))type metadata accessor for Group);
  uint64_t v28 = *(void *)(v26 + 16);
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29) {
    __break(1u);
  }
  else {
    *(void *)(v26 + 16) = v30;
  }
  return result;
}

void *sub_24C89FAD0(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void))
{
  unint64_t v6 = v3;
  uint64_t v7 = a1(0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v29 - v9;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v11 = *v3;
  uint64_t v12 = sub_24C8A7838();
  uint64_t v13 = v12;
  if (!*(void *)(v11 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *unint64_t v6 = v13;
    return result;
  }
  uint64_t v30 = v6;
  uint64_t result = (void *)(v12 + 56);
  uint64_t v15 = v11 + 56;
  unint64_t v16 = (unint64_t)((1 << *(unsigned char *)(v13 + 32)) + 63) >> 6;
  if (v13 != v11 || (unint64_t)result >= v11 + 56 + 8 * v16) {
    uint64_t result = memmove(result, (const void *)(v11 + 56), 8 * v16);
  }
  int64_t v18 = 0;
  *(void *)(v13 + 16) = *(void *)(v11 + 16);
  uint64_t v19 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v20 = -1;
  if (v19 < 64) {
    uint64_t v20 = ~(-1 << v19);
  }
  unint64_t v21 = v20 & *(void *)(v11 + 56);
  int64_t v22 = (unint64_t)(v19 + 63) >> 6;
  while (1)
  {
    if (v21)
    {
      unint64_t v23 = __clz(__rbit64(v21));
      v21 &= v21 - 1;
      unint64_t v24 = v23 | (v18 << 6);
      goto LABEL_12;
    }
    int64_t v26 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v26 >= v22) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v15 + 8 * v26);
    ++v18;
    if (!v27)
    {
      int64_t v18 = v26 + 1;
      if (v26 + 1 >= v22) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v15 + 8 * v18);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v24 = __clz(__rbit64(v27)) + (v18 << 6);
LABEL_12:
    unint64_t v25 = *(void *)(v8 + 72) * v24;
    sub_24C8A29D8(*(void *)(v11 + 48) + v25, (uint64_t)v10, a3);
    uint64_t result = (void *)sub_24C8A2AA0((uint64_t)v10, *(void *)(v13 + 48) + v25, a3);
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v22)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    unint64_t v6 = v30;
    goto LABEL_28;
  }
  unint64_t v27 = *(void *)(v15 + 8 * v28);
  if (v27)
  {
    int64_t v18 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v18 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v18 >= v22) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v15 + 8 * v18);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_24C89FD1C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C8A7838();
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

id sub_24C89FED0()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C8A7838();
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
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
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

void *sub_24C8A007C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Group();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88B8);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24C8A7838();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  unint64_t v24 = v1;
  id result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    id result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_24C8A29D8(*(void *)(v6 + 48) + v19, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Group);
    id result = (void *)sub_24C8A2AA0((uint64_t)v5, *(void *)(v8 + 48) + v19, (uint64_t (*)(void))type metadata accessor for Group);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_27;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_24C8A02EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v25 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88E0);
  uint64_t v6 = sub_24C8A7848();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_23:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  int64_t v22 = v0;
  uint64_t v23 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v24 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t v26 = v5;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      goto LABEL_7;
    }
    int64_t v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v24) {
      goto LABEL_21;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v19);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v19 + 1;
      if (v19 + 1 >= v24) {
        goto LABEL_21;
      }
      unint64_t v20 = *(void *)(v23 + 8 * v14);
      if (!v20) {
        break;
      }
    }
LABEL_20:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_7:
    uint64_t v17 = *(void *)(v25 + 72);
    sub_24C8A29D8(*(void *)(v26 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
    sub_24C8A7908();
    sub_24C8A7938();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    sub_24C8A76B8();
    sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
    sub_24C8A76C8();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    sub_24C8A7938();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    sub_24C8A7928();
    sub_24C8A7948();
    unint64_t v18 = sub_24C8A7788();
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_24C8A2AA0((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, type metadata accessor for LibSystemUserRecord);
    ++*(void *)(v7 + 16);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v24)
  {
LABEL_21:
    uint64_t result = swift_release_n();
    uint64_t v1 = v22;
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v23 + 8 * v21);
  if (v20)
  {
    int64_t v14 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v14 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v14 >= v24) {
      goto LABEL_21;
    }
    unint64_t v20 = *(void *)(v23 + 8 * v14);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24C8A06D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v34 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88D0);
  uint64_t v6 = sub_24C8A7848();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_33:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v31 = v0;
  uint64_t v32 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v33 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    if (v18 >= v33) {
      goto LABEL_31;
    }
    unint64_t v19 = *(void *)(v32 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v33) {
        goto LABEL_31;
      }
      unint64_t v19 = *(void *)(v32 + 8 * v14);
      if (!v19) {
        break;
      }
    }
LABEL_21:
    unint64_t v11 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_22:
    uint64_t v21 = *(void *)(v34 + 72);
    sub_24C8A29D8(*(void *)(v5 + 48) + v21 * v17, (uint64_t)v4, type metadata accessor for LibSystemGroupRecord);
    sub_24C8A7908();
    sub_24C8A7938();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    sub_24C8A76B8();
    sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
    sub_24C8A76C8();
    uint64_t v22 = *(void *)&v4[*(int *)(v2 + 28)];
    swift_bridgeObjectRetain();
    sub_24C8A141C((uint64_t)v35, v22);
    swift_bridgeObjectRelease();
    sub_24C8A7928();
    uint64_t result = sub_24C8A7948();
    uint64_t v23 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t result = sub_24C8A2AA0((uint64_t)v4, *(void *)(v7 + 48) + v15 * v21, type metadata accessor for LibSystemGroupRecord);
    ++*(void *)(v7 + 16);
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v33)
  {
LABEL_31:
    uint64_t result = swift_release_n();
    uint64_t v1 = v31;
    goto LABEL_33;
  }
  unint64_t v19 = *(void *)(v32 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v33) {
      goto LABEL_31;
    }
    unint64_t v19 = *(void *)(v32 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_21;
    }
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_24C8A0AC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88D8);
  uint64_t v3 = sub_24C8A7848();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
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
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24C8A7908();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    uint64_t result = sub_24C8A7948();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *uint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24C8A0D70()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88C8);
  uint64_t v3 = sub_24C8A7848();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  BOOL v27 = v0;
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
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    id v19 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_24C8A7758();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24C8A0FEC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Group();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88B8);
  uint64_t v7 = sub_24C8A7848();
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_24:
    *uint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v9 = v6 + 56;
  uint64_t v10 = -1;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  unint64_t v11 = v10 & *(void *)(v6 + 56);
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v14 << 6);
      goto LABEL_6;
    }
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v12) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_22;
      }
      unint64_t v18 = *(void *)(v9 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_22;
        }
        unint64_t v18 = *(void *)(v9 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }
LABEL_21:
    unint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
LABEL_6:
    sub_24C8A29D8(*(void *)(v6 + 48) + *(void *)(v3 + 72) * v16, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for Group);
    uint64_t result = sub_24C89EAD8((uint64_t)v5, v7);
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_22:
    uint64_t result = swift_release_n();
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v12) {
      goto LABEL_22;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_21;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

size_t sub_24C8A1228(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_24C8A1248(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_24C8A1248(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F88C0);
  uint64_t v10 = *(void *)(type metadata accessor for Group() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for Group() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_24C8A141C(uint64_t a1, uint64_t a2)
{
  sub_24C8A7948();
  uint64_t v3 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1)) {
      goto LABEL_19;
    }
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_24C8A7918();
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    if (!v13) {
      break;
    }
LABEL_16:
    uint64_t v6 = (v13 - 1) & v13;
LABEL_5:
    sub_24C8A7908();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    uint64_t v11 = sub_24C8A7948();
    uint64_t result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  int64_t v14 = v10 + 1;
  if (v10 + 1 >= v7) {
    goto LABEL_17;
  }
  uint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v10 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v10 >= v7) {
      goto LABEL_17;
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    ++v14;
    if (v13) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_24C8A15B4(long long *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Group();
  uint64_t v31 = *(void *)(v4 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v30 - v8;
  uint64_t v10 = *((void *)a1 + 8);
  long long v11 = a1[1];
  long long v34 = *a1;
  long long v35 = v11;
  long long v12 = a1[2];
  long long v13 = a1[3];
  v30[1] = a1;
  long long v36 = v12;
  long long v37 = v13;
  uint64_t v38 = v10;
  v30[2] = sub_24C8A7948();
  uint64_t v14 = a2 + 56;
  uint64_t v15 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v16 = -1;
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  unint64_t v17 = v16 & *(void *)(a2 + 56);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  uint64_t v32 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v20 = 0;
  int64_t v21 = 0;
  while (1)
  {
    if (v17)
    {
      unint64_t v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v23 = v22 | (v21 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v21++, 1)) {
      goto LABEL_19;
    }
    if (v21 >= v18)
    {
LABEL_17:
      swift_release();
      return sub_24C8A7918();
    }
    unint64_t v28 = *(void *)(v14 + 8 * v21);
    if (!v28) {
      break;
    }
LABEL_16:
    unint64_t v17 = (v28 - 1) & v28;
    unint64_t v23 = __clz(__rbit64(v28)) + (v21 << 6);
LABEL_5:
    sub_24C8A29D8(*(void *)(v32 + 48) + *(void *)(v31 + 72) * v23, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C8A2AA0((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C8A7908();
    sub_24C8A76B8();
    sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
    sub_24C8A76C8();
    sub_24C8A7938();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    uint64_t v24 = *(void *)&v7[*(int *)(v4 + 32)];
    swift_bridgeObjectRetain();
    sub_24C8A141C((uint64_t)v33, v24);
    swift_bridgeObjectRelease();
    uint64_t v25 = *(void *)&v7[*(int *)(v4 + 36)];
    swift_bridgeObjectRetain();
    sub_24C8A15B4(v33, v25);
    swift_bridgeObjectRelease();
    uint64_t v26 = sub_24C8A7948();
    uint64_t result = sub_24C8A2A40((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for Group);
    v20 ^= v26;
  }
  int64_t v29 = v21 + 1;
  if (v21 + 1 >= v18) {
    goto LABEL_17;
  }
  unint64_t v28 = *(void *)(v14 + 8 * v29);
  if (v28)
  {
    ++v21;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v21 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v21 >= v18) {
      goto LABEL_17;
    }
    unint64_t v28 = *(void *)(v14 + 8 * v21);
    ++v29;
    if (v28) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_24C8A192C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
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

int64_t sub_24C8A19CC(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_24C8A1AB0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      uint64_t v17 = MEMORY[0x2532FED60](a1, a2, v7);
      type metadata accessor for DDGroup(v17);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_24C8A77C8() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v18 = sub_24C8A77D8();
  type metadata accessor for DDGroup(v18);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v19;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_24C8A7758();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_24C8A7768();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_24C8A7768();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  uint64_t v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v16 = v15;
}

uint64_t sub_24C8A1D00(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
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
  uint64_t v9 = (unint64_t *)(a1 + 72);
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

uint64_t sub_24C8A1D88(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for User();
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 64;
  uint64_t v6 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v6);
  unint64_t v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 64;
  uint64_t v9 = a1 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_24C89AB50(v9, (uint64_t)v14);
  swift_dynamicCast();
  unint64_t v10 = (_OWORD *)(v1 + OBJC_IVAR___DDUser__user);
  swift_beginAccess();
  sub_24C89AB50((uint64_t)v10, (uint64_t)v14);
  swift_dynamicCast();
  sub_24C8A2974((uint64_t)v8, (uint64_t)&v5[*(int *)(v3 + 32)]);
  uint64_t v15 = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
  sub_24C8A2AA0((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  sub_24C8A2960(v14, v10);
  return swift_endAccess();
}

uint64_t sub_24C8A1F58(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24C8A78D8();
    a1 = swift_bridgeObjectRelease();
  }
  type metadata accessor for DDGroup(a1);
  sub_24C8A28BC(&qword_2697F88A0, v3, (void (*)(uint64_t))type metadata accessor for DDGroup);
  uint64_t result = sub_24C8A7738();
  uint64_t v11 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_24C8A78D8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v5) {
      return v11;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5) {
      return v11;
    }
  }
  if (v5 >= 1)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = (void *)MEMORY[0x2532FEDC0](i, v1);
        sub_24C89D5B4(&v10, v7);
      }
    }
    else
    {
      unint64_t v8 = (void **)(v1 + 32);
      do
      {
        uint64_t v9 = *v8++;
        sub_24C89D5B4(&v10, v9);

        --v5;
      }
      while (v5);
    }
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C8A20C8(uint64_t a1)
{
  unint64_t v2 = (int *)type metadata accessor for Group();
  uint64_t v3 = *((void *)v2 - 1);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v31 = (uint64_t)&v31 - v8;
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v31 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  sub_24C8A28BC(&qword_2697F88B0, 255, (void (*)(uint64_t))type metadata accessor for Group);
  uint64_t v12 = sub_24C8A7738();
  uint64_t v33 = v11;
  if (v11)
  {
    uint64_t v13 = 0;
    uint64_t v32 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v14 = *(void *)(v3 + 72);
    do
    {
      sub_24C8A29D8(v32 + v14 * v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C8A7908();
      sub_24C8A76B8();
      sub_24C8A28BC(&qword_2697F8888, 255, MEMORY[0x263F07508]);
      swift_bridgeObjectRetain();
      sub_24C8A76C8();
      uint64_t v15 = v2[5];
      sub_24C8A7938();
      id v16 = &v10[v2[6]];
      swift_bridgeObjectRetain();
      sub_24C8A76F8();
      swift_bridgeObjectRelease();
      long long v37 = &v10[v2[7]];
      swift_bridgeObjectRetain();
      sub_24C8A76F8();
      swift_bridgeObjectRelease();
      uint64_t v36 = v2[8];
      uint64_t v17 = *(void *)&v10[v36];
      swift_bridgeObjectRetain();
      sub_24C8A141C((uint64_t)v38, v17);
      swift_bridgeObjectRelease();
      uint64_t v35 = v2[9];
      uint64_t v18 = *(void *)&v10[v35];
      swift_bridgeObjectRetain();
      sub_24C8A15B4(v38, v18);
      swift_bridgeObjectRelease();
      uint64_t v19 = sub_24C8A7948();
      uint64_t v20 = -1 << *(unsigned char *)(v12 + 32);
      unint64_t v21 = v19 & ~v20;
      uint64_t v22 = *(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21;
      uint64_t v34 = v13;
      if (v22)
      {
        uint64_t v23 = ~v20;
        while (1)
        {
          sub_24C8A29D8(*(void *)(v12 + 48) + v21 * v14, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
          if ((sub_24C8A7688() & 1) != 0 && *(_DWORD *)&v6[v2[5]] == *(_DWORD *)&v10[v15])
          {
            uint64_t v24 = &v6[v2[6]];
            BOOL v25 = *(void *)v24 == *(void *)v16 && *((void *)v24 + 1) == *((void *)v16 + 1);
            if (v25 || (sub_24C8A78E8() & 1) != 0)
            {
              uint64_t v26 = &v6[v2[7]];
              BOOL v27 = *(void *)v26 == *(void *)v37 && *((void *)v26 + 1) == *((void *)v37 + 1);
              if (v27 || (sub_24C8A78E8())
                && (sub_24C8A3150(*(void *)&v6[v2[8]], *(void *)&v10[v36]) & 1) != 0
                && (sub_24C8A33D8(*(void *)&v6[v2[9]], *(void *)&v10[v35]) & 1) != 0)
              {
                break;
              }
            }
          }
          sub_24C8A2A40((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
          unint64_t v21 = (v21 + 1) & v23;
          if (((*(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
            goto LABEL_21;
          }
        }
        sub_24C8A2A40((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
      }
      else
      {
LABEL_21:
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v29 = v31;
        sub_24C8A29D8((uint64_t)v10, v31, (uint64_t (*)(void))type metadata accessor for Group);
        *(void *)&v38[0] = v12;
        sub_24C89F6DC(v29, v21, isUniquelyReferenced_nonNull_native);
        uint64_t v12 = *(void *)&v38[0];
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = v34 + 1;
      sub_24C8A2A40((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
    }
    while (v13 != v33);
  }
  return v12;
}

id sub_24C8A2584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (int *)type metadata accessor for User();
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a5 + OBJC_IVAR___DDGroup__group;
  swift_beginAccess();
  sub_24C89AB50(v16, (uint64_t)v29);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_dynamicCast();
  uint64_t v17 = &v15[v13[9]];
  *(void *)uint64_t v17 = 0x706D652F7261762FLL;
  *((void *)v17 + 1) = 0xEA00000000007974;
  uint64_t v18 = &v15[v13[10]];
  strcpy(v18, "/usr/bin/false");
  v18[15] = -18;
  uint64_t v19 = MEMORY[0x263F8EE88];
  *(void *)&v15[v13[11]] = MEMORY[0x263F8EE88];
  *(void *)&v15[v13[12]] = v19;
  sub_24C8A76A8();
  *(_DWORD *)&v15[v13[5]] = sub_24C8987A4();
  uint64_t v20 = &v15[v13[6]];
  *(void *)uint64_t v20 = a1;
  *((void *)v20 + 1) = a2;
  unint64_t v21 = &v15[v13[7]];
  *(void *)unint64_t v21 = a3;
  *((void *)v21 + 1) = a4;
  sub_24C8A2AA0((uint64_t)v12, (uint64_t)&v15[v13[8]], (uint64_t (*)(void))type metadata accessor for Group);
  uint64_t v22 = (char *)objc_allocWithZone((Class)DDUser);
  uint64_t v23 = (uint64_t *)&v22[OBJC_IVAR___DDUser__user];
  v23[3] = (uint64_t)v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v23);
  sub_24C8A29D8((uint64_t)v15, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
  v28.receiver = v22;
  v28.super_class = (Class)DDUser;
  id v25 = objc_msgSendSuper2(&v28, sel_init);
  sub_24C8A2A40((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for User);
  return v25;
}

uint64_t type metadata accessor for DDGroup(uint64_t a1)
{
  return sub_24C8A281C(a1, &qword_2697F8898);
}

uint64_t sub_24C8A281C(uint64_t a1, unint64_t *a2)
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

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24C8A28BC(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24C8A2904(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
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

_OWORD *sub_24C8A2960(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24C8A2974(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C8A29D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C8A2A40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C8A2AA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C8A2B08()
{
  return sub_24C8A30B0(&qword_2697F88E8, (void (*)(uint64_t))type metadata accessor for LibSystemGroupRecord);
}

uint64_t type metadata accessor for LibSystemGroupRecord(uint64_t a1)
{
  return sub_24C8A3118(a1, (uint64_t *)&unk_2697F8908);
}

uint64_t sub_24C8A2B70()
{
  return sub_24C8A7928();
}

uint64_t sub_24C8A2CDC()
{
  return sub_24C8A7948();
}

uint64_t sub_24C8A2D20()
{
  return sub_24C8A7948();
}

uint64_t sub_24C8A2D5C()
{
  sub_24C8A7908();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v1 = type metadata accessor for LibSystemGroupRecord(0);
  sub_24C8A76B8();
  sub_24C8A30B0(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v2 = *(void *)(v0 + *(int *)(v1 + 28));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_24C8A7928();
  return sub_24C8A7948();
}

uint64_t sub_24C8A2E70(uint64_t a1, uint64_t a2)
{
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  sub_24C8A76B8();
  sub_24C8A30B0(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_24C8A141C(a1, v5);
  swift_bridgeObjectRelease();
  return sub_24C8A7928();
}

uint64_t sub_24C8A2F64(uint64_t a1, uint64_t a2)
{
  sub_24C8A7908();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  sub_24C8A76B8();
  sub_24C8A30B0(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  sub_24C8A7928();
  return sub_24C8A7948();
}

uint64_t sub_24C8A3068()
{
  return sub_24C8A30B0(&qword_2697F88F0, (void (*)(uint64_t))type metadata accessor for LibSystemUserRecord);
}

uint64_t sub_24C8A30B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t type metadata accessor for LibSystemUserRecord(uint64_t a1)
{
  return sub_24C8A3118(a1, (uint64_t *)&unk_2697F88F8);
}

uint64_t sub_24C8A3118(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C8A3150(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_24C8A7908();
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    uint64_t v18 = sub_24C8A7948();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_24C8A78E8() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        uint64_t v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_24C8A78E8() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 4;
  if (v3 + 4 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_23;
    }
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_24C8A33D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for Group();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  int64_t v10 = (char *)&v40 - v9;
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v40 - v13;
  if (a1 == a2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v15 = 0;
  uint64_t v16 = a1 + 56;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & *(void *)(a1 + 56);
  int64_t v20 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v21 = a2 + 56;
  uint64_t v43 = v12;
  uint64_t v44 = a1;
  uint64_t v41 = a1 + 56;
  uint64_t v42 = v14;
  int64_t v40 = v20;
  if (!v19) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v45 = (v19 - 1) & v19;
  int64_t v46 = v15;
  for (unint64_t i = __clz(__rbit64(v19)) | (v15 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    uint64_t v27 = *(void *)(v12 + 72);
    sub_24C8A3A9C(*(void *)(a1 + 48) + v27 * i, (uint64_t)v14);
    sub_24C8A3B00((uint64_t)v14, (uint64_t)v10);
    sub_24C8A7908();
    sub_24C8A76B8();
    sub_24C8A30B0(&qword_2697F8888, MEMORY[0x263F07508]);
    sub_24C8A76C8();
    uint64_t v28 = v4[5];
    sub_24C8A7938();
    uint64_t v29 = &v10[v4[6]];
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    uint64_t v49 = &v10[v4[7]];
    swift_bridgeObjectRetain();
    sub_24C8A76F8();
    swift_bridgeObjectRelease();
    uint64_t v48 = v4[8];
    uint64_t v30 = *(void *)&v10[v48];
    swift_bridgeObjectRetain();
    sub_24C8A141C((uint64_t)v50, v30);
    swift_bridgeObjectRelease();
    uint64_t v47 = v4[9];
    uint64_t v31 = *(void *)&v10[v47];
    swift_bridgeObjectRetain();
    sub_24C8A15B4(v50, v31);
    swift_bridgeObjectRelease();
    uint64_t v32 = sub_24C8A7948();
    uint64_t v33 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v34 = v32 & ~v33;
    if (((*(void *)(v21 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0)
    {
LABEL_42:
      sub_24C8A3B64((uint64_t)v10);
      return 0;
    }
    uint64_t v35 = ~v33;
    while (1)
    {
      sub_24C8A3A9C(*(void *)(a2 + 48) + v34 * v27, (uint64_t)v7);
      if ((sub_24C8A7688() & 1) != 0 && *(_DWORD *)&v7[v4[5]] == *(_DWORD *)&v10[v28])
      {
        uint64_t v36 = &v7[v4[6]];
        BOOL v37 = *(void *)v36 == *(void *)v29 && *((void *)v36 + 1) == *((void *)v29 + 1);
        if (v37 || (sub_24C8A78E8() & 1) != 0)
        {
          uint64_t v38 = &v7[v4[7]];
          BOOL v39 = *(void *)v38 == *(void *)v49 && *((void *)v38 + 1) == *((void *)v49 + 1);
          if (v39 || (sub_24C8A78E8())
            && (sub_24C8A3150(*(void *)&v7[v4[8]], *(void *)&v10[v48]) & 1) != 0
            && (sub_24C8A33D8(*(void *)&v7[v4[9]], *(void *)&v10[v47]) & 1) != 0)
          {
            break;
          }
        }
      }
      sub_24C8A3B64((uint64_t)v7);
      unint64_t v34 = (v34 + 1) & v35;
      if (((*(void *)(v21 + ((v34 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v34) & 1) == 0) {
        goto LABEL_42;
      }
    }
    sub_24C8A3B64((uint64_t)v7);
    uint64_t result = sub_24C8A3B64((uint64_t)v10);
    uint64_t v12 = v43;
    a1 = v44;
    uint64_t v16 = v41;
    uint64_t v14 = v42;
    int64_t v20 = v40;
    unint64_t v19 = v45;
    int64_t v15 = v46;
    if (v45) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v23 >= v20) {
      return 1;
    }
    unint64_t v24 = *(void *)(v16 + 8 * v23);
    int64_t v25 = v15 + 1;
    if (!v24)
    {
      int64_t v25 = v15 + 2;
      if (v15 + 2 >= v20) {
        return 1;
      }
      unint64_t v24 = *(void *)(v16 + 8 * v25);
      if (!v24)
      {
        int64_t v25 = v15 + 3;
        if (v15 + 3 >= v20) {
          return 1;
        }
        unint64_t v24 = *(void *)(v16 + 8 * v25);
        if (!v24) {
          break;
        }
      }
    }
LABEL_21:
    uint64_t v45 = (v24 - 1) & v24;
    int64_t v46 = v25;
  }
  uint64_t v26 = v15 + 4;
  if (v15 + 4 >= v20) {
    return 1;
  }
  unint64_t v24 = *(void *)(v16 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v15 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v25 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v25 >= v20) {
      return 1;
    }
    unint64_t v24 = *(void *)(v16 + 8 * v25);
    ++v26;
    if (v24) {
      goto LABEL_21;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_24C8A3888(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    goto LABEL_23;
  }
  if (*(void *)(a1 + 8) != *(void *)(a2 + 8) || *(void *)(a1 + 16) != *(void *)(a2 + 16))
  {
    char v5 = sub_24C8A78E8();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  uint64_t v7 = (int *)type metadata accessor for LibSystemUserRecord(0);
  if ((sub_24C8A7688() & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v8 = v7[7];
  uint64_t v9 = *(void *)(a1 + v8);
  uint64_t v10 = *(void *)(a1 + v8 + 8);
  unint64_t v11 = (void *)(a2 + v8);
  if (v9 != *v11 || v10 != v11[1])
  {
    char v13 = sub_24C8A78E8();
    char v6 = 0;
    if ((v13 & 1) == 0) {
      return v6 & 1;
    }
  }
  uint64_t v14 = v7[8];
  uint64_t v15 = *(void *)(a1 + v14);
  uint64_t v16 = *(void *)(a1 + v14 + 8);
  uint64_t v17 = (void *)(a2 + v14);
  if (v15 != *v17 || v16 != v17[1])
  {
    char v19 = sub_24C8A78E8();
    char v6 = 0;
    if ((v19 & 1) == 0) {
      return v6 & 1;
    }
  }
  if (*(_DWORD *)(a1 + v7[9]) != *(_DWORD *)(a2 + v7[9]))
  {
LABEL_23:
    char v6 = 0;
    return v6 & 1;
  }
  uint64_t v20 = v7[10];
  uint64_t v21 = *(void *)(a1 + v20);
  uint64_t v22 = *(void *)(a1 + v20 + 8);
  int64_t v23 = (void *)(a2 + v20);
  if (v21 == *v23 && v22 == v23[1] || (char v24 = sub_24C8A78E8(), v6 = 0, (v24 & 1) != 0)) {
    char v6 = *(unsigned char *)(a1 + v7[11]) ^ *(unsigned char *)(a2 + v7[11]) ^ 1;
  }
  return v6 & 1;
}

uint64_t sub_24C8A39DC(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    goto LABEL_10;
  }
  BOOL v4 = *(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  if (v4 || (v5 = sub_24C8A78E8(), char v6 = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = type metadata accessor for LibSystemGroupRecord(0);
    if ((sub_24C8A7688() & 1) != 0
      && (sub_24C8A3150(*(void *)(a1 + *(int *)(v7 + 28)), *(void *)(a2 + *(int *)(v7 + 28))) & 1) != 0)
    {
      char v6 = *(unsigned char *)(a1 + *(int *)(v7 + 32)) ^ *(unsigned char *)(a2 + *(int *)(v7 + 32)) ^ 1;
      return v6 & 1;
    }
LABEL_10:
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_24C8A3A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C8A3B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C8A3B64(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Group();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_24C8A3BC0(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v25 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v25 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24C8A76B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    uint64_t v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (void *)((char *)v4 + v14);
    char v19 = (void *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[10];
    *(_DWORD *)((char *)v4 + a3[9]) = *(_DWORD *)((char *)a2 + a3[9]);
    uint64_t v22 = (void *)((char *)v4 + v21);
    int64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    *((unsigned char *)v4 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24C8A3D20(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8A3DD0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C8A76B8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  uint64_t v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24C8A3EE0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  void *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_24C8A4028(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  uint64_t v11 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_24C8A40F0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  void *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *uint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_24C8A41F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_24C8A420C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_24C8A4224()
{
  uint64_t result = sub_24C8A76B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24C8A42E0(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a3[6];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_24C8A76B8();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    *(void *)((char *)v4 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *((unsigned char *)v4 + v13) = *((unsigned char *)a2 + v13);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24C8A43F8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8A4484(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C8A76B8();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24C8A454C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_24C8A4620(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  return a1;
}

uint64_t sub_24C8A46C8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_24C8A4784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C8A4798);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24C8A76B8();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24C8A484C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C8A4860);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24C8A76B8();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24C8A490C()
{
  uint64_t result = sub_24C8A76B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t Group.init(name:fullName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = (int *)type metadata accessor for Group();
  uint64_t v11 = MEMORY[0x263F8EE88];
  *(void *)(a5 + v10[8]) = MEMORY[0x263F8EE88];
  *(void *)(a5 + v10[9]) = v11;
  sub_24C8A76A8();
  uint64_t result = sub_24C8989E0();
  *(_DWORD *)(a5 + v10[5]) = result;
  uint64_t v13 = (void *)(a5 + v10[6]);
  *uint64_t v13 = a1;
  v13[1] = a2;
  uint64_t v14 = (void *)(a5 + v10[7]);
  void *v14 = a3;
  v14[1] = a4;
  return result;
}

uint64_t type metadata accessor for Group()
{
  uint64_t result = qword_2697F8920;
  if (!qword_2697F8920) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Group.hashValue.getter()
{
  uint64_t v1 = v0;
  sub_24C8A7908();
  sub_24C8A76B8();
  sub_24C8A53EC(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v2 = type metadata accessor for Group();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v0 + *(int *)(v2 + 32));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v6, v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v1 + *(int *)(v2 + 36));
  swift_bridgeObjectRetain();
  sub_24C8A15B4(v6, v4);
  swift_bridgeObjectRelease();
  return sub_24C8A7948();
}

uint64_t Group.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24C8A76B8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t Group.gid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for Group() + 20));
}

uint64_t Group.gid.setter(int a1)
{
  uint64_t result = type metadata accessor for Group();
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*Group.gid.modify())()
{
  return nullsub_1;
}

uint64_t Group.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for Group() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.name.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for Group() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Group.name.modify())()
{
  return nullsub_1;
}

uint64_t Group.fullName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for Group() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for Group() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Group.fullName.modify())()
{
  return nullsub_1;
}

uint64_t Group.aliases.getter()
{
  type metadata accessor for Group();

  return swift_bridgeObjectRetain();
}

uint64_t Group.aliases.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for Group() + 32);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.aliases.modify())()
{
  return nullsub_1;
}

uint64_t Group.nestedGroups.getter()
{
  type metadata accessor for Group();

  return swift_bridgeObjectRetain();
}

uint64_t Group.nestedGroups.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for Group() + 36);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.nestedGroups.modify())()
{
  return nullsub_1;
}

uint64_t Group.hash(into:)(long long *a1)
{
  uint64_t v2 = v1;
  sub_24C8A76B8();
  sub_24C8A53EC(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v4 = type metadata accessor for Group();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v1 + *(int *)(v4 + 32));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)a1, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v2 + *(int *)(v4 + 36));
  swift_bridgeObjectRetain();
  sub_24C8A15B4(a1, v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8A516C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  sub_24C8A7908();
  sub_24C8A76B8();
  sub_24C8A53EC(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 32));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)v8, v5);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v4 + *(int *)(a2 + 36));
  swift_bridgeObjectRetain();
  sub_24C8A15B4(v8, v6);
  swift_bridgeObjectRelease();
  return sub_24C8A7948();
}

uint64_t _s15DarwinDirectory5GroupV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_24C8A7688() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for Group();
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = (int *)v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (!v10 && (sub_24C8A78E8() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = v5[7];
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a1 + v11 + 8);
  uint64_t v14 = (void *)(a2 + v11);
  BOOL v15 = v12 == *v14 && v13 == v14[1];
  if (!v15 && (sub_24C8A78E8() & 1) == 0 || (sub_24C8A3150(*(void *)(a1 + v5[8]), *(void *)(a2 + v5[8])) & 1) == 0) {
    return 0;
  }
  uint64_t v16 = v5[9];
  uint64_t v17 = *(void *)(a1 + v16);
  uint64_t v18 = *(void *)(a2 + v16);

  return sub_24C8A33D8(v17, v18);
}

uint64_t sub_24C8A53A4()
{
  return sub_24C8A53EC(&qword_2697F8918, (void (*)(uint64_t))type metadata accessor for Group);
}

uint64_t sub_24C8A53EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for Group(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C8A76B8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    BOOL v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = a3[8];
    uint64_t v14 = (uint64_t *)((char *)a1 + v12);
    BOOL v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Group(uint64_t a1)
{
  uint64_t v2 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a3[8];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C8A5970);
}

uint64_t sub_24C8A5970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8A76B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for Group(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C8A5A48);
}

uint64_t sub_24C8A5A48(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C8A76B8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24C8A5B08()
{
  uint64_t result = sub_24C8A76B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t User.init(name:fullName:primaryGroup:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12 = (int *)type metadata accessor for User();
  uint64_t v13 = (void *)(a6 + v12[9]);
  *uint64_t v13 = 0x706D652F7261762FLL;
  v13[1] = 0xEA00000000007974;
  uint64_t v14 = (char *)(a6 + v12[10]);
  strcpy(v14, "/usr/bin/false");
  v14[15] = -18;
  uint64_t v15 = MEMORY[0x263F8EE88];
  *(void *)(a6 + v12[11]) = MEMORY[0x263F8EE88];
  *(void *)(a6 + v12[12]) = v15;
  sub_24C8A76A8();
  *(_DWORD *)(a6 + v12[5]) = sub_24C8987A4();
  uint64_t v16 = (void *)(a6 + v12[6]);
  void *v16 = a1;
  v16[1] = a2;
  uint64_t v17 = (void *)(a6 + v12[7]);
  void *v17 = a3;
  v17[1] = a4;
  uint64_t v18 = a6 + v12[8];

  return sub_24C8A3B00(a5, v18);
}

uint64_t type metadata accessor for User()
{
  uint64_t result = qword_2697F8938;
  if (!qword_2697F8938) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t User.hashValue.getter()
{
  sub_24C8A7908();
  User.hash(into:)(v1);
  return sub_24C8A7948();
}

uint64_t User.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24C8A76B8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t User.uid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User() + 20));
}

uint64_t User.uid.setter(int a1)
{
  uint64_t result = type metadata accessor for User();
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*User.uid.modify())()
{
  return nullsub_1;
}

uint64_t User.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.name.setter(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)(v2 + *(int *)(type metadata accessor for User() + 24));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.name.modify())()
{
  return nullsub_1;
}

uint64_t User.fullName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.fullName.setter(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)(v2 + *(int *)(type metadata accessor for User() + 28));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.fullName.modify())()
{
  return nullsub_1;
}

uint64_t User.primaryGroup.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for User() + 32);

  return sub_24C8A3A9C(v3, a1);
}

uint64_t User.primaryGroup.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for User() + 32);

  return sub_24C8A2974(a1, v3);
}

uint64_t (*User.primaryGroup.modify())()
{
  return nullsub_1;
}

uint64_t User.homeDirectory.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.homeDirectory.setter(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)(v2 + *(int *)(type metadata accessor for User() + 36));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.homeDirectory.modify())()
{
  return nullsub_1;
}

uint64_t User.shell.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.shell.setter(uint64_t a1, uint64_t a2)
{
  int v5 = (void *)(v2 + *(int *)(type metadata accessor for User() + 40));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.shell.modify())()
{
  return nullsub_1;
}

uint64_t User.memberships.getter()
{
  type metadata accessor for User();

  return swift_bridgeObjectRetain();
}

uint64_t User.memberships.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for User() + 44);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.memberships.modify())()
{
  return nullsub_1;
}

uint64_t User.aliases.getter()
{
  type metadata accessor for User();

  return swift_bridgeObjectRetain();
}

uint64_t User.aliases.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for User() + 48);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.aliases.modify())()
{
  return nullsub_1;
}

uint64_t User.hash(into:)(long long *a1)
{
  uint64_t v2 = v1;
  sub_24C8A76B8();
  sub_24C8A6894(&qword_2697F8888, MEMORY[0x263F07508]);
  sub_24C8A76C8();
  uint64_t v4 = (int *)type metadata accessor for User();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v5 = v1 + v4[8];
  sub_24C8A76C8();
  uint64_t v6 = type metadata accessor for Group();
  sub_24C8A7938();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v5 + *(int *)(v6 + 32));
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)a1, v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(v5 + *(int *)(v6 + 36));
  swift_bridgeObjectRetain();
  sub_24C8A15B4(a1, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C8A76F8();
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(v2 + v4[11]);
  swift_bridgeObjectRetain();
  sub_24C8A15B4(a1, v9);
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(v2 + v4[12]);
  swift_bridgeObjectRetain();
  sub_24C8A141C((uint64_t)a1, v10);

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C8A6668()
{
  sub_24C8A7908();
  User.hash(into:)(v1);
  return sub_24C8A7948();
}

uint64_t sub_24C8A66AC()
{
  sub_24C8A7908();
  User.hash(into:)(v1);
  return sub_24C8A7948();
}

uint64_t _s15DarwinDirectory4UserV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_24C8A7688() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for User();
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = (int *)v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (!v10 && (sub_24C8A78E8() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = v5[7];
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a1 + v11 + 8);
  uint64_t v14 = (void *)(a2 + v11);
  BOOL v15 = v12 == *v14 && v13 == v14[1];
  if (!v15 && (sub_24C8A78E8() & 1) == 0) {
    return 0;
  }
  if ((_s15DarwinDirectory5GroupV2eeoiySbAC_ACtFZ_0(a1 + v5[8], a2 + v5[8]) & 1) == 0) {
    return 0;
  }
  uint64_t v16 = v5[9];
  uint64_t v17 = *(void *)(a1 + v16);
  uint64_t v18 = *(void *)(a1 + v16 + 8);
  uint64_t v19 = (void *)(a2 + v16);
  BOOL v20 = v17 == *v19 && v18 == v19[1];
  if (!v20 && (sub_24C8A78E8() & 1) == 0) {
    return 0;
  }
  uint64_t v21 = v5[10];
  uint64_t v22 = *(void *)(a1 + v21);
  uint64_t v23 = *(void *)(a1 + v21 + 8);
  uint64_t v24 = (void *)(a2 + v21);
  if ((v22 != *v24 || v23 != v24[1]) && (sub_24C8A78E8() & 1) == 0) {
    return 0;
  }
  if ((sub_24C8A33D8(*(void *)(a1 + v5[11]), *(void *)(a2 + v5[11])) & 1) == 0) {
    return 0;
  }
  uint64_t v25 = v5[12];
  uint64_t v26 = *(void *)(a1 + v25);
  uint64_t v27 = *(void *)(a2 + v25);

  return sub_24C8A3150(v26, v27);
}

uint64_t sub_24C8A684C()
{
  return sub_24C8A6894(&qword_2697F8930, (void (*)(uint64_t))type metadata accessor for User);
}

uint64_t sub_24C8A6894(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *initializeBufferWithCopyOfBuffer for User(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v39 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v39 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C8A76B8();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    uint64_t v9 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    BOOL v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *BOOL v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    BOOL v15 = (uint64_t *)((char *)a1 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *BOOL v15 = *v16;
    v15[1] = v17;
    uint64_t v18 = (char *)a1 + v14;
    uint64_t v19 = (char *)a2 + v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8((uint64_t *)v18, (uint64_t *)v19, v7);
    BOOL v20 = (int *)type metadata accessor for Group();
    *(_DWORD *)&v18[v20[5]] = *(_DWORD *)&v19[v20[5]];
    uint64_t v21 = v20[6];
    uint64_t v22 = &v18[v21];
    uint64_t v23 = &v19[v21];
    uint64_t v25 = *(void *)v23;
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)uint64_t v22 = v25;
    *((void *)v22 + 1) = v24;
    uint64_t v26 = v20[7];
    uint64_t v27 = &v18[v26];
    uint64_t v28 = &v19[v26];
    uint64_t v29 = *((void *)v28 + 1);
    *(void *)uint64_t v27 = *(void *)v28;
    *((void *)v27 + 1) = v29;
    *(void *)&v18[v20[8]] = *(void *)&v19[v20[8]];
    *(void *)&v18[v20[9]] = *(void *)&v19[v20[9]];
    uint64_t v30 = a3[9];
    uint64_t v31 = a3[10];
    uint64_t v32 = (uint64_t *)((char *)a1 + v30);
    uint64_t v33 = (uint64_t *)((char *)a2 + v30);
    uint64_t v34 = v33[1];
    *uint64_t v32 = *v33;
    v32[1] = v34;
    uint64_t v35 = (uint64_t *)((char *)a1 + v31);
    uint64_t v36 = (uint64_t *)((char *)a2 + v31);
    uint64_t v37 = v36[1];
    *uint64_t v35 = *v36;
    v35[1] = v37;
    uint64_t v38 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v38) = *(uint64_t *)((char *)a2 + v38);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for User(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24C8A76B8();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5(a1 + *(int *)(a2 + 32), v4);
  type metadata accessor for Group();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v9 = (void *)(a1 + v8);
  BOOL v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  BOOL v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = a1 + v13;
  uint64_t v18 = a2 + v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7(v17, v18, v6);
  uint64_t v19 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v17 + v19[5]) = *(_DWORD *)(v18 + v19[5]);
  uint64_t v20 = v19[6];
  uint64_t v21 = (void *)(v17 + v20);
  uint64_t v22 = (uint64_t *)(v18 + v20);
  uint64_t v24 = *v22;
  uint64_t v23 = v22[1];
  void *v21 = v24;
  v21[1] = v23;
  uint64_t v25 = v19[7];
  uint64_t v26 = (void *)(v17 + v25);
  uint64_t v27 = (void *)(v18 + v25);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  *(void *)(v17 + v19[8]) = *(void *)(v18 + v19[8]);
  *(void *)(v17 + v19[9]) = *(void *)(v18 + v19[9]);
  uint64_t v29 = a3[9];
  uint64_t v30 = a3[10];
  uint64_t v31 = (void *)(a1 + v29);
  uint64_t v32 = (void *)(a2 + v29);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  uint64_t v34 = (void *)(a1 + v30);
  uint64_t v35 = (void *)(a2 + v30);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  uint64_t v37 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v37) = *(void *)(a2 + v37);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  BOOL v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = a3[7];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[8];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  v7(a1 + v14, a2 + v14, v6);
  uint64_t v17 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v15 + v17[5]) = *(_DWORD *)(v16 + v17[5]);
  uint64_t v18 = v17[6];
  uint64_t v19 = (void *)(v15 + v18);
  uint64_t v20 = (void *)(v16 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = v17[7];
  uint64_t v22 = (void *)(v15 + v21);
  uint64_t v23 = (void *)(v16 + v21);
  *uint64_t v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v15 + v17[8]) = *(void *)(v16 + v17[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(v15 + v17[9]) = *(void *)(v16 + v17[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  *uint64_t v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[10];
  uint64_t v28 = (void *)(a1 + v27);
  uint64_t v29 = (void *)(a2 + v27);
  *uint64_t v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  v7(a1 + v9, a2 + v9, v6);
  uint64_t v12 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v10 + v12[5]) = *(_DWORD *)(v11 + v12[5]);
  *(_OWORD *)(v10 + v12[6]) = *(_OWORD *)(v11 + v12[6]);
  *(_OWORD *)(v10 + v12[7]) = *(_OWORD *)(v11 + v12[7]);
  *(void *)(v10 + v12[8]) = *(void *)(v11 + v12[8]);
  *(void *)(v10 + v12[9]) = *(void *)(v11 + v12[9]);
  uint64_t v13 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  uint64_t v14 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C8A76B8();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  uint64_t v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  void *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  v7(a1 + v18, a2 + v18, v6);
  uint64_t v21 = (int *)type metadata accessor for Group();
  *(_DWORD *)(v19 + v21[5]) = *(_DWORD *)(v20 + v21[5]);
  uint64_t v22 = v21[6];
  uint64_t v23 = (void *)(v19 + v22);
  uint64_t v24 = (uint64_t *)(v20 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = v21[7];
  uint64_t v28 = (void *)(v19 + v27);
  uint64_t v29 = (uint64_t *)(v20 + v27);
  uint64_t v31 = *v29;
  uint64_t v30 = v29[1];
  *uint64_t v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  *(void *)(v19 + v21[8]) = *(void *)(v20 + v21[8]);
  swift_bridgeObjectRelease();
  *(void *)(v19 + v21[9]) = *(void *)(v20 + v21[9]);
  swift_bridgeObjectRelease();
  uint64_t v32 = a3[9];
  uint64_t v33 = (void *)(a1 + v32);
  uint64_t v34 = (uint64_t *)(a2 + v32);
  uint64_t v36 = *v34;
  uint64_t v35 = v34[1];
  *uint64_t v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  uint64_t v37 = a3[10];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (uint64_t *)(a2 + v37);
  uint64_t v41 = *v39;
  uint64_t v40 = v39[1];
  *uint64_t v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C8A7310);
}

uint64_t sub_24C8A7310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C8A76B8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Group();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 32);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for User(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C8A7454);
}

uint64_t sub_24C8A7454(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C8A76B8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Group();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_24C8A7584()
{
  uint64_t result = sub_24C8A76B8();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for Group();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24C8A7678()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24C8A7688()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24C8A7698()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_24C8A76A8()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24C8A76B8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24C8A76C8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24C8A76D8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C8A76E8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C8A76F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C8A7708()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24C8A7718()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24C8A7728()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_24C8A7738()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24C8A7748()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_24C8A7758()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24C8A7768()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24C8A7778()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24C8A7788()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24C8A7798()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_24C8A77A8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24C8A77B8()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_24C8A77C8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_24C8A77D8()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_24C8A77E8()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24C8A77F8()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24C8A7808()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_24C8A7818()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24C8A7828()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_24C8A7838()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24C8A7848()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24C8A7858()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24C8A7868()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24C8A7878()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24C8A7888()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24C8A7898()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24C8A78A8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24C8A78B8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24C8A78C8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24C8A78D8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24C8A78E8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C8A78F8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24C8A7908()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C8A7918()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C8A7928()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24C8A7938()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24C8A7948()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t DarwinDirectoryRecordStoreApply()
{
  return MEMORY[0x270ED7C28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
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

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}