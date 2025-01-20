uint64_t sub_24EF82320@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_24EF81254(*(void *)(v1 + 32), *(void (**)(char *, uint64_t))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_24EF82330(uint64_t a1)
{
  long long v3 = *(_OWORD *)(a1 + 224);
  long long v4 = *(_OWORD *)(a1 + 240);
  sub_24EF0CC0C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    *(void *)(a1 + 256),
    *(void *)(a1 + 264),
    *(unsigned char *)(a1 + 272));
  return a1;
}

uint64_t sub_24EF823B4@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  int v49 = a7;
  uint64_t v48 = a6;
  int v46 = a5;
  uint64_t v47 = a4;
  uint64_t v51 = a3;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987A50);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v55 = (uint64_t)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  v18 = (char *)v45 - v17;
  long long v19 = a1[1];
  long long v57 = *a1;
  long long v58 = v19;
  uint64_t v59 = *((void *)a1 + 4);
  sub_24EF22C1C(a2, (uint64_t)v56, &qword_269985D58);
  uint64_t v50 = a8;
  type metadata accessor for FilterResultsView();
  v56[0] = sub_24EF80208(v56);
  v56[1] = v20;
  sub_24EEFD5C4();
  uint64_t v21 = sub_24EF870C0();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  sub_24EF87040();
  sub_24EF87000();
  swift_release();
  uint64_t v26 = sub_24EF870A0();
  uint64_t v53 = v27;
  uint64_t v54 = v28;
  int v52 = v29;
  swift_release();
  sub_24EEFD518(v21, v23, v25);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = KeyPath;
  if (*(void *)(v51 + 16))
  {
    v45[1] = v45;
    uint64_t v32 = MEMORY[0x270FA5388](KeyPath);
    v45[-8] = v50;
    v45[-7] = a10;
    uint64_t v33 = v47;
    v45[-6] = a1;
    v45[-5] = v33;
    LOBYTE(v45[-4]) = v34;
    v45[-3] = v48;
    LOBYTE(v45[-2]) = v49;
    v45[-1] = v35;
    MEMORY[0x270FA5388](v32);
    v45[-4] = v36;
    v45[-3] = a10;
    v45[-2] = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269987A58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269987A60);
    sub_24EEFD4C4(&qword_269987A68, &qword_269987A58);
    sub_24EEFD4C4(&qword_269987A70, &qword_269987A60);
    sub_24EF87060();
    uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987A78);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v18, 0, 1, v37);
  }
  else
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987A78);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v18, 1, 1, v38);
  }
  char v39 = v52 & 1;
  uint64_t v40 = v55;
  sub_24EEF7878((uint64_t)v18, v55, &qword_269987A50);
  uint64_t v42 = v53;
  uint64_t v41 = v54;
  *(void *)a9 = v26;
  *(void *)(a9 + 8) = v42;
  *(unsigned char *)(a9 + 16) = v39;
  *(void *)(a9 + 24) = v41;
  *(void *)(a9 + 32) = v31;
  *(unsigned char *)(a9 + 40) = 0;
  *(void *)(a9 + 48) = 0;
  *(unsigned char *)(a9 + 56) = 1;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987A80);
  sub_24EEF7878(v40, a9 + *(int *)(v43 + 64), &qword_269987A50);
  sub_24EEFD508(v26, v42, v39);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24EEFD568((uint64_t)v18, &qword_269987A50);
  sub_24EEFD568(v40, &qword_269987A50);
  sub_24EEFD518(v26, v42, v39);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24EF8281C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v43 = a6;
  int v42 = a5;
  uint64_t v41 = a2;
  uint64_t v46 = a9;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987A58);
  MEMORY[0x270FA5388](v45);
  v44 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_24EF86A60();
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v16 = sub_24EF87630();
  MEMORY[0x270FA5388](v16 - 8);
  sub_24EF875C0();
  if (qword_269985870 != -1) {
    swift_once();
  }
  char v17 = a3 & 1;
  v18 = (void *)qword_269997D90;
  long long v19 = *(_OWORD *)(a1 + 16);
  long long v51 = *(_OWORD *)a1;
  long long v52 = v19;
  uint64_t v53 = *(void *)(a1 + 32);
  type metadata accessor for FilterResultsView();
  id v20 = v18;
  sub_24EF60314();
  swift_getKeyPath();
  sub_24EF87500();
  swift_release();
  swift_release();
  uint64_t v40 = sub_24EF87650();
  uint64_t v22 = v21;
  sub_24EF87770();
  uint64_t v23 = v41;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_24EF87760();
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = a4;
  uint64_t v27 = MEMORY[0x263F8F500];
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = v27;
  *(void *)(v25 + 32) = v23;
  *(unsigned char *)(v25 + 40) = v17;
  *(void *)(v25 + 48) = v26;
  *(unsigned char *)(v25 + 56) = v42;
  sub_24EF6C170(a1);
  uint64_t v28 = sub_24EF87760();
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v28;
  *(void *)(v29 + 24) = v27;
  *(void *)(v29 + 32) = a7;
  *(void *)(v29 + 40) = a8;
  long long v30 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v29 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v29 + 64) = v30;
  *(void *)(v29 + 80) = *(void *)(a1 + 32);
  uint64_t v31 = sub_24EF873F0();
  long long v32 = v51;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  *(&v40 - 4) = a7;
  *(&v40 - 3) = a8;
  MEMORY[0x270FA5388](v33);
  long long v49 = v32;
  char v50 = v34;
  uint64_t v47 = v40;
  uint64_t v48 = v22;
  sub_24EEFD5C4();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24EF87360();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269987A88);
  sub_24EEFD4C4(&qword_269987A68, &qword_269987A58);
  unint64_t v35 = sub_24EF83984();
  unint64_t v36 = sub_24EF839D8();
  unint64_t v38 = v35;
  unint64_t v39 = v36;
  sub_24EF873C0();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_24EF82C98(unsigned char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for FilterAction();
  MEMORY[0x270FA5388](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  long long v9 = *(_OWORD *)(a4 + 16);
  v11[0] = *(_OWORD *)a4;
  v11[1] = v9;
  uint64_t v12 = *(void *)(a4 + 32);
  type metadata accessor for FilterResultsView();
  sub_24EF60314();
  unsigned char *v8 = (_BYTE)a1;
  swift_storeEnumTagMultiPayload();
  sub_24EF87510();
  swift_release();
  return sub_24EF29CB8((uint64_t)v8);
}

uint64_t sub_24EF82D84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getKeyPath();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v7 + 48) = v8;
  *(void *)(v7 + 64) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_24EF6C170(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269986AD0);
  sub_24EEFD4C4(&qword_269987AA0, &qword_269986AD0);
  sub_24EF83984();
  return sub_24EF87410();
}

uint64_t sub_24EF82EAC@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_24EF86A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  long long v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *a1;
  long long v10 = *(_OWORD *)(a2 + 16);
  v18[0] = *(_OWORD *)a2;
  v18[1] = v10;
  uint64_t v19 = *(void *)(a2 + 32);
  type metadata accessor for FilterResultsView();
  sub_24EF60314();
  swift_getKeyPath();
  sub_24EF87500();
  swift_release();
  swift_release();
  uint64_t v11 = sub_24EF6F7D8((uint64_t)v9, (char)a1);
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)&v18[0] = v11;
  *((void *)&v18[0] + 1) = v13;
  sub_24EEFD5C4();
  uint64_t result = sub_24EF870C0();
  *(void *)a3 = result;
  *(void *)(a3 + 8) = v15;
  *(unsigned char *)(a3 + 16) = v16 & 1;
  *(void *)(a3 + 24) = v17;
  return result;
}

uint64_t sub_24EF83024()
{
  uint64_t v0 = sub_24EF86A60();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_24EF87630();
  MEMORY[0x270FA5388](v1 - 8);
  sub_24EF875C0();
  if (qword_269985870 != -1) {
    swift_once();
  }
  v2 = (void *)qword_269997D90;
  type metadata accessor for FilterResultsView();
  id v3 = v2;
  sub_24EF60314();
  swift_getKeyPath();
  sub_24EF87500();
  swift_release();
  swift_release();
  sub_24EF87650();
  sub_24EEFD5C4();
  return sub_24EF87360();
}

uint64_t sub_24EF83208@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = sub_24EF86D30();
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269987A38);
  return sub_24EF833D4(a1, a2, a3, a4);
}

uint64_t sub_24EF83280@<X0>(uint64_t a1@<X8>)
{
  return sub_24EF83208(v1[4], v1[5], v1[2], v1[3], a1);
}

uint64_t sub_24EF8328C()
{
  return sub_24EF832B4(&qword_269987A20, &qword_2699879F0, (void (*)(void))sub_24EF83334);
}

uint64_t sub_24EF832B4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24EF83334()
{
  unint64_t result = qword_269987A28;
  if (!qword_269987A28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2699879E8);
    sub_24EEFD4C4(&qword_269987A30, &qword_2699879E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987A28);
  }
  return result;
}

uint64_t sub_24EF833D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_getKeyPath();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v7 + 48) = v8;
  *(void *)(v7 + 64) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_24EF6C170(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269986AB8);
  sub_24EEFD4C4(&qword_269987A40, &qword_269986AB8);
  sub_24EF22FEC();
  sub_24EF836E4();
  return sub_24EF87410();
}

uint64_t sub_24EF834FC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  long long v10 = a1[1];
  v18[0] = *a1;
  v18[1] = v10;
  long long v11 = a1[3];
  _OWORD v18[2] = a1[2];
  v18[3] = v11;
  long long v12 = v11;
  uint64_t v13 = swift_allocObject();
  long long v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v13 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v13 + 48) = v14;
  long long v15 = a1[1];
  *(_OWORD *)(v13 + 72) = *a1;
  *(_OWORD *)(v13 + 88) = v15;
  long long v16 = a1[3];
  *(_OWORD *)(v13 + 104) = a1[2];
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 64) = *(void *)(a2 + 32);
  *(_OWORD *)(v13 + 120) = v16;
  *(_OWORD *)a5 = v12;
  *(void *)(a5 + 16) = sub_24EF83798;
  *(void *)(a5 + 24) = v13;
  swift_bridgeObjectRetain();
  sub_24EF6C170(a2);
  return sub_24EF837A8((uint64_t)v18);
}

uint64_t sub_24EF835D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FilterAction();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v7 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  type metadata accessor for FilterResultsView();
  sub_24EF60314();
  sub_24EF0D038(a2, (uint64_t)v9);
  sub_24EF0D038((uint64_t)v9, (uint64_t)v6);
  swift_storeEnumTagMultiPayload();
  sub_24EF837EC((uint64_t)v9);
  sub_24EF87510();
  swift_release();
  return sub_24EF29CB8((uint64_t)v6);
}

uint64_t sub_24EF836D8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EF834FC(a1, v2 + 32, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

unint64_t sub_24EF836E4()
{
  unint64_t result = qword_269987A48;
  if (!qword_269987A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987A48);
  }
  return result;
}

uint64_t sub_24EF83738()
{
  sub_24EF61900();
  swift_release();
  sub_24EEF7780(*(void *)(v0 + 72), *(void *)(v0 + 80), *(void *)(v0 + 88), *(void *)(v0 + 96), *(void *)(v0 + 104), *(unsigned char *)(v0 + 112));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24EF83798()
{
  return sub_24EF835D0(v0 + 32, v0 + 72);
}

uint64_t sub_24EF837A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EF837EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_24EF83824@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EF86CA0();
  *a1 = result;
  return result;
}

uint64_t sub_24EF83850()
{
  return sub_24EF86CB0();
}

uint64_t sub_24EF83878@<X0>(uint64_t a1@<X8>)
{
  return sub_24EF8281C(*(void *)(v1 + 32), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48), *(void *)(v1 + 56), *(unsigned __int8 *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_24EF83894()
{
  return sub_24EF83024();
}

uint64_t sub_24EF838A0()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_24EF838E8(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 56);
}

uint64_t sub_24EF838F4()
{
  swift_unknownObjectRelease();
  sub_24EF61900();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24EF83940(unsigned char *a1)
{
  return sub_24EF82C98(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), v1 + 48);
}

uint64_t sub_24EF83950()
{
  return sub_24EF82D84(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t sub_24EF8395C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_24EF83984()
{
  unint64_t result = qword_269987A90;
  if (!qword_269987A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987A90);
  }
  return result;
}

unint64_t sub_24EF839D8()
{
  unint64_t result = qword_269987A98;
  if (!qword_269987A98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269987A88);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987A98);
  }
  return result;
}

uint64_t objectdestroy_2Tm()
{
  sub_24EF61900();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24EF83A8C@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EF82EAC(a1, v2 + 32, a2);
}

BOOL static FilterContentType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24EF83AB0()
{
  if (*v0) {
    return 0x74756F6B726F77;
  }
  else {
    return 7367028;
  }
}

uint64_t sub_24EF83AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EF8490C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EF83B0C(uint64_t a1)
{
  unint64_t v2 = sub_24EF83F18();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EF83B48(uint64_t a1)
{
  unint64_t v2 = sub_24EF83F18();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EF83B84(uint64_t a1)
{
  unint64_t v2 = sub_24EF83FC0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EF83BC0(uint64_t a1)
{
  unint64_t v2 = sub_24EF83FC0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EF83BFC(uint64_t a1)
{
  unint64_t v2 = sub_24EF83F6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EF83C38(uint64_t a1)
{
  unint64_t v2 = sub_24EF83F6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FilterContentType.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987AA8);
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  MEMORY[0x270FA5388](v3);
  v18 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987AB0);
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  long long v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987AB8);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EF83F18();
  sub_24EF87AF0();
  uint64_t v13 = (uint64_t (**)(char *, uint64_t))(v9 + 8);
  if (v12)
  {
    char v22 = 1;
    sub_24EF83F6C();
    long long v14 = v18;
    sub_24EF879A0();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v20);
  }
  else
  {
    char v21 = 0;
    sub_24EF83FC0();
    sub_24EF879A0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v17);
  }
  return (*v13)(v11, v8);
}

unint64_t sub_24EF83F18()
{
  unint64_t result = qword_269987AC0;
  if (!qword_269987AC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987AC0);
  }
  return result;
}

unint64_t sub_24EF83F6C()
{
  unint64_t result = qword_269987AC8;
  if (!qword_269987AC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987AC8);
  }
  return result;
}

unint64_t sub_24EF83FC0()
{
  unint64_t result = qword_269987AD0;
  if (!qword_269987AD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987AD0);
  }
  return result;
}

uint64_t FilterContentType.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987AD8);
  uint64_t v30 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  uint64_t v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987AE0);
  uint64_t v28 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  long long v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987AE8);
  uint64_t v29 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EF83F18();
  long long v11 = v32;
  sub_24EF87AE0();
  if (v11) {
    goto LABEL_6;
  }
  long long v32 = a1;
  uint64_t v13 = v30;
  char v12 = v31;
  long long v14 = v10;
  uint64_t v15 = sub_24EF87980();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v20 = sub_24EF87880();
    swift_allocError();
    char v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269986030);
    *char v22 = &type metadata for FilterContentType;
    sub_24EF878F0();
    sub_24EF87870();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v20 - 8) + 104))(v22, *MEMORY[0x263F8DCB0], v20);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v8);
    a1 = v32;
LABEL_6:
    uint64_t v23 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1(v23);
  }
  v26[1] = v15;
  char v16 = *(unsigned char *)(v15 + 32);
  if (v16)
  {
    char v17 = *(unsigned char *)(v15 + 32);
    char v34 = 1;
    sub_24EF83F6C();
    v18 = v14;
    sub_24EF878E0();
    uint64_t v19 = v29;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v4, v27);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v18, v8);
    char v16 = v17;
  }
  else
  {
    char v33 = 0;
    sub_24EF83FC0();
    sub_24EF878E0();
    uint64_t v25 = v29;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v5);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v8);
  }
  *char v12 = v16;
  uint64_t v23 = (uint64_t)v32;
  return __swift_destroy_boxed_opaque_existential_1(v23);
}

uint64_t sub_24EF8446C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return FilterContentType.init(from:)(a1, a2);
}

uint64_t sub_24EF84484(void *a1)
{
  return FilterContentType.encode(to:)(a1);
}

uint64_t FilterContentType.hash(into:)()
{
  return sub_24EF87AA0();
}

uint64_t FilterContentType.hashValue.getter()
{
  return sub_24EF87AD0();
}

unint64_t sub_24EF84514()
{
  unint64_t result = qword_269987AF0;
  if (!qword_269987AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987AF0);
  }
  return result;
}

ValueMetadata *type metadata accessor for FilterContentType()
{
  return &type metadata for FilterContentType;
}

unsigned char *_s16FitnessFiltering17FilterContentTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EF8464CLL);
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

ValueMetadata *type metadata accessor for FilterContentType.CodingKeys()
{
  return &type metadata for FilterContentType.CodingKeys;
}

ValueMetadata *type metadata accessor for FilterContentType.TipCodingKeys()
{
  return &type metadata for FilterContentType.TipCodingKeys;
}

ValueMetadata *type metadata accessor for FilterContentType.WorkoutCodingKeys()
{
  return &type metadata for FilterContentType.WorkoutCodingKeys;
}

unint64_t sub_24EF846A8()
{
  unint64_t result = qword_269987AF8;
  if (!qword_269987AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987AF8);
  }
  return result;
}

unint64_t sub_24EF84700()
{
  unint64_t result = qword_269987B00;
  if (!qword_269987B00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B00);
  }
  return result;
}

unint64_t sub_24EF84758()
{
  unint64_t result = qword_269987B08;
  if (!qword_269987B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B08);
  }
  return result;
}

unint64_t sub_24EF847B0()
{
  unint64_t result = qword_269987B10;
  if (!qword_269987B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B10);
  }
  return result;
}

unint64_t sub_24EF84808()
{
  unint64_t result = qword_269987B18;
  if (!qword_269987B18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B18);
  }
  return result;
}

unint64_t sub_24EF84860()
{
  unint64_t result = qword_269987B20;
  if (!qword_269987B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B20);
  }
  return result;
}

unint64_t sub_24EF848B8()
{
  unint64_t result = qword_269987B28;
  if (!qword_269987B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B28);
  }
  return result;
}

uint64_t sub_24EF8490C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 7367028 && a2 == 0xE300000000000000;
  if (v2 || (sub_24EF87A60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74756F6B726F77 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EF87A60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t FilterSectionDescriptor.init(identifier:attributedTitle:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, void *a6@<X8>)
{
  *a6 = a1;
  a6[1] = a2;
  uint64_t v10 = type metadata accessor for FilterSectionDescriptor();
  uint64_t result = sub_24EF84AAC(a3, (uint64_t)a6 + *(int *)(v10 + 20));
  char v12 = (char *)a6 + *(int *)(v10 + 24);
  *(void *)char v12 = a4;
  v12[8] = a5;
  return result;
}

uint64_t type metadata accessor for FilterSectionDescriptor()
{
  uint64_t result = qword_269987B70;
  if (!qword_269987B70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24EF84AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t FilterSectionDescriptor.filterKind.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for FilterSectionDescriptor() + 24) + 8);
}

uint64_t FilterSectionDescriptor.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FilterSectionDescriptor.attributedTitle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FilterSectionDescriptor() + 20);
  return sub_24EF33C48(v3, a1);
}

uint64_t FilterSectionDescriptor.content.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for FilterSectionDescriptor() + 24);
  uint64_t v2 = *(void *)v1;
  sub_24EF3DB04(*(void *)v1, *(unsigned char *)(v1 + 8));
  return v2;
}

uint64_t sub_24EF84BF8()
{
  uint64_t v1 = 0x7475626972747461;
  if (*v0 != 1) {
    uint64_t v1 = 0x746E65746E6F63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_24EF84C64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EF86858(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EF84C8C(uint64_t a1)
{
  unint64_t v2 = sub_24EF84F10();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EF84CC8(uint64_t a1)
{
  unint64_t v2 = sub_24EF84F10();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t FilterSectionDescriptor.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987B30);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EF84F10();
  sub_24EF87AF0();
  char v17 = 0;
  sub_24EF879D0();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for FilterSectionDescriptor();
    char v16 = 1;
    sub_24EF86A30();
    sub_24EF869E0(&qword_269987B40, MEMORY[0x263F06828]);
    sub_24EF879C0();
    uint64_t v10 = (uint64_t *)(v3 + *(int *)(v9 + 24));
    uint64_t v11 = *v10;
    LOBYTE(v10) = *((unsigned char *)v10 + 8);
    uint64_t v14 = v11;
    char v15 = (char)v10;
    v13[15] = 2;
    sub_24EF84F64();
    sub_24EF87A20();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_24EF84F10()
{
  unint64_t result = qword_269987B38;
  if (!qword_269987B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B38);
  }
  return result;
}

unint64_t sub_24EF84F64()
{
  unint64_t result = qword_269987B48;
  if (!qword_269987B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B48);
  }
  return result;
}

uint64_t FilterSectionDescriptor.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987B50);
  uint64_t v23 = *(void *)(v7 - 8);
  uint64_t v24 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for FilterSectionDescriptor();
  MEMORY[0x270FA5388](v10);
  char v12 = (uint64_t *)((char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EF84F10();
  sub_24EF87AE0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  uint64_t v13 = (uint64_t)v6;
  uint64_t v15 = v23;
  uint64_t v14 = v24;
  uint64_t v21 = v10;
  char v29 = 0;
  *char v12 = sub_24EF87920();
  v12[1] = v16;
  sub_24EF86A30();
  char v28 = 1;
  sub_24EF869E0(&qword_269987B58, MEMORY[0x263F06828]);
  sub_24EF87910();
  sub_24EF84AAC(v13, (uint64_t)v12 + *(int *)(v21 + 20));
  char v27 = 2;
  sub_24EF85338();
  sub_24EF87970();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v14);
  char v17 = v26;
  uint64_t v18 = v22;
  uint64_t v19 = (char *)v12 + *(int *)(v21 + 24);
  *(void *)uint64_t v19 = v25;
  v19[8] = v17;
  sub_24EF33BE4((uint64_t)v12, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_24EF33D1C((uint64_t)v12);
}

unint64_t sub_24EF85338()
{
  unint64_t result = qword_269987B60;
  if (!qword_269987B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B60);
  }
  return result;
}

uint64_t sub_24EF8538C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return FilterSectionDescriptor.init(from:)(a1, a2);
}

uint64_t sub_24EF853A4(void *a1)
{
  return FilterSectionDescriptor.encode(to:)(a1);
}

uint64_t FilterSectionDescriptor.hash(into:)(long long *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24EF86A30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_24EF87670();
  swift_bridgeObjectRelease();
  uint64_t v11 = type metadata accessor for FilterSectionDescriptor();
  sub_24EF33C48(v2 + *(int *)(v11 + 20), (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_24EF87AB0();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_24EF87AB0();
    sub_24EF869E0((unint64_t *)&qword_2699863F8, MEMORY[0x263F06828]);
    sub_24EF875A0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v12 = v2 + *(int *)(v11 + 24);
  uint64_t v13 = *(void *)v12;
  char v14 = *(unsigned char *)(v12 + 8);
  sub_24EF3DB04(*(void *)v12, v14);
  FilterSectionContent.hash(into:)(a1, v13, v14);
  return sub_24EF33D08(v13, v14);
}

uint64_t FilterSectionDescriptor.hashValue.getter()
{
  sub_24EF87A90();
  FilterSectionDescriptor.hash(into:)(v1);
  return sub_24EF87AD0();
}

uint64_t sub_24EF8563C()
{
  sub_24EF87A90();
  FilterSectionDescriptor.hash(into:)(v1);
  return sub_24EF87AD0();
}

uint64_t sub_24EF85680()
{
  sub_24EF87A90();
  FilterSectionDescriptor.hash(into:)(v1);
  return sub_24EF87AD0();
}

uint64_t _s16FitnessFiltering23FilterSectionDescriptorV2eeoiySbAC_ACtFZ_0(void *a1, void *a2)
{
  uint64_t v4 = sub_24EF86A30();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v30[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269987128);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = &v30[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  char v14 = &v30[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  char v17 = &v30[-v16];
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = &v30[-v18];
  if (*a1 == *a2 && a1[1] == a2[1] || (char v20 = sub_24EF87A60(), v21 = 0, (v20 & 1) != 0))
  {
    long long v32 = v7;
    uint64_t v22 = type metadata accessor for FilterSectionDescriptor();
    uint64_t v23 = *(int *)(v22 + 20);
    char v33 = a1;
    sub_24EF33C48((uint64_t)a1 + v23, (uint64_t)v19);
    uint64_t v24 = *(int *)(v22 + 20);
    char v34 = a2;
    sub_24EF33C48((uint64_t)a2 + v24, (uint64_t)v17);
    uint64_t v25 = (uint64_t)&v10[*(int *)(v8 + 48)];
    sub_24EF33C48((uint64_t)v19, (uint64_t)v10);
    sub_24EF33C48((uint64_t)v17, v25);
    char v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    if (v26((uint64_t)v10, 1, v4) == 1)
    {
      sub_24EEFD568((uint64_t)v17, &qword_269985D60);
      sub_24EEFD568((uint64_t)v19, &qword_269985D60);
      if (v26(v25, 1, v4) == 1)
      {
        sub_24EEFD568((uint64_t)v10, &qword_269985D60);
LABEL_11:
        char v21 = static FilterSectionContent.== infix(_:_:)(*(void *)((char *)v33 + *(int *)(v22 + 24)), *((unsigned char *)v33 + *(int *)(v22 + 24) + 8), *(void *)((char *)v34 + *(int *)(v22 + 24)), *((unsigned char *)v34 + *(int *)(v22 + 24) + 8));
        return v21 & 1;
      }
    }
    else
    {
      sub_24EF33C48((uint64_t)v10, (uint64_t)v14);
      if (v26(v25, 1, v4) != 1)
      {
        char v27 = v32;
        (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 32))(v32, v25, v4);
        sub_24EF869E0(&qword_269987130, MEMORY[0x263F06828]);
        int v31 = sub_24EF875B0();
        char v28 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
        v28(v27, v4);
        sub_24EEFD568((uint64_t)v17, &qword_269985D60);
        sub_24EEFD568((uint64_t)v19, &qword_269985D60);
        v28(v14, v4);
        sub_24EEFD568((uint64_t)v10, &qword_269985D60);
        if (v31) {
          goto LABEL_11;
        }
LABEL_12:
        char v21 = 0;
        return v21 & 1;
      }
      sub_24EEFD568((uint64_t)v17, &qword_269985D60);
      sub_24EEFD568((uint64_t)v19, &qword_269985D60);
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v14, v4);
    }
    sub_24EEFD568((uint64_t)v10, &qword_269987128);
    goto LABEL_12;
  }
  return v21 & 1;
}

uint64_t sub_24EF85AD8()
{
  return sub_24EF869E0(&qword_269987B68, (void (*)(uint64_t))type metadata accessor for FilterSectionDescriptor);
}

uint64_t *initializeBufferWithCopyOfBuffer for FilterSectionDescriptor(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
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
    uint64_t v11 = sub_24EF86A30();
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
      memcpy(v9, v10, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v16 = *(int *)(a3 + 24);
    char v17 = (char *)v4 + v16;
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = *(void *)v18;
    unsigned __int8 v20 = v18[8];
    sub_24EF3DB04(*(void *)v18, v20);
    *(void *)char v17 = v19;
    v17[8] = v20;
  }
  return v4;
}

uint64_t destroy for FilterSectionDescriptor(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_24EF86A30();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = *(void *)v7;
  unsigned __int8 v9 = *(unsigned char *)(v7 + 8);
  return sub_24EF33D08(v8, v9);
}

void *initializeWithCopy for FilterSectionDescriptor(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  unsigned __int8 v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24EF86A30();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
    memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(void *)v16;
  unsigned __int8 v18 = v16[8];
  sub_24EF3DB04(*(void *)v16, v18);
  *(void *)uint64_t v15 = v17;
  v15[8] = v18;
  return a1;
}

void *assignWithCopy for FilterSectionDescriptor(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24EF86A30();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = *(void *)v17;
  unsigned __int8 v19 = v17[8];
  sub_24EF3DB04(*(void *)v17, v19);
  uint64_t v20 = *(void *)v16;
  *(void *)uint64_t v16 = v18;
  unsigned __int8 v21 = v16[8];
  v16[8] = v19;
  sub_24EF33D08(v20, v21);
  return a1;
}

_OWORD *initializeWithTake for FilterSectionDescriptor(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_24EF86A30();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = *(int *)(a3 + 24);
  int v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  *(void *)int v13 = *(void *)v14;
  v13[8] = v14[8];
  return a1;
}

void *assignWithTake for FilterSectionDescriptor(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_24EF86A30();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void *)v18;
  LOBYTE(v18) = v18[8];
  uint64_t v20 = *(void *)v17;
  *(void *)uint64_t v17 = v19;
  unsigned __int8 v21 = v17[8];
  v17[8] = (char)v18;
  sub_24EF33D08(v20, v21);
  return a1;
}

uint64_t getEnumTagSinglePayload for FilterSectionDescriptor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EF863E0);
}

uint64_t sub_24EF863E0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for FilterSectionDescriptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EF864A8);
}

uint64_t sub_24EF864A8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269985D60);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_24EF86554()
{
  sub_24EF865F4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24EF865F4()
{
  if (!qword_269987B80)
  {
    sub_24EF86A30();
    unint64_t v0 = sub_24EF877D0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269987B80);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for FilterSectionDescriptor.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EF86718);
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

ValueMetadata *type metadata accessor for FilterSectionDescriptor.CodingKeys()
{
  return &type metadata for FilterSectionDescriptor.CodingKeys;
}

unint64_t sub_24EF86754()
{
  unint64_t result = qword_269987B88;
  if (!qword_269987B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B88);
  }
  return result;
}

unint64_t sub_24EF867AC()
{
  unint64_t result = qword_269987B90;
  if (!qword_269987B90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B90);
  }
  return result;
}

unint64_t sub_24EF86804()
{
  unint64_t result = qword_269987B98;
  if (!qword_269987B98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269987B98);
  }
  return result;
}

uint64_t sub_24EF86858(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_24EF87A60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEF656C7469546465 || (sub_24EF87A60() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_24EF87A60();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_24EF869E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EF86A30()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_24EF86A40()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24EF86A50()
{
  return MEMORY[0x270EF0F30]();
}

uint64_t sub_24EF86A60()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24EF86A70()
{
  return MEMORY[0x270EF16F8]();
}

uint64_t sub_24EF86A80()
{
  return MEMORY[0x270F81700]();
}

uint64_t sub_24EF86A90()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_24EF86AA0()
{
  return MEMORY[0x270F2B2F8]();
}

uint64_t sub_24EF86AB0()
{
  return MEMORY[0x270F2B418]();
}

uint64_t sub_24EF86AC0()
{
  return MEMORY[0x270F2B010]();
}

uint64_t sub_24EF86AD0()
{
  return MEMORY[0x270F2B018]();
}

uint64_t sub_24EF86AE0()
{
  return MEMORY[0x270F2B040]();
}

uint64_t sub_24EF86AF0()
{
  return MEMORY[0x270F2B048]();
}

uint64_t sub_24EF86B00()
{
  return MEMORY[0x270F2B050]();
}

uint64_t sub_24EF86B10()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24EF86B20()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_24EF86B30()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_24EF86B40()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24EF86B50()
{
  return MEMORY[0x270EFEDF0]();
}

uint64_t sub_24EF86B60()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_24EF86B80()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_24EF86B90()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24EF86BA0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24EF86BB0()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_24EF86BC0()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_24EF86BD0()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_24EF86BE0()
{
  return MEMORY[0x270EFFB58]();
}

uint64_t sub_24EF86BF0()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_24EF86C00()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24EF86C10()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_24EF86C20()
{
  return MEMORY[0x270F001D8]();
}

uint64_t sub_24EF86C30()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_24EF86C40()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_24EF86C50()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24EF86C60()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_24EF86C70()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_24EF86C80()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_24EF86C90()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_24EF86CA0()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_24EF86CB0()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_24EF86CC0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_24EF86CD0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_24EF86CE0()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_24EF86CF0()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_24EF86D00()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_24EF86D10()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_24EF86D20()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_24EF86D30()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_24EF86D40()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24EF86D50()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_24EF86D60()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_24EF86D70()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_24EF86D80()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24EF86D90()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_24EF86DA0()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_24EF86DB0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24EF86DC0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24EF86DD0()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24EF86DE0()
{
  return MEMORY[0x270F01940]();
}

uint64_t sub_24EF86DF0()
{
  return MEMORY[0x270F01950]();
}

uint64_t sub_24EF86E00()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_24EF86E10()
{
  return MEMORY[0x270F01A18]();
}

uint64_t sub_24EF86E20()
{
  return MEMORY[0x270F01A70]();
}

uint64_t sub_24EF86E30()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_24EF86E40()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_24EF86E50()
{
  return MEMORY[0x270F01C90]();
}

uint64_t sub_24EF86E60()
{
  return MEMORY[0x270F01CA8]();
}

uint64_t sub_24EF86E70()
{
  return MEMORY[0x270F01D20]();
}

uint64_t sub_24EF86E80()
{
  return MEMORY[0x270F01D30]();
}

uint64_t sub_24EF86E90()
{
  return MEMORY[0x270F02080]();
}

uint64_t sub_24EF86EA0()
{
  return MEMORY[0x270F02088]();
}

uint64_t sub_24EF86EB0()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_24EF86EC0()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_24EF86ED0()
{
  return MEMORY[0x270F02310]();
}

uint64_t sub_24EF86EE0()
{
  return MEMORY[0x270F02318]();
}

uint64_t sub_24EF86EF0()
{
  return MEMORY[0x270F02330]();
}

uint64_t sub_24EF86F00()
{
  return MEMORY[0x270F027D8]();
}

uint64_t sub_24EF86F10()
{
  return MEMORY[0x270F027E0]();
}

uint64_t sub_24EF86F20()
{
  return MEMORY[0x270F027E8]();
}

uint64_t sub_24EF86F30()
{
  return MEMORY[0x270F027F0]();
}

uint64_t sub_24EF86F40()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24EF86F50()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_24EF86F60()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_24EF86F70()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_24EF86F80()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_24EF86F90()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24EF86FA0()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_24EF86FB0()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_24EF86FC0()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_24EF86FD0()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_24EF86FE0()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_24EF86FF0()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_24EF87000()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_24EF87010()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_24EF87020()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_24EF87030()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_24EF87040()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_24EF87050()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_24EF87060()
{
  return MEMORY[0x270F02DF8]();
}

uint64_t sub_24EF87070()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_24EF87080()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_24EF87090()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_24EF870A0()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_24EF870B0()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_24EF870C0()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_24EF870D0()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_24EF870E0()
{
  return MEMORY[0x270F87730]();
}

uint64_t sub_24EF870F0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24EF87100()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24EF87110()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_24EF87120()
{
  return MEMORY[0x270F03358]();
}

uint64_t sub_24EF87130()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_24EF87140()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_24EF87150()
{
  return MEMORY[0x270F03530]();
}

uint64_t sub_24EF87160()
{
  return MEMORY[0x270F03580]();
}

uint64_t sub_24EF87170()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24EF87180()
{
  return MEMORY[0x270F036E8]();
}

uint64_t sub_24EF87190()
{
  return MEMORY[0x270F036F0]();
}

uint64_t sub_24EF871A0()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_24EF871B0()
{
  return MEMORY[0x270F038D0]();
}

uint64_t sub_24EF871C0()
{
  return MEMORY[0x270F03AC0]();
}

uint64_t sub_24EF871D0()
{
  return MEMORY[0x270F03C30]();
}

uint64_t sub_24EF871E0()
{
  return MEMORY[0x270F03C40]();
}

uint64_t sub_24EF871F0()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_24EF87200()
{
  return MEMORY[0x270F03CD0]();
}

uint64_t sub_24EF87210()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_24EF87220()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_24EF87230()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24EF87240()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_24EF87250()
{
  return MEMORY[0x270F04108]();
}

uint64_t sub_24EF87260()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_24EF87270()
{
  return MEMORY[0x270F04150]();
}

uint64_t sub_24EF87280()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24EF87290()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24EF872A0()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_24EF872B0()
{
  return MEMORY[0x270F04210]();
}

uint64_t sub_24EF872C0()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24EF872D0()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24EF872E0()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24EF872F0()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24EF87300()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_24EF87310()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24EF87320()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24EF87330()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_24EF87340()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_24EF87350()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24EF87360()
{
  return MEMORY[0x270F04770]();
}

uint64_t sub_24EF87370()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_24EF87380()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_24EF87390()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_24EF873A0()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_24EF873B0()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_24EF873C0()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_24EF873D0()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24EF873E0()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24EF873F0()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_24EF87400()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_24EF87410()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_24EF87420()
{
  return MEMORY[0x270F04CC0]();
}

uint64_t sub_24EF87430()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_24EF87440()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_24EF87450()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_24EF87460()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24EF87470()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24EF87480()
{
  return MEMORY[0x270F051B8]();
}

uint64_t sub_24EF87490()
{
  return MEMORY[0x270F051C0]();
}

uint64_t sub_24EF874A0()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_24EF874B0()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_24EF874C0()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_24EF874E0()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24EF874F0()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24EF87500()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24EF87510()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24EF87520()
{
  return MEMORY[0x270F45990]();
}

uint64_t sub_24EF87530()
{
  return MEMORY[0x270F45998]();
}

uint64_t sub_24EF87540()
{
  return MEMORY[0x270F45A10]();
}

uint64_t sub_24EF87550()
{
  return MEMORY[0x270F45A30]();
}

uint64_t sub_24EF87560()
{
  return MEMORY[0x270F45A40]();
}

uint64_t sub_24EF87570()
{
  return MEMORY[0x270F45A60]();
}

uint64_t sub_24EF87580()
{
  return MEMORY[0x270F45D88]();
}

uint64_t sub_24EF87590()
{
  return MEMORY[0x270F45DA8]();
}

uint64_t sub_24EF875A0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24EF875B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24EF875C0()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_24EF875D0()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_24EF875E0()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_24EF875F0()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_24EF87600()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_24EF87610()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_24EF87620()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_24EF87630()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_24EF87640()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_24EF87650()
{
  return MEMORY[0x270F2CE98]();
}

uint64_t sub_24EF87660()
{
  return MEMORY[0x270F2CEA0]();
}

uint64_t sub_24EF87670()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24EF87680()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_24EF87690()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_24EF876A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24EF876B0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_24EF876C0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_24EF876D0()
{
  return MEMORY[0x270F620D8]();
}

uint64_t sub_24EF876E0()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_24EF876F0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24EF87700()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24EF87710()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_24EF87720()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24EF87730()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24EF87740()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_24EF87750()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24EF87760()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24EF87770()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24EF87780()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24EF87790()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24EF877B0()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_24EF877C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24EF877D0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24EF877E0()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_24EF877F0()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_24EF87800()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_24EF87810()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_24EF87820()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_24EF87830()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_24EF87840()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_24EF87850()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24EF87860()
{
  return MEMORY[0x270F9E9D0]();
}

uint64_t sub_24EF87870()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24EF87880()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24EF87890()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_24EF878A0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24EF878B0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24EF878C0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24EF878D0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24EF878E0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24EF878F0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24EF87900()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24EF87910()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24EF87920()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24EF87930()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24EF87940()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_24EF87950()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_24EF87960()
{
  return MEMORY[0x270F9F310]();
}

uint64_t sub_24EF87970()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24EF87980()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24EF87990()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24EF879A0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24EF879B0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24EF879C0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24EF879D0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24EF879E0()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24EF879F0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_24EF87A00()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_24EF87A10()
{
  return MEMORY[0x270F9F450]();
}

uint64_t sub_24EF87A20()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24EF87A30()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24EF87A40()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_24EF87A50()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24EF87A60()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24EF87A70()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_24EF87A80()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24EF87A90()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24EF87AA0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24EF87AB0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24EF87AC0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24EF87AD0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24EF87AE0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24EF87AF0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24EF87B20()
{
  return MEMORY[0x270FA00C0]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x270FA0418]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}