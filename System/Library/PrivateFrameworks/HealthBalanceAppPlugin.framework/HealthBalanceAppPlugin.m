uint64_t sub_250E3B270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void v35[2];
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  sub_250E406B8(0, (unint64_t *)&unk_26B20C5B0, MEMORY[0x263F8D6C8], MEMORY[0x263EFDDF8]);
  v48 = v0;
  MEMORY[0x270FA5388](v0);
  v39 = (char *)v35 - v1;
  sub_250E41300();
  v47 = v2;
  MEMORY[0x270FA5388](v2);
  v35[1] = (char *)v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_250E7AD78();
  v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E413B4();
  v42 = v8;
  MEMORY[0x270FA5388](v8);
  v35[0] = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E41B48();
  v11 = *(void *)(v10 - 8);
  v40 = v10;
  v41 = v11;
  MEMORY[0x270FA5388](v10);
  v37 = (char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E416D0();
  v14 = *(void *)(v13 - 8);
  v43 = v13;
  v44 = v14;
  MEMORY[0x270FA5388](v13);
  v36 = (char *)v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E418CC();
  v17 = *(void *)(v16 - 8);
  v45 = v16;
  v46 = v17;
  MEMORY[0x270FA5388](v16);
  v38 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepingSampleChangesAlertGenerator(0);
  sub_250E79E98();
  v19 = sub_250E79F38();
  v51 = sub_250E3CFF4((v19 & 1) == 0);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F42F98], v4);
  sub_250E7AD68();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_250E79E98();
  sub_250E79F38();
  sub_250E79938();
  sub_250E3B9C0(&qword_26B20BCF8, MEMORY[0x263F07490]);
  v20 = sub_250E7AD88();
  swift_bridgeObjectRelease();
  v49 = v20;
  sub_250E41660();
  v22 = v21;
  v23 = sub_250E3B9C0(&qword_26B20C530, (void (*)(uint64_t))sub_250E41660);
  sub_250E7A9D8();
  swift_release();
  v24 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  v25 = sub_250E3B9C0(&qword_26B20C6F8, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
  sub_250E7A9D8();
  v49 = sub_250E79CE8();
  sub_250E7A998();
  v26 = (void (*)(uint64_t))MEMORY[0x263F42EF8];
  sub_250E415AC(0, &qword_26B20C548, MEMORY[0x263F42EF8]);
  sub_250E41610(&qword_26B20C540, &qword_26B20C548, v26);
  v49 = v22;
  v50 = v23;
  swift_getOpaqueTypeConformance2();
  v49 = v24;
  v50 = v25;
  swift_getOpaqueTypeConformance2();
  sub_250E41468();
  v27 = v37;
  sub_250E7A908();
  sub_250E79EC8();
  v28 = v36;
  v29 = v40;
  sub_250E7A8E8();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v27, v29);
  type metadata accessor for SleepingSampleChangesAlertGenerator.Change(0);
  sub_250E3B9C0(&qword_26B20C4E8, (void (*)(uint64_t))sub_250E416D0);
  v30 = v38;
  v31 = v43;
  sub_250E7A9F8();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v28, v31);
  sub_250E3B9C0(&qword_26B20C4A8, (void (*)(uint64_t))sub_250E418CC);
  v32 = v45;
  v33 = sub_250E7A9E8();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v30, v32);
  return v33;
}

uint64_t sub_250E3B9C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E3BA08()
{
  sub_250E41300();
  uint64_t v24 = v0;
  MEMORY[0x270FA5388](v0);
  sub_250E41DC8();
  uint64_t v23 = v1;
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E41764();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  uint64_t v26 = v6;
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E41978();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v27 = v9;
  uint64_t v28 = v10;
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepingSampleHelpTileGenerator(0);
  uint64_t ObjectType = swift_getObjectType();
  sub_250E79E98();
  char v14 = sub_250E79F38();
  uint64_t v31 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)((v14 & 1) == 0, ObjectType);
  uint64_t v15 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  uint64_t v16 = sub_250E3BE60(&qword_26B20C6F8, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
  sub_250E7A9D8();
  sub_250E3DEC8();
  sub_250E3BE60(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
  uint64_t v29 = v15;
  uint64_t v30 = v16;
  swift_getOpaqueTypeConformance2();
  sub_250E7A8D8();
  sub_250E79EC8();
  uint64_t v17 = v23;
  sub_250E7A8B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v17);
  type metadata accessor for SleepingSampleHelpTileGenerator.Change(0);
  sub_250E3BE60(&qword_26B20C4C8, (void (*)(uint64_t))sub_250E41764);
  uint64_t v18 = v25;
  sub_250E7A9F8();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v18);
  sub_250E3BE60(&qword_26B20C498, (void (*)(uint64_t))sub_250E41978);
  uint64_t v19 = v27;
  uint64_t v20 = sub_250E7A9E8();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v19);
  return v20;
}

uint64_t sub_250E3BE60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E3BEA8(uint64_t a1, void *a2, char a3)
{
  int v6 = a3 & 1;
  uint64_t v7 = *(void *)(_s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0) - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v3 + v8;
  uint64_t v10 = v3 + ((*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = *(void (**)(void **))v10;
  uint64_t v12 = *(void *)(v10 + 8);
  return sub_250E3C654(a1, a2, v6, v9, v11, v12);
}

void sub_250E3BF60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_250E7A5B8();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(v5 + *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20));
}

void sub_250E3C040(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();

  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(v5 + *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20));
}

uint64_t sub_250E3C138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_250E79B38();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_unknownObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v8 + *(int *)(v12 + 20)) = *(unsigned char *)(v9 + *(int *)(v12 + 20));
  uint64_t v13 = *(int *)(v12 + 24);
  char v14 = (void *)(v8 + v13);
  uint64_t v15 = (void *)(v9 + v13);
  uint64_t v16 = v15[1];
  *char v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  uint64_t v18 = *(void **)(v9 + v17);
  *(void *)(v8 + v17) = v18;
  swift_bridgeObjectRetain();
  id v19 = v18;
  return a1;
}

void *sub_250E3C25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v22 = a2;
  uint64_t v5 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = *(void *)(v5 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250E79988();
  MEMORY[0x270FA5388](v10 - 8);
  sub_250E3CB44();
  MEMORY[0x270FA5388](v11 - 8);
  sub_250E79B08();
  sub_250E79B28();
  sub_250E3C55C(a1, (uint64_t)v9, _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v13 = (v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = swift_allocObject();
  sub_250E3C4C4((uint64_t)v9, v14 + v12);
  uint64_t v15 = (void *)(v14 + v13);
  *uint64_t v15 = v22;
  v15[1] = a3;
  sub_250E3CF60();
  objc_allocWithZone(v16);
  swift_retain();
  uint64_t v17 = (void *)sub_250E79BC8();
  uint64_t v18 = *(void **)(a1 + *(int *)(v6 + 32) + 8);
  id v19 = v17;
  if (v18) {
    uint64_t v18 = (void *)sub_250E7AB78();
  }
  objc_msgSend(v17, sel_setDebugIdentifier_, v18);

  return v17;
}

uint64_t sub_250E3C4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_250E3C528@<X0>(uint64_t a1@<X8>)
{
  return sub_250E3C55C(v1, a1, _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa);
}

uint64_t sub_250E3C55C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_250E3C5C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_250E3C654(uint64_t a1, void *a2, int a3, uint64_t a4, void (*a5)(void **), uint64_t a6)
{
  uint64_t v40 = a6;
  v41 = a5;
  int v37 = a3;
  sub_250E3CF08();
  uint64_t v42 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v11 = (void **)((char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = sub_250E79C18();
  uint64_t v35 = *(void *)(v39 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v38 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_250E79B38();
  uint64_t v14 = *(void *)(v13 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  Class v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E3CAD4();
  uint64_t v17 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v19 = (void **)((char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v17);
  uint64_t v21 = (uint64_t *)((char *)&v35 - v20);
  uint64_t v36 = a4;
  if (v37)
  {
    *uint64_t v21 = a2;
    swift_storeEnumTagMultiPayload();
    id v22 = a2;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a4, v13);
    swift_bridgeObjectRetain();
    sub_250E79BE8();
    swift_storeEnumTagMultiPayload();
  }
  sub_250E3C55C((uint64_t)v21, (uint64_t)v19, (uint64_t (*)(void))sub_250E3CAD4);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v25 = v38;
  uint64_t v24 = v39;
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v26 = *v19;
    *uint64_t v11 = *v19;
    uint64_t v27 = v42;
    (*(void (**)(void **, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F449B8], v42);
    id v28 = v26;
    v41(v11);

    (*(void (**)(void **, uint64_t))(v9 + 8))(v11, v27);
  }
  else
  {
    uint64_t v29 = v35;
    (*(void (**)(char *, void **, uint64_t))(v35 + 32))(v38, v19, v39);
    int v30 = *(unsigned __int8 *)(v36
                             + *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0) + 20));
    (*(void (**)(void **, char *, uint64_t))(v29 + 16))(v11, v25, v24);
    uint64_t v31 = (void (**)(char *, uint64_t))(v29 + 8);
    if (v30 == 1) {
      v32 = (unsigned int *)MEMORY[0x263F449C0];
    }
    else {
      v32 = (unsigned int *)MEMORY[0x263F449B0];
    }
    uint64_t v33 = v42;
    (*(void (**)(void **, void, uint64_t))(v9 + 104))(v11, *v32, v42);
    v41(v11);
    (*(void (**)(void **, uint64_t))(v9 + 8))(v11, v33);
    (*v31)(v25, v24);
  }
  return sub_250E3CA78((uint64_t)v21);
}

uint64_t sub_250E3CA78(uint64_t a1)
{
  sub_250E3CAD4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_250E3CAD4()
{
  if (!qword_26B20C828)
  {
    sub_250E79C18();
    sub_250E5F04C();
    unint64_t v0 = sub_250E7B1B8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C828);
    }
  }
}

void sub_250E3CB44()
{
  if (!qword_26B20C618)
  {
    sub_250E7AA78();
    sub_250E69CC8();
    unint64_t v0 = sub_250E7AAD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C618);
    }
  }
}

uint64_t sub_250E3CBA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  uint64_t v9 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_250E79B38();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  swift_retain();
  id v14 = v8;
  swift_retain();
  v13(v10, v11, v12);
  uint64_t v15 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v10 + *(int *)(v15 + 20)) = *(unsigned char *)(v11 + *(int *)(v15 + 20));
  uint64_t v16 = *(int *)(v15 + 24);
  uint64_t v17 = (void *)(v10 + v16);
  uint64_t v18 = (void *)(v11 + v16);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  uint64_t v21 = *(void **)(v11 + v20);
  *(void *)(v10 + v20) = v21;
  swift_bridgeObjectRetain();
  id v22 = v21;
  return a1;
}

void sub_250E3CCF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + *(int *)(a2 + 20));
}

uint64_t sub_250E3CD80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = *(int *)(v7 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v13;
  swift_bridgeObjectRetain();
  id v14 = v13;
  return a1;
}

uint64_t sub_250E3CE2C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20C658);
}

uint64_t sub_250E3CE84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t _s43SleepingSampleDaySummaryCollectionPublisherVMa(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20C700);
}

void sub_250E3CF08()
{
  if (!qword_26B20BD58)
  {
    sub_250E79C18();
    unint64_t v0 = sub_250E7A798();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20BD58);
    }
  }
}

void sub_250E3CF60()
{
  if (!qword_26B20BD18)
  {
    sub_250E79B88();
    sub_250E3EE60(&qword_26B20BD08, MEMORY[0x263F42D70]);
    unint64_t v0 = sub_250E79BD8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20BD18);
    }
  }
}

uint64_t sub_250E3CFF4(char a1)
{
  sub_250E41D28();
  uint64_t v3 = v2;
  uint64_t v33 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_250E41D28;
  id v28 = sub_250E68830;
  sub_250E3D5E8(0, &qword_26B20C4E0, (void (*)(uint64_t))sub_250E41D28, (void (*)(void))sub_250E68830);
  uint64_t v37 = v6;
  MEMORY[0x270FA5388](v6);
  sub_250E41A24();
  uint64_t v32 = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_250E41A24;
  int v30 = sub_250E68864;
  sub_250E3D5E8(0, &qword_26B20C500, (void (*)(uint64_t))sub_250E41A24, (void (*)(void))sub_250E68864);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v34 = v11;
  uint64_t v35 = v12;
  MEMORY[0x270FA5388](v11);
  id v14 = (char *)&v28 - v13;
  sub_250E417F8();
  uint64_t v36 = v15;
  uint64_t v38 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v43 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, ObjectType);
  uint64_t v19 = swift_getObjectType();
  uint64_t v42 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v19);
  uint64_t v20 = swift_getObjectType();
  uint64_t v41 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v20);
  uint64_t v21 = swift_getObjectType();
  uint64_t v40 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v21);
  uint64_t v22 = swift_getObjectType();
  uint64_t v39 = HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(a1, v22);
  sub_250E3DEC8();
  sub_250E3D550(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
  sub_250E7A8D8();
  sub_250E79EC8();
  sub_250E7A8B8();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v5, v3);
  sub_250E3D598(&qword_26B20C4D8, &qword_26B20C4E0, (void (*)(uint64_t))v29, (void (*)(void))v28);
  sub_250E7A908();
  sub_250E79EC8();
  uint64_t v23 = v32;
  sub_250E7A8E8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v23);
  sub_250E79C48();
  sub_250E3D598(&qword_26B20C4F8, &qword_26B20C500, (void (*)(uint64_t))v31, (void (*)(void))v30);
  uint64_t v24 = v34;
  sub_250E7A9F8();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v24);
  sub_250E3D550(&qword_26B20C4B8, (void (*)(uint64_t))sub_250E417F8);
  uint64_t v25 = v36;
  uint64_t v26 = sub_250E7A9E8();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v25);
  return v26;
}

uint64_t sub_250E3D550(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E3D598(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_250E3D5E8(255, a2, a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_250E3D5E8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t), void (*a4)(void))
{
  if (!*a2)
  {
    a3(255);
    a4();
    unint64_t v6 = sub_250E7A938();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_250E3D658@<X0>(id *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  sub_250E3DA18();
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1)
  {
    id v11 = *a1;
    uint64_t v17 = a2;
    sub_250E3DB04();
    uint64_t v17 = sub_250E7A9E8();
    sub_250E3D94C(0, (unint64_t *)&qword_26B20C818, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_250E7C4F0;
    *(void *)(v12 + 32) = v11;
    uint64_t v16 = v12;
    sub_250E7AC68();
    sub_250E3DEC8();
    sub_250E3DE80(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
    id v13 = v11;
    sub_250E7AA08();
    swift_release();
    swift_bridgeObjectRelease();
    sub_250E3DE80((unint64_t *)&unk_26B20C480, (void (*)(uint64_t))sub_250E3DA18);
    uint64_t v14 = sub_250E7A9E8();

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    uint64_t v17 = a2;
    sub_250E3DB04();
    uint64_t result = sub_250E7A9E8();
    uint64_t v14 = result;
  }
  *a3 = v14;
  return result;
}

uint64_t sub_250E3D8B0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x60));
  sub_250E3D94C(0, &qword_26B20C430, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F90240]);
  a1[3] = v4;
  a1[4] = sub_250E3D998();
  *a1 = v3;
  return swift_retain();
}

void sub_250E3D94C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_250E3D998()
{
  unint64_t result = qword_26B20C428;
  if (!qword_26B20C428)
  {
    sub_250E3D94C(255, &qword_26B20C430, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F90240]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20C428);
  }
  return result;
}

void sub_250E3DA18()
{
  if (!qword_26B20C490)
  {
    sub_250E693A0();
    sub_250E3DEC8();
    sub_250E3DE80(&qword_26B20C520, (void (*)(uint64_t))sub_250E693A0);
    sub_250E3DE80(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
    unint64_t v0 = sub_250E7A918();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C490);
    }
  }
}

unint64_t sub_250E3DB04()
{
  unint64_t result = qword_26B20BDD0;
  if (!qword_26B20BDD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BDD0);
  }
  return result;
}

uint64_t HKFeatureStatusProviding.makePublisherWithCurrentValue(observingChanges:)(char a1, uint64_t a2)
{
  sub_250E3E74C();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v19 = v5;
  uint64_t v20 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E3E61C();
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = v2;
  *(unsigned char *)(v14 + 32) = a1;
  sub_250E3E718(0);
  sub_250E3DE80((unint64_t *)&unk_26B20C570, sub_250E3E718);
  swift_unknownObjectRetain();
  sub_250E7A9B8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = v2;
  swift_unknownObjectRetain();
  sub_250E7A978();
  sub_250E3DEC8();
  sub_250E3DE80(&qword_26B20C5E0, (void (*)(uint64_t))sub_250E3E61C);
  sub_250E3DE80(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
  sub_250E7AA18();
  swift_release();
  sub_250E3DE80(&qword_26B20C508, (void (*)(uint64_t))sub_250E3E74C);
  uint64_t v16 = v19;
  uint64_t v17 = sub_250E7A9E8();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v16);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v17;
}

uint64_t sub_250E3DE80(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_250E3DEC8()
{
  if (!qword_26B20C590)
  {
    sub_250E40A50(255, (unint64_t *)&qword_26B20C790);
    unint64_t v0 = sub_250E7A988();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C590);
    }
  }
}

uint64_t sub_250E3DF40@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v53 = a3;
  v56 = a4;
  v58[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v6 = sub_250E7A888();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v55 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E3E6B0(0);
  uint64_t v54 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E3E6E4(0);
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)(v13 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v45 - v19;
  v58[0] = 0;
  id v21 = objc_msgSend(a1, sel_featureStatusWithError_, v58);
  id v22 = v58[0];
  if (v21)
  {
    v58[0] = v21;
    sub_250E3E5E8(0);
    id v23 = v22;
    sub_250E7A998();
    sub_250E3DE80((unint64_t *)&unk_26B20C5C0, sub_250E3E6E4);
    uint64_t v24 = sub_250E7A9E8();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, v14);
  }
  else
  {
    uint64_t v46 = v14;
    v47 = v18;
    uint64_t v48 = v15;
    uint64_t v49 = v7;
    v50 = v12;
    uint64_t v51 = v6;
    int v52 = a2;
    uint64_t v45 = v10;
    id v26 = v58[0];
    uint64_t v27 = (void *)sub_250E798A8();

    swift_willThrow();
    id v28 = v55;
    sub_250E7A858();
    id v29 = v27;
    id v30 = v27;
    uint64_t v31 = sub_250E7A878();
    os_log_type_t v32 = sub_250E7AD18();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v34 = (void *)swift_slowAlloc();
      v58[0] = v34;
      *(_DWORD *)uint64_t v33 = 136446466;
      uint64_t v35 = sub_250E7B218();
      uint64_t v57 = sub_250E3FFA8(v35, v36, (uint64_t *)v58);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2082;
      uint64_t v57 = (uint64_t)v27;
      id v37 = v27;
      sub_250E5F04C();
      uint64_t v38 = sub_250E7ABE8();
      uint64_t v57 = sub_250E3FFA8(v38, v39, (uint64_t *)v58);
      sub_250E7AE88();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_250E38000, v31, v32, "[%{public}s] Failed to get initial feature status: %{public}s", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v34, -1, -1);
      MEMORY[0x25338C970](v33, -1, -1);
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v28, v51);
    uint64_t v40 = v46;
    uint64_t v41 = v47;
    uint64_t v42 = v50;
    uint64_t v43 = v48;
    if (v52)
    {
      v58[0] = 0;
      sub_250E3E5E8(0);
      sub_250E7A998();
      sub_250E3DE80((unint64_t *)&unk_26B20C5C0, sub_250E3E6E4);
      uint64_t v24 = sub_250E7A9E8();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v41, v40);
    }
    else
    {
      sub_250E3E5E8(0);
      sub_250E7A9A8();
      sub_250E3DE80(&qword_269B0CE18, sub_250E3E6B0);
      uint64_t v44 = v54;
      uint64_t v24 = sub_250E7A9E8();

      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v42, v44);
    }
  }
  uint64_t *v56 = v24;
  return result;
}

void sub_250E3E510(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_250E3E574(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t, void, void))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7, MEMORY[0x263F8E628], MEMORY[0x263F8E658]);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

void sub_250E3E5E8(uint64_t a1)
{
}

void sub_250E3E61C()
{
  if (!qword_26B20C5E8)
  {
    sub_250E3E718(255);
    sub_250E3DE80((unint64_t *)&unk_26B20C570, sub_250E3E718);
    unint64_t v0 = sub_250E7A9C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C5E8);
    }
  }
}

void sub_250E3E6B0(uint64_t a1)
{
}

void sub_250E3E6E4(uint64_t a1)
{
}

void sub_250E3E718(uint64_t a1)
{
}

void sub_250E3E74C()
{
  if (!qword_26B20C510)
  {
    sub_250E3DEC8();
    sub_250E3E61C();
    sub_250E3DE80(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
    sub_250E3DE80(&qword_26B20C5E0, (void (*)(uint64_t))sub_250E3E61C);
    unint64_t v0 = sub_250E7A948();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C510);
    }
  }
}

unint64_t sub_250E3E83C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_250E407B8();
  uint64_t v2 = (void *)sub_250E7B078();
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
    unint64_t result = sub_250E3E944((uint64_t)v6);
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

unint64_t sub_250E3E944(uint64_t a1)
{
  sub_250E7ABA8();
  sub_250E7B188();
  sub_250E7AC08();
  uint64_t v2 = sub_250E7B1A8();
  swift_bridgeObjectRelease();
  return sub_250E3E9D8(a1, v2);
}

unint64_t sub_250E3E9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_250E7ABA8();
    uint64_t v8 = v7;
    if (v6 == sub_250E7ABA8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_250E7B148();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_250E7ABA8();
          uint64_t v15 = v14;
          if (v13 == sub_250E7ABA8() && v15 == v16) {
            break;
          }
          char v18 = sub_250E7B148();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_250E3EB50@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_250E3D658(a1, *(void *)(v2 + 24), a2);
}

uint64_t sub_250E3EB58@<X0>(uint64_t *a1@<X8>)
{
  return sub_250E3DF40(*(void **)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_250E3EB64(uint64_t a1)
{
  return sub_250E4007C(a1, *v1);
}

uint64_t sub_250E3EB80()
{
  return sub_250E7A7D8();
}

uint64_t sub_250E3EBD8(uint64_t a1)
{
  uint64_t v3 = (char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x68);
  swift_beginAccess();
  uint64_t v4 = sub_250E7A808();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t sub_250E3ECB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x68);
  swift_beginAccess();
  uint64_t v4 = sub_250E7A808();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_250E3ED88(SEL *a1)
{
  return objc_msgSend(*(id *)((char *)v1 + *(void *)((*MEMORY[0x263F8EED0] & *v1) + 0x70)), *a1, v1);
}

id sub_250E3EDC0()
{
  return sub_250E3ED88((SEL *)&selRef_registerObserver_);
}

uint64_t sub_250E3EDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_250E3EE60(&qword_26B20C6F0, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
  return MEMORY[0x270F34FF8](a1, a4, a2, v8, a3);
}

uint64_t sub_250E3EE60(unint64_t *a1, void (*a2)(uint64_t))
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

void *initializeBufferWithCopyOfBuffer for SleepingSampleAnalysisHealthChecklistConfigurationProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_250E3EED8(uint64_t a1)
{
  uint64_t v2 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

id sub_250E3EF54(uint64_t a1)
{
  return *(id *)(v1 + *(int *)(a1 + 20));
}

uint64_t sub_250E3EF60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_250E79ED8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t HealthBalancePluginDelegate.init()()
{
  return v0;
}

uint64_t sub_250E3EFD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 80))();
  *a1 = result;
  return result;
}

void sub_250E3F008(uint64_t a1)
{
}

uint64_t destroy for SleepingSampleAnalysisHealthChecklistConfigurationProvider()
{
  return swift_bridgeObjectRelease();
}

void sub_250E3F034(uint64_t a1)
{
  uint64_t v114 = a1;
  uint64_t v110 = *v1;
  uint64_t v113 = sub_250E79ED8();
  uint64_t v109 = *(void *)(v113 - 8);
  MEMORY[0x270FA5388](v113);
  v108 = (char *)&v98 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = sub_250E79938();
  uint64_t v100 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  v105 = (char *)&v98 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_250E79B38();
  uint64_t v103 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v102 = (char *)&v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  MEMORY[0x270FA5388](v106);
  v107 = (char *)&v98 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E7A888();
  uint64_t v7 = *(void *)(v6 - 8);
  v115 = (void (*)(uint64_t *, uint64_t, uint64_t))v6;
  *(void *)&long long v116 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)&v98 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&v98 - v15;
  MEMORY[0x270FA5388](v14);
  char v18 = (char *)&v98 - v17;
  uint64_t v19 = sub_250E79968();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  id v22 = (char *)&v98 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_250E79988();
  uint64_t v111 = *(void *)(v23 - 8);
  uint64_t v112 = v23;
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v98 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v26 = objc_msgSend(self, sel_sharedBehavior);
  if (!v26)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(v26, sel_features);

  if (!v28)
  {
LABEL_19:
    __break(1u);
    return;
  }
  unsigned int v29 = objc_msgSend(v28, sel_harmonia);

  if (v29)
  {
    (*(void (**)(char *, void, uint64_t))(v20 + 104))(v22, *MEMORY[0x263F07740], v19);
    id v30 = v25;
    sub_250E79978();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    uint64_t v31 = (void *)sub_250E79EB8();
    id v32 = v31;
    uint64_t v33 = (void *)sub_250E79DD8();
    char v34 = sub_250E79DC8();

    if (v34)
    {

      sub_250E7A858();
      uint64_t v35 = sub_250E7A878();
      os_log_type_t v36 = sub_250E7AD38();
      if (os_log_type_enabled(v35, v36))
      {
        id v37 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        v117[0] = v38;
        *(_DWORD *)id v37 = 136446210;
        uint64_t v39 = sub_250E7B218();
        uint64_t v118 = sub_250E3FFA8(v39, v40, v117);
        sub_250E7AE88();
        id v30 = v25;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v35, v36, "[%{public}s] submitting primary pipelines", v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v38, -1, -1);
        MEMORY[0x25338C970](v37, -1, -1);
      }

      (*(void (**)(char *, void (*)(uint64_t *, uint64_t, uint64_t)))(v116 + 8))(v18, v115);
      uint64_t v41 = v108;
      uint64_t v42 = v104;
      uint64_t v43 = v103;
      uint64_t v44 = v102;
      uint64_t v45 = v101;
      uint64_t v46 = v100;
      v99 = v30;
      uint64_t v47 = v114;
      uint64_t v48 = (void *)sub_250E79EA8();
      *(void *)&long long v116 = sub_250E41F6C(v48);
      uint64_t v49 = sub_250E79EA8();
      v50 = v105;
      sub_250E79928();
      sub_250E79B18();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v50, v45);
      sub_250E79E98();
      LOBYTE(v50) = sub_250E79F38();
      uint64_t v51 = (uint64_t)v107;
      (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v107, v44, v42);
      uint64_t v52 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
      *(unsigned char *)(v51 + *(int *)(v52 + 20)) = (v50 & 1) == 0;
      uint64_t v53 = (void *)(v51 + *(int *)(v52 + 24));
      *uint64_t v53 = 0xD000000000000032;
      v53[1] = 0x8000000250E7EEE0;
      *(void *)(v51 + *(int *)(v106 + 20)) = v49;
      (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v42);
      sub_250E3FF0C(0, &qword_26B20C800, (void (*)(uint64_t))sub_250E55B5C);
      uint64_t v54 = swift_allocObject();
      *(_OWORD *)(v54 + 16) = xmmword_250E7C7A0;
      v55 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 16);
      uint64_t v56 = v113;
      v55(v41, v47, v113);
      uint64_t v57 = (void (*)(uint64_t *, uint64_t, uint64_t))v55;
      v115 = (void (*)(uint64_t *, uint64_t, uint64_t))v55;
      v58 = (void *)*MEMORY[0x263F097F0];
      v117[3] = (uint64_t)&type metadata for BalancePromotionFeedItemProvider;
      v117[4] = sub_250E42CE0();
      uint64_t v59 = sub_250E79F58();
      uint64_t v60 = MEMORY[0x263F459B0];
      *(void *)(v54 + 56) = v59;
      *(void *)(v54 + 64) = v60;
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v54 + 32));
      id v61 = v58;
      sub_250E79F48();
      sub_250E42B3C(v47, (uint64_t *)(v54 + 72));
      v62 = (int *)type metadata accessor for SleepingSampleChangesAlertGenerator(0);
      *(void *)(v54 + 136) = v62;
      *(void *)(v54 + 144) = sub_250E3FF60(&qword_26B20C148, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v54 + 112));
      v57(boxed_opaque_existential_1, v47, v56);
      sub_250E40A8C();
      uint64_t v64 = v116;
      swift_retain();
      v65 = (void *)sub_250E79EA8();
      uint64_t v66 = sub_250E7AD48();

      sub_250E79D08();
      uint64_t v67 = sub_250E79CF8();
      sub_250E3CE84(v51, (uint64_t)boxed_opaque_existential_1 + v62[8]);
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v62[5]) = v64;
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v62[6]) = v66;
      *(uint64_t *)((char *)boxed_opaque_existential_1 + v62[7]) = v67;
      uint64_t v68 = type metadata accessor for SleepingSampleHelpTileGenerator(0);
      *(void *)(v54 + 176) = v68;
      *(void *)(v54 + 184) = sub_250E3FF60(&qword_26B20BF68, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileGenerator);
      v69 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v54 + 152));
      v115(v69, v47, v113);
      uint64_t v70 = *(void *)(v64 + 16);
      sub_250E3CE84(v51, (uint64_t)v69 + *(int *)(v68 + 24));
      *(uint64_t *)((char *)v69 + *(int *)(v68 + 20)) = v70;
      swift_unknownObjectRetain();
      swift_release();
      sub_250E40AE0(v51);
      (*(void (**)(char *, uint64_t))(v111 + 8))(v99, v112);
    }
    else if (v31)
    {

      sub_250E7A858();
      v77 = sub_250E7A878();
      os_log_type_t v78 = sub_250E7AD38();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = (uint8_t *)swift_slowAlloc();
        uint64_t v80 = swift_slowAlloc();
        v117[0] = v80;
        *(_DWORD *)v79 = 136446210;
        uint64_t v81 = sub_250E7B218();
        uint64_t v118 = sub_250E3FFA8(v81, v82, v117);
        sub_250E7AE88();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v77, v78, "[%{public}s] submitting default pipelines", v79, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v80, -1, -1);
        MEMORY[0x25338C970](v79, -1, -1);
      }

      (*(void (**)(char *, void (*)(uint64_t *, uint64_t, uint64_t)))(v116 + 8))(v13, v115);
      (*(void (**)(char *, uint64_t))(v111 + 8))(v25, v112);
    }
    else
    {
      sub_250E7A858();
      v83 = sub_250E7A878();
      os_log_type_t v84 = sub_250E7AD38();
      if (os_log_type_enabled(v83, v84))
      {
        v85 = (uint8_t *)swift_slowAlloc();
        uint64_t v86 = swift_slowAlloc();
        v117[0] = v86;
        *(_DWORD *)v85 = 136446210;
        uint64_t v87 = sub_250E7B218();
        uint64_t v118 = sub_250E3FFA8(v87, v88, v117);
        sub_250E7AE88();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v83, v84, "[%{public}s] submitting agnostic pipelines", v85, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v86, -1, -1);
        MEMORY[0x25338C970](v85, -1, -1);
      }

      (*(void (**)(char *, void (*)(uint64_t *, uint64_t, uint64_t)))(v116 + 8))(v16, v115);
      uint64_t v90 = v111;
      uint64_t v89 = v112;
      uint64_t v91 = v113;
      uint64_t v92 = v109;
      sub_250E3FF0C(0, &qword_26B20C800, (void (*)(uint64_t))sub_250E55B5C);
      uint64_t v93 = swift_allocObject();
      long long v116 = xmmword_250E7BB70;
      *(_OWORD *)(v93 + 16) = xmmword_250E7BB70;
      sub_250E3FF0C(0, &qword_26B20C808, (void (*)(uint64_t))sub_250E55BB4);
      uint64_t v94 = swift_allocObject();
      *(_OWORD *)(v94 + 16) = v116;
      *(void *)(v94 + 56) = &type metadata for AboutBalanceArticleDataProvider;
      *(void *)(v94 + 64) = sub_250E42E44();
      *(void *)(v94 + 72) = sub_250E42DF0();
      (*(void (**)(char *, uint64_t, uint64_t))(v92 + 16))(v108, v114, v91);
      sub_250E41EEC();
      uint64_t v96 = v95;
      swift_allocObject();
      uint64_t v97 = sub_250E7A838();
      *(void *)(v93 + 56) = v96;
      *(void *)(v93 + 64) = sub_250E3FF60(&qword_26B20C418, (void (*)(uint64_t))sub_250E41EEC);
      *(void *)(v93 + 32) = v97;
      (*(void (**)(char *, uint64_t))(v90 + 8))(v30, v89);
    }
  }
  else
  {
    sub_250E7A858();
    v71 = sub_250E7A878();
    os_log_type_t v72 = sub_250E7AD38();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      uint64_t v74 = swift_slowAlloc();
      v117[0] = v74;
      *(_DWORD *)v73 = 136446210;
      uint64_t v75 = sub_250E7B218();
      uint64_t v118 = sub_250E3FFA8(v75, v76, v117);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250E38000, v71, v72, "[%{public}s] feature flag off, returning empty", v73, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v74, -1, -1);
      MEMORY[0x25338C970](v73, -1, -1);
    }

    (*(void (**)(char *, void (*)(uint64_t *, uint64_t, uint64_t)))(v116 + 8))(v10, v115);
  }
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

void sub_250E3FF0C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_250E7B138();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_250E3FF60(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E3FFA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_250E404B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_250E40458((uint64_t)v12, *a3);
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
      sub_250E40458((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_250E4007C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HKFeatureStatusPublisher.Inner();
  swift_unknownObjectRetain();
  id v5 = sub_250E40188(a1, a2);
  sub_250E7A5B8();
  v7[3] = v4;
  v7[4] = swift_getWitnessTable();
  v7[0] = v5;
  sub_250E7A968();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
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

id sub_250E40188(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for HKFeatureStatusPublisher.Inner());
  return sub_250E4021C(a1, a2);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t type metadata accessor for HKFeatureStatusPublisher.Inner()
{
  return __swift_instantiateGenericMetadata();
}

id sub_250E4021C(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *MEMORY[0x263F8EED0] & *v2;
  uint64_t v6 = sub_250E7A808();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = *(void *)(v5 + 96);
  sub_250E403F4();
  uint64_t v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = 0;
  *(void *)((char *)v2 + v10) = v11;
  uint64_t v12 = v2;
  sub_250E7A7F8();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v12[*(void *)((*v4 & *(void *)v12) + 0x68)], v9, v6);
  *(void *)&v12[*(void *)((*v4 & *(void *)v12) + 0x70)] = a2;
  swift_unknownObjectRetain();

  uint64_t v13 = (objc_class *)type metadata accessor for HKFeatureStatusPublisher.Inner();
  v15.receiver = v12;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, sel_init);
}

void sub_250E403F4()
{
  if (!qword_26B20C7E8)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_250E7AFE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C7E8);
    }
  }
}

uint64_t sub_250E40458(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_250E404B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_250E7AE98();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_250E478FC(a5, a6);
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
  uint64_t v8 = sub_250E7AFF8();
  if (!v8)
  {
    sub_250E7B048();
    __break(1u);
LABEL_17:
    uint64_t result = sub_250E7B098();
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

void sub_250E40670(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_250E7B138();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

void sub_250E406B8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_250E40704()
{
  if (!qword_26B20C818)
  {
    unint64_t v0 = sub_250E7B138();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C818);
    }
  }
}

void sub_250E40760()
{
  if (!qword_26B20C810)
  {
    sub_250E68898();
    unint64_t v0 = sub_250E7B138();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C810);
    }
  }
}

void sub_250E407B8()
{
  if (!qword_26B20C7F0)
  {
    type metadata accessor for HKFeatureIdentifier(255);
    sub_250E687F0();
    sub_250E3D550(&qword_26B20C7B8, type metadata accessor for HKFeatureIdentifier);
    unint64_t v0 = sub_250E7B088();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C7F0);
    }
  }
}

void sub_250E40864()
{
  if (!qword_26B20C7D8)
  {
    sub_250E40A50(255, (unint64_t *)&qword_26B20C640);
    sub_250E40B3C();
    unint64_t v0 = sub_250E7AF78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C7D8);
    }
  }
}

void sub_250E408D8(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_250E53A0C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_250E541A4();
      goto LABEL_14;
    }
    sub_250E544FC();
  }
  uint64_t v8 = *v3;
  uint64_t v9 = sub_250E7AE48();
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_250E40BA4();
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_250E7AE58();

    if (v12)
    {
LABEL_13:
      sub_250E7B158();
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
        char v15 = sub_250E7AE58();

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

uint64_t sub_250E40A50(uint64_t a1, unint64_t *a2)
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

unint64_t sub_250E40A8C()
{
  unint64_t result = qword_26B20C7A8;
  if (!qword_26B20C7A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20C7A8);
  }
  return result;
}

uint64_t sub_250E40ACC(void **a1)
{
  return sub_250E420A8(*a1, a1[1], a1[2], a1[3], a1[4]);
}

uint64_t sub_250E40AE0(uint64_t a1)
{
  uint64_t v2 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_250E40B3C()
{
  unint64_t result = qword_26B20C648;
  if (!qword_26B20C648)
  {
    sub_250E40A50(255, (unint64_t *)&qword_26B20C640);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20C648);
  }
  return result;
}

unint64_t sub_250E40BA4()
{
  unint64_t result = qword_26B20C640;
  if (!qword_26B20C640)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20C640);
  }
  return result;
}

uint64_t sub_250E40BE4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_250E7B068();
    swift_bridgeObjectRelease();
  }
  sub_250E40BA4();
  sub_250E40B3C();
  uint64_t result = sub_250E7AD08();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_250E7B068();
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
        unint64_t v6 = (void *)MEMORY[0x25338C100](i, a1);
        sub_250E40D28(&v9, v6);
      }
    }
    else
    {
      unint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_250E40D28(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_250E40D28(void *a1, void *a2)
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
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_250E7AF18();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_250E40BA4();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      sub_250E7A5B8();
      return 0;
    }
    uint64_t result = sub_250E7AF08();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v21 = sub_250E53828(v7, result + 1);
    uint64_t v27 = v21;
    if (*(void *)(v21 + 24) <= *(void *)(v21 + 16))
    {
      id v25 = v8;
      sub_250E53A0C();
      uint64_t v22 = v27;
    }
    else
    {
      uint64_t v22 = v21;
      id v23 = v8;
    }
    sub_250E53F84((uint64_t)v8, v22);
    *unint64_t v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_250E7AE48();
    uint64_t v12 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
    {
      sub_250E40BA4();
      id v14 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
      char v15 = sub_250E7AE58();

      if (v15)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v19 = *(void **)(*(void *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        id v20 = v19;
        return 0;
      }
      uint64_t v16 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v6 + 48) + 8 * v13);
        char v18 = sub_250E7AE58();

        if (v18) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v2;
    *unint64_t v2 = 0x8000000000000000;
    id v8 = a2;
    sub_250E408D8((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *unint64_t v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

void sub_250E40FA8(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_250E7B068();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_250E40864();
      uint64_t v3 = sub_250E7AF68();
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_250E7B068();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = MEMORY[0x263F8EE88];
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = v3 + 56;
  uint64_t v43 = v5;
  if ((v1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    unint64_t v41 = v1;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = MEMORY[0x25338C100](v8, v1);
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        uint64_t v12 = sub_250E7AE48();
        uint64_t v13 = -1 << *(unsigned char *)(v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)(v7 + 8 * v15) = v17 | v16;
        *(void *)(*(void *)(v3 + 48) + 8 * v14) = v11;
        uint64_t v23 = *(void *)(v3 + 16);
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        *(void *)(v3 + 16) = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_250E40A50(0, (unint64_t *)&qword_26B20C640);
      id v18 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
      char v19 = sub_250E7AE58();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v7 + 8 * (v14 >> 6));
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(*(void *)(v3 + 48) + 8 * v14);
          char v22 = sub_250E7AE58();

          if (v22) {
            goto LABEL_11;
          }
        }
        unint64_t v1 = v41;
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      sub_250E7A5B8();
      unint64_t v1 = v41;
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v40 = v1 + 32;
  uint64_t v42 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    id v26 = *(id *)(v40 + 8 * v25);
    uint64_t v27 = sub_250E7AE48();
    uint64_t v28 = -1 << *(unsigned char *)(v3 + 32);
    unint64_t v29 = v27 & ~v28;
    unint64_t v30 = v29 >> 6;
    uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
    uint64_t v32 = 1 << v29;
    if (((1 << v29) & v31) != 0)
    {
      sub_250E40A50(0, (unint64_t *)&qword_26B20C640);
      id v33 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
      char v34 = sub_250E7AE58();

      if (v34)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v35 = ~v28;
      while (1)
      {
        unint64_t v29 = (v29 + 1) & v35;
        unint64_t v30 = v29 >> 6;
        uint64_t v31 = *(void *)(v7 + 8 * (v29 >> 6));
        uint64_t v32 = 1 << v29;
        if ((v31 & (1 << v29)) == 0) {
          break;
        }
        id v36 = *(id *)(*(void *)(v3 + 48) + 8 * v29);
        char v37 = sub_250E7AE58();

        if (v37) {
          goto LABEL_24;
        }
      }
    }
    *(void *)(v7 + 8 * v30) = v32 | v31;
    *(void *)(*(void *)(v3 + 48) + 8 * v29) = v26;
    uint64_t v38 = *(void *)(v3 + 16);
    BOOL v10 = __OFADD__(v38, 1);
    uint64_t v39 = v38 + 1;
    if (v10) {
      goto LABEL_38;
    }
    *(void *)(v3 + 16) = v39;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

void sub_250E41300()
{
  if (!qword_26B20C608)
  {
    _s43SleepingSampleDaySummaryCollectionPublisherVMa(255);
    sub_250E3B9C0(&qword_26B20C6F8, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B20C608);
    }
  }
}

void sub_250E413B4()
{
  if (!qword_26B20C600)
  {
    sub_250E41660();
    sub_250E3B9C0(&qword_26B20C530, (void (*)(uint64_t))sub_250E41660);
    OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
    if (!v1) {
      atomic_store(OpaqueTypeMetadata2, (unint64_t *)&qword_26B20C600);
    }
  }
}

unint64_t sub_250E41468()
{
  unint64_t result = qword_26B20C5A8;
  if (!qword_26B20C5A8)
  {
    sub_250E406B8(255, (unint64_t *)&unk_26B20C5B0, MEMORY[0x263F8D6C8], MEMORY[0x263EFDDF8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20C5A8);
  }
  return result;
}

void sub_250E414E4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_250E41548(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_250E415AC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_250E7A988();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_250E41610(unint64_t *a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_250E415AC(255, a2, a3);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_250E41660()
{
  if (!qword_26B20C538)
  {
    sub_250E5EE50(255);
    sub_250E5F04C();
    unint64_t v0 = sub_250E7A988();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C538);
    }
  }
}

void sub_250E416D0()
{
  if (!qword_26B20C4F0)
  {
    sub_250E41B48();
    sub_250E3B9C0(&qword_26B20C458, (void (*)(uint64_t))sub_250E41B48);
    unint64_t v0 = sub_250E7A938();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C4F0);
    }
  }
}

void sub_250E41764()
{
  if (!qword_26B20C4D0)
  {
    sub_250E41DC8();
    sub_250E3BE60(&qword_26B20C438, (void (*)(uint64_t))sub_250E41DC8);
    unint64_t v0 = sub_250E7A938();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C4D0);
    }
  }
}

void sub_250E417F8()
{
  if (!qword_26B20C4C0)
  {
    sub_250E3D5E8(255, &qword_26B20C500, (void (*)(uint64_t))sub_250E41A24, (void (*)(void))sub_250E68864);
    sub_250E79C48();
    sub_250E3D598(&qword_26B20C4F8, &qword_26B20C500, (void (*)(uint64_t))sub_250E41A24, (void (*)(void))sub_250E68864);
    unint64_t v0 = sub_250E7A928();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C4C0);
    }
  }
}

void sub_250E418CC()
{
  if (!qword_26B20C4B0)
  {
    sub_250E416D0();
    type metadata accessor for SleepingSampleChangesAlertGenerator.Change(255);
    sub_250E3B9C0(&qword_26B20C4E8, (void (*)(uint64_t))sub_250E416D0);
    unint64_t v0 = sub_250E7A928();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C4B0);
    }
  }
}

void sub_250E41978()
{
  if (!qword_26B20C4A0)
  {
    sub_250E41764();
    type metadata accessor for SleepingSampleHelpTileGenerator.Change(255);
    sub_250E3BE60(&qword_26B20C4C8, (void (*)(uint64_t))sub_250E41764);
    unint64_t v0 = sub_250E7A928();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C4A0);
    }
  }
}

void sub_250E41A24()
{
  if (!qword_26B20C470)
  {
    sub_250E3DEC8();
    sub_250E3D5E8(255, &qword_26B20C4E0, (void (*)(uint64_t))sub_250E41D28, (void (*)(void))sub_250E68830);
    sub_250E3D550(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
    sub_250E3D598(&qword_26B20C4D8, &qword_26B20C4E0, (void (*)(uint64_t))sub_250E41D28, (void (*)(void))sub_250E68830);
    unint64_t v0 = sub_250E7A8F8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C470);
    }
  }
}

void sub_250E41B48()
{
  if (!qword_26B20C460)
  {
    unint64_t v0 = (void (*)(uint64_t))MEMORY[0x263F42EF8];
    sub_250E415AC(255, &qword_26B20C548, MEMORY[0x263F42EF8]);
    sub_250E413B4();
    sub_250E41300();
    sub_250E406B8(255, (unint64_t *)&unk_26B20C5B0, MEMORY[0x263F8D6C8], MEMORY[0x263EFDDF8]);
    sub_250E41610(&qword_26B20C540, &qword_26B20C548, v0);
    sub_250E41660();
    sub_250E3B9C0(&qword_26B20C530, (void (*)(uint64_t))sub_250E41660);
    swift_getOpaqueTypeConformance2();
    _s43SleepingSampleDaySummaryCollectionPublisherVMa(255);
    sub_250E3B9C0(&qword_26B20C6F8, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
    swift_getOpaqueTypeConformance2();
    sub_250E41468();
    unint64_t v1 = sub_250E7A8F8();
    if (!v2) {
      atomic_store(v1, (unint64_t *)&qword_26B20C460);
    }
  }
}

void sub_250E41D28()
{
  if (!qword_26B20C450)
  {
    sub_250E3DEC8();
    sub_250E3D550(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
    unint64_t v0 = sub_250E7A8C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C450);
    }
  }
}

void sub_250E41DC8()
{
  if (!qword_26B20C440)
  {
    sub_250E3DEC8();
    sub_250E41300();
    sub_250E3BE60(&qword_26B20C588, (void (*)(uint64_t))sub_250E3DEC8);
    _s43SleepingSampleDaySummaryCollectionPublisherVMa(255);
    sub_250E3BE60(&qword_26B20C6F8, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
    swift_getOpaqueTypeConformance2();
    unint64_t v0 = sub_250E7A8C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C440);
    }
  }
}

void sub_250E41EEC()
{
  if (!qword_26B20C420)
  {
    sub_250E55C14();
    unint64_t v0 = sub_250E7A848();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C420);
    }
  }
}

uint64_t type metadata accessor for SleepingSampleAnalysisFeatureStatusPublisherManager()
{
  return self;
}

void *sub_250E41F6C(void *a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F097F0], a1);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F097E8], a1);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F097C8], a1);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F0A3D0]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x263F097F8], a1);
  uint64_t v6 = (void *)*MEMORY[0x263F097B8];
  id v7 = objc_allocWithZone(MEMORY[0x263F0A3D0]);
  id v8 = v6;
  id v9 = objc_msgSend(v7, sel_initWithFeatureIdentifier_healthStore_, v8, a1);

  type metadata accessor for SleepingSampleAnalysisFeatureStatusPublisherManager();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v2;
  result[3] = v3;
  result[4] = v4;
  result[5] = v5;
  result[6] = v9;
  return result;
}

uint64_t sub_250E420A8(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  sub_250E40760();
  uint64_t inited = swift_initStackObject();
  uint64_t v11 = (void **)MEMORY[0x263F097F0];
  *(_OWORD *)(inited + 16) = xmmword_250E7D4B0;
  uint64_t v12 = *v11;
  *(void *)(inited + 32) = v12;
  *(void *)(inited + 40) = a1;
  uint64_t v13 = (void *)*MEMORY[0x263F097E8];
  *(void *)(inited + 48) = *MEMORY[0x263F097E8];
  *(void *)(inited + 56) = a2;
  unint64_t v14 = (void *)*MEMORY[0x263F097C8];
  *(void *)(inited + 64) = *MEMORY[0x263F097C8];
  *(void *)(inited + 72) = a3;
  unint64_t v15 = (void *)*MEMORY[0x263F097F8];
  *(void *)(inited + 80) = *MEMORY[0x263F097F8];
  *(void *)(inited + 88) = a4;
  uint64_t v16 = (void *)*MEMORY[0x263F097B8];
  *(void *)(inited + 96) = *MEMORY[0x263F097B8];
  *(void *)(inited + 104) = a5;
  id v17 = v12;
  id v18 = a1;
  id v19 = v13;
  id v20 = a2;
  id v21 = v14;
  id v22 = a3;
  id v23 = v15;
  id v24 = a4;
  id v25 = v16;
  id v26 = a5;
  sub_250E3E83C(inited);
  return sub_250E79C28();
}

uint64_t *sub_250E421AC(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = sub_250E79ED8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    id v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    uint64_t v10 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    uint64_t v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    uint64_t v13 = sub_250E79B38();
    unint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16);
    swift_retain();
    id v15 = v9;
    swift_retain();
    v14(v11, v12, v13);
    uint64_t v16 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
    v11[*(int *)(v16 + 20)] = v12[*(int *)(v16 + 20)];
    uint64_t v17 = *(int *)(v16 + 24);
    id v18 = &v11[v17];
    id v19 = &v12[v17];
    uint64_t v20 = *((void *)v19 + 1);
    *(void *)id v18 = *(void *)v19;
    *((void *)v18 + 1) = v20;
    uint64_t v21 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
    id v22 = *(void **)&v12[v21];
    *(void *)&v11[v21] = v22;
    swift_bridgeObjectRetain();
    id v23 = v22;
  }
  return a1;
}

uint64_t type metadata accessor for SleepingSampleChangesAlertGenerator(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20C150);
}

id sub_250E42368()
{
  uint64_t v0 = sub_250E79E58();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E79EB8();
  sub_250E414E4(0, &qword_26B20C7F8, MEMORY[0x263F45588], MEMORY[0x263F8E0F8]);
  uint64_t v4 = sub_250E79DA8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_250E7BB70;
  (*(void (**)(unint64_t, void, uint64_t))(v5 + 104))(v7 + v6, *MEMORY[0x263F45528], v4);
  sub_250E406B8(0, (unint64_t *)&qword_26B20C818, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_250E7C4F0;
  id result = objc_msgSend(self, sel_appleBalanceMetricsType);
  if (result)
  {
    *(void *)(v8 + 32) = result;
    v10[1] = v8;
    sub_250E7AC68();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F45688], v0);
    return (id)sub_250E79E68();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SleepingSampleChangesAlertGenerator.Change(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20C0A0);
}

uint64_t sub_250E425F0(uint64_t a1)
{
  uint64_t v2 = sub_250E3B9C0(&qword_26B20C138, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator);
  return MEMORY[0x270F36D78](a1, v2);
}

uint64_t sub_250E42660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_250E3B270();
  *a1 = result;
  return result;
}

uint64_t *sub_250E42688(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_250E79ED8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    id v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_250E79B38();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_unknownObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
    v9[*(int *)(v13 + 20)] = v10[*(int *)(v13 + 20)];
    uint64_t v14 = *(int *)(v13 + 24);
    id v15 = &v9[v14];
    uint64_t v16 = &v10[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)id v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
    id v19 = *(void **)&v10[v18];
    *(void *)&v9[v18] = v19;
    swift_bridgeObjectRetain();
    id v20 = v19;
  }
  return a1;
}

uint64_t type metadata accessor for SleepingSampleHelpTileGenerator(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20BF70);
}

id sub_250E4281C()
{
  uint64_t v0 = sub_250E79E58();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  id v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E79EB8();
  sub_250E41548(0, &qword_26B20C7F8, MEMORY[0x263F45588], MEMORY[0x263F8E0F8]);
  uint64_t v4 = sub_250E79DA8();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_250E7BB70;
  (*(void (**)(unint64_t, void, uint64_t))(v5 + 104))(v7 + v6, *MEMORY[0x263F45540], v4);
  sub_250E40704();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_250E7C4F0;
  id result = objc_msgSend(self, sel_appleBalanceMetricsType);
  if (result)
  {
    *(void *)(v8 + 32) = result;
    v10[1] = v8;
    sub_250E7AC68();
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F45688], v0);
    return (id)sub_250E79E68();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for SleepingSampleHelpTileGenerator.Change(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20BEC8);
}

uint64_t sub_250E42A7C(uint64_t a1)
{
  uint64_t v2 = sub_250E3BE60(&qword_26B20BF58, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileGenerator);
  return MEMORY[0x270F36D78](a1, v2);
}

uint64_t sub_250E42AEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_250E3BA08();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for HealthBalancePluginDelegate()
{
  return self;
}

uint64_t sub_250E42B3C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_250E79ED8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v17 = 0;
  unint64_t v18 = 0xE000000000000000;
  sub_250E7AF88();
  swift_bridgeObjectRelease();
  unint64_t v17 = 0xD000000000000025;
  unint64_t v18 = 0x8000000250E7EF60;
  uint64_t v8 = (void *)sub_250E79EB8();
  sub_250E79DB8();

  sub_250E7AC18();
  swift_bridgeObjectRelease();
  unint64_t v9 = v17;
  unint64_t v10 = v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v11 = (void *)*MEMORY[0x263F097F0];
  id v19 = &type metadata for SleepingSampleAnalysisHealthChecklistConfigurationProvider;
  unint64_t v20 = sub_250E42F30();
  unint64_t v17 = v9;
  unint64_t v18 = v10;
  uint64_t v12 = sub_250E79F58();
  uint64_t v13 = MEMORY[0x263F459B0];
  a2[3] = v12;
  a2[4] = v13;
  __swift_allocate_boxed_opaque_existential_1(a2);
  id v14 = v11;
  return sub_250E79F48();
}

unint64_t sub_250E42CE0()
{
  unint64_t result = qword_26B20BDB0;
  if (!qword_26B20BDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BDB0);
  }
  return result;
}

unint64_t sub_250E42D34()
{
  unint64_t result = qword_26B20BDA8;
  if (!qword_26B20BDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BDA8);
  }
  return result;
}

uint64_t sub_250E42D88(uint64_t a1)
{
  unint64_t v2 = sub_250E42D34();
  return MEMORY[0x270F34878](a1, v2);
}

unint64_t sub_250E42DD4()
{
  return 0xD000000000000018;
}

unint64_t sub_250E42DF0()
{
  unint64_t result = qword_26B20BD90;
  if (!qword_26B20BD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BD90);
  }
  return result;
}

unint64_t sub_250E42E44()
{
  unint64_t result = qword_26B20BD88;
  if (!qword_26B20BD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BD88);
  }
  return result;
}

id sub_250E42E98()
{
  sub_250E40704();
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_250E7C4F0;
  id result = objc_msgSend(self, sel_appleBalanceMetricsType);
  if (result)
  {
    *(void *)(inited + 32) = result;
    sub_250E7AC68();
    uint64_t v2 = sub_250E40BE4(inited);
    swift_bridgeObjectRelease();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_250E42F30()
{
  unint64_t result = qword_26B20BD80;
  if (!qword_26B20BD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BD80);
  }
  return result;
}

unint64_t sub_250E42F84()
{
  unint64_t result = qword_26B20BD78;
  if (!qword_26B20BD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BD78);
  }
  return result;
}

id sub_250E42FD8()
{
  sub_250E40670(0, (unint64_t *)&qword_26B20C818);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_250E7C4F0;
  sub_250E40A50(0, &qword_26B20C650);
  id result = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_appleBalanceMetricsType);
  if (result)
  {
    *(void *)(inited + 32) = result;
    sub_250E7AC68();
    if (inited >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_250E7B068();
      swift_bridgeObjectRelease();
      if (v4) {
        goto LABEL_4;
      }
    }
    else if (*(void *)((inited & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      sub_250E40FA8(inited);
      uint64_t v3 = v2;
LABEL_7:
      swift_bridgeObjectRelease();
      return (id)v3;
    }
    uint64_t v3 = MEMORY[0x263F8EE88];
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_250E430E4(uint64_t a1)
{
  unint64_t v2 = sub_250E42F84();
  return MEMORY[0x270F32880](a1, v2);
}

uint64_t sub_250E43130()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_250E43160()
{
  return 1;
}

uint64_t sub_250E43168()
{
  return sub_250E7B1A8();
}

uint64_t sub_250E431AC()
{
  return sub_250E7B198();
}

uint64_t sub_250E431D4()
{
  return sub_250E7B1A8();
}

unint64_t sub_250E43214()
{
  return 0xD000000000000010;
}

uint64_t sub_250E43230@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250E47FE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_250E4325C()
{
  return 0;
}

void sub_250E43268(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_250E43274(uint64_t a1)
{
  unint64_t v2 = sub_250E48C40();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E432B0(uint64_t a1)
{
  unint64_t v2 = sub_250E48C40();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E432EC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_250E7A018();
  uint64_t v19 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v20 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E48CF8(0, &qword_269B0C868, MEMORY[0x263F8E040]);
  uint64_t v7 = v6;
  uint64_t v18 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)&v16 - v8;
  uint64_t v10 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E48C40();
  sub_250E7B1C8();
  if (!v2)
  {
    uint64_t v13 = v18;
    uint64_t v14 = v19;
    sub_250E48504(&qword_269B0C878, MEMORY[0x263F42FB0]);
    sub_250E7B0E8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v7);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v12, v20, v4);
    sub_250E48C94((uint64_t)v12, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_250E4359C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_250E432EC(a1, a2);
}

uint64_t sub_250E435B4(void *a1)
{
  sub_250E48CF8(0, &qword_269B0C880, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E48C40();
  sub_250E7B1D8();
  sub_250E7A018();
  sub_250E48504(&qword_269B0C888, MEMORY[0x263F42FB0]);
  sub_250E7B118();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t static SleepingSampleChangesAlertTileViewController.bundleClassName.getter()
{
  uint64_t v1 = sub_250E79A88();
  sub_250E7AC18();
  sub_250E7B218();
  sub_250E7AC18();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_250E437A0()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_250E7A888();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v7 = sub_250E7A878();
  os_log_type_t v8 = sub_250E7AD38();
  if (os_log_type_enabled(v7, v8))
  {
    v21[0] = v3;
    uint64_t v9 = swift_slowAlloc();
    v21[1] = ObjectType;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v22 = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    uint64_t v12 = sub_250E7B218();
    v21[2] = sub_250E3FFA8(v12, v13, &v22);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v7, v8, "%{public}s loaded", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v11, -1, -1);
    MEMORY[0x25338C970](v10, -1, -1);

    (*(void (**)(char *, void))(v4 + 8))(v6, v21[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  uint64_t v14 = (objc_class *)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  v23.receiver = v1;
  v23.super_class = v14;
  objc_msgSendSuper2(&v23, sel_viewDidLoad);
  sub_250E441DC();
  id v15 = sub_250E45A54();
  uint64_t v16 = (void *)sub_250E7A1E8();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_250E7A3E8();

  swift_release();
  sub_250E47F5C(0, &qword_269B0C760, (uint64_t (*)(uint64_t))sub_250E45B20, MEMORY[0x263F8E0F8]);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_250E7BB70;
  uint64_t v18 = sub_250E7A898();
  uint64_t v19 = MEMORY[0x263F82018];
  *(void *)(v17 + 32) = v18;
  *(void *)(v17 + 40) = v19;
  sub_250E7ADB8();
  sub_250E7A5B8();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SleepingSampleChangesAlertTileViewController(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_269B0C7F8);
}

void sub_250E43AF0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25338CA60](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    sub_250E43B44();
  }
}

uint64_t sub_250E43B44()
{
  uint64_t v1 = v0;
  sub_250E47F5C(0, (unint64_t *)&qword_269B0C8A0, MEMORY[0x263F43C08], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v35 - v3;
  uint64_t v5 = sub_250E7A438();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7AD98();
  uint64_t v8 = v0 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  uint64_t result = sub_250E47D08(v8, (uint64_t)v40);
  uint64_t v10 = v41;
  if (!v41)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v11 = __swift_project_boxed_opaque_existential_1(v40, v41);
  v35[3] = v35;
  uint64_t v12 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v14);
  v35[2] = sub_250E7A488();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  uint64_t result = sub_250E47D08(v8, (uint64_t)v38);
  uint64_t v15 = v39;
  if (!v39)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v35[1] = v1;
  uint64_t v16 = __swift_project_boxed_opaque_existential_1(v38, v39);
  uint64_t v17 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v19);
  unint64_t v20 = (void *)sub_250E7A488();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v15);
  id v21 = objc_msgSend(v20, sel_profileIdentifier);

  uint64_t result = sub_250E47D08(v8, (uint64_t)v36);
  uint64_t v22 = v37;
  if (!v37)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_super v23 = __swift_project_boxed_opaque_existential_1(v36, v37);
  uint64_t v24 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v23);
  id v26 = (char *)v35 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v26);
  sub_250E7A498();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v22);
  uint64_t v27 = sub_250E7A2C8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v4, 0, 1, v27);
  sub_250E7A2E8();

  sub_250E48DF0((uint64_t)v4, (uint64_t)&qword_269B0C8A0, MEMORY[0x263F43C08], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  uint64_t result = sub_250E47D08(v8, (uint64_t)v36);
  uint64_t v28 = v37;
  if (v37)
  {
    unint64_t v29 = __swift_project_boxed_opaque_existential_1(v36, v37);
    uint64_t v30 = *(void *)(v28 - 8);
    MEMORY[0x270FA5388](v29);
    uint64_t v32 = (char *)v35 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v30 + 16))(v32);
    sub_250E7A4A8();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v28);
    sub_250E7A428();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
    id v33 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    id v34 = BalanceRoomViewController.init(context:)((uint64_t)v7);
    memset(v42, 0, 32);
    sub_250E7ADC8();

    return sub_250E48DF0((uint64_t)v42, (uint64_t)&unk_269B0C8A8, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E49338);
  }
LABEL_9:
  __break(1u);
  return result;
}

void sub_250E441DC()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v2;
  objc_msgSend(v2, sel_directionalLayoutMargins);
  objc_msgSend(v3, sel_setDirectionalLayoutMargins_);

  id v4 = objc_msgSend(v1, sel_view);
  if (!v4)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  id v6 = sub_250E45A54();
  objc_msgSend(v5, sel_addSubview_, v6);

  id v7 = objc_msgSend(v1, sel_view);
  if (!v7)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  id v9 = sub_250E44E20();
  objc_msgSend(v8, sel_addSubview_, v9);

  id v10 = objc_msgSend(v1, sel_view);
  if (!v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  id v12 = objc_msgSend(v10, sel_layoutMarginsGuide);

  id v13 = objc_msgSend(v12, sel_bottomAnchor);
  id v14 = sub_250E44E20();
  id v15 = objc_msgSend(v14, sel_bottomAnchor);

  id v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  LODWORD(v17) = 1144750080;
  objc_msgSend(v16, sel_setPriority_, v17);
  id v18 = sub_250E44E20();
  id v19 = objc_msgSend(v18, sel_heightAnchor);

  id v20 = objc_msgSend(v19, sel_constraintEqualToConstant_, 106.0);
  uint64_t v21 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint;
  uint64_t v22 = *(void **)&v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint] = v20;
  id v72 = v20;

  sub_250E49338(0, (unint64_t *)&qword_26B20C818, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_250E7BB80;
  id v24 = sub_250E45A54();
  id v25 = objc_msgSend(v24, sel_topAnchor);

  id v26 = objc_msgSend(v1, sel_view);
  if (!v26)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v27 = v26;
  id v28 = objc_msgSend(v26, sel_topAnchor);

  id v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v28);
  *(void *)(v23 + 32) = v29;
  id v30 = sub_250E45A54();
  id v31 = objc_msgSend(v30, sel_leadingAnchor);

  id v32 = objc_msgSend(v1, sel_view);
  if (!v32)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v33 = v32;
  v71 = v16;
  id v34 = objc_msgSend(v32, sel_leadingAnchor);

  id v35 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v34);
  *(void *)(v23 + 40) = v35;
  id v36 = objc_msgSend(v1, sel_view);
  if (!v36)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v37 = v36;
  id v70 = self;
  id v38 = objc_msgSend(v37, sel_trailingAnchor);

  id v39 = sub_250E45A54();
  id v40 = objc_msgSend(v39, sel_trailingAnchor);

  id v41 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v40);
  *(void *)(v23 + 48) = v41;
  id v42 = sub_250E44E20();
  id v43 = objc_msgSend(v42, sel_topAnchor);

  id v44 = sub_250E45A54();
  id v45 = objc_msgSend(v44, sel_bottomAnchor);

  id v46 = objc_msgSend(v43, sel_constraintEqualToAnchor_constant_, v45, 4.0);
  *(void *)(v23 + 56) = v46;
  id v47 = sub_250E44E20();
  id v48 = objc_msgSend(v47, sel_leadingAnchor);

  id v49 = sub_250E45A54();
  v50 = (void *)sub_250E7A1E8();

  id v51 = objc_msgSend(v50, sel_layoutMarginsGuide);
  id v52 = objc_msgSend(v51, sel_leadingAnchor);

  id v53 = objc_msgSend(v48, sel_constraintEqualToAnchor_, v52);
  *(void *)(v23 + 64) = v53;
  id v54 = sub_250E45A54();
  v55 = (void *)sub_250E7A1E8();

  id v56 = objc_msgSend(v55, sel_layoutMarginsGuide);
  id v57 = objc_msgSend(v56, sel_trailingAnchor);

  id v58 = sub_250E44E20();
  id v59 = objc_msgSend(v58, sel_trailingAnchor);

  id v60 = objc_msgSend(v57, sel_constraintEqualToAnchor_, v59);
  *(void *)(v23 + 72) = v60;
  *(void *)(v23 + 80) = v72;
  *(void *)(v23 + 88) = v71;
  sub_250E7AC68();
  sub_250E40A50(0, (unint64_t *)&qword_269B0C8C0);
  id v61 = v72;
  id v62 = v71;
  v63 = (void *)sub_250E7AC48();
  swift_bridgeObjectRelease();
  objc_msgSend(v70, sel_activateConstraints_, v63);

  uint64_t v64 = *(void **)&v1[v21];
  if (!v64)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v65 = *MEMORY[0x263F83570];
  id v66 = objc_allocWithZone(MEMORY[0x263F82770]);
  id v73 = v64;
  id v67 = objc_msgSend(v66, sel_initForTextStyle_, v65);
  objc_msgSend(v67, sel_scaledValueForValue_, 106.0);
  double v69 = v68;

  objc_msgSend(v73, sel_setConstant_, v69);
}

uint64_t sub_250E44904()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250E79958();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_250E7AB68();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_250E7A208();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  MEMORY[0x270FA5388](v4);
  id v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_250E47F5C(0, &qword_269B0C790, MEMORY[0x263F42FB0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v25 - v9;
  sub_250E47F5C(0, &qword_269B0C7C8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, v7);
  MEMORY[0x270FA5388](v11 - 8);
  id v13 = (char *)&v25 - v12;
  uint64_t v14 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  double v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel;
  swift_beginAccess();
  sub_250E48328(v18, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    return sub_250E48DF0((uint64_t)v13, (uint64_t)&qword_269B0C7C8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
  }
  sub_250E48C94((uint64_t)v13, (uint64_t)v17);
  uint64_t v20 = sub_250E7A018();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v10, v17, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v10, 0, 1, v20);
  sub_250E79FA8();
  id v22 = sub_250E45A54();
  sub_250E44F14();
  sub_250E79FE8();
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v24 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  objc_msgSend(self, sel_clearColor);
  sub_250E7A1F8();
  sub_250E7A218();

  (*(void (**)(char *, uint64_t))(v25 + 8))(v6, v26);
  return sub_250E48F50((uint64_t)v17);
}

id sub_250E44E20()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250E79F98();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView;
  uint64_t v4 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView);
  if (v4)
  {
    id v5 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView);
  }
  else
  {
    swift_retain();
    sub_250E79F88();
    sub_250E48D5C();
    id v7 = objc_allocWithZone(v6);
    uint64_t v8 = (void *)sub_250E7AA28();
    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    uint64_t v9 = *(void **)(v1 + v3);
    *(void *)(v1 + v3) = v8;
    id v5 = v8;

    uint64_t v4 = 0;
  }
  id v10 = v4;
  return v5;
}

id sub_250E44F14()
{
  uint64_t v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph);
  }
  else
  {
    id v4 = sub_250E44F74();
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_250E44F74()
{
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_configurationWithPointSize_, 28.0);
  id v2 = objc_msgSend(self, sel_hk_vitalsKeyColor);
  id v3 = objc_msgSend(v0, sel_configurationWithHierarchicalColor_, v2);

  id v4 = objc_msgSend(v1, sel_configurationByApplyingConfiguration_, v3);
  id v5 = (void *)sub_250E7AB78();
  id v6 = objc_msgSend(self, sel__systemImageNamed_withConfiguration_, v5, v4);

  if (!v6) {
    id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }

  return v6;
}

uint64_t sub_250E450BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  return sub_250E47D08(v3, a2);
}

uint64_t sub_250E45114(uint64_t a1, void *a2)
{
  sub_250E47D08(a1, (uint64_t)v5);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  sub_250E47E44((uint64_t)v5, v3);
  swift_endAccess();
  sub_250E45188();
  return sub_250E47ED4((uint64_t)v5);
}

uint64_t sub_250E45188()
{
  uint64_t v1 = v0;
  v27[3] = swift_getObjectType();
  uint64_t v2 = sub_250E7A888();
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)v27 - v4;
  sub_250E47F5C(0, &qword_269B0C7C8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v27 - v7;
  uint64_t v9 = (void *)(v0 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context);
  uint64_t result = swift_beginAccess();
  uint64_t v11 = v9[3];
  if (v11)
  {
    uint64_t v12 = __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    uint64_t v13 = *(void *)(v11 - 8);
    MEMORY[0x270FA5388](v12);
    uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_250E7A4B8();
    unint64_t v18 = v17;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    if (v18 >> 60 == 15)
    {
      sub_250E7A858();
      id v19 = sub_250E7A878();
      os_log_type_t v20 = sub_250E7AD18();
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v22 = swift_slowAlloc();
        v30[0] = v22;
        *(_DWORD *)uint64_t v21 = 136446210;
        uint64_t v23 = sub_250E7B218();
        v30[4] = sub_250E3FFA8(v23, v24, v30);
        sub_250E7AE88();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v19, v20, "[%{public}s] Could not find userData", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v22, -1, -1);
        MEMORY[0x25338C970](v21, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v5, v29);
    }
    else
    {
      sub_250E79868();
      swift_allocObject();
      sub_250E79858();
      uint64_t v25 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
      sub_250E48504(&qword_269B0C8B0, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertTileViewModel);
      sub_250E79848();
      swift_release();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v8, 0, 1, v25);
      uint64_t v26 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel;
      swift_beginAccess();
      sub_250E48EBC((uint64_t)v8, v26);
      swift_endAccess();
      sub_250E44904();
      sub_250E48DF0((uint64_t)v8, (uint64_t)&qword_269B0C7C8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
      return sub_250E48E50(v16, v18);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_250E45880@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  return sub_250E47D08(v3, a1);
}

uint64_t sub_250E458D4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  sub_250E47E44(a1, v3);
  swift_endAccess();
  sub_250E45188();
  return sub_250E47ED4(a1);
}

uint64_t (*sub_250E45944(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_250E459A4;
}

uint64_t sub_250E459A4(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_250E45188();
  }
  return result;
}

id sub_250E459D8@<X0>(void *a1@<X8>)
{
  id result = sub_250E45A54();
  *a1 = result;
  return result;
}

void sub_250E45A04(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v4 = *(id *)(*a2
             + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(void *)(*a2
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = *a1;
  id v3 = v2;
}

id sub_250E45A54()
{
  uint64_t v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  }
  else
  {
    sub_250E7A228();
    id v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_250E45AE0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250E45B18()
{
  sub_250E43AF0(v0);
}

unint64_t sub_250E45B20()
{
  unint64_t result = qword_269B0C768;
  if (!qword_269B0C768)
  {
    sub_250E47DF4(255, &qword_269B0C770);
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0C768);
  }
  return result;
}

uint64_t sub_250E45B6C(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = a1;
  return MEMORY[0x270F9A758]();
}

void (*sub_250E45B80(id *a1))(uint64_t *a1)
{
  a1[1] = v1;
  *a1 = sub_250E45A54();
  return sub_250E45BC8;
}

void sub_250E45BC8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  id v3 = *(void **)(v1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(void *)(v1
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = v2;
}

id SleepingSampleChangesAlertTileViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    id v6 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id SleepingSampleChangesAlertTileViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  sub_250E47F5C(0, &qword_269B0C790, MEMORY[0x263F42FB0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v20 - v8;
  *(void *)&v4[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint] = 0;
  uint64_t v10 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewModelProvider;
  uint64_t v11 = sub_250E7A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  sub_250E79FC8();
  swift_allocObject();
  uint64_t v12 = v4;
  *(void *)&v4[v10] = sub_250E79FB8();
  uint64_t v13 = &v12[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel];
  uint64_t v14 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 1, 1, v14);
  *(void *)&v12[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView] = 0;
  *(void *)&v12[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph] = 0;
  uint64_t v15 = &v12[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context];
  *(_OWORD *)uint64_t v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  *((void *)v15 + 4) = 0;
  *(void *)&v12[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView] = 0;

  if (a2)
  {
    uint64_t v16 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = 0;
  }
  unint64_t v17 = (objc_class *)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  v20.receiver = v12;
  v20.super_class = v17;
  id v18 = objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, v16, a3);

  return v18;
}

id SleepingSampleChangesAlertTileViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SleepingSampleChangesAlertTileViewController.init(coder:)(void *a1)
{
  uint64_t v2 = v1;
  sub_250E47F5C(0, &qword_269B0C790, MEMORY[0x263F42FB0], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v16 - v5;
  *(void *)&v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint] = 0;
  uint64_t v7 = OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewModelProvider;
  uint64_t v8 = sub_250E7A018();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_250E79FC8();
  swift_allocObject();
  uint64_t v9 = v2;
  *(void *)&v2[v7] = sub_250E79FB8();
  uint64_t v10 = &v9[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel];
  uint64_t v11 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(void *)&v9[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___chartView] = 0;
  *(void *)&v9[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___messageGlyph] = 0;
  uint64_t v12 = &v9[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context];
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;
  *(void *)&v9[OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView] = 0;

  uint64_t v13 = (objc_class *)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  v16.receiver = v9;
  v16.super_class = v13;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithCoder_, a1);

  return v14;
}

id SleepingSampleChangesAlertTileViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_250E46248@<X0>(void *a1@<X8>)
{
  id result = sub_250E45A54();
  *a1 = result;
  return result;
}

void sub_250E46274(uint64_t *a1)
{
  uint64_t v2 = *a1;
  id v3 = *(void **)(*v1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView);
  *(void *)(*v1
            + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController____lazy_storage___tileView) = v2;
}

uint64_t (*sub_250E46290(id **a1))()
{
  uint64_t v2 = (id *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_250E45B80(v2);
  return sub_250E462EC;
}

uint64_t sub_250E46300(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F34920](a1, WitnessTable);
}

uint64_t sub_250E46354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F34928](a1, a2, a3, WitnessTable);
}

uint64_t (*sub_250E463C0(void *a1))()
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  swift_getWitnessTable();
  v2[4] = sub_250E7A658();
  return sub_250E462EC;
}

void sub_250E46444(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_250E4648C()
{
  return sub_250E7A688();
}

uint64_t sub_250E464F8()
{
  return _s22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewControllerC13didSelectCell_2inySo6UIViewC_So0pK0CtF_0();
}

uint64_t SleepingSampleChangesAlertTileViewController.glyph.getter()
{
  sub_250E40A50(0, &qword_269B0C7C0);
  id v0 = (id)*MEMORY[0x263F83570];
  uint64_t v1 = sub_250E7AE18();

  return v1;
}

uint64_t SleepingSampleChangesAlertTileViewController.title.getter()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  return sub_250E7ABC8();
}

uint64_t SleepingSampleChangesAlertTileViewController.title.setter()
{
  return swift_bridgeObjectRelease();
}

uint64_t SleepingSampleChangesAlertTileViewController.detail.getter@<X0>(char *a1@<X8>)
{
  uint64_t v3 = sub_250E7A018();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_250E47F5C(0, &qword_269B0C7C8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v29 - v9;
  sub_250E47F5C(0, &qword_26B20BD00, MEMORY[0x263F07490], v7);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v29 - v12;
  uint64_t v14 = sub_250E79938();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_viewModel;
  swift_beginAccess();
  sub_250E48328(v18, (uint64_t)v10);
  uint64_t v19 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 48))(v10, 1, v19))
  {
    sub_250E48DF0((uint64_t)v10, (uint64_t)&qword_269B0C7C8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v10, v3);
    sub_250E48DF0((uint64_t)v10, (uint64_t)&qword_269B0C7C8, (uint64_t)type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
    sub_250E79FD8();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) != 1)
    {
      uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v21(v17, v13, v14);
      sub_250E483BC();
      uint64_t v23 = &a1[*(int *)(v22 + 48)];
      v21(a1, v17, v14);
      uint64_t v24 = *MEMORY[0x263F43FB0];
      uint64_t v25 = sub_250E7A318();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v23, v24, v25);
      objc_super v20 = (unsigned int *)MEMORY[0x263F43FB8];
      goto LABEL_6;
    }
  }
  sub_250E48DF0((uint64_t)v13, (uint64_t)&qword_26B20BD00, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_250E47F5C);
  objc_super v20 = (unsigned int *)MEMORY[0x263F43FC0];
LABEL_6:
  uint64_t v26 = *v20;
  uint64_t v27 = sub_250E7A328();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(a1, v26, v27);
}

id SleepingSampleChangesAlertTileViewController.backgroundColor.getter()
{
  return sub_250E46D48((SEL *)&selRef_hk_alertHeaderBackgroundColor);
}

id SleepingSampleChangesAlertTileViewController.foregroundColor.getter()
{
  return sub_250E46D48((SEL *)&selRef_hk_alertHeaderForegroundColor);
}

id sub_250E46D48(SEL *a1)
{
  id v1 = [self *a1];
  return v1;
}

uint64_t SleepingSampleChangesAlertTileViewController.showsSeparator.getter()
{
  return 0;
}

id sub_250E46D98(uint64_t a1, uint64_t a2)
{
  return sub_250E46DB0(a1, a2, (SEL *)&selRef_hk_alertHeaderBackgroundColor);
}

id sub_250E46DA4(uint64_t a1, uint64_t a2)
{
  return sub_250E46DB0(a1, a2, (SEL *)&selRef_hk_alertHeaderForegroundColor);
}

id sub_250E46DB0(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v3 = [self *a3];
  return v3;
}

uint64_t sub_250E46DF8()
{
  return 0;
}

uint64_t sub_250E46E00(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F342E8](a1, WitnessTable);
}

uint64_t sub_250E46E68()
{
  sub_250E40A50(0, &qword_269B0C7C0);
  id v0 = (id)*MEMORY[0x263F83570];
  uint64_t v1 = sub_250E7AE18();

  return v1;
}

uint64_t sub_250E46EE4()
{
  id v1 = objc_msgSend(*v0, sel_title);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_250E7ABA8();

  return v3;
}

uint64_t sub_250E46F4C@<X0>(char *a1@<X8>)
{
  return SleepingSampleChangesAlertTileViewController.detail.getter(a1);
}

uint64_t sub_250E46F70()
{
  return sub_250E7A538() & 1;
}

Swift::Void __swiftcall SleepingSampleChangesAlertTileViewController.didTapDismiss()()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_250E79938();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E7A888();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v10 = sub_250E7A878();
  os_log_type_t v11 = sub_250E7AD38();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v28 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v29 = v1;
    uint64_t v13 = (uint8_t *)v12;
    uint64_t v14 = swift_slowAlloc();
    id v30 = v5;
    uint64_t v15 = v14;
    v33[0] = v14;
    uint64_t v31 = v3;
    *(_DWORD *)uint64_t v13 = 136446210;
    uint64_t v16 = sub_250E7B218();
    uint64_t v32 = sub_250E3FFA8(v16, v17, v33);
    uint64_t v3 = v31;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v10, v11, "[%{public}s] Dismissing", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v18 = v15;
    uint64_t v5 = v30;
    MEMORY[0x25338C970](v18, -1, -1);
    uint64_t v19 = v13;
    uint64_t v1 = v29;
    MEMORY[0x25338C970](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v28);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  uint64_t v20 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_context;
  swift_beginAccess();
  sub_250E47D08(v20, (uint64_t)v33);
  uint64_t v21 = v34;
  if (v34)
  {
    sub_250E40A50(0, (unint64_t *)&qword_26B20C7A8);
    uint64_t v22 = __swift_project_boxed_opaque_existential_1(v33, v21);
    uint64_t v23 = *(void *)(v21 - 8);
    MEMORY[0x270FA5388](v22);
    uint64_t v25 = (char *)&v28 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v23 + 16))(v25);
    uint64_t v26 = (void *)sub_250E7A488();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v21);
    uint64_t v27 = (void *)sub_250E7AD48();

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v33);
    sub_250E79928();
    sub_250E7AD58();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_250E473F0(uint64_t a1, uint64_t a2)
{
  return sub_250E477F0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_250E47418(uint64_t a1, id *a2)
{
  uint64_t result = sub_250E7AB88();
  *a2 = 0;
  return result;
}

uint64_t sub_250E47490(uint64_t a1, id *a2)
{
  char v3 = sub_250E7AB98();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_250E47510@<X0>(uint64_t *a1@<X8>)
{
  sub_250E7ABA8();
  uint64_t v2 = sub_250E7AB78();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_250E47554(uint64_t a1, uint64_t a2)
{
  return sub_250E477F0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_250E47578()
{
  uint64_t v0 = sub_250E7ABA8();
  uint64_t v2 = v1;
  if (v0 == sub_250E7ABA8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_250E7B148();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_250E47604(uint64_t a1)
{
  uint64_t v2 = sub_250E48504(&qword_269B0C918, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v3 = sub_250E48504(&qword_269B0C920, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_250E476C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_250E7AB78();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_250E47708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_250E7ABA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_250E47734(uint64_t a1)
{
  uint64_t v2 = sub_250E48504(&qword_26B20C7B8, type metadata accessor for HKFeatureIdentifier);
  uint64_t v3 = sub_250E48504(&qword_269B0C8F0, type metadata accessor for HKFeatureIdentifier);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_250E477F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_250E7ABA8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_250E47834()
{
  sub_250E7ABA8();
  sub_250E7AC08();
  return swift_bridgeObjectRelease();
}

uint64_t sub_250E47888()
{
  sub_250E7ABA8();
  sub_250E7B188();
  sub_250E7AC08();
  uint64_t v0 = sub_250E7B1A8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_250E478FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_250E47994(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_250E47B94(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_250E47B94(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_250E47994(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_250E47B0C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_250E7AF98();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_250E7B048();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_250E7AC28();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_250E7B098();
    __break(1u);
LABEL_14:
    uint64_t result = sub_250E7B048();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_250E47B0C(uint64_t a1, uint64_t a2)
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
  sub_250E49338(0, &qword_269B0C8B8, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_250E47B94(char a1, int64_t a2, char a3, char *a4)
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
    sub_250E49338(0, &qword_269B0C8B8, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
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
  uint64_t result = sub_250E7B098();
  __break(1u);
  return result;
}

uint64_t sub_250E47D08(uint64_t a1, uint64_t a2)
{
  sub_250E47D98(0, &qword_269B0C778, (uint64_t)&qword_269B0C780, MEMORY[0x263F444A0], (void (*)(uint64_t, uint64_t, uint64_t))sub_250E47DF4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250E47D98(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  if (!*a2)
  {
    a5(255, a3, a4);
    unint64_t v6 = sub_250E7AE78();
    if (!v7) {
      atomic_store(v6, a2);
    }
  }
}

uint64_t sub_250E47DF4(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_250E47E44(uint64_t a1, uint64_t a2)
{
  sub_250E47D98(0, &qword_269B0C778, (uint64_t)&qword_269B0C780, MEMORY[0x263F444A0], (void (*)(uint64_t, uint64_t, uint64_t))sub_250E47DF4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_250E47ED4(uint64_t a1)
{
  sub_250E47D98(0, &qword_269B0C778, (uint64_t)&qword_269B0C780, MEMORY[0x263F444A0], (void (*)(uint64_t, uint64_t, uint64_t))sub_250E47DF4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_250E47F5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t type metadata accessor for SleepingSampleChangesAlertTileViewModel(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_26B20C258);
}

uint64_t sub_250E47FE0(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000250E7E780)
  {
    swift_bridgeObjectRelease();
    char v2 = 0;
  }
  else
  {
    char v3 = sub_250E7B148();
    swift_bridgeObjectRelease();
    char v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void sub_250E48068(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewController_chartViewHeightConstraint);
  if (v1)
  {
    uint64_t v2 = *MEMORY[0x263F83570];
    id v3 = objc_allocWithZone(MEMORY[0x263F82770]);
    id v7 = v1;
    id v4 = objc_msgSend(v3, sel_initForTextStyle_, v2);
    objc_msgSend(v4, sel_scaledValueForValue_, 106.0);
    double v6 = v5;

    objc_msgSend(v7, sel_setConstant_, v6);
  }
  else
  {
    __break(1u);
  }
}

uint64_t _s22HealthBalanceAppPlugin44SleepingSampleChangesAlertTileViewControllerC13didSelectCell_2inySo6UIViewC_So0pK0CtF_0()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_250E7A888();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  double v6 = sub_250E7A878();
  os_log_type_t v7 = sub_250E7AD38();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    v14[1] = v1;
    uint64_t v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v15 = v10;
    *(_DWORD *)uint64_t v9 = 136446210;
    uint64_t v11 = sub_250E7B218();
    v14[2] = sub_250E3FFA8(v11, v12, &v15);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v6, v7, "[%{public}s] Cell selected", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v10, -1, -1);
    MEMORY[0x25338C970](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_250E43B44();
}

uint64_t sub_250E48328(uint64_t a1, uint64_t a2)
{
  sub_250E47F5C(0, &qword_269B0C7C8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250E483BC()
{
  if (!qword_269B0C7D0)
  {
    sub_250E79938();
    sub_250E7A318();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B0C7D0);
    }
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_250E48474()
{
  return sub_250E48504(&qword_269B0C7D8, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_250E484BC()
{
  return sub_250E48504(&qword_269B0C7E0, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_250E48504(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E4854C()
{
  return sub_250E48504(&qword_269B0C7E8, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_250E48594()
{
  return MEMORY[0x263F43A10];
}

uint64_t sub_250E485A0()
{
  return sub_250E48504(&qword_269B0C7F0, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertTileViewController);
}

uint64_t sub_250E485E8()
{
  return type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
}

void sub_250E485F0()
{
  sub_250E47F5C(319, &qword_269B0C7C8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0]);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SleepingSampleChangesAlertTileViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SleepingSampleChangesAlertTileViewController);
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.context.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.context.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.context.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.tileView.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.tileView.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SleepingSampleChangesAlertTileViewController.tileView.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t sub_250E48850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  double v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  return v5(a1, a2, v4);
}

uint64_t sub_250E488BC(uint64_t a1)
{
  uint64_t v2 = sub_250E7A018();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  return v3(a1, v2);
}

uint64_t sub_250E48920(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_250E48984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_250E489E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_250E48A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_250E48AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E48AC4);
}

uint64_t sub_250E48AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  double v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_250E48B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E48B44);
}

uint64_t sub_250E48B44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E7A018();
  double v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_250E48BB4()
{
  uint64_t result = sub_250E7A018();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_250E48C40()
{
  unint64_t result = qword_269B0C870;
  if (!qword_269B0C870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C870);
  }
  return result;
}

uint64_t sub_250E48C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_250E48CF8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_250E48C40();
    unint64_t v7 = a3(a1, &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_250E48D5C()
{
  if (!qword_269B0C890)
  {
    sub_250E79F98();
    sub_250E48504(&qword_269B0C898, MEMORY[0x263F42FA8]);
    unint64_t v0 = sub_250E7AA38();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0C890);
    }
  }
}

uint64_t sub_250E48DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

uint64_t sub_250E48E50(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_250E48E64(a1, a2);
  }
  return a1;
}

uint64_t sub_250E48E64(uint64_t a1, unint64_t a2)
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

uint64_t sub_250E48EBC(uint64_t a1, uint64_t a2)
{
  sub_250E47F5C(0, &qword_269B0C7C8, type metadata accessor for SleepingSampleChangesAlertTileViewModel, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_250E48F50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepingSampleChangesAlertTileViewModel.CodingKeys(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for SleepingSampleChangesAlertTileViewModel.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x250E490A4);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleChangesAlertTileViewModel.CodingKeys()
{
  return &type metadata for SleepingSampleChangesAlertTileViewModel.CodingKeys;
}

void type metadata accessor for HKFeatureIdentifier(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_250E49130()
{
  return sub_250E48504(&qword_269B0C8C8, type metadata accessor for HKFeatureIdentifier);
}

uint64_t sub_250E49178()
{
  return sub_250E48504(&qword_269B0C8D0, type metadata accessor for HKFeatureIdentifier);
}

unint64_t sub_250E491C4()
{
  unint64_t result = qword_269B0C8D8;
  if (!qword_269B0C8D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C8D8);
  }
  return result;
}

unint64_t sub_250E4921C()
{
  unint64_t result = qword_269B0C8E0;
  if (!qword_269B0C8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C8E0);
  }
  return result;
}

unint64_t sub_250E49274()
{
  unint64_t result = qword_269B0C8E8;
  if (!qword_269B0C8E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C8E8);
  }
  return result;
}

uint64_t sub_250E492C8()
{
  return sub_250E48504(&qword_26B20C7C0, type metadata accessor for HKFeatureIdentifier);
}

void type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(uint64_t a1)
{
}

void sub_250E49338(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_250E49384()
{
  return sub_250E48504(&qword_269B0C900, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_250E493CC()
{
  return sub_250E48504(&qword_269B0C908, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

uint64_t sub_250E49414()
{
  return sub_250E48504(&qword_269B0C910, type metadata accessor for HKFeatureAvailabilityRequirementIdentifier);
}

BOOL sub_250E49464(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_250E49478()
{
  return sub_250E7B1A8();
}

uint64_t sub_250E494C0()
{
  return sub_250E7B198();
}

uint64_t sub_250E494EC()
{
  return sub_250E7B1A8();
}

void sub_250E49530(void *a1@<X8>)
{
  *a1 = &unk_2701EC5E0;
}

id sub_250E49540(unsigned __int8 a1)
{
  if (a1 - 2 < 2) {
    return 0;
  }
  if (a1)
  {
    id v14 = objc_allocWithZone((Class)type metadata accessor for BalanceOnboardingNotificationsViewController());
    return sub_250E6D5C0();
  }
  else
  {
    sub_250E49768(v1, (uint64_t)v19);
    uint64_t v3 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v19, v20);
    MEMORY[0x270FA5388](v3);
    unint64_t v5 = (_OWORD *)((char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(_OWORD *))(v6 + 16))(v5);
    unint64_t v17 = &type metadata for BalanceOnboardingManager;
    uint64_t v18 = &off_2701ECD28;
    unint64_t v7 = (_OWORD *)swift_allocObject();
    v16[0] = v7;
    long long v8 = v5[1];
    v7[1] = *v5;
    v7[2] = v8;
    v7[3] = v5[2];
    id v9 = objc_allocWithZone((Class)type metadata accessor for BalanceOnboardingIntroViewController());
    uint64_t v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, (uint64_t)v17);
    MEMORY[0x270FA5388](v10);
    unint64_t v12 = (_OWORD *)((char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(_OWORD *))(v13 + 16))(v12);
    id v2 = sub_250E4985C(v12, v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
  }
  return v2;
}

uint64_t sub_250E49768(uint64_t a1, uint64_t a2)
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

uint64_t sub_250E4981C()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

id sub_250E4985C(_OWORD *a1, void *a2)
{
  uint64_t v4 = sub_250E79958();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_250E7AB68();
  MEMORY[0x270FA5388](v5 - 8);
  v15[3] = &type metadata for BalanceOnboardingManager;
  v15[4] = &off_2701ECD28;
  uint64_t v6 = (_OWORD *)swift_allocObject();
  v15[0] = v6;
  long long v7 = a1[1];
  v6[1] = *a1;
  v6[2] = v7;
  v6[3] = a1[2];
  sub_250E49768((uint64_t)v15, (uint64_t)a2 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36BalanceOnboardingIntroViewController_model);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v10 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  sub_250E67A08();
  uint64_t v11 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  v14.receiver = a2;
  v14.super_class = (Class)type metadata accessor for BalanceOnboardingIntroViewController();
  id v12 = objc_msgSendSuper2(&v14, sel_initWithTitle_detailText_icon_contentLayout_, v10, v11, 0, 1);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  return v12;
}

uint64_t initializeBufferWithCopyOfBuffer for BalanceOnboardingModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for BalanceOnboardingModel(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for BalanceOnboardingModel(uint64_t *a1, uint64_t *a2)
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

uint64_t assignWithTake for BalanceOnboardingModel(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingModel(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BalanceOnboardingModel(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BalanceOnboardingModel()
{
  return &type metadata for BalanceOnboardingModel;
}

unsigned char *storeEnumTagSinglePayload for BalanceOnboardingCannotProgressReason(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x250E49EE4);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingCannotProgressReason()
{
  return &type metadata for BalanceOnboardingCannotProgressReason;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingStage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BalanceOnboardingStage(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 2;
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
        JUMPOUT(0x250E4A084);
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
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_250E4A0AC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_250E4A0B4(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingStage()
{
  return &type metadata for BalanceOnboardingStage;
}

unint64_t sub_250E4A0D0()
{
  unint64_t result = qword_269B0C928;
  if (!qword_269B0C928)
  {
    sub_250E4A128();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C928);
  }
  return result;
}

void sub_250E4A128()
{
  if (!qword_269B0C930)
  {
    unint64_t v0 = sub_250E7AC98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0C930);
    }
  }
}

unint64_t sub_250E4A184()
{
  unint64_t result = qword_269B0C938;
  if (!qword_269B0C938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C938);
  }
  return result;
}

unint64_t sub_250E4A1DC()
{
  unint64_t result = qword_269B0C940;
  if (!qword_269B0C940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0C940);
  }
  return result;
}

id BalanceRoomViewController.__allocating_init(context:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return BalanceRoomViewController.init(context:)(a1);
}

id BalanceRoomViewController.init(context:)(uint64_t a1)
{
  uint64_t v2 = sub_250E7A438();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E7A448();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  int v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = self;
  id result = objc_msgSend(v10, sel_appleBalanceMetricsType);
  if (result)
  {
    uint64_t v12 = result;
    sub_250E7A408();

    sub_250E7A418();
    uint64_t v16 = 0;
    memset(v15, 0, sizeof(v15));
    sub_250E7A618();
    swift_bridgeObjectRelease();
    sub_250E4A4A8((uint64_t)v15);
    sub_250E7A3F8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    id result = objc_msgSend(v10, sel_appleBalanceMetricsType);
    if (result)
    {
      uint64_t v13 = sub_250E7A458();
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
      return (id)v13;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_250E4A4A8(uint64_t a1)
{
  sub_250E4A504();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_250E4A504()
{
  if (!qword_269B0C948)
  {
    sub_250E4A55C();
    unint64_t v0 = sub_250E7AE78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0C948);
    }
  }
}

unint64_t sub_250E4A55C()
{
  unint64_t result = qword_269B0C950;
  if (!qword_269B0C950)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0C950);
  }
  return result;
}

void sub_250E4A5B4()
{
}

uint64_t sub_250E4A610(int a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_250E7A888();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v8 = sub_250E7A878();
  os_log_type_t v9 = sub_250E7AD38();
  if (os_log_type_enabled(v8, v9))
  {
    int v18 = a1;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v4;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = sub_250E7B218();
    uint64_t v19 = sub_250E3FFA8(v13, v14, &v20);
    LOBYTE(a1) = v18;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v8, v9, "[%{public}s] view did appear", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v12, -1, -1);
    MEMORY[0x25338C970](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  uint64_t v15 = (objc_class *)type metadata accessor for BalanceRoomViewController();
  v21.receiver = v2;
  v21.super_class = v15;
  objc_msgSendSuper2(&v21, sel_viewDidAppear_, a1 & 1);
  return sub_250E4A8E0();
}

uint64_t type metadata accessor for BalanceRoomViewController()
{
  uint64_t result = qword_269B0C958;
  if (!qword_269B0C958) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_250E4A88C(void *a1, uint64_t a2, int a3)
{
  id v4 = a1;
  sub_250E4A610(a3);
}

uint64_t sub_250E4A8E0()
{
  swift_getObjectType();
  uint64_t v0 = sub_250E7A888();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  id v4 = sub_250E7A878();
  os_log_type_t v5 = sub_250E7AD38();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v15 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v8 = sub_250E7B218();
    uint64_t v14 = sub_250E3FFA8(v8, v9, &v15);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v4, v5, "[%{public}s] reloading widgets", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v7, -1, -1);
    MEMORY[0x25338C970](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v10 = sub_250E79A78();
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    sub_250E7AAA8();
    swift_bridgeObjectRetain();
    uint64_t v12 = v10 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_250E7AA98();
      sub_250E7AA88();
      swift_bridgeObjectRelease();
      swift_release();
      v12 += 16;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void BalanceRoomViewController.__allocating_init(dataSource:context:hkType:)()
{
}

void BalanceRoomViewController.init(dataSource:context:hkType:)()
{
}

id BalanceRoomViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalanceRoomViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250E4ABD0()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for BalanceRoomViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BalanceRoomViewController);
}

uint64_t dispatch thunk of BalanceRoomViewController.__allocating_init(context:)()
{
  return (*(uint64_t (**)(void))(v0 + class metadata base offset for BalanceRoomViewController))();
}

uint64_t sub_250E4AC44()
{
  return type metadata accessor for BalanceRoomViewController();
}

uint64_t sub_250E4AC4C(void *a1)
{
  sub_250E4ADB0();
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = &v11[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_250E7A398();
  sub_250E7A3A8();
  os_log_type_t v5 = (void *)sub_250E7A3A8();
  id v6 = objc_msgSend(v5, sel_profileIdentifier);

  uint64_t v7 = (void *)sub_250E7A3C8();
  sub_250E7ADA8();

  uint64_t v8 = sub_250E7A2C8();
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v4, 0, 1, v8);
  sub_250E7A2E8();

  sub_250E4AE08((uint64_t)v4);
  sub_250E7A3B8();
  id v9 = a1;
  return sub_250E7A428();
}

void sub_250E4ADB0()
{
  if (!qword_269B0C8A0)
  {
    sub_250E7A2C8();
    unint64_t v0 = sub_250E7AE78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0C8A0);
    }
  }
}

uint64_t sub_250E4AE08(uint64_t a1)
{
  sub_250E4ADB0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *assignWithCopy for SleepingSampleAnalysisHealthChecklistConfigurationProvider(void *a1, void *a2)
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

void *assignWithTake for SleepingSampleAnalysisHealthChecklistConfigurationProvider(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistConfigurationProvider(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistConfigurationProvider(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistConfigurationProvider()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistConfigurationProvider;
}

uint64_t sub_250E4AF80()
{
  return sub_250E4B010(&qword_26B20BD60, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler);
}

uint64_t sub_250E4AFC8()
{
  return sub_250E4B010(&qword_269B0C968, MEMORY[0x263F436D8]);
}

uint64_t sub_250E4B010(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E4B058@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_250E79958();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_250E7AB68();
  MEMORY[0x270FA5388](v3 - 8);
  sub_250E4F2D0(0, &qword_269B0C978, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v4 - 8);
  id v6 = (char *)&v12 - v5;
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  sub_250E798F8();
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_250E79908();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 32))(a1, v6, v9);
  }
  __break(1u);
  return result;
}

uint64_t sub_250E4B28C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_250E7A888();
  uint64_t v171 = *(void *)(v6 - 8);
  uint64_t v172 = v6;
  MEMORY[0x270FA5388](v6);
  v173 = (char *)&v166 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_250E7A0C8();
  uint64_t v174 = *(void *)(v8 - 8);
  uint64_t v175 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v166 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_250E79958();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v12 = sub_250E7AB68();
  MEMORY[0x270FA5388](v12 - 8);
  id v13 = (id)*MEMORY[0x263F09600];
  uint64_t v14 = (void *)sub_250E7A778();

  id v15 = objc_msgSend(v14, sel_highestPriorityUnsatisfiedRequirement);
  if (!v15)
  {
    sub_250E4D308(a3);
    uint64_t v34 = sub_250E7A1B8();
    id v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56);
    uint64_t v31 = v34;
    uint64_t v32 = a3;
LABEL_13:
    uint64_t v33 = 0;
    goto LABEL_14;
  }
  uint64_t v170 = a1;
  uint64_t v176 = a3;
  uint64_t v16 = sub_250E7ABA8();
  uint64_t v18 = v17;
  if (v16 == sub_250E7ABA8() && v18 == v19) {
    goto LABEL_10;
  }
  uint64_t v169 = a2;
  char v21 = sub_250E7B148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21)
  {
LABEL_11:

    uint64_t v29 = sub_250E7A1B8();
    id v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
    uint64_t v31 = v29;
    uint64_t v32 = v176;
    uint64_t v33 = 1;
LABEL_14:
    return v30(v32, v33, 1, v31);
  }
  uint64_t v22 = (void *)*MEMORY[0x263F09618];
  uint64_t v23 = sub_250E7ABA8();
  uint64_t v25 = v24;
  if (v23 == sub_250E7ABA8() && v25 == v26) {
    goto LABEL_9;
  }
  char v36 = sub_250E7B148();
  id v37 = v22;
  id v38 = v15;
  v167 = v10;
  id v39 = v38;

  id v168 = v39;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_11;
  }
  uint64_t v22 = (void *)*MEMORY[0x263F09638];
  uint64_t v40 = sub_250E7ABA8();
  uint64_t v42 = v41;
  if (v40 == sub_250E7ABA8() && v42 == v43)
  {
LABEL_9:
    id v27 = v22;
    id v28 = v15;

LABEL_10:
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
  char v44 = sub_250E7B148();
  id v45 = v22;
  id v46 = v168;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v44) {
    goto LABEL_11;
  }
  id v47 = (void *)*MEMORY[0x263F09718];
  uint64_t v48 = sub_250E7ABA8();
  uint64_t v50 = v49;
  if (v48 == sub_250E7ABA8() && v50 == v51)
  {
    id v52 = v47;
    id v53 = v46;

    swift_bridgeObjectRelease_n();
LABEL_25:

    sub_250E7AAF8();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v58 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
LABEL_26:
    id v59 = v58;
    sub_250E79948();
    uint64_t v60 = sub_250E7ABC8();
    uint64_t v62 = v61;
    uint64_t v63 = v174;
    uint64_t v64 = (uint64_t)v167;
    (*(void (**)(char *, void, uint64_t))(v174 + 104))(v167, *MEMORY[0x263F435B8], v175);
    sub_250E40670(0, &qword_269B0C970);
    uint64_t v65 = swift_allocObject();
    *(_OWORD *)(v65 + 16) = xmmword_250E7BB70;
    *(void *)(v65 + 32) = v60;
    *(void *)(v65 + 40) = v62;
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_250E7A148();
    uint64_t v68 = v67;
    uint64_t v69 = MEMORY[0x25338B2D0](v60, v62);
    uint64_t v71 = v70;
    uint64_t v72 = sub_250E7A148();
    uint64_t v73 = v176;
    sub_250E4D7E4(v64, v65, v66, v68, v69, v71, v72, v74, v176);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v175);
    swift_bridgeObjectRelease();
    uint64_t v75 = sub_250E7A1B8();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v73, 0, 1, v75);
  }
  LODWORD(v168) = sub_250E7B148();
  id v54 = v47;
  id v55 = v46;

  id v56 = v55;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v168) {
    goto LABEL_25;
  }
  unint64_t v76 = (void *)*MEMORY[0x263F096B0];
  uint64_t v77 = sub_250E7ABA8();
  v79 = v78;
  if (v77 == sub_250E7ABA8() && v79 == v80)
  {
    id v81 = v76;
    id v82 = v56;

    swift_bridgeObjectRelease_n();
LABEL_32:

    sub_250E7AAF8();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t v88 = swift_getObjCClassFromMetadata();
    id v58 = objc_msgSend(self, sel_bundleForClass_, v88);
    goto LABEL_26;
  }
  char v83 = sub_250E7B148();
  id v84 = v76;
  id v85 = v56;
  id v168 = v79;
  uint64_t v86 = v56;
  id v87 = v85;

  id v166 = v87;
  id v56 = v86;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v83) {
    goto LABEL_32;
  }
  uint64_t v89 = (void *)*MEMORY[0x263F096E8];
  uint64_t v90 = sub_250E7ABA8();
  uint64_t v92 = v91;
  if (v90 == sub_250E7ABA8() && v92 == v93)
  {
    id v94 = v89;
    id v95 = v166;
    id v96 = v166;

    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  char v97 = sub_250E7B148();
  id v98 = v89;
  id v95 = v166;
  id v99 = v166;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v97)
  {
LABEL_37:

    id v100 = v13;
    uint64_t v101 = (void *)sub_250E7A778();

    id v102 = objc_msgSend(v101, sel_unsatisfiedRequirementIdentifiers);
    type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
    uint64_t v103 = sub_250E7AC58();

    id v104 = (id)*MEMORY[0x263F096F0];
    char v105 = sub_250E4EFF0((uint64_t)v104, v103);
    swift_bridgeObjectRelease();

    if ((v105 & 1) == 0)
    {
      uint64_t v106 = v176;
      sub_250E4CE18(MEMORY[0x263F436E8], 0xD000000000000045, 0x8000000250E7E9C0, v176);
LABEL_45:
      uint64_t v117 = sub_250E7A1B8();
      id v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v117 - 8) + 56);
      uint64_t v31 = v117;
      uint64_t v32 = v106;
      goto LABEL_13;
    }
LABEL_44:
    uint64_t v106 = v176;
    sub_250E4C254(v176);
    goto LABEL_45;
  }
  v107 = (void *)*MEMORY[0x263F096F0];
  uint64_t v108 = sub_250E7ABA8();
  uint64_t v110 = v109;
  if (v108 == sub_250E7ABA8() && v110 == v111)
  {
    id v112 = v107;
    id v113 = v99;

    swift_bridgeObjectRelease_n();
LABEL_43:

    goto LABEL_44;
  }
  char v114 = sub_250E7B148();
  id v115 = v107;
  id v116 = v99;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v114) {
    goto LABEL_43;
  }
  uint64_t v118 = (void *)*MEMORY[0x263F096F8];
  uint64_t v119 = sub_250E7ABA8();
  uint64_t v121 = v120;
  if (v119 == sub_250E7ABA8() && v121 == v122)
  {
    id v123 = v118;
    id v124 = v116;

    swift_bridgeObjectRelease_n();
LABEL_50:

    uint64_t v106 = v176;
    sub_250E4CA80(v170, v169, 52, 0xD000000000000034, 0x8000000250E7EAC0, v176);
    goto LABEL_45;
  }
  char v125 = sub_250E7B148();
  id v126 = v118;
  id v127 = v116;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v125) {
    goto LABEL_50;
  }
  v128 = (void *)*MEMORY[0x263F09720];
  uint64_t v129 = sub_250E7ABA8();
  uint64_t v131 = v130;
  if (v129 == sub_250E7ABA8() && v131 == v132)
  {
    id v133 = v128;
    id v134 = v127;

    swift_bridgeObjectRelease_n();
LABEL_55:

    uint64_t v106 = v176;
    sub_250E4C744(v170, v176);
    goto LABEL_45;
  }
  char v135 = sub_250E7B148();
  id v136 = v128;
  id v137 = v127;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v135) {
    goto LABEL_55;
  }
  v138 = (void *)*MEMORY[0x263F096C8];
  uint64_t v139 = sub_250E7ABA8();
  uint64_t v141 = v140;
  if (v139 == sub_250E7ABA8() && v141 == v142)
  {
    id v143 = v138;
    id v144 = v137;

    swift_bridgeObjectRelease_n();
LABEL_60:

    uint64_t v106 = v176;
    sub_250E4CA80(v170, v169, 87, 0xD000000000000057, 0x8000000250E7EB60, v176);
    goto LABEL_45;
  }
  char v145 = sub_250E7B148();
  id v146 = v138;
  id v147 = v137;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v145) {
    goto LABEL_60;
  }
  v148 = (void *)*MEMORY[0x263F096D0];
  uint64_t v149 = sub_250E7ABA8();
  uint64_t v151 = v150;
  if (v149 == sub_250E7ABA8() && v151 == v152)
  {
    id v153 = v148;
    id v154 = v147;

    swift_bridgeObjectRelease_n();
LABEL_65:

    uint64_t v106 = v176;
    sub_250E4CE18(MEMORY[0x263F436F0], 0xD000000000000028, 0x8000000250E7EBC0, v176);
    goto LABEL_45;
  }
  char v155 = sub_250E7B148();
  id v156 = v148;
  id v157 = v147;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v155) {
    goto LABEL_65;
  }
  sub_250E7A858();
  id v158 = v157;
  v159 = sub_250E7A878();
  os_log_type_t v160 = sub_250E7AD28();
  if (os_log_type_enabled(v159, v160))
  {
    uint64_t v161 = swift_slowAlloc();
    uint64_t v162 = swift_slowAlloc();
    uint64_t v178 = v162;
    *(_DWORD *)uint64_t v161 = 136446466;
    uint64_t v177 = sub_250E3FFA8(0xD00000000000003ALL, 0x8000000250E7C4E0, &v178);
    sub_250E7AE88();
    *(_WORD *)(v161 + 12) = 2082;
    uint64_t v163 = sub_250E7ABA8();
    uint64_t v177 = sub_250E3FFA8(v163, v164, &v178);
    sub_250E7AE88();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v159, v160, "[%{public}s] Unexpected failing requirement %{public}s; hiding tile",
      (uint8_t *)v161,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v162, -1, -1);
    MEMORY[0x25338C970](v161, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v171 + 8))(v173, v172);
  uint64_t v165 = sub_250E7A1B8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v165 - 8) + 56))(v176, 1, 1, v165);
}

uint64_t sub_250E4C254@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  sub_250E4F2D0(0, &qword_269B0C988, MEMORY[0x263F45848]);
  MEMORY[0x270FA5388](v1 - 8);
  id v27 = (char *)v26 - v2;
  sub_250E4F2D0(0, &qword_269B0C980, MEMORY[0x263F43658]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v26 - v4;
  uint64_t v6 = sub_250E7A0C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[2] = v9;
  uint64_t v10 = sub_250E79958();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_250E7AB68();
  MEMORY[0x270FA5388](v11 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = self;
  id v14 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v15 = sub_250E7ABC8();
  v26[3] = v16;
  v26[4] = v15;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F435D0], v6);
  id v17 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E7A0D8();
  uint64_t v18 = sub_250E7A0E8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v5, 0, 1, v18);
  v26[1] = sub_250E7A138();
  sub_250E40670(0, &qword_269B0C970);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_250E7C4E0;
  sub_250E7AAF8();
  id v20 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v19 + 32) = sub_250E7ABC8();
  *(void *)(v19 + 40) = v21;
  sub_250E7AAF8();
  id v22 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v19 + 48) = sub_250E7ABC8();
  *(void *)(v19 + 56) = v23;
  sub_250E7A158();
  uint64_t v24 = sub_250E79F28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v27, 1, 1, v24);
  return sub_250E7A1A8();
}

uint64_t sub_250E4C744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v21[1] = a1;
  uint64_t v22 = a2;
  uint64_t v2 = sub_250E7A0C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E79958();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v7 = sub_250E7AB68();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = sub_250E7AB48();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v9 = sub_250E7A188();
  uint64_t v11 = v10;
  sub_250E7AB38();
  sub_250E7AB28();
  sub_250E7AB18();
  sub_250E7AB28();
  sub_250E7AB58();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v14 = sub_250E7ABC8();
  uint64_t v16 = v15;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F435C0], v2);
  sub_250E40670(0, &qword_269B0C970);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_250E7BB70;
  *(void *)(v17 + 32) = v14;
  *(void *)(v17 + 40) = v16;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_250E7A168();
  sub_250E4D7E4((uint64_t)v5, v17, v18, v19, v14, v16, v9, v11, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_250E4CA80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v28 = a4;
  uint64_t v29 = a5;
  uint64_t v27 = a3;
  uint64_t v31 = a2;
  uint64_t v32 = a1;
  uint64_t v33 = a6;
  uint64_t v30 = sub_250E7A0C8();
  uint64_t v6 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250E7AB48();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v10 = sub_250E79958();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_250E7AB68();
  MEMORY[0x270FA5388](v11 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v13 = self;
  id v14 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata, v27, v28, v29);
  sub_250E79948();
  uint64_t v15 = sub_250E7ABC8();
  uint64_t v17 = v16;
  sub_250E7AB38();
  sub_250E7AB28();
  sub_250E7AB18();
  sub_250E7AB28();
  sub_250E7AB58();
  id v18 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v19 = sub_250E7ABC8();
  uint64_t v21 = v20;
  uint64_t v22 = v30;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F435C0], v30);
  sub_250E40670(0, &qword_269B0C970);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_250E7BB70;
  *(void *)(v23 + 32) = v19;
  *(void *)(v23 + 40) = v21;
  swift_bridgeObjectRetain();
  uint64_t v24 = sub_250E7A168();
  sub_250E4D7E4((uint64_t)v8, v23, v24, v25, v19, v21, v15, v17, v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v22);
}

uint64_t sub_250E4CE18@<X0>(uint64_t (*a1)(uint64_t)@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v31 = a1;
  uint64_t v35 = a4;
  sub_250E4F2D0(0, &qword_269B0C988, MEMORY[0x263F45848]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v34 = (char *)v30 - v5;
  sub_250E4F2D0(0, &qword_269B0C980, MEMORY[0x263F43658]);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)v30 - v7;
  uint64_t v9 = sub_250E7A0C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_250E79958();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v14 = sub_250E7AB68();
  MEMORY[0x270FA5388](v14 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v16 = self;
  id v17 = objc_msgSend(v16, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v18 = sub_250E7ABC8();
  v30[0] = v19;
  v30[1] = v18;
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, *MEMORY[0x263F435D0], v9);
  id v20 = objc_msgSend(v16, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E7A0D8();
  uint64_t v21 = sub_250E7A0E8();
  uint64_t v22 = (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v8, 0, 1, v21);
  uint64_t v31 = (uint64_t (*)(uint64_t))v31(v22);
  sub_250E40670(0, &qword_269B0C970);
  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_250E7C4E0;
  sub_250E7AAF8();
  id v24 = objc_msgSend(v16, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v23 + 32) = sub_250E7ABC8();
  *(void *)(v23 + 40) = v25;
  sub_250E7AAF8();
  id v26 = objc_msgSend(v16, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v23 + 48) = sub_250E7ABC8();
  *(void *)(v23 + 56) = v27;
  sub_250E7A158();
  uint64_t v28 = sub_250E79F28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v34, 1, 1, v28);
  return sub_250E7A1A8();
}

uint64_t sub_250E4D308@<X0>(uint64_t a1@<X8>)
{
  uint64_t v28 = a1;
  sub_250E4F2D0(0, &qword_269B0C988, MEMORY[0x263F45848]);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v27 = (char *)v26 - v2;
  sub_250E4F2D0(0, &qword_269B0C980, MEMORY[0x263F43658]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v26 - v4;
  uint64_t v6 = sub_250E7A0C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250E79958();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v11 = sub_250E7AB68();
  MEMORY[0x270FA5388](v11 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v15 = sub_250E7ABC8();
  v26[1] = v16;
  v26[2] = v15;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F435C8], v6);
  id v17 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E7A0D8();
  uint64_t v18 = sub_250E7A0E8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v5, 0, 1, v18);
  sub_250E40670(0, &qword_269B0C970);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_250E7C4E0;
  sub_250E7AAF8();
  id v20 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v19 + 32) = sub_250E7ABC8();
  *(void *)(v19 + 40) = v21;
  sub_250E7AAF8();
  id v22 = objc_msgSend(v13, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v19 + 48) = sub_250E7ABC8();
  *(void *)(v19 + 56) = v23;
  sub_250E7A158();
  uint64_t v24 = sub_250E79F28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v27, 1, 1, v24);
  return sub_250E7A1A8();
}

uint64_t sub_250E4D7E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v31 = a8;
  uint64_t v32 = a4;
  uint64_t v33 = a6;
  uint64_t v34 = a7;
  uint64_t v35 = a5;
  uint64_t v36 = a9;
  uint64_t v37 = a3;
  uint64_t v30 = a2;
  uint64_t v28 = a1;
  sub_250E4F2D0(0, &qword_269B0C978, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v29 = (char *)&v27 - v10;
  sub_250E4F2D0(0, &qword_269B0C980, MEMORY[0x263F43658]);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v27 - v12;
  uint64_t v14 = sub_250E7A0C8();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_250E79958();
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v19 = sub_250E7AB68();
  MEMORY[0x270FA5388](v19 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v21 = self;
  id v22 = objc_msgSend(v21, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v28, v14);
  id v23 = objc_msgSend(v21, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E7A0D8();
  uint64_t v24 = sub_250E7A0E8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v13, 0, 1, v24);
  uint64_t v25 = sub_250E79908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v29, 1, 1, v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_250E7A198();
}

uint64_t sub_250E4DC00(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  sub_250E4F2D0(0, &qword_269B0C990, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v15[-v7];
  uint64_t v9 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = &v15[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_250E4DE30(a3, a4, (uint64_t)v8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_250E4F324((uint64_t)v8);
    return 0;
  }
  else
  {
    sub_250E4F3F8((uint64_t)v8, (uint64_t)v12, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
    sub_250E79818();
    swift_allocObject();
    sub_250E79808();
    sub_250E4B010(&qword_269B0C998, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
    uint64_t v13 = sub_250E797F8();
    sub_250E4F39C((uint64_t)v12);
    swift_release();
  }
  return v13;
}

uint64_t sub_250E4DE30@<X0>(void *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  id v201 = a1;
  uint64_t v202 = a2;
  uint64_t v4 = sub_250E7A888();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v192 = (char *)&v185 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250E7A0A8();
  uint64_t v198 = *(void *)(v7 - 8);
  uint64_t v199 = v7;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v194 = (char *)&v185 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v197 = (char *)&v185 - v10;
  sub_250E4F2D0(0, &qword_269B0C978, MEMORY[0x263F06EA8]);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v195 = (char *)&v185 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v200 = (char *)&v185 - v15;
  MEMORY[0x270FA5388](v14);
  id v17 = (char *)&v185 - v16;
  uint64_t v18 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  uint64_t v19 = MEMORY[0x270FA5388](v18 - 8);
  v193 = (char *)&v185 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v196 = (char *)&v185 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  uint64_t v25 = (char *)&v185 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v185 - v26;
  id v28 = (id)*MEMORY[0x263F09600];
  uint64_t v29 = (void *)sub_250E7A778();

  id v30 = objc_msgSend(v29, sel_highestPriorityUnsatisfiedRequirement);
  if (!v30)
  {
    uint64_t v48 = sub_250E79908();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(a3, 3, 4, v48);
    uint64_t v49 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
    char v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56);
    uint64_t v45 = v49;
    uint64_t v46 = a3;
LABEL_11:
    uint64_t v47 = 0;
    goto LABEL_12;
  }
  uint64_t v190 = v5;
  uint64_t v191 = v4;
  uint64_t v203 = a3;
  uint64_t v31 = sub_250E7ABA8();
  uint64_t v33 = v32;
  if (v31 == sub_250E7ABA8() && v33 == v34) {
    goto LABEL_8;
  }
  char v35 = sub_250E7B148();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v35)
  {
LABEL_9:

    uint64_t v43 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
    char v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56);
    uint64_t v45 = v43;
    uint64_t v46 = v203;
    uint64_t v47 = 1;
LABEL_12:
    return v44(v46, v47, 1, v45);
  }
  uint64_t v36 = (void *)*MEMORY[0x263F09618];
  uint64_t v37 = sub_250E7ABA8();
  uint64_t v39 = v38;
  if (v37 == sub_250E7ABA8() && v39 == v40) {
    goto LABEL_7;
  }
  char v51 = sub_250E7B148();
  id v52 = v36;
  id v53 = v30;
  v188 = v17;
  id v54 = v53;

  id v189 = v54;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v51) {
    goto LABEL_9;
  }
  uint64_t v36 = (void *)*MEMORY[0x263F09638];
  uint64_t v55 = sub_250E7ABA8();
  uint64_t v57 = v56;
  if (v55 == sub_250E7ABA8() && v57 == v58)
  {
LABEL_7:
    id v41 = v36;
    id v42 = v30;

LABEL_8:
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  char v59 = sub_250E7B148();
  id v60 = v36;
  id v61 = v189;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v59) {
    goto LABEL_9;
  }
  uint64_t v62 = v61;
  uint64_t v63 = (void *)*MEMORY[0x263F09718];
  uint64_t v64 = sub_250E7ABA8();
  uint64_t v66 = v65;
  if (v64 == sub_250E7ABA8() && v66 == v67)
  {
    id v68 = v63;
    id v69 = v62;

    swift_bridgeObjectRelease_n();
LABEL_23:

LABEL_24:
    uint64_t v72 = v203;
    sub_250E4B058(v203);
    uint64_t v73 = sub_250E79908();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v72, 0, 4, v73);
LABEL_25:
    uint64_t v74 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
    char v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56);
    uint64_t v45 = v74;
    uint64_t v46 = v72;
    goto LABEL_11;
  }
  LODWORD(v189) = sub_250E7B148();
  id v70 = v63;
  id v71 = v62;

  id v187 = v71;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v189) {
    goto LABEL_23;
  }
  uint64_t v75 = (void *)*MEMORY[0x263F096B0];
  uint64_t v76 = sub_250E7ABA8();
  os_log_type_t v78 = v77;
  if (v76 == sub_250E7ABA8() && v78 == v79)
  {
    id v80 = v75;
    id v81 = v187;
    id v82 = v187;

    swift_bridgeObjectRelease_n();
LABEL_30:

    goto LABEL_24;
  }
  char v83 = sub_250E7B148();
  id v84 = v75;
  id v189 = v78;
  id v85 = v187;
  id v86 = v187;

  id v186 = v86;
  swift_bridgeObjectRelease();
  id v81 = v85;
  swift_bridgeObjectRelease();
  if (v83) {
    goto LABEL_30;
  }
  id v87 = (void *)*MEMORY[0x263F096E8];
  uint64_t v88 = sub_250E7ABA8();
  uint64_t v90 = v89;
  if (v88 == sub_250E7ABA8() && v90 == v91)
  {
    id v92 = v87;
    id v93 = v186;
    id v94 = v186;

    swift_bridgeObjectRelease_n();
LABEL_35:

    id v99 = v28;
    id v100 = (void *)sub_250E7A778();

    id v101 = objc_msgSend(v100, sel_unsatisfiedRequirementIdentifiers);
    type metadata accessor for HKFeatureAvailabilityRequirementIdentifier(0);
    uint64_t v102 = sub_250E7AC58();

    id v103 = (id)*MEMORY[0x263F096F0];
    char v104 = sub_250E4EFF0((uint64_t)v103, v102);
    swift_bridgeObjectRelease();

    uint64_t v105 = sub_250E79908();
    if (v104) {
      uint64_t v106 = 1;
    }
    else {
      uint64_t v106 = 2;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v27, v106, 4, v105);
    uint64_t v107 = (uint64_t)v27;
    goto LABEL_39;
  }
  char v95 = sub_250E7B148();
  id v96 = v87;
  id v93 = v186;
  id v97 = v186;
  uint64_t v202 = v90;
  id v98 = v97;

  id v201 = v98;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v95) {
    goto LABEL_35;
  }
  uint64_t v110 = (void *)*MEMORY[0x263F096F0];
  uint64_t v111 = sub_250E7ABA8();
  uint64_t v113 = v112;
  if (v111 == sub_250E7ABA8() && v113 == v114)
  {
    id v115 = v110;
    id v116 = v201;
    id v117 = v201;

    swift_bridgeObjectRelease_n();
LABEL_45:

    uint64_t v121 = sub_250E79908();
    uint64_t v72 = v203;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v121 - 8) + 56))(v203, 1, 4, v121);
    goto LABEL_25;
  }
  char v118 = sub_250E7B148();
  id v119 = v110;
  id v116 = v201;
  id v120 = v201;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v118) {
    goto LABEL_45;
  }
  uint64_t v122 = (void *)*MEMORY[0x263F096F8];
  uint64_t v123 = sub_250E7ABA8();
  uint64_t v125 = v124;
  if (v123 == sub_250E7ABA8() && v125 == v126)
  {
    id v127 = v122;
    id v128 = v120;

    swift_bridgeObjectRelease_n();
LABEL_50:

    uint64_t v132 = v188;
    sub_250E798F8();
    uint64_t v133 = sub_250E79908();
    uint64_t v134 = *(void *)(v133 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v134 + 48))(v132, 1, v133);
    if (result != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v134 + 32))(v25, v188, v133);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v25, 0, 4, v133);
      uint64_t v107 = (uint64_t)v25;
LABEL_39:
      uint64_t v108 = v203;
      sub_250E4F3F8(v107, v203, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
      uint64_t v109 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56))(v108, 0, 1, v109);
    }
    __break(1u);
    goto LABEL_75;
  }
  char v129 = sub_250E7B148();
  id v130 = v122;
  id v131 = v120;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v129) {
    goto LABEL_50;
  }
  char v135 = (void *)*MEMORY[0x263F09720];
  uint64_t v136 = sub_250E7ABA8();
  uint64_t v138 = v137;
  if (v136 == sub_250E7ABA8() && v138 == v139)
  {
    id v140 = v135;
    id v141 = v131;

    swift_bridgeObjectRelease_n();
LABEL_56:

    char v145 = v197;
    uint64_t v146 = v198;
    uint64_t v147 = v199;
    (*(void (**)(char *, void, uint64_t))(v198 + 104))(v197, *MEMORY[0x263F43590], v199);
    v148 = v200;
    sub_250E7A088();
    (*(void (**)(char *, uint64_t))(v146 + 8))(v145, v147);
    uint64_t v149 = sub_250E79908();
    uint64_t v150 = *(void *)(v149 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v150 + 48))(v148, 1, v149);
    if (result == 1)
    {
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    uint64_t v151 = v196;
    (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v196, v200, v149);
LABEL_64:
    (*(void (**)(char *, void, uint64_t, uint64_t))(v150 + 56))(v151, 0, 4, v149);
    uint64_t v107 = (uint64_t)v151;
    goto LABEL_39;
  }
  char v142 = sub_250E7B148();
  id v143 = v135;
  id v144 = v131;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v142) {
    goto LABEL_56;
  }
  uint64_t v152 = (void *)*MEMORY[0x263F096C8];
  uint64_t v153 = sub_250E7ABA8();
  uint64_t v155 = v154;
  if (v153 == sub_250E7ABA8() && v155 == v156)
  {
    id v157 = v152;
    id v158 = v144;

    swift_bridgeObjectRelease_n();
LABEL_62:

    uint64_t v163 = v198;
    uint64_t v162 = v199;
    unint64_t v164 = v194;
    (*(void (**)(char *, void, uint64_t))(v198 + 104))(v194, *MEMORY[0x263F43580], v199);
    uint64_t v165 = v195;
    sub_250E7A088();
    (*(void (**)(char *, uint64_t))(v163 + 8))(v164, v162);
    uint64_t v149 = sub_250E79908();
    uint64_t v150 = *(void *)(v149 - 8);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v150 + 48))(v165, 1, v149);
    if (result == 1)
    {
LABEL_76:
      __break(1u);
      return result;
    }
    uint64_t v151 = v193;
    (*(void (**)(char *, char *, uint64_t))(v150 + 32))(v193, v195, v149);
    goto LABEL_64;
  }
  char v159 = sub_250E7B148();
  id v160 = v152;
  id v161 = v144;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v159) {
    goto LABEL_62;
  }
  id v166 = (void *)*MEMORY[0x263F096D0];
  uint64_t v167 = sub_250E7ABA8();
  uint64_t v169 = v168;
  if (v167 == sub_250E7ABA8() && v169 == v170)
  {
    id v171 = v166;
    id v172 = v161;

    swift_bridgeObjectRelease_n();
LABEL_69:

    uint64_t v176 = sub_250E79908();
    uint64_t v72 = v203;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v176 - 8) + 56))(v203, 4, 4, v176);
    goto LABEL_25;
  }
  char v173 = sub_250E7B148();
  id v174 = v166;
  id v175 = v161;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v173) {
    goto LABEL_69;
  }
  sub_250E7A858();
  id v177 = v175;
  uint64_t v178 = sub_250E7A878();
  os_log_type_t v179 = sub_250E7AD28();
  if (os_log_type_enabled(v178, v179))
  {
    uint64_t v180 = swift_slowAlloc();
    uint64_t v181 = swift_slowAlloc();
    v205[0] = v181;
    *(_DWORD *)uint64_t v180 = 136446466;
    uint64_t v204 = sub_250E3FFA8(0xD00000000000003ALL, 0x8000000250E7C4E0, v205);
    sub_250E7AE88();
    *(_WORD *)(v180 + 12) = 2082;
    uint64_t v182 = sub_250E7ABA8();
    uint64_t v204 = sub_250E3FFA8(v182, v183, v205);
    sub_250E7AE88();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v178, v179, "[%{public}s] Unexpected failing requirement %{public}s; hiding tile",
      (uint8_t *)v180,
      0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v181, -1, -1);
    MEMORY[0x25338C970](v180, -1, -1);
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v190 + 8))(v192, v191);
  uint64_t v184 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v184 - 8) + 56))(v203, 1, 1, v184);
}

uint64_t sub_250E4EFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_250E7ABA8();
  uint64_t v5 = v4;
  if (v3 == sub_250E7ABA8() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  char v8 = sub_250E7B148();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v10 = 5;
  while (1)
  {
    uint64_t v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1)) {
      break;
    }
    uint64_t v12 = sub_250E7ABA8();
    uint64_t v14 = v13;
    if (v12 == sub_250E7ABA8() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    char v17 = sub_250E7B148();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_7;
    }
    ++v10;
    if (v11 == v2) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_250E4F148@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F436C0];
  uint64_t v3 = sub_250E7A118();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_250E4F1BC(uint64_t a1, uint64_t a2)
{
  return sub_250E4DC00(a1, a2, *(void **)v2, *(void *)(v2 + 8));
}

uint64_t sub_250E4F1C4@<X0>(uint64_t a1@<X8>)
{
  return sub_250E4B28C(*v1, v1[1], a1);
}

uint64_t sub_250E4F1CC@<X0>(uint64_t a1@<X8>)
{
  sub_250E7A268();
  uint64_t v2 = sub_250E79E48();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(0);
    sub_250E57040();
    return sub_250E79E28();
  }
  return result;
}

uint64_t sub_250E4F260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_250E42F84();
  return MEMORY[0x270F32870](a1, a2, a3, v6);
}

unint64_t sub_250E4F2B4()
{
  return 0xD000000000000016;
}

void sub_250E4F2D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_250E7AE78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_250E4F324(uint64_t a1)
{
  sub_250E4F2D0(0, &qword_269B0C990, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250E4F39C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250E4F3F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id HealthBalanceAppDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

id HealthBalanceAppDelegate.init()()
{
  sub_250E79A08();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthBalanceAppDelegate();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HealthBalanceAppDelegate()
{
  uint64_t result = qword_269B0C9B0;
  if (!qword_269B0C9B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id HealthBalanceAppDelegate.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HealthBalanceAppDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_250E4F6EC()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

uint64_t HealthBalanceAppDelegate.navigationPolicy(opening:currentViewController:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = sub_250E4F7A8(a1, a2);
  uint64_t v5 = sub_250E7A2D8();
  unint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);
  uint64_t v7 = (unsigned int *)MEMORY[0x263F43D60];
  if ((v4 & 1) == 0) {
    uint64_t v7 = (unsigned int *)MEMORY[0x263F43D58];
  }
  uint64_t v8 = *v7;
  return v6(a3, v8, v5);
}

uint64_t sub_250E4F7A8(uint64_t a1, void *a2)
{
  v37[1] = swift_getObjectType();
  uint64_t v3 = sub_250E7A888();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)v37 - v8;
  sub_250E534AC(0, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38], MEMORY[0x263F8D8F0]);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v37 - v14;
  id v16 = objc_msgSend(a2, sel_tabBarController);
  if (v16)
  {
    char v17 = v16;
    uint64_t v18 = v4;
    id v19 = objc_msgSend(v16, sel_selectedIndex);

    BOOL v29 = v19 == (id)1;
    uint64_t v4 = v18;
    if (v29)
    {
      sub_250E7A858();
      uint64_t v20 = sub_250E7A878();
      os_log_type_t v21 = sub_250E7AD38();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        uint64_t v39 = v23;
        *(_DWORD *)uint64_t v22 = 136446210;
        uint64_t v24 = sub_250E7B218();
        uint64_t v38 = sub_250E3FFA8(v24, v25, &v39);
        sub_250E7AE88();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v20, v21, "[%{public}s] on the Sharing tab, using reset to navigate to the default view instead", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v23, -1, -1);
        MEMORY[0x25338C970](v22, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v18 + 8))(v7, v3);
      return 0;
    }
  }
  sub_250E799C8();
  uint64_t v26 = sub_250E799B8();
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v15, 1, v26) != 1)
  {
    sub_250E53598((uint64_t)v15, (uint64_t)v13);
    int v28 = (*(uint64_t (**)(char *, uint64_t))(v27 + 88))(v13, v26);
    BOOL v29 = v28 == *MEMORY[0x263F42B28] || v28 == *MEMORY[0x263F42B20];
    if (!v29)
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v26);
      goto LABEL_17;
    }
    sub_250E52E34((uint64_t)v15, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
    sub_250E7A858();
    id v30 = sub_250E7A878();
    os_log_type_t v31 = sub_250E7AD38();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      uint64_t v39 = v33;
      *(_DWORD *)uint64_t v32 = 136446210;
      uint64_t v34 = sub_250E7B218();
      uint64_t v38 = sub_250E3FFA8(v34, v35, &v39);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250E38000, v30, v31, "[%{public}s] opening a time scope url, using reset for a clean stack", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v33, -1, -1);
      MEMORY[0x25338C970](v32, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    return 0;
  }
LABEL_17:
  sub_250E52E34((uint64_t)v15, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
  return 1;
}

uint64_t sub_250E4FCCC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char v4 = sub_250E4F7A8(a1, a2);
  uint64_t v5 = sub_250E7A2D8();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 104);
  uint64_t v7 = (unsigned int *)MEMORY[0x263F43D60];
  if ((v4 & 1) == 0) {
    uint64_t v7 = (unsigned int *)MEMORY[0x263F43D58];
  }
  uint64_t v8 = *v7;
  return v6(a3, v8, v5);
}

uint64_t HealthBalanceAppDelegate.openNSUA(activity:context:navigator:)(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  uint64_t v6 = sub_250E7A888();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  id v10 = a1;
  uint64_t v11 = sub_250E7A878();
  os_log_type_t v12 = sub_250E7AD38();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v28 = v7;
    uint64_t v14 = v13;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v32 = v27;
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v29 = a2;
    uint64_t v15 = sub_250E7B218();
    uint64_t v30 = v3;
    uint64_t v31 = sub_250E3FFA8(v15, v16, &v32);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    uint64_t v25 = v14 + 14;
    id v17 = v10;
    id v18 = objc_msgSend(v17, sel_description);
    uint64_t v26 = v6;
    id v19 = v18;
    uint64_t v20 = sub_250E7ABA8();
    unint64_t v22 = v21;

    uint64_t v31 = sub_250E3FFA8(v20, v22, &v32);
    sub_250E7AE88();

    a2 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v11, v12, "[%{public}s] received request to open user activity: [%{public}s]]", (uint8_t *)v14, 0x16u);
    uint64_t v23 = v27;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v23, -1, -1);
    MEMORY[0x25338C970](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return sub_250E5001C(v10, a2);
}

uint64_t sub_250E5001C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x263F8D8F0];
  sub_250E534AC(0, &qword_269B0C9C0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v89 = (uint64_t)&v72 - v9;
  uint64_t v10 = sub_250E7A3D8();
  uint64_t v82 = *(void *)(v10 - 8);
  uint64_t v83 = v10;
  MEMORY[0x270FA5388](v10);
  id v81 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E534AC(0, &qword_269B0C9C8, MEMORY[0x263F42B70], v7);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v72 - v13;
  uint64_t v94 = sub_250E799E8();
  uint64_t v92 = *(void *)(v94 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v94);
  uint64_t v88 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v91 = (char *)&v72 - v17;
  sub_250E534AC(0, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38], v7);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v72 - v19;
  uint64_t v21 = sub_250E799B8();
  id v85 = *(unsigned __int8 **)(v21 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v21);
  id v87 = (char *)&v72 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = v23;
  MEMORY[0x270FA5388](v22);
  uint64_t v90 = (char *)&v72 - v24;
  uint64_t v25 = sub_250E7A888();
  uint64_t v78 = *(void *)(v25 - 8);
  uint64_t v79 = v25;
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  id v28 = a1;
  uint64_t v29 = sub_250E7A878();
  os_log_type_t v30 = sub_250E7AD38();
  int v31 = v30;
  BOOL v32 = os_log_type_enabled(v29, v30);
  uint64_t v93 = v21;
  uint64_t v86 = ObjectType;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc();
    uint64_t v75 = swift_slowAlloc();
    v96[0] = v75;
    *(_DWORD *)uint64_t v33 = 136446466;
    uint64_t v76 = v20;
    uint64_t v34 = sub_250E7B218();
    int v73 = v31;
    uint64_t v95 = sub_250E3FFA8(v34, v35, v96);
    id v74 = v28;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v33 + 12) = 2082;
    uint64_t v72 = v33 + 14;
    id v36 = v28;
    id v37 = objc_msgSend(v36, sel_description);
    uint64_t v38 = sub_250E7ABA8();
    uint64_t v77 = v3;
    uint64_t v39 = v14;
    uint64_t v40 = a2;
    unint64_t v42 = v41;

    uint64_t v43 = v38;
    uint64_t v20 = v76;
    uint64_t v95 = sub_250E3FFA8(v43, v42, v96);
    sub_250E7AE88();

    a2 = v40;
    uint64_t v14 = v39;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v29, (os_log_type_t)v73, "[%{public}s] navigating to activity: %{public}s", (uint8_t *)v33, 0x16u);
    uint64_t v44 = v75;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v44, -1, -1);
    uint64_t v45 = v33;
    uint64_t v21 = v93;
    MEMORY[0x25338C970](v45, -1, -1);

    (*(void (**)(char *, uint64_t))(v78 + 8))(v27, v79);
    id v46 = v74;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v78 + 8))(v27, v79);
    id v46 = v28;
  }
  sub_250E799D8();
  uint64_t v47 = v85;
  int v48 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v85 + 6))(v20, 1, v21);
  uint64_t v49 = v91;
  if (v48 == 1)
  {
    (*((void (**)(char *, void, uint64_t))v47 + 13))(v90, *MEMORY[0x263F42B18], v21);
    sub_250E52E34((uint64_t)v20, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
  }
  else
  {
    (*((void (**)(char *, char *, uint64_t))v47 + 4))(v90, v20, v21);
  }
  sub_250E799F8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v92 + 48))(v14, 1, v94) == 1)
  {
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v49, *MEMORY[0x263F42B68], v94);
    sub_250E52E34((uint64_t)v14, &qword_269B0C9C8, MEMORY[0x263F42B70]);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v49, v14, v94);
  }
  sub_250E52EA4();
  uint64_t v50 = swift_allocObject();
  *(_DWORD *)(v50 + 24) = 0;
  *(void *)(v50 + 16) = v46;
  uint64_t v79 = v50;
  uint64_t v52 = v82;
  uint64_t v51 = v83;
  id v53 = *(void (**)(char *, uint64_t, uint64_t))(v82 + 16);
  id v54 = v46;
  uint64_t v55 = v81;
  v53(v81, a2, v83);
  sub_250E52F1C();
  uint64_t v56 = swift_allocObject();
  *(_DWORD *)(v56 + ((*(unsigned int *)(*(void *)v56 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  v53((char *)(v56 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v56 + 16)), (uint64_t)v55, v51);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v52 + 8);
  id v58 = v54;
  v57(v55, v51);
  uint64_t v59 = sub_250E7ACF8();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v89, 1, 1, v59);
  (*((void (**)(char *, char *, uint64_t))v47 + 2))(v87, v90, v93);
  id v60 = (void (**)(unint64_t, char *, uint64_t))v47;
  uint64_t v61 = v92;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v88, v91, v94);
  sub_250E7ACD8();
  swift_retain();
  swift_retain();
  uint64_t v62 = sub_250E7ACC8();
  unint64_t v63 = (*((unsigned __int8 *)v60 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v60 + 80);
  unint64_t v64 = (v80 + v63 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v65 = (v64 + 15) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v66 = (*(unsigned __int8 *)(v61 + 80) + v65 + 8) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  unint64_t v67 = (v84 + v66 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v68 = swift_allocObject();
  uint64_t v69 = MEMORY[0x263F8F500];
  *(void *)(v68 + 16) = v62;
  *(void *)(v68 + 24) = v69;
  v60[4](v68 + v63, v87, v93);
  *(void *)(v68 + v64) = v79;
  *(void *)(v68 + v65) = v56;
  uint64_t v70 = v94;
  (*(void (**)(unint64_t, char *, uint64_t))(v61 + 32))(v68 + v66, v88, v94);
  *(void *)(v68 + v67) = v86;
  sub_250E5292C(v89, (uint64_t)&unk_269B0C9F0, v68);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v91, v70);
  return ((uint64_t (*)(char *, uint64_t))v60[1])(v90, v93);
}

uint64_t HealthBalanceAppDelegate.openURL(url:context:navigator:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v30 = a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_250E79908();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250E7A888();
  uint64_t v28 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v29 = a1;
  v12(v8, a1, v5);
  uint64_t v13 = sub_250E7A878();
  os_log_type_t v14 = sub_250E7AD38();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v32 = v25;
    *(_DWORD *)uint64_t v15 = 136446466;
    uint64_t v16 = sub_250E7B218();
    uint64_t ObjectType = a3;
    uint64_t v31 = sub_250E3FFA8(v16, v17, &v32);
    uint64_t v26 = v9;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2082;
    sub_250E52D08(&qword_269B0C9A8, MEMORY[0x263F06EA8]);
    uint64_t v18 = sub_250E7B128();
    uint64_t v31 = sub_250E3FFA8(v18, v19, &v32);
    a3 = ObjectType;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    _os_log_impl(&dword_250E38000, v13, v14, "[%{public}s] received request to open url: [%{public}s]]", (uint8_t *)v15, 0x16u);
    uint64_t v20 = v25;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v20, -1, -1);
    MEMORY[0x25338C970](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v26);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v11, v9);
  }
  sub_250E79A88();
  uint64_t v21 = (void *)sub_250E7A1D8();
  swift_bridgeObjectRelease();
  sub_250E79998();
  sub_250E5001C(v21, v30);

  uint64_t v22 = sub_250E7A558();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(a3, 1, 1, v22);
}

uint64_t sub_250E50E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  uint64_t v9 = sub_250E7A888();
  v8[11] = v9;
  v8[12] = *(void *)(v9 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = sub_250E7A288();
  v8[15] = swift_task_alloc();
  sub_250E534AC(0, &qword_269B0CA08, MEMORY[0x263F062D0], MEMORY[0x263F8D8F0]);
  v8[16] = swift_task_alloc();
  uint64_t v10 = sub_250E79938();
  v8[17] = v10;
  v8[18] = *(void *)(v10 - 8);
  v8[19] = swift_task_alloc();
  v8[20] = swift_task_alloc();
  v8[21] = swift_task_alloc();
  uint64_t v11 = sub_250E799B8();
  v8[22] = v11;
  v8[23] = *(void *)(v11 - 8);
  v8[24] = swift_task_alloc();
  v8[25] = swift_task_alloc();
  v8[26] = swift_task_alloc();
  sub_250E7ACD8();
  v8[27] = sub_250E7ACC8();
  uint64_t v13 = sub_250E7ACB8();
  return MEMORY[0x270FA2498](sub_250E510C0, v13, v12);
}

uint64_t sub_250E510C0()
{
  uint64_t v58 = v0;
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 48);
  swift_release();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v5(v1, v4, v2);
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v6 == *MEMORY[0x263F42B30])
  {
    uint64_t v7 = *(void *)(v0 + 72);
    uint64_t v8 = *(void *)(v0 + 64);
    id v9 = sub_250E5186C(*(os_unfair_lock_s **)(v0 + 56), v8, 0);
    sub_250E524B0(v9, v8, v7);
  }
  else if (v6 == *MEMORY[0x263F42B18])
  {
  }
  else if (v6 == *MEMORY[0x263F42B28])
  {
    uint64_t v10 = *(void *)(v0 + 168);
    uint64_t v11 = *(void *)(v0 + 144);
    uint64_t v12 = *(void *)(v0 + 152);
    uint64_t v14 = *(void *)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 136);
    uint64_t v52 = *(void *)(v0 + 64);
    uint64_t v50 = *(os_unfair_lock_s **)(v0 + 56);
    sub_250E79928();
    sub_250E7A2A8();
    sub_250E79918();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v12, v10, v13);
    sub_250E79828();
    uint64_t v15 = sub_250E79838();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
    *(void *)(v0 + 32) = MEMORY[0x263F8EE78];
    sub_250E52D08(&qword_269B0CA10, MEMORY[0x263F43B50]);
    sub_250E534AC(0, &qword_269B0CA18, MEMORY[0x263F43B50], MEMORY[0x263F8D488]);
    sub_250E53510();
    sub_250E7AED8();
    uint64_t v16 = (void *)sub_250E7A298();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v13);
  }
  else if (v6 == *MEMORY[0x263F42B20])
  {
    uint64_t v18 = *(void *)(v0 + 160);
    uint64_t v17 = *(void *)(v0 + 168);
    uint64_t v20 = *(void *)(v0 + 144);
    uint64_t v19 = *(void *)(v0 + 152);
    uint64_t v22 = *(void *)(v0 + 128);
    uint64_t v21 = *(void *)(v0 + 136);
    uint64_t v55 = *(void *)(v0 + 64);
    id v53 = *(os_unfair_lock_s **)(v0 + 56);
    sub_250E79928();
    sub_250E7A2A8();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
    v23(v18, v17, v21);
    v23(v19, v17, v21);
    sub_250E79828();
    uint64_t v24 = sub_250E79838();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v22, 0, 1, v24);
    *(void *)(v0 + 40) = MEMORY[0x263F8EE78];
    sub_250E52D08(&qword_269B0CA10, MEMORY[0x263F43B50]);
    sub_250E534AC(0, &qword_269B0CA18, MEMORY[0x263F43B50], MEMORY[0x263F8D488]);
    sub_250E53510();
    sub_250E7AED8();
    uint64_t v25 = (void *)sub_250E7A298();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v17, v21);
  }
  else
  {
    uint64_t v26 = *(void *)(v0 + 200);
    uint64_t v27 = *(void *)(v0 + 176);
    uint64_t v28 = *(void *)(v0 + 48);
    sub_250E7A858();
    v5(v26, v28, v27);
    uint64_t v29 = sub_250E7A878();
    os_log_type_t v30 = sub_250E7AD18();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v32 = *(void *)(v0 + 184);
      uint64_t v31 = *(void *)(v0 + 192);
      uint64_t v47 = *(void *)(v0 + 176);
      uint64_t v51 = *(void *)(v0 + 96);
      uint64_t v54 = *(void *)(v0 + 88);
      uint64_t v56 = *(void *)(v0 + 104);
      log = v29;
      uint64_t v33 = *(void *)(v0 + 200);
      uint64_t v34 = swift_slowAlloc();
      uint64_t v49 = swift_slowAlloc();
      uint64_t v57 = v49;
      *(_DWORD *)uint64_t v34 = 136446466;
      uint64_t v35 = sub_250E7B218();
      *(void *)(v0 + 16) = sub_250E3FFA8(v35, v36, &v57);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2082;
      v5(v31, v33, v47);
      uint64_t v37 = sub_250E7ABD8();
      *(void *)(v0 + 24) = sub_250E3FFA8(v37, v38, &v57);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(v32 + 8);
      v39(v33, v47);
      _os_log_impl(&dword_250E38000, log, v30, "[%{public}s] asked to navigate with unsupported route: %{public}s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v49, -1, -1);
      MEMORY[0x25338C970](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v56, v54);
    }
    else
    {
      uint64_t v41 = *(void *)(v0 + 96);
      uint64_t v40 = *(void *)(v0 + 104);
      uint64_t v42 = *(void *)(v0 + 88);
      uint64_t v39 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 184) + 8);
      v39(*(void *)(v0 + 200), *(void *)(v0 + 176));

      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
    }
    uint64_t v43 = *(void *)(v0 + 208);
    uint64_t v44 = *(void *)(v0 + 176);

    v39(v43, v44);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v45 = *(uint64_t (**)(void))(v0 + 8);
  return v45();
}

id sub_250E5186C(os_unfair_lock_s *a1, uint64_t a2, void *a3)
{
  id v100 = a3;
  id v96 = a1;
  uint64_t v101 = sub_250E7A3D8();
  uint64_t v4 = *(void *)(v101 - 8);
  MEMORY[0x270FA5388](v101);
  int v6 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250E7A438();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v95 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  char v104 = (char *)&v90 - v11;
  uint64_t v12 = sub_250E7A888();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v93 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v94 = (char *)&v90 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v92 = (char *)&v90 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v90 - v20;
  sub_250E7A858();
  uint64_t v22 = sub_250E7A878();
  os_log_type_t v23 = sub_250E7AD38();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v98 = v8;
  uint64_t v99 = v7;
  uint64_t v102 = v13;
  uint64_t v103 = v12;
  if (v24)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v106 = v26;
    *(_DWORD *)uint64_t v25 = 136446210;
    uint64_t v91 = v4;
    uint64_t v27 = sub_250E7B218();
    uint64_t v105 = sub_250E3FFA8(v27, v28, &v106);
    uint64_t v4 = v91;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v22, v23, "[%{public}s] navigating to balance room", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v26, -1, -1);
    MEMORY[0x25338C970](v25, -1, -1);

    id v97 = *(void (**)(char *, uint64_t))(v102 + 8);
    v97(v21, v103);
  }
  else
  {

    id v97 = *(void (**)(char *, uint64_t))(v13 + 8);
    v97(v21, v12);
  }
  uint64_t v29 = a2 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)a2 + 16);
  os_log_type_t v30 = (os_unfair_lock_s *)(a2 + ((*(unsigned int *)(*(void *)a2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v30);
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v32 = v101;
  v31(v6, v29, v101);
  os_unfair_lock_unlock(v30);
  sub_250E4AC4C(v100);
  uint64_t v33 = *(void (**)(char *, uint64_t))(v4 + 8);
  v33(v6, v32);
  os_unfair_lock_lock(v30);
  v31(v6, v29, v32);
  os_unfair_lock_unlock(v30);
  uint64_t v34 = (void *)sub_250E7A3C8();
  v33(v6, v32);
  id v35 = objc_msgSend(v34, sel_navigationController);
  if (v35)
  {
    unint64_t v36 = v35;
    uint64_t v101 = (uint64_t)v34;
    id v37 = objc_msgSend(v35, sel_viewControllers);
    unint64_t v38 = (void *)sub_250E40A50(0, (unint64_t *)&qword_269B0CA28);
    unint64_t v39 = sub_250E7AC58();

    if (v39 >> 62)
    {
LABEL_31:
      swift_bridgeObjectRetain();
      uint64_t v40 = sub_250E7B068();
      if (v40)
      {
LABEL_7:
        uint64_t v41 = 4;
        while (1)
        {
          if ((v39 & 0xC000000000000001) != 0) {
            id v42 = (id)MEMORY[0x25338C100](v41 - 4, v39);
          }
          else {
            id v42 = *(id *)(v39 + 8 * v41);
          }
          uint64_t v43 = v42;
          uint64_t v44 = v41 - 3;
          if (__OFADD__(v41 - 4, 1))
          {
            __break(1u);
            goto LABEL_31;
          }
          type metadata accessor for BalanceRoomViewController();
          uint64_t v45 = swift_dynamicCastClass();
          if (v45) {
            break;
          }

          ++v41;
          if (v44 == v40) {
            goto LABEL_14;
          }
        }
        id v74 = (id)v45;
        swift_bridgeObjectRelease_n();
        uint64_t v77 = v92;
        sub_250E7A858();
        uint64_t v78 = sub_250E7A878();
        os_log_type_t v79 = sub_250E7AD38();
        if (os_log_type_enabled(v78, v79))
        {
          uint64_t v80 = (uint8_t *)swift_slowAlloc();
          uint64_t v81 = swift_slowAlloc();
          uint64_t v106 = v81;
          *(_DWORD *)uint64_t v80 = 136446210;
          uint64_t v82 = sub_250E7B218();
          uint64_t v105 = sub_250E3FFA8(v82, v83, &v106);
          sub_250E7AE88();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_250E38000, v78, v79, "[%{public}s] found existing balance room", v80, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x25338C970](v81, -1, -1);
          MEMORY[0x25338C970](v80, -1, -1);
        }

        v97(v77, v103);
        uint64_t v54 = v98;
        uint64_t v53 = v99;
        uint64_t v75 = v96;
        uint64_t v56 = v104;
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v40 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v40) {
        goto LABEL_7;
      }
    }
LABEL_14:
    id v100 = v38;
    swift_bridgeObjectRelease_n();
    id v46 = v94;
    sub_250E7A858();
    uint64_t v47 = sub_250E7A878();
    os_log_type_t v48 = sub_250E7AD38();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v106 = v50;
      *(_DWORD *)uint64_t v49 = 136446210;
      uint64_t v51 = sub_250E7B218();
      uint64_t v105 = sub_250E3FFA8(v51, v52, &v106);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250E38000, v47, v48, "[%{public}s] adding balance room to navigation stack", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v50, -1, -1);
      MEMORY[0x25338C970](v49, -1, -1);
    }

    v97(v46, v103);
    uint64_t v54 = v98;
    uint64_t v53 = v99;
    uint64_t v55 = (uint64_t)v95;
    uint64_t v56 = v104;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v95, v104, v99);
    id v57 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    id v58 = BalanceRoomViewController.init(context:)(v55);
    id v59 = objc_msgSend(v36, sel_viewControllers);
    unint64_t v60 = sub_250E7AC58();

    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      id v61 = (id)sub_250E7B068();
      swift_bridgeObjectRelease();
      if (v61) {
        goto LABEL_18;
      }
    }
    else
    {
      id v61 = *(id *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v61)
      {
LABEL_18:
        if ((v60 & 0xC000000000000001) != 0)
        {
          id v62 = (id)MEMORY[0x25338C100](0, v60);
        }
        else
        {
          if (!*(void *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_43;
          }
          id v62 = *(id *)(v60 + 32);
        }
        unint64_t v63 = v62;
        swift_bridgeObjectRelease();
        uint64_t v106 = MEMORY[0x263F8EE78];
        if (v63)
        {
          id v64 = v58;
          id v61 = v63;
          MEMORY[0x25338BD90]();
          if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          {
LABEL_23:
            sub_250E7AC88();
            sub_250E7AC68();
LABEL_36:
            id v74 = v58;
            MEMORY[0x25338BD90]();
            if (*(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_250E7AC78();
            }
            sub_250E7AC88();
            sub_250E7AC68();

            id v85 = (void *)sub_250E7AC48();
            swift_bridgeObjectRelease();
            objc_msgSend(v36, sel_setViewControllers_animated_, v85, 0);

            uint64_t v75 = v96;
LABEL_39:
            uint64_t v34 = (void *)v101;
            goto LABEL_40;
          }
LABEL_43:
          sub_250E7AC78();
          goto LABEL_23;
        }
LABEL_35:
        id v84 = v58;
        id v61 = 0;
        goto LABEL_36;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v106 = MEMORY[0x263F8EE78];
    goto LABEL_35;
  }
  unint64_t v65 = v93;
  sub_250E7A858();
  unint64_t v66 = sub_250E7A878();
  os_log_type_t v67 = sub_250E7AD38();
  if (os_log_type_enabled(v66, v67))
  {
    uint64_t v68 = (uint8_t *)swift_slowAlloc();
    uint64_t v69 = swift_slowAlloc();
    uint64_t v106 = v69;
    *(_DWORD *)uint64_t v68 = 136446210;
    uint64_t v70 = sub_250E7B218();
    uint64_t v105 = sub_250E3FFA8(v70, v71, &v106);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v66, v67, "[%{public}s] showing balance room", v68, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v69, -1, -1);
    MEMORY[0x25338C970](v68, -1, -1);
  }

  v97(v65, v103);
  uint64_t v54 = v98;
  uint64_t v53 = v99;
  uint64_t v72 = (uint64_t)v95;
  uint64_t v56 = v104;
  (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v95, v104, v99);
  id v73 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
  id v74 = BalanceRoomViewController.init(context:)(v72);
  uint64_t v75 = v96;
  os_unfair_lock_lock(v96 + 6);
  id v76 = *(id *)&v75[4]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v75 + 6);
  objc_msgSend(v34, sel_showViewController_sender_, v74, v76);

LABEL_40:
  uint64_t v86 = v75 + 6;
  id v87 = v74;
  os_unfair_lock_lock(v75 + 6);
  id v88 = *(id *)&v75[4]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v86);
  objc_msgSend(v87, sel_restoreUserActivityState_, v88);

  (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v53);
  return v87;
}

void sub_250E524B0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v40 = a2;
  uint64_t v5 = sub_250E799E8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v41 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_250E7A3D8();
  uint64_t v8 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_250E7A888();
  uint64_t v11 = *(void *)(v38 - 8);
  MEMORY[0x270FA5388](v38);
  uint64_t v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v14 = sub_250E7A878();
  os_log_type_t v15 = sub_250E7AD38();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v34 = v6;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v35 = v5;
    uint64_t v17 = (uint8_t *)v16;
    uint64_t v18 = swift_slowAlloc();
    id v37 = a1;
    uint64_t v19 = v18;
    uint64_t v43 = v18;
    uint64_t v36 = a3;
    *(_DWORD *)uint64_t v17 = 136446210;
    uint64_t v33 = v17 + 4;
    uint64_t v20 = sub_250E7B218();
    uint64_t v42 = sub_250E3FFA8(v20, v21, &v43);
    a3 = v36;
    sub_250E7AE88();
    uint64_t v6 = v34;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v14, v15, "[%{public}s] presenting balance onboarding", v17, 0xCu);
    swift_arrayDestroy();
    uint64_t v22 = v19;
    a1 = v37;
    MEMORY[0x25338C970](v22, -1, -1);
    os_log_type_t v23 = v17;
    uint64_t v5 = v35;
    MEMORY[0x25338C970](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v38);
  uint64_t v24 = v40 + *(void *)(*MEMORY[0x263F8DD00] + *(void *)v40 + 16);
  uint64_t v25 = (os_unfair_lock_s *)(v40 + ((*(unsigned int *)(*(void *)v40 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v25);
  uint64_t v26 = v39;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v24, v39);
  os_unfair_lock_unlock(v25);
  uint64_t v27 = sub_250E7A3A8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v26);
  unint64_t v28 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v41, a3, v5);
  sub_250E749A4(v28, (char *)&v43);
  char v29 = v43;
  os_log_type_t v30 = (objc_class *)type metadata accessor for BalanceOnboardingNavigationController();
  uint64_t v31 = objc_allocWithZone(v30);
  *(void *)&v31[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(void *)&v31[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = v27;
  v31[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v29;
  v44.receiver = v31;
  v44.super_class = v30;
  id v32 = objc_msgSendSuper2(&v44, sel_initWithNibName_bundle_, 0, 0);
  sub_250E74088();
  sub_250E7619C();
  swift_release();
  objc_msgSend(v32, sel_setModalPresentationStyle_, 2);
  objc_msgSend(a1, sel_presentViewController_animated_completion_, v32, 1, 0);
}

uint64_t sub_250E5292C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E7ACF8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_250E7ACE8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_250E52E34(a1, &qword_269B0C9C0, MEMORY[0x263F8F520]);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_250E7ACB8();
    sub_250E7A5B8();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_250E52AEC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_250E52BC8;
  return v6(a1);
}

uint64_t sub_250E52BC8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_250E52CC0()
{
  return sub_250E52D08((unint64_t *)&qword_269B0CC80, (void (*)(uint64_t))type metadata accessor for HealthBalanceAppDelegate);
}

uint64_t sub_250E52D08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E52D50()
{
  return type metadata accessor for HealthBalanceAppDelegate();
}

uint64_t sub_250E52D58()
{
  uint64_t result = sub_250E79A18();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HealthBalanceAppDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthBalanceAppDelegate);
}

uint64_t dispatch thunk of HealthBalanceAppDelegate.open(_:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x58))();
}

uint64_t sub_250E52E34(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  sub_250E534AC(0, a2, a3, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_250E52EA4()
{
  if (!qword_269B0C9D0)
  {
    sub_250E40A50(255, &qword_269B0C9D8);
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_250E7AFE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0C9D0);
    }
  }
}

void sub_250E52F1C()
{
  if (!qword_269B0C9E0)
  {
    sub_250E7A3D8();
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_250E7AFE8();
    if (!v1) {
      atomic_store(v0, &qword_269B0C9E0);
    }
  }
}

uint64_t sub_250E52F84()
{
  uint64_t v1 = sub_250E799B8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = sub_250E799E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v5 + v8 + 8) & ~v8;
  uint64_t v12 = v3 | v8 | 7;
  unint64_t v10 = ((*(void *)(v7 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  sub_250E7A5B8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return MEMORY[0x270FA0238](v0, v10, v12);
}

uint64_t sub_250E53118(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_250E799B8() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v8 = *(void *)(sub_250E799E8() - 8);
  unint64_t v9 = (v7 + *(unsigned __int8 *)(v8 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v1 + 16);
  uint64_t v11 = *(void *)(v1 + 24);
  uint64_t v12 = *(void *)(v1 + v6);
  uint64_t v13 = *(void *)(v1 + v7);
  uint64_t v14 = v1 + v5;
  uint64_t v15 = v1 + v9;
  uint64_t v16 = *(void *)(v1 + ((*(void *)(v8 + 64) + v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v17;
  *uint64_t v17 = v2;
  v17[1] = sub_250E532C8;
  return sub_250E50E48(a1, v10, v11, v14, v12, v13, v15, v16);
}

uint64_t sub_250E532C8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_250E533BC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250E533F4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_250E532C8;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269B0C9F8 + dword_269B0C9F8);
  return v6(a1, v4);
}

void sub_250E534AC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_250E53510()
{
  unint64_t result = qword_269B0CA20;
  if (!qword_269B0CA20)
  {
    sub_250E534AC(255, &qword_269B0CA18, MEMORY[0x263F43B50], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CA20);
  }
  return result;
}

uint64_t sub_250E53598(uint64_t a1, uint64_t a2)
{
  sub_250E534AC(0, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for AboutBalanceArticleDataProvider()
{
  return &type metadata for AboutBalanceArticleDataProvider;
}

unint64_t sub_250E53640()
{
  return 0xD00000000000002ELL;
}

uint64_t sub_250E53678(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_250E7B188();
  swift_bridgeObjectRetain();
  sub_250E7AC08();
  uint64_t v8 = sub_250E7B1A8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_250E7B148() & 1) != 0)
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
      if (v19 || (sub_250E7B148() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_250E54008(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_250E53828(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_250E40864();
    uint64_t v2 = sub_250E7AF58();
    uint64_t v14 = v2;
    sub_250E7AEF8();
    if (sub_250E7AF28())
    {
      sub_250E40BA4();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_250E53A0C();
          uint64_t v2 = v14;
        }
        uint64_t result = sub_250E7AE48();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_250E7AF28());
    }
    swift_release();
  }
  else
  {
    sub_250E7A5B8();
    return MEMORY[0x263F8EE88];
  }
  return v2;
}

uint64_t sub_250E53A0C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_250E40864();
  uint64_t v3 = sub_250E7AF48();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
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
                  *unint64_t v6 = -1 << v27;
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
      uint64_t result = sub_250E7AE48();
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

uint64_t sub_250E53CA8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_250E55AD4();
  uint64_t v3 = sub_250E7AF48();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    os_log_type_t v30 = (void *)(v2 + 56);
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
                  *os_log_type_t v30 = -1 << v29;
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
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_250E7B188();
      sub_250E7AC08();
      uint64_t result = sub_250E7B1A8();
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
  *uint64_t v1 = v4;
  return result;
}

unint64_t sub_250E53F84(uint64_t a1, uint64_t a2)
{
  sub_250E7AE48();
  unint64_t result = sub_250E7AEE8();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t sub_250E54008(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_250E53CA8();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (uint64_t)sub_250E5434C();
      goto LABEL_22;
    }
    sub_250E54774();
  }
  uint64_t v11 = *v4;
  sub_250E7B188();
  sub_250E7AC08();
  unint64_t result = sub_250E7B1A8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (unint64_t result = sub_250E7B148(), (result & 1) != 0))
    {
LABEL_21:
      unint64_t result = sub_250E7B158();
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
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          unint64_t result = sub_250E7B148();
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
  *uint64_t v21 = v8;
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

id sub_250E541A4()
{
  uint64_t v1 = v0;
  sub_250E40864();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250E7AF38();
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

void *sub_250E5434C()
{
  uint64_t v1 = v0;
  sub_250E55AD4();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_250E7AF38();
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
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

uint64_t sub_250E544FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_250E40864();
  uint64_t v3 = sub_250E7AF48();
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
    uint64_t result = sub_250E7AE48();
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

uint64_t sub_250E54774()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_250E55AD4();
  uint64_t v3 = sub_250E7AF48();
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
    id v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_250E7B188();
    swift_bridgeObjectRetain();
    sub_250E7AC08();
    uint64_t result = sub_250E7B1A8();
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

uint64_t sub_250E54A20()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  return sub_250E7ABB8();
}

uint64_t sub_250E54B6C()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  return sub_250E7ABB8();
}

uint64_t sub_250E54CB8()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  return sub_250E7ABB8();
}

id sub_250E54E04()
{
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_250E7AB78();
  id v3 = objc_msgSend(self, sel_imageNamed_inBundle_withConfiguration_, v2, v1, 0);

  if (v3) {
    return v3;
  }
  id v5 = objc_allocWithZone(MEMORY[0x263F827E8]);
  return objc_msgSend(v5, sel_init);
}

uint64_t sub_250E54EF0()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v2 = (char *)&v99 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_250E7AB68();
  MEMORY[0x270FA5388](v3 - 8);
  sub_250E55A7C();
  uint64_t v4 = sub_250E7A028();
  uint64_t v111 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 72);
  uint64_t v8 = swift_allocObject();
  uint64_t v100 = v8;
  *(_OWORD *)(v8 + 16) = xmmword_250E7C6E0;
  unint64_t v9 = v8 + v6;
  id v10 = sub_250E54E04();
  unint64_t v11 = v9;
  *(void *)unint64_t v9 = v10;
  *(unsigned char *)(v9 + 8) = 0;
  uint64_t v12 = *MEMORY[0x263F42AB8];
  unint64_t v13 = *(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 104);
  uint64_t v110 = v5 + 104;
  unint64_t v14 = v11;
  v13(v11, v12, v4);
  unint64_t v15 = v13;
  uint64_t v106 = v13;
  int64_t v16 = (uint64_t *)(v14 + v7);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  int64_t v18 = self;
  id v112 = v18;
  id v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  unint64_t v108 = 0x8000000250E7ED10;
  uint64_t v101 = v2;
  *int64_t v16 = sub_250E7ABB8();
  v16[1] = v20;
  uint64_t v21 = v111;
  v15(v14 + v7, *MEMORY[0x263F42AC0], v111);
  uint64_t v103 = 2 * v7;
  uint64_t v104 = v7;
  unint64_t v22 = v14 + 2 * v7;
  unint64_t v109 = v14;
  sub_250E7AAF8();
  id v23 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)unint64_t v22 = sub_250E7ABB8();
  *(void *)(v22 + 8) = v24;
  *(unsigned char *)(v22 + 16) = 0;
  unsigned int v105 = *MEMORY[0x263F42AE0];
  uint64_t v25 = v105;
  unint64_t v26 = v106;
  v106(v22, v105, v21);
  unint64_t v27 = v14 + v103 + v7;
  sub_250E7AAF8();
  id v28 = v112;
  uint64_t v29 = ObjCClassFromMetadata;
  uint64_t v107 = ObjCClassFromMetadata;
  id v30 = objc_msgSend(v112, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)unint64_t v27 = sub_250E7ABB8();
  *(void *)(v27 + 8) = v31;
  *(unsigned char *)(v27 + 16) = 0;
  uint64_t v32 = v111;
  v26(v27, v25, v111);
  uint64_t v33 = v26;
  uint64_t v34 = v104;
  uint64_t v103 = 4 * v104;
  unint64_t v35 = v109;
  unint64_t v36 = v109 + 4 * v104;
  sub_250E7AAF8();
  id v37 = objc_msgSend(v28, sel_bundleForClass_, v29);
  sub_250E79948();
  *(void *)unint64_t v36 = sub_250E7ABB8();
  *(void *)(v36 + 8) = v38;
  *(unsigned char *)(v36 + 16) = 0;
  v33(v35 + 4 * v34, v105, v32);
  uint64_t v39 = (void (*)(uint64_t *))v33;
  uint64_t v40 = (uint64_t *)(v35 + v103 + v34);
  sub_250E7AAF8();
  id v41 = v112;
  uint64_t v42 = v107;
  id v43 = objc_msgSend(v112, sel_bundleForClass_, v107);
  sub_250E79948();
  *uint64_t v40 = sub_250E7ABB8();
  v40[1] = v44;
  v40[2] = 0;
  LODWORD(v103) = *MEMORY[0x263F42A80];
  uint64_t v45 = v111;
  v39(v40);
  uint64_t v46 = v104;
  unint64_t v47 = v109 + 6 * v104;
  sub_250E7AAF8();
  id v48 = objc_msgSend(v41, sel_bundleForClass_, v42);
  sub_250E79948();
  *(void *)unint64_t v47 = sub_250E7ABB8();
  *(void *)(v47 + 8) = v49;
  *(unsigned char *)(v47 + 16) = 0;
  uint64_t v50 = v105;
  v106(v47, v105, v45);
  uint64_t v102 = 8 * v46;
  unint64_t v51 = v109;
  unint64_t v52 = v109 + 7 * v46;
  sub_250E7AAF8();
  uint64_t v53 = v107;
  id v54 = objc_msgSend(v112, sel_bundleForClass_, v107);
  sub_250E79948();
  *(void *)unint64_t v52 = sub_250E7ABB8();
  *(void *)(v52 + 8) = v55;
  *(unsigned char *)(v52 + 16) = 0;
  uint64_t v56 = v106;
  v106(v51 + 7 * v46, v50, v111);
  id v57 = (uint64_t *)(v51 + v102);
  sub_250E7AAF8();
  id v58 = objc_msgSend(v112, sel_bundleForClass_, v53);
  sub_250E79948();
  *id v57 = sub_250E7ABB8();
  v57[1] = v59;
  v57[2] = 0;
  uint64_t v60 = v111;
  v56((unint64_t)v57, v103, v111);
  uint64_t v61 = v104;
  unint64_t v62 = v109;
  unint64_t v63 = v109 + v102 + v104;
  sub_250E7AAF8();
  id v64 = v112;
  id v65 = objc_msgSend(v112, sel_bundleForClass_, v107);
  sub_250E79948();
  *(void *)unint64_t v63 = sub_250E7ABB8();
  *(void *)(v63 + 8) = v66;
  *(unsigned char *)(v63 + 16) = 0;
  uint64_t v67 = v105;
  uint64_t v68 = v106;
  v106(v63, v105, v60);
  unint64_t v69 = v62 + 10 * v61;
  sub_250E7AAF8();
  uint64_t v70 = v107;
  id v71 = objc_msgSend(v64, sel_bundleForClass_, v107);
  sub_250E79948();
  *(void *)unint64_t v69 = sub_250E7ABB8();
  *(void *)(v69 + 8) = v72;
  *(unsigned char *)(v69 + 16) = 0;
  uint64_t v73 = v67;
  uint64_t v74 = v111;
  v68(v69, v73, v111);
  unint64_t v75 = v109;
  id v76 = (uint64_t *)(v109 + 11 * v61);
  sub_250E7AAF8();
  id v77 = objc_msgSend(v112, sel_bundleForClass_, v70);
  sub_250E79948();
  *id v76 = sub_250E7ABB8();
  v76[1] = v78;
  v76[2] = 0;
  os_log_type_t v79 = v106;
  v106(v75 + 11 * v61, v103, v74);
  unint64_t v80 = v75 + 12 * v61;
  sub_250E7AAF8();
  id v81 = v112;
  id v82 = objc_msgSend(v112, sel_bundleForClass_, v107);
  sub_250E79948();
  *(void *)unint64_t v80 = sub_250E7ABB8();
  *(void *)(v80 + 8) = v83;
  *(unsigned char *)(v80 + 16) = 0;
  uint64_t v84 = v105;
  v79(v80, v105, v74);
  unint64_t v85 = v109;
  uint64_t v86 = v104;
  unint64_t v87 = v109 + 13 * v104;
  sub_250E7AAF8();
  id v88 = v81;
  uint64_t v89 = v107;
  id v90 = objc_msgSend(v88, sel_bundleForClass_, v107);
  sub_250E79948();
  *(void *)unint64_t v87 = sub_250E7ABB8();
  *(void *)(v87 + 8) = v91;
  *(unsigned char *)(v87 + 16) = 0;
  uint64_t v92 = v84;
  uint64_t v93 = v84;
  uint64_t v94 = v111;
  v79(v85 + 13 * v86, v93, v111);
  unint64_t v95 = v85 + 14 * v86;
  sub_250E7AAF8();
  id v96 = objc_msgSend(v112, sel_bundleForClass_, v89);
  sub_250E79948();
  *(void *)unint64_t v95 = sub_250E7ABB8();
  *(void *)(v95 + 8) = v97;
  *(unsigned char *)(v95 + 16) = 0;
  v79(v95, v92, v94);
  return v100;
}

void sub_250E55A7C()
{
  if (!qword_269B0CA30)
  {
    sub_250E7A028();
    unint64_t v0 = sub_250E7B138();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0CA30);
    }
  }
}

void sub_250E55AD4()
{
  if (!qword_269B0CA38)
  {
    unint64_t v0 = sub_250E7AF78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0CA38);
    }
  }
}

uint64_t HealthBalancePluginDelegate.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HealthBalancePluginDelegate.deinit()
{
  return v0;
}

uint64_t HealthBalancePluginDelegate.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

unint64_t sub_250E55B5C()
{
  unint64_t result = qword_26B20BD38;
  if (!qword_26B20BD38)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20BD38);
  }
  return result;
}

unint64_t sub_250E55BB4()
{
  unint64_t result = qword_26B20BD40;
  if (!qword_26B20BD40)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20BD40);
  }
  return result;
}

unint64_t sub_250E55C14()
{
  unint64_t result = qword_26B20BD98;
  if (!qword_26B20BD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BD98);
  }
  return result;
}

uint64_t method lookup function for HealthBalancePluginDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for HealthBalancePluginDelegate);
}

uint64_t dispatch thunk of HealthBalancePluginDelegate.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of HealthBalancePluginDelegate.makeGeneratorPipelines(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t sub_250E55CB8(void *a1)
{
  id v37 = a1;
  uint64_t v35 = sub_250E79D78();
  v32[0] = *(void *)(v35 - 8);
  MEMORY[0x270FA5388](v35);
  unint64_t v36 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_250E79D18();
  uint64_t v3 = *(void *)(v34 - 8);
  MEMORY[0x270FA5388](v34);
  uint64_t v5 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E79D38();
  uint64_t v33 = *(void *)(v6 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)v32 - v10;
  uint64_t v12 = *(void **)v1;
  unint64_t v13 = *(void **)(v1 + 8);
  int v14 = *(unsigned __int8 *)(v1 + 16);
  LOBYTE(v38) = *(unsigned char *)(v1 + 16);
  v32[1] = sub_250E74DD0();
  uint64_t v15 = *MEMORY[0x263F097E0];
  id v16 = objc_allocWithZone(MEMORY[0x263F75DE0]);
  id v17 = v12;
  id v18 = v13;
  id v19 = objc_msgSend(v16, sel_initWithFeatureIdentifier_sleepStore_, v15, v17);
  sub_250E56118();
  LOBYTE(v16) = sub_250E7AE08();

  uint64_t v20 = (unsigned int *)MEMORY[0x263F75FE0];
  if ((v16 & 1) == 0) {
    uint64_t v20 = (unsigned int *)MEMORY[0x263F75FD8];
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v20, v34);
  uint64_t v21 = v6;
  uint64_t v22 = v33;

  sub_250E79D28();
  id v23 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  uint64_t v34 = (uint64_t)v9;
  v23(v9, v11, v21);
  if (v14 && v14 != 3)
  {
    sub_250E56224(0, &qword_269B0CA60, MEMORY[0x263F8E0F8]);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_250E7BB70;
    id v28 = v18;
    id v29 = v17;
    id v30 = v37;
    sub_250E79D68();
    uint64_t v38 = v27;
    sub_250E56158();
    sub_250E56224(0, &qword_269B0CA50, MEMORY[0x263F8D488]);
    sub_250E561B0();
  }
  else
  {
    uint64_t v38 = MEMORY[0x263F8EE78];
    sub_250E56158();
    sub_250E56224(0, &qword_269B0CA50, MEMORY[0x263F8D488]);
    sub_250E561B0();
    id v24 = v18;
    id v25 = v17;
    id v26 = v37;
  }
  sub_250E7AED8();
  sub_250E79D88();
  sub_250E79D58();
  sub_250E79D48();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v11, v21);
}

unint64_t sub_250E56118()
{
  unint64_t result = qword_269B0CA40;
  if (!qword_269B0CA40)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0CA40);
  }
  return result;
}

unint64_t sub_250E56158()
{
  unint64_t result = qword_269B0CA48;
  if (!qword_269B0CA48)
  {
    sub_250E79D78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CA48);
  }
  return result;
}

unint64_t sub_250E561B0()
{
  unint64_t result = qword_269B0CA58;
  if (!qword_269B0CA58)
  {
    sub_250E56224(255, &qword_269B0CA50, MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CA58);
  }
  return result;
}

void sub_250E56224(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_250E79D78();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_250E56284(uint64_t a1)
{
  uint64_t v33 = a1;
  uint64_t v31 = sub_250E79D78();
  v27[1] = *(void *)(v31 - 8);
  MEMORY[0x270FA5388](v31);
  uint64_t v32 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v30 = (void *)sub_250E79D18();
  uint64_t v3 = *(v30 - 1);
  MEMORY[0x270FA5388](v30);
  uint64_t v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_250E79D38();
  uint64_t v6 = *(void *)(v28 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v28);
  unint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)v27 - v10;
  uint64_t v12 = *(void **)v1;
  unint64_t v13 = *(void **)(v1 + 8);
  int v29 = *(unsigned __int8 *)(v1 + 16);
  LOBYTE(v34) = v29;
  v27[2] = sub_250E74DD0();
  uint64_t v14 = *MEMORY[0x263F097E0];
  id v15 = objc_allocWithZone(MEMORY[0x263F75DE0]);
  id v16 = v12;
  id v17 = v13;
  uint64_t v18 = v6;
  id v19 = v17;
  id v20 = objc_msgSend(v15, sel_initWithFeatureIdentifier_sleepStore_, v14, v16);
  sub_250E56118();
  LOBYTE(v15) = sub_250E7AE08();

  uint64_t v21 = (unsigned int *)MEMORY[0x263F75FE0];
  if ((v15 & 1) == 0) {
    uint64_t v21 = (unsigned int *)MEMORY[0x263F75FD8];
  }
  (*(void (**)(char *, void, void *))(v3 + 104))(v5, *v21, v30);
  uint64_t v22 = v28;

  sub_250E79D28();
  id v23 = objc_allocWithZone(MEMORY[0x263F46858]);
  id v30 = v19;
  id v24 = v16;
  objc_msgSend(v23, sel_init);
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v9, v11, v22);
  if (v29 && v29 != 3)
  {
    sub_250E56224(0, &qword_269B0CA60, MEMORY[0x263F8E0F8]);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_250E7BB70;
    sub_250E79D68();
    uint64_t v34 = v25;
  }
  else
  {
    uint64_t v34 = MEMORY[0x263F8EE78];
  }
  sub_250E56158();
  sub_250E56224(0, &qword_269B0CA50, MEMORY[0x263F8D488]);
  sub_250E561B0();
  sub_250E7AED8();
  sub_250E79D88();
  sub_250E79D58();
  sub_250E79D48();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v11, v22);
}

void sub_250E566AC()
{
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_imageNamed_inBundle_, v3, v2);

  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v4);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v5, sel_setContentMode_, 1);
  id v6 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v6, sel_addSubview_, v5);

  id v7 = objc_msgSend(v0, sel_contentView);
  id v8 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v8);

  sub_250E40704();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_250E7C820;
  id v10 = objc_msgSend(v5, sel_leadingAnchor);
  id v11 = objc_msgSend(v0, sel_contentView);
  id v12 = objc_msgSend(v11, sel_leadingAnchor);

  id v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
  *(void *)(v9 + 32) = v13;
  id v14 = objc_msgSend(v5, sel_trailingAnchor);
  id v15 = objc_msgSend(v0, sel_contentView);
  id v16 = objc_msgSend(v15, sel_trailingAnchor);

  id v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(void *)(v9 + 40) = v17;
  id v18 = objc_msgSend(v5, sel_topAnchor);
  id v19 = objc_msgSend(v0, sel_contentView);
  id v20 = objc_msgSend(v19, sel_topAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(void *)(v9 + 48) = v21;
  id v22 = objc_msgSend(v5, sel_bottomAnchor);
  id v23 = objc_msgSend(v0, sel_contentView);
  id v24 = objc_msgSend(v23, sel_bottomAnchor);

  id v25 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v24, -9.0);
  *(void *)(v9 + 56) = v25;
  id v26 = objc_msgSend(v5, sel_heightAnchor);
  id v27 = objc_msgSend(v0, sel_view);
  if (v27)
  {
    uint64_t v28 = v27;
    int v29 = self;
    id v30 = objc_msgSend(v28, sel_heightAnchor);

    id v31 = objc_msgSend(v26, sel_constraintEqualToAnchor_multiplier_, v30, 0.22);
    *(void *)(v9 + 64) = v31;
    sub_250E7AC68();
    sub_250E56B50();
    id v32 = (id)sub_250E7AC48();
    swift_bridgeObjectRelease();
    objc_msgSend(v29, sel_activateConstraints_, v32);
  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_250E56B50()
{
  unint64_t result = qword_269B0C8C0;
  if (!qword_269B0C8C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0C8C0);
  }
  return result;
}

void sub_250E56B90()
{
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(self, sel_imageNamed_inBundle_, v3, v2);

  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_initWithImage_, v4);
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v5, sel_setContentMode_, 2);
  id v6 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v6, sel_addSubview_, v5);

  id v7 = objc_msgSend(v0, sel_contentView);
  id v8 = objc_msgSend(self, sel_clearColor);
  objc_msgSend(v7, sel_setBackgroundColor_, v8);

  sub_250E40704();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_250E7C820;
  id v10 = objc_msgSend(v5, sel_leadingAnchor);
  id v11 = objc_msgSend(v0, sel_contentView);
  id v12 = objc_msgSend(v11, sel_leadingAnchor);

  id v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
  *(void *)(v9 + 32) = v13;
  id v14 = objc_msgSend(v5, sel_trailingAnchor);
  id v15 = objc_msgSend(v0, sel_contentView);
  id v16 = objc_msgSend(v15, sel_trailingAnchor);

  id v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(void *)(v9 + 40) = v17;
  id v18 = objc_msgSend(v5, sel_topAnchor);
  id v19 = objc_msgSend(v0, sel_contentView);
  id v20 = objc_msgSend(v19, sel_topAnchor);

  id v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(void *)(v9 + 48) = v21;
  id v22 = objc_msgSend(v5, sel_heightAnchor);
  id v23 = objc_msgSend(v0, sel_view);
  if (v23)
  {
    id v24 = v23;
    id v25 = self;
    id v26 = objc_msgSend(v24, sel_heightAnchor);

    id v27 = objc_msgSend(v22, sel_constraintEqualToAnchor_multiplier_, v26, 0.3);
    *(void *)(v9 + 56) = v27;
    id v28 = objc_msgSend(v5, sel_bottomAnchor);
    id v29 = objc_msgSend(v0, sel_contentView);
    id v30 = objc_msgSend(v29, sel_bottomAnchor);

    id v31 = objc_msgSend(v28, sel_constraintEqualToAnchor_constant_, v30, 35.0);
    *(void *)(v9 + 64) = v31;
    sub_250E7AC68();
    sub_250E56B50();
    id v32 = (id)sub_250E7AC48();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_activateConstraints_, v32);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_250E57040()
{
  uint64_t v1 = sub_250E79A88();
  sub_250E7AC18();
  sub_250E7B218();
  sub_250E7AC18();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_250E570A4()
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v1 = sub_250E7A2C8();
  uint64_t v38 = *(void *)(v1 - 8);
  uint64_t v39 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_250E7A518();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_250E7A888();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  id v12 = v0;
  id v13 = sub_250E7A878();
  os_log_type_t v14 = sub_250E7AD38();
  int v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v40 = v5;
    uint64_t v17 = v16;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v41 = v36;
    *(_DWORD *)uint64_t v17 = 136446722;
    int v34 = v15;
    uint64_t v18 = sub_250E7B218();
    uint64_t ObjectType = v8;
    v43[0] = sub_250E3FFA8(v18, v19, &v41);
    uint64_t v35 = v9;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2082;
    v43[0] = sub_250E3FFA8(0x2928706154646964, 0xE800000000000000, &v41);
    sub_250E7AE88();
    *(_WORD *)(v17 + 22) = 2082;
    uint64_t v33 = v17 + 24;
    sub_250E7A5F8();
    sub_250E7A4E8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(v43, v44);
    sub_250E7A498();
    sub_250E579CC((unint64_t *)&qword_269B0CA68, MEMORY[0x263F43C08]);
    uint64_t v20 = v39;
    uint64_t v21 = sub_250E7B128();
    unint64_t v23 = v22;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v3, v20);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
    v43[0] = sub_250E3FFA8(v21, v23, &v41);
    sub_250E7AE88();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v13, (os_log_type_t)v34, "[%{public}s.%{public}s] promo tile tapped from %{public}s", (uint8_t *)v17, 0x20u);
    uint64_t v24 = v36;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v24, -1, -1);
    uint64_t v25 = v17;
    uint64_t v5 = v40;
    MEMORY[0x25338C970](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v11, ObjectType);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  sub_250E7A5F8();
  sub_250E7A4E8();
  id v26 = *(void (**)(char *, uint64_t))(v5 + 8);
  v26(v7, v4);
  __swift_project_boxed_opaque_existential_1(v43, v44);
  sub_250E7A498();
  sub_250E750D0((uint64_t)v3, (char *)&v41);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  char v27 = v41;
  sub_250E7A5F8();
  sub_250E7A4E8();
  v26(v7, v4);
  __swift_project_boxed_opaque_existential_1(v43, v44);
  uint64_t v28 = sub_250E7A488();
  id v29 = (objc_class *)type metadata accessor for BalanceOnboardingNavigationController();
  id v30 = objc_allocWithZone(v29);
  *(void *)&v30[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(void *)&v30[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = v28;
  v30[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v27;
  v42.receiver = v30;
  v42.super_class = v29;
  id v31 = objc_msgSendSuper2(&v42, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  sub_250E74088();
  sub_250E7619C();
  swift_release();
  objc_msgSend(v31, sel_setModalPresentationStyle_, 2);
  sub_250E7A5F8();
  id v32 = (void *)sub_250E7A4F8();
  v26(v7, v4);
  objc_msgSend(v32, sel_presentViewController_animated_completion_, v31, 1, 0);
}

uint64_t BalancePromotionFeedItemViewActionHandler.__allocating_init(context:)(uint64_t a1)
{
  uint64_t v3 = sub_250E7A518();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_250E7A608();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

uint64_t BalancePromotionFeedItemViewActionHandler.init(context:)(uint64_t a1)
{
  uint64_t v2 = sub_250E7A518();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  uint64_t v5 = sub_250E7A608();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v5;
}

id BalancePromotionFeedItemViewActionHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalancePromotionFeedItemViewActionHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalancePromotionFeedItemViewActionHandler()
{
  uint64_t result = qword_26B20BDC0;
  if (!qword_26B20BDC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_250E5793C()
{
  return sub_250E579CC((unint64_t *)&qword_26B20BDB8, (void (*)(uint64_t))type metadata accessor for BalancePromotionFeedItemViewActionHandler);
}

uint64_t sub_250E57984()
{
  return sub_250E579CC(&qword_26B20BD48, MEMORY[0x263F43E20]);
}

uint64_t sub_250E579CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E57A14()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for BalancePromotionFeedItemViewActionHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BalancePromotionFeedItemViewActionHandler);
}

uint64_t dispatch thunk of BalancePromotionFeedItemViewActionHandler.didTap()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0)
                              + class metadata base offset for BalancePromotionFeedItemViewActionHandler))();
}

uint64_t sub_250E57ABC()
{
  return type metadata accessor for BalancePromotionFeedItemViewActionHandler();
}

uint64_t sub_250E57AD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250E5C140(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_250E57AFC(uint64_t a1)
{
  unint64_t v2 = sub_250E57D20();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E57B38(uint64_t a1)
{
  unint64_t v2 = sub_250E57D20();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t SleepingSampleAnalysisHealthChecklistUserData.encode(to:)(void *a1)
{
  sub_250E5C3CC(0, &qword_269B0CA70, (uint64_t (*)(void))sub_250E57D20, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E57D20();
  sub_250E7B1D8();
  type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  sub_250E5806C(&qword_269B0CA80, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
  sub_250E7B118();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_250E57D20()
{
  unint64_t result = qword_269B0CA78;
  if (!qword_269B0CA78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CA78);
  }
  return result;
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_269B0CAB0);
}

uint64_t SleepingSampleAnalysisHealthChecklistUserData.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v3 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  MEMORY[0x270FA5388](v3);
  unint64_t v19 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5C3CC(0, &qword_269B0CA88, (uint64_t (*)(void))sub_250E57D20, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v18 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E57D20();
  uint64_t v12 = v20;
  sub_250E7B1C8();
  if (!v12)
  {
    uint64_t v13 = v18;
    sub_250E5806C(&qword_269B0CA90, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
    uint64_t v14 = (uint64_t)v19;
    sub_250E7B0E8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v6);
    sub_250E580B4(v14, (uint64_t)v11, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
    sub_250E580B4((uint64_t)v11, v17, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_269B0CAA0);
}

uint64_t sub_250E5806C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E580B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_250E5811C(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD000000000000021;
      break;
    case 4:
      unint64_t result = 0x4C52556E65706FLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_250E581C0(void *a1)
{
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E0C0];
  sub_250E5C3CC(0, &qword_269B0CAD8, (uint64_t (*)(void))sub_250E5C1D4, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  MEMORY[0x270FA5388](v3);
  id v48 = (char *)&v37 - v4;
  uint64_t v5 = sub_250E79908();
  uint64_t v53 = *(void *)(v5 - 8);
  uint64_t v54 = v5;
  MEMORY[0x270FA5388](v5);
  unint64_t v47 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5C3CC(0, &qword_269B0CAE8, (uint64_t (*)(void))sub_250E5C228, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys, v2);
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v44 = (char *)&v37 - v8;
  sub_250E5C3CC(0, &qword_269B0CAF8, (uint64_t (*)(void))sub_250E5C27C, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys, v2);
  uint64_t v42 = *(void *)(v9 - 8);
  uint64_t v43 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v41 = (char *)&v37 - v10;
  sub_250E5C3CC(0, &qword_269B0CB08, (uint64_t (*)(void))sub_250E5C2D0, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys, v2);
  uint64_t v39 = *(void *)(v11 - 8);
  uint64_t v40 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v37 - v12;
  sub_250E5C3CC(0, &qword_269B0CB18, (uint64_t (*)(void))sub_250E5C324, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys, v2);
  uint64_t v15 = v14;
  uint64_t v38 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v37 - v16;
  uint64_t v18 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5C3CC(0, &qword_269B0CB28, (uint64_t (*)(void))sub_250E5C378, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys, v2);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v51 = v21;
  uint64_t v52 = v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v37 - v23;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E5C378();
  uint64_t v26 = v53;
  uint64_t v25 = v54;
  sub_250E7B1D8();
  sub_250E5AB60(v55, (uint64_t)v20);
  switch((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v20, 4, v25))
  {
    case 1u:
      char v56 = 0;
      sub_250E5C324();
      uint64_t v32 = v51;
      sub_250E7B108();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v15);
      goto LABEL_8;
    case 2u:
      char v57 = 1;
      sub_250E5C2D0();
      uint64_t v33 = v51;
      sub_250E7B108();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v40);
      return (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v24, v33);
    case 3u:
      char v58 = 2;
      sub_250E5C27C();
      int v34 = v41;
      uint64_t v32 = v51;
      sub_250E7B108();
      uint64_t v36 = v42;
      uint64_t v35 = v43;
      goto LABEL_7;
    case 4u:
      char v59 = 3;
      sub_250E5C228();
      int v34 = v44;
      uint64_t v32 = v51;
      sub_250E7B108();
      uint64_t v36 = v45;
      uint64_t v35 = v46;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v36 + 8))(v34, v35);
LABEL_8:
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v24, v32);
      break;
    default:
      char v27 = v47;
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v47, v20, v25);
      char v60 = 4;
      sub_250E5C1D4();
      uint64_t v28 = v48;
      uint64_t v29 = v51;
      sub_250E7B108();
      sub_250E5806C(&qword_269B0CB38, MEMORY[0x263F06EA8]);
      uint64_t v30 = v50;
      sub_250E7B118();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v28, v30);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v25);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v52 + 8))(v24, v29);
      break;
  }
  return result;
}

uint64_t sub_250E58980@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E040];
  sub_250E5C3CC(0, &qword_269B0CB40, (uint64_t (*)(void))sub_250E5C1D4, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys, MEMORY[0x263F8E040]);
  uint64_t v68 = v4;
  uint64_t v60 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v67 = (char *)&v49 - v5;
  sub_250E5C3CC(0, &qword_269B0CB48, (uint64_t (*)(void))sub_250E5C228, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys, v3);
  uint64_t v58 = *(void *)(v6 - 8);
  uint64_t v59 = v6;
  MEMORY[0x270FA5388](v6);
  unint64_t v63 = (char *)&v49 - v7;
  sub_250E5C3CC(0, &qword_269B0CB50, (uint64_t (*)(void))sub_250E5C27C, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys, v3);
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v57 = v8;
  MEMORY[0x270FA5388](v8);
  unint64_t v62 = (char *)&v49 - v9;
  sub_250E5C3CC(0, &qword_269B0CB58, (uint64_t (*)(void))sub_250E5C2D0, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys, v3);
  uint64_t v54 = *(void *)(v10 - 8);
  uint64_t v55 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v61 = (char *)&v49 - v11;
  sub_250E5C3CC(0, &qword_269B0CB60, (uint64_t (*)(void))sub_250E5C324, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys, v3);
  uint64_t v52 = *(void *)(v12 - 8);
  uint64_t v53 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v66 = (char *)&v49 - v13;
  sub_250E5C3CC(0, &qword_269B0CB68, (uint64_t (*)(void))sub_250E5C378, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys, v3);
  uint64_t v15 = v14;
  uint64_t v65 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v49 - v16;
  uint64_t v18 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v49 - v22;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E5C378();
  uint64_t v24 = v69;
  sub_250E7B1C8();
  uint64_t v25 = (uint64_t)a1;
  if (v24) {
    return __swift_destroy_boxed_opaque_existential_1Tm(v25);
  }
  uint64_t v26 = v18;
  uint64_t v50 = v21;
  uint64_t v51 = v23;
  char v27 = v66;
  uint64_t v28 = v67;
  uint64_t v29 = v68;
  uint64_t v69 = v25;
  uint64_t v30 = sub_250E7B0F8();
  id v31 = (char *)v30;
  if (*(void *)(v30 + 16) != 1)
  {
    uint64_t v34 = sub_250E7AFD8();
    swift_allocError();
    uint64_t v36 = v35;
    sub_250E5C434();
    *uint64_t v36 = v26;
    sub_250E7B0D8();
    sub_250E7AFB8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v34 - 8) + 104))(v36, *MEMORY[0x263F8DCB0], v34);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v17, v15);
    uint64_t v25 = v69;
    return __swift_destroy_boxed_opaque_existential_1Tm(v25);
  }
  switch(*(unsigned char *)(v30 + 32))
  {
    case 1:
      char v71 = 1;
      sub_250E5C2D0();
      uint64_t v37 = v61;
      sub_250E7B0C8();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v37, v55);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v17, v15);
      uint64_t v38 = sub_250E79908();
      uint64_t v33 = (uint64_t)v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v51, 2, 4, v38);
      break;
    case 2:
      char v72 = 2;
      sub_250E5C27C();
      uint64_t v39 = v62;
      sub_250E7B0C8();
      (*(void (**)(char *, uint64_t))(v56 + 8))(v39, v57);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v17, v15);
      uint64_t v40 = sub_250E79908();
      uint64_t v33 = (uint64_t)v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v51, 3, 4, v40);
      break;
    case 3:
      char v73 = 3;
      sub_250E5C228();
      uint64_t v41 = v63;
      sub_250E7B0C8();
      (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v59);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v17, v15);
      uint64_t v42 = sub_250E79908();
      uint64_t v33 = (uint64_t)v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v51, 4, 4, v42);
      break;
    case 4:
      char v74 = 4;
      sub_250E5C1D4();
      sub_250E7B0C8();
      uint64_t v45 = v28;
      uint64_t v66 = v31;
      uint64_t v46 = sub_250E79908();
      sub_250E5806C(&qword_269B0CB80, MEMORY[0x263F06EA8]);
      uint64_t v47 = (uint64_t)v50;
      sub_250E7B0E8();
      uint64_t v48 = v65;
      (*(void (**)(char *, uint64_t))(v60 + 8))(v45, v29);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v15);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v46 - 8) + 56))(v47, 0, 4, v46);
      uint64_t v33 = (uint64_t)v51;
      sub_250E580B4(v47, (uint64_t)v51, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
      break;
    default:
      char v70 = 0;
      sub_250E5C324();
      sub_250E7B0C8();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v27, v53);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v65 + 8))(v17, v15);
      uint64_t v32 = sub_250E79908();
      uint64_t v33 = (uint64_t)v51;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v51, 1, 4, v32);
      break;
  }
  uint64_t v43 = v69;
  sub_250E580B4(v33, v64, type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
  return __swift_destroy_boxed_opaque_existential_1Tm(v43);
}

uint64_t sub_250E5945C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return SleepingSampleAnalysisHealthChecklistUserData.init(from:)(a1, a2);
}

uint64_t sub_250E59474(void *a1)
{
  sub_250E5C3CC(0, &qword_269B0CA70, (uint64_t (*)(void))sub_250E57D20, (uint64_t)&type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E57D20();
  sub_250E7B1D8();
  type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  sub_250E5806C(&qword_269B0CA80, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistAction);
  sub_250E7B118();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_250E59620()
{
  return sub_250E5811C(*v0);
}

uint64_t sub_250E59628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250E5CC5C(a1, a2);
  *a3 = result;
  return result;
}

void sub_250E59650(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_250E5965C(uint64_t a1)
{
  unint64_t v2 = sub_250E5C378();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E59698(uint64_t a1)
{
  unint64_t v2 = sub_250E5C378();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E596D4()
{
  return 0;
}

uint64_t sub_250E596E0(uint64_t a1)
{
  unint64_t v2 = sub_250E5C27C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E5971C(uint64_t a1)
{
  unint64_t v2 = sub_250E5C27C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E59758(uint64_t a1)
{
  unint64_t v2 = sub_250E5C228();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E59794(uint64_t a1)
{
  unint64_t v2 = sub_250E5C228();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E597D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_250E59800(uint64_t a1)
{
  unint64_t v2 = sub_250E5C324();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E5983C(uint64_t a1)
{
  unint64_t v2 = sub_250E5C324();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E59878(uint64_t a1)
{
  unint64_t v2 = sub_250E5C2D0();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E598B4(uint64_t a1)
{
  unint64_t v2 = sub_250E5C2D0();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E598F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250E5CE5C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_250E59920(uint64_t a1)
{
  unint64_t v2 = sub_250E5C1D4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E5995C(uint64_t a1)
{
  unint64_t v2 = sub_250E5C1D4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E59998@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_250E58980(a1, a2);
}

uint64_t sub_250E599B0(void *a1)
{
  return sub_250E581C0(a1);
}

void sub_250E599C8()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  unint64_t v2 = (void *)sub_250E7A888();
  uint64_t v101 = *(v2 - 1);
  id v102 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v100 = (char *)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_250E79908();
  uint64_t v98 = *(void *)(v4 - 8);
  uint64_t v99 = v4;
  MEMORY[0x270FA5388](v4);
  id v90 = (char *)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E7A2C8();
  uint64_t v94 = *(void *)(v6 - 8);
  uint64_t v95 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v92 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v93 = (char *)&v89 - v9;
  uint64_t v10 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v97 = (uint64_t)&v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_250E7A248();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v103 = v12;
  uint64_t v104 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v91 = (char *)&v89 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unsigned int v105 = (char *)&v89 - v16;
  uint64_t v17 = sub_250E7A518();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5ABC4(0, &qword_269B0C990, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v89 - v22;
  uint64_t v24 = type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData(0);
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  char v27 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A5F8();
  sub_250E5806C(&qword_269B0CA98, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  sub_250E5806C(&qword_269B0C998, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
  sub_250E7A508();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v18 + 8);
  v28(v20, v17);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_250E5AC98((uint64_t)v23, &qword_269B0C990, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
    uint64_t v29 = v100;
    sub_250E7A858();
    uint64_t v30 = sub_250E7A878();
    os_log_type_t v31 = sub_250E7AD28();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v107[0] = v33;
      *(_DWORD *)uint64_t v32 = 136315138;
      uint64_t v34 = sub_250E7B218();
      uint64_t v110 = sub_250E3FFA8(v34, v35, v107);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250E38000, v30, v31, "[%s] Could not access action handler user data", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v33, -1, -1);
      MEMORY[0x25338C970](v32, -1, -1);
    }

    (*(void (**)(char *, id))(v101 + 8))(v29, v102);
  }
  else
  {
    sub_250E580B4((uint64_t)v23, (uint64_t)v27, type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData);
    sub_250E7A5F8();
    id v102 = (id)sub_250E7A4F8();
    v28(v20, v17);
    sub_250E7A5F8();
    sub_250E7A4E8();
    v28(v20, v17);
    __swift_project_boxed_opaque_existential_1(v107, v109);
    uint64_t v100 = (char *)sub_250E7A488();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v107);
    sub_250E7A5F8();
    uint64_t v36 = v105;
    sub_250E7A108();
    v28(v20, v17);
    sub_250E79D08();
    uint64_t v101 = sub_250E79CF8();
    uint64_t v37 = v97;
    sub_250E5AB60((uint64_t)v27, v97);
    uint64_t v38 = v98;
    uint64_t v39 = v37;
    uint64_t v40 = v37;
    uint64_t v41 = v1;
    uint64_t v42 = v99;
    switch((*(unsigned int (**)(uint64_t, uint64_t))(v98 + 48))(v40, 4))
    {
      case 1u:
        uint64_t v44 = v100;
        sub_250E7A5F8();
        sub_250E7A4E8();
        v28(v20, v17);
        uint64_t v45 = v36;
        __swift_project_boxed_opaque_existential_1(v107, v109);
        uint64_t v46 = v93;
        sub_250E7A498();
        uint64_t v48 = v94;
        uint64_t v47 = v95;
        uint64_t v49 = v92;
        (*(void (**)(char *, void, uint64_t))(v94 + 104))(v92, *MEMORY[0x263F43BB0], v95);
        char v50 = sub_250E7A2B8();
        uint64_t v51 = *(void (**)(char *, uint64_t))(v48 + 8);
        v51(v49, v47);
        v51(v46, v47);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v107);
        if (v50) {
          char v52 = 3;
        }
        else {
          char v52 = 0;
        }
        uint64_t v53 = (objc_class *)type metadata accessor for BalanceOnboardingNavigationController();
        uint64_t v54 = objc_allocWithZone(v53);
        *(void *)&v54[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
        *(void *)&v54[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = v44;
        v54[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v52;
        v106.receiver = v54;
        v106.super_class = v53;
        id v55 = objc_msgSendSuper2(&v106, sel_initWithNibName_bundle_, 0, 0);
        sub_250E74088();
        sub_250E7619C();
        swift_release();
        objc_msgSend(v55, sel_setModalPresentationStyle_, 2);
        id v56 = v102;
        objc_msgSend(v102, sel_presentViewController_animated_completion_, v55, 1, 0);
        swift_release();

        (*(void (**)(char *, uint64_t))(v104 + 8))(v45, v103);
        goto LABEL_18;
      case 2u:
        id v57 = objc_allocWithZone(MEMORY[0x263F75EA8]);
        uint64_t v58 = v100;
        uint64_t v59 = (uint64_t)v27;
        uint64_t v60 = (void *)sub_250E7AB78();
        id v61 = objc_msgSend(v57, sel_initWithIdentifier_healthStore_, v60, v58);

        unint64_t v62 = v58;
        id v63 = v61;
        sub_250E7A5F8();
        sub_250E7A4E8();
        v28(v20, v17);
        __swift_project_boxed_opaque_existential_1(v107, v109);
        uint64_t v64 = v93;
        sub_250E7A498();
        uint64_t v66 = v94;
        uint64_t v65 = v95;
        uint64_t v67 = v92;
        (*(void (**)(char *, void, uint64_t))(v94 + 104))(v92, *MEMORY[0x263F43BB0], v95);
        LOBYTE(v61) = sub_250E7A2B8();
        uint64_t v68 = *(void (**)(char *, uint64_t))(v66 + 8);
        v68(v67, v65);
        v68(v64, v65);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v107);
        if (v61) {
          char v69 = 3;
        }
        else {
          char v69 = 0;
        }
        v107[0] = (uint64_t)v63;
        v107[1] = (uint64_t)v62;
        char v108 = v69;
        id v70 = v102;
        sub_250E56284((uint64_t)v102);
        swift_release();

        (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v103);
        sub_250E4F39C(v59);

        return;
      case 3u:
        char v71 = v36;
        uint64_t v72 = v41;
        uint64_t v74 = v103;
        uint64_t v73 = v104;
        unint64_t v75 = v91;
        (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v91, v71, v103);
        id v76 = objc_allocWithZone((Class)type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController(0));
        uint64_t v77 = swift_retain();
        id v78 = sub_250E6BBE8(v77, v75, 0);
        id v79 = v102;
        objc_msgSend(v102, sel_showAdaptively_sender_, v78, v72);
        swift_release();

        (*(void (**)(char *, uint64_t))(v73 + 8))(v71, v74);
        goto LABEL_18;
      case 4u:
        sub_250E79CD8();
        uint64_t v81 = v103;
        uint64_t v80 = v104;
        id v82 = v91;
        (*(void (**)(char *, char *, uint64_t))(v104 + 16))(v91, v36, v103);
        id v83 = objc_allocWithZone((Class)type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController(0));
        uint64_t v84 = swift_retain();
        id v85 = sub_250E6BBE8(v84, v82, 1);
        sub_250E7A4C8();
        uint64_t v86 = v36;
        id v87 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46858]), sel_initWithRootViewController_, v85);
        id v88 = v102;
        objc_msgSend(v102, sel_presentViewController_animated_completion_, v87, 1, 0);
        swift_release();

        (*(void (**)(char *, uint64_t))(v80 + 8))(v86, v81);
        goto LABEL_18;
      default:
        uint64_t v43 = v90;
        (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v90, v39, v42);
        sub_250E798C8();
        swift_release();

        (*(void (**)(char *, uint64_t))(v38 + 8))(v43, v42);
        (*(void (**)(char *, uint64_t))(v104 + 8))(v36, v103);
LABEL_18:
        sub_250E4F39C((uint64_t)v27);
        break;
    }
  }
}

void sub_250E5A6C0(uint64_t a1)
{
  sub_250E5ABC4(0, &qword_269B0C978, MEMORY[0x263F06EA8]);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v18 - v6;
  sub_250E5AC18(a1, (uint64_t)&v18 - v6);
  uint64_t v8 = sub_250E79908();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v10(v7, 1, v8) == 1)
  {
    sub_250E5AC98((uint64_t)v7, &qword_269B0C978, MEMORY[0x263F06EA8]);
    sub_250E7ABF8();
  }
  else
  {
    uint64_t v11 = sub_250E798B8();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v14 = sub_250E7ABF8();
    if (v13)
    {
      if (v11 == v14 && v13 == v15)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v17 = sub_250E7B148();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0) {
          goto LABEL_11;
        }
      }
      sub_250E599C8();
      return;
    }
  }
  swift_bridgeObjectRelease();
LABEL_11:
  sub_250E5AC18(a1, (uint64_t)v5);
  if (v10(v5, 1, v8) == 1)
  {
    sub_250E5AC98((uint64_t)v5, &qword_269B0C978, MEMORY[0x263F06EA8]);
  }
  else
  {
    sub_250E798C8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
}

uint64_t SleepingSampleAnalysisHealthChecklistActionHandler.__allocating_init(context:)(uint64_t a1)
{
  uint64_t v3 = sub_250E7A518();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_250E7A608();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

uint64_t SleepingSampleAnalysisHealthChecklistActionHandler.init(context:)(uint64_t a1)
{
  uint64_t v2 = sub_250E7A518();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  uint64_t v5 = sub_250E7A608();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return v5;
}

id SleepingSampleAnalysisHealthChecklistActionHandler.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250E5AB60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250E5ABC4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_250E7AE78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_250E5AC18(uint64_t a1, uint64_t a2)
{
  sub_250E5ABC4(0, &qword_269B0C978, MEMORY[0x263F06EA8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_250E5AC98(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_250E5ABC4(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_26B20BD68);
}

uint64_t sub_250E5AD14()
{
  return sub_250E5806C(&qword_26B20BD60, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler);
}

uint64_t sub_250E5AD5C()
{
  return sub_250E5806C(&qword_26B20BD50, MEMORY[0x263F445D8]);
}

uint64_t *initializeBufferWithCopyOfBuffer for SleepingSampleAnalysisHealthChecklistUserData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_250E79908();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 4, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 4, v7);
    }
  }
  return a1;
}

void *initializeWithCopy for SleepingSampleAnalysisHealthChecklistUserData(void *a1, const void *a2)
{
  uint64_t v4 = sub_250E79908();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 4, v4))
  {
    uint64_t v6 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  }
  return a1;
}

void *assignWithCopy for SleepingSampleAnalysisHealthChecklistUserData(void *a1, void *a2)
{
  uint64_t v4 = sub_250E79908();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 4, v4);
  int v8 = v6(a2, 4, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  return a1;
}

void *initializeWithTake for SleepingSampleAnalysisHealthChecklistUserData(void *a1, const void *a2)
{
  uint64_t v4 = sub_250E79908();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 4, v4))
  {
    uint64_t v6 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  }
  return a1;
}

void *assignWithTake for SleepingSampleAnalysisHealthChecklistUserData(void *a1, void *a2)
{
  uint64_t v4 = sub_250E79908();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 4, v4);
  int v8 = v6(a2, 4, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 4, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistUserData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E5B418);
}

uint64_t sub_250E5B418(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistUserData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E5B498);
}

uint64_t sub_250E5B498(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_250E5B508()
{
  uint64_t result = type metadata accessor for SleepingSampleAnalysisHealthChecklistAction(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_250E5B594()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for SleepingSampleAnalysisHealthChecklistActionHandler(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SleepingSampleAnalysisHealthChecklistActionHandler);
}

uint64_t dispatch thunk of SleepingSampleAnalysisHealthChecklistActionHandler.didSelect()()
{
  return (*(uint64_t (**)(void))(class metadata base offset for SleepingSampleAnalysisHealthChecklistActionHandler
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 8))();
}

uint64_t dispatch thunk of SleepingSampleAnalysisHealthChecklistActionHandler.didSelectFooterLink(url:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for SleepingSampleAnalysisHealthChecklistActionHandler
                              + (*MEMORY[0x263F8EED0] & *v0)
                              + 16))();
}

uint64_t sub_250E5B68C()
{
  return type metadata accessor for SleepingSampleAnalysisHealthChecklistActionHandler(0);
}

uint64_t *sub_250E5B694(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_250E79908();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 4, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 4, v7);
    }
  }
  return a1;
}

uint64_t _s22HealthBalanceAppPlugin45SleepingSampleAnalysisHealthChecklistUserDataVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_250E79908();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 4, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_250E5B8B0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79908();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_250E5B9C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79908();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 4, v6);
  int v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

void *sub_250E5BB34(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79908();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_250E5BC44(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79908();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 4, v6);
  int v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

uint64_t sub_250E5BDB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E5BDCC);
}

uint64_t sub_250E5BDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79908();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 5) {
    return v5 - 4;
  }
  else {
    return 0;
  }
}

uint64_t sub_250E5BE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E5BE4C);
}

uint64_t sub_250E5BE4C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_250E79908();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_250E5BED0(uint64_t a1)
{
  uint64_t v2 = sub_250E79908();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 4, v2);
}

uint64_t sub_250E5BF38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79908();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 4, v4);
}

uint64_t sub_250E5BFA8()
{
  uint64_t result = sub_250E79908();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistUserData.CodingKeys;
}

unint64_t sub_250E5C03C()
{
  unint64_t result = qword_269B0CAC0;
  if (!qword_269B0CAC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CAC0);
  }
  return result;
}

unint64_t sub_250E5C094()
{
  unint64_t result = qword_269B0CAC8;
  if (!qword_269B0CAC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CAC8);
  }
  return result;
}

unint64_t sub_250E5C0EC()
{
  unint64_t result = qword_269B0CAD0;
  if (!qword_269B0CAD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CAD0);
  }
  return result;
}

uint64_t sub_250E5C140(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_250E7B148();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_250E5C1C0()
{
  return 0x6E6F69746361;
}

unint64_t sub_250E5C1D4()
{
  unint64_t result = qword_269B0CAE0;
  if (!qword_269B0CAE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CAE0);
  }
  return result;
}

unint64_t sub_250E5C228()
{
  unint64_t result = qword_269B0CAF0;
  if (!qword_269B0CAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CAF0);
  }
  return result;
}

unint64_t sub_250E5C27C()
{
  unint64_t result = qword_269B0CB00;
  if (!qword_269B0CB00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB00);
  }
  return result;
}

unint64_t sub_250E5C2D0()
{
  unint64_t result = qword_269B0CB10;
  if (!qword_269B0CB10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB10);
  }
  return result;
}

unint64_t sub_250E5C324()
{
  unint64_t result = qword_269B0CB20;
  if (!qword_269B0CB20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB20);
  }
  return result;
}

unint64_t sub_250E5C378()
{
  unint64_t result = qword_269B0CB30;
  if (!qword_269B0CB30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB30);
  }
  return result;
}

void sub_250E5C3CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

void sub_250E5C434()
{
  if (!qword_269B0CB70)
  {
    sub_250E5C4A4();
    sub_250E7AFC8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B0CB70);
    }
  }
}

unint64_t sub_250E5C4A4()
{
  unint64_t result = qword_269B0CB78;
  if (!qword_269B0CB78)
  {
    unint64_t result = swift_getExistentialMetatypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0CB78);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistAction.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SleepingSampleAnalysisHealthChecklistAction.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x250E5C640);
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

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.CodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.CodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchOnboardingCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.LaunchSleepOnboardingCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.EditNotificationSettingsCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.EnableAndEditNotificationSettingsCodingKeys;
}

unsigned char *_s22HealthBalanceAppPlugin45SleepingSampleAnalysisHealthChecklistUserDataV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x250E5C754);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys()
{
  return &type metadata for SleepingSampleAnalysisHealthChecklistAction.OpenURLCodingKeys;
}

unint64_t sub_250E5C790()
{
  unint64_t result = qword_269B0CB88;
  if (!qword_269B0CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB88);
  }
  return result;
}

unint64_t sub_250E5C7E8()
{
  unint64_t result = qword_269B0CB90;
  if (!qword_269B0CB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB90);
  }
  return result;
}

unint64_t sub_250E5C840()
{
  unint64_t result = qword_269B0CB98;
  if (!qword_269B0CB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CB98);
  }
  return result;
}

unint64_t sub_250E5C898()
{
  unint64_t result = qword_269B0CBA0;
  if (!qword_269B0CBA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBA0);
  }
  return result;
}

unint64_t sub_250E5C8F0()
{
  unint64_t result = qword_269B0CBA8;
  if (!qword_269B0CBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBA8);
  }
  return result;
}

unint64_t sub_250E5C948()
{
  unint64_t result = qword_269B0CBB0;
  if (!qword_269B0CBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBB0);
  }
  return result;
}

unint64_t sub_250E5C9A0()
{
  unint64_t result = qword_269B0CBB8;
  if (!qword_269B0CBB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBB8);
  }
  return result;
}

unint64_t sub_250E5C9F8()
{
  unint64_t result = qword_269B0CBC0;
  if (!qword_269B0CBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBC0);
  }
  return result;
}

unint64_t sub_250E5CA50()
{
  unint64_t result = qword_269B0CBC8;
  if (!qword_269B0CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBC8);
  }
  return result;
}

unint64_t sub_250E5CAA8()
{
  unint64_t result = qword_269B0CBD0;
  if (!qword_269B0CBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBD0);
  }
  return result;
}

unint64_t sub_250E5CB00()
{
  unint64_t result = qword_269B0CBD8;
  if (!qword_269B0CBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBD8);
  }
  return result;
}

unint64_t sub_250E5CB58()
{
  unint64_t result = qword_269B0CBE0;
  if (!qword_269B0CBE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBE0);
  }
  return result;
}

unint64_t sub_250E5CBB0()
{
  unint64_t result = qword_269B0CBE8;
  if (!qword_269B0CBE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBE8);
  }
  return result;
}

unint64_t sub_250E5CC08()
{
  unint64_t result = qword_269B0CBF0;
  if (!qword_269B0CBF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CBF0);
  }
  return result;
}

uint64_t sub_250E5CC5C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000010 && a2 == 0x8000000250E7F090 || (sub_250E7B148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000250E7F0B0 || (sub_250E7B148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000250E7F0D0 || (sub_250E7B148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000021 && a2 == 0x8000000250E7F0F0 || (sub_250E7B148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x4C52556E65706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v5 = sub_250E7B148();
    swift_bridgeObjectRelease();
    if (v5) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_250E5CE5C(uint64_t a1, uint64_t a2)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_250E7B148();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_250E5CECC()
{
  return 12383;
}

uint64_t sub_250E5CEE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  uint64_t v7 = a3[6];
  int v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24))(v12, v13, v14);
  uint64_t v15 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v12 + *(int *)(v15 + 20)) = *(unsigned char *)(v13 + *(int *)(v15 + 20));
  uint64_t v16 = *(int *)(v15 + 24);
  char v17 = (void *)(v12 + v16);
  uint64_t v18 = (void *)(v13 + v16);
  *char v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  uint64_t v20 = *(void **)(v13 + v19);
  uint64_t v21 = *(void **)(v12 + v19);
  *(void *)(v12 + v19) = v20;
  id v22 = v20;

  return a1;
}

uint64_t sub_250E5D048(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  uint64_t v12 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v9 + *(int *)(v12 + 20)) = *(unsigned char *)(v10 + *(int *)(v12 + 20));
  *(_OWORD *)(v9 + *(int *)(v12 + 24)) = *(_OWORD *)(v10 + *(int *)(v12 + 24));
  uint64_t v13 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  *(void *)(v9 + *(int *)(v13 + 20)) = *(void *)(v10 + *(int *)(v13 + 20));
  return a1;
}

uint64_t sub_250E5D150(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  uint64_t v9 = a3[8];
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  uint64_t v13 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v10 + *(int *)(v13 + 20)) = *(unsigned char *)(v11 + *(int *)(v13 + 20));
  uint64_t v14 = *(int *)(v13 + 24);
  uint64_t v15 = (void *)(v10 + v14);
  uint64_t v16 = (uint64_t *)(v11 + v14);
  uint64_t v18 = *v16;
  uint64_t v17 = v16[1];
  *uint64_t v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  uint64_t v20 = *(void **)(v10 + v19);
  *(void *)(v10 + v19) = *(void *)(v11 + v19);

  return a1;
}

uint64_t sub_250E5D290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E5D2A4);
}

uint64_t sub_250E5D2A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79ED8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 32);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_250E5D3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E5D3E4);
}

uint64_t sub_250E5D3E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_250E79ED8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 32);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_250E5D510()
{
  uint64_t result = sub_250E79ED8();
  if (v1 <= 0x3F)
  {
    uint64_t result = _s43SleepingSampleDaySummaryCollectionPublisherVMa(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_250E5D5F4()
{
  return sub_250E3B9C0(&qword_26B20C148, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator);
}

uint64_t sub_250E5D63C()
{
  return sub_250E41610(&qword_26B20C560, &qword_26B20C568, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator.Change);
}

uint64_t sub_250E5D678()
{
  return sub_250E3B9C0(&qword_26B20C5F0, (void (*)(uint64_t))sub_250E5D6C0);
}

void sub_250E5D6C0()
{
  if (!qword_26B20C5F8)
  {
    sub_250E5D754(255);
    sub_250E3B9C0(&qword_26B20C598, sub_250E5D754);
    unint64_t v0 = sub_250E7A9C8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C5F8);
    }
  }
}

void sub_250E5D754(uint64_t a1)
{
}

void sub_250E5D788(uint64_t a1)
{
}

uint64_t sub_250E5D7BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_250E5F0A4();
  uint64_t v5 = a1 + v4[12];
  uint64_t v6 = a1 + v4[16];
  uint64_t v7 = *(void *)(a1 + v4[20]);
  uint64_t v8 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(a2, a1, v8);
  uint64_t v9 = (int *)type metadata accessor for SleepingSampleChangesAlertGenerator.Change(0);
  sub_250E5EF44(v5, a2 + v9[5], (uint64_t (*)(void))sub_250E5EE50);
  uint64_t v10 = a2 + v9[6];
  uint64_t v11 = sub_250E79C18();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v10, v6, v11);
  *(void *)(a2 + v9[7]) = v7;
  return result;
}

uint64_t sub_250E5D8C8(uint64_t a1)
{
  uint64_t v2 = sub_250E79DA8();
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v43 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_250E79E48();
  uint64_t v45 = *(void *)(v4 - 8);
  uint64_t v46 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v44 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E7A888();
  uint64_t v48 = *(void *)(v6 - 8);
  uint64_t v49 = v6;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v47 = (char *)&v41 - v10;
  uint64_t v11 = sub_250E79C48();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  uint64_t v18 = (void *)sub_250E79C58();
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = objc_msgSend(v18, sel_objectForKeyedSubscript_, *MEMORY[0x263F09608]);

    unsigned __int8 v21 = objc_msgSend(v20, sel_areAllRequirementsSatisfied);
  }
  else
  {
    unsigned __int8 v21 = 0;
  }
  uint64_t v22 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change(0);
  sub_250E6978C(*(void *)(a1 + *(int *)(v22 + 28)), (uint64_t)&v17[v15[6]]);
  sub_250E5EF44(a1 + *(int *)(v22 + 20), (uint64_t)&v17[v15[7]], (uint64_t (*)(void))sub_250E5EE50);
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v14, v11);
  v17[v15[5]] = v21;
  uint64_t v23 = sub_250E5E038();
  if (v24 >> 60 == 15)
  {
    sub_250E7A858();
    uint64_t v25 = sub_250E7A878();
    os_log_type_t v26 = sub_250E7AD38();
    if (os_log_type_enabled(v25, v26))
    {
      char v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      uint64_t v51 = v28;
      *(_DWORD *)char v27 = 136446210;
      uint64_t v50 = sub_250E3FFA8(0xD000000000000023, 0x8000000250E7D100, &v51);
      sub_250E7AE88();
      _os_log_impl(&dword_250E38000, v25, v26, "[%{public}s] Not submitting a feed item", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v28, -1, -1);
      MEMORY[0x25338C970](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v49);
    uint64_t v29 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v30 = v23;
    unint64_t v31 = v24;
    uint64_t v32 = v47;
    sub_250E7A858();
    uint64_t v33 = sub_250E7A878();
    os_log_type_t v34 = sub_250E7AD38();
    if (os_log_type_enabled(v33, v34))
    {
      unint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      uint64_t v51 = v36;
      *(_DWORD *)unint64_t v35 = 136446210;
      uint64_t v50 = sub_250E3FFA8(0xD000000000000023, 0x8000000250E7D100, &v51);
      sub_250E7AE88();
      _os_log_impl(&dword_250E38000, v33, v34, "[%{public}s] Submitting a feed item", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v36, -1, -1);
      MEMORY[0x25338C970](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v32, v49);
    }
    type metadata accessor for SleepingSampleChangesAlertTileViewController(0);
    static SleepingSampleChangesAlertTileViewController.bundleClassName.getter();
    (*(void (**)(char *, void, uint64_t))(v41 + 104))(v43, *MEMORY[0x263F45528], v42);
    sub_250E5EE84(v30, v31);
    sub_250E79EB8();
    uint64_t v37 = v44;
    sub_250E79E08();
    sub_250E5E738();
    sub_250E79DE8();
    sub_250E414E4(0, &qword_269B0CBF8, MEMORY[0x263F45630], MEMORY[0x263F8E0F8]);
    uint64_t v38 = v45;
    unint64_t v39 = (*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_250E7BB70;
    (*(void (**)(unint64_t, char *, uint64_t))(v38 + 32))(v29 + v39, v37, v46);
    sub_250E48E50(v30, v31);
  }
  sub_250E5EFAC((uint64_t)v17, type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel);
  return v29;
}

uint64_t sub_250E5E038()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250E7A888();
  v23[4] = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v23[5] = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E414E4(0, &qword_26B20BD28, MEMORY[0x263F42EF8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v23 - v5;
  uint64_t v7 = sub_250E79B38();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = type metadata accessor for SleepingSampleChangesAlertTileViewModel(0);
  MEMORY[0x270FA5388](v8);
  unint64_t v24 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5EEDC(0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_250E79C18();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  sub_250E5EF44(v1 + *(int *)(v17 + 24), (uint64_t)v12, (uint64_t (*)(void))sub_250E5EEDC);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_250E5EFAC((uint64_t)v12, (uint64_t (*)(void))sub_250E5EEDC);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  if (*(unsigned char *)(v1 + *(int *)(v17 + 20)) != 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return 0;
  }
  v23[3] = v2;
  sub_250E79BF8();
  sub_250E79C08();
  uint64_t v18 = sub_250E79C48();
  uint64_t v19 = *(void *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v6, v1, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v6, 0, 1, v18);
  uint64_t v20 = (uint64_t)v24;
  sub_250E7A008();
  sub_250E79898();
  swift_allocObject();
  sub_250E79888();
  sub_250E3B9C0(&qword_269B0CC08, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertTileViewModel);
  uint64_t v21 = sub_250E79878();
  swift_release();
  sub_250E5EFAC(v20, type metadata accessor for SleepingSampleChangesAlertTileViewModel);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return v21;
}

uint64_t sub_250E5E738()
{
  sub_250E5EEDC(0);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5EF10(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5EE50(0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v37 - v11;
  uint64_t v13 = sub_250E79938();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  unint64_t v39 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v37 - v17;
  uint64_t v40 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  sub_250E5EF44(v0 + *(int *)(v40 + 24), (uint64_t)v3, (uint64_t (*)(void))sub_250E5EEDC);
  uint64_t v19 = sub_250E79C18();
  uint64_t v20 = *(void *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v3, 1, v19) == 1)
  {
    uint64_t v21 = sub_250E5EEDC;
    uint64_t v22 = (uint64_t)v3;
LABEL_8:
    sub_250E5EFAC(v22, (uint64_t (*)(void))v21);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
LABEL_9:
    uint64_t v29 = (uint64_t)v12;
    goto LABEL_10;
  }
  uint64_t v37 = v10;
  uint64_t v38 = v0;
  uint64_t v23 = sub_250E79C08();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v3, v19);
  uint64_t v24 = *(void *)(v23 + 16);
  if (v24)
  {
    uint64_t v25 = v24 - 1;
    uint64_t v26 = sub_250E79B88();
    uint64_t v27 = *(void *)(v26 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v6, v23+ ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))+ *(void *)(v27 + 72) * v25, v26);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v27 + 56))(v6, 0, 1, v26);
  }
  else
  {
    uint64_t v26 = sub_250E79B88();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v6, 1, 1, v26);
  }
  swift_bridgeObjectRelease();
  sub_250E79B88();
  uint64_t v28 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v6, 1, v26) == 1)
  {
    uint64_t v21 = sub_250E5EF10;
    uint64_t v22 = (uint64_t)v6;
    goto LABEL_8;
  }
  sub_250E79C88();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v26);
  uint64_t v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  if (v32(v12, 1, v13) == 1) {
    goto LABEL_9;
  }
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v33(v18, v12, v13);
  uint64_t v34 = (uint64_t)v37;
  sub_250E5EF44(v38 + *(int *)(v40 + 28), (uint64_t)v37, (uint64_t (*)(void))sub_250E5EE50);
  if (v32((char *)v34, 1, v13) != 1)
  {
    unint64_t v35 = v39;
    v33(v39, (char *)v34, v13);
    sub_250E3B9C0(&qword_269B0CC00, MEMORY[0x263F07490]);
    char v30 = sub_250E7AAC8() ^ 1;
    uint64_t v36 = *(void (**)(char *, uint64_t))(v14 + 8);
    v36(v35, v13);
    v36(v18, v13);
    return v30 & 1;
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v18, v13);
  uint64_t v29 = v34;
LABEL_10:
  sub_250E5EFAC(v29, (uint64_t (*)(void))sub_250E5EE50);
  char v30 = 0;
  return v30 & 1;
}

uint64_t sub_250E5ED44()
{
  return MEMORY[0x270F366F8](0xD00000000000001ALL, 0x8000000250E7F120);
}

uint64_t sub_250E5ED60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E3B9C0(&qword_26B20C140, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator);
  return MEMORY[0x270F36D90](a1, a2, v4);
}

uint64_t sub_250E5EDE4()
{
  return sub_250E3B9C0(&qword_26B20C138, (void (*)(uint64_t))type metadata accessor for SleepingSampleChangesAlertGenerator);
}

uint64_t type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20C008);
}

void sub_250E5EE50(uint64_t a1)
{
}

uint64_t sub_250E5EE84(uint64_t a1, unint64_t a2)
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

void sub_250E5EEDC(uint64_t a1)
{
}

void sub_250E5EF10(uint64_t a1)
{
}

uint64_t sub_250E5EF44(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_250E5EFAC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_250E5F00C()
{
  unint64_t result = qword_26B20BC60;
  if (!qword_26B20BC60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20BC60);
  }
  return result;
}

unint64_t sub_250E5F04C()
{
  unint64_t result = qword_26B20C820;
  if (!qword_26B20C820)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20C820);
  }
  return result;
}

void sub_250E5F0A4()
{
  if (!qword_26B20BD30)
  {
    sub_250E79C48();
    sub_250E5EE50(255);
    sub_250E79C18();
    unint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    if (!v1) {
      atomic_store(TupleTypeMetadata, (unint64_t *)&qword_26B20BD30);
    }
  }
}

void *sub_250E5F134(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_250E79C48();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_250E79C18();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      sub_250E5EEDC(0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[7];
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_250E79938();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      sub_250E5EE50(0);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t sub_250E5F3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_250E79C18();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = sub_250E79938();
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
    return v11(v8, v9);
  }
  return result;
}

uint64_t sub_250E5F570(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_250E79C18();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_250E5EEDC(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_250E79938();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    sub_250E5EE50(0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_250E5F7B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_250E79C18();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_250E5EEDC(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_250E79938();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    sub_250E5EE50(0);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_250E5FABC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_250E79C18();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_250E5EEDC(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  int v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_250E79938();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    sub_250E5EE50(0);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t sub_250E5FD00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_250E79C18();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    sub_250E5EEDC(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = sub_250E79938();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    sub_250E5EE50(0);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t sub_250E60004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E60018);
}

uint64_t sub_250E60018(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_8:
    return v9(v10, a2, v8);
  }
  if (a2 == 254)
  {
    unsigned int v11 = *(unsigned __int8 *)(a1 + a3[5]);
    if (v11 >= 2) {
      return ((v11 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  sub_250E5EEDC(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a2)
  {
    uint64_t v8 = v13;
    uint64_t v10 = a1 + a3[6];
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
    goto LABEL_8;
  }
  sub_250E5EE50(0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[7];
  return v16(v18, a2, v17);
}

uint64_t sub_250E601A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E601B8);
}

uint64_t sub_250E601B8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_250E79C48();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unsigned int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[5]) = a2 + 1;
    return result;
  }
  sub_250E5EEDC(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unsigned int v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  sub_250E5EE50(0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[7];
  return v16(v18, a2, a2, v17);
}

void sub_250E60334()
{
  sub_250E79C48();
  if (v0 <= 0x3F)
  {
    sub_250E5EEDC(319);
    if (v1 <= 0x3F)
    {
      sub_250E5EE50(319);
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_250E60440(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_250E79C48();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_250E79938();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      sub_250E5EE50(0);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = sub_250E79C18();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_250E60638(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = sub_250E79938();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 24);
  uint64_t v9 = sub_250E79C18();
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  return v10(v8, v9);
}

uint64_t sub_250E6076C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_250E79938();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_250E5EE50(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_250E79C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_250E60914(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_250E79938();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_250E5EE50(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_250E79C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_250E60B20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_250E79938();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    sub_250E5EE50(0);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_250E79C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_250E60CC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_250E79C48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = sub_250E79938();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    sub_250E5EE50(0);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_250E79C18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_250E60ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E60EE8);
}

uint64_t sub_250E60EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79C48();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  sub_250E5EE50(0);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = sub_250E79C18();
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);
  return v15(v17, a2, v16);
}

uint64_t sub_250E61034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E61048);
}

uint64_t sub_250E61048(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_250E79C48();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  sub_250E5EE50(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = sub_250E79C18();
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);
  return v17(v19, a2, a2, v18);
}

void sub_250E611A0()
{
  sub_250E79C48();
  if (v0 <= 0x3F)
  {
    sub_250E5EE50(319);
    if (v1 <= 0x3F)
    {
      sub_250E79C18();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

BOOL sub_250E612B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79938();
  uint64_t v67 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unint64_t v62 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E61AEC(0);
  uint64_t v64 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5EE50(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v63 = (uint64_t)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v65 = (uint64_t)&v56 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v66 = (uint64_t)&v56 - v14;
  uint64_t v15 = sub_250E79C18();
  uint64_t v68 = *(void *)(v15 - 8);
  uint64_t v69 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E61B0C(0);
  uint64_t v19 = v18;
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5EEDC(0);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v56 - v27;
  MEMORY[0x270FA5388](v26);
  char v30 = (char *)&v56 - v29;
  if ((sub_250E79C38() & 1) == 0) {
    return 0;
  }
  uint64_t v31 = type metadata accessor for SleepingSampleChangesAlertGenerator.Change.GeneratorModel(0);
  if (*(unsigned __int8 *)(a1 + *(int *)(v31 + 20)) != *(unsigned __int8 *)(a2 + *(int *)(v31 + 20))) {
    return 0;
  }
  uint64_t v60 = v8;
  uint64_t v61 = v4;
  uint64_t v32 = *(int *)(v31 + 24);
  uint64_t v58 = a1;
  uint64_t v33 = v31;
  sub_250E5EF44(a1 + v32, (uint64_t)v30, (uint64_t (*)(void))sub_250E5EEDC);
  uint64_t v57 = v33;
  uint64_t v34 = *(int *)(v33 + 24);
  uint64_t v59 = a2;
  sub_250E5EF44(a2 + v34, (uint64_t)v28, (uint64_t (*)(void))sub_250E5EEDC);
  uint64_t v35 = (uint64_t)&v21[*(int *)(v19 + 48)];
  sub_250E5EF44((uint64_t)v30, (uint64_t)v21, (uint64_t (*)(void))sub_250E5EEDC);
  sub_250E5EF44((uint64_t)v28, v35, (uint64_t (*)(void))sub_250E5EEDC);
  uint64_t v37 = v68;
  uint64_t v36 = v69;
  uint64_t v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
  if (v38((uint64_t)v21, 1, v69) != 1)
  {
    sub_250E5EF44((uint64_t)v21, (uint64_t)v25, (uint64_t (*)(void))sub_250E5EEDC);
    if (v38(v35, 1, v36) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v17, v35, v36);
      sub_250E3B9C0(&qword_269B0CC20, MEMORY[0x263F42EE0]);
      char v41 = sub_250E7AAE8();
      uint64_t v42 = *(void (**)(char *, uint64_t))(v37 + 8);
      v42(v17, v36);
      sub_250E5EFAC((uint64_t)v28, (uint64_t (*)(void))sub_250E5EEDC);
      sub_250E5EFAC((uint64_t)v30, (uint64_t (*)(void))sub_250E5EEDC);
      v42(v25, v36);
      sub_250E5EFAC((uint64_t)v21, (uint64_t (*)(void))sub_250E5EEDC);
      if ((v41 & 1) == 0) {
        return 0;
      }
      goto LABEL_10;
    }
    sub_250E5EFAC((uint64_t)v28, (uint64_t (*)(void))sub_250E5EEDC);
    sub_250E5EFAC((uint64_t)v30, (uint64_t (*)(void))sub_250E5EEDC);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v25, v36);
LABEL_8:
    unint64_t v39 = sub_250E61B0C;
    uint64_t v40 = (uint64_t)v21;
LABEL_16:
    sub_250E5EFAC(v40, (uint64_t (*)(void))v39);
    return 0;
  }
  sub_250E5EFAC((uint64_t)v28, (uint64_t (*)(void))sub_250E5EEDC);
  sub_250E5EFAC((uint64_t)v30, (uint64_t (*)(void))sub_250E5EEDC);
  if (v38(v35, 1, v36) != 1) {
    goto LABEL_8;
  }
  sub_250E5EFAC((uint64_t)v21, (uint64_t (*)(void))sub_250E5EEDC);
LABEL_10:
  uint64_t v43 = v57;
  uint64_t v44 = v66;
  sub_250E5EF44(v58 + *(int *)(v57 + 28), v66, (uint64_t (*)(void))sub_250E5EE50);
  uint64_t v45 = v65;
  sub_250E5EF44(v59 + *(int *)(v43 + 28), v65, (uint64_t (*)(void))sub_250E5EE50);
  uint64_t v46 = (uint64_t)v60;
  uint64_t v47 = (uint64_t)&v60[*(int *)(v64 + 48)];
  sub_250E5EF44(v44, (uint64_t)v60, (uint64_t (*)(void))sub_250E5EE50);
  sub_250E5EF44(v45, v47, (uint64_t (*)(void))sub_250E5EE50);
  uint64_t v48 = v67;
  uint64_t v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48);
  uint64_t v50 = v61;
  if (v49(v46, 1, v61) == 1)
  {
    sub_250E5EFAC(v45, (uint64_t (*)(void))sub_250E5EE50);
    sub_250E5EFAC(v44, (uint64_t (*)(void))sub_250E5EE50);
    if (v49(v47, 1, v50) == 1)
    {
      sub_250E5EFAC(v46, (uint64_t (*)(void))sub_250E5EE50);
      return 1;
    }
    goto LABEL_15;
  }
  uint64_t v51 = v63;
  sub_250E5EF44(v46, v63, (uint64_t (*)(void))sub_250E5EE50);
  if (v49(v47, 1, v50) == 1)
  {
    sub_250E5EFAC(v45, (uint64_t (*)(void))sub_250E5EE50);
    sub_250E5EFAC(v44, (uint64_t (*)(void))sub_250E5EE50);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v51, v50);
LABEL_15:
    unint64_t v39 = sub_250E61AEC;
    uint64_t v40 = v46;
    goto LABEL_16;
  }
  uint64_t v53 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 32))(v62, v47, v50);
  sub_250E3B9C0(&qword_26B20BCF8, MEMORY[0x263F07490]);
  char v54 = sub_250E7AAE8();
  id v55 = *(void (**)(char *, uint64_t))(v48 + 8);
  v55(v53, v50);
  sub_250E5EFAC(v45, (uint64_t (*)(void))sub_250E5EE50);
  sub_250E5EFAC(v44, (uint64_t (*)(void))sub_250E5EE50);
  v55((char *)v51, v50);
  sub_250E5EFAC(v46, (uint64_t (*)(void))sub_250E5EE50);
  return (v54 & 1) != 0;
}

void sub_250E61AEC(uint64_t a1)
{
}

void sub_250E61B0C(uint64_t a1)
{
}

void sub_250E61B2C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v5) {
      atomic_store(TupleTypeMetadata2, a2);
    }
  }
}

uint64_t sub_250E61B8C()
{
  return sub_250E61BA4(MEMORY[0x263F096C8]);
}

uint64_t sub_250E61B98()
{
  return sub_250E61BA4(MEMORY[0x263F096E8]);
}

uint64_t sub_250E61BA4(void *a1)
{
  sub_250E62E78(0, &qword_26B20BD28, MEMORY[0x263F42EF8], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - v4;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_250E79CB8();
  uint64_t v6 = sub_250E79C48();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_250E62DEC((uint64_t)v5);
    return 1;
  }
  uint64_t v8 = (void *)sub_250E79C58();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  if (!v8) {
    return 1;
  }
  id v9 = objc_msgSend(v8, sel_objectForKeyedSubscript_, *MEMORY[0x263F09600]);
  id v10 = objc_msgSend(v9, sel_isRequirementSatisfiedWithIdentifier_, *a1);

  return (uint64_t)v10;
}

uint64_t sub_250E61D5C(char a1)
{
  uint64_t v2 = sub_250E7A888();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v6 = sub_250E7A878();
  os_log_type_t v7 = sub_250E7AD38();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    uint64_t v14 = v9;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v13 = sub_250E3FFA8(0xD000000000000018, 0x8000000250E7D280, &v14);
    sub_250E7AE88();
    *(_WORD *)(v8 + 12) = 2082;
    LOBYTE(v13) = a1;
    sub_250E62D94();
    uint64_t v10 = sub_250E7ABD8();
    uint64_t v13 = sub_250E3FFA8(v10, v11, &v14);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v6, v7, "[%{public}s] updating notification state: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v9, -1, -1);
    MEMORY[0x25338C970](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_250E79D08();
  sub_250E79CF8();
  sub_250E79CD8();
  return swift_release();
}

void sub_250E61FA4()
{
  uint64_t v0 = sub_250E7A888();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v4 = sub_250E7A878();
  os_log_type_t v5 = sub_250E7AD38();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)uint64_t v6 = 136446210;
    uint64_t v10 = sub_250E3FFA8(0xD000000000000018, 0x8000000250E7D280, &v11);
    sub_250E7AE88();
    _os_log_impl(&dword_250E38000, v4, v5, "[%{public}s] favoriting balance type", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v7, -1, -1);
    MEMORY[0x25338C970](v6, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v8 = objc_msgSend(self, sel_appleBalanceMetricsType);
  if (v8)
  {
    uint64_t v9 = v8;
    sub_250E79F18();
    sub_250E79F08();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_250E621C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v63 = a1;
  uint64_t v3 = sub_250E7A888();
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v61 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v59 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v57 = (char *)&v52 - v6;
  uint64_t v62 = sub_250E79BB8();
  uint64_t v58 = *(void *)(v62 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v62);
  id v55 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v56 = (char *)&v52 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v52 - v11;
  sub_250E62E78(0, &qword_26B20BD28, MEMORY[0x263F42EF8], MEMORY[0x263F8D8F0]);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v52 - v17;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_250E79CB8();
  uint64_t v19 = sub_250E79C48();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v21(v18, 1, v19) == 1)
  {
    uint64_t v22 = (uint64_t)v18;
LABEL_6:
    sub_250E62DEC(v22);
    goto LABEL_7;
  }
  uint64_t v53 = v12;
  uint64_t v23 = (void *)sub_250E79C58();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v20 + 8);
  v24(v18, v19);
  id v54 = v23;
  if (!v23)
  {
LABEL_7:
    uint64_t v25 = v59;
    sub_250E7A858();
    uint64_t v26 = sub_250E7A878();
    os_log_type_t v27 = sub_250E7AD18();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      v66[0] = v29;
      *(_DWORD *)uint64_t v28 = 136446210;
      uint64_t v65 = sub_250E3FFA8(0xD000000000000018, 0x8000000250E7D280, v66);
      sub_250E7AE88();
      _os_log_impl(&dword_250E38000, v26, v27, "[%{public}s] nil feature status for watch capabilities", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v29, -1, -1);
      MEMORY[0x25338C970](v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v60 + 8))(v25, v61);
    v66[0] = MEMORY[0x263F8EE78];
    sub_250E62FD0((unint64_t *)&qword_269B0CC30);
    sub_250E62E78(0, &qword_269B0CC38, MEMORY[0x263F42DA0], MEMORY[0x263F8D488]);
    sub_250E62EDC();
    return sub_250E7AED8();
  }
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_250E79CB8();
  if (v21(v16, 1, v19) == 1)
  {

    uint64_t v22 = (uint64_t)v16;
    goto LABEL_6;
  }
  uint64_t v31 = (void *)sub_250E79C58();
  v24(v16, v19);
  id v52 = v31;
  if (!v31)
  {

    goto LABEL_7;
  }
  v66[0] = MEMORY[0x263F8EE78];
  sub_250E62FD0((unint64_t *)&qword_269B0CC30);
  sub_250E62E78(0, &qword_269B0CC38, MEMORY[0x263F42DA0], MEMORY[0x263F8D488]);
  sub_250E62EDC();
  uint64_t v32 = v53;
  uint64_t v33 = v62;
  sub_250E7AED8();
  id v34 = objc_msgSend(v54, sel_objectForKeyedSubscript_, *MEMORY[0x263F09590]);
  unsigned __int8 v35 = objc_msgSend(v34, sel_areAllRequirementsSatisfied);

  uint64_t v36 = v58;
  uint64_t v37 = v56;
  if (v35)
  {
    uint64_t v38 = (uint64_t)v55;
    sub_250E79BA8();
    sub_250E62AC0(v37, v38);
    unint64_t v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v39(v38, v33);
    v39((uint64_t)v37, v33);
  }
  id v40 = objc_msgSend(v52, sel_objectForKeyedSubscript_, *MEMORY[0x263F09600], v52);
  unsigned int v41 = objc_msgSend(v40, sel_areAllRequirementsSatisfied);

  uint64_t v42 = v63;
  uint64_t v43 = v57;
  if (v41)
  {
    uint64_t v44 = (uint64_t)v55;
    sub_250E79B98();
    sub_250E62AC0(v37, v44);
    uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v45(v44, v33);
    v45((uint64_t)v37, v33);
  }
  sub_250E7A858();
  uint64_t v46 = sub_250E7A878();
  os_log_type_t v47 = sub_250E7AD38();
  if (os_log_type_enabled(v46, v47))
  {
    uint64_t v48 = swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    v66[0] = v49;
    *(_DWORD *)uint64_t v48 = 136446466;
    uint64_t v65 = sub_250E3FFA8(0xD000000000000018, 0x8000000250E7D280, v66);
    sub_250E7AE88();
    *(_WORD *)(v48 + 12) = 2080;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v37, v32, v33);
    uint64_t v50 = sub_250E7ABD8();
    uint64_t v64 = sub_250E3FFA8(v50, v51, v66);
    uint64_t v42 = v63;
    sub_250E7AE88();
    uint64_t v32 = v53;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v46, v47, "[%{public}s] returning capabilities %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v49, -1, -1);
    MEMORY[0x25338C970](v48, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v60 + 8))(v43, v61);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v42, v32, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v32, v33);
}

uint64_t sub_250E62AC0(char *a1, uint64_t a2)
{
  uint64_t v29 = a1;
  sub_250E62F64();
  uint64_t v5 = v4;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  os_log_type_t v27 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = sub_250E79BB8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v24 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v26 = v2;
  v17(v14, v2, v10);
  uint64_t v24 = sub_250E62FD0((unint64_t *)&qword_269B0CC30);
  sub_250E7AEB8();
  sub_250E62FD0(&qword_269B0CC50);
  uint64_t v25 = a2;
  char v18 = sub_250E7AAE8() ^ 1;
  uint64_t v28 = v5;
  uint64_t v19 = &v9[*(int *)(v5 + 48)];
  *uint64_t v9 = v18 & 1;
  if (v18)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    uint64_t v21 = v25;
    v17(v19, v25, v10);
    v17(v14, v21, v10);
    sub_250E7AEC8();
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  }
  else
  {
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v20(v19, v16, v10);
  }
  uint64_t v22 = &v27[*(int *)(v28 + 48)];
  v20(v22, v19, v10);
  v20(v29, v22, v10);
  return v18 & 1;
}

void sub_250E62D94()
{
  if (!qword_269B0CC28)
  {
    unint64_t v0 = sub_250E7AE78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0CC28);
    }
  }
}

uint64_t sub_250E62DEC(uint64_t a1)
{
  sub_250E62E78(0, &qword_26B20BD28, MEMORY[0x263F42EF8], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_250E62E78(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_250E62EDC()
{
  unint64_t result = qword_269B0CC40;
  if (!qword_269B0CC40)
  {
    sub_250E62E78(255, &qword_269B0CC38, MEMORY[0x263F42DA0], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CC40);
  }
  return result;
}

void sub_250E62F64()
{
  if (!qword_269B0CC48)
  {
    sub_250E79BB8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B0CC48);
    }
  }
}

uint64_t sub_250E62FD0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_250E79BB8();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void destroy for BalanceOnboardingManager(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  uint64_t v2 = *(void **)(a1 + 40);
}

uint64_t initializeWithCopy for BalanceOnboardingManager(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  uint64_t v5 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  id v6 = v5;
  return a1;
}

uint64_t *assignWithCopy for BalanceOnboardingManager(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  long long v4 = (void *)a2[5];
  uint64_t v5 = (void *)a1[5];
  a1[5] = (uint64_t)v4;
  id v6 = v4;

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

uint64_t assignWithTake for BalanceOnboardingManager(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  id v6 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingManager(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BalanceOnboardingManager(uint64_t result, int a2, int a3)
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingManager()
{
  return &type metadata for BalanceOnboardingManager;
}

uint64_t sub_250E631F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_unknownObjectRetain();
  sub_250E7A5B8();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v8 + *(int *)(v11 + 20)) = *(unsigned char *)(v9 + *(int *)(v11 + 20));
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = (void *)(v8 + v12);
  uint64_t v14 = (void *)(v9 + v12);
  *uint64_t v13 = *v14;
  v13[1] = v14[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  uint64_t v16 = *(void **)(v9 + v15);
  uint64_t v17 = *(void **)(v8 + v15);
  *(void *)(v8 + v15) = v16;
  id v18 = v16;

  return a1;
}

uint64_t sub_250E63324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v8 + *(int *)(v11 + 20)) = *(unsigned char *)(v9 + *(int *)(v11 + 20));
  *(_OWORD *)(v8 + *(int *)(v11 + 24)) = *(_OWORD *)(v9 + *(int *)(v11 + 24));
  uint64_t v12 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
  *(void *)(v8 + *(int *)(v12 + 20)) = *(void *)(v9 + *(int *)(v12 + 20));
  return a1;
}

uint64_t sub_250E63418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79ED8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  sub_250E7A5B8();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(v8 + *(int *)(v11 + 20)) = *(unsigned char *)(v9 + *(int *)(v11 + 20));
  uint64_t v12 = *(int *)(v11 + 24);
  uint64_t v13 = (void *)(v8 + v12);
  uint64_t v14 = (uint64_t *)(v9 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = *(int *)(_s43SleepingSampleDaySummaryCollectionPublisherVMa(0) + 20);
  id v18 = *(void **)(v8 + v17);
  *(void *)(v8 + v17) = *(void *)(v9 + v17);

  return a1;
}

uint64_t sub_250E63530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E63544);
}

uint64_t sub_250E63544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79ED8();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_250E63670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E63684);
}

uint64_t sub_250E63684(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_250E79ED8();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = _s43SleepingSampleDaySummaryCollectionPublisherVMa(0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t sub_250E637B0()
{
  uint64_t result = sub_250E79ED8();
  if (v1 <= 0x3F)
  {
    uint64_t result = _s43SleepingSampleDaySummaryCollectionPublisherVMa(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_250E63880()
{
  return sub_250E3BE60(&qword_26B20BF68, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileGenerator);
}

uint64_t sub_250E638C8()
{
  return sub_250E3BE60(&qword_26B20C550, (void (*)(uint64_t))sub_250E63910);
}

void sub_250E63910()
{
  if (!qword_26B20C558)
  {
    type metadata accessor for SleepingSampleHelpTileGenerator.Change(255);
    unint64_t v0 = sub_250E7A988();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C558);
    }
  }
}

uint64_t sub_250E63978()
{
  return sub_250E3BE60(&qword_26B20C5F0, (void (*)(uint64_t))sub_250E5D6C0);
}

id sub_250E639C0@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id v9 = *a1;
  sub_250E65030();
  uint64_t v5 = (char *)a1 + *(int *)(v4 + 48);
  uint64_t v6 = (char *)a2 + *(int *)(type metadata accessor for SleepingSampleHelpTileGenerator.Change(0) + 20);
  uint64_t v7 = sub_250E79C18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v6, v5, v7);
  *a2 = v9;
  return v9;
}

id sub_250E63A70(id *a1)
{
  uint64_t v64 = sub_250E79E58();
  uint64_t v62 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v60 = (char *)&v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_250E79E88();
  uint64_t v61 = *(void *)(v63 - 8);
  MEMORY[0x270FA5388](v63);
  uint64_t v59 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_250E79DA8();
  uint64_t v66 = *(void *)(v4 - 8);
  uint64_t v67 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250E79E48();
  uint64_t v65 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250E7A888();
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v70 = v10;
  uint64_t v11 = MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v54 - v14;
  sub_250E64A88(0);
  MEMORY[0x270FA5388](v16 - 8);
  id v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for SleepingSampleHelpTileGenerator.Change.GeneratorModel(0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = objc_msgSend(*a1, sel_objectForKeyedSubscript_, *MEMORY[0x263F09590]);
  unsigned int v23 = objc_msgSend(v22, sel_areAllRequirementsSatisfied);

  if (v23)
  {
    sub_250E64AE0((uint64_t)v18);
  }
  else
  {
    uint64_t v24 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v18, 1, 1, v24);
  }
  sub_250E64EF8((uint64_t)v18, (uint64_t)v21, (uint64_t (*)(void))sub_250E64A88);
  uint64_t v25 = sub_250E64438();
  if (v26 >> 60 == 15)
  {
    sub_250E7A858();
    os_log_type_t v27 = sub_250E7A878();
    os_log_type_t v28 = sub_250E7AD38();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      char v30 = v21;
      uint64_t v31 = swift_slowAlloc();
      v71[0] = v31;
      *(_DWORD *)uint64_t v29 = 136446210;
      uint64_t v72 = sub_250E3FFA8(0xD00000000000001FLL, 0x8000000250E7D2B0, v71);
      sub_250E7AE88();
      _os_log_impl(&dword_250E38000, v27, v28, "[%{public}s] Not submitting a feed item", v29, 0xCu);
      swift_arrayDestroy();
      uint64_t v32 = v31;
      uint64_t v21 = v30;
      MEMORY[0x25338C970](v32, -1, -1);
      MEMORY[0x25338C970](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v69 + 8))(v13, v70);
    uint64_t v33 = MEMORY[0x263F8EE78];
    goto LABEL_12;
  }
  uint64_t v34 = v25;
  unint64_t v57 = v26;
  sub_250E7A858();
  unsigned __int8 v35 = sub_250E7A878();
  os_log_type_t v36 = sub_250E7AD38();
  BOOL v37 = os_log_type_enabled(v35, v36);
  id v55 = v21;
  uint64_t v54 = v7;
  uint64_t v56 = v9;
  uint64_t v58 = v34;
  if (v37)
  {
    uint64_t v38 = (uint8_t *)swift_slowAlloc();
    uint64_t v39 = swift_slowAlloc();
    v71[0] = v39;
    *(_DWORD *)uint64_t v38 = 136446210;
    uint64_t v72 = sub_250E3FFA8(0xD00000000000001FLL, 0x8000000250E7D2B0, v71);
    sub_250E7AE88();
    _os_log_impl(&dword_250E38000, v35, v36, "[%{public}s] Submitting a feed item", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v39, -1, -1);
    MEMORY[0x25338C970](v38, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v69 + 8))(v15, v70);
  type metadata accessor for SleepingSampleHelpTileViewController(0);
  static SleepingSampleHelpTileViewController.bundleClassName.getter();
  LODWORD(v70) = *MEMORY[0x263F45540];
  uint64_t v40 = v67;
  uint64_t v41 = v66 + 104;
  uint64_t v69 = *(void *)(v66 + 104);
  ((void (*)(char *))v69)(v6);
  sub_250E5EE84(v58, v57);
  sub_250E79EB8();
  uint64_t v42 = v56;
  sub_250E79E08();
  uint64_t v43 = sub_250E79EF8();
  uint64_t v45 = v44;
  uint64_t v46 = (void (*)(uint64_t *, void))sub_250E79E38();
  sub_250E53678(&v72, v43, v45);
  swift_bridgeObjectRelease();
  v46(v71, 0);
  sub_250E79EB8();
  sub_250E41548(0, &qword_26B20C7F8, MEMORY[0x263F45588], MEMORY[0x263F8E0F8]);
  unint64_t v47 = (*(unsigned __int8 *)(v41 - 24) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 - 24);
  uint64_t v48 = swift_allocObject();
  long long v68 = xmmword_250E7BB70;
  *(_OWORD *)(v48 + 16) = xmmword_250E7BB70;
  ((void (*)(unint64_t, void, uint64_t))v69)(v48 + v47, v70, v40);
  sub_250E40704();
  uint64_t v49 = swift_allocObject();
  *(_OWORD *)(v49 + 16) = xmmword_250E7C4F0;
  id result = objc_msgSend(self, sel_appleBalanceMetricsType);
  if (result)
  {
    *(void *)(v49 + 32) = result;
    v71[0] = v49;
    sub_250E7AC68();
    (*(void (**)(char *, void, uint64_t))(v62 + 104))(v60, *MEMORY[0x263F45688], v64);
    unint64_t v51 = v59;
    sub_250E79E68();
    sub_250E79E78();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v51, v63);
    sub_250E79E18();
    sub_250E79DE8();
    sub_250E79DF8();
    sub_250E41548(0, &qword_269B0CBF8, MEMORY[0x263F45630], MEMORY[0x263F8E0F8]);
    uint64_t v52 = v65;
    unint64_t v53 = (*(unsigned __int8 *)(v65 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v65 + 80);
    uint64_t v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = v68;
    (*(void (**)(unint64_t, char *, uint64_t))(v52 + 32))(v33 + v53, v42, v54);
    sub_250E48E50(v58, v57);
    uint64_t v21 = v55;
LABEL_12:
    sub_250E64E98((uint64_t)v21, type metadata accessor for SleepingSampleHelpTileGenerator.Change.GeneratorModel);
    return (id)v33;
  }
  __break(1u);
  return result;
}

uint64_t sub_250E64438()
{
  uint64_t v1 = sub_250E7A888();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E64A88(0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E64F60(v0, (uint64_t)v7, (uint64_t (*)(void))sub_250E64A88);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_250E64E98((uint64_t)v7, (uint64_t (*)(void))sub_250E64A88);
    return 0;
  }
  else
  {
    sub_250E64EF8((uint64_t)v7, (uint64_t)v11, type metadata accessor for SleepingSampleHelpTileVariant);
    sub_250E64F60((uint64_t)v11, (uint64_t)v4, type metadata accessor for SleepingSampleHelpTileVariant);
    sub_250E79898();
    swift_allocObject();
    sub_250E79888();
    sub_250E3BE60(&qword_269B0CC58, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
    uint64_t v12 = sub_250E79878();
    swift_release();
    sub_250E64E98((uint64_t)v4, type metadata accessor for SleepingSampleHelpTileConfiguration);
    sub_250E64E98((uint64_t)v11, type metadata accessor for SleepingSampleHelpTileVariant);
  }
  return v12;
}

uint64_t sub_250E649A0()
{
  return MEMORY[0x270F366F8](0xD000000000000016, 0x8000000250E7F160);
}

uint64_t sub_250E649BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E3BE60(&qword_26B20BF60, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileGenerator);
  return MEMORY[0x270F36D90](a1, a2, v4);
}

uint64_t sub_250E64A40()
{
  return sub_250E3BE60(&qword_26B20BF58, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileGenerator);
}

void sub_250E64A88(uint64_t a1)
{
}

uint64_t type metadata accessor for SleepingSampleHelpTileGenerator.Change.GeneratorModel(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20BE60);
}

uint64_t sub_250E64AE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_250E79AD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E5EF10(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250E79B88();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepingSampleHelpTileGenerator.Change(0);
  uint64_t v13 = sub_250E79C08();
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v8, v13+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(void *)(v10 + 72) * (v14 - 1), v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_250E64E98((uint64_t)v8, (uint64_t (*)(void))sub_250E5EF10);
LABEL_6:
    uint64_t v15 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(a1, 1, 1, v15);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  sub_250E79C98();
  if (sub_250E79A98())
  {
    char v17 = sub_250E79B78();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    if ((v17 & 1) == 0) {
      goto LABEL_6;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(a1, 1, 1, v2);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v2);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v3 + 56))(a1, 0, 1, v2);
  }
  uint64_t v18 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(a1, 0, 1, v18);
}

uint64_t sub_250E64E98(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_250E64EF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_250E64F60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_250E64FC8()
{
  if (!qword_26B20BC68[0])
  {
    sub_250E40A50(255, (unint64_t *)&qword_26B20BC60);
    unint64_t v0 = sub_250E7AE78();
    if (!v1) {
      atomic_store(v0, qword_26B20BC68);
    }
  }
}

void sub_250E65030()
{
  if (!qword_26B20C7A0)
  {
    sub_250E40A50(255, (unint64_t *)&qword_26B20C790);
    sub_250E79C18();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B20C7A0);
    }
  }
}

uint64_t *sub_250E650B0(uint64_t *a1, uint64_t *a2)
{
  sub_250E64A88(0);
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
    uint64_t v7 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v10 = sub_250E79AD8();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        memcpy(a1, a2, *(void *)(v8 + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v10);
        (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_250E652A8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = sub_250E79AD8();
    uint64_t v6 = *(void *)(v4 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v4);
    if (!result)
    {
      int v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
      return v5(a1, v4);
    }
  }
  return result;
}

void *sub_250E653B8(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_250E64A88(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_250E79AD8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_250E65570(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      uint64_t v13 = sub_250E79AD8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
      int v16 = v15(a1, 1, v13);
      int v17 = v15(a2, 1, v13);
      if (v16)
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 16))(a1, a2, v13);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
          return a1;
        }
      }
      else
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 24))(a1, a2, v13);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v14 + 8))(a1, v13);
      }
      size_t v12 = *(void *)(v5 + 64);
      goto LABEL_8;
    }
    sub_250E64E98((uint64_t)a1, type metadata accessor for SleepingSampleHelpTileVariant);
LABEL_7:
    sub_250E64A88(0);
    size_t v12 = *(void *)(*(void *)(v11 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v12);
    return a1;
  }
  if (v8) {
    goto LABEL_7;
  }
  uint64_t v9 = sub_250E79AD8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
  {
    memcpy(a1, a2, *(void *)(v5 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(a1, a2, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_250E65888(void *a1, const void *a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    sub_250E64A88(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = sub_250E79AD8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_250E65A40(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      uint64_t v13 = sub_250E79AD8();
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
      int v16 = v15(a1, 1, v13);
      int v17 = v15(a2, 1, v13);
      if (v16)
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 32))(a1, a2, v13);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(a1, 0, 1, v13);
          return a1;
        }
      }
      else
      {
        if (!v17)
        {
          (*(void (**)(void *, void *, uint64_t))(v14 + 40))(a1, a2, v13);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v14 + 8))(a1, v13);
      }
      size_t v12 = *(void *)(v5 + 64);
      goto LABEL_8;
    }
    sub_250E64E98((uint64_t)a1, type metadata accessor for SleepingSampleHelpTileVariant);
LABEL_7:
    sub_250E64A88(0);
    size_t v12 = *(void *)(*(void *)(v11 - 8) + 64);
LABEL_8:
    memcpy(a1, a2, v12);
    return a1;
  }
  if (v8) {
    goto LABEL_7;
  }
  uint64_t v9 = sub_250E79AD8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
  {
    memcpy(a1, a2, *(void *)(v5 + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v10 + 32))(a1, a2, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_250E65D58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E65D6C);
}

uint64_t sub_250E65D6C(uint64_t a1, uint64_t a2)
{
  sub_250E64A88(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_250E65DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E65DEC);
}

uint64_t sub_250E65DEC(uint64_t a1, uint64_t a2)
{
  sub_250E64A88(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

void sub_250E65E5C()
{
  sub_250E64A88(319);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void **sub_250E65EE8(void **a1, void **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = *(int *)(a3 + 20);
    int v7 = (char *)a1 + v6;
    int v8 = (char *)a2 + v6;
    uint64_t v9 = sub_250E79C18();
    uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    uint64_t v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_250E65FC8(id *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_250E79C18();
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

void **sub_250E66040(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = *(int *)(a3 + 20);
  uint64_t v6 = (char *)a1 + v5;
  int v7 = (char *)a2 + v5;
  uint64_t v8 = sub_250E79C18();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  id v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_250E660D4(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  int v7 = *a1;
  *a1 = *a2;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 20);
  id v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = sub_250E79C18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

void *sub_250E66164(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_250E79C18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_250E661E0(void **a1, void **a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  *a1 = *a2;

  uint64_t v7 = *(int *)(a3 + 20);
  id v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_250E79C18();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_250E6626C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E66280);
}

uint64_t sub_250E66280(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_250E79C18();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_250E66330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E66344);
}

void *sub_250E66344(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_250E79C18();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_250E663EC()
{
  uint64_t result = sub_250E79C18();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

BOOL sub_250E66488(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v26 = (uint64_t)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E66858();
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E64A88(0);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  int v17 = (char *)&v25 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v25 - v18;
  sub_250E64F60(a1, (uint64_t)&v25 - v18, (uint64_t (*)(void))sub_250E64A88);
  sub_250E64F60(a2, (uint64_t)v17, (uint64_t (*)(void))sub_250E64A88);
  uint64_t v20 = (uint64_t)&v10[*(int *)(v8 + 56)];
  sub_250E64F60((uint64_t)v19, (uint64_t)v10, (uint64_t (*)(void))sub_250E64A88);
  sub_250E64F60((uint64_t)v17, v20, (uint64_t (*)(void))sub_250E64A88);
  uint64_t v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v21((uint64_t)v10, 1, v4) == 1)
  {
    sub_250E64E98((uint64_t)v17, (uint64_t (*)(void))sub_250E64A88);
    sub_250E64E98((uint64_t)v19, (uint64_t (*)(void))sub_250E64A88);
    if (v21(v20, 1, v4) == 1)
    {
      sub_250E64E98((uint64_t)v10, (uint64_t (*)(void))sub_250E64A88);
      return 1;
    }
    goto LABEL_6;
  }
  sub_250E64F60((uint64_t)v10, (uint64_t)v14, (uint64_t (*)(void))sub_250E64A88);
  if (v21(v20, 1, v4) == 1)
  {
    sub_250E64E98((uint64_t)v17, (uint64_t (*)(void))sub_250E64A88);
    sub_250E64E98((uint64_t)v19, (uint64_t (*)(void))sub_250E64A88);
    sub_250E64E98((uint64_t)v14, type metadata accessor for SleepingSampleHelpTileVariant);
LABEL_6:
    sub_250E64E98((uint64_t)v10, (uint64_t (*)(void))sub_250E66858);
    return 0;
  }
  uint64_t v22 = v26;
  sub_250E64EF8(v20, v26, type metadata accessor for SleepingSampleHelpTileVariant);
  char v23 = sub_250E729F0((uint64_t)v14, v22);
  sub_250E64E98(v22, type metadata accessor for SleepingSampleHelpTileVariant);
  sub_250E64E98((uint64_t)v17, (uint64_t (*)(void))sub_250E64A88);
  sub_250E64E98((uint64_t)v19, (uint64_t (*)(void))sub_250E64A88);
  sub_250E64E98((uint64_t)v14, type metadata accessor for SleepingSampleHelpTileVariant);
  sub_250E64E98((uint64_t)v10, (uint64_t (*)(void))sub_250E64A88);
  return (v23 & 1) != 0;
}

void sub_250E66858()
{
  if (!qword_269B0CC60)
  {
    sub_250E64A88(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B0CC60);
    }
  }
}

uint64_t HealthBalanceAppDelegate.notificationCenterDelegate(for:)(uint64_t a1)
{
  if (a1 != 15) {
    return 0;
  }
  swift_unknownObjectRetain();
  return v1;
}

uint64_t sub_250E668F4(uint64_t a1)
{
  if (a1 != 15) {
    return 0;
  }
  swift_unknownObjectRetain();
  return v1;
}

uint64_t HealthBalanceAppDelegate.userNotificationCenter(_:didReceive:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&dword_269B0CC78 + dword_269B0CC78);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_250E532C8;
  return v6(a2);
}

uint64_t sub_250E66B74(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  uint64_t v12 = (uint64_t (*)(id))((char *)&dword_269B0CC78 + dword_269B0CC78);
  id v8 = a1;
  id v9 = a2;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_250E66C5C;
  return v12(v9);
}

uint64_t sub_250E66C5C()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 32);
  int v3 = *(void **)(*v0 + 24);
  uint64_t v4 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_250E66DCC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_250E67A04;
  return v6();
}

uint64_t sub_250E66E98(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_250E67A04;
  return v7();
}

uint64_t sub_250E66F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E7ACF8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_250E7ACE8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_250E679A8(a1, &qword_269B0C9C0, MEMORY[0x263F8F520]);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_250E7ACB8();
    sub_250E7A5B8();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_250E67124(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_250E799E8();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  sub_250E67954(0, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
  v2[7] = swift_task_alloc();
  uint64_t v4 = sub_250E79A18();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = sub_250E79908();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_250E672E4, 0, 0);
}

uint64_t sub_250E672E4()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[10];
  uint64_t v15 = v0[12];
  uint64_t v16 = v0[11];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[7];
  uint64_t v13 = v0[6];
  uint64_t v14 = v0[8];
  uint64_t v5 = v0[5];
  uint64_t v12 = v0[4];
  uint64_t v6 = (void *)v0[3];
  sub_250E79A08();
  uint64_t v7 = *MEMORY[0x263F42B18];
  uint64_t v8 = sub_250E799B8();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 104))(v4, v7, v8);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v13, *MEMORY[0x263F42B48], v12);
  sub_250E799A8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v13, v12);
  sub_250E679A8(v4, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v14);
  (*(void (**)(uint64_t))((*MEMORY[0x263F8EED0] & *v6) + 0x58))(v1);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v16);
  sub_250E79AE8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

unint64_t sub_250E67528()
{
  unint64_t result = qword_269B0CC80;
  if (!qword_269B0CC80)
  {
    type metadata accessor for HealthBalanceAppDelegate();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CC80);
  }
  return result;
}

uint64_t sub_250E67580()
{
  _Block_release(*(const void **)(v0 + 32));
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_250E675D0()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_250E67A04;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_269B0CCF0 + dword_269B0CCF0);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_250E67694()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_250E67A04;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_269B0CD00 + dword_269B0CD00);
  return v6(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  sub_250E7A5B8();
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_250E67798(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_250E67A04;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_269B0CD10 + dword_269B0CD10);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_250E67864()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250E6789C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_250E532C8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269B0CD20 + dword_269B0CD20);
  return v6(a1, v4);
}

void sub_250E67954(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_250E7AE78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_250E679A8(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_250E67954(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_250E67A08()
{
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  v22[0] = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_250E7AB68();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_250E79BB8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)v22 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v22 - v12;
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  sub_250E621C4((uint64_t)v13);
  sub_250E79BA8();
  sub_250E685F0();
  char v14 = sub_250E7AEA8();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v11, v4);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v13, v4);
  if (v14)
  {
    sub_250E79B98();
    char v16 = sub_250E7AEA8();
    v15(v11, v4);
    v15(v8, v4);
    if (v16) {
      goto LABEL_7;
    }
  }
  else
  {
    v15(v8, v4);
  }
  sub_250E79B98();
  char v17 = sub_250E7AEA8();
  v15(v11, v4);
  if ((v17 & 1) == 0)
  {
    sub_250E79BA8();
    sub_250E7AEA8();
    v15(v11, v4);
  }
LABEL_7:
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v19 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v20 = sub_250E7ABC8();
  v15(v13, v4);
  return v20;
}

uint64_t sub_250E67E8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250E79958();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_250E7AB68();
  MEMORY[0x270FA5388](v3 - 8);
  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for BalanceOnboardingIntroViewController();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  objc_msgSend(v0, sel_hxui_addCancelButton);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v6 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  uint64_t v7 = (void *)sub_250E7AB78();

  sub_250E68078();
  sub_250E56B90();
  swift_bridgeObjectRelease();
  return sub_250E7ADF8();
}

uint64_t sub_250E68078()
{
  uint64_t v1 = sub_250E79BB8();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  id v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)v12 - v6;
  v12[0] = 0xD000000000000015;
  v12[1] = 0x8000000250E7F440;
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  sub_250E621C4((uint64_t)v7);
  sub_250E79B98();
  sub_250E685F0();
  char v8 = sub_250E7AEA8();
  objc_super v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v5, v1);
  if (v8) {
    sub_250E7AC18();
  }
  sub_250E79BA8();
  char v10 = sub_250E7AEA8();
  v9(v5, v1);
  if (v10) {
    sub_250E7AC18();
  }
  v9(v7, v1);
  return v12[0];
}

id sub_250E68578()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalanceOnboardingIntroViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalanceOnboardingIntroViewController()
{
  return self;
}

ValueMetadata *type metadata accessor for BalanceOnboardingIntroViewControllerModel()
{
  return &type metadata for BalanceOnboardingIntroViewControllerModel;
}

unint64_t sub_250E685F0()
{
  unint64_t result = qword_269B0CC30;
  if (!qword_269B0CC30)
  {
    sub_250E79BB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CC30);
  }
  return result;
}

uint64_t sub_250E68648(uint64_t a1)
{
  return a1;
}

unint64_t sub_250E68670(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_250E68A64();
  uint64_t v2 = sub_250E7B078();
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
    sub_250E68AD0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_250E68908(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_250E68BA0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_250E68798()
{
  sub_250E7A5B8();
  sub_250E7A5B8();
  sub_250E7A5B8();
  sub_250E7A5B8();
  sub_250E7A5B8();
  return MEMORY[0x270FA0228](v0, 56, 7);
}

unint64_t sub_250E687F0()
{
  unint64_t result = qword_26B20C790;
  if (!qword_26B20C790)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B20C790);
  }
  return result;
}

uint64_t sub_250E68830()
{
  return sub_250E3D550(&qword_26B20C448, (void (*)(uint64_t))sub_250E41D28);
}

uint64_t sub_250E68864()
{
  return sub_250E3D550(&qword_26B20C468, (void (*)(uint64_t))sub_250E41A24);
}

void sub_250E68898()
{
  if (!qword_26B20C7D0)
  {
    type metadata accessor for HKFeatureIdentifier(255);
    sub_250E687F0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_26B20C7D0);
    }
  }
}

unint64_t sub_250E68908(uint64_t a1, uint64_t a2)
{
  sub_250E7B188();
  sub_250E7AC08();
  uint64_t v4 = sub_250E7B1A8();
  return sub_250E68980(a1, a2, v4);
}

unint64_t sub_250E68980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_250E7B148() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_250E7B148() & 1) == 0);
    }
  }
  return v6;
}

void sub_250E68A64()
{
  if (!qword_269B0CDA8)
  {
    unint64_t v0 = sub_250E7B088();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0CDA8);
    }
  }
}

uint64_t sub_250E68AD0(uint64_t a1, uint64_t a2)
{
  sub_250E68B34();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250E68B34()
{
  if (!qword_269B0CDB0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B0CDB0);
    }
  }
}

_OWORD *sub_250E68BA0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t (*sub_250E68BB0())()
{
  return j__swift_endAccess;
}

id sub_250E68C2C()
{
  return sub_250E3ED88((SEL *)&selRef_unregisterObserver_);
}

void sub_250E68C38(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = a1;
  sub_250E691DC((uint64_t)v6);
  sub_250E7A5B8();
}

void sub_250E68CB8()
{
}

id sub_250E68CFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HKFeatureStatusPublisher.Inner();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250E68D70(void *a1)
{
  objc_super v2 = (void *)MEMORY[0x263F8EED0];
  swift_release();
  uint64_t v3 = (char *)a1 + *(void *)((*v2 & *a1) + 0x68);
  uint64_t v4 = sub_250E7A808();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  return sub_250E7A5B8();
}

void (*sub_250E68E78(void *a1))(void *a1)
{
  objc_super v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_250E68BB0();
  return sub_250E46444;
}

uint64_t sub_250E68ED0()
{
  type metadata accessor for HKFeatureStatusPublisher.Inner();
  return sub_250E7A7A8();
}

uint64_t sub_250E68F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for HKFeatureStatusPublisher.Inner();
  return MEMORY[0x270F35098](a1, v5, a3);
}

uint64_t sub_250E68F94()
{
  return sub_250E7A7C8();
}

uint64_t sub_250E68FE0()
{
  return sub_250E7A8A8();
}

uint64_t HKFeatureStatusProviding.publisher.getter()
{
  return sub_250E7A9E8();
}

uint64_t sub_250E69044()
{
  sub_250E7A5B8();
  return MEMORY[0x270FA0238](v0, 33, 7);
}

uint64_t sub_250E6907C()
{
  sub_250E7A5B8();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250E690B8()
{
  uint64_t result = sub_250E7A808();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HKFeatureStatusPublisher()
{
  return &type metadata for HKFeatureStatusPublisher;
}

uint64_t sub_250E69174()
{
  return swift_getWitnessTable();
}

uint64_t sub_250E69190()
{
  return swift_getWitnessTable();
}

uint64_t sub_250E691AC()
{
  return swift_getWitnessTable();
}

uint64_t sub_250E691C8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 88);
}

uint64_t sub_250E691D0()
{
  return MEMORY[0x263F8E658];
}

uint64_t sub_250E691DC(uint64_t a1)
{
  sub_250E7A7E8();
  swift_getWitnessTable();
  uint64_t v2 = sub_250E7B1B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v7 - v4;
  v7[1] = a1;
  type metadata accessor for HKFeatureStatusPublisher.Inner();
  swift_getWitnessTable();
  sub_250E7A7A8();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_250E69370()
{
}

void sub_250E693A0()
{
  if (!qword_26B20C528)
  {
    sub_250E69450(255);
    sub_250E3DE80(&qword_26B20C638, sub_250E69450);
    unint64_t v0 = sub_250E7A958();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B20C528);
    }
  }
}

void sub_250E69450(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for BalanceArticleTileDataController()
{
  return &type metadata for BalanceArticleTileDataController;
}

double sub_250E69494@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_250E7A888();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_250E7B0B8();
  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_250E7A858();
    swift_bridgeObjectRetain_n();
    BOOL v11 = sub_250E7A878();
    os_log_type_t v12 = sub_250E7AD18();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v21 = v18;
      *(_DWORD *)uint64_t v13 = 136446466;
      uint64_t v14 = sub_250E3FFA8(0xD000000000000020, 0x8000000250E7D700, &v21);
      uint64_t v19 = v6;
      uint64_t v20 = v14;
      sub_250E7AE88();
      *(_WORD *)(v13 + 12) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v20 = sub_250E3FFA8(a1, a2, &v21);
      sub_250E7AE88();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_250E38000, v11, v12, "[%{public}s] Article identifier %{public}s could not be found", (uint8_t *)v13, 0x16u);
      uint64_t v15 = v18;
      swift_arrayDestroy();
      MEMORY[0x25338C970](v15, -1, -1);
      MEMORY[0x25338C970](v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    double result = 0.0;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
  }
  else
  {
    uint64_t v19 = sub_250E7A2F8();
    *(void *)(a3 + 24) = &type metadata for AboutBalanceArticleDataProvider;
    *(void *)(a3 + 32) = sub_250E42E44();
    *(void *)(a3 + 40) = sub_250E42DF0();
    uint64_t v16 = (void *)v19;
  }
  return result;
}

uint64_t sub_250E6978C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v4 = sub_250E79988();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E3CB44();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v43 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250E79B38();
  uint64_t v39 = *(void *)(v9 - 8);
  uint64_t v40 = v9;
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  os_log_type_t v12 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v41 = (char *)v37 - v13;
  sub_250E69D98(0, &qword_26B20BD10, MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)v37 - v15;
  uint64_t v17 = sub_250E79B88();
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v21 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  char v23 = (char *)v37 - v22;
  uint64_t v24 = sub_250E79C08();
  uint64_t v25 = *(void *)(v24 + 16);
  if (v25)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v18 + 16))(v16, v24+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(void *)(v18 + 72) * (v25 - 1), v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v16, 0, 1, v17);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_250E69D20((uint64_t)v16);
  }
  else
  {
    v37[0] = v6;
    v37[1] = v2;
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v16, v17);
    char v26 = sub_250E79B58();
    os_log_type_t v27 = *(uint64_t (**)(char *, char *, uint64_t))(v18 + 16);
    uint64_t v28 = v27(v21, v23, v17);
    uint64_t v38 = a2;
    if (v26)
    {
      uint64_t v29 = MEMORY[0x25338ACC0](v28);
      char v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v21, v17);
      if (v29 >= v42)
      {
        sub_250E79B48();
        sub_250E79BF8();
        sub_250E79B28();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v12, v40);
        sub_250E79AF8();
        sub_250E69D98(0, &qword_269B0CE20, MEMORY[0x263F8E0F8]);
        unint64_t v33 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
        uint64_t v34 = swift_allocObject();
        *(_OWORD *)(v34 + 16) = xmmword_250E7BB70;
        v27((char *)(v34 + v33), v23, v17);
        uint64_t v35 = v38;
        sub_250E79BE8();
        v30(v23, v17);
        uint64_t v36 = sub_250E79C18();
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
      }
    }
    else
    {
      char v30 = *(void (**)(char *, uint64_t))(v18 + 8);
      v30(v21, v17);
    }
    v30(v23, v17);
    a2 = v38;
  }
  uint64_t v31 = sub_250E79C18();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(a2, 1, 1, v31);
}

unint64_t sub_250E69CC8()
{
  unint64_t result = qword_26B20C610;
  if (!qword_26B20C610)
  {
    sub_250E7AA78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20C610);
  }
  return result;
}

uint64_t sub_250E69D20(uint64_t a1)
{
  sub_250E69D98(0, &qword_26B20BD10, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_250E69D98(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_250E79B88();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void *sub_250E69DF8(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_250E79B38();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_250E69ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_250E69F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_250E6A004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_250E6A098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E6A0AC);
}

uint64_t sub_250E6A0AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_250E6A17C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E6A190);
}

uint64_t sub_250E6A190(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_250E79B38();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t sub_250E6A250()
{
  uint64_t result = sub_250E79B38();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_250E6A2F0(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_250E79B38();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
    *((unsigned char *)a1 + *(int *)(v8 + 20)) = *((unsigned char *)a2 + *(int *)(v8 + 20));
    uint64_t v9 = *(int *)(v8 + 24);
    unint64_t v10 = (void *)((char *)a1 + v9);
    int v11 = (void *)((char *)a2 + v9);
    uint64_t v12 = v11[1];
    *unint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = *(int *)(a3 + 20);
    uint64_t v14 = *(void **)((char *)a2 + v13);
    *(void *)((char *)a1 + v13) = v14;
    swift_bridgeObjectRetain();
    id v15 = v14;
  }
  return a1;
}

uint64_t sub_250E6A3EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = *(int *)(v7 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  unint64_t v10 = (void *)(a2 + v8);
  *uint64_t v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = *(void **)(a2 + v11);
  uint64_t v13 = *(void **)(a1 + v11);
  *(void *)(a1 + v11) = v12;
  id v14 = v12;

  return a1;
}

uint64_t sub_250E6A4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_250E6A550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  *(unsigned char *)(a1 + *(int *)(v7 + 20)) = *(unsigned char *)(a2 + *(int *)(v7 + 20));
  uint64_t v8 = *(int *)(v7 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  unint64_t v10 = (uint64_t *)(a2 + v8);
  uint64_t v12 = *v10;
  uint64_t v11 = v10[1];
  *uint64_t v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(a3 + 20);
  id v14 = *(void **)(a1 + v13);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);

  return a1;
}

uint64_t sub_250E6A604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E6A618);
}

uint64_t sub_250E6A618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_250E6A6D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E6A6EC);
}

uint64_t sub_250E6A6EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_250E6A7A8()
{
  uint64_t result = _s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_250E6A840()
{
  return MEMORY[0x263F8E4E0];
}

uint64_t sub_250E6A84C()
{
  return sub_250E3EE60(&qword_26B20C6F8, (void (*)(uint64_t))_s43SleepingSampleDaySummaryCollectionPublisherVMa);
}

uint64_t sub_250E6A894()
{
  uint64_t v1 = *(void *)(_s43SleepingSampleDaySummaryCollectionPublisherV13ConfigurationVMa(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_250E79B38();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_release();
  return MEMORY[0x270FA0238](v0, v5, v4);
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_269B0CE48);
}

uint64_t sub_250E6A9C0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_250E6AA18@<X0>(uint64_t a1@<X8>)
{
  char v2 = sub_250E79CC8();
  uint64_t v3 = sub_250E7A0C8();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  unint64_t v5 = (unsigned int *)MEMORY[0x263F435D0];
  if (v2) {
    unint64_t v5 = (unsigned int *)MEMORY[0x263F435C8];
  }
  uint64_t v6 = *v5;
  return v4(a1, v6, v3);
}

void sub_250E6AAAC(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_250E7A0C8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = sub_250E79CC8();
  uint64_t v7 = (unsigned int *)MEMORY[0x263F435D0];
  if (v6) {
    uint64_t v7 = (unsigned int *)MEMORY[0x263F435C8];
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *v7, v2);
  sub_250E7A128();
  sub_250E7A0F8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v9 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  unint64_t v10 = (void *)sub_250E7AB78();
  id v11 = objc_msgSend(self, sel_imageNamed_inBundle_, v10, v9);

  if (v11)
  {
    sub_250E6ACD8();
    sub_250E7A578();
    uint64_t v12 = sub_250E7A588();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_250E6ACD8()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7A0C8();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  char v6 = &v21[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v21[-v7];
  char v9 = sub_250E79CC8();
  unint64_t v10 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 104);
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F435C8];
    v10(v8, v11, v2);
  }
  else
  {
    v10(v8, *MEMORY[0x263F435D0], v2);
    uint64_t v11 = *MEMORY[0x263F435C8];
  }
  v10(v6, v11, v2);
  sub_250E7A0B8();
  uint64_t v12 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
  v12(v6, v2);
  v12(v8, v2);
  sub_250E40670(0, &qword_269B0C970);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_250E7C4E0;
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = self;
  id v16 = objc_msgSend(v15, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v13 + 32) = sub_250E7ABC8();
  *(void *)(v13 + 40) = v17;
  sub_250E7AAF8();
  id v18 = objc_msgSend(v15, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  *(void *)(v13 + 48) = sub_250E7ABC8();
  *(void *)(v13 + 56) = v19;
  return v13;
}

uint64_t sub_250E6B0F4()
{
  id v0 = sub_250E6C1F4();
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = sub_250E6B188();
    if (v2)
    {
      id v3 = v2;
      sub_250E40670(0, (unint64_t *)&qword_26B20C818);
      uint64_t v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_250E7D890;
      *(void *)(v4 + 32) = v1;
      *(void *)(v4 + 40) = v3;
      uint64_t v6 = v4;
      sub_250E7AC68();
      return v6;
    }
  }
  return MEMORY[0x263F8EE78];
}

id sub_250E6B188()
{
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7AB68();
  MEMORY[0x270FA5388](v2 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v4 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v5 = self;
  uint64_t v6 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v6, v0, sel_setNotificationsEnabled_, sel_areNotificationsEnabled, 0, 6, 0);

  if (v7)
  {
    uint64_t v8 = (void *)sub_250E7AB78();
    objc_msgSend(v7, sel_setIdentifier_, v8);

    char v9 = (void *)sub_250E7ACA8();
    objc_msgSend(v7, sel_setProperty_forKey_, v9, *MEMORY[0x263F5FEF8]);
  }
  return v7;
}

id sub_250E6B3B4(void *a1)
{
  id v1 = a1;
  sub_250E79CC8();
  uint64_t v2 = (void *)sub_250E7ACA8();

  return v2;
}

uint64_t sub_250E6B40C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_250E7AA48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_250E7AA68();
  uint64_t v8 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  unint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_BOOLValue);
  sub_250E79CD8();
  sub_250E6C0D4();
  uint64_t v11 = (void *)sub_250E7ADD8();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = v2 + qword_269B0CE30;
  swift_beginAccess();
  MEMORY[0x25338CA60](v13);
  *(void *)(v12 + 24) = *(void *)(v13 + 8);
  swift_unknownObjectWeakInit();
  sub_250E7A5B8();
  aBlock[4] = sub_250E6C14C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_250E6B7B4;
  aBlock[3] = &block_descriptor;
  id v14 = _Block_copy(aBlock);
  swift_release();
  sub_250E7AA58();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_250E6C430(&qword_269B0CE70, MEMORY[0x263F8F030]);
  sub_250E6C3CC(0, &qword_269B0CE78, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
  sub_250E6C16C();
  sub_250E7AED8();
  MEMORY[0x25338BF40](0, v10, v7, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v16);
}

uint64_t sub_250E6B74C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t result = MEMORY[0x25338CA60](v1);
  if (result)
  {
    swift_getObjectType();
    sub_250E7A568();
    return sub_250E7A5B8();
  }
  return result;
}

uint64_t sub_250E6B7B4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_250E6B7F8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_250E6B40C(v4);
}

void sub_250E6B860()
{
}

uint64_t sub_250E6B890()
{
  swift_release();
  uint64_t v1 = v0 + qword_269B0CE30;
  return sub_250E6C0AC(v1);
}

id sub_250E6B8D0()
{
  return sub_250E6C064(type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource);
}

uint64_t sub_250E6B8E8(uint64_t a1)
{
  swift_release();
  uint64_t v2 = a1 + qword_269B0CE30;
  return sub_250E6C0AC(v2);
}

uint64_t sub_250E6B934()
{
  return type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource(0);
}

uint64_t type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_269B0CE58);
}

uint64_t sub_250E6B95C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_250E6B99C()
{
  uint64_t v1 = v0 + qword_269B0CE30;
  swift_beginAccess();
  return MEMORY[0x25338CA60](v1);
}

uint64_t sub_250E6B9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + qword_269B0CE30;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return sub_250E7A5B8();
}

void (*sub_250E6BA58(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = qword_269B0CE30;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x25338CA60](v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_250E6BAE0;
}

void sub_250E6BAE0(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    sub_250E7A5B8();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    sub_250E7A5B8();
  }
  free(v3);
}

void (*sub_250E6BB70(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_250E7A598();
  return sub_250E46444;
}

id sub_250E6BBE8(uint64_t a1, char *a2, int a3)
{
  uint64_t v25 = a2;
  v24[1] = a3;
  uint64_t v5 = sub_250E79958();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v6 = sub_250E7AB68();
  MEMORY[0x270FA5388](v6 - 8);
  sub_250E6C3CC(0, &qword_269B0CE88, MEMORY[0x263F43A90], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v24 - v8;
  uint64_t v10 = sub_250E7A248();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, (uint64_t)a2, v10);
  id v15 = (char *)objc_allocWithZone((Class)type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource(0));
  *(void *)&v15[qword_269B0CE30 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v15[qword_269B0CE28] = a1;
  v14(v9, (uint64_t)v13, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  swift_retain();
  uint64_t v16 = (void *)sub_250E7A238();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v11 + 8);
  v17(v13, v10);
  sub_250E6C430(&qword_269B0CE90, (void (*)(uint64_t))type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsDataSource);
  id v18 = v16;
  id v19 = (id)sub_250E7A4D8();
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v21 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v22 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setTitle_, v22);

  swift_release();
  v17(v25, v10);
  return v19;
}

void sub_250E6BFC0()
{
}

void sub_250E6C01C()
{
}

id sub_250E6C04C()
{
  return sub_250E6C064(type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController);
}

id sub_250E6C064(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_250E6C0A4()
{
  return type metadata accessor for SleepingSampleAnalysisHealthChecklistSettingsViewController(0);
}

uint64_t sub_250E6C0AC(uint64_t a1)
{
  return a1;
}

unint64_t sub_250E6C0D4()
{
  unint64_t result = qword_269B0CE68;
  if (!qword_269B0CE68)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0CE68);
  }
  return result;
}

uint64_t sub_250E6C114()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_250E6C14C()
{
  return sub_250E6B74C(v0);
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

unint64_t sub_250E6C16C()
{
  unint64_t result = qword_269B0CE80;
  if (!qword_269B0CE80)
  {
    sub_250E6C3CC(255, &qword_269B0CE78, MEMORY[0x263F8F030], MEMORY[0x263F8D488]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CE80);
  }
  return result;
}

id sub_250E6C1F4()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = self;
  objc_super v3 = (void *)sub_250E7AB78();
  id v4 = objc_msgSend(v2, sel_groupSpecifierWithID_, v3);

  if (v4)
  {
    sub_250E7AAF8();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v6 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_250E79948();
    sub_250E7ABC8();
    uint64_t v7 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setProperty_forKey_, v7, *MEMORY[0x263F600F8]);
  }
  return v4;
}

void sub_250E6C3CC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_250E6C430(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for BalancePromotionFeedItemProvider()
{
  return &type metadata for BalancePromotionFeedItemProvider;
}

unint64_t sub_250E6C490()
{
  unint64_t result = qword_26B20BDB8;
  if (!qword_26B20BDB8)
  {
    type metadata accessor for BalancePromotionFeedItemViewActionHandler();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BDB8);
  }
  return result;
}

uint64_t sub_250E6C4E8()
{
  return MEMORY[0x263F8D6F8];
}

uint64_t sub_250E6C4F4()
{
  return MEMORY[0x263F8D6D0];
}

uint64_t sub_250E6C500@<X0>(uint64_t a1@<X8>)
{
  v19[2] = a1;
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7AB68();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_250E7A0E8();
  MEMORY[0x270FA5388](v3 - 8);
  v19[1] = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250E7A888();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v9 = sub_250E7A878();
  os_log_type_t v10 = sub_250E7AD38();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    v21[0] = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    v19[0] = v5;
    uint64_t v20 = sub_250E3FFA8(0xD000000000000020, 0x8000000250E7D980, v21);
    sub_250E7AE88();
    *(_WORD *)(v11 + 12) = 2082;
    uint64_t v20 = sub_250E3FFA8(0xD00000000000001ALL, 0x8000000250E7FA10, v21);
    sub_250E7AE88();
    _os_log_impl(&dword_250E38000, v9, v10, "[%{public}s.%{public}s] creating balance promo tile configuration", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v12, -1, -1);
    MEMORY[0x25338C970](v11, -1, -1);

    (*(void (**)(char *, void))(v6 + 8))(v8, v19[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_250E6CD6C();
  sub_250E7AE38();
  sub_250E7A0D8();
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v14 = self;
  id v15 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  sub_250E7AAF8();
  id v16 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  sub_250E7AAF8();
  id v17 = objc_msgSend(v14, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  return sub_250E7A1C8();
}

uint64_t sub_250E6C9F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_250E7A888();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  unint64_t v8 = sub_250E7A878();
  os_log_type_t v9 = sub_250E7AD38();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = a1;
    uint64_t v11 = v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v18 = sub_250E3FFA8(0xD000000000000020, 0x8000000250E7D980, &v19);
    sub_250E7AE88();
    *(_WORD *)(v11 + 12) = 2082;
    uint64_t v18 = sub_250E3FFA8(0xD000000000000026, 0x8000000250E7FA30, &v19);
    sub_250E7AE88();
    _os_log_impl(&dword_250E38000, v8, v9, "[%{public}s.%{public}s] customizing promo feed item", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v12, -1, -1);
    uint64_t v13 = v11;
    a1 = v17;
    MEMORY[0x25338C970](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v14 = sub_250E79E48();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(a2, a1, v14);
  type metadata accessor for BalancePromotionFeedItemViewActionHandler();
  sub_250E57040();
  return sub_250E79E28();
}

uint64_t sub_250E6CC84(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_250E6CDAC();
  return MEMORY[0x270F34AF0](a1, a2, v4);
}

void sub_250E6CCDC(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(unsigned char *)(a1 + 8) = 1;
}

uint64_t sub_250E6CCF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_250E42D34();
  return MEMORY[0x270F34870](a1, a2, a3, v6);
}

uint64_t sub_250E6CD4C()
{
  return 0x6C61427055746553;
}

unint64_t sub_250E6CD6C()
{
  unint64_t result = qword_269B0CE98;
  if (!qword_269B0CE98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0CE98);
  }
  return result;
}

unint64_t sub_250E6CDAC()
{
  unint64_t result = qword_26B20BDA0;
  if (!qword_26B20BDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B20BDA0);
  }
  return result;
}

id _s22HealthBalanceAppPlugin0abC8DelegateC30createDetailRoomViewController3for7contextSo06UIViewJ0CSgSo12HKObjectTypeC_0A12ExperienceUI04DataoG13ConfigurationV7ContextVtF_0(void *a1, uint64_t a2)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_250E7A888();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  BOOL v37 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v38 = (char *)&v35 - v6;
  uint64_t v7 = sub_250E7A448();
  uint64_t v36 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  os_log_type_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_250E7A438();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = objc_msgSend(a1, sel_identifier);
  uint64_t v15 = sub_250E7ABA8();
  uint64_t v17 = v16;

  if (v15 == 0xD00000000000001DLL && v17 == 0x8000000250E7FA60)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v41, v10);
    id v19 = objc_allocWithZone((Class)type metadata accessor for BalanceRoomViewController());
    return BalanceRoomViewController.init(context:)((uint64_t)v13);
  }
  char v18 = sub_250E7B148();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_5;
  }
  uint64_t v46 = 0;
  memset(v45, 0, sizeof(v45));
  sub_250E6D480((uint64_t)v45, (uint64_t)&v42);
  if (v43)
  {
    sub_250E6D5A8(&v42, (uint64_t)v44);
    __swift_project_boxed_opaque_existential_1(v44, v44[3]);
    sub_250E7A5E8();
    uint64_t v29 = v41;
    sub_250E7A3F8();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v29, v10);
    id v30 = objc_allocWithZone((Class)sub_250E7A468());
    id v31 = a1;
    uint64_t v20 = sub_250E7A458();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v9, v7);
    sub_250E6D54C((uint64_t)v45);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v44);
  }
  else
  {
    sub_250E6D54C((uint64_t)&v42);
    id v21 = v38;
    sub_250E7A868();
    id v22 = a1;
    char v23 = sub_250E7A878();
    os_log_type_t v24 = sub_250E7AD18();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      char v26 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 138412290;
      v44[0] = v22;
      id v27 = v22;
      sub_250E7AE88();
      *char v26 = v22;

      _os_log_impl(&dword_250E38000, v23, v24, "[HealthBalanceAppDelegate] No custom detail view controller or configuration provided for %@", v25, 0xCu);
      sub_250E64FC8();
      swift_arrayDestroy();
      MEMORY[0x25338C970](v26, -1, -1);
      uint64_t v28 = v25;
      id v21 = v38;
      MEMORY[0x25338C970](v28, -1, -1);
    }
    else
    {
    }
    uint64_t v33 = v39;
    uint64_t v32 = v40;

    (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v32);
    sub_250E6D54C((uint64_t)v45);
    return 0;
  }
  return (id)v20;
}

uint64_t sub_250E6D480(uint64_t a1, uint64_t a2)
{
  sub_250E6D4E4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_250E6D4E4()
{
  if (!qword_269B0CEA0)
  {
    sub_250E47DF4(255, &qword_269B0CEA8);
    unint64_t v0 = sub_250E7AE78();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269B0CEA0);
    }
  }
}

uint64_t sub_250E6D54C(uint64_t a1)
{
  sub_250E6D4E4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_250E6D5A8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

id sub_250E6D5C0()
{
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7AB68();
  MEMORY[0x270FA5388](v2 - 8);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v6 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  sub_250E7AAF8();
  id v7 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v8 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for BalanceOnboardingNotificationsViewController();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithTitle_detailText_icon_contentLayout_, v6, v8, 0, 1);

  return v9;
}

uint64_t sub_250E6D7E0()
{
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7AB68();
  MEMORY[0x270FA5388](v2 - 8);
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for BalanceOnboardingNotificationsViewController();
  objc_msgSendSuper2(&v12, sel_viewDidLoad);
  objc_msgSend(v0, sel_hxui_addCancelButton);
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v4 = self;
  id v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v6 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  id v7 = (void *)sub_250E7AB78();

  sub_250E7AAF8();
  id v8 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  id v9 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)sub_250E7AB78();

  sub_250E566AC();
  return sub_250E7ADF8();
}

uint64_t sub_250E6DAF8()
{
  uint64_t v1 = sub_250E79A48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(v0, sel_navigationController);
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  type metadata accessor for BalanceOnboardingNavigationController();
  if (!swift_dynamicCastClass())
  {

    goto LABEL_10;
  }
  sub_250E74088();

  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F42BA8], v1);
  char v7 = sub_250E75844((uint64_t)v0, v4);
  swift_release();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if ((v7 & 1) == 0) {
    return result;
  }
  id v9 = objc_msgSend(v0, sel_navigationController);
  if (!v9)
  {
LABEL_10:
    uint64_t result = sub_250E7B058();
    __break(1u);
    return result;
  }
  uint64_t v10 = v9;
  if (!swift_dynamicCastClass())
  {

    goto LABEL_10;
  }
  uint64_t v11 = sub_250E74088();

  sub_250E49768(v11 + 16, (uint64_t)v14);
  swift_release();
  objc_super v12 = __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  sub_250E49768((uint64_t)v12, (uint64_t)v13);
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  sub_250E61D5C(1);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
}

uint64_t sub_250E6DD88()
{
  uint64_t v1 = sub_250E79A48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_msgSend(v0, sel_navigationController);
  if (v5)
  {
    uint64_t v6 = v5;
    type metadata accessor for BalanceOnboardingNavigationController();
    if (swift_dynamicCastClass())
    {
      sub_250E74088();

      (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F42B98], v1);
      sub_250E75ED8((uint64_t)v0, v4);
      swift_release();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      id v7 = objc_msgSend(v0, sel_navigationController);
      if (v7)
      {
        id v8 = v7;
        if (swift_dynamicCastClass())
        {
          uint64_t v9 = sub_250E74088();

          sub_250E49768(v9 + 16, (uint64_t)v13);
          swift_release();
          uint64_t v10 = __swift_project_boxed_opaque_existential_1(v13, v13[3]);
          sub_250E49768((uint64_t)v10, (uint64_t)v12);
          __swift_project_boxed_opaque_existential_1(v12, v12[3]);
          sub_250E61D5C(0);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
          return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
        }
      }
    }
    else
    {
    }
  }
  uint64_t result = sub_250E7B058();
  __break(1u);
  return result;
}

uint64_t sub_250E6E010()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_navigationController);
  if (!v2) {
    goto LABEL_7;
  }
  uint64_t v3 = v2;
  type metadata accessor for BalanceOnboardingNavigationController();
  if (!swift_dynamicCastClass()) {
    goto LABEL_6;
  }
  uint64_t v4 = sub_250E74088();

  sub_250E49768(v4 + 16, (uint64_t)v9);
  swift_release();
  id v5 = __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_250E49768((uint64_t)v5, (uint64_t)v8);
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  sub_250E61D5C(2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  id v6 = objc_msgSend(v1, sel_navigationController);
  if (v6)
  {
    uint64_t v3 = v6;
    if (swift_dynamicCastClass())
    {
      sub_250E74088();

      sub_250E75B4C();
      return swift_release();
    }
LABEL_6:
  }
LABEL_7:
  uint64_t result = sub_250E7B058();
  __break(1u);
  return result;
}

id sub_250E6E228()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BalanceOnboardingNotificationsViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalanceOnboardingNotificationsViewController()
{
  return self;
}

uint64_t static SleepingSampleHelpTileViewController.bundleClassName.getter()
{
  uint64_t v1 = sub_250E79A88();
  sub_250E7AC18();
  sub_250E7B218();
  sub_250E7AC18();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_250E6E2E4(uint64_t a1, void *a2)
{
  sub_250E732DC(a1, (uint64_t)v5, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  sub_250E73270((uint64_t)v5, v3, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
  swift_endAccess();
  sub_250E6E394();
  return sub_250E7376C((uint64_t)v5, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
}

uint64_t sub_250E6E394()
{
  v25[3] = swift_getObjectType();
  uint64_t v1 = sub_250E7A888();
  uint64_t v26 = *(void *)(v1 - 8);
  uint64_t v27 = v1;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)v25 - v3;
  sub_250E707D0(0, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  MEMORY[0x270FA5388](v5 - 8);
  id v7 = (char *)v25 - v6;
  id v8 = (void *)(v0 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context);
  uint64_t result = swift_beginAccess();
  uint64_t v10 = v8[3];
  if (v10)
  {
    uint64_t v11 = __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    uint64_t v12 = *(void *)(v10 - 8);
    MEMORY[0x270FA5388](v11);
    id v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    uint64_t v15 = sub_250E7A4B8();
    unint64_t v17 = v16;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
    if (v17 >> 60 == 15)
    {
      sub_250E7A858();
      char v18 = sub_250E7A878();
      os_log_type_t v19 = sub_250E7AD18();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        uint64_t v29 = v21;
        *(_DWORD *)uint64_t v20 = 136446210;
        uint64_t v22 = sub_250E7B218();
        uint64_t v28 = sub_250E3FFA8(v22, v23, &v29);
        sub_250E7AE88();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v18, v19, "[%{public}s] Could not find userData", v20, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v21, -1, -1);
        MEMORY[0x25338C970](v20, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v4, v27);
    }
    else
    {
      sub_250E79868();
      swift_allocObject();
      sub_250E79858();
      uint64_t v24 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
      sub_250E7305C(&qword_269B0CF78, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
      sub_250E79848();
      swift_release();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v7, 0, 1, v24);
      sub_250E6ED78((uint64_t)v7);
      return sub_250E48E50(v15, v17);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_250E6E9DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  return sub_250E732DC(v3, a1, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
}

unint64_t sub_250E6EA4C()
{
  unint64_t result = qword_269B0C780;
  if (!qword_269B0C780)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0C780);
  }
  return result;
}

uint64_t sub_250E6EAA4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  sub_250E73270(a1, v3, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
  swift_endAccess();
  sub_250E6E394();
  return sub_250E7376C(a1, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
}

uint64_t (*sub_250E6EB48(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_250E6EBA8;
}

uint64_t sub_250E6EBA8(uint64_t a1, char a2)
{
  uint64_t result = swift_endAccess();
  if ((a2 & 1) == 0) {
    return sub_250E6E394();
  }
  return result;
}

uint64_t sub_250E6EBDC()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  sub_250E71E54();
  sub_250E72388();
  sub_250E72758();
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v3 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  return sub_250E7A6F8();
}

uint64_t sub_250E6ED78(uint64_t a1)
{
  sub_250E707D0(0, &qword_269B0CF70, MEMORY[0x263F44868]);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v17 - v4;
  sub_250E707D0(0, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v17 - v7;
  uint64_t v9 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration;
  swift_beginAccess();
  sub_250E73270(a1, v13, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  swift_endAccess();
  sub_250E732DC(v13, (uint64_t)v8, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_250E7376C((uint64_t)v8, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  }
  else
  {
    sub_250E730A4((uint64_t)v8, (uint64_t)v12, type metadata accessor for SleepingSampleHelpTileConfiguration);
    id v14 = sub_250E6F058();
    sub_250E6EBDC();
    uint64_t v15 = sub_250E7A708();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v5, 0, 1, v15);
    sub_250E7A718();

    sub_250E73348((uint64_t)v12, type metadata accessor for SleepingSampleHelpTileConfiguration);
  }
  return sub_250E7376C(a1, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
}

id sub_250E6F058()
{
  uint64_t v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView);
  }
  else
  {
    uint64_t v4 = v0;
    sub_250E7A728();
    id v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    sub_250E7A6E8();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_250E7A378();
    swift_release();
    swift_release();
    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_250E6F1A4(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x25338CA60](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    sub_250E73420();
  }
}

id SleepingSampleHelpTileViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id SleepingSampleHelpTileViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = &v3[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  id v7 = &v3[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration];
  uint64_t v8 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(void *)&v3[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView] = 0;
  if (a2)
  {
    uint64_t v9 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  id v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, v9, a3);

  return v10;
}

uint64_t type metadata accessor for SleepingSampleHelpTileConfiguration(uint64_t a1)
{
  return sub_250E3CE2C(a1, qword_26B20C1F0);
}

uint64_t type metadata accessor for SleepingSampleHelpTileViewController(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_269B0CED0);
}

id SleepingSampleHelpTileViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SleepingSampleHelpTileViewController.init(coder:)(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context];
  *(_OWORD *)id v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  uint64_t v4 = &v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_configuration];
  uint64_t v5 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *(void *)&v1[OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController____lazy_storage___tileView] = 0;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  id v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

id SleepingSampleHelpTileViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepingSampleHelpTileViewController(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_250E6F6F0()
{
  return sub_250E7305C(&qword_269B0CEC8, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileViewController);
}

uint64_t sub_250E6F7D0(void *a1)
{
  objc_super v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E0C0];
  sub_250E73208(0, &qword_269B0CF50, (uint64_t (*)(void))sub_250E7310C, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v24 = *(void *)(v3 - 8);
  uint64_t v25 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v23 = (char *)&v23 - v4;
  sub_250E73208(0, &qword_269B0CF58, (uint64_t (*)(void))sub_250E73160, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys, v2);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v26 = (char *)&v23 - v6;
  uint64_t v7 = sub_250E79AD8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v30 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v10 - 8);
  objc_super v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E73208(0, &qword_269B0CF60, (uint64_t (*)(void))sub_250E731B4, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.CodingKeys, v2);
  uint64_t v31 = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v23 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E731B4();
  sub_250E7B1D8();
  sub_250E72FA4(v29, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7) == 1)
  {
    char v33 = 1;
    sub_250E7310C();
    uint64_t v17 = v23;
    uint64_t v18 = v31;
    sub_250E7B108();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v25);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v18);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v30, v12, v7);
    char v32 = 0;
    sub_250E73160();
    uint64_t v20 = v26;
    uint64_t v21 = v31;
    sub_250E7B108();
    sub_250E7305C(&qword_269B0CF68, MEMORY[0x263F42BC0]);
    uint64_t v22 = v28;
    sub_250E7B118();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v22);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v30, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v21);
  }
}

uint64_t sub_250E6FCA4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x263F8E040];
  sub_250E73208(0, &qword_269B0CF18, (uint64_t (*)(void))sub_250E7310C, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys, MEMORY[0x263F8E040]);
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v47 = (char *)&v37 - v5;
  sub_250E73208(0, &qword_269B0CF28, (uint64_t (*)(void))sub_250E73160, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys, v3);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  uint64_t v43 = v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v46 = (char *)&v37 - v8;
  sub_250E73208(0, &qword_269B0CF38, (uint64_t (*)(void))sub_250E731B4, (uint64_t)&type metadata for SleepingSampleHelpTileVariant.CodingKeys, v3);
  uint64_t v10 = v9;
  uint64_t v45 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  objc_super v12 = (char *)&v37 - v11;
  uint64_t v13 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  unint64_t v16 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v37 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E731B4();
  os_log_type_t v19 = v48;
  sub_250E7B1C8();
  if (v19) {
    goto LABEL_7;
  }
  uint64_t v38 = v16;
  uint64_t v39 = v18;
  uint64_t v20 = v46;
  uint64_t v21 = v47;
  uint64_t v48 = a1;
  uint64_t v22 = sub_250E7B0F8();
  unint64_t v23 = v12;
  if (*(void *)(v22 + 16) != 1)
  {
    uint64_t v26 = sub_250E7AFD8();
    swift_allocError();
    uint64_t v28 = v27;
    sub_250E5C434();
    *uint64_t v28 = v13;
    sub_250E7B0D8();
    sub_250E7AFB8();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, *MEMORY[0x263F8DCB0], v26);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v23, v10);
    a1 = v48;
LABEL_7:
    uint64_t v30 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_1Tm(v30);
  }
  if (*(unsigned char *)(v22 + 32))
  {
    char v50 = 1;
    sub_250E7310C();
    sub_250E7B0C8();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v41);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v10);
    uint64_t v24 = sub_250E79AD8();
    uint64_t v25 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v39, 1, 1, v24);
  }
  else
  {
    char v49 = 0;
    sub_250E73160();
    uint64_t v29 = v20;
    sub_250E7B0C8();
    uint64_t v32 = sub_250E79AD8();
    sub_250E7305C(&qword_269B0CF48, MEMORY[0x263F42BC0]);
    uint64_t v33 = (uint64_t)v38;
    uint64_t v34 = v42;
    sub_250E7B0E8();
    uint64_t v35 = v29;
    uint64_t v36 = v45;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v10);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v33, 0, 1, v32);
    uint64_t v25 = (uint64_t)v39;
    sub_250E730A4(v33, (uint64_t)v39, type metadata accessor for SleepingSampleHelpTileVariant);
  }
  sub_250E730A4(v25, v44, type metadata accessor for SleepingSampleHelpTileVariant);
  uint64_t v30 = (uint64_t)v48;
  return __swift_destroy_boxed_opaque_existential_1Tm(v30);
}

uint64_t sub_250E70324@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v3 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v3);
  os_log_type_t v19 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E73208(0, &qword_269B0CEF0, (uint64_t (*)(void))sub_250E73008, (uint64_t)&type metadata for SleepingSampleHelpTileConfiguration.CodingKeys, MEMORY[0x263F8E040]);
  uint64_t v6 = v5;
  uint64_t v18 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v16 - v7;
  uint64_t v9 = type metadata accessor for SleepingSampleHelpTileConfiguration(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E73008();
  uint64_t v12 = v20;
  sub_250E7B1C8();
  if (!v12)
  {
    uint64_t v13 = v18;
    sub_250E7305C(&qword_269B0CF00, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileVariant);
    uint64_t v14 = (uint64_t)v19;
    sub_250E7B0E8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v6);
    sub_250E730A4(v14, (uint64_t)v11, type metadata accessor for SleepingSampleHelpTileVariant);
    sub_250E730A4((uint64_t)v11, v17, type metadata accessor for SleepingSampleHelpTileConfiguration);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_250E705DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin36SleepingSampleHelpTileViewController_context;
  swift_beginAccess();
  return sub_250E732DC(v3, a2, &qword_269B0C778, (void (*)(uint64_t))sub_250E6EA4C);
}

uint64_t sub_250E70654()
{
  return type metadata accessor for SleepingSampleHelpTileViewController(0);
}

void sub_250E7065C()
{
  sub_250E707D0(319, &qword_269B0CEE0, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileConfiguration);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SleepingSampleHelpTileViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SleepingSampleHelpTileViewController);
}

uint64_t dispatch thunk of SleepingSampleHelpTileViewController.context.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SleepingSampleHelpTileViewController.context.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SleepingSampleHelpTileViewController.context.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

void sub_250E707D0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_250E7AE78();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *sub_250E70824(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(type metadata accessor for SleepingSampleHelpTileVariant(0) - 8);
  int v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_250E79AD8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t type metadata accessor for SleepingSampleHelpTileVariant(uint64_t a1)
{
  return sub_250E3CE2C(a1, (uint64_t *)&unk_26B20BDD8);
}

void *sub_250E7099C(void *a1, const void *a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_250E70AA8(void *a1, void *a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *sub_250E70C20(void *a1, const void *a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *sub_250E70D2C(void *a1, void *a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, v4);
  int v8 = v6(a2, 1, v4);
  if (!v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, v4);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(a1, v4);
    goto LABEL_6;
  }
  if (v8)
  {
LABEL_6:
    uint64_t v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t sub_250E70EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E70EB8);
}

uint64_t sub_250E70EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_250E70F24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E70F38);
}

uint64_t sub_250E70F38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_250E70FA8()
{
  uint64_t result = type metadata accessor for SleepingSampleHelpTileVariant(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_250E71034(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_250E79AD8();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_250E71180(uint64_t a1)
{
  uint64_t v2 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_250E71250(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79AD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_250E71360(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79AD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_250E714D4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79AD8();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_250E715E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_250E79AD8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_250E71758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_250E7176C);
}

uint64_t sub_250E7176C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79AD8();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2) {
    return v5 - 1;
  }
  else {
    return 0;
  }
}

uint64_t sub_250E717D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_250E717EC);
}

uint64_t sub_250E717EC(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 1);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_250E79AD8();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);
  return v7(a1, v5, a3, v6);
}

uint64_t sub_250E7186C(uint64_t a1)
{
  uint64_t v2 = sub_250E79AD8();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);
  return v3(a1, 1, v2);
}

uint64_t sub_250E718D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, 1, v4);
}

uint64_t sub_250E71944()
{
  uint64_t result = sub_250E79AD8();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

BOOL sub_250E719BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_250E719D4()
{
  if (*v0) {
    return 0xD000000000000010;
  }
  else {
    return 0xD000000000000014;
  }
}

uint64_t sub_250E71A14@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250E73E28(a1, a2);
  *a3 = result;
  return result;
}

void sub_250E71A3C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_250E71A48(uint64_t a1)
{
  unint64_t v2 = sub_250E731B4();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E71A84(uint64_t a1)
{
  unint64_t v2 = sub_250E731B4();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E71AC0(uint64_t a1)
{
  unint64_t v2 = sub_250E73160();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E71AFC(uint64_t a1)
{
  unint64_t v2 = sub_250E73160();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E71B38(uint64_t a1)
{
  unint64_t v2 = sub_250E7310C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E71B74(uint64_t a1)
{
  unint64_t v2 = sub_250E7310C();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E71BB4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_250E6FCA4(a1, a2);
}

uint64_t sub_250E71BCC(void *a1)
{
  return sub_250E6F7D0(a1);
}

uint64_t sub_250E71BE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_250E73F14(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_250E71C14(uint64_t a1)
{
  unint64_t v2 = sub_250E73008();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_250E71C50(uint64_t a1)
{
  unint64_t v2 = sub_250E73008();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_250E71C90@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_250E70324(a1, a2);
}

uint64_t sub_250E71CA8(void *a1)
{
  sub_250E73208(0, &qword_269B0CF08, (uint64_t (*)(void))sub_250E73008, (uint64_t)&type metadata for SleepingSampleHelpTileConfiguration.CodingKeys, MEMORY[0x263F8E0C0]);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_250E73008();
  sub_250E7B1D8();
  type metadata accessor for SleepingSampleHelpTileVariant(0);
  sub_250E7305C(&qword_269B0CF10, (void (*)(uint64_t))type metadata accessor for SleepingSampleHelpTileVariant);
  sub_250E7B118();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

id sub_250E71E54()
{
  uint64_t v1 = sub_250E7A828();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250E79AD8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E72FA4(v0, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
  {
    sub_250E40A50(0, (unint64_t *)&qword_269B0CE98);
    uint64_t v12 = (void *)sub_250E7AE38();
    uint64_t v13 = (void *)sub_250E7AB78();
    id v14 = objc_msgSend(self, sel_imageNamed_inBundle_, v13, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    switch(sub_250E79AC8())
    {
      case 1:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C730 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D0A8;
        break;
      case 2:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C738 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D0C0;
        break;
      case 3:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C740 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D0D8;
        break;
      case 4:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C748 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D0F0;
        break;
      case 5:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C750 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D108;
        break;
      case 6:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C758 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D120;
        break;
      default:
        sub_250E40A50(0, &qword_269B0C7C0);
        if (qword_269B0C728 != -1) {
          swift_once();
        }
        uint64_t v15 = qword_269B0D090;
        break;
    }
    uint64_t v16 = __swift_project_value_buffer(v1, (uint64_t)v15);
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v16, v1);
    id v14 = (id)sub_250E7AE28();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v14;
}

uint64_t sub_250E72388()
{
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7AB68();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = sub_250E7AB48();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E72FA4(v0, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_250E7AAF8();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v12 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_250E79948();
    return sub_250E7ABC8();
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
  sub_250E7AB38();
  sub_250E7AB28();
  uint64_t v14 = sub_250E79AA8();
  uint64_t result = sub_250E79AC8();
  if (!__OFSUB__(v14, result))
  {
    v18[2] = v14 - result;
    sub_250E7AB08();
    sub_250E7AB28();
    sub_250E7AB58();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t v16 = swift_getObjCClassFromMetadata();
    id v17 = objc_msgSend(self, sel_bundleForClass_, v16);
    sub_250E79948();
    uint64_t v13 = sub_250E7ABC8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_250E72758()
{
  uint64_t v1 = sub_250E79958();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7AB68();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E72FA4(v0, (uint64_t)v5);
  uint64_t v6 = sub_250E79AD8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6) == 1)
  {
    sub_250E7AAF8();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v8 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_250E79948();
    return sub_250E7ABC8();
  }
  else
  {
    sub_250E7AAF8();
    type metadata accessor for HealthBalanceAppPlugin();
    uint64_t v10 = swift_getObjCClassFromMetadata();
    id v11 = objc_msgSend(self, sel_bundleForClass_, v10);
    sub_250E79948();
    uint64_t v9 = sub_250E7ABC8();
    sub_250E73348((uint64_t)v5, type metadata accessor for SleepingSampleHelpTileVariant);
  }
  return v9;
}

uint64_t sub_250E729F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E72F40();
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_250E72FA4(a1, (uint64_t)v14);
  sub_250E72FA4(a2, v15);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) == 1)
  {
    char v17 = 1;
    int v18 = v16(v15, 1, v4);
    os_log_type_t v19 = type metadata accessor for SleepingSampleHelpTileVariant;
    if (v18 == 1) {
      goto LABEL_8;
    }
  }
  else
  {
    sub_250E72FA4((uint64_t)v14, (uint64_t)v10);
    if (v16(v15, 1, v4) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      char v17 = sub_250E79AB8();
      uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
      v20(v7, v4);
      v20(v10, v4);
      os_log_type_t v19 = type metadata accessor for SleepingSampleHelpTileVariant;
      goto LABEL_8;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  char v17 = 0;
  os_log_type_t v19 = (uint64_t (*)(void))sub_250E72F40;
LABEL_8:
  sub_250E73348((uint64_t)v14, v19);
  return v17 & 1;
}

uint64_t sub_250E72C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_250E79AD8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E72F40();
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 56)];
  sub_250E72FA4(a1, (uint64_t)v14);
  sub_250E72FA4(a2, v15);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v16((uint64_t)v14, 1, v4) == 1)
  {
    int v17 = v16(v15, 1, v4);
    int v18 = (uint64_t (*)(void))sub_250E72F40;
    if (v17 == 1) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v19 = 0;
    goto LABEL_8;
  }
  sub_250E72FA4((uint64_t)v14, (uint64_t)v10);
  if (v16(v15, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    uint64_t v19 = 0;
    int v18 = (uint64_t (*)(void))sub_250E72F40;
    goto LABEL_8;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
  char v20 = sub_250E79AB8();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v7, v4);
  v21(v10, v4);
  int v18 = type metadata accessor for SleepingSampleHelpTileVariant;
  if ((v20 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v19 = 1;
  int v18 = type metadata accessor for SleepingSampleHelpTileVariant;
LABEL_8:
  sub_250E73348((uint64_t)v14, v18);
  return v19;
}

void sub_250E72F40()
{
  if (!qword_269B0CEE8)
  {
    type metadata accessor for SleepingSampleHelpTileVariant(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269B0CEE8);
    }
  }
}

uint64_t sub_250E72FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SleepingSampleHelpTileVariant(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_250E73008()
{
  unint64_t result = qword_269B0CEF8;
  if (!qword_269B0CEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CEF8);
  }
  return result;
}

uint64_t sub_250E7305C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E730A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_250E7310C()
{
  unint64_t result = qword_269B0CF20;
  if (!qword_269B0CF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF20);
  }
  return result;
}

unint64_t sub_250E73160()
{
  unint64_t result = qword_269B0CF30;
  if (!qword_269B0CF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF30);
  }
  return result;
}

unint64_t sub_250E731B4()
{
  unint64_t result = qword_269B0CF40;
  if (!qword_269B0CF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF40);
  }
  return result;
}

void sub_250E73208(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
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

uint64_t sub_250E73270(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_250E707D0(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a2, a1, v6);
  return a2;
}

uint64_t sub_250E732DC(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  sub_250E707D0(0, a3, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a2, a1, v6);
  return a2;
}

uint64_t sub_250E73348(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_250E733E0()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_250E73418()
{
  sub_250E6F1A4(v0);
}

id sub_250E73420()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  sub_250E707D0(0, &qword_269B0C978, MEMORY[0x263F06EA8]);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = &v15[-v3];
  uint64_t v5 = sub_250E79908();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v10 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  sub_250E798F8();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return (id)sub_250E7376C((uint64_t)v4, &qword_269B0C978, MEMORY[0x263F06EA8]);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id result = objc_msgSend(self, sel_defaultWorkspace);
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = (void *)sub_250E798D8();
    sub_250E68670(MEMORY[0x263F8EE78]);
    uint64_t v14 = (void *)sub_250E7AAB8();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_openSensitiveURL_withOptions_, v13, v14);

    return (id)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_250E7376C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_250E707D0(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepingSampleHelpTileVariant.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for SleepingSampleHelpTileVariant.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x250E73924);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_250E7394C(unsigned char *result, char a2)
{
  *id result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileVariant.CodingKeys()
{
  return &type metadata for SleepingSampleHelpTileVariant.CodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys()
{
  return &type metadata for SleepingSampleHelpTileVariant.EstablishingBaselineCodingKeys;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys()
{
  return &type metadata for SleepingSampleHelpTileVariant.RefiningBaselineCodingKeys;
}

unsigned char *_s22HealthBalanceAppPlugin29SleepingSampleHelpTileVariantO30EstablishingBaselineCodingKeysOwst_0(unsigned char *result, int a2, int a3)
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
        *id result = a2;
        return result;
      case 2:
        *(_WORD *)id result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)id result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *id result = 0;
      break;
    case 2:
      *(_WORD *)id result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x250E73A28);
    case 4:
      *(_DWORD *)id result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepingSampleHelpTileConfiguration.CodingKeys()
{
  return &type metadata for SleepingSampleHelpTileConfiguration.CodingKeys;
}

unint64_t sub_250E73A64()
{
  unint64_t result = qword_269B0CF80;
  if (!qword_269B0CF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF80);
  }
  return result;
}

unint64_t sub_250E73ABC()
{
  unint64_t result = qword_269B0CF88;
  if (!qword_269B0CF88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF88);
  }
  return result;
}

unint64_t sub_250E73B14()
{
  unint64_t result = qword_269B0CF90;
  if (!qword_269B0CF90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF90);
  }
  return result;
}

unint64_t sub_250E73B6C()
{
  unint64_t result = qword_269B0CF98;
  if (!qword_269B0CF98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CF98);
  }
  return result;
}

unint64_t sub_250E73BC4()
{
  unint64_t result = qword_269B0CFA0;
  if (!qword_269B0CFA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFA0);
  }
  return result;
}

unint64_t sub_250E73C1C()
{
  unint64_t result = qword_269B0CFA8;
  if (!qword_269B0CFA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFA8);
  }
  return result;
}

unint64_t sub_250E73C74()
{
  unint64_t result = qword_269B0CFB0;
  if (!qword_269B0CFB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFB0);
  }
  return result;
}

unint64_t sub_250E73CCC()
{
  unint64_t result = qword_269B0CFB8;
  if (!qword_269B0CFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFB8);
  }
  return result;
}

unint64_t sub_250E73D24()
{
  unint64_t result = qword_269B0CFC0;
  if (!qword_269B0CFC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFC0);
  }
  return result;
}

unint64_t sub_250E73D7C()
{
  unint64_t result = qword_269B0CFC8;
  if (!qword_269B0CFC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFC8);
  }
  return result;
}

unint64_t sub_250E73DD4()
{
  unint64_t result = qword_269B0CFD0;
  if (!qword_269B0CFD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFD0);
  }
  return result;
}

uint64_t sub_250E73E28(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014 && a2 == 0x8000000250E7FD20 || (sub_250E7B148() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000250E7FD40)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v5 = sub_250E7B148();
    swift_bridgeObjectRelease();
    if (v5) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_250E73F14(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x746E6169726176 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_250E7B148();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_250E73F9C()
{
  return 0x746E6169726176;
}

id BalanceOnboardingNavigationController.__allocating_init(healthStore:presentationContext:)(uint64_t a1, char *a2)
{
  char v5 = objc_allocWithZone(v2);
  char v6 = *a2;
  *(void *)&v5[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(void *)&v5[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = a1;
  v5[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v6;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

Swift::Void __swiftcall BalanceOnboardingNavigationController.prepareForPresentation()()
{
  sub_250E74088();
  sub_250E7619C();
  swift_release();
  objc_msgSend(v0, sel_setModalPresentationStyle_, 2);
}

uint64_t sub_250E74088()
{
  uint64_t v1 = OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator))
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator);
  }
  else
  {
    uint64_t v2 = sub_250E740F0(v0);
    *(void *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_250E740F0(uint64_t a1)
{
  uint64_t v2 = sub_250E79C78();
  char v3 = *(void **)(a1 + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore);
  sub_250E40A50(0, (unint64_t *)&qword_269B0CE68);
  id v4 = v3;
  sub_250E7ADD8();
  uint64_t v5 = sub_250E79C68();
  void v27[3] = v2;
  void v27[4] = sub_250E74824();
  v27[0] = v5;
  uint64_t v25 = &type metadata for BalanceOnboardingManager;
  uint64_t v26 = &off_2701ECD28;
  uint64_t v6 = swift_allocObject();
  *(void *)&long long v24 = v6;
  *(void *)(v6 + 56) = v4;
  sub_250E49768((uint64_t)v27, v6 + 16);
  id v7 = v4;
  sub_250E79CA8();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
  sub_250E6D5A8(&v24, (uint64_t)v27);
  sub_250E40A50(0, &qword_269B0CFF8);
  objc_super v8 = (void *)sub_250E7AE68();
  id v9 = objc_allocWithZone(MEMORY[0x263F0A0C0]);
  id v10 = objc_msgSend(v9, sel_initWithLoggingCategory_healthDataSource_, v8, v7, (void)v24);

  id v11 = objc_allocWithZone(MEMORY[0x263F75EA8]);
  id v12 = v7;
  uint64_t v13 = (void *)sub_250E7AB78();
  id v14 = objc_msgSend(v11, sel_initWithIdentifier_healthStore_, v13, v12);

  char v15 = *(unsigned char *)(a1
                 + OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext);
  uint64_t v25 = &type metadata for BalanceOnboardingModel;
  uint64_t v26 = (char **)&off_2701EC938;
  *(void *)&long long v24 = swift_allocObject();
  sub_250E748F4((uint64_t)v27, v24 + 16);
  type metadata accessor for BalanceOnboardingCoordinator();
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v24, (uint64_t)&type metadata for BalanceOnboardingModel);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v20 + 16))(v19);
  *(void *)(v16 + 40) = &type metadata for BalanceOnboardingModel;
  *(void *)(v16 + 48) = &off_2701EC938;
  uint64_t v21 = swift_allocObject();
  *(void *)(v16 + 16) = v21;
  long long v22 = *((_OWORD *)v19 + 1);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)v19;
  *(_OWORD *)(v21 + 32) = v22;
  *(void *)(v21 + 48) = *((void *)v19 + 4);
  *(void *)(v16 + 56) = v10;
  *(void *)(v16 + 64) = v12;
  *(void *)(v16 + 72) = v14;
  *(unsigned char *)(v16 + 80) = v15;
  swift_unknownObjectUnownedInit();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v24);
  sub_250E74950((uint64_t)v27);
  return v16;
}

id BalanceOnboardingNavigationController.init(healthStore:presentationContext:)(uint64_t a1, char *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  char v6 = *a2;
  *(void *)&v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController____lazy_storage___coordinator] = 0;
  *(void *)&v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_healthStore] = a1;
  v2[OBJC_IVAR____TtC22HealthBalanceAppPlugin37BalanceOnboardingNavigationController_presentationContext] = v6;
  v8.receiver = v2;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
}

id BalanceOnboardingNavigationController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);
  return objc_msgSend(v5, sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void BalanceOnboardingNavigationController.init(navigationBarClass:toolbarClass:)()
{
}

id BalanceOnboardingNavigationController.__allocating_init(rootViewController:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void BalanceOnboardingNavigationController.init(rootViewController:)()
{
}

id BalanceOnboardingNavigationController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    char v6 = (void *)sub_250E7AB78();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void BalanceOnboardingNavigationController.init(nibName:bundle:)()
{
}

id BalanceOnboardingNavigationController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BalanceOnboardingNavigationController()
{
  return self;
}

uint64_t method lookup function for BalanceOnboardingNavigationController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BalanceOnboardingNavigationController);
}

uint64_t dispatch thunk of BalanceOnboardingNavigationController.__allocating_init(healthStore:presentationContext:)()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

unint64_t sub_250E74824()
{
  unint64_t result = qword_269B0CFF0;
  if (!qword_269B0CFF0)
  {
    sub_250E79C78();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CFF0);
  }
  return result;
}

uint64_t sub_250E7487C()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_250E748BC()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_250E748F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_250E74950(uint64_t a1)
{
  return a1;
}

uint64_t sub_250E749A4@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v3 = sub_250E7A888();
  uint64_t v32 = *(void *)(v3 - 8);
  uint64_t v33 = v3;
  MEMORY[0x270FA5388](v3);
  id v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_250E799E8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  id v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v13 = (char *)v28 - v12;
  MEMORY[0x270FA5388](v11);
  char v15 = (char *)v28 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v16((char *)v28 - v14, (uint64_t)a1, v6);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v15, v6);
  if (v17 == *MEMORY[0x263F42B58])
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    char v19 = 2;
  }
  else if (v17 == *MEMORY[0x263F42B60])
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    char v19 = 7;
  }
  else
  {
    sub_250E7A858();
    v16(v13, (uint64_t)a1, v6);
    uint64_t v20 = sub_250E7A878();
    os_log_type_t v21 = sub_250E7AD28();
    uint64_t v31 = v20;
    int v30 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      uint64_t v36 = v29;
      *(_DWORD *)uint64_t v22 = 136446466;
      v28[0] = v22 + 4;
      uint64_t v35 = sub_250E3FFA8(0xD000000000000024, 0x8000000250E7E230, &v36);
      v28[1] = &v36;
      sub_250E7AE88();
      *(_WORD *)(v22 + 12) = 2082;
      v28[0] = v22 + 14;
      v16(v10, (uint64_t)v13, v6);
      uint64_t v23 = sub_250E7ABD8();
      uint64_t v35 = sub_250E3FFA8(v23, v24, &v36);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      uint64_t v25 = *(void (**)(char *, uint64_t))(v7 + 8);
      v25(v13, v6);
      uint64_t v26 = v31;
      _os_log_impl(&dword_250E38000, v31, (os_log_type_t)v30, "[%{public}s] unknown url source: %{public}s", (uint8_t *)v22, 0x16u);
      uint64_t v27 = v29;
      swift_arrayDestroy();
      MEMORY[0x25338C970](v27, -1, -1);
      MEMORY[0x25338C970](v22, -1, -1);
    }
    else
    {

      uint64_t v25 = *(void (**)(char *, uint64_t))(v7 + 8);
      v25(v13, v6);
    }
    v25(a1, v6);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v33);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v15, v6);
    char v19 = 6;
  }
  *uint64_t v34 = v19;
  return result;
}

id sub_250E74DD0()
{
  uint64_t v1 = sub_250E7A888();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = (id *)MEMORY[0x263F75B10];
  switch(*v0)
  {
    case 1:
    case 4:
      id v5 = (id *)MEMORY[0x263F75B20];
      break;
    case 2:
    case 7:
      id v5 = (id *)MEMORY[0x263F75B08];
      break;
    case 3:
      id v5 = (id *)MEMORY[0x263F75B18];
      break;
    case 5:
      id v5 = (id *)MEMORY[0x263F75B40];
      break;
    case 6:
      sub_250E7A858();
      uint64_t v6 = sub_250E7A878();
      os_log_type_t v7 = sub_250E7AD28();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = swift_slowAlloc();
        uint64_t v9 = swift_slowAlloc();
        uint64_t v19 = v9;
        *(_DWORD *)uint64_t v8 = 136446466;
        uint64_t v18 = sub_250E3FFA8(0xD000000000000024, 0x8000000250E7E230, &v19);
        sub_250E7AE88();
        *(_WORD *)(v8 + 12) = 2082;
        LOBYTE(v18) = 6;
        uint64_t v10 = sub_250E7ABD8();
        uint64_t v18 = sub_250E3FFA8(v10, v11, &v19);
        sub_250E7AE88();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_250E38000, v6, v7, "[%{public}s] unknown presentation context: %{public}s", (uint8_t *)v8, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x25338C970](v9, -1, -1);
        MEMORY[0x25338C970](v8, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      id v5 = (id *)MEMORY[0x263F75B48];
      break;
    default:
      break;
  }
  id v12 = *v5;
  uint64_t v13 = (void *)*MEMORY[0x263F75B60];
  id v14 = objc_allocWithZone(MEMORY[0x263F75E30]);
  id v15 = v13;
  id v16 = objc_msgSend(v14, sel_initWithSource_presentation_, v15, v12);

  return v16;
}

uint64_t sub_250E750D0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4 = sub_250E7A888();
  uint64_t v35 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_250E7A2C8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v29 - v12;
  id v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v14((char *)v29 - v12, a1, v7);
  int v15 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v13, v7);
  if (v15 == *MEMORY[0x263F43BA0])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    char v17 = 5;
  }
  else if (v15 == *MEMORY[0x263F43BE0])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    char v17 = 4;
  }
  else if (v15 == *MEMORY[0x263F43BF8])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    char v17 = 1;
  }
  else if (v15 == *MEMORY[0x263F43BD8])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    char v17 = 0;
  }
  else if (v15 == *MEMORY[0x263F43BB0])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
    char v17 = 3;
  }
  else
  {
    sub_250E7A858();
    v14(v11, a1, v7);
    uint64_t v18 = sub_250E7A878();
    os_log_type_t v19 = sub_250E7AD28();
    int v20 = v19;
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      int v32 = v20;
      uint64_t v22 = v21;
      uint64_t v33 = swift_slowAlloc();
      uint64_t v37 = v33;
      *(_DWORD *)uint64_t v22 = 136446466;
      os_log_t v31 = v18;
      uint64_t v36 = sub_250E3FFA8(0xD000000000000024, 0x8000000250E7E230, &v37);
      int v30 = &v37;
      sub_250E7AE88();
      *(_WORD *)(v22 + 12) = 2082;
      v29[1] = v22 + 14;
      uint64_t v34 = (uint8_t *)v22;
      sub_250E757EC();
      uint64_t v23 = sub_250E7B128();
      uint64_t v36 = sub_250E3FFA8(v23, v24, &v37);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      int v30 = *(uint64_t **)(v8 + 8);
      ((void (*)(char *, uint64_t))v30)(v11, v7);
      os_log_t v25 = v31;
      _os_log_impl(&dword_250E38000, v31, (os_log_type_t)v32, "[%{public}s] unknown presentation context: %{public}s", v34, 0x16u);
      uint64_t v26 = v33;
      swift_arrayDestroy();
      uint64_t v27 = v26;
      uint64_t v28 = v30;
      MEMORY[0x25338C970](v27, -1, -1);
      MEMORY[0x25338C970](v34, -1, -1);
    }
    else
    {

      uint64_t v28 = *(uint64_t **)(v8 + 8);
      ((void (*)(char *, uint64_t))v28)(v11, v7);
    }
    ((void (*)(uint64_t, uint64_t))v28)(a1, v7);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v13, v7);
    char v17 = 6;
  }
  *a2 = v17;
  return result;
}

BOOL static BalanceOnboardingPresentationContext.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t BalanceOnboardingPresentationContext.hash(into:)()
{
  return sub_250E7B198();
}

uint64_t BalanceOnboardingPresentationContext.hashValue.getter()
{
  return sub_250E7B1A8();
}

unint64_t sub_250E75604()
{
  unint64_t result = qword_269B0D000;
  if (!qword_269B0D000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0D000);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BalanceOnboardingPresentationContext(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BalanceOnboardingPresentationContext(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x250E757B4);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BalanceOnboardingPresentationContext()
{
  return &type metadata for BalanceOnboardingPresentationContext;
}

unint64_t sub_250E757EC()
{
  unint64_t result = qword_269B0CA68;
  if (!qword_269B0CA68)
  {
    sub_250E7A2C8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269B0CA68);
  }
  return result;
}

uint64_t sub_250E75844(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_250E7A888();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalanceOnboardingIntroViewController();
  if (swift_dynamicCastClass())
  {
    uint64_t v9 = 0;
  }
  else
  {
    type metadata accessor for BalanceOnboardingNotificationsViewController();
    if (swift_dynamicCastClass()) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  sub_250E7A858();
  uint64_t v10 = sub_250E7A878();
  os_log_type_t v11 = sub_250E7AD38();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v5;
    uint64_t v13 = v12;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v24 = v14;
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v22 = a2;
    uint64_t v15 = sub_250E7B218();
    uint64_t v23 = sub_250E3FFA8(v15, v16, &v24);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    LOBYTE(v23) = v9;
    uint64_t v17 = sub_250E7ABD8();
    uint64_t v23 = sub_250E3FFA8(v17, v18, &v24);
    a2 = v22;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v10, v11, "[%{public}s] primary button tapped from stage %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v14, -1, -1);
    MEMORY[0x25338C970](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v21);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_250E7670C(a2, v9);
  os_log_type_t v19 = __swift_project_boxed_opaque_existential_1((void *)(v3 + 16), *(void *)(v3 + 40));
  if (v9 == 1 && (__swift_project_boxed_opaque_existential_1(v19, v19[3]), (sub_250E61B8C() & 1) == 0))
  {
    sub_250E774AC();
    return 0;
  }
  else
  {
    sub_250E76D68(v9);
    return 1;
  }
}

void sub_250E75B4C()
{
  uint64_t v22 = *v0;
  uint64_t v1 = sub_250E79A48();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250E7A888();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalanceOnboardingIntroViewController();
  if (swift_dynamicCastClass())
  {
    uint64_t v9 = 0;
  }
  else
  {
    type metadata accessor for BalanceOnboardingNotificationsViewController();
    if (swift_dynamicCastClass()) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  sub_250E7A858();
  uint64_t v10 = sub_250E7A878();
  os_log_type_t v11 = sub_250E7AD38();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v6;
    uint64_t v13 = v12;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = v5;
    uint64_t v24 = v19;
    *(_DWORD *)uint64_t v13 = 136446466;
    uint64_t v14 = sub_250E7B218();
    uint64_t v22 = v1;
    uint64_t v23 = sub_250E3FFA8(v14, v15, &v24);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    LOBYTE(v23) = v9;
    uint64_t v16 = sub_250E7ABD8();
    uint64_t v23 = sub_250E3FFA8(v16, v17, &v24);
    uint64_t v1 = v22;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v10, v11, "[%{public}s] cancel button tapped from stage %{public}s", (uint8_t *)v13, 0x16u);
    uint64_t v18 = v19;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v18, -1, -1);
    MEMORY[0x25338C970](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v20);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F42BA0], v1);
  sub_250E7670C(v4, v9);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_250E77AA0();
}

void sub_250E75ED8(uint64_t a1, char *a2)
{
  uint64_t v3 = sub_250E7A888();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BalanceOnboardingIntroViewController();
  if (swift_dynamicCastClass())
  {
    uint64_t v7 = 0;
  }
  else
  {
    type metadata accessor for BalanceOnboardingNotificationsViewController();
    if (swift_dynamicCastClass()) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  sub_250E7A858();
  int v8 = sub_250E7A878();
  os_log_type_t v9 = sub_250E7AD38();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v17 = v3;
    uint64_t v11 = v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v20 = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v18 = a2;
    uint64_t v13 = sub_250E7B218();
    uint64_t v19 = sub_250E3FFA8(v13, v14, &v20);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    LOBYTE(v19) = v7;
    uint64_t v15 = sub_250E7ABD8();
    uint64_t v19 = sub_250E3FFA8(v15, v16, &v20);
    a2 = v18;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v8, v9, "[%{public}s] secondary button tapped from stage %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v12, -1, -1);
    MEMORY[0x25338C970](v11, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_250E7670C(a2, v7);
  sub_250E76D68(v7);
}

void sub_250E7619C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_250E79A48();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_250E7A888();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  os_log_type_t v9 = sub_250E7A878();
  os_log_type_t v10 = sub_250E7AD38();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v36 = v5;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v37 = v3;
    uint64_t v14 = v13;
    v43[0] = v13;
    uint64_t v38 = v2;
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v15 = sub_250E7B218();
    v40[0] = sub_250E3FFA8(v15, v16, v43);
    uint64_t v2 = v38;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v9, v10, "[%{public}s] setting up navigation controller", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v17 = v14;
    uint64_t v3 = v37;
    MEMORY[0x25338C970](v17, -1, -1);
    MEMORY[0x25338C970](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  uint64_t v18 = __swift_project_boxed_opaque_existential_1((void *)(v1 + 16), *(void *)(v1 + 40));
  sub_250E49768((uint64_t)v18, (uint64_t)v43);
  uint64_t v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, v43[3]);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (_OWORD *)((char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v22 + 16))(v21);
  uint64_t v41 = &type metadata for BalanceOnboardingManager;
  uint64_t v42 = &off_2701ECD28;
  uint64_t v23 = (_OWORD *)swift_allocObject();
  v40[0] = v23;
  long long v24 = v21[1];
  v23[1] = *v21;
  v23[2] = v24;
  v23[3] = v21[2];
  id v25 = objc_allocWithZone((Class)type metadata accessor for BalanceOnboardingIntroViewController());
  uint64_t v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v40, (uint64_t)v41);
  MEMORY[0x270FA5388](v26);
  uint64_t v28 = (_OWORD *)((char *)&v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_OWORD *))(v29 + 16))(v28);
  id v30 = sub_250E4985C(v28, v25);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v43);
  os_log_t v31 = v39;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v39, *MEMORY[0x263F42BB0], v2);
  sub_250E7670C(v31, 0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v31, v2);
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  sub_250E794E0(0, (unint64_t *)&qword_26B20C818, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_250E7C4F0;
  *(void *)(v33 + 32) = v30;
  v43[0] = v33;
  sub_250E7AC68();
  sub_250E7952C();
  id v34 = v30;
  uint64_t v35 = (void *)sub_250E7AC48();
  swift_bridgeObjectRelease();
  objc_msgSend(Strong, sel_setViewControllers_animated_, v35, 0);
}

uint64_t sub_250E7670C(char *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v59 = *v2;
  uint64_t v6 = sub_250E79A38();
  uint64_t v56 = *(void *)(v6 - 8);
  uint64_t v57 = v6;
  MEMORY[0x270FA5388](v6);
  int v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_250E79A28();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v53 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v54 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_250E79A48();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v51 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v42 - v16;
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v42 - v18;
  uint64_t v20 = sub_250E7A888();
  uint64_t v49 = *(void *)(v20 - 8);
  uint64_t v50 = v20;
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  id v55 = a1;
  uint64_t v58 = v23;
  v23(v19, a1, v11);
  long long v24 = sub_250E7A878();
  os_log_type_t v25 = sub_250E7AD38();
  int v48 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v46 = v8;
    uint64_t v27 = v26;
    uint64_t v44 = swift_slowAlloc();
    aBlock[0] = v44;
    *(_DWORD *)uint64_t v27 = 136446722;
    uint64_t v45 = a2;
    uint64_t v28 = sub_250E7B218();
    os_log_t v43 = v24;
    uint64_t v60 = sub_250E3FFA8(v28, v29, aBlock);
    unint64_t v47 = v3;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2082;
    v58(v17, v19, v11);
    uint64_t v30 = sub_250E7ABD8();
    uint64_t v60 = sub_250E3FFA8(v30, v31, aBlock);
    uint64_t v3 = v47;
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
    *(_WORD *)(v27 + 22) = 2082;
    LOBYTE(a2) = v45;
    LOBYTE(v60) = v45;
    uint64_t v32 = sub_250E7ABD8();
    uint64_t v60 = sub_250E3FFA8(v32, v33, aBlock);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    os_log_t v34 = v43;
    _os_log_impl(&dword_250E38000, v43, (os_log_type_t)v48, "[%{public}s] submitting action %{public}s for stage %{public}s", (uint8_t *)v27, 0x20u);
    uint64_t v35 = v44;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v35, -1, -1);
    uint64_t v36 = v27;
    int v8 = v46;
    MEMORY[0x25338C970](v36, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
  }
  (*(void (**)(char *, uint64_t))(v49 + 8))(v22, v50);
  v58(v51, v55, v11);
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v54, **((unsigned int **)&unk_26535B8D0 + *((char *)v3 + 80)), v53);
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v8, **((unsigned int **)&unk_26535B910 + (char)a2), v57);
  sub_250E79A68();
  swift_allocObject();
  uint64_t v37 = sub_250E79A58();
  uint64_t v38 = (void *)v3[7];
  uint64_t v39 = swift_allocObject();
  *(void *)(v39 + 16) = v59;
  aBlock[4] = (uint64_t)sub_250E79344;
  aBlock[5] = v39;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_250E78D74;
  aBlock[3] = (uint64_t)&block_descriptor_0;
  uint64_t v40 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v38, sel_submitEvent_completion_, v37, v40);
  _Block_release(v40);
  return swift_release_n();
}

void sub_250E76D68(char a1)
{
  uint64_t v2 = v1;
  uint64_t v64 = *v2;
  uint64_t v4 = sub_250E7A888();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  int v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  uint64_t v11 = (char *)&v60 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v60 - v12;
  uint64_t v14 = sub_250E79A48();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = v2[5];
  uint64_t v65 = v2 + 2;
  uint64_t v19 = __swift_project_boxed_opaque_existential_1(v2 + 2, v18);
  uint64_t v62 = v11;
  uint64_t v63 = v8;
  if (a1)
  {
    if (a1 != 1 || (__swift_project_boxed_opaque_existential_1(v19, v19[3]), (sub_250E61B98() & 1) != 0))
    {
      LODWORD(v20) = 3;
      goto LABEL_8;
    }
    uint64_t v20 = 2;
  }
  else
  {
    uint64_t v20 = 1;
  }
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F42BB0], v14);
  sub_250E7670C(v17, v20);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_8:
  sub_250E7A858();
  uint64_t v21 = sub_250E7A878();
  os_log_type_t v22 = sub_250E7AD38();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v61 = v5;
    uint64_t v24 = v23;
    uint64_t v25 = swift_slowAlloc();
    v66[0] = v25;
    *(_DWORD *)uint64_t v24 = 136446466;
    uint64_t v26 = sub_250E7B218();
    uint64_t v68 = sub_250E3FFA8(v26, v27, v66);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    LOBYTE(v68) = v20;
    sub_250E794E0(0, &qword_269B0D008, (uint64_t)&type metadata for BalanceOnboardingStage, MEMORY[0x263F8D8F0]);
    uint64_t v28 = sub_250E7ABD8();
    uint64_t v68 = sub_250E3FFA8(v28, v29, v66);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v21, v22, "[%{public}s] navigating to next stage: %{public}s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v25, -1, -1);
    uint64_t v30 = v24;
    uint64_t v5 = v61;
    MEMORY[0x25338C970](v30, -1, -1);
  }

  unint64_t v31 = *(void (**)(char *, uint64_t))(v5 + 8);
  v31(v13, v4);
  if (v20 == 1)
  {
    __swift_project_boxed_opaque_existential_1(v65, v2[5]);
    id v40 = sub_250E49540(1u);
    if (v40)
    {
      uint64_t v41 = v40;
      Strong = (void *)swift_unknownObjectUnownedLoadStrong();
      objc_msgSend(Strong, sel_pushViewController_animated_, v41, 1);
    }
  }
  else if (v20 == 2)
  {
    uint64_t v32 = v62;
    sub_250E7A858();
    unint64_t v33 = sub_250E7A878();
    os_log_type_t v34 = sub_250E7AD38();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v61 = v5;
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      v66[0] = v36;
      *(_DWORD *)uint64_t v35 = 136446210;
      uint64_t v37 = sub_250E7B218();
      uint64_t v68 = sub_250E3FFA8(v37, v38, v66);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250E38000, v33, v34, "[%{public}s] vitals onboarding complete, favoriting balance type and pushing sleep onboarding", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v36, -1, -1);
      MEMORY[0x25338C970](v35, -1, -1);

      uint64_t v39 = v62;
    }
    else
    {

      uint64_t v39 = v32;
    }
    v31(v39, v4);
    uint64_t v52 = __swift_project_boxed_opaque_existential_1(v65, v2[5]);
    __swift_project_boxed_opaque_existential_1(v52, v52[3]);
    sub_250E61FA4();
    uint64_t v54 = (void *)v2[8];
    char v55 = *((unsigned char *)v2 + 80);
    v66[0] = v2[9];
    uint64_t v53 = (void *)v66[0];
    v66[1] = (uint64_t)v54;
    char v67 = v55;
    uint64_t v56 = (void *)swift_unknownObjectUnownedLoadStrong();
    id v57 = v53;
    id v58 = v54;
    sub_250E55CB8(v56);
  }
  else
  {
    os_log_t v43 = v63;
    sub_250E7A858();
    uint64_t v44 = sub_250E7A878();
    os_log_type_t v45 = sub_250E7AD38();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v62 = (char *)v4;
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      uint64_t v47 = swift_slowAlloc();
      v66[0] = v47;
      *(_DWORD *)uint64_t v46 = 136446210;
      uint64_t v48 = sub_250E7B218();
      uint64_t v68 = sub_250E3FFA8(v48, v49, v66);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_250E38000, v44, v45, "[%{public}s] vitals onboarding complete, favoriting balance type", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v47, -1, -1);
      MEMORY[0x25338C970](v46, -1, -1);

      uint64_t v51 = (uint64_t)v62;
      uint64_t v50 = v63;
    }
    else
    {

      uint64_t v50 = v43;
      uint64_t v51 = v4;
    }
    v31(v50, v51);
    uint64_t v59 = __swift_project_boxed_opaque_existential_1(v65, v2[5]);
    __swift_project_boxed_opaque_existential_1(v59, v59[3]);
    sub_250E61FA4();
    if (*((unsigned char *)v2 + 80) && *((unsigned char *)v2 + 80) != 3) {
      sub_250E77E28();
    }
    else {
      sub_250E77AA0();
    }
  }
}

void sub_250E774AC()
{
  uint64_t v0 = sub_250E79958();
  MEMORY[0x270FA5388](v0 - 8);
  uint64_t v1 = sub_250E7AB68();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v2 = sub_250E7A888();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v6 = sub_250E7A878();
  os_log_type_t v7 = sub_250E7AD38();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    aBlock[0] = v29;
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v30 = v2;
    uint64_t v9 = sub_250E7B218();
    uint64_t v31 = sub_250E3FFA8(v9, v10, aBlock);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v11 = sub_250E7ABD8();
    uint64_t v31 = sub_250E3FFA8(v11, v12, aBlock);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v6, v7, "[%{public}s] presenting alert for reason: %s", (uint8_t *)v8, 0x16u);
    uint64_t v13 = v29;
    swift_arrayDestroy();
    MEMORY[0x25338C970](v13, -1, -1);
    MEMORY[0x25338C970](v8, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_250E7AAF8();
  type metadata accessor for HealthBalanceAppPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v15 = self;
  id v16 = objc_msgSend(v15, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  uint64_t v30 = sub_250E7ABC8();
  sub_250E7AAF8();
  id v17 = objc_msgSend(v15, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  uint64_t v18 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  uint64_t v19 = self;
  id v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v18, 1, 0);

  sub_250E7AAF8();
  id v21 = objc_msgSend(v15, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_250E79948();
  sub_250E7ABC8();
  os_log_type_t v22 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  aBlock[4] = (uint64_t)sub_250E77D44;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_250E77CDC;
  aBlock[3] = (uint64_t)&block_descriptor_12;
  uint64_t v23 = _Block_copy(aBlock);
  swift_release();
  id v24 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v22, 0, v23);
  _Block_release(v23);

  uint64_t v25 = (void *)sub_250E7AB78();
  swift_bridgeObjectRelease();
  id v26 = objc_msgSend(self, sel_alertControllerWithTitle_message_preferredStyle_, v25, 0, 1);

  objc_msgSend(v26, sel_addAction_, v20);
  objc_msgSend(v26, sel_addAction_, v24);

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  objc_msgSend(Strong, sel_presentViewController_animated_completion_, v26, 1, 0);
}

void sub_250E77AA0()
{
  uint64_t v0 = sub_250E7A888();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v4 = sub_250E7A878();
  os_log_type_t v5 = sub_250E7AD38();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    uint64_t v13 = v0;
    os_log_type_t v7 = (uint8_t *)v6;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v8;
    *(_DWORD *)os_log_type_t v7 = 136446210;
    uint64_t v9 = sub_250E7B218();
    uint64_t v14 = sub_250E3FFA8(v9, v10, &v15);
    sub_250E7AE88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v4, v5, "[%{public}s] dismissing navigation controller", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25338C970](v8, -1, -1);
    MEMORY[0x25338C970](v7, -1, -1);

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v13);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  objc_msgSend(Strong, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_250E77CDC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_250E77D44()
{
  uint64_t v0 = sub_250E7A0A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F43580], v0);
  sub_250E7A098();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_250E77E28()
{
  uint64_t v1 = v0;
  sub_250E67954(0, &qword_269B0C9C0, MEMORY[0x263F8F520]);
  MEMORY[0x270FA5388](v2 - 8);
  id v4 = (char *)&v42 - v3;
  uint64_t v5 = sub_250E799E8();
  uint64_t v54 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v53 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E67954(0, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v51 = (char *)&v42 - v8;
  uint64_t v52 = sub_250E79A18();
  uint64_t v50 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v48 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_250E79908();
  uint64_t v10 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  char v55 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_250E7A888();
  uint64_t v12 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_250E7A858();
  uint64_t v15 = sub_250E7A878();
  os_log_type_t v16 = sub_250E7AD38();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v43 = v5;
    uint64_t v17 = swift_slowAlloc();
    os_log_type_t v45 = v4;
    uint64_t v18 = (uint8_t *)v17;
    uint64_t v19 = swift_slowAlloc();
    uint64_t v46 = v1;
    uint64_t v20 = v19;
    uint64_t v57 = v19;
    *(_DWORD *)uint64_t v18 = 136446210;
    uint64_t v44 = v10;
    uint64_t v21 = sub_250E7B218();
    uint64_t v56 = sub_250E3FFA8(v21, v22, &v57);
    uint64_t v10 = v44;
    sub_250E7AE88();
    uint64_t v5 = v43;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_250E38000, v15, v16, "[%{public}s] navigating to balance room", v18, 0xCu);
    swift_arrayDestroy();
    uint64_t v23 = v20;
    uint64_t v1 = v46;
    MEMORY[0x25338C970](v23, -1, -1);
    id v24 = v18;
    id v4 = v45;
    MEMORY[0x25338C970](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v47);
  uint64_t v25 = v48;
  sub_250E79A08();
  uint64_t v26 = *MEMORY[0x263F42B18];
  uint64_t v27 = sub_250E799B8();
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = (uint64_t)v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 104))(v51, v26, v27);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v28 + 56))(v29, 0, 1, v27);
  uint64_t v31 = v53;
  uint64_t v30 = v54;
  (*(void (**)(char *, void, uint64_t))(v54 + 104))(v53, *MEMORY[0x263F42B68], v5);
  uint64_t v32 = v55;
  sub_250E799A8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v5);
  sub_250E679A8(v29, (unint64_t *)&unk_269B0CD30, MEMORY[0x263F42B38]);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v25, v52);
  id v33 = objc_msgSend(self, sel_defaultWorkspace);
  if (v33)
  {
    os_log_type_t v34 = v33;
    uint64_t v35 = (void *)sub_250E798D8();
    sub_250E68670(MEMORY[0x263F8EE78]);
    uint64_t v36 = (void *)sub_250E7AAB8();
    swift_bridgeObjectRelease();
    objc_msgSend(v34, sel_openSensitiveURL_withOptions_, v35, v36);
  }
  uint64_t v37 = sub_250E7ACF8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v4, 1, 1, v37);
  sub_250E7ACD8();
  swift_retain();
  uint64_t v38 = sub_250E7ACC8();
  uint64_t v39 = (void *)swift_allocObject();
  uint64_t v40 = MEMORY[0x263F8F500];
  v39[2] = v38;
  v39[3] = v40;
  v39[4] = v1;
  sub_250E78954((uint64_t)v4, (uint64_t)&unk_269B0D018, (uint64_t)v39);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v32, v49);
}

uint64_t sub_250E7850C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = sub_250E7B028();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  sub_250E7ACD8();
  v4[6] = sub_250E7ACC8();
  uint64_t v7 = sub_250E7ACB8();
  v4[7] = v7;
  v4[8] = v6;
  return MEMORY[0x270FA2498](sub_250E78600, v7, v6);
}

uint64_t sub_250E78600()
{
  uint64_t v1 = sub_250E7B1E8();
  uint64_t v3 = v2;
  sub_250E7B018();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_269B0D020 + dword_269B0D020);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  void *v4 = v0;
  v4[1] = sub_250E786DC;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_250E786DC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 40);
  uint64_t v4 = *(void *)(*v1 + 32);
  uint64_t v5 = *(void *)(*v1 + 24);
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 64);
  uint64_t v7 = *(void *)(v2 + 56);
  if (v0) {
    uint64_t v8 = sub_250E788E8;
  }
  else {
    uint64_t v8 = sub_250E78874;
  }
  return MEMORY[0x270FA2498](v8, v7, v6);
}

uint64_t sub_250E78874()
{
  swift_release();
  sub_250E77AA0();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_250E788E8()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_250E78954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_250E7ACF8();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_250E7ACE8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_250E679A8(a1, &qword_269B0C9C0, MEMORY[0x263F8F520]);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_250E7ACB8();
    sub_250E7A5B8();
  }
  return swift_task_create();
}

uint64_t sub_250E78AF0(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_250E7A888();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v8 = a2;
    sub_250E7A858();
    id v9 = a2;
    id v10 = a2;
    uint64_t v11 = sub_250E7A878();
    os_log_type_t v12 = sub_250E7AD18();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v21 = v14;
      *(_DWORD *)uint64_t v13 = 136446466;
      uint64_t v15 = sub_250E7B218();
      uint64_t v20 = sub_250E3FFA8(v15, v16, &v21);
      sub_250E7AE88();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2082;
      uint64_t v20 = (uint64_t)a2;
      id v17 = a2;
      sub_250E5F04C();
      uint64_t v18 = sub_250E7ABD8();
      uint64_t v20 = sub_250E3FFA8(v18, v19, &v21);
      sub_250E7AE88();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_250E38000, v11, v12, "[%{public}s] error submitting: %{public}s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x25338C970](v14, -1, -1);
      MEMORY[0x25338C970](v13, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  return result;
}

void sub_250E78D74(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_250E78DEC()
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v0 + 2));

  swift_unknownObjectUnownedDestroy();
  return MEMORY[0x270FA0228](v0, 96, 7);
}

uint64_t type metadata accessor for BalanceOnboardingCoordinator()
{
  return self;
}

uint64_t sub_250E78E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_250E7B008();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_250E78F6C, 0, 0);
}

uint64_t sub_250E78F6C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_250E7B028();
  uint64_t v5 = sub_250E79458(&qword_269B0D028, MEMORY[0x263F8F710]);
  sub_250E7B168();
  sub_250E79458(&qword_269B0D030, MEMORY[0x263F8F6D8]);
  sub_250E7B038();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_250E7910C;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_250E7910C()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_250E792C8, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_250E792C8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_250E79334()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_250E79344(uint64_t a1, void *a2)
{
  return sub_250E78AF0(a1, a2);
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

uint64_t sub_250E79364()
{
  sub_250E7A5B8();
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_250E793A4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_250E532C8;
  return sub_250E7850C(a1, v4, v5, v6);
}

uint64_t sub_250E79458(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_250E794A0()
{
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);

  return MEMORY[0x270FA0238](v0, 64, 7);
}

void sub_250E794E0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_250E7952C()
{
  unint64_t result = qword_269B0CA28;
  if (!qword_269B0CA28)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269B0CA28);
  }
  return result;
}

uint64_t sub_250E79574()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for HealthBalanceAppPlugin()
{
  return self;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_250E795CC()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_269B0D038 = (uint64_t)result;
  return result;
}

uint64_t sub_250E79624(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D090);
}

uint64_t sub_250E79640(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D0A8);
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

uint64_t sub_250E796C0(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D0C0);
}

uint64_t sub_250E796DC(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D0D8);
}

uint64_t sub_250E796F8(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D0F0);
}

uint64_t sub_250E79714(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D108);
}

uint64_t sub_250E79730(uint64_t a1)
{
  return sub_250E7974C(a1, qword_269B0D120);
}

uint64_t sub_250E7974C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_250E7A828();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_269B0C720 != -1) {
    swift_once();
  }
  id v4 = (id)qword_269B0D038;
  return sub_250E7A818();
}

uint64_t sub_250E797F8()
{
  return MEMORY[0x270EEDEE8]();
}

uint64_t sub_250E79808()
{
  return MEMORY[0x270EEDF30]();
}

uint64_t sub_250E79818()
{
  return MEMORY[0x270EEDF38]();
}

uint64_t sub_250E79828()
{
  return MEMORY[0x270EEE2F8]();
}

uint64_t sub_250E79838()
{
  return MEMORY[0x270EEE338]();
}

uint64_t sub_250E79848()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_250E79858()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_250E79868()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_250E79878()
{
  return MEMORY[0x270EEF288]();
}

uint64_t sub_250E79888()
{
  return MEMORY[0x270EEF2A8]();
}

uint64_t sub_250E79898()
{
  return MEMORY[0x270EEF2B8]();
}

uint64_t sub_250E798A8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_250E798B8()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_250E798C8()
{
  return MEMORY[0x270F31B90]();
}

uint64_t sub_250E798D8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_250E798E8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_250E798F8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_250E79908()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_250E79918()
{
  return MEMORY[0x270F31B98]();
}

uint64_t sub_250E79928()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_250E79938()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_250E79948()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_250E79958()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_250E79968()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_250E79978()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_250E79988()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_250E79998()
{
  return MEMORY[0x270F31040]();
}

uint64_t sub_250E799A8()
{
  return MEMORY[0x270F31048]();
}

uint64_t sub_250E799B8()
{
  return MEMORY[0x270F31050]();
}

uint64_t sub_250E799C8()
{
  return MEMORY[0x270F31058]();
}

uint64_t sub_250E799D8()
{
  return MEMORY[0x270F31060]();
}

uint64_t sub_250E799E8()
{
  return MEMORY[0x270F31068]();
}

uint64_t sub_250E799F8()
{
  return MEMORY[0x270F31070]();
}

uint64_t sub_250E79A08()
{
  return MEMORY[0x270F31078]();
}

uint64_t sub_250E79A18()
{
  return MEMORY[0x270F31080]();
}

uint64_t sub_250E79A28()
{
  return MEMORY[0x270F31090]();
}

uint64_t sub_250E79A38()
{
  return MEMORY[0x270F31098]();
}

uint64_t sub_250E79A48()
{
  return MEMORY[0x270F310A0]();
}

uint64_t sub_250E79A58()
{
  return MEMORY[0x270F310A8]();
}

uint64_t sub_250E79A68()
{
  return MEMORY[0x270F310B0]();
}

uint64_t sub_250E79A78()
{
  return MEMORY[0x270F310E8]();
}

uint64_t sub_250E79A88()
{
  return MEMORY[0x270F31100]();
}

uint64_t sub_250E79A98()
{
  return MEMORY[0x270F31118]();
}

uint64_t sub_250E79AA8()
{
  return MEMORY[0x270F31128]();
}

uint64_t sub_250E79AB8()
{
  return MEMORY[0x270F31130]();
}

uint64_t sub_250E79AC8()
{
  return MEMORY[0x270F31138]();
}

uint64_t sub_250E79AD8()
{
  return MEMORY[0x270F31140]();
}

uint64_t sub_250E79AE8()
{
  return MEMORY[0x270F31148]();
}

uint64_t sub_250E79AF8()
{
  return MEMORY[0x270F31188]();
}

uint64_t sub_250E79B08()
{
  return MEMORY[0x270F31190]();
}

uint64_t sub_250E79B18()
{
  return MEMORY[0x270F311A0]();
}

uint64_t sub_250E79B28()
{
  return MEMORY[0x270F311A8]();
}

uint64_t sub_250E79B38()
{
  return MEMORY[0x270F311C0]();
}

uint64_t sub_250E79B48()
{
  return MEMORY[0x270F31310]();
}

uint64_t sub_250E79B58()
{
  return MEMORY[0x270F31330]();
}

uint64_t sub_250E79B68()
{
  return MEMORY[0x270F31338]();
}

uint64_t sub_250E79B78()
{
  return MEMORY[0x270F31340]();
}

uint64_t sub_250E79B88()
{
  return MEMORY[0x270F31350]();
}

uint64_t sub_250E79B98()
{
  return MEMORY[0x270F313B8]();
}

uint64_t sub_250E79BA8()
{
  return MEMORY[0x270F313C0]();
}

uint64_t sub_250E79BB8()
{
  return MEMORY[0x270F313C8]();
}

uint64_t sub_250E79BC8()
{
  return MEMORY[0x270F31428]();
}

uint64_t sub_250E79BD8()
{
  return MEMORY[0x270F31430]();
}

uint64_t sub_250E79BE8()
{
  return MEMORY[0x270F31610]();
}

uint64_t sub_250E79BF8()
{
  return MEMORY[0x270F31618]();
}

uint64_t sub_250E79C08()
{
  return MEMORY[0x270F31620]();
}

uint64_t sub_250E79C18()
{
  return MEMORY[0x270F31638]();
}

uint64_t sub_250E79C28()
{
  return MEMORY[0x270F31660]();
}

uint64_t sub_250E79C38()
{
  return MEMORY[0x270F31678]();
}

uint64_t sub_250E79C48()
{
  return MEMORY[0x270F31680]();
}

uint64_t sub_250E79C58()
{
  return MEMORY[0x270F31688]();
}

uint64_t sub_250E79C68()
{
  return MEMORY[0x270F31770]();
}

uint64_t sub_250E79C78()
{
  return MEMORY[0x270F31778]();
}

uint64_t sub_250E79C88()
{
  return MEMORY[0x270F31780]();
}

uint64_t sub_250E79C98()
{
  return MEMORY[0x270F317A8]();
}

uint64_t sub_250E79CA8()
{
  return MEMORY[0x270F317D8]();
}

uint64_t sub_250E79CB8()
{
  return MEMORY[0x270F317E0]();
}

uint64_t sub_250E79CC8()
{
  return MEMORY[0x270F317E8]();
}

uint64_t sub_250E79CD8()
{
  return MEMORY[0x270F317F0]();
}

uint64_t sub_250E79CE8()
{
  return MEMORY[0x270F31820]();
}

uint64_t sub_250E79CF8()
{
  return MEMORY[0x270F31838]();
}

uint64_t sub_250E79D08()
{
  return MEMORY[0x270F31840]();
}

uint64_t sub_250E79D18()
{
  return MEMORY[0x270F73300]();
}

uint64_t sub_250E79D28()
{
  return MEMORY[0x270F73308]();
}

uint64_t sub_250E79D38()
{
  return MEMORY[0x270F73310]();
}

uint64_t sub_250E79D48()
{
  return MEMORY[0x270F733D8]();
}

uint64_t sub_250E79D58()
{
  return MEMORY[0x270F733E0]();
}

uint64_t sub_250E79D68()
{
  return MEMORY[0x270F733F8]();
}

uint64_t sub_250E79D78()
{
  return MEMORY[0x270F73400]();
}

uint64_t sub_250E79D88()
{
  return MEMORY[0x270F73408]();
}

uint64_t sub_250E79D98()
{
  return MEMORY[0x270F36178]();
}

uint64_t sub_250E79DA8()
{
  return MEMORY[0x270F362C0]();
}

uint64_t sub_250E79DB8()
{
  return MEMORY[0x270F36328]();
}

uint64_t sub_250E79DC8()
{
  return MEMORY[0x270F36338]();
}

uint64_t sub_250E79DD8()
{
  return MEMORY[0x270F36340]();
}

uint64_t sub_250E79DE8()
{
  return MEMORY[0x270F363D8]();
}

uint64_t sub_250E79DF8()
{
  return MEMORY[0x270F363E8]();
}

uint64_t sub_250E79E08()
{
  return MEMORY[0x270F36400]();
}

uint64_t sub_250E79E18()
{
  return MEMORY[0x270F36420]();
}

uint64_t sub_250E79E28()
{
  return MEMORY[0x270F364A8]();
}

uint64_t sub_250E79E38()
{
  return MEMORY[0x270F364C8]();
}

uint64_t sub_250E79E48()
{
  return MEMORY[0x270F36500]();
}

uint64_t sub_250E79E58()
{
  return MEMORY[0x270F365D8]();
}

uint64_t sub_250E79E68()
{
  return MEMORY[0x270F365F0]();
}

uint64_t sub_250E79E78()
{
  return MEMORY[0x270F36600]();
}

uint64_t sub_250E79E88()
{
  return MEMORY[0x270F36608]();
}

uint64_t sub_250E79E98()
{
  return MEMORY[0x270F36620]();
}

uint64_t sub_250E79EA8()
{
  return MEMORY[0x270F36628]();
}

uint64_t sub_250E79EB8()
{
  return MEMORY[0x270F36630]();
}

uint64_t sub_250E79EC8()
{
  return MEMORY[0x270F36640]();
}

uint64_t sub_250E79ED8()
{
  return MEMORY[0x270F36660]();
}

uint64_t sub_250E79EF8()
{
  return MEMORY[0x270F36820]();
}

uint64_t sub_250E79F08()
{
  return MEMORY[0x270F36968]();
}

uint64_t sub_250E79F18()
{
  return MEMORY[0x270F36970]();
}

uint64_t sub_250E79F28()
{
  return MEMORY[0x270F36AB8]();
}

uint64_t sub_250E79F38()
{
  return MEMORY[0x270F36C08]();
}

uint64_t sub_250E79F48()
{
  return MEMORY[0x270F36D60]();
}

uint64_t sub_250E79F58()
{
  return MEMORY[0x270F36D70]();
}

uint64_t sub_250E79F88()
{
  return MEMORY[0x270F318B8]();
}

uint64_t sub_250E79F98()
{
  return MEMORY[0x270F318C0]();
}

uint64_t sub_250E79FA8()
{
  return MEMORY[0x270F318C8]();
}

uint64_t sub_250E79FB8()
{
  return MEMORY[0x270F318D0]();
}

uint64_t sub_250E79FC8()
{
  return MEMORY[0x270F318D8]();
}

uint64_t sub_250E79FD8()
{
  return MEMORY[0x270F318E0]();
}

uint64_t sub_250E79FE8()
{
  return MEMORY[0x270F318E8]();
}

uint64_t sub_250E79FF8()
{
  return MEMORY[0x270F31900]();
}

uint64_t sub_250E7A008()
{
  return MEMORY[0x270F31908]();
}

uint64_t sub_250E7A018()
{
  return MEMORY[0x270F31910]();
}

uint64_t sub_250E7A028()
{
  return MEMORY[0x270F30F18]();
}

uint64_t sub_250E7A038()
{
  return MEMORY[0x270F30F80]();
}

uint64_t sub_250E7A048()
{
  return MEMORY[0x270F30F88]();
}

uint64_t sub_250E7A058()
{
  return MEMORY[0x270F30F90]();
}

uint64_t sub_250E7A068()
{
  return MEMORY[0x270F30FB0]();
}

uint64_t sub_250E7A078()
{
  return MEMORY[0x270F30FB8]();
}

uint64_t sub_250E7A088()
{
  return MEMORY[0x270F31DE0]();
}

uint64_t sub_250E7A098()
{
  return MEMORY[0x270F31DE8]();
}

uint64_t sub_250E7A0A8()
{
  return MEMORY[0x270F31DF0]();
}

uint64_t sub_250E7A0B8()
{
  return MEMORY[0x270F31E38]();
}

uint64_t sub_250E7A0C8()
{
  return MEMORY[0x270F31E40]();
}

uint64_t sub_250E7A0D8()
{
  return MEMORY[0x270F31EB0]();
}

uint64_t sub_250E7A0E8()
{
  return MEMORY[0x270F31EB8]();
}

uint64_t sub_250E7A0F8()
{
  return MEMORY[0x270F31FD8]();
}

uint64_t sub_250E7A108()
{
  return MEMORY[0x270F326A8]();
}

uint64_t sub_250E7A118()
{
  return MEMORY[0x270F31FF0]();
}

uint64_t sub_250E7A128()
{
  return MEMORY[0x270F32008]();
}

uint64_t sub_250E7A138()
{
  return MEMORY[0x270F32010]();
}

uint64_t sub_250E7A148()
{
  return MEMORY[0x270F32028]();
}

uint64_t sub_250E7A158()
{
  return MEMORY[0x270F32040]();
}

uint64_t sub_250E7A168()
{
  return MEMORY[0x270F32048]();
}

uint64_t sub_250E7A178()
{
  return MEMORY[0x270F32050]();
}

uint64_t sub_250E7A188()
{
  return MEMORY[0x270F32060]();
}

uint64_t sub_250E7A198()
{
  return MEMORY[0x270F32258]();
}

uint64_t sub_250E7A1A8()
{
  return MEMORY[0x270F32260]();
}

uint64_t sub_250E7A1B8()
{
  return MEMORY[0x270F32270]();
}

uint64_t sub_250E7A1C8()
{
  return MEMORY[0x270F32308]();
}

uint64_t sub_250E7A1D8()
{
  return MEMORY[0x270F30E18]();
}

uint64_t sub_250E7A1E8()
{
  return MEMORY[0x270F32740]();
}

uint64_t sub_250E7A1F8()
{
  return MEMORY[0x270F32750]();
}

uint64_t sub_250E7A208()
{
  return MEMORY[0x270F32758]();
}

uint64_t sub_250E7A218()
{
  return MEMORY[0x270F32760]();
}

uint64_t sub_250E7A228()
{
  return MEMORY[0x270F32770]();
}

uint64_t sub_250E7A238()
{
  return MEMORY[0x270F327C0]();
}

uint64_t sub_250E7A248()
{
  return MEMORY[0x270F32800]();
}

uint64_t sub_250E7A268()
{
  return MEMORY[0x270F32878]();
}

uint64_t sub_250E7A288()
{
  return MEMORY[0x270F32B30]();
}

uint64_t sub_250E7A298()
{
  return MEMORY[0x270F32B48]();
}

uint64_t sub_250E7A2A8()
{
  return MEMORY[0x270F32B68]();
}

uint64_t sub_250E7A2B8()
{
  return MEMORY[0x270F32BD8]();
}

uint64_t sub_250E7A2C8()
{
  return MEMORY[0x270F32BE0]();
}

uint64_t sub_250E7A2D8()
{
  return MEMORY[0x270F32E98]();
}

uint64_t sub_250E7A2E8()
{
  return MEMORY[0x270F32FD0]();
}

uint64_t sub_250E7A2F8()
{
  return MEMORY[0x270F33250]();
}

uint64_t sub_250E7A308()
{
  return MEMORY[0x270F33378]();
}

uint64_t sub_250E7A318()
{
  return MEMORY[0x270F33390]();
}

uint64_t sub_250E7A328()
{
  return MEMORY[0x270F33398]();
}

uint64_t sub_250E7A338()
{
  return MEMORY[0x270F333D0]();
}

uint64_t sub_250E7A348()
{
  return MEMORY[0x270F333D8]();
}

uint64_t sub_250E7A358()
{
  return MEMORY[0x270F333E0]();
}

uint64_t sub_250E7A368()
{
  return MEMORY[0x270F333E8]();
}

uint64_t sub_250E7A378()
{
  return MEMORY[0x270F33448]();
}

uint64_t sub_250E7A388()
{
  return MEMORY[0x270F33508]();
}

uint64_t sub_250E7A398()
{
  return MEMORY[0x270F339B0]();
}

uint64_t sub_250E7A3A8()
{
  return MEMORY[0x270F339C0]();
}

uint64_t sub_250E7A3B8()
{
  return MEMORY[0x270F339C8]();
}

uint64_t sub_250E7A3C8()
{
  return MEMORY[0x270F339D0]();
}

uint64_t sub_250E7A3D8()
{
  return MEMORY[0x270F339D8]();
}

uint64_t sub_250E7A3E8()
{
  return MEMORY[0x270F33A38]();
}

uint64_t sub_250E7A3F8()
{
  return MEMORY[0x270F33CC0]();
}

uint64_t sub_250E7A408()
{
  return MEMORY[0x270F33D80]();
}

uint64_t sub_250E7A418()
{
  return MEMORY[0x270F33DB8]();
}

uint64_t sub_250E7A428()
{
  return MEMORY[0x270F33ED8]();
}

uint64_t sub_250E7A438()
{
  return MEMORY[0x270F33F00]();
}

uint64_t sub_250E7A448()
{
  return MEMORY[0x270F33F08]();
}

uint64_t sub_250E7A458()
{
  return MEMORY[0x270F34010]();
}

uint64_t sub_250E7A468()
{
  return MEMORY[0x270F34038]();
}

uint64_t sub_250E7A478()
{
  return MEMORY[0x270F340E0]();
}

uint64_t sub_250E7A488()
{
  return MEMORY[0x270F34108]();
}

uint64_t sub_250E7A498()
{
  return MEMORY[0x270F34110]();
}

uint64_t sub_250E7A4A8()
{
  return MEMORY[0x270F34120]();
}

uint64_t sub_250E7A4B8()
{
  return MEMORY[0x270F34130]();
}

uint64_t sub_250E7A4C8()
{
  return MEMORY[0x270F34140]();
}

uint64_t sub_250E7A4D8()
{
  return MEMORY[0x270F34148]();
}

uint64_t sub_250E7A4E8()
{
  return MEMORY[0x270F34160]();
}

uint64_t sub_250E7A4F8()
{
  return MEMORY[0x270F34168]();
}

uint64_t sub_250E7A508()
{
  return MEMORY[0x270F34170]();
}

uint64_t sub_250E7A518()
{
  return MEMORY[0x270F34178]();
}

uint64_t sub_250E7A528()
{
  return MEMORY[0x270F34218]();
}

uint64_t sub_250E7A538()
{
  return MEMORY[0x270F342E0]();
}

uint64_t sub_250E7A558()
{
  return MEMORY[0x270F34330]();
}

uint64_t sub_250E7A568()
{
  return MEMORY[0x270F34350]();
}

uint64_t sub_250E7A578()
{
  return MEMORY[0x270F34448]();
}

uint64_t sub_250E7A588()
{
  return MEMORY[0x270F34450]();
}

uint64_t sub_250E7A598()
{
  return MEMORY[0x270F344A8]();
}

uint64_t sub_250E7A5A8()
{
  return MEMORY[0x270F344B0]();
}

uint64_t sub_250E7A5B8()
{
  return MEMORY[0x270F344B8]();
}

uint64_t sub_250E7A5C8()
{
  return MEMORY[0x270F345E8]();
}

uint64_t sub_250E7A5D8()
{
  return MEMORY[0x270F345F0]();
}

uint64_t sub_250E7A5E8()
{
  return MEMORY[0x270F34648]();
}

uint64_t sub_250E7A5F8()
{
  return MEMORY[0x270F346D8]();
}

uint64_t sub_250E7A608()
{
  return MEMORY[0x270F346E0]();
}

uint64_t sub_250E7A618()
{
  return MEMORY[0x270F34760]();
}

uint64_t sub_250E7A648()
{
  return MEMORY[0x270F34880]();
}

uint64_t sub_250E7A658()
{
  return MEMORY[0x270F34918]();
}

uint64_t sub_250E7A688()
{
  return MEMORY[0x270F34930]();
}

uint64_t sub_250E7A698()
{
  return MEMORY[0x270F34948]();
}

uint64_t sub_250E7A6A8()
{
  return MEMORY[0x270F34AE0]();
}

uint64_t sub_250E7A6B8()
{
  return MEMORY[0x270F34AE8]();
}

uint64_t sub_250E7A6D8()
{
  return MEMORY[0x270F34AF8]();
}

uint64_t sub_250E7A6E8()
{
  return MEMORY[0x270F34B90]();
}

uint64_t sub_250E7A6F8()
{
  return MEMORY[0x270F34B98]();
}

uint64_t sub_250E7A708()
{
  return MEMORY[0x270F34BA0]();
}

uint64_t sub_250E7A718()
{
  return MEMORY[0x270F34BA8]();
}

uint64_t sub_250E7A728()
{
  return MEMORY[0x270F34BB0]();
}

uint64_t sub_250E7A738()
{
  return MEMORY[0x270F34C30]();
}

uint64_t sub_250E7A748()
{
  return MEMORY[0x270F34C38]();
}

uint64_t sub_250E7A758()
{
  return MEMORY[0x270F34C40]();
}

uint64_t sub_250E7A768()
{
  return MEMORY[0x270F34C48]();
}

uint64_t sub_250E7A778()
{
  return MEMORY[0x270F34FB0]();
}

uint64_t sub_250E7A798()
{
  return MEMORY[0x270F35038]();
}

uint64_t sub_250E7A7A8()
{
  return MEMORY[0x270F35090]();
}

uint64_t sub_250E7A7C8()
{
  return MEMORY[0x270F350A0]();
}

uint64_t sub_250E7A7D8()
{
  return MEMORY[0x270F350A8]();
}

uint64_t sub_250E7A7E8()
{
  return MEMORY[0x270F350E0]();
}

uint64_t sub_250E7A7F8()
{
  return MEMORY[0x270F350E8]();
}

uint64_t sub_250E7A808()
{
  return MEMORY[0x270F350F0]();
}

uint64_t sub_250E7A818()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_250E7A828()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_250E7A838()
{
  return MEMORY[0x270F30ED8]();
}

uint64_t sub_250E7A848()
{
  return MEMORY[0x270F30EF0]();
}

uint64_t sub_250E7A858()
{
  return MEMORY[0x270F31848]();
}

uint64_t sub_250E7A868()
{
  return MEMORY[0x270F36E98]();
}

uint64_t sub_250E7A878()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_250E7A888()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_250E7A898()
{
  return MEMORY[0x270F823A0]();
}

uint64_t sub_250E7A8A8()
{
  return MEMORY[0x270EE3828]();
}

uint64_t sub_250E7A8B8()
{
  return MEMORY[0x270F36EC0]();
}

uint64_t sub_250E7A8C8()
{
  return MEMORY[0x270EE3840]();
}

uint64_t sub_250E7A8D8()
{
  return MEMORY[0x270EE3848]();
}

uint64_t sub_250E7A8E8()
{
  return MEMORY[0x270F36ED0]();
}

uint64_t sub_250E7A8F8()
{
  return MEMORY[0x270EE3860]();
}

uint64_t sub_250E7A908()
{
  return MEMORY[0x270EE3868]();
}

uint64_t sub_250E7A918()
{
  return MEMORY[0x270EE38B0]();
}

uint64_t sub_250E7A928()
{
  return MEMORY[0x270EE3950]();
}

uint64_t sub_250E7A938()
{
  return MEMORY[0x270EE39C0]();
}

uint64_t sub_250E7A948()
{
  return MEMORY[0x270EE3A48]();
}

uint64_t sub_250E7A958()
{
  return MEMORY[0x270EE3A90]();
}

uint64_t sub_250E7A968()
{
  return MEMORY[0x270EE3AE8]();
}

uint64_t sub_250E7A978()
{
  return MEMORY[0x270EE3B50]();
}

uint64_t sub_250E7A988()
{
  return MEMORY[0x270EE3B60]();
}

uint64_t sub_250E7A998()
{
  return MEMORY[0x270EE3D40]();
}

uint64_t sub_250E7A9A8()
{
  return MEMORY[0x270EE3D50]();
}

uint64_t sub_250E7A9B8()
{
  return MEMORY[0x270EE3D98]();
}

uint64_t sub_250E7A9C8()
{
  return MEMORY[0x270EE3DA0]();
}

uint64_t sub_250E7A9D8()
{
  return MEMORY[0x270F36F10]();
}

uint64_t sub_250E7A9E8()
{
  return MEMORY[0x270EE3E08]();
}

uint64_t sub_250E7A9F8()
{
  return MEMORY[0x270EE3E78]();
}

uint64_t sub_250E7AA08()
{
  return MEMORY[0x270EE3F68]();
}

uint64_t sub_250E7AA18()
{
  return MEMORY[0x270EE4030]();
}

uint64_t sub_250E7AA28()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_250E7AA38()
{
  return MEMORY[0x270EFFDB0]();
}

uint64_t sub_250E7AA48()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_250E7AA58()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_250E7AA68()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_250E7AA78()
{
  return MEMORY[0x270EF3390]();
}

uint64_t sub_250E7AA88()
{
  return MEMORY[0x270F075F0]();
}

uint64_t sub_250E7AA98()
{
  return MEMORY[0x270F075F8]();
}

uint64_t sub_250E7AAA8()
{
  return MEMORY[0x270F07600]();
}

uint64_t sub_250E7AAB8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_250E7AAC8()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_250E7AAD8()
{
  return MEMORY[0x270F9D550]();
}

uint64_t sub_250E7AAE8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_250E7AAF8()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_250E7AB08()
{
  return MEMORY[0x270EF18F0]();
}

uint64_t sub_250E7AB18()
{
  return MEMORY[0x270EF1908]();
}

uint64_t sub_250E7AB28()
{
  return MEMORY[0x270EF1918]();
}

uint64_t sub_250E7AB38()
{
  return MEMORY[0x270EF1928]();
}

uint64_t sub_250E7AB48()
{
  return MEMORY[0x270EF1938]();
}

uint64_t sub_250E7AB58()
{
  return MEMORY[0x270EF1950]();
}

uint64_t sub_250E7AB68()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_250E7AB78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_250E7AB88()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_250E7AB98()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_250E7ABA8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_250E7ABB8()
{
  return MEMORY[0x270EF1AE8]();
}

uint64_t sub_250E7ABC8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_250E7ABD8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_250E7ABE8()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_250E7ABF8()
{
  return MEMORY[0x270F32538]();
}

uint64_t sub_250E7AC08()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_250E7AC18()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_250E7AC28()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_250E7AC38()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_250E7AC48()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_250E7AC58()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_250E7AC68()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_250E7AC78()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_250E7AC88()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_250E7AC98()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_250E7ACA8()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_250E7ACB8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_250E7ACC8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_250E7ACD8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_250E7ACE8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_250E7ACF8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_250E7AD08()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_250E7AD18()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_250E7AD28()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_250E7AD38()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_250E7AD48()
{
  return MEMORY[0x270F31870]();
}

uint64_t sub_250E7AD58()
{
  return MEMORY[0x270F31880]();
}

uint64_t sub_250E7AD68()
{
  return MEMORY[0x270F31888]();
}

uint64_t sub_250E7AD78()
{
  return MEMORY[0x270F31890]();
}

uint64_t sub_250E7AD88()
{
  return MEMORY[0x270F35208]();
}

uint64_t sub_250E7AD98()
{
  return MEMORY[0x270F34D60]();
}

uint64_t sub_250E7ADA8()
{
  return MEMORY[0x270F34D78]();
}

uint64_t sub_250E7ADB8()
{
  return MEMORY[0x270F82578]();
}

uint64_t sub_250E7ADC8()
{
  return MEMORY[0x270F38148]();
}

uint64_t sub_250E7ADD8()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_250E7ADE8()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_250E7ADF8()
{
  return MEMORY[0x270F34DD8]();
}

uint64_t sub_250E7AE08()
{
  return MEMORY[0x270F73828]();
}

uint64_t sub_250E7AE18()
{
  return MEMORY[0x270F34EA8]();
}

uint64_t sub_250E7AE28()
{
  return MEMORY[0x270F82940]();
}

uint64_t sub_250E7AE38()
{
  return MEMORY[0x270F31928]();
}

uint64_t sub_250E7AE48()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_250E7AE58()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_250E7AE68()
{
  return MEMORY[0x270F318A0]();
}

uint64_t sub_250E7AE78()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_250E7AE88()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_250E7AE98()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_250E7AEA8()
{
  return MEMORY[0x270F9E730]();
}

uint64_t sub_250E7AEB8()
{
  return MEMORY[0x270F9E740]();
}

uint64_t sub_250E7AEC8()
{
  return MEMORY[0x270F9E798]();
}

uint64_t sub_250E7AED8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_250E7AEE8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_250E7AEF8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_250E7AF08()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_250E7AF18()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_250E7AF28()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_250E7AF38()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_250E7AF48()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_250E7AF58()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_250E7AF68()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_250E7AF78()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_250E7AF88()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_250E7AF98()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_250E7AFA8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_250E7AFB8()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_250E7AFC8()
{
  return MEMORY[0x270F9EA90]();
}

uint64_t sub_250E7AFD8()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_250E7AFE8()
{
  return MEMORY[0x270F9EAE0]();
}

uint64_t sub_250E7AFF8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_250E7B008()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_250E7B018()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_250E7B028()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_250E7B038()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_250E7B048()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_250E7B058()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_250E7B068()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_250E7B078()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_250E7B088()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_250E7B098()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_250E7B0B8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_250E7B0C8()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_250E7B0D8()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_250E7B0E8()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_250E7B0F8()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_250E7B108()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_250E7B118()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_250E7B128()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_250E7B138()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_250E7B148()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_250E7B158()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_250E7B168()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_250E7B188()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_250E7B198()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_250E7B1A8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_250E7B1B8()
{
  return MEMORY[0x270F9FCF8]();
}

uint64_t sub_250E7B1C8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_250E7B1D8()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_250E7B1E8()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t sub_250E7B218()
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x270FA0350]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x270FA0358]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
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