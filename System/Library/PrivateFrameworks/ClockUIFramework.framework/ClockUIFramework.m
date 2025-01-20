uint64_t sub_24A087068()
{
  uint64_t v0;

  v0 = sub_24A08A3D0();
  __swift_allocate_value_buffer(v0, qword_26975D118);
  __swift_project_value_buffer(v0, (uint64_t)qword_26975D118);
  return sub_24A08A3C0();
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

uint64_t type metadata accessor for TimeView()
{
  uint64_t result = qword_26975D148;
  if (!qword_26975D148) {
    return swift_getSingletonMetadata();
  }
  return result;
}

char *sub_24A087170(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    *((void *)a1 + 1) = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = sub_24A08A390();
    v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 24);
    v15 = &v7[v14];
    uint64_t v16 = (uint64_t)a2 + v14;
    uint64_t v17 = sub_24A08A280();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v7;
}

uint64_t sub_24A0872B0(id *a1, uint64_t a2)
{
  v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24A08A390();
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  v6 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_24A08A280();
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  return v8(v6, v7);
}

void *sub_24A087370(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void **)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v6;
  uint64_t v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_24A08A390();
  v12 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  id v13 = v7;
  v12(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  v15 = (char *)a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_24A08A280();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

uint64_t sub_24A08745C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_24A08A390();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_24A08A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

_OWORD *sub_24A087544(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  id v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24A08A390();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_24A08A280();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_24A087618(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24A08A390();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_24A08A280();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_24A0876FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24A087710);
}

uint64_t sub_24A087710(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v9 = sub_24A08A390();
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = sub_24A08A280();
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_24A087848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24A08785C);
}

void *sub_24A08785C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v8 = sub_24A08A390();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_24A08A280();
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t sub_24A087988()
{
  uint64_t result = sub_24A08A390();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24A08A280();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24A087A5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24A087A78@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v49 = sub_24A08A100();
  uint64_t v47 = *(void *)(v49 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v45 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D1A8);
  uint64_t v48 = *(void *)(v46 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v42 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26975D1B0);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v40 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A08A1B0();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v41 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  v51 = (char *)&v36 - v7;
  uint64_t v39 = sub_24A08A2C0();
  uint64_t v38 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_24A08A2E0();
  uint64_t v10 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v37);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_24A08A2B0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v19 = (char *)&v36 - v18;
  type metadata accessor for TimeView();
  sub_24A08A260();
  sub_24A08A380();
  sub_24A08A2A0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v37);
  v20 = *(void (**)(char *, uint64_t))(v14 + 8);
  v20(v17, v13);
  sub_24A08A370();
  sub_24A08A290();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v9, v39);
  v20(v19, v13);
  sub_24A08A1A0();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v56 = sub_24A08A560();
  sub_24A089678();
  sub_24A08A140();
  uint64_t v54 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v21 = sub_24A08A450();
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v23 = (uint64_t)v40;
  v22(v40, 1, 1, v21);
  sub_24A08A470();
  sub_24A08975C(v23, &qword_26975D1B0);
  sub_24A08A460();
  uint64_t v24 = sub_24A08A480();
  swift_release();
  uint64_t v56 = v24;
  sub_24A0896FC();
  sub_24A08A140();
  uint64_t v53 = swift_getKeyPath();
  swift_getKeyPath();
  v22((char *)v23, 1, 1, v21);
  sub_24A08A470();
  sub_24A08975C(v23, &qword_26975D1B0);
  sub_24A08A460();
  uint64_t v25 = sub_24A08A480();
  swift_release();
  uint64_t v56 = v25;
  v26 = v51;
  sub_24A08A170();
  uint64_t v52 = swift_getKeyPath();
  swift_getKeyPath();
  sub_24A0897BC();
  v27 = v42;
  sub_24A08A180();
  swift_release();
  uint64_t v28 = v47;
  v29 = v45;
  uint64_t v30 = v49;
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v45, *MEMORY[0x263F065A0], v49);
  v31 = v41;
  uint64_t v32 = v46;
  sub_24A08A190();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v32);
  sub_24A08A150();
  uint64_t v33 = v44;
  v34 = *(void (**)(char *, uint64_t))(v43 + 8);
  v34(v31, v44);
  return ((uint64_t (*)(char *, uint64_t))v34)(v26, v33);
}

uint64_t sub_24A0881D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24A088294(a1, a2, a3, &qword_26975D1E0);
}

uint64_t sub_24A0881DC(uint64_t a1, uint64_t a2)
{
  return sub_24A0882F8(a1, a2, &qword_26975D1E0);
}

void sub_24A0881E8()
{
}

void sub_24A088210()
{
}

uint64_t sub_24A08822C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24A088294(a1, a2, a3, &qword_26975D1D8);
}

uint64_t sub_24A088238(uint64_t a1, uint64_t a2)
{
  return sub_24A0882F8(a1, a2, &qword_26975D1D8);
}

void sub_24A088244()
{
}

void sub_24A08826C()
{
}

uint64_t sub_24A088288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24A088294(a1, a2, a3, &qword_26975D1D0);
}

uint64_t sub_24A088294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_24A08A5E0() & 1;
}

uint64_t sub_24A0882EC(uint64_t a1, uint64_t a2)
{
  return sub_24A0882F8(a1, a2, &qword_26975D1D0);
}

uint64_t sub_24A0882F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_24A08A5D0();
}

void sub_24A08833C()
{
}

void sub_24A088364()
{
}

uint64_t sub_24A088380@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v36 = sub_24A08A3E0();
  uint64_t v1 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  v35 = (char *)v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D158);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for TimeView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D160);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D168);
  uint64_t v13 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A0891D0(v33[1], (uint64_t)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  sub_24A089238((uint64_t)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26975D170);
  uint64_t v18 = sub_24A08A5A0();
  uint64_t v19 = sub_24A08930C(&qword_26975D178, MEMORY[0x263F778C8]);
  uint64_t v38 = v18;
  uint64_t v39 = v19;
  swift_getOpaqueTypeConformance2();
  sub_24A08A570();
  *uint64_t v5 = sub_24A08A550();
  uint64_t v20 = *MEMORY[0x263F775F0];
  uint64_t v21 = sub_24A08A580();
  uint64_t v22 = *(void *)(v21 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v22 + 104))(v5, v20, v21);
  (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v22 + 56))(v5, 0, 1, v21);
  uint64_t v23 = sub_24A089920(&qword_26975D180, &qword_26975D160);
  MEMORY[0x24C5BA8B0](v5, v9, v23);
  sub_24A08975C((uint64_t)v5, &qword_26975D158);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t KeyPath = swift_getKeyPath();
  v26 = v35;
  uint64_t v25 = v36;
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v35, *MEMORY[0x263F184F8], v36);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D188);
  uint64_t v28 = v37;
  v29 = (uint64_t *)(v37 + *(int *)(v27 + 36));
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D190);
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))((char *)v29 + *(int *)(v30 + 28), v26, v25);
  uint64_t *v29 = KeyPath;
  uint64_t v31 = v34;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v28, v15, v34);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v26, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v31);
}

uint64_t sub_24A08889C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v55 = a2;
  uint64_t v2 = type metadata accessor for TimeView();
  uint64_t v52 = *(void *)(v2 - 8);
  uint64_t v51 = *(void *)(v52 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v50 = (uint64_t)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24A08A160();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_24A08A5A0();
  uint64_t v54 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v49 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_24A08A350();
  uint64_t v63 = v8;
  sub_24A08939C();
  uint64_t v9 = sub_24A08A4D0();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_24A08A440();
  uint64_t v14 = sub_24A08A4B0();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  sub_24A0893F0(v9, v11, v13);
  swift_bridgeObjectRelease();
  LODWORD(v62) = sub_24A08A430();
  uint64_t v19 = sub_24A08A4A0();
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_24A0893F0(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  sub_24A08A540();
  uint64_t v24 = sub_24A08A490();
  uint64_t v26 = v25;
  char v28 = v27;
  uint64_t v30 = v29;
  swift_release();
  sub_24A0893F0(v19, v21, v23);
  swift_bridgeObjectRelease();
  uint64_t v31 = MEMORY[0x263F1A830];
  uint64_t v32 = MEMORY[0x263F77348];
  uint64_t v64 = MEMORY[0x263F1A830];
  uint64_t v65 = MEMORY[0x263F77348];
  uint64_t v33 = swift_allocObject();
  uint64_t v62 = v33;
  *(void *)(v33 + 16) = v24;
  *(void *)(v33 + 24) = v26;
  *(unsigned char *)(v33 + 32) = v28 & 1;
  *(void *)(v33 + 40) = v30;
  uint64_t v34 = v48;
  sub_24A087A78((uint64_t)v6);
  uint64_t v35 = sub_24A08A4C0();
  uint64_t v37 = v36;
  LOBYTE(v24) = v38;
  uint64_t v40 = v39;
  uint64_t v60 = v31;
  uint64_t v61 = v32;
  uint64_t v41 = swift_allocObject();
  uint64_t v59 = v41;
  *(void *)(v41 + 16) = v35;
  *(void *)(v41 + 24) = v37;
  *(unsigned char *)(v41 + 32) = v24 & 1;
  *(void *)(v41 + 40) = v40;
  uint64_t v58 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  v42 = v49;
  sub_24A08A590();
  uint64_t v43 = v50;
  sub_24A0891D0(v34, v50);
  unint64_t v44 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  uint64_t v45 = swift_allocObject();
  sub_24A089238(v43, v45 + v44);
  sub_24A08930C(&qword_26975D178, MEMORY[0x263F778C8]);
  uint64_t v46 = v53;
  sub_24A08A4F0();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v42, v46);
}

uint64_t sub_24A088D10()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24A08A340();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D1A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_24A08A210();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  char v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26975D110 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_24A08A3D0();
  __swift_project_value_buffer(v13, (uint64_t)qword_26975D118);
  uint64_t v14 = sub_24A08A3B0();
  os_log_type_t v15 = sub_24A08A5F0();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = v10;
    uint64_t v17 = v9;
    char v18 = v12;
    uint64_t v19 = v5;
    uint64_t v20 = v1;
    uint64_t v21 = v3;
    uint64_t v22 = v2;
    char v23 = v16;
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_24A085000, v14, v15, "[TimeView.onSnippetTapped]: Performing punchout", v16, 2u);
    uint64_t v24 = v23;
    uint64_t v2 = v22;
    uint64_t v3 = v21;
    uint64_t v1 = v20;
    uint64_t v5 = v19;
    char v12 = v18;
    uint64_t v9 = v17;
    uint64_t v10 = v28;
    MEMORY[0x24C5BAB70](v24, -1, -1);
  }

  type metadata accessor for TimeView();
  sub_24A08A360();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_24A08975C((uint64_t)v8, &qword_26975D1A0);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if (*v1)
  {
    id v26 = *v1;
    sub_24A08A200();
    sub_24A08A330();
    sub_24A08A5B0();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    sub_24A08A5C0();
    sub_24A08930C(&qword_26975D140, MEMORY[0x263F77980]);
    uint64_t result = sub_24A08A3F0();
    __break(1u);
  }
  return result;
}

uint64_t sub_24A0890BC()
{
  return sub_24A08A410();
}

uint64_t sub_24A0890E0(uint64_t a1)
{
  uint64_t v2 = sub_24A08A3E0();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_24A08A420();
}

uint64_t sub_24A0891B0()
{
  return sub_24A08A530();
}

uint64_t sub_24A0891D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A089238(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TimeView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A08929C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for TimeView() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_24A08889C(v4, a1);
}

uint64_t sub_24A08930C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_24A08939C()
{
  unint64_t result = qword_26975D198;
  if (!qword_26975D198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26975D198);
  }
  return result;
}

uint64_t sub_24A0893F0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_24A089400()
{
  sub_24A0893F0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for TimeView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;

  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = sub_24A08A390();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v6 + v1[8];
  uint64_t v10 = sub_24A08A280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_24A08957C()
{
  return sub_24A088D10();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
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

unint64_t sub_24A089678()
{
  unint64_t result = qword_26975D1B8;
  if (!qword_26975D1B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26975D1B8);
  }
  return result;
}

uint64_t sub_24A0896CC()
{
  return 8;
}

uint64_t sub_24A0896D8()
{
  return swift_release();
}

uint64_t sub_24A0896E0(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_24A0896EC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_24A0896FC()
{
  unint64_t result = qword_26975D1C0;
  if (!qword_26975D1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26975D1C0);
  }
  return result;
}

uint64_t sub_24A089750()
{
  return 8;
}

uint64_t sub_24A08975C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_24A0897BC()
{
  unint64_t result = qword_26975D1C8;
  if (!qword_26975D1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26975D1C8);
  }
  return result;
}

uint64_t sub_24A089810()
{
  return 8;
}

unint64_t sub_24A089820()
{
  unint64_t result = qword_26975D1E8;
  if (!qword_26975D1E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26975D188);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26975D160);
    sub_24A089920(&qword_26975D180, &qword_26975D160);
    swift_getOpaqueTypeConformance2();
    sub_24A089920(&qword_26975D1F0, &qword_26975D190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26975D1E8);
  }
  return result;
}

uint64_t sub_24A089920(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ClockUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ClockUIPlugin.init()()
{
  return v0;
}

uint64_t ClockUIPlugin.snippet(for:mode:idiom:)(char *a1)
{
  return sub_24A089A10(a1);
}

uint64_t ClockUIPlugin.deinit()
{
  return v0;
}

uint64_t ClockUIPlugin.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_24A0899C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_24A0899F8(char *a1)
{
  return sub_24A089A10(a1);
}

uint64_t sub_24A089A10(char *a1)
{
  uint64_t v34 = a1;
  uint64_t v1 = sub_24A08A1F0();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v39 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24A08A320();
  MEMORY[0x270FA5388](v3 - 8);
  char v38 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24A08A300();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v37 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24A08A2E0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v36 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D130);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v35 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26975D138);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TimeView();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (uint64_t *)((char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_24A08A390();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24A08A3A0();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v24, v34, v21);
  if ((*(unsigned int (**)(char *, uint64_t))(v22 + 88))(v24, v21) == *MEMORY[0x263F75218])
  {
    (*(void (**)(char *, uint64_t))(v22 + 96))(v24, v21);
    uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    uint64_t v32 = v17;
    uint64_t v33 = v20;
    v25(v20, v24, v17);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))((char *)v16 + *(int *)(v14 + 20), v20, v17);
    sub_24A08A5C0();
    sub_24A08A05C(&qword_26975D140, MEMORY[0x263F77980]);
    *uint64_t v16 = sub_24A08A400();
    v16[1] = v26;
    uint64_t v34 = (char *)v16 + *(int *)(v14 + 24);
    sub_24A08A240();
    uint64_t v27 = sub_24A08A250();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v13, 0, 1, v27);
    uint64_t v28 = v35;
    sub_24A08A220();
    uint64_t v29 = sub_24A08A230();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 0, 1, v29);
    sub_24A08A2D0();
    sub_24A08A2F0();
    sub_24A08A310();
    sub_24A08A1E0();
    sub_24A08A270();
    sub_24A08A05C((unint64_t *)&unk_26975D200, (void (*)(uint64_t))type metadata accessor for TimeView);
    uint64_t v30 = sub_24A08A4E0();
    sub_24A08A0A4((uint64_t)v16);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v33, v32);
    return v30;
  }
  else
  {
    uint64_t result = sub_24A08A600();
    __break(1u);
  }
  return result;
}

uint64_t sub_24A089FC4()
{
  return sub_24A08A05C(&qword_26975D1F8, MEMORY[0x263F75220]);
}

uint64_t type metadata accessor for ClockUIPlugin()
{
  return self;
}

uint64_t method lookup function for ClockUIPlugin(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ClockUIPlugin);
}

uint64_t dispatch thunk of ClockUIPlugin.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t sub_24A08A05C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24A08A0A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimeView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A08A100()
{
  return MEMORY[0x270EEEA00]();
}

uint64_t sub_24A08A110()
{
  return MEMORY[0x270EEEA40]();
}

uint64_t sub_24A08A120()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_24A08A130()
{
  return MEMORY[0x270EFEB00]();
}

uint64_t sub_24A08A140()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_24A08A150()
{
  return MEMORY[0x270EEEBC0]();
}

uint64_t sub_24A08A160()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24A08A170()
{
  return MEMORY[0x270EEF020]();
}

uint64_t sub_24A08A180()
{
  return MEMORY[0x270EEF040]();
}

uint64_t sub_24A08A190()
{
  return MEMORY[0x270EEF050]();
}

uint64_t sub_24A08A1A0()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_24A08A1B0()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_24A08A1C0()
{
  return MEMORY[0x270EEF810]();
}

uint64_t sub_24A08A1D0()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_24A08A1E0()
{
  return MEMORY[0x270EEFB78]();
}

uint64_t sub_24A08A1F0()
{
  return MEMORY[0x270EEFB88]();
}

uint64_t sub_24A08A200()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_24A08A210()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24A08A220()
{
  return MEMORY[0x270EF0310]();
}

uint64_t sub_24A08A230()
{
  return MEMORY[0x270EF0320]();
}

uint64_t sub_24A08A240()
{
  return MEMORY[0x270EF0358]();
}

uint64_t sub_24A08A250()
{
  return MEMORY[0x270EF0360]();
}

uint64_t sub_24A08A260()
{
  return MEMORY[0x270EF0400]();
}

uint64_t sub_24A08A270()
{
  return MEMORY[0x270EF0428]();
}

uint64_t sub_24A08A280()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_24A08A290()
{
  return MEMORY[0x270EF07A8]();
}

uint64_t sub_24A08A2A0()
{
  return MEMORY[0x270EF07B0]();
}

uint64_t sub_24A08A2B0()
{
  return MEMORY[0x270EF07B8]();
}

uint64_t sub_24A08A2C0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_24A08A2D0()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_24A08A2E0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24A08A2F0()
{
  return MEMORY[0x270EF12E0]();
}

uint64_t sub_24A08A300()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_24A08A310()
{
  return MEMORY[0x270EF15D0]();
}

uint64_t sub_24A08A320()
{
  return MEMORY[0x270EF1608]();
}

uint64_t sub_24A08A330()
{
  return MEMORY[0x270F73A60]();
}

uint64_t sub_24A08A340()
{
  return MEMORY[0x270F73A80]();
}

uint64_t sub_24A08A350()
{
  return MEMORY[0x270F72600]();
}

uint64_t sub_24A08A360()
{
  return MEMORY[0x270F72608]();
}

uint64_t sub_24A08A370()
{
  return MEMORY[0x270F72610]();
}

uint64_t sub_24A08A380()
{
  return MEMORY[0x270F72618]();
}

uint64_t sub_24A08A390()
{
  return MEMORY[0x270F72620]();
}

uint64_t sub_24A08A3A0()
{
  return MEMORY[0x270F72628]();
}

uint64_t sub_24A08A3B0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24A08A3C0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24A08A3D0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24A08A3E0()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_24A08A3F0()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_24A08A400()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_24A08A410()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_24A08A420()
{
  return MEMORY[0x270F008D8]();
}

uint64_t sub_24A08A430()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_24A08A440()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_24A08A450()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24A08A460()
{
  return MEMORY[0x270F02BE8]();
}

uint64_t sub_24A08A470()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24A08A480()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_24A08A490()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_24A08A4A0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24A08A4B0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24A08A4C0()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_24A08A4D0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24A08A4E0()
{
  return MEMORY[0x270F75950]();
}

uint64_t sub_24A08A4F0()
{
  return MEMORY[0x270F759D8]();
}

uint64_t sub_24A08A500()
{
  return MEMORY[0x270F75A28]();
}

uint64_t sub_24A08A510()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24A08A520()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24A08A530()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24A08A540()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_24A08A550()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24A08A560()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24A08A570()
{
  return MEMORY[0x270F75C30]();
}

uint64_t sub_24A08A580()
{
  return MEMORY[0x270F75C50]();
}

uint64_t sub_24A08A590()
{
  return MEMORY[0x270F75FF8]();
}

uint64_t sub_24A08A5A0()
{
  return MEMORY[0x270F76000]();
}

uint64_t sub_24A08A5B0()
{
  return MEMORY[0x270F76250]();
}

uint64_t sub_24A08A5C0()
{
  return MEMORY[0x270F76280]();
}

uint64_t sub_24A08A5D0()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_24A08A5E0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24A08A5F0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24A08A600()
{
  return MEMORY[0x270F9F7C8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}