uint64_t Group.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t vars8;

  v3 = sub_24C91A260();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t Group.gid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for Group() + 20));
}

uint64_t type metadata accessor for Group()
{
  uint64_t result = qword_2697FC2F8;
  if (!qword_2697FC2F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t Group.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for Group() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.members.getter()
{
  type metadata accessor for Group();
  return swift_bridgeObjectRetain();
}

uint64_t Group.hash(into:)(long long *a1)
{
  sub_24C91A260();
  sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v3 = type metadata accessor for Group();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(v1 + *(int *)(v3 + 28));
  swift_bridgeObjectRetain();
  sub_24C907A48(a1, v4);
  return swift_bridgeObjectRelease();
}

uint64_t Group.hashValue.getter()
{
  sub_24C91A460();
  sub_24C91A260();
  sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v1 = type metadata accessor for Group();
  sub_24C91A490();
  sub_24C91A2A0();
  sub_24C907A48(v3, *(void *)(v0 + *(int *)(v1 + 28)));
  return sub_24C91A4A0();
}

uint64_t sub_24C906058(uint64_t a1)
{
  sub_24C91A460();
  sub_24C91A260();
  sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  sub_24C91A490();
  sub_24C91A2A0();
  sub_24C907A48(v4, *(void *)(v1 + *(int *)(a1 + 28)));
  return sub_24C91A4A0();
}

uint64_t sub_24C906124(long long *a1, uint64_t a2)
{
  sub_24C91A260();
  sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  sub_24C91A490();
  sub_24C91A2A0();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 28));
  return sub_24C907A48(a1, v5);
}

uint64_t sub_24C9061EC(uint64_t a1, uint64_t a2)
{
  sub_24C91A460();
  sub_24C91A260();
  sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  sub_24C91A490();
  sub_24C91A2A0();
  sub_24C907A48(v5, *(void *)(v2 + *(int *)(a2 + 28)));
  return sub_24C91A4A0();
}

uint64_t sub_24C9062B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + *(int *)(type metadata accessor for LibSystemGroupRecord(0) + 28));
  uint64_t v4 = (uint64_t *)(a1 + *(int *)(type metadata accessor for User() + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  swift_bridgeObjectRetain();
  LOBYTE(v3) = sub_24C906338(v5, v6, v3);
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24C906338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    sub_24C91A460();
    sub_24C91A2A0();
    uint64_t v6 = sub_24C91A4A0();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24C91A440() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24C91A440() & 1) != 0) {
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

uint64_t sub_24C906470@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v5 = sub_24C91A260();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = &v27[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v16 = &v27[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  v18 = &v27[-v17];
  sub_24C908704(a1, (uint64_t)v11);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    __swift_destroy_boxed_opaque_existential_1(v31);
    sub_24C9087BC(a1);
    sub_24C9087BC((uint64_t)v11);
    uint64_t v19 = type metadata accessor for Group();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(a3, 1, 1, v19);
  }
  else
  {
    sub_24C9089AC((uint64_t)v11, (uint64_t)v18, type metadata accessor for LibSystemGroupRecord);
    sub_24C908944((uint64_t)v18, (uint64_t)v16, type metadata accessor for LibSystemGroupRecord);
    sub_24C90881C(v31, (uint64_t)v32);
    __swift_project_boxed_opaque_existential_1(v32, v32[3]);
    uint64_t v21 = sub_24C917E4C();
    uint64_t v22 = (*(uint64_t (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v8, &v16[*(int *)(v12 + 24)], v5);
    uint64_t v30 = a1;
    int v28 = *(_DWORD *)v16;
    uint64_t v23 = *((void *)v16 + 2);
    uint64_t v29 = *((void *)v16 + 1);
    MEMORY[0x270FA5388](v22);
    *(void *)&v27[-16] = v16;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_24C906A90((uint64_t)sub_24C9088C4, (uint64_t)&v27[-32], v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v6 + 32))(a3, v8, v5);
    v25 = (int *)type metadata accessor for Group();
    *(_DWORD *)(a3 + v25[5]) = v28;
    v26 = (void *)(a3 + v25[6]);
    void *v26 = v29;
    v26[1] = v23;
    *(void *)(a3 + v25[7]) = v24;
    sub_24C9088E4((uint64_t)v16, type metadata accessor for LibSystemGroupRecord);
    __swift_destroy_boxed_opaque_existential_1(v31);
    sub_24C9087BC(v30);
    sub_24C9088E4((uint64_t)v18, type metadata accessor for LibSystemGroupRecord);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v25 - 1) + 56))(a3, 0, 1, v25);
  }
}

uint64_t sub_24C906848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24C906874(a1, a2, (uint64_t)sub_24C908A14, a3);
}

uint64_t sub_24C906874@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_24C91A260();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C908944(a1, (uint64_t)v15, type metadata accessor for LibSystemGroupRecord);
  sub_24C90881C(a2, (uint64_t)v26);
  __swift_project_boxed_opaque_existential_1(v26, v26[3]);
  uint64_t v16 = sub_24C917E4C();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, &v15[*(int *)(v13 + 32)], v8);
  LODWORD(v13) = *(_DWORD *)v15;
  uint64_t v17 = *((void *)v15 + 2);
  uint64_t v23 = *((void *)v15 + 1);
  v25 = v15;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_24C906A90(a3, (uint64_t)v24, v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a4, v11, v8);
  uint64_t v19 = (int *)type metadata accessor for Group();
  *(_DWORD *)(a4 + v19[5]) = v13;
  v20 = (void *)(a4 + v19[6]);
  void *v20 = v23;
  v20[1] = v17;
  *(void *)(a4 + v19[7]) = v18;
  return sub_24C9088E4((uint64_t)v15, type metadata accessor for LibSystemGroupRecord);
}

uint64_t sub_24C906A90(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (uint64_t (*)(char *))isStackAllocationSafe;
  v12[1] = *MEMORY[0x263EF8340];
  char v6 = *(unsigned char *)(a3 + 32);
  unint64_t v7 = (unint64_t)((1 << v6) + 63) >> 6;
  size_t v8 = 8 * v7;
  if ((v6 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    uint64_t v9 = sub_24C906C14((void *)((char *)v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a3, v5);
    swift_release();
    if (v3) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v10 = (void *)swift_slowAlloc();
    bzero(v10, v8);
    uint64_t v9 = sub_24C906C14((unint64_t *)v10, v7, a3, v5);
    swift_release();
    MEMORY[0x253300DD0](v10, -1, -1);
  }
  return v9;
}

uint64_t sub_24C906C14(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *))
{
  uint64_t v31 = a4;
  uint64_t v26 = a2;
  v27 = a1;
  uint64_t v6 = type metadata accessor for User();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x270FA5388](v6 - 8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = 0;
  uint64_t v12 = a3;
  uint64_t v13 = *(void *)(a3 + 56);
  uint64_t v28 = 0;
  uint64_t v29 = a3 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v13;
  int64_t v30 = (unint64_t)(v14 + 63) >> 6;
  while (v16)
  {
    unint64_t v17 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    unint64_t v18 = v17 | (v11 << 6);
LABEL_17:
    sub_24C908944(*(void *)(v12 + 48) + *(void *)(v7 + 72) * v18, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for User);
    char v22 = v31(v10);
    uint64_t result = sub_24C9088E4((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for User);
    if (v4) {
      return result;
    }
    if (v22)
    {
      *(unint64_t *)((char *)v27 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      BOOL v19 = __OFADD__(v28++, 1);
      if (v19) {
        goto LABEL_30;
      }
    }
  }
  BOOL v19 = __OFADD__(v11++, 1);
  if (v19)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v11 >= v30) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v29 + 8 * v11);
  if (v20)
  {
LABEL_16:
    unint64_t v16 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v11 << 6);
    goto LABEL_17;
  }
  int64_t v21 = v11 + 1;
  if (v11 + 1 >= v30) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v29 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v11 + 2;
  if (v11 + 2 >= v30) {
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v29 + 8 * v21);
  if (v20) {
    goto LABEL_15;
  }
  int64_t v21 = v11 + 3;
  if (v11 + 3 >= v30)
  {
LABEL_27:
    uint64_t v23 = v26;
    uint64_t v24 = v28;
    swift_retain();
    return sub_24C906EBC(v27, v23, v24, v12);
  }
  unint64_t v20 = *(void *)(v29 + 8 * v21);
  if (v20)
  {
LABEL_15:
    int64_t v11 = v21;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v30) {
      goto LABEL_27;
    }
    unint64_t v20 = *(void *)(v29 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24C906EBC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a1;
  uint64_t v7 = type metadata accessor for User();
  uint64_t v27 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC310);
  uint64_t result = sub_24C91A390();
  uint64_t v10 = result;
  uint64_t v24 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v25;
  }
  uint64_t v13 = 0;
  uint64_t v26 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      uint64_t v28 = v13;
      unint64_t v15 = v14 | (v13 << 6);
    }
    else
    {
      uint64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_30;
      }
      if (v16 >= v24)
      {
LABEL_27:
        swift_release();
        return v10;
      }
      unint64_t v17 = v25[v16];
      uint64_t v18 = v13 + 1;
      if (!v17)
      {
        uint64_t v18 = v13 + 2;
        if (v13 + 2 >= v24) {
          goto LABEL_27;
        }
        unint64_t v17 = v25[v18];
        if (!v17)
        {
          uint64_t v18 = v13 + 3;
          if (v13 + 3 >= v24) {
            goto LABEL_27;
          }
          unint64_t v17 = v25[v18];
          if (!v17)
          {
            uint64_t v19 = v13 + 4;
            if (v13 + 4 >= v24) {
              goto LABEL_27;
            }
            unint64_t v17 = v25[v19];
            if (!v17)
            {
              while (1)
              {
                uint64_t v18 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_31;
                }
                if (v18 >= v24) {
                  goto LABEL_27;
                }
                unint64_t v17 = v25[v18];
                ++v19;
                if (v17) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v18 = v13 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v17 - 1) & v17;
      uint64_t v28 = v18;
      unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
    }
    uint64_t v20 = *(void *)(v27 + 72);
    sub_24C908944(*(void *)(a4 + 48) + v20 * v15, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C91A460();
    sub_24C91A260();
    sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A4A0();
    uint64_t v21 = v26;
    unint64_t v22 = sub_24C91A310();
    *(void *)(v21 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    uint64_t result = sub_24C9089AC((uint64_t)v9, *(void *)(v10 + 48) + v22 * v20, (uint64_t (*)(void))type metadata accessor for User);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    uint64_t v13 = v28;
    if (!a3) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24C9072B8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a1;
  uint64_t v7 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v30 = *(void *)(v7 - 8);
  uint64_t v31 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC318);
  uint64_t result = sub_24C91A390();
  uint64_t v10 = result;
  uint64_t v27 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v28;
  }
  uint64_t v13 = 0;
  uint64_t v29 = result + 56;
  uint64_t v14 = v31;
  while (1)
  {
    if (v12)
    {
      unint64_t v15 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      uint64_t v32 = v13;
      unint64_t v16 = v15 | (v13 << 6);
    }
    else
    {
      uint64_t v17 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_30;
      }
      if (v17 >= v27)
      {
LABEL_27:
        swift_release();
        return v10;
      }
      unint64_t v18 = v28[v17];
      uint64_t v19 = v13 + 1;
      if (!v18)
      {
        uint64_t v19 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_27;
        }
        unint64_t v18 = v28[v19];
        if (!v18)
        {
          uint64_t v19 = v13 + 3;
          if (v13 + 3 >= v27) {
            goto LABEL_27;
          }
          unint64_t v18 = v28[v19];
          if (!v18)
          {
            uint64_t v20 = v13 + 4;
            if (v13 + 4 >= v27) {
              goto LABEL_27;
            }
            unint64_t v18 = v28[v20];
            if (!v18)
            {
              while (1)
              {
                uint64_t v19 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_31;
                }
                if (v19 >= v27) {
                  goto LABEL_27;
                }
                unint64_t v18 = v28[v19];
                ++v20;
                if (v18) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v19 = v13 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v18 - 1) & v18;
      uint64_t v32 = v19;
      unint64_t v16 = __clz(__rbit64(v18)) + (v19 << 6);
    }
    uint64_t v21 = *(void *)(v30 + 72);
    sub_24C908944(*(void *)(a4 + 48) + v21 * v16, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
    sub_24C91A460();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A260();
    sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    uint64_t v22 = *(void *)&v9[*(int *)(v14 + 28)];
    swift_bridgeObjectRetain();
    sub_24C907D74((uint64_t)v33, v22);
    swift_bridgeObjectRelease();
    sub_24C91A480();
    sub_24C91A4A0();
    uint64_t v23 = v29;
    unint64_t v24 = sub_24C91A310();
    *(void *)(v23 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    uint64_t result = sub_24C9089AC((uint64_t)v9, *(void *)(v10 + 48) + v24 * v21, type metadata accessor for LibSystemGroupRecord);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    uint64_t v13 = v32;
    if (!a3) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24C907648(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = a1;
  uint64_t v7 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v27 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x263F8EE88];
  }
  if (*(void *)(a4 + 16) == a3) {
    return a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC320);
  uint64_t result = sub_24C91A390();
  uint64_t v10 = result;
  uint64_t v24 = a2;
  if (a2 < 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = *v25;
  }
  uint64_t v13 = 0;
  uint64_t v26 = result + 56;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      uint64_t v28 = v13;
      unint64_t v15 = v14 | (v13 << 6);
    }
    else
    {
      uint64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_30;
      }
      if (v16 >= v24)
      {
LABEL_27:
        swift_release();
        return v10;
      }
      unint64_t v17 = v25[v16];
      uint64_t v18 = v13 + 1;
      if (!v17)
      {
        uint64_t v18 = v13 + 2;
        if (v13 + 2 >= v24) {
          goto LABEL_27;
        }
        unint64_t v17 = v25[v18];
        if (!v17)
        {
          uint64_t v18 = v13 + 3;
          if (v13 + 3 >= v24) {
            goto LABEL_27;
          }
          unint64_t v17 = v25[v18];
          if (!v17)
          {
            uint64_t v19 = v13 + 4;
            if (v13 + 4 >= v24) {
              goto LABEL_27;
            }
            unint64_t v17 = v25[v19];
            if (!v17)
            {
              while (1)
              {
                uint64_t v18 = v19 + 1;
                if (__OFADD__(v19, 1)) {
                  goto LABEL_31;
                }
                if (v18 >= v24) {
                  goto LABEL_27;
                }
                unint64_t v17 = v25[v18];
                ++v19;
                if (v17) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v18 = v13 + 4;
          }
        }
      }
LABEL_24:
      unint64_t v12 = (v17 - 1) & v17;
      uint64_t v28 = v18;
      unint64_t v15 = __clz(__rbit64(v17)) + (v18 << 6);
    }
    uint64_t v20 = *(void *)(v27 + 72);
    sub_24C908944(*(void *)(a4 + 48) + v20 * v15, (uint64_t)v9, type metadata accessor for LibSystemUserRecord);
    sub_24C91A460();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A260();
    sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A480();
    sub_24C91A4A0();
    uint64_t v21 = v26;
    unint64_t v22 = sub_24C91A310();
    *(void *)(v21 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    uint64_t result = sub_24C9089AC((uint64_t)v9, *(void *)(v10 + 48) + v22 * v20, type metadata accessor for LibSystemUserRecord);
    ++*(void *)(v10 + 16);
    if (__OFSUB__(a3--, 1)) {
      break;
    }
    uint64_t v13 = v28;
    if (!a3) {
      goto LABEL_27;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24C907A48(long long *a1, uint64_t a2)
{
  uint64_t v28 = *(void *)(type metadata accessor for User() - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v27 - v7;
  uint64_t v9 = *((void *)a1 + 8);
  long long v10 = a1[1];
  long long v30 = *a1;
  long long v31 = v10;
  long long v11 = a1[2];
  long long v12 = a1[3];
  v27[1] = a1;
  long long v32 = v11;
  long long v33 = v12;
  uint64_t v34 = v9;
  v27[2] = sub_24C91A4A0();
  uint64_t v13 = a2 + 56;
  uint64_t v14 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(a2 + 56);
  int64_t v17 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = a2;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v19 = 0;
  int64_t v20 = 0;
  while (1)
  {
    if (v16)
    {
      unint64_t v21 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v22 = v21 | (v20 << 6);
      goto LABEL_5;
    }
    if (__OFADD__(v20++, 1)) {
      goto LABEL_19;
    }
    if (v20 >= v17)
    {
LABEL_17:
      swift_release();
      return sub_24C91A470();
    }
    unint64_t v25 = *(void *)(v13 + 8 * v20);
    if (!v25) {
      break;
    }
LABEL_16:
    unint64_t v16 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v20 << 6);
LABEL_5:
    sub_24C908944(*(void *)(v29 + 48) + *(void *)(v28 + 72) * v22, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C9089AC((uint64_t)v8, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C91A460();
    sub_24C91A260();
    sub_24C908004(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    sub_24C91A490();
    sub_24C91A2A0();
    sub_24C91A2A0();
    sub_24C91A2A0();
    sub_24C91A490();
    sub_24C91A2A0();
    uint64_t v23 = sub_24C91A4A0();
    uint64_t result = sub_24C9088E4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
    v19 ^= v23;
  }
  int64_t v26 = v20 + 1;
  if (v20 + 1 >= v17) {
    goto LABEL_17;
  }
  unint64_t v25 = *(void *)(v13 + 8 * v26);
  if (v25)
  {
    ++v20;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v20 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v20 >= v17) {
      goto LABEL_17;
    }
    unint64_t v25 = *(void *)(v13 + 8 * v20);
    ++v26;
    if (v25) {
      goto LABEL_16;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_24C907D74(uint64_t a1, uint64_t a2)
{
  sub_24C91A4A0();
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
      return sub_24C91A470();
    }
    uint64_t v13 = *(void *)(v3 + 8 * v10);
    if (!v13) {
      break;
    }
LABEL_16:
    uint64_t v6 = (v13 - 1) & v13;
LABEL_5:
    sub_24C91A460();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    uint64_t v11 = sub_24C91A4A0();
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

uint64_t _s20DarwinDirectoryQuery5GroupV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_24C91A220() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for Group();
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20))) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  BOOL v10 = v7 == *v9 && v8 == v9[1];
  if (!v10 && (sub_24C91A440() & 1) == 0) {
    return 0;
  }
  uint64_t v11 = *(int *)(v5 + 28);
  uint64_t v12 = *(void *)(a1 + v11);
  uint64_t v13 = *(void *)(a2 + v11);
  return sub_24C909000(v12, v13);
}

uint64_t sub_24C907FBC()
{
  return sub_24C908004(&qword_2697FC2F0, (void (*)(uint64_t))type metadata accessor for Group);
}

uint64_t sub_24C908004(unint64_t *a1, void (*a2)(uint64_t))
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
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C91A260();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    BOOL v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Group(uint64_t a1)
{
  uint64_t v2 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
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
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C908478);
}

uint64_t sub_24C908478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C91A260();
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
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C908550);
}

uint64_t sub_24C908550(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C91A260();
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

uint64_t sub_24C908610()
{
  uint64_t result = sub_24C91A260();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
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

uint64_t sub_24C908704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t sub_24C9087BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C90881C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24C9088C4(uint64_t a1)
{
  return sub_24C9062B8(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_24C9088E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C908944(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C9089AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C908A14(uint64_t a1)
{
  return sub_24C9088C4(a1) & 1;
}

uint64_t sub_24C908A30(uint64_t a1)
{
  uint64_t result = sub_24C908AE0(&qword_2697FC328, (void (*)(uint64_t))type metadata accessor for LibSystemGroupRecord);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C908A88(uint64_t a1)
{
  uint64_t result = sub_24C908AE0(&qword_2697FC330, (void (*)(uint64_t))type metadata accessor for LibSystemUserRecord);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_24C908AE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C908B28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *(_DWORD *)(a1 + 4);
  *(void *)(a2 + 8) = sub_24C91A2B0();
  *(void *)(a2 + 16) = v4;
  uint64_t v5 = (int *)type metadata accessor for LibSystemUserRecord(0);
  sub_24C91A240();
  uint64_t v6 = sub_24C91A2B0();
  uint64_t v7 = (uint64_t *)(a2 + v5[7]);
  *uint64_t v7 = v6;
  v7[1] = v8;
  uint64_t v9 = sub_24C91A2B0();
  unint64_t v10 = (uint64_t *)(a2 + v5[8]);
  *unint64_t v10 = v9;
  v10[1] = v11;
  *(_DWORD *)(a2 + v5[9]) = *(void *)(a1 + 40);
  uint64_t result = sub_24C91A2B0();
  uint64_t v13 = (uint64_t *)(a2 + v5[10]);
  *uint64_t v13 = result;
  v13[1] = v14;
  *(unsigned char *)(a2 + v5[11]) = *(unsigned char *)(a1 + 32);
  return result;
}

uint64_t sub_24C908C3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *(_DWORD *)(a1 + 4);
  *(void *)(a2 + 8) = sub_24C91A2B0();
  *(void *)(a2 + 16) = v4;
  uint64_t v5 = type metadata accessor for LibSystemGroupRecord(0);
  sub_24C91A240();
  uint64_t v6 = 0;
  *(unsigned char *)(a2 + *(int *)(v5 + 32)) = *(unsigned char *)(a1 + 32);
  uint64_t v12 = MEMORY[0x263F8EE88];
  while (1)
  {
    uint64_t result = *(void *)(*(void *)(a1 + 40) + 8 * v6);
    if (!result) {
      break;
    }
    uint64_t v8 = sub_24C91A2B0();
    sub_24C912F38(&v11, v8, v9);
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

uint64_t sub_24C908D78(uint64_t result, uint64_t a2)
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
    sub_24C91A460();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    uint64_t v18 = sub_24C91A4A0();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    unint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_24C91A440() & 1) == 0)
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
        if (v28 || (sub_24C91A440() & 1) != 0) {
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

uint64_t sub_24C909000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (int *)type metadata accessor for User();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  int64_t v10 = (char *)&v41 - v9;
  uint64_t result = MEMORY[0x270FA5388](v8);
  uint64_t v14 = (char *)&v41 - v13;
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
  uint64_t v45 = v12;
  uint64_t v46 = a1;
  uint64_t v43 = a1 + 56;
  v44 = v14;
  int64_t v42 = v20;
  if (!v19) {
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v47 = (v19 - 1) & v19;
  int64_t v48 = v15;
  for (unint64_t i = __clz(__rbit64(v19)) | (v15 << 6); ; unint64_t i = __clz(__rbit64(v24)) + (v25 << 6))
  {
    uint64_t v27 = *(void *)(v12 + 72);
    sub_24C90D220(*(void *)(a1 + 48) + v27 * i, (uint64_t)v14, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C90D288((uint64_t)v14, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C91A460();
    sub_24C91A260();
    sub_24C90D1D8(&qword_2697FC2E8, 255, MEMORY[0x263F07508]);
    sub_24C91A270();
    uint64_t v28 = v4[5];
    sub_24C91A490();
    uint64_t v29 = &v10[v4[6]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    v52 = &v10[v4[7]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    v51 = &v10[v4[8]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    uint64_t v50 = v4[9];
    sub_24C91A490();
    v49 = &v10[v4[10]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_24C91A4A0();
    uint64_t v31 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v32 = v30 & ~v31;
    if (((*(void *)(v21 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
    {
LABEL_51:
      sub_24C90C734((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for User);
      return 0;
    }
    uint64_t v33 = ~v31;
    while (1)
    {
      sub_24C90D220(*(void *)(a2 + 48) + v32 * v27, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for User);
      if ((sub_24C91A220() & 1) != 0 && *(_DWORD *)&v7[v4[5]] == *(_DWORD *)&v10[v28])
      {
        uint64_t v34 = &v7[v4[6]];
        BOOL v35 = *(void *)v34 == *(void *)v29 && *((void *)v34 + 1) == *((void *)v29 + 1);
        if (v35 || (sub_24C91A440() & 1) != 0)
        {
          v36 = &v7[v4[7]];
          BOOL v37 = *(void *)v36 == *(void *)v52 && *((void *)v36 + 1) == *((void *)v52 + 1);
          if (v37 || (sub_24C91A440() & 1) != 0)
          {
            v38 = &v7[v4[8]];
            BOOL v39 = *(void *)v38 == *(void *)v51 && *((void *)v38 + 1) == *((void *)v51 + 1);
            if (v39 || (sub_24C91A440()) && *(_DWORD *)&v7[v4[9]] == *(_DWORD *)&v10[v50])
            {
              v40 = &v7[v4[10]];
              if (*(void *)v40 == *(void *)v49 && *((void *)v40 + 1) == *((void *)v49 + 1)) {
                break;
              }
              if (sub_24C91A440()) {
                break;
              }
            }
          }
        }
      }
      sub_24C90C734((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for User);
      unint64_t v32 = (v32 + 1) & v33;
      if (((*(void *)(v21 + ((v32 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v32) & 1) == 0) {
        goto LABEL_51;
      }
    }
    sub_24C90C734((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for User);
    uint64_t result = sub_24C90C734((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for User);
    uint64_t v12 = v45;
    a1 = v46;
    uint64_t v16 = v43;
    uint64_t v14 = v44;
    int64_t v20 = v42;
    unint64_t v19 = v47;
    int64_t v15 = v48;
    if (v47) {
      goto LABEL_7;
    }
LABEL_8:
    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_54;
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
        if (!v24)
        {
          int64_t v25 = v15 + 4;
          if (v15 + 4 >= v20) {
            return 1;
          }
          unint64_t v24 = *(void *)(v16 + 8 * v25);
          if (!v24) {
            break;
          }
        }
      }
    }
LABEL_23:
    uint64_t v47 = (v24 - 1) & v24;
    int64_t v48 = v25;
  }
  uint64_t v26 = v15 + 5;
  if (v15 + 5 >= v20) {
    return 1;
  }
  unint64_t v24 = *(void *)(v16 + 8 * v26);
  if (v24)
  {
    int64_t v25 = v15 + 5;
    goto LABEL_23;
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
      goto LABEL_23;
    }
  }
LABEL_54:
  __break(1u);
  return result;
}

id sub_24C9095D4(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3 = sub_24C90BACC(a3);
  type metadata accessor for DDQUser(v3);
  sub_24C90D1D8(&qword_2697FC368, v4, (void (*)(uint64_t))type metadata accessor for DDQUser);
  uint64_t v5 = (void *)sub_24C91A2C0();
  swift_bridgeObjectRelease();
  return v5;
}

void DDQUser.init()()
{
}

uint64_t DDQUser.isEqual(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for User();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = sub_24C90D374(a1, (uint64_t)v15, &qword_2697FC338);
  if (!v16)
  {
    sub_24C90D3D8((uint64_t)v15, &qword_2697FC338);
    goto LABEL_6;
  }
  type metadata accessor for DDQUser(v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    char v11 = 0;
    return v11 & 1;
  }
  int64_t v10 = v14;
  if (v14 == v1)
  {

    char v11 = 1;
  }
  else
  {
    sub_24C909FA8((uint64_t)v1 + OBJC_IVAR___DDQUser__user, (uint64_t)v15);
    swift_dynamicCast();
    sub_24C909FA8((uint64_t)v10 + OBJC_IVAR___DDQUser__user, (uint64_t)v15);
    swift_dynamicCast();
    char v11 = _s20DarwinDirectoryQuery4UserV2eeoiySbAC_ACtFZ_0((uint64_t)v8, (uint64_t)v6);

    sub_24C90C734((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C90C734((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for User);
  }
  return v11 & 1;
}

uint64_t type metadata accessor for DDQUser(uint64_t a1)
{
  return sub_24C90C664(a1, &qword_2697FC350);
}

uint64_t sub_24C909FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t DDQUser.hash.getter()
{
  uint64_t v1 = type metadata accessor for User();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = &v7[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_24C909FA8(v0 + OBJC_IVAR___DDQUser__user, (uint64_t)v7);
  swift_dynamicCast();
  sub_24C91A460();
  sub_24C91A260();
  sub_24C90D1D8(&qword_2697FC2E8, 255, MEMORY[0x263F07508]);
  sub_24C91A270();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_24C91A4A0();
  sub_24C90C734((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for User);
  return v4;
}

id sub_24C90A28C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = a3();
  type metadata accessor for DDQGroup(v3);
  sub_24C90D1D8(&qword_2697FC370, v4, (void (*)(uint64_t))type metadata accessor for DDQGroup);
  uint64_t v5 = (void *)sub_24C91A2C0();
  swift_bridgeObjectRelease();
  return v5;
}

id sub_24C90A354(void *a1, uint64_t a2, uint64_t (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  uint64_t v8 = a3(0);
  MEMORY[0x270FA5388](v8);
  int64_t v10 = &v18[-v9];
  uint64_t v11 = sub_24C91A260();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = &v18[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24C909FA8((uint64_t)a1 + *a4, (uint64_t)v18);
  id v15 = a1;
  swift_dynamicCast();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v12 + 16))(v14, v10, v11);
  sub_24C90C734((uint64_t)v10, a5);

  uint64_t v16 = (void *)sub_24C91A210();
  (*(void (**)(unsigned char *, uint64_t))(v12 + 8))(v14, v11);
  return v16;
}

uint64_t sub_24C90A534(void *a1, uint64_t a2, uint64_t (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  uint64_t v8 = a3(0);
  MEMORY[0x270FA5388](v8);
  int64_t v10 = &v14[-v9];
  sub_24C909FA8((uint64_t)a1 + *a4, (uint64_t)v14);
  id v11 = a1;
  swift_dynamicCast();
  uint64_t v12 = *(unsigned int *)&v10[*(int *)(v8 + 20)];
  sub_24C90C734((uint64_t)v10, a5);

  return v12;
}

id sub_24C90A648(void *a1, uint64_t a2, uint64_t (*a3)(void), void *a4, uint64_t (*a5)(void))
{
  uint64_t v8 = a3(0);
  MEMORY[0x270FA5388](v8);
  int64_t v10 = &v14[-v9];
  sub_24C909FA8((uint64_t)a1 + *a4, (uint64_t)v14);
  id v11 = a1;
  swift_dynamicCast();
  swift_bridgeObjectRetain();
  sub_24C90C734((uint64_t)v10, a5);

  uint64_t v12 = (void *)sub_24C91A280();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_24C90A7F8()
{
  uint64_t v1 = type metadata accessor for User();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v31 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = MEMORY[0x270FA5388](v2);
  uint64_t v7 = (char *)&v28 - v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v29 = (uint64_t)&v28 - v8;
  uint64_t v9 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v9);
  id v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C909FA8(v0 + OBJC_IVAR___DDQGroup__group, (uint64_t)v33);
  swift_dynamicCast();
  uint64_t v12 = *(void *)&v11[*(int *)(v9 + 28)];
  swift_bridgeObjectRetain();
  sub_24C90C734((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Group);
  uint64_t v13 = *(void *)(v12 + 16);
  if (v13)
  {
    v33[0] = MEMORY[0x263F8EE78];
    sub_24C91A3F0();
    uint64_t result = sub_24C90B944(v12);
    int64_t v15 = result;
    int v17 = v16;
    char v19 = v18 & 1;
    uint64_t v28 = v12 + 56;
    while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(unsigned char *)(v12 + 32))
    {
      if (((*(void *)(v28 + (((unint64_t)v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
        goto LABEL_12;
      }
      if (*(_DWORD *)(v12 + 36) != v17) {
        goto LABEL_13;
      }
      uint64_t v20 = v29;
      sub_24C90D220(*(void *)(v12 + 48) + *(void *)(v30 + 72) * v15, v29, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C90D288(v20, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C90D220((uint64_t)v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for User);
      uint64_t v21 = (char *)objc_allocWithZone((Class)DDQUser);
      unint64_t v22 = (uint64_t *)&v21[OBJC_IVAR___DDQUser__user];
      v22[3] = v31;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v22);
      sub_24C90D220((uint64_t)v4, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
      v32.receiver = v21;
      v32.super_class = (Class)DDQUser;
      objc_msgSendSuper2(&v32, sel_init);
      sub_24C90C734((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C90C734((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C91A3D0();
      sub_24C91A400();
      sub_24C91A410();
      sub_24C91A3E0();
      uint64_t result = sub_24C90B9E8(v15, v17, v19 & 1, v12);
      int64_t v15 = result;
      int v17 = v24;
      char v19 = v25 & 1;
      if (!--v13)
      {
        sub_24C90D2F0(result, v24, v25 & 1);
        unint64_t v26 = v33[0];
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v26 = MEMORY[0x263F8EE78];
LABEL_10:
    uint64_t v27 = sub_24C9196D0(v26);
    swift_bridgeObjectRelease();
    return v27;
  }
  return result;
}

void sub_24C90AB94()
{
  uint64_t v0 = sub_24C91A260();
  MEMORY[0x270FA5388](v0 - 8);
  sub_24C91A230();
  sub_24C91A420();
  __break(1u);
}

id _sSo7DDQUserC20DarwinDirectoryQueryEABycfC_0()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return objc_msgSend(v0, sel_init);
}

void DDQGroup.init()()
{
}

uint64_t DDQGroup.isEqual(_:)(uint64_t a1)
{
  uint64_t v3 = (int *)type metadata accessor for Group();
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_24C90D374(a1, (uint64_t)v20, &qword_2697FC338);
  if (!v21)
  {
    sub_24C90D3D8((uint64_t)v20, &qword_2697FC338);
    goto LABEL_13;
  }
  type metadata accessor for DDQGroup(v9);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    char v16 = 0;
    return v16 & 1;
  }
  uint64_t v10 = v19;
  if (v19 == v1)
  {

    char v16 = 1;
  }
  else
  {
    sub_24C909FA8((uint64_t)v1 + OBJC_IVAR___DDQGroup__group, (uint64_t)v20);
    swift_dynamicCast();
    sub_24C909FA8((uint64_t)v10 + OBJC_IVAR___DDQGroup__group, (uint64_t)v20);
    swift_dynamicCast();
    if ((sub_24C91A220() & 1) != 0 && *(_DWORD *)&v8[v3[5]] == *(_DWORD *)&v6[v3[5]])
    {
      uint64_t v11 = v3[6];
      uint64_t v12 = *(void *)&v8[v11];
      uint64_t v13 = *(void *)&v8[v11 + 8];
      uint64_t v14 = &v6[v11];
      BOOL v15 = v12 == *(void *)v14 && v13 == *((void *)v14 + 1);
      if (v15 || (char v16 = 0, (sub_24C91A440() & 1) != 0)) {
        char v16 = sub_24C909000(*(void *)&v8[v3[7]], *(void *)&v6[v3[7]]);
      }
    }
    else
    {
      char v16 = 0;
    }

    sub_24C90C734((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C90C734((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Group);
  }
  return v16 & 1;
}

uint64_t sub_24C90B710(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  if (a3)
  {
    id v6 = a1;
    swift_unknownObjectRetain();
    sub_24C91A300();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v7 = a1;
  }
  char v8 = a4(v10);

  sub_24C90D3D8((uint64_t)v10, &qword_2697FC338);
  return v8 & 1;
}

uint64_t DDQGroup.hash.getter()
{
  uint64_t v1 = type metadata accessor for Group();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24C909FA8(v0 + OBJC_IVAR___DDQGroup__group, (uint64_t)v7);
  swift_dynamicCast();
  sub_24C91A460();
  sub_24C91A260();
  sub_24C90D1D8(&qword_2697FC2E8, 255, MEMORY[0x263F07508]);
  sub_24C91A270();
  sub_24C91A490();
  sub_24C91A2A0();
  sub_24C907A48(v7, *(void *)&v3[*(int *)(v1 + 28)]);
  uint64_t v4 = sub_24C91A4A0();
  sub_24C90C734((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Group);
  return v4;
}

uint64_t sub_24C90B944(uint64_t a1)
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

int64_t sub_24C90B9E8(int64_t result, int a2, char a3, uint64_t a4)
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

uint64_t sub_24C90BACC(unint64_t *a1)
{
  uint64_t v2 = type metadata accessor for User();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  unint64_t v8 = (char *)&v27 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v29 = (uint64_t)&v27 - v9;
  if (qword_2697FC2E0 != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v10 = ((uint64_t (*)(void *))a1)(&unk_2697FC3E0);
    uint64_t v11 = *(void *)(v10 + 16);
    if (!v11) {
      break;
    }
    unint64_t v33 = MEMORY[0x263F8EE78];
    a1 = &v33;
    sub_24C91A3F0();
    int64_t v12 = sub_24C90B944(v10);
    int v14 = v13;
    char v16 = v15 & 1;
    uint64_t v28 = v10 + 56;
    while ((v12 & 0x8000000000000000) == 0 && v12 < 1 << *(unsigned char *)(v10 + 32))
    {
      if (((*(void *)(v28 + (((unint64_t)v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v12) & 1) == 0) {
        goto LABEL_13;
      }
      if (*(_DWORD *)(v10 + 36) != v14) {
        goto LABEL_14;
      }
      uint64_t v17 = v29;
      sub_24C90D220(*(void *)(v10 + 48) + *(void *)(v30 + 72) * v12, v29, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C90D288(v17, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C90D220((uint64_t)v8, (uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);
      uint64_t v18 = (char *)objc_allocWithZone((Class)DDQUser);
      char v19 = (uint64_t *)&v18[OBJC_IVAR___DDQUser__user];
      v19[3] = v31;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v19);
      sub_24C90D220((uint64_t)v5, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
      v32.receiver = v18;
      v32.super_class = (Class)DDQUser;
      objc_msgSendSuper2(&v32, sel_init);
      sub_24C90C734((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C90C734((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for User);
      a1 = &v33;
      sub_24C91A3D0();
      sub_24C91A400();
      sub_24C91A410();
      sub_24C91A3E0();
      int64_t v21 = sub_24C90B9E8(v12, v14, v16 & 1, v10);
      int64_t v12 = v21;
      int v14 = v22;
      char v16 = v23 & 1;
      if (!--v11)
      {
        sub_24C90D2F0(v21, v22, v23 & 1);
        unint64_t v24 = v33;
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
  }
  swift_bridgeObjectRelease();
  unint64_t v24 = MEMORY[0x263F8EE78];
LABEL_11:
  uint64_t v25 = sub_24C9196D0(v24);
  swift_bridgeObjectRelease();
  return v25;
}

id sub_24C90BDFC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC380);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for User();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v17 - v10;
  sub_24C90D374(a1, (uint64_t)v4, &qword_2697FC380);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_24C90D3D8(a1, &qword_2697FC380);
    sub_24C90D3D8((uint64_t)v4, &qword_2697FC380);
    return 0;
  }
  else
  {
    sub_24C90D288((uint64_t)v4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C90D220((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
    int v13 = (char *)objc_allocWithZone((Class)DDQUser);
    int v14 = (uint64_t *)&v13[OBJC_IVAR___DDQUser__user];
    v14[3] = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
    sub_24C90D220((uint64_t)v9, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for User);
    v17.receiver = v13;
    v17.super_class = (Class)DDQUser;
    id v12 = objc_msgSendSuper2(&v17, sel_init);
    sub_24C90C734((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C90D3D8(a1, &qword_2697FC380);
    sub_24C90C734((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for User);
  }
  return v12;
}

id sub_24C90C040(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v15[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v15[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC380);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v15[3] = &type metadata for ProviderSideEffects;
  v15[4] = &off_26FEFD820;
  v15[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v15[0] + 16);
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(v15, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  uint64_t v12 = sub_24C91A260();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v4, a1, v12);
  swift_storeEnumTagMultiPayload();
  sub_24C9111B8((uint64_t)v4, (uint64_t)v7);
  sub_24C90C734((uint64_t)v4, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90F8F8((uint64_t)v7, (uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return sub_24C90BDFC((uint64_t)v10);
}

id sub_24C90C264(int a1)
{
  uint64_t v2 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (_DWORD *)((char *)&v14[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC380);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v14[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v14[3] = &type metadata for ProviderSideEffects;
  v14[4] = &off_26FEFD820;
  v14[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v14[0] + 16);
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(v14, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  *uint64_t v4 = a1;
  swift_storeEnumTagMultiPayload();
  sub_24C9111B8((uint64_t)v4, (uint64_t)v7);
  sub_24C90C734((uint64_t)v4, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90F8F8((uint64_t)v7, (uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  return sub_24C90BDFC((uint64_t)v10);
}

id sub_24C90C450(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (void *)((char *)&v16[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC380);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v16[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v16[3] = &type metadata for ProviderSideEffects;
  v16[4] = &off_26FEFD820;
  v16[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v16[0] + 16);
  int v13 = __swift_project_boxed_opaque_existential_1(v16, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  *uint64_t v6 = a1;
  v6[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_24C9111B8((uint64_t)v6, (uint64_t)v9);
  sub_24C90C734((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90F8F8((uint64_t)v9, (uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return sub_24C90BDFC((uint64_t)v12);
}

uint64_t type metadata accessor for DDQGroup(uint64_t a1)
{
  return sub_24C90C664(a1, &qword_2697FC358);
}

uint64_t sub_24C90C664(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24C90C6A0()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24C90C6D8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_24C90C734(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C90C794()
{
  uint64_t v0 = type metadata accessor for Group();
  uint64_t v33 = *(void *)(v0 - 8);
  uint64_t v34 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v6 = (char *)&v31 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v32 = (uint64_t)&v31 - v7;
  if (qword_2697FC2E0 != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    v37[3] = &type metadata for ProviderSideEffects;
    v37[4] = &off_26FEFD820;
    v37[0] = swift_allocObject();
    sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v37[0] + 16);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = MEMORY[0x263F8EE88];
    uint64_t v9 = (uint64_t *)(v8 + 16);
    aBlock[4] = sub_24C90D334;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24C910D54;
    aBlock[3] = &block_descriptor;
    uint64_t v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    DarwinDirectoryRecordStoreApply();
    _Block_release(v10);
    swift_beginAccess();
    uint64_t v11 = *v9;
    swift_bridgeObjectRetain();
    uint64_t v12 = swift_release();
    MEMORY[0x270FA5388](v12);
    *(&v31 - 2) = (uint64_t)v37;
    uint64_t v13 = sub_24C9108A0((void (*)(uint64_t))sub_24C90D354, (uint64_t)(&v31 - 4), v11);
    swift_bridgeObjectRelease();
    uint64_t v14 = sub_24C9192E0(v13);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    uint64_t v15 = *(void *)(v14 + 16);
    if (!v15) {
      break;
    }
    v37[0] = MEMORY[0x263F8EE78];
    sub_24C91A3F0();
    int64_t v16 = sub_24C90B944(v14);
    int v18 = v17;
    char v20 = v19 & 1;
    uint64_t v31 = v14 + 56;
    while ((v16 & 0x8000000000000000) == 0 && v16 < 1 << *(unsigned char *)(v14 + 32))
    {
      if (((*(void *)(v31 + (((unint64_t)v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v16) & 1) == 0) {
        goto LABEL_13;
      }
      if (*(_DWORD *)(v14 + 36) != v18) {
        goto LABEL_14;
      }
      uint64_t v21 = v32;
      sub_24C90D220(*(void *)(v14 + 48) + *(void *)(v33 + 72) * v16, v32, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C90D288(v21, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C90D220((uint64_t)v6, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Group);
      uint64_t v22 = (char *)objc_allocWithZone((Class)DDQGroup);
      char v23 = (uint64_t *)&v22[OBJC_IVAR___DDQGroup__group];
      v23[3] = v34;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v23);
      sub_24C90D220((uint64_t)v3, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
      v35.receiver = v22;
      v35.super_class = (Class)DDQGroup;
      objc_msgSendSuper2(&v35, sel_init);
      sub_24C90C734((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C90C734((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C91A3D0();
      sub_24C91A400();
      sub_24C91A410();
      sub_24C91A3E0();
      int64_t v25 = sub_24C90B9E8(v16, v18, v20 & 1, v14);
      int64_t v16 = v25;
      int v18 = v26;
      char v20 = v27 & 1;
      if (!--v15)
      {
        sub_24C90D2F0(v25, v26, v27 & 1);
        unint64_t v28 = v37[0];
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    swift_once();
  }
  swift_bridgeObjectRelease();
  unint64_t v28 = MEMORY[0x263F8EE78];
LABEL_11:
  uint64_t v29 = sub_24C919894(v28);
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t sub_24C90CC40()
{
  uint64_t v0 = type metadata accessor for Group();
  uint64_t v27 = *(void *)(v0 - 8);
  uint64_t v28 = v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v6 = (char *)&v24 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v26 = (uint64_t)&v24 - v7;
  uint64_t v8 = _s20DarwinDirectoryQuery5GroupV13mutableGroupsShyACGvgZ_0();
  uint64_t v9 = *(void *)(v8 + 16);
  if (v9)
  {
    unint64_t v30 = MEMORY[0x263F8EE78];
    sub_24C91A3F0();
    uint64_t result = sub_24C90B944(v8);
    int64_t v11 = result;
    int v13 = v12;
    char v15 = v14 & 1;
    uint64_t v25 = v8 + 56;
    while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(unsigned char *)(v8 + 32))
    {
      if (((*(void *)(v25 + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      if (*(_DWORD *)(v8 + 36) != v13) {
        goto LABEL_13;
      }
      uint64_t v16 = v26;
      sub_24C90D220(*(void *)(v8 + 48) + *(void *)(v27 + 72) * v11, v26, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C90D288(v16, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C90D220((uint64_t)v6, (uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Group);
      int v17 = (char *)objc_allocWithZone((Class)DDQGroup);
      int v18 = (uint64_t *)&v17[OBJC_IVAR___DDQGroup__group];
      v18[3] = v28;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v18);
      sub_24C90D220((uint64_t)v3, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
      v29.receiver = v17;
      v29.super_class = (Class)DDQGroup;
      objc_msgSendSuper2(&v29, sel_init);
      sub_24C90C734((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C90C734((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C91A3D0();
      sub_24C91A400();
      sub_24C91A410();
      sub_24C91A3E0();
      uint64_t result = sub_24C90B9E8(v11, v13, v15 & 1, v8);
      int64_t v11 = result;
      int v13 = v20;
      char v15 = v21 & 1;
      if (!--v9)
      {
        sub_24C90D2F0(result, v20, v21 & 1);
        unint64_t v22 = v30;
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v22 = MEMORY[0x263F8EE78];
LABEL_10:
    uint64_t v23 = sub_24C919894(v22);
    swift_bridgeObjectRelease();
    return v23;
  }
  return result;
}

id sub_24C90CF30(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC360);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Group();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  int64_t v11 = (char *)&v17 - v10;
  sub_24C90D374(a1, (uint64_t)v4, &qword_2697FC360);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_24C90D3D8(a1, &qword_2697FC360);
    sub_24C90D3D8((uint64_t)v4, &qword_2697FC360);
    return 0;
  }
  else
  {
    sub_24C90D288((uint64_t)v4, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C90D220((uint64_t)v11, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Group);
    int v13 = (char *)objc_allocWithZone((Class)DDQGroup);
    char v14 = (uint64_t *)&v13[OBJC_IVAR___DDQGroup__group];
    v14[3] = v5;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v14);
    sub_24C90D220((uint64_t)v9, (uint64_t)boxed_opaque_existential_0, (uint64_t (*)(void))type metadata accessor for Group);
    v17.receiver = v13;
    v17.super_class = (Class)DDQGroup;
    id v12 = objc_msgSendSuper2(&v17, sel_init);
    sub_24C90C734((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C90D3D8(a1, &qword_2697FC360);
    sub_24C90C734((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for Group);
  }
  return v12;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24C90D1D8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_24C90D220(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C90D288(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C90D2F0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24C90D2FC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C90D334(uint64_t a1, uint64_t a2)
{
  return sub_24C910BF8(a1, a2, v2);
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

uint64_t sub_24C90D354@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24C906848(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_24C90D374(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C90D3D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_24C90D434(void *a1, void *a2, int *a3)
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
    uint64_t v11 = sub_24C91A260();
    id v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    *(void *)((char *)v4 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    *((unsigned char *)v4 + v13) = *((unsigned char *)a2 + v13);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24C90D54C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C90D5D8(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C91A260();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24C90D6A0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_24C90D774(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  return a1;
}

uint64_t sub_24C90D81C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_24C90D8D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_24C90D8F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t type metadata accessor for LibSystemGroupRecord(uint64_t a1)
{
  return sub_24C90E698(a1, (uint64_t *)&unk_2697FC388);
}

uint64_t sub_24C90D928()
{
  uint64_t result = sub_24C91A260();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_24C90D9E4(void *a1, void *a2, int *a3)
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
    uint64_t v11 = sub_24C91A260();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = a3[7];
    uint64_t v14 = a3[8];
    char v15 = (void *)((char *)v4 + v13);
    uint64_t v16 = (void *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *char v15 = *v16;
    v15[1] = v17;
    int v18 = (void *)((char *)v4 + v14);
    char v19 = (void *)((char *)a2 + v14);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = a3[10];
    *(_DWORD *)((char *)v4 + a3[9]) = *(_DWORD *)((char *)a2 + a3[9]);
    unint64_t v22 = (void *)((char *)v4 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    *unint64_t v22 = *v23;
    v22[1] = v24;
    *((unsigned char *)v4 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_24C90DB44(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C90DBF4(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C91A260();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v12);
  char v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)(a1 + v13);
  int v18 = (void *)(a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v21 = (void *)(a1 + v20);
  unint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24C90DD04(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v13);
  char v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)(a1 + v16);
  int v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_24C90DE4C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24C91A260();
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

uint64_t sub_24C90DF14(uint64_t a1, uint64_t a2, int *a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24C91A260();
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
  int v18 = (uint64_t *)(a2 + v16);
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  unint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v25 = *v23;
  uint64_t v24 = v23[1];
  *unint64_t v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  return a1;
}

uint64_t sub_24C90E018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C90E02C);
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
    uint64_t v8 = sub_24C91A260();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24C90E0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C90E0F4);
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
    uint64_t v7 = sub_24C91A260();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for LibSystemUserRecord(uint64_t a1)
{
  return sub_24C90E698(a1, (uint64_t *)&unk_2697FC398);
}

uint64_t sub_24C90E1C0()
{
  uint64_t result = sub_24C91A260();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24C90E27C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v10 = sub_24C91A260();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t sub_24C90E3A0(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 2)
  {
    uint64_t v3 = sub_24C91A260();
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  else if (result == 1)
  {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_24C90E444(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_24C91A260();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_24C90E524(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C90E61C((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = sub_24C91A260();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24C90E61C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DarwinDirectoryFilter(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for DarwinDirectoryFilter(uint64_t a1)
{
  return sub_24C90E698(a1, (uint64_t *)&unk_2697FC3A8);
}

uint64_t sub_24C90E698(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_24C90E6D0(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    uint64_t v6 = sub_24C91A260();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_24C90E788(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_24C90E61C((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      uint64_t v6 = sub_24C91A260();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_24C90E850(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24C90E878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24C90E8A8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24C90E8B8()
{
  uint64_t result = sub_24C91A260();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_24C90E958()
{
  return sub_24C91A480();
}

uint64_t sub_24C90EAC4()
{
  sub_24C91A460();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  uint64_t v1 = type metadata accessor for LibSystemGroupRecord(0);
  sub_24C91A260();
  sub_24C90EEE0(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v2 = *(void *)(v0 + *(int *)(v1 + 28));
  swift_bridgeObjectRetain();
  sub_24C907D74((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  sub_24C91A480();
  return sub_24C91A4A0();
}

uint64_t sub_24C90EBD0()
{
  return sub_24C91A4A0();
}

uint64_t sub_24C90EC14()
{
  return sub_24C91A4A0();
}

uint64_t sub_24C90EC54()
{
  return sub_24C90EEE0(&qword_2697FC3B8, (void (*)(uint64_t))type metadata accessor for LibSystemUserRecord);
}

uint64_t sub_24C90ECA0(uint64_t a1, uint64_t a2)
{
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  sub_24C91A260();
  sub_24C90EEE0(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_24C907D74(a1, v5);
  swift_bridgeObjectRelease();
  return sub_24C91A480();
}

uint64_t sub_24C90ED94(uint64_t a1, uint64_t a2)
{
  sub_24C91A460();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  sub_24C91A260();
  sub_24C90EEE0(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 28));
  swift_bridgeObjectRetain();
  sub_24C907D74((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  sub_24C91A480();
  return sub_24C91A4A0();
}

uint64_t sub_24C90EE98()
{
  return sub_24C90EEE0(&qword_2697FC3C0, (void (*)(uint64_t))type metadata accessor for LibSystemGroupRecord);
}

uint64_t sub_24C90EEE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C90EF28(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    goto LABEL_23;
  }
  if (*(void *)(a1 + 8) != *(void *)(a2 + 8) || *(void *)(a1 + 16) != *(void *)(a2 + 16))
  {
    char v5 = sub_24C91A440();
    char v6 = 0;
    if ((v5 & 1) == 0) {
      return v6 & 1;
    }
  }
  uint64_t v7 = (int *)type metadata accessor for LibSystemUserRecord(0);
  if ((sub_24C91A220() & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v8 = v7[7];
  uint64_t v9 = *(void *)(a1 + v8);
  uint64_t v10 = *(void *)(a1 + v8 + 8);
  uint64_t v11 = (void *)(a2 + v8);
  if (v9 != *v11 || v10 != v11[1])
  {
    char v13 = sub_24C91A440();
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
    char v19 = sub_24C91A440();
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
  uint64_t v23 = (void *)(a2 + v20);
  if (v21 == *v23 && v22 == v23[1] || (v24 = sub_24C91A440(), char v6 = 0, (v24 & 1) != 0)) {
    char v6 = *(unsigned char *)(a1 + v7[11]) ^ *(unsigned char *)(a2 + v7[11]) ^ 1;
  }
  return v6 & 1;
}

uint64_t sub_24C90F07C(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    goto LABEL_10;
  }
  BOOL v4 = *(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  if (v4 || (char v5 = sub_24C91A440(), v6 = 0, (v5 & 1) != 0))
  {
    uint64_t v7 = type metadata accessor for LibSystemGroupRecord(0);
    if ((sub_24C91A220() & 1) != 0
      && (sub_24C908D78(*(void *)(a1 + *(int *)(v7 + 28)), *(void *)(a2 + *(int *)(v7 + 28))) & 1) != 0)
    {
      char v6 = *(unsigned char *)(a1 + *(int *)(v7 + 32)) ^ *(unsigned char *)(a2 + *(int *)(v7 + 32)) ^ 1;
      return v6 & 1;
    }
LABEL_10:
    char v6 = 0;
  }
  return v6 & 1;
}

uint64_t initializeBufferWithCopyOfBuffer for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for ProviderSideEffects(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    long long v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *long long v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for ProviderSideEffects(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProviderSideEffects(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderSideEffects(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProviderSideEffects()
{
  return &type metadata for ProviderSideEffects;
}

uint64_t User.hashValue.getter()
{
  return sub_24C91A4A0();
}

uint64_t User.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24C91A260();
  long long v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t User.uid.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User() + 20));
}

uint64_t User.name.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.fullName.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.homeDirectory.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.primaryGroupID.getter()
{
  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User() + 36));
}

uint64_t User.shell.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for User() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.hash(into:)()
{
  sub_24C91A260();
  sub_24C90FE68(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  type metadata accessor for User();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24C90F874()
{
  return sub_24C91A4A0();
}

uint64_t sub_24C90F8B8()
{
  return sub_24C91A4A0();
}

uint64_t sub_24C90F8F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24C91A260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (int *)type metadata accessor for LibSystemUserRecord(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - v16;
  sub_24C9106B4(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_24C91071C(a1);
    sub_24C91071C((uint64_t)v10);
    uint64_t v18 = type metadata accessor for User();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a2, 1, 1, v18);
  }
  else
  {
    sub_24C91077C((uint64_t)v10, (uint64_t)v17);
    sub_24C9107E0((uint64_t)v17, (uint64_t)v15);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v15[v11[6]], v4);
    int v20 = *(_DWORD *)v15;
    uint64_t v21 = *((void *)v15 + 2);
    uint64_t v41 = *((void *)v15 + 1);
    uint64_t v42 = a1;
    uint64_t v22 = v11[8];
    uint64_t v23 = &v15[v11[7]];
    uint64_t v24 = *((void *)v23 + 1);
    uint64_t v36 = *(void *)v23;
    uint64_t v25 = *(void *)&v15[v22];
    uint64_t v26 = *(void *)&v15[v22 + 8];
    uint64_t v27 = v11[10];
    LODWORD(v23) = *(_DWORD *)&v15[v11[9]];
    int v37 = v20;
    int v38 = (int)v23;
    uint64_t v28 = &v15[v27];
    uint64_t v29 = *(void *)&v15[v27];
    uint64_t v30 = *((void *)v28 + 1);
    uint64_t v39 = v25;
    uint64_t v40 = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_24C910844((uint64_t)v15);
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    uint64_t v31 = (int *)type metadata accessor for User();
    *(_DWORD *)(a2 + v31[5]) = v37;
    uint64_t v32 = (void *)(a2 + v31[6]);
    *uint64_t v32 = v41;
    v32[1] = v21;
    uint64_t v33 = (void *)(a2 + v31[7]);
    *uint64_t v33 = v36;
    v33[1] = v24;
    uint64_t v34 = (void *)(a2 + v31[8]);
    *uint64_t v34 = v39;
    v34[1] = v26;
    *(_DWORD *)(a2 + v31[9]) = v38;
    objc_super v35 = (void *)(a2 + v31[10]);
    *objc_super v35 = v40;
    v35[1] = v30;
    sub_24C91071C(v42);
    sub_24C910844((uint64_t)v17);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, int *))(*((void *)v31 - 1) + 56))(a2, 0, 1, v31);
  }
}

uint64_t _s20DarwinDirectoryQuery4UserV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_24C91A220() & 1) == 0) {
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
  if (v10 || (v11 = sub_24C91A440(), uint64_t result = 0, (v11 & 1) != 0))
  {
    uint64_t v13 = v5[7];
    uint64_t v14 = *(void *)(a1 + v13);
    uint64_t v15 = *(void *)(a1 + v13 + 8);
    uint64_t v16 = (void *)(a2 + v13);
    BOOL v17 = v14 == *v16 && v15 == v16[1];
    if (v17 || (v18 = sub_24C91A440(), uint64_t result = 0, (v18 & 1) != 0))
    {
      uint64_t v19 = v5[8];
      uint64_t v20 = *(void *)(a1 + v19);
      uint64_t v21 = *(void *)(a1 + v19 + 8);
      uint64_t v22 = (void *)(a2 + v19);
      BOOL v23 = v20 == *v22 && v21 == v22[1];
      if (v23 || (v24 = sub_24C91A440(), uint64_t result = 0, (v24 & 1) != 0))
      {
        if (*(_DWORD *)(a1 + v5[9]) == *(_DWORD *)(a2 + v5[9]))
        {
          uint64_t v25 = v5[10];
          uint64_t v26 = *(void *)(a1 + v25);
          uint64_t v27 = *(void *)(a1 + v25 + 8);
          uint64_t v28 = (void *)(a2 + v25);
          if (v26 == *v28 && v27 == v28[1]) {
            return 1;
          }
          return sub_24C91A440();
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for User()
{
  uint64_t result = qword_2697FC3D0;
  if (!qword_2697FC3D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C90FE20()
{
  return sub_24C90FE68(&qword_2697FC3C8, (void (*)(uint64_t))type metadata accessor for User);
}

uint64_t sub_24C90FE68(unint64_t *a1, void (*a2)(uint64_t))
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
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_24C91A260();
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
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    BOOL v17 = (uint64_t *)((char *)a1 + v13);
    char v18 = (uint64_t *)((char *)a2 + v13);
    uint64_t v19 = v18[1];
    *BOOL v17 = *v18;
    v17[1] = v19;
    uint64_t v20 = a3[10];
    *(_DWORD *)((char *)a1 + a3[9]) = *(_DWORD *)((char *)a2 + a3[9]);
    uint64_t v21 = (uint64_t *)((char *)a1 + v20);
    uint64_t v22 = (uint64_t *)((char *)a2 + v20);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for User(uint64_t a1)
{
  uint64_t v2 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
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
  uint64_t v16 = (void *)(a1 + v12);
  BOOL v17 = (void *)(a2 + v12);
  uint64_t v18 = v17[1];
  void *v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
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
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[8];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v16 = a3[10];
  BOOL v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *BOOL v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_24C91A260();
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
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[10];
  *(_DWORD *)(a1 + a3[9]) = *(_DWORD *)(a2 + a3[9]);
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for User(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C910470);
}

uint64_t sub_24C910470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24C91A260();
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

uint64_t storeEnumTagSinglePayload for User(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C910548);
}

uint64_t sub_24C910548(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_24C91A260();
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

uint64_t sub_24C910608()
{
  uint64_t result = sub_24C91A260();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24C9106B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C91071C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C91077C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C9107E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C910844(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C9108A0(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v5 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v29 = *(void *)(v5 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v28 = (uint64_t)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v27 = (uint64_t)&v25 - v8;
  uint64_t v9 = type metadata accessor for Group();
  uint64_t v26 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v32 = (uint64_t)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (!v11) {
    return v12;
  }
  uint64_t v33 = MEMORY[0x263F8EE78];
  sub_24C917C34(0, v11, 0);
  uint64_t result = sub_24C90B940(a3);
  uint64_t v14 = result;
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  uint64_t v25 = a3 + 56;
  while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(a3 + 32))
  {
    if (((*(void *)(v25 + (((unint64_t)v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
      goto LABEL_17;
    }
    if (*(_DWORD *)(a3 + 36) != v16) {
      goto LABEL_18;
    }
    uint64_t v19 = v27;
    sub_24C91A0EC(*(void *)(a3 + 48) + *(void *)(v29 + 72) * v14, v27, type metadata accessor for LibSystemGroupRecord);
    uint64_t v20 = v28;
    sub_24C91A03C(v19, v28, type metadata accessor for LibSystemGroupRecord);
    v30(v20);
    sub_24C91A154(v20, type metadata accessor for LibSystemGroupRecord);
    uint64_t v12 = v33;
    if (v3)
    {
      swift_release();
      return v12;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_24C917C34(0, *(void *)(v12 + 16) + 1, 1);
      uint64_t v12 = v33;
    }
    unint64_t v22 = *(void *)(v12 + 16);
    unint64_t v21 = *(void *)(v12 + 24);
    if (v22 >= v21 >> 1)
    {
      sub_24C917C34(v21 > 1, v22 + 1, 1);
      uint64_t v12 = v33;
    }
    *(void *)(v12 + 16) = v22 + 1;
    sub_24C91A03C(v32, v12+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(void *)(v26 + 72) * v22, (uint64_t (*)(void))type metadata accessor for Group);
    uint64_t result = sub_24C90B9E4(v14, v16, v18 & 1, a3);
    uint64_t v14 = result;
    uint64_t v16 = v23;
    char v18 = v24 & 1;
    if (!--v11)
    {
      sub_24C90D2F0(result, v23, v24 & 1);
      return v12;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_24C910BF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24C910C4C(a1, a2, a3, type metadata accessor for LibSystemGroupRecord, (void (*)(uint64_t))sub_24C908C3C, (void (*)(char *, char *))sub_24C912B68, type metadata accessor for LibSystemGroupRecord);
}

uint64_t sub_24C910C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(uint64_t), void (*a6)(char *, char *), uint64_t (*a7)(void))
{
  uint64_t v11 = a4(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v18 - v15;
  a5(a1);
  swift_beginAccess();
  a6(v16, v14);
  swift_endAccess();
  return sub_24C91A154((uint64_t)v16, a7);
}

uint64_t sub_24C910D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t sub_24C910DB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24C91A260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  uint64_t v11 = swift_allocBox();
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for LibSystemGroupRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_24C91A0EC(a1, (uint64_t)v10, type metadata accessor for DarwinDirectoryFilter);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v16 = *v10;
      uint64_t v17 = v10[1];
      swift_retain();
      sub_24C9117A0(v16, v17, v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, v4);
      uint64_t v31 = sub_24C91A250();
      char v32 = v20;
      char v33 = v21;
      char v34 = v22;
      char v35 = v23;
      char v36 = v24;
      char v37 = v25;
      char v38 = v26;
      char v39 = v27;
      v44 = sub_24C919C6C;
      uint64_t v45 = v11;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v41 = 1107296256;
      uint64_t v42 = sub_24C910D54;
      uint64_t v43 = &block_descriptor_12;
      uint64_t v28 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      DarwinDirectoryRecordStoreApplyWithUUIDFilter(1, (const unsigned __int8 *)&v31, v28);
      _Block_release(v28);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
    uint64_t v18 = *(unsigned int *)v10;
    v44 = sub_24C919C6C;
    uint64_t v45 = v11;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v41 = 1107296256;
    uint64_t v42 = sub_24C910D54;
    uint64_t v43 = &block_descriptor_15;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    DarwinDirectoryRecordStoreApplyWithIDFilter(1, v18, v19);
    _Block_release(v19);
  }
  swift_beginAccess();
  sub_24C90D374(v13, a2, &qword_2697FC308);
  return swift_release();
}

uint64_t sub_24C9111B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24C91A260();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (uint64_t *)((char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  uint64_t v11 = swift_allocBox();
  uint64_t v13 = v12;
  uint64_t v14 = type metadata accessor for LibSystemUserRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  sub_24C91A0EC(a1, (uint64_t)v10, type metadata accessor for DarwinDirectoryFilter);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v16 = *v10;
      uint64_t v17 = v10[1];
      swift_retain();
      sub_24C911918(v16, v17, v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, v4);
      uint64_t v31 = sub_24C91A250();
      char v32 = v20;
      char v33 = v21;
      char v34 = v22;
      char v35 = v23;
      char v36 = v24;
      char v37 = v25;
      char v38 = v26;
      char v39 = v27;
      v44 = sub_24C919EAC;
      uint64_t v45 = v11;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v41 = 1107296256;
      uint64_t v42 = sub_24C910D54;
      uint64_t v43 = &block_descriptor_32;
      uint64_t v28 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      DarwinDirectoryRecordStoreApplyWithUUIDFilter(0, (const unsigned __int8 *)&v31, v28);
      _Block_release(v28);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  else
  {
    uint64_t v18 = *(unsigned int *)v10;
    v44 = sub_24C919EAC;
    uint64_t v45 = v11;
    uint64_t aBlock = MEMORY[0x263EF8330];
    uint64_t v41 = 1107296256;
    uint64_t v42 = sub_24C910D54;
    uint64_t v43 = &block_descriptor_35;
    uint64_t v19 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    DarwinDirectoryRecordStoreApplyWithIDFilter(0, v18, v19);
    _Block_release(v19);
  }
  swift_beginAccess();
  sub_24C90D374(v13, a2, &qword_2697FC378);
  return swift_release();
}

uint64_t sub_24C9115BC(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t *a4, void (*a5)(uint64_t), uint64_t (*a6)(void))
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a4);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_projectBox();
  a5(a1);
  uint64_t v15 = a6(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 0, 1, v15);
  swift_beginAccess();
  uint64_t result = sub_24C919EF8((uint64_t)v13, v14, a4);
  *a2 = 1;
  return result;
}

void sub_24C9116E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  v8[5] = a2;
  v8[3] = a4;
  v8[4] = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1107296256;
  v8[2] = sub_24C910D54;
  uint64_t v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApplyWithNameFilter(a5, a1, v7);
  _Block_release(v7);
}

uint64_t sub_24C9117A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_24C91A3A0();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v3 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else {
      uint64_t v3 = sub_24C91A3C0();
    }
    sub_24C919DE0(v3);
    return swift_release();
  }
  v7[0] = a1;
  v7[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  v6[4] = sub_24C919C6C;
  v6[5] = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_24C910D54;
  v6[3] = &block_descriptor_18;
  uint64_t v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApplyWithNameFilter(1, (uint64_t)v7, v5);
  _Block_release(v5);
  return swift_release();
}

uint64_t sub_24C911918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_24C91A3A0();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v3 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else {
      uint64_t v3 = sub_24C91A3C0();
    }
    sub_24C919F5C(v3);
    return swift_release();
  }
  v7[0] = a1;
  v7[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  v6[4] = sub_24C919EAC;
  v6[5] = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_24C910D54;
  v6[3] = &block_descriptor_39;
  uint64_t v5 = _Block_copy(v6);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApplyWithNameFilter(0, (uint64_t)v7, v5);
  _Block_release(v5);
  return swift_release();
}

uint64_t static User.allUsers.getter()
{
  return sub_24C911AC0((uint64_t (*)(void *))sub_24C917E4C);
}

uint64_t static User.mutableUsers.getter()
{
  return sub_24C911AC0((uint64_t (*)(void *))sub_24C9183C4);
}

uint64_t sub_24C911AC0(uint64_t (*a1)(void *))
{
  unint64_t v1 = a1;
  if (qword_2697FC2E0 != -1)
  {
    swift_once();
    unint64_t v1 = a1;
  }
  return v1(&unk_2697FC3E0);
}

uint64_t static User.with(uuid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v14[3] = &type metadata for ProviderSideEffects;
  v14[4] = &off_26FEFD820;
  v14[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v14[0] + 16);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(v14, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  uint64_t v11 = sub_24C91A260();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v6, a1, v11);
  swift_storeEnumTagMultiPayload();
  sub_24C9111B8((uint64_t)v6, (uint64_t)v9);
  sub_24C91A154((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90F8F8((uint64_t)v9, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t static User.with(uid:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (_DWORD *)((char *)&v13[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v13[3] = &type metadata for ProviderSideEffects;
  v13[4] = &off_26FEFD820;
  v13[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v13[0] + 16);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(v13, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  *uint64_t v6 = a1;
  swift_storeEnumTagMultiPayload();
  sub_24C9111B8((uint64_t)v6, (uint64_t)v9);
  sub_24C91A154((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90F8F8((uint64_t)v9, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t static User.with(name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (void *)((char *)&v15[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC378);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v15[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v15[3] = &type metadata for ProviderSideEffects;
  v15[4] = &off_26FEFD820;
  v15[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v15[0] + 16);
  uint64_t v12 = __swift_project_boxed_opaque_existential_1(v15, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  *uint64_t v8 = a1;
  v8[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_24C9111B8((uint64_t)v8, (uint64_t)v11);
  sub_24C91A154((uint64_t)v8, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90F8F8((uint64_t)v11, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t static Group.allGroups.getter()
{
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v10[3] = &type metadata for ProviderSideEffects;
  v10[4] = &off_26FEFD820;
  v10[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v10[0] + 16);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x263F8EE88];
  unint64_t v1 = (uint64_t *)(v0 + 16);
  aBlock[4] = sub_24C9189A0;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C910D54;
  aBlock[3] = &block_descriptor_0;
  uint64_t v2 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v2);
  swift_beginAccess();
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  uint64_t v4 = swift_release();
  MEMORY[0x270FA5388](v4);
  v8[2] = v10;
  uint64_t v5 = sub_24C9108A0((void (*)(uint64_t))sub_24C90D354, (uint64_t)v8, v3);
  swift_bridgeObjectRelease();
  uint64_t v6 = sub_24C9192E0(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v6;
}

uint64_t static Group.with(uuid:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v14[3] = &type metadata for ProviderSideEffects;
  v14[4] = &off_26FEFD820;
  v14[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v14[0] + 16);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(v14, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  uint64_t v11 = sub_24C91A260();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v6, a1, v11);
  swift_storeEnumTagMultiPayload();
  sub_24C910DB4((uint64_t)v6, (uint64_t)v9);
  sub_24C91A154((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90881C((uint64_t)v14, (uint64_t)v13);
  sub_24C906470((uint64_t)v9, (uint64_t)v13, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t static Group.with(gid:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v13[3] = &type metadata for ProviderSideEffects;
  v13[4] = &off_26FEFD820;
  v13[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v13[0] + 16);
  uint64_t v10 = __swift_project_boxed_opaque_existential_1(v13, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  *uint64_t v6 = a1;
  swift_storeEnumTagMultiPayload();
  sub_24C910DB4((uint64_t)v6, (uint64_t)v9);
  sub_24C91A154((uint64_t)v6, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90881C((uint64_t)v13, (uint64_t)v12);
  sub_24C906470((uint64_t)v9, (uint64_t)v12, a2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t static Group.with(name:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for DarwinDirectoryFilter(0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = &v14[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC308);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = &v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v15[3] = &type metadata for ProviderSideEffects;
  v15[4] = &off_26FEFD820;
  v15[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v15[0] + 16);
  uint64_t v12 = __swift_project_boxed_opaque_existential_1(v15, (uint64_t)&type metadata for ProviderSideEffects);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  *uint64_t v8 = a1;
  v8[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_24C910DB4((uint64_t)v8, (uint64_t)v11);
  sub_24C91A154((uint64_t)v8, type metadata accessor for DarwinDirectoryFilter);
  sub_24C90881C((uint64_t)v15, (uint64_t)v14);
  sub_24C906470((uint64_t)v11, (uint64_t)v14, a3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

void sub_24C9127B4()
{
  qword_2697FC3F8 = (uint64_t)&type metadata for LibSystemDarwinDirectoryProvider;
  unk_2697FC400 = &off_26FEFD700;
}

uint64_t sub_24C9127D4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (int *)type metadata accessor for LibSystemUserRecord(0);
  uint64_t v6 = *((void *)v5 - 1);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = *v2;
  sub_24C91A460();
  swift_bridgeObjectRetain();
  sub_24C90E958();
  uint64_t v13 = sub_24C91A4A0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  unint64_t v15 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
  {
    char v36 = v11;
    uint64_t v37 = a1;
    uint64_t v16 = ~v14;
    uint64_t v17 = *(void *)(v6 + 72);
    while (1)
    {
      sub_24C91A0EC(*(void *)(v12 + 48) + v17 * v15, (uint64_t)v9, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a2)
      {
        BOOL v18 = *((void *)v9 + 1) == *(void *)(a2 + 8) && *((void *)v9 + 2) == *(void *)(a2 + 16);
        if (v18 || (sub_24C91A440()) && (sub_24C91A220())
        {
          uint64_t v19 = v5[7];
          uint64_t v20 = *(void *)&v9[v19];
          uint64_t v21 = *(void *)&v9[v19 + 8];
          char v22 = (void *)(a2 + v19);
          BOOL v23 = v20 == *v22 && v21 == v22[1];
          if (v23 || (sub_24C91A440() & 1) != 0)
          {
            uint64_t v24 = v5[8];
            uint64_t v25 = *(void *)&v9[v24];
            uint64_t v26 = *(void *)&v9[v24 + 8];
            char v27 = (void *)(a2 + v24);
            BOOL v28 = v25 == *v27 && v26 == v27[1];
            if (v28 || (sub_24C91A440()) && *(_DWORD *)&v9[v5[9]] == *(_DWORD *)(a2 + v5[9]))
            {
              if ((uint64_t v29 = v5[10],
                    uint64_t v30 = *(void *)&v9[v29],
                    uint64_t v31 = *(void *)&v9[v29 + 8],
                    char v32 = (void *)(a2 + v29),
                    v30 == *v32)
                && v31 == v32[1]
                || (sub_24C91A440() & 1) != 0)
              {
                if (v9[v5[11]] == *(unsigned char *)(a2 + v5[11])) {
                  break;
                }
              }
            }
          }
        }
      }
      sub_24C91A154((uint64_t)v9, type metadata accessor for LibSystemUserRecord);
      unint64_t v15 = (v15 + 1) & v16;
      if (((*(void *)(v12 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v11 = v36;
        a1 = v37;
        goto LABEL_29;
      }
    }
    sub_24C91A154((uint64_t)v9, type metadata accessor for LibSystemUserRecord);
    swift_bridgeObjectRelease();
    sub_24C91A154(a2, type metadata accessor for LibSystemUserRecord);
    sub_24C91A0EC(*(void *)(*v2 + 48) + v17 * v15, v37, type metadata accessor for LibSystemUserRecord);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_29:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24C91A0EC(a2, (uint64_t)v11, type metadata accessor for LibSystemUserRecord);
    uint64_t v38 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_24C914B9C((uint64_t)v11, v15, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v38;
    swift_bridgeObjectRelease();
    sub_24C91A03C(a2, a1, type metadata accessor for LibSystemUserRecord);
    return 1;
  }
}

uint64_t sub_24C912B68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v25 = (uint64_t)&v23 - v11;
  uint64_t v12 = *v2;
  sub_24C91A460();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  sub_24C91A260();
  sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v27 = *(int *)(v6 + 28);
  uint64_t v13 = *(void *)(a2 + v27);
  swift_bridgeObjectRetain();
  sub_24C907D74((uint64_t)v28, v13);
  swift_bridgeObjectRelease();
  uint64_t v26 = *(int *)(v6 + 32);
  sub_24C91A480();
  uint64_t v14 = sub_24C91A4A0();
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
      sub_24C91A0EC(*(void *)(v12 + 48) + v18 * v16, (uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v10 == *(_DWORD *)a2)
      {
        BOOL v19 = *((void *)v10 + 1) == *(void *)(a2 + 8) && *((void *)v10 + 2) == *(void *)(a2 + 16);
        if (v19 || (sub_24C91A440())
          && (sub_24C91A220() & 1) != 0
          && (sub_24C908D78(*(void *)&v10[*(int *)(v6 + 28)], *(void *)(a2 + v27)) & 1) != 0
          && v10[*(int *)(v6 + 32)] == *(unsigned char *)(a2 + v26))
        {
          sub_24C91A154((uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
          swift_bridgeObjectRelease();
          sub_24C91A154(a2, type metadata accessor for LibSystemGroupRecord);
          sub_24C91A0EC(*(void *)(*v23 + 48) + v18 * v16, v24, type metadata accessor for LibSystemGroupRecord);
          return 0;
        }
      }
      sub_24C91A154((uint64_t)v10, type metadata accessor for LibSystemGroupRecord);
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
  sub_24C91A0EC(a2, v25, type metadata accessor for LibSystemGroupRecord);
  v28[0] = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_24C914ED8(v22, v16, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v28[0];
  swift_bridgeObjectRelease();
  sub_24C91A03C(a2, a1, type metadata accessor for LibSystemGroupRecord);
  return 1;
}

uint64_t sub_24C912F38(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_24C91A460();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  uint64_t v8 = sub_24C91A4A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24C91A440() & 1) != 0)
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
      if (v19 || (sub_24C91A440() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24C9155F4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_24C9130E8(void *a1, void *a2, void (*a3)(void), uint64_t *a4, void (*a5)(void))
{
  uint64_t v9 = v5;
  uint64_t v12 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v12 < 0) {
      uint64_t v13 = *v5;
    }
    else {
      uint64_t v13 = v12 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v14 = a2;
    uint64_t v15 = sub_24C91A340();

    if (v15)
    {
      swift_bridgeObjectRelease();

      a3(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v37;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_24C91A330();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v27 = sub_24C9133A4(v13, result + 1, a4, a5);
    uint64_t v38 = v27;
    unint64_t v28 = *(void *)(v27 + 16);
    if (*(void *)(v27 + 24) <= v28)
    {
      uint64_t v33 = v28 + 1;
      id v34 = v14;
      sub_24C91487C(v33, a4);
      uint64_t v29 = v38;
    }
    else
    {
      uint64_t v29 = v27;
      id v30 = v14;
    }
    sub_24C914B18((uint64_t)v14, v29);
    *uint64_t v9 = v29;
    swift_bridgeObjectRelease();
    *a1 = v14;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_24C91A2E0();
    uint64_t v18 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v19 = v17 & ~v18;
    if ((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19))
    {
      a3(0);
      id v20 = *(id *)(*(void *)(v12 + 48) + 8 * v19);
      char v21 = sub_24C91A2F0();

      if (v21)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v25 = *(void **)(*(void *)(*v5 + 48) + 8 * v19);
        *a1 = v25;
        id v26 = v25;
        return 0;
      }
      uint64_t v22 = ~v18;
      while (1)
      {
        unint64_t v19 = (v19 + 1) & v22;
        if (((*(void *)(v12 + 56 + ((v19 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v19) & 1) == 0) {
          break;
        }
        id v23 = *(id *)(*(void *)(v12 + 48) + 8 * v19);
        char v24 = sub_24C91A2F0();

        if (v24) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *v5;
    *uint64_t v5 = 0x8000000000000000;
    id v32 = a2;
    sub_24C915790((uint64_t)v32, v19, isUniquelyReferenced_nonNull_native, a4, a5);
    *uint64_t v5 = v39;
    swift_bridgeObjectRelease();
    *a1 = v32;
  }
  return 1;
}

uint64_t sub_24C9133A4(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(void))
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    uint64_t v6 = sub_24C91A380();
    uint64_t v19 = v6;
    sub_24C91A320();
    if (sub_24C91A350())
    {
      a4(0);
      do
      {
        swift_dynamicCast();
        uint64_t v6 = v19;
        unint64_t v13 = *(void *)(v19 + 16);
        if (*(void *)(v19 + 24) <= v13)
        {
          sub_24C91487C(v13 + 1, a3);
          uint64_t v6 = v19;
        }
        uint64_t result = sub_24C91A2E0();
        uint64_t v8 = v6 + 56;
        uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
        unint64_t v10 = result & ~v9;
        unint64_t v11 = v10 >> 6;
        if (((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          unint64_t v12 = __clz(__rbit64((-1 << v10) & ~*(void *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v14 = 0;
          unint64_t v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v16 = v11 == v15;
            if (v11 == v15) {
              unint64_t v11 = 0;
            }
            v14 |= v16;
            uint64_t v17 = *(void *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          unint64_t v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(void *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(void *)(*(void *)(v6 + 48) + 8 * v12) = v18;
        ++*(void *)(v6 + 16);
      }
      while (sub_24C91A350());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE88];
  }
  return v6;
}

uint64_t sub_24C9135A0()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v28 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC320);
  uint64_t v6 = sub_24C91A370();
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
        id v20 = v27;
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
                void *v20 = -1 << v24;
              }
              unint64_t v1 = v25;
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
      sub_24C91A03C(*(void *)(v29 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
      sub_24C91A460();
      sub_24C91A490();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      sub_24C91A260();
      sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
      sub_24C91A270();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      sub_24C91A490();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      sub_24C91A480();
      sub_24C91A4A0();
      unint64_t v18 = sub_24C91A310();
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, type metadata accessor for LibSystemUserRecord);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v7;
  return result;
}

uint64_t sub_24C9139B8()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for User();
  uint64_t v27 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC310);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v24 = v0;
    uint64_t v25 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v26 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t v28 = v5;
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
LABEL_30:
          __break(1u);
          return result;
        }
        if (v19 >= v26) {
          goto LABEL_23;
        }
        unint64_t v20 = v25[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v26) {
            goto LABEL_23;
          }
          unint64_t v20 = v25[v14];
          if (!v20)
          {
            int64_t v14 = v19 + 2;
            if (v19 + 2 >= v26) {
              goto LABEL_23;
            }
            unint64_t v20 = v25[v14];
            if (!v20)
            {
              int64_t v21 = v19 + 3;
              if (v21 >= v26)
              {
LABEL_23:
                uint64_t v22 = v28;
                swift_release();
                uint64_t v23 = 1 << *(unsigned char *)(v22 + 32);
                if (v23 > 63) {
                  bzero(v25, ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v25 = -1 << v23;
                }
                unint64_t v1 = v24;
                *(void *)(v22 + 16) = 0;
                break;
              }
              unint64_t v20 = v25[v21];
              if (!v20)
              {
                while (1)
                {
                  int64_t v14 = v21 + 1;
                  if (__OFADD__(v21, 1)) {
                    goto LABEL_30;
                  }
                  if (v14 >= v26) {
                    goto LABEL_23;
                  }
                  unint64_t v20 = v25[v14];
                  ++v21;
                  if (v20) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v14 = v21;
            }
          }
        }
LABEL_22:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v16 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      uint64_t v17 = *(void *)(v27 + 72);
      sub_24C91A03C(*(void *)(v28 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C91A460();
      sub_24C91A260();
      sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
      sub_24C91A270();
      sub_24C91A490();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      sub_24C91A490();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      sub_24C91A4A0();
      unint64_t v18 = sub_24C91A310();
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, (uint64_t (*)(void))type metadata accessor for User);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v7;
  return result;
}

uint64_t sub_24C913E08()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v28 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC318);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v25 = v0;
    int64_t v26 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v27 = (unint64_t)(v8 + 63) >> 6;
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
        int64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
        if (v20 >= v27) {
          goto LABEL_23;
        }
        unint64_t v21 = v26[v20];
        ++v14;
        if (!v21)
        {
          int64_t v14 = v20 + 1;
          if (v20 + 1 >= v27) {
            goto LABEL_23;
          }
          unint64_t v21 = v26[v14];
          if (!v21)
          {
            int64_t v14 = v20 + 2;
            if (v20 + 2 >= v27) {
              goto LABEL_23;
            }
            unint64_t v21 = v26[v14];
            if (!v21)
            {
              int64_t v22 = v20 + 3;
              if (v22 >= v27)
              {
LABEL_23:
                uint64_t v23 = v29;
                swift_release();
                uint64_t v24 = 1 << *(unsigned char *)(v23 + 32);
                if (v24 > 63) {
                  bzero(v26, ((unint64_t)(v24 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v26 = -1 << v24;
                }
                unint64_t v1 = v25;
                *(void *)(v23 + 16) = 0;
                break;
              }
              unint64_t v21 = v26[v22];
              if (!v21)
              {
                while (1)
                {
                  int64_t v14 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_30;
                  }
                  if (v14 >= v27) {
                    goto LABEL_23;
                  }
                  unint64_t v21 = v26[v14];
                  ++v22;
                  if (v21) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v14 = v22;
            }
          }
        }
LABEL_22:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v16 = __clz(__rbit64(v21)) + (v14 << 6);
      }
      uint64_t v17 = *(void *)(v28 + 72);
      sub_24C91A03C(*(void *)(v29 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemGroupRecord);
      sub_24C91A460();
      sub_24C91A490();
      swift_bridgeObjectRetain();
      sub_24C91A2A0();
      swift_bridgeObjectRelease();
      sub_24C91A260();
      sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
      sub_24C91A270();
      uint64_t v18 = *(void *)&v4[*(int *)(v2 + 28)];
      swift_bridgeObjectRetain();
      sub_24C907D74((uint64_t)v30, v18);
      swift_bridgeObjectRelease();
      sub_24C91A480();
      sub_24C91A4A0();
      unint64_t v19 = sub_24C91A310();
      *(void *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v19 * v17, type metadata accessor for LibSystemGroupRecord);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v7;
  return result;
}

uint64_t sub_24C9141EC()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Group();
  uint64_t v27 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC428);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v24 = v0;
    uint64_t v25 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    int64_t v26 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v12 = v6 + 56;
    uint64_t v28 = v5;
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
LABEL_30:
          __break(1u);
          return result;
        }
        if (v19 >= v26) {
          goto LABEL_23;
        }
        unint64_t v20 = v25[v19];
        ++v14;
        if (!v20)
        {
          int64_t v14 = v19 + 1;
          if (v19 + 1 >= v26) {
            goto LABEL_23;
          }
          unint64_t v20 = v25[v14];
          if (!v20)
          {
            int64_t v14 = v19 + 2;
            if (v19 + 2 >= v26) {
              goto LABEL_23;
            }
            unint64_t v20 = v25[v14];
            if (!v20)
            {
              int64_t v21 = v19 + 3;
              if (v21 >= v26)
              {
LABEL_23:
                uint64_t v22 = v28;
                swift_release();
                uint64_t v23 = 1 << *(unsigned char *)(v22 + 32);
                if (v23 > 63) {
                  bzero(v25, ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v25 = -1 << v23;
                }
                unint64_t v1 = v24;
                *(void *)(v22 + 16) = 0;
                break;
              }
              unint64_t v20 = v25[v21];
              if (!v20)
              {
                while (1)
                {
                  int64_t v14 = v21 + 1;
                  if (__OFADD__(v21, 1)) {
                    goto LABEL_30;
                  }
                  if (v14 >= v26) {
                    goto LABEL_23;
                  }
                  unint64_t v20 = v25[v14];
                  ++v21;
                  if (v20) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v14 = v21;
            }
          }
        }
LABEL_22:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v16 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      uint64_t v17 = *(void *)(v27 + 72);
      sub_24C91A03C(*(void *)(v28 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C91A460();
      sub_24C91A260();
      sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
      sub_24C91A270();
      sub_24C91A490();
      sub_24C91A2A0();
      sub_24C907A48(v29, *(void *)&v4[*(int *)(v2 + 28)]);
      sub_24C91A4A0();
      unint64_t v18 = sub_24C91A310();
      *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, (uint64_t (*)(void))type metadata accessor for Group);
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v7;
  return result;
}

uint64_t sub_24C91459C()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC418);
  uint64_t v3 = sub_24C91A370();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
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
                unint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
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
      sub_24C91A460();
      sub_24C91A2A0();
      uint64_t result = sub_24C91A4A0();
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *unint64_t v1 = v4;
  return result;
}

uint64_t sub_24C91487C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_24C91A370();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    id v30 = v2;
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    int64_t v8 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v4 + 56);
    int64_t v11 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v12 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }
      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_33;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_33;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                uint64_t v3 = v30;
                uint64_t v29 = 1 << *(unsigned char *)(v4 + 32);
                if (v29 > 63) {
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v8 = -1 << v29;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_39;
                  }
                  if (v14 >= v11) {
                    goto LABEL_33;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v14 = v20;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v4 + 48) + 8 * v17);
      uint64_t result = sub_24C91A2E0();
      uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          uint64_t v28 = *(void *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v6;
  return result;
}

unint64_t sub_24C914B18(uint64_t a1, uint64_t a2)
{
  sub_24C91A2E0();
  unint64_t result = sub_24C91A310();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_24C914B9C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  int64_t v8 = (int *)type metadata accessor for LibSystemUserRecord(0);
  uint64_t v9 = *((void *)v8 - 1);
  MEMORY[0x270FA5388](v8);
  int64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0) {
    goto LABEL_34;
  }
  if (a3)
  {
    sub_24C9135A0();
  }
  else
  {
    if (v13 > v12)
    {
      sub_24C91591C();
      goto LABEL_34;
    }
    sub_24C91613C();
  }
  uint64_t v14 = *v4;
  sub_24C91A460();
  sub_24C90E958();
  uint64_t v15 = sub_24C91A4A0();
  uint64_t v16 = -1 << *(unsigned char *)(v14 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v9 + 72);
    do
    {
      sub_24C91A0EC(*(void *)(v14 + 48) + v18 * a2, (uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      if (*(_DWORD *)v11 == *(_DWORD *)a1)
      {
        BOOL v19 = *((void *)v11 + 1) == *(void *)(a1 + 8) && *((void *)v11 + 2) == *(void *)(a1 + 16);
        if (v19 || (sub_24C91A440()) && (sub_24C91A220())
        {
          uint64_t v20 = v8[7];
          uint64_t v21 = *(void *)&v11[v20];
          uint64_t v22 = *(void *)&v11[v20 + 8];
          unint64_t v23 = (void *)(a1 + v20);
          BOOL v24 = v21 == *v23 && v22 == v23[1];
          if (v24 || (sub_24C91A440() & 1) != 0)
          {
            uint64_t v25 = v8[8];
            uint64_t v26 = *(void *)&v11[v25];
            uint64_t v27 = *(void *)&v11[v25 + 8];
            uint64_t v28 = (void *)(a1 + v25);
            BOOL v29 = v26 == *v28 && v27 == v28[1];
            if (v29 || (sub_24C91A440()) && *(_DWORD *)&v11[v8[9]] == *(_DWORD *)(a1 + v8[9]))
            {
              if ((uint64_t v30 = v8[10],
                    uint64_t v31 = *(void *)&v11[v30],
                    uint64_t v32 = *(void *)&v11[v30 + 8],
                    uint64_t v33 = (void *)(a1 + v30),
                    v31 == *v33)
                && v32 == v33[1]
                || (sub_24C91A440() & 1) != 0)
              {
                if (v11[v8[11]] == *(unsigned char *)(a1 + v8[11])) {
                  goto LABEL_37;
                }
              }
            }
          }
        }
      }
      sub_24C91A154((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
      a2 = (a2 + 1) & v17;
    }
    while (((*(void *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_34:
  uint64_t v34 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24C91A03C(a1, *(void *)(v34 + 48) + *(void *)(v9 + 72) * a2, type metadata accessor for LibSystemUserRecord);
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
  sub_24C91A154((uint64_t)v11, type metadata accessor for LibSystemUserRecord);
  uint64_t result = sub_24C91A450();
  __break(1u);
  return result;
}

uint64_t sub_24C914ED8(uint64_t a1, unint64_t a2, char a3)
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
    sub_24C913E08();
  }
  else
  {
    if (v11 > v10)
    {
      sub_24C915B6C(type metadata accessor for LibSystemGroupRecord, &qword_2697FC318, type metadata accessor for LibSystemGroupRecord, type metadata accessor for LibSystemGroupRecord);
      goto LABEL_21;
    }
    sub_24C91693C();
  }
  uint64_t v12 = *v3;
  sub_24C91A460();
  sub_24C91A490();
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  sub_24C91A260();
  sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v13 = *(int *)(v7 + 28);
  uint64_t v14 = *(void *)(a1 + v13);
  swift_bridgeObjectRetain();
  sub_24C907D74((uint64_t)v28, v14);
  swift_bridgeObjectRelease();
  uint64_t v25 = *(int *)(v7 + 32);
  sub_24C91A480();
  uint64_t v15 = sub_24C91A4A0();
  uint64_t v16 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v15 & ~v16;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v27 + 72);
    while (1)
    {
      sub_24C91A0EC(*(void *)(v12 + 48) + v18 * a2, (uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      if (*(_DWORD *)v9 == *(_DWORD *)a1)
      {
        BOOL v19 = *((void *)v9 + 1) == *(void *)(a1 + 8) && *((void *)v9 + 2) == *(void *)(a1 + 16);
        if (v19 || (sub_24C91A440())
          && (sub_24C91A220() & 1) != 0
          && (sub_24C908D78(*(void *)&v9[*(int *)(v7 + 28)], *(void *)(a1 + v13)) & 1) != 0
          && v9[*(int *)(v7 + 32)] == *(unsigned char *)(a1 + v25))
        {
          break;
        }
      }
      sub_24C91A154((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
      a2 = (a2 + 1) & v17;
      if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_21;
      }
    }
    sub_24C91A154((uint64_t)v9, type metadata accessor for LibSystemGroupRecord);
    sub_24C91A450();
    __break(1u);
  }
LABEL_21:
  uint64_t v20 = *v26;
  *(void *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24C91A03C(a1, *(void *)(v20 + 48) + *(void *)(v27 + 72) * a2, type metadata accessor for LibSystemGroupRecord);
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

uint64_t sub_24C915288(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v7 = (int *)type metadata accessor for Group();
  uint64_t v8 = *((void *)v7 - 1);
  MEMORY[0x270FA5388](v7);
  unint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  uint64_t v28 = v8;
  BOOL v29 = v3;
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_20;
  }
  if (a3)
  {
    sub_24C9141EC();
  }
  else
  {
    if (v12 > v11)
    {
      sub_24C915B6C((uint64_t (*)(void))type metadata accessor for Group, &qword_2697FC428, (uint64_t (*)(void))type metadata accessor for Group, (uint64_t (*)(void))type metadata accessor for Group);
      goto LABEL_20;
    }
    sub_24C916CE8();
  }
  uint64_t v13 = *v3;
  sub_24C91A460();
  sub_24C91A260();
  sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
  sub_24C91A270();
  uint64_t v14 = v7[5];
  sub_24C91A490();
  uint64_t v15 = (void *)(a1 + v7[6]);
  sub_24C91A2A0();
  uint64_t v27 = v7[7];
  sub_24C907A48(v30, *(void *)(a1 + v27));
  uint64_t v16 = sub_24C91A4A0();
  uint64_t v17 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v16 & ~v17;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v18 = ~v17;
    uint64_t v19 = *(void *)(v8 + 72);
    do
    {
      sub_24C91A0EC(*(void *)(v13 + 48) + v19 * a2, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
      if ((sub_24C91A220() & 1) != 0 && *(_DWORD *)&v10[v7[5]] == *(_DWORD *)(a1 + v14))
      {
        uint64_t v20 = &v10[v7[6]];
        BOOL v21 = *(void *)v20 == *v15 && *((void *)v20 + 1) == v15[1];
        if (v21 || (sub_24C91A440())
          && (sub_24C909000(*(void *)&v10[v7[7]], *(void *)(a1 + v27)) & 1) != 0)
        {
          goto LABEL_23;
        }
      }
      sub_24C91A154((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
      a2 = (a2 + 1) & v18;
    }
    while (((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_20:
  uint64_t v22 = *v29;
  *(void *)(*v29 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_24C91A03C(a1, *(void *)(v22 + 48) + *(void *)(v28 + 72) * a2, (uint64_t (*)(void))type metadata accessor for Group);
  uint64_t v24 = *(void *)(v22 + 16);
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (!v25)
  {
    *(void *)(v22 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_23:
  sub_24C91A154((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
  uint64_t result = sub_24C91A450();
  __break(1u);
  return result;
}

uint64_t sub_24C9155F4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_24C91459C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_24C915DE4();
      goto LABEL_22;
    }
    sub_24C917060();
  }
  uint64_t v11 = *v4;
  sub_24C91A460();
  sub_24C91A2A0();
  uint64_t result = sub_24C91A4A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_24C91A440(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_24C91A450();
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
          uint64_t result = sub_24C91A440();
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
  BOOL v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  *BOOL v21 = v8;
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

void sub_24C915790(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, void (*a5)(void))
{
  unint64_t v9 = *(void *)(*v5 + 16);
  unint64_t v10 = *(void *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v11 = v9 + 1;
  if (a3)
  {
    sub_24C91487C(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_24C915F98(a4);
      goto LABEL_14;
    }
    sub_24C917310(v11, a4);
  }
  uint64_t v12 = *v5;
  uint64_t v13 = sub_24C91A2E0();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    a5(0);
    id v15 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
    char v16 = sub_24C91A2F0();

    if (v16)
    {
LABEL_13:
      sub_24C91A450();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v12 + 48) + 8 * a2);
        char v19 = sub_24C91A2F0();

        if (v19) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v20 + 48) + 8 * a2) = a1;
  uint64_t v21 = *(void *)(v20 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v23;
  }
}

void *sub_24C91591C()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC320);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_24C91A360();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
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
      goto LABEL_25;
    }
    if (v20 >= v16) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_24C91A0EC(*(void *)(v6 + 48) + v19, (uint64_t)v5, type metadata accessor for LibSystemUserRecord);
    uint64_t result = (void *)sub_24C91A03C((uint64_t)v5, *(void *)(v8 + 48) + v19, type metadata accessor for LibSystemUserRecord);
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v16) {
    goto LABEL_23;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_24C915B6C(uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v8 = v4;
  uint64_t v9 = a1(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  int64_t v12 = (char *)&v30 - v11;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v13 = *v4;
  uint64_t v14 = sub_24C91A360();
  uint64_t v15 = v14;
  if (!*(void *)(v13 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    *uint64_t v8 = v15;
    return result;
  }
  uint64_t result = (void *)(v14 + 56);
  unint64_t v17 = (unint64_t)((1 << *(unsigned char *)(v15 + 32)) + 63) >> 6;
  uint64_t v30 = v8;
  uint64_t v31 = (const void *)(v13 + 56);
  if (v15 != v13 || (unint64_t)result >= v13 + 56 + 8 * v17) {
    uint64_t result = memmove(result, v31, 8 * v17);
  }
  int64_t v19 = 0;
  *(void *)(v15 + 16) = *(void *)(v13 + 16);
  uint64_t v20 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v21 = -1;
  if (v20 < 64) {
    uint64_t v21 = ~(-1 << v20);
  }
  unint64_t v22 = v21 & *(void *)(v13 + 56);
  int64_t v23 = (unint64_t)(v20 + 63) >> 6;
  while (1)
  {
    if (v22)
    {
      unint64_t v24 = __clz(__rbit64(v22));
      v22 &= v22 - 1;
      unint64_t v25 = v24 | (v19 << 6);
      goto LABEL_12;
    }
    int64_t v27 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v27 >= v23) {
      goto LABEL_28;
    }
    unint64_t v28 = *((void *)v31 + v27);
    ++v19;
    if (!v28)
    {
      int64_t v19 = v27 + 1;
      if (v27 + 1 >= v23) {
        goto LABEL_28;
      }
      unint64_t v28 = *((void *)v31 + v19);
      if (!v28)
      {
        int64_t v19 = v27 + 2;
        if (v27 + 2 >= v23) {
          goto LABEL_28;
        }
        unint64_t v28 = *((void *)v31 + v19);
        if (!v28) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v22 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v19 << 6);
LABEL_12:
    unint64_t v26 = *(void *)(v10 + 72) * v25;
    sub_24C91A0EC(*(void *)(v13 + 48) + v26, (uint64_t)v12, a3);
    uint64_t result = (void *)sub_24C91A03C((uint64_t)v12, *(void *)(v15 + 48) + v26, a4);
  }
  int64_t v29 = v27 + 3;
  if (v29 >= v23)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v8 = v30;
    goto LABEL_30;
  }
  unint64_t v28 = *((void *)v31 + v29);
  if (v28)
  {
    int64_t v19 = v29;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v19 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v19 >= v23) {
      goto LABEL_28;
    }
    unint64_t v28 = *((void *)v31 + v19);
    ++v29;
    if (v28) {
      goto LABEL_27;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_24C915DE4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC418);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24C91A360();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
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

id sub_24C915F98(uint64_t *a1)
{
  uint64_t v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *v1;
  uint64_t v4 = sub_24C91A360();
  uint64_t v5 = v4;
  if (!*(void *)(v3 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v2 = v5;
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

uint64_t sub_24C91613C()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC320);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_23:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  int64_t v23 = v0;
  uint64_t v24 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
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
    if (v19 >= v25) {
      goto LABEL_21;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_21;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v14);
      if (!v20) {
        break;
      }
    }
LABEL_20:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_7:
    uint64_t v17 = *(void *)(v26 + 72);
    sub_24C91A0EC(*(void *)(v5 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemUserRecord);
    sub_24C91A460();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A260();
    sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A480();
    sub_24C91A4A0();
    unint64_t v18 = sub_24C91A310();
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, type metadata accessor for LibSystemUserRecord);
    ++*(void *)(v7 + 16);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25)
  {
LABEL_21:
    uint64_t result = swift_release_n();
    unint64_t v1 = v23;
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
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
    if (v14 >= v25) {
      goto LABEL_21;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v14);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24C916524()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for User();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC310);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  int64_t v23 = v0;
  uint64_t v24 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
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
      goto LABEL_27;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v14);
      if (!v20)
      {
        int64_t v14 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_23;
        }
        unint64_t v20 = *(void *)(v24 + 8 * v14);
        if (!v20) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_7:
    uint64_t v17 = *(void *)(v26 + 72);
    sub_24C91A0EC(*(void *)(v5 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C91A460();
    sub_24C91A260();
    sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A4A0();
    unint64_t v18 = sub_24C91A310();
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, (uint64_t (*)(void))type metadata accessor for User);
    ++*(void *)(v7 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_23:
    uint64_t result = swift_release_n();
    unint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v14 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v14 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v14);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24C91693C()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v27 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC318);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v24 = v0;
  uint64_t v25 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v26 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
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
    int64_t v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v20);
    ++v14;
    if (!v21)
    {
      int64_t v14 = v20 + 1;
      if (v20 + 1 >= v26) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v25 + 8 * v14);
      if (!v21)
      {
        int64_t v14 = v20 + 2;
        if (v20 + 2 >= v26) {
          goto LABEL_23;
        }
        unint64_t v21 = *(void *)(v25 + 8 * v14);
        if (!v21) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_7:
    uint64_t v17 = *(void *)(v27 + 72);
    sub_24C91A0EC(*(void *)(v5 + 48) + v17 * v16, (uint64_t)v4, type metadata accessor for LibSystemGroupRecord);
    sub_24C91A460();
    sub_24C91A490();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    sub_24C91A260();
    sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    uint64_t v18 = *(void *)&v4[*(int *)(v2 + 28)];
    swift_bridgeObjectRetain();
    sub_24C907D74((uint64_t)v28, v18);
    swift_bridgeObjectRelease();
    sub_24C91A480();
    sub_24C91A4A0();
    unint64_t v19 = sub_24C91A310();
    *(void *)(v12 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v19 * v17, type metadata accessor for LibSystemGroupRecord);
    ++*(void *)(v7 + 16);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v26)
  {
LABEL_23:
    uint64_t result = swift_release_n();
    unint64_t v1 = v24;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v25 + 8 * v22);
  if (v21)
  {
    int64_t v14 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v14 >= v26) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v25 + 8 * v14);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24C916CE8()
{
  unint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Group();
  uint64_t v26 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC428);
  uint64_t v6 = sub_24C91A370();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = swift_release();
LABEL_25:
    *unint64_t v1 = v7;
    return result;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v9 = *(void *)(v5 + 56);
  uint64_t v23 = v0;
  uint64_t v24 = v5 + 56;
  if (v8 < 64) {
    uint64_t v10 = ~(-1 << v8);
  }
  else {
    uint64_t v10 = -1;
  }
  unint64_t v11 = v10 & v9;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 56;
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
      goto LABEL_27;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v14);
      if (!v20)
      {
        int64_t v14 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_23;
        }
        unint64_t v20 = *(void *)(v24 + 8 * v14);
        if (!v20) {
          break;
        }
      }
    }
LABEL_22:
    unint64_t v11 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_7:
    uint64_t v17 = *(void *)(v26 + 72);
    sub_24C91A0EC(*(void *)(v5 + 48) + v17 * v16, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for Group);
    sub_24C91A460();
    sub_24C91A260();
    sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
    sub_24C91A270();
    sub_24C91A490();
    sub_24C91A2A0();
    sub_24C907A48(v27, *(void *)&v4[*(int *)(v2 + 28)]);
    sub_24C91A4A0();
    unint64_t v18 = sub_24C91A310();
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = sub_24C91A03C((uint64_t)v4, *(void *)(v7 + 48) + v18 * v17, (uint64_t (*)(void))type metadata accessor for Group);
    ++*(void *)(v7 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_23:
    uint64_t result = swift_release_n();
    unint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v14 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v14 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v14 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v14);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24C917060()
{
  unint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697FC418);
  uint64_t v3 = sub_24C91A370();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *unint64_t v1 = v4;
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
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_24C91A460();
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    uint64_t result = sub_24C91A4A0();
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    unint64_t v1 = v0;
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

uint64_t sub_24C917310(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = v2;
  uint64_t v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v5 = sub_24C91A370();
  uint64_t v6 = v5;
  if (!*(void *)(v4 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v3 = v6;
    return result;
  }
  int64_t v29 = v2;
  uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v8 = v4 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1 << v7);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v4 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    id v21 = *(id *)(*(void *)(v4 + 48) + 8 * v17);
    uint64_t result = sub_24C91A2E0();
    uint64_t v22 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v28 = *(void *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
    ++*(void *)(v6 + 16);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v3 = v29;
    goto LABEL_35;
  }
  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v14 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_33;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24C917588(uint64_t isStackAllocationSafe, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x263EF8340];
  char v5 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v6 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    uint64_t v8 = a2((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v6, v4);
    swift_release();
    if (v2) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    uint64_t v8 = a2((char *)v9, v6, v4);
    swift_release();
    MEMORY[0x253300DD0](v9, -1, -1);
  }
  return v8;
}

uint64_t sub_24C917700(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  unint64_t v23 = a1;
  uint64_t v4 = type metadata accessor for LibSystemGroupRecord(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(a3 + 56);
  uint64_t v24 = 0;
  uint64_t v25 = a3 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v26 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v26) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v25 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v26) {
        goto LABEL_24;
      }
      unint64_t v18 = *(void *)(v25 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v26) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v25 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    sub_24C91A0EC(*(void *)(a3 + 48) + *(void *)(v5 + 72) * v15, (uint64_t)v8, type metadata accessor for LibSystemGroupRecord);
    int v16 = v8[*(int *)(v4 + 32)];
    uint64_t result = sub_24C91A154((uint64_t)v8, type metadata accessor for LibSystemGroupRecord);
    if (v16 == 1)
    {
      *(unint64_t *)((char *)v23 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_24C9072B8(v23, v22, v24, a3);
      }
    }
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v26) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v25 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v26) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v25 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24C91797C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  unint64_t v23 = a1;
  uint64_t v4 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v9 = 0;
  uint64_t v10 = *(void *)(a3 + 56);
  uint64_t v24 = 0;
  uint64_t v25 = a3 + 56;
  uint64_t v11 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & v10;
  int64_t v26 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v26) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v25 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v26) {
        goto LABEL_24;
      }
      unint64_t v18 = *(void *)(v25 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v26) {
          goto LABEL_24;
        }
        unint64_t v18 = *(void *)(v25 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v13 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_5:
    sub_24C91A0EC(*(void *)(a3 + 48) + *(void *)(v5 + 72) * v15, (uint64_t)v8, type metadata accessor for LibSystemUserRecord);
    int v16 = v8[*(int *)(v4 + 44)];
    uint64_t result = sub_24C91A154((uint64_t)v8, type metadata accessor for LibSystemUserRecord);
    if (v16 == 1)
    {
      *(unint64_t *)((char *)v23 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return sub_24C907648(v23, v22, v24, a3);
      }
    }
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v26) {
    goto LABEL_24;
  }
  unint64_t v18 = *(void *)(v25 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v26) {
      goto LABEL_24;
    }
    unint64_t v18 = *(void *)(v25 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_20;
    }
  }
LABEL_26:
  __break(1u);
  return result;
}

size_t sub_24C917BF8(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_24C917C70(a1, a2, a3, (void *)*v3, (uint64_t *)&unk_2697FC440, (uint64_t (*)(void))type metadata accessor for User);
  *uint64_t v3 = result;
  return result;
}

size_t sub_24C917C34(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_24C917C70(a1, a2, a3, (void *)*v3, &qword_2697FC430, (uint64_t (*)(void))type metadata accessor for Group);
  *uint64_t v3 = result;
  return result;
}

size_t sub_24C917C70(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  if (!v12)
  {
    int v16 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  int v16 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
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
  return (size_t)v16;
}

uint64_t sub_24C917E4C()
{
  uint64_t v0 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v57 = *(void *)(v0 - 8);
  v58 = (int *)v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  v56 = (char *)&v50 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v55 = (uint64_t)&v50 - v6;
  uint64_t v7 = type metadata accessor for User();
  uint64_t v53 = *(void *)(v7 - 8);
  v54 = (int *)v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  int64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v50 - v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = MEMORY[0x263F8EE88];
  uint64_t v14 = (uint64_t *)(v13 + 16);
  aBlock[4] = sub_24C919FD0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C910D54;
  aBlock[3] = &block_descriptor_54;
  unint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v15);
  swift_beginAccess();
  uint64_t v16 = *v14;
  swift_bridgeObjectRetain();
  swift_release();
  int64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    uint64_t v61 = MEMORY[0x263F8EE78];
    sub_24C917BF8(0, v17, 0);
    uint64_t result = sub_24C90B940(v16);
    uint64_t v20 = result;
    int v22 = v21 & 1;
    uint64_t v51 = v16;
    uint64_t v52 = v16 + 56;
    uint64_t v23 = (uint64_t)v56;
    while ((v20 & 0x8000000000000000) == 0 && v20 < 1 << *(unsigned char *)(v16 + 32))
    {
      if (((*(void *)(v52 + (((unint64_t)v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
        goto LABEL_16;
      }
      if (*(_DWORD *)(v16 + 36) != v19) {
        goto LABEL_17;
      }
      int v59 = v22;
      uint64_t v60 = v19;
      uint64_t v24 = *(void *)(v16 + 48) + *(void *)(v57 + 72) * v20;
      uint64_t v25 = v55;
      sub_24C91A0EC(v24, v55, type metadata accessor for LibSystemUserRecord);
      sub_24C91A03C(v25, v23, type metadata accessor for LibSystemUserRecord);
      sub_24C91A0EC(v23, (uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      int64_t v26 = v58;
      BOOL v27 = &v3[v58[6]];
      uint64_t v28 = sub_24C91A260();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v28 - 8) + 16))(v10, v27, v28);
      uint64_t v30 = *((void *)v3 + 1);
      uint64_t v29 = *((void *)v3 + 2);
      uint64_t v31 = &v3[v26[7]];
      uint64_t v32 = *(void *)v31;
      uint64_t v33 = *((void *)v31 + 1);
      uint64_t v34 = &v3[v26[8]];
      uint64_t v35 = *(void *)v34;
      uint64_t v36 = *((void *)v34 + 1);
      LODWORD(v34) = *(_DWORD *)&v3[v26[9]];
      BOOL v37 = &v3[v26[10]];
      uint64_t v38 = *(void *)v37;
      uint64_t v39 = *((void *)v37 + 1);
      uint64_t v40 = v54;
      *(_DWORD *)&v10[v54[5]] = *(_DWORD *)v3;
      uint64_t v41 = &v10[v40[6]];
      *(void *)uint64_t v41 = v30;
      *((void *)v41 + 1) = v29;
      uint64_t v42 = &v10[v40[7]];
      *(void *)uint64_t v42 = v32;
      *((void *)v42 + 1) = v33;
      uint64_t v43 = &v10[v40[8]];
      *(void *)uint64_t v43 = v35;
      *((void *)v43 + 1) = v36;
      *(_DWORD *)&v10[v40[9]] = v34;
      v44 = &v10[v40[10]];
      *(void *)v44 = v38;
      *((void *)v44 + 1) = v39;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_24C91A154((uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      sub_24C91A03C((uint64_t)v10, (uint64_t)v12, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C91A154(v23, type metadata accessor for LibSystemUserRecord);
      uint64_t v45 = v61;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24C917BF8(0, *(void *)(v45 + 16) + 1, 1);
        uint64_t v45 = v61;
      }
      unint64_t v47 = *(void *)(v45 + 16);
      unint64_t v46 = *(void *)(v45 + 24);
      if (v47 >= v46 >> 1)
      {
        sub_24C917BF8(v46 > 1, v47 + 1, 1);
        uint64_t v45 = v61;
      }
      *(void *)(v45 + 16) = v47 + 1;
      sub_24C91A03C((uint64_t)v12, v45+ ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))+ *(void *)(v53 + 72) * v47, (uint64_t (*)(void))type metadata accessor for User);
      uint64_t v16 = v51;
      uint64_t result = sub_24C90B9E4(v20, v60, v59 & 1, v51);
      uint64_t v20 = result;
      int v22 = v48 & 1;
      if (!--v17)
      {
        sub_24C90D2F0(result, v19, v22);
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v45 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t v49 = sub_24C918A24(v45);
    swift_bridgeObjectRelease();
    return v49;
  }
  return result;
}

uint64_t sub_24C9183C4()
{
  uint64_t v0 = type metadata accessor for LibSystemUserRecord(0);
  uint64_t v58 = *(void *)(v0 - 8);
  int v59 = (int *)v0;
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v1);
  uint64_t v57 = (char *)&v52 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v56 = (uint64_t)&v52 - v6;
  uint64_t v7 = type metadata accessor for User();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v55 = (int *)v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  int64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = MEMORY[0x263F8EE88];
  uint64_t v14 = (uint64_t *)(v13 + 16);
  aBlock[4] = sub_24C919FD0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C910D54;
  aBlock[3] = &block_descriptor_49;
  unint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v15);
  swift_beginAccess();
  uint64_t v16 = *v14;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v17 = sub_24C917588(v16, (uint64_t (*)(char *, unint64_t, uint64_t))sub_24C91797C);
  int64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v62 = MEMORY[0x263F8EE78];
    sub_24C917BF8(0, v18, 0);
    uint64_t result = sub_24C90B940(v17);
    uint64_t v21 = result;
    int v23 = v22 & 1;
    uint64_t v52 = v17;
    uint64_t v53 = v17 + 56;
    uint64_t v24 = (uint64_t)v57;
    while ((v21 & 0x8000000000000000) == 0 && v21 < 1 << *(unsigned char *)(v17 + 32))
    {
      if (((*(void *)(v53 + (((unint64_t)v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
        goto LABEL_16;
      }
      if (*(_DWORD *)(v17 + 36) != v20) {
        goto LABEL_17;
      }
      int v60 = v23;
      uint64_t v61 = v20;
      uint64_t v25 = *(void *)(v17 + 48) + *(void *)(v58 + 72) * v21;
      uint64_t v26 = v56;
      sub_24C91A0EC(v25, v56, type metadata accessor for LibSystemUserRecord);
      sub_24C91A03C(v26, v24, type metadata accessor for LibSystemUserRecord);
      sub_24C91A0EC(v24, (uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      uint64_t v27 = (uint64_t)v12;
      uint64_t v28 = v59;
      uint64_t v29 = &v3[v59[6]];
      uint64_t v30 = sub_24C91A260();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v10, v29, v30);
      uint64_t v32 = *((void *)v3 + 1);
      uint64_t v31 = *((void *)v3 + 2);
      uint64_t v33 = &v3[v28[7]];
      uint64_t v34 = *(void *)v33;
      uint64_t v35 = *((void *)v33 + 1);
      uint64_t v36 = &v3[v28[8]];
      uint64_t v37 = *(void *)v36;
      uint64_t v38 = *((void *)v36 + 1);
      LODWORD(v36) = *(_DWORD *)&v3[v28[9]];
      uint64_t v39 = &v3[v28[10]];
      uint64_t v40 = *(void *)v39;
      uint64_t v41 = *((void *)v39 + 1);
      uint64_t v42 = v55;
      *(_DWORD *)&v10[v55[5]] = *(_DWORD *)v3;
      uint64_t v43 = &v10[v42[6]];
      *(void *)uint64_t v43 = v32;
      *((void *)v43 + 1) = v31;
      v44 = &v10[v42[7]];
      *(void *)v44 = v34;
      *((void *)v44 + 1) = v35;
      uint64_t v45 = &v10[v42[8]];
      *(void *)uint64_t v45 = v37;
      *((void *)v45 + 1) = v38;
      *(_DWORD *)&v10[v42[9]] = v36;
      unint64_t v46 = &v10[v42[10]];
      *(void *)unint64_t v46 = v40;
      *((void *)v46 + 1) = v41;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v12 = (char *)v27;
      swift_bridgeObjectRetain();
      sub_24C91A154((uint64_t)v3, type metadata accessor for LibSystemUserRecord);
      sub_24C91A03C((uint64_t)v10, v27, (uint64_t (*)(void))type metadata accessor for User);
      sub_24C91A154(v24, type metadata accessor for LibSystemUserRecord);
      uint64_t v47 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24C917BF8(0, *(void *)(v47 + 16) + 1, 1);
        uint64_t v47 = v62;
      }
      unint64_t v49 = *(void *)(v47 + 16);
      unint64_t v48 = *(void *)(v47 + 24);
      if (v49 >= v48 >> 1)
      {
        sub_24C917BF8(v48 > 1, v49 + 1, 1);
        uint64_t v47 = v62;
      }
      *(void *)(v47 + 16) = v49 + 1;
      sub_24C91A03C(v27, v47+ ((*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80))+ *(void *)(v54 + 72) * v49, (uint64_t (*)(void))type metadata accessor for User);
      uint64_t v17 = v52;
      uint64_t result = sub_24C90B9E4(v21, v61, v60 & 1, v52);
      uint64_t v21 = result;
      int v23 = v50 & 1;
      if (!--v18)
      {
        sub_24C90D2F0(result, v20, v23);
        swift_release();
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_release();
    uint64_t v47 = MEMORY[0x263F8EE78];
LABEL_14:
    uint64_t v51 = sub_24C918A24(v47);
    swift_bridgeObjectRelease();
    return v51;
  }
  return result;
}

uint64_t sub_24C918968()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24C9189A0(uint64_t a1, uint64_t a2)
{
  return sub_24C910C4C(a1, a2, v2, type metadata accessor for LibSystemGroupRecord, (void (*)(uint64_t))sub_24C908C3C, (void (*)(char *, char *))sub_24C912B68, type metadata accessor for LibSystemGroupRecord);
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

uint64_t sub_24C918A24(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for User();
  uint64_t v3 = *((void *)v2 - 1);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v51 - v8;
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v61 = (uint64_t)&v51 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v51 - v12;
  uint64_t v14 = *(void *)(a1 + 16);
  sub_24C91A0A4(&qword_2697FC438, (void (*)(uint64_t))type metadata accessor for User);
  uint64_t v15 = sub_24C91A2D0();
  uint64_t v52 = v14;
  if (!v14) {
    return v15;
  }
  uint64_t v16 = 0;
  uint64_t v51 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  uint64_t v17 = *(void *)(v3 + 72);
  while (1)
  {
    uint64_t v56 = v16;
    sub_24C91A0EC(v51 + v17 * v16, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for User);
    sub_24C91A460();
    uint64_t v18 = sub_24C91A260();
    uint64_t v19 = sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
    swift_bridgeObjectRetain();
    uint64_t v53 = v19;
    uint64_t v54 = v18;
    sub_24C91A270();
    uint64_t v60 = v2[5];
    sub_24C91A490();
    uint64_t v20 = &v13[v2[6]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    int v59 = &v13[v2[7]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    uint64_t v58 = &v13[v2[8]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    uint64_t v57 = v2[9];
    sub_24C91A490();
    uint64_t v55 = &v13[v2[10]];
    swift_bridgeObjectRetain();
    sub_24C91A2A0();
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_24C91A4A0();
    uint64_t v22 = -1 << *(unsigned char *)(v15 + 32);
    unint64_t v23 = v21 & ~v22;
    if ((*(void *)(v15 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23))
    {
      uint64_t v24 = ~v22;
      while (1)
      {
        sub_24C91A0EC(*(void *)(v15 + 48) + v23 * v17, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
        if ((sub_24C91A220() & 1) != 0 && *(_DWORD *)&v6[v2[5]] == *(_DWORD *)&v13[v60])
        {
          uint64_t v25 = &v6[v2[6]];
          BOOL v26 = *(void *)v25 == *(void *)v20 && *((void *)v25 + 1) == *((void *)v20 + 1);
          if (v26 || (sub_24C91A440() & 1) != 0)
          {
            uint64_t v27 = &v6[v2[7]];
            BOOL v28 = *(void *)v27 == *(void *)v59 && *((void *)v27 + 1) == *((void *)v59 + 1);
            if (v28 || (sub_24C91A440() & 1) != 0)
            {
              uint64_t v29 = &v6[v2[8]];
              BOOL v30 = *(void *)v29 == *(void *)v58 && *((void *)v29 + 1) == *((void *)v58 + 1);
              if (v30 || (sub_24C91A440()) && *(_DWORD *)&v6[v2[9]] == *(_DWORD *)&v13[v57])
              {
                uint64_t v31 = &v6[v2[10]];
                if (*(void *)v31 == *(void *)v55 && *((void *)v31 + 1) == *((void *)v55 + 1)) {
                  break;
                }
                if (sub_24C91A440()) {
                  break;
                }
              }
            }
          }
        }
        sub_24C91A154((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
        unint64_t v23 = (v23 + 1) & v24;
        if (((*(void *)(v15 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
          goto LABEL_28;
        }
      }
      sub_24C91A154((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for User);
      goto LABEL_61;
    }
LABEL_28:
    swift_bridgeObjectRelease();
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_24C91A0EC((uint64_t)v13, v61, (uint64_t (*)(void))type metadata accessor for User);
    uint64_t v62 = v15;
    if (*(void *)(v15 + 24) <= *(void *)(v15 + 16)) {
      break;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_24C915B6C((uint64_t (*)(void))type metadata accessor for User, &qword_2697FC310, (uint64_t (*)(void))type metadata accessor for User, (uint64_t (*)(void))type metadata accessor for User);
    }
LABEL_59:
    uint64_t v46 = v61;
    uint64_t v15 = v62;
    *(void *)(v62 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8) + 56) |= 1 << v23;
    sub_24C91A03C(v46, *(void *)(v15 + 48) + v23 * v17, (uint64_t (*)(void))type metadata accessor for User);
    uint64_t v47 = *(void *)(v15 + 16);
    BOOL v48 = __OFADD__(v47, 1);
    uint64_t v49 = v47 + 1;
    if (v48)
    {
      __break(1u);
      goto LABEL_64;
    }
    *(void *)(v15 + 16) = v49;
LABEL_61:
    swift_bridgeObjectRelease();
    uint64_t v16 = v56 + 1;
    sub_24C91A154((uint64_t)v13, (uint64_t (*)(void))type metadata accessor for User);
    if (v16 == v52) {
      return v15;
    }
  }
  if (isUniquelyReferenced_nonNull_native) {
    sub_24C9139B8();
  }
  else {
    sub_24C916524();
  }
  uint64_t v33 = v62;
  sub_24C91A460();
  uint64_t v34 = v61;
  sub_24C91A270();
  uint64_t v60 = v2[5];
  sub_24C91A490();
  uint64_t v35 = (void *)(v34 + v2[6]);
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  int v59 = (char *)(v34 + v2[7]);
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  uint64_t v58 = (char *)(v34 + v2[8]);
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  uint64_t v57 = v2[9];
  sub_24C91A490();
  uint64_t v55 = (char *)(v34 + v2[10]);
  swift_bridgeObjectRetain();
  sub_24C91A2A0();
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_24C91A4A0();
  uint64_t v37 = -1 << *(unsigned char *)(v33 + 32);
  unint64_t v23 = v36 & ~v37;
  if (((*(void *)(v33 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
    goto LABEL_59;
  }
  uint64_t v38 = ~v37;
  while (1)
  {
    sub_24C91A0EC(*(void *)(v33 + 48) + v23 * v17, (uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
    if ((sub_24C91A220() & 1) != 0 && *(_DWORD *)&v9[v2[5]] == *(_DWORD *)(v61 + v60))
    {
      uint64_t v39 = &v9[v2[6]];
      BOOL v40 = *(void *)v39 == *v35 && *((void *)v39 + 1) == v35[1];
      if (v40 || (sub_24C91A440() & 1) != 0)
      {
        uint64_t v41 = &v9[v2[7]];
        BOOL v42 = *(void *)v41 == *(void *)v59 && *((void *)v41 + 1) == *((void *)v59 + 1);
        if (v42 || (sub_24C91A440() & 1) != 0)
        {
          uint64_t v43 = &v9[v2[8]];
          BOOL v44 = *(void *)v43 == *(void *)v58 && *((void *)v43 + 1) == *((void *)v58 + 1);
          if (v44 || (sub_24C91A440()) && *(_DWORD *)&v9[v2[9]] == *(_DWORD *)(v61 + v57))
          {
            uint64_t v45 = &v9[v2[10]];
            if (*(void *)v45 == *(void *)v55 && *((void *)v45 + 1) == *((void *)v55 + 1)) {
              break;
            }
            if (sub_24C91A440()) {
              break;
            }
          }
        }
      }
    }
    sub_24C91A154((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
    unint64_t v23 = (v23 + 1) & v38;
    if (((*(void *)(v33 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v23) & 1) == 0) {
      goto LABEL_59;
    }
  }
LABEL_64:
  sub_24C91A154((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for User);
  uint64_t result = sub_24C91A450();
  __break(1u);
  return result;
}

uint64_t sub_24C9192E0(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for Group();
  uint64_t v3 = *((void *)v2 - 1);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x270FA5388](v4);
  uint64_t v27 = (uint64_t)&v27 - v8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v27 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  sub_24C91A0A4(&qword_2697FC420, (void (*)(uint64_t))type metadata accessor for Group);
  uint64_t v12 = sub_24C91A2D0();
  uint64_t v29 = v11;
  if (v11)
  {
    uint64_t v13 = 0;
    uint64_t v28 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v14 = *(void *)(v3 + 72);
    do
    {
      sub_24C91A0EC(v28 + v14 * v13, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
      sub_24C91A460();
      sub_24C91A260();
      sub_24C91A0A4(&qword_2697FC2E8, MEMORY[0x263F07508]);
      swift_bridgeObjectRetain();
      sub_24C91A270();
      uint64_t v17 = v2[5];
      sub_24C91A490();
      uint64_t v18 = &v10[v2[6]];
      sub_24C91A2A0();
      uint64_t v31 = v2[7];
      sub_24C907A48(v32, *(void *)&v10[v31]);
      uint64_t v19 = sub_24C91A4A0();
      uint64_t v20 = -1 << *(unsigned char *)(v12 + 32);
      unint64_t v21 = v19 & ~v20;
      uint64_t v22 = *(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21;
      uint64_t v30 = v13;
      if (v22)
      {
        uint64_t v23 = ~v20;
        while (1)
        {
          sub_24C91A0EC(*(void *)(v12 + 48) + v21 * v14, (uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
          if ((sub_24C91A220() & 1) != 0 && *(_DWORD *)&v6[v2[5]] == *(_DWORD *)&v10[v17])
          {
            uint64_t v24 = &v6[v2[6]];
            BOOL v25 = *(void *)v24 == *(void *)v18 && *((void *)v24 + 1) == *((void *)v18 + 1);
            if (v25 || (sub_24C91A440())
              && (sub_24C909000(*(void *)&v6[v2[7]], *(void *)&v10[v31]) & 1) != 0)
            {
              break;
            }
          }
          sub_24C91A154((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
          unint64_t v21 = (v21 + 1) & v23;
          if (((*(void *)(v12 + 56 + ((v21 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v21) & 1) == 0) {
            goto LABEL_3;
          }
        }
        sub_24C91A154((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for Group);
      }
      else
      {
LABEL_3:
        swift_bridgeObjectRelease();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v16 = v27;
        sub_24C91A0EC((uint64_t)v10, v27, (uint64_t (*)(void))type metadata accessor for Group);
        *(void *)&v32[0] = v12;
        sub_24C915288(v16, v21, isUniquelyReferenced_nonNull_native);
        uint64_t v12 = *(void *)&v32[0];
      }
      swift_bridgeObjectRelease();
      uint64_t v13 = v30 + 1;
      sub_24C91A154((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for Group);
    }
    while (v13 != v29);
  }
  return v12;
}

uint64_t sub_24C9196D0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24C91A430();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for DDQUser(0);
  sub_24C91A0A4(&qword_2697FC368, (void (*)(uint64_t))type metadata accessor for DDQUser);
  uint64_t result = sub_24C91A2D0();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24C91A430();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x253300930](i, a1);
        sub_24C9130E8(&v9, v6, (void (*)(void))type metadata accessor for DDQUser, &qword_2697FC408, (void (*)(void))type metadata accessor for DDQUser);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_24C9130E8(&v9, v8, (void (*)(void))type metadata accessor for DDQUser, &qword_2697FC408, (void (*)(void))type metadata accessor for DDQUser);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24C919894(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24C91A430();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for DDQGroup(0);
  sub_24C91A0A4(&qword_2697FC370, (void (*)(uint64_t))type metadata accessor for DDQGroup);
  uint64_t result = sub_24C91A2D0();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_24C91A430();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)MEMORY[0x253300930](i, a1);
        sub_24C9130E8(&v9, v6, (void (*)(void))type metadata accessor for DDQGroup, &qword_2697FC410, (void (*)(void))type metadata accessor for DDQGroup);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_24C9130E8(&v9, v8, (void (*)(void))type metadata accessor for DDQGroup, &qword_2697FC410, (void (*)(void))type metadata accessor for DDQGroup);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t _s20DarwinDirectoryQuery5GroupV13mutableGroupsShyACGvgZ_0()
{
  if (qword_2697FC2E0 != -1) {
    swift_once();
  }
  v10[3] = &type metadata for ProviderSideEffects;
  v10[4] = &off_26FEFD820;
  v10[0] = swift_allocObject();
  sub_24C90C6D8((uint64_t)&unk_2697FC3E0, v10[0] + 16);
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = MEMORY[0x263F8EE88];
  uint64_t v1 = (uint64_t *)(v0 + 16);
  aBlock[4] = sub_24C9189A0;
  aBlock[5] = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24C910D54;
  aBlock[3] = &block_descriptor_29;
  unint64_t v2 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  DarwinDirectoryRecordStoreApply();
  _Block_release(v2);
  swift_beginAccess();
  uint64_t v3 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v4 = sub_24C917588(v3, (uint64_t (*)(char *, unint64_t, uint64_t))sub_24C917700);
  MEMORY[0x270FA5388](v4);
  v8[2] = v10;
  uint64_t v5 = sub_24C9108A0((void (*)(uint64_t))sub_24C90D354, (uint64_t)v8, v4);
  swift_release();
  uint64_t v6 = sub_24C9192E0(v5);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v6;
}

uint64_t sub_24C919C6C(uint64_t a1, unsigned char *a2)
{
  return sub_24C9115BC(a1, a2, v2, &qword_2697FC308, (void (*)(uint64_t))sub_24C908C3C, type metadata accessor for LibSystemGroupRecord);
}

void DarwinDirectoryRecordStoreApplyWithUUIDFilter(uint64_t a1, const unsigned __int8 *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  *((void *)&v5 + 1) = 0;
  uint64_t v6 = 0;
  uuid_copy((unsigned __int8 *)&v5 + 8, a2);
  DarwinDirectoryRecordStoreApplyWithFilter();
}

void DarwinDirectoryRecordStoreApplyWithIDFilter(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  DarwinDirectoryRecordStoreApplyWithFilter();
}

void sub_24C919DE0(uint64_t a1)
{
  sub_24C9116E0(a1, v1, (uint64_t)sub_24C919C6C, (uint64_t)&block_descriptor_23, 1u);
}

void DarwinDirectoryRecordStoreApplyWithNameFilter(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  DarwinDirectoryRecordStoreApplyWithFilter();
}

uint64_t sub_24C919EAC(uint64_t a1, unsigned char *a2)
{
  return sub_24C9115BC(a1, a2, v2, &qword_2697FC378, (void (*)(uint64_t))sub_24C908B28, type metadata accessor for LibSystemUserRecord);
}

uint64_t sub_24C919EF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

void sub_24C919F5C(uint64_t a1)
{
  sub_24C9116E0(a1, v1, (uint64_t)sub_24C919EAC, (uint64_t)&block_descriptor_43, 0);
}

uint64_t sub_24C919F98()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24C919FD0(uint64_t a1, uint64_t a2)
{
  return sub_24C910C4C(a1, a2, v2, type metadata accessor for LibSystemUserRecord, (void (*)(uint64_t))sub_24C908B28, (void (*)(char *, char *))sub_24C9127D4, type metadata accessor for LibSystemUserRecord);
}

uint64_t sub_24C91A03C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C91A0A4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24C91A0EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24C91A154(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24C91A210()
{
  return MEMORY[0x270EF0C88]();
}

uint64_t sub_24C91A220()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24C91A230()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_24C91A240()
{
  return MEMORY[0x270EF0CE0]();
}

uint64_t sub_24C91A250()
{
  return MEMORY[0x270EF0CF0]();
}

uint64_t sub_24C91A260()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24C91A270()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24C91A280()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C91A290()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C91A2A0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C91A2B0()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_24C91A2C0()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_24C91A2D0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24C91A2E0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_24C91A2F0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24C91A300()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24C91A310()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_24C91A320()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_24C91A330()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_24C91A340()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_24C91A350()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_24C91A360()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24C91A370()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24C91A380()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_24C91A390()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24C91A3A0()
{
  return MEMORY[0x270F9E988]();
}

uint64_t sub_24C91A3B0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24C91A3C0()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C91A3D0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_24C91A3E0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_24C91A3F0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_24C91A400()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_24C91A410()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_24C91A420()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24C91A430()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24C91A440()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C91A450()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24C91A460()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C91A470()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C91A480()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24C91A490()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_24C91A4A0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t DarwinDirectoryRecordStoreApply()
{
  return MEMORY[0x270ED7C28]();
}

uint64_t DarwinDirectoryRecordStoreApplyWithFilter()
{
  return MEMORY[0x270ED7C30]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}