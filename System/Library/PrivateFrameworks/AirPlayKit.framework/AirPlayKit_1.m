uint64_t sub_2390CFCDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2390D8778();
  v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23904CD24(a1, (uint64_t)v7, (uint64_t *)&unk_2689BEE40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    result = sub_23904477C((uint64_t)v7, (uint64_t *)&unk_2689BEE40);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(void *)(a2 + 48) = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    swift_beginAccess();
    v13 = *(void *)(v2 + 32);
    if (*(void *)(v13 + 16) && (v14 = sub_239050710((uint64_t)v11), (v15 & 1) != 0))
    {
      sub_2390531BC(*(void *)(v13 + 56) + 56 * v14, a2);
    }
    else
    {
      *(void *)(a2 + 48) = 0;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)a2 = 0u;
    }
    swift_endAccess();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

uint64_t sub_2390CFED4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23904477C(v0 + OBJC_IVAR____TtC10AirPlayKit27RemoteInspectorNodeRegistry_displayTree, (uint64_t *)&unk_2689BE980);
  return swift_deallocClassInstance();
}

uint64_t sub_2390CFF60()
{
  return type metadata accessor for RemoteInspectorNodeRegistry();
}

uint64_t type metadata accessor for RemoteInspectorNodeRegistry()
{
  uint64_t result = qword_2689BEE20;
  if (!qword_2689BEE20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2390CFFB4()
{
  sub_2390C4ECC();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_2390D0074@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v10 = (char *)&v20 - v9;
  uint64_t v11 = sub_2390D8778();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 0x100000000) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
LABEL_8:
    uint64_t result = sub_23904477C((uint64_t)v10, (uint64_t *)&unk_2689BEE40);
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(void *)(a2 + 48) = 0;
    return result;
  }
  swift_beginAccess();
  uint64_t v15 = *(void *)(v2 + 16);
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_239050820(a1), (v17 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v10, *(void *)(v15 + 56) + *(void *)(v12 + 72) * v16, v11);
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v18(v10, 0, 1, v11);
  }
  else
  {
    v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v18(v10, 1, 1, v11);
  }
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1) {
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v8, v14, v11);
  v18(v8, 0, 1, v11);
  sub_2390CFCDC((uint64_t)v8, a2);
  sub_23904477C((uint64_t)v8, (uint64_t *)&unk_2689BEE40);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

double sub_2390D0344@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390D0074(a1 | ((HIDWORD(a1) & 1) << 32), (uint64_t)v12);
  if (*((void *)&v13 + 1))
  {
    long long v15 = v12[0];
    v16[0] = v12[1];
    v16[1] = v13;
    uint64_t v7 = v14;
    uint64_t v17 = v14;
    uint64_t v8 = *((void *)&v13 + 1);
    __swift_project_boxed_opaque_existential_1(v16, *((uint64_t *)&v13 + 1));
    (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v8, v7);
    uint64_t v9 = sub_2390D8778();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 0, 1, v9);
    sub_2390D04CC((uint64_t)v6, a2);
    sub_23904477C((uint64_t)v6, (uint64_t *)&unk_2689BEE40);
    sub_239072798((uint64_t)&v15);
  }
  else
  {
    sub_23904477C((uint64_t)v12, (uint64_t *)&unk_2689BDF40);
    *(void *)(a2 + 48) = 0;
    double result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return result;
}

double sub_2390D04CC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v34 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  v10 = (char *)&v28 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = sub_2390D8778();
  uint64_t v14 = *(void **)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v33 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v18 = (char *)&v28 - v17;
  sub_23904CD24(a1, (uint64_t)v12, (uint64_t *)&unk_2689BEE40);
  v19 = (unsigned int (*)(char *, uint64_t, uint64_t))v14[6];
  if (v19(v12, 1, v13) == 1)
  {
    sub_23904477C((uint64_t)v12, (uint64_t *)&unk_2689BEE40);
  }
  else
  {
    v31 = (void (*)(char *, char *, uint64_t))v14[4];
    v31(v18, v12, v13);
    swift_beginAccess();
    uint64_t v32 = v2;
    uint64_t v20 = *(void *)(v2 + 24);
    if (*(void *)(v20 + 16) && (unint64_t v21 = sub_239050710((uint64_t)v18), (v22 & 1) != 0))
    {
      unint64_t v23 = *(void *)(v20 + 56) + v14[9] * v21;
      v29 = (void (*)(char *, unint64_t, uint64_t))v14[2];
      v29(v10, v23, v13);
      v30 = (void (*)(char *, void, uint64_t, uint64_t))v14[7];
      v30(v10, 0, 1, v13);
      if (v19(v10, 1, v13) != 1)
      {
        v24 = v33;
        v31(v33, v10, v13);
        swift_endAccess();
        uint64_t v25 = (uint64_t)v34;
        v29(v34, (unint64_t)v24, v13);
        v30((char *)v25, 0, 1, v13);
        sub_2390CFCDC(v25, a2);
        sub_23904477C(v25, (uint64_t *)&unk_2689BEE40);
        v26 = (void (*)(char *, uint64_t))v14[1];
        v26(v24, v13);
        v26(v18, v13);
        return result;
      }
    }
    else
    {
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v14[7])(v10, 1, 1, v13);
    }
    sub_23904477C((uint64_t)v10, (uint64_t *)&unk_2689BEE40);
    swift_endAccess();
    ((void (*)(char *, uint64_t))v14[1])(v18, v13);
  }
  *(void *)(a2 + 48) = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  return result;
}

uint64_t sub_2390D0874@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2390D8778();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  sub_2390CFCDC((uint64_t)v10, (uint64_t)v21);
  sub_23904477C((uint64_t)v10, (uint64_t *)&unk_2689BEE40);
  if (*((void *)&v22 + 1))
  {
    v24[0] = v21[0];
    v24[1] = v21[1];
    v24[2] = v22;
    uint64_t v25 = v23;
    int v13 = v21[0];
    sub_2390437D0((uint64_t)a1, a2 + 16);
    int v14 = DWORD1(v24[0]);
    char v15 = BYTE8(v24[0]);
    *(_DWORD *)a2 = v13;
    *(_DWORD *)(a2 + 4) = v14;
    *(unsigned char *)(a2 + 8) = v15;
    uint64_t v16 = a1[3];
    uint64_t v17 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v16);
    (*(void (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
    sub_2390531BC(a2, (uint64_t)v21);
    swift_beginAccess();
    sub_2390CE5E4((uint64_t)v21, (uint64_t)v7);
    swift_endAccess();
    return sub_239072798((uint64_t)v24);
  }
  else
  {
    sub_23904477C((uint64_t)v21, (uint64_t *)&unk_2689BDF40);
    sub_239072744();
    swift_allocError();
    unsigned char *v19 = 6;
    return swift_willThrow();
  }
}

uint64_t sub_2390D0B04(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v7 = sub_2390D8778();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v11 = *a1;
  v23[0] = 0;
  sub_2390D0074(v11, (uint64_t)v23);
  uint64_t v12 = v24;
  uint64_t result = sub_23904477C((uint64_t)v23, (uint64_t *)&unk_2689BDF40);
  if (v12)
  {
    uint64_t v14 = *a2;
    v23[0] = 0;
    sub_2390D0074(v14, (uint64_t)v23);
    uint64_t v15 = v24;
    uint64_t result = sub_23904477C((uint64_t)v23, (uint64_t *)&unk_2689BDF40);
    if (v15)
    {
      uint64_t v16 = a1 + 4;
      uint64_t v18 = *((void *)a1 + 5);
      uint64_t v17 = *((void *)a1 + 6);
      __swift_project_boxed_opaque_existential_1(v16, v18);
      (*(void (**)(uint64_t, uint64_t))(v17 + 24))(v18, v17);
      v19 = a2 + 4;
      uint64_t v21 = *((void *)a2 + 5);
      uint64_t v20 = *((void *)a2 + 6);
      __swift_project_boxed_opaque_existential_1(v19, v21);
      (*(void (**)(uint64_t, uint64_t))(v20 + 24))(v21, v20);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
      swift_beginAccess();
      sub_2390CEA90((uint64_t)v6, (uint64_t)v10);
      return swift_endAccess();
    }
  }
  return result;
}

uint64_t sub_2390D0D2C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2390D8778();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  unsigned int v11 = *(_DWORD *)a1;
  swift_beginAccess();
  sub_2390CEC80(v11, (uint64_t)v10);
  swift_endAccess();
  sub_23904477C((uint64_t)v10, (uint64_t *)&unk_2689BEE40);
  uint64_t v12 = (void *)(a1 + 16);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  __swift_project_boxed_opaque_existential_1(v12, v14);
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v14, v13);
  swift_beginAccess();
  sub_2390D2100((uint64_t)v7, (uint64_t)v19);
  swift_endAccess();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  sub_23904477C((uint64_t)v19, (uint64_t *)&unk_2689BDF40);
  sub_2390437D0((uint64_t)v12, (uint64_t)v19);
  uint64_t v15 = v20;
  uint64_t v16 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  sub_2390D6840((void (*)(void *))sub_2390D42B8, v2, v15, v16);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
}

uint64_t sub_2390D0F58(void *a1)
{
  uint64_t v2 = sub_2390D8778();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(v10 + 24))(v9, v10);
  swift_beginAccess();
  sub_2390D237C((uint64_t)v5, (uint64_t)v8);
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_23904477C((uint64_t)v8, (uint64_t *)&unk_2689BEE40);
}

id sub_2390D10EC(uint64_t a1, uint64_t a2)
{
  LOBYTE(v17) = 0;
  sub_2390D0074(a1, (uint64_t)v14);
  if (*((void *)&v15 + 1))
  {
    long long v17 = v14[0];
    long long v18 = v14[1];
    long long v19 = v15;
    uint64_t v20 = v16;
    if (qword_2689BD438 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2390D8808();
    __swift_project_value_buffer(v4, (uint64_t)qword_2689C6788);
    sub_2390449CC(0xD000000000000065, 0x80000002390E06E0, 0xD00000000000001FLL, 0x80000002390E0750);
    if ((BYTE8(v17) & 1) != 0 || DWORD1(v17) != a1)
    {
      id v12 = sub_2390CFB08((uint64_t)&v17, a2);
    }
    else
    {
      uint64_t v5 = self;
      uint64_t v6 = *((void *)&v19 + 1);
      uint64_t v7 = v20;
      __swift_project_boxed_opaque_existential_1(&v18, *((uint64_t *)&v19 + 1));
      (*(void (**)(uint64_t, uint64_t))(v7 + 48))(v6, v7);
      uint64_t v8 = (void *)sub_2390D88F8();
      swift_bridgeObjectRelease();
      uint64_t v9 = *((void *)&v19 + 1);
      uint64_t v10 = v20;
      __swift_project_boxed_opaque_existential_1(&v18, *((uint64_t *)&v19 + 1));
      (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v9, v10);
      unsigned int v11 = (void *)sub_2390D88F8();
      swift_bridgeObjectRelease();
      id v12 = objc_msgSend(v5, sel_nodeWithIdentifier_name_type_value_, a1, v8, 3, v11);
    }
    sub_239072798((uint64_t)&v17);
  }
  else
  {
    sub_23904477C((uint64_t)v14, (uint64_t *)&unk_2689BDF40);
    return 0;
  }
  return v12;
}

id sub_2390D1314()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v32[-2] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2390D8778();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v32[-2] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v1 + OBJC_IVAR____TtC10AirPlayKit27RemoteInspectorNodeRegistry_displayTree;
  swift_beginAccess();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
LABEL_4:
    sub_23904477C((uint64_t)v4, (uint64_t *)&unk_2689BEE40);
LABEL_5:
    if (qword_2689BD438 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_2390D8808();
    __swift_project_value_buffer(v11, (uint64_t)qword_2689C6788);
    id v12 = sub_2390D87E8();
    os_log_type_t v13 = sub_2390D8BA8();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_23903B000, v12, v13, "Failed to get root node", v14, 2u);
      MEMORY[0x23EC9C220](v14, -1, -1);
    }

    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    goto LABEL_4;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  swift_beginAccess();
  uint64_t v17 = *(void *)(v1 + 32);
  if (!*(void *)(v17 + 16) || (unint64_t v18 = sub_239050710((uint64_t)v8), (v19 & 1) == 0))
  {
    uint64_t v35 = 0;
    long long v34 = 0u;
    memset(v33, 0, sizeof(v33));
    goto LABEL_19;
  }
  sub_2390531BC(*(void *)(v17 + 56) + 56 * v18, (uint64_t)v33);
  if (!*((void *)&v34 + 1))
  {
LABEL_19:
    sub_23904477C((uint64_t)v33, (uint64_t *)&unk_2689BDF40);
    swift_endAccess();
    goto LABEL_20;
  }
  sub_2390531BC((uint64_t)v33, (uint64_t)v32);
  sub_23904477C((uint64_t)v33, (uint64_t *)&unk_2689BDF40);
  swift_endAccess();
  uint64_t v20 = v32[0];
  sub_239072798((uint64_t)v32);
  id v21 = sub_2390D10EC(v20, 3);
  if (!v21)
  {
LABEL_20:
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    goto LABEL_5;
  }
  id v22 = v21;
  if (qword_2689BD438 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_2390D8808();
  __swift_project_value_buffer(v23, (uint64_t)qword_2689C6788);
  sub_2390449CC(0xD000000000000065, 0x80000002390E06E0, 0x75636F44656B616DLL, 0xEE002928746E656DLL);
  uint64_t v24 = self;
  uint64_t v25 = (void *)sub_2390D88F8();
  v26 = (void *)sub_2390D88F8();
  id v15 = objc_msgSend(v24, sel_nodeWithIdentifier_name_type_value_, 0, v25, 9, v26);

  objc_msgSend(v15, sel_setNodeType_, 9);
  v27 = (void *)sub_2390D88F8();
  objc_msgSend(v15, sel_setDocumentURL_, v27);

  uint64_t v28 = (void *)sub_2390D88F8();
  objc_msgSend(v15, sel_setXmlVersion_, v28);

  objc_msgSend(v15, sel_setChildNodeCount_, 1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE50);
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_2390DE930;
  *(void *)(v29 + 32) = v22;
  *(void *)&v33[0] = v29;
  sub_2390D8A68();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689BE8F0);
  v30 = (void *)sub_2390D8A38();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setChildren_, v30);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v15;
}

void sub_2390D18F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v7 = sub_2390D87D8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BE980);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v47 - v15;
  v61[0] = sub_23904E878(MEMORY[0x263F8EE78]);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
  uint64_t v18 = *(void *)(v17 - 8);
  v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  uint64_t v51 = v18 + 56;
  v52(v16, 1, 1, v17);
  sub_2390D87B8();
  sub_239067CC0((uint64_t)v16, (uint64_t)v10, a1, (uint64_t)v61);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_23904477C((uint64_t)v16, (uint64_t *)&unk_2689BE980);
  uint64_t v19 = v61[0];
  uint64_t v20 = a2 + OBJC_IVAR____TtC10AirPlayKit27RemoteInspectorNodeRegistry_displayTree;
  swift_beginAccess();
  sub_23904CD24(v20, (uint64_t)v14, (uint64_t *)&unk_2689BE980);
  uint64_t v21 = sub_2390BF540((uint64_t)v14, a1);
  sub_23904477C((uint64_t)v14, (uint64_t *)&unk_2689BE980);
  if (v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v64 = 0;
  uint64_t v55 = v19;
  uint64_t v54 = v20;
  v50 = v16;
  uint64_t v49 = v17;
  uint64_t v22 = v21;
  if (!*(void *)(v21 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v23 = a1;
  if (qword_2689BD438 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_2390D8808();
  uint64_t v25 = __swift_project_value_buffer(v24, (uint64_t)qword_2689C6788);
  swift_bridgeObjectRetain();
  v47[1] = v25;
  v26 = sub_2390D87E8();
  os_log_type_t v27 = sub_2390D8BB8();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v53 = a2;
  uint64_t v48 = v23;
  if (v28)
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 134217984;
    v61[0] = *(void *)(v21 + 16);
    sub_2390D8C98();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23903B000, v26, v27, "Merging %ld actions", v29, 0xCu);
    MEMORY[0x23EC9C220](v29, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  uint64_t v30 = v49;
  uint64_t v31 = (uint64_t)v50;
  uint64_t v32 = v52;
  uint64_t v33 = *(void *)(v21 + 16);
  if (v33)
  {
    uint64_t v34 = v22 + 32;
    v47[0] = v22;
    swift_bridgeObjectRetain();
    uint64_t v35 = &qword_2689BEB90;
    uint64_t v36 = v54;
    while (1)
    {
      sub_2390437D0(v34, (uint64_t)v60);
      __swift_instantiateConcreteTypeFromMangledName(v35);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2689BEE60);
      if (swift_dynamicCast())
      {
        v37 = v35;
        sub_239043718(v58, (uint64_t)v61);
        uint64_t v38 = v62;
        uint64_t v39 = v63;
        __swift_project_boxed_opaque_existential_1(v61, v62);
        v60[3] = type metadata accessor for RemoteInspectorNodeRegistry();
        v60[4] = &off_26EC869E0;
        v60[0] = v53;
        v40 = *(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 16);
        swift_retain();
        uint64_t v41 = v64;
        v40(v60, v55, v56, v57, v38, v39);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
        uint64_t v64 = v41;
        if (v41)
        {
          swift_bridgeObjectRelease();
LABEL_23:
          swift_bridgeObjectRelease_n();
          return;
        }
        uint64_t v36 = v54;
        uint64_t v35 = v37;
      }
      else
      {
        uint64_t v59 = 0;
        memset(v58, 0, sizeof(v58));
        sub_23904477C((uint64_t)v58, &qword_2689BEE68);
      }
      v34 += 40;
      if (!--v33)
      {
        swift_bridgeObjectRelease();
        uint64_t v42 = v47[0];
        uint64_t v30 = v49;
        uint64_t v31 = (uint64_t)v50;
        uint64_t v32 = v52;
        goto LABEL_19;
      }
    }
  }
  uint64_t v42 = v22;
  uint64_t v36 = v54;
LABEL_19:
  swift_bridgeObjectRelease();
  sub_23904CD24(v48, v31, &qword_2689BD990);
  v32((char *)v31, 0, 1, v30);
  swift_beginAccess();
  sub_2390C65A0(v31, v36);
  swift_endAccess();
  swift_bridgeObjectRetain();
  v43 = sub_2390D87E8();
  os_log_type_t v44 = sub_2390D8BB8();
  if (!os_log_type_enabled(v43, v44))
  {

    goto LABEL_23;
  }
  v45 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v45 = 134217984;
  uint64_t v46 = *(void *)(v42 + 16);
  swift_bridgeObjectRelease();
  v61[0] = v46;
  sub_2390D8C98();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_23903B000, v43, v44, "Merged %ld actions", v45, 0xCu);
  MEMORY[0x23EC9C220](v45, -1, -1);
}

double sub_2390D1FC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_2390507A8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v19 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2390A48D0();
      uint64_t v11 = v19;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56) + 72 * v8;
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t v14 = *(void *)(v12 + 32);
    char v15 = *(unsigned char *)(v12 + 40);
    char v16 = *(unsigned char *)(v12 + 41);
    char v17 = *(unsigned char *)(v12 + 64);
    *(void *)a3 = *(void *)v12;
    *(void *)(a3 + 8) = v13;
    *(_OWORD *)(a3 + 16) = *(_OWORD *)(v12 + 16);
    *(void *)(a3 + 32) = v14;
    *(unsigned char *)(a3 + 40) = v15;
    *(unsigned char *)(a3 + 41) = v16;
    *(_OWORD *)(a3 + 48) = *(_OWORD *)(v12 + 48);
    *(unsigned char *)(a3 + 64) = v17;
    sub_2390D2544(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(unsigned char *)(a3 + 64) = 0;
    double result = 0.0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_2390D2100@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_239050710(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v15 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2390A4C90();
      uint64_t v9 = v15;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_2390D8778();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    uint64_t v12 = *(void *)(v9 + 56) + 56 * v6;
    long long v13 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v12;
    *(_OWORD *)(a2 + 16) = v13;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)(v12 + 32);
    *(void *)(a2 + 48) = *(void *)(v12 + 48);
    sub_2390D2734(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a2 + 48) = 0;
    double result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
  }
  return result;
}

double sub_2390D2248@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_239050710(a1);
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
      sub_2390A4F50();
      uint64_t v9 = v13;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_2390D8778();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10 + *(void *)(*(void *)(v11 - 8) + 72) * v6, v11);
    sub_239043718((long long *)(*(void *)(v9 + 56) + 40 * v6), a2);
    sub_2390D2A50(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2390D237C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_239050710(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v9 = *v3;
    uint64_t v21 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2390A548C();
      uint64_t v9 = v21;
    }
    uint64_t v10 = *(void *)(v9 + 48);
    uint64_t v11 = sub_2390D8778();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v20 = v12;
    unint64_t v13 = *(void *)(v12 + 72) * v6;
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v10 + v13, v11);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a2, *(void *)(v9 + 56) + v13, v11);
    sub_2390D2F40(v6, v9);
    *uint64_t v3 = v9;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v11;
  }
  else
  {
    uint64_t v18 = sub_2390D8778();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return v14(v15, v16, 1, v17);
}

unint64_t sub_2390D2544(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = sub_2390D8CE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2390D8F98();
        swift_bridgeObjectRetain();
        sub_2390D89A8();
        uint64_t v9 = sub_2390D8FF8();
        double result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          double result = v14 + 72 * v3;
          uint64_t v15 = (const void *)(v14 + 72 * v6);
          if (72 * v3 < (uint64_t)(72 * v6) || result >= (unint64_t)v15 + 72 || (BOOL v16 = v3 == v6, v3 = v6, !v16))
          {
            double result = (unint64_t)memmove((void *)result, v15, 0x48uLL);
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *uint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2390D2734(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2390D8778();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v42 = a2 + 64;
    unint64_t result = sub_2390D8CE8();
    uint64_t v12 = v42;
    if ((*(void *)(v42 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      unint64_t v39 = (result + 1) & v11;
      v40 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v41 = v13;
      BOOL v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      uint64_t v17 = v15;
      uint64_t v18 = v11;
      do
      {
        uint64_t v19 = v17;
        int64_t v20 = v17 * v10;
        uint64_t v21 = v18;
        v40(v8, *(void *)(a2 + 48) + v17 * v10, v4);
        sub_2390D4328((unint64_t *)&qword_2689BD830, MEMORY[0x263F07508]);
        uint64_t v22 = sub_2390D88B8();
        unint64_t result = (*v16)(v8, v4);
        uint64_t v18 = v21;
        unint64_t v23 = v22 & v21;
        if (a1 >= (uint64_t)v39)
        {
          if (v23 >= v39 && a1 >= (uint64_t)v23)
          {
LABEL_16:
            uint64_t v26 = *(void *)(a2 + 48);
            uint64_t v17 = v19;
            unint64_t result = v26 + v19 * a1;
            if (v19 * a1 < v20 || result >= v26 + v20 + v19)
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              uint64_t v18 = v21;
            }
            else if (v19 * a1 != v20)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            uint64_t v27 = *(void *)(a2 + 56);
            unint64_t v28 = v27 + 56 * a1;
            uint64_t v29 = (long long *)(v27 + 56 * v10);
            uint64_t v12 = v42;
            if (a1 != v10 || (a1 = v10, v28 >= (unint64_t)v29 + 56))
            {
              long long v30 = *v29;
              long long v31 = v29[1];
              long long v32 = v29[2];
              *(void *)(v28 + 48) = *((void *)v29 + 6);
              *(_OWORD *)(v28 + 16) = v31;
              *(_OWORD *)(v28 + 32) = v32;
              *(_OWORD *)unint64_t v28 = v30;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v23 >= v39 || a1 >= (uint64_t)v23)
        {
          goto LABEL_16;
        }
        uint64_t v12 = v42;
        uint64_t v17 = v19;
LABEL_5:
        unint64_t v10 = (v10 + 1) & v18;
      }
      while (((*(void *)(v12 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v33 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v34 = *v33;
    uint64_t v35 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v33 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v35 = *v33;
    uint64_t v34 = (-1 << a1) - 1;
  }
  uint64_t *v33 = v35 & v34;
  uint64_t v36 = *(void *)(a2 + 16);
  BOOL v37 = __OFSUB__(v36, 1);
  uint64_t v38 = v36 - 1;
  if (v37)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v38;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2390D2A50(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2390D8778();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_2390D8CE8();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      unint64_t v37 = (result + 1) & v12;
      uint64_t v38 = v13;
      uint64_t v14 = *(void *)(v5 + 72);
      uint64_t v39 = v5 + 16;
      uint64_t v36 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v15 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v14;
        int64_t v18 = v14 * v11;
        uint64_t v19 = v15;
        v38(v8, *(void *)(a2 + 48) + v14 * v11, v4);
        sub_2390D4328((unint64_t *)&qword_2689BD830, MEMORY[0x263F07508]);
        uint64_t v20 = sub_2390D88B8();
        unint64_t result = (*v36)(v8, v4);
        uint64_t v15 = v19;
        unint64_t v21 = v20 & v19;
        if (a1 >= (uint64_t)v37)
        {
          if (v21 >= v37 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v24 = *(void *)(a2 + 48);
            unint64_t result = v24 + v17 * a1;
            uint64_t v9 = v16;
            if (v17 * a1 < v18 || (uint64_t v14 = v17, result >= v24 + v18 + v17))
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              uint64_t v14 = v17;
              uint64_t v15 = v19;
            }
            else if (v17 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            uint64_t v25 = *(void *)(a2 + 56);
            unint64_t v26 = v25 + 40 * a1;
            uint64_t v27 = (long long *)(v25 + 40 * v11);
            if (a1 != v11 || (a1 = v11, v26 >= (unint64_t)v27 + 40))
            {
              long long v28 = *v27;
              long long v29 = v27[1];
              *(void *)(v26 + 32) = *((void *)v27 + 4);
              *(_OWORD *)unint64_t v26 = v28;
              *(_OWORD *)(v26 + 16) = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v37 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
        uint64_t v14 = v17;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v15;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    long long v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    long long v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  uint64_t *v30 = v32 & v31;
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

unint64_t sub_2390D2D6C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    unint64_t result = sub_2390D8CE8();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        uint64_t v10 = (_DWORD *)(v9 + 4 * v6);
        unint64_t result = MEMORY[0x23EC9B870](*(void *)(a2 + 40), *v10, 4);
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8 || v3 < (uint64_t)v11) {
            goto LABEL_6;
          }
        }
        else if (v11 < v8 && v3 < (uint64_t)v11)
        {
          goto LABEL_6;
        }
        uint64_t v14 = (_DWORD *)(v9 + 4 * v3);
        if (v3 != v6 || v14 >= v10 + 1) {
          _DWORD *v14 = *v10;
        }
        uint64_t v15 = *(void *)(a2 + 56);
        uint64_t v16 = *(void *)(*(void *)(sub_2390D8778() - 8) + 72);
        int64_t v17 = v16 * v3;
        unint64_t result = v15 + v16 * v3;
        int64_t v18 = v16 * v6;
        unint64_t v19 = v15 + v16 * v6 + v16;
        if (v17 < v18 || result >= v19)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v17 == v18) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v22 = *v21;
    uint64_t v23 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v21 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v23 = *v21;
    uint64_t v22 = (-1 << result) - 1;
  }
  *unint64_t v21 = v23 & v22;
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
  return result;
}

unint64_t sub_2390D2F40(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2390D8778();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v33 = a2 + 64;
    unint64_t result = sub_2390D8CE8();
    uint64_t v12 = v33;
    if ((*(void *)(v33 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      unint64_t v31 = (result + 1) & v11;
      uint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v13 = v5 + 16;
      long long v30 = v14;
      uint64_t v15 = *(void *)(v13 + 56);
      uint64_t v32 = v13;
      uint64_t v16 = (uint64_t (**)(char *, uint64_t))(v13 - 8);
      do
      {
        int64_t v17 = v15 * v10;
        v30(v8, *(void *)(a2 + 48) + v15 * v10, v4);
        sub_2390D4328((unint64_t *)&qword_2689BD830, MEMORY[0x263F07508]);
        uint64_t v18 = sub_2390D88B8();
        unint64_t result = (*v16)(v8, v4);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v31)
        {
          if (v19 < v31 || a1 < (uint64_t)v19) {
            goto LABEL_6;
          }
        }
        else if (v19 < v31 && a1 < (uint64_t)v19)
        {
          goto LABEL_6;
        }
        int64_t v22 = v15 * a1;
        if (v15 * a1 < v17 || *(void *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(void *)(a2 + 48) + v17 + v15))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v22 != v17)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        uint64_t v23 = *(void *)(a2 + 56);
        unint64_t result = v23 + v22;
        if (v22 < v17 || result >= v23 + v17 + v15)
        {
          unint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v22 == v17) {
            goto LABEL_6;
          }
          unint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        unint64_t v10 = (v10 + 1) & v11;
        uint64_t v12 = v33;
      }
      while (((*(void *)(v33 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    uint64_t v24 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v24 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1 << a1) - 1;
  }
  uint64_t *v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2390D3244(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2390D8778();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_239050710(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2390A4C90();
      goto LABEL_7;
    }
    sub_239051BB0(v17, a3 & 1);
    unint64_t v23 = sub_239050710(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_2390D3AE4(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_2390D8F28();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 56 * v14;
  return sub_2390D3BB8((uint64_t)a1, v21);
}

uint64_t sub_2390D3414(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2390D8778();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_239050710(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_2390A4F50();
      goto LABEL_7;
    }
    sub_239052020(v17, a3 & 1);
    unint64_t v23 = sub_239050710(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_2390D3C14(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_2390D8F28();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 40 * v14;
  __swift_destroy_boxed_opaque_existential_1(v21);
  return sub_239043718(a1, v21);
}

uint64_t sub_2390D35F0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_2390507A8(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_18;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2390A48D0();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7] + 72 * v12;
      return sub_2390D3E60(a1, v19);
    }
    goto LABEL_13;
  }
  sub_2390514F4(v15, a4 & 1);
  unint64_t v21 = sub_2390507A8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_19:
    uint64_t result = sub_2390D8F28();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_13:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  uint64_t v24 = v18[7] + 72 * v12;
  *(_OWORD *)uint64_t v24 = *(_OWORD *)a1;
  long long v25 = *(_OWORD *)(a1 + 16);
  long long v26 = *(_OWORD *)(a1 + 32);
  long long v27 = *(_OWORD *)(a1 + 48);
  *(unsigned char *)(v24 + 64) = *(unsigned char *)(a1 + 64);
  *(_OWORD *)(v24 + 32) = v26;
  *(_OWORD *)(v24 + 48) = v27;
  *(_OWORD *)(v24 + 16) = v25;
  uint64_t v28 = v18[2];
  BOOL v29 = __OFADD__(v28, 1);
  uint64_t v30 = v28 + 1;
  if (v29)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v18[2] = v30;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2390D3790(uint64_t a1, unsigned int a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v10 = sub_239050820(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = v8[3];
  if (v15 < v13 || (a3 & 1) == 0)
  {
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_2390A51FC();
      goto LABEL_7;
    }
    sub_239052470(v13, a3 & 1);
    unint64_t v24 = sub_239050820(a2);
    if ((v14 & 1) == (v25 & 1))
    {
      unint64_t v10 = v24;
      char v16 = *v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = sub_2390D8F28();
    __break(1u);
    return result;
  }
LABEL_7:
  char v16 = *v4;
  if (v14)
  {
LABEL_8:
    uint64_t v17 = v16[7];
    uint64_t v18 = sub_2390D8778();
    uint64_t v19 = *(void *)(v18 - 8);
    uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 40);
    uint64_t v21 = v18;
    uint64_t v22 = v17 + *(void *)(v19 + 72) * v10;
    return v20(v22, a1, v21);
  }
LABEL_13:
  return sub_2390D3CD8(v10, a2, a1, v16);
}

uint64_t sub_2390D38F8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_2390D8778();
  uint64_t v26 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  unint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)*v3;
  unint64_t v13 = sub_239050710(a2);
  uint64_t v14 = v11[2];
  BOOL v15 = (v12 & 1) == 0;
  uint64_t v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v17 = v12;
  uint64_t v18 = v11[3];
  if (v18 < v16 || (a3 & 1) == 0)
  {
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_2390A548C();
      goto LABEL_7;
    }
    sub_23905281C(v16, a3 & 1);
    unint64_t v23 = sub_239050710(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      unint64_t v13 = v23;
      uint64_t v19 = *v4;
      if (v17) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v10, a2, v8);
      return sub_2390D3D84(v13, (uint64_t)v10, a1, v19);
    }
LABEL_15:
    uint64_t result = sub_2390D8F28();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v19 = *v4;
  if ((v17 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v20 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v26 + 40);
  unint64_t v21 = v19[7] + *(void *)(v26 + 72) * v13;
  return v20(v21, a1, v8);
}

uint64_t sub_2390D3AE4(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2390D8778();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v11 = a4[7] + 56 * a1;
  *(void *)(v11 + 48) = *((void *)a3 + 6);
  long long v12 = a3[2];
  long long v13 = *a3;
  *(_OWORD *)(v11 + 16) = a3[1];
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)uint64_t v11 = v13;
  uint64_t v14 = a4[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a4[2] = v16;
  }
  return result;
}

uint64_t sub_2390D3BB8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2390D3C14(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2390D8778();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_239043718(a3, a4[7] + 40 * a1);
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

uint64_t sub_2390D3CD8(unint64_t a1, int a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_DWORD *)(a4[6] + 4 * a1) = a2;
  uint64_t v7 = a4[7];
  uint64_t v8 = sub_2390D8778();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v7 + *(void *)(*(void *)(v8 - 8) + 72) * a1, a3, v8);
  uint64_t v10 = a4[2];
  BOOL v11 = __OFADD__(v10, 1);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a4[2] = v12;
  }
  return result;
}

uint64_t sub_2390D3D84(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_2390D8778();
  uint64_t v10 = *(void *)(v9 - 8);
  BOOL v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  uint64_t v12 = *(void *)(v10 + 72) * a1;
  v11(v8 + v12, a2, v9);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v11)(a4[7] + v12, a3, v9);
  uint64_t v14 = a4[2];
  BOOL v15 = __OFADD__(v14, 1);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    a4[2] = v16;
  }
  return result;
}

uint64_t sub_2390D3E60(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2390D3EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_2390D8778();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v36 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  BOOL v15 = (char *)v32 - v14;
  uint64_t result = MEMORY[0x263F8EE78];
  uint64_t v47 = MEMORY[0x263F8EE78];
  uint64_t v17 = *(void *)(a1 + 16);
  if (v17)
  {
    v32[2] = v3;
    uint64_t v18 = a2;
    uint64_t v19 = (void *)(a1 + 32);
    uint64_t v38 = v18;
    uint64_t v35 = (uint64_t *)(v18 + 32);
    v40 = (void (**)(char *, void, uint64_t, uint64_t))(v8 + 56);
    uint64_t v20 = a1;
    unint64_t v21 = (unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    BOOL v34 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    uint64_t v33 = (void (**)(uint64_t, uint64_t))(v8 + 8);
    uint64_t v37 = a3 - 1;
    BOOL v22 = __OFSUB__(a3, 1);
    BOOL v39 = v22;
    v32[1] = v20;
    swift_bridgeObjectRetain();
    while (1)
    {
      uint64_t v23 = v19[3];
      uint64_t v24 = v19[4];
      __swift_project_boxed_opaque_existential_1(v19, v23);
      (*(void (**)(uint64_t, uint64_t))(v24 + 24))(v23, v24);
      (*v40)(v15, 0, 1, v7);
      sub_23904CD24((uint64_t)v15, (uint64_t)v13, (uint64_t *)&unk_2689BEE40);
      if ((*v21)(v13, 1, v7) == 1)
      {
        sub_23904477C((uint64_t)v13, (uint64_t *)&unk_2689BEE40);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v44 = 0;
      }
      else
      {
        uint64_t v25 = (uint64_t)v36;
        (*v34)(v36, v13, v7);
        uint64_t v26 = v35;
        swift_beginAccess();
        uint64_t v27 = *v26;
        if (*(void *)(v27 + 16) && (unint64_t v28 = sub_239050710(v25), (v29 & 1) != 0))
        {
          sub_2390531BC(*(void *)(v27 + 56) + 56 * v28, (uint64_t)&v41);
        }
        else
        {
          uint64_t v44 = 0;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v41 = 0u;
        }
        swift_endAccess();
        (*v33)(v25, v7);
      }
      uint64_t result = sub_23904477C((uint64_t)v15, (uint64_t *)&unk_2689BEE40);
      if (*((void *)&v43 + 1))
      {
        v45[0] = v41;
        v45[1] = v42;
        v45[2] = v43;
        uint64_t v46 = v44;
        if (v39)
        {
          __break(1u);
          return result;
        }
        uint64_t v30 = sub_2390CFB08(v45, v37);
        uint64_t v31 = sub_239072798((uint64_t)v45);
        if (v30)
        {
          MEMORY[0x23EC9B310](v31);
          if (*(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_2390D8A78();
          }
          sub_2390D8A98();
          sub_2390D8A68();
        }
      }
      else
      {
        sub_23904477C((uint64_t)&v41, (uint64_t *)&unk_2689BDF40);
      }
      v19 += 5;
      if (!--v17)
      {
        swift_bridgeObjectRelease();
        return v47;
      }
    }
  }
  return result;
}

uint64_t sub_2390D42B8(void *a1)
{
  return sub_2390D0F58(a1);
}

uint64_t sub_2390D42C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BE980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_2390D4328(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t NullAirPlayConnectionProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NullAirPlayConnectionProvider.init()()
{
  return v0;
}

uint64_t NullAirPlayConnectionProvider.deinit()
{
  return v0;
}

uint64_t NullAirPlayConnectionProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t NullAirPlayConnectionProvider.makeAirPlayConnection(from:)()
{
  return MEMORY[0x270FA2498](sub_2390D43BC, 0, 0);
}

uint64_t sub_2390D43BC()
{
  type metadata accessor for NullAirPlayConnection();
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2390D443C()
{
  return MEMORY[0x270FA2498](sub_2390D44A8, 0, 0);
}

uint64_t type metadata accessor for NullAirPlayConnectionProvider()
{
  return self;
}

uint64_t method lookup function for NullAirPlayConnectionProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NullAirPlayConnectionProvider);
}

uint64_t dispatch thunk of NullAirPlayConnectionProvider.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of AirPlayOverlayAdaptorDelegate.didConnect(adaptor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of AirPlayOverlayAdaptorDelegate.adaptor(_:connectionDidFailWithError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AirPlayOverlayAdaptorDelegate.didDisconnect(adaptor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AirPlayOverlayActionSending.assertConnected()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AirPlayOverlayActionSending.sendAction(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 16) + **(int **)(a3 + 16));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_23904BEF4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of AirPlayOverlayAdapting.delegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AirPlayOverlayAdapting.delegate.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of AirPlayOverlayAdapting.delegate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of AirPlayOverlayAdapting.activate(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AirPlayOverlayAdapting.deactivate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AirPlayOverlayAdapting.connect()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 56) + **(int **)(a2 + 56));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_23904B280;
  return v7(a1, a2);
}

unint64_t sub_2390D4768(uint64_t a1)
{
  unint64_t result = sub_2390D4790();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2390D4790()
{
  unint64_t result = qword_2689BDFF0;
  if (!qword_2689BDFF0)
  {
    type metadata accessor for ImageContent(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689BDFF0);
  }
  return result;
}

uint64_t sub_2390D47E8(uint64_t a1, uint64_t a2)
{
  return sub_239055E4C(a1, a2);
}

uint64_t dispatch thunk of RenderActionProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RenderActionProtocol.serialize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_2390D4828(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689BDA28);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2390DA4A0;
  *(void *)(inited + 32) = 1701869940;
  *(void *)(inited + 40) = 0xE400000000000000;
  uint64_t v21 = 0x6E6F6974636E7566;
  unint64_t v22 = 0xE800000000000000;
  sub_2390D8D28();
  *(void *)(inited + 88) = 0x6E6F69746361;
  *(void *)(inited + 96) = 0xE600000000000000;
  uint64_t v21 = a1;
  unint64_t v22 = a2;
  swift_bridgeObjectRetain();
  sub_2390D8D28();
  *(void *)(inited + 144) = 0x55557463656A626FLL;
  *(void *)(inited + 152) = 0xEA00000000004449;
  sub_23904CD24(a3, (uint64_t)v9, (uint64_t *)&unk_2689BEE40);
  uint64_t v11 = sub_2390D8778();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11) == 1)
  {
    sub_2390D4AB4((uint64_t)v9);
    *(_OWORD *)(inited + 160) = 0u;
    *(_OWORD *)(inited + 176) = 0u;
    *(void *)(inited + 192) = 0;
  }
  else
  {
    uint64_t v13 = sub_2390D8748();
    unint64_t v15 = v14;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    uint64_t v21 = v13;
    unint64_t v22 = v15;
    sub_2390D8D28();
  }
  *(void *)(inited + 200) = 0x746E656D75677261;
  *(void *)(inited + 208) = 0xE900000000000073;
  sub_23904CD24(v20, inited + 216, &qword_2689BDA30);
  unint64_t v16 = sub_23904E3D0(inited);
  uint64_t v17 = sub_23904EF3C(v16);
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_2390D4AB4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static Animatable.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v32 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = v5;
  uint64_t v34 = v6;
  uint64_t v7 = type metadata accessor for Animatable();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v31 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v31 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v35 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v20 = (char *)&v31 - v19;
  uint64_t v21 = (char *)&v31 + *(int *)(v18 + 48) - v19;
  uint64_t v33 = v8;
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v22((char *)&v31 - v19, v37, v7);
  v22(v21, v38, v7);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v22(v14, (uint64_t)v20, v7);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
LABEL_4:
        type metadata accessor for Animation();
        swift_getWitnessTable();
        char v24 = sub_2390D8AB8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_11:
        uint64_t v26 = v33;
        goto LABEL_12;
      }
    }
    else
    {
      v22(v11, (uint64_t)v20, v7);
      if (swift_getEnumCaseMultiPayload() == 2) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = v32;
    v22(v16, (uint64_t)v20, v7);
    if (!swift_getEnumCaseMultiPayload())
    {
      uint64_t v27 = v25;
      uint64_t v28 = v36;
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v4, v21, v36);
      char v24 = sub_2390D88E8();
      char v29 = *(void (**)(char *, uint64_t))(v27 + 8);
      v29(v4, v28);
      v29(v16, v28);
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v36);
  }
  char v24 = 0;
  uint64_t v26 = v35;
  uint64_t v7 = TupleTypeMetadata2;
LABEL_12:
  (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v7);
  return v24 & 1;
}

uint64_t type metadata accessor for Animatable()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t Animatable.hash(into:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v9, v11, a2);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_2390D8FA8();
    type metadata accessor for Animation();
    swift_getWitnessTable();
    sub_2390D8AA8();
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v9, v3);
    sub_2390D8FA8();
    sub_2390D88C8();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t Animatable.hashValue.getter(uint64_t a1)
{
  sub_2390D8F98();
  Animatable.hash(into:)((uint64_t)v3, a1);
  return sub_2390D8FF8();
}

uint64_t sub_2390D5198(uint64_t a1, uint64_t a2)
{
  sub_2390D8F98();
  Animatable.hash(into:)((uint64_t)v4, a2);
  return sub_2390D8FF8();
}

uint64_t sub_2390D51DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static Animatable.== infix(_:_:)(a1, a2, *(void *)(a3 + 16));
}

uint64_t sub_2390D51E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_2390D5204()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void *sub_2390D52A0(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  if (*(void *)(v4 + 64) <= 8uLL) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *(void *)a2;
    *uint64_t v3 = *(void *)a2;
    uint64_t v3 = (void *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    unsigned int v9 = a2[v5];
    unsigned int v10 = v9 - 3;
    if (v9 >= 3)
    {
      if (v5 <= 3) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = 4;
      }
      switch(v11)
      {
        case 1:
          int v12 = *a2;
          goto LABEL_19;
        case 2:
          int v12 = *(unsigned __int16 *)a2;
          goto LABEL_19;
        case 3:
          int v12 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_19;
        case 4:
          int v12 = *(_DWORD *)a2;
LABEL_19:
          int v13 = (v12 | (v10 << (8 * v5))) + 3;
          unsigned int v9 = v12 + 3;
          if (v5 < 4) {
            unsigned int v9 = v13;
          }
          break;
        default:
          break;
      }
    }
    if (v9 == 2)
    {
      *a1 = *(void *)a2;
      char v14 = 2;
    }
    else
    {
      if (v9 != 1)
      {
        (*(void (**)(void *))(v4 + 16))(a1);
        *((unsigned char *)v3 + v5) = 0;
        return v3;
      }
      *a1 = *(void *)a2;
      char v14 = 1;
    }
    *((unsigned char *)a1 + v5) = v14;
    swift_bridgeObjectRetain();
  }
  return v3;
}

uint64_t sub_2390D5434(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (v2 <= 8) {
    unint64_t v2 = 8;
  }
  unsigned int v3 = a1[v2];
  unsigned int v4 = v3 - 3;
  if (v3 >= 3)
  {
    if (v2 <= 3) {
      uint64_t v5 = v2;
    }
    else {
      uint64_t v5 = 4;
    }
    switch(v5)
    {
      case 1:
        int v6 = *a1;
        goto LABEL_12;
      case 2:
        int v6 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v6 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v6 = *(_DWORD *)a1;
LABEL_12:
        int v7 = (v6 | (v4 << (8 * v2))) + 3;
        unsigned int v3 = v6 + 3;
        if (v2 < 4) {
          unsigned int v3 = v7;
        }
        break;
      default:
        break;
    }
  }
  if (v3 == 2 || v3 == 1) {
    return swift_bridgeObjectRelease();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
  }
}

void *sub_2390D553C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 3;
  if (v5 >= 3)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 3;
        unsigned int v5 = v8 + 3;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 2)
  {
    *a1 = *(void *)a2;
    char v10 = 2;
  }
  else
  {
    if (v5 != 1)
    {
      (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 16))(a1);
      *((unsigned char *)a1 + v4) = 0;
      return a1;
    }
    *a1 = *(void *)a2;
    char v10 = 1;
  }
  *((unsigned char *)a1 + v4) = v10;
  swift_bridgeObjectRetain();
  return a1;
}

unsigned __int8 *sub_2390D5690(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 3;
    if (v8 >= 3)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 3;
          unsigned int v8 = v11 + 3;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 2 || v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 3;
          unsigned int v13 = v16 + 3;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 2)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 2;
    }
    else
    {
      if (v13 != 1)
      {
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        a1[v7] = 0;
        return a1;
      }
      *(void *)a1 = *(void *)a2;
      char v18 = 1;
    }
    a1[v7] = v18;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *sub_2390D58CC(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  unsigned int v5 = a2[v4];
  unsigned int v6 = v5 - 3;
  if (v5 >= 3)
  {
    if (v4 <= 3) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = 4;
    }
    switch(v7)
    {
      case 1:
        int v8 = *a2;
        goto LABEL_13;
      case 2:
        int v8 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v8 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v8 = *(_DWORD *)a2;
LABEL_13:
        int v9 = (v8 | (v6 << (8 * v4))) + 3;
        unsigned int v5 = v8 + 3;
        if (v4 < 4) {
          unsigned int v5 = v9;
        }
        break;
      default:
        break;
    }
  }
  if (v5 == 2)
  {
    *a1 = *(void *)a2;
    char v10 = 2;
  }
  else if (v5 == 1)
  {
    *a1 = *(void *)a2;
    char v10 = 1;
  }
  else
  {
    (*(void (**)(void *))(*(void *)(*(void *)(a3 + 16) - 8) + 32))(a1);
    char v10 = 0;
  }
  *((unsigned char *)a1 + v4) = v10;
  return a1;
}

unsigned __int8 *sub_2390D5A1C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 8uLL) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = a1[v7];
    unsigned int v9 = v8 - 3;
    if (v8 >= 3)
    {
      if (v7 <= 3) {
        uint64_t v10 = v7;
      }
      else {
        uint64_t v10 = 4;
      }
      switch(v10)
      {
        case 1:
          int v11 = *a1;
          goto LABEL_14;
        case 2:
          int v11 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v11 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v11 = *(_DWORD *)a1;
LABEL_14:
          int v12 = (v11 | (v9 << (8 * v7))) + 3;
          unsigned int v8 = v11 + 3;
          if (v7 < 4) {
            unsigned int v8 = v12;
          }
          break;
        default:
          break;
      }
    }
    if (v8 == 2 || v8 == 1) {
      swift_bridgeObjectRelease();
    }
    else {
      (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
    }
    unsigned int v13 = a2[v7];
    unsigned int v14 = v13 - 3;
    if (v13 >= 3)
    {
      if (v7 <= 3) {
        uint64_t v15 = v7;
      }
      else {
        uint64_t v15 = 4;
      }
      switch(v15)
      {
        case 1:
          int v16 = *a2;
          goto LABEL_29;
        case 2:
          int v16 = *(unsigned __int16 *)a2;
          goto LABEL_29;
        case 3:
          int v16 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_29;
        case 4:
          int v16 = *(_DWORD *)a2;
LABEL_29:
          int v17 = (v16 | (v14 << (8 * v7))) + 3;
          unsigned int v13 = v16 + 3;
          if (v7 < 4) {
            unsigned int v13 = v17;
          }
          break;
        default:
          break;
      }
    }
    if (v13 == 2)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 2;
    }
    else if (v13 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v18 = 1;
    }
    else
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v18 = 0;
    }
    a1[v7] = v18;
  }
  return a1;
}

uint64_t sub_2390D5C54(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v4 = 8;
  if (*(void *)(v3 + 64) > 8uLL) {
    uint64_t v4 = *(void *)(v3 + 64);
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_22;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_22;
      }
      goto LABEL_14;
    }
    if (v9 < 2)
    {
LABEL_22:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 3) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_22;
  }
LABEL_14:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 254;
}

void sub_2390D5D88(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  if (v5 <= 8) {
    unint64_t v5 = 8;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    int v7 = 0;
  }
  else if (v6 <= 3)
  {
    unsigned int v10 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v10))
    {
      int v7 = 4;
    }
    else if (v10 >= 0x100)
    {
      int v7 = 2;
    }
    else
    {
      int v7 = v10 > 1;
    }
  }
  else
  {
    int v7 = 1;
  }
  if (a2 > 0xFD)
  {
    unsigned int v8 = a2 - 254;
    if (v6 < 4)
    {
      int v9 = (v8 >> (8 * v6)) + 1;
      if (v5 != -1)
      {
        int v11 = v8 & ~(-1 << (8 * v6));
        bzero(a1, v6);
        if (v6 == 3)
        {
          *(_WORD *)a1 = v11;
          a1[2] = BYTE2(v11);
        }
        else if (v6 == 2)
        {
          *(_WORD *)a1 = v11;
        }
        else
        {
          *a1 = v11;
        }
      }
    }
    else
    {
      bzero(a1, v5 + 1);
      *(_DWORD *)a1 = v8;
      int v9 = 1;
    }
    switch(v7)
    {
      case 1:
        a1[v6] = v9;
        break;
      case 2:
        *(_WORD *)&a1[v6] = v9;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x2390D5F50);
      case 4:
        *(_DWORD *)&a1[v6] = v9;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v7)
    {
      case 1:
        a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v6] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v6] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v5] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_2390D5F78(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v3 = 8;
  if (*(void *)(v2 + 64) > 8uLL) {
    uint64_t v3 = *(void *)(v2 + 64);
  }
  uint64_t v4 = a1[v3];
  int v5 = v4 - 3;
  if (v4 >= 3)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_12;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_12:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 3;
        LODWORD(v4) = v7 + 3;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_2390D6030(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) <= 8uLL) {
    size_t v4 = 8;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  if (a2 > 2)
  {
    unsigned int v5 = a2 - 3;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 3;
      bzero(a1, v4);
      if (v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if (v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 3;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

unint64_t sub_2390D6108(uint64_t a1, uint64_t a2, char a3)
{
  if (a3 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD818);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2390DA790;
    *(void *)(inited + 32) = 0x6C6169726574616DLL;
    *(void *)(inited + 40) = 0xE800000000000000;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD818);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2390DA4A0;
    *(void *)(inited + 32) = 114;
    *(void *)(inited + 40) = 0xE100000000000000;
    sub_2390D8D28();
    *(void *)(inited + 88) = 103;
    *(void *)(inited + 96) = 0xE100000000000000;
    sub_2390D8D28();
    *(void *)(inited + 144) = 98;
    *(void *)(inited + 152) = 0xE100000000000000;
    sub_2390D8D28();
    *(void *)(inited + 200) = 97;
    *(void *)(inited + 208) = 0xE100000000000000;
  }
  sub_2390D8D28();
  return sub_23904DCC4(inited);
}

unint64_t sub_2390D634C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2390D6108(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16));
  *a1 = result;
  return result;
}

unint64_t sub_2390D637C(uint64_t a1)
{
  unint64_t result = sub_2390D63A4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2390D63A4()
{
  unint64_t result = qword_2689BEF80;
  if (!qword_2689BEF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689BEF80);
  }
  return result;
}

unint64_t sub_2390D63F8(uint64_t a1)
{
  unint64_t result = sub_2390D6420();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2390D6420()
{
  unint64_t result = qword_2689BEF88;
  if (!qword_2689BEF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689BEF88);
  }
  return result;
}

BOOL static AirPlayOverlayCoordinatorError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AirPlayOverlayCoordinatorError.hash(into:)()
{
  return sub_2390D8FA8();
}

uint64_t AirPlayOverlayCoordinatorError.hashValue.getter()
{
  return sub_2390D8FF8();
}

unint64_t sub_2390D6500()
{
  unint64_t result = qword_2689BEF90;
  if (!qword_2689BEF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689BEF90);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for AirPlayOverlayCoordinatorError(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2390D6620);
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

ValueMetadata *type metadata accessor for AirPlayOverlayCoordinatorError()
{
  return &type metadata for AirPlayOverlayCoordinatorError;
}

uint64_t sub_2390D6658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2390D67D8(a1, (uint64_t)v12);
  uint64_t v6 = v13;
  if (v13)
  {
    uint64_t v7 = v14;
    __swift_project_boxed_opaque_existential_1(v12, v13);
    unint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 72))(v6, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    sub_23904477C((uint64_t)v12, (uint64_t *)&unk_2689BE990);
    unint64_t v8 = sub_23904DCC4(MEMORY[0x263F8EE78]);
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 72))(a3, a4);
  uint64_t v10 = sub_2390D6B14(v8, v9);
  if (v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x263F8EE78];
  }
  else
  {
    v12[0] = MEMORY[0x263F8EE78];
    MEMORY[0x270FA5388](v10);
    sub_2390D6DC8(v9, (void (*)(uint64_t, uint64_t, unsigned char *))sub_2390D6DBC);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v12[0];
  }
}

uint64_t sub_2390D67D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BE990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2390D6840(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 64))(a3, a4);
  if (result)
  {
    uint64_t v7 = *(void *)(result + 16);
    if (v7)
    {
      unint64_t v8 = (void *)(result + 32);
      do
      {
        a1(v8);
        uint64_t v9 = v8[3];
        uint64_t v10 = v8[4];
        __swift_project_boxed_opaque_existential_1(v8, v9);
        sub_2390D6840(a1, a2, v9, v10);
        v8 += 5;
        --v7;
      }
      while (v7);
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2390D6920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, unsigned int a6)
{
  if (!*(void *)(a4 + 16))
  {
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    return sub_23904477C((uint64_t)&v30, &qword_2689BDA30);
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_2390507A8(a1, a2);
  if ((v13 & 1) == 0)
  {
    uint64_t v32 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    swift_bridgeObjectRelease();
    return sub_23904477C((uint64_t)&v30, &qword_2689BDA30);
  }
  sub_239051438(*(void *)(a4 + 56) + 40 * v12, (uint64_t)&v30);
  swift_bridgeObjectRelease();
  if (!*((void *)&v31 + 1)) {
    return sub_23904477C((uint64_t)&v30, &qword_2689BDA30);
  }
  v33[0] = v30;
  v33[1] = v31;
  uint64_t v34 = v32;
  if ((MEMORY[0x23EC9B600](v33, a3) & 1) == 0)
  {
    sub_239051438(a3, (uint64_t)&v30);
    if (swift_dynamicCast())
    {
      uint64_t v14 = v28;
      uint64_t v15 = v29;
      int v16 = *a5;
      swift_bridgeObjectRetain();
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_2390D8D08();
      uint64_t v15 = v18;
      int v16 = *a5;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a5 = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      int v16 = sub_23904CFA8(0, v16[2] + 1, 1, v16);
      *a5 = v16;
    }
    unint64_t v20 = v16[2];
    unint64_t v21 = v16[3];
    unint64_t v22 = v20 + 1;
    if (v20 >= v21 >> 1)
    {
      unint64_t v27 = v20 + 1;
      char v24 = v16;
      unint64_t v25 = v16[2];
      uint64_t v26 = sub_23904CFA8((void *)(v21 > 1), v20 + 1, 1, v24);
      unint64_t v20 = v25;
      unint64_t v22 = v27;
      int v16 = v26;
      *a5 = v26;
    }
    _OWORD v16[2] = v22;
    uint64_t v23 = &v16[6 * v20];
    v23[4] = a6;
    v23[5] = a1;
    v23 += 4;
    v23[2] = a2;
    v23[3] = v14;
    v23[4] = v15;
    *((unsigned char *)v23 + 40) = 3;
  }
  return sub_23906AB44((uint64_t)v33);
}

uint64_t sub_2390D6B14(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v20 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v21 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      unint64_t v8 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v9 = v8 | (v4 << 6);
LABEL_8:
      uint64_t v10 = *(void *)(v3 + 56);
      int v11 = (void *)(*(void *)(v3 + 48) + 16 * v9);
      uint64_t v12 = v11[1];
      *(void *)&long long v23 = *v11;
      *((void *)&v23 + 1) = v12;
      sub_239051438(v10 + 40 * v9, (uint64_t)&v24);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    int64_t v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v13 < v21)
    {
      unint64_t v14 = *(void *)(v20 + 8 * v13);
      if (v14) {
        goto LABEL_12;
      }
      int64_t v15 = v4 + 2;
      ++v4;
      if (v13 + 1 < v21)
      {
        unint64_t v14 = *(void *)(v20 + 8 * v15);
        if (v14) {
          goto LABEL_15;
        }
        int64_t v4 = v13 + 1;
        if (v13 + 2 < v21)
        {
          unint64_t v14 = *(void *)(v20 + 8 * (v13 + 2));
          if (v14)
          {
            v13 += 2;
            goto LABEL_12;
          }
          int64_t v4 = v13 + 2;
          if (v13 + 3 < v21)
          {
            unint64_t v14 = *(void *)(v20 + 8 * (v13 + 3));
            if (v14)
            {
              v13 += 3;
              goto LABEL_12;
            }
            int64_t v15 = v13 + 4;
            int64_t v4 = v13 + 3;
            if (v13 + 4 < v21) {
              break;
            }
          }
        }
      }
    }
LABEL_29:
    unint64_t v7 = 0;
    uint64_t v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
LABEL_30:
    sub_2390D6F98((uint64_t)&v23, (uint64_t)&v27);
    if (!v28) {
      return 1;
    }
    long long v23 = v29;
    long long v24 = v30;
    *(void *)&long long v25 = v31;
    unint64_t v16 = sub_2390507A8(v27, v28);
    char v18 = v17;
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
    {
      sub_23906AB44((uint64_t)&v23);
      return 0;
    }
    sub_239051438(*(void *)(a2 + 56) + 40 * v16, (uint64_t)v22);
    char v19 = MEMORY[0x23EC9B600](v22, &v23);
    sub_23906AB44((uint64_t)v22);
    uint64_t result = sub_23906AB44((uint64_t)&v23);
    if ((v19 & 1) == 0) {
      return 0;
    }
  }
  unint64_t v14 = *(void *)(v20 + 8 * v15);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v15;
LABEL_12:
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v13 << 6);
    int64_t v4 = v13;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v21)
    {
      int64_t v4 = v21 - 1;
      goto LABEL_29;
    }
    unint64_t v14 = *(void *)(v20 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_12;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_2390D6DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2390D6920(a1, a2, a3, *(void *)(v3 + 16), *(void ***)(v3 + 24), *(_DWORD *)(v3 + 32));
}

uint64_t sub_2390D6DC8(uint64_t a1, void (*a2)(uint64_t, uint64_t, unsigned char *))
{
  uint64_t v4 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v9 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      int64_t v9 = v15 + 1;
      if (v15 + 1 >= v7) {
        return swift_release();
      }
      unint64_t v16 = *(void *)(v20 + 8 * v9);
      if (!v16)
      {
        int64_t v9 = v15 + 2;
        if (v15 + 2 >= v7) {
          return swift_release();
        }
        unint64_t v16 = *(void *)(v20 + 8 * v9);
        if (!v16)
        {
          int64_t v9 = v15 + 3;
          if (v15 + 3 >= v7) {
            return swift_release();
          }
          unint64_t v16 = *(void *)(v20 + 8 * v9);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    uint64_t v12 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v13 = *v12;
    uint64_t v14 = v12[1];
    sub_239051438(*(void *)(a1 + 56) + 40 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    uint64_t result = sub_23904477C((uint64_t)v18, &qword_2689BE128);
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v7) {
    return swift_release();
  }
  unint64_t v16 = *(void *)(v20 + 8 * v17);
  if (v16)
  {
    int64_t v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v9 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v9 >= v7) {
      return swift_release();
    }
    unint64_t v16 = *(void *)(v20 + 8 * v9);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2390D6F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BE658);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2390D7000@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2390D700C()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 40))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D7224()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 32))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D7434()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 48))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D764C()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 56))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D785C()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 64))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D7A6C()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 72))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D7C7C()
{
  uint64_t v1 = type metadata accessor for ContainerContent.Child();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v15[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2390446B4(v0, (uint64_t)v3);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = (uint64_t *)&unk_2689BEEA0;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEEA0);
      unint64_t v8 = sub_23908862C();
      goto LABEL_7;
    case 2u:
      uint64_t v4 = &qword_2689BED10;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BED10);
      uint64_t v5 = (unint64_t *)&unk_2689BE328;
      unint64_t v6 = sub_239088584;
      int64_t v7 = sub_2390885D8;
      goto LABEL_5;
    case 3u:
      uint64_t v4 = (uint64_t *)&unk_2689BEE70;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2689BEE70);
      uint64_t v5 = (unint64_t *)&unk_2689BE318;
      unint64_t v6 = sub_239088454;
      int64_t v7 = sub_2390884A8;
      goto LABEL_5;
    default:
      uint64_t v4 = &qword_2689BD990;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2689BD990);
      uint64_t v5 = (unint64_t *)&qword_2689BEEC0;
      unint64_t v6 = sub_239088724;
      int64_t v7 = sub_239088778;
LABEL_5:
      unint64_t v8 = sub_2390884FC(v5, v4, (void (*)(void))v6, (void (*)(void))v7);
LABEL_7:
      unint64_t v17 = v8;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
      sub_239044718((uint64_t)v3, (uint64_t)boxed_opaque_existential_1, v4);
      uint64_t v10 = v16;
      unint64_t v11 = v17;
      __swift_project_boxed_opaque_existential_1(v15, v16);
      uint64_t v12 = (*(uint64_t (**)(uint64_t, unint64_t))(v11 + 80))(v10, v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      return v12;
  }
}

uint64_t sub_2390D7EA8(uint64_t a1)
{
  *(void *)(a1 + 8) = sub_2390D7F2C(&qword_2689BE538, (void (*)(uint64_t))type metadata accessor for ContainerContent.Child);
  uint64_t result = sub_2390D7F2C(&qword_2689BEF98, (void (*)(uint64_t))type metadata accessor for ContainerContent.Child);
  *(void *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2390D7F2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t static Point.zero.getter()
{
  return 0;
}

unint64_t Point.y.getter(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return __PAIR64__(a3, HIDWORD(a2));
}

uint64_t static Point.center.getter()
{
  return 1056964608;
}

uint64_t Point.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = __PAIR64__(a4, HIDWORD(a3));
  unint64_t v5 = HIDWORD(a4);
  HorizontalPosition.hash(into:)(a1, a2, a3);
  return VerticalPosition.hash(into:)(a1, v7, v5);
}

BOOL static Point.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)&long long v9 = a5;
  *((void *)&v9 + 1) = a6;
  uint64_t v6 = *(void *)((char *)&v9 + 4);
  LOBYTE(v9) = a2;
  *(void *)((char *)&v9 + 4) = __PAIR64__(a3, HIDWORD(a2));
  BYTE12(v9) = BYTE4(a3);
  long long v7 = v9;
  LOBYTE(v9) = a5;
  *(void *)((char *)&v9 + 4) = v6;
  BYTE12(v9) = BYTE4(a6);
  return sub_2390D8260(a1, v7, *((uint64_t *)&v7 + 1), a4, v9, *((uint64_t *)&v9 + 1));
}

uint64_t Point.hashValue.getter(uint64_t a1, uint64_t a2, unint64_t a3)
{
  char v3 = a2;
  *(void *)&v8[0] = a2;
  *((void *)&v8[0] + 1) = a3;
  uint64_t v5 = *(void *)((char *)v8 + 4);
  unint64_t v6 = HIDWORD(a3);
  sub_2390D8F98();
  HorizontalPosition.hash(into:)((uint64_t)v8, a1, v3);
  VerticalPosition.hash(into:)((uint64_t)v8, v5, v6);
  return sub_2390D8FF8();
}

uint64_t sub_2390D80E4()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 12);
  char v3 = *(unsigned char *)(v0 + 8);
  char v4 = *(unsigned char *)(v0 + 20);
  sub_2390D8F98();
  HorizontalPosition.hash(into:)((uint64_t)v6, v1, v3);
  VerticalPosition.hash(into:)((uint64_t)v6, v2, v4);
  return sub_2390D8FF8();
}

uint64_t sub_2390D8154(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 12);
  char v5 = *(unsigned char *)(v1 + 8);
  char v6 = *(unsigned char *)(v1 + 20);
  HorizontalPosition.hash(into:)(a1, v3, v5);
  return VerticalPosition.hash(into:)(a1, v4, v6);
}

uint64_t sub_2390D81AC()
{
  uint64_t v1 = *(void *)v0;
  uint64_t v2 = *(void *)(v0 + 12);
  char v3 = *(unsigned char *)(v0 + 8);
  char v4 = *(unsigned char *)(v0 + 20);
  sub_2390D8F98();
  HorizontalPosition.hash(into:)((uint64_t)v6, v1, v3);
  VerticalPosition.hash(into:)((uint64_t)v6, v2, v4);
  return sub_2390D8FF8();
}

BOOL sub_2390D8218(uint64_t a1, uint64_t a2)
{
  *(void *)((char *)&v4 + 4) = *(void *)(a1 + 12);
  BYTE12(v4) = *(unsigned char *)(a1 + 20);
  long long v2 = v4;
  LOBYTE(v4) = *(unsigned char *)(a2 + 8);
  *(void *)((char *)&v4 + 4) = *(void *)(a2 + 12);
  BYTE12(v4) = *(unsigned char *)(a2 + 20);
  return sub_2390D8260(*(void *)a1, v2, *((uint64_t *)&v2 + 1), *(void *)a2, v4, *((uint64_t *)&v4 + 1));
}

BOOL sub_2390D8260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v6 = BYTE4(a6);
  float v7 = *((float *)&a4 + 1);
  char v8 = BYTE4(a3);
  unint64_t v10 = __PAIR64__(a3, HIDWORD(a2));
  float v18 = *((float *)&a5 + 1);
  float v19 = *(float *)&a6;
  if (!(_BYTE)a2)
  {
    BOOL result = 0;
    if ((_BYTE)a5) {
      return result;
    }
    goto LABEL_10;
  }
  if (a2 != 1)
  {
    BOOL result = 0;
    if (a5 != 2) {
      return result;
    }
LABEL_10:
    if (*(float *)&a1 != *(float *)&a4) {
      return result;
    }
    goto LABEL_11;
  }
  if (a5 != 1) {
    return 0;
  }
  char v11 = sub_239060504(a1, a4);
  BOOL result = 0;
  if ((v11 & 1) != 0 && *((float *)&a1 + 1) == v7)
  {
LABEL_11:
    if (v8)
    {
      if (v8 == 1)
      {
        if (v6 == 1)
        {
          if (v10) {
            uint64_t v13 = 0x6D6F74746F62;
          }
          else {
            uint64_t v13 = 7368564;
          }
          if (v10) {
            unint64_t v14 = 0xE600000000000000;
          }
          else {
            unint64_t v14 = 0xE300000000000000;
          }
          if (LOBYTE(v18)) {
            uint64_t v15 = 0x6D6F74746F62;
          }
          else {
            uint64_t v15 = 7368564;
          }
          if (LOBYTE(v18)) {
            unint64_t v16 = 0xE600000000000000;
          }
          else {
            unint64_t v16 = 0xE300000000000000;
          }
          if (v13 == v15 && v14 == v16)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (*((float *)&v10 + 1) != v19) {
              return 0;
            }
          }
          else
          {
            char v17 = sub_2390D8EE8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v17 & 1) == 0 || *((float *)&v10 + 1) != v19) {
              return 0;
            }
          }
          return 1;
        }
        return 0;
      }
      if (v6 != 2) {
        return 0;
      }
    }
    else if (v6)
    {
      return 0;
    }
    return *(float *)&v10 == v18;
  }
  return result;
}

unint64_t sub_2390D8424()
{
  unint64_t result = qword_2689BEFA0;
  if (!qword_2689BEFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689BEFA0);
  }
  return result;
}

unint64_t sub_2390D8478(uint64_t a1)
{
  unint64_t result = sub_2390D84A0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2390D84A0()
{
  unint64_t result = qword_2689BEFA8;
  if (!qword_2689BEFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2689BEFA8);
  }
  return result;
}

__n128 __swift_memcpy21_4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(void *)(a1 + 13) = *(void *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Point(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 21)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Point(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 21) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 21) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Point()
{
  return &type metadata for Point;
}

uint64_t sub_2390D85A8()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_2390D85B8()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_2390D85C8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2390D85D8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2390D85E8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2390D85F8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2390D8608()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2390D8618()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2390D8628()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2390D8638()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2390D8648()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2390D8658()
{
  return MEMORY[0x270EEFDF0]();
}

uint64_t sub_2390D8668()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2390D8678()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_2390D8688()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2390D8698()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_2390D86A8()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_2390D86B8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2390D86C8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_2390D86D8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2390D86E8()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_2390D86F8()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_2390D8708()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2390D8718()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2390D8728()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2390D8738()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2390D8748()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2390D8758()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t _s10AirPlayKit16ContainerContentV2id10Foundation4UUIDVvg_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2390D8778()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2390D8788()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_2390D8798()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_2390D87A8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2390D87B8()
{
  return MEMORY[0x270EF1718]();
}

uint64_t sub_2390D87C8()
{
  return MEMORY[0x270EF1728]();
}

uint64_t sub_2390D87D8()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_2390D87E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2390D87F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2390D8808()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2390D8818()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_2390D8828()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2390D8838()
{
  return MEMORY[0x270FA09D0]();
}

uint64_t sub_2390D8848()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2390D8858()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2390D8868()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2390D8878()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2390D8888()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2390D8898()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2390D88A8()
{
  return MEMORY[0x270F9D0B8]();
}

uint64_t sub_2390D88B8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_2390D88C8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_2390D88D8()
{
  return MEMORY[0x270F9D418]();
}

uint64_t sub_2390D88E8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2390D88F8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2390D8908()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2390D8918()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2390D8928()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2390D8938()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2390D8948()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2390D8958()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2390D8968()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2390D8978()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2390D8988()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_2390D8998()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2390D89A8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2390D89B8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2390D89C8()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2390D89D8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2390D89E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2390D89F8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2390D8A08()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2390D8A18()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_2390D8A28()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2390D8A38()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2390D8A48()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2390D8A58()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2390D8A68()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2390D8A78()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2390D8A88()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2390D8A98()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2390D8AA8()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_2390D8AB8()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_2390D8AC8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2390D8AD8()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_2390D8AE8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_2390D8AF8()
{
  return MEMORY[0x270FA1E28]();
}

uint64_t sub_2390D8B08()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2390D8B18()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2390D8B28()
{
  return MEMORY[0x270FA2040]();
}

uint64_t sub_2390D8B48()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_2390D8B58()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_2390D8B68()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_2390D8B78()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2390D8B88()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2390D8B98()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2390D8BA8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2390D8BB8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2390D8BC8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2390D8BD8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2390D8BE8()
{
  return MEMORY[0x270FA0DD0]();
}

uint64_t sub_2390D8BF8()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_2390D8C08()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_2390D8C18()
{
  return MEMORY[0x270FA0E90]();
}

uint64_t sub_2390D8C28()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_2390D8C38()
{
  return MEMORY[0x270FA0EC8]();
}

uint64_t sub_2390D8C48()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_2390D8C58()
{
  return MEMORY[0x270FA0F68]();
}

uint64_t sub_2390D8C68()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_2390D8C78()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2390D8C88()
{
  return MEMORY[0x270F9E3D0]();
}

uint64_t sub_2390D8C98()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2390D8CA8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2390D8CB8()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_2390D8CC8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2390D8CD8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2390D8CE8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2390D8CF8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_2390D8D08()
{
  return MEMORY[0x270F9E8B8]();
}

uint64_t sub_2390D8D18()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2390D8D28()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2390D8D38()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_2390D8D48()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_2390D8D58()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2390D8D68()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2390D8D78()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2390D8D88()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2390D8D98()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2390D8DA8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2390D8DB8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2390D8DC8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2390D8DD8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2390D8DE8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2390D8DF8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2390D8E08()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2390D8E18()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2390D8E28()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2390D8E38()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2390D8E48()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2390D8E58()
{
  return MEMORY[0x270F9F120]();
}

uint64_t sub_2390D8E78()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_2390D8E88()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2390D8EA8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2390D8EB8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2390D8ED8()
{
  return MEMORY[0x270F9F730]();
}

uint64_t sub_2390D8EE8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2390D8EF8()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2390D8F18()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_2390D8F28()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2390D8F38()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2390D8F48()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2390D8F58()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2390D8F68()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2390D8F78()
{
  return MEMORY[0x270EF26A8]();
}

uint64_t sub_2390D8F88()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_2390D8F98()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2390D8FA8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2390D8FB8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2390D8FC8()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_2390D8FD8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2390D8FE8()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_2390D8FF8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2390D9008()
{
  return MEMORY[0x270F9FC98]();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x270EE4ED0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

uint64_t JSRemoteInspectorGetInspectionEnabledByDefault()
{
  return MEMORY[0x270EF53B0]();
}

uint64_t JSRemoteInspectorSetInspectionEnabledByDefault()
{
  return MEMORY[0x270EF53B8]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

{
  return MEMORY[0x270F9A3C0]();
}

{
  return MEMORY[0x270F9A3C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x270FA0408]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x270FA0470]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x270FA0548]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
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