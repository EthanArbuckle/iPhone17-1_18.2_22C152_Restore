uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
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

uint64_t CanvasEnvironment.init(onItemTappedWithIdentifier:onItemAppearedAtIndexPath:onItemDisappearedAtIndexPath:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t sub_24EC48A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 192);
}

uint64_t sub_24EC48A24(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_24EC48A58()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24EC48A9C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_24EC48B08(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_OWORD *sub_24EC48B94(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t sub_24EC48BEC(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24EC48C34(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for CanvasEnvironment(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasEnvironment);
}

uint64_t CanvasState.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CanvasState.isInternalBuild.getter()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t CanvasState.layout.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 200);
  uint64_t v5 = sub_24EC77BC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t CanvasState.layout.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 200);
  uint64_t v5 = sub_24EC77BC0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*CanvasState.layout.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.loadState.getter(uint64_t a1)
{
  uint64_t v2 = v1 + *(int *)(a1 + 204);
  uint64_t v3 = *(void *)v2;
  sub_24EC48E30(*(void *)v2, *(unsigned char *)(v2 + 8));
  return v3;
}

uint64_t sub_24EC48E30(uint64_t a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t CanvasState.loadState.setter(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = v3 + *(int *)(a3 + 204);
  uint64_t result = sub_24EC48E8C(*(void *)v6, *(unsigned char *)(v6 + 8));
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2;
  return result;
}

uint64_t sub_24EC48E8C(uint64_t a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t (*CanvasState.loadState.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.preferredInsetBehavior.getter(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 208));
}

uint64_t CanvasState.preferredInsetBehavior.setter(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(v2 + *(int *)(a2 + 208)) = result & 1;
  return result;
}

uint64_t (*CanvasState.preferredInsetBehavior.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.scrollPositionIdentifier.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 212));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t CanvasState.scrollPositionIdentifier.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3 + 212));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*CanvasState.scrollPositionIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.closureIdentifier.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 216);
  uint64_t v5 = sub_24EC779C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t CanvasState.closureIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + *(int *)(a2 + 216);
  uint64_t v5 = sub_24EC779C0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

uint64_t (*CanvasState.closureIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t CanvasState.init(identifier:isInternalBuild:layout:loadState:preferredInsetBehavior:scrollPositionIdentifier:closureIdentifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, long long a12, long long a13, long long a14, uint64_t a15, long long a16, long long a17, long long a18, long long a19, long long a20,uint64_t a21,uint64_t a22,long long a23,uint64_t a24)
{
  char v36 = a7 & 1;
  long long v41 = a12;
  long long v42 = a13;
  long long v43 = a14;
  uint64_t v44 = a15;
  long long v45 = a16;
  long long v46 = a17;
  long long v47 = a18;
  long long v48 = a19;
  long long v49 = a20;
  uint64_t v50 = a21;
  uint64_t v51 = a22;
  long long v52 = a23;
  uint64_t v53 = a24;
  v28 = (int *)type metadata accessor for CanvasState(0, (uint64_t)&v41);
  v29 = (void *)(a9 + v28[53]);
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3;
  uint64_t v30 = a9 + v28[50];
  long long v41 = a16;
  long long v42 = a23;
  uint64_t v31 = sub_24EC77BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v30, a4, v31);
  uint64_t v32 = a9 + v28[51];
  *(void *)uint64_t v32 = a5;
  *(unsigned char *)(v32 + 8) = a6;
  *(unsigned char *)(a9 + v28[52]) = v36;
  void *v29 = a8;
  v29[1] = a10;
  uint64_t v33 = a9 + v28[54];
  uint64_t v34 = sub_24EC779C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 32))(v33, a11, v34);
}

uint64_t type metadata accessor for CanvasState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasState);
}

BOOL sub_24EC49270(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24EC49280()
{
  return sub_24EC782F0();
}

uint64_t sub_24EC492A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEF646C6975426C61 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7461745364616F6CLL && a2 == 0xE900000000000065 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024EC7EF20 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024EC7EF40 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EC7EF60)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    char v6 = sub_24EC78290();
    swift_bridgeObjectRelease();
    if (v6) {
      return 6;
    }
    else {
      return 7;
    }
  }
}

uint64_t sub_24EC495B0()
{
  return sub_24EC78300();
}

unint64_t sub_24EC495F8(char a1)
{
  unint64_t result = 0x696669746E656469;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E7265746E497369;
      break;
    case 2:
      unint64_t result = 0x74756F79616CLL;
      break;
    case 3:
      unint64_t result = 0x7461745364616F6CLL;
      break;
    case 4:
      unint64_t result = 0xD000000000000016;
      break;
    case 5:
      unint64_t result = 0xD000000000000018;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_24EC496FC(char *a1, char *a2)
{
  return sub_24EC49270(*a1, *a2);
}

uint64_t sub_24EC49760()
{
  return sub_24EC495B0();
}

uint64_t sub_24EC497C8()
{
  return sub_24EC49280();
}

uint64_t sub_24EC49820()
{
  return sub_24EC78300();
}

unint64_t sub_24EC49898()
{
  return sub_24EC495F8(*v0);
}

uint64_t sub_24EC49900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC492A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EC49968()
{
  return 0;
}

uint64_t sub_24EC49974@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EC4BCC4();
  *a1 = result;
  return result;
}

uint64_t sub_24EC499D8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC49A2C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t CanvasState.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(char **)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  uint64_t v11 = *(void *)(a2 + 72);
  v12 = *(char **)(a2 + 80);
  v13 = *(char **)(a2 + 88);
  v14 = *(char **)(a2 + 96);
  v15 = *(char **)(a2 + 104);
  uint64_t v16 = *(void *)(a2 + 112);
  uint64_t v17 = *(void *)(a2 + 120);
  uint64_t v18 = *(void *)(a2 + 128);
  uint64_t v19 = *(void *)(a2 + 136);
  uint64_t v20 = *(void *)(a2 + 144);
  uint64_t v21 = *(void *)(a2 + 152);
  uint64_t v22 = *(void *)(a2 + 160);
  uint64_t v23 = *(void *)(a2 + 168);
  uint64_t v24 = *(void *)(a2 + 176);
  uint64_t v25 = *(void *)(a2 + 184);
  uint64_t v43 = v4;
  uint64_t v68 = v4;
  v54 = v5;
  v69 = v5;
  uint64_t v70 = v6;
  uint64_t v59 = v6;
  uint64_t v58 = v7;
  uint64_t v71 = v7;
  uint64_t v72 = v8;
  uint64_t v57 = v8;
  uint64_t v56 = v9;
  uint64_t v73 = v9;
  uint64_t v74 = v10;
  uint64_t v55 = v10;
  uint64_t v63 = v11;
  uint64_t v75 = v11;
  v76 = v12;
  v62 = v12;
  uint64_t v53 = v13;
  v77 = v13;
  v78 = v14;
  long long v52 = v14;
  uint64_t v51 = v15;
  v79 = (uint64_t)v15;
  uint64_t v80 = v16;
  uint64_t v50 = v16;
  uint64_t v49 = v17;
  uint64_t v81 = v17;
  uint64_t v48 = v18;
  uint64_t v82 = v18;
  uint64_t v83 = v19;
  uint64_t v47 = v19;
  uint64_t v46 = v20;
  uint64_t v84 = v20;
  uint64_t v85 = v21;
  uint64_t v45 = v21;
  uint64_t v44 = v22;
  uint64_t v86 = v22;
  uint64_t v87 = v23;
  uint64_t v61 = v23;
  uint64_t v60 = v24;
  uint64_t v88 = v24;
  uint64_t v89 = v25;
  uint64_t v42 = v25;
  type metadata accessor for CanvasState.CodingKeys(255, (uint64_t)&v68);
  swift_getWitnessTable();
  uint64_t v26 = sub_24EC78270();
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388]();
  v29 = (char *)&v41 - v28;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v30 = v26;
  uint64_t v31 = v64;
  sub_24EC78320();
  LOBYTE(v68) = 0;
  uint64_t v32 = v90;
  sub_24EC78240();
  if (v32) {
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v29, v30);
  }
  uint64_t v34 = v62;
  uint64_t v35 = v63;
  uint64_t v90 = v27;
  LOBYTE(v68) = 1;
  sub_24EC78250();
  LOBYTE(v66) = 2;
  uint64_t v36 = v35;
  uint64_t v68 = v35;
  uint64_t v37 = v61;
  v69 = v34;
  uint64_t v70 = v61;
  uint64_t v71 = v60;
  sub_24EC77BC0();
  v62 = v29;
  swift_getWitnessTable();
  sub_24EC78260();
  v38 = (uint64_t *)(v31 + *(int *)(a2 + 204));
  uint64_t v39 = *v38;
  LOBYTE(v38) = *((unsigned char *)v38 + 8);
  uint64_t v66 = v39;
  char v67 = (char)v38;
  char v65 = 3;
  uint64_t v68 = v43;
  v69 = v54;
  uint64_t v70 = v59;
  uint64_t v71 = v58;
  uint64_t v72 = v57;
  uint64_t v73 = v56;
  uint64_t v74 = v55;
  uint64_t v75 = v36;
  v76 = v53;
  v77 = v52;
  v78 = v51;
  v79 = v50;
  uint64_t v80 = v49;
  uint64_t v81 = v48;
  uint64_t v82 = v47;
  uint64_t v83 = v46;
  uint64_t v84 = v45;
  uint64_t v85 = v44;
  uint64_t v86 = v37;
  uint64_t v87 = v42;
  type metadata accessor for CanvasLoadState(0, (uint64_t)&v68);
  swift_getWitnessTable();
  sub_24EC78260();
  LOBYTE(v68) = *(unsigned char *)(v31 + *(int *)(a2 + 208));
  LOBYTE(v66) = 4;
  sub_24EC4A09C();
  sub_24EC78260();
  LOBYTE(v68) = 5;
  sub_24EC78230();
  LOBYTE(v68) = 6;
  sub_24EC779C0();
  sub_24EC4AC4C((unint64_t *)&unk_269961EA8);
  v40 = v62;
  sub_24EC78260();
  return (*(uint64_t (**)(char *, uint64_t))(v90 + 8))(v40, v30);
}

uint64_t type metadata accessor for CanvasState.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasState.CodingKeys);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24EC4A09C()
{
  unint64_t result = qword_269961EA0;
  if (!qword_269961EA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269961EA0);
  }
  return result;
}

uint64_t CanvasState.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t *a11, uint64_t *a12, uint64_t *a13, uint64_t *a14, uint64_t *a15, uint64_t *a16, uint64_t *a17, uint64_t *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v96 = a8;
  uint64_t v95 = a7;
  uint64_t v93 = a6;
  uint64_t v91 = a5;
  uint64_t v82 = a4;
  uint64_t v87 = a3;
  uint64_t v81 = a2;
  v79 = a1;
  uint64_t v67 = a9;
  uint64_t v122 = a24;
  uint64_t v97 = a21;
  uint64_t v89 = a20;
  uint64_t v94 = a19;
  v92 = a18;
  uint64_t v90 = a17;
  uint64_t v88 = a16;
  uint64_t v86 = a15;
  uint64_t v85 = a14;
  uint64_t v84 = a13;
  uint64_t v83 = a12;
  uint64_t v68 = sub_24EC779C0();
  uint64_t v66 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388]();
  v69 = (char *)&v63 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = a10;
  v101 = a11;
  uint64_t v102 = a22;
  v77 = a11;
  uint64_t v103 = a23;
  uint64_t v71 = sub_24EC77BC0();
  uint64_t v73 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v72 = (char *)&v63 - v27;
  uint64_t v100 = a2;
  v101 = a3;
  uint64_t v28 = v82;
  uint64_t v102 = v82;
  uint64_t v103 = v91;
  uint64_t v104 = v93;
  uint64_t v105 = v95;
  uint64_t v106 = v96;
  uint64_t v107 = a10;
  v108 = a11;
  v109 = a12;
  v110 = a13;
  v111 = a14;
  v29 = v86;
  uint64_t v30 = v88;
  v112 = v86;
  v113 = v88;
  v114 = v90;
  v115 = v92;
  uint64_t v31 = v89;
  uint64_t v116 = v94;
  uint64_t v117 = v89;
  uint64_t v118 = v97;
  uint64_t v119 = a22;
  uint64_t v120 = a23;
  uint64_t v121 = v122;
  type metadata accessor for CanvasState.CodingKeys(255, (uint64_t)&v100);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v75 = sub_24EC78210();
  uint64_t v74 = *(void *)(v75 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v33 = (char *)&v63 - v32;
  uint64_t v100 = v81;
  v101 = v87;
  uint64_t v102 = v28;
  uint64_t v34 = v79;
  uint64_t v103 = v91;
  uint64_t v104 = v93;
  uint64_t v105 = v95;
  uint64_t v106 = v96;
  uint64_t v70 = a10;
  uint64_t v107 = a10;
  v108 = v77;
  v109 = v83;
  v110 = v84;
  v111 = v85;
  v112 = v29;
  v113 = v30;
  v114 = v90;
  v115 = v92;
  uint64_t v116 = v94;
  uint64_t v117 = v31;
  uint64_t v118 = v97;
  uint64_t v119 = a22;
  uint64_t v120 = a23;
  uint64_t v121 = v122;
  uint64_t v35 = type metadata accessor for CanvasState(0, (uint64_t)&v100);
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = MEMORY[0x270FA5388]();
  uint64_t v39 = (uint64_t *)((char *)&v63 - v38);
  v40 = (uint64_t *)((char *)&v63 + *(int *)(v37 + 212) - v38);
  uint64_t *v40 = 0;
  v40[1] = 0;
  v77 = v40;
  __swift_project_boxed_opaque_existential_1(v34, v34[3]);
  v76 = v33;
  uint64_t v41 = v80;
  sub_24EC78310();
  if (v41)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = v72;
    uint64_t WitnessTable = a22;
    uint64_t v64 = v36;
    uint64_t v80 = v35;
    char v65 = v39;
    uint64_t v43 = v73;
    uint64_t v44 = (uint64_t)v34;
    LOBYTE(v100) = 0;
    uint64_t v45 = sub_24EC781D0();
    uint64_t v46 = v65;
    *char v65 = v45;
    v46[1] = v47;
    LOBYTE(v100) = 1;
    *((unsigned char *)v46 + 16) = sub_24EC781E0() & 1;
    LOBYTE(v100) = 2;
    uint64_t v48 = v46;
    uint64_t v49 = v71;
    swift_getWitnessTable();
    sub_24EC781F0();
    uint64_t v50 = v48;
    uint64_t v51 = v80;
    (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))((uint64_t)v50 + *(int *)(v80 + 200), v42, v49);
    uint64_t v100 = v81;
    v101 = v87;
    uint64_t v102 = v82;
    uint64_t v103 = v91;
    uint64_t v104 = v93;
    uint64_t v105 = v95;
    uint64_t v106 = v96;
    uint64_t v107 = v70;
    v108 = v83;
    v109 = v84;
    v110 = v85;
    v111 = v86;
    v112 = v88;
    v113 = v90;
    v114 = (uint64_t *)v92;
    v115 = v94;
    uint64_t v116 = v89;
    uint64_t v117 = v97;
    uint64_t v118 = WitnessTable;
    uint64_t v119 = v122;
    type metadata accessor for CanvasLoadState(0, (uint64_t)&v100);
    LOBYTE(v100) = 3;
    swift_getWitnessTable();
    uint64_t v52 = v75;
    sub_24EC781F0();
    char v53 = v99;
    v54 = (char *)v65 + *(int *)(v51 + 204);
    *(void *)v54 = v98;
    v54[8] = v53;
    LOBYTE(v98) = 4;
    sub_24EC4ABF8();
    sub_24EC781F0();
    uint64_t v55 = v77;
    *((unsigned char *)v65 + *(int *)(v51 + 208)) = v100;
    LOBYTE(v100) = 5;
    *uint64_t v55 = sub_24EC781C0();
    v55[1] = v56;
    LOBYTE(v100) = 6;
    sub_24EC4AC4C((unint64_t *)&unk_269961EB8);
    uint64_t v57 = v69;
    uint64_t v58 = v68;
    sub_24EC781F0();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v76, v52);
    uint64_t v59 = v80;
    uint64_t v60 = v65;
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))((char *)v65 + *(int *)(v80 + 216), v57, v58);
    uint64_t v61 = v64;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v64 + 16))(v67, v60, v59);
    __swift_destroy_boxed_opaque_existential_1(v44);
    return (*(uint64_t (**)(uint64_t *, uint64_t))(v61 + 8))(v60, v59);
  }
}

unint64_t sub_24EC4ABF8()
{
  unint64_t result = qword_269961EB0;
  if (!qword_269961EB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269961EB0);
  }
  return result;
}

uint64_t sub_24EC4AC4C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EC779C0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EC4AC90@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return CanvasState.init(from:)(a1, *(void *)(a2 + 16), *(uint64_t **)(a2 + 24), *(void *)(a2 + 32), *(void *)(a2 + 40), *(void *)(a2 + 48), *(void *)(a2 + 56), *(void *)(a2 + 64), a3, *(void *)(a2 + 72), *(uint64_t **)(a2 + 80), *(uint64_t **)(a2 + 88), *(uint64_t **)(a2 + 96), *(uint64_t **)(a2 + 104), *(uint64_t **)(a2 + 112), *(uint64_t **)(a2 + 120), *(uint64_t **)(a2 + 128), *(uint64_t **)(a2 + 136), *(void *)(a2 + 144),
           *(void *)(a2 + 152),
           *(void *)(a2 + 160),
           *(void *)(a2 + 168),
           *(void *)(a2 + 176),
           *(void *)(a2 + 184));
}

uint64_t sub_24EC4ACF8(void *a1, uint64_t a2)
{
  return CanvasState.encode(to:)(a1, a2);
}

uint64_t static CanvasState.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  if (*(void *)a1 != *(void *)a2 || *(void *)(a1 + 8) != *(void *)(a2 + 8))
  {
    char v32 = sub_24EC78290();
    char v33 = 0;
    if ((v32 & 1) == 0) {
      return v33 & 1;
    }
  }
  if (*(unsigned __int8 *)(a1 + 16) != *(unsigned __int8 *)(a2 + 16)) {
    goto LABEL_8;
  }
  v42[0] = a3;
  v42[1] = a4;
  v42[2] = a5;
  v42[3] = a6;
  v42[4] = a7;
  v42[5] = a8;
  v42[6] = a9;
  v42[7] = a10;
  v42[8] = a11;
  v42[9] = a12;
  v42[10] = a13;
  v42[11] = a14;
  v42[12] = a15;
  v42[13] = a16;
  v42[14] = a17;
  v42[15] = a18;
  v42[16] = a19;
  v42[17] = a20;
  v42[18] = a21;
  v42[19] = a22;
  v42[20] = a23;
  v42[21] = a24;
  uint64_t v34 = (int *)type metadata accessor for CanvasState(0, (uint64_t)v42);
  if ((sub_24EC77BB0() & 1) == 0
    || (static CanvasLoadState.== infix(_:_:)(*(void *)(a1 + v34[51]), *(unsigned char *)(a1 + v34[51] + 8), *(void *)(a2 + v34[51]), *(unsigned char *)(a2 + v34[51] + 8)) & 1) == 0|| *(unsigned __int8 *)(a1 + v34[52]) != *(unsigned __int8 *)(a2 + v34[52]))
  {
    goto LABEL_8;
  }
  uint64_t v36 = v34[53];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = *(void *)(a1 + v36 + 8);
  uint64_t v39 = (void *)(a2 + v36);
  uint64_t v40 = v39[1];
  if (!v38)
  {
    if (!v40)
    {
LABEL_17:
      char v33 = sub_24EC779A0();
      return v33 & 1;
    }
LABEL_8:
    char v33 = 0;
    return v33 & 1;
  }
  if (!v40) {
    goto LABEL_8;
  }
  if (*v37 == *v39 && v38 == v40) {
    goto LABEL_17;
  }
  char v41 = sub_24EC78290();
  char v33 = 0;
  if (v41) {
    goto LABEL_17;
  }
  return v33 & 1;
}

uint64_t sub_24EC4AF58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static CanvasState.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9], a3[10], a3[11], a3[12], a3[13], a3[14], a3[15], a3[16], a3[17], a3[18],
           a3[19],
           a3[20],
           a3[21],
           a3[22],
           a3[23]) & 1;
}

uint64_t sub_24EC4AFB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 208);
}

uint64_t sub_24EC4AFBC()
{
  uint64_t result = sub_24EC77BC0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24EC779C0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_24EC4B0BC(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *(void *)a1 = *a2;
    a1 = v27 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v8 = a3[50];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_24EC77BC0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[51];
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = *(void *)v14;
    LOBYTE(v10) = *(unsigned char *)(v14 + 8);
    sub_24EC48E30(*(void *)v14, v10);
    *(void *)uint64_t v13 = v15;
    uint64_t v16 = a3[52];
    uint64_t v17 = a3[53];
    char v18 = *((unsigned char *)a2 + v16);
    *(unsigned char *)(v13 + 8) = v10;
    *(unsigned char *)(a1 + v16) = v18;
    uint64_t v19 = (void *)(a1 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[54];
    uint64_t v23 = a1 + v22;
    uint64_t v24 = (uint64_t)a2 + v22;
    uint64_t v25 = sub_24EC779C0();
    uint64_t v26 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16);
    swift_bridgeObjectRetain();
    v26(v23, v24, v25);
  }
  return a1;
}

uint64_t sub_24EC4B25C(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[50];
  uint64_t v5 = sub_24EC77BC0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  sub_24EC48E8C(*(void *)(a1 + a2[51]), *(unsigned char *)(a1 + a2[51] + 8));
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[54];
  uint64_t v7 = sub_24EC779C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
}

uint64_t sub_24EC4B34C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = a3[50];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_24EC77BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[51];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = *(void *)v13;
  LOBYTE(v9) = *(unsigned char *)(v13 + 8);
  sub_24EC48E30(*(void *)v13, v9);
  *(void *)uint64_t v12 = v14;
  uint64_t v15 = a3[52];
  uint64_t v16 = a3[53];
  char v17 = *(unsigned char *)(a2 + v15);
  *(unsigned char *)(v12 + 8) = v9;
  *(unsigned char *)(a1 + v15) = v17;
  char v18 = (void *)(a1 + v16);
  uint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  *char v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = a3[54];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_24EC779C0();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16);
  swift_bridgeObjectRetain();
  v25(v22, v23, v24);
  return a1;
}

uint64_t sub_24EC4B49C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[50];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24EC77BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[51];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = *(void *)v12;
  LOBYTE(v8) = *(unsigned char *)(v12 + 8);
  sub_24EC48E30(*(void *)v12, v8);
  uint64_t v14 = *(void *)v11;
  *(void *)uint64_t v11 = v13;
  unsigned __int8 v15 = *(unsigned char *)(v11 + 8);
  *(unsigned char *)(v11 + 8) = v8;
  sub_24EC48E8C(v14, v15);
  *(unsigned char *)(a1 + a3[52]) = *(unsigned char *)(a2 + a3[52]);
  uint64_t v16 = a3[53];
  char v17 = (void *)(a1 + v16);
  char v18 = (void *)(a2 + v16);
  *char v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[54];
  uint64_t v20 = a1 + v19;
  uint64_t v21 = a2 + v19;
  uint64_t v22 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 24))(v20, v21, v22);
  return a1;
}

uint64_t sub_24EC4B614(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[50];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_24EC77BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[51];
  uint64_t v11 = a3[52];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v14 = a3[54];
  *(_OWORD *)(a1 + a3[53]) = *(_OWORD *)(a2 + a3[53]);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 32))(v15, v16, v17);
  return a1;
}

uint64_t sub_24EC4B734(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = a3[50];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24EC77BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[51];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v14 = *v13;
  LOBYTE(v13) = *((unsigned char *)v13 + 8);
  uint64_t v15 = *(void *)v12;
  *(void *)uint64_t v12 = v14;
  unsigned __int8 v16 = *(unsigned char *)(v12 + 8);
  *(unsigned char *)(v12 + 8) = (_BYTE)v13;
  sub_24EC48E8C(v15, v16);
  uint64_t v17 = a3[53];
  *(unsigned char *)(a1 + a3[52]) = *(unsigned char *)(a2 + a3[52]);
  char v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  *char v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[54];
  uint64_t v23 = a1 + v22;
  uint64_t v24 = a2 + v22;
  uint64_t v25 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 40))(v23, v24, v25);
  return a1;
}

uint64_t sub_24EC4B87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EC4B890);
}

uint64_t sub_24EC4B890(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_24EC77BC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + *(int *)(a3 + 200), a2, v8);
    }
    else
    {
      uint64_t v10 = sub_24EC779C0();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 216), a2, v10);
    }
  }
}

uint64_t sub_24EC4B9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EC4B9B4);
}

uint64_t sub_24EC4B9B4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_24EC77BC0();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + *(int *)(a4 + 200), a2, a2, v8);
    }
    else
    {
      uint64_t v10 = sub_24EC779C0();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5 + *(int *)(a4 + 216), a2, a2, v10);
    }
  }
  return result;
}

uint64_t sub_24EC4BAC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 176);
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_24EC4BADC(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_24EC4BB6C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x24EC4BC38);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_24EC4BC60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24EC4BC68(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t sub_24EC4BC70()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC4BC8C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC4BCA8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC4BCC4()
{
  return 7;
}

uint64_t sub_24EC4BCCC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x800000024EC7EFB0 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6164696C61766E69 && a2 == 0xEF736D6574496574 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657070416D657469 && a2 == 0xEC00000064657261 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x617369446D657469 && a2 == 0xEF64657261657070 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x694474756F79616CLL && a2 == 0xEF65676E61684364 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024EC7EFD0 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x4368736572666572 && a2 == 0xED00007361766E61 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x614364616F6C6572 && a2 == 0xEC0000007361766ELL || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024EC7EFF0 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7449646570706174 && a2 == 0xEA00000000006D65 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x6570704177656976 && a2 == 0xEC00000064657261 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6E61437261656C63 && a2 == 0xEB00000000736176)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v5 = sub_24EC78290();
    swift_bridgeObjectRelease();
    if (v5) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_24EC4C284(char a1)
{
  uint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6164696C61766E69;
      break;
    case 2:
      unsigned int v3 = 1835365481;
      goto LABEL_13;
    case 3:
      uint64_t result = 0x617369446D657469;
      break;
    case 4:
      uint64_t result = 0x694474756F79616CLL;
      break;
    case 5:
      uint64_t result = 0xD000000000000011;
      break;
    case 6:
      uint64_t result = 0x4368736572666572;
      break;
    case 7:
      uint64_t result = 0x614364616F6C6572;
      break;
    case 8:
      uint64_t result = 0xD000000000000014;
      break;
    case 9:
      uint64_t result = 0x7449646570706174;
      break;
    case 10:
      unsigned int v3 = 2003134838;
LABEL_13:
      uint64_t result = v3 | 0x6570704100000000;
      break;
    case 11:
      uint64_t result = 0x6E61437261656C63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EC4C434(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7461507865646E69 && a2 == 0xE900000000000068)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EC78290();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EC4C4C8(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EC78290();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EC4C538(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EC78290();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EC4C5CC(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x74756F79616CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EC78290();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_24EC4C64C()
{
  return 0;
}

uint64_t sub_24EC4C658@<X0>(void *a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_24EC4CE98(a1, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC53740, a2);
}

uint64_t sub_24EC4C670@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_24EC4D298(a1, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC53740, a2);
}

uint64_t sub_24EC4C688(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4C6DC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4C730()
{
  return sub_24EC4C284(*v0);
}

uint64_t sub_24EC4C798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC4BCCC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EC4C800@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EC53734();
  *a1 = result;
  return result;
}

uint64_t sub_24EC4C864(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4C8B8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4C90C@<X0>(void *a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_24EC4CE98(a1, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC4C9CC, a2);
}

uint64_t sub_24EC4C924(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4C978(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4C9CC()
{
  return 1;
}

uint64_t sub_24EC4C9DC()
{
  return 12383;
}

uint64_t sub_24EC4C9E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_24EC4CADC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC4C4C8, a4);
}

uint64_t sub_24EC4CA00(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CA54(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CAA8()
{
  return 0x7461507865646E69;
}

uint64_t sub_24EC4CAC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_24EC4CADC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC4C434, a4);
}

uint64_t sub_24EC4CADC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9], a3[10], a3[11], a3[12], a3[13], a3[14], a3[15], a3[16], a3[17], a3[18],
             a3[19],
             a3[20],
             a3[21],
             a3[22],
             a3[23]);
  *a5 = result & 1;
  return result;
}

uint64_t sub_24EC4CB50(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CBA4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CBF8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CC4C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CCA0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CCF4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CD48(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CD9C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CDF0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CE44(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CE98@<X0>(void *a1@<X2>, uint64_t (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void)@<X4>, unsigned char *a3@<X8>)
{
  char v4 = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
         a1[21],
         a1[22],
         a1[23]);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_24EC4CF20(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4CF74(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4CFC8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4D01C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4D070()
{
  return sub_24EC782F0();
}

uint64_t sub_24EC4D098()
{
  return 0x696669746E656469;
}

uint64_t sub_24EC4D0B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_24EC4D0CC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC4C538, a4);
}

uint64_t sub_24EC4D0CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void)@<X4>, unsigned char *a5@<X8>)
{
  uint64_t result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9], a3[10], a3[11], a3[12], a3[13], a3[14], a3[15], a3[16], a3[17], a3[18],
             a3[19],
             a3[20],
             a3[21],
             a3[22],
             a3[23]);
  *a5 = result & 1;
  return result;
}

uint64_t sub_24EC4D140(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4D194(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC4D1E8()
{
  return sub_24EC78300();
}

uint64_t sub_24EC4D22C()
{
  return sub_24EC78300();
}

uint64_t sub_24EC4D26C()
{
  return 0x74756F79616CLL;
}

uint64_t sub_24EC4D280@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, unsigned char *a4@<X8>)
{
  return sub_24EC4D0CC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC4C5CC, a4);
}

uint64_t sub_24EC4D298@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
             a1[21],
             a1[22],
             a1[23]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EC4D308(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC4D35C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t CanvasAction.encode(to:)(void *a1, void *a2)
{
  v257 = a2;
  v258 = a1;
  uint64_t v2 = a2[2];
  uint64_t v269 = a2[3];
  uint64_t v3 = a2[5];
  uint64_t v268 = a2[4];
  uint64_t v4 = a2[7];
  uint64_t v267 = a2[6];
  uint64_t v279 = v4;
  uint64_t v5 = a2[8];
  uint64_t v265 = a2[9];
  uint64_t v6 = a2[11];
  uint64_t v273 = a2[10];
  uint64_t v7 = a2[12];
  uint64_t v277 = a2[13];
  uint64_t v8 = a2[15];
  uint64_t v281 = a2[14];
  uint64_t v9 = a2[17];
  uint64_t v280 = a2[16];
  uint64_t v10 = a2[19];
  uint64_t v275 = a2[18];
  uint64_t v274 = v10;
  uint64_t v11 = a2[21];
  uint64_t v264 = a2[20];
  uint64_t v263 = v11;
  uint64_t v12 = a2[22];
  uint64_t v262 = a2[23];
  uint64_t v284 = v2;
  uint64_t v261 = v2;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v287 = v3;
  uint64_t v288 = v267;
  uint64_t v271 = v3;
  uint64_t v289 = v4;
  uint64_t v290 = v5;
  uint64_t v13 = v5;
  uint64_t v266 = v5;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v6;
  uint64_t v294 = v7;
  uint64_t v260 = v6;
  uint64_t v278 = v7;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v8;
  uint64_t v298 = v280;
  uint64_t v14 = v8;
  uint64_t v276 = v8;
  uint64_t v299 = v9;
  uint64_t v300 = v275;
  uint64_t v15 = v9;
  uint64_t v301 = v10;
  uint64_t v302 = v264;
  uint64_t v303 = v11;
  uint64_t v304 = v12;
  uint64_t v16 = v12;
  uint64_t v272 = v12;
  uint64_t v305 = v262;
  uint64_t v252 = type metadata accessor for CanvasAction.ClearCanvasCodingKeys(255, (uint64_t)&v284);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v250 = sub_24EC78270();
  uint64_t v249 = *(void *)(v250 - 8);
  MEMORY[0x270FA5388](v250);
  v248 = (char *)&v186 - v17;
  uint64_t v284 = v2;
  uint64_t v18 = v269;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v287 = v3;
  uint64_t v19 = v267;
  uint64_t v288 = v267;
  uint64_t v289 = v279;
  uint64_t v290 = v13;
  uint64_t v20 = v265;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v6;
  uint64_t v294 = v7;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v14;
  uint64_t v21 = v280;
  uint64_t v298 = v280;
  uint64_t v299 = v15;
  uint64_t v270 = v15;
  uint64_t v22 = v275;
  uint64_t v23 = v274;
  uint64_t v300 = v275;
  uint64_t v301 = v274;
  uint64_t v302 = v264;
  uint64_t v303 = v263;
  uint64_t v304 = v16;
  uint64_t v24 = v262;
  uint64_t v305 = v262;
  uint64_t v25 = type metadata accessor for CanvasAction.ViewAppearedCodingKeys(255, (uint64_t)&v284);
  uint64_t v26 = swift_getWitnessTable();
  uint64_t v244 = v25;
  uint64_t v243 = v26;
  uint64_t v247 = sub_24EC78270();
  uint64_t v246 = *(void *)(v247 - 8);
  MEMORY[0x270FA5388](v247);
  v245 = (char *)&v186 - v27;
  uint64_t v284 = v261;
  uint64_t v285 = v18;
  uint64_t v28 = v268;
  uint64_t v286 = v268;
  uint64_t v287 = v271;
  uint64_t v288 = v19;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v291 = v20;
  uint64_t v29 = v273;
  uint64_t v292 = v273;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v276;
  uint64_t v298 = v21;
  uint64_t v299 = v15;
  uint64_t v300 = v22;
  uint64_t v301 = v23;
  uint64_t v30 = v264;
  uint64_t v31 = v263;
  uint64_t v302 = v264;
  uint64_t v303 = v263;
  uint64_t v304 = v272;
  uint64_t v305 = v24;
  uint64_t v32 = type metadata accessor for CanvasAction.TappedItemCodingKeys(255, (uint64_t)&v284);
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v239 = v32;
  uint64_t v237 = v33;
  uint64_t v242 = sub_24EC78270();
  uint64_t v241 = *(void *)(v242 - 8);
  uint64_t v34 = MEMORY[0x270FA5388](v242);
  v238 = (char *)&v186 - v35;
  uint64_t v240 = *(void *)(v271 - 8);
  MEMORY[0x270FA5388](v34);
  v236 = (char *)&v186 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v261;
  uint64_t v284 = v261;
  uint64_t v285 = v269;
  uint64_t v286 = v28;
  uint64_t v287 = v38;
  uint64_t v288 = v267;
  uint64_t v39 = v279;
  uint64_t v40 = v266;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v291 = v265;
  uint64_t v292 = v29;
  uint64_t v41 = v260;
  uint64_t v42 = v278;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v43 = v277;
  uint64_t v44 = v281;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v299 = v270;
  uint64_t v300 = v275;
  uint64_t v301 = v274;
  uint64_t v302 = v30;
  uint64_t v45 = v272;
  uint64_t v303 = v31;
  uint64_t v304 = v272;
  uint64_t v305 = v262;
  uint64_t v46 = type metadata accessor for CanvasAction.ScrolledToIdentifierCodingKeys(255, (uint64_t)&v284);
  uint64_t v47 = swift_getWitnessTable();
  uint64_t v232 = v46;
  uint64_t v231 = v47;
  uint64_t v235 = sub_24EC78270();
  uint64_t v234 = *(void *)(v235 - 8);
  MEMORY[0x270FA5388](v235);
  v233 = (char *)&v186 - v48;
  uint64_t v284 = v37;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v287 = v271;
  uint64_t v288 = v267;
  uint64_t v289 = v39;
  uint64_t v290 = v40;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v41;
  uint64_t v294 = v42;
  uint64_t v295 = v43;
  uint64_t v296 = v44;
  uint64_t v49 = v276;
  uint64_t v50 = v280;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v51 = v270;
  uint64_t v299 = v270;
  uint64_t v300 = v275;
  uint64_t v301 = v274;
  uint64_t v302 = v264;
  uint64_t v303 = v263;
  uint64_t v304 = v45;
  uint64_t v52 = v262;
  uint64_t v305 = v262;
  uint64_t v53 = type metadata accessor for CanvasAction.ReloadCanvasCodingKeys(255, (uint64_t)&v284);
  uint64_t v54 = swift_getWitnessTable();
  uint64_t v230 = v53;
  uint64_t v229 = v54;
  uint64_t v228 = sub_24EC78270();
  uint64_t v227 = *(void *)(v228 - 8);
  MEMORY[0x270FA5388](v228);
  v226 = (char *)&v186 - v55;
  uint64_t v284 = v37;
  uint64_t v56 = v269;
  uint64_t v57 = v268;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v58 = v271;
  uint64_t v59 = v267;
  uint64_t v287 = v271;
  uint64_t v288 = v267;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v60 = v265;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v49;
  uint64_t v298 = v50;
  uint64_t v61 = v275;
  uint64_t v299 = v51;
  uint64_t v300 = v275;
  uint64_t v62 = v264;
  uint64_t v301 = v274;
  uint64_t v302 = v264;
  uint64_t v303 = v263;
  uint64_t v304 = v272;
  uint64_t v305 = v52;
  uint64_t refreshed = type metadata accessor for CanvasAction.RefreshCanvasCodingKeys(255, (uint64_t)&v284);
  uint64_t v64 = swift_getWitnessTable();
  uint64_t v223 = refreshed;
  uint64_t v222 = v64;
  uint64_t v221 = sub_24EC78270();
  uint64_t v219 = *(void *)(v221 - 8);
  MEMORY[0x270FA5388](v221);
  v218 = (char *)&v186 - v65;
  uint64_t v66 = v261;
  uint64_t v284 = v261;
  uint64_t v285 = v56;
  uint64_t v286 = v57;
  uint64_t v287 = v58;
  uint64_t v288 = v59;
  uint64_t v67 = v279;
  uint64_t v68 = v266;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v291 = v60;
  uint64_t v292 = v273;
  uint64_t v69 = v260;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v70 = v277;
  uint64_t v71 = v281;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v299 = v270;
  uint64_t v300 = v61;
  uint64_t v301 = v274;
  uint64_t v302 = v62;
  uint64_t v72 = v263;
  uint64_t v303 = v263;
  uint64_t v304 = v272;
  uint64_t v73 = v262;
  uint64_t v305 = v262;
  uint64_t v74 = type metadata accessor for CanvasAction.LoadedDescriptorsCodingKeys(255, (uint64_t)&v284);
  uint64_t v75 = swift_getWitnessTable();
  uint64_t v217 = v74;
  uint64_t v216 = v75;
  uint64_t v225 = sub_24EC78270();
  uint64_t v224 = *(void *)(v225 - 8);
  MEMORY[0x270FA5388](v225);
  v220 = (char *)&v186 - v76;
  uint64_t v284 = v66;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v287 = v271;
  uint64_t v288 = v267;
  uint64_t v289 = v67;
  uint64_t v290 = v68;
  uint64_t v77 = v265;
  uint64_t v78 = v273;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v69;
  uint64_t v294 = v278;
  uint64_t v295 = v70;
  uint64_t v296 = v71;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v299 = v270;
  uint64_t v300 = v275;
  uint64_t v301 = v274;
  uint64_t v302 = v264;
  uint64_t v79 = v72;
  uint64_t v80 = v272;
  uint64_t v303 = v72;
  uint64_t v304 = v272;
  uint64_t v305 = v73;
  uint64_t v81 = type metadata accessor for CanvasAction.LayoutDidChangeCodingKeys(255, (uint64_t)&v284);
  uint64_t v82 = swift_getWitnessTable();
  uint64_t v212 = v81;
  uint64_t v211 = v82;
  uint64_t v215 = sub_24EC78270();
  uint64_t v214 = *(void *)(v215 - 8);
  MEMORY[0x270FA5388](v215);
  v213 = (char *)&v186 - v83;
  uint64_t v284 = v77;
  uint64_t v84 = v77;
  uint64_t v285 = v78;
  uint64_t v286 = v72;
  uint64_t v85 = v78;
  uint64_t v287 = v80;
  uint64_t v256 = sub_24EC77BC0();
  uint64_t v255 = *(void *)(v256 - 8);
  uint64_t v86 = MEMORY[0x270FA5388](v256);
  v210 = (char *)&v186 - ((v87 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v86);
  v209 = (char *)&v186 - v88;
  uint64_t v89 = v261;
  uint64_t v284 = v261;
  uint64_t v90 = v269;
  uint64_t v91 = v268;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v92 = v271;
  uint64_t v93 = v267;
  uint64_t v287 = v271;
  uint64_t v288 = v267;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v291 = v84;
  uint64_t v292 = v85;
  uint64_t v94 = v260;
  uint64_t v95 = v278;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v96 = v275;
  uint64_t v299 = v270;
  uint64_t v300 = v275;
  uint64_t v301 = v274;
  uint64_t v302 = v264;
  uint64_t v303 = v79;
  uint64_t v304 = v272;
  uint64_t v305 = v262;
  uint64_t v97 = type metadata accessor for CanvasAction.ItemDisappearedCodingKeys(255, (uint64_t)&v284);
  uint64_t v98 = swift_getWitnessTable();
  uint64_t v205 = v97;
  uint64_t v204 = v98;
  uint64_t v208 = sub_24EC78270();
  uint64_t v207 = *(void *)(v208 - 8);
  MEMORY[0x270FA5388](v208);
  v206 = (char *)&v186 - v99;
  uint64_t v284 = v89;
  uint64_t v285 = v90;
  uint64_t v286 = v91;
  uint64_t v287 = v92;
  uint64_t v288 = v93;
  uint64_t v100 = v279;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v101 = v265;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v94;
  uint64_t v294 = v95;
  uint64_t v102 = v277;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v103 = v276;
  uint64_t v104 = v280;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v299 = v270;
  uint64_t v300 = v96;
  uint64_t v105 = v264;
  uint64_t v301 = v274;
  uint64_t v302 = v264;
  uint64_t v303 = v263;
  uint64_t v304 = v272;
  uint64_t v305 = v262;
  uint64_t v106 = type metadata accessor for CanvasAction.ItemAppearedCodingKeys(255, (uint64_t)&v284);
  uint64_t v107 = swift_getWitnessTable();
  uint64_t v200 = v106;
  uint64_t v198 = v107;
  uint64_t v203 = sub_24EC78270();
  uint64_t v202 = *(void *)(v203 - 8);
  MEMORY[0x270FA5388](v203);
  v201 = (char *)&v186 - v108;
  uint64_t v254 = sub_24EC779D0();
  uint64_t v253 = *(void *)(v254 - 8);
  uint64_t v109 = MEMORY[0x270FA5388](v254);
  v199 = (char *)&v186 - ((v110 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v109);
  v197 = (char *)&v186 - v111;
  uint64_t v284 = v261;
  uint64_t v112 = v269;
  uint64_t v113 = v268;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v114 = v271;
  uint64_t v287 = v271;
  uint64_t v288 = v267;
  uint64_t v289 = v100;
  uint64_t v115 = v266;
  uint64_t v290 = v266;
  uint64_t v291 = v101;
  uint64_t v116 = v273;
  uint64_t v292 = v273;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v295 = v102;
  uint64_t v296 = v281;
  uint64_t v297 = v103;
  uint64_t v117 = v270;
  uint64_t v298 = v104;
  uint64_t v299 = v270;
  uint64_t v118 = v274;
  uint64_t v300 = v275;
  uint64_t v301 = v274;
  uint64_t v119 = v263;
  uint64_t v302 = v105;
  uint64_t v303 = v263;
  uint64_t v304 = v272;
  uint64_t v305 = v262;
  uint64_t v120 = type metadata accessor for CanvasAction.InvalidateItemsCodingKeys(255, (uint64_t)&v284);
  uint64_t v121 = swift_getWitnessTable();
  uint64_t v193 = v120;
  uint64_t v192 = v121;
  uint64_t v196 = sub_24EC78270();
  uint64_t v195 = *(void *)(v196 - 8);
  MEMORY[0x270FA5388](v196);
  v194 = (char *)&v186 - v122;
  uint64_t v284 = v261;
  uint64_t v285 = v112;
  uint64_t v286 = v113;
  uint64_t v287 = v114;
  uint64_t v123 = v267;
  uint64_t v288 = v267;
  uint64_t v289 = v279;
  uint64_t v290 = v115;
  uint64_t v291 = v265;
  uint64_t v124 = v260;
  uint64_t v292 = v116;
  uint64_t v293 = v260;
  uint64_t v294 = v278;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v299 = v117;
  uint64_t v300 = v275;
  uint64_t v301 = v118;
  uint64_t v125 = v264;
  uint64_t v302 = v264;
  uint64_t v303 = v119;
  uint64_t v126 = v272;
  uint64_t v127 = v262;
  uint64_t v304 = v272;
  uint64_t v305 = v262;
  uint64_t v128 = type metadata accessor for CanvasAction.EndCanvasRefreshCodingKeys(255, (uint64_t)&v284);
  uint64_t v129 = swift_getWitnessTable();
  uint64_t v191 = v128;
  uint64_t v190 = v129;
  uint64_t v189 = sub_24EC78270();
  uint64_t v188 = *(void *)(v189 - 8);
  uint64_t v130 = MEMORY[0x270FA5388](v189);
  v187 = (char *)&v186 - v131;
  v132 = v257;
  uint64_t v133 = *(v257 - 1);
  MEMORY[0x270FA5388](v130);
  v135 = (uint64_t *)((char *)&v186 - ((v134 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v284 = v261;
  uint64_t v285 = v269;
  uint64_t v286 = v268;
  uint64_t v287 = v271;
  uint64_t v288 = v123;
  uint64_t v289 = v279;
  uint64_t v290 = v266;
  uint64_t v291 = v265;
  uint64_t v292 = v273;
  uint64_t v293 = v124;
  uint64_t v294 = v278;
  uint64_t v295 = v277;
  uint64_t v296 = v281;
  uint64_t v297 = v276;
  uint64_t v298 = v280;
  uint64_t v299 = v270;
  uint64_t v300 = v275;
  uint64_t v301 = v118;
  uint64_t v302 = v125;
  uint64_t v303 = v263;
  uint64_t v304 = v126;
  uint64_t v305 = v127;
  type metadata accessor for CanvasAction.CodingKeys(255, (uint64_t)&v284);
  swift_getWitnessTable();
  uint64_t v272 = sub_24EC78270();
  uint64_t v273 = *(void *)(v272 - 8);
  MEMORY[0x270FA5388](v272);
  v137 = (uint64_t *)((char *)&v186 - v136);
  __swift_project_boxed_opaque_existential_1(v258, v258[3]);
  v258 = v137;
  sub_24EC78320();
  (*(void (**)(uint64_t *, uint64_t, void *))(v133 + 16))(v135, v259, v132);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v143 = v253;
      v144 = v197;
      uint64_t v145 = v254;
      (*(void (**)(char *, uint64_t *, uint64_t))(v253 + 32))(v197, v135, v254);
      LOBYTE(v284) = 2;
      v146 = v201;
      uint64_t v147 = v272;
      v148 = v258;
      sub_24EC78220();
      sub_24EC51F60(qword_26B1D91D8);
      uint64_t v149 = v203;
      sub_24EC78260();
      v150 = &v234;
      goto LABEL_6;
    case 2u:
      uint64_t v151 = v253;
      v152 = v199;
      uint64_t v153 = v254;
      (*(void (**)(char *, uint64_t *, uint64_t))(v253 + 32))(v199, v135, v254);
      LOBYTE(v284) = 3;
      v154 = v206;
      uint64_t v147 = v272;
      v148 = v258;
      sub_24EC78220();
      sub_24EC51F60(qword_26B1D91D8);
      uint64_t v155 = v208;
      sub_24EC78260();
      (*(void (**)(char *, uint64_t))(v207 + 8))(v154, v155);
      (*(void (**)(char *, uint64_t))(v151 + 8))(v152, v153);
      return (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v148, v147);
    case 3u:
      uint64_t v143 = v255;
      v144 = v209;
      uint64_t v145 = v256;
      (*(void (**)(char *, uint64_t *, uint64_t))(v255 + 32))(v209, v135, v256);
      LOBYTE(v284) = 4;
      v146 = v213;
      uint64_t v147 = v272;
      v148 = v258;
      sub_24EC78220();
      swift_getWitnessTable();
      uint64_t v149 = v215;
      sub_24EC78260();
      v150 = &v246;
LABEL_6:
      (*(void (**)(char *, uint64_t))(*(v150 - 32) + 8))(v146, v149);
      (*(void (**)(char *, uint64_t))(v143 + 8))(v144, v145);
      return (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v148, v147);
    case 4u:
      uint64_t v157 = *v135;
      LOBYTE(v284) = 5;
      v158 = v220;
      uint64_t v159 = v272;
      v160 = v258;
      sub_24EC78220();
      uint64_t v306 = v157;
      uint64_t v284 = v261;
      uint64_t v285 = v269;
      uint64_t v286 = v268;
      uint64_t v287 = v271;
      uint64_t v288 = v267;
      uint64_t v289 = v266;
      uint64_t v290 = v265;
      uint64_t v291 = v279;
      uint64_t v292 = v260;
      uint64_t v293 = v278;
      uint64_t v294 = v277;
      uint64_t v295 = v281;
      uint64_t v296 = v276;
      uint64_t v297 = v280;
      uint64_t v298 = v270;
      uint64_t v299 = v275;
      uint64_t v300 = v264;
      uint64_t v301 = v263;
      uint64_t v302 = v274;
      uint64_t v303 = v262;
      sub_24EC77B60();
      sub_24EC77F00();
      uint64_t v283 = swift_getWitnessTable();
      swift_getWitnessTable();
      uint64_t v161 = v225;
      sub_24EC78260();
      (*(void (**)(char *, uint64_t))(v224 + 8))(v158, v161);
      (*(void (**)(void *, uint64_t))(v273 + 8))(v160, v159);
      goto LABEL_9;
    case 5u:
      LOBYTE(v284) = 8;
      v162 = v233;
      uint64_t v163 = v272;
      v164 = v258;
      sub_24EC78220();
      uint64_t v165 = v235;
      sub_24EC78240();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v234 + 8))(v162, v165);
      return (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v164, v163);
    case 6u:
      uint64_t v166 = v240;
      v167 = v236;
      uint64_t v168 = v271;
      (*(void (**)(char *, uint64_t *, uint64_t))(v240 + 32))(v236, v135, v271);
      LOBYTE(v284) = 9;
      v169 = v238;
      uint64_t v170 = v272;
      v171 = v258;
      sub_24EC78220();
      uint64_t v172 = v242;
      sub_24EC78260();
      (*(void (**)(char *, uint64_t))(v241 + 8))(v169, v172);
      (*(void (**)(char *, uint64_t))(v166 + 8))(v167, v168);
      return (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v171, v170);
    case 7u:
      uint64_t v173 = v255;
      v174 = v210;
      uint64_t v175 = v256;
      (*(void (**)(char *, uint64_t *, uint64_t))(v255 + 32))(v210, v135, v256);
      LOBYTE(v284) = 10;
      v176 = v245;
      uint64_t v163 = v272;
      v164 = v258;
      sub_24EC78220();
      swift_getWitnessTable();
      uint64_t v177 = v247;
      sub_24EC78260();
      (*(void (**)(char *, uint64_t))(v246 + 8))(v176, v177);
      (*(void (**)(char *, uint64_t))(v173 + 8))(v174, v175);
      return (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v164, v163);
    case 8u:
      LOBYTE(v284) = 0;
      v178 = v187;
      uint64_t v179 = v272;
      v180 = v258;
      sub_24EC78220();
      (*(void (**)(char *, uint64_t))(v188 + 8))(v178, v189);
      goto LABEL_19;
    case 9u:
      LOBYTE(v284) = 6;
      v181 = v218;
      uint64_t v182 = v272;
      v183 = v258;
      sub_24EC78220();
      (*(void (**)(char *, uint64_t))(v219 + 8))(v181, v221);
      goto LABEL_17;
    case 0xAu:
      LOBYTE(v284) = 7;
      v184 = v226;
      uint64_t v182 = v272;
      v183 = v258;
      sub_24EC78220();
      (*(void (**)(char *, uint64_t))(v227 + 8))(v184, v228);
LABEL_17:
      uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v183, v182);
      break;
    case 0xBu:
      LOBYTE(v284) = 11;
      v185 = v248;
      uint64_t v179 = v272;
      v180 = v258;
      sub_24EC78220();
      (*(void (**)(char *, uint64_t))(v249 + 8))(v185, v250);
LABEL_19:
      uint64_t result = (*(uint64_t (**)(void *, uint64_t))(v273 + 8))(v180, v179);
      break;
    default:
      uint64_t v138 = *v135;
      LOBYTE(v284) = 1;
      v139 = v194;
      uint64_t v140 = v272;
      v141 = v258;
      sub_24EC78220();
      uint64_t v284 = v138;
      sub_24EC77FF0();
      uint64_t v282 = v280;
      swift_getWitnessTable();
      uint64_t v142 = v196;
      sub_24EC78260();
      (*(void (**)(char *, uint64_t))(v195 + 8))(v139, v142);
      (*(void (**)(void *, uint64_t))(v273 + 8))(v141, v140);
LABEL_9:
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t type metadata accessor for CanvasAction.ClearCanvasCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.ClearCanvasCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.ViewAppearedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.ViewAppearedCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.TappedItemCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.TappedItemCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.ScrolledToIdentifierCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.ScrolledToIdentifierCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.ReloadCanvasCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.ReloadCanvasCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.RefreshCanvasCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.RefreshCanvasCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.LoadedDescriptorsCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.LoadedDescriptorsCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.LayoutDidChangeCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.LayoutDidChangeCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.ItemDisappearedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.ItemDisappearedCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.ItemAppearedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.ItemAppearedCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.InvalidateItemsCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.InvalidateItemsCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.EndCanvasRefreshCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.EndCanvasRefreshCodingKeys);
}

uint64_t type metadata accessor for CanvasAction.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction.CodingKeys);
}

uint64_t CanvasAction.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  *((void *)&v294 + 1) = a3;
  *(void *)&unsigned long long v294 = a2;
  uint64_t v289 = a1;
  uint64_t v264 = a9;
  uint64_t v300 = a24;
  uint64_t v303 = a22;
  uint64_t v297 = a21;
  uint64_t v298 = a20;
  uint64_t v296 = a19;
  uint64_t v301 = a18;
  uint64_t v307 = a17;
  uint64_t v302 = a16;
  uint64_t v293 = a15;
  uint64_t v306 = a14;
  uint64_t v305 = a13;
  uint64_t v304 = a12;
  uint64_t v310 = a11;
  uint64_t v308 = a10;
  *(void *)&unsigned long long v315 = a2;
  *((void *)&v315 + 1) = a3;
  *(void *)&long long v316 = a4;
  *((void *)&v316 + 1) = a5;
  uint64_t v309 = a5;
  uint64_t v317 = a6;
  uint64_t v318 = a7;
  uint64_t v319 = a8;
  uint64_t v320 = a10;
  uint64_t v321 = a11;
  uint64_t v322 = a12;
  uint64_t v323 = a13;
  uint64_t v324 = a14;
  uint64_t v325 = a15;
  uint64_t v326 = a16;
  uint64_t v327 = a17;
  uint64_t v328 = a18;
  uint64_t v329 = a19;
  uint64_t v330 = a20;
  uint64_t v331 = a21;
  uint64_t v332 = a22;
  uint64_t v333 = a23;
  uint64_t v334 = a24;
  uint64_t v292 = a23;
  uint64_t v281 = type metadata accessor for CanvasAction.ClearCanvasCodingKeys(255, (uint64_t)&v315);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v242 = sub_24EC78210();
  uint64_t v241 = *(void *)(v242 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v262 = (char *)&v213 - v29;
  uint64_t v30 = v294;
  unsigned long long v315 = v294;
  uint64_t v31 = *((void *)&v294 + 1);
  uint64_t v295 = a4;
  *(void *)&long long v316 = a4;
  *((void *)&v316 + 1) = a5;
  uint64_t v290 = a6;
  uint64_t v317 = a6;
  uint64_t v318 = a7;
  uint64_t v291 = a7;
  uint64_t v299 = a8;
  uint64_t v319 = a8;
  uint64_t v320 = a10;
  uint64_t v321 = a11;
  uint64_t v322 = a12;
  uint64_t v323 = a13;
  uint64_t v324 = a14;
  uint64_t v325 = a15;
  uint64_t v326 = a16;
  uint64_t v327 = a17;
  uint64_t v328 = a18;
  uint64_t v329 = a19;
  uint64_t v330 = a20;
  uint64_t v331 = a21;
  uint64_t v332 = a22;
  uint64_t v333 = a23;
  uint64_t v334 = a24;
  uint64_t v32 = type metadata accessor for CanvasAction.ViewAppearedCodingKeys(255, (uint64_t)&v315);
  uint64_t v33 = swift_getWitnessTable();
  uint64_t v279 = v32;
  uint64_t v278 = v33;
  uint64_t v240 = sub_24EC78210();
  uint64_t v239 = *(void *)(v240 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v261 = (char *)&v213 - v34;
  *(void *)&unsigned long long v315 = v30;
  *((void *)&v315 + 1) = v31;
  *(void *)&long long v316 = a4;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = a6;
  uint64_t v318 = a7;
  uint64_t v319 = a8;
  uint64_t v320 = a10;
  uint64_t v35 = v304;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v36 = v305;
  uint64_t v37 = v306;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v38 = v293;
  uint64_t v39 = v302;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v40 = v307;
  uint64_t v41 = v301;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v42 = v296;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v331 = v297;
  uint64_t v332 = v303;
  uint64_t v333 = v292;
  uint64_t v334 = v300;
  uint64_t v43 = type metadata accessor for CanvasAction.TappedItemCodingKeys(255, (uint64_t)&v315);
  uint64_t v44 = swift_getWitnessTable();
  uint64_t v277 = v43;
  uint64_t v276 = v44;
  uint64_t v238 = sub_24EC78210();
  uint64_t v237 = *(void *)(v238 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v260 = (char *)&v213 - v45;
  unint64_t v46 = v294;
  unsigned long long v315 = v294;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v321 = v310;
  uint64_t v322 = v35;
  uint64_t v323 = v36;
  uint64_t v324 = v37;
  uint64_t v325 = v38;
  uint64_t v326 = v39;
  uint64_t v327 = v40;
  uint64_t v328 = v41;
  uint64_t v47 = v42;
  uint64_t v48 = v298;
  uint64_t v329 = v42;
  uint64_t v330 = v298;
  uint64_t v49 = v297;
  uint64_t v50 = v303;
  uint64_t v331 = v297;
  uint64_t v332 = v303;
  uint64_t v333 = v292;
  uint64_t v334 = v300;
  uint64_t v51 = type metadata accessor for CanvasAction.ScrolledToIdentifierCodingKeys(255, (uint64_t)&v315);
  uint64_t v52 = swift_getWitnessTable();
  uint64_t v275 = v51;
  uint64_t v274 = v52;
  uint64_t v236 = sub_24EC78210();
  uint64_t v235 = *(void *)(v236 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v259 = (char *)&v213 - v53;
  unsigned long long v315 = __PAIR128__(*((unint64_t *)&v294 + 1), v46);
  uint64_t v54 = *((void *)&v294 + 1);
  uint64_t v55 = v295;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v56 = v290;
  uint64_t v57 = v291;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v58 = v299;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v329 = v47;
  uint64_t v330 = v48;
  uint64_t v331 = v49;
  uint64_t v332 = v50;
  uint64_t v59 = v292;
  uint64_t v333 = v292;
  uint64_t v334 = v300;
  uint64_t v60 = type metadata accessor for CanvasAction.ReloadCanvasCodingKeys(255, (uint64_t)&v315);
  uint64_t v61 = swift_getWitnessTable();
  uint64_t v273 = v60;
  uint64_t v272 = v61;
  uint64_t v234 = sub_24EC78210();
  uint64_t v233 = *(void *)(v234 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v258 = (char *)&v213 - v62;
  *(void *)&unsigned long long v315 = v294;
  *((void *)&v315 + 1) = v54;
  *(void *)&long long v316 = v55;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = v56;
  uint64_t v318 = v57;
  uint64_t v63 = v308;
  uint64_t v319 = v58;
  uint64_t v320 = v308;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v64 = v306;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v65 = v293;
  uint64_t v66 = v302;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v67 = v307;
  uint64_t v68 = v301;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v331 = v297;
  uint64_t v332 = v303;
  uint64_t v69 = v59;
  uint64_t v70 = v300;
  uint64_t v333 = v59;
  uint64_t v334 = v300;
  uint64_t refreshed = type metadata accessor for CanvasAction.RefreshCanvasCodingKeys(255, (uint64_t)&v315);
  uint64_t v72 = swift_getWitnessTable();
  uint64_t v271 = refreshed;
  uint64_t v270 = v72;
  uint64_t v230 = sub_24EC78210();
  uint64_t v229 = *(void *)(v230 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v256 = (char *)&v213 - v73;
  unint64_t v74 = v294;
  unsigned long long v315 = v294;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v299;
  uint64_t v320 = v63;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v323 = v305;
  uint64_t v324 = v64;
  uint64_t v325 = v65;
  uint64_t v326 = v66;
  uint64_t v327 = v67;
  uint64_t v328 = v68;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v75 = v297;
  uint64_t v76 = v303;
  uint64_t v331 = v297;
  uint64_t v332 = v303;
  uint64_t v333 = v69;
  uint64_t v334 = v70;
  uint64_t v77 = type metadata accessor for CanvasAction.LoadedDescriptorsCodingKeys(255, (uint64_t)&v315);
  uint64_t v78 = swift_getWitnessTable();
  uint64_t v269 = v77;
  uint64_t v268 = v78;
  uint64_t v232 = sub_24EC78210();
  uint64_t v231 = *(void *)(v232 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v257 = (char *)&v213 - v79;
  unsigned long long v315 = __PAIR128__(*((unint64_t *)&v294 + 1), v74);
  uint64_t v80 = *((void *)&v294 + 1);
  uint64_t v81 = v309;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v82 = v290;
  uint64_t v83 = v291;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v84 = v310;
  uint64_t v85 = v304;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v86 = v305;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v331 = v75;
  uint64_t v332 = v76;
  uint64_t v333 = v292;
  uint64_t v334 = v300;
  uint64_t v87 = type metadata accessor for CanvasAction.LayoutDidChangeCodingKeys(255, (uint64_t)&v315);
  uint64_t v88 = swift_getWitnessTable();
  uint64_t v267 = v87;
  uint64_t v266 = v88;
  uint64_t v228 = sub_24EC78210();
  uint64_t v227 = *(void *)(v228 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v255 = (char *)&v213 - v89;
  *(void *)&unsigned long long v315 = v294;
  *((void *)&v315 + 1) = v80;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v81;
  uint64_t v317 = v82;
  uint64_t v318 = v83;
  uint64_t v90 = v299;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v321 = v84;
  uint64_t v322 = v85;
  uint64_t v323 = v86;
  uint64_t v324 = v306;
  uint64_t v91 = v293;
  uint64_t v92 = v302;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v93 = v296;
  uint64_t v94 = v298;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v95 = v297;
  uint64_t v331 = v297;
  uint64_t v332 = v303;
  uint64_t v96 = v300;
  uint64_t v333 = v292;
  uint64_t v334 = v300;
  uint64_t v97 = type metadata accessor for CanvasAction.ItemDisappearedCodingKeys(255, (uint64_t)&v315);
  uint64_t v98 = swift_getWitnessTable();
  uint64_t v265 = v97;
  uint64_t v253 = v98;
  uint64_t v226 = sub_24EC78210();
  uint64_t v225 = *(void *)(v226 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v254 = (char *)&v213 - v99;
  unint64_t v100 = v294;
  unsigned long long v315 = v294;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v90;
  uint64_t v320 = v308;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v325 = v91;
  uint64_t v326 = v92;
  uint64_t v101 = v301;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v329 = v93;
  uint64_t v330 = v94;
  uint64_t v102 = v303;
  uint64_t v331 = v95;
  uint64_t v332 = v303;
  uint64_t v333 = v292;
  uint64_t v334 = v96;
  uint64_t v103 = type metadata accessor for CanvasAction.ItemAppearedCodingKeys(255, (uint64_t)&v315);
  uint64_t v104 = swift_getWitnessTable();
  uint64_t v251 = v103;
  uint64_t v250 = v104;
  uint64_t v224 = sub_24EC78210();
  uint64_t v223 = *(void *)(v224 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v252 = (char *)&v213 - v105;
  unsigned long long v315 = __PAIR128__(*((unint64_t *)&v294 + 1), v100);
  uint64_t v106 = v295;
  uint64_t v107 = v309;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v108 = v290;
  uint64_t v109 = v291;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v110 = v304;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v111 = v305;
  uint64_t v112 = v306;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v327 = v307;
  uint64_t v328 = v101;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v331 = v297;
  uint64_t v332 = v102;
  uint64_t v113 = v292;
  uint64_t v333 = v292;
  uint64_t v334 = v300;
  uint64_t v114 = type metadata accessor for CanvasAction.InvalidateItemsCodingKeys(255, (uint64_t)&v315);
  uint64_t v115 = swift_getWitnessTable();
  uint64_t v248 = v114;
  uint64_t v247 = v115;
  uint64_t v222 = sub_24EC78210();
  uint64_t v221 = *(void *)(v222 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v249 = (char *)&v213 - v116;
  unsigned long long v315 = v294;
  *(void *)&long long v316 = v106;
  *((void *)&v316 + 1) = v107;
  uint64_t v317 = v108;
  uint64_t v318 = v109;
  uint64_t v117 = v308;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v321 = v310;
  uint64_t v322 = v110;
  uint64_t v323 = v111;
  uint64_t v324 = v112;
  uint64_t v118 = v293;
  uint64_t v119 = v302;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v120 = v307;
  uint64_t v327 = v307;
  uint64_t v328 = v301;
  uint64_t v121 = v296;
  uint64_t v122 = v298;
  uint64_t v329 = v296;
  uint64_t v330 = v298;
  uint64_t v123 = v297;
  uint64_t v331 = v297;
  uint64_t v332 = v303;
  uint64_t v124 = v300;
  uint64_t v333 = v113;
  uint64_t v334 = v300;
  uint64_t v125 = type metadata accessor for CanvasAction.EndCanvasRefreshCodingKeys(255, (uint64_t)&v315);
  uint64_t v126 = swift_getWitnessTable();
  uint64_t v246 = v125;
  uint64_t v245 = v126;
  uint64_t v220 = sub_24EC78210();
  uint64_t v219 = *(void *)(v220 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v244 = (char *)&v213 - v127;
  unsigned long long v315 = v294;
  uint64_t v128 = *((void *)&v294 + 1);
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v299;
  uint64_t v320 = v117;
  uint64_t v129 = v310;
  uint64_t v321 = v310;
  uint64_t v322 = v304;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v325 = v118;
  uint64_t v326 = v119;
  uint64_t v130 = v301;
  uint64_t v327 = v120;
  uint64_t v328 = v301;
  uint64_t v329 = v121;
  uint64_t v330 = v122;
  uint64_t v331 = v123;
  uint64_t v131 = v303;
  uint64_t v132 = v292;
  uint64_t v332 = v303;
  uint64_t v333 = v292;
  uint64_t v334 = v124;
  uint64_t v133 = type metadata accessor for CanvasAction.CodingKeys(255, (uint64_t)&v315);
  uint64_t v287 = swift_getWitnessTable();
  uint64_t v286 = sub_24EC78210();
  uint64_t v283 = *(void *)(v286 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v135 = (char *)&v213 - v134;
  *(void *)&unsigned long long v315 = v294;
  *((void *)&v315 + 1) = v128;
  *(void *)&long long v316 = v295;
  *((void *)&v316 + 1) = v309;
  uint64_t v317 = v290;
  uint64_t v318 = v291;
  uint64_t v319 = v299;
  uint64_t v320 = v308;
  uint64_t v321 = v129;
  uint64_t v322 = v304;
  uint64_t v323 = v305;
  uint64_t v324 = v306;
  uint64_t v325 = v293;
  uint64_t v326 = v302;
  uint64_t v327 = v307;
  uint64_t v328 = v130;
  uint64_t v329 = v296;
  uint64_t v330 = v122;
  uint64_t v331 = v297;
  uint64_t v332 = v131;
  uint64_t v333 = v132;
  uint64_t v334 = v124;
  uint64_t v282 = type metadata accessor for CanvasAction(0, (uint64_t)&v315);
  uint64_t v263 = *(void *)(v282 - 8);
  uint64_t v136 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v218 = (char *)&v213 - ((v137 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = MEMORY[0x270FA5388](v136);
  uint64_t v243 = (char *)&v213 - v139;
  uint64_t v140 = MEMORY[0x270FA5388](v138);
  uint64_t v216 = (uint64_t *)((char *)&v213 - v141);
  uint64_t v142 = MEMORY[0x270FA5388](v140);
  uint64_t v217 = (void **)((char *)&v213 - v143);
  uint64_t v144 = MEMORY[0x270FA5388](v142);
  v146 = (char *)&v213 - v145;
  uint64_t v147 = MEMORY[0x270FA5388](v144);
  uint64_t v149 = (char *)&v213 - v148;
  uint64_t v150 = MEMORY[0x270FA5388](v147);
  v152 = (char *)&v213 - v151;
  uint64_t v153 = MEMORY[0x270FA5388](v150);
  uint64_t v155 = (char *)&v213 - v154;
  MEMORY[0x270FA5388](v153);
  uint64_t v157 = (char *)&v213 - v156;
  __swift_project_boxed_opaque_existential_1(v289, v289[3]);
  uint64_t v284 = v135;
  *(void *)&unsigned long long v285 = v133;
  v158 = v288;
  sub_24EC78310();
  if (v158) {
    goto LABEL_19;
  }
  v213 = v155;
  uint64_t v214 = v152;
  uint64_t v215 = v149;
  uint64_t v287 = (uint64_t)v146;
  uint64_t v288 = v157;
  uint64_t v159 = v309;
  uint64_t v160 = v302;
  uint64_t v161 = v303;
  v162 = v284;
  *(void *)&unsigned long long v315 = sub_24EC78200();
  sub_24EC77F00();
  swift_getWitnessTable();
  *(void *)&unsigned long long v313 = sub_24EC780C0();
  *((void *)&v313 + 1) = v163;
  *(void *)&long long v314 = v164;
  *((void *)&v314 + 1) = v165;
  sub_24EC780B0();
  swift_getWitnessTable();
  sub_24EC78030();
  uint64_t v166 = v162;
  if (v315 == 12 || (unsigned long long v285 = v313, v315 = v313, v316 = v314, (sub_24EC78040() & 1) == 0))
  {
    uint64_t v173 = sub_24EC78100();
    swift_allocError();
    uint64_t v175 = v174;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269961F40);
    *uint64_t v175 = v282;
    uint64_t v176 = v286;
    sub_24EC781B0();
    sub_24EC780F0();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v173 - 8) + 104))(v175, *MEMORY[0x263F8DCB0], v173);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v283 + 8))(v162, v176);
LABEL_19:
    uint64_t v205 = v289;
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v205);
  }
  uint64_t v167 = v286;
  uint64_t v168 = v160;
  uint64_t v169 = v308;
  switch(&v295)
  {
    case 1u:
      LOBYTE(v315) = 1;
      uint64_t v177 = v249;
      sub_24EC781A0();
      sub_24EC77FF0();
      uint64_t v311 = v160;
      swift_getWitnessTable();
      uint64_t v178 = v222;
      sub_24EC781F0();
      (*(void (**)(char *, uint64_t))(v221 + 8))(v177, v178);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      uint64_t v179 = v213;
      void *v213 = v315;
      uint64_t v172 = v282;
      goto LABEL_22;
    case 2u:
      LOBYTE(v315) = 2;
      v180 = v252;
      sub_24EC781A0();
      sub_24EC779D0();
      sub_24EC51F60(&qword_269961F48);
      v181 = v214;
      uint64_t v182 = v224;
      sub_24EC781F0();
      (*(void (**)(char *, uint64_t))(v223 + 8))(v180, v182);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      uint64_t v172 = v282;
      goto LABEL_10;
    case 3u:
      LOBYTE(v315) = 3;
      v183 = v254;
      sub_24EC781A0();
      sub_24EC779D0();
      sub_24EC51F60(&qword_269961F48);
      v181 = v215;
      uint64_t v184 = v226;
      sub_24EC781F0();
      (*(void (**)(char *, uint64_t))(v225 + 8))(v183, v184);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      uint64_t v172 = v282;
LABEL_10:
      swift_storeEnumTagMultiPayload();
      uint64_t v185 = v263;
      v171 = v288;
      (*(void (**)(char *, char *, uint64_t))(v263 + 32))(v288, v181, v172);
      goto LABEL_24;
    case 4u:
      LOBYTE(v315) = 4;
      uint64_t v186 = v255;
      sub_24EC781A0();
      *(void *)&unsigned long long v315 = v169;
      *((void *)&v315 + 1) = v310;
      *(void *)&long long v316 = v161;
      *((void *)&v316 + 1) = v292;
      sub_24EC77BC0();
      swift_getWitnessTable();
      v187 = (char *)v287;
      uint64_t v188 = v228;
      sub_24EC781F0();
      (*(void (**)(char *, uint64_t))(v227 + 8))(v186, v188);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      uint64_t v172 = v282;
      goto LABEL_23;
    case 5u:
      LOBYTE(v315) = 5;
      uint64_t v189 = v257;
      sub_24EC781A0();
      uint64_t v190 = v159;
      uint64_t v191 = v166;
      unsigned long long v315 = v294;
      *(void *)&long long v316 = v295;
      *((void *)&v316 + 1) = v190;
      uint64_t v317 = v290;
      uint64_t v318 = v299;
      uint64_t v319 = v169;
      uint64_t v320 = v291;
      uint64_t v321 = v304;
      uint64_t v322 = v305;
      uint64_t v323 = v306;
      uint64_t v324 = v293;
      uint64_t v325 = v168;
      uint64_t v326 = v307;
      uint64_t v327 = v301;
      uint64_t v328 = v296;
      uint64_t v329 = v297;
      uint64_t v330 = v161;
      uint64_t v331 = v298;
      uint64_t v332 = v300;
      sub_24EC77B60();
      sub_24EC77F00();
      uint64_t v312 = swift_getWitnessTable();
      swift_getWitnessTable();
      uint64_t v192 = v232;
      sub_24EC781F0();
      (*(void (**)(char *, uint64_t))(v231 + 8))(v189, v192);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v191, v167);
      uint64_t v179 = v217;
      *uint64_t v217 = v335;
      uint64_t v172 = v282;
      goto LABEL_22;
    case 6u:
      LOBYTE(v315) = 6;
      uint64_t v193 = v256;
      sub_24EC781A0();
      (*(void (**)(char *, uint64_t))(v229 + 8))(v193, v230);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      v171 = v288;
      uint64_t v172 = v282;
      goto LABEL_21;
    case 7u:
      LOBYTE(v315) = 7;
      v194 = v258;
      sub_24EC781A0();
      (*(void (**)(char *, uint64_t))(v233 + 8))(v194, v234);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      v171 = v288;
      uint64_t v172 = v282;
      goto LABEL_21;
    case 8u:
      LOBYTE(v315) = 8;
      uint64_t v195 = v259;
      sub_24EC781A0();
      uint64_t v196 = v166;
      uint64_t v197 = v236;
      uint64_t v209 = sub_24EC781D0();
      uint64_t v211 = v210;
      (*(void (**)(char *, uint64_t))(v235 + 8))(v195, v197);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v196, v167);
      uint64_t v212 = v216;
      *uint64_t v216 = v209;
      v212[1] = v211;
      uint64_t v172 = v282;
      swift_storeEnumTagMultiPayload();
      uint64_t v185 = v263;
      v171 = v288;
      (*(void (**)(char *, uint64_t *, uint64_t))(v263 + 32))(v288, v212, v172);
      goto LABEL_24;
    case 9u:
      LOBYTE(v315) = 9;
      uint64_t v198 = v260;
      sub_24EC781A0();
      v199 = v166;
      uint64_t v200 = v238;
      sub_24EC781F0();
      uint64_t v201 = v283;
      (*(void (**)(char *, uint64_t))(v237 + 8))(v198, v200);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v201 + 8))(v199, v167);
      uint64_t v179 = v243;
      uint64_t v172 = v282;
LABEL_22:
      swift_storeEnumTagMultiPayload();
      uint64_t v185 = v263;
      v171 = v288;
      (*(void (**)(char *, void *, uint64_t))(v263 + 32))(v288, v179, v172);
      goto LABEL_24;
    case 0xAu:
      LOBYTE(v315) = 10;
      uint64_t v202 = v261;
      sub_24EC781A0();
      *(void *)&unsigned long long v315 = v169;
      *((void *)&v315 + 1) = v310;
      *(void *)&long long v316 = v161;
      *((void *)&v316 + 1) = v292;
      sub_24EC77BC0();
      swift_getWitnessTable();
      v187 = v218;
      uint64_t v203 = v240;
      sub_24EC781F0();
      (*(void (**)(char *, uint64_t))(v239 + 8))(v202, v203);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      uint64_t v172 = v282;
LABEL_23:
      swift_storeEnumTagMultiPayload();
      uint64_t v185 = v263;
      v171 = v288;
      (*(void (**)(char *, char *, uint64_t))(v263 + 32))(v288, v187, v172);
LABEL_24:
      uint64_t v207 = v289;
      uint64_t v208 = v264;
      goto LABEL_25;
    case 0xBu:
      LOBYTE(v315) = 11;
      uint64_t v204 = v262;
      sub_24EC781A0();
      (*(void (**)(char *, uint64_t))(v241 + 8))(v204, v242);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      v171 = v288;
      uint64_t v172 = v282;
      goto LABEL_21;
    default:
      LOBYTE(v315) = 0;
      uint64_t v170 = v244;
      sub_24EC781A0();
      (*(void (**)(char *, uint64_t))(v219 + 8))(v170, v220);
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v283 + 8))(v166, v167);
      v171 = v288;
      uint64_t v172 = v282;
LABEL_21:
      swift_storeEnumTagMultiPayload();
      uint64_t v207 = v289;
      uint64_t v208 = v264;
      uint64_t v185 = v263;
LABEL_25:
      (*(void (**)(uint64_t, char *, uint64_t))(v185 + 32))(v208, v171, v172);
      uint64_t v205 = v207;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v205);
}

uint64_t type metadata accessor for CanvasAction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasAction);
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

uint64_t sub_24EC51F60(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24EC779D0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24EC51FA4@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return CanvasAction.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a3, a2[9], a2[10], a2[11], a2[12], a2[13], a2[14], a2[15], a2[16], a2[17], a2[18],
           a2[19],
           a2[20],
           a2[21],
           a2[22],
           a2[23]);
}

uint64_t sub_24EC5200C(void *a1, void *a2)
{
  return CanvasAction.encode(to:)(a1, a2);
}

uint64_t sub_24EC52024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 184);
}

uint64_t sub_24EC5202C()
{
  uint64_t result = sub_24EC779D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_24EC77BC0();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_24EC52168(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 4u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
      case 2u:
        uint64_t v10 = sub_24EC779D0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 7u:
        uint64_t v11 = sub_24EC77BC0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        uint64_t v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        (*(void (**)(uint64_t *, uint64_t *))(*(void *)(*(void *)(a3 + 40) - 8) + 16))(a1, a2);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v7 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_24EC52468(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 4:
    case 5:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 1:
    case 2:
      uint64_t v5 = sub_24EC779D0();
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
      uint64_t v7 = v5;
      goto LABEL_8;
    case 3:
    case 7:
      uint64_t v8 = sub_24EC77BC0();
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
      break;
    case 6:
      uint64_t v7 = *(void *)(a2 + 40);
      uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
LABEL_8:
      uint64_t result = v6(a1, v7);
      break;
    default:
      return result;
  }
  return result;
}

void *sub_24EC525D0(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 4u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 1u:
    case 2u:
      uint64_t v6 = sub_24EC779D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_8;
    case 3u:
    case 7u:
      uint64_t v8 = sub_24EC77BC0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      goto LABEL_8;
    case 5u:
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 6u:
      (*(void (**)(void *, void *))(*(void *)(*(void *)(a3 + 40) - 8) + 16))(a1, a2);
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_24EC52870(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 4u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 1u:
      case 2u:
        uint64_t v7 = sub_24EC779D0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        goto LABEL_9;
      case 3u:
      case 7u:
        uint64_t v8 = sub_24EC77BC0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_9;
      case 5u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 6u:
        (*(void (**)(void *, void *))(*(void *)(*(void *)(a3 + 40) - 8) + 16))(a1, a2);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

void *sub_24EC52B6C(void *a1, const void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v6 = sub_24EC779D0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      goto LABEL_6;
    case 3u:
    case 7u:
      uint64_t v7 = sub_24EC77BC0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      goto LABEL_6;
    case 6u:
      (*(void (**)(void *, const void *))(*(void *)(*(void *)(a3 + 40) - 8) + 32))(a1, a2);
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *sub_24EC52DB4(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        uint64_t v7 = sub_24EC779D0();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
        goto LABEL_7;
      case 3u:
      case 7u:
        uint64_t v8 = sub_24EC77BC0();
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
        goto LABEL_7;
      case 6u:
        (*(void (**)(void *, const void *))(*(void *)(*(void *)(a3 + 40) - 8) + 32))(a1, a2);
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_24EC53050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_24EC53078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_24EC530A4()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24EC530B4(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_24EC53144(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *uint64_t result = a2 + 11;
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
        JUMPOUT(0x24EC53210);
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
          *uint64_t result = a2 + 11;
        break;
    }
  }
  return result;
}

uint64_t sub_24EC53244()
{
  return 0;
}

uint64_t getEnumTagSinglePayload for CanvasFetchError(unsigned int *a1, int a2)
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

unsigned char *sub_24EC5329C(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EC53338);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EC53360()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5337C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53398()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC533B4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC533D0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC533EC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53408()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53424()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53440()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5345C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53478()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53494()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC534B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC534CC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC534E8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53504()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53520()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5353C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53558()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53574()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53590()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC535AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC535C8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC535E4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53600()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5361C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53638()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53654()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53670()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5368C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC536A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC536C4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC536E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC536FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53718()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC53734()
{
  return 12;
}

uint64_t sub_24EC53740()
{
  return sub_24EC4C9CC();
}

id static UIColor.keyTint.getter()
{
  id v0 = objc_allocWithZone(MEMORY[0x263F825C8]);
  return objc_msgSend(v0, sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
}

void _s7SwiftUI5ColorV13FitnessCanvasE7keyTintACvgZ_0()
{
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
  JUMPOUT(0x25334B470);
}

void static ShapeStyle<>.keyTint.getter()
{
  objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
  JUMPOUT(0x25334B470);
}

uint64_t static CanvasFetchError.== infix(_:_:)()
{
  return 1;
}

uint64_t CanvasFetchError.hash(into:)()
{
  return sub_24EC782F0();
}

uint64_t CanvasFetchError.hashValue.getter()
{
  return sub_24EC78300();
}

unint64_t sub_24EC538E8()
{
  unint64_t result = qword_269961F50;
  if (!qword_269961F50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269961F50);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CanvasFetchError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EC539E8);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CanvasFetchError()
{
  return &type metadata for CanvasFetchError;
}

uint64_t static LazyCanvasFetcher.LazyCanvasFetcherError.== infix(_:_:)()
{
  return 1;
}

uint64_t LazyCanvasFetcher.LazyCanvasFetcherError.hash(into:)()
{
  return sub_24EC782F0();
}

uint64_t LazyCanvasFetcher.LazyCanvasFetcherError.hashValue.getter()
{
  return sub_24EC78300();
}

uint64_t sub_24EC53A94(uint64_t a1)
{
  *(void *)(v1 + 144) = a1;
  return swift_bridgeObjectRelease();
}

void *LazyCanvasFetcher.__allocating_init(batchSize:fetchLazySectionDescriptors:fetchItemForPlaceholders:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  unsigned int v6 = sub_24EC57714(a1, a2, a3);
  swift_release();
  return v6;
}

void *LazyCanvasFetcher.init(batchSize:fetchLazySectionDescriptors:fetchItemForPlaceholders:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = sub_24EC57714(a1, a2, a3);
  swift_release();
  return v3;
}

uint64_t sub_24EC53B54()
{
  *(void *)(v1 + 184) = v0;
  *(void *)(v1 + 192) = *v0;
  return MEMORY[0x270FA2498](sub_24EC53B9C, v0, 0);
}

uint64_t sub_24EC53B9C()
{
  uint64_t v1 = v0;
  int v2 = (void *)v0[24];
  uint64_t v29 = v0 + 22;
  int v3 = (void *)swift_task_alloc();
  v0[25] = v3;
  uint64_t v27 = v2[10];
  v3[2] = v27;
  uint64_t v26 = v2[11];
  v3[3] = v26;
  uint64_t v25 = v2[12];
  v3[4] = v25;
  uint64_t v24 = v2[13];
  v3[5] = v24;
  uint64_t v23 = v2[14];
  v3[6] = v23;
  uint64_t v22 = v2[15];
  v3[7] = v22;
  uint64_t v21 = v2[16];
  v3[8] = v21;
  uint64_t v20 = v2[17];
  v3[9] = v20;
  v3[10] = v2[18];
  uint64_t v19 = v2[19];
  v3[11] = v19;
  uint64_t v18 = v2[20];
  v3[12] = v18;
  uint64_t v17 = v2[21];
  v3[13] = v17;
  uint64_t v16 = v2[22];
  v3[14] = v16;
  uint64_t v15 = v2[23];
  v3[15] = v15;
  uint64_t v4 = v2[24];
  v3[16] = v4;
  uint64_t v5 = v2[25];
  v3[17] = v5;
  uint64_t v6 = v2[26];
  v3[18] = v6;
  uint64_t v7 = v2[27];
  v3[19] = v7;
  uint64_t v8 = v2[28];
  v3[20] = v8;
  uint64_t v9 = v2[29];
  v3[21] = v9;
  uint64_t v10 = (int *)MEMORY[0x263F3DE10];
  v3[22] = v2[30];
  uint64_t v28 = (int *)((char *)v10 + *v10);
  uint64_t v11 = v2[31];
  v3[23] = v11;
  uint64_t v12 = (void *)swift_task_alloc();
  v1[26] = v12;
  v1[2] = v27;
  v1[3] = v26;
  v1[4] = v25;
  v1[5] = v24;
  v1[6] = v23;
  v1[7] = v22;
  v1[8] = v21;
  v1[9] = v20;
  v1[10] = v19;
  v1[11] = v18;
  v1[12] = v17;
  v1[13] = v16;
  v1[14] = v15;
  v1[15] = v4;
  v1[16] = v5;
  v1[17] = v6;
  v1[18] = v7;
  v1[19] = v8;
  v1[20] = v9;
  v1[21] = v11;
  sub_24EC77B60();
  uint64_t v13 = sub_24EC77F00();
  void *v12 = v1;
  v12[1] = sub_24EC53E00;
  return ((uint64_t (*)(void *, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X2>, uint64_t *@<X8>), void *, uint64_t))v28)(v29, sub_24EC58114, v3, v13);
}

uint64_t sub_24EC53E00()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24EC53F2C, v1, 0);
}

uint64_t sub_24EC53F2C()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 176));
}

uint64_t sub_24EC53F44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v82 = a1;
  uint64_t v38 = a4;
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  uint64_t v41 = a7;
  uint64_t v42 = a8;
  uint64_t v43 = a10;
  uint64_t v44 = a11;
  uint64_t v45 = a12;
  uint64_t v46 = a13;
  uint64_t v47 = a14;
  uint64_t v48 = a15;
  uint64_t v49 = a16;
  uint64_t v50 = a17;
  uint64_t v51 = a18;
  uint64_t v52 = a19;
  uint64_t v53 = a20;
  uint64_t v54 = a21;
  uint64_t v55 = a22;
  uint64_t v56 = a23;
  uint64_t v57 = a24;
  uint64_t v58 = a25;
  uint64_t v59 = a26;
  uint64_t v60 = a2;
  uint64_t v61 = a3;
  sub_24EC77A90();
  uint64_t v27 = sub_24EC77F00();
  uint64_t v62 = a4;
  uint64_t v63 = a5;
  uint64_t v64 = a6;
  uint64_t v65 = a7;
  uint64_t v66 = a8;
  uint64_t v67 = a10;
  uint64_t v68 = a11;
  uint64_t v69 = a12;
  uint64_t v70 = a14;
  uint64_t v71 = a15;
  uint64_t v72 = a16;
  uint64_t v73 = a17;
  uint64_t v74 = a18;
  uint64_t v75 = a19;
  uint64_t v76 = a20;
  uint64_t v77 = a21;
  uint64_t v78 = a22;
  uint64_t v79 = a23;
  uint64_t v80 = a24;
  uint64_t v81 = a26;
  uint64_t v28 = sub_24EC77B60();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t result = sub_24EC548C0((void (*)(char *, char *))sub_24EC58178, (uint64_t)v37, v27, v28, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v30);
  *a9 = result;
  return result;
}

uint64_t sub_24EC54124@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  uint64_t v65 = a3;
  uint64_t v90 = a8;
  uint64_t v91 = a5;
  uint64_t v94 = a6;
  uint64_t v95 = a7;
  uint64_t v64 = a2;
  uint64_t v75 = a1;
  uint64_t v72 = a9;
  uint64_t v76 = a26;
  uint64_t v85 = a22;
  uint64_t v84 = a21;
  uint64_t v83 = a20;
  uint64_t v82 = a19;
  uint64_t v89 = a18;
  uint64_t v88 = a17;
  uint64_t v87 = a16;
  uint64_t v93 = a15;
  uint64_t v79 = a10;
  uint64_t v77 = a24;
  uint64_t v74 = a25;
  uint64_t v73 = a13;
  uint64_t v27 = sub_24EC78080();
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v71 = (char *)&v64 - v28;
  uint64_t v29 = sub_24EC77B00();
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v70 = (char *)&v64 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = a4;
  uint64_t v120 = a12;
  uint64_t v92 = a4;
  uint64_t v78 = a12;
  uint64_t v121 = a15;
  uint64_t v122 = a24;
  sub_24EC77B10();
  uint64_t v31 = sub_24EC78080();
  MEMORY[0x270FA5388](v31 - 8);
  uint64_t v69 = (char *)&v64 - v32;
  uint64_t v80 = a11;
  uint64_t v81 = a14;
  uint64_t v119 = a11;
  uint64_t v120 = a14;
  uint64_t v86 = a23;
  uint64_t v33 = v76;
  uint64_t v121 = a23;
  uint64_t v122 = v76;
  uint64_t v34 = sub_24EC77B20();
  MEMORY[0x270FA5388](v34 - 8);
  uint64_t v68 = (char *)&v64 - v35;
  uint64_t v119 = a4;
  uint64_t v36 = v90;
  uint64_t v37 = v91;
  uint64_t v120 = v91;
  uint64_t v121 = v94;
  uint64_t v122 = v95;
  uint64_t v123 = v90;
  uint64_t v38 = v79;
  uint64_t v124 = v79;
  uint64_t v125 = a11;
  uint64_t v126 = a12;
  uint64_t v127 = a14;
  uint64_t v128 = v93;
  uint64_t v129 = v87;
  uint64_t v130 = v88;
  uint64_t v131 = v89;
  uint64_t v132 = v82;
  uint64_t v133 = v83;
  uint64_t v39 = v85;
  uint64_t v134 = v84;
  uint64_t v135 = v85;
  uint64_t v40 = v77;
  uint64_t v136 = a23;
  uint64_t v137 = v77;
  uint64_t v138 = v33;
  uint64_t v67 = sub_24EC77A90();
  uint64_t v139 = sub_24EC77A40();
  v118[2] = v92;
  v118[3] = v37;
  v118[4] = v94;
  v118[5] = v95;
  v118[6] = v36;
  v118[7] = v38;
  uint64_t v41 = v81;
  v118[8] = v80;
  v118[9] = v78;
  v118[10] = v73;
  v118[11] = v81;
  v118[12] = v93;
  uint64_t v42 = v88;
  v118[13] = v87;
  v118[14] = v88;
  v118[15] = v89;
  v118[16] = v82;
  v118[17] = v83;
  v118[18] = v84;
  v118[19] = v39;
  v118[20] = v86;
  v118[21] = v40;
  v118[22] = v74;
  v118[23] = v33;
  v118[24] = v64;
  v118[25] = v65;
  uint64_t v119 = v92;
  uint64_t v120 = v37;
  uint64_t v121 = v94;
  uint64_t v122 = v95;
  uint64_t v123 = v36;
  uint64_t v124 = v81;
  uint64_t v125 = v93;
  uint64_t v126 = v87;
  uint64_t v43 = v87;
  uint64_t v127 = v88;
  uint64_t v128 = v89;
  uint64_t v44 = v89;
  uint64_t v129 = v82;
  uint64_t v130 = v83;
  uint64_t v45 = v82;
  uint64_t v46 = v83;
  uint64_t v131 = v84;
  uint64_t v132 = v33;
  uint64_t v47 = v84;
  sub_24EC77A20();
  uint64_t v64 = sub_24EC77F00();
  uint64_t v119 = v92;
  uint64_t v120 = v91;
  uint64_t v121 = v94;
  uint64_t v122 = v95;
  uint64_t v123 = v90;
  uint64_t v124 = v41;
  uint64_t v125 = v93;
  uint64_t v126 = v43;
  uint64_t v127 = v42;
  uint64_t v128 = v44;
  uint64_t v129 = v45;
  uint64_t v130 = v46;
  uint64_t v48 = v45;
  uint64_t v131 = v47;
  uint64_t v132 = v33;
  uint64_t v49 = v47;
  uint64_t v50 = sub_24EC77B40();
  uint64_t v65 = MEMORY[0x263F8D4D0];
  uint64_t v51 = v64;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v53 = v66;
  uint64_t v55 = sub_24EC548C0((void (*)(char *, char *))sub_24EC581E4, (uint64_t)v118, v51, v50, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v54);
  swift_bridgeObjectRelease();
  uint64_t v119 = v55;
  uint64_t v96 = v92;
  uint64_t v97 = v91;
  uint64_t v98 = v94;
  uint64_t v99 = v95;
  uint64_t v100 = v90;
  uint64_t v101 = v79;
  uint64_t v102 = v80;
  uint64_t v103 = v78;
  uint64_t v104 = v73;
  uint64_t v105 = v81;
  uint64_t v106 = v93;
  uint64_t v107 = v87;
  uint64_t v108 = v88;
  uint64_t v109 = v89;
  uint64_t v110 = v48;
  uint64_t v111 = v46;
  uint64_t v112 = v49;
  uint64_t v113 = v85;
  uint64_t v114 = v86;
  uint64_t v115 = v77;
  uint64_t v116 = v74;
  uint64_t v117 = v33;
  sub_24EC77F00();
  swift_bridgeObjectRetain();
  swift_getWitnessTable();
  uint64_t v56 = sub_24EC78120();
  uint64_t v74 = v53;
  uint64_t v119 = v55;
  swift_getWitnessTable();
  char v57 = sub_24EC78040();
  uint64_t v66 = v55;
  if (v57)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v58 = MEMORY[0x25334B5D0](v56, v50);
    swift_bridgeObjectRelease();
    if (v58 != MEMORY[0x25334B5D0](v55, v50))
    {
      uint64_t v73 = MEMORY[0x263F8EE88];
      goto LABEL_6;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269961FB8);
  uint64_t v59 = sub_24EC77B80();
  uint64_t v60 = *(void *)(v59 - 8);
  unint64_t v61 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_24EC79A00;
  (*(void (**)(unint64_t, void, uint64_t))(v60 + 104))(v62 + v61, *MEMORY[0x263F3DF20], v59);
  uint64_t v73 = sub_24EC582F0(v62);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
LABEL_6:
  sub_24EC77A30();
  sub_24EC77A70();
  sub_24EC77A60();
  sub_24EC77A50();
  sub_24EC77A80();
  return sub_24EC77B50();
}

uint64_t sub_24EC548C0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = a5;
  uint64_t v29 = a8;
  uint64_t v38 = a1;
  uint64_t v39 = a2;
  uint64_t v27 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v40 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v33 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v26 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = sub_24EC78010();
  if (!v18) {
    return sub_24EC77ED0();
  }
  uint64_t v19 = v18;
  uint64_t v43 = sub_24EC78150();
  uint64_t v32 = sub_24EC78160();
  sub_24EC78130();
  uint64_t v36 = v8;
  uint64_t result = sub_24EC78000();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v34 = (void (**)(char *))(v33 + 2);
    uint64_t v35 = v14;
    ++v33;
    while (1)
    {
      uint64_t v21 = (void (*)(char *, void))sub_24EC78050();
      uint64_t v22 = v12;
      uint64_t v23 = v12;
      uint64_t v24 = AssociatedTypeWitness;
      (*v34)(v22);
      v21(v42, 0);
      uint64_t v25 = v41;
      v38(v23, v40);
      if (v25) {
        break;
      }
      uint64_t v41 = 0;
      (*v33)(v23, v24);
      sub_24EC78140();
      sub_24EC78020();
      --v19;
      uint64_t v12 = v23;
      if (!v19)
      {
        (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
        return v43;
      }
    }
    (*v33)(v23, v24);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v17, v31);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v40, v28);
  }
  return result;
}

uint64_t sub_24EC54CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11, long long a12, long long a13, long long a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  uint64_t v31 = a1;
  v30[2] = a13;
  v30[3] = a14;
  v30[1] = a12;
  v30[0] = a11;
  uint64_t v24 = sub_24EC77B70();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)v30 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v34 = a4;
  uint64_t v35 = a5;
  uint64_t v36 = a6;
  long long v37 = a11;
  long long v38 = a12;
  long long v39 = a13;
  long long v40 = a14;
  uint64_t v41 = a19;
  sub_24EC77B40();
  uint64_t v28 = sub_24EC77B30();
  (*(void (**)(char *, void, uint64_t))(v25 + 104))(v27, *MEMORY[0x263F3DEB8], v24);
  LOBYTE(a5) = sub_24EC54E60((uint64_t)v27, v28);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  return a5 & 1;
}

uint64_t sub_24EC54E60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_24EC77B70();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_24EC58608(&qword_26B1D9CF0, MEMORY[0x263F3DEC0]),
        uint64_t v7 = sub_24EC77E70(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_24EC58608(&qword_26B1D9CF8, MEMORY[0x263F3DEC0]);
      char v15 = sub_24EC77E90();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_24EC55074(uint64_t a1)
{
  v2[67] = v1;
  v2[66] = a1;
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  v2[68] = v4;
  uint64_t v5 = v3[11];
  v2[69] = v5;
  uint64_t v6 = v3[12];
  v2[70] = v6;
  uint64_t v7 = v3[13];
  v2[71] = v7;
  uint64_t v8 = v3[14];
  v2[72] = v8;
  uint64_t v9 = v3[17];
  v2[73] = v9;
  uint64_t v10 = v3[15];
  v2[74] = v10;
  uint64_t v11 = v3[16];
  v2[75] = v11;
  uint64_t v12 = v3[18];
  v2[76] = v12;
  uint64_t v13 = v3[19];
  v2[77] = v13;
  uint64_t v14 = v3[20];
  v2[78] = v14;
  uint64_t v15 = v3[21];
  v2[79] = v15;
  uint64_t v16 = v3[22];
  v2[80] = v16;
  uint64_t v17 = v3[23];
  v2[81] = v17;
  uint64_t v18 = v3[24];
  v2[82] = v18;
  uint64_t v19 = v3[25];
  v2[83] = v19;
  uint64_t v20 = v3[26];
  v2[84] = v20;
  uint64_t v21 = v3[29];
  v2[85] = v21;
  uint64_t v22 = v3[27];
  v2[86] = v22;
  uint64_t v23 = v3[28];
  v2[87] = v23;
  uint64_t v24 = v3[30];
  v2[88] = v24;
  uint64_t v25 = v3[31];
  v2[89] = v25;
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  v2[6] = v8;
  v2[7] = v9;
  v2[8] = v10;
  v2[9] = v11;
  v2[10] = v12;
  v2[11] = v13;
  v2[12] = v14;
  v2[13] = v15;
  v2[14] = v16;
  v2[15] = v17;
  v2[16] = v18;
  v2[17] = v19;
  v2[18] = v20;
  v2[19] = v21;
  v2[20] = v22;
  v2[21] = v23;
  v2[22] = v24;
  v2[23] = v25;
  uint64_t v26 = type metadata accessor for CanvasAction(0, (uint64_t)(v2 + 2));
  v2[90] = v26;
  v2[91] = *(void *)(v26 - 8);
  v2[92] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC55398, v1, 0);
}

uint64_t sub_24EC55398()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F3DE00] + MEMORY[0x263F3DE00]);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 744) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24EC55448;
  uint64_t v2 = *(void *)(v0 + 528);
  return v4(v2);
}

uint64_t sub_24EC55448()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v2 + 752) = v6;
    *uint64_t v6 = v3;
    v6[1] = sub_24EC55600;
    uint64_t v7 = *(void **)(v2 + 536);
    v6[23] = v7;
    v6[24] = *v7;
    return MEMORY[0x270FA2498](sub_24EC53B9C, v7, 0);
  }
}

uint64_t sub_24EC55600(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 536);
  *(void *)(*(void *)v1 + 760) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24EC55718, v2, 0);
}

uint64_t sub_24EC55718()
{
  uint64_t v1 = *(void *)(v0 + 712);
  uint64_t v2 = *(void *)(v0 + 680);
  uint64_t v3 = *(void *)(v0 + 584);
  uint64_t v4 = *(void *)(v0 + 576);
  swift_bridgeObjectRetain();
  long long v5 = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 368) = *(_OWORD *)(v0 + 544);
  *(_OWORD *)(v0 + 384) = v5;
  *(void *)(v0 + 400) = v4;
  *(_OWORD *)(v0 + 408) = *(_OWORD *)(v0 + 592);
  *(void *)(v0 + 424) = v3;
  long long v6 = *(_OWORD *)(v0 + 632);
  *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 616);
  *(_OWORD *)(v0 + 448) = v6;
  long long v7 = *(_OWORD *)(v0 + 664);
  *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 648);
  *(_OWORD *)(v0 + 480) = v7;
  *(_OWORD *)(v0 + 496) = *(_OWORD *)(v0 + 688);
  *(void *)(v0 + 512) = v2;
  *(void *)(v0 + 520) = v1;
  sub_24EC77B60();
  swift_getWitnessTable();
  char v8 = sub_24EC77F20();
  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v9 = *(void *)(v0 + 680);
    uint64_t v10 = *(void *)(v0 + 672);
    uint64_t v11 = *(void *)(v0 + 584);
    uint64_t v12 = *(void *)(v0 + 576);
    long long v20 = *(_OWORD *)(v0 + 560);
    long long v21 = *(_OWORD *)(v0 + 544);
    long long v25 = *(_OWORD *)(v0 + 624);
    long long v26 = *(_OWORD *)(v0 + 608);
    long long v24 = *(_OWORD *)(v0 + 640);
    long long v22 = *(_OWORD *)(v0 + 592);
    long long v23 = *(_OWORD *)(v0 + 656);
    long long v27 = *(_OWORD *)(v0 + 688);
    long long v28 = *(_OWORD *)(v0 + 704);
    swift_bridgeObjectRelease();
    *(_OWORD *)(v0 + 192) = v21;
    *(_OWORD *)(v0 + 208) = v20;
    *(void *)(v0 + 224) = v12;
    *(_OWORD *)(v0 + 232) = v22;
    *(void *)(v0 + 248) = v11;
    *(_OWORD *)(v0 + 256) = v26;
    *(_OWORD *)(v0 + 272) = v25;
    *(_OWORD *)(v0 + 288) = v24;
    *(_OWORD *)(v0 + 304) = v23;
    *(void *)(v0 + 320) = v10;
    *(_OWORD *)(v0 + 328) = v27;
    *(void *)(v0 + 344) = v9;
    *(_OWORD *)(v0 + 352) = v28;
    type metadata accessor for LazyCanvasFetcher.LazyCanvasFetcherError(0, v0 + 192);
    swift_getWitnessTable();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(void))(v0 + 8);
    return v13();
  }
  else
  {
    uint64_t v15 = *(void *)(v0 + 760);
    uint64_t v16 = *(void **)(v0 + 736);
    uint64_t v17 = *(void *)(v0 + 536);
    *(void *)(v17 + 144) = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v0 + 768) = *(void *)(v17 + 136);
    *uint64_t v16 = v15;
    swift_storeEnumTagMultiPayload();
    sub_24EC77C60();
    swift_getWitnessTable();
    uint64_t v19 = sub_24EC77F30();
    return MEMORY[0x270FA2498](sub_24EC55A08, v19, v18);
  }
}

uint64_t sub_24EC55A08()
{
  uint64_t v1 = v0[92];
  uint64_t v2 = v0[91];
  uint64_t v3 = v0[90];
  sub_24EC77C40();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24EC55AA4(uint64_t a1)
{
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 112);
  uint64_t v4 = *(void *)(*(void *)v1 + 136);
  uint64_t v5 = *(void *)(*(void *)v1 + 208);
  uint64_t v6 = *(void *)(*(void *)v1 + 232);
  long long v7 = *(_OWORD *)(*(void *)v1 + 96);
  long long v8 = *(_OWORD *)(*(void *)v1 + 120);
  long long v9 = *(_OWORD *)(*(void *)v1 + 144);
  long long v10 = *(_OWORD *)(*(void *)v1 + 160);
  long long v11 = *(_OWORD *)(*(void *)v1 + 176);
  long long v12 = *(_OWORD *)(*(void *)v1 + 192);
  long long v13 = *(_OWORD *)(*(void *)v1 + 216);
  long long v14 = *(_OWORD *)(*(void *)v1 + 240);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(*(void *)v1 + 80);
  *(_OWORD *)(v2 + 32) = v7;
  *(void *)(v2 + 48) = v3;
  *(void *)(v2 + 56) = v4;
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = v9;
  *(_OWORD *)(v2 + 96) = v10;
  *(_OWORD *)(v2 + 112) = v11;
  *(_OWORD *)(v2 + 128) = v12;
  *(void *)(v2 + 144) = v5;
  *(void *)(v2 + 152) = v6;
  *(_OWORD *)(v2 + 160) = v13;
  *(_OWORD *)(v2 + 176) = v14;
  uint64_t v15 = type metadata accessor for CanvasAction(0, v2 + 16);
  *(void *)(v2 + 208) = v15;
  *(void *)(v2 + 216) = *(void *)(v15 - 8);
  *(void *)(v2 + 224) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC55C1C, v1, 0);
}

uint64_t sub_24EC55C1C()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F3DE18] + MEMORY[0x263F3DE18]);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 232) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24EC55CCC;
  uint64_t v2 = *(void *)(v0 + 192);
  return v4(v2);
}

uint64_t sub_24EC55CCC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    uint64_t v6 = *(void *)(v2 + 200);
    return MEMORY[0x270FA2498](sub_24EC55E18, v6, 0);
  }
}

uint64_t sub_24EC55E18()
{
  *(void *)(v0 + 240) = *(void *)(*(void *)(v0 + 200) + 136);
  swift_storeEnumTagMultiPayload();
  sub_24EC77C60();
  swift_getWitnessTable();
  uint64_t v2 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC55ED4, v2, v1);
}

uint64_t sub_24EC55ED4()
{
  uint64_t v2 = v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = v0[26];
  sub_24EC77C40();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t LazyCanvasFetcher.deinit()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t LazyCanvasFetcher.__deallocating_deinit()
{
  LazyCanvasFetcher.deinit();
  return MEMORY[0x270FA2418](v0);
}

uint64_t LazyCanvasFetcher.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_24EC55FE4()
{
  return LazyCanvasFetcher.unownedExecutor.getter();
}

uint64_t LazyCanvasFetcher.fetchSectionDescriptors(for:)(uint64_t a1)
{
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = v1;
  return MEMORY[0x270FA2498](sub_24EC56020, v1, 0);
}

uint64_t sub_24EC56020()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))(*(void *)(v0[4] + 112) + **(int **)(v0[4] + 112));
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24EC560F4;
  uint64_t v2 = v0[3];
  return v4(v2);
}

uint64_t sub_24EC560F4(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[6] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[4];
  if (v1)
  {
    uint64_t v6 = sub_24EC56610;
  }
  else
  {
    v4[7] = a1;
    uint64_t v6 = sub_24EC56230;
  }
  return MEMORY[0x270FA2498](v6, v5, 0);
}

uint64_t sub_24EC56230()
{
  uint64_t v4 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F3DE08] + MEMORY[0x263F3DE08]);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24EC562E0;
  uint64_t v2 = *(void *)(v0 + 56);
  return v4(v2);
}

uint64_t sub_24EC562E0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 72) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_24EC5647C;
  uint64_t v4 = *(void **)(v1 + 32);
  v3[23] = v4;
  v3[24] = *v4;
  return MEMORY[0x270FA2498](sub_24EC53B9C, v4, 0);
}

uint64_t sub_24EC5647C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32);
  *(void *)(*(void *)v1 + 80) = a1;
  swift_task_dealloc();
  return MEMORY[0x270FA2498](sub_24EC56594, v2, 0);
}

uint64_t sub_24EC56594()
{
  *(void *)(v0[4] + 144) = v0[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[10];
  return v1(v2);
}

uint64_t sub_24EC56610()
{
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[6];
  uint64_t v2 = sub_24EC77C90();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B1DB4E0);
  MEMORY[0x25334BC10](v1);
  MEMORY[0x25334BC10](v1);
  uint64_t v3 = sub_24EC77C70();
  os_log_type_t v4 = sub_24EC78060();
  BOOL v5 = os_log_type_enabled(v3, v4);
  uint64_t v6 = v0[6];
  if (v5)
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    MEMORY[0x25334BC10](v6);
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[2] = v9;
    sub_24EC78090();
    *uint64_t v8 = v9;
    MEMORY[0x25334BC00](v6);
    MEMORY[0x25334BC00](v6);
    _os_log_impl(&dword_24EC46000, v3, v4, "Failed to fetch section descriptor: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269961F60);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v8, -1, -1);
    MEMORY[0x25334BDC0](v7, -1, -1);
  }
  else
  {
    MEMORY[0x25334BC00](v0[6]);
    MEMORY[0x25334BC00](v6);
  }

  swift_willThrow();
  long long v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t LazyCanvasFetcher.onItemAppeared(at:)(uint64_t a1)
{
  uint64_t v3 = (void *)*v1;
  os_log_type_t v4 = (_OWORD *)*v1;
  uint64_t v5 = sub_24EC779D0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D40);
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_24EC77F90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  unint64_t v12 = (*(unsigned __int8 *)(v6 + 80) + 216) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  *(void *)(v13 + 32) = v3[10];
  *(void *)(v13 + 40) = v3[11];
  *(_OWORD *)(v13 + 48) = v4[6];
  *(void *)(v13 + 64) = v3[14];
  *(_OWORD *)(v13 + 72) = *(_OWORD *)((char *)v4 + 120);
  *(void *)(v13 + 88) = v3[17];
  *(void *)(v13 + 96) = v3[18];
  *(void *)(v13 + 104) = v3[19];
  *(_OWORD *)(v13 + 112) = v4[10];
  *(void *)(v13 + 128) = v3[22];
  *(_OWORD *)(v13 + 136) = *(_OWORD *)((char *)v4 + 184);
  *(void *)(v13 + 152) = v3[25];
  *(_OWORD *)(v13 + 160) = v4[13];
  *(_OWORD *)(v13 + 176) = v4[14];
  *(void *)(v13 + 192) = v3[30];
  *(void *)(v13 + 200) = v3[31];
  *(void *)(v13 + 208) = v1;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v13 + v12, (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_retain();
  sub_24EC56CBC((uint64_t)v10, (uint64_t)&unk_269961F78, v13);
  return swift_release();
}

uint64_t sub_24EC56B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_24EC56BC8;
  return sub_24EC55074(a5);
}

uint64_t sub_24EC56BC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EC56CBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24EC77F90();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_24EC77F80();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_24EC57EA4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24EC77F30();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t LazyCanvasFetcher.makeFetcherStream()(uint64_t a1)
{
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 112);
  uint64_t v4 = *(void *)(*(void *)v1 + 136);
  uint64_t v5 = *(void *)(*(void *)v1 + 208);
  uint64_t v6 = *(void *)(*(void *)v1 + 232);
  long long v7 = *(_OWORD *)(*(void *)v1 + 96);
  long long v8 = *(_OWORD *)(*(void *)v1 + 120);
  long long v9 = *(_OWORD *)(*(void *)v1 + 144);
  long long v10 = *(_OWORD *)(*(void *)v1 + 160);
  long long v11 = *(_OWORD *)(*(void *)v1 + 176);
  long long v12 = *(_OWORD *)(*(void *)v1 + 192);
  long long v13 = *(_OWORD *)(*(void *)v1 + 216);
  long long v14 = *(_OWORD *)(*(void *)v1 + 240);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(*(void *)v1 + 80);
  *(_OWORD *)(v2 + 32) = v7;
  *(void *)(v2 + 48) = v3;
  *(void *)(v2 + 56) = v4;
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = v9;
  *(_OWORD *)(v2 + 96) = v10;
  *(_OWORD *)(v2 + 112) = v11;
  *(_OWORD *)(v2 + 128) = v12;
  *(void *)(v2 + 144) = v5;
  *(void *)(v2 + 152) = v6;
  *(_OWORD *)(v2 + 160) = v13;
  *(_OWORD *)(v2 + 176) = v14;
  *(void *)(v2 + 208) = type metadata accessor for CanvasAction(255, v2 + 16);
  uint64_t v15 = sub_24EC77FA0();
  *(void *)(v2 + 216) = v15;
  *(void *)(v2 + 224) = *(void *)(v15 - 8);
  *(void *)(v2 + 232) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC56FC8, v1, 0);
}

uint64_t sub_24EC56FC8()
{
  uint64_t v1 = v0[29];
  uint64_t v2 = (uint64_t *)v0[24];
  v0[30] = *(void *)(v0[25] + 136);
  swift_checkMetadataState();
  uint64_t v3 = *MEMORY[0x263F8F580];
  uint64_t v4 = sub_24EC77FA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 104))(v1, v3, v4);
  v2[3] = sub_24EC77FB0();
  v2[4] = swift_getWitnessTable();
  v0[31] = __swift_allocate_boxed_opaque_existential_1(v2);
  sub_24EC77C60();
  swift_getWitnessTable();
  uint64_t v6 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC57120, v6, v5);
}

uint64_t sub_24EC57120()
{
  uint64_t v2 = v0[28];
  uint64_t v1 = v0[29];
  uint64_t v3 = v0[27];
  sub_24EC77C30();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t LazyCanvasFetcher.invalidateItems(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D40);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24EC77F90();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  long long v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  int v10 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v10 == 1)
  {
    sub_24EC57EA4((uint64_t)v6);
  }
  else
  {
    sub_24EC77F80();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
    if (v9[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = sub_24EC77F30();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      if (v13 | v11)
      {
        v15[0] = 0;
        v15[1] = 0;
        v15[2] = v11;
        v15[3] = v13;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24EC573E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_24EC58650;
  return sub_24EC55AA4(a5);
}

uint64_t sub_24EC57480(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EC57530;
  v5[3] = a1;
  v5[4] = v4;
  return MEMORY[0x270FA2498](sub_24EC56020, v4, 0);
}

uint64_t sub_24EC57530(uint64_t a1)
{
  uint64_t v7 = *v2;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v7 + 8);
  if (!v1) {
    uint64_t v4 = a1;
  }
  return v5(v4);
}

uint64_t sub_24EC57630(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24EC56BC8;
  return LazyCanvasFetcher.makeFetcherStream()(a1);
}

uint64_t sub_24EC576CC(uint64_t a1)
{
  return LazyCanvasFetcher.onItemAppeared(at:)(a1);
}

uint64_t sub_24EC576F0(uint64_t a1)
{
  return LazyCanvasFetcher.invalidateItems(_:)(a1);
}

void *sub_24EC57714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = (void *)*v3;
  swift_defaultActor_initialize();
  uint64_t v7 = v5[11];
  uint64_t v22 = v5[12];
  uint64_t v21 = v5[13];
  uint64_t v20 = v5[14];
  uint64_t v8 = v5[17];
  uint64_t v18 = v5[15];
  uint64_t v17 = v5[16];
  uint64_t v9 = v5[18];
  uint64_t v10 = v5[19];
  uint64_t v19 = v5[20];
  uint64_t v16 = v5[21];
  uint64_t v31 = v5[22];
  uint64_t v30 = v5[23];
  uint64_t v29 = v5[24];
  uint64_t v11 = v5[25];
  uint64_t v28 = v5[26];
  uint64_t v23 = v5[29];
  uint64_t v27 = v5[27];
  uint64_t v26 = v5[28];
  uint64_t v12 = v5[30];
  uint64_t v25 = v5[31];
  uint64_t v33 = v5[10];
  uint64_t v6 = v33;
  uint64_t v34 = v7;
  uint64_t v35 = v22;
  uint64_t v36 = v21;
  uint64_t v37 = v20;
  uint64_t v38 = v8;
  uint64_t v39 = v18;
  uint64_t v40 = v17;
  uint64_t v41 = v9;
  uint64_t v42 = v10;
  uint64_t v43 = v19;
  uint64_t v44 = v16;
  uint64_t v45 = v31;
  uint64_t v46 = v30;
  uint64_t v47 = v29;
  uint64_t v48 = v11;
  uint64_t v49 = v28;
  uint64_t v50 = v23;
  uint64_t v51 = v27;
  uint64_t v52 = v26;
  uint64_t v53 = v12;
  uint64_t v54 = v25;
  type metadata accessor for CanvasAction(255, (uint64_t)&v33);
  sub_24EC77C60();
  v4[17] = sub_24EC77C50();
  uint64_t v33 = v6;
  uint64_t v34 = v7;
  uint64_t v35 = v22;
  uint64_t v36 = v21;
  uint64_t v37 = v20;
  uint64_t v38 = v18;
  uint64_t v39 = v17;
  uint64_t v40 = v8;
  uint64_t v41 = v10;
  uint64_t v42 = v19;
  uint64_t v43 = v16;
  uint64_t v44 = v31;
  uint64_t v45 = v30;
  uint64_t v46 = v29;
  uint64_t v47 = v11;
  uint64_t v48 = v28;
  uint64_t v49 = v27;
  uint64_t v50 = v26;
  uint64_t v51 = v23;
  uint64_t v52 = v25;
  sub_24EC77B60();
  v4[18] = sub_24EC77ED0();
  v4[14] = a2;
  v4[15] = a3;
  uint64_t v33 = v6;
  uint64_t v34 = v7;
  uint64_t v35 = v22;
  uint64_t v36 = v21;
  uint64_t v37 = v20;
  uint64_t v38 = v18;
  uint64_t v39 = v17;
  uint64_t v40 = v8;
  uint64_t v41 = v10;
  uint64_t v42 = v19;
  uint64_t v43 = v16;
  uint64_t v44 = v31;
  uint64_t v45 = v30;
  uint64_t v46 = v29;
  uint64_t v47 = v11;
  uint64_t v48 = v28;
  uint64_t v49 = v27;
  uint64_t v50 = v26;
  uint64_t v51 = v23;
  uint64_t v52 = v25;
  sub_24EC77A90();
  swift_getWitnessTable();
  sub_24EC77AB0();
  uint64_t v13 = sub_24EC77BA0();
  swift_retain();
  uint64_t v14 = sub_24EC77B90();
  uint64_t v36 = v13;
  uint64_t v37 = MEMORY[0x263F3DF40];
  uint64_t v33 = v14;
  v4[16] = sub_24EC77AA0();
  return v4;
}

uint64_t sub_24EC57B20()
{
  uint64_t v1 = sub_24EC779D0();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 216) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_24EC57BF4()
{
  uint64_t v2 = *(void *)(sub_24EC779D0() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 216) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_24EC56BC8;
  uint64_t v5 = (void *)swift_task_alloc();
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_24EC56BC8;
  return sub_24EC55074(v3);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24EC57D78()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24EC57DC0()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24EC58650;
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_24EC58650;
  return sub_24EC55AA4(v2);
}

uint64_t sub_24EC57EA4(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24EC57F04()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC57F20(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 160);
}

uint64_t sub_24EC57F28(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 168);
}

uint64_t sub_24EC57F30(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 176);
}

uint64_t sub_24EC57F38(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 184);
}

uint64_t sub_24EC57F40(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 192);
}

uint64_t sub_24EC57F48(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 200);
}

uint64_t sub_24EC57F50(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 208);
}

uint64_t sub_24EC57F58(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 224);
}

uint64_t sub_24EC57F60(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 232);
}

uint64_t sub_24EC57F68(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 216);
}

uint64_t sub_24EC57F70(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 240);
}

uint64_t sub_24EC57F78(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 248);
}

uint64_t sub_24EC57F84()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LazyCanvasFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for LazyCanvasFetcher);
}

uint64_t method lookup function for LazyCanvasFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LazyCanvasFetcher);
}

uint64_t dispatch thunk of LazyCanvasFetcher.__allocating_init(batchSize:fetchLazySectionDescriptors:fetchItemForPlaceholders:)()
{
  return (*(uint64_t (**)(void))(v0 + 320))();
}

unsigned char *sub_24EC58038(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EC580D4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t type metadata accessor for LazyCanvasFetcher.LazyCanvasFetcherError(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for LazyCanvasFetcher.LazyCanvasFetcherError);
}

uint64_t sub_24EC58114@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  return sub_24EC53F44(a1, a2, a3, v4[2], v4[3], v4[4], v4[5], v4[6], a4, v4[7], v4[8], v4[9], v4[10], v4[11], v4[12], v4[13], v4[14], v4[15], v4[16],
           v4[17],
           v4[18],
           v4[19],
           v4[20],
           v4[21],
           v4[22],
           v4[23]);
}

uint64_t sub_24EC58178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24EC54124(a1, v2[24], v2[25], v2[2], v2[3], v2[4], v2[5], v2[6], a2, v2[7], v2[8], v2[9], v2[10], v2[11], v2[12], v2[13], v2[14], v2[15], v2[16],
           v2[17],
           v2[18],
           v2[19],
           v2[20],
           v2[21],
           v2[22],
           v2[23]);
}

uint64_t sub_24EC581E4()
{
  return sub_24EC77A10();
}

uint64_t sub_24EC58288(uint64_t a1)
{
  return sub_24EC54CC0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72), *(void *)(v1 + 80), *(_OWORD *)(v1 + 88), *(_OWORD *)(v1 + 104), *(_OWORD *)(v1 + 120), *(_OWORD *)(v1 + 136), *(void *)(v1 + 152), *(void *)(v1 + 160), *(void *)(v1 + 168), *(void *)(v1 + 176), *(void *)(v1 + 184)) & 1;
}

uint64_t sub_24EC582F0(uint64_t a1)
{
  uint64_t v2 = sub_24EC77B80();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269961FC0);
    uint64_t v9 = sub_24EC780D0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    uint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_24EC58608(&qword_269961FC8, MEMORY[0x263F3DF28]);
      uint64_t v16 = sub_24EC77E70();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_24EC58608(qword_269961FD0, MEMORY[0x263F3DF28]);
          char v23 = sub_24EC77E90();
          long long v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_24EC58608(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EC58654()
{
  uint64_t v0 = sub_24EC77C90();
  __swift_allocate_value_buffer(v0, qword_26B1DB4E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B1DB4E0);
  return sub_24EC77C80();
}

uint64_t static CanvasLoadState.== infix(_:_:)(uint64_t a1, char a2, uint64_t a3, char a4)
{
  if (a2)
  {
    if (a2 != 1)
    {
      if (a1)
      {
        if (a4 != 2 || a3 != 1) {
          goto LABEL_6;
        }
      }
      else if (a4 != 2 || a3)
      {
        goto LABEL_6;
      }
      char v4 = 1;
      return v4 & 1;
    }
    if (a4 == 1) {
      goto LABEL_11;
    }
  }
  else if (!a4)
  {
LABEL_11:
    sub_24EC77B60();
    swift_getWitnessTable();
    char v4 = sub_24EC77F20();
    return v4 & 1;
  }
LABEL_6:
  char v4 = 0;
  return v4 & 1;
}

uint64_t sub_24EC587F4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696863746566 && a2 == 0xE800000000000000 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64656863746566 && a2 == 0xE700000000000000 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6968736572666572 && a2 == 0xEA0000000000676ELL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24EC78290();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_24EC589AC(char a1)
{
  uint64_t result = 1701602409;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x676E696863746566;
      break;
    case 2:
      uint64_t result = 0x64656863746566;
      break;
    case 3:
      uint64_t result = 0x6968736572666572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EC58A3C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x7470697263736564 && a2 == 0xEB0000000073726FLL)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24EC78290();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

BOOL sub_24EC58ADC(char *a1, char *a2)
{
  return sub_24EC49270(*a1, *a2);
}

uint64_t sub_24EC58B38()
{
  return sub_24EC495B0();
}

uint64_t sub_24EC58B98()
{
  return sub_24EC49280();
}

uint64_t sub_24EC58BE8()
{
  return sub_24EC78300();
}

uint64_t sub_24EC58C58()
{
  return sub_24EC589AC(*v0);
}

uint64_t sub_24EC58CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC587F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24EC58D18@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_24EC5BA88();
  *a1 = result;
  return result;
}

uint64_t sub_24EC58D7C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC58DD0(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC58E24()
{
  return 0x7470697263736564;
}

uint64_t sub_24EC58E48@<X0>(void *a1@<X1>, unsigned char *a2@<X8>)
{
  return sub_24EC59174(a1, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC5BA94, a2);
}

uint64_t sub_24EC58E60(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC58EB4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC58F08@<X0>(void *a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_24EC58FE0(a1, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC5BA94, a2);
}

uint64_t sub_24EC58F20(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC58F74(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC58FC8@<X0>(void *a1@<X2>, unsigned char *a2@<X8>)
{
  return sub_24EC58FE0(a1, (uint64_t (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_24EC4C9CC, a2);
}

uint64_t sub_24EC58FE0@<X0>(void *a1@<X2>, uint64_t (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void)@<X4>, unsigned char *a3@<X8>)
{
  char v4 = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
         a1[21]);
  uint64_t result = swift_bridgeObjectRelease();
  *a3 = v4 & 1;
  return result;
}

uint64_t sub_24EC59068(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC590BC(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t sub_24EC59110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC58A3C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EC59174@<X0>(void *a1@<X1>, uint64_t (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void)@<X3>, unsigned char *a3@<X8>)
{
  uint64_t result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18], a1[19], a1[20],
             a1[21]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_24EC591E4(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_24EC59238(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t CanvasLoadState.encode(to:)(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v116 = a7;
  uint64_t v115 = a6;
  uint64_t v114 = a5;
  LODWORD(v98) = a3;
  uint64_t v96 = a2;
  uint64_t v97 = a1;
  uint64_t v112 = a23;
  uint64_t v103 = a22;
  uint64_t v109 = a18;
  uint64_t v105 = a17;
  uint64_t v102 = a16;
  uint64_t v118 = a15;
  uint64_t v110 = a12;
  uint64_t v107 = a10;
  uint64_t v108 = a9;
  uint64_t v121 = a4;
  uint64_t v122 = a5;
  uint64_t v113 = a4;
  uint64_t v123 = a6;
  uint64_t v124 = a7;
  uint64_t v125 = a8;
  uint64_t v126 = a9;
  uint64_t v117 = a8;
  uint64_t v127 = a10;
  uint64_t v128 = a11;
  uint64_t v106 = a11;
  uint64_t v129 = a12;
  uint64_t v130 = a13;
  uint64_t v111 = a13;
  uint64_t v131 = a14;
  uint64_t v132 = a15;
  uint64_t v99 = a14;
  uint64_t v133 = a16;
  uint64_t v134 = a17;
  uint64_t v135 = a18;
  uint64_t v136 = a19;
  uint64_t v100 = a19;
  uint64_t v137 = a20;
  uint64_t v138 = a21;
  uint64_t v104 = a20;
  uint64_t v101 = a21;
  uint64_t v139 = a22;
  uint64_t v140 = a23;
  uint64_t v91 = type metadata accessor for CanvasLoadState.RefreshingCodingKeys(255, (uint64_t)&v121);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v95 = sub_24EC78270();
  uint64_t v94 = *(void *)(v95 - 8);
  MEMORY[0x270FA5388](v95);
  uint64_t v93 = (char *)&v75 - v25;
  uint64_t v121 = a4;
  uint64_t v26 = v114;
  uint64_t v122 = v114;
  uint64_t v123 = v115;
  uint64_t v124 = v116;
  uint64_t v125 = a8;
  uint64_t v126 = a9;
  uint64_t v127 = a10;
  uint64_t v128 = a11;
  uint64_t v129 = a12;
  uint64_t v130 = a13;
  uint64_t v131 = a14;
  uint64_t v132 = a15;
  uint64_t v133 = a16;
  uint64_t v134 = a17;
  uint64_t v135 = a18;
  uint64_t v136 = a19;
  uint64_t v137 = a20;
  uint64_t v138 = a21;
  uint64_t v139 = a22;
  uint64_t v140 = a23;
  uint64_t v27 = type metadata accessor for CanvasLoadState.FetchedCodingKeys(255, (uint64_t)&v121);
  uint64_t v28 = swift_getWitnessTable();
  uint64_t v88 = v27;
  uint64_t v87 = v28;
  uint64_t v92 = sub_24EC78270();
  uint64_t v86 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388](v92);
  uint64_t v89 = (char *)&v75 - v29;
  uint64_t v121 = v113;
  uint64_t v122 = v26;
  uint64_t v30 = v115;
  uint64_t v31 = v116;
  uint64_t v123 = v115;
  uint64_t v124 = v116;
  uint64_t v32 = v108;
  uint64_t v125 = v117;
  uint64_t v126 = v108;
  uint64_t v33 = v107;
  uint64_t v127 = v107;
  uint64_t v128 = v106;
  uint64_t v129 = v110;
  uint64_t v130 = v111;
  uint64_t v131 = v99;
  uint64_t v132 = v118;
  uint64_t v133 = a16;
  uint64_t v134 = a17;
  uint64_t v34 = v109;
  uint64_t v35 = v100;
  uint64_t v135 = v109;
  uint64_t v136 = v100;
  uint64_t v137 = v104;
  uint64_t v138 = v101;
  uint64_t v139 = a22;
  uint64_t v140 = a23;
  uint64_t v36 = type metadata accessor for CanvasLoadState.FetchingCodingKeys(255, (uint64_t)&v121);
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v85 = v36;
  uint64_t v83 = v37;
  uint64_t v84 = sub_24EC78270();
  uint64_t v82 = *(void *)(v84 - 8);
  MEMORY[0x270FA5388](v84);
  uint64_t v81 = (char *)&v75 - v38;
  uint64_t v121 = v113;
  uint64_t v122 = v114;
  uint64_t v123 = v30;
  uint64_t v124 = v31;
  uint64_t v125 = v117;
  uint64_t v126 = v32;
  uint64_t v39 = v106;
  uint64_t v127 = v33;
  uint64_t v128 = v106;
  uint64_t v40 = v110;
  uint64_t v129 = v110;
  uint64_t v130 = v111;
  uint64_t v41 = v99;
  uint64_t v131 = v99;
  uint64_t v132 = v118;
  uint64_t v42 = v102;
  uint64_t v43 = v105;
  uint64_t v133 = v102;
  uint64_t v134 = v105;
  uint64_t v135 = v34;
  uint64_t v136 = v35;
  uint64_t v44 = v104;
  uint64_t v45 = v101;
  uint64_t v137 = v104;
  uint64_t v138 = v101;
  uint64_t v46 = v103;
  uint64_t v139 = v103;
  uint64_t v140 = v112;
  uint64_t v47 = type metadata accessor for CanvasLoadState.IdleCodingKeys(255, (uint64_t)&v121);
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v80 = v47;
  uint64_t v78 = v48;
  uint64_t v79 = sub_24EC78270();
  uint64_t v77 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v76 = (char *)&v75 - v49;
  uint64_t v121 = v113;
  uint64_t v122 = v114;
  uint64_t v123 = v115;
  uint64_t v124 = v116;
  uint64_t v125 = v117;
  uint64_t v126 = v108;
  uint64_t v127 = v107;
  uint64_t v128 = v39;
  uint64_t v129 = v40;
  uint64_t v130 = v111;
  uint64_t v131 = v41;
  uint64_t v132 = v118;
  uint64_t v133 = v42;
  uint64_t v134 = v43;
  uint64_t v135 = v109;
  uint64_t v136 = v100;
  uint64_t v137 = v44;
  uint64_t v138 = v45;
  uint64_t v139 = v46;
  uint64_t v140 = v112;
  type metadata accessor for CanvasLoadState.CodingKeys(255, (uint64_t)&v121);
  swift_getWitnessTable();
  uint64_t v50 = sub_24EC78270();
  uint64_t v51 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v53 = (char *)&v75 - v52;
  __swift_project_boxed_opaque_existential_1(v97, v97[3]);
  sub_24EC78320();
  int v54 = v98;
  if ((_BYTE)v98)
  {
    uint64_t v98 = v51;
    uint64_t v55 = v53;
    uint64_t v56 = (void *)v50;
    uint64_t v57 = v106;
    uint64_t v58 = v113;
    uint64_t v59 = v114;
    uint64_t v60 = v115;
    uint64_t v61 = v116;
    uint64_t v62 = v96;
    uint64_t v63 = v117;
    if (v54 == 1)
    {
      LOBYTE(v121) = 3;
      uint64_t v64 = v93;
      uint64_t v97 = v56;
      uint64_t v92 = (uint64_t)v55;
      sub_24EC78220();
      uint64_t v141 = v62;
      uint64_t v121 = v58;
      uint64_t v122 = v59;
      uint64_t v123 = v60;
      uint64_t v124 = v61;
      uint64_t v125 = v63;
      uint64_t v126 = v107;
      uint64_t v127 = v57;
      uint64_t v128 = v108;
      uint64_t v129 = v110;
      uint64_t v130 = v111;
      uint64_t v131 = v99;
      uint64_t v132 = v118;
      uint64_t v133 = v102;
      uint64_t v134 = v105;
      uint64_t v135 = v109;
      uint64_t v136 = v100;
      uint64_t v137 = v101;
      uint64_t v138 = v103;
      uint64_t v139 = v104;
      uint64_t v140 = v112;
      sub_24EC77B60();
      sub_24EC77F00();
      uint64_t v120 = swift_getWitnessTable();
      swift_getWitnessTable();
      uint64_t v65 = v95;
      sub_24EC78260();
      (*(void (**)(char *, uint64_t))(v94 + 8))(v64, v65);
      return (*(uint64_t (**)(uint64_t, void *))(v98 + 8))(v92, v97);
    }
    else
    {
      uint64_t v71 = (uint64_t (**)(char *, void *))(v98 + 8);
      uint64_t v72 = v56;
      if (v96)
      {
        LOBYTE(v121) = 1;
        uint64_t v73 = v81;
        sub_24EC78220();
        (*(void (**)(char *, uint64_t))(v82 + 8))(v73, v84);
      }
      else
      {
        LOBYTE(v121) = 0;
        uint64_t v74 = v76;
        sub_24EC78220();
        (*(void (**)(char *, uint64_t))(v77 + 8))(v74, v79);
      }
      return (*v71)(v55, v72);
    }
  }
  else
  {
    uint64_t v67 = v51;
    uint64_t v68 = v86;
    LOBYTE(v121) = 2;
    uint64_t v69 = v89;
    sub_24EC78220();
    uint64_t v141 = v96;
    uint64_t v121 = v113;
    uint64_t v122 = v114;
    uint64_t v123 = v115;
    uint64_t v124 = v116;
    uint64_t v125 = v117;
    uint64_t v126 = v107;
    uint64_t v127 = v106;
    uint64_t v128 = v108;
    uint64_t v129 = v110;
    uint64_t v130 = v111;
    uint64_t v131 = v99;
    uint64_t v132 = v118;
    uint64_t v133 = v102;
    uint64_t v134 = v105;
    uint64_t v135 = v109;
    uint64_t v136 = v100;
    uint64_t v137 = v101;
    uint64_t v138 = v103;
    uint64_t v139 = v104;
    uint64_t v140 = v112;
    sub_24EC77B60();
    sub_24EC77F00();
    uint64_t v119 = swift_getWitnessTable();
    swift_getWitnessTable();
    uint64_t v70 = v92;
    sub_24EC78260();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v70);
    return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v53, v50);
  }
}

uint64_t CanvasLoadState.init(from:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v109 = a6;
  *(void *)&long long v108 = a4;
  uint64_t v97 = a1;
  uint64_t v114 = a21;
  uint64_t v105 = a20;
  uint64_t v116 = a19;
  uint64_t v115 = a18;
  uint64_t v106 = a17;
  uint64_t v103 = a15;
  uint64_t v113 = a14;
  uint64_t v111 = a13;
  uint64_t v110 = a12;
  uint64_t v100 = a10;
  *(void *)&long long v121 = a2;
  *((void *)&v121 + 1) = a3;
  uint64_t v107 = a2;
  uint64_t v98 = a3;
  *(void *)&long long v122 = a4;
  *((void *)&v122 + 1) = a5;
  *((void *)&v108 + 1) = a5;
  uint64_t v123 = a6;
  uint64_t v124 = a7;
  uint64_t v112 = a7;
  uint64_t v125 = a8;
  uint64_t v126 = a9;
  uint64_t v102 = a8;
  uint64_t v99 = a9;
  uint64_t v127 = a10;
  uint64_t v128 = a11;
  uint64_t v101 = a11;
  uint64_t v129 = a12;
  uint64_t v130 = a13;
  uint64_t v131 = a14;
  uint64_t v132 = a15;
  uint64_t v133 = a16;
  uint64_t v134 = a17;
  uint64_t v104 = a16;
  uint64_t v135 = a18;
  uint64_t v136 = a19;
  uint64_t v137 = a20;
  uint64_t v138 = a21;
  uint64_t v95 = type metadata accessor for CanvasLoadState.RefreshingCodingKeys(255, (uint64_t)&v121);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v83 = sub_24EC78210();
  uint64_t v82 = *(void *)(v83 - 8);
  MEMORY[0x270FA5388](v83);
  uint64_t v87 = (char *)&v74 - v26;
  *(void *)&long long v121 = a2;
  *((void *)&v121 + 1) = a3;
  uint64_t v27 = v108;
  *(void *)&long long v122 = v108;
  *((void *)&v122 + 1) = a5;
  uint64_t v123 = v109;
  uint64_t v124 = a7;
  uint64_t v125 = a8;
  uint64_t v126 = a9;
  uint64_t v127 = a10;
  uint64_t v128 = a11;
  uint64_t v129 = a12;
  uint64_t v130 = a13;
  uint64_t v131 = a14;
  uint64_t v132 = a15;
  uint64_t v133 = a16;
  uint64_t v134 = a17;
  uint64_t v135 = a18;
  uint64_t v136 = a19;
  uint64_t v137 = a20;
  uint64_t v138 = a21;
  uint64_t v28 = type metadata accessor for CanvasLoadState.FetchedCodingKeys(255, (uint64_t)&v121);
  uint64_t v29 = swift_getWitnessTable();
  uint64_t v93 = v28;
  uint64_t v92 = v29;
  uint64_t v81 = sub_24EC78210();
  uint64_t v80 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v86 = (char *)&v74 - v30;
  uint64_t v31 = v98;
  *(void *)&long long v121 = v107;
  *((void *)&v121 + 1) = v98;
  *(void *)&long long v122 = v27;
  *((void *)&v122 + 1) = *((void *)&v108 + 1);
  uint64_t v32 = v109;
  uint64_t v123 = v109;
  uint64_t v124 = v112;
  uint64_t v125 = v102;
  uint64_t v126 = v99;
  uint64_t v127 = a10;
  uint64_t v128 = v101;
  uint64_t v129 = a12;
  uint64_t v33 = v111;
  uint64_t v34 = v113;
  uint64_t v130 = v111;
  uint64_t v131 = v113;
  uint64_t v132 = a15;
  uint64_t v133 = v104;
  uint64_t v134 = a17;
  uint64_t v35 = v115;
  uint64_t v135 = v115;
  uint64_t v136 = v116;
  uint64_t v137 = a20;
  uint64_t v138 = a21;
  uint64_t v36 = type metadata accessor for CanvasLoadState.FetchingCodingKeys(255, (uint64_t)&v121);
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v91 = v36;
  uint64_t v90 = v37;
  uint64_t v79 = sub_24EC78210();
  uint64_t v78 = *(void *)(v79 - 8);
  MEMORY[0x270FA5388](v79);
  uint64_t v85 = (char *)&v74 - v38;
  *(void *)&long long v121 = v107;
  *((void *)&v121 + 1) = v31;
  long long v122 = v108;
  uint64_t v123 = v32;
  uint64_t v124 = v112;
  uint64_t v39 = v102;
  uint64_t v40 = v99;
  uint64_t v125 = v102;
  uint64_t v126 = v99;
  uint64_t v41 = v100;
  uint64_t v42 = v101;
  uint64_t v127 = v100;
  uint64_t v128 = v101;
  uint64_t v129 = v110;
  uint64_t v130 = v33;
  uint64_t v43 = v103;
  uint64_t v131 = v34;
  uint64_t v132 = v103;
  uint64_t v44 = v104;
  uint64_t v45 = v106;
  uint64_t v133 = v104;
  uint64_t v134 = v106;
  uint64_t v135 = v35;
  uint64_t v136 = v116;
  uint64_t v46 = v105;
  uint64_t v137 = v105;
  uint64_t v138 = v114;
  uint64_t v47 = type metadata accessor for CanvasLoadState.IdleCodingKeys(255, (uint64_t)&v121);
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v89 = v47;
  uint64_t v88 = v48;
  uint64_t v77 = sub_24EC78210();
  uint64_t v76 = *(void *)(v77 - 8);
  MEMORY[0x270FA5388](v77);
  uint64_t v84 = (char *)&v74 - v49;
  *(void *)&long long v121 = v107;
  *((void *)&v121 + 1) = v98;
  long long v122 = v108;
  uint64_t v123 = v109;
  uint64_t v124 = v112;
  uint64_t v125 = v39;
  uint64_t v126 = v40;
  uint64_t v127 = v41;
  uint64_t v128 = v42;
  uint64_t v129 = v110;
  uint64_t v130 = v111;
  uint64_t v131 = v113;
  uint64_t v132 = v43;
  uint64_t v133 = v44;
  uint64_t v134 = v45;
  uint64_t v135 = v115;
  uint64_t v136 = v116;
  uint64_t v137 = v46;
  uint64_t v138 = v114;
  type metadata accessor for CanvasLoadState.CodingKeys(255, (uint64_t)&v121);
  swift_getWitnessTable();
  uint64_t v50 = sub_24EC78210();
  uint64_t v51 = *(void *)(v50 - 8);
  MEMORY[0x270FA5388](v50);
  uint64_t v53 = (uint64_t)&v74 - v52;
  __swift_project_boxed_opaque_existential_1(v97, v97[3]);
  uint64_t v54 = v96;
  sub_24EC78310();
  if (!v54)
  {
    uint64_t v55 = v106;
    uint64_t v56 = v115;
    uint64_t v75 = 0;
    uint64_t v96 = v51;
    uint64_t v57 = v53;
    *(void *)&long long v121 = sub_24EC78200();
    sub_24EC77F00();
    swift_getWitnessTable();
    *(void *)&long long v119 = sub_24EC780C0();
    *((void *)&v119 + 1) = v58;
    *(void *)&long long v120 = v59;
    *((void *)&v120 + 1) = v60;
    sub_24EC780B0();
    swift_getWitnessTable();
    sub_24EC78030();
    if (v121 == 4 || (long long v74 = v119, v121 = v119, v122 = v120, (sub_24EC78040() & 1) == 0))
    {
      uint64_t v64 = sub_24EC78100();
      uint64_t v53 = swift_allocError();
      uint64_t v66 = v65;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269961F40);
      *(void *)&long long v121 = v107;
      *((void *)&v121 + 1) = v98;
      long long v122 = v108;
      uint64_t v123 = v109;
      uint64_t v124 = v112;
      uint64_t v125 = v102;
      uint64_t v126 = v99;
      uint64_t v127 = v100;
      uint64_t v128 = v101;
      uint64_t v129 = v110;
      uint64_t v130 = v111;
      uint64_t v131 = v113;
      uint64_t v132 = v103;
      uint64_t v133 = v104;
      uint64_t v134 = v55;
      uint64_t v135 = v56;
      uint64_t v136 = v116;
      uint64_t v137 = v105;
      uint64_t v138 = v114;
      *uint64_t v66 = type metadata accessor for CanvasLoadState(0, (uint64_t)&v121);
      sub_24EC781B0();
      sub_24EC780F0();
      (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v64 - 8) + 104))(v66, *MEMORY[0x263F8DCB0], v64);
      swift_willThrow();
LABEL_8:
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v57, v50);
    }
    else
    {
      uint64_t v53 = v114;
      uint64_t v61 = v105;
      uint64_t v62 = v75;
      uint64_t v63 = v116;
      switch((int)v116)
      {
        case 1:
          LOBYTE(v121) = 1;
          uint64_t v53 = (uint64_t)v85;
          sub_24EC781A0();
          if (v62) {
            goto LABEL_8;
          }
          (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v53, v79);
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v57, v50);
          uint64_t v53 = 1;
          break;
        case 2:
          LOBYTE(v121) = 2;
          sub_24EC781A0();
          if (v62) {
            goto LABEL_8;
          }
          *(void *)&long long v121 = v107;
          *((void *)&v121 + 1) = v98;
          long long v122 = v108;
          uint64_t v123 = v109;
          uint64_t v124 = v102;
          uint64_t v125 = v99;
          uint64_t v126 = v112;
          uint64_t v127 = v100;
          uint64_t v128 = v101;
          uint64_t v129 = v110;
          uint64_t v130 = v111;
          uint64_t v131 = v113;
          uint64_t v132 = v103;
          uint64_t v133 = v104;
          uint64_t v134 = v55;
          uint64_t v135 = v63;
          uint64_t v136 = v61;
          uint64_t v137 = v56;
          uint64_t v138 = v53;
          sub_24EC77B60();
          sub_24EC77F00();
          uint64_t v117 = swift_getWitnessTable();
          swift_getWitnessTable();
          uint64_t v68 = v81;
          uint64_t v69 = v86;
          sub_24EC781F0();
          uint64_t v70 = v96;
          (*(void (**)(char *, uint64_t))(v80 + 8))(v69, v68);
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v57, v50);
          uint64_t v53 = v139;
          break;
        case 3:
          LOBYTE(v121) = 3;
          sub_24EC781A0();
          if (v62) {
            goto LABEL_8;
          }
          *(void *)&long long v121 = v107;
          *((void *)&v121 + 1) = v98;
          long long v122 = v108;
          uint64_t v123 = v109;
          uint64_t v124 = v102;
          uint64_t v125 = v99;
          uint64_t v126 = v112;
          uint64_t v127 = v100;
          uint64_t v128 = v101;
          uint64_t v129 = v110;
          uint64_t v130 = v111;
          uint64_t v131 = v113;
          uint64_t v132 = v103;
          uint64_t v133 = v104;
          uint64_t v134 = v55;
          uint64_t v135 = v63;
          uint64_t v136 = v61;
          uint64_t v137 = v56;
          uint64_t v138 = v53;
          sub_24EC77B60();
          sub_24EC77F00();
          uint64_t v118 = swift_getWitnessTable();
          swift_getWitnessTable();
          uint64_t v71 = v83;
          uint64_t v72 = v87;
          sub_24EC781F0();
          uint64_t v73 = v96;
          (*(void (**)(char *, uint64_t))(v82 + 8))(v72, v71);
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v57, v50);
          uint64_t v53 = v139;
          break;
        default:
          LOBYTE(v121) = 0;
          uint64_t v53 = (uint64_t)v84;
          sub_24EC781A0();
          if (v62) {
            goto LABEL_8;
          }
          (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v53, v77);
          swift_unknownObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v57, v50);
          uint64_t v53 = 0;
          break;
      }
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v97);
  return v53;
}

uint64_t sub_24EC5AF40@<X0>(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = CanvasLoadState.init(from:)(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9], a2[10], a2[11], a2[12], a2[13], a2[14], a2[15], a2[16], a2[17], a2[18], a2[19],
             a2[20],
             a2[21]);
  if (!v3)
  {
    *(void *)a3 = result;
    *(unsigned char *)(a3 + 8) = v6;
  }
  return result;
}

uint64_t sub_24EC5AFB8(void *a1, uint64_t *a2)
{
  return CanvasLoadState.encode(to:)(a1, *(void *)v2, *(unsigned __int8 *)(v2 + 8), a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9], a2[10], a2[11], a2[12], a2[13], a2[14], a2[15], a2[16], a2[17],
           a2[18],
           a2[19],
           a2[20],
           a2[21]);
}

uint64_t CanvasLoadState.hash(into:)(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 > 1u) {
    return sub_24EC782F0();
  }
  sub_24EC782F0();
  sub_24EC77B60();
  swift_getWitnessTable();
  return sub_24EC77F10();
}

uint64_t type metadata accessor for CanvasLoadState.RefreshingCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLoadState.RefreshingCodingKeys);
}

uint64_t type metadata accessor for CanvasLoadState.FetchedCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLoadState.FetchedCodingKeys);
}

uint64_t type metadata accessor for CanvasLoadState.FetchingCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLoadState.FetchingCodingKeys);
}

uint64_t type metadata accessor for CanvasLoadState.IdleCodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLoadState.IdleCodingKeys);
}

uint64_t type metadata accessor for CanvasLoadState.CodingKeys(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLoadState.CodingKeys);
}

uint64_t type metadata accessor for CanvasLoadState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLoadState);
}

uint64_t CanvasLoadState.hashValue.getter(uint64_t a1, unsigned __int8 a2)
{
  sub_24EC782E0();
  CanvasLoadState.hash(into:)((uint64_t)v5, a1, a2);
  return sub_24EC78300();
}

uint64_t sub_24EC5B338()
{
  return CanvasLoadState.hashValue.getter(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_24EC5B390(uint64_t a1)
{
  return CanvasLoadState.hash(into:)(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

uint64_t sub_24EC5B3FC()
{
  sub_24EC782E0();
  CanvasLoadState.hash(into:)((uint64_t)v2, *(void *)v0, *(unsigned char *)(v0 + 8));
  return sub_24EC78300();
}

uint64_t sub_24EC5B484(uint64_t a1, uint64_t a2)
{
  return static CanvasLoadState.== infix(_:_:)(*(void *)a1, *(unsigned char *)(a1 + 8), *(void *)a2, *(unsigned char *)(a2 + 8)) & 1;
}

uint64_t sub_24EC5B4F0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 160);
}

uint64_t sub_24EC5B514(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_24EC48E30(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_24EC5B55C(uint64_t a1)
{
  return sub_24EC48E8C(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t sub_24EC5B56C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_24EC48E30(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_24EC48E8C(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t sub_24EC5B5D4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_24EC48E8C(v4, v5);
  return a1;
}

uint64_t sub_24EC5B614(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
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

uint64_t sub_24EC5B65C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_24EC5B6A0(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_24EC5B6B8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

uint64_t sub_24EC5B6D0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *sub_24EC5B760(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x24EC5B82CLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_24EC5B858(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x24EC5B8F4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24EC5B91C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B938()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B954()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B970()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B98C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B9A8()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B9C4()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B9E0()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5B9FC()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5BA18()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5BA34()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5BA50()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5BA6C()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC5BA88()
{
  return 4;
}

uint64_t sub_24EC5BA94()
{
  return sub_24EC4C9CC();
}

uint64_t sub_24EC5BAD0(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 280);
  v3[0] = *(_OWORD *)(a1 + 128);
  v3[1] = v1;
  type metadata accessor for CanvasLayoutProviderSource(255, (uint64_t)v3);
  sub_24EC77DE0();
  return sub_24EC77DD0();
}

uint64_t sub_24EC5BB28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 152);
  uint64_t v5 = *(void *)(a1 + 168);
  uint64_t v6 = *(void *)(a1 + 200);
  uint64_t v7 = *(void *)(a1 + 256);
  v12[0] = *(void *)(a1 + 16);
  v12[1] = v1;
  v12[2] = v2;
  long long v13 = *(_OWORD *)(a1 + 88);
  uint64_t v14 = v3;
  long long v8 = *(_OWORD *)(a1 + 136);
  long long v15 = *(_OWORD *)(a1 + 120);
  long long v16 = v8;
  uint64_t v17 = v4;
  uint64_t v18 = v5;
  uint64_t v19 = v6;
  long long v9 = *(_OWORD *)(a1 + 240);
  long long v20 = *(_OWORD *)(a1 + 224);
  long long v21 = v9;
  uint64_t v22 = v7;
  long long v10 = *(_OWORD *)(a1 + 288);
  long long v23 = *(_OWORD *)(a1 + 272);
  long long v24 = v10;
  type metadata accessor for CanvasFeature(255, (uint64_t)v12);
  swift_getWitnessTable();
  sub_24EC77E60();
  swift_getWitnessTable();
  return sub_24EC77CB0();
}

uint64_t CanvasView.init(store:layoutProvider:artworkViewBuilder:artworkLeadingOverlayViewBuilder:artworkTrailingOverlayViewBuilder:contextMenuViewModifierBuilder:viewDescriptorBuilder:actionButtonViewBuilder:sectionHeaderSubtitleViewBuilder:scrollViewProxy:identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t v49 = (void *)swift_allocObject();
  v49[38] = a1;
  v49[2] = a14;
  v49[3] = a15;
  v49[4] = a16;
  v49[5] = a17;
  v49[6] = a18;
  v49[7] = a19;
  v49[8] = a20;
  v49[9] = a21;
  v49[10] = a22;
  v49[11] = a23;
  v49[12] = a24;
  v49[13] = a25;
  v49[14] = a26;
  v49[15] = a27;
  v49[16] = a28;
  v49[17] = a29;
  v49[18] = a30;
  v49[19] = a31;
  v49[20] = a32;
  v49[21] = a33;
  v49[22] = a34;
  v49[23] = a35;
  v49[24] = a36;
  v49[25] = a37;
  v49[26] = a38;
  v49[27] = a39;
  v49[28] = a40;
  v49[29] = a41;
  v49[30] = a42;
  v49[31] = a43;
  v49[32] = a44;
  v49[33] = a45;
  v49[34] = a46;
  v49[35] = a47;
  v49[36] = a48;
  v49[37] = a49;
  v49[39] = a2;
  swift_retain();
  uint64_t v83 = a14;
  uint64_t v84 = a16;
  uint64_t v85 = a20;
  uint64_t v86 = a23;
  uint64_t v87 = a24;
  uint64_t v88 = a25;
  uint64_t v89 = a27;
  uint64_t v90 = a28;
  uint64_t v91 = a29;
  uint64_t v92 = a30;
  uint64_t v93 = a31;
  uint64_t v94 = a33;
  uint64_t v95 = a37;
  uint64_t v96 = a40;
  uint64_t v97 = a41;
  uint64_t v98 = a42;
  uint64_t v99 = a43;
  uint64_t v100 = a44;
  uint64_t v101 = a46;
  uint64_t v102 = a47;
  uint64_t v103 = a48;
  uint64_t v104 = a49;
  type metadata accessor for CanvasFeature(255, (uint64_t)&v83);
  swift_getWitnessTable();
  sub_24EC77E60();
  swift_getWitnessTable();
  *(void *)(a9 + 48) = sub_24EC77CA0();
  *(void *)(a9 + 56) = v50;
  *(unsigned char *)(a9 + 64) = v51 & 1;
  uint64_t v83 = a28;
  uint64_t v84 = a29;
  uint64_t v85 = a47;
  uint64_t v86 = a48;
  uint64_t v52 = type metadata accessor for CanvasLayoutProviderSource(0, (uint64_t)&v83);
  uint64_t v53 = *(void *)(v52 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v53 + 16))(v119, a3, v52);
  uint64_t v83 = a28;
  uint64_t v84 = a29;
  uint64_t v85 = a47;
  uint64_t v86 = a48;
  uint64_t v54 = type metadata accessor for CanvasLayoutProviderSource(0, (uint64_t)&v83);
  uint64_t v55 = *(void *)(v54 - 8);
  (*(void (**)(uint64_t *, unsigned char *, uint64_t))(v55 + 16))(&v83, v119, v54);
  sub_24EC77DC0();
  (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v119, v54);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(a3, v52);
  uint64_t v92 = a23;
  uint64_t v93 = a24;
  uint64_t v96 = a27;
  uint64_t v100 = a31;
  uint64_t v102 = a33;
  uint64_t v106 = a37;
  uint64_t v109 = a40;
  uint64_t v110 = a41;
  uint64_t v111 = a42;
  uint64_t v112 = a43;
  uint64_t v113 = a44;
  uint64_t v115 = a46;
  uint64_t v118 = a49;
  uint64_t v91 = a22;
  uint64_t v95 = a26;
  uint64_t v99 = a30;
  uint64_t v101 = a32;
  uint64_t v105 = a36;
  uint64_t v117 = a48;
  uint64_t v83 = a14;
  uint64_t v84 = a15;
  uint64_t v85 = a16;
  uint64_t v86 = a17;
  uint64_t v87 = a18;
  uint64_t v88 = a19;
  uint64_t v89 = a20;
  uint64_t v90 = a21;
  uint64_t v94 = a25;
  uint64_t v97 = a28;
  uint64_t v98 = a29;
  uint64_t v103 = a34;
  uint64_t v104 = a35;
  uint64_t v107 = a38;
  uint64_t v108 = a39;
  uint64_t v114 = a45;
  uint64_t v116 = a47;
  uint64_t v56 = (int *)type metadata accessor for CanvasView(0, (uint64_t)&v83);
  uint64_t v57 = a9 + v56[79];
  uint64_t v58 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v58 - 8) + 32))(v57, a4, v58);
  uint64_t v59 = a9 + v56[80];
  uint64_t v60 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 32))(v59, a5, v60);
  uint64_t v61 = a9 + v56[81];
  uint64_t v62 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 32))(v61, a6, v62);
  uint64_t v63 = a9 + v56[82];
  uint64_t v64 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v64 - 8) + 32))(v63, a7, v64);
  uint64_t v65 = a9 + v56[83];
  sub_24EC779D0();
  uint64_t v83 = a28;
  uint64_t v84 = a29;
  uint64_t v85 = a47;
  uint64_t v86 = a48;
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v66 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v66 - 8) + 32))(v65, a8, v66);
  uint64_t v67 = a9 + v56[78];
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v68 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 32))(v67, a10, v68);
  uint64_t v69 = a9 + v56[84];
  uint64_t v70 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 32))(v69, a11, v70);
  sub_24EC5C5AC(a12, a9 + v56[85]);
  uint64_t v71 = a9 + v56[86];
  uint64_t v72 = sub_24EC779C0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 32))(v71, a13, v72);
}

uint64_t sub_24EC5C4D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24EC5C50C()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t type metadata accessor for CanvasLayoutProviderSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasLayoutProviderSource);
}

uint64_t type metadata accessor for CanvasView(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasView);
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

uint64_t sub_24EC5C5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EC5C614@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v292 = a1;
  uint64_t v319 = a3;
  unint64_t v362 = *(void *)(a2 + 88);
  uint64_t v4 = sub_24EC77C20();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v306 = (char *)&v268 - v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269962258);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v305 = (char *)&v268 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v304 = (char *)&v268 - v9;
  uint64_t v10 = *(void *)(a2 + 112);
  uint64_t v361 = *(void *)(a2 + 104);
  uint64_t v356 = v10;
  uint64_t v352 = *(void *)(a2 + 264);
  uint64_t v11 = sub_24EC77A00();
  uint64_t v283 = *(void *)(v11 - 8);
  uint64_t v284 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v303 = (char *)&v268 - v12;
  uint64_t v357 = *(void *)(a2 + 16);
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  unint64_t v347 = *(void *)(a2 + 24);
  uint64_t v355 = *(void *)(a2 + 160);
  uint64_t v13 = sub_24EC77A00();
  uint64_t v281 = *(void *)(v13 - 8);
  uint64_t v282 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v302 = (char *)&v268 - v14;
  unint64_t v363 = *(void *)(a2 + 144);
  uint64_t v15 = sub_24EC779D0();
  uint64_t v16 = *(void *)(a2 + 136);
  uint64_t v359 = *(void *)(a2 + 128);
  uint64_t v351 = v16;
  unint64_t v17 = *(void *)(a2 + 288);
  uint64_t v360 = *(void *)(a2 + 280);
  unint64_t v353 = v17;
  *(void *)&long long v423 = v359;
  *((void *)&v423 + 1) = v16;
  uint64_t v424 = v360;
  unint64_t v425 = v17;
  uint64_t v18 = sub_24EC77BC0();
  uint64_t v294 = v15;
  swift_getTupleTypeMetadata3();
  uint64_t v350 = *(void *)(a2 + 80);
  uint64_t v354 = *(void *)(a2 + 216);
  uint64_t v19 = sub_24EC77A00();
  uint64_t v279 = *(void *)(v19 - 8);
  uint64_t v280 = v19;
  MEMORY[0x270FA5388](v19);
  uint64_t v301 = (char *)&v268 - v20;
  uint64_t v323 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v278 = v22;
  uint64_t v309 = (char *)&v268 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v311 = sub_24EC779C0();
  uint64_t v322 = *(uint64_t **)(v311 - 8);
  MEMORY[0x270FA5388](v311);
  uint64_t v320 = (char *)&v268 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = *(void *)(a2 + 72);
  uint64_t v358 = *(void *)(a2 + 64);
  uint64_t v348 = v24;
  uint64_t v349 = *(void *)(a2 + 208);
  uint64_t v25 = sub_24EC77C00();
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v300 = (char *)&v268 - v26;
  uint64_t v27 = *(void *)(a2 + 32);
  uint64_t v29 = *(void *)(a2 + 192);
  uint64_t v334 = *(void *)(a2 + 56);
  uint64_t v28 = v334;
  uint64_t v30 = sub_24EC77A00();
  uint64_t v275 = *(void *)(v30 - 8);
  uint64_t v276 = v30;
  MEMORY[0x270FA5388](v30);
  uint64_t v298 = (char *)&v268 - v31;
  uint64_t v33 = *(void *)(a2 + 184);
  unint64_t v333 = *(void *)(a2 + 48);
  unint64_t v32 = v333;
  uint64_t v336 = v33;
  uint64_t v34 = sub_24EC77A00();
  uint64_t v273 = *(void **)(v34 - 8);
  uint64_t v274 = (void (*)(char *, uint64_t, uint64_t))v34;
  MEMORY[0x270FA5388](v34);
  uint64_t v297 = (char *)&v268 - v35;
  uint64_t v36 = *(void *)(a2 + 40);
  uint64_t v37 = *(void *)(a2 + 176);
  uint64_t v343 = v27;
  uint64_t v331 = v36;
  uint64_t v332 = v37;
  uint64_t v38 = sub_24EC77A00();
  uint64_t v271 = *(void *)(v38 - 8);
  uint64_t v272 = (void (*)(char *, uint64_t))v38;
  MEMORY[0x270FA5388](v38);
  uint64_t v296 = (char *)&v268 - v39;
  uint64_t v277 = (void (*)(void, void, void))v18;
  uint64_t v270 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v295 = (char *)&v268 - v41;
  uint64_t v345 = *(void *)(a2 + 96);
  uint64_t v338 = *(void *)(a2 + 120);
  unint64_t v42 = *(void *)(a2 + 152);
  uint64_t v337 = *(void *)(a2 + 168);
  uint64_t v346 = *(void *)(a2 + 200);
  uint64_t v43 = *(void *)(a2 + 232);
  uint64_t v344 = *(void *)(a2 + 224);
  uint64_t v342 = v43;
  uint64_t v44 = *(void *)(a2 + 248);
  uint64_t v341 = *(void *)(a2 + 240);
  uint64_t v340 = v44;
  uint64_t v339 = *(void *)(a2 + 256);
  unint64_t v330 = *(void *)(a2 + 272);
  uint64_t v45 = *(void *)(a2 + 296);
  *(void *)&long long v423 = v357;
  *((void *)&v423 + 1) = v27;
  uint64_t v424 = v36;
  unint64_t v425 = v32;
  uint64_t v426 = v28;
  uint64_t v427 = v358;
  uint64_t v428 = v348;
  uint64_t v429 = v350;
  unint64_t v430 = v347;
  unint64_t v431 = v362;
  uint64_t v432 = v345;
  uint64_t v433 = v361;
  uint64_t v434 = v356;
  uint64_t v435 = v338;
  uint64_t v436 = v351;
  uint64_t v437 = v359;
  unint64_t v438 = v363;
  uint64_t v439 = v42;
  unint64_t v46 = v42;
  uint64_t v440 = v337;
  uint64_t v441 = v37;
  uint64_t v442 = v33;
  uint64_t v443 = v29;
  uint64_t v444 = v346;
  uint64_t v445 = v349;
  uint64_t v446 = v354;
  uint64_t v447 = v355;
  uint64_t v448 = v344;
  uint64_t v449 = v43;
  uint64_t v450 = v341;
  uint64_t v451 = v44;
  uint64_t v452 = v339;
  uint64_t v453 = v352;
  unint64_t v454 = v330;
  unint64_t v455 = v353;
  uint64_t v456 = v360;
  uint64_t v457 = v45;
  uint64_t v47 = v45;
  uint64_t v48 = sub_24EC77AF0();
  uint64_t v285 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v299 = (char *)&v268 - v49;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D30);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v52 = sub_24EC61AC4();
  uint64_t v321 = v48;
  *(void *)&long long v423 = v48;
  uint64_t v324 = v50;
  *((void *)&v423 + 1) = v50;
  uint64_t v329 = WitnessTable;
  uint64_t v424 = WitnessTable;
  unint64_t v326 = v52;
  unint64_t v425 = v52;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v287 = *(void *)(OpaqueTypeMetadata2 - 8);
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v286 = (char *)&v268 - v54;
  uint64_t v288 = v55;
  uint64_t v56 = sub_24EC77CC0();
  uint64_t v291 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v290 = (char *)&v268 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v58);
  uint64_t v289 = (char *)&v268 - v59;
  uint64_t v315 = v60;
  uint64_t v61 = sub_24EC77D10();
  uint64_t v308 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  uint64_t v307 = (char *)&v268 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v63);
  uint64_t v312 = (char *)&v268 - v64;
  uint64_t v310 = (void (*)(char *, char *, uint64_t))sub_24EC779F0();
  uint64_t v293 = *((void *)v310 - 1);
  MEMORY[0x270FA5388](v310);
  uint64_t v66 = (char *)&v268 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D10);
  MEMORY[0x270FA5388](v67);
  uint64_t v69 = (uint64_t *)((char *)&v268 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D20);
  MEMORY[0x270FA5388](v70);
  uint64_t v72 = (char *)&v268 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v316 = v73;
  uint64_t v314 = v61;
  uint64_t v74 = sub_24EC77D10();
  uint64_t v317 = *(void *)(v74 - 8);
  uint64_t v318 = v74;
  MEMORY[0x270FA5388](v74);
  unsigned long long v313 = (char *)&v268 - v75;
  sub_24EC5BB28(a2);
  uint64_t v364 = v357;
  unint64_t v365 = v347;
  uint64_t v366 = v343;
  uint64_t v367 = v331;
  unint64_t v368 = v333;
  uint64_t v369 = v334;
  uint64_t v370 = v358;
  uint64_t v371 = v348;
  uint64_t v372 = v350;
  unint64_t v373 = v362;
  uint64_t v374 = v345;
  uint64_t v375 = v361;
  uint64_t v376 = v356;
  uint64_t v377 = v338;
  uint64_t v378 = v359;
  uint64_t v379 = v351;
  unint64_t v380 = v363;
  unint64_t v328 = v46;
  unint64_t v381 = v46;
  uint64_t v382 = v355;
  uint64_t v383 = v337;
  uint64_t v384 = v332;
  uint64_t v385 = v336;
  uint64_t v325 = v29;
  uint64_t v386 = v29;
  uint64_t v387 = v346;
  uint64_t v388 = v349;
  uint64_t v389 = v354;
  uint64_t v390 = v344;
  uint64_t v391 = v342;
  uint64_t v392 = v341;
  uint64_t v393 = v340;
  uint64_t v394 = v339;
  uint64_t v395 = v352;
  unint64_t v76 = v330;
  unint64_t v396 = v330;
  uint64_t v397 = v360;
  unint64_t v398 = v353;
  uint64_t v327 = v47;
  uint64_t v399 = v47;
  swift_getKeyPath();
  sub_24EC77E40();
  swift_release();
  swift_release();
  unsigned __int8 v77 = BYTE8(v422);
  if (BYTE8(v422) >= 2u)
  {
    uint64_t v81 = MEMORY[0x263F1B428];
    if ((void)v422)
    {
      uint64_t v269 = v66;
      sub_24EC779E0();
      uint64_t v82 = v293;
      (*(void (**)(uint64_t *, char *, void *))(v293 + 16))(v69, v66, v310);
      swift_storeEnumTagMultiPayload();
      sub_24EC67840(&qword_26B1D9CE8, MEMORY[0x263F3E160]);
      sub_24EC77D00();
      unint64_t v363 = sub_24EC61B30();
      uint64_t v83 = (uint64_t)v72;
      uint64_t v84 = v321;
      *(void *)&long long v423 = v321;
      uint64_t v85 = v324;
      *((void *)&v423 + 1) = v324;
      uint64_t v424 = v329;
      unint64_t v425 = v326;
      uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      uint64_t v86 = MEMORY[0x263F1A240];
      uint64_t v407 = MEMORY[0x263F1A240];
      uint64_t v87 = swift_getWitnessTable();
      uint64_t v404 = v81;
      uint64_t v405 = v87;
      swift_getWitnessTable();
      uint64_t v88 = v313;
      sub_24EC5EAA4(v83, v316);
      sub_24EC68EA0(v83, &qword_26B1D9D20);
      (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v82 + 8))(v269, v310);
    }
    else
    {
      uint64_t *v69 = sub_24EC77D90();
      swift_storeEnumTagMultiPayload();
      sub_24EC67840(&qword_26B1D9CE8, MEMORY[0x263F3E160]);
      swift_retain();
      sub_24EC77D00();
      unint64_t v363 = sub_24EC61B30();
      uint64_t v259 = (uint64_t)v72;
      uint64_t v84 = v321;
      *(void *)&long long v423 = v321;
      uint64_t v85 = v324;
      *((void *)&v423 + 1) = v324;
      uint64_t v424 = v329;
      unint64_t v425 = v326;
      uint64_t v402 = swift_getOpaqueTypeConformance2();
      uint64_t v86 = MEMORY[0x263F1A240];
      uint64_t v403 = MEMORY[0x263F1A240];
      uint64_t v260 = swift_getWitnessTable();
      uint64_t v400 = v81;
      uint64_t v401 = v260;
      swift_getWitnessTable();
      uint64_t v88 = v313;
      sub_24EC5EAA4(v259, v316);
      sub_24EC68EA0(v259, &qword_26B1D9D20);
      swift_release();
    }
  }
  else
  {
    uint64_t v269 = (char *)v422;
    *(void *)&long long v423 = v357;
    *((void *)&v423 + 1) = v343;
    uint64_t v424 = v358;
    unint64_t v425 = v362;
    uint64_t v426 = v345;
    uint64_t v427 = v338;
    uint64_t v428 = v359;
    uint64_t v429 = v361;
    unint64_t v430 = v363;
    unint64_t v431 = v328;
    uint64_t v432 = v337;
    uint64_t v433 = v346;
    uint64_t v434 = v344;
    uint64_t v435 = v342;
    uint64_t v436 = v341;
    uint64_t v437 = v340;
    unint64_t v438 = v76;
    uint64_t v439 = v360;
    uint64_t v440 = v339;
    uint64_t v441 = v327;
    sub_24EC77B60();
    sub_24EC77F00();
    swift_getWitnessTable();
    if (sub_24EC78040())
    {
      sub_24EC48E8C((uint64_t)v269, v77);
      *(void *)&long long v422 = sub_24EC77D90();
      uint64_t v78 = v321;
      *(void *)&long long v423 = v321;
      *((void *)&v423 + 1) = v324;
      uint64_t v424 = v329;
      unint64_t v79 = v326;
      unint64_t v425 = v326;
      uint64_t v408 = swift_getOpaqueTypeConformance2();
      uint64_t v80 = MEMORY[0x263F1A240];
      uint64_t v409 = MEMORY[0x263F1A240];
      swift_getWitnessTable();
      sub_24EC5EAA4((uint64_t)&v422, MEMORY[0x263F1B440]);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t, void))(v270 + 16))(v295, v292, v277);
      uint64_t v89 = v335;
      (*(void (**)(char *, uint64_t, void (*)(char *, uint64_t)))(v271 + 16))(v296, v335 + *(int *)(a2 + 316), v272);
      ((void (*)(char *, uint64_t, void))v273[2])(v297, v89 + *(int *)(a2 + 320), v274);
      (*(void (**)(char *, uint64_t, uint64_t))(v275 + 16))(v298, v89 + *(int *)(a2 + 324), v276);
      uint64_t v90 = v89 + *(int *)(a2 + 344);
      uint64_t v91 = (void (*)(void))v322[2];
      uint64_t v273 = v322 + 2;
      uint64_t v274 = (void (*)(char *, uint64_t, uint64_t))v91;
      uint64_t v275 = v90;
      uint64_t v92 = v320;
      uint64_t v93 = v311;
      v91(v320);
      uint64_t v94 = v323;
      uint64_t v95 = *(void (**)(void, void, void))(v323 + 16);
      uint64_t v276 = v323 + 16;
      uint64_t v277 = v95;
      uint64_t v96 = v309;
      v95(v309, v89, a2);
      uint64_t v97 = *(unsigned __int8 *)(v94 + 80);
      uint64_t v292 = ((v97 + 304) & ~v97) + v278;
      uint64_t v293 = (v97 + 304) & ~v97;
      uint64_t v98 = v293;
      uint64_t v278 = v97 | 7;
      uint64_t v99 = (void *)swift_allocObject();
      unint64_t v100 = v347;
      v99[2] = v357;
      v99[3] = v100;
      uint64_t v101 = v331;
      v99[4] = v343;
      v99[5] = v101;
      uint64_t v102 = v334;
      v99[6] = v333;
      v99[7] = v102;
      uint64_t v103 = v348;
      v99[8] = v358;
      v99[9] = v103;
      unint64_t v104 = v362;
      v99[10] = v350;
      v99[11] = v104;
      uint64_t v105 = v361;
      v99[12] = v345;
      v99[13] = v105;
      uint64_t v106 = v338;
      v99[14] = v356;
      v99[15] = v106;
      uint64_t v107 = v351;
      v99[16] = v359;
      v99[17] = v107;
      unint64_t v108 = v328;
      v99[18] = v363;
      v99[19] = v108;
      uint64_t v109 = v337;
      v99[20] = v355;
      v99[21] = v109;
      uint64_t v110 = v336;
      v99[22] = v332;
      v99[23] = v110;
      uint64_t v111 = v346;
      v99[24] = v325;
      v99[25] = v111;
      uint64_t v112 = v349;
      uint64_t v113 = v354;
      v99[26] = v349;
      v99[27] = v113;
      uint64_t v114 = v342;
      v99[28] = v344;
      v99[29] = v114;
      uint64_t v115 = v340;
      v99[30] = v341;
      v99[31] = v115;
      uint64_t v116 = v352;
      v99[32] = v339;
      v99[33] = v116;
      uint64_t v117 = v360;
      v99[34] = v76;
      v99[35] = v117;
      uint64_t v118 = v327;
      v99[36] = v353;
      v99[37] = v118;
      long long v119 = *(void **)(v94 + 32);
      uint64_t v323 = v94 + 32;
      uint64_t v310 = (void (*)(char *, char *, uint64_t))v119;
      long long v120 = v96;
      ((void (*)(char *, char *, uint64_t))v119)((char *)v99 + v98, v96, a2);
      uint64_t v271 = sub_24EC67840(&qword_26B1D91C8, MEMORY[0x263F07508]);
      uint64_t v121 = v358;
      uint64_t v122 = v348;
      sub_24EC77BE0();
      swift_release();
      uint64_t v123 = (void (*)(void, void))v322[1];
      ++v322;
      uint64_t v272 = (void (*)(char *, uint64_t))v123;
      v123(v92, v93);
      uint64_t v124 = v335;
      (*(void (**)(char *, uint64_t, uint64_t))(v279 + 16))(v301, v335 + *(int *)(a2 + 332), v280);
      (*(void (**)(char *, uint64_t, uint64_t))(v281 + 16))(v302, v124 + *(int *)(a2 + 312), v282);
      (*(void (**)(char *, uint64_t, uint64_t))(v283 + 16))(v303, v124 + *(int *)(a2 + 336), v284);
      v274(v92, v275, v93);
      uint64_t v125 = v124;
      uint64_t v126 = (void (*)(char *, uint64_t, uint64_t))v277;
      v277(v120, v125, a2);
      uint64_t v127 = (void *)swift_allocObject();
      unint64_t v128 = v347;
      v127[2] = v357;
      v127[3] = v128;
      uint64_t v129 = v331;
      v127[4] = v343;
      v127[5] = v129;
      uint64_t v130 = v334;
      v127[6] = v333;
      v127[7] = v130;
      v127[8] = v121;
      v127[9] = v122;
      unint64_t v131 = v362;
      v127[10] = v350;
      v127[11] = v131;
      uint64_t v132 = v361;
      v127[12] = v345;
      v127[13] = v132;
      uint64_t v133 = v338;
      v127[14] = v356;
      v127[15] = v133;
      uint64_t v134 = v351;
      v127[16] = v359;
      v127[17] = v134;
      unint64_t v135 = v328;
      v127[18] = v363;
      v127[19] = v135;
      uint64_t v136 = v337;
      v127[20] = v355;
      v127[21] = v136;
      uint64_t v137 = v332;
      uint64_t v138 = v336;
      v127[22] = v332;
      v127[23] = v138;
      uint64_t v139 = v346;
      v127[24] = v325;
      v127[25] = v139;
      uint64_t v140 = v354;
      v127[26] = v112;
      v127[27] = v140;
      uint64_t v141 = v342;
      v127[28] = v344;
      v127[29] = v141;
      uint64_t v142 = v340;
      v127[30] = v341;
      v127[31] = v142;
      uint64_t v143 = v352;
      v127[32] = v339;
      v127[33] = v143;
      uint64_t v144 = v360;
      v127[34] = v330;
      v127[35] = v144;
      uint64_t v145 = (char *)v127 + v293;
      uint64_t v146 = v327;
      v127[36] = v353;
      v127[37] = v146;
      uint64_t v147 = v309;
      v310(v145, v309, a2);
      uint64_t v284 = MEMORY[0x263F8EE60] + 8;
      uint64_t v148 = v311;
      sub_24EC77C10();
      swift_release();
      v272(v92, v148);
      v274(v92, v275, v148);
      v126(v147, v335, a2);
      uint64_t v149 = (void *)swift_allocObject();
      unint64_t v150 = v347;
      v149[2] = v357;
      v149[3] = v150;
      uint64_t v151 = v331;
      v149[4] = v343;
      v149[5] = v151;
      uint64_t v152 = v334;
      v149[6] = v333;
      v149[7] = v152;
      uint64_t v153 = v348;
      v149[8] = v358;
      v149[9] = v153;
      unint64_t v154 = v362;
      v149[10] = v350;
      v149[11] = v154;
      uint64_t v155 = v361;
      v149[12] = v345;
      v149[13] = v155;
      v149[14] = v356;
      v149[15] = v133;
      uint64_t v156 = v351;
      v149[16] = v359;
      v149[17] = v156;
      unint64_t v157 = v328;
      v149[18] = v363;
      v149[19] = v157;
      uint64_t v158 = v337;
      v149[20] = v355;
      v149[21] = v158;
      uint64_t v159 = v336;
      v149[22] = v137;
      v149[23] = v159;
      uint64_t v160 = v346;
      v149[24] = v325;
      v149[25] = v160;
      uint64_t v161 = v354;
      v149[26] = v349;
      v149[27] = v161;
      v149[28] = v344;
      v149[29] = v141;
      uint64_t v162 = v341;
      uint64_t v163 = v340;
      v149[30] = v341;
      v149[31] = v163;
      uint64_t v164 = v352;
      v149[32] = v339;
      v149[33] = v164;
      uint64_t v165 = v360;
      v149[34] = v330;
      v149[35] = v165;
      uint64_t v166 = (char *)v149 + v293;
      uint64_t v167 = v327;
      v149[36] = v353;
      v149[37] = v167;
      uint64_t v168 = v147;
      v310(v166, v147, a2);
      uint64_t v169 = v320;
      uint64_t v170 = v311;
      sub_24EC77C10();
      swift_release();
      v272(v169, v170);
      v274(v169, v275, v170);
      v171 = v168;
      v277(v168, v335, a2);
      uint64_t v172 = (void *)swift_allocObject();
      unint64_t v173 = v347;
      v172[2] = v357;
      v172[3] = v173;
      uint64_t v174 = v331;
      v172[4] = v343;
      v172[5] = v174;
      uint64_t v175 = v334;
      v172[6] = v333;
      v172[7] = v175;
      uint64_t v176 = v348;
      v172[8] = v358;
      v172[9] = v176;
      unint64_t v177 = v362;
      v172[10] = v350;
      v172[11] = v177;
      uint64_t v178 = v361;
      v172[12] = v345;
      v172[13] = v178;
      uint64_t v179 = v338;
      v172[14] = v356;
      v172[15] = v179;
      uint64_t v180 = v351;
      v172[16] = v359;
      v172[17] = v180;
      v172[18] = v363;
      v172[19] = v157;
      uint64_t v181 = v337;
      v172[20] = v355;
      v172[21] = v181;
      uint64_t v182 = v336;
      v172[22] = v332;
      v172[23] = v182;
      uint64_t v183 = v346;
      v172[24] = v325;
      v172[25] = v183;
      uint64_t v184 = v354;
      v172[26] = v349;
      v172[27] = v184;
      uint64_t v185 = v342;
      v172[28] = v344;
      v172[29] = v185;
      v172[30] = v162;
      uint64_t v186 = v339;
      v172[31] = v340;
      v172[32] = v186;
      unint64_t v187 = v330;
      v172[33] = v352;
      v172[34] = v187;
      v172[35] = v360;
      uint64_t v188 = (char *)v172 + v293;
      uint64_t v189 = v327;
      v172[36] = v353;
      v172[37] = v189;
      v310(v188, v171, a2);
      uint64_t v190 = v320;
      uint64_t v191 = v311;
      sub_24EC77C10();
      swift_release();
      v272(v190, v191);
      uint64_t v192 = sub_24EC5BB28(a2);
      uint64_t v322 = &v268;
      MEMORY[0x270FA5388](v192);
      swift_getKeyPath();
      sub_24EC77E40();
      swift_release();
      swift_release();
      sub_24EC77AE0();
      uint64_t v193 = sub_24EC5BB28(a2);
      uint64_t v322 = &v268;
      MEMORY[0x270FA5388](v193);
      uint64_t v194 = v337;
      uint64_t v195 = v331;
      uint64_t v196 = v357;
      unint64_t v197 = v347;
      uint64_t v198 = v343;
      swift_getKeyPath();
      sub_24EC77E40();
      swift_release();
      swift_release();
      long long v422 = v423;
      v199 = v309;
      v277(v309, v335, a2);
      uint64_t v200 = (void *)swift_allocObject();
      v200[2] = v196;
      v200[3] = v197;
      v200[4] = v198;
      v200[5] = v195;
      uint64_t v201 = v334;
      v200[6] = v333;
      v200[7] = v201;
      uint64_t v202 = v348;
      v200[8] = v358;
      v200[9] = v202;
      unint64_t v203 = v362;
      v200[10] = v350;
      v200[11] = v203;
      uint64_t v204 = v361;
      v200[12] = v345;
      v200[13] = v204;
      uint64_t v205 = v338;
      v200[14] = v356;
      v200[15] = v205;
      uint64_t v206 = v351;
      v200[16] = v359;
      v200[17] = v206;
      unint64_t v207 = v328;
      v200[18] = v363;
      v200[19] = v207;
      v200[20] = v355;
      v200[21] = v194;
      uint64_t v208 = v336;
      v200[22] = v332;
      v200[23] = v208;
      uint64_t v209 = v346;
      v200[24] = v325;
      v200[25] = v209;
      uint64_t v210 = v354;
      v200[26] = v349;
      v200[27] = v210;
      uint64_t v211 = v342;
      v200[28] = v344;
      v200[29] = v211;
      uint64_t v212 = v340;
      v200[30] = v341;
      v200[31] = v212;
      uint64_t v213 = v352;
      v200[32] = v339;
      v200[33] = v213;
      uint64_t v214 = v360;
      v200[34] = v330;
      v200[35] = v214;
      uint64_t v215 = (char *)v200 + v293;
      uint64_t v216 = v327;
      v200[36] = v353;
      v200[37] = v216;
      v310(v215, v199, a2);
      uint64_t v217 = v286;
      uint64_t v218 = v321;
      uint64_t v219 = v324;
      uint64_t v220 = v329;
      unint64_t v221 = v326;
      uint64_t v222 = v299;
      sub_24EC77D70();
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v285 + 8))(v222, v218);
      v277(v199, v335, a2);
      uint64_t v223 = (void *)swift_allocObject();
      unint64_t v224 = v347;
      v223[2] = v357;
      v223[3] = v224;
      uint64_t v225 = v331;
      v223[4] = v343;
      v223[5] = v225;
      uint64_t v226 = v334;
      v223[6] = v333;
      v223[7] = v226;
      uint64_t v227 = v348;
      v223[8] = v358;
      v223[9] = v227;
      unint64_t v228 = v362;
      v223[10] = v350;
      v223[11] = v228;
      uint64_t v229 = v361;
      v223[12] = v345;
      v223[13] = v229;
      uint64_t v230 = v338;
      v223[14] = v356;
      v223[15] = v230;
      uint64_t v231 = v351;
      v223[16] = v359;
      v223[17] = v231;
      unint64_t v232 = v328;
      v223[18] = v363;
      v223[19] = v232;
      uint64_t v233 = v337;
      v223[20] = v355;
      v223[21] = v233;
      uint64_t v234 = v336;
      v223[22] = v332;
      v223[23] = v234;
      uint64_t v235 = v346;
      v223[24] = v325;
      v223[25] = v235;
      uint64_t v236 = v354;
      v223[26] = v349;
      v223[27] = v236;
      uint64_t v237 = v342;
      v223[28] = v344;
      v223[29] = v237;
      uint64_t v238 = v340;
      v223[30] = v341;
      v223[31] = v238;
      uint64_t v239 = v352;
      v223[32] = v339;
      v223[33] = v239;
      uint64_t v240 = v360;
      v223[34] = v330;
      v223[35] = v240;
      uint64_t v241 = (char *)v223 + v293;
      uint64_t v242 = v327;
      v223[36] = v353;
      v223[37] = v242;
      v310(v241, v199, a2);
      *(void *)&long long v423 = v218;
      *((void *)&v423 + 1) = v219;
      uint64_t v424 = v220;
      unint64_t v425 = v221;
      uint64_t v243 = swift_getOpaqueTypeConformance2();
      uint64_t v244 = (uint64_t)v290;
      uint64_t v245 = v288;
      sub_24EC77D50();
      swift_release();
      (*(void (**)(char *, uint64_t))(v287 + 8))(v217, v245);
      uint64_t v420 = v243;
      uint64_t v80 = MEMORY[0x263F1A240];
      uint64_t v421 = MEMORY[0x263F1A240];
      uint64_t v246 = v315;
      swift_getWitnessTable();
      uint64_t v247 = v291;
      uint64_t v248 = *(void (**)(char *, uint64_t, uint64_t))(v291 + 16);
      uint64_t v249 = v289;
      v248(v289, v244, v246);
      uint64_t v250 = *(void (**)(uint64_t, uint64_t))(v247 + 8);
      v250(v244, v246);
      v248((char *)v244, (uint64_t)v249, v246);
      sub_24EC5EB9C(v244, MEMORY[0x263F1B440], v246);
      v250(v244, v246);
      v250((uint64_t)v249, v246);
      uint64_t v78 = v321;
      unint64_t v79 = v326;
    }
    uint64_t v88 = v313;
    uint64_t v251 = v314;
    *(void *)&long long v423 = v78;
    *((void *)&v423 + 1) = v324;
    uint64_t v424 = v329;
    unint64_t v425 = v79;
    uint64_t v418 = swift_getOpaqueTypeConformance2();
    uint64_t v419 = v80;
    uint64_t v252 = swift_getWitnessTable();
    uint64_t v81 = MEMORY[0x263F1B428];
    uint64_t v416 = MEMORY[0x263F1B428];
    uint64_t v417 = v252;
    swift_getWitnessTable();
    uint64_t v253 = v78;
    uint64_t v254 = (uint64_t)v307;
    uint64_t v255 = v308;
    uint64_t v256 = v312;
    (*(void (**)(char *, char *, uint64_t))(v308 + 16))(v307, v312, v251);
    sub_24EC61B30();
    sub_24EC5EB9C(v254, v316, v251);
    v257 = *(void (**)(uint64_t, uint64_t))(v255 + 8);
    v257(v254, v251);
    v258 = v256;
    uint64_t v85 = v324;
    v257((uint64_t)v258, v251);
    uint64_t v84 = v253;
    uint64_t v86 = MEMORY[0x263F1A240];
  }
  uint64_t v261 = v319;
  unint64_t v262 = sub_24EC61B30();
  *(void *)&long long v423 = v84;
  *((void *)&v423 + 1) = v85;
  uint64_t v424 = v329;
  unint64_t v425 = v326;
  uint64_t v414 = swift_getOpaqueTypeConformance2();
  uint64_t v415 = v86;
  uint64_t v263 = swift_getWitnessTable();
  uint64_t v412 = v81;
  uint64_t v413 = v263;
  uint64_t v264 = swift_getWitnessTable();
  unint64_t v410 = v262;
  uint64_t v411 = v264;
  uint64_t v265 = v318;
  swift_getWitnessTable();
  uint64_t v266 = v317;
  (*(void (**)(uint64_t, char *, uint64_t))(v317 + 16))(v261, v88, v265);
  return (*(uint64_t (**)(char *, uint64_t))(v266 + 8))(v88, v265);
}

uint64_t sub_24EC5EAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EC77CF0();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24EC77D00();
}

uint64_t sub_24EC5EB9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_24EC77CF0();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24EC77D00();
}

uint64_t sub_24EC5EC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v28 = *(void *)(a10 - 8);
  *(double *)&long long v29 = MEMORY[0x270FA5388](a1);
  uint64_t v31 = (char *)v55 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55[0] = v32;
  v55[1] = v33;
  v55[2] = v34;
  v55[3] = v35;
  v55[4] = v36;
  v55[5] = v37;
  v55[6] = a9;
  v55[7] = a10;
  long long v56 = v39;
  long long v57 = v38;
  long long v58 = v41;
  long long v59 = v40;
  long long v60 = v43;
  long long v61 = v42;
  long long v62 = v44;
  uint64_t v63 = v46;
  uint64_t v64 = v45;
  *(_OWORD *)(v47 + 200) = v48;
  *(_OWORD *)(v47 + 216) = v49;
  *(_OWORD *)(v47 + 232) = v50;
  *(_OWORD *)(v47 + 248) = v51;
  *(_OWORD *)(v47 + 264) = v29;
  uint64_t v65 = a27;
  uint64_t v66 = v52;
  type metadata accessor for CanvasView(0, (uint64_t)v55);
  sub_24EC77C00();
  uint64_t v53 = (void (*)(uint64_t))sub_24EC77BF0();
  v53(a1);
  swift_release();
  MEMORY[0x25334B2C0](v31, a10, a27);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v31, a10);
}

uint64_t sub_24EC5EE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 744) = v38;
  *(void *)(v8 + 696) = v32;
  *(void *)(v8 + 688) = v31;
  *(void *)(v8 + 672) = v29;
  *(void *)(v8 + 640) = v26;
  *(void *)(v8 + 592) = v20;
  *(void *)(v8 + 560) = v16;
  *(void *)(v8 + 552) = v15;
  *(void *)(v8 + 536) = v13;
  *(_OWORD *)(v8 + 520) = v12;
  *(void *)(v8 + 480) = a4;
  *(void *)(v8 + 488) = a5;
  *(void *)(v8 + 496) = a6;
  *(void *)(v8 + 504) = a7;
  *(void *)(v8 + 304) = a6;
  *(void *)(v8 + 312) = a8;
  *(void *)(v8 + 512) = a8;
  *(void *)(v8 + 544) = v14;
  *(void *)(v8 + 320) = v14;
  *(void *)(v8 + 328) = v17;
  *(void *)(v8 + 568) = v17;
  *(void *)(v8 + 576) = v18;
  *(void *)(v8 + 336) = v18;
  *(void *)(v8 + 344) = v19;
  *(void *)(v8 + 584) = v19;
  *(void *)(v8 + 600) = v21;
  *(void *)(v8 + 352) = v21;
  *(void *)(v8 + 360) = v22;
  *(void *)(v8 + 608) = v22;
  *(void *)(v8 + 616) = v23;
  *(void *)(v8 + 368) = v23;
  *(void *)(v8 + 376) = v24;
  *(void *)(v8 + 624) = v24;
  *(void *)(v8 + 632) = v25;
  *(void *)(v8 + 384) = v25;
  *(void *)(v8 + 392) = v27;
  *(void *)(v8 + 648) = v27;
  *(void *)(v8 + 680) = v30;
  *(void *)(v8 + 400) = v30;
  *(void *)(v8 + 408) = v33;
  *(void *)(v8 + 704) = v33;
  *(void *)(v8 + 712) = v34;
  *(void *)(v8 + 416) = v34;
  *(void *)(v8 + 424) = v35;
  *(void *)(v8 + 720) = v35;
  *(void *)(v8 + 728) = v36;
  *(void *)(v8 + 432) = v36;
  *(void *)(v8 + 440) = v37;
  *(void *)(v8 + 736) = v37;
  *(void *)(v8 + 752) = v39;
  *(void *)(v8 + 448) = v39;
  *(void *)(v8 + 456) = v40;
  *(void *)(v8 + 760) = v40;
  *(void *)(v8 + 768) = v41;
  *(void *)(v8 + 464) = v41;
  *(void *)(v8 + 472) = v42;
  *(void *)(v8 + 776) = v42;
  *(_OWORD *)(v8 + 656) = v28;
  uint64_t v9 = type metadata accessor for CanvasAction(0, v8 + 304);
  *(void *)(v8 + 784) = v9;
  *(void *)(v8 + 792) = *(void *)(v9 - 8);
  *(void *)(v8 + 800) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC5F060, 0, 0);
}

uint64_t sub_24EC5F060()
{
  *(void *)(v0 + 808) = sub_24EC77F60();
  *(void *)(v0 + 816) = sub_24EC77F50();
  uint64_t v2 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC5F0F8, v2, v1);
}

uint64_t sub_24EC5F0F8()
{
  long long v19 = *(_OWORD *)(v0 + 512);
  long long v20 = *(_OWORD *)(v0 + 496);
  long long v17 = *(_OWORD *)(v0 + 544);
  long long v18 = *(_OWORD *)(v0 + 528);
  long long v15 = *(_OWORD *)(v0 + 576);
  long long v16 = *(_OWORD *)(v0 + 560);
  long long v13 = *(_OWORD *)(v0 + 608);
  long long v14 = *(_OWORD *)(v0 + 592);
  long long v11 = *(_OWORD *)(v0 + 640);
  long long v12 = *(_OWORD *)(v0 + 624);
  long long v9 = *(_OWORD *)(v0 + 672);
  long long v10 = *(_OWORD *)(v0 + 656);
  long long v7 = *(_OWORD *)(v0 + 704);
  long long v8 = *(_OWORD *)(v0 + 688);
  long long v5 = *(_OWORD *)(v0 + 736);
  long long v6 = *(_OWORD *)(v0 + 720);
  long long v3 = *(_OWORD *)(v0 + 768);
  long long v4 = *(_OWORD *)(v0 + 752);
  swift_release();
  *(_OWORD *)(v0 + 16) = v20;
  *(_OWORD *)(v0 + 32) = v19;
  *(_OWORD *)(v0 + 48) = v18;
  *(_OWORD *)(v0 + 64) = v17;
  *(_OWORD *)(v0 + 80) = v16;
  *(_OWORD *)(v0 + 96) = v15;
  *(_OWORD *)(v0 + 112) = v14;
  *(_OWORD *)(v0 + 128) = v13;
  *(_OWORD *)(v0 + 144) = v12;
  *(_OWORD *)(v0 + 160) = v11;
  *(_OWORD *)(v0 + 176) = v10;
  *(_OWORD *)(v0 + 192) = v9;
  *(_OWORD *)(v0 + 208) = v8;
  *(_OWORD *)(v0 + 224) = v7;
  *(_OWORD *)(v0 + 240) = v6;
  *(_OWORD *)(v0 + 256) = v5;
  *(_OWORD *)(v0 + 272) = v4;
  *(_OWORD *)(v0 + 288) = v3;
  uint64_t v1 = type metadata accessor for CanvasView(0, v0 + 16);
  *(void *)(v0 + 824) = sub_24EC5BB28(v1);
  return MEMORY[0x270FA2498](sub_24EC5F25C, 0, 0);
}

uint64_t sub_24EC5F25C()
{
  uint64_t v1 = v0[100];
  uint64_t v2 = v0[61];
  uint64_t v3 = sub_24EC779D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v1, v2, v3);
  swift_storeEnumTagMultiPayload();
  v0[104] = sub_24EC77F50();
  uint64_t v5 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC5F348, v5, v4);
}

uint64_t sub_24EC5F348()
{
  uint64_t v1 = v0[100];
  uint64_t v2 = v0[99];
  uint64_t v3 = v0[98];
  swift_release();
  sub_24EC77E50();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_24EC5F3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24EC77F90();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24EC77F80();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_24EC68EA0(a1, &qword_26B1D9D40);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24EC77F30();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24EC5F59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40)
{
  uint64_t v110 = a8;
  uint64_t v107 = a6;
  uint64_t v108 = a7;
  uint64_t v105 = a5;
  uint64_t v102 = a4;
  uint64_t v100 = a3;
  uint64_t v91 = a2;
  uint64_t v92 = a1;
  uint64_t v94 = a40;
  uint64_t v93 = a39;
  uint64_t v121 = a38;
  uint64_t v120 = a37;
  uint64_t v119 = a36;
  uint64_t v118 = a35;
  uint64_t v117 = a34;
  uint64_t v116 = a33;
  uint64_t v115 = a32;
  uint64_t v114 = a31;
  uint64_t v113 = a30;
  uint64_t v112 = a29;
  uint64_t v111 = a28;
  uint64_t v109 = a27;
  uint64_t v106 = a26;
  uint64_t v104 = a25;
  uint64_t v103 = a24;
  uint64_t v101 = a23;
  uint64_t v99 = a22;
  uint64_t v98 = a21;
  uint64_t v97 = a20;
  uint64_t v96 = a19;
  uint64_t v95 = a18;
  uint64_t v88 = a17;
  uint64_t v87 = a16;
  uint64_t v86 = a15;
  uint64_t v85 = a14;
  uint64_t v84 = a13;
  uint64_t v89 = a12;
  uint64_t v90 = a11;
  uint64_t v82 = a10;
  uint64_t v83 = a9;
  uint64_t v40 = sub_24EC779D0();
  uint64_t v79 = *(void *)(v40 - 8);
  uint64_t v80 = v40;
  uint64_t v81 = *(void *)(v79 + 64);
  MEMORY[0x270FA5388](v40);
  uint64_t v78 = (char *)&v77 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122[0] = v100;
  v122[1] = v102;
  v122[2] = v105;
  v122[3] = v107;
  v122[4] = v108;
  v122[5] = v110;
  v122[6] = a9;
  v122[7] = a10;
  v122[8] = a11;
  v122[9] = a12;
  v122[10] = a13;
  v122[11] = a14;
  v122[12] = a15;
  v122[13] = a16;
  v122[14] = a17;
  v122[15] = a18;
  v122[16] = a19;
  v122[17] = a20;
  v122[18] = a21;
  v122[19] = a22;
  v122[20] = a23;
  v122[21] = a24;
  v122[22] = a25;
  v122[23] = a26;
  v122[24] = a27;
  v122[25] = a28;
  v122[26] = a29;
  v122[27] = a30;
  v122[28] = a31;
  v122[29] = a32;
  v122[30] = a33;
  v122[31] = a34;
  v122[32] = a35;
  v122[33] = a36;
  v122[34] = a37;
  v122[35] = a38;
  uint64_t v42 = type metadata accessor for CanvasView(0, (uint64_t)v122);
  uint64_t v77 = v42;
  uint64_t v43 = *(void *)(v42 - 8);
  uint64_t v44 = *(void *)(v43 + 64);
  MEMORY[0x270FA5388](v42);
  uint64_t v46 = (char *)&v77 - v45;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D40);
  MEMORY[0x270FA5388](v47 - 8);
  long long v49 = (char *)&v77 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_24EC77F90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v49, 1, 1, v50);
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v46, v91, v42);
  long long v51 = v78;
  uint64_t v52 = v79;
  uint64_t v53 = v80;
  (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v78, v92, v80);
  unint64_t v54 = (*(unsigned __int8 *)(v43 + 80) + 320) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
  uint64_t v55 = v52;
  unint64_t v56 = (v44 + *(unsigned __int8 *)(v52 + 80) + v54) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  long long v57 = (char *)swift_allocObject();
  uint64_t v58 = v102;
  *((void *)v57 + 4) = v100;
  *((void *)v57 + 5) = v58;
  uint64_t v59 = v107;
  *((void *)v57 + 6) = v105;
  *((void *)v57 + 7) = v59;
  uint64_t v60 = v110;
  *((void *)v57 + 8) = v108;
  *((void *)v57 + 9) = v60;
  uint64_t v61 = v82;
  *((void *)v57 + 10) = v83;
  *((void *)v57 + 11) = v61;
  *((void *)v57 + 2) = 0;
  *((void *)v57 + 3) = 0;
  uint64_t v62 = v89;
  *((void *)v57 + 12) = v90;
  *((void *)v57 + 13) = v62;
  uint64_t v63 = v85;
  *((void *)v57 + 14) = v84;
  *((void *)v57 + 15) = v63;
  uint64_t v64 = v87;
  *((void *)v57 + 16) = v86;
  *((void *)v57 + 17) = v64;
  uint64_t v65 = v95;
  *((void *)v57 + 18) = v88;
  *((void *)v57 + 19) = v65;
  uint64_t v66 = v97;
  *((void *)v57 + 20) = v96;
  *((void *)v57 + 21) = v66;
  uint64_t v67 = v99;
  *((void *)v57 + 22) = v98;
  *((void *)v57 + 23) = v67;
  uint64_t v68 = v103;
  *((void *)v57 + 24) = v101;
  *((void *)v57 + 25) = v68;
  uint64_t v69 = v106;
  *((void *)v57 + 26) = v104;
  *((void *)v57 + 27) = v69;
  uint64_t v70 = v111;
  *((void *)v57 + 28) = v109;
  *((void *)v57 + 29) = v70;
  uint64_t v71 = v113;
  *((void *)v57 + 30) = v112;
  *((void *)v57 + 31) = v71;
  uint64_t v72 = v115;
  *((void *)v57 + 32) = v114;
  *((void *)v57 + 33) = v72;
  uint64_t v73 = v117;
  *((void *)v57 + 34) = v116;
  *((void *)v57 + 35) = v73;
  uint64_t v74 = v119;
  *((void *)v57 + 36) = v118;
  *((void *)v57 + 37) = v74;
  uint64_t v75 = v121;
  *((void *)v57 + 38) = v120;
  *((void *)v57 + 39) = v75;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(&v57[v54], v46, v77);
  (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v57[v56], v51, v53);
  sub_24EC5F3F0((uint64_t)v49, v94, (uint64_t)v57);
  return swift_release();
}

uint64_t sub_24EC5FB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 744) = v38;
  *(void *)(v8 + 696) = v32;
  *(void *)(v8 + 688) = v31;
  *(void *)(v8 + 672) = v29;
  *(void *)(v8 + 640) = v26;
  *(void *)(v8 + 592) = v20;
  *(void *)(v8 + 560) = v16;
  *(void *)(v8 + 552) = v15;
  *(void *)(v8 + 536) = v13;
  *(_OWORD *)(v8 + 520) = v12;
  *(void *)(v8 + 480) = a4;
  *(void *)(v8 + 488) = a5;
  *(void *)(v8 + 496) = a6;
  *(void *)(v8 + 504) = a7;
  *(void *)(v8 + 304) = a6;
  *(void *)(v8 + 312) = a8;
  *(void *)(v8 + 512) = a8;
  *(void *)(v8 + 544) = v14;
  *(void *)(v8 + 320) = v14;
  *(void *)(v8 + 328) = v17;
  *(void *)(v8 + 568) = v17;
  *(void *)(v8 + 576) = v18;
  *(void *)(v8 + 336) = v18;
  *(void *)(v8 + 344) = v19;
  *(void *)(v8 + 584) = v19;
  *(void *)(v8 + 600) = v21;
  *(void *)(v8 + 352) = v21;
  *(void *)(v8 + 360) = v22;
  *(void *)(v8 + 608) = v22;
  *(void *)(v8 + 616) = v23;
  *(void *)(v8 + 368) = v23;
  *(void *)(v8 + 376) = v24;
  *(void *)(v8 + 624) = v24;
  *(void *)(v8 + 632) = v25;
  *(void *)(v8 + 384) = v25;
  *(void *)(v8 + 392) = v27;
  *(void *)(v8 + 648) = v27;
  *(void *)(v8 + 680) = v30;
  *(void *)(v8 + 400) = v30;
  *(void *)(v8 + 408) = v33;
  *(void *)(v8 + 704) = v33;
  *(void *)(v8 + 712) = v34;
  *(void *)(v8 + 416) = v34;
  *(void *)(v8 + 424) = v35;
  *(void *)(v8 + 720) = v35;
  *(void *)(v8 + 728) = v36;
  *(void *)(v8 + 432) = v36;
  *(void *)(v8 + 440) = v37;
  *(void *)(v8 + 736) = v37;
  *(void *)(v8 + 752) = v39;
  *(void *)(v8 + 448) = v39;
  *(void *)(v8 + 456) = v40;
  *(void *)(v8 + 760) = v40;
  *(void *)(v8 + 768) = v41;
  *(void *)(v8 + 464) = v41;
  *(void *)(v8 + 472) = v42;
  *(void *)(v8 + 776) = v42;
  *(_OWORD *)(v8 + 656) = v28;
  uint64_t v9 = type metadata accessor for CanvasAction(0, v8 + 304);
  *(void *)(v8 + 784) = v9;
  *(void *)(v8 + 792) = *(void *)(v9 - 8);
  *(void *)(v8 + 800) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC5FD18, 0, 0);
}

uint64_t sub_24EC5FD18()
{
  *(void *)(v0 + 808) = sub_24EC77F60();
  *(void *)(v0 + 816) = sub_24EC77F50();
  uint64_t v2 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC5FDB0, v2, v1);
}

uint64_t sub_24EC5FDB0()
{
  long long v19 = *(_OWORD *)(v0 + 512);
  long long v20 = *(_OWORD *)(v0 + 496);
  long long v17 = *(_OWORD *)(v0 + 544);
  long long v18 = *(_OWORD *)(v0 + 528);
  long long v15 = *(_OWORD *)(v0 + 576);
  long long v16 = *(_OWORD *)(v0 + 560);
  long long v13 = *(_OWORD *)(v0 + 608);
  long long v14 = *(_OWORD *)(v0 + 592);
  long long v11 = *(_OWORD *)(v0 + 640);
  long long v12 = *(_OWORD *)(v0 + 624);
  long long v9 = *(_OWORD *)(v0 + 672);
  long long v10 = *(_OWORD *)(v0 + 656);
  long long v7 = *(_OWORD *)(v0 + 704);
  long long v8 = *(_OWORD *)(v0 + 688);
  long long v5 = *(_OWORD *)(v0 + 736);
  long long v6 = *(_OWORD *)(v0 + 720);
  long long v3 = *(_OWORD *)(v0 + 768);
  long long v4 = *(_OWORD *)(v0 + 752);
  swift_release();
  *(_OWORD *)(v0 + 16) = v20;
  *(_OWORD *)(v0 + 32) = v19;
  *(_OWORD *)(v0 + 48) = v18;
  *(_OWORD *)(v0 + 64) = v17;
  *(_OWORD *)(v0 + 80) = v16;
  *(_OWORD *)(v0 + 96) = v15;
  *(_OWORD *)(v0 + 112) = v14;
  *(_OWORD *)(v0 + 128) = v13;
  *(_OWORD *)(v0 + 144) = v12;
  *(_OWORD *)(v0 + 160) = v11;
  *(_OWORD *)(v0 + 176) = v10;
  *(_OWORD *)(v0 + 192) = v9;
  *(_OWORD *)(v0 + 208) = v8;
  *(_OWORD *)(v0 + 224) = v7;
  *(_OWORD *)(v0 + 240) = v6;
  *(_OWORD *)(v0 + 256) = v5;
  *(_OWORD *)(v0 + 272) = v4;
  *(_OWORD *)(v0 + 288) = v3;
  uint64_t v1 = type metadata accessor for CanvasView(0, v0 + 16);
  *(void *)(v0 + 824) = sub_24EC5BB28(v1);
  return MEMORY[0x270FA2498](sub_24EC5FF14, 0, 0);
}

uint64_t sub_24EC5FF14()
{
  uint64_t v1 = v0[100];
  uint64_t v2 = v0[61];
  uint64_t v3 = sub_24EC779D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v1, v2, v3);
  swift_storeEnumTagMultiPayload();
  v0[104] = sub_24EC77F50();
  uint64_t v5 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC6A830, v5, v4);
}

uint64_t sub_24EC60000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  uint64_t v114 = a8;
  uint64_t v110 = a1;
  uint64_t v111 = a7;
  uint64_t v90 = a6;
  uint64_t v91 = a5;
  uint64_t v92 = a4;
  uint64_t v93 = a3;
  uint64_t v109 = a2;
  uint64_t v126 = a38;
  uint64_t v125 = a37;
  uint64_t v124 = a36;
  uint64_t v123 = a35;
  uint64_t v122 = a34;
  uint64_t v121 = a33;
  uint64_t v120 = a32;
  uint64_t v119 = a31;
  uint64_t v118 = a30;
  uint64_t v117 = a29;
  uint64_t v116 = a28;
  uint64_t v115 = a27;
  uint64_t v113 = a26;
  uint64_t v112 = a25;
  uint64_t v108 = a24;
  uint64_t v107 = a23;
  uint64_t v106 = a22;
  uint64_t v105 = a21;
  uint64_t v104 = a11;
  uint64_t v88 = *(void *)(a12 - 8);
  uint64_t v38 = *(void *)(v88 + 64);
  uint64_t v103 = a20;
  uint64_t v102 = a19;
  uint64_t v101 = a18;
  uint64_t v100 = a17;
  uint64_t v99 = a16;
  uint64_t v98 = a15;
  uint64_t v97 = a14;
  uint64_t v96 = a13;
  uint64_t v95 = a10;
  uint64_t v94 = a9;
  uint64_t v89 = v38;
  MEMORY[0x270FA5388](a20);
  uint64_t v87 = (char *)&v86 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v127[0] = v39;
  v127[1] = v40;
  v127[2] = v41;
  v127[3] = v42;
  v127[4] = v111;
  v127[5] = v114;
  v127[6] = v43;
  v127[7] = a10;
  v127[8] = v45;
  v127[9] = v44;
  uint64_t v46 = v44;
  v127[10] = a13;
  v127[11] = a14;
  v127[12] = a15;
  v127[13] = a16;
  v127[14] = v47;
  v127[15] = v48;
  v127[16] = v50;
  v127[17] = v49;
  v127[18] = v51;
  v127[19] = a22;
  v127[20] = a23;
  v127[21] = a24;
  v127[22] = a25;
  v127[23] = a26;
  v127[24] = a27;
  v127[25] = a28;
  v127[26] = a29;
  v127[27] = a30;
  v127[28] = a31;
  v127[29] = a32;
  v127[30] = a33;
  v127[31] = a34;
  v127[32] = a35;
  v127[33] = a36;
  v127[34] = a37;
  v127[35] = a38;
  uint64_t v52 = type metadata accessor for CanvasView(0, (uint64_t)v127);
  uint64_t v86 = v52;
  uint64_t v53 = *(void *)(v52 - 8);
  uint64_t v54 = *(void *)(v53 + 64);
  MEMORY[0x270FA5388](v52);
  unint64_t v56 = (char *)&v86 - v55;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D40);
  MEMORY[0x270FA5388](v57 - 8);
  uint64_t v59 = (char *)&v86 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_24EC77F90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v59, 1, 1, v60);
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v56, v109, v52);
  uint64_t v62 = v87;
  uint64_t v61 = v88;
  uint64_t v63 = v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v88 + 16))(v87, v110, v46);
  unint64_t v64 = (*(unsigned __int8 *)(v53 + 80) + 320) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80);
  uint64_t v65 = v61;
  unint64_t v66 = (v54 + *(unsigned __int8 *)(v61 + 80) + v64) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  uint64_t v67 = (char *)swift_allocObject();
  uint64_t v68 = v92;
  *((void *)v67 + 4) = v93;
  *((void *)v67 + 5) = v68;
  uint64_t v69 = v90;
  *((void *)v67 + 6) = v91;
  *((void *)v67 + 7) = v69;
  uint64_t v70 = v114;
  *((void *)v67 + 8) = v111;
  *((void *)v67 + 9) = v70;
  *((void *)v67 + 2) = 0;
  *((void *)v67 + 3) = 0;
  uint64_t v71 = v95;
  *((void *)v67 + 10) = v94;
  *((void *)v67 + 11) = v71;
  *((void *)v67 + 12) = v104;
  *((void *)v67 + 13) = v63;
  uint64_t v72 = v97;
  *((void *)v67 + 14) = v96;
  *((void *)v67 + 15) = v72;
  uint64_t v73 = v99;
  *((void *)v67 + 16) = v98;
  *((void *)v67 + 17) = v73;
  uint64_t v74 = v101;
  *((void *)v67 + 18) = v100;
  *((void *)v67 + 19) = v74;
  uint64_t v75 = v103;
  *((void *)v67 + 20) = v102;
  *((void *)v67 + 21) = v75;
  uint64_t v76 = v106;
  *((void *)v67 + 22) = v105;
  *((void *)v67 + 23) = v76;
  uint64_t v77 = v108;
  *((void *)v67 + 24) = v107;
  *((void *)v67 + 25) = v77;
  uint64_t v78 = v113;
  *((void *)v67 + 26) = v112;
  *((void *)v67 + 27) = v78;
  uint64_t v79 = v116;
  *((void *)v67 + 28) = v115;
  *((void *)v67 + 29) = v79;
  uint64_t v80 = v118;
  *((void *)v67 + 30) = v117;
  *((void *)v67 + 31) = v80;
  uint64_t v81 = v120;
  *((void *)v67 + 32) = v119;
  *((void *)v67 + 33) = v81;
  uint64_t v82 = v122;
  *((void *)v67 + 34) = v121;
  *((void *)v67 + 35) = v82;
  uint64_t v83 = v124;
  *((void *)v67 + 36) = v123;
  *((void *)v67 + 37) = v83;
  uint64_t v84 = v126;
  *((void *)v67 + 38) = v125;
  *((void *)v67 + 39) = v84;
  (*(void (**)(char *, char *, uint64_t))(v53 + 32))(&v67[v64], v56, v86);
  (*(void (**)(char *, char *, uint64_t))(v65 + 32))(&v67[v66], v62, v63);
  sub_24EC5F3F0((uint64_t)v59, (uint64_t)&unk_269962268, (uint64_t)v67);
  return swift_release();
}

uint64_t sub_24EC60524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 744) = v38;
  *(void *)(v8 + 696) = v32;
  *(void *)(v8 + 688) = v31;
  *(void *)(v8 + 672) = v29;
  *(void *)(v8 + 640) = v26;
  *(void *)(v8 + 592) = v20;
  *(void *)(v8 + 560) = v16;
  *(void *)(v8 + 552) = v15;
  *(void *)(v8 + 536) = v13;
  *(_OWORD *)(v8 + 520) = v12;
  *(void *)(v8 + 480) = a4;
  *(void *)(v8 + 488) = a5;
  *(void *)(v8 + 496) = a6;
  *(void *)(v8 + 504) = a7;
  *(void *)(v8 + 304) = a6;
  *(void *)(v8 + 312) = a8;
  *(void *)(v8 + 512) = a8;
  *(void *)(v8 + 544) = v14;
  *(void *)(v8 + 320) = v14;
  *(void *)(v8 + 328) = v17;
  *(void *)(v8 + 568) = v17;
  *(void *)(v8 + 576) = v18;
  *(void *)(v8 + 336) = v18;
  *(void *)(v8 + 344) = v19;
  *(void *)(v8 + 584) = v19;
  *(void *)(v8 + 600) = v21;
  *(void *)(v8 + 352) = v21;
  *(void *)(v8 + 360) = v22;
  *(void *)(v8 + 608) = v22;
  *(void *)(v8 + 616) = v23;
  *(void *)(v8 + 368) = v23;
  *(void *)(v8 + 376) = v24;
  *(void *)(v8 + 624) = v24;
  *(void *)(v8 + 632) = v25;
  *(void *)(v8 + 384) = v25;
  *(void *)(v8 + 392) = v27;
  *(void *)(v8 + 648) = v27;
  *(void *)(v8 + 680) = v30;
  *(void *)(v8 + 400) = v30;
  *(void *)(v8 + 408) = v33;
  *(void *)(v8 + 704) = v33;
  *(void *)(v8 + 712) = v34;
  *(void *)(v8 + 416) = v34;
  *(void *)(v8 + 424) = v35;
  *(void *)(v8 + 720) = v35;
  *(void *)(v8 + 728) = v36;
  *(void *)(v8 + 432) = v36;
  *(void *)(v8 + 440) = v37;
  *(void *)(v8 + 736) = v37;
  *(void *)(v8 + 752) = v39;
  *(void *)(v8 + 448) = v39;
  *(void *)(v8 + 456) = v40;
  *(void *)(v8 + 760) = v40;
  *(void *)(v8 + 768) = v41;
  *(void *)(v8 + 464) = v41;
  *(void *)(v8 + 472) = v42;
  *(void *)(v8 + 776) = v42;
  *(_OWORD *)(v8 + 656) = v28;
  uint64_t v9 = type metadata accessor for CanvasAction(0, v8 + 304);
  *(void *)(v8 + 784) = v9;
  *(void *)(v8 + 792) = *(void *)(v9 - 8);
  *(void *)(v8 + 800) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC6073C, 0, 0);
}

uint64_t sub_24EC6073C()
{
  *(void *)(v0 + 808) = sub_24EC77F60();
  *(void *)(v0 + 816) = sub_24EC77F50();
  uint64_t v2 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC607D4, v2, v1);
}

uint64_t sub_24EC607D4()
{
  long long v19 = *(_OWORD *)(v0 + 512);
  long long v20 = *(_OWORD *)(v0 + 496);
  long long v17 = *(_OWORD *)(v0 + 544);
  long long v18 = *(_OWORD *)(v0 + 528);
  long long v15 = *(_OWORD *)(v0 + 576);
  long long v16 = *(_OWORD *)(v0 + 560);
  long long v13 = *(_OWORD *)(v0 + 608);
  long long v14 = *(_OWORD *)(v0 + 592);
  long long v11 = *(_OWORD *)(v0 + 640);
  long long v12 = *(_OWORD *)(v0 + 624);
  long long v9 = *(_OWORD *)(v0 + 672);
  long long v10 = *(_OWORD *)(v0 + 656);
  long long v7 = *(_OWORD *)(v0 + 704);
  long long v8 = *(_OWORD *)(v0 + 688);
  long long v5 = *(_OWORD *)(v0 + 736);
  long long v6 = *(_OWORD *)(v0 + 720);
  long long v3 = *(_OWORD *)(v0 + 768);
  long long v4 = *(_OWORD *)(v0 + 752);
  swift_release();
  *(_OWORD *)(v0 + 16) = v20;
  *(_OWORD *)(v0 + 32) = v19;
  *(_OWORD *)(v0 + 48) = v18;
  *(_OWORD *)(v0 + 64) = v17;
  *(_OWORD *)(v0 + 80) = v16;
  *(_OWORD *)(v0 + 96) = v15;
  *(_OWORD *)(v0 + 112) = v14;
  *(_OWORD *)(v0 + 128) = v13;
  *(_OWORD *)(v0 + 144) = v12;
  *(_OWORD *)(v0 + 160) = v11;
  *(_OWORD *)(v0 + 176) = v10;
  *(_OWORD *)(v0 + 192) = v9;
  *(_OWORD *)(v0 + 208) = v8;
  *(_OWORD *)(v0 + 224) = v7;
  *(_OWORD *)(v0 + 240) = v6;
  *(_OWORD *)(v0 + 256) = v5;
  *(_OWORD *)(v0 + 272) = v4;
  *(_OWORD *)(v0 + 288) = v3;
  uint64_t v1 = type metadata accessor for CanvasView(0, v0 + 16);
  *(void *)(v0 + 824) = sub_24EC5BB28(v1);
  return MEMORY[0x270FA2498](sub_24EC60938, 0, 0);
}

uint64_t sub_24EC60938()
{
  (*(void (**)(void, void))(*(void *)(v0[71] - 8) + 16))(v0[100], v0[61]);
  swift_storeEnumTagMultiPayload();
  v0[104] = sub_24EC77F50();
  uint64_t v2 = sub_24EC77F30();
  return MEMORY[0x270FA2498](sub_24EC6A830, v2, v1);
}

uint64_t sub_24EC60A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v83 = a4;
  uint64_t v84 = a8;
  uint64_t v99 = a7;
  uint64_t v96 = a5;
  uint64_t v97 = a6;
  uint64_t v94 = a3;
  uint64_t v82 = a2;
  uint64_t v80 = a1;
  uint64_t v92 = a37;
  uint64_t v98 = a36;
  uint64_t v77 = a35;
  uint64_t v79 = a33;
  uint64_t v76 = a34;
  uint64_t v75 = a32;
  uint64_t v74 = a31;
  uint64_t v91 = a30;
  uint64_t v73 = a29;
  uint64_t v78 = a27;
  uint64_t v90 = a28;
  uint64_t v95 = a26;
  uint64_t v72 = a25;
  uint64_t v93 = a22;
  uint64_t v89 = a21;
  uint64_t v86 = a19;
  uint64_t v85 = a18;
  uint64_t v88 = a17;
  uint64_t v87 = a16;
  uint64_t v81 = a15;
  uint64_t v136 = a2;
  uint64_t v137 = a4;
  uint64_t v138 = a8;
  uint64_t v139 = a11;
  uint64_t v67 = a11;
  uint64_t v68 = a12;
  uint64_t v140 = a12;
  uint64_t v141 = a13;
  uint64_t v69 = a13;
  uint64_t v142 = a15;
  uint64_t v143 = a16;
  uint64_t v144 = a17;
  uint64_t v145 = a18;
  uint64_t v146 = a19;
  uint64_t v147 = a21;
  uint64_t v148 = a25;
  uint64_t v149 = a28;
  uint64_t v150 = a29;
  uint64_t v151 = a30;
  uint64_t v152 = a31;
  uint64_t v153 = a32;
  uint64_t v154 = a34;
  uint64_t v155 = a35;
  uint64_t v156 = a36;
  uint64_t v157 = a37;
  uint64_t v70 = a20;
  uint64_t v65 = a14;
  uint64_t v71 = a24;
  uint64_t v66 = a23;
  uint64_t v64 = a10;
  uint64_t v63 = a9;
  uint64_t v37 = type metadata accessor for CanvasAction(0, (uint64_t)&v136);
  uint64_t v61 = *(void *)(v37 - 8);
  uint64_t v62 = v37;
  MEMORY[0x270FA5388](v37);
  uint64_t v60 = (uint64_t *)((char *)&v58 - v38);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
  MEMORY[0x270FA5388](v39 - 8);
  uint64_t v59 = (uint64_t)&v58 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v136 = v82;
  uint64_t v137 = v94;
  uint64_t v138 = v83;
  uint64_t v139 = v96;
  uint64_t v140 = v97;
  uint64_t v141 = v99;
  uint64_t v142 = v84;
  uint64_t v143 = a9;
  uint64_t v144 = a10;
  uint64_t v145 = a11;
  uint64_t v146 = a12;
  uint64_t v147 = a13;
  uint64_t v148 = a14;
  uint64_t v149 = v81;
  uint64_t v150 = v87;
  uint64_t v151 = v88;
  uint64_t v152 = v85;
  uint64_t v153 = v86;
  uint64_t v154 = a20;
  uint64_t v155 = v89;
  uint64_t v156 = v93;
  uint64_t v157 = a23;
  uint64_t v158 = a24;
  uint64_t v42 = v72;
  uint64_t v41 = v73;
  uint64_t v159 = v72;
  uint64_t v160 = v95;
  uint64_t v43 = v78;
  uint64_t v44 = v79;
  uint64_t v161 = v78;
  uint64_t v162 = v90;
  uint64_t v163 = v73;
  uint64_t v164 = v91;
  uint64_t v46 = v74;
  uint64_t v45 = v75;
  uint64_t v165 = v74;
  uint64_t v166 = v75;
  uint64_t v167 = v79;
  uint64_t v48 = v76;
  uint64_t v47 = v77;
  uint64_t v168 = v76;
  uint64_t v169 = v77;
  uint64_t v170 = v98;
  uint64_t v171 = v92;
  uint64_t v58 = type metadata accessor for CanvasView(0, (uint64_t)&v136);
  sub_24EC5BB28(v58);
  uint64_t v100 = v82;
  uint64_t v101 = v94;
  uint64_t v102 = v83;
  uint64_t v103 = v96;
  uint64_t v104 = v97;
  uint64_t v105 = v99;
  uint64_t v106 = v84;
  uint64_t v107 = v63;
  uint64_t v108 = v64;
  uint64_t v109 = v67;
  uint64_t v110 = v68;
  uint64_t v111 = v69;
  uint64_t v112 = v65;
  uint64_t v113 = v81;
  uint64_t v114 = v87;
  uint64_t v115 = v88;
  uint64_t v116 = v85;
  uint64_t v117 = v86;
  uint64_t v118 = v70;
  uint64_t v119 = v89;
  uint64_t v120 = v93;
  uint64_t v121 = v66;
  uint64_t v122 = v71;
  uint64_t v123 = v42;
  uint64_t v124 = v95;
  uint64_t v125 = v43;
  uint64_t v126 = v90;
  uint64_t v127 = v41;
  uint64_t v128 = v91;
  uint64_t v129 = v46;
  uint64_t v130 = v45;
  uint64_t v131 = v44;
  uint64_t v132 = v48;
  uint64_t v133 = v47;
  uint64_t v134 = v98;
  uint64_t v135 = v92;
  swift_getKeyPath();
  sub_24EC77E40();
  swift_release();
  uint64_t result = swift_release();
  uint64_t v50 = v137;
  if (v137)
  {
    uint64_t v51 = v136;
    uint64_t v53 = v58;
    uint64_t v52 = v59;
    sub_24EC684E8(v80 + *(int *)(v58 + 340), v59);
    uint64_t v54 = sub_24EC77CE0();
    uint64_t v55 = *(void *)(v54 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v52, 1, v54) == 1)
    {
      sub_24EC68EA0(v52, &qword_26B1D9D00);
    }
    else
    {
      uint64_t v136 = v51;
      uint64_t v137 = v50;
      sub_24EC77CD0();
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v52, v54);
    }
    sub_24EC5BB28(v53);
    unint64_t v56 = v60;
    *uint64_t v60 = v51;
    v56[1] = v50;
    uint64_t v57 = v62;
    swift_storeEnumTagMultiPayload();
    sub_24EC77E50();
    swift_release();
    return (*(uint64_t (**)(void *, uint64_t))(v61 + 8))(v56, v57);
  }
  return result;
}

uint64_t CanvasView.body.getter@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v100 = a2;
  uint64_t v97 = *(a1 - 1);
  uint64_t v98 = *(void *)(v97 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v96 = (char *)v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v4[17];
  uint64_t v109 = v4[16];
  unint64_t v6 = v4[36];
  uint64_t v140 = v4[35];
  uint64_t v138 = v5;
  unint64_t v139 = v6;
  uint64_t v225 = v109;
  uint64_t v226 = v5;
  uint64_t v227 = v140;
  unint64_t v228 = v6;
  uint64_t v103 = sub_24EC77BC0();
  uint64_t v99 = *(void *)(v103 - 8);
  MEMORY[0x270FA5388](v103);
  uint64_t v108 = (char *)v86 - v7;
  uint64_t v101 = (char *)__swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D20);
  uint64_t v8 = a1[4];
  uint64_t v133 = a1[5];
  uint64_t v134 = v8;
  unint64_t v9 = a1[6];
  uint64_t v131 = a1[7];
  unint64_t v132 = v9;
  unint64_t v10 = a1[8];
  uint64_t v129 = a1[9];
  unint64_t v130 = v10;
  uint64_t v11 = a1[2];
  uint64_t v110 = a1[3];
  uint64_t v12 = a1[11];
  uint64_t v128 = a1[10];
  uint64_t v13 = a1[13];
  uint64_t v118 = a1[12];
  uint64_t v119 = v12;
  uint64_t v14 = a1[15];
  uint64_t v116 = a1[14];
  uint64_t v117 = v13;
  uint64_t v114 = v11;
  uint64_t v115 = v14;
  uint64_t v15 = a1[18];
  uint64_t v125 = a1[19];
  uint64_t v126 = v15;
  uint64_t v16 = a1[22];
  uint64_t v112 = a1[23];
  uint64_t v17 = a1[25];
  uint64_t v105 = a1[24];
  uint64_t v106 = v16;
  uint64_t v18 = a1[27];
  uint64_t v136 = a1[26];
  uint64_t v137 = v17;
  uint64_t v135 = v18;
  uint64_t v19 = a1[20];
  uint64_t v102 = a1[21];
  uint64_t v111 = v19;
  uint64_t v20 = a1[28];
  uint64_t v123 = a1[29];
  uint64_t v124 = v20;
  uint64_t v21 = a1[30];
  uint64_t v121 = a1[31];
  uint64_t v122 = v21;
  uint64_t v22 = a1[33];
  uint64_t v120 = a1[32];
  uint64_t v127 = v22;
  uint64_t v225 = v11;
  uint64_t v226 = v8;
  uint64_t v227 = v133;
  unint64_t v228 = v9;
  uint64_t v229 = v131;
  unint64_t v230 = v10;
  uint64_t v231 = v129;
  uint64_t v232 = v128;
  uint64_t v233 = v110;
  uint64_t v234 = v12;
  uint64_t v235 = v118;
  uint64_t v236 = v13;
  uint64_t v237 = v116;
  uint64_t v238 = v14;
  uint64_t v239 = v138;
  uint64_t v240 = v109;
  uint64_t v241 = v15;
  uint64_t v242 = v125;
  uint64_t v243 = v102;
  uint64_t v244 = v16;
  uint64_t v245 = v112;
  uint64_t v246 = v105;
  uint64_t v247 = v17;
  uint64_t v248 = v136;
  uint64_t v249 = v18;
  uint64_t v250 = v111;
  uint64_t v251 = v20;
  uint64_t v252 = v123;
  uint64_t v253 = v21;
  uint64_t v254 = v121;
  uint64_t v255 = v120;
  uint64_t v256 = v22;
  uint64_t v113 = a1[34];
  uint64_t v257 = v113;
  unint64_t v258 = v139;
  uint64_t v104 = a1[37];
  uint64_t v259 = v140;
  uint64_t v260 = v104;
  uint64_t v23 = sub_24EC77AF0();
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D30);
  uint64_t WitnessTable = swift_getWitnessTable();
  unint64_t v26 = sub_24EC61AC4();
  uint64_t v225 = v23;
  uint64_t v226 = v24;
  uint64_t v227 = WitnessTable;
  unint64_t v228 = v26;
  swift_getOpaqueTypeMetadata2();
  sub_24EC77CC0();
  sub_24EC77D10();
  uint64_t v101 = (char *)sub_24EC77D10();
  uint64_t v27 = sub_24EC77CC0();
  unint64_t v95 = sub_24EC61B30();
  uint64_t v225 = v23;
  uint64_t v226 = v24;
  uint64_t v227 = WitnessTable;
  unint64_t v228 = v26;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v29 = MEMORY[0x263F1A240];
  uint64_t v223 = OpaqueTypeConformance2;
  uint64_t v224 = MEMORY[0x263F1A240];
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v221 = MEMORY[0x263F1B428];
  uint64_t v222 = v30;
  uint64_t v31 = swift_getWitnessTable();
  unint64_t v219 = v95;
  uint64_t v220 = v31;
  uint64_t v217 = swift_getWitnessTable();
  uint64_t v218 = v29;
  uint64_t v32 = swift_getWitnessTable();
  uint64_t v225 = v27;
  uint64_t v33 = v109;
  uint64_t v226 = v109;
  uint64_t v34 = v138;
  uint64_t v227 = v138;
  unint64_t v228 = v32;
  uint64_t v229 = v140;
  unint64_t v230 = v139;
  sub_24EC77AD0();
  v86[1] = sub_24EC77D10();
  uint64_t v35 = sub_24EC77DB0();
  unint64_t v95 = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  uint64_t v101 = (char *)v86 - v36;
  uint64_t v37 = swift_getWitnessTable();
  uint64_t v215 = v32;
  uint64_t v216 = v37;
  uint64_t v87 = swift_getWitnessTable();
  uint64_t v214 = v87;
  uint64_t v38 = v35;
  uint64_t v90 = v35;
  uint64_t v39 = swift_getWitnessTable();
  uint64_t v92 = v39;
  uint64_t v40 = v103;
  uint64_t v91 = swift_getWitnessTable();
  uint64_t v225 = v38;
  uint64_t v226 = v40;
  uint64_t v227 = v39;
  unint64_t v228 = v91;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v93 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v94 = OpaqueTypeMetadata2;
  MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  uint64_t v88 = (char *)v86 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v43);
  uint64_t v89 = (char *)v86 - v44;
  uint64_t v177 = v114;
  uint64_t v45 = v110;
  uint64_t v178 = v110;
  uint64_t v179 = v134;
  uint64_t v180 = v133;
  unint64_t v181 = v132;
  uint64_t v182 = v131;
  unint64_t v183 = v130;
  uint64_t v184 = v129;
  uint64_t v185 = v128;
  uint64_t v186 = v119;
  uint64_t v187 = v118;
  uint64_t v188 = v117;
  uint64_t v189 = v116;
  uint64_t v190 = v115;
  uint64_t v46 = v33;
  uint64_t v191 = v33;
  uint64_t v192 = v34;
  uint64_t v193 = v126;
  uint64_t v194 = v125;
  uint64_t v47 = v111;
  uint64_t v195 = v111;
  uint64_t v48 = v102;
  uint64_t v196 = v102;
  uint64_t v197 = v106;
  uint64_t v198 = v112;
  uint64_t v199 = v105;
  uint64_t v200 = v137;
  uint64_t v201 = v136;
  uint64_t v202 = v135;
  uint64_t v203 = v124;
  uint64_t v204 = v123;
  uint64_t v205 = v122;
  uint64_t v206 = v121;
  uint64_t v207 = v120;
  uint64_t v208 = v127;
  uint64_t v209 = v113;
  unint64_t v49 = v139;
  uint64_t v50 = v140;
  uint64_t v210 = v140;
  unint64_t v211 = v139;
  uint64_t v212 = v104;
  uint64_t v213 = v107;
  sub_24EC77DA0();
  sub_24EC5BB28((uint64_t)a1);
  uint64_t v141 = v114;
  uint64_t v142 = v45;
  uint64_t v143 = v134;
  uint64_t v144 = v133;
  unint64_t v145 = v132;
  uint64_t v146 = v131;
  unint64_t v147 = v130;
  uint64_t v148 = v129;
  uint64_t v149 = v128;
  uint64_t v150 = v119;
  uint64_t v151 = v118;
  uint64_t v152 = v117;
  uint64_t v153 = v116;
  uint64_t v154 = v115;
  uint64_t v155 = v46;
  uint64_t v156 = v138;
  uint64_t v157 = v126;
  uint64_t v158 = v125;
  uint64_t v159 = v47;
  uint64_t v160 = v48;
  uint64_t v52 = v105;
  uint64_t v51 = v106;
  uint64_t v161 = v106;
  uint64_t v53 = v112;
  uint64_t v162 = v112;
  uint64_t v163 = v105;
  uint64_t v164 = v137;
  uint64_t v165 = v136;
  uint64_t v166 = v135;
  uint64_t v167 = v124;
  uint64_t v168 = v123;
  uint64_t v169 = v122;
  uint64_t v170 = v121;
  uint64_t v171 = v120;
  uint64_t v172 = v127;
  uint64_t v173 = v113;
  uint64_t v174 = v50;
  unint64_t v175 = v49;
  uint64_t v54 = v104;
  uint64_t v176 = v104;
  swift_getKeyPath();
  sub_24EC77E40();
  swift_release();
  swift_release();
  unint64_t v56 = v96;
  uint64_t v55 = v97;
  (*(void (**)(char *, uint64_t, void *))(v97 + 16))(v96, v107, a1);
  unint64_t v57 = (*(unsigned __int8 *)(v55 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
  uint64_t v58 = (char *)swift_allocObject();
  uint64_t v59 = v110;
  *((void *)v58 + 2) = v114;
  *((void *)v58 + 3) = v59;
  uint64_t v60 = v133;
  *((void *)v58 + 4) = v134;
  *((void *)v58 + 5) = v60;
  uint64_t v61 = v131;
  *((void *)v58 + 6) = v132;
  *((void *)v58 + 7) = v61;
  uint64_t v62 = v129;
  *((void *)v58 + 8) = v130;
  *((void *)v58 + 9) = v62;
  uint64_t v63 = v119;
  *((void *)v58 + 10) = v128;
  *((void *)v58 + 11) = v63;
  uint64_t v64 = v117;
  *((void *)v58 + 12) = v118;
  *((void *)v58 + 13) = v64;
  uint64_t v65 = v115;
  *((void *)v58 + 14) = v116;
  *((void *)v58 + 15) = v65;
  uint64_t v66 = v138;
  *((void *)v58 + 16) = v109;
  *((void *)v58 + 17) = v66;
  uint64_t v67 = v125;
  *((void *)v58 + 18) = v126;
  *((void *)v58 + 19) = v67;
  uint64_t v68 = v102;
  *((void *)v58 + 20) = v111;
  *((void *)v58 + 21) = v68;
  *((void *)v58 + 22) = v51;
  *((void *)v58 + 23) = v53;
  uint64_t v69 = v137;
  *((void *)v58 + 24) = v52;
  *((void *)v58 + 25) = v69;
  uint64_t v70 = v135;
  *((void *)v58 + 26) = v136;
  *((void *)v58 + 27) = v70;
  uint64_t v71 = v123;
  *((void *)v58 + 28) = v124;
  *((void *)v58 + 29) = v71;
  uint64_t v72 = v121;
  *((void *)v58 + 30) = v122;
  *((void *)v58 + 31) = v72;
  uint64_t v73 = v127;
  *((void *)v58 + 32) = v120;
  *((void *)v58 + 33) = v73;
  uint64_t v74 = v140;
  *((void *)v58 + 34) = v113;
  *((void *)v58 + 35) = v74;
  *((void *)v58 + 36) = v139;
  *((void *)v58 + 37) = v54;
  (*(void (**)(char *, char *, void *))(v55 + 32))(&v58[v57], v56, a1);
  uint64_t v75 = v88;
  uint64_t v76 = v108;
  uint64_t v77 = v90;
  uint64_t v78 = v103;
  uint64_t v79 = v101;
  sub_24EC77D60();
  swift_release();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v76, v78);
  (*(void (**)(char *, uint64_t))(v95 + 8))(v79, v77);
  uint64_t v81 = v93;
  uint64_t v80 = v94;
  uint64_t v82 = *(void (**)(char *, char *, uint64_t))(v93 + 16);
  uint64_t v83 = v89;
  v82(v89, v75, v94);
  uint64_t v84 = *(void (**)(char *, uint64_t))(v81 + 8);
  v84(v75, v80);
  v82(v100, v83, v80);
  return ((uint64_t (*)(char *, uint64_t))v84)(v83, v80);
}

unint64_t sub_24EC61AC4()
{
  unint64_t result = qword_26B1D9D38;
  if (!qword_26B1D9D38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1D9D38);
  }
  return result;
}

unint64_t sub_24EC61B30()
{
  unint64_t result = qword_26B1D9D18;
  if (!qword_26B1D9D18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D20);
    sub_24EC67840(&qword_26B1D9CE8, MEMORY[0x263F3E160]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1D9D18);
  }
  return result;
}

uint64_t sub_24EC61BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, char *a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>, char *a10, char *a11, char *a12, char *a13, char *a14, char *a15, char *a16, long long a17, char *a18, char *a19, char *a20,char *a21,char *a22,char *a23,char *a24,char *a25,char *a26,char *a27,char *a28,char *a29,char *a30,char *a31,char *a32,char *a33,char *a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v184 = a8;
  uint64_t v185 = a4;
  uint64_t v195 = a7;
  uint64_t v193 = a6;
  uint64_t v191 = a5;
  *(void *)&long long v183 = a2;
  *((void *)&v183 + 1) = a3;
  uint64_t v171 = a9;
  uint64_t v172 = a1;
  uint64_t v206 = a37;
  uint64_t v207 = a36;
  uint64_t v208 = a35;
  uint64_t v205 = a34;
  uint64_t v204 = a33;
  uint64_t v203 = a32;
  uint64_t v202 = a31;
  uint64_t v201 = a30;
  uint64_t v200 = a29;
  uint64_t v199 = a28;
  uint64_t v198 = a27;
  uint64_t v197 = a26;
  uint64_t v196 = a25;
  uint64_t v194 = a24;
  uint64_t v192 = a23;
  uint64_t v190 = a22;
  uint64_t v189 = a21;
  uint64_t v188 = a20;
  uint64_t v187 = a19;
  uint64_t v186 = a18;
  long long v182 = a17;
  unint64_t v181 = a16;
  uint64_t v180 = a15;
  uint64_t v179 = a14;
  uint64_t v178 = a13;
  uint64_t v177 = a12;
  uint64_t v176 = a11;
  unint64_t v175 = a10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D20);
  uint64_t v217 = a10;
  uint64_t v218 = a11;
  unint64_t v219 = (char *)*((void *)&v183 + 1);
  uint64_t v220 = a12;
  uint64_t v221 = a13;
  uint64_t v222 = a14;
  uint64_t v223 = a15;
  uint64_t v224 = a16;
  *(void *)&long long v225 = *((void *)&a17 + 1);
  *((void *)&v225 + 1) = a17;
  uint64_t v226 = a18;
  uint64_t v227 = a19;
  unint64_t v228 = a21;
  uint64_t v229 = a22;
  unint64_t v230 = a23;
  uint64_t v231 = a24;
  uint64_t v232 = a25;
  uint64_t v233 = a26;
  uint64_t v234 = a27;
  uint64_t v235 = a20;
  uint64_t v236 = a28;
  uint64_t v237 = a29;
  uint64_t v238 = a30;
  uint64_t v239 = a31;
  uint64_t v240 = a32;
  uint64_t v241 = a33;
  uint64_t v242 = a34;
  uint64_t v243 = a36;
  uint64_t v244 = a35;
  uint64_t v245 = a37;
  sub_24EC77AF0();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D30);
  swift_getWitnessTable();
  sub_24EC61AC4();
  swift_getOpaqueTypeMetadata2();
  sub_24EC77CC0();
  sub_24EC77D10();
  uint64_t v37 = sub_24EC77D10();
  uint64_t v174 = sub_24EC77CC0();
  unint64_t v38 = sub_24EC61B30();
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v40 = MEMORY[0x263F1A240];
  v212[11] = OpaqueTypeConformance2;
  v212[12] = MEMORY[0x263F1A240];
  uint64_t WitnessTable = swift_getWitnessTable();
  v212[9] = MEMORY[0x263F1B428];
  v212[10] = WitnessTable;
  v212[7] = v38;
  v212[8] = swift_getWitnessTable();
  uint64_t v160 = swift_getWitnessTable();
  v212[5] = v160;
  v212[6] = v40;
  uint64_t v42 = v174;
  *(void *)uint64_t v213 = v174;
  *(_OWORD *)&v213[8] = a17;
  uint64_t v170 = swift_getWitnessTable();
  uint64_t v214 = v170;
  uint64_t v215 = a35;
  uint64_t v216 = (char *)a36;
  uint64_t v43 = sub_24EC77AD0();
  uint64_t v163 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v162 = (char *)&v154 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v45);
  uint64_t v164 = (char *)&v154 - v46;
  *(_OWORD *)uint64_t v213 = v183;
  *(void *)&v213[16] = v185;
  uint64_t v214 = v191;
  uint64_t v215 = (uint64_t)v193;
  uint64_t v216 = v195;
  uint64_t v217 = v184;
  uint64_t v218 = v175;
  unint64_t v219 = v176;
  uint64_t v220 = v177;
  uint64_t v221 = v178;
  uint64_t v222 = v179;
  uint64_t v223 = v180;
  uint64_t v224 = v181;
  long long v225 = a17;
  uint64_t v226 = v186;
  uint64_t v227 = v187;
  unint64_t v228 = v188;
  uint64_t v229 = v189;
  unint64_t v230 = v190;
  uint64_t v231 = v192;
  uint64_t v232 = v194;
  uint64_t v233 = v196;
  uint64_t v234 = v197;
  uint64_t v235 = v198;
  uint64_t v236 = v199;
  uint64_t v237 = v200;
  uint64_t v238 = v201;
  uint64_t v239 = v202;
  uint64_t v240 = v203;
  uint64_t v241 = v204;
  uint64_t v242 = v205;
  uint64_t v243 = a35;
  uint64_t v244 = a36;
  uint64_t v245 = v206;
  uint64_t v47 = type metadata accessor for CanvasView(0, (uint64_t)v213);
  uint64_t v165 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v173 = (char *)&v154 - v48;
  *(_OWORD *)uint64_t v213 = a17;
  *(void *)&v213[16] = a35;
  uint64_t v214 = a36;
  uint64_t v49 = sub_24EC77BC0();
  uint64_t v155 = *(void *)(v49 - 8);
  uint64_t v156 = v49;
  MEMORY[0x270FA5388](v49);
  uint64_t v51 = (char *)&v154 - v50;
  uint64_t v161 = v37;
  uint64_t v157 = *(void *)(v37 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v54 = (char *)&v154 - v53;
  uint64_t v159 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v55);
  unint64_t v57 = (char *)&v154 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v58);
  uint64_t v158 = (char *)&v154 - v59;
  uint64_t v166 = v43;
  uint64_t v60 = sub_24EC77D10();
  uint64_t v168 = *(void *)(v60 - 8);
  uint64_t v169 = v60;
  MEMORY[0x270FA5388](v60);
  uint64_t v167 = (char *)&v154 - v61;
  uint64_t v62 = v172;
  sub_24EC5BAD0(v47);
  if (v214)
  {
    sub_24EC67314((long long *)v213, (uint64_t)v212);
    sub_24EC6732C((uint64_t)v212, (uint64_t)&v211);
    uint64_t v63 = (uint64_t)v162;
    uint64_t v64 = v165;
    (*(void (**)(char *, uint64_t, uint64_t))(v165 + 16))(v173, v62, v47);
    unint64_t v65 = (*(unsigned __int8 *)(v64 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
    uint64_t v66 = (char *)swift_allocObject();
    uint64_t v67 = *((void *)&v183 + 1);
    *((void *)v66 + 2) = v183;
    *((void *)v66 + 3) = v67;
    uint64_t v68 = v191;
    *((void *)v66 + 4) = v185;
    *((void *)v66 + 5) = v68;
    uint64_t v69 = v195;
    *((void *)v66 + 6) = v193;
    *((void *)v66 + 7) = v69;
    uint64_t v70 = v175;
    *((void *)v66 + 8) = v184;
    *((void *)v66 + 9) = v70;
    uint64_t v71 = v177;
    *((void *)v66 + 10) = v176;
    *((void *)v66 + 11) = v71;
    uint64_t v72 = v179;
    *((void *)v66 + 12) = v178;
    *((void *)v66 + 13) = v72;
    uint64_t v73 = v181;
    uint64_t v74 = v182;
    *((void *)v66 + 14) = v180;
    *((void *)v66 + 15) = v73;
    uint64_t v75 = *((void *)&v182 + 1);
    *((void *)v66 + 16) = v74;
    *((void *)v66 + 17) = v75;
    uint64_t v76 = v187;
    *((void *)v66 + 18) = v186;
    *((void *)v66 + 19) = v76;
    uint64_t v77 = v189;
    *((void *)v66 + 20) = v188;
    *((void *)v66 + 21) = v77;
    uint64_t v78 = v192;
    *((void *)v66 + 22) = v190;
    *((void *)v66 + 23) = v78;
    uint64_t v79 = v196;
    *((void *)v66 + 24) = v194;
    *((void *)v66 + 25) = v79;
    uint64_t v80 = v198;
    *((void *)v66 + 26) = v197;
    *((void *)v66 + 27) = v80;
    uint64_t v81 = v200;
    *((void *)v66 + 28) = v199;
    *((void *)v66 + 29) = v81;
    uint64_t v82 = v202;
    *((void *)v66 + 30) = v201;
    *((void *)v66 + 31) = v82;
    uint64_t v83 = v204;
    *((void *)v66 + 32) = v203;
    *((void *)v66 + 33) = v83;
    uint64_t v85 = v207;
    uint64_t v84 = v208;
    *((void *)v66 + 34) = v205;
    *((void *)v66 + 35) = v84;
    uint64_t v86 = v206;
    *((void *)v66 + 36) = v85;
    *((void *)v66 + 37) = v86;
    (*(void (**)(char *, char *, uint64_t))(v64 + 32))(&v66[v65], v173, v47);
    uint64_t v152 = v85;
    uint64_t v87 = v174;
    uint64_t v88 = v170;
    sub_24EC77AC0();
    uint64_t v89 = v166;
    uint64_t v208 = swift_getWitnessTable();
    uint64_t v90 = v163;
    uint64_t v91 = v164;
    uint64_t v92 = *(void (**)(char *, uint64_t, uint64_t))(v163 + 16);
    v92(v164, v63, v89);
    uint64_t v93 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
    v93(v63, v89);
    v92((char *)v63, (uint64_t)v91, v89);
    uint64_t v94 = v167;
    sub_24EC5EB9C(v63, v87, v89);
    v93(v63, v89);
    v93((uint64_t)v91, v89);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v212);
  }
  else
  {
    uint64_t v95 = v47;
    uint64_t v96 = sub_24EC5BB28(v47);
    uint64_t v164 = (char *)&v154;
    MEMORY[0x270FA5388](v96);
    uint64_t v97 = &v154 - 36;
    uint64_t v98 = v195;
    *(&v154 - 32) = v193;
    *(&v154 - 31) = v98;
    uint64_t v99 = v175;
    *(&v154 - 30) = v184;
    *(&v154 - 29) = v99;
    uint64_t v100 = v177;
    *(&v154 - 28) = v176;
    *(&v154 - 27) = v100;
    uint64_t v101 = v179;
    *(&v154 - 26) = v178;
    *(&v154 - 25) = v101;
    uint64_t v102 = v181;
    *(&v154 - 24) = v180;
    *(&v154 - 23) = v102;
    uint64_t v103 = (char *)*((void *)&v182 + 1);
    *(&v154 - 22) = (char *)v182;
    *(&v154 - 21) = v103;
    uint64_t v104 = v187;
    *(&v154 - 20) = v186;
    *(&v154 - 19) = v104;
    uint64_t v105 = v189;
    *(&v154 - 18) = v188;
    *(&v154 - 17) = v105;
    uint64_t v106 = v192;
    *(&v154 - 16) = v190;
    *(&v154 - 15) = v106;
    uint64_t v107 = v196;
    *(&v154 - 14) = v194;
    *(&v154 - 13) = v107;
    uint64_t v108 = v198;
    *(&v154 - 12) = v197;
    *(&v154 - 11) = v108;
    uint64_t v109 = v200;
    *(&v154 - 10) = v199;
    *(&v154 - 9) = v109;
    uint64_t v110 = v202;
    *(&v154 - 8) = v201;
    *(&v154 - 7) = v110;
    uint64_t v111 = v204;
    *(&v154 - 6) = v203;
    *(&v154 - 5) = v111;
    uint64_t v112 = v208;
    *(&v154 - 4) = v205;
    *(&v154 - 3) = (char *)v112;
    uint64_t v152 = v207;
    uint64_t v153 = v206;
    uint64_t v113 = (uint64_t)v54;
    uint64_t v154 = v54;
    uint64_t v115 = (char *)*((void *)&v183 + 1);
    unint64_t v114 = v183;
    *uint64_t v97 = (char *)v183;
    v97[1] = v115;
    uint64_t v116 = (char *)v191;
    v97[2] = v185;
    v97[3] = v116;
    swift_getKeyPath();
    sub_24EC77E40();
    swift_release();
    swift_release();
    uint64_t v117 = v172;
    sub_24EC5C614((uint64_t)v51, v95, v113);
    (*(void (**)(char *, uint64_t))(v155 + 8))(v51, v156);
    uint64_t v118 = v165;
    uint64_t v119 = v173;
    (*(void (**)(char *, uint64_t, uint64_t))(v165 + 16))(v173, v117, v95);
    unint64_t v120 = (*(unsigned __int8 *)(v118 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80);
    uint64_t v121 = swift_allocObject();
    *(_OWORD *)(v121 + 16) = __PAIR128__((unint64_t)v115, v114);
    uint64_t v122 = v191;
    *(void *)(v121 + 32) = v185;
    *(void *)(v121 + 40) = v122;
    uint64_t v123 = v195;
    *(void *)(v121 + 48) = v193;
    *(void *)(v121 + 56) = v123;
    uint64_t v124 = v175;
    *(void *)(v121 + 64) = v184;
    *(void *)(v121 + 72) = v124;
    uint64_t v125 = v177;
    *(void *)(v121 + 80) = v176;
    *(void *)(v121 + 88) = v125;
    uint64_t v126 = v179;
    *(void *)(v121 + 96) = v178;
    *(void *)(v121 + 104) = v126;
    uint64_t v127 = v181;
    *(void *)(v121 + 112) = v180;
    *(void *)(v121 + 120) = v127;
    uint64_t v128 = *((void *)&v182 + 1);
    *(void *)(v121 + 128) = v182;
    *(void *)(v121 + 136) = v128;
    uint64_t v129 = v187;
    *(void *)(v121 + 144) = v186;
    *(void *)(v121 + 152) = v129;
    unint64_t v130 = v189;
    *(void *)(v121 + 160) = v188;
    *(void *)(v121 + 168) = v130;
    uint64_t v131 = v192;
    *(void *)(v121 + 176) = v190;
    *(void *)(v121 + 184) = v131;
    unint64_t v132 = v196;
    *(void *)(v121 + 192) = v194;
    *(void *)(v121 + 200) = v132;
    uint64_t v133 = v198;
    *(void *)(v121 + 208) = v197;
    *(void *)(v121 + 216) = v133;
    uint64_t v134 = v200;
    *(void *)(v121 + 224) = v199;
    *(void *)(v121 + 232) = v134;
    uint64_t v135 = v202;
    *(void *)(v121 + 240) = v201;
    *(void *)(v121 + 248) = v135;
    uint64_t v136 = v204;
    *(void *)(v121 + 256) = v203;
    *(void *)(v121 + 264) = v136;
    uint64_t v137 = v208;
    *(void *)(v121 + 272) = v205;
    *(void *)(v121 + 280) = v137;
    uint64_t v138 = v206;
    *(void *)(v121 + 288) = v207;
    *(void *)(v121 + 296) = v138;
    (*(void (**)(unint64_t, char *, uint64_t))(v118 + 32))(v121 + v120, v119, v95);
    uint64_t v139 = v161;
    uint64_t v140 = v154;
    sub_24EC77D50();
    swift_release();
    (*(void (**)(char *, uint64_t))(v157 + 8))(v140, v139);
    uint64_t v142 = v158;
    uint64_t v141 = v159;
    uint64_t v143 = *(void (**)(char *, char *, uint64_t))(v159 + 16);
    uint64_t v144 = v174;
    v143(v158, v57, v174);
    unint64_t v145 = *(void (**)(char *, uint64_t))(v141 + 8);
    v145(v57, v144);
    v143(v57, v142, v144);
    swift_getWitnessTable();
    uint64_t v146 = v167;
    uint64_t v88 = v170;
    sub_24EC5EAA4((uint64_t)v57, v144);
    unint64_t v147 = v57;
    uint64_t v94 = v146;
    v145(v147, v144);
    v145(v142, v144);
  }
  uint64_t v148 = swift_getWitnessTable();
  uint64_t v209 = v88;
  uint64_t v210 = v148;
  uint64_t v149 = v169;
  swift_getWitnessTable();
  uint64_t v150 = v168;
  (*(void (**)(uint64_t, char *, uint64_t))(v168 + 16))(v171, v94, v149);
  return (*(uint64_t (**)(char *, uint64_t))(v150 + 8))(v94, v149);
}

uint64_t sub_24EC62AF8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = v1 + 16;
  long long v7 = *(_OWORD *)(v4 + 248);
  long long v8 = *(_OWORD *)(v4 + 264);
  *(_OWORD *)&v6[16] = *(_OWORD *)(v4 + 120);
  *(_OWORD *)unint64_t v6 = *(_OWORD *)(v4 + 104);
  return sub_24EC61BDC(*(void *)(v4 + 288), v2, v3, *(char **)(v4 + 16), *(void *)(v4 + 24), *(char **)(v4 + 32), *(char **)(v4 + 40), *(char **)(v4 + 48), a1, *(char **)(v4 + 56), *(char **)(v4 + 64), *(char **)(v4 + 72), *(char **)(v4 + 80), *(char **)(v4 + 88), *(char **)(v4 + 96), *(char **)(v4 + 104), *(long long *)&v6[8], *(char **)(v4 + 128), *(char **)(v4 + 136),
           *(char **)(v4 + 144),
           *(char **)(v4 + 152),
           *(char **)(v4 + 160),
           *(char **)(v4 + 168),
           *(char **)(v4 + 176),
           *(char **)(v4 + 184),
           *(char **)(v4 + 192),
           *(char **)(v4 + 200),
           *(char **)(v4 + 208),
           *(char **)(v4 + 216),
           *(char **)(v4 + 224),
           *(char **)(v4 + 232),
           *(char **)(v4 + 240),
           (char *)v7,
           *((char **)&v7 + 1),
           v8,
           *((uint64_t *)&v8 + 1),
           *(void *)(v4 + 280));
}

uint64_t sub_24EC62B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v61 = a4;
  uint64_t v62 = a8;
  uint64_t v81 = a7;
  uint64_t v69 = a6;
  uint64_t v70 = a5;
  uint64_t v71 = a3;
  uint64_t v60 = a2;
  uint64_t v56 = a1;
  uint64_t v79 = a37;
  uint64_t v75 = a36;
  uint64_t v78 = a35;
  uint64_t v82 = a33;
  uint64_t v76 = a34;
  uint64_t v74 = a32;
  uint64_t v52 = a31;
  uint64_t v73 = a30;
  uint64_t v51 = a29;
  uint64_t v54 = a27;
  uint64_t v72 = a28;
  uint64_t v80 = a26;
  uint64_t v68 = a25;
  uint64_t v77 = a22;
  uint64_t v67 = a21;
  uint64_t v65 = a19;
  uint64_t v63 = a18;
  uint64_t v66 = a17;
  uint64_t v64 = a16;
  uint64_t v59 = a12;
  uint64_t v119 = a2;
  uint64_t v120 = a4;
  uint64_t v121 = a8;
  uint64_t v122 = a11;
  uint64_t v123 = a12;
  uint64_t v124 = a13;
  uint64_t v125 = a15;
  uint64_t v126 = a16;
  uint64_t v127 = a17;
  uint64_t v128 = a18;
  uint64_t v129 = a19;
  uint64_t v130 = a21;
  uint64_t v131 = a25;
  uint64_t v132 = a28;
  uint64_t v133 = a29;
  uint64_t v134 = a30;
  uint64_t v135 = a31;
  uint64_t v136 = a32;
  uint64_t v137 = a34;
  uint64_t v138 = a35;
  uint64_t v139 = a36;
  uint64_t v140 = a37;
  uint64_t v49 = a20;
  uint64_t v50 = a24;
  uint64_t v48 = a23;
  uint64_t v47 = a10;
  uint64_t v46 = a9;
  uint64_t v37 = type metadata accessor for CanvasAction(0, (uint64_t)&v119);
  uint64_t v38 = *(void *)(v37 - 8);
  uint64_t v57 = v37;
  uint64_t v58 = v38;
  MEMORY[0x270FA5388](v37);
  uint64_t v55 = (char *)&v45 - v39;
  uint64_t v119 = v60;
  uint64_t v120 = v71;
  uint64_t v121 = v61;
  uint64_t v122 = v70;
  uint64_t v123 = v69;
  uint64_t v124 = v81;
  uint64_t v125 = v62;
  uint64_t v126 = a9;
  uint64_t v127 = a10;
  uint64_t v128 = a11;
  uint64_t v129 = a12;
  uint64_t v130 = a13;
  uint64_t v131 = a14;
  uint64_t v132 = a15;
  uint64_t v133 = a16;
  uint64_t v134 = a17;
  uint64_t v135 = a18;
  uint64_t v136 = a19;
  uint64_t v137 = a20;
  uint64_t v138 = a21;
  uint64_t v139 = a22;
  uint64_t v140 = a23;
  uint64_t v141 = a24;
  uint64_t v142 = a25;
  uint64_t v143 = a26;
  uint64_t v144 = a27;
  uint64_t v145 = a28;
  uint64_t v146 = a29;
  uint64_t v147 = a30;
  uint64_t v148 = a31;
  uint64_t v149 = a32;
  uint64_t v150 = a33;
  uint64_t v151 = a34;
  uint64_t v152 = a35;
  uint64_t v153 = a36;
  uint64_t v154 = a37;
  uint64_t v40 = type metadata accessor for CanvasView(0, (uint64_t)&v119);
  uint64_t v53 = sub_24EC5BB28(v40);
  sub_24EC5BB28(v40);
  uint64_t v83 = v60;
  uint64_t v84 = v71;
  uint64_t v85 = v61;
  uint64_t v86 = v70;
  uint64_t v87 = v69;
  uint64_t v88 = v81;
  uint64_t v89 = v62;
  uint64_t v90 = v46;
  uint64_t v91 = v47;
  uint64_t v92 = a11;
  uint64_t v93 = v59;
  uint64_t v94 = a13;
  uint64_t v95 = a14;
  uint64_t v96 = a15;
  uint64_t v97 = v64;
  uint64_t v98 = v66;
  uint64_t v99 = v63;
  uint64_t v100 = v65;
  uint64_t v101 = v49;
  uint64_t v102 = v67;
  uint64_t v103 = v77;
  uint64_t v104 = v48;
  uint64_t v105 = v50;
  uint64_t v106 = v68;
  uint64_t v107 = v80;
  uint64_t v108 = a27;
  uint64_t v109 = v72;
  uint64_t v110 = a29;
  uint64_t v111 = v73;
  uint64_t v112 = a31;
  uint64_t v113 = v74;
  uint64_t v114 = v82;
  uint64_t v115 = v76;
  uint64_t v116 = v78;
  uint64_t v117 = v75;
  uint64_t v118 = v79;
  swift_getKeyPath();
  uint64_t v41 = v55;
  sub_24EC77E40();
  swift_release();
  swift_release();
  uint64_t v42 = v41;
  uint64_t v43 = v57;
  swift_storeEnumTagMultiPayload();
  sub_24EC77E50();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v42, v43);
}

uint64_t sub_24EC62FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11, unint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,unint64_t a38,uint64_t a39)
{
  uint64_t v140 = a3;
  unint64_t v141 = a8;
  unint64_t v156 = a7;
  uint64_t v146 = a5;
  unint64_t v147 = a6;
  uint64_t v145 = a4;
  uint64_t v118 = a1;
  uint64_t v119 = a2;
  uint64_t v120 = a9;
  uint64_t v122 = a35;
  uint64_t v154 = a34;
  uint64_t v153 = a33;
  uint64_t v152 = a32;
  uint64_t v151 = a31;
  uint64_t v150 = a30;
  uint64_t v149 = a29;
  uint64_t v148 = a28;
  uint64_t v129 = a27;
  uint64_t v128 = a26;
  uint64_t v127 = a25;
  uint64_t v126 = a24;
  uint64_t v125 = a23;
  uint64_t v155 = a22;
  uint64_t v144 = a21;
  uint64_t v143 = a20;
  uint64_t v124 = a39;
  unint64_t v130 = a38;
  uint64_t v123 = a36;
  uint64_t v157 = a37;
  uint64_t v142 = a18;
  uint64_t v166 = a18;
  uint64_t v167 = a19;
  uint64_t v139 = a19;
  uint64_t v168 = a37;
  unint64_t v169 = a38;
  uint64_t v138 = a17;
  uint64_t v137 = a16;
  uint64_t v136 = a15;
  uint64_t v135 = a14;
  uint64_t v134 = a13;
  unint64_t v133 = a12;
  unint64_t v132 = a11;
  unint64_t v131 = a10;
  uint64_t v39 = sub_24EC77BC0();
  uint64_t v115 = *(void *)(v39 - 8);
  uint64_t v116 = v39;
  uint64_t v117 = *(void *)(v115 + 64);
  MEMORY[0x270FA5388](v39);
  uint64_t v114 = (char *)&v97 - v40;
  uint64_t v166 = v140;
  uint64_t v167 = v145;
  uint64_t v168 = v146;
  unint64_t v169 = v147;
  unint64_t v170 = v156;
  unint64_t v171 = v141;
  unint64_t v172 = a10;
  unint64_t v173 = a11;
  uint64_t v174 = a12;
  uint64_t v175 = a13;
  uint64_t v176 = a14;
  uint64_t v177 = a15;
  uint64_t v178 = a16;
  uint64_t v179 = a17;
  uint64_t v180 = a18;
  uint64_t v181 = a19;
  uint64_t v182 = a20;
  uint64_t v183 = a21;
  uint64_t v184 = a22;
  uint64_t v185 = a23;
  uint64_t v186 = a24;
  uint64_t v187 = a25;
  uint64_t v188 = a26;
  uint64_t v189 = a27;
  uint64_t v190 = a28;
  uint64_t v191 = a29;
  uint64_t v192 = a30;
  uint64_t v193 = a31;
  uint64_t v194 = a32;
  uint64_t v195 = a33;
  uint64_t v196 = a34;
  uint64_t v197 = a35;
  uint64_t v198 = a36;
  unint64_t v199 = a37;
  unint64_t v200 = a38;
  uint64_t v201 = a39;
  uint64_t v121 = type metadata accessor for CanvasView(0, (uint64_t)&v166);
  uint64_t v101 = *(void *)(v121 - 8);
  uint64_t v110 = *(void *)(v101 + 64);
  MEMORY[0x270FA5388](v121);
  uint64_t v100 = (char *)&v97 - v41;
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D20);
  uint64_t v166 = v140;
  uint64_t v167 = v146;
  uint64_t v168 = v147;
  unint64_t v169 = v156;
  unint64_t v170 = v141;
  unint64_t v171 = v131;
  unint64_t v172 = v132;
  unint64_t v173 = v133;
  uint64_t v174 = v145;
  uint64_t v175 = v134;
  uint64_t v176 = v135;
  uint64_t v177 = v136;
  uint64_t v178 = v137;
  uint64_t v179 = v138;
  uint64_t v180 = v139;
  uint64_t v181 = v142;
  uint64_t v182 = v143;
  uint64_t v183 = v144;
  uint64_t v184 = a23;
  uint64_t v185 = a24;
  uint64_t v186 = a25;
  uint64_t v187 = a26;
  uint64_t v188 = a27;
  uint64_t v189 = v148;
  uint64_t v190 = v149;
  uint64_t v191 = v155;
  uint64_t v192 = v150;
  uint64_t v193 = v151;
  uint64_t v194 = v152;
  uint64_t v195 = v153;
  uint64_t v196 = v154;
  uint64_t v197 = a35;
  uint64_t v198 = a36;
  unint64_t v199 = a38;
  unint64_t v200 = v157;
  uint64_t v201 = a39;
  uint64_t v42 = sub_24EC77AF0();
  uint64_t v108 = v42;
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D30);
  uint64_t v107 = v43;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v106 = WitnessTable;
  unint64_t v45 = sub_24EC61AC4();
  uint64_t v166 = v42;
  uint64_t v167 = v43;
  uint64_t v168 = WitnessTable;
  unint64_t v169 = v45;
  uint64_t v104 = MEMORY[0x263F1B270];
  unint64_t v105 = v45;
  swift_getOpaqueTypeMetadata2();
  uint64_t v103 = sub_24EC77CC0();
  uint64_t v111 = sub_24EC77D10();
  uint64_t v102 = sub_24EC77D10();
  uint64_t v113 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v47 = (char *)&v97 - v46;
  uint64_t v98 = (char *)&v97 - v46;
  uint64_t v48 = sub_24EC77CC0();
  uint64_t v112 = *(void *)(v48 - 8);
  MEMORY[0x270FA5388](v48);
  uint64_t v99 = (char *)&v97 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v50);
  uint64_t v109 = (char *)&v97 - v51;
  uint64_t v52 = (uint64_t)v47;
  uint64_t v54 = v118;
  uint64_t v53 = v119;
  uint64_t v55 = v121;
  sub_24EC5C614(v118, v121, v52);
  uint64_t v56 = v100;
  uint64_t v57 = v101;
  (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v100, v53, v55);
  uint64_t v59 = v114;
  uint64_t v58 = v115;
  uint64_t v60 = v116;
  (*(void (**)(char *, uint64_t, uint64_t))(v115 + 16))(v114, v54, v116);
  unint64_t v61 = (*(unsigned __int8 *)(v57 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80);
  unint64_t v62 = (v110 + *(unsigned __int8 *)(v58 + 80) + v61) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  uint64_t v63 = (char *)swift_allocObject();
  uint64_t v64 = v145;
  *((void *)v63 + 2) = v140;
  *((void *)v63 + 3) = v64;
  unint64_t v65 = v147;
  *((void *)v63 + 4) = v146;
  *((void *)v63 + 5) = v65;
  unint64_t v66 = v141;
  *((void *)v63 + 6) = v156;
  *((void *)v63 + 7) = v66;
  unint64_t v67 = v132;
  *((void *)v63 + 8) = v131;
  *((void *)v63 + 9) = v67;
  uint64_t v68 = v134;
  *((void *)v63 + 10) = v133;
  *((void *)v63 + 11) = v68;
  uint64_t v69 = v136;
  *((void *)v63 + 12) = v135;
  *((void *)v63 + 13) = v69;
  uint64_t v70 = v138;
  *((void *)v63 + 14) = v137;
  *((void *)v63 + 15) = v70;
  uint64_t v71 = v139;
  *((void *)v63 + 16) = v142;
  *((void *)v63 + 17) = v71;
  uint64_t v72 = v144;
  *((void *)v63 + 18) = v143;
  *((void *)v63 + 19) = v72;
  uint64_t v73 = v125;
  *((void *)v63 + 20) = v155;
  *((void *)v63 + 21) = v73;
  uint64_t v74 = v127;
  *((void *)v63 + 22) = v126;
  *((void *)v63 + 23) = v74;
  uint64_t v75 = v129;
  *((void *)v63 + 24) = v128;
  *((void *)v63 + 25) = v75;
  uint64_t v76 = v149;
  *((void *)v63 + 26) = v148;
  *((void *)v63 + 27) = v76;
  uint64_t v77 = v151;
  *((void *)v63 + 28) = v150;
  *((void *)v63 + 29) = v77;
  uint64_t v78 = v153;
  *((void *)v63 + 30) = v152;
  *((void *)v63 + 31) = v78;
  uint64_t v79 = v121;
  uint64_t v80 = v122;
  *((void *)v63 + 32) = v154;
  *((void *)v63 + 33) = v80;
  uint64_t v81 = v157;
  *((void *)v63 + 34) = v123;
  *((void *)v63 + 35) = v81;
  uint64_t v82 = v124;
  *((void *)v63 + 36) = v130;
  *((void *)v63 + 37) = v82;
  (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v63[v61], v56, v79);
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(&v63[v62], v59, v60);
  unint64_t v83 = sub_24EC61B30();
  uint64_t v166 = v108;
  uint64_t v167 = v107;
  uint64_t v168 = v106;
  unint64_t v169 = v105;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v85 = MEMORY[0x263F1A240];
  uint64_t v164 = OpaqueTypeConformance2;
  uint64_t v165 = MEMORY[0x263F1A240];
  uint64_t v86 = swift_getWitnessTable();
  uint64_t v162 = MEMORY[0x263F1B428];
  uint64_t v163 = v86;
  uint64_t v87 = swift_getWitnessTable();
  unint64_t v160 = v83;
  uint64_t v161 = v87;
  uint64_t v88 = v102;
  uint64_t v89 = swift_getWitnessTable();
  uint64_t v90 = v98;
  uint64_t v91 = v99;
  sub_24EC77D50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v90, v88);
  uint64_t v158 = v89;
  uint64_t v159 = v85;
  swift_getWitnessTable();
  uint64_t v92 = v112;
  uint64_t v93 = *(void (**)(void, void, void))(v112 + 16);
  uint64_t v94 = v109;
  v93(v109, v91, v48);
  uint64_t v95 = *(void (**)(void, void))(v92 + 8);
  v95(v91, v48);
  v93(v120, v94, v48);
  return ((uint64_t (*)(char *, uint64_t))v95)(v94, v48);
}

uint64_t sub_24EC6396C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,long long a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,long long a36)
{
  uint64_t v66 = a8;
  uint64_t v63 = a6;
  uint64_t v64 = a7;
  uint64_t v43 = a5;
  uint64_t v62 = a4;
  v42[0] = a3;
  uint64_t v70 = a1;
  uint64_t v71 = a2;
  long long v69 = a23;
  uint64_t v55 = *((void *)&a36 + 1);
  uint64_t v56 = a36;
  uint64_t v57 = a35;
  uint64_t v54 = a34;
  uint64_t v67 = a33;
  uint64_t v53 = a32;
  uint64_t v52 = a31;
  uint64_t v51 = a30;
  uint64_t v50 = a29;
  uint64_t v49 = a28;
  uint64_t v61 = a24;
  uint64_t v48 = a25;
  uint64_t v60 = a21;
  uint64_t v47 = a22;
  uint64_t v46 = a20;
  uint64_t v45 = a19;
  uint64_t v58 = a18;
  uint64_t v59 = a17;
  uint64_t v72 = a3;
  uint64_t v73 = a5;
  uint64_t v74 = a9;
  uint64_t v75 = a12;
  uint64_t v76 = a13;
  uint64_t v77 = a14;
  uint64_t v78 = a16;
  uint64_t v79 = a17;
  uint64_t v80 = a18;
  uint64_t v81 = a19;
  uint64_t v82 = a20;
  uint64_t v83 = a22;
  uint64_t v84 = a25;
  uint64_t v85 = a28;
  uint64_t v86 = a29;
  uint64_t v87 = a30;
  uint64_t v88 = a31;
  uint64_t v89 = a32;
  uint64_t v90 = a34;
  uint64_t v91 = a35;
  long long v92 = a36;
  uint64_t v44 = a27;
  v42[1] = a26;
  uint64_t v65 = type metadata accessor for CanvasAction(0, (uint64_t)&v72);
  uint64_t v68 = *(void *)(v65 - 8);
  MEMORY[0x270FA5388](v65);
  uint64_t v37 = (char *)v42 - v36;
  uint64_t v72 = v42[0];
  uint64_t v73 = v62;
  uint64_t v74 = v43;
  uint64_t v75 = v63;
  uint64_t v76 = v64;
  uint64_t v77 = v66;
  uint64_t v78 = a9;
  uint64_t v79 = a10;
  uint64_t v80 = a11;
  uint64_t v81 = a12;
  uint64_t v82 = a13;
  uint64_t v83 = a14;
  uint64_t v84 = a15;
  uint64_t v85 = a16;
  uint64_t v88 = a19;
  uint64_t v89 = a20;
  uint64_t v90 = a21;
  uint64_t v91 = a22;
  uint64_t v93 = a24;
  uint64_t v94 = a25;
  uint64_t v95 = a26;
  uint64_t v96 = a27;
  uint64_t v97 = a28;
  uint64_t v98 = a29;
  uint64_t v99 = a30;
  uint64_t v100 = a31;
  uint64_t v101 = a32;
  uint64_t v102 = a33;
  uint64_t v103 = a34;
  long long v105 = a36;
  uint64_t v86 = a17;
  uint64_t v87 = a18;
  long long v92 = a23;
  uint64_t v104 = a35;
  uint64_t v38 = type metadata accessor for CanvasView(0, (uint64_t)&v72);
  sub_24EC5BB28(v38);
  uint64_t v72 = a17;
  uint64_t v73 = a18;
  uint64_t v74 = a35;
  uint64_t v75 = a36;
  uint64_t v39 = sub_24EC77BC0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v71, v39);
  uint64_t v40 = v65;
  swift_storeEnumTagMultiPayload();
  sub_24EC77E50();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v37, v40);
}

uint64_t sub_24EC63C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,long long a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,long long a37)
{
  uint64_t v66 = a7;
  uint64_t v67 = a8;
  uint64_t v43 = a4;
  uint64_t v44 = a6;
  uint64_t v65 = a5;
  uint64_t v72 = a3;
  uint64_t v73 = a2;
  long long v71 = a24;
  uint64_t v57 = *((void *)&a37 + 1);
  uint64_t v58 = a37;
  uint64_t v60 = a36;
  uint64_t v56 = a35;
  uint64_t v69 = a34;
  uint64_t v55 = a33;
  uint64_t v54 = a32;
  uint64_t v53 = a31;
  uint64_t v52 = a30;
  uint64_t v51 = a29;
  uint64_t v64 = a25;
  uint64_t v50 = a26;
  uint64_t v49 = a23;
  uint64_t v63 = a22;
  uint64_t v48 = a21;
  uint64_t v47 = a20;
  uint64_t v61 = a19;
  uint64_t v62 = a18;
  uint64_t v59 = a16;
  uint64_t v74 = a4;
  uint64_t v75 = a6;
  uint64_t v76 = a10;
  uint64_t v77 = a13;
  uint64_t v78 = a14;
  uint64_t v79 = a15;
  uint64_t v80 = a17;
  uint64_t v81 = a18;
  uint64_t v82 = a19;
  uint64_t v83 = a20;
  uint64_t v84 = a21;
  uint64_t v85 = a23;
  uint64_t v86 = a26;
  uint64_t v87 = a29;
  uint64_t v88 = a30;
  uint64_t v89 = a31;
  uint64_t v90 = a32;
  uint64_t v91 = a33;
  uint64_t v92 = a35;
  uint64_t v93 = a36;
  long long v94 = a37;
  uint64_t v46 = a28;
  uint64_t v45 = a27;
  uint64_t v68 = type metadata accessor for CanvasAction(0, (uint64_t)&v74);
  uint64_t v70 = *(void *)(v68 - 8);
  MEMORY[0x270FA5388](v68);
  uint64_t v38 = (char *)&v43 - v37;
  uint64_t v74 = v43;
  uint64_t v75 = v65;
  uint64_t v76 = v44;
  uint64_t v77 = v66;
  uint64_t v78 = v67;
  uint64_t v79 = a9;
  uint64_t v80 = a10;
  uint64_t v81 = a11;
  uint64_t v82 = a12;
  uint64_t v83 = a13;
  uint64_t v84 = a14;
  uint64_t v85 = a15;
  uint64_t v86 = a16;
  uint64_t v87 = a17;
  uint64_t v90 = a20;
  uint64_t v91 = a21;
  uint64_t v92 = a22;
  uint64_t v93 = a23;
  uint64_t v95 = a25;
  uint64_t v96 = a26;
  uint64_t v97 = a27;
  uint64_t v98 = a28;
  uint64_t v99 = a29;
  uint64_t v100 = a30;
  uint64_t v101 = a31;
  uint64_t v102 = a32;
  uint64_t v103 = a33;
  uint64_t v104 = a34;
  uint64_t v105 = a35;
  long long v107 = a37;
  uint64_t v88 = a18;
  uint64_t v89 = a19;
  long long v94 = a24;
  uint64_t v106 = a36;
  uint64_t v39 = type metadata accessor for CanvasView(0, (uint64_t)&v74);
  sub_24EC5BB28(v39);
  uint64_t v74 = a18;
  uint64_t v75 = a19;
  uint64_t v76 = a36;
  uint64_t v77 = a37;
  uint64_t v40 = sub_24EC77BC0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v73, v40);
  uint64_t v41 = v68;
  swift_storeEnumTagMultiPayload();
  sub_24EC77E50();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v70 + 8))(v38, v41);
}

uint64_t sub_24EC63FA4()
{
  return swift_release();
}

uint64_t sub_24EC63FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = v2[3];
  uint64_t v39 = v2[5];
  uint64_t v40 = v2[4];
  uint64_t v37 = v2[7];
  uint64_t v38 = v2[6];
  uint64_t v35 = v2[9];
  uint64_t v36 = v2[8];
  uint64_t v33 = v2[11];
  uint64_t v34 = v2[10];
  uint64_t v31 = v2[13];
  uint64_t v32 = v2[12];
  uint64_t v29 = v2[15];
  uint64_t v30 = v2[14];
  uint64_t v27 = v2[17];
  uint64_t v28 = v2[16];
  uint64_t v25 = v2[19];
  uint64_t v26 = v2[18];
  uint64_t v23 = v2[21];
  uint64_t v24 = v2[20];
  uint64_t v21 = v2[23];
  uint64_t v22 = v2[22];
  uint64_t v19 = v2[25];
  uint64_t v20 = v2[24];
  uint64_t v17 = v2[27];
  uint64_t v18 = v2[26];
  uint64_t v3 = v2[29];
  uint64_t v16 = v2[28];
  v45[0] = v2[2];
  uint64_t v42 = v45[0];
  v45[1] = v41;
  v45[2] = v40;
  v45[3] = v39;
  v45[4] = v38;
  v45[5] = v37;
  v45[6] = v36;
  v45[7] = v35;
  v45[8] = v34;
  v45[9] = v33;
  v45[10] = v32;
  v45[11] = v31;
  v45[12] = v30;
  v45[13] = v29;
  v45[14] = v28;
  v45[15] = v27;
  v45[16] = v26;
  v45[17] = v25;
  v45[18] = v24;
  v45[19] = v23;
  v45[20] = v22;
  v45[21] = v21;
  v45[22] = v20;
  v45[23] = v19;
  v45[24] = v18;
  v45[25] = v17;
  v45[26] = v16;
  v45[27] = v3;
  uint64_t v5 = v2[31];
  uint64_t v46 = v2[30];
  uint64_t v4 = v46;
  uint64_t v47 = v5;
  uint64_t v7 = v2[33];
  uint64_t v48 = v2[32];
  uint64_t v6 = v48;
  uint64_t v49 = v7;
  uint64_t v9 = v2[35];
  uint64_t v50 = v2[34];
  uint64_t v8 = v50;
  uint64_t v51 = v9;
  uint64_t v11 = v2[37];
  uint64_t v52 = v2[36];
  uint64_t v10 = v52;
  uint64_t v53 = v11;
  uint64_t v12 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)v45) - 8);
  *(void *)&long long v15 = v10;
  *((void *)&v15 + 1) = v11;
  *(void *)&long long v14 = v22;
  *((void *)&v14 + 1) = v21;
  return sub_24EC63C88(a1, a2, (uint64_t)v2 + ((*(unsigned __int8 *)(v12 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), v42, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27,
           v26,
           v25,
           v24,
           v23,
           v14,
           v20,
           v19,
           v18,
           v17,
           v16,
           v3,
           v4,
           v5,
           v6,
           v7,
           v8,
           v9,
           v15);
}

uint64_t sub_24EC641E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24EC64278()
{
  return sub_24EC77D40();
}

uint64_t sub_24EC64298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_24EC642A0(uint64_t a1)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    return __swift_destroy_boxed_opaque_existential_1(a1);
  }
  return a1;
}

uint64_t sub_24EC642B8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 24);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  return a1;
}

uint64_t sub_24EC64334(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    __swift_destroy_boxed_opaque_existential_1(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        unint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
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
          *unint64_t result = *a2;
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
          *unint64_t v3 = *a2;
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

uint64_t sub_24EC64630(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t sub_24EC64680(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t sub_24EC646D0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2;
    }
  }
  return result;
}

uint64_t sub_24EC6472C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double sub_24EC64744(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(a1 + 24) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24EC64770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 336);
}

void sub_24EC64778()
{
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  sub_24EC77A00();
  if (v0 <= 0x3F)
  {
    sub_24EC77A00();
    if (v1 <= 0x3F)
    {
      sub_24EC77A00();
      if (v2 <= 0x3F)
      {
        sub_24EC77A00();
        if (v3 <= 0x3F)
        {
          sub_24EC77C00();
          if (v4 <= 0x3F)
          {
            sub_24EC779D0();
            sub_24EC77BC0();
            swift_getTupleTypeMetadata3();
            sub_24EC77A00();
            if (v5 <= 0x3F)
            {
              sub_24EC77A00();
              if (v6 <= 0x3F)
              {
                sub_24EC66F40();
                if (v7 <= 0x3F)
                {
                  sub_24EC779C0();
                  if (v8 <= 0x3F) {
                    swift_initStructMetadata();
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_24EC64AD0(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v9 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[3];
    if (v7)
    {
      uint64_t v8 = a2[4];
      *(void *)(a1 + 24) = v7;
      *(void *)(a1 + 32) = v8;
      (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    }
    else
    {
      long long v10 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      *(void *)(a1 + 32) = a2[4];
    }
    uint64_t v11 = a2[6];
    *(void *)(v4 + 40) = a2[5];
    uint64_t v12 = a2[7];
    char v13 = *((unsigned char *)a2 + 64);
    swift_retain();
    sub_24EC64FD4();
    *(void *)(v4 + 48) = v11;
    *(void *)(v4 + 56) = v12;
    *(unsigned char *)(v4 + 64) = v13;
    uint64_t v14 = a3[78];
    uint64_t v15 = v4 + v14;
    uint64_t v16 = (uint64_t)a2 + v14;
    sub_24EC78080();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
    swift_getTupleTypeMetadata3();
    uint64_t v17 = sub_24EC77A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    uint64_t v18 = a3[79];
    uint64_t v19 = v4 + v18;
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = sub_24EC77A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
    uint64_t v22 = a3[80];
    uint64_t v23 = v4 + v22;
    uint64_t v24 = (uint64_t)a2 + v22;
    uint64_t v25 = sub_24EC77A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    uint64_t v26 = a3[81];
    uint64_t v27 = v4 + v26;
    uint64_t v28 = (uint64_t)a2 + v26;
    uint64_t v29 = sub_24EC77A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    uint64_t v30 = a3[82];
    uint64_t v31 = v4 + v30;
    uint64_t v32 = (uint64_t)a2 + v30;
    uint64_t v33 = sub_24EC77C00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
    uint64_t v34 = a3[83];
    uint64_t v35 = v4 + v34;
    uint64_t v36 = (uint64_t)a2 + v34;
    sub_24EC779D0();
    sub_24EC77BC0();
    swift_getTupleTypeMetadata3();
    uint64_t v37 = sub_24EC77A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
    uint64_t v38 = a3[84];
    uint64_t v39 = v4 + v38;
    uint64_t v40 = (uint64_t)a2 + v38;
    uint64_t v41 = sub_24EC77A00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 16))(v39, v40, v41);
    uint64_t v42 = a3[85];
    uint64_t v43 = (void *)(v4 + v42);
    uint64_t v44 = (char *)a2 + v42;
    uint64_t v45 = sub_24EC77CE0();
    uint64_t v46 = *(void *)(v45 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v44, 1, v45))
    {
      uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
      memcpy(v43, v44, *(void *)(*(void *)(v47 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v46 + 16))(v43, v44, v45);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
    }
    uint64_t v48 = a3[86];
    uint64_t v49 = v4 + v48;
    uint64_t v50 = (uint64_t)a2 + v48;
    uint64_t v51 = sub_24EC779C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
  }
  return v4;
}

uint64_t sub_24EC64FD4()
{
  return swift_retain();
}

uint64_t sub_24EC64FDC(uint64_t a1, int *a2)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  swift_release();
  sub_24EC63FA4();
  uint64_t v4 = a1 + a2[78];
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v5 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  uint64_t v6 = a1 + a2[79];
  uint64_t v7 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + a2[80];
  uint64_t v9 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = a1 + a2[81];
  uint64_t v11 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  uint64_t v12 = a1 + a2[82];
  uint64_t v13 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  uint64_t v14 = a1 + a2[83];
  sub_24EC779D0();
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v15 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  uint64_t v16 = a1 + a2[84];
  uint64_t v17 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  uint64_t v18 = a1 + a2[85];
  uint64_t v19 = sub_24EC77CE0();
  uint64_t v20 = *(void *)(v19 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19)) {
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  }
  uint64_t v21 = a1 + a2[86];
  uint64_t v22 = sub_24EC779C0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
}

uint64_t sub_24EC65388(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 24);
  if (v6)
  {
    uint64_t v7 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = v7;
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1, a2);
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 56);
  char v11 = *(unsigned char *)(a2 + 64);
  swift_retain();
  sub_24EC64FD4();
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  uint64_t v12 = a3[78];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v15 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  uint64_t v16 = a3[79];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
  uint64_t v20 = a3[80];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  uint64_t v24 = a3[81];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  uint64_t v28 = a3[82];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  uint64_t v31 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16))(v29, v30, v31);
  uint64_t v32 = a3[83];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  sub_24EC779D0();
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v35 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
  uint64_t v36 = a3[84];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = a2 + v36;
  uint64_t v39 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 16))(v37, v38, v39);
  uint64_t v40 = a3[85];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (const void *)(a2 + v40);
  uint64_t v43 = sub_24EC77CE0();
  uint64_t v44 = *(void *)(v43 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43))
  {
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
    memcpy(v41, v42, *(void *)(*(void *)(v45 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v44 + 16))(v41, v42, v43);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
  }
  uint64_t v46 = a3[86];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 16))(v47, v48, v49);
  return a1;
}

uint64_t sub_24EC6583C(uint64_t a1, long long *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24))
  {
    if (v6)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else if (v6)
  {
    *(void *)(a1 + 24) = v6;
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    (**(void (***)(uint64_t, long long *))(v6 - 8))(a1, a2);
    goto LABEL_8;
  }
  long long v7 = *a2;
  long long v8 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v7;
  *(_OWORD *)(a1 + 16) = v8;
LABEL_8:
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_retain();
  swift_release();
  uint64_t v9 = *((void *)a2 + 6);
  uint64_t v10 = *((void *)a2 + 7);
  char v11 = *((unsigned char *)a2 + 64);
  sub_24EC64FD4();
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = v11;
  sub_24EC63FA4();
  uint64_t v12 = a3[78];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = (uint64_t)a2 + v12;
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v15 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24))(v13, v14, v15);
  uint64_t v16 = a3[79];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t)a2 + v16;
  uint64_t v19 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  uint64_t v20 = a3[80];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t)a2 + v20;
  uint64_t v23 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  uint64_t v24 = a3[81];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = (uint64_t)a2 + v24;
  uint64_t v27 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  uint64_t v28 = a3[82];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (uint64_t)a2 + v28;
  uint64_t v31 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 24))(v29, v30, v31);
  uint64_t v32 = a3[83];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = (uint64_t)a2 + v32;
  sub_24EC779D0();
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v35 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 24))(v33, v34, v35);
  uint64_t v36 = a3[84];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (uint64_t)a2 + v36;
  uint64_t v39 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 24))(v37, v38, v39);
  uint64_t v40 = a3[85];
  uint64_t v41 = (void *)(a1 + v40);
  uint64_t v42 = (char *)a2 + v40;
  uint64_t v43 = sub_24EC77CE0();
  uint64_t v44 = *(void *)(v43 - 8);
  uint64_t v45 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v44 + 48);
  int v46 = v45(v41, 1, v43);
  int v47 = v45(v42, 1, v43);
  if (!v46)
  {
    if (!v47)
    {
      (*(void (**)(void *, char *, uint64_t))(v44 + 24))(v41, v42, v43);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v44 + 8))(v41, v43);
    goto LABEL_13;
  }
  if (v47)
  {
LABEL_13:
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
    memcpy(v41, v42, *(void *)(*(void *)(v48 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, char *, uint64_t))(v44 + 16))(v41, v42, v43);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
LABEL_14:
  uint64_t v49 = a3[86];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = (uint64_t)a2 + v49;
  uint64_t v52 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 24))(v50, v51, v52);
  return a1;
}

uint64_t sub_24EC65D90(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = a3[78];
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v11 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = a3[79];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a3[80];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = a3[81];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  uint64_t v23 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  uint64_t v24 = a3[82];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  uint64_t v27 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 32))(v25, v26, v27);
  uint64_t v28 = a3[83];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = a2 + v28;
  sub_24EC779D0();
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v31 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32))(v29, v30, v31);
  uint64_t v32 = a3[84];
  uint64_t v33 = a1 + v32;
  uint64_t v34 = a2 + v32;
  uint64_t v35 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32))(v33, v34, v35);
  uint64_t v36 = a3[85];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (const void *)(a2 + v36);
  uint64_t v39 = sub_24EC77CE0();
  uint64_t v40 = *(void *)(v39 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
  {
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
    memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 32))(v37, v38, v39);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  uint64_t v42 = a3[86];
  uint64_t v43 = a1 + v42;
  uint64_t v44 = a2 + v42;
  uint64_t v45 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
  return a1;
}

uint64_t sub_24EC661DC(uint64_t a1, uint64_t a2, int *a3)
{
  if (*(void *)(a1 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_release();
  char v8 = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = v8;
  sub_24EC63FA4();
  uint64_t v9 = a3[78];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v12 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = a3[79];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  uint64_t v17 = a3[80];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 40))(v18, v19, v20);
  uint64_t v21 = a3[81];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  uint64_t v25 = a3[82];
  uint64_t v26 = a1 + v25;
  uint64_t v27 = a2 + v25;
  uint64_t v28 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 40))(v26, v27, v28);
  uint64_t v29 = a3[83];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = a2 + v29;
  sub_24EC779D0();
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v32 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 40))(v30, v31, v32);
  uint64_t v33 = a3[84];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 40))(v34, v35, v36);
  uint64_t v37 = a3[85];
  uint64_t v38 = (void *)(a1 + v37);
  uint64_t v39 = (void *)(a2 + v37);
  uint64_t v40 = sub_24EC77CE0();
  uint64_t v41 = *(void *)(v40 - 8);
  uint64_t v42 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v41 + 48);
  int v43 = v42(v38, 1, v40);
  int v44 = v42(v39, 1, v40);
  if (!v43)
  {
    if (!v44)
    {
      (*(void (**)(void *, void *, uint64_t))(v41 + 40))(v38, v39, v40);
      goto LABEL_9;
    }
    (*(void (**)(void *, uint64_t))(v41 + 8))(v38, v40);
    goto LABEL_8;
  }
  if (v44)
  {
LABEL_8:
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
    memcpy(v38, v39, *(void *)(*(void *)(v45 - 8) + 64));
    goto LABEL_9;
  }
  (*(void (**)(void *, void *, uint64_t))(v41 + 32))(v38, v39, v40);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
LABEL_9:
  uint64_t v46 = a3[86];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  uint64_t v49 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 40))(v47, v48, v49);
  return a1;
}

uint64_t sub_24EC666B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EC666CC);
}

uint64_t sub_24EC666CC(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
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
    sub_24EC78080();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
    swift_getTupleTypeMetadata3();
    uint64_t v9 = sub_24EC77A00();
    if (*(_DWORD *)(*(void *)(v9 - 8) + 84) == a2)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(v9 - 8);
      uint64_t v12 = a3[78];
    }
    else
    {
      uint64_t v13 = sub_24EC77A00();
      if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
      {
        uint64_t v10 = v13;
        uint64_t v11 = *(void *)(v13 - 8);
        uint64_t v12 = a3[79];
      }
      else
      {
        uint64_t v14 = sub_24EC77A00();
        if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
        {
          uint64_t v10 = v14;
          uint64_t v11 = *(void *)(v14 - 8);
          uint64_t v12 = a3[80];
        }
        else
        {
          uint64_t v15 = sub_24EC77A00();
          if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
          {
            uint64_t v10 = v15;
            uint64_t v11 = *(void *)(v15 - 8);
            uint64_t v12 = a3[81];
          }
          else
          {
            uint64_t v16 = sub_24EC77C00();
            if (*(_DWORD *)(*(void *)(v16 - 8) + 84) != a2)
            {
              sub_24EC779D0();
              sub_24EC77BC0();
              swift_getTupleTypeMetadata3();
              uint64_t v18 = sub_24EC77A00();
              if (*(_DWORD *)(*(void *)(v18 - 8) + 84) == a2)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)(v18 - 8);
                uint64_t v21 = a3[83];
              }
              else
              {
                uint64_t v22 = sub_24EC77A00();
                if (*(_DWORD *)(*(void *)(v22 - 8) + 84) == a2)
                {
                  uint64_t v19 = v22;
                  uint64_t v20 = *(void *)(v22 - 8);
                  uint64_t v21 = a3[84];
                }
                else
                {
                  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
                  if (*(_DWORD *)(*(void *)(v23 - 8) + 84) != a2)
                  {
                    uint64_t v24 = sub_24EC779C0();
                    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 48))(a1 + a3[86], a2, v24);
                  }
                  uint64_t v19 = v23;
                  uint64_t v20 = *(void *)(v23 - 8);
                  uint64_t v21 = a3[85];
                }
              }
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(a1 + v21, a2, v19);
            }
            uint64_t v10 = v16;
            uint64_t v11 = *(void *)(v16 - 8);
            uint64_t v12 = a3[82];
          }
        }
      }
    }
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    return v17(a1 + v12, a2, v10);
  }
}

uint64_t sub_24EC66B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EC66B14);
}

uint64_t sub_24EC66B14(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 24) = a2;
  }
  else
  {
    sub_24EC78080();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
    swift_getTupleTypeMetadata3();
    uint64_t v8 = sub_24EC77A00();
    if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)(v8 - 8);
      uint64_t v11 = a4[78];
    }
    else
    {
      uint64_t v12 = sub_24EC77A00();
      if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
      {
        uint64_t v9 = v12;
        uint64_t v10 = *(void *)(v12 - 8);
        uint64_t v11 = a4[79];
      }
      else
      {
        uint64_t v13 = sub_24EC77A00();
        if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
        {
          uint64_t v9 = v13;
          uint64_t v10 = *(void *)(v13 - 8);
          uint64_t v11 = a4[80];
        }
        else
        {
          uint64_t v14 = sub_24EC77A00();
          if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a3)
          {
            uint64_t v9 = v14;
            uint64_t v10 = *(void *)(v14 - 8);
            uint64_t v11 = a4[81];
          }
          else
          {
            uint64_t v15 = sub_24EC77C00();
            if (*(_DWORD *)(*(void *)(v15 - 8) + 84) != a3)
            {
              sub_24EC779D0();
              sub_24EC77BC0();
              swift_getTupleTypeMetadata3();
              uint64_t v17 = sub_24EC77A00();
              if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a3)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)(v17 - 8);
                uint64_t v20 = a4[83];
              }
              else
              {
                uint64_t v21 = sub_24EC77A00();
                if (*(_DWORD *)(*(void *)(v21 - 8) + 84) == a3)
                {
                  uint64_t v18 = v21;
                  uint64_t v19 = *(void *)(v21 - 8);
                  uint64_t v20 = a4[84];
                }
                else
                {
                  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
                  if (*(_DWORD *)(*(void *)(v22 - 8) + 84) != a3)
                  {
                    uint64_t v23 = sub_24EC779C0();
                    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v5 + a4[86], a2, a2, v23);
                  }
                  uint64_t v18 = v22;
                  uint64_t v19 = *(void *)(v22 - 8);
                  uint64_t v20 = a4[85];
                }
              }
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v5 + v20, a2, a2, v18);
            }
            uint64_t v9 = v15;
            uint64_t v10 = *(void *)(v15 - 8);
            uint64_t v11 = a4[82];
          }
        }
      }
    }
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v16(v5 + v11, a2, a2, v9);
  }
  return result;
}

void sub_24EC66F40()
{
  if (!qword_26B1D9D08)
  {
    sub_24EC77CE0();
    unint64_t v0 = sub_24EC78080();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B1D9D08);
    }
  }
}

uint64_t sub_24EC66F98()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24EC67314(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_24EC6732C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24EC67394(uint64_t a1)
{
  return sub_24EC67600(a1, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24EC62FFC);
}

uint64_t sub_24EC673B0()
{
  uint64_t v37 = v0[3];
  uint64_t v35 = v0[5];
  uint64_t v36 = v0[4];
  uint64_t v33 = v0[7];
  uint64_t v34 = v0[6];
  uint64_t v31 = v0[9];
  uint64_t v32 = v0[8];
  uint64_t v29 = v0[11];
  uint64_t v30 = v0[10];
  uint64_t v27 = v0[13];
  uint64_t v28 = v0[12];
  uint64_t v25 = v0[15];
  uint64_t v26 = v0[14];
  uint64_t v23 = v0[17];
  uint64_t v24 = v0[16];
  uint64_t v21 = v0[19];
  uint64_t v22 = v0[18];
  uint64_t v19 = v0[21];
  uint64_t v20 = v0[20];
  uint64_t v17 = v0[23];
  uint64_t v18 = v0[22];
  uint64_t v15 = v0[25];
  uint64_t v16 = v0[24];
  uint64_t v13 = v0[27];
  uint64_t v14 = v0[26];
  uint64_t v1 = v0[29];
  uint64_t v11 = v0[30];
  uint64_t v12 = v0[28];
  uint64_t v10 = v0[31];
  v39[0] = v0[2];
  uint64_t v38 = v39[0];
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v35;
  v39[4] = v34;
  v39[5] = v33;
  v39[6] = v32;
  v39[7] = v31;
  v39[8] = v30;
  v39[9] = v29;
  v39[10] = v28;
  v39[11] = v27;
  v39[12] = v26;
  v39[13] = v25;
  v39[14] = v24;
  v39[15] = v23;
  v39[16] = v22;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v19;
  v39[20] = v18;
  v39[21] = v17;
  v39[22] = v16;
  v39[23] = v15;
  v39[24] = v14;
  v39[25] = v13;
  v39[26] = v12;
  v39[27] = v1;
  v39[28] = v11;
  v39[29] = v10;
  uint64_t v3 = v0[33];
  uint64_t v40 = v0[32];
  uint64_t v2 = v40;
  uint64_t v41 = v3;
  uint64_t v5 = v0[35];
  uint64_t v42 = v0[34];
  uint64_t v4 = v42;
  uint64_t v43 = v5;
  uint64_t v7 = v0[37];
  uint64_t v44 = v0[36];
  uint64_t v6 = v44;
  uint64_t v45 = v7;
  uint64_t v8 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)v39) - 8);
  return sub_24EC62B90((uint64_t)v0 + ((*(unsigned __int8 *)(v8 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v14,
           v13,
           v12,
           v1,
           v11,
           v10,
           v2,
           v3,
           v4,
           v5,
           v6,
           v7);
}

uint64_t sub_24EC675E8(uint64_t a1)
{
  return sub_24EC67600(a1, (uint64_t (*)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24EC5EC94);
}

uint64_t sub_24EC67600(uint64_t a1, uint64_t (*a2)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v39 = *((void *)v2 + 3);
  uint64_t v37 = *((void *)v2 + 5);
  uint64_t v38 = *((void *)v2 + 4);
  uint64_t v35 = *((void *)v2 + 7);
  uint64_t v36 = *((void *)v2 + 6);
  uint64_t v33 = *((void *)v2 + 9);
  uint64_t v34 = *((void *)v2 + 8);
  uint64_t v31 = *((void *)v2 + 11);
  uint64_t v32 = *((void *)v2 + 10);
  uint64_t v29 = *((void *)v2 + 13);
  uint64_t v30 = *((void *)v2 + 12);
  uint64_t v27 = *((void *)v2 + 15);
  uint64_t v28 = *((void *)v2 + 14);
  uint64_t v25 = *((void *)v2 + 17);
  uint64_t v26 = *((void *)v2 + 16);
  uint64_t v23 = *((void *)v2 + 19);
  uint64_t v24 = *((void *)v2 + 18);
  uint64_t v21 = *((void *)v2 + 21);
  uint64_t v22 = *((void *)v2 + 20);
  uint64_t v19 = *((void *)v2 + 23);
  uint64_t v20 = *((void *)v2 + 22);
  uint64_t v17 = *((void *)v2 + 25);
  uint64_t v18 = *((void *)v2 + 24);
  uint64_t v15 = *((void *)v2 + 27);
  uint64_t v16 = *((void *)v2 + 26);
  v43[0] = *((void *)v2 + 2);
  uint64_t v40 = v43[0];
  v43[1] = v39;
  v43[2] = v38;
  v43[3] = v37;
  v43[4] = v36;
  v43[5] = v35;
  v43[6] = v34;
  v43[7] = v33;
  v43[8] = v32;
  v43[9] = v31;
  v43[10] = v30;
  v43[11] = v29;
  v43[12] = v28;
  v43[13] = v27;
  v43[14] = v26;
  v43[15] = v25;
  v43[16] = v24;
  v43[17] = v23;
  v43[18] = v22;
  v43[19] = v21;
  v43[20] = v20;
  v43[21] = v19;
  v43[22] = v18;
  v43[23] = v17;
  v43[24] = v16;
  v43[25] = v15;
  uint64_t v3 = *((void *)v2 + 29);
  uint64_t v44 = *((void *)v2 + 28);
  uint64_t v14 = v44;
  uint64_t v45 = v3;
  uint64_t v5 = *((void *)v2 + 31);
  uint64_t v46 = *((void *)v2 + 30);
  uint64_t v4 = v46;
  uint64_t v47 = v5;
  uint64_t v7 = *((void *)v2 + 33);
  uint64_t v48 = *((void *)v2 + 32);
  uint64_t v6 = v48;
  uint64_t v49 = v7;
  uint64_t v8 = *((void *)v2 + 35);
  uint64_t v50 = *((void *)v2 + 34);
  uint64_t v9 = v50;
  uint64_t v51 = v8;
  uint64_t v10 = *((void *)v2 + 37);
  uint64_t v52 = *((void *)v2 + 36);
  uint64_t v11 = v52;
  uint64_t v53 = v10;
  uint64_t v12 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)v43) - 8);
  return a2(a1, &v2[(*(unsigned __int8 *)(v12 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)], v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24,
           v23,
           v22,
           v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v14,
           v3,
           v4,
           v5,
           v6,
           v7,
           v9,
           v8,
           v11,
           v10);
}

uint64_t sub_24EC67840(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_24EC6788C(uint64_t a1)
{
  return sub_24EC678D0(a1, (uint64_t)&unk_27008B1E8, (uint64_t)&unk_269962298);
}

uint64_t sub_24EC678B0(uint64_t a1)
{
  return sub_24EC678D0(a1, (uint64_t)&unk_27008B1C0, (uint64_t)&unk_269962288);
}

uint64_t sub_24EC678D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v40 = v3[3];
  uint64_t v38 = v3[5];
  uint64_t v39 = v3[4];
  uint64_t v36 = v3[7];
  uint64_t v37 = v3[6];
  uint64_t v34 = v3[9];
  uint64_t v35 = v3[8];
  uint64_t v32 = v3[11];
  uint64_t v33 = v3[10];
  uint64_t v30 = v3[13];
  uint64_t v31 = v3[12];
  uint64_t v28 = v3[15];
  uint64_t v29 = v3[14];
  uint64_t v26 = v3[17];
  uint64_t v27 = v3[16];
  uint64_t v24 = v3[19];
  uint64_t v25 = v3[18];
  uint64_t v22 = v3[21];
  uint64_t v23 = v3[20];
  uint64_t v20 = v3[23];
  uint64_t v21 = v3[22];
  uint64_t v18 = v3[25];
  uint64_t v19 = v3[24];
  uint64_t v16 = v3[27];
  uint64_t v17 = v3[26];
  v45[0] = v3[2];
  uint64_t v41 = v45[0];
  v45[1] = v40;
  v45[2] = v39;
  v45[3] = v38;
  v45[4] = v37;
  v45[5] = v36;
  v45[6] = v35;
  v45[7] = v34;
  v45[8] = v33;
  v45[9] = v32;
  v45[10] = v31;
  v45[11] = v30;
  v45[12] = v29;
  v45[13] = v28;
  v45[14] = v27;
  v45[15] = v26;
  v45[16] = v25;
  v45[17] = v24;
  v45[18] = v23;
  v45[19] = v22;
  v45[20] = v21;
  v45[21] = v20;
  v45[22] = v19;
  v45[23] = v18;
  v45[24] = v17;
  v45[25] = v16;
  uint64_t v4 = v3[29];
  uint64_t v46 = v3[28];
  uint64_t v15 = v46;
  uint64_t v47 = v4;
  uint64_t v6 = v3[31];
  uint64_t v48 = v3[30];
  uint64_t v5 = v48;
  uint64_t v49 = v6;
  uint64_t v8 = v3[33];
  uint64_t v50 = v3[32];
  uint64_t v7 = v50;
  uint64_t v51 = v8;
  uint64_t v10 = v3[35];
  uint64_t v52 = v3[34];
  uint64_t v9 = v52;
  uint64_t v53 = v10;
  uint64_t v12 = v3[37];
  uint64_t v54 = v3[36];
  uint64_t v11 = v54;
  uint64_t v55 = v12;
  uint64_t v13 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)v45) - 8);
  return sub_24EC5F59C(a1, (uint64_t)v3 + ((*(unsigned __int8 *)(v13 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25,
           v24,
           v23,
           v22,
           v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v4,
           v5,
           v6,
           v7,
           v8,
           v9,
           v10,
           v11,
           v12,
           a2,
           a3);
}

uint64_t sub_24EC67B1C(uint64_t a1)
{
  uint64_t v38 = v1[3];
  uint64_t v36 = v1[5];
  uint64_t v37 = v1[4];
  uint64_t v34 = v1[7];
  uint64_t v35 = v1[6];
  uint64_t v32 = v1[9];
  uint64_t v33 = v1[8];
  uint64_t v30 = v1[11];
  uint64_t v31 = v1[10];
  uint64_t v28 = v1[13];
  uint64_t v29 = v1[12];
  uint64_t v26 = v1[15];
  uint64_t v27 = v1[14];
  uint64_t v24 = v1[17];
  uint64_t v25 = v1[16];
  uint64_t v22 = v1[19];
  uint64_t v23 = v1[18];
  uint64_t v20 = v1[21];
  uint64_t v21 = v1[20];
  uint64_t v18 = v1[23];
  uint64_t v19 = v1[22];
  uint64_t v16 = v1[25];
  uint64_t v17 = v1[24];
  uint64_t v14 = v1[27];
  uint64_t v15 = v1[26];
  uint64_t v2 = v1[29];
  uint64_t v13 = v1[28];
  v41[0] = v1[2];
  uint64_t v39 = v41[0];
  v41[1] = v38;
  v41[2] = v37;
  v41[3] = v36;
  v41[4] = v35;
  v41[5] = v34;
  v41[6] = v33;
  v41[7] = v32;
  v41[8] = v31;
  v41[9] = v30;
  v41[10] = v29;
  v41[11] = v28;
  v41[12] = v27;
  v41[13] = v26;
  v41[14] = v25;
  v41[15] = v24;
  v41[16] = v23;
  v41[17] = v22;
  v41[18] = v21;
  v41[19] = v20;
  v41[20] = v19;
  v41[21] = v18;
  v41[22] = v17;
  v41[23] = v16;
  v41[24] = v15;
  v41[25] = v14;
  v41[26] = v13;
  v41[27] = v2;
  uint64_t v4 = v1[31];
  uint64_t v42 = v1[30];
  uint64_t v3 = v42;
  uint64_t v43 = v4;
  uint64_t v6 = v1[33];
  uint64_t v44 = v1[32];
  uint64_t v5 = v44;
  uint64_t v45 = v6;
  uint64_t v8 = v1[35];
  uint64_t v46 = v1[34];
  uint64_t v7 = v46;
  uint64_t v47 = v8;
  uint64_t v10 = v1[37];
  uint64_t v48 = v1[36];
  uint64_t v9 = v48;
  uint64_t v49 = v10;
  uint64_t v11 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)v41) - 8);
  return sub_24EC60000(a1, (uint64_t)v1 + ((*(unsigned __int8 *)(v11 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)), v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23,
           v22,
           v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v14,
           v13,
           v2,
           v3,
           v4,
           v5,
           v6,
           v7,
           v8,
           v9,
           v10);
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v13 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v15 = *(void *)(v0 + 280);
  uint64_t v45 = *(void *)(v0 + 16);
  uint64_t v46 = v1;
  uint64_t v47 = v2;
  uint64_t v48 = v4;
  uint64_t v49 = v3;
  uint64_t v50 = v5;
  uint64_t v51 = v6;
  uint64_t v52 = v7;
  long long v53 = *(_OWORD *)(v0 + 80);
  uint64_t v54 = v8;
  uint64_t v55 = v9;
  long long v56 = *(_OWORD *)(v0 + 112);
  uint64_t v41 = v11;
  uint64_t v42 = v10;
  uint64_t v57 = v10;
  uint64_t v58 = v11;
  long long v16 = *(_OWORD *)(v0 + 160);
  long long v59 = *(_OWORD *)(v0 + 144);
  long long v60 = v16;
  uint64_t v61 = v13;
  uint64_t v62 = v12;
  long long v63 = *(_OWORD *)(v0 + 192);
  long long v65 = *(_OWORD *)(v0 + 216);
  long long v66 = *(_OWORD *)(v0 + 232);
  long long v67 = *(_OWORD *)(v0 + 248);
  long long v68 = *(_OWORD *)(v0 + 264);
  uint64_t v64 = v14;
  uint64_t v40 = v15;
  uint64_t v69 = v15;
  long long v39 = *(_OWORD *)(v0 + 288);
  long long v70 = v39;
  uint64_t v17 = (int *)type metadata accessor for CanvasView(0, (uint64_t)&v45);
  uint64_t v44 = *(unsigned __int8 *)(*((void *)v17 - 1) + 80);
  uint64_t v43 = (v44 + 304) & ~v44;
  uint64_t v18 = v0 + v43;
  if (*(void *)(v0 + v43 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + v43);
  }
  swift_release();
  sub_24EC63FA4();
  uint64_t v19 = v18 + v17[78];
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v20 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  uint64_t v21 = v18 + v17[79];
  uint64_t v22 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  uint64_t v23 = v18 + v17[80];
  uint64_t v24 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  uint64_t v25 = v18 + v17[81];
  uint64_t v26 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v25, v26);
  uint64_t v27 = v18 + v17[82];
  uint64_t v28 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(v27, v28);
  uint64_t v29 = v18 + v17[83];
  sub_24EC779D0();
  uint64_t v45 = v42;
  uint64_t v46 = v41;
  uint64_t v47 = v40;
  uint64_t v48 = v39;
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v30 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8))(v29, v30);
  uint64_t v31 = v18 + v17[84];
  uint64_t v32 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8))(v31, v32);
  uint64_t v33 = v18 + v17[85];
  uint64_t v34 = sub_24EC77CE0();
  uint64_t v35 = *(void *)(v34 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34)) {
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v33, v34);
  }
  uint64_t v36 = v18 + v17[86];
  uint64_t v37 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v37 - 8) + 8))(v36, v37);
  return swift_deallocObject();
}

uint64_t sub_24EC682B4()
{
  uint64_t v37 = v0[3];
  uint64_t v35 = v0[5];
  uint64_t v36 = v0[4];
  uint64_t v33 = v0[7];
  uint64_t v34 = v0[6];
  uint64_t v31 = v0[9];
  uint64_t v32 = v0[8];
  uint64_t v29 = v0[11];
  uint64_t v30 = v0[10];
  uint64_t v27 = v0[13];
  uint64_t v28 = v0[12];
  uint64_t v25 = v0[15];
  uint64_t v26 = v0[14];
  uint64_t v23 = v0[17];
  uint64_t v24 = v0[16];
  uint64_t v21 = v0[19];
  uint64_t v22 = v0[18];
  uint64_t v19 = v0[21];
  uint64_t v20 = v0[20];
  uint64_t v17 = v0[23];
  uint64_t v18 = v0[22];
  uint64_t v15 = v0[25];
  uint64_t v16 = v0[24];
  uint64_t v13 = v0[27];
  uint64_t v14 = v0[26];
  uint64_t v1 = v0[29];
  uint64_t v11 = v0[30];
  uint64_t v12 = v0[28];
  uint64_t v10 = v0[31];
  v39[0] = v0[2];
  uint64_t v38 = v39[0];
  v39[1] = v37;
  v39[2] = v36;
  v39[3] = v35;
  v39[4] = v34;
  v39[5] = v33;
  v39[6] = v32;
  v39[7] = v31;
  v39[8] = v30;
  v39[9] = v29;
  v39[10] = v28;
  v39[11] = v27;
  v39[12] = v26;
  v39[13] = v25;
  v39[14] = v24;
  v39[15] = v23;
  v39[16] = v22;
  v39[17] = v21;
  v39[18] = v20;
  v39[19] = v19;
  v39[20] = v18;
  v39[21] = v17;
  v39[22] = v16;
  v39[23] = v15;
  v39[24] = v14;
  v39[25] = v13;
  v39[26] = v12;
  v39[27] = v1;
  v39[28] = v11;
  v39[29] = v10;
  uint64_t v3 = v0[33];
  uint64_t v40 = v0[32];
  uint64_t v2 = v40;
  uint64_t v41 = v3;
  uint64_t v5 = v0[35];
  uint64_t v42 = v0[34];
  uint64_t v4 = v42;
  uint64_t v43 = v5;
  uint64_t v7 = v0[37];
  uint64_t v44 = v0[36];
  uint64_t v6 = v44;
  uint64_t v45 = v7;
  uint64_t v8 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)v39) - 8);
  return sub_24EC60A18((uint64_t)v0 + ((*(unsigned __int8 *)(v8 + 80) + 304) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v22, v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v15,
           v14,
           v13,
           v12,
           v1,
           v11,
           v10,
           v2,
           v3,
           v4,
           v5,
           v6,
           v7);
}

uint64_t sub_24EC684E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24EC68550()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 200);
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 296);
  uint64_t v51 = *(void *)(v0 + 32);
  uint64_t v52 = v1;
  uint64_t v53 = v3;
  uint64_t v54 = v2;
  uint64_t v55 = v5;
  uint64_t v56 = v4;
  uint64_t v57 = v6;
  uint64_t v58 = v7;
  uint64_t v59 = v8;
  long long v60 = *(_OWORD *)(v0 + 104);
  uint64_t v50 = v60;
  uint64_t v61 = v9;
  long long v62 = *(_OWORD *)(v0 + 128);
  uint64_t v44 = v11;
  uint64_t v45 = v10;
  uint64_t v63 = v10;
  uint64_t v64 = v11;
  long long v16 = *(_OWORD *)(v0 + 176);
  long long v65 = *(_OWORD *)(v0 + 160);
  long long v66 = v16;
  uint64_t v67 = v13;
  uint64_t v68 = v12;
  long long v69 = *(_OWORD *)(v0 + 208);
  long long v71 = *(_OWORD *)(v0 + 232);
  long long v72 = *(_OWORD *)(v0 + 248);
  long long v17 = *(_OWORD *)(v0 + 280);
  long long v73 = *(_OWORD *)(v0 + 264);
  long long v74 = v17;
  uint64_t v70 = v14;
  uint64_t v43 = v15;
  uint64_t v75 = v15;
  long long v42 = *(_OWORD *)(v0 + 304);
  long long v76 = v42;
  uint64_t v18 = (int *)type metadata accessor for CanvasView(0, (uint64_t)&v51);
  uint64_t v49 = *(unsigned __int8 *)(*((void *)v18 - 1) + 80);
  uint64_t v19 = (v49 + 320) & ~v49;
  uint64_t v47 = *(void *)(*((void *)v18 - 1) + 64);
  uint64_t v20 = *(void *)(v50 - 8);
  uint64_t v46 = *(unsigned __int8 *)(v20 + 80);
  swift_unknownObjectRelease();
  uint64_t v48 = v19;
  uint64_t v21 = v0 + v19;
  if (*(void *)(v0 + v19 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + v19);
  }
  swift_release();
  sub_24EC63FA4();
  uint64_t v22 = v21 + v18[78];
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v23 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  uint64_t v24 = v21 + v18[79];
  uint64_t v25 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  uint64_t v26 = v21 + v18[80];
  uint64_t v27 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
  uint64_t v28 = v21 + v18[81];
  uint64_t v29 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
  uint64_t v30 = v21 + v18[82];
  uint64_t v31 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
  uint64_t v32 = v21 + v18[83];
  sub_24EC779D0();
  uint64_t v51 = v45;
  uint64_t v52 = v44;
  uint64_t v53 = v43;
  uint64_t v54 = v42;
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v33 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
  uint64_t v34 = v21 + v18[84];
  uint64_t v35 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
  uint64_t v36 = v21 + v18[85];
  uint64_t v37 = sub_24EC77CE0();
  uint64_t v38 = *(void *)(v37 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37)) {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
  }
  uint64_t v39 = v21 + v18[86];
  uint64_t v40 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(v39, v40);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v0 + ((v48 + v47 + v46) & ~v46), v50);
  return swift_deallocObject();
}

uint64_t sub_24EC68B3C(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v44 = v1[4];
  uint64_t v42 = v1[6];
  uint64_t v43 = v1[5];
  uint64_t v4 = v1[8];
  uint64_t v41 = v1[7];
  uint64_t v5 = v1[10];
  uint64_t v40 = v1[9];
  uint64_t v6 = v1[12];
  uint64_t v39 = v1[11];
  uint64_t v27 = v1[13];
  uint64_t v7 = v1[15];
  uint64_t v38 = v1[14];
  uint64_t v8 = v1[17];
  uint64_t v37 = v1[16];
  uint64_t v9 = v1[19];
  uint64_t v36 = v1[18];
  uint64_t v10 = v1[21];
  uint64_t v35 = v1[20];
  uint64_t v11 = v1[23];
  uint64_t v34 = v1[22];
  uint64_t v12 = v1[24];
  uint64_t v49 = v1[25];
  uint64_t v47 = v1[26];
  uint64_t v13 = v1[28];
  uint64_t v33 = v1[27];
  uint64_t v14 = v1[30];
  uint64_t v32 = v1[29];
  uint64_t v31 = v1[31];
  uint64_t v46 = v1[32];
  uint64_t v25 = v1[33];
  uint64_t v24 = v1[34];
  uint64_t v23 = v1[35];
  uint64_t v22 = v1[36];
  uint64_t v21 = v1[37];
  uint64_t v20 = v1[38];
  uint64_t v26 = v1[39];
  _OWORD v3[2] = v44;
  v3[3] = v43;
  v3[4] = v42;
  v3[5] = v41;
  v3[6] = v4;
  v3[7] = v40;
  v3[8] = v5;
  v3[9] = v39;
  v3[10] = v6;
  v3[11] = v27;
  v3[12] = v38;
  v3[13] = v7;
  v3[14] = v37;
  v3[15] = v8;
  v3[16] = v36;
  v3[17] = v9;
  v3[18] = v35;
  v3[19] = v10;
  v3[20] = v34;
  v3[21] = v11;
  v3[22] = v12;
  v3[23] = v49;
  v3[24] = v47;
  v3[25] = v33;
  v3[26] = v13;
  v3[27] = v32;
  v3[28] = v14;
  v3[29] = v31;
  v3[30] = v46;
  v3[31] = v25;
  v3[32] = v24;
  v3[33] = v23;
  v3[34] = v22;
  v3[35] = v21;
  v3[36] = v20;
  v3[37] = v26;
  uint64_t v15 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)(v3 + 2)) - 8);
  unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 320) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v30 = v1[2];
  uint64_t v28 = (uint64_t)v1 + v16;
  uint64_t v29 = v1[3];
  uint64_t v17 = (uint64_t)v1
      + ((v16 + *(void *)(v15 + 64) + *(unsigned __int8 *)(*(void *)(v27 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v27 - 8) + 80));
  uint64_t v18 = (void *)swift_task_alloc();
  v3[38] = v18;
  *uint64_t v18 = v3;
  v18[1] = sub_24EC6A834;
  return sub_24EC60524(a1, v30, v29, v28, v17, v44, v43, v42);
}

uint64_t sub_24EC68EA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24EC68EFC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC68FD8;
  return v6(a1);
}

uint64_t sub_24EC68FD8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EC690D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24EC69108(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EC56BC8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269962270 + dword_269962270);
  return v6(a1, v4);
}

uint64_t sub_24EC691C4(uint64_t a1)
{
  uint64_t v45 = v1[4];
  uint64_t v43 = v1[6];
  uint64_t v44 = v1[5];
  uint64_t v3 = v1[8];
  uint64_t v42 = v1[7];
  uint64_t v4 = v1[10];
  uint64_t v41 = v1[9];
  uint64_t v5 = v1[12];
  uint64_t v40 = v1[11];
  uint64_t v6 = v1[14];
  uint64_t v39 = v1[13];
  uint64_t v7 = v1[16];
  uint64_t v38 = v1[15];
  uint64_t v8 = v1[18];
  uint64_t v37 = v1[17];
  uint64_t v9 = v1[20];
  uint64_t v36 = v1[19];
  uint64_t v10 = v1[22];
  uint64_t v35 = v1[21];
  uint64_t v11 = v1[24];
  uint64_t v34 = v1[23];
  uint64_t v33 = v1[25];
  uint64_t v51 = v1[26];
  uint64_t v12 = v1[28];
  uint64_t v32 = v1[27];
  uint64_t v13 = v1[30];
  uint64_t v31 = v1[29];
  uint64_t v49 = v1[31];
  uint64_t v48 = v1[32];
  uint64_t v47 = v1[33];
  uint64_t v26 = v1[34];
  uint64_t v25 = v1[35];
  uint64_t v24 = v1[36];
  uint64_t v29 = v1[37];
  uint64_t v28 = v1[38];
  uint64_t v27 = v1[39];
  v2[2] = v45;
  v2[3] = v44;
  v2[4] = v43;
  v2[5] = v42;
  v2[6] = v3;
  v2[7] = v41;
  v2[8] = v4;
  v2[9] = v40;
  v2[10] = v5;
  v2[11] = v39;
  v2[12] = v6;
  v2[13] = v38;
  v2[14] = v7;
  v2[15] = v37;
  v2[16] = v8;
  v2[17] = v36;
  v2[18] = v9;
  v2[19] = v35;
  v2[20] = v10;
  v2[21] = v34;
  v2[22] = v11;
  v2[23] = v33;
  v2[24] = v51;
  v2[25] = v32;
  v2[26] = v12;
  v2[27] = v31;
  v2[28] = v13;
  v2[29] = v49;
  v2[30] = v48;
  v2[31] = v47;
  v2[32] = v26;
  v2[33] = v25;
  v2[34] = v24;
  v2[35] = v29;
  v2[36] = v28;
  v2[37] = v27;
  uint64_t v14 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)(v2 + 2)) - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 320) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v14 + 64);
  uint64_t v17 = *(void *)(sub_24EC779D0() - 8);
  unint64_t v18 = (v15 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = v1[2];
  uint64_t v30 = v1[3];
  uint64_t v20 = (uint64_t)v1 + v15;
  uint64_t v21 = (uint64_t)v1 + v18;
  uint64_t v22 = (void *)swift_task_alloc();
  v2[38] = v22;
  *uint64_t v22 = v2;
  v22[1] = sub_24EC6A834;
  return sub_24EC5FB00(a1, v19, v30, v20, v21, v45, v44, v43);
}

uint64_t objectdestroy_44Tm()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v7 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 120);
  uint64_t v10 = *(void *)(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 152);
  uint64_t v13 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 200);
  uint64_t v14 = *(void *)(v0 + 224);
  uint64_t v15 = *(void *)(v0 + 296);
  uint64_t v51 = *(void *)(v0 + 32);
  uint64_t v52 = v1;
  uint64_t v53 = v3;
  uint64_t v54 = v2;
  uint64_t v55 = v5;
  uint64_t v56 = v4;
  uint64_t v57 = v6;
  uint64_t v58 = v7;
  long long v59 = *(_OWORD *)(v0 + 96);
  uint64_t v60 = v8;
  uint64_t v61 = v9;
  long long v62 = *(_OWORD *)(v0 + 128);
  uint64_t v44 = v11;
  uint64_t v45 = v10;
  uint64_t v63 = v10;
  uint64_t v64 = v11;
  long long v16 = *(_OWORD *)(v0 + 176);
  long long v65 = *(_OWORD *)(v0 + 160);
  long long v66 = v16;
  uint64_t v67 = v13;
  uint64_t v68 = v12;
  long long v69 = *(_OWORD *)(v0 + 208);
  long long v71 = *(_OWORD *)(v0 + 232);
  long long v72 = *(_OWORD *)(v0 + 248);
  long long v17 = *(_OWORD *)(v0 + 280);
  long long v73 = *(_OWORD *)(v0 + 264);
  long long v74 = v17;
  uint64_t v70 = v14;
  uint64_t v43 = v15;
  uint64_t v75 = v15;
  long long v42 = *(_OWORD *)(v0 + 304);
  long long v76 = v42;
  unint64_t v18 = (int *)type metadata accessor for CanvasView(0, (uint64_t)&v51);
  uint64_t v49 = *(unsigned __int8 *)(*((void *)v18 - 1) + 80);
  uint64_t v19 = (v49 + 320) & ~v49;
  uint64_t v47 = *(void *)(*((void *)v18 - 1) + 64);
  uint64_t v50 = sub_24EC779D0();
  uint64_t v20 = *(void *)(v50 - 8);
  uint64_t v46 = *(unsigned __int8 *)(v20 + 80);
  swift_unknownObjectRelease();
  uint64_t v48 = v19;
  uint64_t v21 = v0 + v19;
  if (*(void *)(v0 + v19 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + v19);
  }
  swift_release();
  sub_24EC63FA4();
  uint64_t v22 = v21 + v18[78];
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v23 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v23 - 8) + 8))(v22, v23);
  uint64_t v24 = v21 + v18[79];
  uint64_t v25 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  uint64_t v26 = v21 + v18[80];
  uint64_t v27 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
  uint64_t v28 = v21 + v18[81];
  uint64_t v29 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
  uint64_t v30 = v21 + v18[82];
  uint64_t v31 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
  uint64_t v32 = v21 + v18[83];
  uint64_t v51 = v45;
  uint64_t v52 = v44;
  uint64_t v53 = v43;
  uint64_t v54 = v42;
  sub_24EC77BC0();
  swift_getTupleTypeMetadata3();
  uint64_t v33 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
  uint64_t v34 = v21 + v18[84];
  uint64_t v35 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
  uint64_t v36 = v21 + v18[85];
  uint64_t v37 = sub_24EC77CE0();
  uint64_t v38 = *(void *)(v37 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37)) {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v36, v37);
  }
  uint64_t v39 = v21 + v18[86];
  uint64_t v40 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v40 - 8) + 8))(v39, v40);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v0 + ((v48 + v47 + v46) & ~v46), v50);
  return swift_deallocObject();
}

uint64_t sub_24EC69B30(uint64_t a1)
{
  uint64_t v45 = v1[4];
  uint64_t v43 = v1[6];
  uint64_t v44 = v1[5];
  uint64_t v3 = v1[8];
  uint64_t v42 = v1[7];
  uint64_t v4 = v1[10];
  uint64_t v41 = v1[9];
  uint64_t v5 = v1[12];
  uint64_t v40 = v1[11];
  uint64_t v6 = v1[14];
  uint64_t v39 = v1[13];
  uint64_t v7 = v1[16];
  uint64_t v38 = v1[15];
  uint64_t v8 = v1[18];
  uint64_t v37 = v1[17];
  uint64_t v9 = v1[20];
  uint64_t v36 = v1[19];
  uint64_t v10 = v1[22];
  uint64_t v35 = v1[21];
  uint64_t v11 = v1[24];
  uint64_t v34 = v1[23];
  uint64_t v33 = v1[25];
  uint64_t v51 = v1[26];
  uint64_t v12 = v1[28];
  uint64_t v32 = v1[27];
  uint64_t v13 = v1[30];
  uint64_t v31 = v1[29];
  uint64_t v49 = v1[31];
  uint64_t v48 = v1[32];
  uint64_t v47 = v1[33];
  uint64_t v26 = v1[34];
  uint64_t v25 = v1[35];
  uint64_t v24 = v1[36];
  uint64_t v29 = v1[37];
  uint64_t v28 = v1[38];
  uint64_t v27 = v1[39];
  v2[2] = v45;
  v2[3] = v44;
  v2[4] = v43;
  v2[5] = v42;
  v2[6] = v3;
  v2[7] = v41;
  v2[8] = v4;
  v2[9] = v40;
  v2[10] = v5;
  v2[11] = v39;
  v2[12] = v6;
  v2[13] = v38;
  v2[14] = v7;
  v2[15] = v37;
  v2[16] = v8;
  v2[17] = v36;
  v2[18] = v9;
  v2[19] = v35;
  v2[20] = v10;
  v2[21] = v34;
  v2[22] = v11;
  v2[23] = v33;
  v2[24] = v51;
  v2[25] = v32;
  v2[26] = v12;
  v2[27] = v31;
  v2[28] = v13;
  v2[29] = v49;
  v2[30] = v48;
  v2[31] = v47;
  v2[32] = v26;
  v2[33] = v25;
  v2[34] = v24;
  v2[35] = v29;
  v2[36] = v28;
  v2[37] = v27;
  uint64_t v14 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)(v2 + 2)) - 8);
  unint64_t v15 = (*(unsigned __int8 *)(v14 + 80) + 320) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v14 + 64);
  uint64_t v17 = *(void *)(sub_24EC779D0() - 8);
  unint64_t v18 = (v15 + v16 + *(unsigned __int8 *)(v17 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = v1[2];
  uint64_t v30 = v1[3];
  uint64_t v20 = (uint64_t)v1 + v15;
  uint64_t v21 = (uint64_t)v1 + v18;
  uint64_t v22 = (void *)swift_task_alloc();
  v2[38] = v22;
  *uint64_t v22 = v2;
  v22[1] = sub_24EC69EB8;
  return sub_24EC5EE48(a1, v19, v30, v20, v21, v45, v44, v43);
}

uint64_t sub_24EC69EB8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EC69FAC()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 72);
  uint64_t v8 = *(void *)(v0 + 96);
  uint64_t v9 = *(void *)(v0 + 104);
  uint64_t v10 = *(void *)(v0 + 128);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v13 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 184);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v15 = *(void *)(v0 + 280);
  uint64_t v47 = *(void *)(v0 + 16);
  uint64_t v48 = v2;
  uint64_t v49 = v1;
  uint64_t v50 = v4;
  uint64_t v51 = v3;
  uint64_t v52 = v6;
  uint64_t v53 = v5;
  uint64_t v54 = v7;
  long long v55 = *(_OWORD *)(v0 + 80);
  uint64_t v56 = v8;
  uint64_t v57 = v9;
  long long v58 = *(_OWORD *)(v0 + 112);
  uint64_t v59 = v10;
  uint64_t v60 = v11;
  long long v16 = *(_OWORD *)(v0 + 160);
  long long v61 = *(_OWORD *)(v0 + 144);
  long long v62 = v16;
  uint64_t v63 = v13;
  uint64_t v64 = v12;
  long long v65 = *(_OWORD *)(v0 + 192);
  long long v67 = *(_OWORD *)(v0 + 216);
  long long v68 = *(_OWORD *)(v0 + 232);
  long long v69 = *(_OWORD *)(v0 + 248);
  long long v70 = *(_OWORD *)(v0 + 264);
  uint64_t v66 = v14;
  uint64_t v71 = v15;
  long long v72 = *(_OWORD *)(v0 + 288);
  uint64_t v45 = v72;
  uint64_t v17 = (int *)type metadata accessor for CanvasView(0, (uint64_t)&v47);
  uint64_t v43 = *(void *)(*((void *)v17 - 1) + 64);
  uint64_t v44 = *(unsigned __int8 *)(*((void *)v17 - 1) + 80);
  uint64_t v47 = v10;
  uint64_t v48 = v11;
  uint64_t v18 = (v44 + 304) & ~v44;
  uint64_t v49 = v15;
  uint64_t v50 = v45;
  uint64_t v46 = sub_24EC77BC0();
  uint64_t v19 = *(void *)(v46 - 8);
  uint64_t v41 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v42 = v18;
  uint64_t v20 = v0 + v18;
  if (*(void *)(v0 + v18 + 24)) {
    __swift_destroy_boxed_opaque_existential_1(v0 + v18);
  }
  swift_release();
  sub_24EC63FA4();
  uint64_t v21 = v20 + v17[78];
  sub_24EC78080();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B1D9D48);
  swift_getTupleTypeMetadata3();
  uint64_t v22 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v22 - 8) + 8))(v21, v22);
  uint64_t v23 = v20 + v17[79];
  uint64_t v24 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v24 - 8) + 8))(v23, v24);
  uint64_t v25 = v20 + v17[80];
  uint64_t v26 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v25, v26);
  uint64_t v27 = v20 + v17[81];
  uint64_t v28 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8))(v27, v28);
  uint64_t v29 = v20 + v17[82];
  uint64_t v30 = sub_24EC77C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8))(v29, v30);
  uint64_t v31 = v20 + v17[83];
  sub_24EC779D0();
  swift_getTupleTypeMetadata3();
  uint64_t v32 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8))(v31, v32);
  uint64_t v33 = v20 + v17[84];
  uint64_t v34 = sub_24EC77A00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v34 - 8) + 8))(v33, v34);
  uint64_t v35 = v20 + v17[85];
  uint64_t v36 = sub_24EC77CE0();
  uint64_t v37 = *(void *)(v36 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36)) {
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v35, v36);
  }
  uint64_t v38 = v20 + v17[86];
  uint64_t v39 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v39 - 8) + 8))(v38, v39);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v0 + ((v42 + v43 + v41) & ~v41), v46);
  return swift_deallocObject();
}

uint64_t sub_24EC6A570()
{
  uint64_t v40 = v0[4];
  uint64_t v41 = v0[3];
  uint64_t v38 = v0[6];
  uint64_t v39 = v0[5];
  uint64_t v36 = v0[8];
  uint64_t v37 = v0[7];
  uint64_t v34 = v0[10];
  uint64_t v35 = v0[9];
  uint64_t v32 = v0[12];
  uint64_t v33 = v0[11];
  uint64_t v30 = v0[14];
  uint64_t v31 = v0[13];
  uint64_t v14 = v0[16];
  uint64_t v42 = v0[17];
  uint64_t v28 = v0[18];
  uint64_t v29 = v0[15];
  uint64_t v26 = v0[20];
  uint64_t v27 = v0[19];
  uint64_t v24 = v0[22];
  uint64_t v25 = v0[21];
  uint64_t v22 = v0[24];
  uint64_t v23 = v0[23];
  uint64_t v20 = v0[26];
  uint64_t v21 = v0[25];
  uint64_t v18 = v0[28];
  uint64_t v19 = v0[27];
  uint64_t v16 = v0[30];
  uint64_t v17 = v0[29];
  uint64_t v43 = v0[31];
  uint64_t v45 = v0[2];
  uint64_t v44 = v45;
  uint64_t v46 = v41;
  uint64_t v47 = v40;
  uint64_t v48 = v39;
  uint64_t v49 = v38;
  uint64_t v50 = v37;
  uint64_t v51 = v36;
  uint64_t v52 = v35;
  uint64_t v53 = v34;
  uint64_t v54 = v33;
  uint64_t v55 = v32;
  uint64_t v56 = v31;
  uint64_t v57 = v30;
  uint64_t v58 = v29;
  uint64_t v59 = v14;
  uint64_t v60 = v42;
  uint64_t v61 = v28;
  uint64_t v62 = v27;
  uint64_t v63 = v26;
  uint64_t v64 = v25;
  uint64_t v65 = v24;
  uint64_t v66 = v23;
  uint64_t v67 = v22;
  uint64_t v68 = v21;
  uint64_t v69 = v20;
  uint64_t v70 = v19;
  uint64_t v71 = v18;
  uint64_t v72 = v17;
  uint64_t v73 = v16;
  uint64_t v74 = v43;
  uint64_t v1 = v0[33];
  uint64_t v75 = v0[32];
  uint64_t v15 = v75;
  uint64_t v76 = v1;
  uint64_t v3 = v0[35];
  uint64_t v77 = v0[34];
  uint64_t v2 = v77;
  uint64_t v78 = v3;
  uint64_t v5 = v0[37];
  uint64_t v79 = v0[36];
  uint64_t v4 = v79;
  uint64_t v80 = v5;
  uint64_t v6 = *(void *)(type metadata accessor for CanvasView(0, (uint64_t)&v45) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v45 = v14;
  uint64_t v46 = v42;
  uint64_t v9 = (v7 + 304) & ~v7;
  uint64_t v47 = v3;
  uint64_t v48 = v4;
  uint64_t v10 = *(void *)(sub_24EC77BC0() - 8);
  *(void *)&long long v13 = v4;
  *((void *)&v13 + 1) = v5;
  *(void *)&long long v12 = v24;
  *((void *)&v12 + 1) = v23;
  return sub_24EC6396C((uint64_t)v0 + v9, (uint64_t)v0+ ((v9 + v8 + *(unsigned __int8 *)(v10 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v44, v41, v40, v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v14, v42,
           v28,
           v27,
           v26,
           v25,
           v12,
           v22,
           v21,
           v20,
           v19,
           v18,
           v17,
           v16,
           v43,
           v15,
           v1,
           v2,
           v3,
           v13);
}

BOOL static CanvasInsetBehavior.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

BOOL sub_24EC6A848(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24EC6A864()
{
  return sub_24EC782F0();
}

uint64_t sub_24EC6A894()
{
  if (*v0) {
    return 0x6F5465726F6E6769;
  }
  else {
    return 0x746C7561666564;
  }
}

uint64_t sub_24EC6A8D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24EC6AFBC(a1, a2);
  *a3 = result;
  return result;
}

void sub_24EC6A8FC(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24EC6A908(uint64_t a1)
{
  unint64_t v2 = sub_24EC6AD5C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC6A944(uint64_t a1)
{
  unint64_t v2 = sub_24EC6AD5C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC6A980@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_24EC6A9B0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24EC6A9BC(uint64_t a1)
{
  unint64_t v2 = sub_24EC6AE04();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC6A9F8(uint64_t a1)
{
  unint64_t v2 = sub_24EC6AE04();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_24EC6AA34(uint64_t a1)
{
  unint64_t v2 = sub_24EC6ADB0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24EC6AA70(uint64_t a1)
{
  unint64_t v2 = sub_24EC6ADB0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CanvasInsetBehavior.encode(to:)(void *a1, int a2)
{
  int v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699622A0);
  uint64_t v16 = *(void *)(v3 - 8);
  uint64_t v17 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699622A8);
  uint64_t v6 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2699622B0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  long long v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24EC6AD5C();
  sub_24EC78320();
  long long v13 = (uint64_t (**)(char *, uint64_t))(v10 + 8);
  if (v18)
  {
    char v20 = 1;
    sub_24EC6ADB0();
    sub_24EC78220();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {
    char v19 = 0;
    sub_24EC6AE04();
    sub_24EC78220();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  return (*v13)(v12, v9);
}

unint64_t sub_24EC6AD5C()
{
  unint64_t result = qword_2699622B8;
  if (!qword_2699622B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622B8);
  }
  return result;
}

unint64_t sub_24EC6ADB0()
{
  unint64_t result = qword_2699622C0;
  if (!qword_2699622C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622C0);
  }
  return result;
}

unint64_t sub_24EC6AE04()
{
  unint64_t result = qword_2699622C8;
  if (!qword_2699622C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622C8);
  }
  return result;
}

uint64_t CanvasInsetBehavior.init(from:)(uint64_t a1)
{
  return sub_24EC6B0BC(a1) & 1;
}

uint64_t sub_24EC6AE74@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_24EC6B0BC(a1);
  if (!v2) {
    *a2 = result & 1;
  }
  return result;
}

uint64_t sub_24EC6AEA4(void *a1)
{
  return CanvasInsetBehavior.encode(to:)(a1, *v1);
}

uint64_t CanvasInsetBehavior.hash(into:)()
{
  return sub_24EC782F0();
}

uint64_t CanvasInsetBehavior.hashValue.getter()
{
  return sub_24EC78300();
}

uint64_t sub_24EC6AF30()
{
  return sub_24EC78300();
}

uint64_t sub_24EC6AF78()
{
  return sub_24EC78300();
}

uint64_t sub_24EC6AFBC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x746C7561666564 && a2 == 0xE700000000000000;
  if (v2 || (sub_24EC78290() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F5465726F6E6769 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_24EC78290();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_24EC6B0BC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269962310);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v22 = v2;
  uint64_t v23 = v3;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269962318);
  uint64_t v25 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269962320);
  uint64_t v24 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((void *)a1, *(void *)(a1 + 24));
  sub_24EC6AD5C();
  uint64_t v12 = v26;
  sub_24EC78310();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v13 = v25;
  uint64_t v21 = v6;
  uint64_t v26 = a1;
  uint64_t v14 = sub_24EC78200();
  if (*(void *)(v14 + 16) != 1)
  {
    uint64_t v16 = sub_24EC78100();
    swift_allocError();
    int v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269961F40);
    *int v18 = &type metadata for CanvasInsetBehavior;
    sub_24EC781B0();
    sub_24EC780F0();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v16 - 8) + 104))(v18, *MEMORY[0x263F8DCB0], v16);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v9);
    a1 = v26;
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1(a1);
    return a1;
  }
  a1 = *(unsigned __int8 *)(v14 + 32);
  if (a1)
  {
    LODWORD(v25) = *(unsigned __int8 *)(v14 + 32);
    char v28 = 1;
    sub_24EC6ADB0();
    sub_24EC781A0();
    uint64_t v15 = v24;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v11, v9);
    a1 = v25;
  }
  else
  {
    char v27 = 0;
    sub_24EC6AE04();
    sub_24EC781A0();
    uint64_t v19 = v24;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v21);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v9);
  }
  __swift_destroy_boxed_opaque_existential_1(v26);
  return a1;
}

unint64_t sub_24EC6B510()
{
  unint64_t result = qword_2699622D0;
  if (!qword_2699622D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CanvasInsetBehavior()
{
  return &type metadata for CanvasInsetBehavior;
}

uint64_t _s13FitnessCanvas19CanvasInsetBehaviorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s13FitnessCanvas19CanvasInsetBehaviorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24EC6B6D8);
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

unsigned char *sub_24EC6B700(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CanvasInsetBehavior.CodingKeys()
{
  return &type metadata for CanvasInsetBehavior.CodingKeys;
}

ValueMetadata *type metadata accessor for CanvasInsetBehavior.DefaultCodingKeys()
{
  return &type metadata for CanvasInsetBehavior.DefaultCodingKeys;
}

ValueMetadata *type metadata accessor for CanvasInsetBehavior.IgnoreTopCodingKeys()
{
  return &type metadata for CanvasInsetBehavior.IgnoreTopCodingKeys;
}

unint64_t sub_24EC6B740()
{
  unint64_t result = qword_2699622D8;
  if (!qword_2699622D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622D8);
  }
  return result;
}

unint64_t sub_24EC6B798()
{
  unint64_t result = qword_2699622E0;
  if (!qword_2699622E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622E0);
  }
  return result;
}

unint64_t sub_24EC6B7F0()
{
  unint64_t result = qword_2699622E8;
  if (!qword_2699622E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622E8);
  }
  return result;
}

unint64_t sub_24EC6B848()
{
  unint64_t result = qword_2699622F0;
  if (!qword_2699622F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622F0);
  }
  return result;
}

unint64_t sub_24EC6B8A0()
{
  unint64_t result = qword_2699622F8;
  if (!qword_2699622F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2699622F8);
  }
  return result;
}

unint64_t sub_24EC6B8F8()
{
  unint64_t result = qword_269962300;
  if (!qword_269962300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269962300);
  }
  return result;
}

unint64_t sub_24EC6B950()
{
  unint64_t result = qword_269962308;
  if (!qword_269962308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269962308);
  }
  return result;
}

uint64_t CanvasFeature.init(environment:fetcher:)@<X0>(long long *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, long long a16, uint64_t a17, uint64_t a18)
{
  uint64_t v53 = a8;
  *(void *)&long long v52 = a7;
  uint64_t v54 = a2;
  *(void *)&long long v51 = a18;
  *(void *)&long long v50 = a17;
  long long v49 = a16;
  long long v48 = a15;
  long long v47 = a14;
  long long v46 = a13;
  long long v45 = a12;
  long long v44 = a11;
  long long v43 = a10;
  uint64_t v24 = sub_24EC779C0();
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  char v27 = (char *)&v43 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v43 - v29;
  sub_24EC779B0();
  v56[0] = a3;
  v56[1] = a4;
  v56[2] = a5;
  v56[3] = a6;
  v56[4] = v52;
  v56[5] = v53;
  long long v57 = v43;
  long long v58 = v44;
  long long v59 = v45;
  long long v60 = v46;
  long long v61 = v47;
  long long v62 = v48;
  long long v63 = v49;
  uint64_t v64 = v50;
  uint64_t v65 = v51;
  uint64_t v31 = (char *)a9 + *(int *)(type metadata accessor for CanvasFeature(0, (uint64_t)v56) + 200);
  uint64_t v53 = v25;
  uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  long long v51 = *a1;
  long long v50 = a1[1];
  long long v52 = a1[2];
  v32(v31, v30, v24);
  long long v33 = v50;
  *a9 = v51;
  a9[1] = v33;
  a9[2] = v52;
  sub_24EC6732C(v54, (uint64_t)(a9 + 3));
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v34 = sub_24EC77C90();
  __swift_project_value_buffer(v34, (uint64_t)qword_26B1DB4E0);
  v32(v27, v30, v24);
  uint64_t v35 = sub_24EC77C70();
  os_log_type_t v36 = sub_24EC78070();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v56[0] = v38;
    *(_DWORD *)uint64_t v37 = 136315138;
    sub_24EC4AC4C(&qword_26B1D91D0);
    uint64_t v39 = sub_24EC78280();
    uint64_t v55 = sub_24EC7437C(v39, v40, v56);
    sub_24EC78090();
    swift_bridgeObjectRelease();
    uint64_t v41 = *(void (**)(char *, uint64_t))(v53 + 8);
    v41(v27, v24);
    _os_log_impl(&dword_24EC46000, v35, v36, "Canvas Feature %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v38, -1, -1);
    MEMORY[0x25334BDC0](v37, -1, -1);
  }
  else
  {

    uint64_t v41 = *(void (**)(char *, uint64_t))(v53 + 8);
    v41(v27, v24);
  }
  __swift_destroy_boxed_opaque_existential_1(v54);
  return ((uint64_t (*)(char *, uint64_t))v41)(v30, v24);
}

uint64_t type metadata accessor for CanvasFeature(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasFeature);
}

uint64_t sub_24EC6BE64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24EC779C0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v9 = MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v11, v2, a2, v9);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 3u:
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v11, v4);
      sub_24EC782F0();
      sub_24EC4AC4C(&qword_26B1D91C0);
      sub_24EC77E80();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      break;
    default:
      sub_24EC782F0();
      sub_24EC77EB0();
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t sub_24EC6C09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, long long a11, long long a12, long long a13, long long a14, long long a15, uint64_t a16, uint64_t a17)
{
  uint64_t v72 = a2;
  uint64_t v71 = a1;
  long long v70 = a15;
  long long v69 = a14;
  long long v68 = a13;
  long long v67 = a12;
  long long v66 = a11;
  long long v65 = a10;
  long long v64 = a9;
  uint64_t v63 = sub_24EC779C0();
  uint64_t v62 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  long long v61 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73[0] = a3;
  v73[1] = a4;
  v73[2] = a5;
  v73[3] = a6;
  v73[4] = a7;
  v73[5] = a8;
  long long v74 = a9;
  long long v75 = a10;
  long long v76 = a11;
  long long v77 = a12;
  long long v78 = a13;
  long long v79 = a14;
  long long v80 = a15;
  uint64_t v81 = a16;
  uint64_t v82 = a17;
  uint64_t v24 = type metadata accessor for CanvasFeature.TaskIdentifier(0, (uint64_t)v73);
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  char v27 = (char *)&v60 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (uint64_t *)((char *)&v60 - v29);
  MEMORY[0x270FA5388](v31);
  long long v33 = (uint64_t *)((char *)&v60 - v32);
  MEMORY[0x270FA5388](v34);
  os_log_type_t v36 = (uint64_t *)((char *)&v60 - v35);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(void *)&long long v70 = *(void *)(TupleTypeMetadata2 - 8);
  double v38 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  unint64_t v40 = (char *)&v60 - v39;
  uint64_t v42 = (uint64_t *)((char *)&v60 + *(int *)(v41 + 48) - v39);
  *(void *)&long long v69 = v25;
  long long v43 = *(void (**)(char *, uint64_t, uint64_t, double))(v25 + 16);
  v43((char *)&v60 - v39, v71, v24, v38);
  ((void (*)(void *, uint64_t, uint64_t))v43)(v42, v72, v24);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      ((void (*)(uint64_t *, char *, uint64_t))v43)(v33, v40, v24);
      uint64_t v50 = *v33;
      uint64_t v49 = v33[1];
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_20;
      }
      if (v50 == *v42 && v49 == v42[1]) {
        goto LABEL_23;
      }
      goto LABEL_19;
    case 2u:
      ((void (*)(uint64_t *, char *, uint64_t))v43)(v30, v40, v24);
      uint64_t v53 = *v30;
      uint64_t v52 = v30[1];
      if (swift_getEnumCaseMultiPayload() != 2) {
        goto LABEL_20;
      }
      if (v53 == *v42 && v52 == v42[1])
      {
LABEL_23:
        swift_bridgeObjectRelease_n();
        char v48 = 1;
      }
      else
      {
LABEL_19:
        char v48 = sub_24EC78290();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      goto LABEL_24;
    case 3u:
      ((void (*)(char *, char *, uint64_t))v43)(v27, v40, v24);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        (*(void (**)(char *, uint64_t))(v62 + 8))(v27, v63);
        goto LABEL_26;
      }
      uint64_t v55 = v62;
      uint64_t v56 = v61;
      uint64_t v57 = v63;
      (*(void (**)(char *, void *, uint64_t))(v62 + 32))(v61, v42, v63);
      char v48 = sub_24EC779A0();
      long long v58 = *(void (**)(char *, uint64_t))(v55 + 8);
      v58(v56, v57);
      v58(v27, v57);
LABEL_24:
      uint64_t v47 = v69;
      break;
    default:
      ((void (*)(uint64_t *, char *, uint64_t))v43)(v36, v40, v24);
      uint64_t v45 = *v36;
      uint64_t v44 = v36[1];
      if (swift_getEnumCaseMultiPayload())
      {
LABEL_20:
        swift_bridgeObjectRelease();
LABEL_26:
        char v48 = 0;
        uint64_t v47 = v70;
        uint64_t v24 = TupleTypeMetadata2;
      }
      else
      {
        BOOL v46 = v45 == *v42 && v44 == v42[1];
        uint64_t v47 = v69;
        if (v46)
        {
          swift_bridgeObjectRelease_n();
          char v48 = 1;
        }
        else
        {
          char v48 = sub_24EC78290();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      break;
  }
  (*(void (**)(char *, uint64_t))(v47 + 8))(v40, v24);
  return v48 & 1;
}

uint64_t sub_24EC6C694(uint64_t a1)
{
  sub_24EC782E0();
  sub_24EC6BE64((uint64_t)v3, a1);
  return sub_24EC78300();
}

uint64_t sub_24EC6C6E4(uint64_t a1, uint64_t a2)
{
  sub_24EC782E0();
  sub_24EC6BE64((uint64_t)v4, a2);
  return sub_24EC78300();
}

uint64_t sub_24EC6C728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24EC6C09C(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24), *(void *)(a3 + 32), *(void *)(a3 + 40), *(void *)(a3 + 48), *(void *)(a3 + 56), *(_OWORD *)(a3 + 64), *(_OWORD *)(a3 + 80), *(_OWORD *)(a3 + 96), *(_OWORD *)(a3 + 112), *(_OWORD *)(a3 + 128), *(_OWORD *)(a3 + 144), *(_OWORD *)(a3 + 160), *(void *)(a3 + 176), *(void *)(a3 + 184)) & 1;
}

uint64_t CanvasFeature.reduce(localState:sharedState:sideEffects:action:)(NSObject *a1, uint64_t *a2, uint64_t a3, void (*a4)(char *, char *, uint64_t), void *a5)
{
  unint64_t v425 = a4;
  uint64_t v414 = a3;
  unint64_t v431 = a2;
  uint64_t v394 = a1;
  uint64_t v6 = a5[3];
  uint64_t v434 = a5[2];
  uint64_t v435 = v6;
  uint64_t v7 = a5[5];
  uint64_t v436 = a5[4];
  uint64_t v8 = a5[7];
  uint64_t v433 = a5[6];
  uint64_t v432 = v8;
  uint64_t v9 = a5[9];
  uint64_t v437 = a5[8];
  uint64_t v429 = v9;
  uint64_t v10 = a5[11];
  uint64_t v428 = a5[10];
  uint64_t v438 = v10;
  uint64_t v11 = a5[13];
  uint64_t v439 = a5[12];
  uint64_t v440 = v11;
  uint64_t v13 = a5[14];
  uint64_t v12 = a5[15];
  uint64_t v15 = a5[16];
  uint64_t v14 = a5[17];
  uint64_t v16 = a5[19];
  uint64_t v441 = a5[18];
  uint64_t v17 = a5[20];
  uint64_t v442 = a5[21];
  uint64_t v18 = a5[23];
  uint64_t v430 = a5[22];
  uint64_t v444 = (void *)v434;
  uint64_t v445 = v6;
  uint64_t v446 = v436;
  uint64_t v447 = v7;
  uint64_t v448 = v433;
  uint64_t v449 = v8;
  uint64_t v450 = v437;
  uint64_t v451 = v9;
  uint64_t v452 = v428;
  uint64_t v453 = v10;
  uint64_t v454 = v439;
  uint64_t v455 = v11;
  uint64_t v456 = v13;
  uint64_t v457 = v12;
  uint64_t v458 = v15;
  uint64_t v459 = v14;
  uint64_t v460 = v441;
  uint64_t v461 = v16;
  uint64_t v462 = v17;
  uint64_t v463 = v442;
  uint64_t v464 = v430;
  uint64_t v465 = v18;
  uint64_t v424 = (void (*)(char *, char *, uint64_t))type metadata accessor for CanvasAction(255, (uint64_t)&v444);
  uint64_t v19 = sub_24EC77DF0();
  uint64_t v388 = sub_24EC78080();
  uint64_t v387 = *(uint64_t (***)(char *, uint64_t))(v388 - 8);
  MEMORY[0x270FA5388](v388);
  uint64_t v391 = (char *)&v373 - v20;
  uint64_t v393 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t WitnessTable = (char *)&v373 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v444 = (void *)v434;
  uint64_t v445 = v435;
  uint64_t v446 = v436;
  uint64_t v427 = v7;
  uint64_t v447 = v7;
  uint64_t v448 = v433;
  uint64_t v449 = v432;
  uint64_t v450 = v437;
  uint64_t v23 = v428;
  uint64_t v451 = v429;
  uint64_t v452 = v428;
  uint64_t v453 = v438;
  uint64_t v454 = v439;
  uint64_t v455 = v440;
  uint64_t v456 = v13;
  uint64_t v419 = v13;
  uint64_t v24 = v429;
  uint64_t v420 = v12;
  uint64_t v457 = v12;
  uint64_t v458 = v15;
  uint64_t v418 = v15;
  uint64_t v426 = v14;
  uint64_t v459 = v14;
  uint64_t v460 = v441;
  uint64_t v421 = v16;
  uint64_t v461 = v16;
  uint64_t v462 = v17;
  uint64_t v422 = v17;
  uint64_t v25 = v442;
  uint64_t v26 = v430;
  uint64_t v463 = v442;
  uint64_t v464 = v430;
  uint64_t v423 = v18;
  uint64_t v465 = v18;
  uint64_t v406 = type metadata accessor for CanvasFeature.TaskIdentifier(0, (uint64_t)&v444);
  uint64_t v407 = *(void *)(v406 - 8);
  MEMORY[0x270FA5388](v406);
  uint64_t v402 = (uint64_t *)((char *)&v373 - v27);
  uint64_t v410 = v19;
  uint64_t v411 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v373 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v31);
  uint64_t v408 = (uint64_t *)((char *)&v373 - v32);
  uint64_t v396 = sub_24EC779C0();
  uint64_t v395 = *(void *)(v396 - 8);
  MEMORY[0x270FA5388](v396);
  uint64_t v390 = (char *)&v373 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v415 = a5;
  uint64_t v34 = a5;
  uint64_t v35 = v23;
  uint64_t v412 = (char *)*(v34 - 1);
  MEMORY[0x270FA5388](v36);
  uint64_t v384 = (char *)&v373 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v38);
  uint64_t v389 = (char *)&v373 - v39;
  MEMORY[0x270FA5388](v40);
  uint64_t v405 = (char *)&v373 - v41;
  MEMORY[0x270FA5388](v42);
  uint64_t v386 = (char *)&v373 - v43;
  uint64_t v399 = v44;
  MEMORY[0x270FA5388](v45);
  uint64_t v385 = (char *)&v373 - v46;
  uint64_t v444 = (void *)v24;
  uint64_t v445 = v23;
  uint64_t v446 = v25;
  uint64_t v447 = v26;
  uint64_t v417 = sub_24EC77BC0();
  uint64_t v413 = *(void *)(v417 - 8);
  MEMORY[0x270FA5388](v417);
  uint64_t v397 = (char *)&v373 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v48);
  uint64_t v403 = (char *)&v373 - v49;
  MEMORY[0x270FA5388](v50);
  uint64_t v401 = (char *)&v373 - v51;
  uint64_t v400 = v52;
  MEMORY[0x270FA5388](v53);
  uint64_t v404 = (char *)&v373 - v54;
  uint64_t v55 = sub_24EC779D0();
  uint64_t v56 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  long long v58 = (char *)&v373 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = *((void *)v424 - 1);
  MEMORY[0x270FA5388](v60);
  uint64_t v62 = (char *)&v373 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v64 = MEMORY[0x270FA5388](v63);
  long long v66 = (uint64_t *)((char *)&v373 - v65);
  uint64_t v398 = *v431;
  uint64_t v409 = (void *)v431[1];
  uint64_t v68 = v67;
  (*(void (**)(char *, void (*)(char *, char *, uint64_t), double))(v59 + 16))((char *)&v373 - v65, v425, v64);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      (*(void (**)(char *, uint64_t *, uint64_t))(v56 + 32))(v58, v66, v55);
      uint64_t v73 = v416;
      uint64_t v74 = *(void *)(v416 + 72);
      uint64_t v75 = *(void *)(v416 + 80);
      __swift_project_boxed_opaque_existential_1((void *)(v416 + 48), v74);
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 200))(v58, v74, v75);
      (*(void (**)(char *))(v73 + 16))(v58);
      goto LABEL_7;
    case 2u:
      (*(void (**)(char *, uint64_t *, uint64_t))(v56 + 32))(v58, v66, v55);
      uint64_t v76 = v416;
      uint64_t v77 = *(void *)(v416 + 72);
      uint64_t v78 = *(void *)(v416 + 80);
      __swift_project_boxed_opaque_existential_1((void *)(v416 + 48), v77);
      (*(void (**)(char *, uint64_t, uint64_t))(v78 + 208))(v58, v77, v78);
      (*(void (**)(char *))(v76 + 32))(v58);
LABEL_7:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v58, v55);
      break;
    case 3u:
      swift_storeEnumTagMultiPayload();
      CanvasFeature.reduce(localState:sharedState:sideEffects:action:)(v394, v431, v414, v62, v415);
      long long v79 = *(void (**)(char *, uint64_t))(v59 + 8);
      v79(v62, v68);
      uint64_t result = ((uint64_t (*)(uint64_t *, uint64_t))v79)(v66, v68);
      break;
    case 4u:
      uint64_t v80 = *v66;
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t v81 = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      uint64_t v82 = (char *)v431 + *(int *)(v81 + 204);
      uint64_t result = sub_24EC48E8C(*(void *)v82, v82[8]);
      *(void *)uint64_t v82 = v80;
      v82[8] = 0;
      break;
    case 5u:
      swift_bridgeObjectRelease();
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t v83 = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      uint64_t v84 = (uint64_t *)((char *)v431 + *(int *)(v83 + 212));
      uint64_t result = swift_bridgeObjectRelease();
      *uint64_t v84 = 0;
      v84[1] = 0;
      break;
    case 6u:
      uint64_t v85 = v393;
      uint64_t v86 = WitnessTable;
      uint64_t v87 = v427;
      (*(void (**)(char *, uint64_t *, uint64_t))(v393 + 32))(WitnessTable, v66, v427);
      uint64_t v88 = v391;
      (*(void (**)(char *))v416)(v86);
      uint64_t v89 = v411;
      uint64_t v90 = v410;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v411 + 48))(v88, 1, v410) == 1)
      {
        (*(void (**)(char *, uint64_t))(v85 + 8))(v86, v87);
        uint64_t result = v387[1](v88, v388);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v30, v88, v90);
        (*(void (**)(void *, char *, uint64_t))(v89 + 16))(v408, v30, v90);
        sub_24EC77F00();
        sub_24EC77EF0();
        (*(void (**)(char *, uint64_t))(v89 + 8))(v30, v90);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v85 + 8))(v86, v87);
      }
      break;
    case 7u:
      uint64_t v91 = *(void (**)(char *, char *, uint64_t))(v413 + 32);
      unint64_t v425 = (void (*)(char *, char *, uint64_t))(v413 + 32);
      uint64_t v424 = v91;
      v91(v397, (char *)v66, v417);
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v92 = v433;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v93 = v432;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t v94 = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      uint64_t v95 = (char *)v431 + *(int *)(v94 + 204);
      if (v95[8] < 2u || *(void *)v95)
      {
        uint64_t v96 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D50);
        uint64_t v97 = v408;
        unint64_t v431 = (void *)((char *)v408 + v96[12]);
        uint64_t v98 = (char *)v408 + v96[16];
        uint64_t v99 = (char *)v408 + v96[20];
        uint64_t v409 = (void *)((char *)v408 + v96[24]);
        uint64_t v100 = v415;
        uint64_t v101 = v416;
        uint64_t v102 = v402;
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(v395 + 16))(v402, v416 + *((int *)v415 + 50), v396);
        uint64_t v103 = v406;
        swift_storeEnumTagMultiPayload();
        swift_getWitnessTable();
        sub_24EC78190();
        (*(void (**)(uint64_t *, uint64_t))(v407 + 8))(v102, v103);
        uint64_t v104 = *MEMORY[0x263F39580];
        uint64_t v105 = sub_24EC77E30();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v105 - 8) + 104))(v98, v104, v105);
        uint64_t v106 = *MEMORY[0x263F39570];
        uint64_t v107 = sub_24EC77E20();
        (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v107 - 8) + 104))(v99, v106, v107);
        uint64_t v108 = v412;
        uint64_t v109 = v405;
        (*((void (**)(char *, uint64_t, void *))v412 + 2))(v405, v101, v100);
        uint64_t v110 = v93;
        uint64_t v111 = v413;
        uint64_t v112 = v401;
        (*(void (**)(char *, char *, uint64_t))(v413 + 16))(v401, v397, v417);
        unint64_t v113 = (v108[80] + 192) & ~(unint64_t)v108[80];
        unint64_t v114 = (v399 + *(unsigned __int8 *)(v111 + 80) + v113) & ~(unint64_t)*(unsigned __int8 *)(v111 + 80);
        uint64_t v115 = (char *)swift_allocObject();
        uint64_t v116 = v435;
        *((void *)v115 + 2) = v434;
        *((void *)v115 + 3) = v116;
        uint64_t v117 = v427;
        *((void *)v115 + 4) = v436;
        *((void *)v115 + 5) = v117;
        *((void *)v115 + 6) = v433;
        *((void *)v115 + 7) = v110;
        uint64_t v118 = v429;
        *((void *)v115 + 8) = v437;
        *((void *)v115 + 9) = v118;
        uint64_t v119 = v438;
        *((void *)v115 + 10) = v428;
        *((void *)v115 + 11) = v119;
        uint64_t v120 = v440;
        *((void *)v115 + 12) = v439;
        *((void *)v115 + 13) = v120;
        uint64_t v121 = v420;
        *((void *)v115 + 14) = v419;
        *((void *)v115 + 15) = v121;
        uint64_t v122 = v426;
        *((void *)v115 + 16) = v418;
        *((void *)v115 + 17) = v122;
        uint64_t v123 = v421;
        *((void *)v115 + 18) = v441;
        *((void *)v115 + 19) = v123;
        uint64_t v124 = v442;
        *((void *)v115 + 20) = v422;
        *((void *)v115 + 21) = v124;
        uint64_t v125 = v423;
        *((void *)v115 + 22) = v430;
        *((void *)v115 + 23) = v125;
        (*((void (**)(char *, char *, void *))v108 + 4))(&v115[v113], v109, v100);
        uint64_t v126 = v417;
        v424(&v115[v114], v112, v417);
        uint64_t v127 = v409;
        *uint64_t v409 = &unk_269962330;
        v127[1] = v115;
        sub_24EC77F70();
        (*(void (**)(void *, void, uint64_t))(v411 + 104))(v97, *MEMORY[0x263F39530], v410);
        sub_24EC77F00();
        sub_24EC77EF0();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v111 + 8))(v397, v126);
      }
      else
      {
        uint64_t v250 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D50);
        uint64_t v251 = v408;
        uint64_t v385 = (char *)v408 + v250[12];
        uint64_t v252 = (char *)v408 + v250[16];
        uint64_t v253 = (char *)v408 + v250[20];
        uint64_t v379 = v250;
        uint64_t v383 = (void *)((char *)v408 + v250[24]);
        uint64_t v254 = v415;
        uint64_t v255 = v416;
        uint64_t v256 = (char *)(v416 + *((int *)v415 + 50));
        uint64_t v257 = *(void (**)(char *, char *, uint64_t))(v395 + 16);
        unint64_t v258 = v402;
        uint64_t v376 = v395 + 16;
        uint64_t v375 = v257;
        v257((char *)v402, v256, v396);
        uint64_t v259 = v406;
        swift_storeEnumTagMultiPayload();
        swift_bridgeObjectRetain();
        uint64_t WitnessTable = (char *)swift_getWitnessTable();
        sub_24EC78190();
        uint64_t v260 = *(char **)(v407 + 8);
        v407 += 8;
        uint64_t v391 = v260;
        ((void (*)(uint64_t *, uint64_t))v260)(v258, v259);
        uint64_t v261 = *MEMORY[0x263F39580];
        uint64_t v262 = sub_24EC77E30();
        uint64_t v263 = *(void *)(v262 - 8);
        uint64_t v264 = *(uint64_t (***)(char *, uint64_t))(v263 + 104);
        LODWORD(v389) = v261;
        uint64_t v388 = v262;
        uint64_t v387 = v264;
        uint64_t v386 = (char *)(v263 + 104);
        ((void (*)(char *, uint64_t))v264)(v252, v261);
        uint64_t v265 = *MEMORY[0x263F39570];
        uint64_t v266 = sub_24EC77E20();
        uint64_t v267 = *(void *)(v266 - 8);
        uint64_t v268 = *(NSObject **)(v267 + 104);
        uint64_t v403 = (char *)v266;
        uint64_t v394 = v268;
        uint64_t v393 = v267 + 104;
        ((void (*)(char *, uint64_t))v268)(v253, v265);
        uint64_t v269 = v412;
        uint64_t v270 = v405;
        uint64_t v404 = (char *)*((void *)v412 + 2);
        ((void (*)(char *, uint64_t, void *))v404)(v405, v255, v254);
        uint64_t v271 = v269[80];
        uint64_t v272 = (v271 + 192) & ~v271;
        uint64_t v377 = v272 + v399;
        uint64_t v378 = v271 | 7;
        uint64_t v273 = (char *)swift_allocObject();
        uint64_t v274 = v435;
        *((void *)v273 + 2) = v434;
        *((void *)v273 + 3) = v274;
        uint64_t v275 = v427;
        *((void *)v273 + 4) = v436;
        *((void *)v273 + 5) = v275;
        *((void *)v273 + 6) = v92;
        *((void *)v273 + 7) = v93;
        uint64_t v276 = v429;
        *((void *)v273 + 8) = v437;
        *((void *)v273 + 9) = v276;
        uint64_t v277 = v438;
        *((void *)v273 + 10) = v428;
        *((void *)v273 + 11) = v277;
        uint64_t v278 = v440;
        *((void *)v273 + 12) = v439;
        *((void *)v273 + 13) = v278;
        uint64_t v279 = v420;
        *((void *)v273 + 14) = v419;
        *((void *)v273 + 15) = v279;
        uint64_t v280 = v426;
        *((void *)v273 + 16) = v418;
        *((void *)v273 + 17) = v280;
        uint64_t v281 = v421;
        *((void *)v273 + 18) = v441;
        *((void *)v273 + 19) = v281;
        uint64_t v282 = v442;
        *((void *)v273 + 20) = v422;
        *((void *)v273 + 21) = v282;
        uint64_t v283 = v423;
        *((void *)v273 + 22) = v430;
        *((void *)v273 + 23) = v283;
        uint64_t v399 = v272;
        uint64_t v284 = (void (*)(char *, char *, void *))*((void *)v269 + 4);
        unint64_t v381 = v269 + 32;
        unint64_t v380 = v284;
        v284(&v273[v272], v270, v254);
        uint64_t v285 = v383;
        *uint64_t v383 = &unk_269962340;
        v285[1] = v273;
        sub_24EC77F70();
        uint64_t v286 = *(void (**)(void))(v411 + 104);
        LODWORD(v385) = *MEMORY[0x263F39530];
        v411 += 104;
        uint64_t v383 = v286;
        v286(v251);
        uint64_t v382 = sub_24EC77F00();
        sub_24EC77EF0();
        if (qword_26B1D9CE0 != -1) {
          swift_once();
        }
        uint64_t v287 = sub_24EC77C90();
        __swift_project_value_buffer(v287, (uint64_t)qword_26B1DB4E0);
        uint64_t v288 = v384;
        uint64_t v289 = v416;
        ((void (*)(char *, uint64_t, void *))v404)(v384, v416, v415);
        unint64_t v290 = (unint64_t)v409;
        swift_bridgeObjectRetain();
        uint64_t v291 = sub_24EC77C70();
        os_log_type_t v292 = sub_24EC78070();
        if (os_log_type_enabled(v291, v292))
        {
          uint64_t v293 = swift_slowAlloc();
          uint64_t v374 = swift_slowAlloc();
          uint64_t v444 = (void *)v374;
          *(_DWORD *)uint64_t v293 = 136315394;
          os_log_type_t v294 = v292;
          swift_bridgeObjectRetain();
          uint64_t v443 = (void *)sub_24EC7437C(v398, v290, (uint64_t *)&v444);
          sub_24EC78090();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v293 + 12) = 2080;
          uint64_t v409 = (void *)(v293 + 14);
          uint64_t v295 = v415;
          uint64_t v296 = v390;
          uint64_t v297 = v396;
          v375(v390, &v288[*((int *)v415 + 50)], v396);
          (*((void (**)(char *, void *))v412 + 1))(v288, v295);
          sub_24EC4AC4C(&qword_26B1D91D0);
          uint64_t v298 = sub_24EC78280();
          unint64_t v300 = v299;
          (*(void (**)(char *, uint64_t))(v395 + 8))(v296, v297);
          uint64_t v443 = (void *)sub_24EC7437C(v298, v300, (uint64_t *)&v444);
          sub_24EC78090();
          swift_bridgeObjectRelease();
          os_log_type_t v301 = v294;
          uint64_t v289 = v416;
          _os_log_impl(&dword_24EC46000, v291, v301, "Fetching Canvas %s %s...", (uint8_t *)v293, 0x16u);
          uint64_t v302 = v374;
          swift_arrayDestroy();
          MEMORY[0x25334BDC0](v302, -1, -1);
          MEMORY[0x25334BDC0](v293, -1, -1);
        }
        else
        {
          (*((void (**)(char *, void *))v412 + 1))(v288, v415);

          swift_bridgeObjectRelease_n();
        }
        uint64_t v346 = v402;
        sub_24EC48E8C(*(void *)v95, v95[8]);
        *(void *)uint64_t v95 = 1;
        v95[8] = 2;
        unint64_t v347 = v408;
        uint64_t v409 = (void *)((char *)v408 + v379[12]);
        uint64_t v348 = (char *)v408 + v379[16];
        uint64_t v412 = (char *)v408 + v379[20];
        uint64_t v349 = (void *)((char *)v408 + v379[24]);
        uint64_t v350 = v431[1];
        *uint64_t v346 = *v431;
        v346[1] = v350;
        uint64_t v351 = v406;
        swift_storeEnumTagMultiPayload();
        swift_bridgeObjectRetain();
        sub_24EC78190();
        ((void (*)(uint64_t *, uint64_t))v391)(v346, v351);
        ((void (*)(char *, void, uint64_t))v387)(v348, v389, v388);
        uint64_t v352 = v405;
        uint64_t v353 = v289;
        uint64_t v354 = v415;
        ((void (*)(char *, uint64_t, void *))v404)(v405, v353, v415);
        uint64_t v355 = v413;
        uint64_t v356 = v401;
        uint64_t v357 = v397;
        uint64_t v358 = v417;
        (*(void (**)(char *, char *, uint64_t))(v413 + 16))(v401, v397, v417);
        unint64_t v359 = (v377 + *(unsigned __int8 *)(v355 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v355 + 80);
        uint64_t v360 = (char *)swift_allocObject();
        uint64_t v361 = v435;
        *((void *)v360 + 2) = v434;
        *((void *)v360 + 3) = v361;
        uint64_t v362 = v427;
        *((void *)v360 + 4) = v436;
        *((void *)v360 + 5) = v362;
        uint64_t v363 = v432;
        *((void *)v360 + 6) = v433;
        *((void *)v360 + 7) = v363;
        uint64_t v364 = v429;
        *((void *)v360 + 8) = v437;
        *((void *)v360 + 9) = v364;
        uint64_t v365 = v438;
        *((void *)v360 + 10) = v428;
        *((void *)v360 + 11) = v365;
        uint64_t v366 = v440;
        *((void *)v360 + 12) = v439;
        *((void *)v360 + 13) = v366;
        uint64_t v367 = v420;
        *((void *)v360 + 14) = v419;
        *((void *)v360 + 15) = v367;
        uint64_t v368 = v426;
        *((void *)v360 + 16) = v418;
        *((void *)v360 + 17) = v368;
        uint64_t v369 = v421;
        *((void *)v360 + 18) = v441;
        *((void *)v360 + 19) = v369;
        uint64_t v370 = v442;
        *((void *)v360 + 20) = v422;
        *((void *)v360 + 21) = v370;
        uint64_t v371 = &v360[v399];
        uint64_t v372 = v423;
        *((void *)v360 + 22) = v430;
        *((void *)v360 + 23) = v372;
        v380(v371, v352, v354);
        v424(&v360[v359], v356, v358);
        *uint64_t v349 = &unk_269962350;
        v349[1] = v360;
        sub_24EC77F70();
        ((void (*)(char *, void, char *))v394)(v412, *MEMORY[0x263F39578], v403);
        ((void (*)(void *, void, uint64_t))v383)(v347, v385, v410);
        sub_24EC77EF0();
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v355 + 8))(v357, v358);
      }
      break;
    case 8u:
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t result = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      uint64_t v128 = (char *)v431 + *(int *)(result + 204);
      if (v128[8] == 1) {
        v128[8] = 0;
      }
      break;
    case 9u:
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t v129 = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      unint64_t v130 = v431;
      unint64_t v131 = (char *)v431 + *(int *)(v129 + 200);
      unint64_t v132 = *(void (**)(char *, char *, uint64_t))(v413 + 16);
      uint64_t v403 = (char *)(v413 + 16);
      unint64_t v425 = v132;
      v132(v404, v131, v417);
      unint64_t v133 = (char *)v130 + *(int *)(v129 + 204);
      uint64_t v134 = *(void *)v133;
      unsigned int v135 = v133[8];
      if (v135 >= 2)
      {
        unint64_t v189 = (unint64_t)v409;
        if (v134)
        {
          uint64_t v190 = qword_26B1D9CE0;
          swift_bridgeObjectRetain();
          if (v190 != -1) {
            swift_once();
          }
          uint64_t v191 = sub_24EC77C90();
          __swift_project_value_buffer(v191, (uint64_t)qword_26B1DB4E0);
          uint64_t v192 = v412;
          uint64_t v193 = v385;
          uint64_t v140 = v416;
          (*((void (**)(char *, uint64_t, void *))v412 + 2))(v385, v416, v415);
          swift_bridgeObjectRetain_n();
          uint64_t v194 = sub_24EC77C70();
          os_log_type_t v195 = sub_24EC78070();
          if (os_log_type_enabled(v194, v195))
          {
            uint64_t v196 = swift_slowAlloc();
            uint64_t v424 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
            uint64_t v444 = v424;
            *(_DWORD *)uint64_t v196 = 136315394;
            swift_bridgeObjectRetain();
            uint64_t v443 = (void *)sub_24EC7437C(v398, v189, (uint64_t *)&v444);
            sub_24EC78090();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v196 + 12) = 2080;
            uint64_t v397 = (char *)(v196 + 14);
            uint64_t v197 = v415;
            uint64_t v198 = &v193[*((int *)v415 + 50)];
            unint64_t v199 = v193;
            uint64_t v200 = v395;
            uint64_t v201 = v390;
            uint64_t v202 = v396;
            (*(void (**)(char *, char *, uint64_t))(v395 + 16))(v390, v198, v396);
            (*((void (**)(char *, void *))v412 + 1))(v199, v197);
            sub_24EC4AC4C(&qword_26B1D91D0);
            uint64_t v203 = sub_24EC78280();
            unint64_t v205 = v204;
            (*(void (**)(char *, uint64_t))(v200 + 8))(v201, v202);
            uint64_t v443 = (void *)sub_24EC7437C(v203, v205, (uint64_t *)&v444);
            sub_24EC78090();
            uint64_t v140 = v416;
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_24EC46000, v194, v195, "Refreshing Canvas %s %s...", (uint8_t *)v196, 0x16u);
            uint64_t v206 = v424;
            swift_arrayDestroy();
            MEMORY[0x25334BDC0](v206, -1, -1);
            MEMORY[0x25334BDC0](v196, -1, -1);
          }
          else
          {
            (*((void (**)(char *, void *))v192 + 1))(v193, v415);

            swift_bridgeObjectRelease_n();
          }
          uint64_t v245 = v408;
          uint64_t v309 = v432;
          uint64_t v310 = v433;
          uint64_t v247 = v406;
          uint64_t v311 = v407;
          uint64_t v246 = v431;
          uint64_t v312 = v431[1];
          uint64_t v249 = v402;
          *uint64_t v402 = *v431;
          v249[1] = v312;
          swift_storeEnumTagMultiPayload();
          swift_bridgeObjectRetain();
          swift_getWitnessTable();
          sub_24EC78190();
          (*(void (**)(uint64_t *, uint64_t))(v311 + 8))(v249, v247);
          (*(void (**)(void *, void, uint64_t))(v411 + 104))(v245, *MEMORY[0x263F39540], v410);
          sub_24EC77F00();
          sub_24EC77EF0();
          uint64_t v248 = v407;
          uint64_t v444 = (void *)v434;
          uint64_t v445 = v435;
          uint64_t v446 = v436;
          uint64_t v447 = v427;
          uint64_t v448 = v310;
          uint64_t v449 = v437;
          uint64_t v450 = v429;
          uint64_t v451 = v309;
          uint64_t v452 = v438;
          uint64_t v453 = v439;
          uint64_t v454 = v440;
          uint64_t v455 = v419;
          uint64_t v456 = v420;
          uint64_t v457 = v418;
          uint64_t v458 = v426;
          uint64_t v459 = v441;
          uint64_t v460 = v422;
          uint64_t v461 = v442;
          uint64_t v462 = v421;
          uint64_t v463 = v423;
          sub_24EC77B60();
          uint64_t v313 = sub_24EC77ED0();
          sub_24EC48E8C(*(void *)v133, v133[8]);
          *(void *)unint64_t v133 = v313;
          v133[8] = 1;
        }
        else
        {
          v425(v62, v404, v417);
          uint64_t v305 = v68;
          swift_storeEnumTagMultiPayload();
          swift_bridgeObjectRetain();
          uint64_t v306 = v431;
          uint64_t v307 = v416;
          CanvasFeature.reduce(localState:sharedState:sideEffects:action:)(v394, v431, v414, v62, v415);
          uint64_t v308 = v62;
          uint64_t v246 = v306;
          (*(void (**)(char *, uint64_t))(v59 + 8))(v308, v305);
          uint64_t v140 = v307;
          uint64_t v245 = v408;
          uint64_t v247 = v406;
          uint64_t v248 = v407;
          uint64_t v249 = v402;
        }
      }
      else
      {
        unint64_t v136 = (unint64_t)v409;
        swift_bridgeObjectRetain();
        sub_24EC48E30(v134, v135);
        if (qword_26B1D9CE0 != -1) {
          swift_once();
        }
        uint64_t v137 = sub_24EC77C90();
        __swift_project_value_buffer(v137, (uint64_t)qword_26B1DB4E0);
        uint64_t v138 = v412;
        uint64_t v139 = v386;
        uint64_t v140 = v416;
        (*((void (**)(char *, uint64_t, void *))v412 + 2))(v386, v416, v415);
        swift_bridgeObjectRetain();
        sub_24EC48E30(v134, v135);
        swift_bridgeObjectRetain();
        sub_24EC48E30(v134, v135);
        unint64_t v141 = sub_24EC77C70();
        os_log_type_t v142 = sub_24EC78070();
        int v143 = v142;
        if (os_log_type_enabled(v141, v142))
        {
          uint64_t v144 = swift_slowAlloc();
          LODWORD(v397) = v143;
          uint64_t v145 = v144;
          uint64_t v424 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
          uint64_t v443 = v424;
          *(_DWORD *)uint64_t v145 = 136315650;
          uint64_t v394 = v141;
          swift_bridgeObjectRetain();
          uint64_t v444 = (void *)sub_24EC7437C(v398, v136, (uint64_t *)&v443);
          sub_24EC78090();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v145 + 12) = 2080;
          uint64_t v393 = v145 + 14;
          uint64_t v146 = v415;
          unint64_t v147 = &v139[*((int *)v415 + 50)];
          uint64_t v148 = v395;
          uint64_t v149 = v139;
          uint64_t v150 = v390;
          uint64_t v151 = v396;
          (*(void (**)(char *, char *, uint64_t))(v395 + 16))(v390, v147, v396);
          (*((void (**)(char *, void *))v412 + 1))(v149, v146);
          sub_24EC4AC4C(&qword_26B1D91D0);
          uint64_t v152 = sub_24EC78280();
          unint64_t v154 = v153;
          (*(void (**)(char *, uint64_t))(v148 + 8))(v150, v151);
          uint64_t v444 = (void *)sub_24EC7437C(v152, v154, (uint64_t *)&v443);
          sub_24EC78090();
          swift_bridgeObjectRelease();
          *(_WORD *)(v145 + 22) = 2048;
          uint64_t v444 = (void *)v434;
          uint64_t v445 = v435;
          uint64_t v446 = v436;
          uint64_t v447 = v427;
          uint64_t v448 = v433;
          uint64_t v449 = v437;
          uint64_t v450 = v429;
          uint64_t v451 = v432;
          uint64_t v452 = v438;
          uint64_t v453 = v439;
          uint64_t v454 = v440;
          uint64_t v455 = v419;
          uint64_t v456 = v420;
          uint64_t v457 = v418;
          uint64_t v458 = v426;
          uint64_t v459 = v441;
          uint64_t v460 = v422;
          uint64_t v461 = v442;
          uint64_t v462 = v421;
          uint64_t v463 = v423;
          uint64_t v155 = sub_24EC77B60();
          uint64_t v156 = MEMORY[0x25334B5D0](v134, v155);
          sub_24EC48E8C(v134, v135);
          uint64_t v444 = (void *)v156;
          uint64_t v140 = v416;
          sub_24EC78090();
          sub_24EC48E8C(v134, v135);
          os_log_t v157 = v394;
          _os_log_impl(&dword_24EC46000, v394, (os_log_type_t)v397, "Refreshing Canvas %s %s with %ld existing descriptors...", (uint8_t *)v145, 0x20u);
          uint64_t v158 = v424;
          swift_arrayDestroy();
          MEMORY[0x25334BDC0](v158, -1, -1);
          MEMORY[0x25334BDC0](v145, -1, -1);
        }
        else
        {
          (*((void (**)(char *, void *))v138 + 1))(v139, v415);
          sub_24EC48E8C(v134, v135);
          swift_bridgeObjectRelease_n();
          sub_24EC48E8C(v134, v135);
        }
        uint64_t v245 = v408;
        uint64_t v246 = v431;
        uint64_t v247 = v406;
        uint64_t v248 = v407;
        sub_24EC48E8C(*(void *)v133, v133[8]);
        *(void *)unint64_t v133 = v134;
        v133[8] = 1;
        uint64_t v249 = v402;
      }
      uint64_t v314 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D50);
      uint64_t v315 = v245;
      uint64_t v424 = (void (*)(char *, char *, uint64_t))((char *)v245 + v314[12]);
      uint64_t v316 = (char *)v245 + v314[16];
      unint64_t v431 = (void *)((char *)v315 + v314[20]);
      uint64_t v408 = (void *)((char *)v315 + v314[24]);
      uint64_t v317 = v246[1];
      *uint64_t v249 = *v246;
      v249[1] = v317;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      sub_24EC78190();
      (*(void (**)(uint64_t *, uint64_t))(v248 + 8))(v249, v247);
      uint64_t v318 = *MEMORY[0x263F39590];
      uint64_t v319 = sub_24EC77E30();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v319 - 8) + 104))(v316, v318, v319);
      uint64_t v320 = v412;
      uint64_t v321 = v405;
      uint64_t v322 = v415;
      (*((void (**)(char *, uint64_t, void *))v412 + 2))(v405, v140, v415);
      uint64_t v323 = v401;
      v425(v401, v404, v417);
      unint64_t v324 = (v320[80] + 192) & ~(unint64_t)v320[80];
      uint64_t v325 = v413;
      unint64_t v326 = (v399 + *(unsigned __int8 *)(v413 + 80) + v324) & ~(unint64_t)*(unsigned __int8 *)(v413 + 80);
      unint64_t v327 = (v400 + v326 + 7) & 0xFFFFFFFFFFFFFFF8;
      unint64_t v328 = (char *)swift_allocObject();
      uint64_t v329 = v435;
      *((void *)v328 + 2) = v434;
      *((void *)v328 + 3) = v329;
      uint64_t v330 = v427;
      *((void *)v328 + 4) = v436;
      *((void *)v328 + 5) = v330;
      uint64_t v331 = v432;
      *((void *)v328 + 6) = v433;
      *((void *)v328 + 7) = v331;
      uint64_t v332 = v429;
      *((void *)v328 + 8) = v437;
      *((void *)v328 + 9) = v332;
      uint64_t v333 = v438;
      *((void *)v328 + 10) = v428;
      *((void *)v328 + 11) = v333;
      uint64_t v334 = v440;
      *((void *)v328 + 12) = v439;
      *((void *)v328 + 13) = v334;
      uint64_t v335 = v420;
      *((void *)v328 + 14) = v419;
      *((void *)v328 + 15) = v335;
      uint64_t v336 = v426;
      *((void *)v328 + 16) = v418;
      *((void *)v328 + 17) = v336;
      uint64_t v337 = v421;
      *((void *)v328 + 18) = v441;
      *((void *)v328 + 19) = v337;
      uint64_t v338 = v442;
      *((void *)v328 + 20) = v422;
      *((void *)v328 + 21) = v338;
      uint64_t v339 = v423;
      *((void *)v328 + 22) = v430;
      *((void *)v328 + 23) = v339;
      (*((void (**)(char *, char *, void *))v320 + 4))(&v328[v324], v321, v322);
      uint64_t v340 = v417;
      (*(void (**)(char *, char *, uint64_t))(v325 + 32))(&v328[v326], v323, v417);
      uint64_t v341 = &v328[v327];
      uint64_t v342 = v409;
      *(void *)uint64_t v341 = v398;
      *((void *)v341 + 1) = v342;
      uint64_t v343 = v408;
      *uint64_t v408 = &unk_269962370;
      v343[1] = v328;
      sub_24EC77F70();
      uint64_t v344 = *MEMORY[0x263F39578];
      uint64_t v345 = sub_24EC77E20();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v345 - 8) + 104))(v431, v344, v345);
      (*(void (**)(void *, void, uint64_t))(v411 + 104))(v315, *MEMORY[0x263F39530], v410);
      sub_24EC77F00();
      sub_24EC77EF0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v325 + 8))(v404, v340);
      break;
    case 0xAu:
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t v159 = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      unint64_t v160 = v431;
      uint64_t v161 = (char *)v431 + *(int *)(v159 + 200);
      uint64_t v162 = (void (*)(char *, char *, uint64_t))(v413 + 16);
      uint64_t v404 = *(char **)(v413 + 16);
      ((void (*)(char *, char *, uint64_t))v404)(v403, v161, v417);
      uint64_t v163 = (char *)v160 + *(int *)(v159 + 204);
      BOOL v164 = v163[8] >= 2u;
      unint64_t v425 = v162;
      if (v164 && !*(void *)v163)
      {
        uint64_t v212 = v404;
        ((void (*)(char *, char *, uint64_t))v404)(v62, v403, v417);
        swift_storeEnumTagMultiPayload();
        swift_bridgeObjectRetain();
        uint64_t v303 = v431;
        CanvasFeature.reduce(localState:sharedState:sideEffects:action:)(v394, v431, v414, v62, v415);
        uint64_t v304 = v62;
        uint64_t v185 = v303;
        (*(void (**)(char *, uint64_t))(v59 + 8))(v304, v68);
        uint64_t v183 = v408;
        uint64_t v209 = v406;
        uint64_t v210 = v407;
        uint64_t v208 = v402;
      }
      else
      {
        uint64_t v165 = qword_26B1D9CE0;
        unint64_t v166 = (unint64_t)v409;
        swift_bridgeObjectRetain();
        if (v165 != -1) {
          swift_once();
        }
        uint64_t v167 = sub_24EC77C90();
        __swift_project_value_buffer(v167, (uint64_t)qword_26B1DB4E0);
        uint64_t v168 = v412;
        unint64_t v169 = v389;
        (*((void (**)(char *, uint64_t, void *))v412 + 2))(v389, v416, v415);
        swift_bridgeObjectRetain_n();
        unint64_t v170 = sub_24EC77C70();
        os_log_type_t v171 = sub_24EC78070();
        if (os_log_type_enabled(v170, v171))
        {
          uint64_t v172 = swift_slowAlloc();
          uint64_t v424 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
          uint64_t v444 = v424;
          *(_DWORD *)uint64_t v172 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v443 = (void *)sub_24EC7437C(v398, v166, (uint64_t *)&v444);
          sub_24EC78090();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v172 + 12) = 2080;
          uint64_t v397 = (char *)(v172 + 14);
          unint64_t v173 = v415;
          uint64_t v174 = v395;
          uint64_t v175 = v390;
          uint64_t v176 = v396;
          (*(void (**)(char *, char *, uint64_t))(v395 + 16))(v390, &v169[*((int *)v415 + 50)], v396);
          (*((void (**)(char *, void *))v412 + 1))(v169, v173);
          sub_24EC4AC4C(&qword_26B1D91D0);
          uint64_t v177 = sub_24EC78280();
          unint64_t v179 = v178;
          (*(void (**)(char *, uint64_t))(v174 + 8))(v175, v176);
          uint64_t v443 = (void *)sub_24EC7437C(v177, v179, (uint64_t *)&v444);
          uint64_t v180 = v418;
          sub_24EC78090();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24EC46000, v170, v171, "Reloading Canvas %s %s...", (uint8_t *)v172, 0x16u);
          uint64_t v181 = v424;
          swift_arrayDestroy();
          MEMORY[0x25334BDC0](v181, -1, -1);
          MEMORY[0x25334BDC0](v172, -1, -1);

          uint64_t v182 = v410;
          uint64_t v183 = v408;
          uint64_t v184 = v433;
          uint64_t v185 = v431;
          uint64_t v186 = v407;
        }
        else
        {
          (*((void (**)(char *, void *))v168 + 1))(v169, v415);

          swift_bridgeObjectRelease_n();
          uint64_t v182 = v410;
          uint64_t v183 = v408;
          uint64_t v184 = v433;
          uint64_t v185 = v431;
          uint64_t v186 = v407;
          uint64_t v180 = v418;
        }
        uint64_t v207 = v185[1];
        uint64_t v208 = v402;
        *uint64_t v402 = *v185;
        v208[1] = v207;
        uint64_t v209 = v406;
        swift_storeEnumTagMultiPayload();
        swift_bridgeObjectRetain();
        swift_getWitnessTable();
        sub_24EC78190();
        (*(void (**)(uint64_t *, uint64_t))(v186 + 8))(v208, v209);
        (*(void (**)(void *, void, uint64_t))(v411 + 104))(v183, *MEMORY[0x263F39540], v182);
        sub_24EC77F00();
        uint64_t v210 = v186;
        sub_24EC77EF0();
        uint64_t v444 = (void *)v434;
        uint64_t v445 = v435;
        uint64_t v446 = v436;
        uint64_t v447 = v427;
        uint64_t v448 = v184;
        uint64_t v449 = v437;
        uint64_t v450 = v429;
        uint64_t v451 = v432;
        uint64_t v452 = v438;
        uint64_t v453 = v439;
        uint64_t v454 = v440;
        uint64_t v455 = v419;
        uint64_t v456 = v420;
        uint64_t v457 = v180;
        uint64_t v458 = v426;
        uint64_t v459 = v441;
        uint64_t v460 = v422;
        uint64_t v461 = v442;
        uint64_t v462 = v421;
        uint64_t v463 = v423;
        sub_24EC77B60();
        uint64_t v211 = sub_24EC77ED0();
        sub_24EC48E8C(*(void *)v163, v163[8]);
        *(void *)uint64_t v163 = v211;
        v163[8] = 1;
        uint64_t v212 = v404;
      }
      uint64_t v213 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D50);
      uint64_t v214 = v183;
      uint64_t v424 = (void (*)(char *, char *, uint64_t))((char *)v183 + v213[12]);
      uint64_t v215 = (char *)v183 + v213[16];
      unint64_t v431 = (void *)((char *)v214 + v213[20]);
      uint64_t v408 = (void *)((char *)v214 + v213[24]);
      uint64_t v216 = v185[1];
      *uint64_t v208 = *v185;
      v208[1] = v216;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      sub_24EC78190();
      (*(void (**)(uint64_t *, uint64_t))(v210 + 8))(v208, v209);
      uint64_t v217 = *MEMORY[0x263F39590];
      uint64_t v218 = sub_24EC77E30();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v218 - 8) + 104))(v215, v217, v218);
      unint64_t v219 = v412;
      uint64_t v220 = v405;
      uint64_t v221 = v415;
      (*((void (**)(char *, uint64_t, void *))v412 + 2))(v405, v416, v415);
      uint64_t v222 = v401;
      ((void (*)(char *, char *, uint64_t))v212)(v401, v403, v417);
      unint64_t v223 = (v219[80] + 192) & ~(unint64_t)v219[80];
      uint64_t v224 = v413;
      unint64_t v225 = (v399 + *(unsigned __int8 *)(v413 + 80) + v223) & ~(unint64_t)*(unsigned __int8 *)(v413 + 80);
      unint64_t v226 = (v400 + v225 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v227 = (char *)swift_allocObject();
      uint64_t v228 = v435;
      *((void *)v227 + 2) = v434;
      *((void *)v227 + 3) = v228;
      uint64_t v229 = v427;
      *((void *)v227 + 4) = v436;
      *((void *)v227 + 5) = v229;
      uint64_t v230 = v432;
      *((void *)v227 + 6) = v433;
      *((void *)v227 + 7) = v230;
      uint64_t v231 = v429;
      *((void *)v227 + 8) = v437;
      *((void *)v227 + 9) = v231;
      uint64_t v232 = v438;
      *((void *)v227 + 10) = v428;
      *((void *)v227 + 11) = v232;
      uint64_t v233 = v440;
      *((void *)v227 + 12) = v439;
      *((void *)v227 + 13) = v233;
      uint64_t v234 = v420;
      *((void *)v227 + 14) = v419;
      *((void *)v227 + 15) = v234;
      uint64_t v235 = v426;
      *((void *)v227 + 16) = v418;
      *((void *)v227 + 17) = v235;
      uint64_t v236 = v421;
      *((void *)v227 + 18) = v441;
      *((void *)v227 + 19) = v236;
      uint64_t v237 = v442;
      *((void *)v227 + 20) = v422;
      *((void *)v227 + 21) = v237;
      uint64_t v238 = v423;
      *((void *)v227 + 22) = v430;
      *((void *)v227 + 23) = v238;
      (*((void (**)(char *, char *, void *))v219 + 4))(&v227[v223], v220, v221);
      uint64_t v239 = v417;
      (*(void (**)(char *, char *, uint64_t))(v224 + 32))(&v227[v225], v222, v417);
      uint64_t v240 = &v227[v226];
      uint64_t v241 = v409;
      *(void *)uint64_t v240 = v398;
      *((void *)v240 + 1) = v241;
      uint64_t v242 = v408;
      *uint64_t v408 = &unk_269962360;
      v242[1] = v227;
      sub_24EC77F70();
      uint64_t v243 = *MEMORY[0x263F39578];
      uint64_t v244 = sub_24EC77E20();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v244 - 8) + 104))(v431, v243, v244);
      (*(void (**)(void *, void, uint64_t))(v411 + 104))(v214, *MEMORY[0x263F39530], v410);
      sub_24EC77F00();
      sub_24EC77EF0();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v224 + 8))(v403, v239);
      break;
    case 0xBu:
      uint64_t v444 = (void *)v434;
      uint64_t v445 = v435;
      uint64_t v446 = v436;
      uint64_t v447 = v427;
      uint64_t v448 = v433;
      uint64_t v449 = v432;
      uint64_t v450 = v437;
      uint64_t v451 = v24;
      uint64_t v452 = v35;
      uint64_t v453 = v438;
      uint64_t v454 = v439;
      uint64_t v455 = v440;
      uint64_t v456 = v419;
      uint64_t v457 = v420;
      uint64_t v458 = v418;
      uint64_t v459 = v426;
      uint64_t v460 = v441;
      uint64_t v461 = v421;
      uint64_t v462 = v422;
      uint64_t v463 = v442;
      uint64_t v464 = v430;
      uint64_t v465 = v423;
      uint64_t v187 = type metadata accessor for CanvasState(0, (uint64_t)&v444);
      uint64_t v188 = (char *)v431 + *(int *)(v187 + 204);
      uint64_t result = sub_24EC48E8C(*(void *)v188, v188[8]);
      *(void *)uint64_t v188 = 0;
      v188[8] = 2;
      break;
    default:
      uint64_t v69 = *v66;
      if ((sub_24EC77FE0() & 1) == 0)
      {
        uint64_t v70 = *(void *)(v416 + 72);
        uint64_t v71 = *(void *)(v416 + 80);
        __swift_project_boxed_opaque_existential_1((void *)(v416 + 48), v70);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 216))(v69, v70, v71);
      }
      uint64_t result = swift_bridgeObjectRelease();
      break;
  }
  return result;
}

uint64_t sub_24EC70200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[52] = a4;
  v8[53] = a5;
  v8[50] = a2;
  v8[51] = a3;
  v8[49] = a1;
  v8[2] = a6;
  v8[3] = a7;
  v8[4] = a8;
  v8[5] = v19;
  v8[6] = v20;
  v8[7] = v21;
  v8[8] = v22;
  v8[9] = v23;
  v8[10] = v24;
  v8[11] = v25;
  v8[12] = v26;
  v8[13] = v27;
  v8[14] = v28;
  v8[15] = v29;
  v8[16] = v30;
  v8[17] = v31;
  v8[18] = v32;
  v8[19] = v33;
  v8[20] = v34;
  v8[21] = v35;
  v8[22] = v36;
  v8[23] = v37;
  uint64_t v9 = type metadata accessor for CanvasFeature(0, (uint64_t)(v8 + 2));
  v8[54] = v9;
  v8[55] = *(void *)(v9 - 8);
  v8[56] = swift_task_alloc();
  uint64_t v10 = sub_24EC779C0();
  v8[57] = v10;
  v8[58] = *(void *)(v10 - 8);
  v8[59] = swift_task_alloc();
  v8[24] = a6;
  v8[25] = a7;
  v8[26] = a8;
  v8[27] = v19;
  v8[28] = v20;
  v8[29] = v21;
  v8[30] = v22;
  v8[31] = v23;
  v8[32] = v24;
  v8[33] = v25;
  v8[34] = v26;
  v8[35] = v27;
  v8[36] = v28;
  v8[37] = v29;
  v8[38] = v30;
  v8[39] = v31;
  v8[40] = v32;
  v8[41] = v33;
  v8[42] = v34;
  v8[43] = v35;
  v8[44] = v36;
  v8[45] = v37;
  uint64_t v11 = type metadata accessor for CanvasAction(0, (uint64_t)(v8 + 24));
  v8[60] = v11;
  v8[61] = *(void *)(v11 - 8);
  v8[62] = swift_task_alloc();
  sub_24EC77F60();
  v8[63] = sub_24EC77F50();
  uint64_t v13 = sub_24EC77F30();
  v8[64] = v13;
  v8[65] = v12;
  return MEMORY[0x270FA2498](sub_24EC704F8, v13, v12);
}

uint64_t sub_24EC704F8()
{
  uint64_t v1 = (void *)v0[50];
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 184) + **(int **)(v3 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[66] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EC70604;
  uint64_t v5 = v0[51];
  return v7(v5, v2, v3);
}

uint64_t sub_24EC70604(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 536) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[65];
    uint64_t v6 = v4[64];
    uint64_t v7 = sub_24EC70B04;
  }
  else
  {
    v4[68] = a1;
    uint64_t v5 = v4[65];
    uint64_t v6 = v4[64];
    uint64_t v7 = sub_24EC70734;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_24EC70734()
{
  **(void **)(v0 + 496) = *(void *)(v0 + 544);
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 552) = v1;
  uint64_t v2 = sub_24EC77E10();
  *uint64_t v1 = v0;
  v1[1] = sub_24EC707FC;
  uint64_t v3 = *(void *)(v0 + 496);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24EC707FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 496);
  uint64_t v3 = *(void *)(*v0 + 488);
  uint64_t v4 = *(void *)(*v0 + 480);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 520);
  uint64_t v6 = *(void *)(v1 + 512);
  return MEMORY[0x270FA2498](sub_24EC76F68, v6, v5);
}

uint64_t sub_24EC70980()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 496);
  uint64_t v3 = *(void *)(*v0 + 488);
  uint64_t v4 = *(void *)(*v0 + 480);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 520);
  uint64_t v6 = *(void *)(v1 + 512);
  return MEMORY[0x270FA2498](sub_24EC76F64, v6, v5);
}

uint64_t sub_24EC70B04()
{
  uint64_t v33 = v0;
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[67];
  uint64_t v3 = v0[55];
  uint64_t v2 = v0[56];
  uint64_t v4 = v0[54];
  uint64_t v5 = v0[50];
  uint64_t v6 = sub_24EC77C90();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1DB4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  MEMORY[0x25334BC10](v1);
  swift_bridgeObjectRetain();
  MEMORY[0x25334BC10](v1);
  uint64_t v7 = sub_24EC77C70();
  os_log_type_t v8 = sub_24EC78060();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[67];
  if (v9)
  {
    os_log_type_t type = v8;
    uint64_t v12 = v0[58];
    uint64_t v11 = v0[59];
    uint64_t v13 = v0[57];
    uint64_t v27 = v0[56];
    uint64_t v14 = v0[55];
    uint64_t v26 = v0[54];
    log = v7;
    uint64_t v15 = v0[52];
    unint64_t v16 = v0[53];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v17 = 136315650;
    swift_bridgeObjectRetain();
    v0[46] = sub_24EC7437C(v15, v16, &v32);
    sub_24EC78090();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v27 + *(int *)(v26 + 200), v13);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v27, v26);
    sub_24EC4AC4C(&qword_26B1D91D0);
    uint64_t v18 = sub_24EC78280();
    unint64_t v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    v0[47] = sub_24EC7437C(v18, v20, &v32);
    sub_24EC78090();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2112;
    MEMORY[0x25334BC10](v10);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    v0[48] = v21;
    sub_24EC78090();
    void *v28 = v21;
    MEMORY[0x25334BC00](v10);
    MEMORY[0x25334BC00](v10);
    _os_log_impl(&dword_24EC46000, log, type, "Error refreshing Canvas %s %s: %@", (uint8_t *)v17, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269961F60);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v30, -1, -1);
    MEMORY[0x25334BDC0](v17, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v0[55] + 8))(v0[56], v0[54]);
    swift_bridgeObjectRelease_n();
    MEMORY[0x25334BC00](v10);
    MEMORY[0x25334BC00](v10);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = (void *)swift_task_alloc();
  v0[70] = v22;
  uint64_t v23 = sub_24EC77E10();
  *uint64_t v22 = v0;
  v22[1] = sub_24EC70980;
  uint64_t v24 = v0[62];
  return MEMORY[0x270F252C8](v24, v23);
}

uint64_t sub_24EC70F44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[52] = a4;
  v8[53] = a5;
  v8[50] = a2;
  v8[51] = a3;
  v8[49] = a1;
  v8[2] = a6;
  v8[3] = a7;
  v8[4] = a8;
  v8[5] = v19;
  v8[6] = v20;
  v8[7] = v21;
  v8[8] = v22;
  v8[9] = v23;
  v8[10] = v24;
  v8[11] = v25;
  v8[12] = v26;
  v8[13] = v27;
  v8[14] = v28;
  v8[15] = v29;
  v8[16] = v30;
  v8[17] = v31;
  v8[18] = v32;
  v8[19] = v33;
  v8[20] = v34;
  v8[21] = v35;
  v8[22] = v36;
  v8[23] = v37;
  uint64_t v9 = type metadata accessor for CanvasFeature(0, (uint64_t)(v8 + 2));
  v8[54] = v9;
  v8[55] = *(void *)(v9 - 8);
  v8[56] = swift_task_alloc();
  uint64_t v10 = sub_24EC779C0();
  v8[57] = v10;
  v8[58] = *(void *)(v10 - 8);
  v8[59] = swift_task_alloc();
  v8[24] = a6;
  v8[25] = a7;
  v8[26] = a8;
  v8[27] = v19;
  v8[28] = v20;
  v8[29] = v21;
  v8[30] = v22;
  v8[31] = v23;
  v8[32] = v24;
  v8[33] = v25;
  v8[34] = v26;
  v8[35] = v27;
  v8[36] = v28;
  v8[37] = v29;
  v8[38] = v30;
  v8[39] = v31;
  v8[40] = v32;
  v8[41] = v33;
  v8[42] = v34;
  v8[43] = v35;
  v8[44] = v36;
  v8[45] = v37;
  uint64_t v11 = type metadata accessor for CanvasAction(0, (uint64_t)(v8 + 24));
  v8[60] = v11;
  v8[61] = *(void *)(v11 - 8);
  v8[62] = swift_task_alloc();
  sub_24EC77F60();
  v8[63] = sub_24EC77F50();
  uint64_t v13 = sub_24EC77F30();
  v8[64] = v13;
  v8[65] = v12;
  return MEMORY[0x270FA2498](sub_24EC7123C, v13, v12);
}

uint64_t sub_24EC7123C()
{
  uint64_t v1 = (void *)v0[50];
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 184) + **(int **)(v3 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[66] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EC71348;
  uint64_t v5 = v0[51];
  return v7(v5, v2, v3);
}

uint64_t sub_24EC71348(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 536) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[65];
    uint64_t v6 = v4[64];
    uint64_t v7 = sub_24EC7195C;
  }
  else
  {
    v4[68] = a1;
    uint64_t v5 = v4[65];
    uint64_t v6 = v4[64];
    uint64_t v7 = sub_24EC71478;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_24EC71478()
{
  **(void **)(v0 + 496) = *(void *)(v0 + 544);
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 552) = v1;
  uint64_t v2 = sub_24EC77E10();
  *uint64_t v1 = v0;
  v1[1] = sub_24EC71540;
  uint64_t v3 = *(void *)(v0 + 496);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24EC71540()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 496);
  uint64_t v3 = *(void *)(*v0 + 488);
  uint64_t v4 = *(void *)(*v0 + 480);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 520);
  uint64_t v6 = *(void *)(v1 + 512);
  return MEMORY[0x270FA2498](sub_24EC716C4, v6, v5);
}

uint64_t sub_24EC716C4()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC71748()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 496);
  uint64_t v3 = *(void *)(*v0 + 488);
  uint64_t v4 = *(void *)(*v0 + 480);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 520);
  uint64_t v6 = *(void *)(v1 + 512);
  return MEMORY[0x270FA2498](sub_24EC718CC, v6, v5);
}

uint64_t sub_24EC718CC()
{
  uint64_t v1 = *(void *)(v0 + 536);
  swift_release();
  MEMORY[0x25334BC00](v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24EC7195C()
{
  uint64_t v33 = v0;
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[67];
  uint64_t v3 = v0[55];
  uint64_t v2 = v0[56];
  uint64_t v4 = v0[54];
  uint64_t v5 = v0[50];
  uint64_t v6 = sub_24EC77C90();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1DB4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  MEMORY[0x25334BC10](v1);
  swift_bridgeObjectRetain();
  MEMORY[0x25334BC10](v1);
  uint64_t v7 = sub_24EC77C70();
  os_log_type_t v8 = sub_24EC78060();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = v0[67];
  if (v9)
  {
    os_log_type_t type = v8;
    uint64_t v12 = v0[58];
    uint64_t v11 = v0[59];
    uint64_t v13 = v0[57];
    uint64_t v27 = v0[56];
    uint64_t v14 = v0[55];
    uint64_t v26 = v0[54];
    log = v7;
    uint64_t v15 = v0[52];
    unint64_t v16 = v0[53];
    uint64_t v17 = swift_slowAlloc();
    uint64_t v28 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v32 = v30;
    *(_DWORD *)uint64_t v17 = 136315650;
    swift_bridgeObjectRetain();
    v0[46] = sub_24EC7437C(v15, v16, &v32);
    sub_24EC78090();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2080;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v27 + *(int *)(v26 + 200), v13);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v27, v26);
    sub_24EC4AC4C(&qword_26B1D91D0);
    uint64_t v18 = sub_24EC78280();
    unint64_t v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    v0[47] = sub_24EC7437C(v18, v20, &v32);
    sub_24EC78090();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2112;
    MEMORY[0x25334BC10](v10);
    uint64_t v21 = _swift_stdlib_bridgeErrorToNSError();
    v0[48] = v21;
    sub_24EC78090();
    void *v28 = v21;
    MEMORY[0x25334BC00](v10);
    MEMORY[0x25334BC00](v10);
    _os_log_impl(&dword_24EC46000, log, type, "Error refreshing Canvas %s %s: %@", (uint8_t *)v17, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269961F60);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v30, -1, -1);
    MEMORY[0x25334BDC0](v17, -1, -1);
  }
  else
  {
    (*(void (**)(void, void))(v0[55] + 8))(v0[56], v0[54]);
    swift_bridgeObjectRelease_n();
    MEMORY[0x25334BC00](v10);
    MEMORY[0x25334BC00](v10);
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = (void *)swift_task_alloc();
  v0[70] = v22;
  uint64_t v23 = sub_24EC77E10();
  *uint64_t v22 = v0;
  v22[1] = sub_24EC71748;
  uint64_t v24 = v0[62];
  return MEMORY[0x270F252C8](v24, v23);
}

uint64_t sub_24EC71D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 272) = a1;
  *(void *)(v8 + 280) = a2;
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 40) = a6;
  *(void *)(v8 + 48) = a7;
  *(void *)(v8 + 56) = a8;
  *(_OWORD *)(v8 + 64) = v14;
  *(_OWORD *)(v8 + 80) = v15;
  *(_OWORD *)(v8 + 96) = v16;
  *(_OWORD *)(v8 + 112) = v17;
  *(_OWORD *)(v8 + 128) = v18;
  *(_OWORD *)(v8 + 144) = v19;
  *(_OWORD *)(v8 + 160) = v20;
  *(void *)(v8 + 176) = v21;
  *(void *)(v8 + 184) = v22;
  uint64_t v9 = type metadata accessor for CanvasAction(0, v8 + 16);
  *(void *)(v8 + 288) = v9;
  *(void *)(v8 + 296) = *(void *)(v9 - 8);
  *(void *)(v8 + 304) = swift_task_alloc();
  sub_24EC78080();
  *(void *)(v8 + 312) = swift_task_alloc();
  *(void *)(v8 + 320) = sub_24EC77F60();
  *(void *)(v8 + 328) = sub_24EC77F50();
  uint64_t v11 = sub_24EC77F30();
  *(void *)(v8 + 336) = v11;
  *(void *)(v8 + 344) = v10;
  return MEMORY[0x270FA2498](sub_24EC71F0C, v11, v10);
}

uint64_t sub_24EC71F0C()
{
  uint64_t v1 = *(void **)(v0 + 280);
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 192) + **(int **)(v3 + 192));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 352) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EC72028;
  return v6(v0 + 192, v2, v3);
}

uint64_t sub_24EC72028()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 344);
  uint64_t v3 = *(void *)(v1 + 336);
  return MEMORY[0x270FA2498](sub_24EC72148, v3, v2);
}

uint64_t sub_24EC72148()
{
  uint64_t v1 = v0[27];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 24, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[32] = swift_getAssociatedTypeWitness();
  v0[33] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 29);
  sub_24EC77FD0();
  swift_task_dealloc();
  uint64_t v5 = sub_24EC77F50();
  v0[45] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 29), v0[32]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[46] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC7231C;
  uint64_t v7 = v0[39];
  uint64_t v8 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v7, v5, v8);
}

uint64_t sub_24EC7231C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 344);
  uint64_t v3 = *(void *)(v1 + 336);
  return MEMORY[0x270FA2498](sub_24EC72460, v3, v2);
}

uint64_t sub_24EC72460()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[37];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 29));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 24));
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v3 + 32))(v0[38], v1, v2);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[47] = v6;
    uint64_t v7 = sub_24EC77E10();
    *uint64_t v6 = v0;
    v6[1] = sub_24EC725CC;
    uint64_t v8 = v0[38];
    return MEMORY[0x270F252C8](v8, v7);
  }
}

uint64_t sub_24EC725CC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 344);
  uint64_t v3 = *(void *)(v1 + 336);
  return MEMORY[0x270FA2498](sub_24EC726EC, v3, v2);
}

uint64_t sub_24EC726EC()
{
  (*(void (**)(uint64_t, uint64_t))(v0[37] + 8))(v0[38], v0[36]);
  uint64_t v1 = sub_24EC77F50();
  v0[45] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 29), v0[32]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[46] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EC7231C;
  uint64_t v3 = v0[39];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v3, v1, v4);
}

uint64_t sub_24EC727E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 200) = a2;
  *(void *)(v8 + 208) = a3;
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(_OWORD *)(v8 + 56) = v14;
  *(_OWORD *)(v8 + 72) = v15;
  *(_OWORD *)(v8 + 88) = v16;
  *(_OWORD *)(v8 + 104) = v17;
  *(_OWORD *)(v8 + 120) = v18;
  *(_OWORD *)(v8 + 136) = v19;
  *(_OWORD *)(v8 + 152) = v20;
  *(_OWORD *)(v8 + 168) = v21;
  *(void *)(v8 + 184) = v22;
  *(void *)(v8 + 192) = a1;
  uint64_t v9 = type metadata accessor for CanvasAction(0, v8 + 16);
  *(void *)(v8 + 216) = v9;
  *(void *)(v8 + 224) = *(void *)(v9 - 8);
  *(void *)(v8 + 232) = swift_task_alloc();
  sub_24EC77F60();
  *(void *)(v8 + 240) = sub_24EC77F50();
  uint64_t v11 = sub_24EC77F30();
  *(void *)(v8 + 248) = v11;
  *(void *)(v8 + 256) = v10;
  return MEMORY[0x270FA2498](sub_24EC72924, v11, v10);
}

uint64_t sub_24EC72924()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 184) + **(int **)(v3 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[33] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EC72A30;
  uint64_t v5 = v0[26];
  return v7(v5, v2, v3);
}

uint64_t sub_24EC72A30(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 272) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[31];
    uint64_t v6 = v4[32];
    uint64_t v7 = sub_24EC72E10;
  }
  else
  {
    v4[35] = a1;
    uint64_t v5 = v4[31];
    uint64_t v6 = v4[32];
    uint64_t v7 = sub_24EC72B58;
  }
  return MEMORY[0x270FA2498](v7, v5, v6);
}

uint64_t sub_24EC72B58()
{
  **(void **)(v0 + 232) = *(void *)(v0 + 280);
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v1;
  uint64_t v2 = sub_24EC77E10();
  *uint64_t v1 = v0;
  v1[1] = sub_24EC72C20;
  uint64_t v3 = *(void *)(v0 + 232);
  return MEMORY[0x270F252C8](v3, v2);
}

uint64_t sub_24EC72C20()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 232);
  uint64_t v3 = *(void *)(*v0 + 224);
  uint64_t v4 = *(void *)(*v0 + 216);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 256);
  uint64_t v6 = *(void *)(v1 + 248);
  return MEMORY[0x270FA2498](sub_24EC72DA4, v6, v5);
}

uint64_t sub_24EC72DA4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC72E10()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24EC72E7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[116] = v36;
  v8[115] = v34;
  v8[114] = v33;
  v8[113] = v32;
  v8[112] = v31;
  v8[111] = v30;
  v8[110] = v29;
  v8[109] = v28;
  v8[108] = v27;
  v8[107] = v26;
  v8[106] = v25;
  v8[105] = v24;
  v8[104] = v23;
  v8[103] = v22;
  v8[102] = v21;
  v8[101] = v20;
  v8[100] = a8;
  v8[99] = a7;
  v8[98] = a6;
  v8[97] = a5;
  v8[96] = a4;
  v8[95] = a3;
  v8[94] = a2;
  v8[93] = a1;
  v8[2] = a4;
  v8[3] = a5;
  v8[4] = a6;
  v8[5] = a7;
  v8[6] = a8;
  v8[7] = v20;
  v8[8] = v21;
  v8[9] = v22;
  v8[10] = v23;
  v8[11] = v24;
  v8[12] = v25;
  v8[13] = v26;
  v8[14] = v27;
  v8[15] = v28;
  v8[16] = v29;
  v8[17] = v30;
  v8[18] = v31;
  v8[19] = v32;
  v8[20] = v33;
  v8[21] = v34;
  v8[22] = v35;
  v8[23] = v36;
  uint64_t v10 = type metadata accessor for CanvasAction(0, (uint64_t)(v8 + 2));
  v8[117] = v10;
  v8[118] = *(void *)(v10 - 8);
  v8[119] = swift_task_alloc();
  sub_24EC78080();
  v8[120] = swift_task_alloc();
  v8[24] = a4;
  v8[25] = a5;
  v8[26] = a6;
  v8[27] = a7;
  v8[28] = a8;
  v8[29] = v20;
  v8[30] = v21;
  v8[31] = v22;
  v8[32] = v23;
  v8[33] = v24;
  v8[34] = v25;
  v8[35] = v26;
  v8[36] = v27;
  v8[37] = v28;
  v8[38] = v29;
  v8[39] = v30;
  v8[40] = v31;
  v8[41] = v32;
  v8[42] = v33;
  v8[43] = v34;
  v8[44] = v35;
  v8[45] = v36;
  uint64_t v11 = type metadata accessor for CanvasFeature(0, (uint64_t)(v8 + 24));
  v8[121] = v11;
  v8[122] = *(void *)(v11 - 8);
  v8[123] = swift_task_alloc();
  v8[124] = sub_24EC77F60();
  v8[125] = sub_24EC77F50();
  uint64_t v13 = sub_24EC77F30();
  v8[126] = v13;
  v8[127] = v12;
  return MEMORY[0x270FA2498](sub_24EC73178, v13, v12);
}

uint64_t sub_24EC73178()
{
  uint64_t v1 = (void *)v0[94];
  uint64_t v2 = v1[9];
  uint64_t v3 = v1[10];
  __swift_project_boxed_opaque_existential_1(v1 + 6, v2);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 184) + **(int **)(v3 + 184));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[128] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_24EC73284;
  uint64_t v5 = v0[95];
  return v7(v5, v2, v3);
}

uint64_t sub_24EC73284(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  swift_task_dealloc();
  if (v1)
  {
    MEMORY[0x25334BC00](v1);
    uint64_t v5 = v4[127];
    uint64_t v6 = v4[126];
    uint64_t v7 = sub_24EC73FC4;
  }
  else
  {
    v4[129] = a1;
    uint64_t v5 = v4[127];
    uint64_t v6 = v4[126];
    uint64_t v7 = sub_24EC733B8;
  }
  return MEMORY[0x270FA2498](v7, v6, v5);
}

uint64_t sub_24EC733B8()
{
  uint64_t v38 = v0;
  uint64_t v1 = *(void *)(v0 + 1032);
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 984);
  uint64_t v3 = *(void *)(v0 + 976);
  uint64_t v4 = *(void *)(v0 + 968);
  uint64_t v5 = *(void *)(v0 + 752);
  uint64_t v6 = sub_24EC77C90();
  __swift_project_value_buffer(v6, (uint64_t)qword_26B1DB4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_24EC77C70();
  os_log_type_t v8 = sub_24EC78070();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 984);
  uint64_t v11 = *(void *)(v0 + 976);
  uint64_t v12 = *(void *)(v0 + 968);
  if (v9)
  {
    long long v33 = *(_OWORD *)(v0 + 784);
    long long v34 = *(_OWORD *)(v0 + 768);
    long long v31 = *(_OWORD *)(v0 + 816);
    long long v32 = *(_OWORD *)(v0 + 800);
    long long v30 = *(_OWORD *)(v0 + 832);
    uint64_t v13 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v37 = v36;
    *(_DWORD *)uint64_t v13 = 136315394;
    sub_24EC6732C(v10 + 48, v0 + 688);
    *(_OWORD *)(v0 + 528) = v34;
    *(_OWORD *)(v0 + 544) = v33;
    *(_OWORD *)(v0 + 560) = v32;
    *(_OWORD *)(v0 + 576) = v31;
    *(_OWORD *)(v0 + 592) = v30;
    swift_getExtendedExistentialTypeMetadata();
    uint64_t v14 = sub_24EC77EA0();
    *(void *)(v0 + 728) = sub_24EC7437C(v14, v15, &v37);
    sub_24EC78090();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    *(_WORD *)(v13 + 12) = 2048;
    if (v1)
    {
      uint64_t v16 = *(void *)(v0 + 928);
      uint64_t v17 = *(void *)(v0 + 904);
      uint64_t v18 = *(void *)(v0 + 808);
      uint64_t v19 = *(void *)(v0 + 800);
      long long v20 = *(_OWORD *)(v0 + 784);
      *(_OWORD *)(v0 + 368) = *(_OWORD *)(v0 + 768);
      *(_OWORD *)(v0 + 384) = v20;
      *(void *)(v0 + 400) = v19;
      *(_OWORD *)(v0 + 408) = *(_OWORD *)(v0 + 816);
      *(void *)(v0 + 424) = v18;
      long long v21 = *(_OWORD *)(v0 + 856);
      *(_OWORD *)(v0 + 432) = *(_OWORD *)(v0 + 840);
      *(_OWORD *)(v0 + 448) = v21;
      long long v22 = *(_OWORD *)(v0 + 888);
      *(_OWORD *)(v0 + 464) = *(_OWORD *)(v0 + 872);
      *(_OWORD *)(v0 + 480) = v22;
      *(_OWORD *)(v0 + 496) = *(_OWORD *)(v0 + 912);
      *(void *)(v0 + 512) = v17;
      *(void *)(v0 + 520) = v16;
      uint64_t v23 = sub_24EC77B60();
      uint64_t v24 = MEMORY[0x25334B5D0](v1, v23);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = 0;
    }
    *(void *)(v0 + 736) = v24;
    sub_24EC78090();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24EC46000, v7, v8, "Populated %s with %ld sections", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v36, -1, -1);
    MEMORY[0x25334BDC0](v13, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    swift_bridgeObjectRelease();
  }

  uint64_t v25 = *(void **)(v0 + 752);
  uint64_t v26 = v25[9];
  uint64_t v27 = v25[10];
  __swift_project_boxed_opaque_existential_1(v25 + 6, v26);
  uint64_t v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v27 + 192) + **(int **)(v27 + 192));
  uint64_t v28 = (void *)swift_task_alloc();
  *(void *)(v0 + 1040) = v28;
  void *v28 = v0;
  v28[1] = sub_24EC737DC;
  return v35(v0 + 648, v26, v27);
}

uint64_t sub_24EC737DC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1016);
  uint64_t v3 = *(void *)(v1 + 1008);
  return MEMORY[0x270FA2498](sub_24EC738FC, v3, v2);
}

uint64_t sub_24EC738FC()
{
  uint64_t v1 = v0[84];
  uint64_t v2 = __swift_project_boxed_opaque_existential_1(v0 + 81, v1);
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t v4 = swift_task_alloc();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v4, v2, v1);
  v0[79] = swift_getAssociatedTypeWitness();
  v0[80] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v0 + 76);
  sub_24EC77FD0();
  swift_task_dealloc();
  uint64_t v5 = sub_24EC77F50();
  v0[131] = v5;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 76), v0[79]);
  uint64_t v6 = (void *)swift_task_alloc();
  v0[132] = (uint64_t)v6;
  *uint64_t v6 = v0;
  v6[1] = sub_24EC73AD8;
  uint64_t v7 = v0[120];
  uint64_t v8 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v7, v5, v8);
}

uint64_t sub_24EC73AD8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 1016);
  uint64_t v3 = *(void *)(v1 + 1008);
  return MEMORY[0x270FA2498](sub_24EC73C1C, v3, v2);
}

uint64_t sub_24EC73C1C()
{
  uint64_t v1 = v0[120];
  uint64_t v2 = v0[118];
  uint64_t v3 = v0[117];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 76));
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 81));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[119], v1, v3);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[133] = v6;
    uint64_t v7 = sub_24EC77E10();
    *uint64_t v6 = v0;
    v6[1] = sub_24EC73DA4;
    uint64_t v8 = v0[119];
    return MEMORY[0x270F252C8](v8, v7);
  }
}

uint64_t sub_24EC73DA4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 1016);
  uint64_t v3 = *(void *)(v1 + 1008);
  return MEMORY[0x270FA2498](sub_24EC73EC4, v3, v2);
}

uint64_t sub_24EC73EC4()
{
  (*(void (**)(uint64_t, uint64_t))(v0[118] + 8))(v0[119], v0[117]);
  uint64_t v1 = sub_24EC77F50();
  v0[131] = v1;
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 76), v0[79]);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[132] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_24EC73AD8;
  uint64_t v3 = v0[120];
  uint64_t v4 = MEMORY[0x263F8F500];
  return MEMORY[0x270FA1E88](v3, v1, v4);
}

uint64_t sub_24EC73FC4()
{
  uint64_t v29 = v0;
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 984);
  uint64_t v2 = *(void *)(v0 + 976);
  uint64_t v3 = *(void *)(v0 + 968);
  uint64_t v4 = *(void *)(v0 + 752);
  uint64_t v5 = sub_24EC77C90();
  __swift_project_value_buffer(v5, (uint64_t)qword_26B1DB4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v6 = sub_24EC77C70();
  os_log_type_t v7 = sub_24EC78070();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void *)(v0 + 984);
  uint64_t v10 = *(void *)(v0 + 976);
  uint64_t v11 = *(void *)(v0 + 968);
  if (v8)
  {
    long long v24 = *(_OWORD *)(v0 + 784);
    long long v25 = *(_OWORD *)(v0 + 768);
    long long v22 = *(_OWORD *)(v0 + 816);
    long long v23 = *(_OWORD *)(v0 + 800);
    long long v21 = *(_OWORD *)(v0 + 832);
    uint64_t v26 = *(void *)(v0 + 968);
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v28 = v13;
    *(_DWORD *)uint64_t v12 = 136315394;
    sub_24EC6732C(v9 + 48, v0 + 688);
    *(_OWORD *)(v0 + 528) = v25;
    *(_OWORD *)(v0 + 544) = v24;
    *(_OWORD *)(v0 + 560) = v23;
    *(_OWORD *)(v0 + 576) = v22;
    *(_OWORD *)(v0 + 592) = v21;
    swift_getExtendedExistentialTypeMetadata();
    uint64_t v14 = sub_24EC77EA0();
    *(void *)(v0 + 728) = sub_24EC7437C(v14, v15, &v28);
    sub_24EC78090();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v26);
    *(_WORD *)(v12 + 12) = 2048;
    *(void *)(v0 + 736) = 0;
    sub_24EC78090();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24EC46000, v6, v7, "Populated %s with %ld sections", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v13, -1, -1);
    MEMORY[0x25334BDC0](v12, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);

    swift_bridgeObjectRelease();
  }
  uint64_t v16 = *(void **)(v0 + 752);
  uint64_t v17 = v16[9];
  uint64_t v18 = v16[10];
  __swift_project_boxed_opaque_existential_1(v16 + 6, v17);
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 + 192) + **(int **)(v18 + 192));
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 1040) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_24EC737DC;
  return v27(v0 + 648, v17, v18);
}

void sub_24EC7436C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_24EC7437C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24EC7576C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24EC76F00((uint64_t)v12, *a3);
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
      sub_24EC76F00((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for CanvasFeature.TaskIdentifier(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasFeature.TaskIdentifier);
}

uint64_t sub_24EC7446C(uint64_t a1)
{
  uint64_t v33 = v1[3];
  uint64_t v34 = v1[2];
  uint64_t v32 = v1[4];
  uint64_t v30 = v1[6];
  uint64_t v31 = v1[5];
  uint64_t v4 = v1[9];
  uint64_t v3 = v1[8];
  uint64_t v29 = v1[7];
  uint64_t v5 = v1[10];
  uint64_t v6 = v1[12];
  uint64_t v28 = v1[11];
  uint64_t v7 = v1[14];
  uint64_t v27 = v1[13];
  uint64_t v8 = v1[16];
  uint64_t v26 = v1[15];
  uint64_t v9 = v1[18];
  uint64_t v25 = v1[17];
  uint64_t v24 = v1[19];
  uint64_t v11 = v1[20];
  uint64_t v10 = v1[21];
  uint64_t v12 = v1[22];
  uint64_t v13 = v1[23];
  v2[2] = v34;
  v2[3] = v33;
  v2[4] = v32;
  v2[5] = v31;
  v2[6] = v30;
  v2[7] = v29;
  v2[8] = v3;
  v2[9] = v4;
  v2[10] = v5;
  v2[11] = v28;
  v2[12] = v6;
  v2[13] = v27;
  v2[14] = v7;
  v2[15] = v26;
  v2[16] = v8;
  v2[17] = v25;
  v2[18] = v9;
  v2[19] = v24;
  v2[20] = v11;
  v2[21] = v10;
  v2[22] = v12;
  v2[23] = v13;
  uint64_t v14 = *(void *)(type metadata accessor for CanvasFeature(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v14 + 64);
  v2[24] = v4;
  uint64_t v17 = (v15 + 192) & ~v15;
  v2[25] = v5;
  v2[26] = v10;
  v2[27] = v12;
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(sub_24EC77BC0() - 8) + 80);
  uint64_t v19 = v17 + v16 + v18;
  uint64_t v20 = (uint64_t)v1 + v17;
  uint64_t v21 = (uint64_t)v1 + (v19 & ~v18);
  long long v22 = (void *)swift_task_alloc();
  v2[28] = v22;
  *long long v22 = v2;
  v22[1] = sub_24EC76F60;
  return sub_24EC72E7C(a1, v20, v21, v34, v33, v32, v31, v30);
}

uint64_t sub_24EC746C4()
{
  long long v1 = v0[2];
  v11[0] = v0[1];
  v11[1] = v1;
  long long v2 = v0[4];
  v11[2] = v0[3];
  v11[3] = v2;
  long long v3 = v0[6];
  v11[4] = v0[5];
  v11[5] = v3;
  long long v4 = v0[8];
  v11[6] = v0[7];
  v11[7] = v4;
  long long v5 = v0[10];
  v11[8] = v0[9];
  v11[9] = v5;
  v11[10] = v0[11];
  uint64_t v6 = (int *)(type metadata accessor for CanvasFeature(0, (uint64_t)v11) - 8);
  uint64_t v7 = (char *)v0
     + ((*(unsigned __int8 *)(*(void *)v6 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v6 + 80));
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v7 + 48));
  uint64_t v8 = &v7[v6[52]];
  uint64_t v9 = sub_24EC779C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return swift_deallocObject();
}

uint64_t sub_24EC74800(uint64_t a1)
{
  uint64_t v28 = v1[2];
  uint64_t v26 = v1[4];
  uint64_t v27 = v1[3];
  uint64_t v24 = v1[6];
  uint64_t v25 = v1[5];
  uint64_t v3 = v1[8];
  uint64_t v23 = v1[7];
  uint64_t v4 = v1[10];
  uint64_t v22 = v1[9];
  uint64_t v5 = v1[12];
  uint64_t v21 = v1[11];
  uint64_t v6 = v1[14];
  uint64_t v20 = v1[13];
  uint64_t v19 = v1[15];
  uint64_t v8 = v1[16];
  uint64_t v7 = v1[17];
  uint64_t v9 = v1[18];
  uint64_t v10 = v1[19];
  uint64_t v11 = v1[20];
  uint64_t v12 = v1[21];
  uint64_t v13 = v1[22];
  uint64_t v14 = v1[23];
  v2[2] = v28;
  v2[3] = v27;
  v2[4] = v26;
  v2[5] = v25;
  v2[6] = v24;
  v2[7] = v23;
  v2[8] = v3;
  v2[9] = v22;
  v2[10] = v4;
  v2[11] = v21;
  v2[12] = v5;
  v2[13] = v20;
  v2[14] = v6;
  v2[15] = v19;
  v2[16] = v8;
  v2[17] = v7;
  v2[18] = v9;
  v2[19] = v10;
  v2[20] = v11;
  v2[21] = v12;
  v2[22] = v13;
  v2[23] = v14;
  uint64_t v15 = *(void *)(type metadata accessor for CanvasFeature(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v16 = (uint64_t)v1 + ((*(unsigned __int8 *)(v15 + 80) + 192) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
  uint64_t v17 = (void *)swift_task_alloc();
  v2[24] = v17;
  *uint64_t v17 = v2;
  v17[1] = sub_24EC749D0;
  return sub_24EC71D9C(a1, v16, v28, v27, v26, v25, v24, v23);
}

uint64_t sub_24EC749D0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  long long v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  long long v5 = *(_OWORD *)(v0 + 32);
  long long v21 = *(_OWORD *)(v0 + 16);
  long long v22 = v5;
  long long v23 = *(_OWORD *)(v0 + 48);
  uint64_t v24 = v1;
  uint64_t v25 = v2;
  long long v6 = *(_OWORD *)(v0 + 96);
  long long v26 = *(_OWORD *)(v0 + 80);
  uint64_t v20 = v26;
  long long v27 = v6;
  long long v7 = *(_OWORD *)(v0 + 128);
  long long v28 = *(_OWORD *)(v0 + 112);
  long long v29 = v7;
  long long v30 = *(_OWORD *)(v0 + 144);
  uint64_t v31 = v3;
  uint64_t v32 = v4;
  long long v33 = *(_OWORD *)(v0 + 176);
  uint64_t v19 = v33;
  uint64_t v8 = (int *)(type metadata accessor for CanvasFeature(0, (uint64_t)&v21) - 8);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = *(void *)(*(void *)v8 + 64);
  *(void *)&long long v21 = v2;
  *((void *)&v21 + 1) = v20;
  uint64_t v11 = (v9 + 192) & ~v9;
  *(void *)&long long v22 = v4;
  *((void *)&v22 + 1) = v19;
  uint64_t v12 = sub_24EC77BC0();
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = (v11 + v10 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = v0 + v11;
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v15 + 48);
  uint64_t v16 = v15 + v8[52];
  uint64_t v17 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  (*(void (**)(unint64_t, uint64_t))(v13 + 8))(v0 + v14, v12);
  return swift_deallocObject();
}

uint64_t sub_24EC74CBC(uint64_t a1)
{
  uint64_t v33 = v1[3];
  uint64_t v34 = v1[2];
  uint64_t v32 = v1[4];
  uint64_t v30 = v1[6];
  uint64_t v31 = v1[5];
  uint64_t v4 = v1[9];
  uint64_t v3 = v1[8];
  uint64_t v29 = v1[7];
  uint64_t v5 = v1[10];
  uint64_t v6 = v1[12];
  uint64_t v28 = v1[11];
  uint64_t v7 = v1[14];
  uint64_t v27 = v1[13];
  uint64_t v8 = v1[16];
  uint64_t v26 = v1[15];
  uint64_t v9 = v1[18];
  uint64_t v25 = v1[17];
  uint64_t v24 = v1[19];
  uint64_t v11 = v1[20];
  uint64_t v10 = v1[21];
  uint64_t v12 = v1[22];
  uint64_t v13 = v1[23];
  v2[2] = v34;
  v2[3] = v33;
  v2[4] = v32;
  v2[5] = v31;
  v2[6] = v30;
  v2[7] = v29;
  v2[8] = v3;
  v2[9] = v4;
  v2[10] = v5;
  v2[11] = v28;
  v2[12] = v6;
  v2[13] = v27;
  v2[14] = v7;
  v2[15] = v26;
  v2[16] = v8;
  v2[17] = v25;
  v2[18] = v9;
  v2[19] = v24;
  v2[20] = v11;
  v2[21] = v10;
  v2[22] = v12;
  v2[23] = v13;
  uint64_t v14 = *(void *)(type metadata accessor for CanvasFeature(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v15 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v16 = *(void *)(v14 + 64);
  v2[24] = v4;
  uint64_t v17 = (v15 + 192) & ~v15;
  v2[25] = v5;
  v2[26] = v10;
  v2[27] = v12;
  uint64_t v18 = *(unsigned __int8 *)(*(void *)(sub_24EC77BC0() - 8) + 80);
  uint64_t v19 = v17 + v16 + v18;
  uint64_t v20 = (uint64_t)v1 + v17;
  uint64_t v21 = (uint64_t)v1 + (v19 & ~v18);
  long long v22 = (void *)swift_task_alloc();
  v2[28] = v22;
  *long long v22 = v2;
  v22[1] = sub_24EC74F14;
  return sub_24EC727E4(a1, v20, v21, v34, v33, v32, v31, v30);
}

uint64_t sub_24EC74F14()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24EC7500C(uint64_t a1)
{
  uint64_t v36 = v1[3];
  uint64_t v37 = v1[2];
  uint64_t v35 = v1[4];
  uint64_t v3 = v1[6];
  uint64_t v34 = v1[5];
  uint64_t v5 = v1[9];
  uint64_t v4 = v1[8];
  uint64_t v33 = v1[7];
  uint64_t v6 = v1[10];
  uint64_t v7 = v1[12];
  uint64_t v32 = v1[11];
  uint64_t v8 = v1[14];
  uint64_t v31 = v1[13];
  uint64_t v9 = v1[16];
  uint64_t v30 = v1[15];
  uint64_t v10 = v1[18];
  uint64_t v29 = v1[17];
  uint64_t v12 = v1[21];
  uint64_t v11 = v1[20];
  uint64_t v28 = v1[19];
  uint64_t v13 = v1[22];
  uint64_t v14 = v1[23];
  v2[2] = v37;
  v2[3] = v36;
  v2[4] = v35;
  v2[5] = v34;
  v2[6] = v3;
  v2[7] = v33;
  v2[8] = v4;
  v2[9] = v5;
  v2[10] = v6;
  v2[11] = v32;
  v2[12] = v7;
  v2[13] = v31;
  v2[14] = v8;
  v2[15] = v30;
  v2[16] = v9;
  v2[17] = v29;
  v2[18] = v10;
  v2[19] = v28;
  v2[20] = v11;
  v2[21] = v12;
  v2[22] = v13;
  v2[23] = v14;
  uint64_t v15 = *(void *)(type metadata accessor for CanvasFeature(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = *(void *)(v15 + 64);
  v2[24] = v5;
  uint64_t v18 = (v16 + 192) & ~v16;
  v2[25] = v6;
  v2[26] = v12;
  v2[27] = v13;
  uint64_t v19 = *(void *)(sub_24EC77BC0() - 8);
  unint64_t v20 = (v18 + v17 + *(unsigned __int8 *)(v19 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (uint64_t)v1 + v18;
  uint64_t v22 = (uint64_t)v1 + v20;
  long long v23 = (void *)((char *)v1 + ((*(void *)(v19 + 64) + v20 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v24 = *v23;
  uint64_t v25 = v23[1];
  uint64_t v26 = (void *)swift_task_alloc();
  v2[28] = v26;
  *uint64_t v26 = v2;
  v26[1] = sub_24EC76F60;
  return sub_24EC70F44(a1, v21, v22, v24, v25, v37, v36, v35);
}

uint64_t objectdestroy_11Tm()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v4 = *(void *)(v0 + 168);
  long long v5 = *(_OWORD *)(v0 + 32);
  long long v21 = *(_OWORD *)(v0 + 16);
  long long v22 = v5;
  long long v23 = *(_OWORD *)(v0 + 48);
  uint64_t v24 = v1;
  uint64_t v25 = v2;
  long long v6 = *(_OWORD *)(v0 + 96);
  long long v26 = *(_OWORD *)(v0 + 80);
  uint64_t v20 = v26;
  long long v27 = v6;
  long long v7 = *(_OWORD *)(v0 + 128);
  long long v28 = *(_OWORD *)(v0 + 112);
  long long v29 = v7;
  long long v30 = *(_OWORD *)(v0 + 144);
  uint64_t v31 = v3;
  uint64_t v32 = v4;
  long long v33 = *(_OWORD *)(v0 + 176);
  uint64_t v19 = v33;
  uint64_t v8 = (int *)(type metadata accessor for CanvasFeature(0, (uint64_t)&v21) - 8);
  uint64_t v9 = *(unsigned __int8 *)(*(void *)v8 + 80);
  uint64_t v10 = *(void *)(*(void *)v8 + 64);
  *(void *)&long long v21 = v2;
  *((void *)&v21 + 1) = v20;
  uint64_t v11 = (v9 + 192) & ~v9;
  *(void *)&long long v22 = v4;
  *((void *)&v22 + 1) = v19;
  uint64_t v12 = sub_24EC77BC0();
  uint64_t v13 = *(void *)(v12 - 8);
  unint64_t v14 = (v11 + v10 + *(unsigned __int8 *)(v13 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v15 = v0 + v11;
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v15 + 48);
  uint64_t v16 = v15 + v8[52];
  uint64_t v17 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  (*(void (**)(unint64_t, uint64_t))(v13 + 8))(v0 + v14, v12);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24EC754C8(uint64_t a1)
{
  uint64_t v36 = v1[3];
  uint64_t v37 = v1[2];
  uint64_t v35 = v1[4];
  uint64_t v3 = v1[6];
  uint64_t v34 = v1[5];
  uint64_t v5 = v1[9];
  uint64_t v4 = v1[8];
  uint64_t v33 = v1[7];
  uint64_t v6 = v1[10];
  uint64_t v7 = v1[12];
  uint64_t v32 = v1[11];
  uint64_t v8 = v1[14];
  uint64_t v31 = v1[13];
  uint64_t v9 = v1[16];
  uint64_t v30 = v1[15];
  uint64_t v10 = v1[18];
  uint64_t v29 = v1[17];
  uint64_t v12 = v1[21];
  uint64_t v11 = v1[20];
  uint64_t v28 = v1[19];
  uint64_t v13 = v1[22];
  uint64_t v14 = v1[23];
  v2[2] = v37;
  v2[3] = v36;
  v2[4] = v35;
  v2[5] = v34;
  v2[6] = v3;
  v2[7] = v33;
  v2[8] = v4;
  v2[9] = v5;
  v2[10] = v6;
  v2[11] = v32;
  v2[12] = v7;
  v2[13] = v31;
  v2[14] = v8;
  v2[15] = v30;
  v2[16] = v9;
  v2[17] = v29;
  v2[18] = v10;
  v2[19] = v28;
  v2[20] = v11;
  v2[21] = v12;
  v2[22] = v13;
  v2[23] = v14;
  uint64_t v15 = *(void *)(type metadata accessor for CanvasFeature(0, (uint64_t)(v2 + 2)) - 8);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v17 = *(void *)(v15 + 64);
  v2[24] = v5;
  uint64_t v18 = (v16 + 192) & ~v16;
  v2[25] = v6;
  v2[26] = v12;
  v2[27] = v13;
  uint64_t v19 = *(void *)(sub_24EC77BC0() - 8);
  unint64_t v20 = (v18 + v17 + *(unsigned __int8 *)(v19 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (uint64_t)v1 + v18;
  uint64_t v22 = (uint64_t)v1 + v20;
  long long v23 = (void *)((char *)v1 + ((*(void *)(v19 + 64) + v20 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v24 = *v23;
  uint64_t v25 = v23[1];
  long long v26 = (void *)swift_task_alloc();
  v2[28] = v26;
  *long long v26 = v2;
  v26[1] = sub_24EC76F60;
  return sub_24EC70200(a1, v21, v22, v24, v25, v37, v36, v35);
}

uint64_t sub_24EC7576C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24EC780A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24EC75928(a5, a6);
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
  uint64_t v8 = sub_24EC78110();
  if (!v8)
  {
    sub_24EC78170();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24EC78180();
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

uint64_t sub_24EC75928(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24EC759C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24EC75BA0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24EC75BA0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24EC759C0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24EC75B38(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24EC780E0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24EC78170();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24EC77EC0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24EC78180();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24EC78170();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24EC75B38(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D58);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24EC75BA0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B1D9D58);
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
  uint64_t result = sub_24EC78180();
  __break(1u);
  return result;
}

void _s13FitnessCanvas0B7FeatureV7dispose10localState06sharedF0y8DataFlow05EmptyF0V_AA0bF0Vyxq_q0_q1_q2_q3_q4_q5_q6_q7_GztF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B1D9CE0 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_24EC77C90();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B1DB4E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a2);
  int64_t v8 = sub_24EC77C70();
  os_log_type_t v9 = sub_24EC78070();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v15 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    v14[1] = v10 + 4;
    sub_24EC779C0();
    sub_24EC4AC4C(&qword_26B1D91D0);
    uint64_t v12 = sub_24EC78280();
    v14[2] = sub_24EC7437C(v12, v13, &v15);
    sub_24EC78090();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a2);
    _os_log_impl(&dword_24EC46000, v8, v9, "Disposing Canvas Feature %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25334BDC0](v11, -1, -1);
    MEMORY[0x25334BDC0](v10, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a2);
  }
}

uint64_t sub_24EC75F74()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC75F90()
{
  return swift_getWitnessTable();
}

unint64_t sub_24EC75FB0()
{
  unint64_t result = qword_26B1D9D28;
  if (!qword_26B1D9D28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B1D9D28);
  }
  return result;
}

uint64_t sub_24EC76004()
{
  return swift_getWitnessTable();
}

uint64_t sub_24EC76020()
{
  uint64_t result = sub_24EC779C0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24EC760C0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)a1 = v5;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    uint64_t v8 = a2[5];
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    *(void *)(a1 + 40) = v8;
    os_log_type_t v9 = a2 + 6;
    long long v10 = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 72) = v10;
    uint64_t v11 = v10;
    uint64_t v12 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v10 - 8);
    swift_retain();
    swift_retain();
    swift_retain();
    v12(a1 + 48, v9, v11);
    uint64_t v13 = *(int *)(a3 + 200);
    uint64_t v14 = a1 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = sub_24EC779C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_24EC76230(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  uint64_t v4 = a1 + *(int *)(a2 + 200);
  uint64_t v5 = sub_24EC779C0();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_24EC762C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = v6;
  uint64_t v7 = a1 + 48;
  uint64_t v8 = a2 + 48;
  long long v9 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v9;
  uint64_t v10 = v9;
  uint64_t v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  swift_retain();
  swift_retain();
  swift_retain();
  v11(v7, v8, v10);
  uint64_t v12 = *(int *)(a3 + 200);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

void *sub_24EC763E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_retain();
  swift_release();
  uint64_t v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 6, a2 + 6);
  uint64_t v9 = *(int *)(a3 + 200);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_24EC779C0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_24EC764B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  uint64_t v6 = *(int *)(a3 + 200);
  uint64_t v7 = a2 + v6;
  uint64_t v8 = a1 + v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v9 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8, v7, v9);
  return a1;
}

uint64_t sub_24EC76548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 48);
  long long v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v7 = *(int *)(a3 + 200);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_24EC779C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_24EC7660C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24EC76620);
}

uint64_t sub_24EC76620(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_24EC779C0();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 200);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_24EC766D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24EC766E4);
}

void *sub_24EC766E4(void *result, uint64_t a2, int a3, uint64_t a4)
{
  long long v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_24EC779C0();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 200);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_24EC7678C()
{
  uint64_t result = sub_24EC779C0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_24EC76824(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 3u:
        uint64_t v7 = sub_24EC779C0();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
        break;
      default:
        uint64_t v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_24EC76988(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 3:
      uint64_t v3 = sub_24EC779C0();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void *sub_24EC76A58(void *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 3u:
      uint64_t v4 = sub_24EC779C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
    default:
      uint64_t v5 = a2[1];
      *a1 = *a2;
      a1[1] = v5;
      swift_bridgeObjectRetain();
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_24EC76B6C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    (*(void (**)(void *, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 3u:
        uint64_t v5 = sub_24EC779C0();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
        break;
      default:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_24EC76CD0(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    uint64_t v6 = sub_24EC779C0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_24EC76D88(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 - 8);
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, a3);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      uint64_t v6 = sub_24EC779C0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
  }
  return a1;
}

uint64_t sub_24EC76E94()
{
  return swift_getWitnessTable();
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

uint64_t sub_24EC76F00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t CanvasFetcher.init(fetchSectionDescriptors:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t CanvasFetcher.fetchSectionDescriptors(for:)(uint64_t a1)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))(*v1 + *(int *)*v1);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_24EC57530;
  return v6(a1);
}

uint64_t CanvasFetcher.makeFetcherStream()(uint64_t a1, void *a2)
{
  v2[24] = a1;
  uint64_t v3 = a2[2];
  v2[25] = v3;
  uint64_t v4 = a2[3];
  v2[26] = v4;
  uint64_t v5 = a2[4];
  v2[27] = v5;
  uint64_t v6 = a2[5];
  v2[28] = v6;
  uint64_t v7 = a2[6];
  v2[29] = v7;
  uint64_t v8 = a2[9];
  v2[30] = v8;
  uint64_t v9 = a2[7];
  v2[31] = v9;
  uint64_t v10 = a2[8];
  v2[32] = v10;
  uint64_t v11 = a2[10];
  v2[33] = v11;
  uint64_t v12 = a2[11];
  v2[34] = v12;
  uint64_t v13 = a2[12];
  v2[35] = v13;
  uint64_t v14 = a2[13];
  v2[36] = v14;
  uint64_t v15 = a2[14];
  v2[37] = v15;
  uint64_t v16 = a2[15];
  v2[38] = v16;
  uint64_t v17 = a2[16];
  v2[39] = v17;
  uint64_t v18 = a2[17];
  v2[40] = v18;
  uint64_t v19 = a2[18];
  v2[41] = v19;
  uint64_t v20 = a2[21];
  v2[42] = v20;
  uint64_t v21 = a2[19];
  v2[43] = v21;
  uint64_t v22 = a2[20];
  v2[44] = v22;
  uint64_t v23 = a2[22];
  v2[45] = v23;
  uint64_t v24 = a2[23];
  v2[46] = v24;
  v2[2] = v3;
  v2[3] = v4;
  v2[4] = v5;
  v2[5] = v6;
  v2[6] = v7;
  v2[7] = v8;
  v2[8] = v9;
  v2[9] = v10;
  v2[10] = v11;
  v2[11] = v12;
  v2[12] = v13;
  v2[13] = v14;
  v2[14] = v15;
  v2[15] = v16;
  v2[16] = v17;
  v2[17] = v18;
  v2[18] = v19;
  v2[19] = v20;
  v2[20] = v21;
  v2[21] = v22;
  v2[22] = v23;
  v2[23] = v24;
  v2[47] = type metadata accessor for CanvasAction(255, (uint64_t)(v2 + 2));
  sub_24EC77FA0();
  v2[48] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24EC771DC, 0, 0);
}

uint64_t sub_24EC771DC()
{
  uint64_t v1 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v2 = *(void *)(v0 + 336);
  uint64_t v5 = *(void *)(v0 + 232);
  uint64_t v4 = *(void *)(v0 + 240);
  uint64_t v6 = *(uint64_t **)(v0 + 192);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + 216);
  long long v9 = *(_OWORD *)(v0 + 248);
  long long v10 = *(_OWORD *)(v0 + 264);
  long long v11 = *(_OWORD *)(v0 + 280);
  long long v12 = *(_OWORD *)(v0 + 296);
  long long v13 = *(_OWORD *)(v0 + 312);
  long long v14 = *(_OWORD *)(v0 + 344);
  long long v15 = *(_OWORD *)(v0 + 360);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)(v0 + 200);
  *(_OWORD *)(v7 + 32) = v8;
  *(void *)(v7 + 48) = v5;
  *(_OWORD *)(v7 + 56) = v9;
  *(void *)(v7 + 72) = v4;
  *(_OWORD *)(v7 + 80) = v10;
  *(_OWORD *)(v7 + 96) = v11;
  *(_OWORD *)(v7 + 112) = v12;
  *(_OWORD *)(v7 + 128) = v13;
  *(void *)(v7 + 144) = v3;
  *(_OWORD *)(v7 + 152) = v14;
  *(void *)(v7 + 168) = v2;
  *(_OWORD *)(v7 + 176) = v15;
  swift_checkMetadataState();
  uint64_t v16 = *MEMORY[0x263F8F580];
  uint64_t v17 = sub_24EC77FA0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v1, v16, v17);
  v6[3] = sub_24EC77FB0();
  v6[4] = swift_getWitnessTable();
  __swift_allocate_boxed_opaque_existential_1(v6);
  sub_24EC77FC0();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_24EC77390(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 96);
}

uint64_t sub_24EC77398(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 104);
}

uint64_t sub_24EC773A0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 112);
}

uint64_t sub_24EC773A8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 120);
}

uint64_t sub_24EC773B0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 128);
}

uint64_t sub_24EC773B8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 136);
}

uint64_t sub_24EC773C0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 144);
}

uint64_t sub_24EC773C8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 152);
}

uint64_t sub_24EC773D0(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_24EC77654;
  return CanvasFetcher.fetchSectionDescriptors(for:)(a1);
}

uint64_t sub_24EC77464(uint64_t a1, void *a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_24EC56BC8;
  return CanvasFetcher.makeFetcherStream()(a1, a2);
}

void *sub_24EC77504(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_24EC77534()
{
  return swift_release();
}

void *sub_24EC7753C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_24EC77584(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_24EC775B8(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24EC77600(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for CanvasFetcher(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA03B0](a1, a2, &nominal type descriptor for CanvasFetcher);
}

uint64_t dispatch thunk of CanvasFetching.fetchSectionDescriptors(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 184) + **(int **)(a3 + 184));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24EC77760;
  return v9(a1, a2, a3);
}

uint64_t sub_24EC77760(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t dispatch thunk of CanvasFetching.makeFetcherStream()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 192) + **(int **)(a3 + 192));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_24EC56BC8;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of CanvasFetching.onItemAppeared(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of CanvasFetching.onItemDisappeared(at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of CanvasFetching.invalidateItems(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t sub_24EC779A0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_24EC779B0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_24EC779C0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_24EC779D0()
{
  return MEMORY[0x270EF1738]();
}

uint64_t sub_24EC779E0()
{
  return MEMORY[0x270F2B370]();
}

uint64_t sub_24EC779F0()
{
  return MEMORY[0x270F2B378]();
}

uint64_t sub_24EC77A00()
{
  return MEMORY[0x270F2B3A0]();
}

uint64_t sub_24EC77A10()
{
  return MEMORY[0x270F2AD80]();
}

uint64_t sub_24EC77A20()
{
  return MEMORY[0x270F2AD88]();
}

uint64_t sub_24EC77A30()
{
  return MEMORY[0x270F2AD98]();
}

uint64_t sub_24EC77A40()
{
  return MEMORY[0x270F2ADA0]();
}

uint64_t sub_24EC77A50()
{
  return MEMORY[0x270F2ADA8]();
}

uint64_t sub_24EC77A60()
{
  return MEMORY[0x270F2ADB0]();
}

uint64_t sub_24EC77A70()
{
  return MEMORY[0x270F2ADB8]();
}

uint64_t sub_24EC77A80()
{
  return MEMORY[0x270F2ADC0]();
}

uint64_t sub_24EC77A90()
{
  return MEMORY[0x270F2ADC8]();
}

uint64_t sub_24EC77AA0()
{
  return MEMORY[0x270F2ADF8]();
}

uint64_t sub_24EC77AB0()
{
  return MEMORY[0x270F2AE00]();
}

uint64_t sub_24EC77AC0()
{
  return MEMORY[0x270F2AE10]();
}

uint64_t sub_24EC77AD0()
{
  return MEMORY[0x270F2AE18]();
}

uint64_t sub_24EC77AE0()
{
  return MEMORY[0x270F2AE20]();
}

uint64_t sub_24EC77AF0()
{
  return MEMORY[0x270F2AE28]();
}

uint64_t sub_24EC77B00()
{
  return MEMORY[0x270F2AE30]();
}

uint64_t sub_24EC77B10()
{
  return MEMORY[0x270F2AE48]();
}

uint64_t sub_24EC77B20()
{
  return MEMORY[0x270F2AE58]();
}

uint64_t sub_24EC77B30()
{
  return MEMORY[0x270F2AE70]();
}

uint64_t sub_24EC77B40()
{
  return MEMORY[0x270F2AE88]();
}

uint64_t sub_24EC77B50()
{
  return MEMORY[0x270F2AEA8]();
}

uint64_t sub_24EC77B60()
{
  return MEMORY[0x270F2AED8]();
}

uint64_t sub_24EC77B70()
{
  return MEMORY[0x270F2AEE8]();
}

uint64_t sub_24EC77B80()
{
  return MEMORY[0x270F2AF68]();
}

uint64_t sub_24EC77B90()
{
  return MEMORY[0x270F2AF80]();
}

uint64_t sub_24EC77BA0()
{
  return MEMORY[0x270F2AF88]();
}

uint64_t sub_24EC77BB0()
{
  return MEMORY[0x270F2AFE0]();
}

uint64_t sub_24EC77BC0()
{
  return MEMORY[0x270F2AFF0]();
}

uint64_t sub_24EC77BD0()
{
  return MEMORY[0x270F2B0D8]();
}

uint64_t sub_24EC77BE0()
{
  return MEMORY[0x270F2B188]();
}

uint64_t sub_24EC77BF0()
{
  return MEMORY[0x270F2B190]();
}

uint64_t sub_24EC77C00()
{
  return MEMORY[0x270F2B198]();
}

uint64_t sub_24EC77C10()
{
  return MEMORY[0x270F2CD28]();
}

uint64_t sub_24EC77C20()
{
  return MEMORY[0x270F2CD48]();
}

uint64_t sub_24EC77C30()
{
  return MEMORY[0x270F2CD70]();
}

uint64_t sub_24EC77C40()
{
  return MEMORY[0x270F2CD78]();
}

uint64_t sub_24EC77C50()
{
  return MEMORY[0x270F2CD80]();
}

uint64_t sub_24EC77C60()
{
  return MEMORY[0x270F2CD88]();
}

uint64_t sub_24EC77C70()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24EC77C80()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24EC77C90()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24EC77CA0()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_24EC77CB0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_24EC77CC0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24EC77CD0()
{
  return MEMORY[0x270F00268]();
}

uint64_t sub_24EC77CE0()
{
  return MEMORY[0x270F00270]();
}

uint64_t sub_24EC77CF0()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_24EC77D00()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_24EC77D10()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_24EC77D20()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24EC77D30()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24EC77D40()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24EC77D50()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_24EC77D60()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_24EC77D70()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_24EC77D80()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_24EC77D90()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_24EC77DA0()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_24EC77DB0()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_24EC77DC0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_24EC77DD0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_24EC77DE0()
{
  return MEMORY[0x270F04850]();
}

uint64_t sub_24EC77DF0()
{
  return MEMORY[0x270F252C0]();
}

uint64_t sub_24EC77E10()
{
  return MEMORY[0x270F252D0]();
}

uint64_t sub_24EC77E20()
{
  return MEMORY[0x270F25398]();
}

uint64_t sub_24EC77E30()
{
  return MEMORY[0x270F253A0]();
}

uint64_t sub_24EC77E40()
{
  return MEMORY[0x270F253B0]();
}

uint64_t sub_24EC77E50()
{
  return MEMORY[0x270F253C0]();
}

uint64_t sub_24EC77E60()
{
  return MEMORY[0x270F253E8]();
}

uint64_t sub_24EC77E70()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_24EC77E80()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24EC77E90()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_24EC77EA0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24EC77EB0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24EC77EC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24EC77ED0()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_24EC77EE0()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_24EC77EF0()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_24EC77F00()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_24EC77F10()
{
  return MEMORY[0x270F9DCE8]();
}

uint64_t sub_24EC77F20()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_24EC77F30()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24EC77F50()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24EC77F60()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24EC77F70()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_24EC77F80()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24EC77F90()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24EC77FA0()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_24EC77FB0()
{
  return MEMORY[0x270FA1F88]();
}

uint64_t sub_24EC77FC0()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24EC77FD0()
{
  return MEMORY[0x270FA2080]();
}

uint64_t sub_24EC77FE0()
{
  return MEMORY[0x270F9DF70]();
}

uint64_t sub_24EC77FF0()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_24EC78000()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_24EC78010()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_24EC78020()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_24EC78030()
{
  return MEMORY[0x270F9E0E8]();
}

uint64_t sub_24EC78040()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_24EC78050()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_24EC78060()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24EC78070()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24EC78080()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24EC78090()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24EC780A0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24EC780B0()
{
  return MEMORY[0x270F9E708]();
}

uint64_t sub_24EC780C0()
{
  return MEMORY[0x270F9E718]();
}

uint64_t sub_24EC780D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_24EC780E0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24EC780F0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24EC78100()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24EC78110()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24EC78120()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_24EC78130()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_24EC78140()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_24EC78150()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_24EC78160()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_24EC78170()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24EC78180()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24EC78190()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_24EC781A0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24EC781B0()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24EC781C0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24EC781D0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24EC781E0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_24EC781F0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24EC78200()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24EC78210()
{
  return MEMORY[0x270F9F378]();
}

uint64_t sub_24EC78220()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24EC78230()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24EC78240()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24EC78250()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_24EC78260()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24EC78270()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_24EC78280()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24EC78290()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24EC782A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24EC782B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24EC782C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24EC782D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24EC782E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24EC782F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24EC78300()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24EC78310()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24EC78320()
{
  return MEMORY[0x270F9FD98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x270FA2420]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x270FA2428]();
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

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x270FA0360]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}