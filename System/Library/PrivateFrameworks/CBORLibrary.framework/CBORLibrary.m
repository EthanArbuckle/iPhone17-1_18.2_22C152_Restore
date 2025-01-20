uint64_t sub_218329318(uint64_t a1, uint64_t a2)
{
  return nullsub_1(*(void *)(a1 + 24), *(void *)(a2 - 8));
}

uint64_t sub_218329324@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 88))();
  *a2 = result;
  return result;
}

uint64_t sub_218329370(uint64_t a1, uint64_t a2)
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 96);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_2183293C4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2183293FC(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_218329444())()
{
  return j__swift_endAccess;
}

uint64_t sub_21832949C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7000);
  MEMORY[0x270FA5388](v0 - 8, v1);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2183548F0();
  __swift_allocate_value_buffer(v4, qword_267BC73B0);
  uint64_t v5 = __swift_project_value_buffer(v4, (uint64_t)qword_267BC73B0);
  sub_2183548E0();
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v3, 1, v4);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v5, v3, v4);
  }
  __break(1u);
  return result;
}

uint64_t CBORDecoder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
  return v0;
}

uint64_t CBORDecoder.init()()
{
  *(void *)(v0 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
  return v0;
}

unint64_t sub_218329630(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE738);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7008);
  uint64_t v6 = sub_2183549A0();
  v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_218335948(v12, (uint64_t)v5, &qword_26ACFE738);
    unint64_t result = sub_21834A424((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_2183548F0();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_218335884(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_218329830(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FF0);
  uint64_t v2 = sub_2183549A0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_218335948(v6, (uint64_t)&v15, &qword_267BC6FF8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_21834A4E8(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_218335884(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

unint64_t sub_218329968(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE808);
  uint64_t v2 = (void *)sub_2183549A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_unknownObjectRetain();
    unint64_t result = sub_21834A560((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_218329A74(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FC0);
  uint64_t v2 = (void *)sub_2183549A0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_21834A560((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
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

void sub_218329B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a5;
  uint64_t v20 = a1;
  uint64_t v7 = sub_218354820();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7, v9);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v12 = self;
  uint64_t v13 = (void *)sub_2183545A0();
  id v14 = objc_msgSend(v12, sel_decodeFromData_keepKeyOrdering_noCopy_, v13, 1, 0);

  if (v14)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(*(void *)v5 + 136))(v20, v14, a4, v19);
  }
  else
  {
    sub_218354810();
    uint64_t v15 = sub_218354830();
    swift_allocError();
    long long v17 = v16;
    uint64_t v18 = (char *)v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
    *long long v17 = v20;
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v18, v11, v7);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104))(v17, *MEMORY[0x263F8DCC0], v15);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
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

void sub_218329E18(uint64_t a1@<X0>, char a2@<W3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v6 = v5;
  uint64_t v31 = a5;
  uint64_t v32 = a3;
  uint64_t v37 = a1;
  uint64_t v8 = sub_218354820();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  MEMORY[0x270FA5388](v8, v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2183548F0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267BC6FA0 != -1) {
    swift_once();
  }
  uint64_t v17 = __swift_project_value_buffer(v12, (uint64_t)qword_267BC73B0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v17, v12);
  uint64_t v36 = MEMORY[0x263F8D4F8];
  uint64_t v18 = a2 & 1;
  v35[0] = a2 & 1;
  uint64_t v19 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v6 + 104))(v34);
  sub_21832A1E8((uint64_t)v35, (uint64_t)v16);
  v19(v34, 0);
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_2183545A0();
  id v22 = objc_msgSend(v20, sel_decodeFromData_keepKeyOrdering_noCopy_, v21, 1, v18);

  if (v22)
  {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(*(void *)v6 + 136))(v37, v22, v32, v33);
  }
  else
  {
    sub_218354810();
    uint64_t v23 = sub_218354830();
    swift_allocError();
    v25 = v24;
    v26 = (char *)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
    void *v25 = v37;
    uint64_t v28 = v29;
    uint64_t v27 = v30;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v11, v30);
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v25, *MEMORY[0x263F8DCC0], v23);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v27);
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_21832A1E8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24))
  {
    sub_218335884((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_21833C90C(v9, a2, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v8;
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_2183548F0();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a2, v5);
  }
  else
  {
    sub_218335828(a1, &qword_267BC6FC8);
    sub_21833AF58(a2, v9);
    uint64_t v7 = sub_2183548F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a2, v7);
    return sub_218335828((uint64_t)v9, &qword_267BC6FC8);
  }
}

uint64_t sub_21832A308@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v36 = a4;
  uint64_t v32 = a5;
  uint64_t v9 = sub_218354820();
  uint64_t v34 = *(void *)(v9 - 8);
  uint64_t v35 = v9;
  MEMORY[0x270FA5388]();
  uint64_t v33 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2183547C0();
  uint64_t v30 = *(void *)(v11 - 8);
  uint64_t v31 = v11;
  MEMORY[0x270FA5388]();
  uint64_t v13 = (char *)&v30 - v12;
  uint64_t v14 = *(uint64_t (**)(void))(*(void *)v5 + 88);
  id v15 = a2;
  uint64_t v16 = v14();
  type metadata accessor for _CBORDecoder();
  uint64_t v17 = (void *)swift_allocObject();
  uint64_t v18 = MEMORY[0x263F8EE78];
  v17[3] = MEMORY[0x263F8EE78];
  swift_beginAccess();
  id v19 = v15;
  MEMORY[0x21D4676F0]();
  if (*(void *)((v17[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v17[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_218354760();
  }
  sub_218354770();
  sub_218354750();
  swift_endAccess();

  v17[2] = v18;
  v17[4] = v16;
  uint64_t v20 = v37;
  sub_21832A710(v19, a1, a3, v36, (uint64_t)v13);
  if (v20) {
    return swift_release();
  }
  uint64_t v22 = *(void *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v13, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
    uint64_t v23 = v33;
    sub_218354810();
    uint64_t v24 = sub_218354830();
    swift_allocError();
    v26 = v25;
    uint64_t v27 = (char *)v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
    uint64_t *v26 = a1;
    uint64_t v29 = v34;
    uint64_t v28 = v35;
    (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v27, v23, v35);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCC0], v24);
    swift_willThrow();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v23, v28);
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v22 + 32))(v32, v13, a3);
  }
}

uint64_t type metadata accessor for _CBORDecoder()
{
  return self;
}

void sub_21832A710(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sub_21833368C(a1, a2, a4, (uint64_t)&v9);
  if (!v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FC8);
    int v8 = swift_dynamicCast();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a3 - 8) + 56))(a5, v8 ^ 1u, 1, a3);
  }
}

uint64_t CBORDecoder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CBORDecoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_21832A810(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, void, void, uint64_t, uint64_t))(**(void **)v4 + 120))(a1, *a2, a2[1], a3, a4);
}

uint64_t type metadata accessor for CBORDecoder()
{
  return self;
}

uint64_t method lookup function for CBORDecoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CBORDecoder);
}

uint64_t dispatch thunk of CBORDecoder.userInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of CBORDecoder.userInfo.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of CBORDecoder.userInfo.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CBORDecoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of CBORDecoder.decode<A>(_:from:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of CBORDecoder.decode<A>(_:from:noCopyOnDecodeReturn:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

void sub_21832A9C8(uint64_t a1)
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v10 = sub_218354830();
    swift_allocError();
    uint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v12 = a1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v10 - 8) + 104))(v12, *MEMORY[0x263F8DCB0], v10);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_218354960();
  if (!v4) {
    goto LABEL_12;
  }
LABEL_3:
  unint64_t v5 = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v6 = (id)MEMORY[0x21D4677D0](v5, v3);
    goto LABEL_8;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v5 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v3 + 8 * v5 + 32);
LABEL_8:
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v7, sel_dictionary);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      sub_218335610();
      sub_218354600();

      swift_beginAccess();
      type metadata accessor for _CBORDecoderKeyedContainer();
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      sub_2183549D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();

      return;
    }

    goto LABEL_13;
  }
  __break(1u);
}

void sub_21832ACA0(void *a1@<X8>)
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_12:
    swift_bridgeObjectRelease();
LABEL_13:
    uint64_t v13 = sub_218354830();
    swift_allocError();
    id v15 = v14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7E8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCB0], v13);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_218354960();
  if (!v4) {
    goto LABEL_12;
  }
LABEL_3:
  unint64_t v5 = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v6 = (id)MEMORY[0x21D4677D0](v5, v3);
    goto LABEL_8;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v5 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v6 = *(id *)(v3 + 8 * v5 + 32);
LABEL_8:
    uint64_t v7 = v6;
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v7, sel_array);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      uint64_t v10 = sub_218354730();

      swift_beginAccess();
      uint64_t v11 = *(void *)(v1 + 16);
      a1[3] = &type metadata for _CBORDecoderUnkeyedContainer;
      a1[4] = sub_218335574();
      uint64_t v12 = (void *)swift_allocObject();
      *a1 = v12;
      swift_retain();
      swift_bridgeObjectRetain();

      v12[2] = v11;
      v12[3] = 0;
      v12[4] = v1;
      v12[5] = v10;
      return;
    }

    goto LABEL_13;
  }
  __break(1u);
}

uint64_t sub_21832AF20()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_21832AF6C()
{
  return swift_bridgeObjectRetain();
}

void sub_21832AF78(uint64_t a1)
{
}

void sub_21832AF9C(void *a1@<X8>)
{
}

uint64_t sub_21832AFC0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  a1[3] = type metadata accessor for _CBORDecoder();
  a1[4] = sub_2183356CC(&qword_267BC6FB0);
  *a1 = v3;
  return swift_retain();
}

unint64_t sub_21832B030()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8D4F8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832B224()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8D310];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832B418()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8D538];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832B60C()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8D5C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832B800()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8D6C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832B9F4()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E498];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832BBE8()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E4F0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832BDDC()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E548];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832BFD0()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E5C0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832C1C4()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8D9D0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832C3B8()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E778];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832C5AC()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E888];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832C7A0()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E8F8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832C994()
{
  if (sub_21832CDA8())
  {
    uint64_t v1 = sub_218354830();
    swift_allocError();
    uint64_t v3 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v3 = MEMORY[0x263F8E970];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v1 - 8) + 104))(v3, *MEMORY[0x263F8DCC0], v1);
    swift_willThrow();
    return v1;
  }
  swift_beginAccess();
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_218354960();
  if (!v5) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v4 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v7 = (id)MEMORY[0x21D4677D0](result, v4);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v7 = *(id *)(v4 + 8 * result + 32);
LABEL_10:
    uint64_t v1 = (uint64_t)v7;
    swift_bridgeObjectRelease();
    return v1;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832CB88(uint64_t a1)
{
  if (sub_21832CDA8())
  {
    uint64_t v3 = sub_218354830();
    swift_allocError();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v5 = a1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    sub_218354F30();
    swift_bridgeObjectRelease();
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCC0], v3);
    swift_willThrow();
    return v3;
  }
  swift_beginAccess();
  unint64_t v6 = *(void *)(v1 + 24);
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_218354960();
  if (!v7) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t result = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_15:
    id v9 = (id)MEMORY[0x21D4677D0](result, v6);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v9 = *(id *)(v6 + 8 * result + 32);
LABEL_10:
    uint64_t v3 = (uint64_t)v9;
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

unint64_t sub_21832CDA8()
{
  unint64_t v1 = v0 + 24;
  swift_beginAccess();
  unint64_t v2 = *(void *)(v0 + 24);
  if (!(v2 >> 62))
  {
    if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_218354960();
  swift_bridgeObjectRelease();
  if (!v8) {
    goto LABEL_15;
  }
LABEL_3:
  unint64_t v1 = *(void *)v1;
  if (!(v1 >> 62))
  {
    uint64_t v3 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_5;
    }
LABEL_17:
    unint64_t result = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_18;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218354960();
  if (!v3) {
    goto LABEL_17;
  }
LABEL_5:
  unint64_t result = v3 - 1;
  if (__OFSUB__(v3, 1))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if ((v1 & 0xC000000000000001) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v5 = *(id *)(v1 + 8 * result + 32);
      goto LABEL_10;
    }
    __break(1u);
    return result;
  }
LABEL_19:
  id v5 = (id)MEMORY[0x21D4677D0](result, v1);
LABEL_10:
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v6, sel_type) == (id)11)
  {

    return 1;
  }
  else
  {
    id v7 = objc_msgSend(v6, sel_type);

    return v7 == (id)12;
  }
}

void *sub_21832CF18(void *a1)
{
  if (objc_msgSend(a1, sel_type) == (id)3)
  {
    id v2 = objc_msgSend(a1, sel_string);
    if (v2)
    {
      uint64_t v3 = v2;
      unint64_t v4 = (void *)sub_218354650();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v5 = sub_218354830();
    swift_allocError();
    id v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v7 = MEMORY[0x263F8D310];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v8 = objc_msgSend(a1, sel_description);
    uint64_t v9 = sub_218354650();
    uint64_t v11 = v10;

    v13[0] = v9;
    v13[1] = v11;
    sub_218354680();
    unint64_t v4 = v13;
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v7, *MEMORY[0x263F8DCB0], v5);
    swift_willThrow();
  }
  return v4;
}

void sub_21832D0E4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_2183547C0();
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v14 - v9;
  uint64_t v11 = (void *)sub_21832CB88(a1);
  if (!v4)
  {
    uint64_t v12 = v11;
    sub_21832A710(v11, a1, a2, a3, (uint64_t)v10);

    uint64_t v13 = *(void *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, a2) == 1) {
      __break(1u);
    }
    else {
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a4, v10, a2);
    }
  }
}

uint64_t sub_21832D23C()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_21832D280()
{
  return sub_21832CDA8() & 1;
}

uint64_t sub_21832D2A8()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832B030();
  if (!v1)
  {
    uint64_t v4 = v3;
    LOBYTE(v2) = sub_2183347B8(v3);
  }
  return v2 & 1;
}

void *sub_21832D300()
{
  uint64_t v2 = (void *)*v0;
  uint64_t v3 = (void *)sub_21832B224();
  if (!v1)
  {
    uint64_t v4 = v3;
    uint64_t v2 = sub_21832CF18(v3);
  }
  return v2;
}

double sub_21832D360()
{
  uint64_t v2 = (void *)sub_21832B418();
  if (!v0)
  {
    uint64_t v3 = v2;
    sub_21833494C(v2);
    double v1 = v4;
  }
  return v1;
}

float sub_21832D3C0()
{
  uint64_t v2 = (void *)sub_21832B60C();
  if (!v0)
  {
    uint64_t v3 = v2;
    sub_218334B10(v2);
    float v1 = v4;
  }
  return v1;
}

uint64_t sub_21832D420()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832B800();
  if (!v1)
  {
    float v4 = v3;
    uint64_t v2 = sub_2183353B0(v3, MEMORY[0x263F8D6C8], 7630409, 0xE300000000000000, (SEL *)&selRef_integerValue);
  }
  return v2;
}

uint64_t sub_21832D494(uint64_t a1, uint64_t a2)
{
  return sub_21832D6D0(a1, a2, (uint64_t (*)(void))sub_21832B9F4, (uint64_t (*)(void))sub_218334CD4);
}

uint64_t sub_21832D4D4(uint64_t a1, uint64_t a2)
{
  return sub_21832D774(a1, a2, (uint64_t (*)(void))sub_21832BBE8, (uint64_t (*)(void))sub_218334E88);
}

uint64_t sub_21832D514()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832BDDC();
  if (!v1)
  {
    float v4 = v3;
    uint64_t v2 = sub_2183353B0(v3, MEMORY[0x263F8E548], 0x3233746E49, 0xE500000000000000, (SEL *)&selRef_intValue);
  }
  return v2;
}

uint64_t sub_21832D58C()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832BFD0();
  if (!v1)
  {
    float v4 = v3;
    uint64_t v2 = sub_2183353B0(v3, MEMORY[0x263F8E5C0], 0x3436746E49, 0xE500000000000000, (SEL *)&selRef_longLongValue);
  }
  return v2;
}

uint64_t sub_21832D604()
{
  return sub_218354C30();
}

uint64_t sub_21832D61C()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832C1C4();
  if (!v1)
  {
    float v4 = v3;
    uint64_t v2 = sub_2183353B0(v3, MEMORY[0x263F8D9D0], 1953384789, 0xE400000000000000, (SEL *)&selRef_unsignedIntegerValue);
  }
  return v2;
}

uint64_t sub_21832D690(uint64_t a1, uint64_t a2)
{
  return sub_21832D6D0(a1, a2, (uint64_t (*)(void))sub_21832C3B8, (uint64_t (*)(void))sub_218335040);
}

uint64_t sub_21832D6D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = *v4;
  uint64_t v8 = a3();
  if (!v5)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v7 = a4();
  }
  return v7;
}

uint64_t sub_21832D734(uint64_t a1, uint64_t a2)
{
  return sub_21832D774(a1, a2, (uint64_t (*)(void))sub_21832C5AC, (uint64_t (*)(void))sub_2183351F8);
}

uint64_t sub_21832D774(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t v7 = *v4;
  uint64_t v8 = a3();
  if (!v5)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v7 = a4();
  }
  return v7;
}

uint64_t sub_21832D7D8()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832C7A0();
  if (!v1)
  {
    float v4 = v3;
    uint64_t v2 = sub_2183353B0(v3, MEMORY[0x263F8E8F8], 0x3233746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedIntValue);
  }
  return v2;
}

uint64_t sub_21832D850()
{
  uint64_t v2 = *v0;
  uint64_t v3 = (void *)sub_21832C994();
  if (!v1)
  {
    float v4 = v3;
    uint64_t v2 = sub_2183353B0(v3, MEMORY[0x263F8E970], 0x3436746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedLongLongValue);
  }
  return v2;
}

uint64_t sub_21832D8C8()
{
  return sub_218354C40();
}

void sub_21832D8E0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
}

uint64_t sub_21832D904()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC70B0);
  sub_218336A94();
  uint64_t v0 = sub_218354700();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21832D9B4@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    id v6 = objc_msgSend(a1, sel_numeric);
    objc_msgSend(v6, sel_integerValue);

    return sub_218354F00();
  }
  else
  {
    id v8 = objc_msgSend(a1, sel_string);
    if (v8)
    {
      uint64_t v9 = v8;
      sub_218354650();

      return sub_218354EE0();
    }
    else
    {
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56);
      return v10(a3, 1, 1, a2);
    }
  }
}

BOOL sub_21832DAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, a5);
  id v12 = sub_218348AE8((uint64_t)v10, v11, a5);
  uint64_t v13 = sub_21832DC0C(v12, a3);

  if (v13) {
  return v13 != 0;
  }
}

void *sub_21832DC0C(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_21834A560((uint64_t)a1);
      if (v7)
      {
        uint64_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_218354930();

  if (!v4) {
    return 0;
  }
  sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t *sub_21832DCE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v31 = a4;
  uint64_t v10 = sub_218354820();
  uint64_t v33 = *(void *)(v10 - 8);
  uint64_t v34 = v10;
  uint64_t v12 = MEMORY[0x270FA5388](v10, v11);
  uint64_t v37 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v12, v15);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  id v19 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v32 = a1;
  v19(v17, a1, a5);
  id v20 = sub_218348AE8((uint64_t)v17, v18, a5);
  uint64_t v21 = (uint64_t *)sub_21832DC0C(v20, a3);

  if (!v21)
  {
    uint64_t v35 = 0;
    unint64_t v36 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_2183547E0();
    sub_218354680();
    uint64_t v22 = v32;
    sub_218354C00();
    sub_218354810();
    uint64_t v23 = sub_218354830();
    swift_allocError();
    uint64_t v21 = v24;
    v25 = (char *)v24 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC70A8) + 48);
    v21[3] = a5;
    v21[4] = a6;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v21);
    v19((char *)boxed_opaque_existential_1Tm, v22, a5);
    uint64_t v28 = v33;
    uint64_t v27 = v34;
    uint64_t v29 = v37;
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v25, v37, v34);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v21, *MEMORY[0x263F8DCA8], v23);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v27);
  }
  return v21;
}

uint64_t sub_21832DFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *(void *)(a5 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  id v20 = (char *)&v35 - v19;
  v26 = sub_21832DCE4(v18, v21, v22, v23, v24, v25);
  if (!v6)
  {
    uint64_t v35 = 0;
    unint64_t v36 = v26;
    uint64_t v37 = a3;
    uint64_t v38 = a4;
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v27(v20, a1, a5);
    v40 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v28 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v28;
    uint64_t v39 = a6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v28 = sub_21833D6C4(0, v28[2] + 1, 1, v28);
      uint64_t *v40 = (uint64_t)v28;
    }
    unint64_t v31 = v28[2];
    unint64_t v30 = v28[3];
    if (v31 >= v30 >> 1)
    {
      uint64_t v34 = sub_21833D6C4((void *)(v30 > 1), v31 + 1, 1, v28);
      uint64_t *v40 = (uint64_t)v34;
    }
    v27(v16, (uint64_t)v20, a5);
    sub_218348C54(v31, (uint64_t)v16, v40, a5, v39);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, a5);
    uint64_t v32 = v36;
    LOBYTE(a3) = objc_msgSend(v36, sel_type) == (id)11 || objc_msgSend(v32, sel_type) == (id)12;
    sub_21832E484(a2);
  }
  return a3 & 1;
}

unint64_t sub_21832E230(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v13, v16);
  uint64_t v19 = (char *)&v35 - v18;
  uint64_t v25 = sub_21832DCE4(v17, v20, v21, v22, v23, v24);
  if (!v6)
  {
    uint64_t v37 = v25;
    uint64_t v38 = a3;
    uint64_t v39 = a4;
    unint64_t v40 = a6;
    v26 = *(void (**)(uint64_t, char *, uint64_t))(v42 + 16);
    uint64_t v35 = v15;
    unint64_t v36 = v26;
    v26((uint64_t)v19, a1, a5);
    v41 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v27 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v27;
    uint64_t v29 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v27 = sub_21833D6C4(0, v27[2] + 1, 1, v27);
      uint64_t *v41 = (uint64_t)v27;
    }
    unint64_t v30 = v37;
    uint64_t v31 = (uint64_t)v35;
    a6 = v27[2];
    unint64_t v32 = v27[3];
    if (a6 >= v32 >> 1)
    {
      uint64_t v34 = sub_21833D6C4((void *)(v32 > 1), a6 + 1, 1, v27);
      uint64_t *v41 = (uint64_t)v34;
    }
    v36(v31, v19, a5);
    sub_218348C54(a6, v31, v41, a5, v40);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v19, a5);
    LOBYTE(a6) = sub_2183347B8(v30);
    sub_21832E484(v29);
  }
  return a6 & 1;
}

uint64_t sub_21832E484(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 16);
  swift_beginAccess();
  id v3 = *(void **)(a1 + 16);
  if (!v3[2])
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_21834885C(v3);
    id v3 = (void *)result;
    uint64_t v5 = *(void *)(result + 16);
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = v3[2];
  if (v5)
  {
LABEL_4:
    uint64_t v6 = v5 - 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v3[5 * v5 - 1]);
    v3[2] = v6;
    *uint64_t v2 = v3;
    return swift_endAccess();
  }
LABEL_7:
  __break(1u);
  return result;
}

char *sub_21832E52C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = a1;
  uint64_t v13 = *(void *)(a5 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  uint64_t v20 = (char *)&v37 - v19;
  v26 = sub_21832DCE4(v18, v21, v22, v23, v24, v25);
  if (!v6)
  {
    uint64_t v40 = 0;
    v41 = v16;
    v43 = v26;
    uint64_t v44 = a3;
    uint64_t v45 = a4;
    uint64_t v42 = v13;
    uint64_t v39 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v39(v20, v12, a5);
    uint64_t v27 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v12 = *(char **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v12;
    uint64_t v38 = a2;
    uint64_t v46 = a6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v12 = (char *)sub_21833D6C4(0, *((void *)v12 + 2) + 1, 1, v12);
      *uint64_t v27 = (uint64_t)v12;
    }
    uint64_t v29 = v43;
    uint64_t v30 = (uint64_t)v41;
    unint64_t v32 = *((void *)v12 + 2);
    unint64_t v31 = *((void *)v12 + 3);
    if (v32 >= v31 >> 1) {
      *uint64_t v27 = (uint64_t)sub_21833D6C4((void *)(v31 > 1), v32 + 1, 1, v12);
    }
    v39((char *)v30, v20, a5);
    sub_218348C54(v32, v30, v27, a5, v46);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v20, a5);
    uint64_t v33 = v38;
    uint64_t v34 = v40;
    uint64_t v35 = (char *)sub_21832CF18(v29);
    if (!v34) {
      uint64_t v12 = v35;
    }
    sub_21832E484(v33);
  }
  return v12;
}

double sub_21832E79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t v27 = sub_21832DCE4(v19, v22, v23, v24, v25, v26);
  if (!v6)
  {
    uint64_t v41 = 0;
    uint64_t v42 = v17;
    uint64_t v46 = a4;
    uint64_t v47 = a6;
    uint64_t v44 = v27;
    uint64_t v45 = a3;
    uint64_t v43 = v14;
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v40(v21, a1, a5);
    uint64_t v28 = (void *)(a2 + 16);
    swift_beginAccess();
    uint64_t v29 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v29;
    unint64_t v31 = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v29 = sub_21833D6C4(0, v29[2] + 1, 1, v29);
      *uint64_t v28 = v29;
    }
    unint64_t v32 = v44;
    uint64_t v33 = (uint64_t)v42;
    unint64_t v35 = v29[2];
    unint64_t v34 = v29[3];
    if (v35 >= v34 >> 1) {
      *uint64_t v28 = sub_21833D6C4((void *)(v34 > 1), v35 + 1, 1, v29);
    }
    v40((char *)v33, (uint64_t)v31, a5);
    sub_218348C54(v35, v33, (uint64_t *)(a2 + 16), a5, v47);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, a5);
    uint64_t v36 = v41;
    sub_21833494C(v32);
    if (!v36) {
      double v7 = v37;
    }
    sub_21832E484(a2);
  }
  return v7;
}

float sub_21832EA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v14 = *(void *)(a5 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v15, v18);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t v27 = sub_21832DCE4(v19, v22, v23, v24, v25, v26);
  if (!v6)
  {
    uint64_t v41 = 0;
    uint64_t v42 = v17;
    uint64_t v46 = a4;
    uint64_t v47 = a6;
    uint64_t v44 = v27;
    uint64_t v45 = a3;
    uint64_t v43 = v14;
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v40(v21, a1, a5);
    uint64_t v28 = (void *)(a2 + 16);
    swift_beginAccess();
    uint64_t v29 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v29;
    unint64_t v31 = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v29 = sub_21833D6C4(0, v29[2] + 1, 1, v29);
      *uint64_t v28 = v29;
    }
    unint64_t v32 = v44;
    uint64_t v33 = (uint64_t)v42;
    unint64_t v35 = v29[2];
    unint64_t v34 = v29[3];
    if (v35 >= v34 >> 1) {
      *uint64_t v28 = sub_21833D6C4((void *)(v34 > 1), v35 + 1, 1, v29);
    }
    v40((char *)v33, (uint64_t)v31, a5);
    sub_218348C54(v35, v33, (uint64_t *)(a2 + 16), a5, v47);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, a5);
    uint64_t v36 = v41;
    sub_218334B10(v32);
    if (!v36) {
      float v7 = v37;
    }
    sub_21832E484(a2);
  }
  return v7;
}

uint64_t sub_21832EC64(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t *))
{
  uint64_t v46 = a7;
  uint64_t v47 = *(void *)(a5 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v26 = sub_21832DCE4(v18, v21, v22, v23, v24, v25);
  if (!v7)
  {
    uint64_t v41 = v26;
    uint64_t v42 = a3;
    uint64_t v43 = a4;
    uint64_t v44 = a6;
    uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 16);
    uint64_t v39 = v16;
    uint64_t v40 = v27;
    v27((uint64_t)v20, a1, a5);
    uint64_t v45 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v28 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v28;
    uint64_t v30 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v28 = sub_21833D6C4(0, v28[2] + 1, 1, v28);
      *uint64_t v45 = (uint64_t)v28;
    }
    unint64_t v31 = v46;
    uint64_t v32 = (uint64_t)v39;
    unint64_t v34 = v28[2];
    unint64_t v33 = v28[3];
    if (v34 >= v33 >> 1)
    {
      float v37 = sub_21833D6C4((void *)(v33 > 1), v34 + 1, 1, v28);
      *uint64_t v45 = (uint64_t)v37;
    }
    v40(v32, v20, a5);
    sub_218348C54(v34, v32, v45, a5, v44);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v20, a5);
    unint64_t v35 = v41;
    a6 = v31(v41);
    sub_21832E484(v30);
  }
  return a6;
}

uint64_t sub_21832EEC4(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t *))
{
  uint64_t v46 = a7;
  uint64_t v47 = *(void *)(a5 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v14, v17);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v26 = sub_21832DCE4(v18, v21, v22, v23, v24, v25);
  if (!v7)
  {
    uint64_t v41 = v26;
    uint64_t v42 = a3;
    uint64_t v43 = a4;
    uint64_t v44 = a6;
    uint64_t v27 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 16);
    uint64_t v39 = v16;
    uint64_t v40 = v27;
    v27((uint64_t)v20, a1, a5);
    uint64_t v45 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    uint64_t v28 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v28;
    uint64_t v30 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v28 = sub_21833D6C4(0, v28[2] + 1, 1, v28);
      *uint64_t v45 = (uint64_t)v28;
    }
    unint64_t v31 = v46;
    uint64_t v32 = (uint64_t)v39;
    unint64_t v34 = v28[2];
    unint64_t v33 = v28[3];
    if (v34 >= v33 >> 1)
    {
      float v37 = sub_21833D6C4((void *)(v33 > 1), v34 + 1, 1, v28);
      *uint64_t v45 = (uint64_t)v37;
    }
    v40(v32, v20, a5);
    sub_218348C54(v34, v32, v45, a5, v44);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v20, a5);
    unint64_t v35 = v41;
    a6 = v31(v41);
    sub_21832E484(v30);
  }
  return a6;
}

uint64_t sub_21832F124(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  uint64_t v50 = a7;
  uint64_t v51 = a8;
  uint64_t v52 = *(void *)(a5 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v17, v20);
  uint64_t v23 = (char *)&v41 - v22;
  uint64_t v29 = sub_21832DCE4(v21, v24, v25, v26, v27, v28);
  if (!v10)
  {
    uint64_t v45 = v29;
    uint64_t v46 = a3;
    uint64_t v47 = a4;
    uint64_t v48 = a6;
    uint64_t v43 = a9;
    uint64_t v44 = a10;
    uint64_t v30 = *(void (**)(uint64_t, char *, uint64_t))(v52 + 16);
    uint64_t v41 = v19;
    uint64_t v42 = v30;
    v30((uint64_t)v23, a1, a5);
    v49 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    unint64_t v31 = *(void **)(a2 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a2 + 16) = v31;
    uint64_t v33 = a2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      unint64_t v31 = sub_21833D6C4(0, v31[2] + 1, 1, v31);
      uint64_t *v49 = (uint64_t)v31;
    }
    uint64_t v34 = v51;
    uint64_t v35 = (uint64_t)v41;
    unint64_t v37 = v31[2];
    unint64_t v36 = v31[3];
    if (v37 >= v36 >> 1)
    {
      uint64_t v40 = sub_21833D6C4((void *)(v36 > 1), v37 + 1, 1, v31);
      uint64_t *v49 = (uint64_t)v40;
    }
    v42(v35, v23, a5);
    sub_218348C54(v37, v35, v49, a5, v48);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v23, a5);
    uint64_t v38 = v45;
    a6 = sub_2183353B0(v45, v50, v34, v43, v44);
    sub_21832E484(v33);
  }
  return a6;
}

void sub_21832F398(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v59 = a7;
  uint64_t v61 = a8;
  uint64_t v58 = a1;
  uint64_t v56 = a9;
  uint64_t v15 = sub_2183547C0();
  uint64_t v17 = MEMORY[0x270FA5388](v15 - 8, v16);
  uint64_t v19 = (char *)&v48 - v18;
  uint64_t v57 = *(void *)(a6 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v17, v20);
  uint64_t v23 = (char *)&v48 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21, v24);
  uint64_t v26 = (char *)&v48 - v25;
  uint64_t v27 = a2;
  uint64_t v28 = v60;
  uint64_t v29 = sub_21832DCE4(a2, a3, a4, a5, a6, v61);
  if (!v28)
  {
    uint64_t v53 = a5;
    v54 = v23;
    uint64_t v50 = 0;
    uint64_t v51 = v19;
    v60 = v29;
    uint64_t v52 = a4;
    uint64_t v55 = a10;
    uint64_t v30 = v57;
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    v49(v26, v27, a6);
    unint64_t v31 = (uint64_t *)(a3 + 16);
    swift_beginAccess();
    uint64_t v32 = *(void **)(a3 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a3 + 16) = v32;
    uint64_t v48 = a3;
    uint64_t v34 = a6;
    uint64_t v35 = v30;
    unint64_t v36 = v26;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v32 = sub_21833D6C4(0, v32[2] + 1, 1, v32);
      *unint64_t v31 = (uint64_t)v32;
    }
    uint64_t v37 = v58;
    uint64_t v38 = (uint64_t)v54;
    unint64_t v40 = v32[2];
    unint64_t v39 = v32[3];
    if (v40 >= v39 >> 1) {
      *unint64_t v31 = (uint64_t)sub_21833D6C4((void *)(v39 > 1), v40 + 1, 1, v32);
    }
    v49((char *)v38, (uint64_t)v36, v34);
    sub_218348C54(v40, v38, v31, v34, v61);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v36, v34);
    uint64_t v41 = v50;
    uint64_t v42 = (uint64_t)v51;
    uint64_t v43 = v60;
    uint64_t v44 = v37;
    uint64_t v45 = v59;
    uint64_t v46 = v48;
    sub_21832A710(v60, v44, v59, v55, (uint64_t)v51);
    if (v41)
    {
      sub_21832E484(v46);
    }
    else
    {
      uint64_t v47 = *(void *)(v45 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v42, 1, v45) == 1)
      {
        __break(1u);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v56, v42, v45);
        sub_21832E484(v46);
      }
    }
  }
}

void sub_21832F734(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v70 = a7;
  uint64_t v72 = a1;
  uint64_t v71 = a9;
  uint64_t v77 = *(void *)(a6 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](a1, a2);
  v74 = (char *)v64 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15, v17);
  uint64_t v19 = (char *)v64 - v18;
  uint64_t v20 = sub_218354820();
  v73 = *(uint64_t **)(v20 - 8);
  MEMORY[0x270FA5388](v20, v21);
  uint64_t v23 = (char *)v64 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = a3;
  uint64_t v76 = a2;
  uint64_t v24 = v83;
  uint64_t v25 = sub_21832DCE4(a2, a3, a4, a5, a6, a8);
  if (!v24)
  {
    v65 = v19;
    v64[1] = 0;
    v66 = v23;
    uint64_t v67 = v20;
    v64[2] = a4;
    uint64_t v83 = a6;
    uint64_t v68 = a5;
    uint64_t v69 = a8;
    uint64_t v26 = v25;
    if (objc_msgSend(v25, sel_type) == (id)5)
    {
      v73 = v26;
      uint64_t v28 = (char *)(v77 + 16);
      uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v77 + 16);
      uint64_t v29 = v65;
      v27(v65, v76, v83);
      uint64_t v30 = v75;
      unint64_t v31 = (uint64_t *)(v75 + 16);
      swift_beginAccess();
      uint64_t v32 = *(void **)(v30 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v30 + 16) = v32;
      uint64_t v34 = (void (*)(uint64_t *, uint64_t, uint64_t))v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v32 = sub_21833D6C4(0, v32[2] + 1, 1, v32);
        *unint64_t v31 = (uint64_t)v32;
      }
      unint64_t v36 = v32[2];
      unint64_t v35 = v32[3];
      uint64_t v37 = v83;
      uint64_t v38 = v77;
      unint64_t v39 = v74;
      if (v36 >= v35 >> 1)
      {
        *unint64_t v31 = (uint64_t)sub_21833D6C4((void *)(v35 > 1), v36 + 1, 1, v32);
        unint64_t v39 = v74;
      }
      uint64_t v40 = (uint64_t)v39;
      uint64_t v41 = v28;
      uint64_t v42 = v34;
      v74 = v41;
      v34((uint64_t *)v39, (uint64_t)v29, v37);
      uint64_t v43 = v36;
      uint64_t v44 = v69;
      sub_218348C54(v43, v40, v31, v37, v69);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v37);
      uint64_t v45 = v75;
      swift_retain();
      uint64_t v46 = v73;
      id v47 = objc_msgSend(v73, sel_dictionary);
      if (v47)
      {
        uint64_t v48 = v47;
        sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
        sub_218335610();
        uint64_t v49 = sub_218354600();

        __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE810);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_218355C80;
        *(void *)(inited + 56) = v37;
        *(void *)(inited + 64) = v44;
        boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)(inited + 32));
        v42(boxed_opaque_existential_1Tm, v76, v37);
        uint64_t v78 = v68;
        swift_bridgeObjectRetain();
        sub_2183346B8((void *)inited);
        uint64_t v52 = v78;
        uint64_t v78 = v45;
        uint64_t v79 = v49;
        uint64_t v80 = v52;
        type metadata accessor for _CBORDecoderKeyedContainer();
        swift_getWitnessTable();
        sub_2183549D0();
        sub_21832E484(v45);
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      uint64_t v81 = 0;
      unint64_t v82 = 0xE000000000000000;
      uint64_t v53 = v69;
      swift_bridgeObjectRetain();
      uint64_t v54 = v76;
      uint64_t v55 = v83;
      sub_218354C00();
      sub_218354680();
      sub_218354F30();
      sub_218354680();
      swift_bridgeObjectRelease();
      uint64_t v56 = v66;
      sub_218354810();
      uint64_t v57 = sub_218354830();
      swift_allocError();
      uint64_t v59 = v58;
      v60 = (char *)v58 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC70A8) + 48);
      v59[3] = v55;
      v59[4] = v53;
      uint64_t v61 = __swift_allocate_boxed_opaque_existential_1Tm(v59);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v77 + 16))(v61, v54, v55);
      v62 = v73;
      uint64_t v63 = v67;
      ((void (*)(char *, char *, uint64_t))v73[2])(v60, v56, v67);
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v57 - 8) + 104))(v59, *MEMORY[0x263F8DCA8], v57);
      swift_willThrow();

      ((void (*)(char *, uint64_t))v62[1])(v56, v63);
    }
  }
}

void sub_21832FD4C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v63 = a7;
  uint64_t v68 = *(void *)(a5 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](a1, a2);
  v64 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13, v15);
  uint64_t v17 = (char *)&v58 - v16;
  uint64_t v18 = sub_218354820();
  v65 = *(uint64_t **)(v18 - 8);
  MEMORY[0x270FA5388](v18, v19);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = (void (*)(void, void, void))a1;
  uint64_t v67 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a4;
  uint64_t v25 = a6;
  uint64_t v26 = v71;
  uint64_t v27 = sub_21832DCE4(a1, a2, v22, v24, a5, a6);
  if (!v26)
  {
    uint64_t v59 = v21;
    uint64_t v28 = v66;
    uint64_t v60 = v18;
    uint64_t v61 = v23;
    uint64_t v71 = a5;
    uint64_t v62 = v25;
    uint64_t v29 = v27;
    if (objc_msgSend(v27, sel_type, 0) == (id)4)
    {
      v65 = v29;
      uint64_t v30 = v17;
      v66 = *(void (**)(void, void, void))(v68 + 16);
      v66(v17, v28, v71);
      uint64_t v31 = v67;
      uint64_t v32 = (uint64_t *)(v67 + 16);
      swift_beginAccess();
      uint64_t v33 = *(void **)(v31 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v31 + 16) = v33;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v33 = sub_21833D6C4(0, v33[2] + 1, 1, v33);
        *uint64_t v32 = (uint64_t)v33;
      }
      uint64_t v35 = (uint64_t)v64;
      unint64_t v37 = v33[2];
      unint64_t v36 = v33[3];
      uint64_t v38 = v71;
      if (v37 >= v36 >> 1) {
        *uint64_t v32 = (uint64_t)sub_21833D6C4((void *)(v36 > 1), v37 + 1, 1, v33);
      }
      v66(v35, v30, v38);
      sub_218348C54(v37, v35, v32, v38, v62);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v30, v38);
      uint64_t v39 = v67;
      swift_retain();
      uint64_t v40 = v65;
      id v41 = objc_msgSend(v65, sel_array);
      if (v41)
      {
        uint64_t v42 = v41;
        sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
        uint64_t v43 = sub_218354730();

        uint64_t v44 = *(void *)(v39 + 16);
        uint64_t v45 = v63;
        v63[3] = &type metadata for _CBORDecoderUnkeyedContainer;
        v45[4] = sub_218335574();
        uint64_t v46 = (void *)swift_allocObject();
        *uint64_t v45 = v46;
        v46[2] = v44;
        v46[3] = 0;
        v46[4] = v39;
        v46[5] = v43;
        swift_bridgeObjectRetain();
        sub_21832E484(v39);
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      uint64_t v69 = 0;
      unint64_t v70 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_2183547E0();
      uint64_t v47 = v62;
      uint64_t v48 = v28;
      uint64_t v49 = v71;
      sub_218354C00();
      sub_218354680();
      uint64_t v50 = v59;
      sub_218354810();
      uint64_t v51 = sub_218354830();
      swift_allocError();
      uint64_t v53 = v52;
      uint64_t v54 = (char *)v52 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC70A8) + 48);
      v53[3] = v49;
      v53[4] = v47;
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v53);
      (*(void (**)(uint64_t *, void, uint64_t))(v68 + 16))(boxed_opaque_existential_1Tm, v48, v49);
      uint64_t v56 = v65;
      uint64_t v57 = v60;
      ((void (*)(char *, char *, uint64_t))v65[2])(v54, v50, v60);
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v51 - 8) + 104))(v53, *MEMORY[0x263F8DCA8], v51);
      swift_willThrow();

      ((void (*)(char *, uint64_t))v56[1])(v50, v57);
    }
  }
}

uint64_t sub_218330254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v38 = a6;
  uint64_t v36 = a4;
  uint64_t v37 = a5;
  uint64_t v42 = a3;
  sub_2183369A0(a1, (uint64_t)v39);
  uint64_t v10 = (void *)(a2 + 16);
  swift_beginAccess();
  uint64_t v11 = *(void **)(a2 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a2 + 16) = v11;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v11 = sub_21833D6C4(0, v11[2] + 1, 1, v11);
    *uint64_t v10 = v11;
  }
  unint64_t v14 = v11[2];
  unint64_t v13 = v11[3];
  if (v14 >= v13 >> 1) {
    *uint64_t v10 = sub_21833D6C4((void *)(v13 > 1), v14 + 1, 1, v11);
  }
  uint64_t v15 = v40;
  uint64_t v16 = v41;
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v39, v40);
  MEMORY[0x270FA5388](v17, v17);
  uint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  sub_218348C54(v14, (uint64_t)v19, (uint64_t *)(a2 + 16), v15, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  uint64_t v21 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  sub_2183369A0(a1, (uint64_t)v39);
  uint64_t v22 = v40;
  uint64_t v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v39, v40);
  MEMORY[0x270FA5388](v23, v23);
  uint64_t v25 = (char *)&v36 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v26 + 16))(v25);
  id v27 = sub_218348AE8((uint64_t)v25, v21, v22);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  id v28 = sub_21832DC0C(v27, v42);

  if (!v28) {
    id v28 = objc_msgSend(self, sel_cborNil, v36, v37, v38);
  }
  uint64_t v29 = *(void *)(a2 + 16);
  uint64_t v30 = *(void *)(a2 + 32);
  uint64_t v31 = type metadata accessor for _CBORDecoder();
  uint64_t v32 = (void *)swift_allocObject();
  v32[3] = MEMORY[0x263F8EE78];
  swift_beginAccess();
  id v33 = v28;
  swift_bridgeObjectRetain();
  uint64_t v34 = swift_bridgeObjectRetain();
  MEMORY[0x21D4676F0](v34);
  if (*(void *)((v32[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v32[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_218354760();
  }
  sub_218354770();
  sub_218354750();
  swift_endAccess();
  v32[2] = v29;
  v32[4] = v30;
  a7[3] = v31;
  a7[4] = sub_2183356CC(&qword_267BC6FE0);

  *a7 = v32;
  return sub_21832E484(a2);
}

uint64_t sub_218330610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  uint64_t result = sub_21833E988(0x7265707573, 0xE500000000000000);
  if (v12)
  {
    uint64_t v15 = result;
    uint64_t v16 = v12;
    uint64_t v17 = v13;
    char v18 = v14;
    v21[3] = &type metadata for CBORCodingKey;
    v21[4] = sub_218335E58();
    uint64_t v19 = swift_allocObject();
    v21[0] = v19;
    *(void *)(v19 + 16) = v15;
    *(void *)(v19 + 24) = v16;
    *(void *)(v19 + 32) = v17;
    *(unsigned char *)(v19 + 40) = v18 & 1;
    sub_218330254((uint64_t)v21, a1, a2, a3, a4, a5, a6);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *sub_218330708@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t result = sub_21832DCE4(a1, a2, a3, a4, a5, a6);
  if (!v7)
  {

    v17[3] = a5;
    v17[4] = a6;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v17);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a5 - 8) + 16))(boxed_opaque_existential_1Tm, a1, a5);
    sub_218330254((uint64_t)v17, a2, a3, a4, a5, a6, a7);
    return (uint64_t *)__swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  }
  return result;
}

uint64_t sub_2183307E0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2183307E8()
{
  return sub_21832D904();
}

BOOL sub_2183307FC(uint64_t a1, uint64_t a2)
{
  return sub_21832DAE8(a1, *v2, v2[1], v2[2], *(void *)(a2 + 16));
}

uint64_t sub_218330810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330870(a1, a2, a3, sub_21832DFE8) & 1;
}

uint64_t sub_218330840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330870(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_21832E230) & 1;
}

uint64_t sub_218330870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void))
{
  return a4(a1, *v4, v4[1], v4[2], *(void *)(a2 + 16), *(void *)(a2 + 24)) & 1;
}

char *sub_2183308A4(char *a1, uint64_t a2)
{
  return sub_21832E52C(a1, *v2, v2[1], v2[2], *(void *)(a2 + 16), *(void *)(a2 + 24));
}

double sub_2183308CC(uint64_t a1, uint64_t a2)
{
  return sub_21832E79C(a1, *v2, v2[1], v2[2], *(void *)(a2 + 16), *(void *)(a2 + 24));
}

float sub_2183308F4(uint64_t a1, uint64_t a2)
{
  return sub_21832EA00(a1, *v2, v2[1], v2[2], *(void *)(a2 + 16), *(void *)(a2 + 24));
}

uint64_t sub_21833091C(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330A18(a1, a2, a3, MEMORY[0x263F8D6C8], 7630409, 0xE300000000000000, (SEL *)&selRef_integerValue);
}

uint64_t sub_218330950(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330AD4(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_218334CD4);
}

uint64_t sub_21833097C(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330B2C(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_218334E88);
}

uint64_t sub_2183309A8(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330A18(a1, a2, a3, MEMORY[0x263F8E548], 0x3233746E49, 0xE500000000000000, (SEL *)&selRef_intValue);
}

uint64_t sub_2183309E0(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330A18(a1, a2, a3, MEMORY[0x263F8E5C0], 0x3436746E49, 0xE500000000000000, (SEL *)&selRef_longLongValue);
}

uint64_t sub_218330A18(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, SEL *a7)
{
  return sub_21832F124(a1, *v7, v7[1], v7[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t sub_218330A5C()
{
  return sub_218354D00();
}

uint64_t sub_218330A74(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330A18(a1, a2, a3, MEMORY[0x263F8D9D0], 1953384789, 0xE400000000000000, (SEL *)&selRef_unsignedIntegerValue);
}

uint64_t sub_218330AA8(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330AD4(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_218335040);
}

uint64_t sub_218330AD4(char *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *))
{
  return sub_21832EC64(a1, *v4, v4[1], v4[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4);
}

uint64_t sub_218330B00(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330B2C(a1, a2, a3, (uint64_t (*)(uint64_t *))sub_2183351F8);
}

uint64_t sub_218330B2C(char *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *))
{
  return sub_21832EEC4(a1, *v4, v4[1], v4[2], *(void *)(a2 + 16), *(void *)(a2 + 24), a4);
}

uint64_t sub_218330B58(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330A18(a1, a2, a3, MEMORY[0x263F8E8F8], 0x3233746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedIntValue);
}

uint64_t sub_218330B90(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_218330A18(a1, a2, a3, MEMORY[0x263F8E970], 0x3436746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedLongLongValue);
}

uint64_t sub_218330BC8()
{
  return sub_218354D10();
}

uint64_t sub_218330BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_218330F98(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, uint64_t, void, uint64_t))sub_21832F398);
}

uint64_t sub_218330C0C()
{
  return sub_218354C90();
}

uint64_t sub_218330C24()
{
  return sub_218354C80();
}

uint64_t sub_218330C3C()
{
  uint64_t result = sub_218354CA0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218330C60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330E8C(a1, a2, a3, MEMORY[0x263F8E340]);
}

uint64_t sub_218330C8C()
{
  uint64_t result = sub_218354CB0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218330CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330DD4(a1, a2, a3, MEMORY[0x263F8E358]);
}

uint64_t sub_218330CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330E30(a1, a2, a3, MEMORY[0x263F8E360]);
}

uint64_t sub_218330D08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330E8C(a1, a2, a3, MEMORY[0x263F8E368]);
}

uint64_t sub_218330D34()
{
  uint64_t result = sub_218354CE0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218330D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330F14(a1, a2, a3, MEMORY[0x263F8E380]);
}

uint64_t sub_218330D84()
{
  uint64_t result = sub_218354CC0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218330DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330DD4(a1, a2, a3, MEMORY[0x263F8E378]);
}

uint64_t sub_218330DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_218330E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330E30(a1, a2, a3, MEMORY[0x263F8E388]);
}

uint64_t sub_218330E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_218330E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330E8C(a1, a2, a3, MEMORY[0x263F8E390]);
}

uint64_t sub_218330E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_218330EC4()
{
  uint64_t result = sub_218354CF0();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218330EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_218330F14(a1, a2, a3, MEMORY[0x263F8E3A0]);
}

uint64_t sub_218330F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (v4) {
    return v6;
  }
  return result;
}

uint64_t sub_218330F40()
{
  return sub_218354CD0();
}

uint64_t sub_218330F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_218330F98(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, uint64_t, void, uint64_t))sub_21832F734);
}

uint64_t sub_218330F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, void, void, void, void, uint64_t, void, uint64_t))
{
  return a7(a1, a2, *v7, v7[1], v7[2], *(void *)(a5 + 16), a3, *(void *)(a5 + 24), a4);
}

uint64_t sub_218330FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21833105C(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_21832FD4C);
}

uint64_t sub_218331008@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_218330610(*v2, v2[1], v2[2], *(void *)(a1 + 16), *(void *)(a1 + 24), a2);
}

uint64_t sub_218331030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_21833105C(a1, a2, a3, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_218330708);
}

uint64_t sub_21833105C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, void, void, void, void, void))
{
  return a4(a1, *v4, v4[1], v4[2], *(void *)(a2 + 16), *(void *)(a2 + 24));
}

void sub_21833108C()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 24);
  if (!(v2 >> 62))
  {
    if (v1 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_17:
    uint64_t v10 = sub_218354830();
    swift_allocError();
    uint64_t v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v12 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v10 - 8) + 104))(v12, *MEMORY[0x263F8DCC0], v10);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_218354960();
  swift_bridgeObjectRelease();
  if (v1 >= v9) {
    goto LABEL_17;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) == 0)
  {
    if (v1 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v1 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v3 = *(id *)(v2 + 8 * v1 + 32);
      goto LABEL_7;
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v3 = (id)MEMORY[0x21D4677D0](v1, v2);
LABEL_7:
  uint64_t v4 = v3;
  id v5 = objc_msgSend(v3, sel_type);

  if (v5 == (id)11)
  {
LABEL_14:
    *(void *)(v0 + 8) = v1 + 1;
    return;
  }
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v6 = (id)MEMORY[0x21D4677D0](v1, v2);
    goto LABEL_13;
  }
  if (v1 < 0) {
    goto LABEL_21;
  }
  if ((unint64_t)v1 >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_22:
    __break(1u);
    return;
  }
  id v6 = *(id *)(v2 + 8 * v1 + 32);
LABEL_13:
  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, sel_type);

  if (v8 == (id)12) {
    goto LABEL_14;
  }
}

void sub_2183312A4()
{
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 + 8);
  unint64_t v4 = *(void *)(v0 + 24);
  if (!(v4 >> 62))
  {
    if (v3 < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v8 = sub_218354830();
    swift_allocError();
    uint64_t v10 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v10 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCC0], v8);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_218354960();
  swift_bridgeObjectRelease();
  if (v3 >= v7) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v4 & 0xC000000000000001) == 0)
  {
    if (v3 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v3 < *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v5 = *(id *)(v4 + 8 * v3 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  id v5 = (id)MEMORY[0x21D4677D0](v3, v4);
LABEL_7:
  id v6 = v5;
  sub_21832CF18(v5);

  if (!v1) {
    *(void *)(v2 + 8) = v3 + 1;
  }
}

void sub_21833145C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v29 = a1;
  uint64_t v30 = a3;
  uint64_t v28 = a4;
  uint64_t v7 = sub_2183547C0();
  uint64_t v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9, v12);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = *(void *)(v4 + 8);
  unint64_t v17 = *(void *)(v4 + 24);
  if (!(v17 >> 62))
  {
    if (v16 < *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v24 = sub_218354830();
    swift_allocError();
    uint64_t v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v26 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104))(v26, *MEMORY[0x263F8DCC0], v24);
    swift_willThrow();
    return;
  }
  uint64_t v27 = v13;
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_218354960();
  swift_bridgeObjectRelease();
  uint64_t v13 = v27;
  if (v16 >= v23) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v27 = v13;
  if ((v17 & 0xC000000000000001) == 0)
  {
    if (v16 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v16 < *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v18 = *(id *)(v17 + 8 * v16 + 32);
      goto LABEL_7;
    }
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  id v18 = (id)MEMORY[0x21D4677D0](v16, v17);
LABEL_7:
  uint64_t v19 = v18;
  uint64_t v20 = v31;
  sub_21832A710(v18, v29, a2, v30, (uint64_t)v15);

  if (!v20)
  {
    *(void *)(v5 + 8) = v16 + 1;
    uint64_t v21 = v27;
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v11, v15, v7);
    uint64_t v22 = *(void *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v11, 1, a2) != 1)
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v15, v7);
      (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v28, v11, a2);
      return;
    }
    goto LABEL_16;
  }
}

uint64_t sub_218331788@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v45 = a1;
  uint64_t v46 = a3;
  uint64_t v53 = a2;
  uint64_t v47 = a4;
  uint64_t v6 = sub_218354820();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6, v8);
  uint64_t v10 = (unint64_t *)((char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = *v4;
  uint64_t v11 = v4[1];
  unint64_t v13 = v4[3];
  if (!(v13 >> 62))
  {
    if (v11 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v39 = sub_218354830();
    swift_allocError();
    uint64_t v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v41 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v39 - 8) + 104))(v41, *MEMORY[0x263F8DCC0], v39);
    return swift_willThrow();
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_218354960();
  swift_bridgeObjectRelease();
  if (v11 >= v38) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v44 = v7;
  if ((v13 & 0xC000000000000001) != 0)
  {
    id v14 = (id)MEMORY[0x21D4677D0](v11, v13);
LABEL_7:
    uint64_t v15 = v14;
    id v16 = objc_msgSend(v14, sel_dictionary);

    if (!v16)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE810);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218355C80;
      *(void *)&long long v48 = 0x3A6D657449;
      *((void *)&v48 + 1) = 0xE500000000000000;
      uint64_t v52 = v11;
      sub_218354A10();
      sub_218354680();
      swift_bridgeObjectRelease();
      long long v26 = v48;
      *(void *)(inited + 56) = &type metadata for CBORCodingKey;
      *(void *)(inited + 64) = sub_218335E58();
      uint64_t v27 = swift_allocObject();
      *(void *)(inited + 32) = v27;
      *(_OWORD *)(v27 + 16) = v26;
      *(void *)(v27 + 32) = 0;
      *(unsigned char *)(v27 + 40) = 1;
      *(void *)&long long v48 = v12;
      swift_bridgeObjectRetain();
      sub_2183346B8((void *)inited);
      *(void *)&long long v48 = 0;
      *((void *)&v48 + 1) = 0xE000000000000000;
      sub_2183547E0();
      uint64_t v28 = *v5;
      swift_bridgeObjectRetain();
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(qword_26ACFE818);
      uint64_t v30 = MEMORY[0x21D467720](v28, v29);
      uint64_t v32 = v31;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)&long long v48 = v30;
      *((void *)&v48 + 1) = v32;
      sub_218354680();
      uint64_t v52 = v11;
      sub_218354A10();
      sub_218354680();
      swift_bridgeObjectRelease();
      sub_218354680();
      sub_218354F30();
      sub_218354680();
      swift_bridgeObjectRelease();
      sub_218354810();
      uint64_t v33 = sub_218354830();
      swift_allocError();
      uint64_t v35 = v34;
      uint64_t v36 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
      *uint64_t v35 = MEMORY[0x263F8D4F8];
      uint64_t v37 = v44;
      (*(void (**)(char *, unint64_t *, uint64_t))(v44 + 16))(v36, v10, v6);
      (*(void (**)(void *, void, uint64_t))(*(void *)(v33 - 8) + 104))(v35, *MEMORY[0x263F8DCB0], v33);
      swift_willThrow();
      return (*(uint64_t (**)(unint64_t *, uint64_t))(v37 + 8))(v10, v6);
    }
    sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
    sub_218335610();
    uint64_t v17 = sub_218354600();

    uint64_t v6 = v5[2];
    *(void *)&long long v48 = 0x3A6D657449;
    *((void *)&v48 + 1) = 0xE500000000000000;
    uint64_t v52 = v11;
    sub_218354A10();
    sub_218354680();
    swift_bridgeObjectRelease();
    uint64_t v43 = *((void *)&v48 + 1);
    uint64_t v18 = v48;
    uint64_t v10 = (unint64_t *)(v6 + 16);
    swift_beginAccess();
    unint64_t v13 = *(void *)(v6 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v6 + 16) = v13;
    uint64_t v44 = v18;
    uint64_t v45 = v17;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if (v11 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v11 < *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v14 = *(id *)(v13 + 8 * v11 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_18:
  unint64_t v13 = (unint64_t)sub_21833D6C4(0, *(void *)(v13 + 16) + 1, 1, (void *)v13);
  *uint64_t v10 = v13;
LABEL_9:
  unint64_t v21 = *(void *)(v13 + 16);
  unint64_t v20 = *(void *)(v13 + 24);
  if (v21 >= v20 >> 1)
  {
    unint64_t v13 = (unint64_t)sub_21833D6C4((void *)(v20 > 1), v21 + 1, 1, (void *)v13);
    *uint64_t v10 = v13;
  }
  uint64_t v50 = &type metadata for CBORCodingKey;
  unint64_t v51 = sub_218335E58();
  uint64_t v22 = swift_allocObject();
  *(void *)&long long v48 = v22;
  uint64_t v23 = v43;
  *(void *)(v22 + 16) = v44;
  *(void *)(v22 + 24) = v23;
  *(void *)(v22 + 32) = 0;
  *(unsigned char *)(v22 + 40) = 1;
  *(void *)(v13 + 16) = v21 + 1;
  sub_218335EE4(&v48, v13 + 40 * v21 + 32);
  v5[1] = v11 + 1;
  *(void *)&long long v48 = v6;
  *((void *)&v48 + 1) = v45;
  uint64_t v49 = v12;
  type metadata accessor for _CBORDecoderKeyedContainer();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_getWitnessTable();
  sub_2183549D0();
  return sub_218332488((uint64_t)v5);
}

uint64_t sub_218331E24@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_218354820();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (unint64_t *)*v1;
  uint64_t v9 = v1[1];
  unint64_t v11 = v1[3];
  if (!(v11 >> 62))
  {
    if (v9 < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v41 = sub_218354830();
    swift_allocError();
    uint64_t v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v43 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v41 - 8) + 104))(v43, *MEMORY[0x263F8DCC0], v41);
    return swift_willThrow();
  }
  uint64_t v51 = v6;
  swift_bridgeObjectRetain();
  uint64_t v40 = sub_218354960();
  swift_bridgeObjectRelease();
  uint64_t v6 = v51;
  if (v9 >= v40) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v51 = v6;
  if ((v11 & 0xC000000000000001) != 0)
  {
    id v12 = (id)MEMORY[0x21D4677D0](v9, v11);
LABEL_7:
    unint64_t v13 = v12;
    id v14 = objc_msgSend(v12, sel_array);

    if (!v14)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE810);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_218355C80;
      *(void *)&long long v47 = 0x3A6D657449;
      *((void *)&v47 + 1) = 0xE500000000000000;
      uint64_t v50 = v9;
      sub_218354A10();
      sub_218354680();
      swift_bridgeObjectRelease();
      long long v28 = v47;
      *(void *)(inited + 56) = &type metadata for CBORCodingKey;
      *(void *)(inited + 64) = sub_218335E58();
      uint64_t v29 = swift_allocObject();
      *(void *)(inited + 32) = v29;
      *(_OWORD *)(v29 + 16) = v28;
      *(void *)(v29 + 32) = 0;
      *(unsigned char *)(v29 + 40) = 1;
      *(void *)&long long v47 = v10;
      swift_bridgeObjectRetain();
      sub_2183346B8((void *)inited);
      *(void *)&long long v47 = 0;
      *((void *)&v47 + 1) = 0xE000000000000000;
      sub_2183547E0();
      uint64_t v30 = *v2;
      swift_bridgeObjectRetain();
      uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(qword_26ACFE818);
      uint64_t v32 = MEMORY[0x21D467720](v30, v31);
      uint64_t v34 = v33;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)&long long v47 = v32;
      *((void *)&v47 + 1) = v34;
      sub_218354680();
      uint64_t v50 = v9;
      sub_218354A10();
      sub_218354680();
      swift_bridgeObjectRelease();
      sub_218354680();
      sub_218354810();
      uint64_t v35 = sub_218354830();
      swift_allocError();
      uint64_t v37 = v36;
      uint64_t v38 = (char *)v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
      *uint64_t v37 = MEMORY[0x263F8D4F8];
      uint64_t v39 = v51;
      (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v38, v8, v4);
      (*(void (**)(void *, void, uint64_t))(*(void *)(v35 - 8) + 104))(v37, *MEMORY[0x263F8DCB0], v35);
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v8, v4);
    }
    uint64_t v46 = a1;
    sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
    uint64_t v15 = sub_218354730();

    uint64_t v8 = (char *)v2[2];
    *(void *)&long long v47 = 0x3A6D657449;
    *((void *)&v47 + 1) = 0xE500000000000000;
    uint64_t v50 = v9;
    sub_218354A10();
    sub_218354680();
    swift_bridgeObjectRelease();
    uint64_t v16 = *((void *)&v47 + 1);
    a1 = (void *)v47;
    uint64_t v10 = (unint64_t *)(v8 + 16);
    swift_beginAccess();
    unint64_t v11 = *((void *)v8 + 2);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *((void *)v8 + 2) = v11;
    uint64_t v51 = v15;
    uint64_t v45 = v16;
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if (v9 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v9 < *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v12 = *(id *)(v11 + 8 * v9 + 32);
    goto LABEL_7;
  }
  __break(1u);
LABEL_18:
  unint64_t v11 = (unint64_t)sub_21833D6C4(0, *(void *)(v11 + 16) + 1, 1, (void *)v11);
  *uint64_t v10 = v11;
LABEL_9:
  unint64_t v19 = *(void *)(v11 + 16);
  unint64_t v18 = *(void *)(v11 + 24);
  if (v19 >= v18 >> 1)
  {
    unint64_t v11 = (unint64_t)sub_21833D6C4((void *)(v18 > 1), v19 + 1, 1, (void *)v11);
    *uint64_t v10 = v11;
  }
  long long v48 = &type metadata for CBORCodingKey;
  unint64_t v49 = sub_218335E58();
  uint64_t v20 = swift_allocObject();
  *(void *)&long long v47 = v20;
  uint64_t v21 = v45;
  *(void *)(v20 + 16) = a1;
  *(void *)(v20 + 24) = v21;
  *(void *)(v20 + 32) = 0;
  *(unsigned char *)(v20 + 40) = 1;
  *(void *)(v11 + 16) = v19 + 1;
  sub_218335EE4(&v47, v11 + 40 * v19 + 32);
  uint64_t v22 = *((void *)v8 + 2);
  v2[1] = v9 + 1;
  uint64_t v23 = v46;
  v46[3] = &type metadata for _CBORDecoderUnkeyedContainer;
  v23[4] = sub_218335574();
  uint64_t v24 = (void *)swift_allocObject();
  *uint64_t v23 = v24;
  v24[2] = v22;
  v24[3] = 0;
  uint64_t v25 = v51;
  v24[4] = v8;
  v24[5] = v25;
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_218332488((uint64_t)v2);
}

uint64_t sub_218332488(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 16);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_21834885C(v2);
    uint64_t v2 = (void *)result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  swift_retain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = v2[2];
  if (v4)
  {
LABEL_4:
    uint64_t v5 = v4 - 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(void *)(v1 + 16) = v2;
    swift_endAccess();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_21833253C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = v1[1];
  unint64_t v5 = v1[3];
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_218354960();
    swift_bridgeObjectRelease();
    if (v4 < v19)
    {
LABEL_3:
      uint64_t v23 = a1;
      uint64_t v6 = v1[2];
      *(void *)&long long v24 = 0x3A6D657449;
      *((void *)&v24 + 1) = 0xE500000000000000;
      uint64_t v27 = v4;
      sub_218354A10();
      sub_218354680();
      swift_bridgeObjectRelease();
      id v7 = (id)0xE500000000000000;
      uint64_t v28 = 0x3A6D657449;
      uint64_t v8 = (void *)(v6 + 16);
      swift_beginAccess();
      uint64_t v9 = *(void **)(v6 + 16);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v6 + 16) = v9;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v9 = sub_21833D6C4(0, v9[2] + 1, 1, v9);
        *uint64_t v8 = v9;
      }
      unint64_t v12 = v9[2];
      unint64_t v11 = v9[3];
      uint64_t v13 = v12 + 1;
      if (v12 >= v11 >> 1)
      {
        uint64_t v9 = sub_21833D6C4((void *)(v11 > 1), v12 + 1, 1, v9);
        *uint64_t v8 = v9;
      }
      uint64_t v25 = &type metadata for CBORCodingKey;
      unint64_t v26 = sub_218335E58();
      uint64_t v14 = swift_allocObject();
      *(void *)&long long v24 = v14;
      *(void *)(v14 + 16) = v28;
      *(void *)(v14 + 24) = 0xE500000000000000;
      *(void *)(v14 + 32) = 0;
      *(unsigned char *)(v14 + 40) = 1;
      _OWORD v9[2] = v13;
      sub_218335EE4(&v24, (uint64_t)&v9[5 * v12 + 4]);
      if ((v5 & 0xC000000000000001) == 0)
      {
        if (v4 < 0)
        {
          __break(1u);
        }
        else if ((unint64_t)v4 < *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v15 = *(id *)(v5 + 8 * v4 + 32);
          goto LABEL_11;
        }
        __break(1u);
        goto LABEL_18;
      }
      id v15 = (id)MEMORY[0x21D4677D0](v4, v5);
LABEL_11:
      uint64_t v16 = v15;
      *(void *)(v2 + 8) = v4 + 1;
      uint64_t v4 = *(void *)(v6 + 16);
      unint64_t v5 = *(void *)(v6 + 32);
      uint64_t v13 = type metadata accessor for _CBORDecoder();
      uint64_t v8 = (void *)swift_allocObject();
      v8[3] = MEMORY[0x263F8EE78];
      swift_beginAccess();
      id v7 = v16;
      swift_bridgeObjectRetain();
      uint64_t v17 = swift_bridgeObjectRetain();
      MEMORY[0x21D4676F0](v17);
      if (*(void *)((v8[3] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v8[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      {
LABEL_12:
        sub_218354770();
        sub_218354750();
        swift_endAccess();
        v8[2] = v4;
        v8[4] = v5;
        v23[3] = v13;
        v23[4] = sub_2183356CC(&qword_267BC6FE0);

        *uint64_t v23 = v8;
        return sub_218332488(v2);
      }
LABEL_18:
      sub_218354760();
      goto LABEL_12;
    }
  }
  else if (v4 < *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v20 = sub_218354830();
  swift_allocError();
  uint64_t v22 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
  *uint64_t v22 = MEMORY[0x263F8D4F8];
  swift_bridgeObjectRetain();
  sub_218354810();
  (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCC0], v20);
  return swift_willThrow();
}

uint64_t sub_21833290C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_218332914()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (!(v1 >> 62)) {
    return *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_218354960();
  swift_bridgeObjectRelease();
  return v2;
}

BOOL sub_218332978()
{
  uint64_t v1 = *(void *)(v0 + 8);
  unint64_t v2 = *(void *)(v0 + 24);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_218354960();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  return v1 >= v3;
}

uint64_t sub_2183329E8()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_2183329F0()
{
  sub_21833108C();
  return v0 & 1;
}

uint64_t sub_218332A0C()
{
  sub_218335EFC();
  return v0 & 1;
}

void sub_218332A28()
{
}

void sub_218332A40()
{
}

void sub_218332A58()
{
}

uint64_t sub_218332A70()
{
  return sub_218336428(MEMORY[0x263F8D6C8], 7630409, 0xE300000000000000, (SEL *)&selRef_integerValue);
}

uint64_t sub_218332AA4()
{
  return sub_218336618((uint64_t)sub_218334CD4);
}

uint64_t sub_218332AD0()
{
  return sub_2183367DC((uint64_t)sub_218334E88);
}

uint64_t sub_218332AFC()
{
  return sub_218336428(MEMORY[0x263F8E548], 0x3233746E49, 0xE500000000000000, (SEL *)&selRef_intValue);
}

uint64_t sub_218332B34()
{
  return sub_218336428(MEMORY[0x263F8E5C0], 0x3436746E49, 0xE500000000000000, (SEL *)&selRef_longLongValue);
}

uint64_t sub_218332B6C()
{
  return sub_218354AA0();
}

uint64_t sub_218332B84()
{
  return sub_218336428(MEMORY[0x263F8D9D0], 1953384789, 0xE400000000000000, (SEL *)&selRef_unsignedIntegerValue);
}

uint64_t sub_218332BB8()
{
  return sub_218336618((uint64_t)sub_218335040);
}

uint64_t sub_218332BE4()
{
  return sub_2183367DC((uint64_t)sub_2183351F8);
}

uint64_t sub_218332C10()
{
  return sub_218336428(MEMORY[0x263F8E8F8], 0x3233746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedIntValue);
}

uint64_t sub_218332C48()
{
  return sub_218336428(MEMORY[0x263F8E970], 0x3436746E4955, 0xE600000000000000, (SEL *)&selRef_unsignedLongLongValue);
}

uint64_t sub_218332C80()
{
  return sub_218354AB0();
}

void sub_218332C98(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
}

uint64_t sub_218332CB0()
{
  return sub_218354A30();
}

uint64_t sub_218332CC8()
{
  return sub_218354A20();
}

uint64_t sub_218332CE0()
{
  uint64_t result = sub_218354A40();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218332D04(uint64_t a1, uint64_t a2)
{
  return sub_218332F30(a1, a2, MEMORY[0x263F8E110]);
}

uint64_t sub_218332D30()
{
  uint64_t result = sub_218354A50();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218332D54(uint64_t a1, uint64_t a2)
{
  return sub_218332E78(a1, a2, MEMORY[0x263F8E118]);
}

uint64_t sub_218332D80(uint64_t a1, uint64_t a2)
{
  return sub_218332ED4(a1, a2, MEMORY[0x263F8E120]);
}

uint64_t sub_218332DAC(uint64_t a1, uint64_t a2)
{
  return sub_218332F30(a1, a2, MEMORY[0x263F8E128]);
}

uint64_t sub_218332DD8()
{
  uint64_t result = sub_218354A80();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218332DFC(uint64_t a1, uint64_t a2)
{
  return sub_218332FB8(a1, a2, MEMORY[0x263F8E138]);
}

uint64_t sub_218332E28()
{
  uint64_t result = sub_218354A60();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218332E4C(uint64_t a1, uint64_t a2)
{
  return sub_218332E78(a1, a2, MEMORY[0x263F8E130]);
}

uint64_t sub_218332E78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_218332EA8(uint64_t a1, uint64_t a2)
{
  return sub_218332ED4(a1, a2, MEMORY[0x263F8E140]);
}

uint64_t sub_218332ED4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_218332F04(uint64_t a1, uint64_t a2)
{
  return sub_218332F30(a1, a2, MEMORY[0x263F8E148]);
}

uint64_t sub_218332F30(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_218332F68()
{
  uint64_t result = sub_218354A90();
  if (v0) {
    return v2;
  }
  return result;
}

uint64_t sub_218332F8C(uint64_t a1, uint64_t a2)
{
  return sub_218332FB8(a1, a2, MEMORY[0x263F8E150]);
}

uint64_t sub_218332FB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = a3();
  if (v3) {
    return v5;
  }
  return result;
}

uint64_t sub_218332FE4()
{
  return sub_218354A70();
}

uint64_t sub_218333010@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_218331788(a1, a2, a3, a4);
}

uint64_t sub_218333028@<X0>(void *a1@<X8>)
{
  return sub_218331E24(a1);
}

uint64_t sub_218333040@<X0>(void *a1@<X8>)
{
  return sub_21833253C(a1);
}

uint64_t sub_218333058@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_2183545E0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FD0);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_isDate))
  {
    id v11 = objc_msgSend(a1, sel_date);
    if (v11)
    {
      unint64_t v12 = v11;
      v26[0] = a2;
      v26[7] = v2;
      sub_2183545D0();

      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v13(v10, v8, v5);
      uint64_t v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
      v14(v10, 0, 1, v5);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v10, 1, v5) != 1)
      {
        uint64_t v15 = v26[0];
        v13((char *)v26[0], v10, v5);
        return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v14)(v15, 0, 1, v5);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v10, 1, 1, v5);
    }
    sub_218335828((uint64_t)v10, &qword_267BC6FD0);
    uint64_t v17 = sub_218354830();
    swift_allocError();
    uint64_t v19 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v19 = v5;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v20 = objc_msgSend(a1, sel_description);
  }
  else
  {
    uint64_t v17 = sub_218354830();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v19 = v5;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v20 = objc_msgSend(a1, sel_description);
  }
  id v22 = v20;
  uint64_t v23 = sub_218354650();
  uint64_t v25 = v24;

  v26[1] = v23;
  v26[2] = v25;
  sub_218354680();
  sub_218354680();
  sub_218354810();
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCB0], v17);
  return swift_willThrow();
}

uint64_t sub_21833341C(void *a1)
{
  if (objc_msgSend(a1, sel_type) == (id)2)
  {
    id v2 = objc_msgSend(a1, sel_data);
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = sub_2183545B0();

      return v4;
    }
    uint64_t v6 = sub_218354830();
    swift_allocError();
    uint64_t v8 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v8 = MEMORY[0x263F06F78];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2183547E0();
    swift_bridgeObjectRelease();
    sub_218354810();
    uint64_t v10 = (unsigned int *)MEMORY[0x263F8DCC0];
  }
  else
  {
    uint64_t v6 = sub_218354830();
    swift_allocError();
    uint64_t v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v8 = MEMORY[0x263F06F78];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v9 = objc_msgSend(a1, sel_description);
    sub_218354650();

    sub_218354680();
    sub_218354680();
    sub_218354810();
    uint64_t v10 = (unsigned int *)MEMORY[0x263F8DCB0];
  }
  (*(void (**)(void *, void, uint64_t))(*(void *)(v6 - 8) + 104))(v8, *v10, v6);
  return swift_willThrow();
}

void sub_21833368C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FD0);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x263F06F78];
  if (a2 == MEMORY[0x263F06F78] || sub_218335690(0, &qword_26ACFE800) == a2)
  {
    uint64_t v16 = sub_21833341C(a1);
    if (v5) {
      return;
    }
    if (v17 >> 60 != 15)
    {
      *(void *)(a4 + 24) = v13;
      *(void *)a4 = v16;
      *(void *)(a4 + 8) = v17;
      return;
    }
    goto LABEL_13;
  }
  uint64_t v14 = sub_2183545E0();
  if (v14 == a2 || sub_218335690(0, &qword_267BC6FD8) == a2)
  {
    sub_218333058(a1, (uint64_t)v12);
    if (v5) {
      return;
    }
    uint64_t v18 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v12, 1, v14) != 1)
    {
      *(void *)(a4 + 24) = v14;
      boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)a4);
      (*(void (**)(uint64_t *, char *, uint64_t))(v18 + 32))(boxed_opaque_existential_1Tm, v12, v14);
      return;
    }
    sub_218335828((uint64_t)v12, &qword_267BC6FD0);
LABEL_13:
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    return;
  }
  if (swift_dynamicCastMetatype())
  {
    *(void *)(a4 + 24) = &type metadata for CBORCodableWrapper;
    *(void *)a4 = a1;
    id v15 = a1;
    return;
  }
  uint64_t v19 = swift_conformsToProtocol2();
  if (v19) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  if (v19) {
    uint64_t v21 = a2;
  }
  else {
    uint64_t v21 = 0;
  }
  if (v21)
  {
    sub_218333BD0(a1, v21, v20, (_OWORD *)a4);
    return;
  }
  uint64_t v23 = (void *)(v6 + 24);
  swift_beginAccess();
  id v24 = a1;
  MEMORY[0x21D4676F0]();
  if (*(void *)((*(void *)(v6 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v6 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
  {
    v35[1] = *(void *)((*(void *)(v6 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_218354760();
  }
  sub_218354770();
  sub_218354750();
  swift_endAccess();
  v35[5] = type metadata accessor for _CBORDecoder();
  v35[6] = sub_2183356CC(&qword_267BC6FE0);
  v35[2] = v6;
  uint64_t v37 = a2;
  uint64_t v38 = a3;
  __swift_allocate_boxed_opaque_existential_1Tm(v36);
  swift_retain();
  sub_218354780();
  if (!v5) {
    goto LABEL_33;
  }
  __swift_deallocate_boxed_opaque_existential_1((uint64_t)v36);
  swift_beginAccess();
  if (*v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_218354960();
    swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_28;
    }
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (!*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_42;
  }
LABEL_28:
  sub_2183487EC();
  if (v25) {
    goto LABEL_39;
  }
  if (*v23 >> 62) {
    goto LABEL_45;
  }
  a4 = *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v26 = a4 - 1;
  if (!__OFSUB__(a4, 1))
  {
LABEL_38:
    sub_2183486BC(v26);
    goto LABEL_39;
  }
  while (1)
  {
    __break(1u);
LABEL_33:
    uint64_t v27 = v37;
    uint64_t v28 = __swift_project_boxed_opaque_existential_1(v36, v37);
    *(void *)(a4 + 24) = v27;
    uint64_t v29 = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)a4);
    (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v29, v28, v27);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
    swift_beginAccess();
    if (*v23 >> 62) {
      break;
    }
    if (*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_35;
    }
LABEL_44:
    __break(1u);
LABEL_45:
    swift_bridgeObjectRetain();
    a4 = sub_218354960();
    swift_bridgeObjectRelease();
    unint64_t v26 = a4 - 1;
    if (!__OFSUB__(a4, 1)) {
      goto LABEL_38;
    }
  }
LABEL_43:
  swift_bridgeObjectRetain();
  uint64_t v33 = sub_218354960();
  swift_bridgeObjectRelease();
  if (!v33) {
    goto LABEL_44;
  }
LABEL_35:
  sub_2183487EC();
  if (v25)
  {
LABEL_39:
    uint64_t v31 = v25;
    swift_endAccess();

    return;
  }
  if (*v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_218354960();
    swift_bridgeObjectRelease();
    unint64_t v26 = v34 - 1;
    if (__OFSUB__(v34, 1)) {
      goto LABEL_50;
    }
    goto LABEL_38;
  }
  uint64_t v30 = *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v26 = v30 - 1;
  if (!__OFSUB__(v30, 1)) {
    goto LABEL_38;
  }
LABEL_50:
  __break(1u);
}

uint64_t sub_218333BD0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v9 = sub_218354820();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388]();
  unint64_t v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(a1, sel_dictionary);
  if (!v13)
  {
    uint64_t v23 = sub_218354830();
    uint64_t v24 = a2;
    swift_allocError();
    unint64_t v26 = v25;
    v107 = (char *)v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
    void *v26 = v24;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v27 = objc_msgSend(a1, sel_description);
    uint64_t v28 = sub_218354650();
    uint64_t v30 = v29;

    *(void *)&v108[0] = v28;
    *((void *)&v108[0] + 1) = v30;
    sub_218354680();
    sub_218354F30();
    sub_218354680();
    swift_bridgeObjectRelease();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 104))(v26, *MEMORY[0x263F8DCB0], v23);
    return swift_willThrow();
  }
  uint64_t v14 = v13;
  uint64_t v104 = v4;
  v94 = a4;
  v90 = v12;
  uint64_t v15 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  sub_218335610();
  uint64_t v97 = v15;
  unint64_t v16 = sub_218354600();

  unint64_t v17 = (void *)sub_218329830(MEMORY[0x263F8EE78]);
  uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  uint64_t v102 = v19;
  uint64_t v103 = v18;
  uint64_t v93 = a2;
  uint64_t v92 = v9;
  uint64_t v91 = v10;
  if ((v16 & 0xC000000000000001) != 0)
  {
    uint64_t v20 = sub_218354910();
    unint64_t v100 = 0;
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    unint64_t v16 = v20 | 0x8000000000000000;
  }
  else
  {
    uint64_t v32 = -1 << *(unsigned char *)(v16 + 32);
    uint64_t v33 = *(void *)(v16 + 64);
    unint64_t v100 = v16 + 64;
    uint64_t v34 = ~v32;
    uint64_t v35 = -v32;
    if (v35 < 64) {
      uint64_t v36 = ~(-1 << v35);
    }
    else {
      uint64_t v36 = -1;
    }
    unint64_t v22 = v36 & v33;
    uint64_t v21 = v34;
  }
  int64_t v37 = 0;
  uint64_t v98 = v16 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v95 = v21;
  int64_t v99 = (unint64_t)(v21 + 64) >> 6;
  uint64_t v96 = MEMORY[0x263F8EE50] + 8;
  unint64_t v101 = v16;
  while ((v16 & 0x8000000000000000) != 0)
  {
    uint64_t v42 = sub_218354940();
    if (!v42) {
      goto LABEL_62;
    }
    uint64_t v44 = v43;
    *(void *)&v108[0] = v42;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v45 = (id)v109;
    swift_unknownObjectRelease();
    *(void *)&v108[0] = v44;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v107 = (char *)v109;
    swift_unknownObjectRelease();
    int64_t v41 = v37;
    uint64_t v39 = v22;
    if (!v45) {
      goto LABEL_62;
    }
LABEL_31:
    unsigned __int8 v50 = objc_msgSend(v45, sel_isWholeNumber);
    int64_t v105 = v41;
    if (v50)
    {
      id v51 = objc_msgSend(v45, sel_numeric);
      id v52 = objc_msgSend(v51, sel_integerValue);

      *(void *)&long long v109 = v52;
      uint64_t v53 = sub_218354A10();
    }
    else
    {
      id v55 = objc_msgSend(v45, sel_string);
      if (!v55)
      {
        swift_bridgeObjectRelease();
        swift_beginAccess();
        *(void *)&v108[0] = 0;
        *((void *)&v108[0] + 1) = 0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_2183547E0();
        id v81 = objc_msgSend(v45, sel_description);
        sub_218354650();

        sub_218354680();
        swift_bridgeObjectRelease();
        sub_218354680();
        v111 = objc_msgSend(v45, sel_type);
        type metadata accessor for CBORType(0);
        sub_2183548D0();
        sub_218354680();
        unint64_t v82 = v90;
        sub_218354810();
        uint64_t v83 = sub_218354830();
        uint64_t v106 = swift_allocError();
        v85 = v84;
        v86 = (char *)v84 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
        void *v85 = v93;
        uint64_t v87 = v91;
        uint64_t v88 = v92;
        (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v86, v82, v92);
        (*(void (**)(void *, void, uint64_t))(*(void *)(v83 - 8) + 104))(v85, *MEMORY[0x263F8DCB0], v83);
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v87 + 8))(v82, v88);
        return sub_21833580C();
      }
      uint64_t v56 = v55;
      uint64_t v57 = sub_218354650();
      unint64_t v59 = v58;

      uint64_t v53 = sub_21833E988(v57, v59);
      if (!v54) {
        goto LABEL_68;
      }
    }
    uint64_t v60 = v53;
    uint64_t v61 = v54;
    uint64_t v62 = v106;
    sub_21833368C(&v109, v107, v103, v102);
    uint64_t v106 = v62;
    if (v62)
    {
      swift_bridgeObjectRelease();

      sub_21833580C();
      return swift_bridgeObjectRelease();
    }
    if (v110)
    {
      sub_218335884(&v109, v108);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v111 = v17;
      unint64_t v65 = sub_21834A4E8(v60, v61);
      uint64_t v66 = v17[2];
      BOOL v67 = (v64 & 1) == 0;
      uint64_t v68 = v66 + v67;
      if (__OFADD__(v66, v67))
      {
        __break(1u);
LABEL_66:
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        uint64_t result = sub_218354DF0();
        __break(1u);
        return result;
      }
      char v69 = v64;
      if (v17[3] >= v68)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          unint64_t v17 = v111;
          if ((v64 & 1) == 0) {
            goto LABEL_48;
          }
        }
        else
        {
          sub_21833D188();
          unint64_t v17 = v111;
          if ((v69 & 1) == 0) {
            goto LABEL_48;
          }
        }
      }
      else
      {
        sub_21833BA1C(v68, isUniquelyReferenced_nonNull_native);
        unint64_t v70 = sub_21834A4E8(v60, v61);
        if ((v69 & 1) != (v71 & 1)) {
          goto LABEL_69;
        }
        unint64_t v65 = v70;
        unint64_t v17 = v111;
        if ((v69 & 1) == 0)
        {
LABEL_48:
          v17[(v65 >> 6) + 8] |= 1 << v65;
          uint64_t v76 = (uint64_t *)(v17[6] + 16 * v65);
          *uint64_t v76 = v60;
          v76[1] = v61;
          sub_218335884(v108, (_OWORD *)(v17[7] + 32 * v65));
          uint64_t v77 = v17[2];
          BOOL v78 = __OFADD__(v77, 1);
          uint64_t v79 = v77 + 1;
          if (v78) {
            goto LABEL_66;
          }
          v17[2] = v79;
          swift_bridgeObjectRetain();
          goto LABEL_11;
        }
      }
      uint64_t v38 = (_OWORD *)(v17[7] + 32 * v65);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
      sub_218335884(v108, v38);
LABEL_11:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_218335828((uint64_t)&v109, &qword_267BC6FC8);
    swift_bridgeObjectRetain();
    unint64_t v72 = sub_21834A4E8(v60, v61);
    char v74 = v73;
    swift_bridgeObjectRelease();
    if (v74)
    {
      char v75 = swift_isUniquelyReferenced_nonNull_native();
      v111 = v17;
      if ((v75 & 1) == 0)
      {
        sub_21833D188();
        unint64_t v17 = v111;
      }
      swift_bridgeObjectRelease();
      sub_218335884((_OWORD *)(v17[7] + 32 * v72), v108);
      sub_21833C580(v72, (uint64_t)v17);
      swift_bridgeObjectRelease();
    }
    else
    {
      memset(v108, 0, sizeof(v108));
    }
    swift_bridgeObjectRelease();
    sub_218335828((uint64_t)v108, &qword_267BC6FC8);

LABEL_12:
    int64_t v37 = v105;
    unint64_t v22 = v39;
    unint64_t v16 = v101;
  }
  if (v22)
  {
    uint64_t v39 = (v22 - 1) & v22;
    unint64_t v40 = __clz(__rbit64(v22)) | (v37 << 6);
    int64_t v41 = v37;
    goto LABEL_30;
  }
  int64_t v41 = v37 + 1;
  if (__OFADD__(v37, 1)) {
    goto LABEL_67;
  }
  if (v41 >= v99) {
    goto LABEL_62;
  }
  unint64_t v46 = *(void *)(v100 + 8 * v41);
  if (v46)
  {
LABEL_29:
    uint64_t v39 = (v46 - 1) & v46;
    unint64_t v40 = __clz(__rbit64(v46)) + (v41 << 6);
LABEL_30:
    uint64_t v48 = 8 * v40;
    unint64_t v49 = *(void **)(*(void *)(v16 + 56) + v48);
    id v45 = *(id *)(*(void *)(v16 + 48) + v48);
    v107 = v49;
    if (!v45) {
      goto LABEL_62;
    }
    goto LABEL_31;
  }
  int64_t v47 = v37 + 2;
  if (v37 + 2 >= v99) {
    goto LABEL_62;
  }
  unint64_t v46 = *(void *)(v100 + 8 * v47);
  if (v46) {
    goto LABEL_28;
  }
  int64_t v47 = v37 + 3;
  if (v37 + 3 >= v99) {
    goto LABEL_62;
  }
  unint64_t v46 = *(void *)(v100 + 8 * v47);
  if (v46) {
    goto LABEL_28;
  }
  int64_t v47 = v37 + 4;
  if (v37 + 4 >= v99) {
    goto LABEL_62;
  }
  unint64_t v46 = *(void *)(v100 + 8 * v47);
  if (v46)
  {
LABEL_28:
    int64_t v41 = v47;
    goto LABEL_29;
  }
  int64_t v41 = v37 + 5;
  if (v37 + 5 >= v99) {
    goto LABEL_62;
  }
  unint64_t v46 = *(void *)(v100 + 8 * v41);
  if (v46) {
    goto LABEL_29;
  }
  int64_t v80 = v37 + 6;
  while (v99 != v80)
  {
    unint64_t v46 = *(void *)(v100 + 8 * v80++);
    if (v46)
    {
      int64_t v41 = v80 - 1;
      goto LABEL_29;
    }
  }
LABEL_62:
  sub_21833580C();
  *(void *)&long long v109 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FE8);
  v89 = v94;
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
    _OWORD *v89 = 0u;
    v89[1] = 0u;
  }
  return result;
}

void *sub_218334688@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_218334698(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_2183346AC(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_2183346B8(void *result)
{
  uint64_t v2 = result[2];
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = result;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (v6[2]) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v10 = v4 + v2;
  }
  else {
    int64_t v10 = v4;
  }
  uint64_t result = sub_21833D6C4(result, v10, 1, v3);
  uint64_t v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_26ACFE818);
  uint64_t result = (void *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = (void *)swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v7 = v3[2];
  BOOL v8 = __OFADD__(v7, v2);
  uint64_t v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_2183347B8(void *a1)
{
  if (objc_msgSend(a1, sel_isBoolean))
  {
    unsigned __int8 v2 = objc_msgSend(a1, sel_BOOLValue);
  }
  else
  {
    uint64_t v3 = sub_218354830();
    swift_allocError();
    int64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *int64_t v5 = MEMORY[0x263F8D4F8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(a1, sel_description);
    sub_218354650();

    sub_218354680();
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCB0], v3);
    unsigned __int8 v2 = swift_willThrow();
  }
  return v2 & 1;
}

void sub_21833494C(void *a1)
{
  if (objc_msgSend(a1, sel_isFloatNumber))
  {
    id v2 = objc_msgSend(a1, sel_numeric);
    objc_msgSend(v2, sel_doubleValue);
  }
  else
  {
    uint64_t v3 = sub_218354830();
    swift_allocError();
    int64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *int64_t v5 = MEMORY[0x263F8D538];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(a1, sel_description);
    sub_218354650();

    sub_218354680();
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCB0], v3);
    swift_willThrow();
  }
}

void sub_218334B10(void *a1)
{
  if (objc_msgSend(a1, sel_isFloatNumber))
  {
    id v2 = objc_msgSend(a1, sel_numeric);
    objc_msgSend(v2, sel_floatValue);
  }
  else
  {
    uint64_t v3 = sub_218354830();
    swift_allocError();
    int64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *int64_t v5 = MEMORY[0x263F8D5C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v6 = objc_msgSend(a1, sel_description);
    sub_218354650();

    sub_218354680();
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104))(v5, *MEMORY[0x263F8DCB0], v3);
    swift_willThrow();
  }
}

void *sub_218334CD4(void *a1)
{
  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    id v2 = objc_msgSend(a1, sel_numeric);
    uint64_t v3 = objc_msgSend(v2, sel_charValue);
  }
  else
  {
    uint64_t v4 = sub_218354830();
    swift_allocError();
    id v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v6 = MEMORY[0x263F8E498];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(a1, sel_description);
    uint64_t v8 = sub_218354650();
    uint64_t v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_218354680();
    uint64_t v3 = v12;
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v4 - 8) + 104))(v6, *MEMORY[0x263F8DCB0], v4);
    swift_willThrow();
  }
  return v3;
}

void *sub_218334E88(void *a1)
{
  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    id v2 = objc_msgSend(a1, sel_numeric);
    uint64_t v3 = objc_msgSend(v2, sel_shortValue);
  }
  else
  {
    uint64_t v4 = sub_218354830();
    swift_allocError();
    id v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v6 = MEMORY[0x263F8E4F0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(a1, sel_description);
    uint64_t v8 = sub_218354650();
    uint64_t v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_218354680();
    uint64_t v3 = v12;
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v4 - 8) + 104))(v6, *MEMORY[0x263F8DCB0], v4);
    swift_willThrow();
  }
  return v3;
}

void *sub_218335040(void *a1)
{
  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    id v2 = objc_msgSend(a1, sel_numeric);
    uint64_t v3 = objc_msgSend(v2, sel_unsignedCharValue);
  }
  else
  {
    uint64_t v4 = sub_218354830();
    swift_allocError();
    id v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v6 = MEMORY[0x263F8E778];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(a1, sel_description);
    uint64_t v8 = sub_218354650();
    uint64_t v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_218354680();
    uint64_t v3 = v12;
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v4 - 8) + 104))(v6, *MEMORY[0x263F8DCB0], v4);
    swift_willThrow();
  }
  return v3;
}

void *sub_2183351F8(void *a1)
{
  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    id v2 = objc_msgSend(a1, sel_numeric);
    uint64_t v3 = objc_msgSend(v2, sel_unsignedShortValue);
  }
  else
  {
    uint64_t v4 = sub_218354830();
    swift_allocError();
    id v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v6 = MEMORY[0x263F8E888];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(a1, sel_description);
    uint64_t v8 = sub_218354650();
    uint64_t v10 = v9;

    v12[0] = v8;
    v12[1] = v10;
    sub_218354680();
    uint64_t v3 = v12;
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v4 - 8) + 104))(v6, *MEMORY[0x263F8DCB0], v4);
    swift_willThrow();
  }
  return v3;
}

uint64_t sub_2183353B0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  if (objc_msgSend(a1, sel_isWholeNumber))
  {
    id v8 = objc_msgSend(a1, sel_numeric);
    id v9 = [v8 *a5];

    return (uint64_t)v9;
  }
  else
  {
    uint64_t v11 = sub_218354830();
    swift_allocError();
    id v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v13 = a2;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    id v14 = objc_msgSend(a1, sel_description);
    sub_218354650();

    sub_218354680();
    sub_218354680();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
    return swift_willThrow();
  }
}

unint64_t sub_218335574()
{
  unint64_t result = qword_267BC6FB8;
  if (!qword_267BC6FB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC6FB8);
  }
  return result;
}

uint64_t sub_2183355C8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

unint64_t sub_218335610()
{
  unint64_t result = qword_26ACFE7F8;
  if (!qword_26ACFE7F8)
  {
    sub_218335690(255, (unint64_t *)&qword_26ACFE7F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26ACFE7F8);
  }
  return result;
}

uint64_t type metadata accessor for _CBORDecoderKeyedContainer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_218335690(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2183356CC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for _CBORDecoder();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(void *)(*(void *)(result + 24) - 8) + 80) & 0x20000) != 0) {
    JUMPOUT(0x21D4685D0);
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

uint64_t *__swift_allocate_boxed_opaque_existential_1Tm(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_21833580C()
{
  return swift_release();
}

void type metadata accessor for CBORType(uint64_t a1)
{
}

uint64_t sub_218335828(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_218335884(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
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

uint64_t sub_218335948(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void type metadata accessor for COSEKeyOperationType(uint64_t a1)
{
}

void sub_2183359C0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_218335A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_218335A14()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_218335A58(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_218335AA8(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_218335B34(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s11CBORLibrary28_CBOREncoderUnkeyedContainerVwet_0(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_218335BCC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for _CBORDecoderUnkeyedContainer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for _CBORDecoderUnkeyedContainer()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for _CBORDecoderUnkeyedContainer(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for _CBORDecoderUnkeyedContainer(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for _CBORDecoderUnkeyedContainer(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _CBORDecoderUnkeyedContainer(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _CBORDecoderUnkeyedContainer(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for _CBORDecoderUnkeyedContainer()
{
  return &type metadata for _CBORDecoderUnkeyedContainer;
}

uint64_t sub_218335E50(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

unint64_t sub_218335E58()
{
  unint64_t result = qword_267BC70A0;
  if (!qword_267BC70A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC70A0);
  }
  return result;
}

uint64_t sub_218335EAC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 41, 7);
}

uint64_t sub_218335EE4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_218335EFC()
{
  uint64_t v2 = *(void *)(v0 + 8);
  unint64_t v3 = *(void *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v7 = sub_218354830();
    swift_allocError();
    id v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v9 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCC0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_218354960();
  swift_bridgeObjectRelease();
  if (v2 >= v6) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  id v4 = (id)MEMORY[0x21D4677D0](v2, v3);
LABEL_7:
  uint64_t v5 = v4;
  sub_2183347B8(v4);

  if (!v1) {
    *(void *)(v0 + 8) = v2 + 1;
  }
}

void sub_2183360B0()
{
  uint64_t v2 = *(void *)(v0 + 8);
  unint64_t v3 = *(void *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v7 = sub_218354830();
    swift_allocError();
    id v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v9 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCC0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_218354960();
  swift_bridgeObjectRelease();
  if (v2 >= v6) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  id v4 = (id)MEMORY[0x21D4677D0](v2, v3);
LABEL_7:
  uint64_t v5 = v4;
  sub_21833494C(v4);

  if (!v1) {
    *(void *)(v0 + 8) = v2 + 1;
  }
}

void sub_21833626C()
{
  uint64_t v2 = *(void *)(v0 + 8);
  unint64_t v3 = *(void *)(v0 + 24);
  if (!(v3 >> 62))
  {
    if (v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v7 = sub_218354830();
    swift_allocError();
    id v9 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    void *v9 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v7 - 8) + 104))(v9, *MEMORY[0x263F8DCC0], v7);
    swift_willThrow();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_218354960();
  swift_bridgeObjectRelease();
  if (v2 >= v6) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) == 0)
  {
    if (v2 < 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v2 < *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v4 = *(id *)(v3 + 8 * v2 + 32);
      goto LABEL_7;
    }
    __break(1u);
    return;
  }
  id v4 = (id)MEMORY[0x21D4677D0](v2, v3);
LABEL_7:
  uint64_t v5 = v4;
  sub_218334B10(v4);

  if (!v1) {
    *(void *)(v0 + 8) = v2 + 1;
  }
}

uint64_t sub_218336428(uint64_t result, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v8 = result;
  id v9 = v4;
  uint64_t v10 = *v4;
  uint64_t v11 = v9[1];
  unint64_t v12 = v9[3];
  if (!(v12 >> 62))
  {
    if (v11 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v17 = sub_218354830();
    swift_allocError();
    uint64_t v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *uint64_t v19 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v19, *MEMORY[0x263F8DCC0], v17);
    swift_willThrow();
    return v10;
  }
  uint64_t v20 = a4;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_218354960();
  unint64_t result = swift_bridgeObjectRelease();
  a4 = v20;
  if (v11 >= v16) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v12 & 0xC000000000000001) != 0)
  {
    id v13 = a4;
    id v14 = (id)MEMORY[0x21D4677D0](v11, v12);
LABEL_7:
    uint64_t v15 = v14;
    uint64_t v10 = sub_2183353B0(v14, v8, a2, a3, v13);

    if (!v5) {
      v9[1] = v11 + 1;
    }
    return v10;
  }
  if (v11 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v11 < *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v13 = a4;
    id v14 = *(id *)(v12 + 8 * v11 + 32);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_218336618(uint64_t result)
{
  unint64_t v3 = (uint64_t (*)(void))result;
  id v4 = v1;
  uint64_t v5 = *v1;
  uint64_t v6 = v4[1];
  unint64_t v7 = v4[3];
  if (!(v7 >> 62))
  {
    if (v6 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v11 = sub_218354830();
    swift_allocError();
    id v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v13 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCC0], v11);
    swift_willThrow();
    return v5;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_218354960();
  unint64_t result = swift_bridgeObjectRelease();
  if (v6 >= v10) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x21D4677D0](v6, v7);
LABEL_7:
    id v9 = v8;
    uint64_t v5 = v3();

    if (!v2) {
      v4[1] = v6 + 1;
    }
    return v5;
  }
  if (v6 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v6 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v8 = *(id *)(v7 + 8 * v6 + 32);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_2183367DC(uint64_t result)
{
  unint64_t v3 = (uint64_t (*)(void))result;
  id v4 = v1;
  uint64_t v5 = *v1;
  uint64_t v6 = v4[1];
  unint64_t v7 = v4[3];
  if (!(v7 >> 62))
  {
    if (v6 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v11 = sub_218354830();
    swift_allocError();
    id v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
    *id v13 = MEMORY[0x263F8D4F8];
    swift_bridgeObjectRetain();
    sub_218354810();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCC0], v11);
    swift_willThrow();
    return v5;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_218354960();
  unint64_t result = swift_bridgeObjectRelease();
  if (v6 >= v10) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v8 = (id)MEMORY[0x21D4677D0](v6, v7);
LABEL_7:
    id v9 = v8;
    uint64_t v5 = v3();

    if (!v2) {
      v4[1] = v6 + 1;
    }
    return v5;
  }
  if (v6 < 0)
  {
    __break(1u);
  }
  else if ((unint64_t)v6 < *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v8 = *(id *)(v7 + 8 * v6 + 32);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_2183369A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_218336A54@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21832D9B4(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_218336A5C(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 32))(*a1, a1[1]);
}

unint64_t sub_218336A94()
{
  unint64_t result = qword_267BC70B8;
  if (!qword_267BC70B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267BC70B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC70B8);
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

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

void __swiftcall CBORCodableWrapper.init(cbor:)(CBORLibrary::CBORCodableWrapper *__return_ptr retstr, CBOR *cbor)
{
  retstr->cborObj.super.isa = (Class)cbor;
}

uint64_t sub_218336B78()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  sub_218354E40();
  swift_bridgeObjectRetain();
  sub_218354670();
  swift_bridgeObjectRelease();
  sub_218354E60();
  if (v1 != 1) {
    sub_218354E50();
  }
  return sub_218354E70();
}

uint64_t sub_218336C14()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  swift_bridgeObjectRetain();
  sub_218354670();
  swift_bridgeObjectRelease();
  if (v1 == 1) {
    return sub_218354E60();
  }
  sub_218354E60();
  return sub_218354E50();
}

uint64_t sub_218336C9C()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  sub_218354E40();
  swift_bridgeObjectRetain();
  sub_218354670();
  swift_bridgeObjectRelease();
  sub_218354E60();
  if (v1 != 1) {
    sub_218354E50();
  }
  return sub_218354E70();
}

uint64_t sub_218336D34()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_218336D64@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = sub_21833E988(a1, a2);
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 24) = v7;
  return result;
}

uint64_t sub_218336D94()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_218336DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_218354A10();
  *(void *)a2 = result;
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_218336DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  char v3 = *(unsigned char *)(a1 + 24);
  uint64_t v4 = *(void *)(a2 + 16);
  int v5 = *(unsigned __int8 *)(a2 + 24);
  BOOL v6 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v6 || (v7 = sub_218354C10(), uint64_t result = 0, (v7 & 1) != 0))
  {
    if (v3)
    {
      if (v5) {
        return 1;
      }
    }
    else
    {
      if (v2 == v4) {
        char v9 = v5;
      }
      else {
        char v9 = 1;
      }
      if ((v9 & 1) == 0) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_218336E80(uint64_t a1)
{
  unint64_t v2 = sub_218335E58();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_218336EBC(uint64_t a1)
{
  unint64_t v2 = sub_218335E58();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t Data.init(_:)(void *a1)
{
  id v2 = objc_msgSend(self, sel_dataWithCBOR_, a1);
  uint64_t v3 = MEMORY[0x21D467570]();

  return v3;
}

uint64_t Data.init(oldCanonicalOrdering:)(void *a1)
{
  id v2 = objc_msgSend(self, sel_dataWithCBOR_encodingKeyOrder_, a1, 1);
  uint64_t v3 = MEMORY[0x21D467570]();

  return v3;
}

id CBORCodableWrapper.cborObj.getter()
{
  return *v0;
}

void CBORCodableWrapper.cborObj.setter(void *a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*CBORCodableWrapper.cborObj.modify())(void, void)
{
  return nullsub_1;
}

uint64_t CBORCodableWrapper.encode(to:)(void *a1)
{
  uint64_t v2 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218354EB0();
  id v3 = objc_msgSend(self, sel_dataWithCBOR_, v2);
  uint64_t v4 = sub_2183545B0();
  unint64_t v6 = v5;

  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v8, v9);
  sub_218337114();
  sub_218354C50();
  sub_218337168(v4, v6);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
}

unint64_t sub_218337114()
{
  unint64_t result = qword_267BC70C0;
  if (!qword_267BC70C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC70C0);
  }
  return result;
}

uint64_t sub_218337168(uint64_t a1, unint64_t a2)
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

uint64_t CBORCodableWrapper.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218354E80();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    sub_218337298();
    sub_218354C20();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    *a2 = v6;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

unint64_t sub_218337298()
{
  unint64_t result = qword_267BC70C8;
  if (!qword_267BC70C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC70C8);
  }
  return result;
}

uint64_t sub_2183372EC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return CBORCodableWrapper.init(from:)(a1, a2);
}

uint64_t sub_218337304(void *a1)
{
  return CBORCodableWrapper.encode(to:)(a1);
}

uint64_t Data.init(coseSign1:)(void *a1)
{
  return sub_218337334(a1, (SEL *)&selRef_dataWithCOSE_);
}

uint64_t Data.init(coseKey:)(void *a1)
{
  return sub_218337334(a1, (SEL *)&selRef_dataWithCOSEKey_);
}

uint64_t sub_218337334(void *a1, SEL *a2)
{
  uint64_t v2 = (void *)*a1;
  id v3 = objc_msgSend(self, *a2, *a1);

  uint64_t v4 = MEMORY[0x21D467570](v3);
  return v4;
}

id COSE_Sign1.init(algorithmIdentifier:keyIdentifier:initializationVector:partialInitializationVector:payload:signature:x509Chain:includeCBORTag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, unint64_t a10, uint64_t a11, unint64_t a12, void *a13, char a14)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC70D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_218355C80;
  unint64_t v22 = self;
  uint64_t v23 = &off_26431C000;
  *(void *)(inited + 32) = objc_msgSend(v22, sel_cborWithInteger_, 1);
  *(void *)(inited + 40) = objc_msgSend(v22, sel_cborWithInteger_, a1);
  unint64_t v76 = sub_218329A74(inited);
  unint64_t v24 = sub_218329A74(MEMORY[0x263F8EE78]);
  uint64_t v81 = v24;
  uint64_t v79 = a6;
  if (a3 >> 60 == 15)
  {
LABEL_10:
    if (a5 >> 60 != 15)
    {
      sub_218337DAC(a4, a5);
      id v32 = objc_msgSend(v22, (SEL)v23[80], 5);
      sub_218337DAC(a4, a5);
      uint64_t v33 = (void *)sub_2183545A0();
      id v34 = objc_msgSend(v22, sel_cborWithData_, v33);
      sub_218337D98(a4, a5);

      if (v34)
      {
        uint64_t v35 = v81;
        if ((v81 & 0xC000000000000001) != 0)
        {
          if (v81 >= 0) {
            uint64_t v35 = v81 & 0xFFFFFFFFFFFFFF8;
          }
          id result = (id)sub_218354920();
          if (__OFADD__(result, 1)) {
            goto LABEL_61;
          }
          uint64_t v35 = sub_21833B1D4(v35, (uint64_t)result + 1);
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_21833CAE4((uint64_t)v34, v32, isUniquelyReferenced_nonNull_native);
        uint64_t v81 = v35;

        swift_bridgeObjectRelease();
      }
      else
      {
        int64_t v37 = (void *)sub_21833B084((unint64_t)v32);
      }
      sub_218337D98(a4, a5);
      a6 = v79;
    }
    if (a7 >> 60 != 15)
    {
      uint64_t v75 = a2;
      unint64_t v38 = a3;
      sub_218337DAC(a6, a7);
      uint64_t v39 = v23;
      id v40 = objc_msgSend(v22, (SEL)v23[80], 6);
      sub_218337DAC(a6, a7);
      int64_t v41 = (void *)sub_2183545A0();
      uint64_t v42 = a6;
      id v43 = objc_msgSend(v22, sel_cborWithData_, v41);
      sub_218337D98(v42, a7);

      if (v43)
      {
        uint64_t v44 = v81;
        if ((v81 & 0xC000000000000001) != 0)
        {
          if (v81 >= 0) {
            uint64_t v44 = v81 & 0xFFFFFFFFFFFFFF8;
          }
          id result = (id)sub_218354920();
          if (__OFADD__(result, 1)) {
            goto LABEL_62;
          }
          uint64_t v23 = v39;
          uint64_t v44 = sub_21833B1D4(v44, (uint64_t)result + 1);
        }
        else
        {
          uint64_t v23 = v39;
        }
        a3 = v38;
        char v46 = swift_isUniquelyReferenced_nonNull_native();
        sub_21833CAE4((uint64_t)v43, v40, v46);
        uint64_t v81 = v44;

        swift_bridgeObjectRelease();
        a6 = v79;
        sub_218337D98(v79, a7);
      }
      else
      {
        id v45 = (void *)sub_21833B084((unint64_t)v40);

        sub_218337D98(v42, a7);
        a6 = v42;
        uint64_t v23 = v39;
        a3 = v38;
      }
      a2 = v75;
    }
    if (a13)
    {
      uint64_t v47 = a13[2];
      unint64_t v48 = MEMORY[0x263F8EE78];
      unint64_t v74 = a7;
      if (v47)
      {
        uint64_t v72 = a4;
        unint64_t v73 = a5;
        unint64_t v80 = MEMORY[0x263F8EE78];
        sub_2183548A0();
        unint64_t v49 = a13 + 5;
        do
        {
          uint64_t v50 = *(v49 - 1);
          unint64_t v51 = *v49;
          sub_218337DAC(v50, *v49);
          id v52 = (void *)sub_2183545A0();
          id v53 = objc_msgSend(v22, sel_cborWithData_, v52);
          sub_218337168(v50, v51);

          sub_218354880();
          sub_2183548B0();
          sub_2183548C0();
          sub_218354890();
          v49 += 2;
          --v47;
        }
        while (v47);
        unint64_t v48 = v80;
        a5 = v73;
        a4 = v72;
        uint64_t v23 = &off_26431C000;
      }
      if (v48 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v64 = sub_218354960();
        swift_bridgeObjectRelease();
        if (v64 == 1) {
          goto LABEL_38;
        }
      }
      else if (*(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
      {
LABEL_38:
        swift_bridgeObjectRelease();
        id result = objc_msgSend(v22, (SEL)v23[80], 33);
        if (a13[2])
        {
          uint64_t v54 = result;
          uint64_t v55 = a4;
          unint64_t v56 = a5;
          uint64_t v57 = a13[4];
          unint64_t v58 = a13[5];
          sub_218337DAC(v57, v58);
          swift_bridgeObjectRelease();
          unint64_t v59 = (void *)sub_2183545A0();
          id v60 = objc_msgSend(v22, sel_cborWithData_, v59);
          sub_218337168(v57, v58);

          if (!v60)
          {
            uint64_t v62 = (void *)sub_21833B084((unint64_t)v54);

            a5 = v56;
            a4 = v55;
            a7 = v74;
LABEL_57:
            a6 = v79;
            goto LABEL_58;
          }
          uint64_t v61 = v81;
          a5 = v56;
          if ((v81 & 0xC000000000000001) == 0)
          {
            a4 = v55;
            goto LABEL_47;
          }
          if (v81 >= 0) {
            uint64_t v61 = v81 & 0xFFFFFFFFFFFFFF8;
          }
          id result = (id)sub_218354920();
          if (!__OFADD__(result, 1))
          {
            a4 = v55;
            uint64_t v61 = sub_21833B1D4(v61, (uint64_t)result + 1);
LABEL_47:
            a7 = v74;
            char v63 = swift_isUniquelyReferenced_nonNull_native();
            sub_21833CAE4((uint64_t)v60, v54, v63);
            uint64_t v81 = v61;

            swift_bridgeObjectRelease();
            goto LABEL_57;
          }
          goto LABEL_63;
        }
        __break(1u);
        goto LABEL_60;
      }
      swift_bridgeObjectRelease();
      id v65 = objc_msgSend(v22, (SEL)v23[80], 33);
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      uint64_t v66 = (void *)sub_218354720();
      swift_bridgeObjectRelease();
      id v67 = objc_msgSend(v22, sel_cborWithArray_, v66);

      if (!v67)
      {
        unint64_t v70 = (void *)sub_21833B084((unint64_t)v65);

        goto LABEL_57;
      }
      uint64_t v68 = v81;
      a6 = v79;
      if ((v81 & 0xC000000000000001) != 0)
      {
        if (v81 >= 0) {
          uint64_t v68 = v81 & 0xFFFFFFFFFFFFFF8;
        }
        id result = (id)sub_218354920();
        if (__OFADD__(result, 1)) {
          goto LABEL_64;
        }
        uint64_t v68 = sub_21833B1D4(v68, (uint64_t)result + 1);
      }
      char v69 = swift_isUniquelyReferenced_nonNull_native();
      sub_21833CAE4((uint64_t)v67, v65, v69);
      uint64_t v81 = v68;

      swift_bridgeObjectRelease();
    }
LABEL_58:
    sub_218335690(0, &qword_267BC70D8);
    id v71 = sub_218337C38(v76, v81, a8, a10, a11, a12, a14 & 1);
    sub_218337D98(a6, a7);
    sub_218337D98(a4, a5);
    id result = (id)sub_218337D98(a2, a3);
    *a9 = v71;
    return result;
  }
  uint64_t v25 = v24;
  sub_218337DAC(a2, a3);
  id v26 = objc_msgSend(v22, sel_cborWithInteger_, 4);
  sub_218337DAC(a2, a3);
  id v27 = (void *)sub_2183545A0();
  id v28 = objc_msgSend(v22, sel_cborWithData_, v27);
  sub_218337D98(a2, a3);

  if (!v28)
  {
    uint64_t v31 = (void *)sub_21833B084((unint64_t)v26);

    sub_218337D98(a2, a3);
    a6 = v79;
    uint64_t v23 = &off_26431C000;
    goto LABEL_10;
  }
  uint64_t v23 = &off_26431C000;
  if ((v25 & 0xC000000000000001) == 0)
  {
LABEL_8:
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    sub_21833CAE4((uint64_t)v28, v26, v30);
    uint64_t v81 = v25;

    swift_bridgeObjectRelease();
    sub_218337D98(a2, a3);
    a6 = v79;
    goto LABEL_10;
  }
  if (v25 >= 0) {
    v25 &= 0xFFFFFFFFFFFFFF8uLL;
  }
  id result = (id)sub_218354920();
  if (!__OFADD__(result, 1))
  {
    uint64_t v25 = sub_21833B1D4(v25, (uint64_t)result + 1);
    goto LABEL_8;
  }
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
  return result;
}

id sub_218337C38(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, char a7)
{
  sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  sub_218335610();
  uint64_t v11 = (void *)sub_2183545F0();
  swift_bridgeObjectRelease();
  unint64_t v12 = (void *)sub_2183545F0();
  swift_bridgeObjectRelease();
  id v13 = 0;
  if (a4 >> 60 != 15)
  {
    id v13 = (void *)sub_2183545A0();
    sub_218337D98(a3, a4);
  }
  id v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v15 = (void *)sub_2183545A0();
  id v16 = objc_msgSend(v14, sel_initWithProtectedHeaders_unprotectedHeaders_payload_signature_includeCBORTag_, v11, v12, v13, v15, a7 & 1);
  sub_218337168(a5, a6);

  return v16;
}

uint64_t sub_218337D98(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_218337168(a1, a2);
  }
  return a1;
}

uint64_t sub_218337DAC(uint64_t a1, unint64_t a2)
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

void COSE_Sign1.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
}

uint64_t COSE_Sign1.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218354E80();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    sub_218337298();
    sub_218354C20();
    id v5 = objc_msgSend(objc_allocWithZone((Class)COSE_Sign1), sel_initWithCBOR_, v11);
    if (v5)
    {
      id v6 = v5;

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
      *a2 = v6;
    }
    else
    {
      uint64_t v8 = sub_218354830();
      swift_allocError();
      uint64_t v10 = v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
      *uint64_t v10 = &type metadata for COSE_Sign1;
      sub_218354810();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v10, *MEMORY[0x263F8DCB0], v8);
      swift_willThrow();

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t COSE_Sign1.encode(to:)(void *a1)
{
  return sub_218339214(a1, (SEL *)&selRef_cborWithCOSE_);
}

uint64_t COSE_Sign1.payload.getter()
{
  return sub_218339C00((SEL *)&selRef_content);
}

uint64_t COSE_Sign1.signature.getter()
{
  return sub_218338868((SEL *)&selRef_signature);
}

id COSE_Sign1.algorithmIdentifier.getter()
{
  return objc_msgSend(*v0, sel_algorithmIdentifier);
}

uint64_t COSE_Sign1.contentType.getter()
{
  return sub_218338A7C((SEL *)&selRef_contentType);
}

uint64_t COSE_Sign1.keyIdentifier.getter()
{
  return sub_218339C00((SEL *)&selRef_keyIdentifier);
}

uint64_t COSE_Sign1.initializationVector.getter()
{
  return sub_218339C00((SEL *)&selRef_initializationVector);
}

uint64_t COSE_Sign1.partialInitializationVector.getter()
{
  return sub_218339C00((SEL *)&selRef_partialInitializationVector);
}

uint64_t COSE_Sign1.x509Bag.getter()
{
  return sub_218338054((SEL *)&selRef_x509bag);
}

uint64_t COSE_Sign1.x509Chain.getter()
{
  return sub_218338054((SEL *)&selRef_x509chain);
}

uint64_t sub_218338054(SEL *a1)
{
  id v2 = [*v1 *a1];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = sub_218354730();

  return v4;
}

uint64_t COSE_Sign1.x509Uri.getter()
{
  return sub_218338A7C((SEL *)&selRef_x509uri);
}

uint64_t COSE_Sign1.X509Hash.algorithmIdentifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t COSE_Sign1.X509Hash.value.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_218337DAC(v1, *(void *)(v0 + 24));
  return v1;
}

BOOL sub_218338120(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21833813C()
{
  return sub_218354E50();
}

uint64_t sub_21833816C()
{
  if (*v0) {
    return 0x65756C6176;
  }
  else {
    return 0xD000000000000013;
  }
}

uint64_t sub_2183381A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_21833EBEC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2183381D0()
{
  return 0;
}

void sub_2183381DC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2183381E8(uint64_t a1)
{
  unint64_t v2 = sub_21833E24C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_218338224(uint64_t a1)
{
  unint64_t v2 = sub_21833E24C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t COSE_Sign1.X509Hash.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BC70F0);
  uint64_t v13 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4, v5);
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21833E24C();
  sub_218354EC0();
  LOBYTE(v14) = 0;
  sub_2183549E0();
  if (!v2)
  {
    uint64_t v14 = v12;
    uint64_t v15 = v11;
    char v16 = 1;
    sub_218337114();
    sub_2183549F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v7, v4);
}

uint64_t COSE_Sign1.X509Hash.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7100);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21833E24C();
  sub_218354EA0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  LOBYTE(v16[0]) = 0;
  uint64_t v10 = sub_2183549B0();
  uint64_t v12 = v11;
  char v17 = 1;
  sub_21833E2A0();
  swift_bridgeObjectRetain();
  sub_2183549C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  uint64_t v13 = v16[0];
  unint64_t v14 = v16[1];
  swift_bridgeObjectRetain();
  sub_218337DAC(v13, v14);
  swift_bridgeObjectRelease();
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  a2[3] = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_218337168(v13, v14);
}

uint64_t sub_218338630@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return COSE_Sign1.X509Hash.init(from:)(a1, a2);
}

uint64_t sub_218338648(void *a1)
{
  return COSE_Sign1.X509Hash.encode(to:)(a1);
}

double COSE_Sign1.x509Hash.getter@<D0>(uint64_t *a1@<X8>)
{
  id v3 = *v1;
  id v4 = objc_msgSend(*v1, sel_x509hashAlgorithmIdentifier);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = sub_218354650();
    uint64_t v8 = v7;

    id v9 = objc_msgSend(v3, sel_x509hashValue);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_2183545B0();
      uint64_t v13 = v12;

      *a1 = v6;
      a1[1] = v8;
      a1[2] = v11;
      a1[3] = v13;
      return result;
    }
    swift_bridgeObjectRelease();
  }
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  return result;
}

uint64_t sub_218338710@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return COSE_Sign1.init(from:)(a1, a2);
}

uint64_t sub_218338728(void *a1)
{
  return COSE_Sign1.encode(to:)(a1);
}

uint64_t _s11CBORLibrary10COSE_Sign1V28rawProtectedHeaderParameters10Foundation4DataVvg_0()
{
  id v1 = objc_msgSend(*v0, sel_protectedHeaderParameters);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_2183545B0();

  return v3;
}

unint64_t _s11CBORLibrary10COSE_Sign1V30rawUnprotectedHeaderParametersSDySo4CBORCAFGvg_0()
{
  id v1 = objc_msgSend(*v0, sel_unprotectedHeaderParameters);
  if (v1)
  {
    uint64_t v2 = v1;
    sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
    sub_218335610();
    uint64_t v3 = sub_218354600();

    return v3;
  }
  else
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    return sub_218329A74(v5);
  }
}

uint64_t COSE_Mac0.payload.getter()
{
  return sub_218339C00((SEL *)&selRef_content);
}

uint64_t COSE_Mac0.mac.getter()
{
  return sub_218338868((SEL *)&selRef_mac);
}

uint64_t sub_218338868(SEL *a1)
{
  id v2 = [*v1 *a1];
  uint64_t v3 = sub_2183545B0();

  return v3;
}

char *_s11CBORLibrary10COSE_Sign1V23criticalHeaderParameterSaySiGSgvg_0()
{
  id v1 = objc_msgSend(*v0, sel_criticalHeaderParameters);
  if (!v1) {
    return (char *)v1;
  }
  sub_218335690(0, &qword_267BC70E8);
  unint64_t v2 = sub_218354730();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218354960();
  swift_bridgeObjectRelease();
  if (!v3)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
LABEL_4:
  uint64_t v11 = (void *)MEMORY[0x263F8EE78];
  double result = sub_21833E22C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    id v1 = v11;
    do
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v6 = (id)MEMORY[0x21D4677D0](v5, v2);
      }
      else {
        id v6 = *(id *)(v2 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      id v8 = objc_msgSend(v6, sel_integerValue);

      unint64_t v10 = v11[2];
      unint64_t v9 = v11[3];
      if (v10 >= v9 >> 1) {
        sub_21833E22C((char *)(v9 > 1), v10 + 1, 1);
      }
      ++v5;
      v11[2] = v10 + 1;
      v11[v10 + 4] = v8;
    }
    while (v3 != v5);
    swift_bridgeObjectRelease();
    return (char *)v1;
  }
  __break(1u);
  return result;
}

uint64_t COSE_Mac0.contentType.getter()
{
  return sub_218338A7C((SEL *)&selRef_contentType);
}

uint64_t sub_218338A7C(SEL *a1)
{
  id v2 = [*v1 *a1];
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = sub_218354650();

  return v4;
}

uint64_t COSE_Mac0.keyIdentifier.getter()
{
  return sub_218339C00((SEL *)&selRef_keyIdentifier);
}

uint64_t COSE_Mac0.initializationVector.getter()
{
  return sub_218339C00((SEL *)&selRef_initializationVector);
}

uint64_t COSE_Mac0.partialInitializationVector.getter()
{
  return sub_218339C00((SEL *)&selRef_partialInitializationVector);
}

uint64_t COSE_Mac0.computeMAC_Structure(externalAAD:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *v2;
  if (a2 >> 60 == 15) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (void *)sub_2183545A0();
  }
  id v5 = objc_msgSend(v3, sel_generateMessageForMACWithApplicationProtectedAttributes_, v4);

  uint64_t v6 = sub_2183545B0();
  return v6;
}

uint64_t COSE_Mac0.init(algorithmIdentifier:keyIdentifier:initializationVector:partialInitializationVector:payload:mac:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, unint64_t a10, uint64_t a11, unint64_t a12)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC70D0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_218355C80;
  uint64_t v20 = self;
  *(void *)(inited + 32) = objc_msgSend(v20, sel_cborWithInteger_, 1);
  *(void *)(inited + 40) = objc_msgSend(v20, sel_cborWithInteger_, a1);
  uint64_t v21 = sub_218329A74(inited);
  uint64_t v47 = v21;
  uint64_t v22 = sub_218329A74(MEMORY[0x263F8EE78]);
  uint64_t v46 = v22;
  uint64_t v45 = a6;
  if (a3 >> 60 != 15)
  {
    uint64_t v42 = a4;
    sub_218337DAC(a2, a3);
    id v23 = objc_msgSend(v20, sel_cborWithInteger_, 4);
    sub_218337DAC(a2, a3);
    unint64_t v24 = (void *)sub_2183545A0();
    id v25 = objc_msgSend(v20, sel_cborWithData_, v24);
    sub_218337D98(a2, a3);

    if (v25)
    {
      a6 = v45;
      if ((v21 & 0xC000000000000001) != 0)
      {
        if (v21 >= 0) {
          v21 &= 0xFFFFFFFFFFFFFF8uLL;
        }
        uint64_t result = sub_218354920();
        if (__OFADD__(result, 1))
        {
          __break(1u);
          goto LABEL_32;
        }
        uint64_t v21 = sub_21833B1D4(v21, result + 1);
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_21833CAE4((uint64_t)v25, v23, isUniquelyReferenced_nonNull_native);
      uint64_t v47 = v21;

      swift_bridgeObjectRelease();
      sub_218337D98(a2, a3);
      a4 = v42;
    }
    else
    {
      id v27 = (void *)sub_21833B084((unint64_t)v23);

      sub_218337D98(a2, a3);
      a4 = v42;
      a6 = v45;
    }
  }
  if (a5 >> 60 != 15)
  {
    sub_218337DAC(a4, a5);
    id v29 = objc_msgSend(v20, sel_cborWithInteger_, 5);
    sub_218337DAC(a4, a5);
    char v30 = (void *)sub_2183545A0();
    id v31 = objc_msgSend(v20, sel_cborWithData_, v30);
    sub_218337D98(a4, a5);

    if (!v31)
    {
      uint64_t v33 = (void *)sub_21833B084((unint64_t)v29);

      goto LABEL_19;
    }
    if ((v22 & 0xC000000000000001) == 0)
    {
LABEL_17:
      char v32 = swift_isUniquelyReferenced_nonNull_native();
      sub_21833CAE4((uint64_t)v31, v29, v32);
      uint64_t v46 = v22;

      swift_bridgeObjectRelease();
LABEL_19:
      sub_218337D98(a4, a5);
      a6 = v45;
      goto LABEL_20;
    }
    if (v22 >= 0) {
      v22 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t result = sub_218354920();
    if (!__OFADD__(result, 1))
    {
      uint64_t v22 = sub_21833B1D4(v22, result + 1);
      goto LABEL_17;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_20:
  if (a7 >> 60 == 15)
  {
LABEL_30:
    sub_218335690(0, &qword_267BC7110);
    id v41 = sub_21833907C(v47, v46, a8, a10, a11, a12);
    sub_218337D98(a6, a7);
    sub_218337D98(a4, a5);
    uint64_t result = sub_218337D98(a2, a3);
    *a9 = v41;
    return result;
  }
  uint64_t v34 = a4;
  sub_218337DAC(a6, a7);
  id v35 = objc_msgSend(v20, sel_cborWithInteger_, 6);
  sub_218337DAC(a6, a7);
  uint64_t v36 = (void *)sub_2183545A0();
  id v37 = objc_msgSend(v20, sel_cborWithData_, v36);
  sub_218337D98(a6, a7);

  if (!v37)
  {
    id v40 = (void *)sub_21833B084((unint64_t)v35);

    goto LABEL_29;
  }
  uint64_t v38 = v46;
  if ((v46 & 0xC000000000000001) == 0)
  {
LABEL_27:
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_21833CAE4((uint64_t)v37, v35, v39);
    uint64_t v46 = v38;

    swift_bridgeObjectRelease();
LABEL_29:
    sub_218337D98(a6, a7);
    a4 = v34;
    goto LABEL_30;
  }
  if (v46 >= 0) {
    uint64_t v38 = v46 & 0xFFFFFFFFFFFFFF8;
  }
  uint64_t result = sub_218354920();
  if (!__OFADD__(result, 1))
  {
    uint64_t v38 = sub_21833B1D4(v38, result + 1);
    goto LABEL_27;
  }
LABEL_33:
  __break(1u);
  return result;
}

id sub_21833907C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  sub_218335610();
  unint64_t v10 = (void *)sub_2183545F0();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_2183545F0();
  swift_bridgeObjectRelease();
  uint64_t v12 = 0;
  if (a4 >> 60 != 15)
  {
    uint64_t v12 = (void *)sub_2183545A0();
    sub_218337D98(a3, a4);
  }
  id v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v14 = (void *)sub_2183545A0();
  id v15 = objc_msgSend(v13, sel_initWithProtectedHeaders_unprotectedHeaders_payload_tag_, v10, v11, v12, v14);
  sub_218337168(a5, a6);

  return v15;
}

void COSE_Mac0.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
}

uint64_t COSE_Mac0.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_218339D14(a1, (Class *)off_26431BFB0, a2);
}

uint64_t COSE_Mac0.encode(to:)(void *a1)
{
  return sub_218339214(a1, (SEL *)&selRef_cborWithCOSE_);
}

uint64_t sub_218339214(void *a1, SEL *a2)
{
  uint64_t v4 = *v2;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218354EB0();
  id v6 = objc_msgSend(self, *a2, v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  sub_21833CC58();
  sub_218354C50();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
}

uint64_t sub_2183392E8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return COSE_Mac0.init(from:)(a1, a2);
}

id COSEKey.type.getter()
{
  return objc_msgSend(*v0, sel_type);
}

id COSEKey.algorithm.getter()
{
  return objc_msgSend(*v0, sel_algorithm);
}

uint64_t COSEKey.identifier.getter()
{
  return sub_218339C00((SEL *)&selRef_identifier);
}

uint64_t COSEKey.operations.getter()
{
  id v1 = objc_msgSend(*v0, sel_operations);
  if (!v1) {
    return 0;
  }
  id v2 = v1;
  sub_218335690(0, &qword_267BC70E8);
  unint64_t v3 = sub_218354730();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_4;
    }
LABEL_17:
    uint64_t v7 = (char *)MEMORY[0x263F8EE78];
LABEL_18:
    swift_bridgeObjectRelease_n();
    return (uint64_t)v7;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_218354960();
  uint64_t v4 = result;
  if (!result) {
    goto LABEL_17;
  }
LABEL_4:
  if (v4 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = (char *)MEMORY[0x263F8EE78];
    do
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v8 = (id)MEMORY[0x21D4677D0](v6, v3);
      }
      else {
        id v8 = *(id *)(v3 + 8 * v6 + 32);
      }
      unint64_t v9 = v8;
      id v10 = objc_msgSend(v8, sel_integerValue);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_21833D7FC(0, *((void *)v7 + 2) + 1, 1, v7);
      }
      unint64_t v12 = *((void *)v7 + 2);
      unint64_t v11 = *((void *)v7 + 3);
      if (v12 >= v11 >> 1) {
        uint64_t v7 = sub_21833D7FC((char *)(v11 > 1), v12 + 1, 1, v7);
      }
      ++v6;
      *((void *)v7 + 2) = v12 + 1;
      *(void *)&v7[8 * v12 + 32] = v10;
    }
    while (v4 != v6);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t COSEKey.baseInitializeationVector.getter()
{
  return sub_218339C00((SEL *)&selRef_baseInitializationVector);
}

id COSEKey.init(ec2CurveIdentifier:x:y:d:algorithm:keyOperations:keyIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, unint64_t a12)
{
  unint64_t v12 = a7;
  uint64_t v13 = a6;
  unint64_t v14 = a5;
  id v15 = a9;
  if (a10)
  {
    uint64_t v17 = *(void *)(a10 + 16);
    if (v17)
    {
      uint64_t v31 = MEMORY[0x263F8EE78];
      sub_2183548A0();
      sub_218335690(0, &qword_267BC70E8);
      uint64_t v18 = 0;
      do
      {
        uint64_t v19 = v18 + 1;
        sub_218354790();
        sub_218354880();
        sub_2183548B0();
        sub_2183548C0();
        sub_218354890();
        uint64_t v18 = v19;
      }
      while (v17 != v19);
      uint64_t v20 = v31;
      swift_bridgeObjectRelease();
      id v15 = a9;
      unint64_t v12 = a7;
      unint64_t v14 = a5;
      uint64_t v13 = a6;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v20 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  id v21 = objc_allocWithZone((Class)COSEKey);
  id result = sub_21833AAB4(a8, a1, a2, a3, a4, v14, v13, v12, v20, a11, a12);
  *id v15 = result;
  return result;
}

id COSEKey.init(ec2CurveIdentifier:x:signBit:d:algorithm:keyOperations:keyIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, unint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, unint64_t a11)
{
  uint64_t v11 = a7;
  unint64_t v12 = a6;
  uint64_t v13 = a5;
  unint64_t v14 = a9;
  if (a8)
  {
    char v15 = a4;
    uint64_t v16 = *(void *)(a8 + 16);
    if (v16)
    {
      uint64_t v29 = MEMORY[0x263F8EE78];
      sub_2183548A0();
      sub_218335690(0, &qword_267BC70E8);
      uint64_t v17 = 0;
      do
      {
        uint64_t v18 = v17 + 1;
        sub_218354790();
        sub_218354880();
        sub_2183548B0();
        sub_2183548C0();
        sub_218354890();
        uint64_t v17 = v18;
      }
      while (v16 != v18);
      uint64_t v19 = v29;
      swift_bridgeObjectRelease();
      unint64_t v12 = a6;
      unint64_t v14 = a9;
      uint64_t v11 = a7;
      uint64_t v13 = a5;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    char v15 = a4;
    uint64_t v19 = 0;
  }
  id v20 = objc_allocWithZone((Class)COSEKey);
  id result = sub_21833AC48(v11, a1, a2, a3, v15 & 1, v13, v12, v19, a10, a11);
  *unint64_t v14 = result;
  return result;
}

id COSEKey.init(okpCurveIdentifier:x:d:algorithm:keyOperations:keyIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, unint64_t a10)
{
  uint64_t v10 = a8;
  unint64_t v11 = a5;
  uint64_t v12 = a4;
  uint64_t v13 = a9;
  if (a7)
  {
    uint64_t v14 = a1;
    uint64_t v15 = a6;
    uint64_t v16 = *(void *)(a7 + 16);
    if (v16)
    {
      uint64_t v28 = MEMORY[0x263F8EE78];
      sub_2183548A0();
      sub_218335690(0, &qword_267BC70E8);
      uint64_t v17 = 0;
      do
      {
        uint64_t v18 = v17 + 1;
        sub_218354790();
        sub_218354880();
        sub_2183548B0();
        sub_2183548C0();
        sub_218354890();
        uint64_t v17 = v18;
      }
      while (v16 != v18);
      uint64_t v19 = v28;
      swift_bridgeObjectRelease();
      uint64_t v13 = a9;
      uint64_t v10 = a8;
      uint64_t v12 = a4;
      unint64_t v11 = a5;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v19 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    uint64_t v14 = a1;
    uint64_t v15 = a6;
    uint64_t v19 = 0;
  }
  id v20 = objc_allocWithZone((Class)COSEKey);
  id result = sub_21833ADF0(v15, v14, a2, a3, v12, v11, v19, v10, a10);
  *uint64_t v13 = result;
  return result;
}

void COSEKey.ec2.getter(void *a1@<X8>)
{
  id v3 = *v1;
  if (objc_msgSend(*v1, sel_type) == (id)2
    && (id v4 = objc_msgSend(v3, sel_ecCurveIdentifier)) != 0)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v4, sel_integerValue);
    id v7 = objc_msgSend(v3, sel_ecCurveX);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = sub_2183545B0();
      unint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v11 = 0xC000000000000000;
    }
    id v16 = objc_msgSend(v3, sel_ecCurveY);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v12 = sub_2183545B0();
      unint64_t v13 = v18;
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v13 = 0xC000000000000000;
    }
    id v19 = objc_msgSend(v3, sel_ecCurveD);
    if (v19)
    {
      id v20 = v19;
      uint64_t v14 = sub_2183545B0();
      unint64_t v15 = v21;
    }
    else
    {

      uint64_t v14 = 0;
      unint64_t v15 = 0xC000000000000000;
    }
  }
  else
  {
    id v6 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v9;
  a1[2] = v11;
  a1[3] = v12;
  a1[4] = v13;
  a1[5] = v14;
  a1[6] = v15;
}

void COSEKey.okp.getter(void *a1@<X8>)
{
  id v3 = *v1;
  if (objc_msgSend(*v1, sel_type) == (id)1
    && (id v4 = objc_msgSend(v3, sel_okpCurveIdentifier)) != 0)
  {
    id v5 = v4;
    id v6 = objc_msgSend(v4, sel_integerValue);
    id v7 = objc_msgSend(v3, sel_okpCurveX);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = sub_2183545B0();
      unint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      unint64_t v11 = 0xC000000000000000;
    }
    id v14 = objc_msgSend(v3, sel_okpCurveD);
    if (v14)
    {
      unint64_t v15 = v14;
      uint64_t v12 = sub_2183545B0();
      unint64_t v13 = v16;
    }
    else
    {

      uint64_t v12 = 0;
      unint64_t v13 = 0xC000000000000000;
    }
  }
  else
  {
    id v6 = 0;
    uint64_t v9 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  *a1 = v6;
  a1[1] = v9;
  a1[2] = v11;
  a1[3] = v12;
  a1[4] = v13;
}

uint64_t COSEKey.symmetricKey.getter()
{
  return sub_218339C00((SEL *)&selRef_symmetricKey);
}

uint64_t sub_218339C00(SEL *a1)
{
  id v2 = [*v1 *a1];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  uint64_t v4 = sub_2183545B0();

  return v4;
}

void COSEKey.init(data:)(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
}

void sub_218339C74(uint64_t a1@<X0>, unint64_t a2@<X1>, Class *a3@<X2>, void *a4@<X8>)
{
  id v7 = objc_allocWithZone(*a3);
  id v8 = (void *)sub_2183545A0();
  id v9 = objc_msgSend(v7, sel_initWithData_, v8);
  sub_218337168(a1, a2);

  *a4 = v9;
}

uint64_t COSEKey.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return sub_218339D14(a1, (Class *)off_26431BFA8, a2);
}

uint64_t sub_218339D14@<X0>(void *a1@<X0>, Class *a2@<X1>, void *a3@<X8>)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218354E80();
  if (!v3)
  {
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    sub_218337298();
    sub_218354C20();
    id v7 = v15;
    id v8 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithCBOR_, v15);
    if (v8)
    {
      id v9 = v8;

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
      *a3 = v9;
    }
    else
    {
      uint64_t v11 = sub_218354830();
      swift_allocError();
      unint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8);
      *unint64_t v13 = sub_218335690(0, &qword_267BC7110);
      sub_218354810();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t COSEKey.encode(to:)(void *a1)
{
  return sub_218339214(a1, (SEL *)&selRef_cborWithCOSEKey_);
}

uint64_t sub_218339EF8@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return COSEKey.init(from:)(a1, a2);
}

uint64_t sub_218339F10(void *a1)
{
  return COSEKey.encode(to:)(a1);
}

BOOL static CBOR.InitError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CBOR.InitError.hash(into:)()
{
  return sub_218354E50();
}

uint64_t CBOR.InitError.hashValue.getter()
{
  return sub_218354E70();
}

uint64_t sub_218339FB4()
{
  return sub_218354E70();
}

uint64_t sub_218339FFC()
{
  return sub_218354E70();
}

id CBOR.init<A>(_:tag:fullDate:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v12 = sub_2183545E0();
  uint64_t v14 = MEMORY[0x270FA5388](v12, v13);
  unint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v14, v17);
  id v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v46 = 0;
  if (a3)
  {
LABEL_7:
    if (a5 == MEMORY[0x263F8D6C8])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8D6C8]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithInteger_, *(void *)&v47);
    }
    else if (a5 == MEMORY[0x263F8E4F0])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8E4F0]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithInteger_, SLOWORD(v47));
    }
    else if (a5 == MEMORY[0x263F8E548])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8E548]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithInteger_, SLODWORD(v47));
    }
    else if (a5 == MEMORY[0x263F8E5C0])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8E5C0]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithInteger_, *(void *)&v47);
    }
    else if (a5 == MEMORY[0x263F8D9D0])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8D9D0]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithUnsignedInteger_, *(void *)&v47);
    }
    else if (a5 == MEMORY[0x263F8E888])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8E888]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithUnsignedInteger_, LOWORD(v47));
    }
    else if (a5 == MEMORY[0x263F8E8F8])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8E8F8]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithUnsignedInteger_, LODWORD(v47));
    }
    else if (a5 == MEMORY[0x263F8E970])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8E970]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithUnsignedInteger_, *(void *)&v47);
    }
    else if (a5 == MEMORY[0x263F8D5C8])
    {
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8D5C8]);
      swift_dynamicCast();
      int v28 = LODWORD(v47);
      uint64_t v29 = self;
      LODWORD(v30) = v28;
      id v27 = objc_msgSend(v29, sel_cborWithFloat_, v30);
    }
    else
    {
      if (a5 != MEMORY[0x263F8D538])
      {
        if (a5 == MEMORY[0x263F8D310])
        {
          id v35 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          uint64_t v26 = v45;
          (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8D310]);
          swift_dynamicCast();
          uint64_t v36 = (void *)sub_218354640();
          swift_bridgeObjectRelease();
          id v31 = objc_msgSend(self, sel_cborWithUTF8String_, v36);
        }
        else
        {
          if (a5 != MEMORY[0x263F06F78])
          {
            if (v12 != a5)
            {
              char v22 = 0;
              goto LABEL_5;
            }
            uint64_t v44 = v18;
            char v40 = a4;
            uint64_t v33 = v46;
            if (a4 == 2)
            {
              (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v20, a1, a5);
              swift_dynamicCast();
              id v41 = (void *)sub_2183545C0();
              uint64_t v42 = self;
            }
            else
            {
              (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v20, a1, a5);
              swift_dynamicCast();
              id v41 = (void *)sub_2183545C0();
              uint64_t v42 = self;
              if (v40)
              {
                id v43 = objc_msgSend(v42, sel_cborWithFullDate_, v41, v44);
                goto LABEL_43;
              }
            }
            id v43 = objc_msgSend(v42, sel_cborWithDateTime_, v41, v44);
LABEL_43:
            id v31 = v43;

            (*(void (**)(char *, uint64_t))(v44 + 8))(v16, a5);
            id v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCbor_tag_, v31, v33);
            uint64_t v26 = v45;
            goto LABEL_33;
          }
          id v35 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          uint64_t v26 = v45;
          (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F06F78]);
          swift_dynamicCast();
          uint64_t v37 = *(void *)&v47;
          unint64_t v38 = v48;
          char v39 = (void *)sub_2183545A0();
          id v31 = objc_msgSend(self, sel_cborWithData_, v39);
          sub_218337168(v37, v38);
        }
        char v32 = v35;
LABEL_32:
        uint64_t v33 = v46;
        id v6 = objc_msgSend(v32, sel_initWithCbor_tag_, v31, v46);
LABEL_33:

        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(a1, a5);
        return v6;
      }
      id v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      uint64_t v26 = v45;
      (*(void (**)(char *, uint64_t, void))(v45 + 16))(v20, a1, MEMORY[0x263F8D538]);
      swift_dynamicCast();
      id v27 = objc_msgSend(self, sel_cborWithDouble_, v47);
    }
    id v31 = v27;
    char v32 = v25;
    goto LABEL_32;
  }
  uint64_t v21 = v18;
  id v46 = objc_msgSend(self, sel_cborWithInteger_, a2);
  if (a2 != 24 || a5 == MEMORY[0x263F06F78])
  {
    uint64_t v18 = v21;
    goto LABEL_7;
  }
  char v22 = 1;
LABEL_5:
  id v23 = v46;
  sub_21833E2F4();
  swift_allocError();
  char *v24 = v22;
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(a1, a5);
  return v6;
}

id sub_21833AAB4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  uint64_t v17 = (void *)sub_2183545A0();
  id v27 = (void *)sub_2183545A0();
  if (a8 >> 60 == 15)
  {
    uint64_t v18 = 0;
    unint64_t v19 = a11;
    if (a9)
    {
LABEL_3:
      sub_218335690(0, &qword_267BC70E8);
      id v20 = (void *)sub_218354720();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v18 = (void *)sub_2183545A0();
    sub_218337D98(a7, a8);
    unint64_t v19 = a11;
    if (a9) {
      goto LABEL_3;
    }
  }
  id v20 = 0;
LABEL_6:
  if (v19 >> 60 == 15)
  {
    uint64_t v21 = 0;
  }
  else
  {
    uint64_t v21 = (void *)sub_2183545A0();
    sub_218337D98(a10, v19);
  }
  id v22 = objc_msgSend(v26, sel_initEC2WithAlgorithm_curveIdentifier_x_y_d_keyOperations_keyIdentifier_, a1, a2, v17, v27, v18, v20, v21);
  sub_218337168(a5, a6);
  sub_218337168(a3, a4);

  return v22;
}

id sub_21833AC48(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  uint64_t v11 = v10;
  unint64_t v19 = (void *)sub_2183545A0();
  if (a7 >> 60 == 15)
  {
    id v20 = 0;
    unint64_t v21 = a10;
    if (a8)
    {
LABEL_3:
      sub_218335690(0, &qword_267BC70E8);
      id v22 = (void *)sub_218354720();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    id v20 = (void *)sub_2183545A0();
    sub_218337D98(a6, a7);
    unint64_t v21 = a10;
    if (a8) {
      goto LABEL_3;
    }
  }
  id v22 = 0;
LABEL_6:
  if (v21 >> 60 == 15)
  {
    id v23 = 0;
  }
  else
  {
    id v23 = (void *)sub_2183545A0();
    sub_218337D98(a9, v21);
  }
  id v24 = objc_msgSend(v11, sel_initEC2WithAlgorithm_curveIdentifier_x_signBit_d_keyOperations_keyIdentifier_, a1, a2, v19, a5 & 1, v20, v22, v23);
  sub_218337168(a3, a4);

  return v24;
}

id sub_21833ADF0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  uint64_t v17 = (void *)sub_2183545A0();
  if (a6 >> 60 == 15)
  {
    uint64_t v18 = 0;
    unint64_t v19 = a9;
    if (a7)
    {
LABEL_3:
      sub_218335690(0, &qword_267BC70E8);
      id v20 = (void *)sub_218354720();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v18 = (void *)sub_2183545A0();
    sub_218337D98(a5, a6);
    unint64_t v19 = a9;
    if (a7) {
      goto LABEL_3;
    }
  }
  id v20 = 0;
LABEL_6:
  if (v19 >> 60 == 15)
  {
    unint64_t v21 = 0;
  }
  else
  {
    unint64_t v21 = (void *)sub_2183545A0();
    sub_218337D98(a8, v19);
  }
  id v22 = objc_msgSend(v24, sel_initOKPWithAlgorithm_curveIdentifier_x_d_keyOperations_keyIdentifier_, a1, a2, v17, v18, v20, v21);
  sub_218337168(a3, a4);

  return v22;
}

double sub_21833AF58@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_21834A424(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v13 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21833CEE0();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_2183548F0();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_218335884((_OWORD *)(*(void *)(v9 + 56) + 32 * v6), a2);
    sub_21833C2C8(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_21833B084(unint64_t a1)
{
  id v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_21834A560(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v9 = *v2;
      uint64_t v17 = *v2;
      *id v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_21833D370();
        uint64_t v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_218354930();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_218354920();
  uint64_t v9 = sub_21833B1D4(v5, v8);
  swift_retain();
  a1 = sub_21834A560((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_21833C758(a1, v9);
  *id v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_21833B1D4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FC0);
    uint64_t v2 = sub_218354990();
    uint64_t v18 = v2;
    sub_218354910();
    uint64_t v3 = sub_218354940();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_21833BD1C(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        uint64_t result = sub_2183547A0();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_218354940();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_21833B408(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE808);
    uint64_t v2 = sub_218354990();
    uint64_t v20 = v2;
    sub_218354910();
    if (sub_218354940())
    {
      uint64_t v4 = v3;
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v20;
        unint64_t v14 = *(void *)(v20 + 16);
        if (*(void *)(v20 + 24) <= v14)
        {
          sub_21833BFF0(v14 + 1, 1);
          uint64_t v2 = v20;
        }
        uint64_t result = sub_2183547A0();
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v15 = 0;
          unint64_t v16 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v16 && (v15 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v17 = v9 == v16;
            if (v9 == v16) {
              unint64_t v9 = 0;
            }
            v15 |= v17;
            uint64_t v18 = *(void *)(v6 + 8 * v9);
          }
          while (v18 == -1);
          unint64_t v10 = __clz(__rbit64(~v18)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v19;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v12 = sub_218354940();
        uint64_t v4 = v13;
      }
      while (v12);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x263F8EE80];
  }
  return v2;
}

uint64_t sub_21833B620(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v45 = sub_2183548F0();
  uint64_t v5 = *(void *)(v45 - 8);
  MEMORY[0x270FA5388](v45, v6);
  unint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7008);
  int v46 = a2;
  uint64_t v10 = sub_218354980();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    char v39 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    id v41 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v40 = (unint64_t)(v12 + 63) >> 6;
    uint64_t v42 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    double v47 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
    uint64_t v43 = v9;
    uint64_t v44 = v8;
    while (1)
    {
      if (v15)
      {
        unint64_t v20 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v21 = v20 | (v18 << 6);
      }
      else
      {
        int64_t v22 = v18 + 1;
        if (__OFADD__(v18, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v22 >= v40) {
          goto LABEL_34;
        }
        unint64_t v23 = v41[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v40) {
            goto LABEL_34;
          }
          unint64_t v23 = v41[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v40)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v39;
              if (v46)
              {
                uint64_t v37 = 1 << *(unsigned char *)(v9 + 32);
                if (v37 >= 64) {
                  bzero(v41, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v41 = -1 << v37;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v41[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v40) {
                  goto LABEL_34;
                }
                unint64_t v23 = v41[v18];
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v18 = v24;
          }
        }
LABEL_21:
        unint64_t v15 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v18 << 6);
      }
      uint64_t v25 = v5;
      uint64_t v26 = *(void *)(v5 + 72);
      unint64_t v27 = *(void *)(v9 + 48) + v26 * v21;
      int v28 = v44;
      uint64_t v29 = v45;
      if (v46)
      {
        (*v47)(v44, v27, v45);
        sub_218335884((_OWORD *)(*(void *)(v9 + 56) + 32 * v21), v48);
      }
      else
      {
        (*v42)(v44, v27, v45);
        sub_21833ECD8(*(void *)(v9 + 56) + 32 * v21, (uint64_t)v48);
      }
      uint64_t result = sub_218354620();
      uint64_t v30 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v31 = result & ~v30;
      unint64_t v32 = v31 >> 6;
      if (((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v31) & ~*(void *)(v16 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v33 = 0;
        unint64_t v34 = (unint64_t)(63 - v30) >> 6;
        do
        {
          if (++v32 == v34 && (v33 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v35 = v32 == v34;
          if (v32 == v34) {
            unint64_t v32 = 0;
          }
          v33 |= v35;
          uint64_t v36 = *(void *)(v16 + 8 * v32);
        }
        while (v36 == -1);
        unint64_t v19 = __clz(__rbit64(~v36)) + (v32 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      (*v47)((char *)(*(void *)(v11 + 48) + v26 * v19), (unint64_t)v28, v29);
      uint64_t result = (uint64_t)sub_218335884(v48, (_OWORD *)(*(void *)(v11 + 56) + 32 * v19));
      ++*(void *)(v11 + 16);
      uint64_t v5 = v25;
      uint64_t v9 = v43;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_21833BA1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FF0);
  uint64_t v6 = sub_218354980();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      unint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_218335884(v24, v35);
      }
      else
      {
        sub_21833ECD8((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_218354E40();
      sub_218354670();
      uint64_t result = sub_218354E70();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_218335884(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_21833BD1C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FC0);
  uint64_t v6 = sub_218354980();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_2183547A0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_21833BFF0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE808);
  uint64_t v6 = sub_218354980();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    uint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_unknownObjectRetain();
    }
    uint64_t result = sub_2183547A0();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_21833C2C8(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2183548F0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4, v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    uint64_t v39 = a2 + 64;
    unint64_t result = sub_2183547D0();
    uint64_t v13 = v39;
    if ((*(void *)(v39 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      unint64_t v37 = (result + 1) & v12;
      uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v14 = v5 + 16;
      uint64_t v36 = v15;
      uint64_t v16 = *(void *)(v14 + 56);
      uint64_t v38 = v14;
      unint64_t v17 = (uint64_t (**)(char *, uint64_t))(v14 - 8);
      do
      {
        int64_t v18 = v16 * v11;
        v36(v9, *(void *)(a2 + 48) + v16 * v11, v4);
        uint64_t v19 = sub_218354620();
        unint64_t result = (*v17)(v9, v4);
        unint64_t v20 = v19 & v12;
        if (a1 >= (uint64_t)v37)
        {
          if (v20 >= v37 && a1 >= (uint64_t)v20)
          {
LABEL_17:
            uint64_t v23 = *(void *)(a2 + 48);
            unint64_t result = v23 + v16 * a1;
            unint64_t v24 = v23 + v18 + v16;
            if (v16 * a1 < v18 || result >= v24)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
            }
            else if (v16 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v26 = *(void *)(a2 + 56);
            unint64_t v27 = (_OWORD *)(v26 + 32 * a1);
            BOOL v28 = (_OWORD *)(v26 + 32 * v11);
            uint64_t v13 = v39;
            if (a1 != v11 || (a1 = v11, v27 >= v28 + 2))
            {
              long long v29 = v28[1];
              *unint64_t v27 = *v28;
              v27[1] = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v20 >= v37 || a1 >= (uint64_t)v20)
        {
          goto LABEL_17;
        }
        uint64_t v13 = v39;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v12;
      }
      while (((*(void *)(v13 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v30 = (uint64_t *)(v13 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v30 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  *uint64_t v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_21833C580(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_2183547D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_218354E40();
        swift_bridgeObjectRetain();
        sub_218354670();
        uint64_t v10 = sub_218354E70();
        unint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          uint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *uint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_21833C758(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_2183547D0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        uint64_t v11 = sub_2183547A0();

        unint64_t v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            uint64_t v15 = *(void *)(a2 + 48);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1) {
              *uint64_t v16 = *v17;
            }
            uint64_t v18 = *(void *)(a2 + 56);
            uint64_t v19 = (void *)(v18 + 8 * v3);
            uint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v19 >= v20 + 1))
            {
              *uint64_t v19 = *v20;
              int64_t v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << a1) - 1;
  }
  *uint64_t v21 = v23 & v22;
  uint64_t v24 = *(void *)(a2 + 16);
  BOOL v25 = __OFSUB__(v24, 1);
  uint64_t v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

_OWORD *sub_21833C90C(_OWORD *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2183548F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  unint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (void *)*v3;
  unint64_t v15 = sub_21834A424(a2);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 < v18 || (a3 & 1) == 0)
  {
    if (v20 >= v18 && (a3 & 1) == 0)
    {
      sub_21833CEE0();
      goto LABEL_7;
    }
    sub_21833B620(v18, a3 & 1);
    unint64_t v24 = sub_21834A424(a2);
    if ((v19 & 1) == (v25 & 1))
    {
      unint64_t v15 = v24;
      uint64_t v21 = *v4;
      if (v19) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a2, v8);
      return sub_21833CE20(v15, (uint64_t)v12, a1, v21);
    }
LABEL_15:
    unint64_t result = (_OWORD *)sub_218354DF0();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v21 = *v4;
  if ((v19 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v22 = (_OWORD *)(v21[7] + 32 * v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  return sub_218335884(a1, v22);
}

void sub_21833CAE4(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_21834A560((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_21833D370();
LABEL_7:
    unint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_21833BD1C(v12, a3 & 1);
  unint64_t v17 = sub_21834A560((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
    sub_218354DF0();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  unint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;
  id v23 = a2;
}

unint64_t sub_21833CC58()
{
  unint64_t result = qword_267BC70E0;
  if (!qword_267BC70E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC70E0);
  }
  return result;
}

id sub_21833CCAC(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_21834A560((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_21833D518();
LABEL_7:
    unint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];
      id result = (id)swift_unknownObjectRelease();
      *(void *)(v16 + 8 * v9) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_21833BFF0(v12, a3 & 1);
  unint64_t v18 = sub_21834A560((uint64_t)a2);
  if ((v13 & 1) != (v19 & 1))
  {
LABEL_17:
    sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
    id result = (id)sub_218354DF0();
    __break(1u);
    return result;
  }
  unint64_t v9 = v18;
  unint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v20 = 8 * v9;
  *(void *)(v15[6] + v20) = a2;
  *(void *)(v15[7] + v20) = a1;
  uint64_t v21 = v15[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v23;
  return a2;
}

_OWORD *sub_21833CE20(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2183548F0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  id result = sub_218335884(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_21833CEE0()
{
  id v1 = v0;
  uint64_t v2 = sub_2183548F0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7008);
  uint64_t v7 = *v0;
  uint64_t v8 = sub_218354970();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    id result = (void *)swift_release();
LABEL_25:
    *id v1 = v9;
    return result;
  }
  uint64_t v23 = v1;
  id result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    id result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  uint64_t v24 = v7 + 64;
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 64);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v24 + 8 * v12);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v17 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(void *)(v7 + 48) + v18, v2);
    uint64_t v19 = 32 * v17;
    sub_21833ECD8(*(void *)(v7 + 56) + v19, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v9 + 48) + v18, v6, v2);
    id result = sub_218335884(v27, (_OWORD *)(*(void *)(v9 + 56) + v19));
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v25)
  {
LABEL_23:
    id result = (void *)swift_release();
    id v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
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
    if (v12 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_21833D188()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FF0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218354970();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *id v1 = v4;
    return result;
  }
  int64_t v25 = v1;
  id result = (void *)(v3 + 64);
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
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_21833ECD8(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_218335884(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    id v1 = v25;
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

id sub_21833D370()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218354970();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *id v1 = v4;
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21833D518()
{
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE808);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_218354970();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *id v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = (void *)swift_unknownObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_21833D6C4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE810);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_26ACFE818);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21833D7FC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7140);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unsigned __int8 *sub_21833D8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_2183546E0();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_21833DC5C();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_218354870();
  }
LABEL_7:
  int64_t v11 = sub_21833D9E0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_21833D9E0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v23 = a3 + 48;
      unsigned __int8 v24 = a3 + 55;
      unsigned __int8 v25 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v23 = 58;
      }
      else
      {
        unsigned __int8 v25 = 97;
        unsigned __int8 v24 = 65;
      }
      if (result)
      {
        uint64_t v26 = 0;
        do
        {
          unsigned int v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              uint64_t v13 = 0;
              if (v27 < 0x61 || v27 >= v25) {
                return (unsigned __int8 *)v13;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
            return 0;
          }
          uint64_t v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v15 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v16 = a3 + 48;
  unsigned __int8 v17 = a3 + 55;
  unsigned __int8 v18 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v16 = 58;
  }
  else
  {
    unsigned __int8 v18 = 97;
    unsigned __int8 v17 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  id v19 = result + 1;
  do
  {
    unsigned int v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        uint64_t v13 = 0;
        if (v20 < 0x61 || v20 >= v18) {
          return (unsigned __int8 *)v13;
        }
        char v21 = -87;
      }
      else
      {
        char v21 = -55;
      }
    }
    else
    {
      char v21 = -48;
    }
    uint64_t v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21))) {
      return 0;
    }
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_21833DC5C()
{
  unint64_t v0 = sub_2183546F0();
  uint64_t v4 = sub_21833DCDC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21833DCDC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_21833DE34(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_21833DF34(v9, 0);
      unint64_t v12 = sub_21833DF9C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_218354870();
LABEL_4:
        JUMPOUT(0x21D467640);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x21D467640](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x21D467640]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_21833DE34(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_21833E1B0(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_21833E1B0(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

void *sub_21833DF34(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7150);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_21833DF9C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    _OWORD v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    id result = v12;
    if (v17 == v15) {
      id result = sub_21833E1B0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      id result = sub_2183546C0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        id result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          id result = sub_218354870();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    id result = sub_21833E1B0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_218354690();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21833E1B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2183546D0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x21D467680](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_21833E22C(char *a1, int64_t a2, char a3)
{
  id result = sub_21833E88C(a1, a2, a3, *v3);
  *char v3 = result;
  return result;
}

unint64_t sub_21833E24C()
{
  unint64_t result = qword_267BC70F8;
  if (!qword_267BC70F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC70F8);
  }
  return result;
}

unint64_t sub_21833E2A0()
{
  unint64_t result = qword_267BC7108;
  if (!qword_267BC7108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7108);
  }
  return result;
}

unint64_t sub_21833E2F4()
{
  unint64_t result = qword_267BC7118;
  if (!qword_267BC7118)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7118);
  }
  return result;
}

unint64_t sub_21833E34C()
{
  unint64_t result = qword_267BC7120;
  if (!qword_267BC7120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7120);
  }
  return result;
}

ValueMetadata *type metadata accessor for CBORCodableWrapper()
{
  return &type metadata for CBORCodableWrapper;
}

ValueMetadata *type metadata accessor for COSE_Sign1()
{
  return &type metadata for COSE_Sign1;
}

uint64_t destroy for COSE_Sign1.X509Hash(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void *)(a1 + 24);
  return sub_218337168(v2, v3);
}

void *initializeWithCopy for COSE_Sign1.X509Hash(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  unint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  sub_218337DAC(v4, v5);
  a1[2] = v4;
  a1[3] = v5;
  return a1;
}

void *assignWithCopy for COSE_Sign1.X509Hash(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[2];
  unint64_t v4 = a2[3];
  sub_218337DAC(v5, v4);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  a1[2] = v5;
  a1[3] = v4;
  sub_218337168(v6, v7);
  return a1;
}

void *assignWithTake for COSE_Sign1.X509Hash(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a1[2];
  unint64_t v6 = a1[3];
  *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
  sub_218337168(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for COSE_Sign1.X509Hash(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for COSE_Sign1.X509Hash(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for COSE_Sign1.X509Hash()
{
  return &type metadata for COSE_Sign1.X509Hash;
}

ValueMetadata *type metadata accessor for COSE_Mac0()
{
  return &type metadata for COSE_Mac0;
}

ValueMetadata *type metadata accessor for COSEKey()
{
  return &type metadata for COSEKey;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CBOR.InitError()
{
  return &type metadata for CBOR.InitError;
}

uint64_t getEnumTagSinglePayload for CBOREncoder.DateEncodingStrategy(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s9InitErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x21833E738);
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

uint64_t sub_21833E760(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21833E768(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for COSE_Sign1.X509Hash.CodingKeys()
{
  return &type metadata for COSE_Sign1.X509Hash.CodingKeys;
}

unint64_t sub_21833E788()
{
  unint64_t result = qword_267BC7128;
  if (!qword_267BC7128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7128);
  }
  return result;
}

unint64_t sub_21833E7E0()
{
  unint64_t result = qword_267BC7130;
  if (!qword_267BC7130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7130);
  }
  return result;
}

unint64_t sub_21833E838()
{
  unint64_t result = qword_267BC7138;
  if (!qword_267BC7138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7138);
  }
  return result;
}

char *sub_21833E88C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267BC7148);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_21833E988(uint64_t result, unint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = HIBYTE(a2) & 0xF;
  uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v6) {
    return v3;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_21833D8F8(v3, a2, 8);
    swift_bridgeObjectRelease();
    return v3;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0) {
      int64_t v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      int64_t v7 = (unsigned __int8 *)sub_218354870();
    }
    sub_21833D9E0(v7, v5, 8);
    return v3;
  }
  v24[0] = result;
  v24[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result == 43)
  {
    if (v4)
    {
      if (v4 != 1 && (BYTE1(result) & 0xF8) == 0x30)
      {
        uint64_t v14 = (BYTE1(result) - 48);
        uint64_t v15 = v4 - 2;
        if (v15)
        {
          uint64_t v16 = (char *)v24 + 2;
          do
          {
            if ((*v16 & 0xF8) != 0x30 || (unint64_t)(v14 - 0x1000000000000000) >> 61 != 7) {
              break;
            }
            unsigned __int8 v18 = *v16 - 48;
            BOOL v13 = __OFADD__(8 * v14, v18);
            uint64_t v14 = 8 * v14 + v18;
            if (v13) {
              break;
            }
            ++v16;
            --v15;
          }
          while (v15);
        }
      }
      return v3;
    }
  }
  else
  {
    if (result != 45)
    {
      if (v4)
      {
        if ((result & 0xF8) == 0x30)
        {
          uint64_t v19 = (result - 48);
          uint64_t v20 = v4 - 1;
          if (v20)
          {
            uint64_t v21 = (char *)v24 + 1;
            do
            {
              if ((*v21 & 0xF8) != 0x30 || (unint64_t)(v19 - 0x1000000000000000) >> 61 != 7) {
                break;
              }
              unsigned __int8 v23 = *v21 - 48;
              BOOL v13 = __OFADD__(8 * v19, v23);
              uint64_t v19 = 8 * v19 + v23;
              if (v13) {
                break;
              }
              ++v21;
              --v20;
            }
            while (v20);
          }
        }
      }
      return v3;
    }
    if (v4)
    {
      if (v4 != 1 && (BYTE1(result) & 0xF8) == 0x30)
      {
        uint64_t v8 = -(uint64_t)(BYTE1(result) - 48);
        uint64_t v9 = v4 - 2;
        if (v9)
        {
          uint64_t v10 = (char *)v24 + 2;
          do
          {
            if ((*v10 & 0xF8) != 0x30 || (unint64_t)(v8 - 0x1000000000000000) >> 61 != 7) {
              break;
            }
            unsigned __int8 v12 = *v10 - 48;
            BOOL v13 = __OFSUB__(8 * v8, v12);
            uint64_t v8 = 8 * v8 - v12;
            if (v13) {
              break;
            }
            ++v10;
            --v9;
          }
          while (v9);
        }
      }
      return v3;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21833EBEC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000013 && a2 == 0x8000000218357320 || (sub_218354C10() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_218354C10();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_21833ECD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for CBORCodingKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CBORCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CBORCodingKey(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CBORCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CBORCodingKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CBORCodingKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CBORCodingKey()
{
  return &type metadata for CBORCodingKey;
}

unint64_t sub_21833EED8()
{
  unint64_t result = qword_267BC7158;
  if (!qword_267BC7158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7158);
  }
  return result;
}

unint64_t sub_21833EF30()
{
  unint64_t result = qword_267BC7160;
  if (!qword_267BC7160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7160);
  }
  return result;
}

unint64_t sub_21833EF88()
{
  unint64_t result = qword_267BC7168;
  if (!qword_267BC7168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7168);
  }
  return result;
}

id sub_21833F01C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _CBORDictionary();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t (*sub_21833F0A0())()
{
  return j_j__swift_endAccess;
}

uint64_t CBOREncoder.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 24) = 2;
  *(unsigned char *)(v0 + 32) = 0;
  return v0;
}

uint64_t CBOREncoder.init()()
{
  *(void *)(v0 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
  *(void *)(v0 + 24) = 2;
  *(unsigned char *)(v0 + 32) = 0;
  return v0;
}

uint64_t CBOREncoder.__allocating_init(userInfo:dictionaryEncodingStrategy:dateEncodingStrategy:)(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t result = swift_allocObject();
  uint64_t v7 = *a2;
  char v8 = *a3;
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = v7;
  *(unsigned char *)(result + 32) = v8;
  return result;
}

uint64_t CBOREncoder.init(userInfo:dictionaryEncodingStrategy:dateEncodingStrategy:)(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t v4 = *a2;
  char v5 = *a3;
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = v4;
  *(unsigned char *)(v3 + 32) = v5;
  return v3;
}

uint64_t sub_21833F1D8()
{
  (*(void (**)(unint64_t *__return_ptr))(*(void *)v0 + 176))(&v2);
  if (v2 < 4) {
    return qword_218356DE8[v2];
  }
  switch(*(void *)(v2 + 16))
  {
    case 0:
    case 1:
    case 2:
      sub_218340990(v2);
      uint64_t result = 0;
      break;
    case 3:
      sub_218340990(v2);
      uint64_t result = 1;
      break;
    default:
      sub_218354950();
      __break(1u);
      JUMPOUT(0x21833F2C4);
  }
  return result;
}

void *sub_21833F2D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t, uint64_t))(*(void *)v3 + 168))(a1, 0, 1, a2, a3);
  if (!v4)
  {
    id v6 = result;
    uint64_t v7 = sub_21833F1D8();
    id v8 = objc_msgSend(self, sel_dataWithCBOR_encodingKeyOrder_, v6, v7);

    uint64_t v9 = sub_2183545B0();
    return (void *)v9;
  }
  return result;
}

void *sub_21833F3A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)v4 + 168))(a1, a2, 0, a3, a4);
  if (!v5)
  {
    id v7 = result;
    uint64_t v8 = sub_21833F1D8();
    id v9 = objc_msgSend(self, sel_dataWithCBOR_encodingKeyOrder_, v7, v8);

    uint64_t v10 = sub_2183545B0();
    return (void *)v10;
  }
  return result;
}

void (*sub_21833F468(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5))(uint64_t *, uint64_t, uint64_t)
{
  LODWORD(v42) = a3;
  uint64_t v41 = a2;
  uint64_t v9 = sub_218354850();
  uint64_t v47 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  unsigned __int8 v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _CBOREncoder();
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  uint64_t v14 = MEMORY[0x263F8EE78];
  *(void *)(v13 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v13 + 24) = v14;
  swift_weakAssign();
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  uint64_t v15 = __swift_allocate_boxed_opaque_existential_1Tm(&v43);
  uint64_t v16 = *(void *)(a4 - 8);
  unint64_t v17 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v18 = v16 + 16;
  v17(v15, a1, a4);
  sub_21833F9B0(&v43);
  if (v5)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v43);
    return v17;
  }
  uint64_t v20 = v19;
  uint64_t v39 = v18;
  int64_t v40 = v17;
  uint64_t v37 = a1;
  uint64_t v38 = (void (*)(uint64_t *, uint64_t, uint64_t))v9;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v43);
  if (!v20)
  {
    uint64_t v43 = 0;
    unint64_t v44 = 0xE000000000000000;
    sub_2183547E0();
    swift_bridgeObjectRelease();
    uint64_t v43 = 0x6576656C20706F54;
    unint64_t v44 = 0xEA0000000000206CLL;
    sub_218354F30();
    sub_218354680();
    swift_bridgeObjectRelease();
    sub_218354680();
    unsigned __int8 v24 = v12;
    sub_218354810();
    uint64_t v25 = sub_218354860();
    swift_allocError();
    unint64_t v27 = v26;
    char v28 = (char *)v26 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC7170) + 48);
    v27[3] = a4;
    boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v27);
    v40(boxed_opaque_existential_1Tm, v37, a4);
    uint64_t v30 = v47;
    unint64_t v17 = v38;
    (*(void (**)(char *, char *, void))(v47 + 16))(v28, v24, v38);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, *MEMORY[0x263F8DCE0], v25);
    swift_willThrow();
LABEL_10:
    swift_release();
    (*(void (**)(char *, void (*)(uint64_t *, uint64_t, uint64_t)))(v30 + 8))(v24, v17);
    return v17;
  }
  self;
  uint64_t v21 = swift_dynamicCastObjCClass();
  uint64_t v22 = v40;
  if (!v21)
  {
    unsigned __int8 v24 = v12;
    uint64_t v43 = 0;
    unint64_t v44 = 0xE000000000000000;
    sub_2183547E0();
    swift_bridgeObjectRelease();
    uint64_t v43 = 0x6576656C20706F54;
    unint64_t v44 = 0xEA0000000000206CLL;
    sub_218354F30();
    sub_218354680();
    swift_bridgeObjectRelease();
    sub_218354680();
    sub_218354810();
    uint64_t v31 = sub_218354860();
    swift_allocError();
    uint64_t v33 = v32;
    uint64_t v42 = (char *)v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC7170) + 48);
    v33[3] = a4;
    BOOL v34 = __swift_allocate_boxed_opaque_existential_1Tm(v33);
    v22(v34, v37, a4);
    uint64_t v30 = v47;
    unint64_t v17 = v38;
    (*(void (**)(char *, char *, void))(v47 + 16))(v42, v24, v38);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v31 - 8) + 104))(v33, *MEMORY[0x263F8DCE0], v31);
    swift_willThrow();
    swift_unknownObjectRelease();
    goto LABEL_10;
  }
  swift_unknownObjectRetain();
  self;
  unint64_t v17 = (void (*)(uint64_t *, uint64_t, uint64_t))swift_dynamicCastObjCClassUnconditional();
  if ((v42 & 1) == 0)
  {
    id v23 = objc_msgSend(self, sel_cborWithInteger_, v41);
    objc_msgSend(v17, sel_setTag_, v23);
  }
  swift_release();
  swift_unknownObjectRelease();
  return v17;
}

uint64_t type metadata accessor for _CBOREncoder()
{
  return self;
}

void sub_21833F9B0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_218354850();
  uint64_t v92 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)v76 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2183545E0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v11);
  uint64_t v13 = (char *)v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t DynamicType = swift_getDynamicType();
  if (DynamicType != v9)
  {
    uint64_t v15 = (ValueMetadata *)DynamicType;
    if (DynamicType == MEMORY[0x263F06F78] || DynamicType == sub_218335690(0, &qword_26ACFE800))
    {
      sub_2183369A0((uint64_t)a1, (uint64_t)v89);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7E0);
      swift_dynamicCast();
      long long v21 = v87;
      sub_218337DAC(v87, *((unint64_t *)&v87 + 1));
      uint64_t v22 = (void *)sub_2183545A0();
      objc_msgSend(self, sel_cborWithData_, v22);
      sub_218337168(v21, *((unint64_t *)&v21 + 1));

      sub_218337168(v21, *((unint64_t *)&v21 + 1));
      return;
    }
    if (v15 == &type metadata for CBORCodableWrapper)
    {
      sub_2183369A0((uint64_t)a1, (uint64_t)v89);
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7E0);
      swift_dynamicCast();
      return;
    }
    uint64_t v83 = v5;
    uint64_t v16 = (void *)(v3 + 16);
    swift_beginAccess();
    unint64_t v17 = *(void *)(v3 + 16);
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_218354960();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v19 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    uint64_t v90 = type metadata accessor for _CBOREncoder();
    uint64_t v91 = sub_2183488EC(qword_26ACFE748, (void (*)(uint64_t))type metadata accessor for _CBOREncoder);
    v89[0] = v3;
    swift_retain();
    sub_218354610();
    uint64_t v84 = v2;
    if (v2)
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
      if (*v16 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v72 = sub_218354960();
        swift_bridgeObjectRelease();
        if (v18 >= v72) {
          goto LABEL_14;
        }
      }
      else if (v18 >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_14:
        swift_willThrow();
        return;
      }
      swift_beginAccess();
      if (*v16 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v74 = sub_218354960();
        swift_bridgeObjectRelease();
        if (v74)
        {
LABEL_12:
          sub_21834853C();
          if (v20)
          {
            swift_endAccess();
            swift_unknownObjectRelease();
            goto LABEL_14;
          }
          goto LABEL_75;
        }
      }
      else if (*(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_12;
      }
      __break(1u);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
      if (*v16 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v73 = sub_218354960();
        swift_bridgeObjectRelease();
        if (v18 >= v73) {
          return;
        }
      }
      else if (v18 >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        return;
      }
      swift_beginAccess();
      if (!(*v16 >> 62))
      {
        if (!*(void *)((*v16 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_72:
          __break(1u);
          goto LABEL_73;
        }
        goto LABEL_25;
      }
    }
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_218354960();
    swift_bridgeObjectRelease();
    if (!v75) {
      goto LABEL_72;
    }
LABEL_25:
    sub_21834853C();
    if (!v28)
    {
LABEL_76:
      __break(1u);
      return;
    }
    uint64_t v29 = v28;
    swift_endAccess();
    type metadata accessor for _CBORDictionary();
    swift_unknownObjectRetain();
    uint64_t v30 = swift_dynamicCastClass();
    if (!v30)
    {
      v89[0] = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7E8);
      if (!swift_dynamicCast()) {
        return;
      }
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      uint64_t v35 = (void *)sub_218354720();
      swift_bridgeObjectRelease();
      objc_msgSend(self, sel_cborWithArray_, v35);
      swift_unknownObjectRelease();
LABEL_36:

      return;
    }
    uint64_t v31 = v30;
    sub_2183369A0((uint64_t)a1, (uint64_t)&v87);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7E0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      uint64_t v86 = 0;
      memset(v85, 0, sizeof(v85));
      sub_218335828((uint64_t)v85, &qword_26ACFE7D8);
      goto LABEL_35;
    }
    uint64_t v77 = v31;
    sub_218335EE4(v85, (uint64_t)v89);
    uint64_t Strong = swift_weakLoadStrong();
    if (!Strong)
    {
LABEL_31:
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
LABEL_35:
      swift_beginAccess();
      uint64_t v36 = swift_bridgeObjectRetain();
      sub_218341DF8(v36);
      swift_bridgeObjectRelease();
      sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
      sub_218335610();
      uint64_t v35 = (void *)sub_2183545F0();
      swift_bridgeObjectRelease();
      objc_msgSend(self, sel_cborWithDictionary_, v35);
      swift_unknownObjectRelease_n();
      goto LABEL_36;
    }
    uint64_t v33 = Strong;
    (*(void (**)(long long *__return_ptr))(*(void *)Strong + 176))(&v87);
    unint64_t v34 = v87;
    sub_218340990(v87);
    if (v34 < 4)
    {
      swift_release();
      goto LABEL_31;
    }
    uint64_t v37 = v90;
    uint64_t v38 = v91;
    __swift_project_boxed_opaque_existential_1(v89, v90);
    uint64_t v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v38 + 16);
    v76[1] = v33;
    uint64_t v40 = v39(v33, v37, v38);
    uint64_t v19 = v77;
    uint64_t v41 = (void *)(v77
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    BOOL v78 = v41;
    void *v41 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    uint64_t v42 = *(void *)(v40 + 16);
    if (!v42)
    {
      swift_bridgeObjectRelease();
LABEL_55:
      if (!(*v78 >> 62))
      {
        uint64_t v57 = *(void *)((*v78 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_57:
        uint64_t v58 = v19 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
        swift_beginAccess();
        if ((*(void *)v58 & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v59 = sub_218354920();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v59 = *(void *)(*(void *)v58 + 16);
        }
        if (v57 == v59)
        {
          uint64_t v60 = swift_bridgeObjectRetain();
          sub_218341DF8(v60);
          swift_bridgeObjectRelease();
          sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
          sub_218335610();
          swift_bridgeObjectRetain();
          uint64_t v61 = (void *)sub_2183545F0();
          swift_bridgeObjectRelease();
          uint64_t v62 = (void *)sub_218354720();
          swift_bridgeObjectRelease();
          objc_msgSend(self, sel_cborWithDictionary_keyOrderList_, v61, v62);
          swift_release();
          swift_unknownObjectRelease_n();
        }
        else
        {
          swift_beginAccess();
          swift_bridgeObjectRetain();
          sub_218354810();
          uint64_t v63 = sub_218354860();
          swift_allocError();
          id v65 = v64;
          uint64_t v66 = (char *)v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC7170) + 48);
          uint64_t v67 = a1[3];
          uint64_t v68 = __swift_project_boxed_opaque_existential_1(a1, v67);
          v65[3] = v67;
          boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v65);
          (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v67 - 8) + 16))(boxed_opaque_existential_1Tm, v68, v67);
          uint64_t v70 = v92;
          uint64_t v71 = v83;
          (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v66, v8, v83);
          (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v63 - 8) + 104))(v65, *MEMORY[0x263F8DCE0], v63);
          swift_willThrow();
          swift_unknownObjectRelease_n();
          swift_release();
          (*(void (**)(char *, uint64_t))(v70 + 8))(v8, v71);
        }
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v89);
        return;
      }
LABEL_73:
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_218354960();
      swift_bridgeObjectRelease();
      goto LABEL_57;
    }
    id v80 = self;
    v76[0] = v40;
    uint64_t v43 = v40 + 32;
    uint64_t v79 = (uint64_t *)(v19 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    while (1)
    {
      sub_2183369A0(v43, (uint64_t)&v87);
      __swift_project_boxed_opaque_existential_1(&v87, *((uint64_t *)&v88 + 1));
      sub_218354ED0();
      uint64_t v45 = (void *)sub_218354640();
      swift_bridgeObjectRelease();
      id v44 = objc_msgSend(v80, sel_cborWithUTF8String_, v45);

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v87);
      uint64_t v46 = *v79;
      if ((*v79 & 0xC000000000000001) != 0)
      {
        uint64_t v81 = v43;
        uint64_t v47 = v42;
        id v82 = v44;
        id v48 = v44;
        swift_bridgeObjectRetain();
        uint64_t v49 = sub_218354930();
        if (v49)
        {
          uint64_t v50 = v49;
          swift_bridgeObjectRelease();
          uint64_t v42 = v47;
          uint64_t v43 = v81;
LABEL_49:
          id v54 = v82;

          *((void *)&v88 + 1) = swift_getObjectType();
          *(void *)&long long v87 = v50;
          sub_218335828((uint64_t)&v87, &qword_267BC6FC8);
          uint64_t v55 = v78;
          swift_beginAccess();
          id v56 = v54;
          MEMORY[0x21D4676F0]();
          if (*(void *)((*v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_218354760();
          }
          sub_218354770();
          sub_218354750();
          swift_endAccess();

          goto LABEL_42;
        }

        swift_bridgeObjectRelease();
        uint64_t v42 = v47;
        uint64_t v43 = v81;
      }
      else
      {
        if (!*(void *)(v46 + 16)) {
          goto LABEL_41;
        }
        id v82 = v44;
        id v51 = v44;
        swift_bridgeObjectRetain();
        unint64_t v52 = sub_21834A560((uint64_t)v51);
        if (v53)
        {
          uint64_t v50 = *(void *)(*(void *)(v46 + 56) + 8 * v52);
          swift_unknownObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_49;
        }

        swift_bridgeObjectRelease();
      }
      id v44 = v82;
LABEL_41:
      long long v87 = 0u;
      long long v88 = 0u;

      sub_218335828((uint64_t)&v87, &qword_267BC6FC8);
LABEL_42:
      v43 += 40;
      if (!--v42)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = v77;
        goto LABEL_55;
      }
    }
  }
  sub_2183369A0((uint64_t)a1, (uint64_t)v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26ACFE7E0);
  swift_dynamicCast();
  uint64_t v23 = swift_weakLoadStrong();
  if (!v23)
  {
    __break(1u);
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  (*(void (**)(long long *__return_ptr))(*(void *)v23 + 200))(&v87);
  swift_release();
  int v24 = v87;
  uint64_t v25 = (void *)sub_2183545C0();
  uint64_t v26 = self;
  unint64_t v27 = &selRef_cborWithDateTime_;
  if (!v24) {
    unint64_t v27 = &selRef_cborWithFullDate_;
  }
  objc_msgSend(v26, *v27, v25);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t static CBOREncoder.DictionaryEncodingStrategy.== infix(_:_:)(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = *a1;
  unint64_t v3 = *a2;
  switch(*a1)
  {
    case 0uLL:
      if (v3) {
        goto LABEL_13;
      }
      sub_218340990(0);
      unint64_t v4 = 0;
      goto LABEL_12;
    case 1uLL:
      if (v3 != 1) {
        goto LABEL_13;
      }
      char v6 = 1;
      sub_218340990(1uLL);
      sub_218340990(1uLL);
      return v6 & 1;
    case 2uLL:
      if (v3 != 2) {
        goto LABEL_13;
      }
      sub_218340990(2uLL);
      unint64_t v4 = 2;
      goto LABEL_12;
    case 3uLL:
      if (v3 != 3) {
        goto LABEL_13;
      }
      sub_218340990(3uLL);
      unint64_t v4 = 3;
LABEL_12:
      sub_218340990(v4);
      char v6 = 1;
      break;
    default:
      if (v3 < 4)
      {
LABEL_13:
        sub_218340980(*a2);
        sub_218340980(v2);
        sub_218340990(v2);
        sub_218340990(v3);
        char v6 = 0;
      }
      else
      {
        uint64_t v5 = *(void *)(v2 + 16);
        uint64_t v8 = *(void *)(v3 + 16);
        uint64_t v9 = v5;
        sub_218340980(v3);
        sub_218340980(v2);
        char v6 = static CBOREncoder.DictionaryEncodingStrategy.== infix(_:_:)(&v9, &v8);
        sub_218340990(v2);
        sub_218340990(v3);
      }
      break;
  }
  return v6 & 1;
}

unint64_t sub_218340980(unint64_t result)
{
  if (result >= 4) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_218340990(unint64_t result)
{
  if (result >= 4) {
    return swift_release();
  }
  return result;
}

uint64_t CBOREncoder.DictionaryEncodingStrategy.hash(into:)(uint64_t a1)
{
  switch(*v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t result = sub_218354E50();
      break;
    default:
      sub_218354E50();
      uint64_t result = CBOREncoder.DictionaryEncodingStrategy.hash(into:)(a1);
      break;
  }
  return result;
}

uint64_t CBOREncoder.DictionaryEncodingStrategy.hashValue.getter()
{
  v2[9] = *v0;
  sub_218354E40();
  CBOREncoder.DictionaryEncodingStrategy.hash(into:)((uint64_t)v2);
  return sub_218354E70();
}

uint64_t sub_218340AA4()
{
  v2[9] = *v0;
  sub_218354E40();
  CBOREncoder.DictionaryEncodingStrategy.hash(into:)((uint64_t)v2);
  return sub_218354E70();
}

uint64_t sub_218340AF4()
{
  v2[9] = *v0;
  sub_218354E40();
  CBOREncoder.DictionaryEncodingStrategy.hash(into:)((uint64_t)v2);
  return sub_218354E70();
}

unint64_t sub_218340B3C@<X0>(unint64_t *a1@<X8>)
{
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  *a1 = v3;
  return sub_218340980(v3);
}

unint64_t sub_218340B84(uint64_t *a1)
{
  uint64_t v2 = *a1;
  swift_beginAccess();
  unint64_t v3 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = v2;
  return sub_218340990(v3);
}

uint64_t (*sub_218340BCC())()
{
  return j_j__swift_endAccess;
}

BOOL static CBOREncoder.DateEncodingStrategy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t CBOREncoder.DateEncodingStrategy.hash(into:)()
{
  return sub_218354E50();
}

uint64_t CBOREncoder.DateEncodingStrategy.hashValue.getter()
{
  return sub_218354E70();
}

uint64_t sub_218340CAC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_beginAccess();
  *a1 = *(unsigned char *)(v1 + 32);
  return result;
}

uint64_t sub_218340CF0(char *a1)
{
  char v2 = *a1;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 32) = v2;
  return result;
}

uint64_t (*sub_218340D30())()
{
  return j__swift_endAccess;
}

uint64_t CBOREncoder.deinit()
{
  swift_bridgeObjectRelease();
  sub_218340990(*(void *)(v0 + 24));
  return v0;
}

uint64_t CBOREncoder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  sub_218340990(*(void *)(v0 + 24));
  return MEMORY[0x270FA0228](v0, 33, 7);
}

unint64_t sub_218340DF0()
{
  unint64_t result = qword_267BC7178;
  if (!qword_267BC7178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7178);
  }
  return result;
}

unint64_t sub_218340E48()
{
  unint64_t result = qword_267BC7180;
  if (!qword_267BC7180)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC7180);
  }
  return result;
}

uint64_t sub_218340E9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)v1 + 152))();
  if (!v2)
  {
    *a1 = result;
    a1[1] = v5;
  }
  return result;
}

uint64_t sub_218340EEC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_218340F38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 112);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void *sub_218340F8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 176))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_218340FE8(unint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v5 = *a1;
  uint64_t v3 = *(uint64_t (**)(unint64_t *))(*(void *)v2 + 184);
  sub_218340980(v5);
  return v3(&v5);
}

void *sub_21834104C@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 200))(&v4);
  *a2 = v4;
  return result;
}

uint64_t sub_2183410A8(char *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  char v4 = *a1;
  return (*(uint64_t (**)(char *))(*(void *)v2 + 208))(&v4);
}

uint64_t type metadata accessor for _CBORDictionary()
{
  return self;
}

uint64_t dispatch thunk of ExplicitKeyOrderedEncodable.explicitOrderingKeys(cborEncoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for CBOREncoder()
{
  return self;
}

uint64_t method lookup function for CBOREncoder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CBOREncoder);
}

uint64_t dispatch thunk of CBOREncoder.userInfo.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of CBOREncoder.userInfo.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of CBOREncoder.userInfo.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of CBOREncoder.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CBOREncoder.__allocating_init(userInfo:dictionaryEncodingStrategy:dateEncodingStrategy:)()
{
  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of CBOREncoder.encode<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of CBOREncoder.encode<A>(_:tag:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of CBOREncoder.encodeToCBOR<A>(_:tag:)(uint64_t a1, uint64_t a2, char a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v3 + 168))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of CBOREncoder.dictionaryEncodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of CBOREncoder.dateEncodingStrategy.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of CBOREncoder.dateEncodingStrategy.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of CBOREncoder.dateEncodingStrategy.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t *initializeBufferWithCopyOfBuffer for CBOREncoder.DictionaryEncodingStrategy(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_retain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for CBOREncoder.DictionaryEncodingStrategy(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_release();
  }
  return result;
}

unint64_t *assignWithCopy for CBOREncoder.DictionaryEncodingStrategy(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_retain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_retain();
    swift_release();
  }
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

unint64_t *assignWithTake for CBOREncoder.DictionaryEncodingStrategy(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_6;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_release();
LABEL_6:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CBOREncoder.DictionaryEncodingStrategy(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFC && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483644);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 3;
  if (v4 >= 5) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CBOREncoder.DictionaryEncodingStrategy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFC) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 3;
    }
  }
  return result;
}

uint64_t sub_218341594(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_2183415AC(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CBOREncoder.DictionaryEncodingStrategy()
{
  return &type metadata for CBOREncoder.DictionaryEncodingStrategy;
}

unsigned char *storeEnumTagSinglePayload for CBOREncoder.DateEncodingStrategy(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2183416A8);
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

ValueMetadata *type metadata accessor for CBOREncoder.DateEncodingStrategy()
{
  return &type metadata for CBOREncoder.DateEncodingStrategy;
}

BOOL sub_2183416E0()
{
  swift_beginAccess();
  unint64_t v1 = *(void *)(v0 + 16);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_218354960();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_beginAccess();
  return v2 == *(void *)(*(void *)(v0 + 24) + 16);
}

uint64_t sub_218341784()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2183417CC()
{
  unint64_t v1 = v0 + 2;
  if ((*(uint64_t (**)(void))(*v0 + 184))())
  {
    swift_beginAccess();
    sub_2183419C0();
    swift_endAccess();
LABEL_11:
    swift_beginAccess();
    type metadata accessor for _CBOREncoderKeyContainer();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    return sub_218354A00();
  }
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_5;
    }
LABEL_13:
    unint64_t v4 = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_218354960();
  if (!v3) {
    goto LABEL_13;
  }
LABEL_5:
  unint64_t v4 = v3 - 1;
  if (__OFSUB__(v3, 1))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if ((v2 & 0xC000000000000001) == 0)
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v4 < *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      swift_unknownObjectRetain();
      goto LABEL_10;
    }
    __break(1u);
    goto LABEL_18;
  }
LABEL_15:
  MEMORY[0x21D4677D0](v4, v2);
LABEL_10:
  swift_bridgeObjectRelease();
  type metadata accessor for _CBORDictionary();
  if (swift_dynamicCastClass()) {
    goto LABEL_11;
  }
LABEL_18:
  uint64_t result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

id sub_2183419C0()
{
  unint64_t v1 = (objc_class *)type metadata accessor for _CBORDictionary();
  uint64_t v2 = (char *)objc_allocWithZone(v1);
  uint64_t v3 = OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
  unint64_t v4 = v2;
  uint64_t v5 = MEMORY[0x263F8EE78];
  *(void *)&v2[v3] = sub_218329968(MEMORY[0x263F8EE78]);
  *(void *)&v4[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList] = v5;
  v4[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] = 0;

  v8.receiver = v4;
  v8.super_class = v1;
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  MEMORY[0x21D4676F0]();
  if (*(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_218354760();
  }
  sub_218354770();
  sub_218354750();
  return v6;
}

uint64_t sub_218341AA8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  unint64_t v4 = v1 + 2;
  if ((*(uint64_t (**)(void))(*v1 + 184))())
  {
    swift_beginAccess();
    id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF980]), sel_init);
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
    goto LABEL_13;
  }
  swift_beginAccess();
  uint64_t v6 = *v4;
  if (!((unint64_t)*v4 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v7) {
      goto LABEL_7;
    }
LABEL_15:
    unint64_t v8 = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_218354960();
  if (!v7) {
    goto LABEL_15;
  }
LABEL_7:
  unint64_t v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v8 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      swift_unknownObjectRetain();
      goto LABEL_12;
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_17:
  MEMORY[0x21D4677D0](v8, v6);
LABEL_12:
  swift_bridgeObjectRelease();
  self;
  id v5 = (id)swift_dynamicCastObjCClass();
  if (v5)
  {
LABEL_13:
    swift_beginAccess();
    uint64_t v9 = v2[3];
    a1[3] = &type metadata for _CBOREncoderUnkeyedContainer;
    a1[4] = sub_2183484D0();
    *a1 = v9;
    a1[1] = v5;
    a1[2] = v2;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
LABEL_20:
  uint64_t result = swift_unknownObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_218341CC8()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = (*(uint64_t (**)(uint64_t))(*(void *)result + 104))(result);
    swift_release();
    return v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_218341D30()
{
  return sub_2183417CC();
}

uint64_t sub_218341D54@<X0>(void *a1@<X8>)
{
  return sub_218341AA8(a1);
}

uint64_t sub_218341D78@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *v1;
  a1[3] = type metadata accessor for _CBOREncoder();
  a1[4] = sub_2183488EC(&qword_26ACFE740, (void (*)(uint64_t))type metadata accessor for _CBOREncoder);
  *a1 = v3;
  return swift_retain();
}

uint64_t sub_218341DF8(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    unint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0) {
      unint64_t v1 = a1;
    }
    uint64_t v2 = ~(v1 >> 1) & 0x4000000000000000 | v1;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
    sub_218335610();
    swift_bridgeObjectRetain();
    unint64_t v3 = sub_218354900();
    return ~(v3 >> 1) & 0x4000000000000000 | v3;
  }
  return v2;
}

void sub_218341EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v7 = &v23[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = *(void *)(v2 + 8);
  uint64_t v9 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  id v10 = sub_218348AE8((uint64_t)v7, v9, v4);
  id v11 = objc_msgSend(self, sel_cborNil);
  if (*(unsigned char *)(v8
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    uint64_t v12 = (uint64_t *)(v8 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v13 = *v12;
    if ((v13 & 0xC000000000000001) != 0)
    {
      id v14 = v10;
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v15)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v13 + 16))
    {
      id v16 = v10;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v16);
      char v18 = v17;

      swift_bridgeObjectRelease();
      if (v18) {
        goto LABEL_10;
      }
    }
    uint64_t v19 = (void *)(v8 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v20 = v10;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v21 = v10;
  id v22 = v11;
  sub_218348608((uint64_t)v22, v21);
  swift_endAccess();
}

void sub_218342158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  uint64_t v13 = self;
  id v14 = &selRef_cborTrue;
  if ((v5 & 1) == 0) {
    id v14 = &selRef_cborFalse;
  }
  id v15 = [v13 *v14];
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v16 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v17 = *v16;
    if ((v17 & 0xC000000000000001) != 0)
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();
        goto LABEL_12;
      }
    }
    else if (*(void *)(v17 + 16))
    {
      id v20 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v20);
      char v22 = v21;

      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_12;
      }
    }
    uint64_t v23 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v24 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_12:
  swift_beginAccess();
  id v25 = v12;
  id v26 = v15;
  sub_218348608((uint64_t)v26, v25);
  swift_endAccess();
}

void sub_218342428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v4 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  uint64_t v12 = v10;
  id v13 = sub_218348AE8((uint64_t)v9, v11, v6);
  swift_bridgeObjectRetain();
  id v14 = (void *)sub_218354640();
  swift_bridgeObjectRelease();
  id v15 = objc_msgSend(self, sel_cborWithUTF8String_, v14);

  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v16 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v17 = *v16;
    if ((v17 & 0xC000000000000001) != 0)
    {
      id v18 = v13;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v17 + 16))
    {
      id v20 = v13;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v20);
      char v22 = v21;

      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_10;
      }
    }
    uint64_t v23 = (void *)(v12
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v24 = v13;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v25 = v13;
  id v26 = v15;
  sub_218348608((uint64_t)v26, v25);
  swift_endAccess();
}

void sub_218342718(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithDouble_, a3);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

void sub_2183429E0(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = self;
  *(float *)&double v14 = a3;
  id v15 = objc_msgSend(v13, sel_cborWithFloat_, v14);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v16 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v17 = *v16;
    if ((v17 & 0xC000000000000001) != 0)
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v17 + 16))
    {
      id v20 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v20);
      char v22 = v21;

      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_10;
      }
    }
    id v23 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v24 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v25 = v12;
  id v26 = v15;
  sub_218348608((uint64_t)v26, v25);
  swift_endAccess();
}

void sub_218342CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithInteger_, v5);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    double v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

void sub_218342F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithInteger_, v5);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    double v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

void sub_218343230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithInteger_, v5);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    double v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

void sub_2183434F4(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v28 = a4;
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v4 + 8);
  uint64_t v12 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a2, v7);
  uint64_t v13 = v11;
  id v14 = sub_218348AE8((uint64_t)v10, v12, v7);
  id v15 = objc_msgSend(self, *v28, a1);
  if (*(unsigned char *)(v13
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v16 = (uint64_t *)(v13 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v17 = *v16;
    if ((v17 & 0xC000000000000001) != 0)
    {
      id v18 = v14;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v19)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v17 + 16))
    {
      id v20 = v14;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v20);
      char v22 = v21;

      swift_bridgeObjectRelease();
      if (v22) {
        goto LABEL_10;
      }
    }
    id v23 = (void *)(v13
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v24 = v14;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v25 = v14;
  id v26 = v15;
  sub_218348608((uint64_t)v26, v25);
  swift_endAccess();
}

void sub_2183437BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithUnsignedInteger_, v5);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

void sub_218343A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int16 v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithUnsignedInteger_, v5);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

void sub_218343D44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5 = a1;
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = *(void *)(v3 + 8);
  uint64_t v11 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  id v12 = sub_218348AE8((uint64_t)v9, v11, v6);
  id v13 = objc_msgSend(self, sel_cborWithUnsignedInteger_, v5);
  if (*(unsigned char *)(v10
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    id v14 = (uint64_t *)(v10 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
    swift_beginAccess();
    uint64_t v15 = *v14;
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v16 = v12;
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v17)
      {
        swift_unknownObjectRelease();
        goto LABEL_10;
      }
    }
    else if (*(void *)(v15 + 16))
    {
      id v18 = v12;
      swift_bridgeObjectRetain();
      sub_21834A560((uint64_t)v18);
      char v20 = v19;

      swift_bridgeObjectRelease();
      if (v20) {
        goto LABEL_10;
      }
    }
    char v21 = (void *)(v10
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v22 = v12;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_10:
  swift_beginAccess();
  id v23 = v12;
  id v24 = v13;
  sub_218348608((uint64_t)v24, v23);
  swift_endAccess();
}

uint64_t sub_218344008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v48 = a4;
  uint64_t v49 = a5;
  uint64_t v50 = a1;
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8, v11);
  id v13 = (char *)&v45 - v12;
  uint64_t v53 = v5;
  uint64_t v14 = *(void *)(v5 + 16);
  uint64_t v15 = *(void (**)(char *))(v7 + 16);
  uint64_t v46 = v16;
  uint64_t v51 = v17;
  v15((char *)&v45 - v12);
  id v18 = (uint64_t *)(v14 + 24);
  swift_beginAccess();
  char v19 = *(void **)(v14 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v14 + 24) = v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    char v19 = sub_21833D6C4(0, v19[2] + 1, 1, v19);
    *id v18 = (uint64_t)v19;
  }
  unint64_t v22 = v19[2];
  unint64_t v21 = v19[3];
  if (v22 >= v21 >> 1) {
    *id v18 = (uint64_t)sub_21833D6C4((void *)(v21 > 1), v22 + 1, 1, v19);
  }
  uint64_t v23 = v51;
  ((void (*)(char *, char *, uint64_t))v15)(v10, v13, v51);
  sub_218348C54(v22, (uint64_t)v10, v18, v23, *(void *)(a3 + 24));
  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v23);
  uint64_t v24 = v53;
  uint64_t v25 = *(void *)(v53 + 8);
  uint64_t v26 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  ((void (*)(char *, uint64_t, uint64_t))v15)(v10, v46, v23);
  id v27 = sub_218348AE8((uint64_t)v10, v26, v23);
  uint64_t v28 = v48;
  v52[3] = v48;
  v52[4] = v49;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v52);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 16))(boxed_opaque_existential_1Tm, v50, v28);
  uint64_t v30 = v47;
  sub_21833F9B0(v52);
  if (v30)
  {

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
    return sub_2183444B0(v24);
  }
  uint64_t v50 = v25;
  if (!v31) {
    id v33 = objc_msgSend(self, sel_cborNil);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v52);
  if (*(unsigned char *)(v50
                + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
  {
    uint64_t v34 = v50 + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
    swift_beginAccess();
    if ((*(void *)v34 & 0xC000000000000001) != 0)
    {
      id v35 = v27;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_218354930();

      swift_bridgeObjectRelease();
      uint64_t v37 = v50;
      if (v36)
      {
        swift_unknownObjectRelease();
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v37 = v50;
      if (*(void *)(*(void *)v34 + 16))
      {
        id v38 = v27;
        swift_bridgeObjectRetain();
        sub_21834A560((uint64_t)v38);
        char v40 = v39;

        swift_bridgeObjectRelease();
        uint64_t v37 = v50;
        if (v40) {
          goto LABEL_18;
        }
      }
    }
    uint64_t v41 = (void *)(v37
                   + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
    swift_beginAccess();
    id v42 = v27;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_218354760();
    }
    sub_218354770();
    sub_218354750();
    swift_endAccess();
  }
LABEL_18:
  swift_beginAccess();
  id v43 = v27;
  uint64_t v44 = swift_unknownObjectRetain();
  sub_218348608(v44, v43);
  swift_endAccess();
  swift_unknownObjectRelease();

  return sub_2183444B0(v53);
}

uint64_t sub_2183444B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  swift_beginAccess();
  uint64_t v2 = *(void **)(v1 + 24);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_21834885C(v2);
    uint64_t v2 = (void *)result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  swift_retain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = v2[2];
  if (v4)
  {
LABEL_4:
    uint64_t v5 = v4 - 1;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(void *)(v1 + 24) = v2;
    swift_endAccess();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_218344564(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  uint64_t v64 = a5;
  uint64_t v10 = *(void *)(a3 + 16);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v66 = &v57[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v12, v14);
  uint64_t v16 = &v57[-v15];
  uint64_t v17 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  uint64_t v62 = a2;
  uint64_t v63 = v11;
  id v65 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v11 + 16);
  v65(v16, a2, v10);
  uint64_t v18 = *(void *)(a3 + 24);
  id v19 = sub_218348AE8((uint64_t)v16, v17, v10);
  char v20 = (uint64_t *)(v6[1] + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
  swift_beginAccess();
  uint64_t v21 = *v20;
  BOOL v22 = (*v20 & 0xC000000000000001) == 0;
  id v67 = v19;
  if (v22)
  {
    if (!*(void *)(v21 + 16)) {
      goto LABEL_10;
    }
    id v25 = v67;
    swift_bridgeObjectRetain();
    unint64_t v26 = sub_21834A560((uint64_t)v25);
    if ((v27 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    uint64_t v24 = *(void *)(*(void *)(v21 + 56) + 8 * v26);
    swift_unknownObjectRetain();

    swift_bridgeObjectRelease();
  }
  else
  {
    id v23 = v19;
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_218354930();

    swift_bridgeObjectRelease();
    if (!v24)
    {
LABEL_10:
      uint64_t v60 = v18;
      uint64_t v61 = a4;
      uint64_t v29 = (objc_class *)type metadata accessor for _CBORDictionary();
      uint64_t v30 = (char *)objc_allocWithZone(v29);
      uint64_t v31 = OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
      uint64_t v32 = v30;
      uint64_t v33 = MEMORY[0x263F8EE78];
      *(void *)&v30[v31] = sub_218329968(MEMORY[0x263F8EE78]);
      *(void *)&v32[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList] = v33;
      v32[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] = 0;

      v69.receiver = v32;
      v69.super_class = v29;
      id v34 = objc_msgSendSuper2(&v69, sel_init);
      id v35 = v34;
      uint64_t v36 = v6[1];
      if (*(unsigned char *)(v36
                    + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder) == 1)
      {
        uint64_t v37 = (uint64_t *)(v36
                        + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
        swift_beginAccess();
        uint64_t v38 = *v37;
        if ((v38 & 0xC000000000000001) != 0)
        {
          id v39 = v67;
          id v40 = v35;
          swift_bridgeObjectRetain();
          uint64_t v41 = sub_218354930();

          swift_bridgeObjectRelease();
          if (v41)
          {
            swift_unknownObjectRelease();
LABEL_22:
            swift_beginAccess();
            id v49 = v67;
            id v28 = v35;
            sub_218348608((uint64_t)v28, v49);
            swift_endAccess();

            uint64_t v18 = v60;
            goto LABEL_23;
          }
        }
        else if (*(void *)(v38 + 16))
        {
          id v43 = v67;
          id v44 = v35;
          swift_bridgeObjectRetain();
          sub_21834A560((uint64_t)v43);
          int v58 = v45;

          swift_bridgeObjectRelease();
          if (v58) {
            goto LABEL_22;
          }
        }
        else
        {
          id v46 = v35;
        }
        uint64_t v59 = v35;
        uint64_t v47 = (void *)(v36
                       + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
        swift_beginAccess();
        id v48 = v67;
        MEMORY[0x21D4676F0]();
        if (*(void *)((*v47 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v47 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_218354760();
        }
        sub_218354770();
        sub_218354750();
        swift_endAccess();
        id v35 = v59;
        goto LABEL_22;
      }
      id v42 = v34;
      goto LABEL_22;
    }
  }
  uint64_t ObjectType = swift_getObjectType();
  *(void *)&long long v70 = v24;
  sub_218335884(&v70, &v72);
  sub_21833ECD8((uint64_t)&v72, (uint64_t)&v70);
  type metadata accessor for _CBORDictionary();
  if (!swift_dynamicCast())
  {
    __break(1u);
    return;
  }

  sub_218335884(&v72, &v70);
  swift_dynamicCast();
  id v28 = v68;
LABEL_23:
  v65(v66, v62, v10);
  uint64_t v50 = (void *)*v6;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v6 = (uint64_t)v50;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v50 = sub_21833D6C4(0, v50[2] + 1, 1, v50);
    *uint64_t v6 = (uint64_t)v50;
  }
  unint64_t v53 = v50[2];
  unint64_t v52 = v50[3];
  if (v53 >= v52 >> 1) {
    *uint64_t v6 = (uint64_t)sub_21833D6C4((void *)(v52 > 1), v53 + 1, 1, v50);
  }
  id v54 = v66;
  v65(v16, (uint64_t)v66, v10);
  sub_218348C54(v53, (uint64_t)v16, v6, v10, v18);
  (*(void (**)(unsigned char *, uint64_t))(v63 + 8))(v54, v10);
  uint64_t v55 = v6[2];
  *(void *)&long long v72 = *v6;
  *((void *)&v72 + 1) = v28;
  uint64_t v73 = v55;
  type metadata accessor for _CBOREncoderKeyContainer();
  swift_retain();
  swift_bridgeObjectRetain();
  id v56 = v28;
  swift_getWitnessTable();
  sub_218354A00();
  sub_218344BBC(v6);
}

uint64_t sub_218344BBC(void *a1)
{
  uint64_t v2 = (void *)*a1;
  if (!*(void *)(*a1 + 16))
  {
    __break(1u);
LABEL_6:
    uint64_t result = (uint64_t)sub_21834885C(v2);
    uint64_t v2 = (void *)result;
    uint64_t v4 = *(void *)(result + 16);
    if (v4) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v1 = a1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = v2[2];
  if (v4)
  {
LABEL_4:
    uint64_t v5 = v4 - 1;
    uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *uint64_t v1 = v2;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_218344C3C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10, v13);
  uint64_t v15 = (char *)&v54 - v14;
  uint64_t v16 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  uint64_t v58 = v9;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v56 = a1;
  uint64_t v59 = v17;
  v17(v15, a1, v8);
  uint64_t v57 = *(void *)(a2 + 24);
  id v18 = sub_218348AE8((uint64_t)v15, v16, v8);
  id v19 = (uint64_t *)(v4[1] + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
  swift_beginAccess();
  uint64_t v20 = *v19;
  id v60 = v18;
  if ((v20 & 0xC000000000000001) != 0)
  {
    id v21 = v18;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_218354930();

    swift_bridgeObjectRelease();
    if (!v22)
    {
LABEL_10:
      id v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF980]), sel_init);
      uint64_t v30 = v29;
      uint64_t v31 = v4[1];
      int v32 = *(unsigned __int8 *)(v31
                               + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder);
      uint64_t v55 = v12;
      if (v32 == 1)
      {
        uint64_t v33 = (uint64_t *)(v31
                        + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content);
        swift_beginAccess();
        uint64_t v34 = *v33;
        id v35 = v60;
        if ((v34 & 0xC000000000000001) != 0)
        {
          id v36 = v60;
          id v37 = v30;
          swift_bridgeObjectRetain();
          uint64_t v38 = sub_218354930();

          id v35 = v60;
          swift_bridgeObjectRelease();
          if (v38)
          {
            swift_unknownObjectRelease();
LABEL_22:
            swift_beginAccess();
            id v47 = v35;
            id v28 = v30;
            sub_218348608((uint64_t)v28, v47);
            swift_endAccess();

            char v27 = v59;
            uint64_t v12 = v55;
            goto LABEL_23;
          }
        }
        else if (*(void *)(v34 + 16))
        {
          id v40 = v60;
          id v41 = v30;
          swift_bridgeObjectRetain();
          sub_21834A560((uint64_t)v40);
          char v43 = v42;

          id v35 = v60;
          swift_bridgeObjectRelease();
          if (v43) {
            goto LABEL_22;
          }
        }
        else
        {
          id v44 = v30;
        }
        id v54 = v30;
        int v45 = (void *)(v31
                       + OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList);
        swift_beginAccess();
        id v46 = v35;
        MEMORY[0x21D4676F0]();
        if (*(void *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_218354760();
        }
        sub_218354770();
        sub_218354750();
        swift_endAccess();
        uint64_t v30 = v54;
        goto LABEL_22;
      }
      id v39 = v29;
      id v35 = v60;
      goto LABEL_22;
    }
  }
  else
  {
    if (!*(void *)(v20 + 16)) {
      goto LABEL_10;
    }
    id v23 = v60;
    swift_bridgeObjectRetain();
    unint64_t v24 = sub_21834A560((uint64_t)v23);
    if ((v25 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    uint64_t v22 = *(void *)(*(void *)(v20 + 56) + 8 * v24);
    swift_unknownObjectRetain();

    swift_bridgeObjectRelease();
  }
  uint64_t ObjectType = swift_getObjectType();
  *(void *)&long long v62 = v22;
  sub_218335884(&v62, v64);
  sub_21833ECD8((uint64_t)v64, (uint64_t)&v62);
  sub_218335690(0, qword_267BC71B0);
  int v26 = swift_dynamicCast();
  char v27 = v59;
  if (!v26)
  {
    __break(1u);
    return;
  }

  sub_218335884(v64, &v62);
  swift_dynamicCast();
  id v28 = v61;
LABEL_23:
  v27(v12, v56, v8);
  id v48 = (void *)*v4;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v4 = (uint64_t)v48;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v48 = sub_21833D6C4(0, v48[2] + 1, 1, v48);
    *uint64_t v4 = (uint64_t)v48;
  }
  unint64_t v51 = v48[2];
  unint64_t v50 = v48[3];
  if (v51 >= v50 >> 1) {
    *uint64_t v4 = (uint64_t)sub_21833D6C4((void *)(v50 > 1), v51 + 1, 1, v48);
  }
  v27(v15, (uint64_t)v12, v8);
  sub_218348C54(v51, (uint64_t)v15, v4, v8, v57);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v12, v8);
  uint64_t v52 = *v4;
  uint64_t v53 = v4[2];
  a3[3] = (uint64_t)&type metadata for _CBOREncoderUnkeyedContainer;
  a3[4] = sub_2183484D0();
  *a3 = v52;
  a3[1] = (uint64_t)v28;
  a3[2] = v53;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_218344BBC(v4);
}

uint64_t sub_2183451D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_retain();
  uint64_t result = sub_21833E988(0x7265707573, 0xE500000000000000);
  if (v5)
  {
    uint64_t v8 = result;
    uint64_t v9 = v5;
    uint64_t v10 = v6;
    char v11 = v7 & 1;
    uint64_t v12 = *(void **)(v1 + 8);
    uint64_t v13 = type metadata accessor for _CBORReferenceEncoder();
    uint64_t v14 = swift_allocObject();
    uint64_t v15 = sub_218348FD4(v3, v8, v9, v10, v11, v12, v14);
    swift_bridgeObjectRelease();
    a1[3] = v13;
    uint64_t result = sub_2183488EC(&qword_267BC71A8, (void (*)(uint64_t))type metadata accessor for _CBORReferenceEncoder);
    a1[4] = result;
    *a1 = v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2183452DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v7 = type metadata accessor for _CBORReferenceEncoder();
  uint64_t v9 = *(void **)(v3 + 8);
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v11 = *(void *)(a2 + 16);
  uint64_t v10 = *(void *)(a2 + 24);
  swift_retain();
  uint64_t v12 = sub_21834925C(v8, a1, v9, v7, v11, v10);
  a3[3] = v7;
  uint64_t result = sub_2183488EC(&qword_267BC71A8, (void (*)(uint64_t))type metadata accessor for _CBORReferenceEncoder);
  a3[4] = result;
  *a3 = v12;
  return result;
}

void sub_21834539C(uint64_t a1, uint64_t a2)
{
}

void sub_2183453B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2183453CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_2183453E4(uint64_t a1, uint64_t a2, double a3)
{
}

void sub_2183453FC(uint64_t a1, uint64_t a2, float a3)
{
}

void sub_218345414(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_218345434(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_21834544C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_218345464(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_21834547C()
{
  return sub_218354DD0();
}

void sub_218345494(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2183454B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2183454CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2183454E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_2183454FC()
{
  return sub_218354DE0();
}

uint64_t sub_218345514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_218344008(a1, a2, a5, a3, a4);
}

uint64_t sub_21834553C()
{
  return sub_218354DC0();
}

uint64_t sub_218345568()
{
  return sub_218354D30();
}

uint64_t sub_218345580()
{
  return sub_218354D20();
}

uint64_t sub_218345598()
{
  return sub_218354D40();
}

uint64_t sub_2183455B4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2183457A8(a1, a2, a3, a4, MEMORY[0x263F8E3C0]);
}

uint64_t sub_2183455E0()
{
  return sub_218354D50();
}

uint64_t sub_2183455FC(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_218345700(a1, a2, a3, a4, MEMORY[0x263F8E3D8]);
}

uint64_t sub_218345628(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_218345754(a1, a2, a3, a4, MEMORY[0x263F8E3E0]);
}

uint64_t sub_218345654(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2183457A8(a1, a2, a3, a4, MEMORY[0x263F8E3E8]);
}

uint64_t sub_218345680()
{
  return sub_218354D80();
}

uint64_t sub_21834569C()
{
  return sub_218354D90();
}

uint64_t sub_2183456B8()
{
  return sub_218354D60();
}

uint64_t sub_2183456D4(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_218345700(a1, a2, a3, a4, MEMORY[0x263F8E3F8]);
}

uint64_t sub_218345700(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_218345728(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_218345754(a1, a2, a3, a4, MEMORY[0x263F8E408]);
}

uint64_t sub_218345754(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_21834577C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2183457A8(a1, a2, a3, a4, MEMORY[0x263F8E410]);
}

uint64_t sub_2183457A8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_2183457D8()
{
  return sub_218354DA0();
}

uint64_t sub_2183457F4()
{
  return sub_218354DB0();
}

uint64_t sub_218345810()
{
  return sub_218354D70();
}

void sub_21834583C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
}

uint64_t sub_21834585C(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  *(void *)&long long v16 = 0x3A6D657449;
  *((void *)&v16 + 1) = 0xE500000000000000;
  id v19 = objc_msgSend(v4, sel_count);
  sub_218354A10();
  sub_218354680();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)(v5 + 24);
  swift_beginAccess();
  uint64_t v7 = *(void **)(v5 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v5 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_21833D6C4(0, v7[2] + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = sub_21833D6C4((void *)(v9 > 1), v10 + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  uint64_t v17 = &type metadata for CBORCodingKey;
  unint64_t v18 = sub_218335E58();
  uint64_t v11 = swift_allocObject();
  *(void *)&long long v16 = v11;
  *(void *)(v11 + 16) = 0x3A6D657449;
  *(void *)(v11 + 24) = 0xE500000000000000;
  *(void *)(v11 + 32) = 0;
  *(unsigned char *)(v11 + 40) = 1;
  v7[2] = v10 + 1;
  sub_218335EE4(&v16, (uint64_t)&v7[5 * v10 + 4]);
  uint64_t v17 = (ValueMetadata *)MEMORY[0x263F8D538];
  unint64_t v18 = MEMORY[0x263F8D548];
  *(double *)&long long v16 = a1;
  sub_21833F9B0(&v16);
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
    return sub_2183444B0(v2);
  }
  uint64_t v13 = v12;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
  if (v13)
  {
    objc_msgSend(v4, sel_addObject_, v13);
    swift_unknownObjectRelease();
    return sub_2183444B0(v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_218345A60(float a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  *(void *)&long long v16 = 0x3A6D657449;
  *((void *)&v16 + 1) = 0xE500000000000000;
  id v19 = objc_msgSend(v4, sel_count);
  sub_218354A10();
  sub_218354680();
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)(v5 + 24);
  swift_beginAccess();
  uint64_t v7 = *(void **)(v5 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v5 + 24) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v7 = sub_21833D6C4(0, v7[2] + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  unint64_t v10 = v7[2];
  unint64_t v9 = v7[3];
  if (v10 >= v9 >> 1)
  {
    uint64_t v7 = sub_21833D6C4((void *)(v9 > 1), v10 + 1, 1, v7);
    *uint64_t v6 = v7;
  }
  uint64_t v17 = &type metadata for CBORCodingKey;
  unint64_t v18 = sub_218335E58();
  uint64_t v11 = swift_allocObject();
  *(void *)&long long v16 = v11;
  *(void *)(v11 + 16) = 0x3A6D657449;
  *(void *)(v11 + 24) = 0xE500000000000000;
  *(void *)(v11 + 32) = 0;
  *(unsigned char *)(v11 + 40) = 1;
  v7[2] = v10 + 1;
  sub_218335EE4(&v16, (uint64_t)&v7[5 * v10 + 4]);
  uint64_t v17 = (ValueMetadata *)MEMORY[0x263F8D5C8];
  unint64_t v18 = MEMORY[0x263F8D5D8];
  *(float *)&long long v16 = a1;
  sub_21833F9B0(&v16);
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
    return sub_2183444B0(v2);
  }
  uint64_t v13 = v12;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v16);
  if (v13)
  {
    objc_msgSend(v4, sel_addObject_, v13);
    swift_unknownObjectRelease();
    return sub_2183444B0(v2);
  }
  __break(1u);
  return result;
}

uint64_t sub_218345C64(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v3 + 16);
  id v18 = *(id *)(v3 + 8);
  *(void *)&long long v21 = 0x3A6D657449;
  *((void *)&v21 + 1) = 0xE500000000000000;
  id v24 = objc_msgSend(v18, sel_count);
  sub_218354A10();
  sub_218354680();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)(v6 + 24);
  swift_beginAccess();
  uint64_t v8 = *(void **)(v6 + 24);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v6 + 24) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = sub_21833D6C4(0, v8[2] + 1, 1, v8);
    void *v7 = v8;
  }
  unint64_t v11 = v8[2];
  unint64_t v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    uint64_t v8 = sub_21833D6C4((void *)(v10 > 1), v11 + 1, 1, v8);
    void *v7 = v8;
  }
  uint64_t v22 = &type metadata for CBORCodingKey;
  unint64_t v23 = sub_218335E58();
  uint64_t v12 = swift_allocObject();
  *(void *)&long long v21 = v12;
  *(void *)(v12 + 16) = 0x3A6D657449;
  *(void *)(v12 + 24) = 0xE500000000000000;
  *(void *)(v12 + 32) = 0;
  *(unsigned char *)(v12 + 40) = 1;
  v8[2] = v11 + 1;
  sub_218335EE4(&v21, (uint64_t)&v8[5 * v11 + 4]);
  uint64_t v22 = a2;
  unint64_t v23 = a3;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v21);
  (*((void (**)(uint64_t *, uint64_t, ValueMetadata *))a2[-1].Description + 2))(boxed_opaque_existential_1Tm, a1, a2);
  uint64_t v14 = v25;
  sub_21833F9B0(&v21);
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v21);
    return sub_2183444B0(v4);
  }
  uint64_t v16 = v15;
  uint64_t result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v21);
  if (v16)
  {
    objc_msgSend(v18, sel_addObject_, v16);
    swift_unknownObjectRelease();
    return sub_2183444B0(v4);
  }
  __break(1u);
  return result;
}

void sub_218345E8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = (objc_class *)type metadata accessor for _CBORDictionary();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  uint64_t v4 = OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content;
  uint64_t v5 = v3;
  uint64_t v6 = MEMORY[0x263F8EE78];
  *(void *)&v3[v4] = sub_218329968(MEMORY[0x263F8EE78]);
  *(void *)&v5[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList] = v6;
  v5[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] = 0;

  v20.receiver = v5;
  v20.super_class = v2;
  id v7 = objc_msgSendSuper2(&v20, sel_init);
  id v8 = objc_msgSend(*(id *)(v1 + 8), sel_count);
  *(void *)&long long v15 = 0x3A6D657449;
  *((void *)&v15 + 1) = 0xE500000000000000;
  id v19 = v8;
  sub_218354A10();
  sub_218354680();
  swift_bridgeObjectRelease();
  unint64_t v9 = *(void **)v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v9 = sub_21833D6C4(0, v9[2] + 1, 1, v9);
  }
  unint64_t v11 = v9[2];
  unint64_t v10 = v9[3];
  if (v11 >= v10 >> 1) {
    unint64_t v9 = sub_21833D6C4((void *)(v10 > 1), v11 + 1, 1, v9);
  }
  uint64_t v17 = &type metadata for CBORCodingKey;
  unint64_t v18 = sub_218335E58();
  uint64_t v12 = swift_allocObject();
  *(void *)&long long v15 = v12;
  *(void *)(v12 + 16) = 0x3A6D657449;
  *(void *)(v12 + 24) = 0xE500000000000000;
  *(void *)(v12 + 32) = 0;
  *(unsigned char *)(v12 + 40) = 1;
  _OWORD v9[2] = v11 + 1;
  sub_218335EE4(&v15, (uint64_t)&v9[5 * v11 + 4]);
  *(void *)uint64_t v1 = v9;
  uint64_t v13 = *(void *)(v1 + 16);
  *(void *)&long long v15 = v9;
  *((void *)&v15 + 1) = v7;
  uint64_t v16 = v13;
  type metadata accessor for _CBOREncoderKeyContainer();
  swift_retain();
  swift_bridgeObjectRetain();
  id v14 = v7;
  swift_getWitnessTable();
  sub_218354A00();
  sub_218344BBC((void *)v1);
}

uint64_t sub_2183460D4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = (void *)v1;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF980]), sel_init);
  id v5 = objc_msgSend(*(id *)(v1 + 8), sel_count);
  *(void *)&long long v12 = 0x3A6D657449;
  *((void *)&v12 + 1) = 0xE500000000000000;
  id v15 = v5;
  sub_218354A10();
  sub_218354680();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void **)v1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v6 = sub_21833D6C4(0, v6[2] + 1, 1, v6);
  }
  unint64_t v8 = v6[2];
  unint64_t v7 = v6[3];
  if (v8 >= v7 >> 1) {
    uint64_t v6 = sub_21833D6C4((void *)(v7 > 1), v8 + 1, 1, v6);
  }
  uint64_t v13 = &type metadata for CBORCodingKey;
  unint64_t v14 = sub_218335E58();
  uint64_t v9 = swift_allocObject();
  *(void *)&long long v12 = v9;
  *(void *)(v9 + 16) = 0x3A6D657449;
  *(void *)(v9 + 24) = 0xE500000000000000;
  *(void *)(v9 + 32) = 0;
  *(unsigned char *)(v9 + 40) = 1;
  v6[2] = v8 + 1;
  sub_218335EE4(&v12, (uint64_t)&v6[5 * v8 + 4]);
  *uint64_t v2 = v6;
  uint64_t v10 = v2[2];
  a1[3] = &type metadata for _CBOREncoderUnkeyedContainer;
  a1[4] = sub_2183484D0();
  *a1 = v6;
  a1[1] = v4;
  a1[2] = v10;
  swift_retain();
  swift_bridgeObjectRetain();
  return sub_218344BBC(v2);
}

id sub_21834627C()
{
  return objc_msgSend(*(id *)(v0 + 8), sel_count);
}

void sub_21834628C()
{
  uint64_t v1 = *(void **)(v0 + 8);
  id v2 = objc_msgSend(self, sel_cborNil);
  objc_msgSend(v1, sel_addObject_, v2);
}

void sub_2183462F8(char a1)
{
  uint64_t v3 = *(void **)(v1 + 8);
  id v4 = self;
  id v5 = &selRef_cborTrue;
  if ((a1 & 1) == 0) {
    id v5 = &selRef_cborFalse;
  }
  id v6 = [v4 *v5];
  objc_msgSend(v3, sel_addObject_, v6);
}

void sub_21834637C()
{
  uint64_t v1 = *(void **)(v0 + 8);
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_218354640();
  swift_bridgeObjectRelease();
  id v3 = objc_msgSend(self, sel_cborWithUTF8String_, v2);

  objc_msgSend(v1, sel_addObject_, v3);
}

uint64_t sub_218346418(double a1)
{
  return sub_21834585C(a1);
}

uint64_t sub_218346430(float a1)
{
  return sub_218345A60(a1);
}

void sub_218346448(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_218346468(char a1)
{
  id v2 = *(void **)(v1 + 8);
  id v3 = objc_msgSend(self, sel_cborWithInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);
}

void sub_2183464DC(__int16 a1)
{
  id v2 = *(void **)(v1 + 8);
  id v3 = objc_msgSend(self, sel_cborWithInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);
}

void sub_218346550(int a1)
{
  id v2 = *(void **)(v1 + 8);
  id v3 = objc_msgSend(self, sel_cborWithInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);
}

uint64_t sub_2183465C4()
{
  return sub_218354BE0();
}

void sub_2183465DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_2183465FC(unsigned __int8 a1)
{
  id v2 = *(void **)(v1 + 8);
  id v3 = objc_msgSend(self, sel_cborWithUnsignedInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);
}

void sub_218346670(unsigned __int16 a1)
{
  id v2 = *(void **)(v1 + 8);
  id v3 = objc_msgSend(self, sel_cborWithUnsignedInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);
}

void sub_2183466E4(unsigned int a1)
{
  id v2 = *(void **)(v1 + 8);
  id v3 = objc_msgSend(self, sel_cborWithUnsignedInteger_, a1);
  objc_msgSend(v2, sel_addObject_, v3);
}

void sub_218346758(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id v5 = *(void **)(v4 + 8);
  id v6 = objc_msgSend(self, *a4, a1);
  objc_msgSend(v5, sel_addObject_, v6);
}

uint64_t sub_2183467CC()
{
  return sub_218354BF0();
}

uint64_t sub_2183467E4(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  return sub_218345C64(a1, a2, a3);
}

uint64_t sub_2183467FC()
{
  return sub_218354AC0();
}

uint64_t sub_218346828()
{
  return sub_218354AF0();
}

uint64_t sub_218346854()
{
  return sub_218354AE0();
}

uint64_t sub_218346880()
{
  return sub_218354B00();
}

uint64_t sub_2183468AC()
{
  return sub_218354B10();
}

uint64_t sub_2183468D8()
{
  return sub_218354B20();
}

uint64_t sub_218346904()
{
  return sub_218354B40();
}

uint64_t sub_218346930()
{
  return sub_218354B50();
}

uint64_t sub_21834695C()
{
  return sub_218354B60();
}

uint64_t sub_218346988()
{
  return sub_218354B70();
}

uint64_t sub_2183469B4()
{
  return sub_218354B90();
}

uint64_t sub_2183469E0()
{
  return sub_218354B30();
}

uint64_t sub_218346A0C()
{
  return sub_218354B80();
}

uint64_t sub_218346A38()
{
  return sub_218354BA0();
}

uint64_t sub_218346A64()
{
  return sub_218354BB0();
}

uint64_t sub_218346A90()
{
  return sub_218354BC0();
}

uint64_t sub_218346ABC()
{
  return sub_218354BD0();
}

uint64_t sub_218346AE8()
{
  return sub_218354AD0();
}

uint64_t sub_218346B24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v5 = v1 + 8;
  id v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(void *)(v5 + 8);
  swift_retain();
  id v6 = objc_msgSend(v3, sel_count);
  uint64_t v7 = type metadata accessor for _CBORReferenceEncoder();
  swift_allocObject();
  uint64_t v8 = sub_218347B5C(v4, (uint64_t)v6, v3);
  a1[3] = v7;
  uint64_t result = sub_2183488EC(&qword_267BC71A8, (void (*)(uint64_t))type metadata accessor for _CBORReferenceEncoder);
  a1[4] = result;
  *a1 = v8;
  return result;
}

void sub_218346BEC()
{
  id v1 = objc_msgSend(self, sel_cborNil);
  swift_beginAccess();
  uint64_t v2 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v2);
  if (*(void *)((*(void *)(v0 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218346CB4(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = self;
  uint64_t v5 = &selRef_cborTrue;
  if ((a1 & 1) == 0) {
    uint64_t v5 = &selRef_cborFalse;
  }
  id v6 = [v4 *v5];
  swift_beginAccess();
  uint64_t v7 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v7);
  if (*(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218346D94()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = (void *)sub_218354640();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(self, sel_cborWithUTF8String_, v1);

  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v0 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v0 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218346E94(double a1)
{
  id v2 = objc_msgSend(self, sel_cborWithDouble_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218346F6C(float a1)
{
  uint64_t v3 = self;
  *(float *)&double v4 = a1;
  id v5 = objc_msgSend(v3, sel_cborWithFloat_, v4);
  swift_beginAccess();
  uint64_t v6 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v6);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218347044(char a1)
{
  id v2 = objc_msgSend(self, sel_cborWithInteger_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218347114(__int16 a1)
{
  id v2 = objc_msgSend(self, sel_cborWithInteger_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_2183471E4(int a1)
{
  id v2 = objc_msgSend(self, sel_cborWithInteger_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_2183472B4(unsigned __int8 a1)
{
  id v2 = objc_msgSend(self, sel_cborWithUnsignedInteger_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218347384(unsigned __int16 a1)
{
  id v2 = objc_msgSend(self, sel_cborWithUnsignedInteger_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218347454(unsigned int a1)
{
  id v2 = objc_msgSend(self, sel_cborWithUnsignedInteger_, a1);
  swift_beginAccess();
  uint64_t v3 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v3);
  if (*(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v1 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

void sub_218347524(uint64_t a1, SEL *a2)
{
  id v3 = objc_msgSend(self, *a2, a1);
  swift_beginAccess();
  uint64_t v4 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v4);
  if (*(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
}

uint64_t sub_2183475F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t v9 = sub_218354850();
  uint64_t v31 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9, v10);
  long long v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[3] = a2;
  v30[4] = a3;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm(v30);
  uint64_t v14 = *(void *)(a2 - 8);
  id v15 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v16 = v14 + 16;
  v15(boxed_opaque_existential_1Tm, a1, a2);
  sub_21833F9B0(v30);
  uint64_t v18 = v17;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
  if (v4) {
    return swift_willThrow();
  }
  uint64_t v27 = v16;
  id v28 = v15;
  uint64_t v29 = a1;
  if (!v18)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_218354810();
    uint64_t v21 = sub_218354860();
    swift_allocError();
    unint64_t v23 = v22;
    id v24 = (char *)v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC7170) + 48);
    v23[3] = a2;
    uint64_t v25 = __swift_allocate_boxed_opaque_existential_1Tm(v23);
    v28(v25, v29, a2);
    uint64_t v26 = v31;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v24, v12, v9);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v21 - 8) + 104))(v23, *MEMORY[0x263F8DCE0], v21);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v9);
    return swift_willThrow();
  }
  swift_beginAccess();
  uint64_t v20 = swift_unknownObjectRetain();
  MEMORY[0x21D4676F0](v20);
  if (*(void *)((*(void *)(v5 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v5 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_218354760();
  sub_218354770();
  sub_218354750();
  swift_endAccess();
  return swift_unknownObjectRelease();
}

uint64_t sub_2183478E0()
{
  return swift_bridgeObjectRetain();
}

void sub_218347924()
{
}

void sub_218347948(char a1)
{
}

void sub_21834796C()
{
}

void sub_218347990(double a1)
{
}

void sub_2183479B4(float a1)
{
}

void sub_2183479D8(uint64_t a1)
{
}

void sub_218347A04(char a1)
{
}

void sub_218347A28(__int16 a1)
{
}

void sub_218347A4C(int a1)
{
}

uint64_t sub_218347A70()
{
  return sub_218354C60();
}

void sub_218347A88(uint64_t a1)
{
}

void sub_218347AB4(unsigned __int8 a1)
{
}

void sub_218347AD8(unsigned __int16 a1)
{
}

void sub_218347AFC(unsigned int a1)
{
}

uint64_t sub_218347B20()
{
  return sub_218354C70();
}

uint64_t sub_218347B38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2183475F4(a1, a2, a3);
}

uint64_t sub_218347B5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  *(void *)(v4 + 40) = a1;
  *(void *)(v4 + 48) = a3;
  *(void *)(v4 + 56) = a2;
  *(unsigned char *)(v4 + 64) = 0;
  swift_beginAccess();
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_weakInit();
    *(void *)(v4 + 16) = MEMORY[0x263F8EE78];
    *(void *)(v4 + 24) = v8;
    uint64_t v10 = (void *)(v4 + 24);
    swift_weakAssign();
    swift_retain();
    id v11 = a3;
    swift_bridgeObjectRetain();
    swift_release();
    *(void *)&long long v17 = 0x3A6D657449;
    *((void *)&v17 + 1) = 0xE500000000000000;
    uint64_t v20 = a2;
    swift_retain();
    sub_218354A10();
    sub_218354680();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    long long v12 = *(void **)(v4 + 24);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v4 + 24) = v12;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      long long v12 = sub_21833D6C4(0, v12[2] + 1, 1, v12);
      *uint64_t v10 = v12;
    }
    unint64_t v15 = v12[2];
    unint64_t v14 = v12[3];
    if (v15 >= v14 >> 1)
    {
      long long v12 = sub_21833D6C4((void *)(v14 > 1), v15 + 1, 1, v12);
      *uint64_t v10 = v12;
    }
    uint64_t v18 = &type metadata for CBORCodingKey;
    unint64_t v19 = sub_218335E58();
    uint64_t v16 = swift_allocObject();
    *(void *)&long long v17 = v16;
    *(void *)(v16 + 16) = 0x3A6D657449;
    *(void *)(v16 + 24) = 0xE500000000000000;
    *(void *)(v16 + 32) = 0;
    *(unsigned char *)(v16 + 40) = 1;
    void v12[2] = v15 + 1;
    sub_218335EE4(&v17, (uint64_t)&v12[5 * v15 + 4]);
    swift_release();
    swift_release();

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL sub_218347D6C()
{
  swift_beginAccess();
  unint64_t v1 = v0[2];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_218354960();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_beginAccess();
  uint64_t v3 = *(void *)(v0[3] + 16);
  uint64_t v4 = v0[5];
  swift_beginAccess();
  return v2 == v3 + ~*(void *)(*(void *)(v4 + 24) + 16);
}

void sub_218347E38()
{
  swift_release();
  unint64_t v1 = *(void **)(v0 + 48);
  uint64_t v2 = *(void **)(v0 + 56);
  char v3 = *(unsigned char *)(v0 + 64);
  sub_2183482B8(v1, v2, v3);
}

uint64_t sub_218347E6C()
{
  uint64_t v2 = v0;
  char v3 = (void *)(v0 + 16);
  swift_beginAccess();
  unint64_t v4 = *(void *)(v2 + 16);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_218354960();
    swift_bridgeObjectRelease();
    if (v5 == 1)
    {
LABEL_3:
      swift_beginAccess();
      if (*v3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v6 = (char *)sub_218354960();
        swift_bridgeObjectRelease();
        if (v6) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v6 = *(char **)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v6)
        {
LABEL_5:
          sub_21834853C();
          if (v7)
          {
            id v8 = v7;
            swift_endAccess();
            goto LABEL_10;
          }
          __break(1u);
          goto LABEL_27;
        }
      }
      __break(1u);
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5 == 1) {
      goto LABEL_3;
    }
  }
  if (!v5)
  {
    id v8 = objc_msgSend(objc_allocWithZone(NSDictionary), sel_init);
LABEL_10:
    uint64_t v6 = *(char **)(v2 + 48);
    unint64_t v1 = *(void **)(v2 + 56);
    if ((*(unsigned char *)(v2 + 64) & 1) == 0)
    {
      objc_msgSend(v6, sel_insertObject_atIndex_, v8, v1);
      swift_unknownObjectRelease();
      sub_2183482B8(v6, v1, 0);
LABEL_22:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_weakDestroy();
      swift_release();
      sub_2183482B8(*(void **)(v2 + 48), *(void **)(v2 + 56), *(unsigned char *)(v2 + 64));
      return v2;
    }
    if (v6[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_maintainKeySetOrder] != 1)
    {
      uint64_t v13 = v6;
      id v14 = v1;
      goto LABEL_21;
    }
    uint64_t v9 = &v6[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_content];
    swift_beginAccess();
    uint64_t v10 = *(void *)v9;
    if ((v10 & 0xC000000000000001) != 0)
    {
      sub_21834826C(v6, v1, 1);
      id v11 = v1;
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_218354930();

      swift_bridgeObjectRelease();
      if (v12)
      {
        swift_unknownObjectRelease();
LABEL_21:
        swift_beginAccess();
        id v21 = v1;
        uint64_t v22 = swift_unknownObjectRetain();
        sub_218348608(v22, v21);
        swift_endAccess();

        swift_unknownObjectRelease();
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v15 = *(void *)(v10 + 16);
      sub_21834826C(v6, v1, 1);
      if (v15)
      {
        id v16 = v1;
        swift_bridgeObjectRetain();
        sub_21834A560((uint64_t)v16);
        char v18 = v17;

        swift_bridgeObjectRelease();
        if (v18) {
          goto LABEL_21;
        }
      }
    }
    unint64_t v19 = &v6[OBJC_IVAR____TtC11CBORLibraryP33_7693559CB90E2482CACD4C8EAD5C623015_CBORDictionary_keyOrderList];
    swift_beginAccess();
    id v20 = v1;
    MEMORY[0x21D4676F0]();
    if (*(void *)((*(void *)v19 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*(void *)v19 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    {
LABEL_20:
      sub_218354770();
      sub_218354750();
      swift_endAccess();
      goto LABEL_21;
    }
LABEL_25:
    sub_218354760();
    goto LABEL_20;
  }
LABEL_27:
  uint64_t result = sub_218354950();
  __break(1u);
  return result;
}

uint64_t sub_218348214()
{
  uint64_t v0 = sub_218347E6C();
  return MEMORY[0x270FA0228](v0, 65, 7);
}

uint64_t type metadata accessor for _CBORReferenceEncoder()
{
  return self;
}

id sub_21834826C(void *a1, void *a2, char a3)
{
  if (a3)
  {
    id v5 = a1;
    a1 = a2;
    uint64_t v3 = vars8;
  }
  return a1;
}

void destroy for _CBORReferenceEncoder.Reference(uint64_t a1)
{
}

void sub_2183482B8(void *a1, void *a2, char a3)
{
  if (a3)
  {
  }
}

uint64_t _s11CBORLibrary21_CBORReferenceEncoderC9ReferenceOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  unint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_21834826C(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for _CBORReferenceEncoder.Reference(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  unint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_21834826C(*(void **)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2183482B8(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for _CBORReferenceEncoder.Reference(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  unint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2183482B8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for _CBORReferenceEncoder.Reference(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _CBORReferenceEncoder.Reference(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_21834849C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2183484A4(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for _CBORReferenceEncoder.Reference()
{
  return &type metadata for _CBORReferenceEncoder.Reference;
}

ValueMetadata *type metadata accessor for _CBOREncodingStorage()
{
  return &type metadata for _CBOREncodingStorage;
}

unint64_t sub_2183484D0()
{
  unint64_t result = qword_267BC71A0;
  if (!qword_267BC71A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267BC71A0);
  }
  return result;
}

uint64_t type metadata accessor for _CBOREncoderKeyContainer()
{
  return __swift_instantiateGenericMetadata();
}

void sub_21834853C()
{
  if (*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_218354960();
    swift_bridgeObjectRelease();
    if (!v4) {
      return;
    }
  }
  else if (!*(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  sub_2183487EC();
  if (!v1)
  {
    if (*v0 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_218354960();
      swift_bridgeObjectRelease();
      unint64_t v3 = v5 - 1;
      if (!__OFSUB__(v5, 1)) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v2 = *(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
      unint64_t v3 = v2 - 1;
      if (!__OFSUB__(v2, 1))
      {
LABEL_6:
        sub_218348754(v3);
        return;
      }
    }
    __break(1u);
  }
}

uint64_t sub_218348608(uint64_t a1, void *a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_218354920();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    *unint64_t v3 = sub_21833B408(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v3;
  *unint64_t v3 = 0x8000000000000000;
  sub_21833CCAC(a1, a2, isUniquelyReferenced_nonNull_native);
  *unint64_t v3 = v10;
  return swift_bridgeObjectRelease();
}

void sub_2183486BC(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_218348870(v3);
    unint64_t v3 = v5;
    *uint64_t v1 = v5;
  }
  unint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    memmove((void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 32), (const void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 40), 8 * (v6 - 1 - a1));
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    sub_218354750();
  }
}

void sub_218348754(unint64_t a1)
{
  unint64_t v3 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0)
  {
    sub_218348870(v3);
    unint64_t v3 = v5;
    *uint64_t v1 = v5;
  }
  unint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    memmove((void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 32), (const void *)((v3 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 40), 8 * (v6 - 1 - a1));
    *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    sub_218354750();
  }
}

void sub_2183487EC()
{
  unint64_t v1 = *v0;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v0 = v1;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v1 & 0x8000000000000000) != 0
    || (v1 & 0x4000000000000000) != 0)
  {
    sub_218348870(v1);
    unint64_t v1 = v3;
    *uint64_t v0 = v3;
  }
  uint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v4 - 1;
    sub_218354750();
  }
  else
  {
    __break(1u);
  }
}

void *sub_21834885C(void *a1)
{
  return sub_21833D6C4(0, a1[2], 0, a1);
}

void sub_218348870(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_218354960();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x21D4677E0);
}

uint64_t sub_2183488EC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t _s11CBORLibrary28_CBOREncoderUnkeyedContainerVwxx_0(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s11CBORLibrary28_CBOREncoderUnkeyedContainerVwCP_0(void *a1, void *a2)
{
  unint64_t v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  id v4 = v3;
  swift_retain();
  return a1;
}

void *_s11CBORLibrary28_CBOREncoderUnkeyedContainerVwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v4 = (void *)a2[1];
  unint64_t v5 = (void *)a1[1];
  a1[1] = v4;
  id v6 = v4;

  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s11CBORLibrary28_CBOREncoderUnkeyedContainerVwta_0(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  id v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for _CBOREncoderUnkeyedContainer()
{
  return &type metadata for _CBOREncoderUnkeyedContainer;
}

uint64_t sub_218348AB0()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 41, 7);
}

id sub_218348AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1, a1);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 32))(v6);
  uint64_t v7 = sub_218354EF0();
  if (v8)
  {
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_218354ED0();
    id v11 = (void *)sub_218354640();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(ObjCClassFromMetadata, sel_cborWithUTF8String_, v11);
  }
  else
  {
    id v9 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_cborWithInteger_, v7);
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a3);
  return v9;
}

uint64_t sub_218348C54(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1Tm = __swift_allocate_boxed_opaque_existential_1Tm((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1Tm, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_218335EE4(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_218348CEC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v15);
  char v17 = (char *)&v28 - v16;
  (*(void (**)(char *))(v11 + 32))((char *)&v28 - v16);
  *(void *)(a4 + 40) = a1;
  uint64_t v18 = sub_218335690(0, (unint64_t *)&qword_26ACFE7F0);
  uint64_t v31 = v11;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v29(v14, v17, a5);
  swift_retain();
  swift_retain();
  uint64_t v30 = a6;
  id v19 = sub_218348AE8((uint64_t)v14, v18, a5);
  *(void *)(a4 + 48) = a3;
  *(void *)(a4 + 56) = v19;
  *(unsigned char *)(a4 + 64) = 1;
  id v28 = a3;
  id v20 = v19;
  swift_release();
  swift_beginAccess();
  uint64_t v21 = *(void *)(a1 + 24);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_weakInit();
    *(void *)(a4 + 16) = MEMORY[0x263F8EE78];
    *(void *)(a4 + 24) = v21;
    unint64_t v23 = (void *)(a4 + 24);
    swift_weakAssign();
    swift_bridgeObjectRetain();
    swift_release();
    swift_beginAccess();
    id v24 = *(void **)(a4 + 24);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 24) = v24;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      id v24 = sub_21833D6C4(0, v24[2] + 1, 1, v24);
      *unint64_t v23 = v24;
    }
    unint64_t v27 = v24[2];
    unint64_t v26 = v24[3];
    if (v27 >= v26 >> 1) {
      *unint64_t v23 = sub_21833D6C4((void *)(v26 > 1), v27 + 1, 1, v24);
    }
    v29(v14, v17, a5);
    sub_218348C54(v27, (uint64_t)v14, (uint64_t *)(a4 + 24), a5, v30);

    swift_release();
    swift_release();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v17, a5);
    return a4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_218348FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, uint64_t a7)
{
  *(void *)(a7 + 40) = a1;
  uint64_t v14 = self;
  swift_retain();
  swift_retain();
  uint64_t v28 = a2;
  if (a5)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = (void *)sub_218354640();
    id v16 = objc_msgSend(v14, sel_cborWithUTF8String_, v15);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v16 = objc_msgSend(v14, sel_cborWithInteger_, a4);
  }
  *(void *)(a7 + 48) = a6;
  *(void *)(a7 + 56) = v16;
  *(unsigned char *)(a7 + 64) = 1;
  id v17 = a6;
  id v27 = v16;
  swift_release();
  swift_beginAccess();
  uint64_t v18 = *(void *)(a1 + 24);
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    swift_weakInit();
    *(void *)(a7 + 16) = MEMORY[0x263F8EE78];
    *(void *)(a7 + 24) = v18;
    id v20 = (void *)(a7 + 24);
    swift_weakAssign();
    swift_bridgeObjectRetain();
    swift_release();
    swift_beginAccess();
    uint64_t v21 = *(void **)(a7 + 24);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a7 + 24) = v21;
    uint64_t v23 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v21 = sub_21833D6C4(0, v21[2] + 1, 1, v21);
      *id v20 = v21;
    }
    unint64_t v25 = v21[2];
    unint64_t v24 = v21[3];
    if (v25 >= v24 >> 1)
    {
      uint64_t v21 = sub_21833D6C4((void *)(v24 > 1), v25 + 1, 1, v21);
      *id v20 = v21;
    }
    uint64_t v30 = &type metadata for CBORCodingKey;
    unint64_t v31 = sub_218335E58();
    uint64_t v26 = swift_allocObject();
    *(void *)&long long v29 = v26;
    *(void *)(v26 + 16) = v28;
    *(void *)(v26 + 24) = a3;
    *(void *)(v26 + 32) = v23;
    *(unsigned char *)(v26 + 40) = a5 & 1;
    v21[2] = v25 + 1;
    sub_218335EE4(&v29, (uint64_t)&v21[5 * v25 + 4]);
    swift_bridgeObjectRetain();

    swift_release();
    swift_release();

    return a7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_21834925C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _CBORReferenceEncoder();
  uint64_t v14 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, a5);
  return sub_218348CEC(a1, (uint64_t)v13, a3, v14, a5, a6);
}

void sub_218349364(uint64_t a1)
{
}

void sub_21834937C(uint64_t a1)
{
}

uint64_t CBOR.EncodedCBOR.embeddedCodable.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t CBOR.EncodedCBOR.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t CBOR.EncodedCBOR.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v69 = a4;
  uint64_t v71 = a3;
  id v65 = a5;
  uint64_t v68 = sub_218354820();
  uint64_t v70 = *(void *)(v68 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v68, v7);
  uint64_t v72 = a2;
  uint64_t v73 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = *(void *)(a2 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v8, v10);
  uint64_t v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v11, v14);
  id v17 = (char *)&v59 - v16;
  MEMORY[0x270FA5388](v15, v18);
  id v20 = (char *)&v59 - v19;
  uint64_t v21 = sub_2183548F0();
  uint64_t v66 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21, v22);
  unint64_t v24 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  unint64_t v25 = v74;
  sub_218354E80();
  if (!v25)
  {
    uint64_t v64 = v24;
    uint64_t v62 = v21;
    uint64_t v26 = v73;
    id v60 = v20;
    uint64_t v63 = v17;
    uint64_t v74 = a1;
    id v61 = v13;
    __swift_project_boxed_opaque_existential_1(v77, v77[3]);
    sub_218337298();
    sub_218354C20();
    id v27 = (char *)v75;
    if (objc_msgSend((id)v75, sel_isEmbeddedCBORData)
      && (id v28 = objc_msgSend(v27, sel_data)) != 0)
    {
      long long v29 = v28;
      uint64_t v70 = 0;
      uint64_t v73 = v27;
      uint64_t v30 = sub_2183545B0();
      unint64_t v32 = v31;

      __swift_project_boxed_opaque_existential_1(v74, v74[3]);
      uint64_t v33 = sub_218354E90();
      if (qword_267BC6FA0 != -1) {
        swift_once();
      }
      uint64_t v34 = v62;
      uint64_t v35 = __swift_project_value_buffer(v62, (uint64_t)qword_267BC73B0);
      uint64_t v36 = v66;
      uint64_t v37 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v64, v35, v34);
      uint64_t v38 = v71;
      uint64_t v39 = (uint64_t)v63;
      if (*(void *)(v33 + 16))
      {
        unint64_t v40 = sub_21834A424(v37);
        uint64_t v41 = v67;
        if (v42)
        {
          sub_21833ECD8(*(void *)(v33 + 56) + 32 * v40, (uint64_t)&v75);
        }
        else
        {
          long long v75 = 0u;
          long long v76 = 0u;
        }
      }
      else
      {
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v41 = v67;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v64, v34);
      if (*((void *)&v76 + 1))
      {
        int v49 = swift_dynamicCast();
        uint64_t v50 = v72;
        if (v49) {
          char v51 = v78;
        }
        else {
          char v51 = 0;
        }
      }
      else
      {
        sub_21834A488((uint64_t)&v75);
        char v51 = 0;
        uint64_t v50 = v72;
      }
      type metadata accessor for CBORDecoder();
      uint64_t v52 = swift_allocObject();
      *(void *)(v52 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
      uint64_t v53 = v70;
      sub_218329E18(v50, v51, v50, v38, v39);
      swift_release();

      sub_218337168(v30, v32);
      if (!v53)
      {
        uint64_t v56 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 32);
        uint64_t v57 = v60;
        v56(v60, v39, v50);
        uint64_t v58 = v61;
        v56(v61, (uint64_t)v57, v50);
        v56(v65, (uint64_t)v58, v50);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
        id v54 = v74;
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
      }
    }
    else
    {
      sub_218354810();
      uint64_t v43 = sub_218354830();
      swift_allocError();
      int v45 = v44;
      id v46 = (char *)v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
      *int v45 = type metadata accessor for CBOR.EncodedCBOR();
      uint64_t v47 = v70;
      uint64_t v48 = v68;
      (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v46, v26, v68);
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v43 - 8) + 104))(v45, *MEMORY[0x263F8DCB0], v43);
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v48);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v77);
    a1 = v74;
  }
  id v54 = a1;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v54);
}

uint64_t type metadata accessor for CBOR.EncodedCBOR()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t CBOR.EncodedCBOR.encode(to:)(void *a1, uint64_t a2)
{
  type metadata accessor for CBOREncoder();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
  *(void *)(v6 + 24) = 2;
  *(unsigned char *)(v6 + 32) = 0;
  uint64_t v7 = sub_21833F2D4(v2, *(void *)(a2 + 16), *(void *)(a2 + 32));
  if (v3) {
    return swift_release();
  }
  uint64_t v10 = (uint64_t)v7;
  unint64_t v11 = v8;
  sub_218337DAC((uint64_t)v7, v8);
  uint64_t v12 = (void *)sub_2183545A0();
  id v13 = objc_msgSend(self, sel_cborWithEmbeddedCBORData_, v12);
  sub_218337168(v10, v11);

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  id v14 = v13;
  sub_218354EB0();
  id v17 = v14;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
  sub_21833CC58();
  sub_218354C50();
  sub_218337168(v10, v11);
  swift_release();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t sub_218349BF4@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, char *a3@<X8>)
{
  return CBOR.EncodedCBOR.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_218349C18(void *a1, uint64_t a2)
{
  return CBOR.EncodedCBOR.encode(to:)(a1, a2);
}

uint64_t CBOR.EncodedCBORTag24Data.decode()(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  type metadata accessor for CBORDecoder();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_218329630(MEMORY[0x263F8EE78]);
  sub_218329B80(*(void *)(a1 + 16), v4, v3, *(void *)(a1 + 16), *(void *)(a1 + 24));
  return swift_release();
}

uint64_t CBOR.EncodedCBORTag24Data.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t CBOR.EncodedCBORTag24Data.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  uint64_t v30 = a2;
  uint64_t v8 = sub_218354820();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8, v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_218354E80();
  if (v5) {
    goto LABEL_8;
  }
  uint64_t v28 = v9;
  long long v29 = a1;
  id v27 = v12;
  __swift_project_boxed_opaque_existential_1(v33, v33[3]);
  sub_218337298();
  sub_218354C20();
  id v13 = v34;
  if (!objc_msgSend(v34, sel_isEmbeddedCBORData) || objc_msgSend(v13, sel_type) != (id)2)
  {
    uint64_t v19 = v27;
    sub_218354810();
    uint64_t v20 = sub_218354830();
    swift_allocError();
    uint64_t v22 = v21;
    uint64_t v23 = (char *)v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FA8) + 48);
    *uint64_t v22 = type metadata accessor for CBOR.EncodedCBOR();
    uint64_t v24 = v28;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v23, v19, v8);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();

    (*(void (**)(char *, uint64_t))(v24 + 8))(v19, v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    a1 = v29;
LABEL_8:
    uint64_t v18 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v18);
  }
  id v14 = objc_msgSend(self, sel_dataWithCBOR_, v13);
  uint64_t v15 = sub_2183545B0();
  uint64_t v17 = v16;

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
  *a5 = v15;
  a5[1] = v17;
  uint64_t v18 = (uint64_t)v29;
  return __swift_destroy_boxed_opaque_existential_1Tm(v18);
}

uint64_t CBOR.EncodedCBORTag24Data.encode(to:)(void *a1)
{
  uint64_t v3 = sub_218354850();
  uint64_t v19 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v8 = *v1;
  unint64_t v7 = v1[1];
  sub_218337DAC(v8, v7);
  uint64_t v9 = (void *)sub_2183545A0();
  id v10 = objc_msgSend(self, sel_cborWithEncodedTag24Data_, v9);
  sub_218337168(v8, v7);

  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    id v11 = v10;
    sub_218354EB0();
    id v22 = v11;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
    sub_21833CC58();
    sub_218354C50();

    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  }
  else
  {
    sub_218354810();
    uint64_t v13 = sub_218354860();
    swift_allocError();
    uint64_t v15 = v14;
    uint64_t v16 = (char *)v14 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267BC7170) + 48);
    uint64_t v17 = type metadata accessor for CBOR.EncodedCBOR();
    v15[3] = swift_getMetatypeMetadata();
    *uint64_t v15 = v17;
    uint64_t v18 = v19;
    (*(void (**)(char *, unsigned char *, uint64_t))(v19 + 16))(v16, v6, v3);
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v13 - 8) + 104))(v15, *MEMORY[0x263F8DCE0], v13);
    swift_willThrow();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v18 + 8))(v6, v3);
  }
}

uint64_t sub_21834A264@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  return CBOR.EncodedCBORTag24Data.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

uint64_t sub_21834A288(void *a1)
{
  return CBOR.EncodedCBORTag24Data.encode(to:)(a1);
}

uint64_t static CBOR.EncodedCBOR<>.== infix(_:_:)()
{
  return sub_218354630() & 1;
}

uint64_t sub_21834A2CC()
{
  return static CBOR.EncodedCBOR<>.== infix(_:_:)();
}

BOOL static CBOR.EncodedCBORTag24Data<>.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = 0;
  switch(v3 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x21834A400);
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      switch(v5 >> 62)
      {
        case 1uLL:
          LODWORD(v10) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4)) {
            goto LABEL_19;
          }
          uint64_t v10 = (int)v10;
LABEL_11:
          if (v6 == v10
            && (v6 < 1 || (sub_218337DAC(*(void *)a2, *(void *)(a2 + 8)), (sub_21834ABA0(v2, v3, v4, v5) & 1) != 0)))
          {
            return 1;
          }
          else
          {
            return 0;
          }
        case 2uLL:
          uint64_t v12 = *(void *)(v4 + 16);
          uint64_t v11 = *(void *)(v4 + 24);
          BOOL v9 = __OFSUB__(v11, v12);
          uint64_t v10 = v11 - v12;
          if (!v9) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          return !v6;
        default:
          uint64_t v10 = BYTE6(v5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v8 = *(void *)(v2 + 16);
      uint64_t v7 = *(void *)(v2 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v6 = BYTE6(v3);
      goto LABEL_6;
  }
}

unint64_t sub_21834A424(uint64_t a1)
{
  sub_2183548F0();
  uint64_t v2 = sub_218354620();
  return sub_21834A5A4(a1, v2);
}

uint64_t sub_21834A488(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BC6FC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21834A4E8(uint64_t a1, uint64_t a2)
{
  sub_218354E40();
  sub_218354670();
  uint64_t v4 = sub_218354E70();
  return sub_21834A73C(a1, a2, v4);
}

unint64_t sub_21834A560(uint64_t a1)
{
  uint64_t v2 = sub_2183547A0();
  return sub_21834A820(a1, v2);
}

unint64_t sub_21834A5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = sub_2183548F0();
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = sub_218354630();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_21834A73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_218354C10() & 1) == 0)
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
      while (!v14 && (sub_218354C10() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21834A820(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_21834B5B4();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_2183547B0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_2183547B0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_21834A92C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  char v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_218337DAC(a2, a3);
      char v10 = (char *)sub_218354560();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_218354580();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_218354570();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x21834AB90);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_218337168(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      char v17 = (char *)sub_218354560();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_218354580();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_218354570();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_21834ABA0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_218337DAC(a1, a2);
      char v5 = sub_21834B5F4((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_218337168(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_21834B5F4(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_218337168(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_21834A92C((uint64_t)__s1, a3, a4, &v14);
      sub_218337168(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_21834ADD0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_21834AE60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7
    && *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_21834AF18(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_21834AF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_21834AF94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_21834AFE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_21834B034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_21834B084(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void sub_21834B1E0(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x21834B3F8);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t *sub_21834B420(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_218337DAC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_21834B460(uint64_t a1)
{
  return sub_218337168(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *sub_21834B46C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_218337DAC(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_218337168(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *sub_21834B4C0(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_218337168(v3, v4);
  return a1;
}

uint64_t sub_21834B4FC(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t sub_21834B550(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

uint64_t type metadata accessor for CBOR.EncodedCBORTag24Data()
{
  return __swift_instantiateGenericMetadata();
}

unint64_t sub_21834B5B4()
{
  unint64_t result = qword_26ACFE7F0;
  if (!qword_26ACFE7F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26ACFE7F0);
  }
  return result;
}

uint64_t sub_21834B5F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_218354560();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_218354580();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_218354570();
  sub_21834A92C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

id _getRFC3339DateFormatter(int a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  unsigned int v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  if (a1) {
    unint64_t v4 = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
  }
  else {
    unint64_t v4 = @"yyyy-MM-dd";
  }
  [v2 setDateFormat:v4];
  uint64_t v5 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v5];

  return v2;
}

void sub_218351B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
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

uint64_t sub_218354560()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_218354570()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_218354580()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_218354590()
{
  return MEMORY[0x270EF0030]();
}

uint64_t sub_2183545A0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2183545B0()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2183545C0()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2183545D0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_2183545E0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2183545F0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_218354600()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_218354610()
{
  return MEMORY[0x270F9D220]();
}

uint64_t sub_218354620()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_218354630()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_218354640()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_218354650()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_218354660()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_218354670()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_218354680()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_218354690()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2183546A0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2183546C0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2183546D0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2183546E0()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2183546F0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_218354700()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_218354710()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_218354720()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_218354730()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_218354740()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_218354750()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_218354760()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_218354770()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_218354780()
{
  return MEMORY[0x270F9DDF0]();
}

uint64_t sub_218354790()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2183547A0()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_2183547B0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2183547C0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2183547D0()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2183547E0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2183547F0()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_218354800()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_218354810()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_218354820()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_218354830()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_218354840()
{
  return MEMORY[0x270F9EAA0]();
}

uint64_t sub_218354850()
{
  return MEMORY[0x270F9EAB0]();
}

uint64_t sub_218354860()
{
  return MEMORY[0x270F9EAB8]();
}

uint64_t sub_218354870()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_218354880()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_218354890()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2183548A0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2183548B0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2183548C0()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2183548D0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2183548E0()
{
  return MEMORY[0x270F9EDE8]();
}

uint64_t sub_2183548F0()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_218354900()
{
  return MEMORY[0x270F9EF30]();
}

uint64_t sub_218354910()
{
  return MEMORY[0x270F9EF50]();
}

uint64_t sub_218354920()
{
  return MEMORY[0x270F9EF88]();
}

uint64_t sub_218354930()
{
  return MEMORY[0x270F9EFB0]();
}

uint64_t sub_218354940()
{
  return MEMORY[0x270F9EFC0]();
}

uint64_t sub_218354950()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_218354960()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_218354970()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_218354980()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_218354990()
{
  return MEMORY[0x270F9F0A8]();
}

uint64_t sub_2183549A0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2183549B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2183549C0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2183549D0()
{
  return MEMORY[0x270F9F380]();
}

uint64_t sub_2183549E0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2183549F0()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_218354A00()
{
  return MEMORY[0x270F9F4B0]();
}

uint64_t sub_218354A10()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_218354A20()
{
  return MEMORY[0x270F9F5B0]();
}

uint64_t sub_218354A30()
{
  return MEMORY[0x270F9F5B8]();
}

uint64_t sub_218354A40()
{
  return MEMORY[0x270F9F5C0]();
}

uint64_t sub_218354A50()
{
  return MEMORY[0x270F9F5C8]();
}

uint64_t sub_218354A60()
{
  return MEMORY[0x270F9F5D0]();
}

uint64_t sub_218354A70()
{
  return MEMORY[0x270F9F5D8]();
}

uint64_t sub_218354A80()
{
  return MEMORY[0x270F9F5E0]();
}

uint64_t sub_218354A90()
{
  return MEMORY[0x270F9F5E8]();
}

uint64_t sub_218354AA0()
{
  return MEMORY[0x270F9F5F0]();
}

uint64_t sub_218354AB0()
{
  return MEMORY[0x270F9F5F8]();
}

uint64_t sub_218354AC0()
{
  return MEMORY[0x270F9F688]();
}

uint64_t sub_218354AD0()
{
  return MEMORY[0x270F9F690]();
}

uint64_t sub_218354AE0()
{
  return MEMORY[0x270F9F698]();
}

uint64_t sub_218354AF0()
{
  return MEMORY[0x270F9F6A0]();
}

uint64_t sub_218354B00()
{
  return MEMORY[0x270F9F6A8]();
}

uint64_t sub_218354B10()
{
  return MEMORY[0x270F9F6B0]();
}

uint64_t sub_218354B20()
{
  return MEMORY[0x270F9F6B8]();
}

uint64_t sub_218354B30()
{
  return MEMORY[0x270F9F6C0]();
}

uint64_t sub_218354B40()
{
  return MEMORY[0x270F9F6C8]();
}

uint64_t sub_218354B50()
{
  return MEMORY[0x270F9F6D0]();
}

uint64_t sub_218354B60()
{
  return MEMORY[0x270F9F6D8]();
}

uint64_t sub_218354B70()
{
  return MEMORY[0x270F9F6E0]();
}

uint64_t sub_218354B80()
{
  return MEMORY[0x270F9F6E8]();
}

uint64_t sub_218354B90()
{
  return MEMORY[0x270F9F6F0]();
}

uint64_t sub_218354BA0()
{
  return MEMORY[0x270F9F6F8]();
}

uint64_t sub_218354BB0()
{
  return MEMORY[0x270F9F700]();
}

uint64_t sub_218354BC0()
{
  return MEMORY[0x270F9F708]();
}

uint64_t sub_218354BD0()
{
  return MEMORY[0x270F9F710]();
}

uint64_t sub_218354BE0()
{
  return MEMORY[0x270F9F718]();
}

uint64_t sub_218354BF0()
{
  return MEMORY[0x270F9F720]();
}

uint64_t sub_218354C00()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_218354C10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_218354C20()
{
  return MEMORY[0x270F9F818]();
}

uint64_t sub_218354C30()
{
  return MEMORY[0x270F9F860]();
}

uint64_t sub_218354C40()
{
  return MEMORY[0x270F9F868]();
}

uint64_t sub_218354C50()
{
  return MEMORY[0x270F9F8A8]();
}

uint64_t sub_218354C60()
{
  return MEMORY[0x270F9F8F8]();
}

uint64_t sub_218354C70()
{
  return MEMORY[0x270F9F900]();
}

uint64_t sub_218354C80()
{
  return MEMORY[0x270F9F960]();
}

uint64_t sub_218354C90()
{
  return MEMORY[0x270F9F968]();
}

uint64_t sub_218354CA0()
{
  return MEMORY[0x270F9F970]();
}

uint64_t sub_218354CB0()
{
  return MEMORY[0x270F9F978]();
}

uint64_t sub_218354CC0()
{
  return MEMORY[0x270F9F980]();
}

uint64_t sub_218354CD0()
{
  return MEMORY[0x270F9F988]();
}

uint64_t sub_218354CE0()
{
  return MEMORY[0x270F9F990]();
}

uint64_t sub_218354CF0()
{
  return MEMORY[0x270F9F998]();
}

uint64_t sub_218354D00()
{
  return MEMORY[0x270F9F9A0]();
}

uint64_t sub_218354D10()
{
  return MEMORY[0x270F9F9A8]();
}

uint64_t sub_218354D20()
{
  return MEMORY[0x270F9F9B0]();
}

uint64_t sub_218354D30()
{
  return MEMORY[0x270F9F9B8]();
}

uint64_t sub_218354D40()
{
  return MEMORY[0x270F9F9C0]();
}

uint64_t sub_218354D50()
{
  return MEMORY[0x270F9F9C8]();
}

uint64_t sub_218354D60()
{
  return MEMORY[0x270F9F9D0]();
}

uint64_t sub_218354D70()
{
  return MEMORY[0x270F9F9D8]();
}

uint64_t sub_218354D80()
{
  return MEMORY[0x270F9F9E0]();
}

uint64_t sub_218354D90()
{
  return MEMORY[0x270F9F9E8]();
}

uint64_t sub_218354DA0()
{
  return MEMORY[0x270F9F9F0]();
}

uint64_t sub_218354DB0()
{
  return MEMORY[0x270F9F9F8]();
}

uint64_t sub_218354DC0()
{
  return MEMORY[0x270F9FA00]();
}

uint64_t sub_218354DD0()
{
  return MEMORY[0x270F9FA08]();
}

uint64_t sub_218354DE0()
{
  return MEMORY[0x270F9FA10]();
}

uint64_t sub_218354DF0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_218354E00()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_218354E10()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_218354E20()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_218354E30()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_218354E40()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_218354E50()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_218354E60()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_218354E70()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_218354E80()
{
  return MEMORY[0x270F9FD60]();
}

uint64_t sub_218354E90()
{
  return MEMORY[0x270F9FD68]();
}

uint64_t sub_218354EA0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_218354EB0()
{
  return MEMORY[0x270F9FD88]();
}

uint64_t sub_218354EC0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_218354ED0()
{
  return MEMORY[0x270FA0090]();
}

uint64_t sub_218354EE0()
{
  return MEMORY[0x270FA0098]();
}

uint64_t sub_218354EF0()
{
  return MEMORY[0x270FA00A0]();
}

uint64_t sub_218354F00()
{
  return MEMORY[0x270FA00A8]();
}

uint64_t sub_218354F30()
{
  return MEMORY[0x270FA0128]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
{
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x270EDB678](a1, a2, a3, a4);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x270FA0218]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x270FA03C8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x270EDB938](a1);
}