void *sub_10000559C(uint64_t a1, uint64_t *a2, int *a3)
{
  void *v4;
  int v5;
  long long v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (void *)a1;
  v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (void *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(void *)(a1 + 32) = a2[4];
    *(unsigned char *)(a1 + 40) = *((unsigned char *)a2 + 40);
    v8 = a3[6];
    v9 = (void *)(a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    *(void *)(a1 + 48) = a2[6];
    swift_retain();
    swift_retain();
    sub_100005748(&qword_1000202E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v11 = sub_100017668();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[7];
    v14 = (char *)v4 + v13;
    v15 = (uint64_t)a2 + v13;
    v16 = sub_100017578();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    v17 = (uint64_t)a2 + a3[8];
    *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v17 + 8);
  }
  return v4;
}

uint64_t sub_100005748(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000578C(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100017668();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_unknownObjectWeakDestroy();
}

uint64_t sub_10000588C(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v7 = a3[6];
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  swift_retain();
  swift_retain();
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100017668();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  uint64_t v15 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v15 + 8);
  return a1;
}

uint64_t sub_1000059E8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[6];
    uint64_t v7 = (void *)(a1 + v6);
    v8 = (void *)(a2 + v6);
    sub_100012EA8(a1 + v6, &qword_1000202E0);
    sub_100005748(&qword_1000202E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100017668();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakCopyAssign() + 8) = *(void *)(v14 + 8);
  return a1;
}

uint64_t sub_100005B88(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v7 = a3[6];
  v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_100017668();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32))(v13, v14, v15);
  uint64_t v16 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakTakeInit() + 8) = *(void *)(v16 + 8);
  return a1;
}

uint64_t sub_100005CE0(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = a3[6];
    v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_100012EA8(a1 + v7, &qword_1000202E0);
    uint64_t v10 = sub_100005748(&qword_1000202E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_100017668();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakTakeAssign() + 8) = *(void *)(v16 + 8);
  return a1;
}

uint64_t sub_100005E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005E7C);
}

uint64_t sub_100005E7C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100005748(&qword_1000202E8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[6];
  }
  else
  {
    uint64_t v10 = sub_100017578();
    if (*(_DWORD *)(*(void *)(v10 - 8) + 84) != a2)
    {
      uint64_t v13 = a1 + a3[8];
      uint64_t v14 = *(void *)(v13 + 8);
      int v15 = *(_DWORD *)v13 & 0x7FFFFFFF;
      if ((v14 & 0xF000000000000007) != 0) {
        return (v15 + 1);
      }
      else {
        return 0;
      }
    }
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[7];
  }
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);

  return v11(a1 + v9, a2, v7);
}

uint64_t sub_100005F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005FA8);
}

uint64_t sub_100005FA8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100005748(&qword_1000202E8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[6];
  }
  else
  {
    uint64_t result = sub_100017578();
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      uint64_t v14 = (void *)(a1 + a4[8]);
      *uint64_t v14 = (a2 - 1);
      v14[1] = 1;
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[7];
  }
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);

  return v13(a1 + v11, a2, a2, v9);
}

uint64_t type metadata accessor for DeveloperTrustSheetView(uint64_t a1)
{
  return sub_10000F948(a1, (uint64_t *)&unk_100020348);
}

void sub_1000060E0()
{
}

void sub_1000060F4()
{
  if (!qword_100020358)
  {
    sub_100017668();
    unint64_t v0 = sub_1000175E8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100020358);
    }
  }
}

uint64_t sub_10000614C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006168@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v2 = sub_100005748(&qword_100020398);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005748(&qword_1000203A0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_100017768();
  *((void *)v5 + 1) = 0;
  v5[16] = 0;
  uint64_t v11 = &v5[*(int *)(sub_100005748(&qword_1000203A8) + 44)];
  v21 = v1;
  sub_100017848();
  sub_100005748(&qword_1000203B0);
  sub_1000132C4(&qword_1000203B8, &qword_1000203B0);
  sub_1000175D8();
  uint64_t v12 = sub_100017768();
  uint64_t v13 = (uint64_t)&v11[*(int *)(sub_100005748(&qword_1000203C0) + 36)];
  sub_10000B438(v1, v13);
  sub_1000175F8();
  char v14 = sub_1000178C8();
  uint64_t v15 = sub_100017678();
  uint64_t v16 = v13 + *(int *)(sub_100005748(&qword_1000203C8) + 36);
  *(void *)uint64_t v16 = v15;
  *(void *)(v16 + 8) = 0;
  *(unsigned char *)(v16 + 16) = 1;
  *(unsigned char *)(v16 + 17) = v14;
  *(void *)(v16 + 24) = v12;
  sub_1000132C4(&qword_1000203D0, &qword_100020398);
  sub_100017998();
  sub_100012EA8((uint64_t)v5, &qword_100020398);
  sub_100017AF8();
  __n128 v17 = sub_1000097F8(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v20, 0.0, 1, INFINITY, 0);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v7 + 8))(v10, v6, v17);
}

uint64_t sub_100006438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v115 = a2;
  uint64_t v97 = sub_100017578();
  uint64_t v96 = *(void *)(v97 - 8);
  __chkstk_darwin(v97, v3);
  v95 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v111 = *(void *)(v113 - 8);
  __chkstk_darwin(v113, v5);
  v94 = (char *)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005748(&qword_100020410);
  uint64_t v9 = __chkstk_darwin(v7 - 8, v8);
  uint64_t v114 = (uint64_t)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v11);
  uint64_t v112 = (uint64_t)&v92 - v12;
  uint64_t v13 = type metadata accessor for DeveloperTrustSheetView(0);
  uint64_t v104 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v14);
  uint64_t v105 = v15;
  uint64_t v108 = (uint64_t)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100017668();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  v21 = (char *)&v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v22);
  v24 = (char *)&v92 - v23;
  uint64_t v25 = sub_100005748(&qword_100020418);
  __chkstk_darwin(v25 - 8, v26);
  v28 = (char *)&v92 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = sub_100005748(&qword_100020420);
  __chkstk_darwin(v100, v29);
  uint64_t v109 = (uint64_t)&v92 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_100005748(&qword_100020428);
  uint64_t v32 = __chkstk_darwin(v107, v31);
  uint64_t v110 = (uint64_t)&v92 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v32, v34);
  uint64_t v106 = (uint64_t)&v92 - v36;
  __chkstk_darwin(v35, v37);
  uint64_t v118 = (uint64_t)&v92 - v38;
  uint64_t v93 = v13;
  uint64_t v39 = a1;
  uint64_t v117 = a1 + *(int *)(v13 + 24);
  sub_10000E5D4((uint64_t)v24);
  v40 = *(void (**)(void))(v17 + 104);
  uint64_t v41 = enum case for DynamicTypeSize.large(_:);
  *(void *)&long long v116 = v17 + 104;
  v102 = (void (*)(char *, void, uint64_t))v40;
  v40(v21);
  uint64_t v42 = sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  LOBYTE(v13) = sub_100017B98();
  v43 = *(void (**)(char *, uint64_t))(v17 + 8);
  v43(v21, v16);
  uint64_t v103 = v17 + 8;
  v101 = v43;
  v43(v24, v16);
  if (v13) {
    uint64_t v44 = sub_100017778();
  }
  else {
    uint64_t v44 = sub_100017768();
  }
  *(void *)v28 = v44;
  *((void *)v28 + 1) = 0x4036000000000000;
  v28[16] = 0;
  uint64_t v45 = sub_100005748(&qword_100020430);
  sub_100006EC4(a1, (uint64_t)&v28[*(int *)(v45 + 44)]);
  uint64_t v92 = a1;
  uint64_t v46 = v108;
  sub_10000F104(v39, v108, type metadata accessor for DeveloperTrustSheetView);
  unint64_t v47 = (*(unsigned __int8 *)(v104 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v104 + 80);
  uint64_t v48 = swift_allocObject();
  sub_10000F170(v46, v48 + v47, type metadata accessor for DeveloperTrustSheetView);
  uint64_t v49 = v109;
  sub_100012F44((uint64_t)v28, v109, &qword_100020418);
  v50 = (void *)(v49 + *(int *)(v100 + 36));
  void *v50 = sub_10000AF94;
  v50[1] = 0;
  v50[2] = sub_10000F1D8;
  v50[3] = v48;
  sub_100012EA8((uint64_t)v28, &qword_100020418);
  sub_10000E5D4((uint64_t)v24);
  uint64_t v51 = v41;
  unsigned int v99 = v41;
  v52 = v102;
  v102(v21, v51, v16);
  uint64_t v98 = v42;
  sub_100017B98();
  v53 = v101;
  v101(v21, v16);
  v53(v24, v16);
  LOBYTE(v48) = sub_100017868();
  sub_1000175C8();
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v62 = v106;
  sub_100012F44(v49, v106, &qword_100020420);
  uint64_t v63 = v62 + *(int *)(v107 + 36);
  *(unsigned char *)uint64_t v63 = v48;
  *(void *)(v63 + 8) = v55;
  *(void *)(v63 + 16) = v57;
  *(void *)(v63 + 24) = v59;
  *(void *)(v63 + 32) = v61;
  *(unsigned char *)(v63 + 40) = 0;
  sub_100012EA8(v49, &qword_100020420);
  sub_100012E44(v62, v118, &qword_100020428);
  sub_10000E5D4((uint64_t)v24);
  v52(v21, v99, v16);
  LOBYTE(v49) = sub_100017B98();
  v53(v21, v16);
  v53(v24, v16);
  if (v49)
  {
    uint64_t v64 = v92;
    uint64_t v65 = *(void *)(v92 + 32);
    long long v66 = *(_OWORD *)(v92 + 16);
    long long v119 = *(_OWORD *)v92;
    long long v120 = v66;
    uint64_t v121 = v65;
    sub_100005748(&qword_1000203F0);
    sub_100017A58();
    uint64_t v67 = v122;
    uint64_t v117 = v123;
    long long v116 = v124;
    uint64_t v68 = v125;
    uint64_t v69 = v126;
    uint64_t v70 = *(void *)(v64 + 48);
    LOBYTE(v119) = *(unsigned char *)(v64 + 40);
    *((void *)&v119 + 1) = v70;
    sub_100005748(&qword_1000203F8);
    sub_100017A58();
    uint64_t v109 = v122;
    uint64_t v108 = v123;
    char v71 = v124;
    uint64_t v72 = v93;
    uint64_t v73 = v96;
    v74 = v95;
    uint64_t v75 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v96 + 16))(v95, v64 + *(int *)(v93 + 28), v97);
    uint64_t v76 = v64 + *(int *)(v72 + 32);
    swift_unknownObjectWeakLoadStrong();
    uint64_t v77 = *(void *)(v76 + 8);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v79 = v113;
    v80 = v94;
    *(void *)&v94[*(int *)(v113 + 24)] = KeyPath;
    sub_100005748(&qword_1000202E0);
    swift_storeEnumTagMultiPayload();
    uint64_t v81 = v117;
    *(void *)v80 = v67;
    *((void *)v80 + 1) = v81;
    *((_OWORD *)v80 + 1) = v116;
    *((void *)v80 + 4) = v68;
    *((void *)v80 + 5) = v69;
    uint64_t v82 = v108;
    *((void *)v80 + 6) = v109;
    *((void *)v80 + 7) = v82;
    v80[64] = v71;
    (*(void (**)(char *, char *, uint64_t))(v73 + 32))(&v80[*(int *)(v79 + 28)], v74, v75);
    *(void *)&v80[*(int *)(v79 + 32) + 8] = v77;
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    uint64_t v83 = (uint64_t)v80;
    uint64_t v84 = v112;
    sub_10000F170(v83, v112, type metadata accessor for DeveloperTrustSheetButtons);
    uint64_t v85 = 0;
  }
  else
  {
    uint64_t v85 = 1;
    uint64_t v79 = v113;
    uint64_t v84 = v112;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v111 + 56))(v84, v85, 1, v79);
  uint64_t v86 = v118;
  uint64_t v87 = v110;
  sub_100012F44(v118, v110, &qword_100020428);
  uint64_t v88 = v114;
  sub_100012F44(v84, v114, &qword_100020410);
  uint64_t v89 = v115;
  sub_100012F44(v87, v115, &qword_100020428);
  uint64_t v90 = sub_100005748(&qword_100020438);
  sub_100012F44(v88, v89 + *(int *)(v90 + 48), &qword_100020410);
  sub_100012EA8(v84, &qword_100020410);
  sub_100012EA8(v86, &qword_100020428);
  sub_100012EA8(v88, &qword_100020410);
  return sub_100012EA8(v87, &qword_100020428);
}

uint64_t sub_100006EC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v145 = a1;
  uint64_t v155 = a2;
  uint64_t v2 = sub_100005748(&qword_100020460);
  __chkstk_darwin(v2 - 8, v3);
  v151 = (uint64_t *)((char *)&v135 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = sub_100005748(&qword_100020468);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v152 = (uint64_t)&v135 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_100005748(&qword_100020470);
  uint64_t v9 = __chkstk_darwin(v150, v8);
  uint64_t v154 = (uint64_t)&v135 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v149 = (uint64_t)&v135 - v13;
  __chkstk_darwin(v12, v14);
  uint64_t v153 = (uint64_t)&v135 - v15;
  uint64_t v159 = sub_100017668();
  uint64_t v161 = *(void *)(v159 - 8);
  uint64_t v17 = __chkstk_darwin(v159, v16);
  v158 = (char *)&v135 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v156 = (uint64_t)&v135 - v20;
  uint64_t v21 = sub_100005748(&qword_100020478);
  __chkstk_darwin(v21 - 8, v22);
  v146 = (uint64_t *)((char *)&v135 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v144 = sub_100005748(&qword_100020480);
  uint64_t v25 = __chkstk_darwin(v144, v24);
  uint64_t v148 = (uint64_t)&v135 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v25, v27);
  uint64_t v143 = (uint64_t)&v135 - v29;
  __chkstk_darwin(v28, v30);
  uint64_t v160 = (uint64_t)&v135 - v31;
  uint64_t v140 = sub_100005748(&qword_100020488) - 8;
  __chkstk_darwin(v140, v32);
  uint64_t v34 = (uint64_t *)((char *)&v135 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v35 = sub_100005748(&qword_100020490);
  __chkstk_darwin(v35 - 8, v36);
  uint64_t v38 = (char *)&v135 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_1000179F8();
  uint64_t v40 = *(void *)(v39 - 8);
  __chkstk_darwin(v39, v41);
  v43 = (char *)&v135 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100005748(&qword_100020498);
  uint64_t v45 = v44 - 8;
  __chkstk_darwin(v44, v46);
  uint64_t v48 = (char *)&v135 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = sub_100005748(&qword_1000204A0) - 8;
  __chkstk_darwin(v139, v49);
  uint64_t v138 = (uint64_t)&v135 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100005748(&qword_1000204A8) - 8;
  uint64_t v52 = __chkstk_darwin(v142, v51);
  uint64_t v147 = (uint64_t)&v135 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __chkstk_darwin(v52, v54);
  v141 = (char *)&v135 - v56;
  __chkstk_darwin(v55, v57);
  uint64_t v157 = (uint64_t)&v135 - v58;
  sub_100017A08();
  (*(void (**)(char *, void, uint64_t))(v40 + 104))(v43, enum case for Image.ResizingMode.stretch(_:), v39);
  uint64_t v59 = sub_100017A18();
  swift_release();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v43, v39);
  sub_100017B08();
  sub_100017608();
  uint64_t v137 = v162;
  char v60 = v163;
  uint64_t v61 = v164;
  char v62 = v165;
  uint64_t v136 = v166;
  uint64_t v135 = v167;
  sub_100017788();
  uint64_t v63 = sub_100017798();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v63 - 8) + 56))(v38, 0, 1, v63);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100012F44((uint64_t)v38, (uint64_t)v34 + *(int *)(v140 + 36), &qword_100020490);
  *uint64_t v34 = KeyPath;
  sub_100012F44((uint64_t)v34, (uint64_t)&v48[*(int *)(v45 + 44)], &qword_100020488);
  *(void *)uint64_t v48 = v59;
  *((void *)v48 + 1) = 0;
  *((_WORD *)v48 + 8) = 257;
  *((void *)v48 + 3) = v137;
  v48[32] = v60;
  *((void *)v48 + 5) = v61;
  v48[48] = v62;
  uint64_t v65 = v135;
  *((void *)v48 + 7) = v136;
  *((void *)v48 + 8) = v65;
  swift_retain();
  sub_100012EA8((uint64_t)v34, &qword_100020488);
  sub_100012EA8((uint64_t)v38, &qword_100020490);
  swift_release();
  uint64_t v66 = sub_1000179A8();
  uint64_t v67 = v138;
  sub_100012F44((uint64_t)v48, v138, &qword_100020498);
  *(void *)(v67 + *(int *)(v139 + 44)) = v66;
  sub_100012EA8((uint64_t)v48, &qword_100020498);
  LOBYTE(v66) = sub_100017878();
  id v68 = [self currentDevice];
  [v68 userInterfaceIdiom];

  sub_1000175C8();
  uint64_t v70 = v69;
  uint64_t v72 = v71;
  uint64_t v74 = v73;
  uint64_t v76 = v75;
  uint64_t v77 = v141;
  sub_100012F44(v67, (uint64_t)v141, &qword_1000204A0);
  v78 = &v77[*(int *)(v142 + 44)];
  char *v78 = v66;
  *((void *)v78 + 1) = v70;
  *((void *)v78 + 2) = v72;
  *((void *)v78 + 3) = v74;
  *((void *)v78 + 4) = v76;
  v78[40] = 0;
  sub_100012EA8(v67, &qword_1000204A0);
  sub_100012E44((uint64_t)v77, v157, &qword_1000204A8);
  uint64_t v79 = type metadata accessor for DeveloperTrustSheetView(0);
  uint64_t v80 = v145;
  uint64_t v81 = v156;
  uint64_t v142 = v145 + *(int *)(v79 + 24);
  sub_10000E5D4(v156);
  uint64_t v82 = enum case for DynamicTypeSize.large(_:);
  uint64_t v83 = v161;
  uint64_t v85 = v158;
  uint64_t v84 = v159;
  v141 = *(char **)(v161 + 104);
  ((void (*)(char *, void, uint64_t))v141)(v158, enum case for DynamicTypeSize.large(_:), v159);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t v86 = v85;
  uint64_t v87 = v84;
  LOBYTE(v84) = sub_100017B98();
  uint64_t v88 = v83 + 8;
  uint64_t v89 = *(void (**)(char *, uint64_t))(v83 + 8);
  v89(v86, v87);
  uint64_t v161 = v88;
  v89((char *)v81, v87);
  if (v84) {
    uint64_t v90 = sub_100017778();
  }
  else {
    uint64_t v90 = sub_100017768();
  }
  uint64_t v91 = (uint64_t)v146;
  uint64_t *v146 = v90;
  *(void *)(v91 + 8) = 0x4010000000000000;
  *(unsigned char *)(v91 + 16) = 0;
  uint64_t v92 = sub_100005748(&qword_1000204B0);
  uint64_t v93 = v80;
  sub_100007BA0(v80, (uint64_t *)(v91 + *(int *)(v92 + 44)));
  char v94 = sub_100017858();
  sub_100008B84();
  sub_1000175C8();
  uint64_t v96 = v95;
  uint64_t v98 = v97;
  uint64_t v100 = v99;
  uint64_t v102 = v101;
  uint64_t v103 = v143;
  sub_100012F44(v91, v143, &qword_100020478);
  uint64_t v104 = v103 + *(int *)(v144 + 36);
  *(unsigned char *)uint64_t v104 = v94;
  *(void *)(v104 + 8) = v96;
  *(void *)(v104 + 16) = v98;
  *(void *)(v104 + 24) = v100;
  *(void *)(v104 + 32) = v102;
  *(unsigned char *)(v104 + 40) = 0;
  sub_100012EA8(v91, &qword_100020478);
  sub_100012E44(v103, v160, &qword_100020480);
  uint64_t v105 = sub_100017748();
  uint64_t v106 = (uint64_t)v151;
  uint64_t *v151 = v105;
  *(void *)(v106 + 8) = 0;
  *(unsigned char *)(v106 + 16) = 1;
  uint64_t v107 = sub_100005748(&qword_1000204B8);
  sub_100008D5C(v93, (double *)(v106 + *(int *)(v107 + 44)));
  uint64_t v108 = v156;
  sub_10000E5D4(v156);
  uint64_t v110 = v158;
  uint64_t v109 = v159;
  ((void (*)(char *, uint64_t, uint64_t))v141)(v158, v82, v159);
  char v111 = sub_100017B98();
  v89(v110, v109);
  v89((char *)v108, v109);
  if (v111) {
    uint64_t v112 = sub_100017B18();
  }
  else {
    uint64_t v112 = sub_100017B08();
  }
  uint64_t v114 = v152;
  sub_1000099E4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v152, 0.0, 1, 0.0, 1, v112, v113, &qword_100020460, &qword_100020468);
  sub_100012EA8(v106, &qword_100020460);
  char v115 = sub_100017858();
  sub_1000175C8();
  uint64_t v117 = v116;
  uint64_t v119 = v118;
  uint64_t v121 = v120;
  uint64_t v123 = v122;
  uint64_t v124 = v149;
  sub_100012F44(v114, v149, &qword_100020468);
  uint64_t v125 = v124 + *(int *)(v150 + 36);
  *(unsigned char *)uint64_t v125 = v115;
  *(void *)(v125 + 8) = v117;
  *(void *)(v125 + 16) = v119;
  *(void *)(v125 + 24) = v121;
  *(void *)(v125 + 32) = v123;
  *(unsigned char *)(v125 + 40) = 0;
  sub_100012EA8(v114, &qword_100020468);
  uint64_t v126 = v153;
  sub_100012E44(v124, v153, &qword_100020470);
  uint64_t v127 = v157;
  uint64_t v128 = v147;
  sub_100012F44(v157, v147, &qword_1000204A8);
  uint64_t v129 = v160;
  uint64_t v130 = v148;
  sub_100012F44(v160, v148, &qword_100020480);
  uint64_t v131 = v154;
  sub_100012F44(v126, v154, &qword_100020470);
  uint64_t v132 = v155;
  sub_100012F44(v128, v155, &qword_1000204A8);
  uint64_t v133 = sub_100005748(&qword_1000204C0);
  sub_100012F44(v130, v132 + *(int *)(v133 + 48), &qword_100020480);
  sub_100012F44(v131, v132 + *(int *)(v133 + 64), &qword_100020470);
  sub_100012EA8(v126, &qword_100020470);
  sub_100012EA8(v129, &qword_100020480);
  sub_100012EA8(v127, &qword_1000204A8);
  sub_100012EA8(v131, &qword_100020470);
  sub_100012EA8(v130, &qword_100020480);
  return sub_100012EA8(v128, &qword_1000204A8);
}

uint64_t sub_100007BA0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2 = a1;
  uint64_t v155 = a2;
  uint64_t v156 = a1;
  uint64_t v128 = sub_100005748(&qword_100020508);
  __chkstk_darwin(v128, v3);
  uint64_t v131 = (uint64_t *)((char *)&v119 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for DeveloperTrustSheetView(0);
  uint64_t v122 = *(void *)(v5 - 8);
  uint64_t v6 = v5 - 8;
  uint64_t KeyPath = v5 - 8;
  __chkstk_darwin(v5 - 8, v7);
  uint64_t v123 = v8;
  uint64_t v124 = (uint64_t)&v119 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_100017658();
  uint64_t v129 = *(void *)(v130 - 8);
  __chkstk_darwin(v130, v9);
  uint64_t v125 = (char *)&v119 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005748(&qword_100020510);
  uint64_t v153 = *(void *)(v11 - 8);
  uint64_t v154 = v11;
  uint64_t v13 = __chkstk_darwin(v11, v12);
  uint64_t v127 = (char *)&v119 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v15);
  uint64_t v126 = (uint64_t)&v119 - v16;
  uint64_t v144 = (void (*)(char *, uint64_t, uint64_t))sub_1000173E8();
  uint64_t v143 = (void (*)(char *, uint64_t))*((void *)v144 - 1);
  __chkstk_darwin(v144, v17);
  uint64_t v142 = (char *)&v119 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v141 = sub_1000173F8();
  uint64_t v140 = *(void *)(v141 - 8);
  __chkstk_darwin(v141, v19);
  uint64_t v139 = (char *)&v119 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100017418();
  __chkstk_darwin(v21 - 8, v22);
  uint64_t v138 = (char *)&v119 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005748(&qword_100020518);
  __chkstk_darwin(v24 - 8, v25);
  uint64_t v136 = (char *)&v119 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_100005748(&qword_100020520);
  __chkstk_darwin(v27 - 8, v28);
  uint64_t v137 = (char *)&v119 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100017438();
  uint64_t v159 = *(void *)(v30 - 8);
  uint64_t v160 = v30;
  uint64_t v32 = __chkstk_darwin(v30, v31);
  uint64_t v121 = (char *)&v119 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32, v34);
  v134 = (char *)&v119 - v35;
  uint64_t v36 = sub_100005748(&qword_100020528);
  uint64_t v38 = __chkstk_darwin(v36 - 8, v37);
  uint64_t v152 = (uint64_t)&v119 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38, v40);
  uint64_t v151 = (uint64_t)&v119 - v41;
  uint64_t v42 = sub_100017668();
  uint64_t v161 = *(void *)(v42 - 8);
  uint64_t v44 = __chkstk_darwin(v42, v43);
  v158 = (char *)&v119 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v44, v46);
  uint64_t v157 = (uint64_t)&v119 - v47;
  uint64_t v135 = v2 + *(int *)(v6 + 36);
  uint64_t v162 = sub_100017568();
  uint64_t v163 = v48;
  sub_10000F63C();
  uint64_t v49 = sub_100017948();
  uint64_t v51 = v50;
  LOBYTE(v2) = v52 & 1;
  sub_1000178F8();
  uint64_t v53 = sub_100017928();
  uint64_t v55 = v54;
  char v57 = v56;
  swift_release();
  sub_10000F62C(v49, v51, v2);
  swift_bridgeObjectRelease();
  uint64_t v58 = sub_100017918();
  uint64_t v148 = v59;
  uint64_t v149 = v58;
  int v147 = v60;
  uint64_t v150 = v61;
  sub_10000F62C(v53, v55, v57 & 1);
  swift_bridgeObjectRelease();
  uint64_t v62 = v157;
  uint64_t v133 = v156 + *(int *)(KeyPath + 32);
  sub_10000E5D4(v157);
  uint64_t v63 = v161;
  uint64_t v64 = *(void (**)(char *))(v161 + 104);
  uint64_t v65 = v158;
  unsigned int v132 = enum case for DynamicTypeSize.large(_:);
  v64(v158);
  uint64_t v66 = sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t v67 = v65;
  int v145 = sub_100017B98();
  uint64_t v69 = v63 + 8;
  id v68 = *(void (**)(char *, uint64_t))(v63 + 8);
  v68(v67, v42);
  uint64_t v120 = v42;
  uint64_t v161 = v69;
  v68((char *)v62, v42);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100017558();
  uint64_t v70 = sub_100017498();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v136, 1, 1, v70);
  (*(void (**)(char *, void, uint64_t))(v140 + 104))(v139, enum case for AttributedString.MarkdownParsingOptions.InterpretedSyntax.full(_:), v141);
  (*((void (**)(char *, void, void *))v143 + 13))(v142, enum case for AttributedString.MarkdownParsingOptions.FailurePolicy.throwError(_:), v144);
  sub_100017408();
  uint64_t v71 = (uint64_t)v137;
  sub_100017428();
  uint64_t v142 = (char *)v66;
  uint64_t v143 = v68;
  uint64_t v144 = (void (*)(char *, uint64_t, uint64_t))v64;
  uint64_t v72 = v132;
  uint64_t v74 = v159;
  uint64_t v73 = v160;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v159 + 56))(v71, 0, 1, v160);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v71, 1, v73) == 1)
  {
    sub_100012EA8(v71, &qword_100020520);
    uint64_t v75 = 1;
    uint64_t v76 = v154;
    uint64_t v77 = v151;
  }
  else
  {
    uint64_t v78 = v159;
    uint64_t v79 = v134;
    uint64_t v80 = v71;
    uint64_t v81 = v160;
    (*(void (**)(char *, uint64_t, uint64_t))(v159 + 32))(v134, v80, v160);
    (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v121, v79, v81);
    uint64_t v82 = sub_100017938();
    uint64_t v84 = v83;
    char v86 = v85 & 1;
    sub_1000178E8();
    uint64_t v140 = sub_100017928();
    uint64_t v88 = v87;
    LOBYTE(v78) = v89;
    uint64_t v141 = v90;
    swift_release();
    int v91 = v78 & 1;
    sub_10000F62C(v82, v84, v86);
    swift_bridgeObjectRelease();
    uint64_t v92 = v157;
    sub_10000E5D4(v157);
    uint64_t v93 = v158;
    uint64_t v94 = v120;
    v144(v158, v72, v120);
    LOBYTE(v78) = sub_100017B98();
    uint64_t v95 = (void (*)(uint64_t, uint64_t))v143;
    v143(v93, v94);
    v95(v92, v94);
    LODWORD(v161) = (v78 & 1) == 0;
    uint64_t v96 = swift_getKeyPath();
    uint64_t v97 = swift_getKeyPath();
    uint64_t v98 = v124;
    sub_10000F104(v156, v124, type metadata accessor for DeveloperTrustSheetView);
    unint64_t v99 = (*(unsigned __int8 *)(v122 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v122 + 80);
    uint64_t v100 = swift_allocObject();
    sub_10000F170(v98, v100 + v99, type metadata accessor for DeveloperTrustSheetView);
    uint64_t v101 = v125;
    sub_100017648();
    uint64_t v102 = v131;
    uint64_t v103 = v129;
    uint64_t v104 = v130;
    (*(void (**)(char *, char *, uint64_t))(v129 + 16))((char *)v131 + *(int *)(v128 + 28), v101, v130);
    *uint64_t v102 = v97;
    uint64_t v76 = v154;
    uint64_t v105 = (uint64_t)v127;
    sub_100012F44((uint64_t)v102, (uint64_t)&v127[*(int *)(v154 + 36)], &qword_100020508);
    uint64_t v106 = v140;
    *(void *)uint64_t v105 = v140;
    *(void *)(v105 + 8) = v88;
    uint64_t v107 = v88;
    LODWORD(v139) = v91;
    *(unsigned char *)(v105 + 16) = v91;
    *(void *)(v105 + 24) = v141;
    *(void *)(v105 + 32) = v96;
    *(unsigned char *)(v105 + 40) = v161;
    uint64_t v108 = v106;
    sub_10000F5A8(v106, v107, v91);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100012EA8((uint64_t)v102, &qword_100020508);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v101, v104);
    sub_10000F62C(v108, v107, (char)v139);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v159 + 8))(v134, v160);
    uint64_t v109 = v126;
    sub_100012E44(v105, v126, &qword_100020510);
    uint64_t v77 = v151;
    sub_100012E44(v109, v151, &qword_100020510);
    uint64_t v75 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v153 + 56))(v77, v75, 1, v76);
  char v110 = v147 & 1;
  BOOL v111 = (v145 & 1) == 0;
  uint64_t v112 = v152;
  sub_100012F44(v77, v152, &qword_100020528);
  uint64_t v113 = v155;
  uint64_t v115 = v148;
  uint64_t v114 = v149;
  *uint64_t v155 = v149;
  v113[1] = v115;
  *((unsigned char *)v113 + 16) = v110;
  uint64_t v116 = KeyPath;
  v113[3] = v150;
  v113[4] = v116;
  *((unsigned char *)v113 + 40) = v111;
  uint64_t v117 = sub_100005748(&qword_100020530);
  sub_100012F44(v112, (uint64_t)v113 + *(int *)(v117 + 48), &qword_100020528);
  sub_10000F5A8(v114, v115, v110);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100012EA8(v77, &qword_100020528);
  sub_100012EA8(v112, &qword_100020528);
  sub_10000F62C(v114, v115, v110);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000089D4()
{
  return sub_1000176F8();
}

uint64_t sub_1000089F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000E8E4(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for OpenURLAction, (uint64_t (*)(char *))&EnvironmentValues.openURL.setter);
}

uint64_t sub_100008A24(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ButtonSelection(0);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DeveloperTrustSheetView(0);
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = sub_100017498();
    uint64_t v7 = *(void *)(v6 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 2, v6);
    sub_100013B08((uint64_t)v5);
    swift_unknownObjectRelease();
    sub_10000F980((uint64_t)v5, type metadata accessor for ButtonSelection);
  }
  return sub_100017638();
}

double sub_100008B84()
{
  uint64_t v0 = sub_100017668();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  uint64_t v8 = (char *)&v14 - v7;
  type metadata accessor for DeveloperTrustSheetView(0);
  sub_10000E5D4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v5, enum case for DynamicTypeSize.large(_:), v0);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v9 = sub_100017B98();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v5, v0);
  v10(v8, v0);
  double result = 0.0;
  if ((v9 & 1) == 0)
  {
    id v12 = [self currentDevice];
    id v13 = [v12 userInterfaceIdiom];

    double result = 88.0;
    if (v13 != (id)1) {
      return 20.0;
    }
  }
  return result;
}

uint64_t sub_100008D5C@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_100017668();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v6 = __chkstk_darwin(v3, v5);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v40 - v10;
  uint64_t v12 = sub_100005748(&qword_1000204C8);
  __chkstk_darwin(v12 - 8, v13);
  uint64_t v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005748(&qword_1000204D0);
  uint64_t v18 = __chkstk_darwin(v16 - 8, v17);
  uint64_t v40 = (uint64_t)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v18, v20);
  uint64_t v23 = (char *)&v40 - v22;
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)&v40 - v25;
  double v27 = sub_10000911C();
  *(void *)uint64_t v15 = sub_100017768();
  *((void *)v15 + 1) = 0x4036000000000000;
  v15[16] = 0;
  uint64_t v28 = sub_100005748(&qword_1000204D8);
  sub_1000092F8(a1, (uint64_t)&v15[*(int *)(v28 + 44)]);
  double v29 = sub_10000ADAC();
  type metadata accessor for DeveloperTrustSheetView(0);
  sub_10000E5D4((uint64_t)v11);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v8, enum case for DynamicTypeSize.large(_:), v3);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v30 = sub_100017B98();
  uint64_t v31 = *(void (**)(char *, uint64_t))(v4 + 8);
  v31(v8, v3);
  v31(v11, v3);
  if (v30) {
    uint64_t v32 = sub_100017B18();
  }
  else {
    uint64_t v32 = sub_100017B08();
  }
  sub_1000099E4(0.0, 1, 0.0, 1, v29, 0, 0.0, 1, (uint64_t)v23, 0.0, 1, 0.0, 1, v32, v33, &qword_1000204C8, &qword_1000204D0);
  sub_100012EA8((uint64_t)v15, &qword_1000204C8);
  sub_100012E44((uint64_t)v23, (uint64_t)v26, &qword_1000204D0);
  double v34 = sub_10000911C();
  uint64_t v35 = v40;
  sub_100012F44((uint64_t)v26, v40, &qword_1000204D0);
  uint64_t v36 = v41;
  *uint64_t v41 = v27;
  *((unsigned char *)v36 + 8) = 0;
  uint64_t v37 = sub_100005748(&qword_1000204E0);
  sub_100012F44(v35, (uint64_t)v36 + *(int *)(v37 + 48), &qword_1000204D0);
  uint64_t v38 = (double *)((char *)v36 + *(int *)(v37 + 64));
  *uint64_t v38 = v34;
  *((unsigned char *)v38 + 8) = 0;
  sub_100012EA8((uint64_t)v26, &qword_1000204D0);
  return sub_100012EA8(v35, &qword_1000204D0);
}

double sub_10000911C()
{
  uint64_t v0 = sub_100017668();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  uint64_t v8 = (char *)&v14 - v7;
  type metadata accessor for DeveloperTrustSheetView(0);
  sub_10000E5D4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v5, enum case for DynamicTypeSize.large(_:), v0);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v9 = sub_100017B98();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v5, v0);
  v10(v8, v0);
  double result = 0.0;
  if ((v9 & 1) == 0)
  {
    id v12 = [self currentDevice];
    id v13 = [v12 userInterfaceIdiom];

    double result = 36.0;
    if (v13 == (id)1) {
      return 88.0;
    }
  }
  return result;
}

uint64_t sub_1000092F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v62 = a2;
  uint64_t v3 = sub_100005748(&qword_1000204E8);
  uint64_t v4 = v3 - 8;
  uint64_t v6 = __chkstk_darwin(v3, v5);
  uint64_t v61 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v60 = (uint64_t)&v57 - v10;
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v59 = (uint64_t)&v57 - v13;
  uint64_t v15 = __chkstk_darwin(v12, v14);
  uint64_t v58 = (uint64_t)&v57 - v16;
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = (char *)&v57 - v19;
  uint64_t v22 = __chkstk_darwin(v18, v21);
  uint64_t v57 = (uint64_t)&v57 - v23;
  uint64_t v25 = __chkstk_darwin(v22, v24);
  double v27 = (char *)&v57 - v26;
  uint64_t v29 = __chkstk_darwin(v25, v28);
  uint64_t v31 = (char *)&v57 - v30;
  __chkstk_darwin(v29, v32);
  double v34 = (char *)&v57 - v33;
  uint64_t v35 = self;
  id v36 = [v35 currentDevice];
  id v37 = [v36 userInterfaceIdiom];

  double v38 = 16.0;
  if (v37 == (id)1) {
    double v39 = 14.0;
  }
  else {
    double v39 = 16.0;
  }
  uint64_t v40 = (uint64_t *)&v27[*(int *)(v4 + 48)];
  *uint64_t v40 = swift_getKeyPath();
  sub_100005748(&qword_1000202E0);
  swift_storeEnumTagMultiPayload();
  sub_10000A894(a1, (uint64_t (*)(void))&DeveloperApprovalSheetContext.firstBulletTitle.getter, (uint64_t (*)(uint64_t))&DeveloperApprovalSheetContext.firstBulletBody.getter, (uint64_t)v27);
  *(double *)&v27[*(int *)(v4 + 44)] = v39;
  sub_100012E44((uint64_t)v27, (uint64_t)v31, &qword_1000204E8);
  sub_100012E44((uint64_t)v31, (uint64_t)v34, &qword_1000204E8);
  id v41 = [v35 currentDevice];
  id v42 = [v41 userInterfaceIdiom];

  if (v42 == (id)1) {
    double v43 = 14.0;
  }
  else {
    double v43 = 16.0;
  }
  uint64_t v44 = (uint64_t *)&v27[*(int *)(v4 + 48)];
  *uint64_t v44 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v45 = a1;
  sub_100009F58(a1, (uint64_t)v27);
  *(double *)&v27[*(int *)(v4 + 44)] = v43;
  sub_100012E44((uint64_t)v27, (uint64_t)v20, &qword_1000204E8);
  uint64_t v46 = v57;
  sub_100012E44((uint64_t)v20, v57, &qword_1000204E8);
  id v47 = [v35 currentDevice];
  id v48 = [v47 userInterfaceIdiom];

  if (v48 == (id)1) {
    double v38 = 14.0;
  }
  uint64_t v49 = (uint64_t *)&v27[*(int *)(v4 + 48)];
  *uint64_t v49 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  sub_10000A894(v45, (uint64_t (*)(void))&DeveloperApprovalSheetContext.thirdBulletTitle.getter, (uint64_t (*)(uint64_t))&DeveloperApprovalSheetContext.thirdBulletBody.getter, (uint64_t)v27);
  *(double *)&v27[*(int *)(v4 + 44)] = v38;
  uint64_t v50 = v59;
  sub_100012E44((uint64_t)v27, v59, &qword_1000204E8);
  uint64_t v51 = v58;
  sub_100012E44(v50, v58, &qword_1000204E8);
  sub_100012F44((uint64_t)v34, (uint64_t)v27, &qword_1000204E8);
  uint64_t v52 = v60;
  sub_100012F44(v46, v60, &qword_1000204E8);
  uint64_t v53 = v61;
  sub_100012F44(v51, v61, &qword_1000204E8);
  uint64_t v54 = v62;
  sub_100012F44((uint64_t)v27, v62, &qword_1000204E8);
  uint64_t v55 = sub_100005748(&qword_1000204F0);
  sub_100012F44(v52, v54 + *(int *)(v55 + 48), &qword_1000204E8);
  sub_100012F44(v53, v54 + *(int *)(v55 + 64), &qword_1000204E8);
  sub_100012EA8(v51, &qword_1000204E8);
  sub_100012EA8(v46, &qword_1000204E8);
  sub_100012EA8((uint64_t)v34, &qword_1000204E8);
  sub_100012EA8(v53, &qword_1000204E8);
  sub_100012EA8(v52, &qword_1000204E8);
  return sub_100012EA8((uint64_t)v27, &qword_1000204E8);
}

__n128 sub_1000097F8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100017C58();
    uint64_t v23 = (void *)sub_100017838();
    sub_100017588();
  }
  sub_100017698();
  uint64_t v24 = sub_100005748(&qword_1000203A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_100005748(&qword_1000203D8) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

__n128 sub_1000099E4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100017C58();
    long long v28 = (void *)sub_100017838();
    sub_100017588();

    uint64_t v19 = a17;
  }
  sub_100017698();
  sub_100012F44(v17, a9, a16);
  long long v29 = (_OWORD *)(a9 + *(int *)(sub_100005748(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *long long v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_100009BB4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100017C58();
    long long v31 = (void *)sub_100017838();
    sub_100017588();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_100017698();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_10000F5A8(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_100009DA8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100017C58();
    uint64_t v23 = (void *)sub_100017838();
    sub_100017588();
  }
  sub_100017698();
  long long v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  long long v25 = v13[4];
  long long v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[11] = v34;
  a9[4] = v25;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;
  return sub_100012F04((uint64_t)v13);
}

uint64_t sub_100009F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v44 = sub_100005748(&qword_100020488) - 8;
  __chkstk_darwin(v44, v2);
  double v43 = (uint64_t *)((char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_100005748(&qword_100020490);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000179F8();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005748(&qword_100020498);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100005748(&qword_1000204A0) - 8;
  uint64_t v19 = __chkstk_darwin(v42, v18);
  char v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19, v22);
  uint64_t v41 = (uint64_t)&v36 - v23;
  sub_100017A08();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v8);
  uint64_t v24 = sub_100017A18();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  sub_100017B08();
  sub_100017608();
  char v25 = v48;
  uint64_t v39 = v49;
  uint64_t v40 = v47;
  int v38 = v50;
  uint64_t v36 = v52;
  uint64_t v37 = v51;
  sub_100017788();
  uint64_t v26 = sub_100017798();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v7, 0, 1, v26);
  uint64_t KeyPath = swift_getKeyPath();
  long long v28 = v43;
  sub_100012F44((uint64_t)v7, (uint64_t)v43 + *(int *)(v44 + 36), &qword_100020490);
  uint64_t *v28 = KeyPath;
  sub_100012F44((uint64_t)v28, (uint64_t)&v17[*(int *)(v14 + 44)], &qword_100020488);
  *(void *)uint64_t v17 = v24;
  *((void *)v17 + 1) = 0;
  *((_WORD *)v17 + 8) = 257;
  *((void *)v17 + 3) = v40;
  v17[32] = v25;
  *((void *)v17 + 5) = v39;
  v17[48] = v38;
  uint64_t v29 = v36;
  *((void *)v17 + 7) = v37;
  *((void *)v17 + 8) = v29;
  swift_retain();
  sub_100012EA8((uint64_t)v28, &qword_100020488);
  sub_100012EA8((uint64_t)v7, &qword_100020490);
  swift_release();
  uint64_t v30 = sub_1000179A8();
  sub_100012F44((uint64_t)v17, (uint64_t)v21, &qword_100020498);
  *(void *)&v21[*(int *)(v42 + 44)] = v30;
  sub_100012EA8((uint64_t)v17, &qword_100020498);
  uint64_t v31 = v41;
  sub_100012E44((uint64_t)v21, v41, &qword_1000204A0);
  uint64_t v32 = sub_100017768();
  sub_10000A494((uint64_t (*)(void))&DeveloperApprovalSheetContext.secondBulletTitle.getter, (uint64_t (*)(uint64_t))&DeveloperApprovalSheetContext.secondBulletBody.getter, v53);
  v54[296] = 1;
  memcpy(&v54[7], v53, 0x120uLL);
  sub_100012F44(v31, (uint64_t)v21, &qword_1000204A0);
  uint64_t v33 = v46;
  sub_100012F44((uint64_t)v21, v46, &qword_1000204A0);
  long long v34 = (void *)(v33 + *(int *)(sub_100005748(&qword_1000204F8) + 48));
  v55[0] = v32;
  v55[1] = 0;
  LOBYTE(v55[2]) = 1;
  memcpy((char *)&v55[2] + 1, v54, 0x127uLL);
  memcpy(v34, v55, 0x138uLL);
  sub_10000F534((uint64_t)v55);
  sub_100012EA8(v31, &qword_1000204A0);
  v56[0] = v32;
  v56[1] = 0;
  char v57 = 1;
  memcpy(v58, v54, sizeof(v58));
  sub_10000F5B8((uint64_t)v56);
  return sub_100012EA8((uint64_t)v21, &qword_1000204A0);
}

uint64_t sub_10000A494@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t (*a2)(uint64_t)@<X2>, void *a3@<X8>)
{
  type metadata accessor for DeveloperTrustSheetView(0);
  *(void *)&__src[0] = a1();
  *((void *)&__src[0] + 1) = v4;
  sub_10000F63C();
  uint64_t v5 = sub_100017948();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  sub_1000178D8();
  uint64_t v10 = sub_100017928();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_10000F62C(v5, v7, v9);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_100017918();
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_10000F62C(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  uint64_t v22 = sub_100017B18();
  sub_100009BB4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v22, v23, v15, v17, v21, v19);
  sub_10000F62C(v15, v17, v21);
  uint64_t v24 = swift_bridgeObjectRelease();
  long long v64 = __src[6];
  long long v65 = __src[7];
  long long v66 = __src[8];
  long long v60 = __src[2];
  long long v61 = __src[3];
  long long v62 = __src[4];
  long long v63 = __src[5];
  long long v58 = __src[0];
  long long v59 = __src[1];
  *(void *)&__src[0] = a2(v24);
  *((void *)&__src[0] + 1) = v25;
  uint64_t v26 = sub_100017948();
  uint64_t v28 = v27;
  LOBYTE(a1) = v29 & 1;
  LODWORD(__src[0]) = sub_1000177F8();
  uint64_t v30 = sub_100017908();
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  LOBYTE(v19) = v35 & 1;
  sub_10000F62C(v26, v28, (char)a1);
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_100017B18();
  sub_100009BB4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1, v36, v37, v30, v32, v19, v34);
  sub_10000F62C(v30, v32, v19);
  swift_bridgeObjectRelease();
  long long v55 = __src[6];
  long long v56 = __src[7];
  long long v57 = __src[8];
  long long v51 = __src[2];
  long long v52 = __src[3];
  long long v53 = __src[4];
  long long v54 = __src[5];
  long long v49 = __src[0];
  long long v50 = __src[1];
  v67[6] = v64;
  v67[7] = v65;
  v67[8] = v66;
  v67[2] = v60;
  v67[3] = v61;
  v67[4] = v62;
  v67[5] = v63;
  v67[0] = v58;
  v67[1] = v59;
  long long v38 = __src[6];
  long long v39 = __src[7];
  v68[6] = __src[6];
  v68[7] = __src[7];
  v68[8] = __src[8];
  long long v40 = __src[2];
  long long v41 = __src[3];
  v68[2] = __src[2];
  v68[3] = __src[3];
  long long v43 = __src[4];
  long long v42 = __src[5];
  v68[4] = __src[4];
  v68[5] = __src[5];
  long long v45 = __src[0];
  long long v44 = __src[1];
  v68[0] = __src[0];
  v68[1] = __src[1];
  __src[6] = v64;
  __src[7] = v65;
  __src[2] = v60;
  __src[3] = v61;
  __src[4] = v62;
  __src[5] = v63;
  __src[0] = v58;
  __src[1] = v59;
  __src[14] = v42;
  __src[15] = v38;
  __src[16] = v39;
  __src[17] = __src[8];
  __src[10] = v44;
  __src[11] = v40;
  __src[12] = v41;
  __src[13] = v43;
  __src[8] = v66;
  __src[9] = v45;
  memcpy(a3, __src, 0x120uLL);
  v70[6] = v55;
  v70[7] = v56;
  v70[8] = v57;
  v70[2] = v51;
  v70[3] = v52;
  v70[5] = v54;
  v70[4] = v53;
  v70[1] = v50;
  v70[0] = v49;
  sub_100012F04((uint64_t)v67);
  sub_100012F04((uint64_t)v68);
  sub_10000F690((uint64_t)v70);
  v71[6] = v64;
  v71[7] = v65;
  v71[8] = v66;
  v71[2] = v60;
  v71[3] = v61;
  v71[4] = v62;
  v71[5] = v63;
  v71[0] = v58;
  v71[1] = v59;
  return sub_10000F690((uint64_t)v71);
}

uint64_t sub_10000A894@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X3>, uint64_t (*a3)(uint64_t)@<X4>, uint64_t a4@<X8>)
{
  uint64_t v47 = a2;
  char v48 = a3;
  uint64_t v46 = a1;
  uint64_t v49 = a4;
  uint64_t v45 = sub_100005748(&qword_100020488) - 8;
  __chkstk_darwin(v45, v4);
  long long v44 = (uint64_t *)((char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_100005748(&qword_100020490);
  __chkstk_darwin(v6 - 8, v7);
  char v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000179F8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  char v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005748(&qword_100020498);
  uint64_t v16 = v15 - 8;
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100005748(&qword_1000204A0) - 8;
  uint64_t v21 = __chkstk_darwin(v43, v20);
  uint64_t v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21, v24);
  uint64_t v42 = (uint64_t)&v37 - v25;
  sub_1000179E8();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v10);
  uint64_t v26 = sub_100017A18();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_100017B08();
  sub_100017608();
  LOBYTE(v14) = v51;
  uint64_t v40 = v52;
  uint64_t v41 = v50;
  int v39 = v53;
  uint64_t v37 = v55;
  uint64_t v38 = v54;
  sub_100017788();
  uint64_t v27 = sub_100017798();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v9, 0, 1, v27);
  uint64_t KeyPath = swift_getKeyPath();
  char v29 = v44;
  sub_100012F44((uint64_t)v9, (uint64_t)v44 + *(int *)(v45 + 36), &qword_100020490);
  *char v29 = KeyPath;
  sub_100012F44((uint64_t)v29, (uint64_t)&v19[*(int *)(v16 + 44)], &qword_100020488);
  *(void *)uint64_t v19 = v26;
  *((void *)v19 + 1) = 0;
  *((_WORD *)v19 + 8) = 257;
  *((void *)v19 + 3) = v41;
  v19[32] = (char)v14;
  *((void *)v19 + 5) = v40;
  v19[48] = v39;
  uint64_t v30 = v37;
  *((void *)v19 + 7) = v38;
  *((void *)v19 + 8) = v30;
  swift_retain();
  sub_100012EA8((uint64_t)v29, &qword_100020488);
  sub_100012EA8((uint64_t)v9, &qword_100020490);
  swift_release();
  uint64_t v31 = sub_1000179A8();
  sub_100012F44((uint64_t)v19, (uint64_t)v23, &qword_100020498);
  *(void *)&v23[*(int *)(v43 + 44)] = v31;
  sub_100012EA8((uint64_t)v19, &qword_100020498);
  uint64_t v32 = v42;
  sub_100012E44((uint64_t)v23, v42, &qword_1000204A0);
  uint64_t v33 = sub_100017768();
  sub_10000A494(v47, v48, v56);
  v57[296] = 1;
  memcpy(&v57[7], v56, 0x120uLL);
  sub_100012F44(v32, (uint64_t)v23, &qword_1000204A0);
  uint64_t v34 = v49;
  sub_100012F44((uint64_t)v23, v49, &qword_1000204A0);
  char v35 = (void *)(v34 + *(int *)(sub_100005748(&qword_1000204F8) + 48));
  v58[0] = v33;
  v58[1] = 0;
  LOBYTE(v58[2]) = 1;
  memcpy((char *)&v58[2] + 1, v57, 0x127uLL);
  memcpy(v35, v58, 0x138uLL);
  sub_10000F534((uint64_t)v58);
  sub_100012EA8(v32, &qword_1000204A0);
  v59[0] = v33;
  v59[1] = 0;
  char v60 = 1;
  memcpy(v61, v57, sizeof(v61));
  sub_10000F5B8((uint64_t)v59);
  return sub_100012EA8((uint64_t)v23, &qword_1000204A0);
}

double sub_10000ADAC()
{
  uint64_t v0 = sub_100017668();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  uint64_t v8 = (char *)&v14 - v7;
  type metadata accessor for DeveloperTrustSheetView(0);
  sub_10000E5D4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v5, enum case for DynamicTypeSize.large(_:), v0);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v9 = sub_100017B98();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v5, v0);
  v10(v8, v0);
  if (v9) {
    return INFINITY;
  }
  id v12 = [self currentDevice];
  id v13 = [v12 userInterfaceIdiom];

  double result = INFINITY;
  if (v13 == (id)1) {
    return 340.0;
  }
  return result;
}

uint64_t sub_10000AF98(long long *a1, uint64_t a2)
{
  uint64_t v4 = sub_100017B28();
  uint64_t v26 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100017B48();
  uint64_t v8 = *(void *)(v25 - 8);
  __chkstk_darwin(v25, v9);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DeveloperTrustSheetView(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  __chkstk_darwin(v12 - 8, v15);
  long long v24 = *a1;
  uint64_t v16 = *((void *)a1 + 2);
  uint64_t v17 = *((void *)a1 + 3);
  sub_10000F204();
  uint64_t v18 = (void *)sub_100017C78();
  sub_10000F104(a2, (uint64_t)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for DeveloperTrustSheetView);
  unint64_t v19 = (*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v20 = swift_allocObject();
  sub_10000F170((uint64_t)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v20 + v19, type metadata accessor for DeveloperTrustSheetView);
  unint64_t v21 = v20 + ((v14 + v19 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(_OWORD *)unint64_t v21 = v24;
  *(void *)(v21 + 16) = v16;
  *(void *)(v21 + 24) = v17;
  aBlock[4] = sub_10000F3D0;
  aBlock[5] = v20;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000B3F4;
  aBlock[3] = &unk_10001CD98;
  uint64_t v22 = _Block_copy(aBlock);
  sub_100017B38();
  uint64_t v27 = &_swiftEmptyArrayStorage;
  sub_10000E9B4(&qword_100020448, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100005748(&qword_100020450);
  sub_1000132C4((unint64_t *)&qword_100020458, &qword_100020450);
  sub_100017CC8();
  sub_100017C88();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v25);
  return swift_release();
}

uint64_t sub_10000B354(double a1, double a2, double a3, double a4)
{
  return sub_100017A48();
}

uint64_t sub_10000B3F4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000B438@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v55 = a2;
  uint64_t v3 = sub_100017578();
  uint64_t v50 = *(void *)(v3 - 8);
  uint64_t v51 = v3;
  __chkstk_darwin(v3, v4);
  uint64_t v49 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v7 = __chkstk_darwin(v54, v6);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  uint64_t v52 = (uint64_t)&v44 - v11;
  uint64_t v53 = sub_100005748(&qword_1000203E0);
  __chkstk_darwin(v53, v12);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100017668();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18, v21);
  uint64_t v23 = (char *)&v44 - v22;
  uint64_t v24 = type metadata accessor for DeveloperTrustSheetView(0);
  sub_10000E5D4((uint64_t)v23);
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v20, enum case for DynamicTypeSize.large(_:), v15);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v25 = sub_100017B98();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v16 + 8);
  v26(v20, v15);
  v26(v23, v15);
  if (v25)
  {
    swift_storeEnumTagMultiPayload();
    sub_10000E9B4(&qword_100020400, (void (*)(uint64_t))type metadata accessor for DeveloperTrustSheetButtons);
    return sub_1000177C8();
  }
  else
  {
    uint64_t v28 = *((void *)a1 + 4);
    long long v29 = a1[1];
    long long v56 = *a1;
    long long v57 = v29;
    uint64_t v58 = v28;
    sub_100005748(&qword_1000203F0);
    sub_100017A58();
    uint64_t v48 = v59;
    uint64_t v47 = v60;
    long long v46 = v61;
    uint64_t v30 = v62;
    uint64_t v31 = v63;
    uint64_t v32 = *((void *)a1 + 6);
    LOBYTE(v56) = *((unsigned char *)a1 + 40);
    *((void *)&v56 + 1) = v32;
    sub_100005748(&qword_1000203F8);
    sub_100017A58();
    uint64_t v45 = v59;
    uint64_t v44 = v60;
    char v33 = v61;
    char v35 = v49;
    uint64_t v34 = v50;
    uint64_t v36 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, (uint64_t)a1 + *(int *)(v24 + 28), v51);
    uint64_t v37 = (uint64_t)a1 + *(int *)(v24 + 32);
    swift_unknownObjectWeakLoadStrong();
    uint64_t v38 = *(void *)(v37 + 8);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v40 = v54;
    *(void *)&v9[*(int *)(v54 + 24)] = KeyPath;
    sub_100005748(&qword_1000202E0);
    swift_storeEnumTagMultiPayload();
    uint64_t v41 = v47;
    *(void *)uint64_t v9 = v48;
    *((void *)v9 + 1) = v41;
    *((_OWORD *)v9 + 1) = v46;
    *((void *)v9 + 4) = v30;
    *((void *)v9 + 5) = v31;
    uint64_t v42 = v44;
    *((void *)v9 + 6) = v45;
    *((void *)v9 + 7) = v42;
    v9[64] = v33;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(&v9[*(int *)(v40 + 28)], v35, v36);
    *(void *)&v9[*(int *)(v40 + 32) + 8] = v38;
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    uint64_t v43 = v52;
    sub_10000F170((uint64_t)v9, v52, type metadata accessor for DeveloperTrustSheetButtons);
    sub_10000F104(v43, (uint64_t)v14, type metadata accessor for DeveloperTrustSheetButtons);
    swift_storeEnumTagMultiPayload();
    sub_10000E9B4(&qword_100020400, (void (*)(uint64_t))type metadata accessor for DeveloperTrustSheetButtons);
    sub_1000177C8();
    return sub_10000F980(v43, type metadata accessor for DeveloperTrustSheetButtons);
  }
}

uint64_t sub_10000B9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000177B8();
  __chkstk_darwin(v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_1000177C8();
}

uint64_t sub_10000BAC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000177B8();
  __chkstk_darwin(v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_1000177C8();
}

uint64_t sub_10000BBC8@<X0>(uint64_t a1@<X8>)
{
  return sub_100006438(*(void *)(v1 + 16), a1);
}

uint64_t sub_10000BBD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for DeveloperTrustSheetButtons(uint64_t a1)
{
  return sub_10000F948(a1, qword_100020610);
}

uint64_t sub_10000BC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v66 = a2;
  uint64_t v4 = *(char **)(a1 + 16);
  uint64_t v5 = *(char **)(a1 + 24);
  uint64_t v6 = sub_100017A88();
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6, v7);
  uint64_t v58 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v10);
  long long v57 = (char *)&v55 - v11;
  long long v61 = v5;
  uint64_t v62 = v4;
  uint64_t v12 = sub_100017AA8();
  uint64_t v56 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  uint64_t v16 = (char *)&v55 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  uint64_t v55 = (char *)&v55 - v18;
  uint64_t v19 = sub_100017668();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v22 = __chkstk_darwin(v19, v21);
  uint64_t v24 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v25);
  uint64_t v27 = (char *)&v55 - v26;
  uint64_t v28 = sub_1000177D8();
  uint64_t v64 = *(void *)(v28 - 8);
  uint64_t v65 = v28;
  __chkstk_darwin(v28, v29);
  uint64_t v63 = (char *)&v55 - v30;
  uint64_t v60 = v2;
  sub_10000E5D4((uint64_t)v27);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v24, enum case for DynamicTypeSize.large(_:), v19);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v31 = sub_100017B98();
  uint64_t v32 = *(void (**)(char *, uint64_t))(v20 + 8);
  v32(v24, v19);
  v32(v27, v19);
  if (v31)
  {
    uint64_t v33 = sub_100017778();
    __chkstk_darwin(v33, *(void *)(v60 + *(int *)(a1 + 36)));
    uint64_t v34 = v61;
    *(&v55 - 4) = v62;
    *(&v55 - 3) = v34;
    *(&v55 - 2) = v35;
    sub_100017A98();
    swift_getWitnessTable();
    uint64_t v37 = v55;
    uint64_t v36 = v56;
    uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
    v38(v55, v16, v12);
    int v39 = *(void (**)(char *, uint64_t))(v36 + 8);
    v39(v16, v12);
    v38(v16, v37, v12);
    swift_getWitnessTable();
    uint64_t v40 = v63;
    sub_10000B9CC((uint64_t)v16, v12);
    v39(v16, v12);
    uint64_t v41 = v37;
    uint64_t v42 = v12;
  }
  else
  {
    uint64_t v43 = sub_100017748();
    __chkstk_darwin(v43, *(void *)(v60 + *(int *)(a1 + 36)));
    uint64_t v44 = v61;
    *(&v55 - 4) = v62;
    *(&v55 - 3) = v44;
    *(&v55 - 2) = v45;
    uint64_t v46 = (uint64_t)v58;
    sub_100017A78();
    swift_getWitnessTable();
    uint64_t v47 = v59;
    uint64_t v48 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
    uint64_t v49 = v57;
    v48(v57, v46, v6);
    int v39 = *(void (**)(char *, uint64_t))(v47 + 8);
    v39((char *)v46, v6);
    v48((char *)v46, (uint64_t)v49, v6);
    swift_getWitnessTable();
    uint64_t v40 = v63;
    sub_10000BAC4(v46, v12, v6);
    v39((char *)v46, v6);
    uint64_t v41 = v49;
    uint64_t v42 = v6;
  }
  v39(v41, v42);
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v51 = swift_getWitnessTable();
  uint64_t v67 = WitnessTable;
  uint64_t v68 = v51;
  uint64_t v52 = v65;
  swift_getWitnessTable();
  uint64_t v53 = v64;
  (*(void (**)(uint64_t, char *, uint64_t))(v64 + 16))(v66, v40, v52);
  return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v40, v52);
}

uint64_t sub_10000C2C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a2 - 8);
  __chkstk_darwin(a1, a1);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_10000C3B4()
{
  return sub_100017988();
}

uint64_t sub_10000C3D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v62 = a1;
  uint64_t v3 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v61 = *(void *)(v3 - 8);
  uint64_t v55 = *(void *)(v61 + 64);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v58 = (uint64_t)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100017AE8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005748(&qword_1000206E8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005748(&qword_1000206F0);
  __chkstk_darwin(v16 - 8, v17);
  uint64_t v19 = (char *)&v52 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100005748(&qword_1000206F8);
  uint64_t v21 = v20 - 8;
  __chkstk_darwin(v20, v22);
  uint64_t v24 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100005748(&qword_100020700) - 8;
  __chkstk_darwin(v57, v25);
  uint64_t v56 = (uint64_t)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100005748(&qword_100020708) - 8;
  __chkstk_darwin(v60, v27);
  uint64_t v59 = (uint64_t)&v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v19 = sub_100017748();
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  uint64_t v29 = sub_100005748(&qword_100020710);
  sub_10000C934(v1, (double *)&v19[*(int *)(v29 + 44)]);
  sub_100017AD8();
  uint64_t v30 = *(void *)(v1 + 48);
  uint64_t v31 = *(void *)(v1 + 56);
  char v32 = *(unsigned char *)(v1 + 64);
  uint64_t v54 = v1;
  uint64_t v63 = v30;
  uint64_t v64 = v31;
  char v65 = v32;
  sub_100005748(&qword_100020718);
  sub_100017AB8();
  int v33 = v66;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v10, v6);
  float v34 = 0.0;
  if (v33) {
    float v34 = 1.0;
  }
  *(float *)&v15[*(int *)(v12 + 44)] = v34;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  char v35 = sub_100017868();
  uint64_t v36 = (uint64_t)&v24[*(int *)(v21 + 44)];
  sub_100012F44((uint64_t)v15, v36, &qword_1000206E8);
  *(unsigned char *)(v36 + *(int *)(sub_100005748(&qword_100020720) + 36)) = v35;
  uint64_t v37 = (uint64_t)v24;
  sub_100012F44((uint64_t)v19, (uint64_t)v24, &qword_1000206F0);
  sub_100012EA8((uint64_t)v15, &qword_1000206E8);
  sub_100012EA8((uint64_t)v19, &qword_1000206F0);
  uint64_t v53 = type metadata accessor for DeveloperTrustSheetButtons;
  uint64_t v38 = v2;
  uint64_t v39 = v58;
  sub_10000F104(v38, v58, type metadata accessor for DeveloperTrustSheetButtons);
  unint64_t v40 = (*(unsigned __int8 *)(v61 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  uint64_t v61 = v40 + v55;
  uint64_t v41 = swift_allocObject();
  sub_10000F170(v39, v41 + v40, type metadata accessor for DeveloperTrustSheetButtons);
  uint64_t v42 = sub_100017B08();
  uint64_t v44 = v43;
  uint64_t v45 = (uint64_t)v24;
  uint64_t v46 = v56;
  sub_100012F44(v45, v56, &qword_1000206F8);
  uint64_t v47 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(v46 + *(int *)(v57 + 44));
  *uint64_t v47 = sub_1000125A4;
  v47[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v41;
  v47[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v42;
  v47[3] = v44;
  sub_100012EA8(v37, &qword_1000206F8);
  sub_10000F104(v54, v39, v53);
  uint64_t v48 = swift_allocObject();
  sub_10000F170(v39, v48 + v40, type metadata accessor for DeveloperTrustSheetButtons);
  uint64_t v49 = v59;
  sub_100012F44(v46, v59, &qword_100020700);
  uint64_t v50 = (void *)(v49 + *(int *)(v60 + 44));
  void *v50 = sub_10000AF94;
  v50[1] = 0;
  v50[2] = sub_1000127B8;
  v50[3] = v48;
  sub_100012EA8(v46, &qword_100020700);
  return sub_100012E44(v49, v62, &qword_100020708);
}

uint64_t sub_10000C934@<X0>(uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v3 = sub_100005748(&qword_100020730);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005748(&qword_100020738);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100005748(&qword_100020740);
  __chkstk_darwin(v58, v11);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100005748(&qword_100020748);
  uint64_t v15 = __chkstk_darwin(v59, v14);
  uint64_t v57 = (uint64_t)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15, v17);
  uint64_t v20 = (char *)&v56 - v19;
  __chkstk_darwin(v18, v21);
  uint64_t v56 = (uint64_t)&v56 - v22;
  double v23 = sub_10000CE1C();
  uint64_t v24 = self;
  id v25 = [v24 currentDevice];
  id v26 = [v25 userInterfaceIdiom];

  if (v26 == (id)1) {
    uint64_t v27 = 0x4028000000000000;
  }
  else {
    uint64_t v27 = 0x4024000000000000;
  }
  *(void *)uint64_t v6 = sub_100017768();
  *((void *)v6 + 1) = v27;
  v6[16] = 0;
  uint64_t v28 = (uint64_t)&v6[*(int *)(sub_100005748(&qword_100020750) + 44)];
  uint64_t v61 = a1;
  sub_10000CFF4(a1, v28);
  id v29 = [v24 currentDevice];
  id v30 = [v29 userInterfaceIdiom];

  if (v30 == (id)1) {
    double v31 = 360.0;
  }
  else {
    double v31 = INFINITY;
  }
  uint64_t v32 = sub_100017B08();
  sub_1000099E4(0.0, 1, 0.0, 1, v31, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v32, v33, &qword_100020730, &qword_100020738);
  sub_100012EA8((uint64_t)v6, &qword_100020730);
  unsigned __int8 v34 = sub_100017898();
  unsigned __int8 v35 = sub_1000178B8();
  char v36 = sub_1000178A8();
  sub_1000178A8();
  if (sub_1000178A8() != v34) {
    char v36 = sub_1000178A8();
  }
  sub_1000178A8();
  if (sub_1000178A8() != v35) {
    char v36 = sub_1000178A8();
  }
  sub_100012F44((uint64_t)v10, (uint64_t)v13, &qword_100020738);
  uint64_t v37 = &v13[*(int *)(v58 + 36)];
  *uint64_t v37 = v36;
  *(_OWORD *)(v37 + 8) = 0u;
  *(_OWORD *)(v37 + 24) = 0u;
  v37[40] = 1;
  sub_100012EA8((uint64_t)v10, &qword_100020738);
  char v38 = sub_100017888();
  id v39 = [v24 currentDevice];
  [v39 userInterfaceIdiom];

  sub_1000175C8();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  sub_100012F44((uint64_t)v13, (uint64_t)v20, &qword_100020740);
  uint64_t v48 = &v20[*(int *)(v59 + 36)];
  *uint64_t v48 = v38;
  *((void *)v48 + 1) = v41;
  *((void *)v48 + 2) = v43;
  *((void *)v48 + 3) = v45;
  *((void *)v48 + 4) = v47;
  v48[40] = 0;
  sub_100012EA8((uint64_t)v13, &qword_100020740);
  uint64_t v49 = v56;
  sub_100012E44((uint64_t)v20, v56, &qword_100020748);
  double v50 = sub_10000CE1C();
  uint64_t v51 = v57;
  sub_100012F44(v49, v57, &qword_100020748);
  uint64_t v52 = v60;
  *uint64_t v60 = v23;
  *((unsigned char *)v52 + 8) = 0;
  uint64_t v53 = sub_100005748(&qword_100020758);
  sub_100012F44(v51, (uint64_t)v52 + *(int *)(v53 + 48), &qword_100020748);
  uint64_t v54 = (double *)((char *)v52 + *(int *)(v53 + 64));
  *uint64_t v54 = v50;
  *((unsigned char *)v54 + 8) = 0;
  sub_100012EA8(v49, &qword_100020748);
  return sub_100012EA8(v51, &qword_100020748);
}

double sub_10000CE1C()
{
  uint64_t v0 = sub_100017668();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v3 = __chkstk_darwin(v0, v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3, v6);
  uint64_t v8 = (char *)&v14 - v7;
  type metadata accessor for DeveloperTrustSheetButtons(0);
  sub_10000E5D4((uint64_t)v8);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v5, enum case for DynamicTypeSize.large(_:), v0);
  sub_10000E9B4(&qword_1000203E8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  char v9 = sub_100017B98();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v1 + 8);
  v10(v5, v0);
  v10(v8, v0);
  double result = 0.0;
  if ((v9 & 1) == 0)
  {
    id v12 = [self currentDevice];
    id v13 = [v12 userInterfaceIdiom];

    double result = 88.0;
    if (v13 != (id)1) {
      return 20.0;
    }
  }
  return result;
}

uint64_t sub_10000CFF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v166 = a2;
  uint64_t v170 = sub_100017828();
  uint64_t v176 = *(void *)(v170 - 8);
  __chkstk_darwin(v170, v3);
  v169 = (char *)&v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = sub_100017688() - 8;
  __chkstk_darwin(v173, v5);
  uint64_t v7 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v12 = __chkstk_darwin(v8 - 8, v11);
  uint64_t v162 = (uint64_t)&v129 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v129 - v14;
  uint64_t v168 = sub_100005748(&qword_100020760);
  uint64_t v174 = *(void *)(v168 - 8);
  uint64_t v17 = __chkstk_darwin(v168, v16);
  uint64_t v163 = (char *)&v129 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  uint64_t v21 = (char *)&v129 - v20;
  uint64_t v167 = sub_100005748(&qword_100020768);
  uint64_t v23 = __chkstk_darwin(v167, v22);
  uint64_t v159 = (char *)&v129 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23, v25);
  uint64_t v27 = (char *)&v129 - v26;
  uint64_t v155 = sub_100005748(&qword_100020770);
  uint64_t v175 = *(void *)(v155 - 8);
  uint64_t v29 = __chkstk_darwin(v155, v28);
  uint64_t v160 = (char *)&v129 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29, v31);
  uint64_t v129 = (char *)&v129 - v32;
  uint64_t v172 = sub_100005748(&qword_100020778) - 8;
  uint64_t v34 = __chkstk_darwin(v172, v33);
  uint64_t v164 = (char *)&v129 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34, v36);
  char v38 = (char *)&v129 - v37;
  uint64_t v171 = sub_100005748(&qword_100020780) - 8;
  uint64_t v40 = __chkstk_darwin(v171, v39);
  uint64_t v161 = (uint64_t)&v129 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __chkstk_darwin(v40, v42);
  uint64_t v165 = (uint64_t)&v129 - v44;
  __chkstk_darwin(v43, v45);
  uint64_t v47 = (char *)&v129 - v46;
  uint64_t v150 = sub_100005748(&qword_100020788) - 8;
  __chkstk_darwin(v150, v48);
  double v50 = (char *)&v129 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100005748(&qword_100020790);
  uint64_t v53 = __chkstk_darwin(v51 - 8, v52);
  uint64_t v158 = (uint64_t)&v129 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = __chkstk_darwin(v53, v55);
  uint64_t v149 = (uint64_t)&v129 - v57;
  __chkstk_darwin(v56, v58);
  uint64_t v156 = (uint64_t)&v129 - v59;
  uint64_t v157 = type metadata accessor for DeveloperTrustSheetButtons;
  uint64_t v142 = a1;
  sub_10000F104(a1, (uint64_t)v15, type metadata accessor for DeveloperTrustSheetButtons);
  uint64_t v60 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v153 = ((v60 + 16) & ~v60) + v10;
  uint64_t v61 = (v60 + 16) & ~v60;
  uint64_t v154 = v61;
  uint64_t v152 = v60 | 7;
  uint64_t v62 = swift_allocObject();
  uint64_t v151 = type metadata accessor for DeveloperTrustSheetButtons;
  sub_10000F170((uint64_t)v15, v62 + v61, type metadata accessor for DeveloperTrustSheetButtons);
  uint64_t v178 = a1;
  uint64_t v148 = sub_100005748(&qword_100020798);
  unint64_t v147 = sub_100012B98();
  sub_100017A68();
  uint64_t v63 = &v7[*(int *)(v173 + 28)];
  uint64_t v64 = enum case for RoundedCornerStyle.continuous(_:);
  unsigned int v145 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v144 = sub_100017758();
  uint64_t v65 = *(void *)(v144 - 8);
  uint64_t v143 = *(void (**)(char *, uint64_t, uint64_t))(v65 + 104);
  uint64_t v146 = v65 + 104;
  v143(v63, v64, v144);
  __asm { FMOV            V0.2D, #16.0 }
  long long v141 = _Q0;
  uint64_t v71 = v7;
  *(_OWORD *)uint64_t v7 = _Q0;
  uint64_t v72 = (uint64_t)&v27[*(int *)(v167 + 36)];
  uint64_t v140 = &type metadata accessor for RoundedRectangle;
  sub_10000F104((uint64_t)v7, v72, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v139 = sub_100005748(&qword_1000207B8);
  *(_WORD *)(v72 + *(int *)(v139 + 36)) = 256;
  uint64_t v73 = v174;
  uint64_t v74 = *(void (**)(uint64_t, char *, uint64_t))(v174 + 16);
  uint64_t v136 = v174 + 16;
  uint64_t v138 = v74;
  uint64_t v75 = v168;
  v74((uint64_t)v27, v21, v168);
  uint64_t v137 = &type metadata accessor for RoundedRectangle;
  sub_10000F980((uint64_t)v71, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v76 = *(void (**)(char *, uint64_t))(v73 + 8);
  uint64_t v174 = v73 + 8;
  uint64_t v135 = v76;
  v76(v21, v75);
  uint64_t v77 = v169;
  sub_100017818();
  unint64_t v134 = sub_100012C88();
  uint64_t v133 = sub_10000E9B4(&qword_1000207D8, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v78 = v129;
  uint64_t v79 = v170;
  sub_100017978();
  uint64_t v80 = *(void (**)(char *, uint64_t))(v176 + 8);
  v176 += 8;
  unsigned int v132 = v80;
  v80(v77, v79);
  sub_100012EA8((uint64_t)v27, &qword_100020768);
  sub_1000179B8();
  uint64_t v81 = sub_1000179D8();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v83 = v175;
  uint64_t v131 = *(void (**)(char *, char *, uint64_t))(v175 + 16);
  uint64_t v84 = v78;
  char v85 = v78;
  uint64_t v86 = v155;
  v131(v38, v84, v155);
  uint64_t v87 = (uint64_t *)&v38[*(int *)(v172 + 44)];
  *uint64_t v87 = KeyPath;
  v87[1] = v81;
  uint64_t v88 = *(void (**)(char *, uint64_t))(v83 + 8);
  uint64_t v175 = v83 + 8;
  uint64_t v130 = v88;
  uint64_t v89 = v86;
  v88(v85, v86);
  uint64_t v90 = sub_1000179A8();
  sub_100012F44((uint64_t)v38, (uint64_t)v47, &qword_100020778);
  *(void *)&v47[*(int *)(v171 + 44)] = v90;
  sub_100012EA8((uint64_t)v38, &qword_100020778);
  LOBYTE(v90) = sub_100017878();
  id v91 = [self currentDevice];
  [v91 userInterfaceIdiom];

  sub_1000175C8();
  uint64_t v93 = v92;
  uint64_t v95 = v94;
  uint64_t v97 = v96;
  uint64_t v99 = v98;
  sub_100012F44((uint64_t)v47, (uint64_t)v50, &qword_100020780);
  uint64_t v100 = &v50[*(int *)(v150 + 44)];
  *uint64_t v100 = v90;
  *((void *)v100 + 1) = v93;
  *((void *)v100 + 2) = v95;
  *((void *)v100 + 3) = v97;
  *((void *)v100 + 4) = v99;
  v100[40] = 0;
  sub_100012EA8((uint64_t)v47, &qword_100020780);
  uint64_t v101 = sub_100017B08();
  uint64_t v102 = v149;
  sub_1000099E4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v149, 0.0, 1, 0.0, 1, v101, v103, &qword_100020788, &qword_100020790);
  sub_100012EA8((uint64_t)v50, &qword_100020788);
  uint64_t v104 = v156;
  sub_100012E44(v102, v156, &qword_100020790);
  uint64_t v105 = v142;
  uint64_t v106 = v162;
  sub_10000F104(v142, v162, v157);
  uint64_t v107 = swift_allocObject();
  sub_10000F170(v106, v107 + v154, v151);
  uint64_t v177 = v105;
  uint64_t v108 = v163;
  sub_100017A68();
  v143(&v71[*(int *)(v173 + 28)], v145, v144);
  *(_OWORD *)uint64_t v71 = v141;
  uint64_t v109 = (uint64_t)v159;
  uint64_t v110 = (uint64_t)&v159[*(int *)(v167 + 36)];
  uint64_t v111 = (uint64_t)v71;
  sub_10000F104((uint64_t)v71, v110, (uint64_t (*)(void))v140);
  *(_WORD *)(v110 + *(int *)(v139 + 36)) = 256;
  uint64_t v112 = v168;
  v138(v109, v108, v168);
  sub_10000F980(v111, (uint64_t (*)(void))v137);
  v135(v108, v112);
  uint64_t v113 = v169;
  sub_100017818();
  uint64_t v114 = v160;
  uint64_t v115 = v170;
  sub_100017978();
  v132(v113, v115);
  sub_100012EA8(v109, &qword_100020768);
  sub_1000179B8();
  uint64_t v116 = sub_1000179D8();
  swift_release();
  uint64_t v117 = swift_getKeyPath();
  uint64_t v118 = (uint64_t)v164;
  v131(v164, v114, v89);
  uint64_t v119 = (uint64_t *)(v118 + *(int *)(v172 + 44));
  *uint64_t v119 = v117;
  v119[1] = v116;
  v130(v114, v89);
  uint64_t v120 = sub_1000179A8();
  uint64_t v121 = v161;
  sub_100012F44(v118, v161, &qword_100020778);
  *(void *)(v121 + *(int *)(v171 + 44)) = v120;
  sub_100012EA8(v118, &qword_100020778);
  uint64_t v122 = v121;
  uint64_t v123 = v121;
  uint64_t v124 = v165;
  sub_100012E44(v122, v165, &qword_100020780);
  uint64_t v125 = v158;
  sub_100012F44(v104, v158, &qword_100020790);
  sub_100012F44(v124, v123, &qword_100020780);
  uint64_t v126 = v166;
  sub_100012F44(v125, v166, &qword_100020790);
  uint64_t v127 = sub_100005748(&qword_1000207E0);
  sub_100012F44(v123, v126 + *(int *)(v127 + 48), &qword_100020780);
  sub_100012EA8(v124, &qword_100020780);
  sub_100012EA8(v104, &qword_100020790);
  sub_100012EA8(v123, &qword_100020780);
  return sub_100012EA8(v125, &qword_100020790);
}

uint64_t sub_10000DE60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for ButtonSelection(0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v8 = sub_100017498();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, a2, 2, v8);
    sub_100013B08((uint64_t)v6);
    swift_unknownObjectRelease();
    return sub_10000F980((uint64_t)v6, type metadata accessor for ButtonSelection);
  }
  return result;
}

double sub_10000DF5C@<D0>(uint64_t (*a1)(void)@<X1>, _OWORD *a2@<X8>)
{
  type metadata accessor for DeveloperTrustSheetButtons(0);
  *(void *)&v24[0] = a1();
  *((void *)&v24[0] + 1) = v4;
  sub_10000F63C();
  uint64_t v5 = sub_100017948();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  uint64_t v10 = sub_100017918();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_10000F62C(v5, v7, v9);
  swift_bridgeObjectRelease();
  sub_100017B08();
  sub_100017608();
  uint64_t v40 = v10;
  uint64_t v41 = v12;
  char v42 = v16;
  uint64_t v43 = v14;
  uint64_t v44 = v35;
  char v45 = v36;
  uint64_t v46 = v37;
  char v47 = v38;
  long long v48 = v39;
  sub_100017B08();
  sub_100009DA8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v24, 0.0, 1, 0.0, 1);
  sub_10000F62C(v10, v12, v16);
  swift_bridgeObjectRelease();
  long long v17 = v32;
  a2[8] = v31;
  a2[9] = v17;
  long long v18 = v34;
  a2[10] = v33;
  a2[11] = v18;
  long long v19 = v28;
  a2[4] = v27;
  a2[5] = v19;
  long long v20 = v30;
  a2[6] = v29;
  a2[7] = v20;
  long long v21 = v24[1];
  *a2 = v24[0];
  a2[1] = v21;
  double result = *(double *)&v25;
  long long v23 = v26;
  a2[2] = v25;
  a2[3] = v23;
  return result;
}

uint64_t sub_10000E11C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_100017628();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6, v9);
  uint64_t v10 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8, v13);
  uint64_t v19 = sub_1000179C8();
  sub_10000F104(a2, (uint64_t)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for DeveloperTrustSheetButtons);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v14 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v15 = (v12 + *(unsigned __int8 *)(v7 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  sub_10000F170((uint64_t)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v14, type metadata accessor for DeveloperTrustSheetButtons);
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *a3 = v19;
  a3[1] = (uint64_t)sub_100012A90;
  a3[2] = v16;
  a3[3] = 0;
  a3[4] = 0;
  return result;
}

uint64_t sub_10000E330(uint64_t a1)
{
  uint64_t v2 = sub_1000177E8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017808();
  sub_100017618();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v15 = *(void *)(a1 + 8);
  v18[4] = *(void *)a1;
  v18[5] = v15;
  long long v16 = *(_OWORD *)(a1 + 32);
  long long v19 = *(_OWORD *)(a1 + 16);
  long long v20 = v16;
  v18[0] = v8;
  v18[1] = v10;
  v18[2] = v12;
  v18[3] = v14;
  sub_100005748(&qword_100020728);
  return sub_100017AC8();
}

uint64_t sub_10000E46C@<X0>(void *a1@<X8>)
{
  uint64_t v2 = sub_1000177E8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017808();
  sub_100017618();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  *a1 = v8;
  a1[1] = v10;
  a1[2] = v12;
  a1[3] = v14;
  return result;
}

uint64_t sub_10000E578()
{
  return sub_100017AC8();
}

uint64_t sub_10000E5D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100017738();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005748(&qword_1000202E0);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100012F44(v2, (uint64_t)v12, &qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_100017668();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, v12, v13);
  }
  else
  {
    os_log_type_t v15 = sub_100017C58();
    uint64_t v16 = sub_100017838();
    os_log_type_t v17 = v15;
    if (os_log_type_enabled(v16, v15))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      v20[1] = a1;
      uint64_t v21 = v19;
      *(_DWORD *)uint64_t v18 = 136315138;
      v20[2] = sub_10000E9FC(0x5463696D616E7944, 0xEF657A6953657079, &v21);
      sub_100017CA8();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100017728();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t sub_10000E894()
{
  return sub_1000176A8();
}

uint64_t sub_10000E8B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000E8E4(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_10000E8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(char *))
{
  uint64_t v8 = a5(0);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v14 - v10;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)&v14 - v10, a1);
  return a6(v11);
}

uint64_t sub_10000E9B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000E9FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000EAD0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000ECDC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10000ECDC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000EC8C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000EAD0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100017CB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000ED38(a5, a6);
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
  uint64_t v8 = sub_100017D18();
  if (!v8)
  {
    sub_100017D28();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100017D48();
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

uint64_t sub_10000EC8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000ECDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000ED38(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000EDD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000EFB0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000EFB0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000EDD0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000EF48(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100017D08();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100017D28();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100017BC8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100017D48();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100017D28();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000EF48(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100005748(&qword_100020408);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000EFB0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005748(&qword_100020408);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
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
  uint64_t result = sub_100017D48();
  __break(1u);
  return result;
}

uint64_t sub_10000F104(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F170(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000F1D8(uint64_t a1)
{
  return sub_1000127E4(a1, type metadata accessor for DeveloperTrustSheetView, (uint64_t (*)(uint64_t, uint64_t))sub_10000AF98);
}

unint64_t sub_10000F204()
{
  unint64_t result = qword_100020440;
  if (!qword_100020440)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100020440);
  }
  return result;
}

uint64_t sub_10000F244()
{
  uint64_t v1 = type metadata accessor for DeveloperTrustSheetView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100017668();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  unint64_t v7 = ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 32;
  uint64_t v8 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v9 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_10000F3D0()
{
  uint64_t v1 = *(void *)(type metadata accessor for DeveloperTrustSheetView(0) - 8);
  uint64_t v2 = (double *)(v0
                + ((*(void *)(v1 + 64)
                  + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                  + 7) & 0xFFFFFFFFFFFFFFF8));
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];

  return sub_10000B354(v3, v4, v5, v6);
}

uint64_t sub_10000F464(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000F474()
{
  return swift_release();
}

uint64_t sub_10000F47C()
{
  return sub_1000176B8();
}

uint64_t sub_10000F4A0(uint64_t a1)
{
  uint64_t v2 = sub_100005748(&qword_100020490);
  __chkstk_darwin(v2 - 8, v3);
  sub_100012F44(a1, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_100020490);
  return sub_1000176C8();
}

uint64_t sub_10000F534(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  char v4 = *(unsigned char *)(a1 + 184);
  sub_10000F5A8(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  sub_10000F5A8(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10000F5A8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000F5B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 168);
  uint64_t v3 = *(void *)(a1 + 176);
  char v4 = *(unsigned char *)(a1 + 184);
  sub_10000F62C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRelease();
  sub_10000F62C(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10000F62C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000F63C()
{
  unint64_t result = qword_100020500;
  if (!qword_100020500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020500);
  }
  return result;
}

uint64_t sub_10000F690(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000F6D0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000176D8();
  *a1 = result;
  return result;
}

uint64_t sub_10000F6FC()
{
  return sub_1000176E8();
}

uint64_t sub_10000F728()
{
  uint64_t v1 = type metadata accessor for DeveloperTrustSheetView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100017668();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v2 | 7;
  uint64_t v8 = v3 + v4;
  uint64_t v9 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v10 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, v8, v7);
}

uint64_t sub_10000F8A8(uint64_t a1)
{
  type metadata accessor for DeveloperTrustSheetView(0);

  return sub_100008A24(a1);
}

uint64_t type metadata accessor for ButtonSelection(uint64_t a1)
{
  return sub_10000F948(a1, (uint64_t *)&unk_1000205A8);
}

uint64_t sub_10000F948(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000F980(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_10000F9E0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_100017498();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_10000FB2C(uint64_t a1)
{
  uint64_t v2 = sub_100017498();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 2, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_10000FBFC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100017498();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *sub_10000FD0C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100017498();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
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
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

void *sub_10000FE80(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100017498();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void *sub_10000FF90(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100017498();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2, v6);
  int v10 = v8(a2, 2, v6);
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
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_100010104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010118);
}

uint64_t sub_100010118(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017498();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0;
  }
}

uint64_t sub_100010184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010198);
}

uint64_t sub_100010198(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_100017498();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_10001021C(uint64_t a1)
{
  uint64_t v2 = sub_100017498();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 2, v2);
}

uint64_t sub_100010288(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100017498();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 2, v4);
}

uint64_t sub_1000102F8()
{
  uint64_t result = sub_100017498();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_100010370(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    long long v8 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_OWORD *)(a1 + 32) = v8;
    uint64_t v9 = a2[6];
    uint64_t v10 = a2[7];
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v11 = a3[6];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (uint64_t *)((char *)a2 + v11);
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v10;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100005748(&qword_1000202E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_100017668();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      *uint64_t v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[7];
    uint64_t v16 = a1 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    uint64_t v18 = sub_100017578();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = (uint64_t)a2 + a3[8];
    *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v19 + 8);
  }
  return a1;
}

uint64_t sub_100010534(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100017668();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  uint64_t v7 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_unknownObjectWeakDestroy();
}

uint64_t sub_100010644(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  long long v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_100017668();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  }
  else
  {
    *uint64_t v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakCopyInit() + 8) = *(void *)(v18 + 8);
  return a1;
}

uint64_t sub_1000107B8(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  if (a1 != a2)
  {
    uint64_t v6 = a3[6];
    long long v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_100012EA8(a1 + v6, &qword_1000202E0);
    sub_100005748(&qword_1000202E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_100017668();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *long long v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = a3[7];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  uint64_t v14 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakCopyAssign() + 8) = *(void *)(v14 + 8);
  return a1;
}

uint64_t sub_100010988(uint64_t a1, uint64_t a2, int *a3)
{
  long long v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  long long v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100017668();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakTakeInit() + 8) = *(void *)(v17 + 8);
  return a1;
}

uint64_t sub_100010AE0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  long long v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  if (a1 != a2)
  {
    uint64_t v7 = a3[6];
    uint64_t v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_100012EA8(a1 + v7, &qword_1000202E0);
    uint64_t v10 = sub_100005748(&qword_1000202E0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_100017668();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[7];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  uint64_t v16 = a2 + a3[8];
  *(void *)(swift_unknownObjectWeakTakeAssign() + 8) = *(void *)(v16 + 8);
  return a1;
}

uint64_t sub_100010C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010C9C);
}

uint64_t sub_100010C9C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100005748(&qword_1000202E8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100017578();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 28);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_100010DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010DE0);
}

uint64_t sub_100010DE0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = sub_100005748(&qword_1000202E8);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 24);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = sub_100017578();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 28);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_100010F10()
{
}

void sub_100010F24()
{
  sub_1000060F4();
  if (v0 <= 0x3F)
  {
    sub_100017578();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_100010FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100011000()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_1000060F4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_1000110D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(sub_100017668() - 8);
  int v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v9 & 0xF8 | 7;
  if (*(void *)(v8 + 64) <= 8uLL) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = *(void *)(v8 + 64);
  }
  int v12 = v9 | *(_DWORD *)(v6 + 80);
  if ((v12 & 0x1000F8) != 0 || v11 + ((v10 + ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v10) + 1 > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + (((v12 & 0xF8 | 7u) + 16) & ~(unint64_t)(v12 & 0xF8 | 7u)));
LABEL_24:
    swift_retain();
    return a1;
  }
  uint64_t v15 = ~v10;
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
  uint64_t v16 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v16 = *v17;
  uint64_t v18 = (void *)(((unint64_t)v16 + v10 + 8) & v15);
  uint64_t v19 = (unsigned __int8 *)(((unint64_t)v17 + v10 + 8) & v15);
  unsigned int v20 = v19[v11];
  unsigned int v21 = v20 - 2;
  if (v20 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v22 = v11;
    }
    else {
      uint64_t v22 = 4;
    }
    switch(v22)
    {
      case 1:
        int v23 = *v19;
        goto LABEL_19;
      case 2:
        int v23 = *(unsigned __int16 *)v19;
        goto LABEL_19;
      case 3:
        int v23 = *(unsigned __int16 *)v19 | (v19[2] << 16);
        goto LABEL_19;
      case 4:
        int v23 = *(_DWORD *)v19;
LABEL_19:
        int v24 = (v23 | (v21 << (8 * v11))) + 2;
        unsigned int v20 = v23 + 2;
        if (v11 < 4) {
          unsigned int v20 = v24;
        }
        break;
      default:
        break;
    }
  }
  if (v20 != 1)
  {
    *uint64_t v18 = *(void *)v19;
    *((unsigned char *)v18 + v11) = 0;
    goto LABEL_24;
  }
  (*(void (**)(void *))(v8 + 16))(v18);
  *((unsigned char *)v18 + v11) = 1;
  return a1;
}

uint64_t sub_100011348(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(void))v3)();
  unint64_t v4 = (a1 + *(void *)(v3 + 56) + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(sub_100017668() - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  uint64_t v7 = (unsigned __int8 *)((v4 + v6 + 8) & ~v6);
  unint64_t v8 = *(void *)(v5 + 64);
  if (v8 <= 8) {
    unint64_t v8 = 8;
  }
  unsigned int v9 = v7[v8];
  unsigned int v10 = v9 - 2;
  if (v9 >= 2)
  {
    if (v8 <= 3) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = 4;
    }
    switch(v11)
    {
      case 1:
        int v12 = *v7;
        goto LABEL_12;
      case 2:
        int v12 = *(unsigned __int16 *)v7;
        goto LABEL_12;
      case 3:
        int v12 = *(unsigned __int16 *)v7 | (v7[2] << 16);
        goto LABEL_12;
      case 4:
        int v12 = *(_DWORD *)v7;
LABEL_12:
        int v13 = (v12 | (v10 << (8 * v8))) + 2;
        unsigned int v9 = v12 + 2;
        if (v8 < 4) {
          unsigned int v9 = v13;
        }
        break;
      default:
        break;
    }
  }
  if (v9 == 1)
  {
    uint64_t v14 = *(uint64_t (**)(void))(v5 + 8);
    return v14();
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1000114E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = *(void *)(sub_100017668() - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80) & 0xF8;
  uint64_t v11 = v10 + 15;
  unint64_t v12 = (unint64_t)v7 + v10 + 15;
  unint64_t v13 = ~v10 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v14 = (void *)(v12 & v13);
  uint64_t v15 = (unsigned __int8 *)(((unint64_t)v8 + v11) & v13);
  if (*(void *)(v9 + 64) <= 8uLL) {
    uint64_t v16 = 8;
  }
  else {
    uint64_t v16 = *(void *)(v9 + 64);
  }
  unsigned int v17 = v15[v16];
  unsigned int v18 = v17 - 2;
  if (v17 >= 2)
  {
    if (v16 <= 3) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 4;
    }
    switch(v19)
    {
      case 1:
        int v20 = *v15;
        goto LABEL_13;
      case 2:
        int v20 = *(unsigned __int16 *)v15;
        goto LABEL_13;
      case 3:
        int v20 = *(unsigned __int16 *)(((unint64_t)v8 + v11) & v13) | (*(unsigned __int8 *)((((unint64_t)v8
                                                                                                + v11) & v13)
                                                                                              + 2) << 16);
        goto LABEL_13;
      case 4:
        int v20 = *(_DWORD *)v15;
LABEL_13:
        int v21 = (v20 | (v18 << (8 * v16))) + 2;
        unsigned int v17 = v20 + 2;
        if (v16 < 4) {
          unsigned int v17 = v21;
        }
        break;
      default:
        break;
    }
  }
  if (v17 == 1)
  {
    (*(void (**)(void *))(v9 + 16))(v14);
    char v22 = 1;
  }
  else
  {
    *uint64_t v14 = *(void *)v15;
    swift_retain();
    char v22 = 0;
  }
  *((unsigned char *)v14 + v16) = v22;
  return a1;
}

uint64_t sub_1000116A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = sub_100017668();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80) & 0xF8;
  uint64_t v12 = v11 + 15;
  unint64_t v13 = (unint64_t)v7 + v11 + 15;
  unint64_t v14 = ~v11 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = (unsigned __int8 *)(v13 & v14);
  unint64_t v16 = (unint64_t)v8 + v12;
  unsigned int v17 = (unsigned __int8 *)(v16 & v14);
  if ((v13 & v14) != (v16 & v14))
  {
    uint64_t v18 = v9;
    uint64_t v19 = *(void *)(v9 - 8);
    if (*(void *)(v10 + 64) <= 8uLL) {
      uint64_t v20 = 8;
    }
    else {
      uint64_t v20 = *(void *)(v10 + 64);
    }
    unsigned int v21 = v15[v20];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *v15;
          goto LABEL_14;
        case 2:
          int v24 = *(unsigned __int16 *)v15;
          goto LABEL_14;
        case 3:
          int v24 = *(unsigned __int16 *)v15 | (v15[2] << 16);
          goto LABEL_14;
        case 4:
          int v24 = *(_DWORD *)v15;
LABEL_14:
          int v25 = (v24 | (v22 << (8 * v20))) + 2;
          unsigned int v21 = v24 + 2;
          if (v20 < 4) {
            unsigned int v21 = v25;
          }
          break;
        default:
          break;
      }
    }
    if (v21 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v19 + 8))(v15, v9);
    }
    else {
      swift_release();
    }
    unsigned int v26 = v17[v20];
    unsigned int v27 = v26 - 2;
    if (v26 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v28 = v20;
      }
      else {
        uint64_t v28 = 4;
      }
      switch(v28)
      {
        case 1:
          int v29 = *v17;
          goto LABEL_28;
        case 2:
          int v29 = *(unsigned __int16 *)v17;
          goto LABEL_28;
        case 3:
          int v29 = *(unsigned __int16 *)v17 | (v17[2] << 16);
          goto LABEL_28;
        case 4:
          int v29 = *(_DWORD *)v17;
LABEL_28:
          int v30 = (v29 | (v27 << (8 * v20))) + 2;
          unsigned int v26 = v29 + 2;
          if (v20 < 4) {
            unsigned int v26 = v30;
          }
          break;
        default:
          break;
      }
    }
    if (v26 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v19 + 16))(v15, v17, v18);
      v15[v20] = 1;
    }
    else
    {
      *(void *)uint64_t v15 = *(void *)v17;
      v15[v20] = 0;
      swift_retain();
    }
  }
  return a1;
}

uint64_t sub_100011928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = *(void *)(sub_100017668() - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80) & 0xF8;
  uint64_t v11 = v10 + 15;
  unint64_t v12 = (unint64_t)v7 + v10 + 15;
  unint64_t v13 = ~v10 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v14 = (void *)(v12 & v13);
  uint64_t v15 = (unsigned __int8 *)(((unint64_t)v8 + v11) & v13);
  if (*(void *)(v9 + 64) <= 8uLL) {
    uint64_t v16 = 8;
  }
  else {
    uint64_t v16 = *(void *)(v9 + 64);
  }
  unsigned int v17 = v15[v16];
  unsigned int v18 = v17 - 2;
  if (v17 >= 2)
  {
    if (v16 <= 3) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 4;
    }
    switch(v19)
    {
      case 1:
        int v20 = *v15;
        goto LABEL_13;
      case 2:
        int v20 = *(unsigned __int16 *)v15;
        goto LABEL_13;
      case 3:
        int v20 = *(unsigned __int16 *)(((unint64_t)v8 + v11) & v13) | (*(unsigned __int8 *)((((unint64_t)v8
                                                                                                + v11) & v13)
                                                                                              + 2) << 16);
        goto LABEL_13;
      case 4:
        int v20 = *(_DWORD *)v15;
LABEL_13:
        int v21 = (v20 | (v18 << (8 * v16))) + 2;
        unsigned int v17 = v20 + 2;
        if (v16 < 4) {
          unsigned int v17 = v21;
        }
        break;
      default:
        break;
    }
  }
  if (v17 == 1)
  {
    (*(void (**)(void *))(v9 + 32))(v14);
    char v22 = 1;
  }
  else
  {
    char v22 = 0;
    *unint64_t v14 = *(void *)v15;
  }
  *((unsigned char *)v14 + v16) = v22;
  return a1;
}

uint64_t sub_100011AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(void))v5)();
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  uint64_t v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v7 = *v8;
  uint64_t v9 = sub_100017668();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(_DWORD *)(v10 + 80) & 0xF8;
  uint64_t v12 = v11 + 15;
  unint64_t v13 = (unint64_t)v7 + v11 + 15;
  unint64_t v14 = ~v11 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = (unsigned __int8 *)(v13 & v14);
  unint64_t v16 = (unint64_t)v8 + v12;
  unsigned int v17 = (unsigned __int8 *)(v16 & v14);
  if ((v13 & v14) != (v16 & v14))
  {
    uint64_t v18 = v9;
    uint64_t v19 = *(void *)(v9 - 8);
    if (*(void *)(v10 + 64) <= 8uLL) {
      uint64_t v20 = 8;
    }
    else {
      uint64_t v20 = *(void *)(v10 + 64);
    }
    unsigned int v21 = v15[v20];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *v15;
          goto LABEL_14;
        case 2:
          int v24 = *(unsigned __int16 *)v15;
          goto LABEL_14;
        case 3:
          int v24 = *(unsigned __int16 *)v15 | (v15[2] << 16);
          goto LABEL_14;
        case 4:
          int v24 = *(_DWORD *)v15;
LABEL_14:
          int v25 = (v24 | (v22 << (8 * v20))) + 2;
          unsigned int v21 = v24 + 2;
          if (v20 < 4) {
            unsigned int v21 = v25;
          }
          break;
        default:
          break;
      }
    }
    if (v21 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v19 + 8))(v15, v9);
    }
    else {
      swift_release();
    }
    unsigned int v26 = v17[v20];
    unsigned int v27 = v26 - 2;
    if (v26 >= 2)
    {
      if (v20 <= 3) {
        uint64_t v28 = v20;
      }
      else {
        uint64_t v28 = 4;
      }
      switch(v28)
      {
        case 1:
          int v29 = *v17;
          goto LABEL_28;
        case 2:
          int v29 = *(unsigned __int16 *)v17;
          goto LABEL_28;
        case 3:
          int v29 = *(unsigned __int16 *)v17 | (v17[2] << 16);
          goto LABEL_28;
        case 4:
          int v29 = *(_DWORD *)v17;
LABEL_28:
          int v30 = (v29 | (v27 << (8 * v20))) + 2;
          unsigned int v26 = v29 + 2;
          if (v20 < 4) {
            unsigned int v26 = v30;
          }
          break;
        default:
          break;
      }
    }
    if (v26 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v19 + 32))(v15, v17, v18);
      char v31 = 1;
    }
    else
    {
      char v31 = 0;
      *(void *)uint64_t v15 = *(void *)v17;
    }
    v15[v20] = v31;
  }
  return a1;
}

uint64_t sub_100011D60(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(sub_100017668() - 8);
  uint64_t v9 = 8;
  if (*(void *)(v8 + 64) > 8uLL) {
    uint64_t v9 = *(void *)(v8 + 64);
  }
  if (v7 <= 0xFE) {
    unsigned int v10 = 254;
  }
  else {
    unsigned int v10 = v7;
  }
  uint64_t v11 = *(void *)(v6 + 64);
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  if (a2 <= v10) {
    goto LABEL_27;
  }
  unint64_t v13 = v9 + ((v12 + ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v12) + 1;
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v17 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v17))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_27;
      }
      goto LABEL_17;
    }
    if (v17 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_27;
      }
      goto LABEL_17;
    }
    if (v17 < 2)
    {
LABEL_27:
      if (v7 < 0xFE)
      {
        unsigned int v22 = *(unsigned __int8 *)((((((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) + v12 + 8) & ~v12) + v9);
        if (v22 >= 2) {
          return (v22 ^ 0xFF) + 1;
        }
        else {
          return 0;
        }
      }
      else
      {
        unsigned int v21 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
        return v21(a1, v7, v5);
      }
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_27;
  }
LABEL_17:
  int v18 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v18 = 0;
  }
  if (v13)
  {
    if (v13 <= 3) {
      int v19 = v13;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v10 + (v20 | v18) + 1;
}

void sub_100011FE8(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v27 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(sub_100017668() - 8);
  unint64_t v11 = *(void *)(v10 + 64);
  if (v11 <= 8) {
    unint64_t v11 = 8;
  }
  if (v9 <= 0xFE) {
    unsigned int v12 = 254;
  }
  else {
    unsigned int v12 = v9;
  }
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(_DWORD *)(v10 + 80) & 0xF8 | 7;
  size_t v15 = v11 + 1;
  size_t v16 = ((v14 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v14) + v11 + 1;
  if (a3 <= v12)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v12 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v12 < a2)
  {
    unsigned int v18 = ~v12 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_54;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_54:
      __break(1u);
      JUMPOUT(0x10001236CLL);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if (v9 < 0xFE)
        {
          uint64_t v23 = (unsigned char *)((((unint64_t)&a1[v13 + 7] & 0xFFFFFFFFFFFFFFF8) + v14 + 8) & ~v14);
          if (a2 > 0xFE)
          {
            if (v15 <= 3) {
              int v24 = ~(-1 << (8 * v15));
            }
            else {
              int v24 = -1;
            }
            if (v15)
            {
              int v25 = v24 & (a2 - 255);
              if (v15 <= 3) {
                int v26 = v15;
              }
              else {
                int v26 = 4;
              }
              bzero(v23, v15);
              switch(v26)
              {
                case 2:
                  *(_WORD *)uint64_t v23 = v25;
                  break;
                case 3:
                  *(_WORD *)uint64_t v23 = v25;
                  v23[2] = BYTE2(v25);
                  break;
                case 4:
                  *(_DWORD *)uint64_t v23 = v25;
                  break;
                default:
                  *uint64_t v23 = v25;
                  break;
              }
            }
          }
          else
          {
            v23[v11] = -(char)a2;
          }
        }
        else
        {
          unsigned int v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
          v22(a1, a2, v9, v7);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for TypeDependentStackView()
{
  return sub_100012FC8();
}

uint64_t sub_1000123BC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000123F4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100012400(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100012420(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

unint64_t sub_100012464()
{
  unint64_t result = qword_1000206E0;
  if (!qword_1000206E0)
  {
    sub_10000BBD0(&qword_1000203D8);
    sub_10000BBD0(&qword_100020398);
    sub_1000132C4(&qword_1000203D0, &qword_100020398);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000206E0);
  }
  return result;
}

uint64_t sub_100012540()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100012584()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000125A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for DeveloperTrustSheetButtons(0) - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_10000E11C(a1, v6, a2);
}

uint64_t sub_100012628()
{
  uint64_t v1 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100017668();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v2 | 7;
  uint64_t v8 = v3 + v4;
  uint64_t v9 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v10 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, v8, v7);
}

uint64_t sub_1000127B8(uint64_t a1)
{
  return sub_1000127E4(a1, type metadata accessor for DeveloperTrustSheetButtons, (uint64_t (*)(uint64_t, uint64_t))sub_10000E578);
}

uint64_t sub_1000127E4(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a1, v6);
}

uint64_t sub_10001286C()
{
  uint64_t v1 = type metadata accessor for DeveloperTrustSheetButtons(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v15 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v4 = sub_100017628();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = v0 + v3 + *(int *)(v1 + 24);
  sub_100005748(&qword_1000202E0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_100017668();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = v2 | v6 | 7;
  uint64_t v11 = (v3 + v15 + v6) & ~v6;
  uint64_t v12 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v13 = sub_100017578();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_unknownObjectWeakDestroy();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v11, v4);

  return _swift_deallocObject(v0, v11 + v7, v10);
}

uint64_t sub_100012A90()
{
  uint64_t v1 = *(void *)(type metadata accessor for DeveloperTrustSheetButtons(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_100017628();

  return sub_10000E330(v0 + v2);
}

uint64_t sub_100012B60()
{
  return sub_100012DB0(1);
}

double sub_100012B68@<D0>(_OWORD *a1@<X8>)
{
  return sub_10000DF5C((uint64_t (*)(void))&DeveloperApprovalSheetContext.allowButtonText.getter, a1);
}

unint64_t sub_100012B98()
{
  unint64_t result = qword_1000207A0;
  if (!qword_1000207A0)
  {
    sub_10000BBD0(&qword_100020798);
    sub_100012C14();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207A0);
  }
  return result;
}

unint64_t sub_100012C14()
{
  unint64_t result = qword_1000207A8;
  if (!qword_1000207A8)
  {
    sub_10000BBD0(&qword_1000207B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207A8);
  }
  return result;
}

unint64_t sub_100012C88()
{
  unint64_t result = qword_1000207C0;
  if (!qword_1000207C0)
  {
    sub_10000BBD0(&qword_100020768);
    sub_1000132C4(&qword_1000207C8, &qword_100020760);
    sub_1000132C4(&qword_1000207D0, &qword_1000207B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207C0);
  }
  return result;
}

uint64_t sub_100012D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100017708();
  *a1 = result;
  return result;
}

uint64_t sub_100012D78()
{
  return sub_100017718();
}

uint64_t sub_100012DA8()
{
  return sub_100012DB0(2);
}

uint64_t sub_100012DB0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for DeveloperTrustSheetButtons(0) - 8);
  return sub_10000DE60(v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)), a1);
}

double sub_100012E14@<D0>(_OWORD *a1@<X8>)
{
  return sub_10000DF5C((uint64_t (*)(void))&DeveloperApprovalSheetContext.ignoreButtonText.getter, a1);
}

uint64_t sub_100012E44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005748(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012EA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005748(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100012F04(uint64_t a1)
{
  return a1;
}

uint64_t sub_100012F44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005748(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012FA8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000C2C0(*(void *)(v1 + 32), *(void *)(v1 + 16), a1);
}

uint64_t sub_100012FC8()
{
  return swift_getGenericMetadata();
}

__n128 sub_100012FF8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100013004(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100013024(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100013074(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_1000130C0()
{
  unint64_t result = qword_1000207F8;
  if (!qword_1000207F8)
  {
    sub_10000BBD0(&qword_100020708);
    sub_100013160();
    sub_1000132C4(&qword_100020830, &qword_100020838);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000207F8);
  }
  return result;
}

unint64_t sub_100013160()
{
  unint64_t result = qword_100020800;
  if (!qword_100020800)
  {
    sub_10000BBD0(&qword_100020700);
    sub_100013200();
    sub_1000132C4(&qword_100020820, &qword_100020828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020800);
  }
  return result;
}

unint64_t sub_100013200()
{
  unint64_t result = qword_100020808;
  if (!qword_100020808)
  {
    sub_10000BBD0(&qword_1000206F8);
    sub_1000132C4(&qword_100020810, &qword_1000206F0);
    sub_1000132C4(&qword_100020818, &qword_100020720);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020808);
  }
  return result;
}

uint64_t sub_1000132C4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000BBD0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100013308()
{
  return swift_getWitnessTable();
}

id sub_1000133E4()
{
  uint64_t v1 = OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpController;
  id v2 = objc_allocWithZone((Class)FLFollowUpController);
  char v3 = v0;
  NSString v4 = sub_100017BA8();
  id v5 = [v2 initWithClientIdentifier:v4];

  *(void *)&v0[v1] = v5;
  *(void *)&v3[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetViewController] = 0;
  uint64_t v6 = &v3[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpIdentifier];
  *(_OWORD *)uint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  uint64_t v7 = &v3[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext];
  uint64_t v8 = sub_100017578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for FollowUpViewController();
  return objc_msgSendSuper2(&v10, "initWithNibName:bundle:", 0, 0);
}

id sub_10001359C(char a1)
{
  id v2 = v1;
  NSString v4 = (int *)type metadata accessor for DeveloperTrustSheetView(0);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005748(&qword_1000208A8);
  __chkstk_darwin(v8 - 8, v9);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100017578();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = __chkstk_darwin(v12, v14);
  int v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  unsigned int v20 = (char *)&v33 - v19;
  int v21 = (objc_class *)type metadata accessor for FollowUpViewController();
  v40.receiver = v2;
  v40.super_class = v21;
  id result = objc_msgSendSuper2(&v40, "viewWillAppear:", a1 & 1);
  uint64_t v23 = OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetViewController;
  if (!*(void *)&v2[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetViewController])
  {
    uint64_t v24 = (uint64_t)&v2[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext];
    swift_beginAccess();
    sub_100012F44(v24, (uint64_t)v11, &qword_1000208A8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      return (id)sub_100012EA8((uint64_t)v11, &qword_1000208A8);
    }
    else
    {
      int v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
      uint64_t v33 = v13 + 32;
      long long v34 = v25;
      ((void (*)(char *))v25)(v20);
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
      *(void *)&v7[v4[6]] = swift_getKeyPath();
      sub_100005748(&qword_1000202E0);
      swift_storeEnumTagMultiPayload();
      long long v35 = 0u;
      long long v36 = 0u;
      type metadata accessor for CGRect(0);
      int v26 = v2;
      sub_100017A28();
      uint64_t v27 = v39;
      long long v28 = v38;
      *(_OWORD *)uint64_t v7 = v37;
      *((_OWORD *)v7 + 1) = v28;
      *((void *)v7 + 4) = v27;
      LOBYTE(v35) = 0;
      sub_100017A28();
      uint64_t v29 = *((void *)&v37 + 1);
      v7[40] = v37;
      *((void *)v7 + 6) = v29;
      v34(&v7[v4[7]], v17, v12);
      *(void *)&v7[v4[8] + 8] = &off_10001D0A8;
      swift_unknownObjectWeakInit();

      id v30 = objc_allocWithZone((Class)sub_100005748((uint64_t *)&unk_100020920));
      char v31 = (void *)sub_1000177A8();
      [v31 setModalPresentationStyle:2];
      [v26 presentViewController:v31 animated:1 completion:0];
      long long v32 = *(void **)&v2[v23];
      *(void *)&v2[v23] = v31;

      return (id)(*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v20, v12);
    }
  }
  return result;
}

uint64_t sub_100013B08(uint64_t a1)
{
  uint64_t v96 = (char *)a1;
  uint64_t v2 = sub_100005748(&qword_1000208A0);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v95 = (char *)&v83 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100017498();
  uint64_t v97 = *(void *)(v98 - 8);
  uint64_t v5 = *(void *)(v97 + 64);
  uint64_t v7 = __chkstk_darwin(v98, v6);
  uint64_t v94 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v8);
  uint64_t v93 = (char *)&v83 - v9;
  id v91 = (char *)sub_100017B28();
  uint64_t v90 = *((void *)v91 - 1);
  __chkstk_darwin(v91, v10);
  uint64_t v88 = (char *)&v83 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_100017B48();
  uint64_t v87 = *(void *)(v89 - 8);
  __chkstk_darwin(v89, v12);
  uint64_t v86 = (char *)&v83 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000174A8();
  uint64_t v92 = *(void (***)(char *, void, uint64_t))(v14 - 8);
  __chkstk_darwin(v14, v15);
  int v17 = (char *)&v83 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for ButtonSelection(0);
  __chkstk_darwin(v18 - 8, v19);
  int v21 = (char *)&v83 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100005748(&qword_1000208A8);
  __chkstk_darwin(v22 - 8, v23);
  int v25 = (char *)&v83 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100017578();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26, v28);
  id v30 = (char *)&v83 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = (uint64_t)&v1[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext];
  swift_beginAccess();
  sub_100012F44(v31, (uint64_t)v25, &qword_1000208A8);
  uint64_t v99 = v27;
  long long v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t v100 = v26;
  if (v32(v25, 1, v26) == 1)
  {
    uint64_t v33 = &qword_1000208A8;
    p_long long aBlock = v25;
    return sub_100012EA8((uint64_t)p_aBlock, v33);
  }
  long long v36 = v92;
  uint64_t v84 = v5;
  long long v37 = v94;
  long long v38 = v93;
  uint64_t v39 = v95;
  char v85 = v1;
  (*(void (**)(char *, char *, uint64_t))(v99 + 32))(v30, v25, v100);
  sub_100015B8C((uint64_t)v96, (uint64_t)v21);
  int v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v97 + 48))(v21, 2, v98);
  uint64_t v41 = v30;
  if (!v40)
  {
    uint64_t v56 = v97;
    uint64_t v96 = v30;
    uint64_t v92 = *(void (***)(char *, void, uint64_t))(v97 + 32);
    uint64_t v57 = v38;
    uint64_t v58 = v21;
    uint64_t v59 = v98;
    ((void (*)(char *, char *, uint64_t))v92)(v38, v58, v98);
    uint64_t v60 = sub_100017C28();
    uint64_t v61 = (uint64_t)v39;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v39, 1, 1, v60);
    uint64_t v62 = v37;
    uint64_t v63 = v37;
    uint64_t v64 = v57;
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v63, v57, v59);
    sub_100017C08();
    id v91 = v85;
    uint64_t v65 = sub_100017BF8();
    unint64_t v66 = (*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
    unint64_t v67 = (v84 + v66 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v68 = swift_allocObject();
    *(void *)(v68 + 16) = v65;
    *(void *)(v68 + 24) = &protocol witness table for MainActor;
    ((void (*)(unint64_t, char *, uint64_t))v92)(v68 + v66, v62, v59);
    *(void *)(v68 + v67) = v91;
    sub_100014F10(v61, (uint64_t)&unk_1000208B8, v68);
    swift_release();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v64, v59);
    return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v96, v100);
  }
  if (v40 != 1)
  {
    [v85 finishProcessing];
    return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v41, v100);
  }
  char v42 = v17;
  v36[13](v17, enum case for FeatureFlag.newInstallSheetFlow(_:), v14);
  char v43 = sub_1000174D8();
  ((void (*)(char *, uint64_t))v36[1])(v42, v14);
  if (v43)
  {
    sub_1000174F8();
    sub_1000174C8();
    swift_bridgeObjectRelease();
    id v44 = v85;
    char v45 = *(void **)&v85[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpController];
    uint64_t v46 = v91;
    if (v45)
    {
      char v47 = &v85[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpIdentifier];
      swift_beginAccess();
      sub_100012F44((uint64_t)v47, (uint64_t)&aBlock, &qword_1000208C0);
      if (!v103)
      {
        (*(void (**)(char *, uint64_t))(v99 + 8))(v41, v100);
        uint64_t v33 = &qword_1000208C0;
        p_long long aBlock = (char *)&aBlock;
        return sub_100012EA8((uint64_t)p_aBlock, v33);
      }
      sub_100016788(&aBlock, &v107);
      sub_10000F204();
      id v48 = v45;
      uint64_t v49 = (void *)sub_100017C78();
      sub_10000ECDC((uint64_t)&v107, (uint64_t)v106);
      uint64_t v50 = swift_allocObject();
      *(void *)(v50 + 16) = v48;
      sub_100016788(v106, (_OWORD *)(v50 + 24));
      *(void *)(v50 + 56) = v44;
      uint64_t v104 = sub_1000173D0;
      uint64_t v105 = v50;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v102 = sub_10000B3F4;
      uint64_t v103 = &unk_10001D108;
      uint64_t v51 = _Block_copy(&aBlock);
      id v52 = v48;
      id v53 = v44;
      swift_release();
      uint64_t v54 = v86;
      sub_100017B38();
      *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
      sub_1000172C0(&qword_100020448, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005748(&qword_100020450);
      sub_1000167B4();
      uint64_t v55 = v88;
      sub_100017CC8();
      sub_100017C88();
      _Block_release(v51);

      (*(void (**)(char *, char *))(v90 + 8))(v55, v46);
      (*(void (**)(char *, uint64_t))(v87 + 8))(v54, v89);
      sub_10000EC8C((uint64_t)&v107);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v41, v100);
  }
  uint64_t v69 = sub_100017528();
  uint64_t v71 = v70;
  uint64_t v72 = sub_100017548();
  uint64_t v74 = v73;
  uint64_t v75 = sub_100017508();
  uint64_t v76 = v41;
  uint64_t v78 = v77;
  uint64_t v79 = sub_100017538();
  uint64_t v81 = v80;
  uint64_t v82 = v85;
  sub_1000160DC(v69, v71, v72, v74, v75, v78, v79, v81, v82);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v99 + 8))(v76, v100);
}

uint64_t sub_100014574(char a1, char a2, void *a3)
{
  uint64_t v6 = sub_100005748(&qword_1000208A0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100017C28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_100017C08();
  id v11 = a3;
  uint64_t v12 = sub_100017BF8();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  *(unsigned char *)(v13 + 32) = a1;
  *(void *)(v13 + 40) = v11;
  *(unsigned char *)(v13 + 48) = a2;
  sub_100014F10((uint64_t)v9, (uint64_t)&unk_1000208F0, v13);
  return swift_release();
}

uint64_t sub_1000146A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 345) = a6;
  *(void *)(v6 + 216) = a5;
  *(unsigned char *)(v6 + 344) = a4;
  uint64_t v7 = sub_100017B28();
  *(void *)(v6 + 224) = v7;
  *(void *)(v6 + 232) = *(void *)(v7 - 8);
  *(void *)(v6 + 240) = swift_task_alloc();
  uint64_t v8 = sub_100017B48();
  *(void *)(v6 + 248) = v8;
  *(void *)(v6 + 256) = *(void *)(v8 - 8);
  *(void *)(v6 + 264) = swift_task_alloc();
  uint64_t v9 = sub_100017B68();
  *(void *)(v6 + 272) = v9;
  *(void *)(v6 + 280) = *(void *)(v9 - 8);
  *(void *)(v6 + 288) = swift_task_alloc();
  *(void *)(v6 + 296) = swift_task_alloc();
  sub_100005748(&qword_1000208A8);
  *(void *)(v6 + 304) = swift_task_alloc();
  uint64_t v10 = sub_100017578();
  *(void *)(v6 + 312) = v10;
  *(void *)(v6 + 320) = *(void *)(v10 - 8);
  *(void *)(v6 + 328) = swift_task_alloc();
  sub_100017C08();
  *(void *)(v6 + 336) = sub_100017BF8();
  uint64_t v12 = sub_100017BE8();
  return _swift_task_switch(sub_1000148F8, v12, v11);
}

uint64_t sub_1000148F8()
{
  int v1 = *((unsigned __int8 *)v0 + 344);
  swift_release();
  if (v1 == 1)
  {
    uint64_t v2 = v0[39];
    uint64_t v3 = v0[40];
    uint64_t v4 = v0[38];
    uint64_t v5 = v0[27] + OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext;
    swift_beginAccess();
    sub_100012F44(v5, v4, &qword_1000208A8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
    {
      uint64_t v6 = v0[38];
      uint64_t v7 = &qword_1000208A8;
LABEL_4:
      sub_100012EA8(v6, v7);
      goto LABEL_9;
    }
    (*(void (**)(void, void, void))(v0[40] + 32))(v0[41], v0[38], v0[39]);
    sub_1000174F8();
    sub_100017518();
    sub_1000174E8();
    sub_1000174B8();
    uint64_t v8 = v0[27];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v9 = *(void **)(v8 + OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpController);
    if (v9)
    {
      uint64_t v10 = v0[27] + OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpIdentifier;
      swift_beginAccess();
      sub_100012F44(v10, (uint64_t)(v0 + 12), &qword_1000208C0);
      if (!v0[15])
      {
        (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
        uint64_t v7 = &qword_1000208C0;
        uint64_t v6 = (uint64_t)(v0 + 12);
        goto LABEL_4;
      }
      uint64_t v11 = v0[36];
      uint64_t v23 = v0[37];
      uint64_t v28 = v0[40];
      uint64_t v12 = v0[34];
      uint64_t v13 = v0[35];
      uint64_t v24 = v0[33];
      uint64_t v30 = v0[32];
      uint64_t v31 = v0[31];
      uint64_t v29 = v0[29];
      uint64_t v26 = v0[30];
      uint64_t v27 = v0[28];
      uint64_t v22 = (void *)v0[27];
      uint64_t v32 = v0[39];
      uint64_t v33 = v0[41];
      sub_100016788((_OWORD *)v0 + 6, (_OWORD *)v0 + 4);
      sub_10000F204();
      id v14 = v9;
      int v25 = (void *)sub_100017C78();
      sub_100017B58();
      sub_100017B78();
      uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
      v15(v11, v12);
      sub_10000ECDC((uint64_t)(v0 + 8), (uint64_t)(v0 + 16));
      uint64_t v16 = swift_allocObject();
      *(void *)(v16 + 16) = v14;
      sub_100016788((_OWORD *)v0 + 8, (_OWORD *)(v16 + 24));
      *(void *)(v16 + 56) = v22;
      v0[6] = sub_100016C48;
      v0[7] = v16;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_10000B3F4;
      v0[5] = &unk_10001D248;
      int v17 = _Block_copy(v0 + 2);
      id v18 = v14;
      id v19 = v22;
      sub_100017B38();
      v0[26] = &_swiftEmptyArrayStorage;
      sub_1000172C0(&qword_100020448, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005748(&qword_100020450);
      sub_1000167B4();
      sub_100017CC8();
      sub_100017C68();
      _Block_release(v17);

      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v26, v27);
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v24, v31);
      v15(v23, v12);
      sub_10000EC8C((uint64_t)(v0 + 8));
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v33, v32);
      swift_release();
    }
    else
    {
      (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
    }
  }
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

id sub_100014DEC(void *a1, uint64_t a2, void *a3)
{
  sub_100005748(&qword_1000208C8);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100018790;
  sub_10000ECDC(a2, v6 + 32);
  Class isa = sub_100017BD8().super.isa;
  swift_bridgeObjectRelease();
  id v11 = 0;
  LODWORD(a1) = [a1 clearPendingFollowUpItemsWithUniqueIdentifiers:isa error:&v11];

  if (a1)
  {
    id v8 = v11;
  }
  else
  {
    id v9 = v11;
    sub_100017478();

    swift_willThrow();
    swift_errorRelease();
  }
  return [a3 finishProcessing];
}

uint64_t sub_100014F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100017C28();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100017C18();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100012EA8(a1, &qword_1000208A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100017BE8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000150BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[21] = a4;
  v5[22] = a5;
  uint64_t v6 = sub_1000175B8();
  v5[23] = v6;
  v5[24] = *(void *)(v6 - 8);
  v5[25] = swift_task_alloc();
  sub_100017C08();
  v5[26] = sub_100017BF8();
  uint64_t v8 = sub_100017BE8();
  v5[27] = v8;
  v5[28] = v7;
  return _swift_task_switch(sub_1000151B0, v8, v7);
}

uint64_t sub_1000151B0()
{
  id v1 = [self defaultWorkspace];
  v0[29] = v1;
  if (v1)
  {
    uint64_t v3 = v1;
    sub_100017488(v2);
    uint64_t v5 = v4;
    v0[30] = v4;
    v0[2] = v0;
    v0[7] = v0 + 18;
    v0[3] = sub_1000152F8;
    uint64_t v6 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_10001571C;
    v0[13] = &unk_10001D2C0;
    v0[14] = v6;
    [v3 openURL:v5 configuration:0 completionHandler:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_1000152F8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 48);
  *(void *)(*v0 + 248) = v2;
  uint64_t v3 = *(void *)(v1 + 224);
  uint64_t v4 = *(void *)(v1 + 216);
  if (v2) {
    uint64_t v5 = sub_1000154C4;
  }
  else {
    uint64_t v5 = sub_100015428;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100015428()
{
  uint64_t v2 = (void *)v0[29];
  uint64_t v1 = (void *)v0[30];
  uint64_t v3 = (void *)v0[22];
  swift_release();

  swift_bridgeObjectRelease();
  [v3 finishProcessing];
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000154C4()
{
  int v17 = v0;
  uint64_t v1 = (void *)v0[30];
  uint64_t v2 = (void *)v0[29];
  swift_release();
  swift_willThrow();

  sub_100017598();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v3 = sub_1000175A8();
  os_log_type_t v4 = sub_100017C48();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v13 = v0[24];
    uint64_t v14 = v0[23];
    uint64_t v15 = v0[25];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    swift_getErrorValue();
    uint64_t v6 = sub_100017D68();
    v0[20] = sub_10000E9FC(v6, v7, &v16);
    sub_100017CA8();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Failed to open learn more url: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  }
  else
  {
    uint64_t v9 = v0[24];
    uint64_t v8 = v0[25];
    uint64_t v10 = v0[23];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_10001571C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005748(&qword_100020910);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    if (a2) {
      uint64_t v8 = sub_100017B88();
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v10 = v8;
    sub_100016D68((uint64_t)&v10, *(void *)(*(void *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_10001580C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (Swift::Int v3 = sub_100017CD8(*(void *)(a2 + 40)),
        uint64_t v4 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v5 = v3 & ~v4,
        ((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0))
  {
    uint64_t v6 = ~v4;
    do
    {
      sub_100016BA0(*(void *)(a2 + 48) + 40 * v5, (uint64_t)v9);
      char v7 = sub_100017CE8();
      sub_100016B4C((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v5 = (v5 + 1) & v6;
    }
    while (((*(void *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

void sub_1000158E4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_100015990()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FollowUpViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100015A38()
{
  return type metadata accessor for FollowUpViewController();
}

uint64_t type metadata accessor for FollowUpViewController()
{
  uint64_t result = qword_100020888;
  if (!qword_100020888) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100015A8C()
{
  sub_100015B34();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100015B34()
{
  if (!qword_100020898)
  {
    sub_100017578();
    unint64_t v0 = sub_100017C98();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100020898);
    }
  }
}

uint64_t sub_100015B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ButtonSelection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015BF0()
{
  uint64_t v1 = sub_100017498();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100015CD8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100017498() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_1000173E4;
  return sub_1000150BC(a1, v6, v7, v8, v9);
}

uint64_t sub_100015DFC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100015ED8;
  return v6(a1);
}

uint64_t sub_100015ED8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100015FD0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100017CD8(*(void *)(v2 + 40));

  return sub_100016014(a1, v4);
}

unint64_t sub_100016014(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100016BA0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100017CE8();
      sub_100016B4C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000160DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v63 = a7;
  uint64_t v64 = a8;
  uint64_t v61 = a5;
  uint64_t v62 = a6;
  uint64_t v9 = sub_100005748(&qword_1000208A0);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a9;
  id v14 = objc_allocWithZone((Class)LAContext);
  id v15 = a9;
  SecAccessControlRef v16 = (SecAccessControlRef)[v14 init];
  aBlock[0] = 0;
  unsigned int v17 = [(__SecAccessControl *)v16 canEvaluatePolicy:2 error:aBlock];
  id v18 = aBlock[0];
  if (!v17)
  {
    if (!aBlock[0])
    {
LABEL_18:
      uint64_t v53 = sub_100017C28();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v12, 1, 1, v53);
      sub_100017C08();
      id v54 = v15;
      uint64_t v55 = sub_100017BF8();
      uint64_t v56 = swift_allocObject();
      *(void *)(v56 + 16) = v55;
      *(void *)(v56 + 24) = &protocol witness table for MainActor;
      *(unsigned char *)(v56 + 32) = 0;
      *(void *)(v56 + 40) = v54;
      *(unsigned char *)(v56 + 48) = 0;
      sub_100014F10((uint64_t)v12, (uint64_t)&unk_1000208D8, v56);
      swift_release();
      goto LABEL_19;
    }
    uint64_t v27 = v15;
    id v28 = aBlock[0];
    id v29 = aBlock[0];
    id v30 = [v29 domain];
    uint64_t v31 = sub_100017BB8();
    uint64_t v33 = v32;

    if (v31 == sub_100017BB8() && v33 == v34)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v48 = sub_100017D58();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v48 & 1) == 0)
      {
LABEL_17:

        id v18 = v28;
        id v15 = v27;
        goto LABEL_18;
      }
    }
    if ([v29 code] == (id)-5)
    {
      uint64_t v49 = sub_100017C28();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v12, 1, 1, v49);
      sub_100017C08();
      id v50 = v27;
      uint64_t v51 = sub_100017BF8();
      uint64_t v52 = swift_allocObject();
      *(void *)(v52 + 16) = v51;
      *(void *)(v52 + 24) = &protocol witness table for MainActor;
      *(unsigned char *)(v52 + 32) = 1;
      *(void *)(v52 + 40) = v50;
      *(unsigned char *)(v52 + 48) = 0;
      sub_100014F10((uint64_t)v12, (uint64_t)&unk_1000208E0, v52);
      swift_release();

      SecAccessControlRef v16 = (SecAccessControlRef)v29;
      id v18 = v28;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v58 = v15;
  id v59 = aBlock[0];
  uint64_t v60 = v13;
  aBlock[0] = 0;
  id v19 = v18;
  id v20 = [(__SecAccessControl *)v16 evaluationMechanismsForPolicy:2 error:aBlock];
  id v21 = aBlock[0];
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = sub_100017C38();
    id v24 = v21;

    int v65 = 1;
    sub_100017CF8();
    char v25 = sub_10001580C((uint64_t)aBlock, v23);
    swift_bridgeObjectRelease();
    sub_100016B4C((uint64_t)aBlock);
    if (v25)
    {
      NSString v26 = sub_100017BA8();
      [(__SecAccessControl *)v16 setOptionAuthenticationTitle:v26];
    }
  }
  else
  {
    id v35 = aBlock[0];
    sub_100017478();

    swift_willThrow();
    swift_errorRelease();
  }
  NSString v36 = sub_100017BA8();
  [(__SecAccessControl *)v16 setOptionPasscodeTitle:v36];

  NSString v37 = sub_100017BA8();
  [(__SecAccessControl *)v16 setOptionPasswordAuthenticationReason:v37];

  SecAccessControlRef v38 = SecAccessControlCreateWithFlags(kCFAllocatorDefault, kSecAttrAccessibleWhenUnlockedThisDeviceOnly, 0x40000001uLL, 0);
  if (v38)
  {
    SecAccessControlRef v39 = v38;
    NSString v40 = sub_100017BA8();
    uint64_t v41 = (void *)swift_allocObject();
    uint64_t v42 = v60;
    v41[2] = sub_100016848;
    v41[3] = v42;
    aBlock[4] = sub_100016B20;
    aBlock[5] = v41;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000158E4;
    aBlock[3] = &unk_10001D1F8;
    char v43 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [(__SecAccessControl *)v16 evaluateAccessControl:v39 operation:3 localizedReason:v40 reply:v43];

    _Block_release(v43);
    SecAccessControlRef v16 = v39;
  }
  else
  {
    uint64_t v44 = sub_100017C28();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v12, 1, 1, v44);
    sub_100017C08();
    id v45 = v58;
    uint64_t v46 = sub_100017BF8();
    uint64_t v47 = swift_allocObject();
    *(void *)(v47 + 16) = v46;
    *(void *)(v47 + 24) = &protocol witness table for MainActor;
    *(unsigned char *)(v47 + 32) = 0;
    *(void *)(v47 + 40) = v45;
    *(unsigned char *)(v47 + 48) = 0;
    sub_100014F10((uint64_t)v12, (uint64_t)&unk_1000208E8, v47);
    swift_release();
  }
  id v18 = v59;
LABEL_19:

  return swift_release();
}

_OWORD *sub_100016788(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001679C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000167AC()
{
  return swift_release();
}

unint64_t sub_1000167B4()
{
  unint64_t result = qword_100020458;
  if (!qword_100020458)
  {
    sub_10000BBD0(&qword_100020450);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100020458);
  }
  return result;
}

uint64_t sub_100016810()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016848(char a1, char a2)
{
  return sub_100014574(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100016854(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1000173E4;
  return sub_1000146A8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100016924(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  char v6 = *(unsigned char *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_1000169F0;
  return sub_1000146A8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000169F0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100016AE8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016B20(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(a1, a1);
}

uint64_t sub_100016B4C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016BA0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100016C00()
{
  sub_10000EC8C(v0 + 24);

  return _swift_deallocObject(v0, 64, 7);
}

id sub_100016C48()
{
  return sub_100014DEC(*(void **)(v0 + 16), v0 + 24, *(void **)(v0 + 56));
}

uint64_t sub_100016C70()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_100016CB0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000169F0;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000208F8 + dword_1000208F8);
  return v6(a1, v4);
}

uint64_t sub_100016D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005748(&qword_100020908);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100016DD0()
{
  uint64_t v1 = OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpController;
  id v2 = objc_allocWithZone((Class)FLFollowUpController);
  NSString v3 = sub_100017BA8();
  id v4 = [v2 initWithClientIdentifier:v3];

  *(void *)&v0[v1] = v4;
  *(void *)&v0[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetViewController] = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpIdentifier];
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  char v6 = &v0[OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext];
  uint64_t v7 = sub_100017578();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);

  sub_100017D38();
  __break(1u);
}

uint64_t sub_100016F00(void *a1, uint64_t (*a2)(void))
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005748(&qword_1000208A8);
  uint64_t result = __chkstk_darwin(v6 - 8, v7);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v11 = [a1 uniqueIdentifier];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100017BB8();
    uint64_t v15 = v14;

    *((void *)&v29 + 1) = &type metadata for String;
    *(void *)&long long v28 = v13;
    *((void *)&v28 + 1) = v15;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  uint64_t v16 = v3 + OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_followUpIdentifier;
  swift_beginAccess();
  sub_100017308((uint64_t)&v28, v16, &qword_1000208C0);
  swift_endAccess();
  unint64_t v26 = 0xD000000000000010;
  unint64_t v27 = 0x800000010001B3F0;
  sub_100017CF8();
  uint64_t result = (uint64_t)[a1 userInfo];
  if (!result) {
    goto LABEL_17;
  }
  unsigned int v17 = (void *)result;
  uint64_t v18 = sub_100017B88();

  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_100015FD0((uint64_t)&v28), (v20 & 1) != 0))
  {
    sub_10000ECDC(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v30);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100016B4C((uint64_t)&v28);
  if (*((void *)&v31 + 1))
  {
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      uint64_t v21 = v26;
      unint64_t v22 = v27;
      sub_100017468();
      swift_allocObject();
      sub_100017458();
      uint64_t v23 = sub_100017578();
      sub_1000172C0(&qword_100020918, (void (*)(uint64_t))&type metadata accessor for DeveloperApprovalSheetContext);
      sub_100017448();
      swift_release();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 0, 1, v23);
      uint64_t v24 = v3 + OBJC_IVAR____TtC19ADFollowUpExtension22FollowUpViewController_sheetContext;
      swift_beginAccess();
      sub_100017308((uint64_t)v10, v24, &qword_1000208A8);
      swift_endAccess();
      uint64_t result = sub_10001736C(v21, v22);
    }
  }
  else
  {
    uint64_t result = sub_100012EA8((uint64_t)&v30, &qword_1000208C0);
  }
  if (a2) {
    return a2(0);
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100017260(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100017270()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000172A8(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_1000172C0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100017308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005748(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001736C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000173E8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.FailurePolicy();
}

uint64_t sub_1000173F8()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions.InterpretedSyntax();
}

uint64_t sub_100017408()
{
  return AttributedString.MarkdownParsingOptions.init(allowsExtendedAttributes:interpretedSyntax:failurePolicy:languageCode:)();
}

uint64_t sub_100017418()
{
  return type metadata accessor for AttributedString.MarkdownParsingOptions();
}

uint64_t sub_100017428()
{
  return AttributedString.init(markdown:options:baseURL:)();
}

uint64_t sub_100017438()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_100017448()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_100017458()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_100017468()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_100017478()
{
  return _convertNSErrorToError(_:)();
}

void sub_100017488(NSURL *retstr@<X8>)
{
}

uint64_t sub_100017498()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000174A8()
{
  return type metadata accessor for FeatureFlag();
}

uint64_t sub_1000174B8()
{
  return static AppDistributor.addAllowedDeveloper(_:name:supportURL:)();
}

uint64_t sub_1000174C8()
{
  return static AppDistributor.addConditionallyAllowedDeveloper(_:)();
}

uint64_t sub_1000174D8()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_1000174E8()
{
  return DeveloperApprovalSheetContext.supportURL.getter();
}

uint64_t sub_1000174F8()
{
  return DeveloperApprovalSheetContext.developerID.getter();
}

uint64_t sub_100017508()
{
  return DeveloperApprovalSheetContext.touchIDTitle.getter();
}

uint64_t sub_100017518()
{
  return DeveloperApprovalSheetContext.developerName.getter();
}

uint64_t sub_100017528()
{
  return DeveloperApprovalSheetContext.passcodeTitle.getter();
}

uint64_t sub_100017538()
{
  return DeveloperApprovalSheetContext.touchIDReason.getter();
}

uint64_t sub_100017548()
{
  return DeveloperApprovalSheetContext.passcodeReason.getter();
}

uint64_t sub_100017558()
{
  return DeveloperApprovalSheetContext.body.getter();
}

uint64_t sub_100017568()
{
  return DeveloperApprovalSheetContext.title.getter();
}

uint64_t sub_100017578()
{
  return type metadata accessor for DeveloperApprovalSheetContext();
}

uint64_t sub_100017588()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100017598()
{
  return static Logger.general.getter();
}

uint64_t sub_1000175A8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000175B8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000175C8()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000175D8()
{
  return ScrollView.init(_:showsIndicators:content:)();
}

uint64_t sub_1000175E8()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_1000175F8()
{
  return VerticalEdge.rawValue.getter();
}

uint64_t sub_100017608()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100017618()
{
  return GeometryProxy.frame<A>(in:)();
}

uint64_t sub_100017628()
{
  return type metadata accessor for GeometryProxy();
}

uint64_t sub_100017638()
{
  return static OpenURLAction.Result.handled.getter();
}

uint64_t sub_100017648()
{
  return OpenURLAction.init(handler:)();
}

uint64_t sub_100017658()
{
  return type metadata accessor for OpenURLAction();
}

uint64_t sub_100017668()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100017678()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t sub_100017688()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100017698()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_1000176A8()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_1000176B8()
{
  return EnvironmentValues.symbolRenderingMode.getter();
}

uint64_t sub_1000176C8()
{
  return EnvironmentValues.symbolRenderingMode.setter();
}

uint64_t sub_1000176D8()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_1000176E8()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_1000176F8()
{
  return EnvironmentValues.openURL.getter();
}

uint64_t sub_100017708()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_100017718()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_100017728()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100017738()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100017748()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100017758()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100017768()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100017778()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100017788()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t sub_100017798()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t sub_1000177A8()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_1000177B8()
{
  return type metadata accessor for _ConditionalContent.Storage();
}

uint64_t sub_1000177C8()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000177D8()
{
  return type metadata accessor for _ConditionalContent();
}

uint64_t sub_1000177E8()
{
  return type metadata accessor for GlobalCoordinateSpace();
}

uint64_t sub_1000177F8()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t sub_100017808()
{
  return static CoordinateSpaceProtocol<>.global.getter();
}

uint64_t sub_100017818()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t sub_100017828()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t sub_100017838()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100017848()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_100017858()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t sub_100017868()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100017878()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100017888()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_100017898()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_1000178A8()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_1000178B8()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_1000178C8()
{
  return Edge.init(rawValue:)();
}

uint64_t sub_1000178D8()
{
  return static Font.subheadline.getter();
}

uint64_t sub_1000178E8()
{
  return static Font.body.getter();
}

uint64_t sub_1000178F8()
{
  return static Font.title.getter();
}

uint64_t sub_100017908()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_100017918()
{
  return Text.bold()();
}

uint64_t sub_100017928()
{
  return Text.font(_:)();
}

uint64_t sub_100017938()
{
  return Text.init(_:)();
}

uint64_t sub_100017948()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100017958()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100017968()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100017978()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_100017988()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100017998()
{
  return View.interactiveDismissDisabled(_:)();
}

uint64_t sub_1000179A8()
{
  return static Color.blue.getter();
}

uint64_t sub_1000179B8()
{
  return static Color.gray.getter();
}

uint64_t sub_1000179C8()
{
  return static Color.clear.getter();
}

uint64_t sub_1000179D8()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000179E8()
{
  return Image.init(systemName:)();
}

uint64_t sub_1000179F8()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100017A08()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_100017A18()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100017A28()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_100017A38()
{
  return State.wrappedValue.getter();
}

uint64_t sub_100017A48()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100017A58()
{
  return State.projectedValue.getter();
}

uint64_t sub_100017A68()
{
  return Button.init(action:label:)();
}

uint64_t sub_100017A78()
{
  return HStack.init(alignment:spacing:content:)();
}

uint64_t sub_100017A88()
{
  return type metadata accessor for HStack();
}

uint64_t sub_100017A98()
{
  return VStack.init(alignment:spacing:content:)();
}

uint64_t sub_100017AA8()
{
  return type metadata accessor for VStack();
}

uint64_t sub_100017AB8()
{
  return Binding.wrappedValue.getter();
}

uint64_t sub_100017AC8()
{
  return Binding.wrappedValue.setter();
}

uint64_t sub_100017AD8()
{
  return static Material.thin.getter();
}

uint64_t sub_100017AE8()
{
  return type metadata accessor for Material();
}

uint64_t sub_100017AF8()
{
  return static Alignment.bottom.getter();
}

uint64_t sub_100017B08()
{
  return static Alignment.center.getter();
}

uint64_t sub_100017B18()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100017B28()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100017B38()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100017B48()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100017B58()
{
  return static DispatchTime.now()();
}

uint64_t sub_100017B68()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100017B78()
{
  return + infix(_:_:)();
}

uint64_t sub_100017B88()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017B98()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

NSString sub_100017BA8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100017BB8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100017BC8()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100017BD8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100017BE8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100017BF8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100017C08()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100017C18()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100017C28()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100017C38()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100017C48()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100017C58()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100017C68()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100017C78()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100017C88()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100017C98()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100017CA8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100017CB8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100017CC8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_100017CD8(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100017CE8()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100017CF8()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_100017D08()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100017D18()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100017D28()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100017D38()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100017D48()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100017D58()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100017D68()
{
  return Error.localizedDescription.getter();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}