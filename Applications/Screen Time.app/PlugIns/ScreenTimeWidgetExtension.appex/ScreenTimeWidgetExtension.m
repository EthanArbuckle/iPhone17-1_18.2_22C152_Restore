void sub_100005660(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unsigned char *a9@<X8>, double a10@<D0>, double a11@<D1>, double a12@<D2>, uint64_t a13, unsigned __int8 a14, uint64_t a15, unsigned __int8 a16, unsigned __int8 a17, uint64_t a18, uint64_t a19)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  int *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  int v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(unsigned char *, uint64_t, uint64_t);
  uint64_t v75;
  void (*v76)(char *, uint64_t);
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  uint64_t v84;
  int v85;
  uint64_t v86;
  int v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned char *v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;

  v105 = a8;
  v101 = a7;
  v95 = a6;
  v97 = a5;
  v94 = a4;
  v93 = a3;
  LODWORD(v111) = a1;
  v24 = sub_100005EB4(&qword_100069948);
  __chkstk_darwin(v24 - 8);
  v104 = (uint64_t)&v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = sub_100054A10();
  v103 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  v106 = (char *)&v82 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v27 - 8);
  v90 = (uint64_t)&v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100054CD0();
  v99 = *(void *)(v29 - 8);
  v100 = v29;
  v30 = __chkstk_darwin(v29);
  v92 = (char *)&v82 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v33 = (char *)&v82 - v32;
  v34 = sub_100054C10();
  v35 = *(void *)(v34 - 8);
  v36 = __chkstk_darwin(v34);
  v91 = (char *)&v82 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __chkstk_darwin(v36);
  v40 = (char *)&v82 - v39;
  v41 = __chkstk_darwin(v38);
  v107 = (char *)&v82 - v42;
  __chkstk_darwin(v41);
  v44 = (char *)&v82 - v43;
  v45 = (int *)type metadata accessor for UsageTimelineEntry();
  v46 = &a9[v45[6]];
  *v46 = 0;
  v46[1] = 0;
  v47 = &a9[v45[8]];
  *v47 = 0;
  v47[1] = 0;
  v98 = v45[18];
  *(void *)&a9[v98] = 0;
  sub_100054BF0();
  v109 = v33;
  sub_100054C90();
  *a9 = v111;
  v102 = a2;
  v48 = v90;
  sub_100005F44(a2, v90, &qword_100069950);
  v49 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v108 = v44;
  v50 = v44;
  v51 = v48;
  v83 = v49;
  v49(v40, v50, v34);
  v52 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48);
  v111 = v34;
  v53 = v52(v48, 1, v34);
  v96 = v35;
  if (v53 == 1)
  {
    v54 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    v54(v107, v40, v111);
    sub_100005FA8(v51, &qword_100069950);
  }
  else
  {
    v55 = v111;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v40, v111);
    v54 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    v54(v107, (char *)v51, v55);
  }
  v90 = a19;
  v89 = a18;
  v88 = a17;
  v87 = a16;
  v86 = a15;
  v85 = a14;
  v84 = a13;
  v56 = v111;
  v54(&a9[v45[5]], v107, v111);
  swift_bridgeObjectRelease();
  v57 = v94;
  *v46 = v93;
  v46[1] = v57;
  v58 = (double *)&a9[v45[7]];
  *v58 = a10;
  v58[1] = a11;
  swift_bridgeObjectRelease();
  v59 = v95;
  *v47 = v97;
  v47[1] = v59;
  v60 = v101;
  v61 = v104;
  sub_100005F44(v101, v104, &qword_100069948);
  v62 = (uint64_t)v91;
  v83(v91, v108, v56);
  v63 = v99;
  v64 = v100;
  v65 = v92;
  (*(void (**)(char *, char *, uint64_t))(v99 + 16))(v92, v109, v100);
  v66 = v103;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v61, 1, v110) == 1)
  {
    sub_100012DA0(v62, (uint64_t)v106);
    sub_100005FA8(v60, &qword_100069948);
    sub_100005FA8(v102, &qword_100069950);
    v67 = *(void (**)(char *, uint64_t))(v63 + 8);
    v67(v65, v64);
    v68 = v66;
    v69 = v61;
    v70 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
    v71 = v62;
    v72 = v111;
    v70(v71, v111);
    v67(v109, v64);
    v70((uint64_t)v108, v72);
    v73 = (uint64_t)v106;
    sub_100005FA8(v69, &qword_100069948);
    v74 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v68 + 32);
    v75 = v110;
    v74(&a9[v45[9]], v73, v110);
  }
  else
  {
    sub_100005FA8(v60, &qword_100069948);
    sub_100005FA8(v102, &qword_100069950);
    v76 = *(void (**)(char *, uint64_t))(v63 + 8);
    v76(v65, v64);
    v77 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
    v78 = v62;
    v79 = v111;
    v77(v78, v111);
    v76(v109, v64);
    v77((uint64_t)v108, v79);
    v74 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v66 + 32);
    v80 = (uint64_t)v106;
    v75 = v110;
    v74(v106, v61, v110);
    v74(&a9[v45[9]], v80, v75);
  }
  v74(&a9[v45[10]], v105, v75);
  *(void *)&a9[v45[11]] = v84;
  a9[v45[12]] = v85 & 1;
  *(void *)&a9[v45[13]] = v86;
  a9[v45[14]] = v87 & 1;
  a9[v45[15]] = v88 & 1;
  *(void *)&a9[v45[16]] = v89;
  *(double *)&a9[v45[17]] = a12;
  v81 = v98;

  *(void *)&a9[v81] = v90;
}

uint64_t sub_100005E38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = sub_100054C10();
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t variable initialization expression of STSelectUserIntentResponse.code()
{
  return 0;
}

uint64_t sub_100005EB4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for UsageTimelineEntry()
{
  uint64_t result = qword_1000699B8;
  if (!qword_1000699B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005F44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EB4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100005FA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005EB4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_100006004(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_10000600C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

BOOL sub_100006020(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100006050(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100006064(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100006078@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100006088(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100006094(void *a1, void *a2)
{
  return *a1 == *a2;
}

BOOL sub_1000060A8(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

void *sub_1000060BC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000060C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100055A10();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1000060F4(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

__n128 sub_100006100(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006110(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006130(uint64_t result, int a2, int a3)
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

char *sub_10000616C(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v31 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    v8 = &a1[v7];
    v9 = &a2[v7];
    uint64_t v10 = sub_100054C10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[6];
    uint64_t v12 = a3[7];
    v13 = &v4[v11];
    v14 = &a2[v11];
    uint64_t v15 = *((void *)v14 + 1);
    *(void *)v13 = *(void *)v14;
    *((void *)v13 + 1) = v15;
    *(_OWORD *)&v4[v12] = *(_OWORD *)&a2[v12];
    uint64_t v16 = a3[8];
    uint64_t v17 = a3[9];
    v18 = &v4[v16];
    v19 = &a2[v16];
    uint64_t v20 = *((void *)v19 + 1);
    *(void *)v18 = *(void *)v19;
    *((void *)v18 + 1) = v20;
    v21 = &v4[v17];
    v22 = &a2[v17];
    uint64_t v23 = sub_100054A10();
    v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24(v21, v22, v23);
    v24(&v4[a3[10]], &a2[a3[10]], v23);
    uint64_t v25 = a3[12];
    *(void *)&v4[a3[11]] = *(void *)&a2[a3[11]];
    v4[v25] = a2[v25];
    uint64_t v26 = a3[14];
    *(void *)&v4[a3[13]] = *(void *)&a2[a3[13]];
    v4[v26] = a2[v26];
    uint64_t v27 = a3[16];
    v4[a3[15]] = a2[a3[15]];
    *(void *)&v4[v27] = *(void *)&a2[v27];
    uint64_t v28 = a3[18];
    *(void *)&v4[a3[17]] = *(void *)&a2[a3[17]];
    v29 = *(void **)&a2[v28];
    *(void *)&v4[v28] = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v30 = v29;
  }
  return v4;
}

void sub_100006364(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_100054C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + a2[9];
  uint64_t v7 = sub_100054A10();
  v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[10], v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = *(void **)(a1 + a2[18]);
}

unsigned char *sub_100006490(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  v8 = &a2[v6];
  uint64_t v9 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = a3[7];
  uint64_t v12 = &a1[v10];
  v13 = &a2[v10];
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  *(_OWORD *)&a1[v11] = *(_OWORD *)&a2[v11];
  uint64_t v15 = a3[8];
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v15];
  v18 = &a2[v15];
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = &a1[v16];
  v21 = &a2[v16];
  uint64_t v22 = sub_100054A10();
  uint64_t v23 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23(v20, v21, v22);
  v23(&a1[a3[10]], &a2[a3[10]], v22);
  uint64_t v24 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  a1[v24] = a2[v24];
  uint64_t v25 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  a1[v25] = a2[v25];
  uint64_t v26 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  *(void *)&a1[v26] = *(void *)&a2[v26];
  uint64_t v27 = a3[18];
  *(void *)&a1[a3[17]] = *(void *)&a2[a3[17]];
  uint64_t v28 = *(void **)&a2[v27];
  *(void *)&a1[v27] = v28;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v29 = v28;
  return a1;
}

unsigned char *sub_100006638(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  v8 = &a2[v6];
  uint64_t v9 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  void *v14 = *v15;
  v14[1] = v15[1];
  uint64_t v16 = a3[8];
  uint64_t v17 = &a1[v16];
  v18 = &a2[v16];
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[9];
  uint64_t v20 = &a1[v19];
  v21 = &a2[v19];
  uint64_t v22 = sub_100054A10();
  uint64_t v23 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v22 - 8) + 24);
  v23(v20, v21, v22);
  v23(&a1[a3[10]], &a2[a3[10]], v22);
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[12]] = a2[a3[12]];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[a3[14]] = a2[a3[14]];
  a1[a3[15]] = a2[a3[15]];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[17]] = *(void *)&a2[a3[17]];
  uint64_t v24 = a3[18];
  uint64_t v25 = *(void **)&a1[v24];
  uint64_t v26 = *(void **)&a2[v24];
  *(void *)&a1[v24] = v26;
  id v27 = v26;

  return a1;
}

unsigned char *sub_100006844(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  v8 = &a2[v6];
  uint64_t v9 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(_OWORD *)&a1[a3[6]] = *(_OWORD *)&a2[a3[6]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  uint64_t v11 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_100054A10();
  uint64_t v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(&a1[a3[10]], &a2[a3[10]], v14);
  uint64_t v16 = a3[12];
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  a1[v16] = a2[v16];
  uint64_t v17 = a3[14];
  *(void *)&a1[a3[13]] = *(void *)&a2[a3[13]];
  a1[v17] = a2[v17];
  uint64_t v18 = a3[16];
  a1[a3[15]] = a2[a3[15]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  uint64_t v19 = a3[18];
  *(void *)&a1[a3[17]] = *(void *)&a2[a3[17]];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  return a1;
}

unsigned char *sub_1000069AC(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = &a1[v6];
  v8 = &a2[v6];
  uint64_t v9 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = (uint64_t *)&a2[v10];
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  *uint64_t v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = (uint64_t *)&a2[v15];
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = sub_100054A10();
  uint64_t v24 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 40);
  v24(v21, v22, v23);
  v24(&a1[a3[10]], &a2[a3[10]], v23);
  *(void *)&a1[a3[11]] = *(void *)&a2[a3[11]];
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[13];
  a1[a3[12]] = a2[a3[12]];
  *(void *)&a1[v25] = *(void *)&a2[v25];
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[15];
  a1[a3[14]] = a2[a3[14]];
  a1[v26] = a2[v26];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  swift_bridgeObjectRelease();
  uint64_t v27 = a3[18];
  *(void *)&a1[a3[17]] = *(void *)&a2[a3[17]];
  uint64_t v28 = *(void **)&a1[v27];
  *(void *)&a1[v27] = *(void *)&a2[v27];

  return a1;
}

uint64_t sub_100006B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006B70);
}

uint64_t sub_100006B70(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100054C10();
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_5:
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v11(a1 + v9, a2, v7);
  }
  uint64_t v10 = sub_100054A10();
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[9];
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + a3[11]);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t sub_100006C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006C94);
}

uint64_t sub_100006C94(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_100054C10();
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t result = sub_100054A10();
    if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
    {
      *(void *)(a1 + a4[11]) = (a2 - 1);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result - 8);
    uint64_t v11 = a4[9];
  }
  unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);

  return v13(a1 + v11, a2, a2, v9);
}

uint64_t sub_100006DA0()
{
  uint64_t result = sub_100054C10();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_100054A10();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void type metadata accessor for STUsageDetailItemType(uint64_t a1)
{
}

void sub_100006ECC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006F14()
{
  uint64_t v0 = sub_100005EB4(&qword_100069AE0);
  sub_10000972C(v0, qword_10006D0E0);
  sub_1000096F4(v0, (uint64_t)qword_10006D0E0);
  sub_100005EB4(&qword_100069AE8);
  uint64_t v1 = *(void *)(sub_100005EB4(&qword_100069AF0) - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100056C00;
  unint64_t v5 = v4 + v3;
  *(unsigned char *)(v4 + v3) = 0;
  sub_100007620();
  sub_100054920();
  *(unsigned char *)(v5 + v2) = 1;
  sub_100054920();
  *(unsigned char *)(v5 + 2 * v2) = 2;
  sub_100054920();
  *(unsigned char *)(v5 + 3 * v2) = 3;
  sub_100054920();
  *(unsigned char *)(v5 + 4 * v2) = 4;
  sub_100054920();
  *(unsigned char *)(v5 + 5 * v2) = 5;
  sub_100054920();
  *(unsigned char *)(v5 + 6 * v2) = 6;
  sub_100054920();
  *(unsigned char *)(v5 + 7 * v2) = 7;
  sub_100054920();
  *(unsigned char *)(v5 + 8 * v2) = 8;
  sub_100054920();
  sub_1000234CC(v4);
  return sub_100054930();
}

uint64_t sub_100007234()
{
  sub_100005EB4(&qword_100069AB8);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100054AD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v4 = sub_1000549A0();
  sub_10000972C(v4, qword_10006D0F8);
  sub_1000096F4(v4, (uint64_t)qword_10006D0F8);
  sub_100054AB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  return sub_100054990();
}

unint64_t sub_1000073A4(char a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6C41737961776C61;
      break;
    case 2:
      unint64_t result = 0x74696D694C707061;
      break;
    case 3:
    case 4:
      return result;
    case 5:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 6:
      unint64_t result = 0x656D69746E776F64;
      break;
    case 7:
      unint64_t result = 0x69446E6565726373;
      break;
    case 8:
      unint64_t result = 0xD00000000000001BLL;
      break;
    default:
      unint64_t result = 1953460082;
      break;
  }
  return result;
}

uint64_t sub_1000074C8(unsigned __int8 *a1, char *a2)
{
  return sub_100023DC0(*a1, *a2);
}

unint64_t sub_1000074D8()
{
  unint64_t result = qword_100069A30;
  if (!qword_100069A30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A30);
  }
  return result;
}

Swift::Int sub_10000752C()
{
  return sub_1000560A0();
}

uint64_t sub_100007574()
{
  return sub_100024054();
}

Swift::Int sub_10000757C()
{
  return sub_1000560A0();
}

uint64_t sub_1000075C0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000097F8(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_1000075F0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_1000073A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_100007620()
{
  unint64_t result = qword_100069A38;
  if (!qword_100069A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A38);
  }
  return result;
}

unint64_t sub_100007678()
{
  unint64_t result = qword_100069A40;
  if (!qword_100069A40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A40);
  }
  return result;
}

uint64_t sub_1000076CC@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000698D0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100005EB4(&qword_100069AE0);
  uint64_t v3 = sub_1000096F4(v2, (uint64_t)qword_10006D0E0);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

unint64_t sub_10000777C()
{
  unint64_t result = qword_100069A48;
  if (!qword_100069A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A48);
  }
  return result;
}

unint64_t sub_1000077D4()
{
  unint64_t result = qword_100069A50;
  if (!qword_100069A50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A50);
  }
  return result;
}

unint64_t sub_10000782C()
{
  unint64_t result = qword_100069A58;
  if (!qword_100069A58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A58);
  }
  return result;
}

void *sub_100007880()
{
  return &protocol witness table for String;
}

uint64_t sub_10000788C()
{
  sub_100009790();
  uint64_t v2 = sub_100054910();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return sub_1000097E4(v3, v0, v2, v1);
}

unint64_t sub_100007924()
{
  unint64_t result = qword_100069A68;
  if (!qword_100069A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A68);
  }
  return result;
}

unint64_t sub_10000797C()
{
  unint64_t result = qword_100069A70;
  if (!qword_100069A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A70);
  }
  return result;
}

unint64_t sub_1000079D4()
{
  unint64_t result = qword_100069A78;
  if (!qword_100069A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A78);
  }
  return result;
}

unint64_t sub_100007A2C()
{
  unint64_t result = qword_100069A80;
  if (!qword_100069A80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A80);
  }
  return result;
}

uint64_t sub_100007A84@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000698D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000549A0();
  uint64_t v3 = sub_1000096F4(v2, (uint64_t)qword_10006D0F8);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100007B2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007B7C(uint64_t a1)
{
  unint64_t v2 = sub_100007620();

  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007BCC()
{
  unint64_t result = qword_100069A88;
  if (!qword_100069A88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A88);
  }
  return result;
}

unint64_t sub_100007C24()
{
  unint64_t result = qword_100069A90;
  if (!qword_100069A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A90);
  }
  return result;
}

unint64_t sub_100007C7C()
{
  unint64_t result = qword_100069A98;
  if (!qword_100069A98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069A98);
  }
  return result;
}

uint64_t sub_100007CD4(uint64_t a1)
{
  unint64_t v2 = sub_100007A2C();

  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100007D24()
{
  unint64_t result = qword_100069AA0;
  if (!qword_100069AA0)
  {
    sub_100007D80(&qword_100069AA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AA0);
  }
  return result;
}

uint64_t sub_100007D80(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_100007DC8(void *a1@<X8>)
{
  *a1 = &off_100066198;
}

unsigned char *initializeBufferWithCopyOfBuffer for ScreenTimeDeepLinks(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ScreenTimeDeepLinks(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ScreenTimeDeepLinks(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *uint64_t result = a2 + 8;
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
        JUMPOUT(0x100007F40);
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
          *uint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

uint64_t sub_100007F68(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007F74(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeDeepLinks()
{
  return &type metadata for ScreenTimeDeepLinks;
}

unint64_t sub_100007F8C()
{
  uint64_t v144 = sub_100054AC0();
  uint64_t v149 = *(void *)(v144 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v143 = (char *)v104 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100054C30();
  ((void (*)(void))__chkstk_darwin)();
  v131 = (char *)v104 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000559F0();
  ((void (*)(void))__chkstk_darwin)();
  int v3 = (char *)v104 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EB4(&qword_100069AB0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v135 = (char *)v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)v104 - v6;
  uint64_t v8 = sub_100005EB4(&qword_100069AB8);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  v110 = (char *)v104 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  v107 = (char *)v104 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v122 = (char *)v104 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v119 = (char *)v104 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v117 = (char *)v104 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v113 = (char *)v104 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  *(void *)&long long v126 = (char *)v104 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v111 = (char *)v104 - v24;
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)v104 - v25;
  v104[1] = (char *)v104 - v25;
  uint64_t v27 = sub_100054AD0();
  uint64_t v136 = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = __chkstk_darwin(v27);
  v109 = (char *)v104 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  v123 = (char *)v104 - v32;
  uint64_t v33 = __chkstk_darwin(v31);
  v120 = (char *)v104 - v34;
  uint64_t v35 = __chkstk_darwin(v33);
  v118 = (char *)v104 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  v116 = (char *)v104 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  uint64_t v114 = (uint64_t)v104 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v106 = (char *)v104 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  uint64_t v124 = (uint64_t)v104 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  v147 = (char *)v104 - v46;
  __chkstk_darwin(v45);
  v105 = (char *)v104 - v47;
  sub_100005EB4(&qword_100069AC0);
  uint64_t v48 = sub_100005EB4(&qword_100069AC8) - 8;
  unint64_t v49 = (*(unsigned __int8 *)(*(void *)v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v48 + 80);
  v130 = *(unsigned char **)(*(void *)v48 + 72);
  uint64_t v121 = 8 * (void)v130;
  uint64_t v50 = swift_allocObject();
  uint64_t v108 = v50;
  *(_OWORD *)(v50 + 16) = xmmword_100056C00;
  unint64_t v51 = v50 + v49;
  *(unsigned char *)(v50 + v49) = 0;
  sub_100054AB0();
  v129 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
  v129(v26, 1, 1, v27);
  unint64_t v145 = 0x80000001000586D0;
  v104[0] = v7;
  sub_1000548D0();
  uint64_t v141 = sub_1000548E0();
  uint64_t v52 = *(void *)(v141 - 8);
  v134 = *(void (**)(char *, void, uint64_t, uint64_t))(v52 + 56);
  uint64_t v146 = v52 + 56;
  v134(v7, 0, 1, v141);
  uint64_t v53 = sub_100005EB4(&qword_100069AD0);
  uint64_t v139 = v28 + 56;
  uint64_t v140 = v53;
  uint64_t v54 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v55 = ((v54 + 32) & ~v54) + 2 * *(void *)(v28 + 72);
  uint64_t v127 = *(void *)(v28 + 72);
  uint64_t v142 = (v54 + 32) & ~v54;
  uint64_t v138 = v54 | 7;
  uint64_t v115 = v55;
  uint64_t v56 = swift_allocObject();
  long long v125 = xmmword_100056C10;
  *(_OWORD *)(v56 + 16) = xmmword_100056C10;
  uint64_t v57 = v48;
  uint64_t v128 = v48;
  unint64_t v133 = v51;
  sub_100054AB0();
  unint64_t v112 = 0xD000000000000014;
  sub_100054AB0();
  v132 = v3;
  sub_1000559E0();
  sub_100054C20();
  unsigned int v137 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v148 = *(void (**)(char *))(v149 + 104);
  v149 += 104;
  v58 = v143;
  v148(v143);
  sub_100054AE0();
  sub_1000548F0();
  v59 = v130;
  v130[v51] = 1;
  sub_100054AB0();
  v105 = &v59[v51 + *(int *)(v57 + 56)];
  v60 = v111;
  sub_100054AB0();
  v129(v60, 0, 1, v136);
  v61 = v135;
  sub_1000548D0();
  v62 = v134;
  v134(v61, 0, 1, v141);
  *(_OWORD *)(swift_allocObject() + 16) = v125;
  sub_100054AB0();
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  uint64_t v63 = v137;
  ((void (*)(char *, void, uint64_t))v148)(v58, v137, v144);
  sub_100054AE0();
  v64 = v135;
  sub_1000548F0();
  uint64_t v124 = 2 * (void)v59;
  v65 = (unsigned char *)(v133 + 2 * (void)v59);
  unsigned char *v65 = 2;
  sub_100054AB0();
  v105 = &v65[*(int *)(v128 + 56)];
  v66 = (char *)v126;
  sub_100054AB0();
  v67 = v129;
  v129(v66, 0, 1, v136);
  sub_1000548D0();
  v62(v64, 0, 1, v141);
  *(_OWORD *)(swift_allocObject() + 16) = v125;
  sub_100054AB0();
  sub_100054AB0();
  v111 = (char *)0xD0000000000000A9;
  sub_1000559E0();
  sub_100054C20();
  uint64_t v68 = v63;
  uint64_t v69 = v144;
  ((void (*)(char *, uint64_t, uint64_t))v148)(v143, v68, v144);
  sub_100054AE0();
  sub_1000548F0();
  v70 = v130;
  v71 = &v130[v124 + v133];
  char *v71 = 3;
  sub_100054AB0();
  uint64_t v72 = v128;
  v106 = &v71[*(int *)(v128 + 56)];
  v73 = v113;
  sub_100054AB0();
  uint64_t v74 = v136;
  v67(v73, 0, 1, v136);
  sub_1000548D0();
  v134(v64, 0, 1, v141);
  uint64_t v124 = v142 + v127;
  uint64_t v75 = swift_allocObject();
  long long v126 = xmmword_100056C20;
  *(_OWORD *)(v75 + 16) = xmmword_100056C20;
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  ((void (*)(char *, void, uint64_t))v148)(v143, v137, v69);
  sub_100054AE0();
  v76 = v135;
  sub_1000548F0();
  uint64_t v114 = 4 * (void)v70;
  v77 = (unsigned char *)(v133 + 4 * (void)v70);
  unsigned char *v77 = 4;
  sub_100054AB0();
  v113 = &v77[*(int *)(v72 + 56)];
  v78 = v117;
  sub_100054AB0();
  uint64_t v79 = v74;
  v80 = v129;
  v129(v78, 0, 1, v79);
  sub_1000548D0();
  uint64_t v81 = v141;
  v134(v76, 0, 1, v141);
  *(_OWORD *)(swift_allocObject() + 16) = v126;
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  ((void (*)(char *, void, uint64_t))v148)(v143, v137, v144);
  sub_100054AE0();
  v82 = v135;
  sub_1000548F0();
  unint64_t v83 = v133;
  v84 = &v130[v114 + v133];
  char *v84 = 5;
  sub_100054AB0();
  v117 = &v84[*(int *)(v128 + 56)];
  v85 = v119;
  sub_100054AB0();
  uint64_t v86 = v136;
  v80(v85, 0, 1, v136);
  sub_1000548D0();
  uint64_t v87 = v81;
  v88 = v134;
  v134(v82, 0, 1, v87);
  *(_OWORD *)(swift_allocObject() + 16) = v126;
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  uint64_t v89 = v144;
  ((void (*)(char *, void, uint64_t))v148)(v143, v137, v144);
  sub_100054AE0();
  v90 = v135;
  sub_1000548F0();
  v91 = (unsigned char *)(v83 + 6 * (void)v130);
  unsigned char *v91 = 6;
  sub_100054AB0();
  uint64_t v92 = v128;
  v119 = &v91[*(int *)(v128 + 56)];
  v93 = v122;
  sub_100054AB0();
  uint64_t v94 = v86;
  v95 = v129;
  v129(v93, 0, 1, v94);
  sub_1000548D0();
  v88(v90, 0, 1, v141);
  *(_OWORD *)(swift_allocObject() + 16) = v126;
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  ((void (*)(char *, void, uint64_t))v148)(v143, v137, v89);
  sub_100054AE0();
  v96 = v135;
  sub_1000548F0();
  v97 = (unsigned char *)(v133 + v121 - (void)v130);
  unsigned char *v97 = 7;
  sub_100054AB0();
  v130 = &v97[*(int *)(v92 + 56)];
  v98 = v107;
  sub_100054AB0();
  v95(v98, 0, 1, v136);
  sub_1000548D0();
  v134(v96, 0, 1, v141);
  *(_OWORD *)(swift_allocObject() + 16) = v125;
  sub_100054AB0();
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  v99 = v143;
  uint64_t v100 = v137;
  ((void (*)(char *, void, uint64_t))v148)(v143, v137, v144);
  sub_100054AE0();
  sub_1000548F0();
  unint64_t v101 = v133 + v121;
  *(unsigned char *)(v133 + v121) = 8;
  sub_100054AB0();
  unint64_t v133 = v101 + *(int *)(v128 + 56);
  v102 = v110;
  sub_100054AB0();
  v129(v102, 0, 1, v136);
  sub_1000548D0();
  v134(v96, 0, 1, v141);
  *(_OWORD *)(swift_allocObject() + 16) = v126;
  sub_100054AB0();
  sub_1000559E0();
  sub_100054C20();
  ((void (*)(char *, uint64_t, uint64_t))v148)(v99, v100, v144);
  sub_100054AE0();
  sub_1000548F0();
  return sub_1000236CC(v108);
}

uint64_t sub_1000096F4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_10000972C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100009790()
{
  unint64_t result = qword_100069AD8;
  if (!qword_100069AD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069AD8);
  }
  return result;
}

uint64_t sub_1000097E4(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000097F8(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_1000660A0;
  v6._object = a2;
  unint64_t v4 = sub_100055F90(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 9) {
    return 9;
  }
  else {
    return v4;
  }
}

uint64_t sub_100009844(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void sub_10000986C(uint64_t a1, void *a2)
{
  Swift::OpaquePointer v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_1000098D4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;

  return _swift_continuation_resume(v2);
}

void sub_100009928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSString a5, uint64_t a6, uint64_t a7)
{
  id v11 = [self sharedCache];
  NSString v12 = sub_100055A00();
  if (a5) {
    a5 = sub_100055A00();
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a6;
  *(void *)(v13 + 24) = a7;
  v15[4] = sub_100009DC8;
  v15[5] = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10000986C;
  v15[3] = &unk_1000663B8;
  uint64_t v14 = _Block_copy(v15);
  swift_retain();
  swift_release();
  [v11 fetchPersonImageWithDSID:a1 fullName:v12 appleID:a5 forceFetch:0 completionHandler:v14];
  _Block_release(v14);
}

uint64_t sub_100009A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[19] = a4;
  v5[20] = a5;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  return _swift_task_switch(sub_100009AB8, 0, 0);
}

uint64_t sub_100009AB8()
{
  uint64_t v1 = v0[20];
  id v2 = [self sharedCache];
  v0[21] = v2;
  NSString v3 = sub_100055A00();
  v0[22] = v3;
  if (v1) {
    NSString v4 = sub_100055A00();
  }
  else {
    NSString v4 = 0;
  }
  v0[23] = v4;
  uint64_t v5 = v0[16];
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_100009C34;
  uint64_t v6 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_1000098D4;
  v0[13] = &unk_100066378;
  v0[14] = v6;
  [v2 fetchPersonImageWithDSID:v5 fullName:v3 appleID:v4 forceFetch:0 completionHandler:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100009C34()
{
  return _swift_task_switch(sub_100009D14, 0, 0);
}

uint64_t sub_100009D14()
{
  id v2 = *(void **)(v0 + 176);
  uint64_t v1 = *(void **)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 120);

  NSString v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v4(v3);
}

uint64_t sub_100009D90()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009DC8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100009DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100009E00()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for ScreenTimeIconCache()
{
  return &type metadata for ScreenTimeIconCache;
}

ValueMetadata *type metadata accessor for ScreenTimeAppInfoCache()
{
  return &type metadata for ScreenTimeAppInfoCache;
}

uint64_t destroy for GraphLabelView()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *_s25ScreenTimeWidgetExtension14GraphLabelViewVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for GraphLabelView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for GraphLabelView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for GraphLabelView(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GraphLabelView(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GraphLabelView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GraphLabelView()
{
  return &type metadata for GraphLabelView;
}

uint64_t destroy for GraphLabelPlaceholderView()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s25ScreenTimeWidgetExtension25GraphLabelPlaceholderViewVwCP_0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GraphLabelPlaceholderView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for GraphLabelPlaceholderView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GraphLabelPlaceholderView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GraphLabelPlaceholderView(uint64_t result, int a2, int a3)
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GraphLabelPlaceholderView()
{
  return &type metadata for GraphLabelPlaceholderView;
}

uint64_t sub_10000A168()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_10000A184@<Q0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v7 = *a1;
  uint64_t v8 = sub_100055300();
  sub_10000A24C(a2, a3, v7, (uint64_t)v20);
  char v9 = v21;
  char v10 = v22;
  uint64_t v11 = v23;
  char v12 = v24;
  char v13 = v25;
  __n128 result = (__n128)v20[0];
  long long v15 = v20[1];
  long long v16 = v20[2];
  long long v17 = v20[3];
  long long v18 = v20[4];
  long long v19 = v20[5];
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 0;
  *(__n128 *)(a4 + 24) = result;
  *(_OWORD *)(a4 + 40) = v15;
  *(_OWORD *)(a4 + 56) = v16;
  *(_OWORD *)(a4 + 72) = v17;
  *(_OWORD *)(a4 + 88) = v18;
  *(_OWORD *)(a4 + 104) = v19;
  *(unsigned char *)(a4 + 120) = v9;
  *(unsigned char *)(a4 + 121) = v10;
  *(void *)(a4 + 128) = v11;
  *(unsigned char *)(a4 + 136) = v12;
  *(unsigned char *)(a4 + 137) = v13;
  return result;
}

uint64_t sub_10000A24C@<X0>(uint64_t result@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, uint64_t a4@<X8>)
{
  if ((result & 1) == 0)
  {
    sub_100055310();
    uint64_t v5 = sub_100055530();
    uint64_t v7 = v6;
    char v9 = v8 & 1;
    sub_100055500();
    sub_100055520();
    swift_release();
    sub_10000AB4C(v5, v7, v9);
    swift_bridgeObjectRelease();
    sub_100055780();
    sub_100055100();
    swift_getKeyPath();
    goto LABEL_6;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a2 + 16) > a3)
  {
    swift_retain();
LABEL_6:
    sub_100005EB4(&qword_100069B30);
    sub_10000C0E4();
    sub_10000C1F8();
    sub_1000553A0();
    *(void *)a4 = v11;
    *(void *)(a4 + 8) = v12;
    *(void *)(a4 + 16) = v13;
    *(void *)(a4 + 24) = v14;
    *(void *)(a4 + 32) = v15;
    *(void *)(a4 + 40) = v16;
    *(void *)(a4 + 48) = v17;
    *(void *)(a4 + 56) = v18;
    *(void *)(a4 + 64) = v19;
    *(void *)(a4 + 72) = v20;
    *(void *)(a4 + 80) = v21;
    *(void *)(a4 + 88) = v22;
    *(unsigned char *)(a4 + 96) = v23;
    *(unsigned char *)(a4 + 97) = v24;
    *(void *)(a4 + 104) = 0;
    *(unsigned char *)(a4 + 112) = a3 != 2;
    *(unsigned char *)(a4 + 113) = a3 == 2;
    sub_10000C24C(v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
    return sub_10000C2AC(v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A50C@<X0>(uint64_t a1@<X8>)
{
  char v3 = *v1;
  uint64_t v5 = *((void *)v1 + 1);
  uint64_t v4 = *((void *)v1 + 2);
  uint64_t result = sub_100055300();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_100005EB4(&qword_100069B00);
    swift_getKeyPath();
    uint64_t v7 = swift_allocObject();
    *(unsigned char *)(v7 + 16) = v3;
    *(void *)(v7 + 24) = v5;
    *(void *)(v7 + 32) = v4;
    swift_bridgeObjectRetain();
    sub_100005EB4(&qword_100069B08);
    sub_100005EB4(&qword_100069B10);
    sub_10000AA7C();
    sub_10000D120(&qword_100069B28, &qword_100069B10);
    return sub_100055720();
  }
  return result;
}

uint64_t sub_10000A648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v23[0] = a4;
  uint64_t v7 = sub_100005EB4(&qword_100069B68);
  __chkstk_darwin(v7 - 8);
  char v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005EB4(&qword_100069B70);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v9 = sub_100055300();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  sub_100005EB4(&qword_100069B78);
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_10000C370(v13);
  swift_bridgeObjectRelease();
  v23[1] = v14;
  swift_getKeyPath();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = a3;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_10000C5C0;
  *(void *)(v16 + 24) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005EB4(&qword_100069B80);
  sub_100005EB4(&qword_100069B88);
  sub_10000D120(&qword_100069B90, &qword_100069B80);
  sub_10000D120(&qword_100069B98, &qword_100069B88);
  sub_100055720();
  uint64_t v17 = sub_100055780();
  sub_10004CA80(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v12, 0.0, 1, 0.0, 1, v17, v18);
  sub_100005FA8((uint64_t)v9, &qword_100069B68);
  uint64_t v19 = sub_100055790();
  uint64_t v20 = v23[0];
  sub_100005F44((uint64_t)v12, v23[0], &qword_100069B70);
  uint64_t v21 = (uint64_t *)(v20 + *(int *)(sub_100005EB4(&qword_100069BA0) + 36));
  uint64_t *v21 = v19;
  v21[1] = a1;
  swift_bridgeObjectRetain();
  return sub_100005FA8((uint64_t)v12, &qword_100069B70);
}

unint64_t sub_10000A93C@<X0>(unint64_t result@<X0>, void *a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a2[5];
  long long v10 = *(_OWORD *)a2;
  long long v13 = *(_OWORD *)(a2 + 3);
  long long v14 = v10;
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a3 + 16) > result)
  {
    uint64_t v12 = *(void *)(a3 + 8 * result + 32);
    sub_10000C67C((uint64_t)&v14);
    sub_10000C67C((uint64_t)&v13);
    uint64_t result = swift_retain();
    *(void *)a4 = v4;
    *(void *)(a4 + 8) = v5;
    *(void *)(a4 + 16) = v6;
    *(void *)(a4 + 24) = v7;
    *(void *)(a4 + 32) = v8;
    *(void *)(a4 + 40) = v9;
    *(void *)(a4 + 48) = v12;
    *(void *)(a4 + 56) = 0;
    *(unsigned char *)(a4 + 64) = 1;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A9F4()
{
  return sub_100055610();
}

uint64_t sub_10000AA10@<X0>(uint64_t a1@<X8>)
{
  return sub_10000A648(*v1, v1[1], v1[2], a1);
}

uint64_t sub_10000AA1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000AA38()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

double sub_10000AA70@<D0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_10000A184(a1, *(unsigned __int8 *)(v2 + 16), *(void *)(v2 + 32), a2).n128_u64[0];
  return result;
}

unint64_t sub_10000AA7C()
{
  unint64_t result = qword_100069B18;
  if (!qword_100069B18)
  {
    sub_100007D80(&qword_100069B08);
    sub_10000AAF8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069B18);
  }
  return result;
}

unint64_t sub_10000AAF8()
{
  unint64_t result = qword_100069B20;
  if (!qword_100069B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069B20);
  }
  return result;
}

uint64_t sub_10000AB4C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000AB5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v46 = a1;
  uint64_t v41 = sub_1000553F0();
  uint64_t v3 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005EB4(&qword_100069C48);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v42 = v6;
  uint64_t v43 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_100005EB4(&qword_100069C50);
  uint64_t v10 = __chkstk_darwin(v44);
  uint64_t v40 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v45 = (char *)&v40 - v12;
  uint64_t v13 = sub_100055360();
  sub_10000B110(v2, (uint64_t)v49);
  *(_OWORD *)((char *)&v51[9] + 7) = v49[9];
  *(_OWORD *)((char *)&v51[10] + 7) = v49[10];
  *(_OWORD *)((char *)&v51[11] + 7) = v50[0];
  v51[12] = *(_OWORD *)((char *)v50 + 9);
  *(_OWORD *)((char *)&v51[5] + 7) = v49[5];
  *(_OWORD *)((char *)&v51[6] + 7) = v49[6];
  *(_OWORD *)((char *)&v51[7] + 7) = v49[7];
  *(_OWORD *)((char *)&v51[8] + 7) = v49[8];
  *(_OWORD *)((char *)&v51[1] + 7) = v49[1];
  *(_OWORD *)((char *)&v51[2] + 7) = v49[2];
  *(_OWORD *)((char *)&v51[3] + 7) = v49[3];
  *(_OWORD *)((char *)&v51[4] + 7) = v49[4];
  *(_OWORD *)((char *)v51 + 7) = v49[0];
  *(_OWORD *)&v48[145] = v51[9];
  *(_OWORD *)&v48[161] = v51[10];
  *(_OWORD *)&v48[177] = v51[11];
  *(_OWORD *)&v48[193] = *(_OWORD *)((char *)v50 + 9);
  *(_OWORD *)&v48[81] = v51[5];
  *(_OWORD *)&v48[97] = v51[6];
  *(_OWORD *)&v48[113] = v51[7];
  *(_OWORD *)&v48[129] = v51[8];
  *(_OWORD *)&v48[17] = v51[1];
  *(_OWORD *)&v48[33] = v51[2];
  *(_OWORD *)&v48[49] = v51[3];
  *(_OWORD *)&v48[65] = v51[4];
  char v52 = 1;
  long long v47 = (unint64_t)v13;
  v48[0] = 1;
  *(_OWORD *)&v48[1] = v51[0];
  sub_1000553E0();
  uint64_t v14 = sub_100005EB4(&qword_100069C58);
  uint64_t v15 = sub_10000D120(&qword_100069C60, &qword_100069C58);
  sub_100055640();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v41);
  v53[12] = *(_OWORD *)&v48[176];
  v53[13] = *(_OWORD *)&v48[192];
  uint64_t v16 = (uint64_t)v40;
  v53[8] = *(_OWORD *)&v48[112];
  v53[9] = *(_OWORD *)&v48[128];
  char v54 = v48[208];
  v53[10] = *(_OWORD *)&v48[144];
  v53[11] = *(_OWORD *)&v48[160];
  v53[4] = *(_OWORD *)&v48[48];
  v53[5] = *(_OWORD *)&v48[64];
  v53[6] = *(_OWORD *)&v48[80];
  v53[7] = *(_OWORD *)&v48[96];
  v53[0] = v47;
  v53[1] = *(_OWORD *)v48;
  v53[2] = *(_OWORD *)&v48[16];
  v53[3] = *(_OWORD *)&v48[32];
  sub_10000CF98((uint64_t)v53);
  uint64_t v17 = *(void *)(v2 + 8);
  double v18 = *(double *)(v2 + 16);
  *(void *)&long long v47 = *(void *)v2;
  *((void *)&v47 + 1) = v17;
  unint64_t v19 = sub_10000D02C();
  swift_bridgeObjectRetain();
  uint64_t v41 = v19;
  uint64_t v20 = sub_100055540();
  uint64_t v22 = v21;
  LOBYTE(v2) = v23 & 1;
  *(void *)&long long v47 = v14;
  *((void *)&v47 + 1) = v15;
  swift_getOpaqueTypeConformance2();
  uint64_t v24 = v42;
  sub_1000555E0();
  sub_10000AB4C(v20, v22, v2);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v24);
  if (v18 < 0.0) {
    goto LABEL_9;
  }
  if (qword_100069938 != -1) {
    swift_once();
  }
  char v25 = (void *)qword_10006B0D0;
  uint64_t v26 = v18 < 60.0 ? 128 : 96;
  [(id)qword_10006B0D0 setAllowedUnits:v26];
  [v25 setUnitsStyle:3];
  id v27 = [v25 stringFromTimeInterval:v18];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = sub_100055A10();
    unint64_t v31 = v30;
  }
  else
  {
LABEL_9:
    uint64_t v29 = 0;
    unint64_t v31 = 0xE000000000000000;
  }
  if (sub_100055A50())
  {
    *(void *)&long long v47 = v29;
    *((void *)&v47 + 1) = v31;
    uint64_t v32 = sub_100055540();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100055310();
    uint64_t v32 = sub_100055530();
  }
  uint64_t v35 = v32;
  uint64_t v36 = v33;
  char v37 = v34 & 1;
  uint64_t v38 = (uint64_t)v45;
  sub_100055140();
  sub_10000AB4C(v35, v36, v37);
  swift_bridgeObjectRelease();
  sub_100005FA8(v16, &qword_100069C50);
  return sub_10000D080(v38, v46, &qword_100069C50);
}

uint64_t sub_10000B110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v3 = *(double *)(a1 + 16);
  sub_10000D02C();
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_100055540();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  sub_100055500();
  uint64_t v9 = sub_100055520();
  uint64_t v11 = v10;
  char v13 = v12;
  swift_release();
  sub_10000AB4C(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_100055510();
  uint64_t v41 = v15;
  uint64_t v42 = v14;
  char v17 = v16;
  uint64_t v43 = v18;
  sub_10000AB4C(v9, v11, v13 & 1);
  swift_bridgeObjectRelease();
  sub_100055780();
  sub_100055100();
  uint64_t KeyPath = swift_getKeyPath();
  if (v3 >= 0.0)
  {
    if (qword_100069938 != -1) {
      swift_once();
    }
    uint64_t v21 = (void *)qword_10006B0D0;
    if (v3 < 60.0) {
      uint64_t v22 = 128;
    }
    else {
      uint64_t v22 = 96;
    }
    [(id)qword_10006B0D0 setAllowedUnits:v22];
    [v21 setUnitsStyle:1];
    id v23 = [v21 stringFromTimeInterval:v3];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v20 = sub_100055A10();
      char v19 = v25;
    }
    else
    {
      uint64_t v20 = 0;
      char v19 = 0;
    }
  }
  else
  {
    char v19 = 0;
    uint64_t v20 = 11565;
  }
  uint64_t v57 = v20;
  char v58 = v19;
  uint64_t v26 = sub_100055540();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_100055500();
  uint64_t v31 = sub_100055520();
  uint64_t v33 = v32;
  char v35 = v34;
  uint64_t v39 = v36;
  swift_release();
  sub_10000AB4C(v26, v28, v30);
  swift_bridgeObjectRelease();
  sub_100055780();
  sub_100055100();
  uint64_t v37 = swift_getKeyPath();
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v50;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v50[3];
  *(_DWORD *)(a2 + 41) = *(_DWORD *)v49;
  *(_DWORD *)(a2 + 44) = *(_DWORD *)&v49[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v48;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v48[3];
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v47;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v47[3];
  *(_DWORD *)(a2 + 121) = *(_DWORD *)v46;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v46[3];
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v45[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v45;
  *(_DWORD *)(a2 + 164) = *(_DWORD *)&v44[3];
  *(_DWORD *)(a2 + 161) = *(_DWORD *)v44;
  *(void *)a2 = v42;
  *(void *)(a2 + 8) = v41;
  *(unsigned char *)(a2 + 16) = v17 & 1;
  *(void *)(a2 + 24) = v43;
  *(void *)(a2 + 32) = v51;
  *(unsigned char *)(a2 + 40) = v52;
  *(void *)(a2 + 48) = v53;
  *(unsigned char *)(a2 + 56) = v54;
  *(void *)(a2 + 64) = v55;
  *(void *)(a2 + 72) = v56;
  *(void *)(a2 + 80) = KeyPath;
  *(void *)(a2 + 88) = 1;
  *(unsigned char *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = v31;
  *(void *)(a2 + 112) = v33;
  *(unsigned char *)(a2 + 120) = v35 & 1;
  *(void *)(a2 + 128) = v39;
  *(void *)(a2 + 136) = v57;
  *(unsigned char *)(a2 + 144) = v58;
  *(void *)(a2 + 152) = v59;
  *(unsigned char *)(a2 + 160) = v60;
  *(void *)(a2 + 168) = v61;
  *(void *)(a2 + 176) = v62;
  *(void *)(a2 + 184) = v37;
  *(void *)(a2 + 192) = 1;
  *(unsigned char *)(a2 + 200) = 0;
  sub_10000C29C(v42, v41, v17 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000C29C(v31, v33, v35 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000AB4C(v31, v33, v35 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000AB4C(v42, v41, v17 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B5DC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AB5C(a1);
}

uint64_t sub_10000B620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v116 = a1;
  uint64_t v125 = a2;
  uint64_t v123 = sub_100005EB4(&qword_100069C00) - 8;
  __chkstk_darwin(v123);
  uint64_t v121 = (uint64_t)&v103 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = sub_100005EB4(&qword_100069C08) - 8;
  __chkstk_darwin(v119);
  uint64_t v117 = (uint64_t)&v103 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_100005EB4(&qword_100069C10) - 8;
  uint64_t v4 = __chkstk_darwin(v120);
  uint64_t v124 = (uint64_t)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v118 = (char *)&v103 - v7;
  __chkstk_darwin(v6);
  uint64_t v122 = (uint64_t)&v103 - v8;
  uint64_t v115 = sub_100005EB4(&qword_100069C18) - 8;
  __chkstk_darwin(v115);
  uint64_t v114 = (uint64_t)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v128 = sub_100055160() - 8;
  __chkstk_darwin(v128);
  long long v126 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = sub_100005EB4(&qword_100069C20) - 8;
  __chkstk_darwin(v129);
  uint64_t v127 = (uint64_t)&v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005EB4(&qword_100069C28);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005EB4(&qword_100069C30);
  uint64_t v17 = v16 - 8;
  __chkstk_darwin(v16);
  char v19 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_100005EB4(&qword_100069C38) - 8;
  uint64_t v20 = __chkstk_darwin(v108);
  v107 = (char *)&v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v130 = (uint64_t)&v103 - v22;
  sub_100055310();
  uint64_t v23 = sub_100055530();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_100055500();
  uint64_t v106 = sub_100055520();
  uint64_t v104 = v28;
  char v30 = v29;
  uint64_t v105 = v31;
  swift_release();
  v30 &= 1u;
  sub_10000AB4C(v23, v25, v27);
  swift_bridgeObjectRelease();
  uint64_t v32 = v126;
  uint64_t v33 = &v126[*(int *)(v128 + 28)];
  uint64_t v34 = enum case for RoundedCornerStyle.continuous(_:);
  unsigned int v112 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v111 = sub_100055320();
  uint64_t v35 = *(void *)(v111 - 8);
  v110 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 104);
  uint64_t v113 = v35 + 104;
  v110(v33, v34, v111);
  __asm { FMOV            V0.2D, #4.0 }
  long long v109 = _Q0;
  *uint64_t v32 = _Q0;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v42 = (uint64_t)v32;
  uint64_t v43 = (uint64_t)v32;
  uint64_t v44 = v127;
  sub_10000CED8(v42, v127);
  uint64_t v45 = (uint64_t *)(v44 + *(int *)(v129 + 44));
  uint64_t v46 = v116;
  *uint64_t v45 = KeyPath;
  v45[1] = v46;
  swift_retain();
  sub_10000CF3C(v43);
  sub_100005F44(v44, (uint64_t)v15, &qword_100069C20);
  *(void *)&v15[*(int *)(v13 + 44)] = 0x3FB47AE147AE147BLL;
  sub_100005FA8(v44, &qword_100069C20);
  LOBYTE(KeyPath) = sub_100055490();
  sub_1000550C0();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  sub_100005F44((uint64_t)v15, (uint64_t)v19, &qword_100069C28);
  uint64_t v55 = &v19[*(int *)(v17 + 44)];
  *uint64_t v55 = KeyPath;
  *((void *)v55 + 1) = v48;
  *((void *)v55 + 2) = v50;
  *((void *)v55 + 3) = v52;
  *((void *)v55 + 4) = v54;
  v55[40] = 0;
  sub_100005FA8((uint64_t)v15, &qword_100069C28);
  uint64_t v56 = sub_100055770();
  uint64_t v58 = v57;
  uint64_t v59 = v114;
  sub_100005F44((uint64_t)v19, v114, &qword_100069C30);
  char v60 = (uint64_t *)(v59 + *(int *)(v115 + 44));
  uint64_t *v60 = v56;
  v60[1] = v58;
  uint64_t v61 = (uint64_t)v107;
  sub_100005F44(v59, (uint64_t)&v107[*(int *)(v108 + 44)], &qword_100069C18);
  uint64_t v62 = v106;
  uint64_t v63 = v104;
  *(void *)uint64_t v61 = v106;
  *(void *)(v61 + 8) = v63;
  *(unsigned char *)(v61 + 16) = v30;
  *(void *)(v61 + 24) = v105;
  sub_10000C29C(v62, v63, v30);
  swift_bridgeObjectRetain();
  sub_100005FA8(v59, &qword_100069C18);
  sub_100005FA8((uint64_t)v19, &qword_100069C30);
  sub_10000AB4C(v62, v63, v30);
  swift_bridgeObjectRelease();
  sub_10000D080(v61, v130, &qword_100069C38);
  sub_100055310();
  uint64_t v64 = sub_100055530();
  uint64_t v66 = v65;
  LOBYTE(v25) = v67 & 1;
  sub_100055500();
  uint64_t v68 = sub_100055520();
  uint64_t v70 = v69;
  char v72 = v71;
  uint64_t v74 = v73;
  swift_release();
  LOBYTE(v62) = v72 & 1;
  sub_10000AB4C(v64, v66, v25);
  swift_bridgeObjectRelease();
  uint64_t v75 = v126;
  v110(&v126[*(int *)(v128 + 28)], v112, v111);
  *uint64_t v75 = v109;
  id v76 = [self tertiarySystemFillColor];
  uint64_t v77 = sub_1000556A0();
  uint64_t v78 = swift_getKeyPath();
  uint64_t v79 = v127;
  sub_10000CED8((uint64_t)v75, v127);
  v80 = (uint64_t *)(v79 + *(int *)(v129 + 44));
  uint64_t *v80 = v78;
  v80[1] = v77;
  sub_10000CF3C((uint64_t)v75);
  LOBYTE(v77) = sub_100055490();
  sub_1000550C0();
  uint64_t v82 = v81;
  uint64_t v84 = v83;
  uint64_t v86 = v85;
  uint64_t v88 = v87;
  uint64_t v89 = v117;
  sub_100005F44(v79, v117, &qword_100069C20);
  uint64_t v90 = v89 + *(int *)(v119 + 44);
  *(unsigned char *)uint64_t v90 = v77;
  *(void *)(v90 + 8) = v82;
  *(void *)(v90 + 16) = v84;
  *(void *)(v90 + 24) = v86;
  *(void *)(v90 + 32) = v88;
  *(unsigned char *)(v90 + 40) = 0;
  sub_100005FA8(v79, &qword_100069C20);
  uint64_t v91 = sub_100055770();
  uint64_t v93 = v92;
  uint64_t v94 = v121;
  sub_100005F44(v89, v121, &qword_100069C08);
  v95 = (uint64_t *)(v94 + *(int *)(v123 + 44));
  uint64_t *v95 = v91;
  v95[1] = v93;
  uint64_t v96 = (uint64_t)v118;
  sub_100005F44(v94, (uint64_t)&v118[*(int *)(v120 + 44)], &qword_100069C00);
  *(void *)uint64_t v96 = v68;
  *(void *)(v96 + 8) = v70;
  *(unsigned char *)(v96 + 16) = v62;
  *(void *)(v96 + 24) = v74;
  sub_10000C29C(v68, v70, v62);
  swift_bridgeObjectRetain();
  sub_100005FA8(v94, &qword_100069C00);
  sub_100005FA8(v89, &qword_100069C08);
  sub_10000AB4C(v68, v70, v62);
  swift_bridgeObjectRelease();
  uint64_t v97 = v122;
  sub_10000D080(v96, v122, &qword_100069C10);
  uint64_t v98 = v130;
  sub_100005F44(v130, v61, &qword_100069C38);
  uint64_t v99 = v124;
  sub_100005F44(v97, v124, &qword_100069C10);
  uint64_t v100 = v125;
  sub_100005F44(v61, v125, &qword_100069C38);
  uint64_t v101 = sub_100005EB4(&qword_100069C40);
  sub_100005F44(v99, v100 + *(int *)(v101 + 48), &qword_100069C10);
  sub_100005FA8(v97, &qword_100069C10);
  sub_100005FA8(v98, &qword_100069C38);
  sub_100005FA8(v99, &qword_100069C10);
  return sub_100005FA8(v61, &qword_100069C38);
}

uint64_t sub_10000BFCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  *(void *)a1 = sub_100055360();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v4 = sub_100005EB4(&qword_100069BF8);
  return sub_10000B620(v3, a1 + *(int *)(v4 + 44));
}

uint64_t sub_10000C01C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1000552A0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000C050@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1000552A0();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_10000C084()
{
  return sub_1000552B0();
}

uint64_t sub_10000C0B4()
{
  return sub_1000552B0();
}

unint64_t sub_10000C0E4()
{
  unint64_t result = qword_100069B38;
  if (!qword_100069B38)
  {
    sub_100007D80(&qword_100069B30);
    sub_10000C184();
    sub_10000D120(&qword_100069B50, &qword_100069B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069B38);
  }
  return result;
}

unint64_t sub_10000C184()
{
  unint64_t result = qword_100069B40;
  if (!qword_100069B40)
  {
    sub_100007D80(&qword_100069B48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069B40);
  }
  return result;
}

unint64_t sub_10000C1F8()
{
  unint64_t result = qword_100069B60;
  if (!qword_100069B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069B60);
  }
  return result;
}

uint64_t sub_10000C24C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, char a14)
{
  if ((a14 & 1) == 0)
  {
    sub_10000C29C(a1, a2, a3 & 1);
    swift_bridgeObjectRetain();
  }

  return swift_retain();
}

uint64_t sub_10000C29C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_10000C2AC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, char a14)
{
  if (a14)
  {
    return swift_release();
  }
  else
  {
    sub_10000AB4C(a1, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000C318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000551D0();
  *a1 = result;
  return result;
}

uint64_t sub_10000C344()
{
  return sub_1000551E0();
}

uint64_t sub_10000C370(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = (void *)((char *)&_swiftEmptyArrayStorage + 32);
    uint64_t v25 = v1;
    uint64_t v6 = (uint64_t *)(result + 72);
    while (1)
    {
      uint64_t v7 = *(v6 - 4);
      uint64_t v26 = *(v6 - 5);
      uint64_t v8 = *(v6 - 3);
      uint64_t v10 = *(v6 - 2);
      uint64_t v9 = *(v6 - 1);
      uint64_t v11 = *v6;
      if (v3)
      {
        swift_bridgeObjectRetain();
        uint64_t result = swift_bridgeObjectRetain();
        BOOL v12 = __OFSUB__(v3--, 1);
        if (v12) {
          goto LABEL_28;
        }
      }
      else
      {
        unint64_t v13 = v2[3];
        if ((uint64_t)((v13 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_29;
        }
        int64_t v14 = v13 & 0xFFFFFFFFFFFFFFFELL;
        if (v14 <= 1) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = v14;
        }
        sub_100005EB4(&qword_100069BA8);
        uint64_t v16 = (void *)swift_allocObject();
        uint64_t v17 = (uint64_t)(j__malloc_size(v16) - 32) / 56;
        v16[2] = v15;
        v16[3] = 2 * v17;
        uint64_t v18 = v16 + 4;
        uint64_t v19 = v2[3] >> 1;
        uint64_t v5 = &v16[7 * v19 + 4];
        uint64_t v20 = (v17 & 0x7FFFFFFFFFFFFFFFLL) - v19;
        if (v2[2])
        {
          if (v16 != v2 || v18 >= &v2[7 * v19 + 4]) {
            memmove(v18, v2 + 4, 56 * v19);
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        uint64_t result = swift_release();
        uint64_t v2 = v16;
        uint64_t v1 = v25;
        BOOL v12 = __OFSUB__(v20, 1);
        uint64_t v3 = v20 - 1;
        if (v12)
        {
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
          return result;
        }
      }
      v6 += 6;
      *uint64_t v5 = v4;
      v5[1] = v26;
      v5[2] = v7;
      v5[3] = v8;
      v5[4] = v10;
      v5[5] = v9;
      v5[6] = v11;
      v5 += 7;
      if (v1 == ++v4)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_24;
      }
    }
  }
  uint64_t v3 = 0;
LABEL_24:
  unint64_t v22 = v2[3];
  if (v22 >= 2)
  {
    unint64_t v23 = v22 >> 1;
    BOOL v12 = __OFSUB__(v23, v3);
    uint64_t v24 = v23 - v3;
    if (v12) {
      goto LABEL_30;
    }
    v2[2] = v24;
  }
  return (uint64_t)v2;
}

uint64_t sub_10000C580()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

unint64_t sub_10000C5C0@<X0>(unint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_10000A93C(a1, a2, *(void *)(v3 + 32), a3);
}

uint64_t sub_10000C5CC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

__n128 sub_10000C604@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  void (*v4)(_OWORD *__return_ptr, uint64_t, _OWORD *);
  uint64_t v5;
  long long v6;
  long long v7;
  __n128 result;
  _OWORD v9[4];
  char v10;
  _OWORD v11[3];

  uint64_t v4 = *(void (**)(_OWORD *__return_ptr, uint64_t, _OWORD *))(v2 + 16);
  uint64_t v5 = *a1;
  uint64_t v6 = *(_OWORD *)(a1 + 3);
  v11[0] = *(_OWORD *)(a1 + 1);
  v11[1] = v6;
  v11[2] = *(_OWORD *)(a1 + 5);
  v4(v9, v5, v11);
  uint64_t v7 = v9[3];
  *(_OWORD *)(a2 + 32) = v9[2];
  *(_OWORD *)(a2 + 48) = v7;
  *(unsigned char *)(a2 + 64) = v10;
  uint64_t result = (__n128)v9[1];
  *(_OWORD *)a2 = v9[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t sub_10000C67C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000C6AC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v3 = result;
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = (void *)((char *)&_swiftEmptyArrayStorage + 32);
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (!v4)
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        sub_100005EB4(&qword_100069BB8);
        uint64_t v11 = (void *)swift_allocObject();
        int64_t v12 = j__malloc_size(v11);
        uint64_t v13 = v12 - 32;
        if (v12 < 32) {
          uint64_t v13 = v12 - 17;
        }
        uint64_t v14 = v13 >> 4;
        v11[2] = v10;
        v11[3] = 2 * (v13 >> 4);
        unint64_t v15 = (unint64_t)(v11 + 4);
        uint64_t v16 = v2[3] >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v15 >= (unint64_t)&v2[2 * v16 + 4]) {
            memmove(v11 + 4, v2 + 4, 16 * v16);
          }
          v2[2] = 0;
        }
        uint64_t v6 = (void *)(v15 + 16 * v16);
        uint64_t v4 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        uint64_t result = swift_release();
        uint64_t v2 = v11;
      }
      BOOL v18 = __OFSUB__(v4--, 1);
      if (v18) {
        break;
      }
      *uint64_t v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v4 = 0;
LABEL_23:
  unint64_t v19 = v2[3];
  if (v19 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v20 = v19 >> 1;
  BOOL v18 = __OFSUB__(v20, v4);
  uint64_t v21 = v20 - v4;
  if (!v18)
  {
    v2[2] = v21;
    return (uint64_t)v2;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_10000C828(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = (void *)((char *)&_swiftEmptyArrayStorage + 32);
    uint64_t v33 = v1;
    uint64_t v6 = (uint64_t *)(result + 80);
    while (1)
    {
      uint64_t v7 = *(v6 - 5);
      unint64_t v8 = (void *)*(v6 - 4);
      int64_t v9 = (void *)*(v6 - 3);
      uint64_t v10 = *(v6 - 2);
      uint64_t v11 = *v6;
      uint64_t v34 = *(v6 - 1);
      uint64_t v35 = *(v6 - 6);
      if (v3)
      {
        swift_bridgeObjectRetain();
        id v12 = v8;
        id v13 = v9;
        uint64_t result = swift_bridgeObjectRetain();
        BOOL v14 = __OFSUB__(v3--, 1);
        if (v14) {
          goto LABEL_30;
        }
      }
      else
      {
        unint64_t v15 = v2[3];
        if ((uint64_t)((v15 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_31;
        }
        int64_t v16 = v15 & 0xFFFFFFFFFFFFFFFELL;
        if (v16 <= 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v16;
        }
        sub_100005EB4(&qword_100069BB0);
        BOOL v18 = (void *)swift_allocObject();
        int64_t v19 = j__malloc_size(v18);
        uint64_t v20 = v19 - 32;
        if (v19 < 32) {
          uint64_t v20 = v19 + 31;
        }
        uint64_t v21 = v20 >> 6;
        v18[2] = v17;
        v18[3] = 2 * (v20 >> 6);
        unint64_t v22 = v18 + 4;
        uint64_t v23 = v2[3] >> 1;
        uint64_t v5 = &v18[8 * v23 + 4];
        uint64_t v24 = (v21 & 0x7FFFFFFFFFFFFFFFLL) - v23;
        if (v2[2])
        {
          if (v18 != v2 || v22 >= &v2[8 * v23 + 4]) {
            memmove(v22, v2 + 4, v23 << 6);
          }
          swift_bridgeObjectRetain();
          id v26 = v8;
          id v27 = v9;
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
          id v28 = v8;
          id v29 = v9;
          swift_bridgeObjectRetain();
        }
        uint64_t result = swift_release();
        uint64_t v2 = v18;
        uint64_t v1 = v33;
        BOOL v14 = __OFSUB__(v24, 1);
        uint64_t v3 = v24 - 1;
        if (v14)
        {
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
          return result;
        }
      }
      v6 += 7;
      *uint64_t v5 = v4;
      v5[1] = v35;
      v5[2] = v7;
      v5[3] = v8;
      v5[4] = v9;
      v5[5] = v10;
      v5[6] = v34;
      v5[7] = v11;
      v5 += 8;
      if (v1 == ++v4)
      {
        uint64_t result = swift_bridgeObjectRelease();
        goto LABEL_26;
      }
    }
  }
  uint64_t v3 = 0;
LABEL_26:
  unint64_t v30 = v2[3];
  if (v30 >= 2)
  {
    unint64_t v31 = v30 >> 1;
    BOOL v14 = __OFSUB__(v31, v3);
    uint64_t v32 = v31 - v3;
    if (v14) {
      goto LABEL_32;
    }
    v2[2] = v32;
  }
  return (uint64_t)v2;
}

ValueMetadata *type metadata accessor for LabelPlaceholderView()
{
  return &type metadata for LabelPlaceholderView;
}

uint64_t initializeBufferWithCopyOfBuffer for MostUsedItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LabelView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for LabelView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for LabelView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MostUsedItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for LabelView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MostUsedItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MostUsedItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LabelView()
{
  return &type metadata for LabelView;
}

uint64_t sub_10000CCC8()
{
  return sub_10000D120(&qword_100069BC0, &qword_100069BC8);
}

unint64_t sub_10000CD08()
{
  unint64_t result = qword_100069BD0;
  if (!qword_100069BD0)
  {
    sub_100007D80(&qword_100069BA0);
    sub_10000CDA8();
    sub_10000D120(&qword_100069BE8, &qword_100069BF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BD0);
  }
  return result;
}

unint64_t sub_10000CDA8()
{
  unint64_t result = qword_100069BD8;
  if (!qword_100069BD8)
  {
    sub_100007D80(&qword_100069B70);
    sub_10000D120(&qword_100069BE0, &qword_100069B68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069BD8);
  }
  return result;
}

uint64_t sub_10000CE48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CE64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000CE80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000551D0();
  *a1 = result;
  return result;
}

uint64_t sub_10000CEAC()
{
  return sub_1000551E0();
}

uint64_t sub_10000CED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100055160();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CF3C(uint64_t a1)
{
  uint64_t v2 = sub_100055160();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000CF98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 136);
  char v4 = *(unsigned char *)(a1 + 144);
  sub_10000AB4C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000AB4C(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_10000D02C()
{
  unint64_t result = qword_100069C68;
  if (!qword_100069C68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C68);
  }
  return result;
}

uint64_t sub_10000D080(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005EB4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D0E4()
{
  return sub_10000D120(&qword_100069C70, &qword_100069C78);
}

uint64_t sub_10000D120(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007D80(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000D168()
{
  unint64_t result = qword_100069C80;
  if (!qword_100069C80)
  {
    sub_100007D80(&qword_100069C50);
    sub_100007D80(&qword_100069C58);
    sub_10000D120(&qword_100069C60, &qword_100069C58);
    swift_getOpaqueTypeConformance2();
    sub_10000D244();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C80);
  }
  return result;
}

unint64_t sub_10000D244()
{
  unint64_t result = qword_100069C88;
  if (!qword_100069C88)
  {
    sub_100055420();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069C88);
  }
  return result;
}

uint64_t *sub_10000D2A0(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_100054A10();
    id v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return a1;
}

uint64_t sub_10000D41C(uint64_t a1, uint64_t a2)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_100054A10();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

void *sub_10000D4FC(void *a1, void *a2, uint64_t a3)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100055880();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100054A10();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  return a1;
}

void *sub_10000D628(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_100054A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

char *sub_10000D764(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100055880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100054A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

char *sub_10000D87C(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    uint64_t v6 = sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100054A10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10000D9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D9CC);
}

uint64_t sub_10000D9CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C98);
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
    uint64_t v11 = sub_100054A10();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_10000DAFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000DB10);
}

uint64_t sub_10000DB10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005EB4(&qword_100069C98);
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
    uint64_t v11 = sub_100054A10();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for ScreenTimeWidgetGraph()
{
  uint64_t result = qword_100069CF8;
  if (!qword_100069CF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000DC8C()
{
  sub_10000DD60();
  if (v0 <= 0x3F)
  {
    sub_100054A10();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000DD60()
{
  if (!qword_100069D08)
  {
    sub_100055880();
    unint64_t v0 = sub_1000550F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100069D08);
    }
  }
}

uint64_t sub_10000DDB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000DDD4()
{
  sub_100005EB4(&qword_100069EE0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100057270;
  uint64_t v1 = self;
  id v2 = [v1 systemBlueColor];
  *(void *)(v0 + 32) = sub_1000556A0();
  id v3 = [v1 systemTealColor];
  *(void *)(v0 + 40) = sub_1000556A0();
  id v4 = [v1 systemOrangeColor];
  *(void *)(v0 + 48) = sub_1000556A0();
  id v5 = [v1 systemGray3Color];
  *(void *)(v0 + 56) = sub_1000556A0();
  uint64_t result = sub_100055B70();
  qword_10006D110 = v0;
  return result;
}

double sub_10000DEC4()
{
  uint64_t v1 = type metadata accessor for HourlyUsage();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  id v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + *(int *)(type metadata accessor for ScreenTimeWidgetGraph() + 20));
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6) {
    return 0.0;
  }
  uint64_t v7 = v5 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v8 = *(void *)(v2 + 72);
  swift_bridgeObjectRetain();
  double v9 = 0.0;
  do
  {
    sub_100012624(v7, (uint64_t)v4, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
    uint64_t v10 = *(int *)(v1 + 20);
    if (v9 <= *(double *)&v4[v10]) {
      double v9 = *(double *)&v4[v10];
    }
    sub_10001268C((uint64_t)v4);
    v7 += v8;
    --v6;
  }
  while (v6);
  swift_bridgeObjectRelease();
  return v9;
}

void *sub_10000E004(double a1, double a2, double a3)
{
  uint64_t v6 = sub_1000125B0(a1, a2, a3);
  uint64_t result = (void *)sub_10002A1E8(0, v6 & ~(v6 >> 63), 0);
  if (v6 < 0) {
    goto LABEL_30;
  }
  uint64_t result = &_swiftEmptyArrayStorage;
  char v8 = 0;
  uint64_t v9 = 0;
  if (!v6)
  {
    double v12 = a1;
    goto LABEL_16;
  }
  double v10 = a1;
  do
  {
    BOOL v11 = v10 <= a2;
    if (a3 > 0.0) {
      BOOL v11 = v10 >= a2;
    }
    if (v11)
    {
      if (v8 & 1 | (v10 != a2)) {
        goto LABEL_28;
      }
      char v8 = 1;
      double v12 = v10;
    }
    else
    {
      BOOL v13 = __OFADD__(v9++, 1);
      if (v13) {
        goto LABEL_29;
      }
      double v12 = a1 + (double)v9 * a3;
    }
    uint64_t v20 = result;
    unint64_t v15 = result[2];
    unint64_t v14 = result[3];
    if (v15 >= v14 >> 1)
    {
      sub_10002A1E8(v14 > 1, v15 + 1, 1);
      uint64_t result = v20;
    }
    result[2] = v15 + 1;
    *(double *)&result[v15 + 4] = v10;
    double v10 = v12;
    --v6;
  }
  while (v6);
  while (1)
  {
LABEL_16:
    BOOL v16 = v12 <= a2;
    if (a3 > 0.0) {
      BOOL v16 = v12 >= a2;
    }
    if (!v16) {
      break;
    }
    if ((v12 != a2) | v8 & 1) {
      return result;
    }
    char v8 = 1;
    double v17 = v12;
LABEL_23:
    uint64_t v21 = result;
    unint64_t v19 = result[2];
    unint64_t v18 = result[3];
    if (v19 >= v18 >> 1)
    {
      sub_10002A1E8(v18 > 1, v19 + 1, 1);
      uint64_t result = v21;
    }
    result[2] = v19 + 1;
    *(double *)&result[v19 + 4] = v12;
    double v12 = v17;
  }
  BOOL v13 = __OFADD__(v9++, 1);
  if (!v13)
  {
    double v17 = a1 + (double)v9 * a3;
    goto LABEL_23;
  }
  __break(1u);
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000E1EC@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v20 = a1;
  uint64_t v3 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v4 = v3 - 8;
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v19 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = sub_100054CD0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (void (**)(unint64_t, char *, uint64_t))((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100005EB4(&qword_100069D40);
  sub_100054C10();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_100056C10;
  uint64_t v11 = v2 + *(int *)(v4 + 32);
  sub_100054A00();
  sub_1000549E0();
  sub_100054C90();
  unint64_t v12 = sub_10000E49C(v11, v9);
  (*(void (**)(void (**)(unint64_t, char *, uint64_t), uint64_t))(v7 + 8))(v9, v6);
  sub_100012624(v2, (uint64_t)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  unint64_t v13 = (*(unsigned __int8 *)(v19 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v14 = (v13 + v5 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v15 = swift_allocObject();
  uint64_t result = sub_100012B34((uint64_t)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v13, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  unint64_t v17 = v15 + ((v13 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v17 = 0x4018000000000000;
  *(unsigned char *)(v17 + 8) = 0;
  *(void *)(v15 + v14) = v10;
  *(void *)(v15 + ((v14 + 15) & 0xFFFFFFFFFFFFFFF8)) = v12;
  unint64_t v18 = v20;
  *uint64_t v20 = sub_100011E68;
  v18[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v15;
  return result;
}

unint64_t sub_10000E49C(uint64_t a1, void (**a2)(unint64_t, char *, uint64_t))
{
  uint64_t v100 = a2;
  uint64_t v87 = sub_100054C60();
  uint64_t v86 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  uint64_t v85 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_100054C70();
  uint64_t v84 = *(void *)(v95 - 8);
  __chkstk_darwin(v95);
  uint64_t v83 = (char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = sub_100054C50();
  uint64_t v82 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v81 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005EB4(&qword_100069EE8);
  __chkstk_darwin(v6 - 8);
  uint64_t v78 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005EB4(&qword_100069EF0);
  __chkstk_darwin(v8 - 8);
  uint64_t v77 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100054A30();
  uint64_t v79 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v93 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v11 - 8);
  uint64_t v97 = (uint64_t)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = sub_100054CB0();
  uint64_t v13 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  uint64_t v91 = (char *)&v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100054C10();
  uint64_t v99 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v108 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v105 = (char *)&v75 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v104 = (char *)&v75 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v75 = (char *)&v75 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  id v76 = (char *)&v75 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  id v29 = (char *)&v75 - v28;
  __chkstk_darwin(v27);
  unint64_t v31 = (char *)&v75 - v30;
  uint64_t v96 = a1;
  sub_100054A00();
  sub_100005EB4(&qword_100069D40);
  uint64_t v32 = v31;
  unint64_t v33 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v102 = *(void *)(v16 + 72);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_100056C20;
  unint64_t v101 = v33;
  unint64_t v109 = v34;
  uint64_t v103 = *(void (**)(unint64_t, char *, uint64_t))(v16 + 16);
  v103(v34 + v33, v32, v15);
  unsigned int v89 = enum case for Calendar.Component.hour(_:);
  uint64_t v35 = v13;
  uint64_t v88 = *(void (**)(char *))(v13 + 104);
  uint64_t v36 = v91;
  v88(v91);
  sub_100054A00();
  uint64_t v90 = sub_100054CC0();
  uint64_t v92 = v16;
  uint64_t v37 = *(void (**)(char *, uint64_t))(v16 + 8);
  v37(v29, v99);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v35 + 8);
  uint64_t v39 = v98;
  v38(v36, v98);
  ((void (*)(char *, void, uint64_t))v88)(v36, v89, v39);
  sub_1000549E0();
  uint64_t v40 = v90 | sub_100054CC0();
  v37(v29, v99);
  v38(v36, v98);
  uint64_t v106 = v16 + 8;
  v107 = v37;
  if (v40)
  {
    uint64_t v41 = (void (*)(char *, char *, uint64_t))v103;
    uint64_t v42 = v92;
    unint64_t v43 = v109;
  }
  else
  {
    uint64_t v98 = v16 + 16;
    sub_100054A00();
    uint64_t v44 = sub_100054CD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v77, 1, 1, v44);
    uint64_t v45 = sub_100054CE0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v78, 1, 1, v45);
    sub_100054A20();
    uint64_t v46 = v82;
    uint64_t v47 = v81;
    (*(void (**)(char *, void, uint64_t))(v82 + 104))(v81, enum case for Calendar.MatchingPolicy.nextTime(_:), v94);
    uint64_t v48 = v84;
    uint64_t v49 = v83;
    (*(void (**)(char *, void, uint64_t))(v84 + 104))(v83, enum case for Calendar.RepeatedTimePolicy.first(_:), v95);
    uint64_t v50 = v86;
    uint64_t v51 = v85;
    uint64_t v52 = v87;
    (*(void (**)(char *, void, uint64_t))(v86 + 104))(v85, enum case for Calendar.SearchDirection.forward(_:), v87);
    sub_100054CA0();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
    (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v95);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v94);
    (*(void (**)(char *, uint64_t))(v79 + 8))(v93, v80);
    uint64_t v53 = v99;
    v107(v29, v99);
    uint64_t v42 = v92;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v92 + 48))(v97, 1, v53) == 1)
    {
      sub_100005FA8(v97, &qword_100069950);
      uint64_t v41 = (void (*)(char *, char *, uint64_t))v103;
      unint64_t v43 = v109;
    }
    else
    {
      uint64_t v54 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 32);
      uint64_t v55 = v76;
      v54(v76, v97, v53);
      uint64_t v56 = v75;
      uint64_t v41 = (void (*)(char *, char *, uint64_t))v103;
      v103((unint64_t)v75, v55, v53);
      unint64_t v58 = *(void *)(v109 + 16);
      unint64_t v57 = *(void *)(v109 + 24);
      uint64_t v100 = (void (**)(unint64_t, char *, uint64_t))(v58 + 1);
      if (v58 >= v57 >> 1) {
        unint64_t v109 = sub_10002941C(v57 > 1, (int64_t)v100, 1, v109);
      }
      unint64_t v59 = v109;
      *(void *)(v109 + 16) = v100;
      unint64_t v60 = v59 + v101 + v58 * v102;
      uint64_t v61 = v56;
      unint64_t v43 = v59;
      uint64_t v62 = v99;
      v54((char *)v60, (uint64_t)v61, v99);
      v107(v32, v62);
      v54(v32, (uint64_t)v55, v62);
    }
  }
  unint64_t v109 = v43;
  uint64_t v100 = (void (**)(unint64_t, char *, uint64_t))(v42 + 32);
  uint64_t v63 = v99;
  uint64_t v64 = v107;
  v41(v29, v32, v99);
  while (1)
  {
    uint64_t v65 = v105;
    sub_1000549E0();
    uint64_t v66 = v41;
    char v67 = v29;
    uint64_t v68 = v104;
    sub_100054BA0();
    v64(v65, v63);
    char v69 = sub_100054B90();
    uint64_t v70 = v68;
    id v29 = v67;
    v64(v70, v63);
    v64(v67, v63);
    if ((v69 & 1) == 0) {
      break;
    }
    sub_100054BD0();
    v66(v108, v32, v63);
    uint64_t v71 = v109;
    unint64_t v73 = *(void *)(v109 + 16);
    unint64_t v72 = *(void *)(v109 + 24);
    if (v73 >= v72 >> 1) {
      uint64_t v71 = sub_10002941C(v72 > 1, v73 + 1, 1, v109);
    }
    *(void *)(v71 + 16) = v73 + 1;
    unint64_t v109 = v71;
    (*v100)(v71 + v101 + v73 * v102, v108, v63);
    uint64_t v41 = (void (*)(char *, char *, uint64_t))v103;
    v103((unint64_t)v29, v32, v63);
  }
  v107(v32, v63);
  return v109;
}

uint64_t sub_10000F09C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v89 = a6;
  uint64_t v84 = a5;
  uint64_t v93 = a1;
  uint64_t v94 = a7;
  uint64_t v92 = sub_1000551A0();
  uint64_t v91 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v90 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005EB4(&qword_100069D48);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005EB4(&qword_100069D50);
  uint64_t v70 = *(uint64_t **)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100005EB4(&qword_100069D58);
  uint64_t v73 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_100005EB4(&qword_100069D60);
  uint64_t v77 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  char v69 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_100005EB4(&qword_100069D68);
  uint64_t v81 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  uint64_t v71 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100005EB4(&qword_100069D70);
  uint64_t v83 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v74 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100005EB4(&qword_100069D78);
  uint64_t v85 = *(void *)(v87 - 8);
  __chkstk_darwin(v87);
  id v76 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_100005EB4(&qword_100069D80) - 8;
  __chkstk_darwin(v79);
  uint64_t v78 = (char *)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_100005EB4(&qword_100069D88) - 8;
  __chkstk_darwin(v88);
  uint64_t v86 = (uint64_t)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = a2;
  uint64_t v98 = a3;
  char v99 = a4;
  sub_100005EB4(&qword_100069D90);
  sub_100011F40();
  sub_100054FF0();
  sub_100005EB4(&qword_100069DD0);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100056C10;
  *(void *)(v25 + 32) = 0;
  if (sub_10000DEC4() > 3600.0) {
    double v26 = 7200.0;
  }
  else {
    double v26 = 3600.0;
  }
  double v27 = v26 * ceil(sub_10000DEC4() / v26);
  if (v27 <= v26) {
    double v27 = v26;
  }
  *(double *)(v25 + 40) = v27;
  *(void *)&long long v101 = v25;
  uint64_t v28 = sub_1000550B0();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v66 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
  uint64_t v67 = v29 + 56;
  v66(v13, 1, 1, v28);
  uint64_t v30 = sub_100005EB4(&qword_100069DD8);
  uint64_t v31 = sub_10000D120(&qword_100069DE0, &qword_100069D50);
  uint64_t v68 = &protocol conformance descriptor for <A> [A];
  uint64_t v32 = sub_100012550(&qword_100069DE8, &qword_100069DD8);
  sub_100055590();
  sub_100005FA8((uint64_t)v13, &qword_100069D48);
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t))v70[1])(v16, v14);
  uint64_t v70 = &v65;
  uint64_t v96 = a2;
  uint64_t v33 = sub_100005EB4(&qword_100069DF0);
  *(void *)&long long v101 = v14;
  *((void *)&v101 + 1) = v30;
  *(void *)&long long v102 = v31;
  *((void *)&v102 + 1) = v32;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v35 = sub_10000D120(&qword_100069DF8, &qword_100069DF0);
  uint64_t v36 = v69;
  uint64_t v37 = v72;
  sub_100055560();
  (*(void (**)(char *, uint64_t))(v73 + 8))(v18, v37);
  uint64_t v100 = v84;
  v66(v13, 1, 1, v28);
  uint64_t v38 = sub_100005EB4(&qword_100069E00);
  *(void *)&long long v101 = v37;
  *((void *)&v101 + 1) = v33;
  *(void *)&long long v102 = OpaqueTypeConformance2;
  *((void *)&v102 + 1) = v35;
  uint64_t v39 = swift_getOpaqueTypeConformance2();
  uint64_t v40 = sub_100012550(&qword_100069E08, &qword_100069E00);
  uint64_t v41 = v71;
  uint64_t v42 = v75;
  sub_100055580();
  sub_100005FA8((uint64_t)v13, &qword_100069D48);
  unint64_t v43 = v36;
  uint64_t v44 = v42;
  (*(void (**)(char *, uint64_t))(v77 + 8))(v43, v42);
  uint64_t v95 = v89;
  uint64_t v45 = sub_100005EB4(&qword_100069E10);
  *(void *)&long long v101 = v44;
  *((void *)&v101 + 1) = v38;
  *(void *)&long long v102 = v39;
  *((void *)&v102 + 1) = v40;
  uint64_t v46 = swift_getOpaqueTypeConformance2();
  uint64_t v47 = sub_10000D120(&qword_100069E18, &qword_100069E10);
  uint64_t v48 = v74;
  uint64_t v49 = v80;
  sub_100055550();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v41, v49);
  *(void *)&long long v101 = v49;
  *((void *)&v101 + 1) = v45;
  *(void *)&long long v102 = v46;
  *((void *)&v102 + 1) = v47;
  swift_getOpaqueTypeConformance2();
  uint64_t v50 = v76;
  uint64_t v51 = v82;
  sub_100055570();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v48, v51);
  uint64_t v52 = v90;
  sub_100055180();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v54 = (uint64_t)v78;
  uint64_t v55 = (uint64_t *)&v78[*(int *)(v79 + 44)];
  uint64_t v56 = sub_100005EB4(&qword_100069E20);
  uint64_t v57 = v91;
  uint64_t v58 = v92;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))((char *)v55 + *(int *)(v56 + 28), v52, v92);
  *uint64_t v55 = KeyPath;
  uint64_t v59 = v85;
  uint64_t v60 = v87;
  (*(void (**)(uint64_t, char *, uint64_t))(v85 + 16))(v54, v50, v87);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v52, v58);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v50, v60);
  sub_100055110();
  sub_100055110();
  sub_100055770();
  sub_100055100();
  uint64_t v61 = v86;
  sub_10001213C(v54, v86);
  uint64_t v62 = (_OWORD *)(v61 + *(int *)(v88 + 44));
  long long v63 = v102;
  *uint64_t v62 = v101;
  v62[1] = v63;
  v62[2] = v103;
  sub_100005FA8(v54, &qword_100069D80);
  return sub_1000121A4(v61, v94);
}

uint64_t sub_10000FC50(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  v12[1] = *(void *)(a1 + *(int *)(__chkstk_darwin(v6 - 8) + 28));
  sub_100012624(a1, (uint64_t)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  unint64_t v9 = (*(unsigned __int8 *)(v7 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(unsigned char *)(v10 + 24) = a3;
  sub_100012B34((uint64_t)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v10 + v9, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  swift_bridgeObjectRetain();
  sub_100005EB4(&qword_100069E90);
  sub_100054A10();
  sub_100005EB4(&qword_100069DA8);
  sub_10000D120(&qword_100069E98, &qword_100069E90);
  sub_100011FB4();
  sub_100012D14(&qword_100069EA0, (void (*)(uint64_t))type metadata accessor for HourlyUsage);
  return sub_100055700();
}

uint64_t sub_10000FE5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  int v31 = a3;
  uint64_t v30 = a2;
  uint64_t v33 = a5;
  uint64_t v7 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = type metadata accessor for HourlyUsage();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_10000C6AC(v14);
  swift_bridgeObjectRelease();
  uint64_t v38 = v15;
  uint64_t KeyPath = swift_getKeyPath();
  sub_100012624(a1, (uint64_t)v13, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
  sub_100012624(a4, (uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  unint64_t v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v17 = (v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v18 = (*(unsigned __int8 *)(v8 + 80) + v17 + 9) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v19 = swift_allocObject();
  sub_100012B34((uint64_t)v13, v19 + v16, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
  unint64_t v20 = v19 + v17;
  *(void *)unint64_t v20 = v30;
  *(unsigned char *)(v20 + 8) = v31;
  sub_100012B34((uint64_t)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_100012B9C;
  *(void *)(v21 + 24) = v19;
  sub_100005EB4(&qword_100069EB0);
  sub_100005EB4(&qword_100069EB8);
  sub_10000D120(&qword_100069EC0, &qword_100069EB0);
  uint64_t v22 = sub_100007D80(&qword_100069DB0);
  uint64_t v23 = sub_100007D80(&qword_100069DB8);
  uint64_t v34 = sub_100055010();
  uint64_t v35 = &type metadata for Color;
  uint64_t v36 = &protocol witness table for BarMark;
  uint64_t v37 = &protocol witness table for Color;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v25 = sub_100007D80(&qword_100069DC0);
  uint64_t v26 = sub_10000D120(&qword_100069DC8, &qword_100069DC0);
  uint64_t v34 = v25;
  uint64_t v35 = (void *)v26;
  uint64_t v27 = swift_getOpaqueTypeConformance2();
  uint64_t v34 = v22;
  uint64_t v35 = (void *)v23;
  uint64_t v36 = (void *)OpaqueTypeConformance2;
  uint64_t v37 = (void *)v27;
  swift_getOpaqueTypeConformance2();
  return sub_100055710();
}

uint64_t sub_100010230@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v32 = a5;
  uint64_t v33 = a6;
  int v36 = a4;
  uint64_t v35 = a3;
  unint64_t v37 = a1;
  uint64_t v9 = sub_100005EB4(&qword_100069EC8);
  __chkstk_darwin(v9 - 8);
  uint64_t v34 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005EB4(&qword_100069ED0);
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_100055010();
  uint64_t v27 = *(void *)(v12 - 8);
  uint64_t v28 = v12;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(&qword_100069DB0);
  uint64_t v30 = *(void *)(v15 - 8);
  uint64_t v31 = v15;
  __chkstk_darwin(v15);
  uint64_t v29 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100055310();
  uint64_t v17 = type metadata accessor for HourlyUsage();
  sub_100054C10();
  sub_100012D14(&qword_100069ED8, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_100054F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100055310();
  double v38 = *(double *)(a2 + *(int *)(v17 + 20)) * a7;
  sub_100054F70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = sub_100055000();
  if (qword_1000698E0 == -1)
  {
    unint64_t v19 = v37;
    if ((v37 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t result = swift_once();
  unint64_t v19 = v37;
  if ((v37 & 0x8000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (*(void *)(qword_10006D110 + 16) > v19)
  {
    double v38 = *(double *)(qword_10006D110 + 8 * v19 + 32);
    double v21 = *(double *)&v28;
    unint64_t v20 = v29;
    sub_100054ED0();
    uint64_t v22 = (*(uint64_t (**)(char *, double))(v27 + 8))(v14, COERCE_DOUBLE(*(void *)&v21));
    __chkstk_darwin(v22);
    sub_100005EB4(&qword_100069DB8);
    double v38 = v21;
    uint64_t v39 = &type metadata for Color;
    uint64_t v40 = &protocol witness table for BarMark;
    uint64_t v41 = &protocol witness table for Color;
    swift_getOpaqueTypeConformance2();
    *(double *)&uint64_t v23 = COERCE_DOUBLE(sub_100007D80(&qword_100069DC0));
    uint64_t v24 = sub_10000D120(&qword_100069DC8, &qword_100069DC0);
    double v38 = *(double *)&v23;
    uint64_t v39 = (void *)v24;
    swift_getOpaqueTypeConformance2();
    uint64_t v25 = v31;
    sub_100054EE0();
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v20, v25);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100010754()
{
  uint64_t v0 = sub_100055880();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v9 - v5;
  sub_10005228C((uint64_t)&v9 - v5);
  sub_100055870();
  sub_100055860();
  uint64_t v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v4, v0);
  v7(v6, v0);
  sub_100005EB4(&qword_100069DC0);
  sub_10000D120(&qword_100069DC8, &qword_100069DC0);
  return sub_1000555A0();
}

void sub_1000108CC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100054F90();
  __chkstk_darwin(v4 - 8);
  uint64_t v5 = sub_100054F30();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = sub_100005EB4(&qword_100069DF0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000DEC4() > 3600.0) {
    double v13 = 7200.0;
  }
  else {
    double v13 = 3600.0;
  }
  double v14 = v13 * ceil(sub_10000DEC4() / v13);
  if (v14 > v13) {
    double v15 = v14;
  }
  else {
    double v15 = v13;
  }
  if (v15 * 0.5 == 0.0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v19 = v9;
    sub_10000E004(0.0, v15, v15 * 0.5);
    uint64_t v18 = a2;
    sub_100012624(a1, (uint64_t)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
    unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v17 = swift_allocObject();
    sub_100012B34((uint64_t)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
    sub_100054F20();
    sub_100054F80();
    sub_100005EB4(&qword_100069E58);
    sub_1000124A0();
    sub_100055090();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v18, v12, v19);
  }
}

uint64_t sub_100010BE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a3;
  uint64_t v41 = sub_100005EB4(&qword_100069E78) - 8;
  __chkstk_darwin(v41);
  uint64_t v40 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100054EC0();
  uint64_t v35 = *(void *)(v39 - 8);
  uint64_t v6 = v35;
  uint64_t v7 = __chkstk_darwin(v39);
  unint64_t v43 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = sub_100054FB0();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_100054FE0();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_100005EB4(&qword_100069E70);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v34 - v18;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  sub_100054FD0();
  sub_100054FA0();
  sub_100005EB4(&qword_100069E80);
  sub_100012550(&qword_100069E88, &qword_100069E80);
  double v38 = v19;
  sub_100054F50();
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  int v36 = v10;
  sub_100054EB0();
  unint64_t v20 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  unint64_t v37 = v17;
  v20(v17, v19, v13);
  double v21 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v22 = v43;
  uint64_t v23 = v10;
  uint64_t v24 = v39;
  v21(v43, v23, v39);
  sub_10000D120(&qword_100069E68, &qword_100069E70);
  uint64_t v25 = v40;
  v20(v40, v17, v13);
  uint64_t v26 = v41;
  uint64_t v27 = &v25[*(int *)(v41 + 56)];
  v21(v27, v22, v24);
  uint64_t v28 = v42;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v42, v25, v13);
  uint64_t v29 = v28 + *(int *)(v26 + 56);
  uint64_t v30 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v29, v27, v24);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v30 + 8);
  v31(v36, v24);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v14 + 8);
  v32(v38, v13);
  v31(v43, v24);
  return ((uint64_t (*)(char *, uint64_t))v32)(v37, v13);
}

uint64_t sub_100011080@<X0>(uint64_t *a1@<X8>)
{
  sub_1000550A0();
  if (v18)
  {
    uint64_t result = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    double v6 = sub_10000DEC4();
    double v7 = sub_10000DEC4();
    if (v17 != 0.0)
    {
      double v8 = 7200.0;
      if (v6 <= 3600.0) {
        double v8 = 3600.0;
      }
      double v9 = v8 * ceil(v7 / v8);
      if (v9 > v8) {
        double v10 = v9;
      }
      else {
        double v10 = v8;
      }
      id v11 = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
      uint64_t v12 = v11;
      if (v10 > 3600.0) {
        uint64_t v13 = 32;
      }
      else {
        uint64_t v13 = 64;
      }
      [v11 setAllowedUnits:v13];
      [v12 setUnitsStyle:1];
      id v14 = [v12 stringFromTimeInterval:v17];
      if (v14)
      {
        uint64_t v15 = v14;
        sub_100055A10();
      }
      else
      {
      }
    }
    sub_10000D02C();
    uint64_t result = sub_100055540();
    uint64_t v4 = v16 & 1;
  }
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_100011220@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005EB4(&qword_100069E50);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  double v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100005EB4(&qword_100069E40);
  sub_10000D120(&qword_100069E38, &qword_100069E40);
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(char *, void, uint64_t))(v9 + 16))(v7, *a1, v8);
  uint64_t v10 = sub_100054EC0();
  char v18 = &v7[*(int *)(v5 + 56)];
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(void))(v11 + 16))();
  uint64_t v12 = sub_100055050();
  uint64_t v13 = &v7[*(int *)(v5 + 72)];
  uint64_t v14 = a1[2];
  uint64_t v15 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, v14, v12);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v7, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2 + *(int *)(v5 + 56), v18, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a2 + *(int *)(v5 + 72), v13, v12);
}

uint64_t sub_100011458()
{
  uint64_t v0 = sub_100054F90();
  __chkstk_darwin(v0 - 8);
  uint64_t v1 = sub_100054F30();
  __chkstk_darwin(v1 - 8);
  swift_bridgeObjectRetain();
  sub_100054F20();
  sub_100054F80();
  sub_100005EB4(&qword_100069E28);
  sub_100054C10();
  sub_10001220C();
  return sub_100055090();
}

uint64_t sub_100011598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v65 = a1;
  uint64_t v1 = sub_100055030();
  __chkstk_darwin(v1 - 8);
  uint64_t v61 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100055050();
  uint64_t v63 = *(void *)(v3 - 8);
  uint64_t v64 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v62 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v59 = (char *)&v49 - v6;
  uint64_t v60 = sub_100054EC0();
  uint64_t v57 = *(void *)(v60 - 8);
  uint64_t v7 = __chkstk_darwin(v60);
  uint64_t v67 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v58 = (char *)&v49 - v9;
  uint64_t v10 = sub_100054FB0();
  __chkstk_darwin(v10 - 8);
  uint64_t v56 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100054FE0();
  __chkstk_darwin(v12 - 8);
  uint64_t v55 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100054B40();
  uint64_t v14 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  char v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = sub_100054B50();
  uint64_t v17 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  uint64_t v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100054B60();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v66 = sub_100005EB4(&qword_100069E40);
  uint64_t v54 = *(void *)(v66 - 8);
  uint64_t v25 = __chkstk_darwin(v66);
  uint64_t v27 = (char *)&v49 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v49 - v28;
  sub_1000549B0();
  sub_100054B30();
  sub_100054B20();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v53);
  sub_100054B10();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v52);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
  sub_100054FC0();
  sub_100054FA0();
  sub_100012D14(&qword_100069E48, (void (*)(uint64_t))&type metadata accessor for Date.FormatStyle);
  uint64_t v30 = v29;
  uint64_t v50 = v29;
  sub_100054F40();
  uint64_t v71 = 0;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v31 = v58;
  sub_100054EB0();
  sub_100055020();
  uint64_t v32 = v59;
  sub_100055040();
  uint64_t v33 = v54;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  uint64_t v51 = v27;
  v34(v27, v30, v66);
  v68[0] = v27;
  uint64_t v35 = v57;
  int v36 = v67;
  unint64_t v37 = v31;
  uint64_t v38 = v60;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v67, v31, v60);
  v68[1] = v36;
  uint64_t v40 = v62;
  uint64_t v39 = v63;
  uint64_t v41 = v64;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v62, v32, v64);
  v68[2] = v40;
  sub_100011220(v68, v65);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v39 + 8);
  unint64_t v43 = v32;
  uint64_t v44 = v41;
  v42(v43, v41);
  uint64_t v45 = *(void (**)(char *, uint64_t))(v35 + 8);
  v45(v37, v38);
  long long v46 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v47 = v66;
  v46(v50, v66);
  v42(v40, v44);
  v45(v67, v38);
  return ((uint64_t (*)(char *, uint64_t))v46)(v51, v47);
}

uint64_t sub_100011CDC()
{
  uint64_t v1 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v7 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, ((((v4 + v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_100011E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ScreenTimeWidgetGraph() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = v6 + *(void *)(v5 + 64);
  unint64_t v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v9 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)(v2 + v8);
  uint64_t v11 = *(void *)(v2 + v9);
  uint64_t v12 = *(void *)(v2 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8));
  char v13 = *(unsigned char *)(v2 + v8 + 8);

  return sub_10000F09C(a1, v2 + v6, v10, v13, v11, v12, a2);
}

uint64_t sub_100011F34()
{
  return sub_10000FC50(*(void *)(v0 + 16), *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

unint64_t sub_100011F40()
{
  unint64_t result = qword_100069D98;
  if (!qword_100069D98)
  {
    sub_100007D80(&qword_100069D90);
    sub_100011FB4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069D98);
  }
  return result;
}

unint64_t sub_100011FB4()
{
  unint64_t result = qword_100069DA0;
  if (!qword_100069DA0)
  {
    sub_100007D80(&qword_100069DA8);
    sub_100007D80(&qword_100069DB0);
    sub_100007D80(&qword_100069DB8);
    sub_100055010();
    swift_getOpaqueTypeConformance2();
    sub_100007D80(&qword_100069DC0);
    sub_10000D120(&qword_100069DC8, &qword_100069DC0);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069DA0);
  }
  return result;
}

void sub_100012124(uint64_t a1@<X8>)
{
  sub_1000108CC(*(void *)(v1 + 16), a1);
}

uint64_t sub_10001212C()
{
  return sub_100011458();
}

uint64_t sub_10001213C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EB4(&qword_100069D80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000121A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EB4(&qword_100069D88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001220C()
{
  unint64_t result = qword_100069E30;
  if (!qword_100069E30)
  {
    sub_100007D80(&qword_100069E28);
    sub_10000D120(&qword_100069E38, &qword_100069E40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069E30);
  }
  return result;
}

uint64_t sub_1000122C0()
{
  uint64_t v1 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v7 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100012420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ScreenTimeWidgetGraph() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_100010BE0(a1, v6, a2);
}

unint64_t sub_1000124A0()
{
  unint64_t result = qword_100069E60;
  if (!qword_100069E60)
  {
    sub_100007D80(&qword_100069E58);
    sub_10000D120(&qword_100069E68, &qword_100069E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100069E60);
  }
  return result;
}

uint64_t sub_100012548@<X0>(uint64_t *a1@<X8>)
{
  return sub_100011080(a1);
}

uint64_t sub_100012550(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007D80(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000125B0(double a1, double a2, double a3)
{
  uint64_t result = 0;
  char v4 = 0;
  uint64_t v5 = 0;
  double v6 = a1;
  do
  {
    BOOL v8 = v6 <= a2;
    if (a3 > 0.0) {
      BOOL v8 = v6 >= a2;
    }
    if (v8)
    {
      if ((v6 != a2) | v4 & 1) {
        return result;
      }
      char v4 = 1;
    }
    else
    {
      BOOL v7 = __OFADD__(v5++, 1);
      if (v7) {
        goto LABEL_12;
      }
      double v6 = a1 + (double)v5 * a3;
    }
    BOOL v7 = __OFADD__(result++, 1);
  }
  while (!v7);
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100012624(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001268C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HourlyUsage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000126E8()
{
  uint64_t v1 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 25) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v7 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100012848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for ScreenTimeWidgetGraph() - 8);
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  int v8 = *(unsigned __int8 *)(v2 + 24);

  return sub_10000FE5C(a1, v6, v8, v7, a2);
}

uint64_t sub_1000128D0()
{
  uint64_t v1 = v0;
  uint64_t v2 = (int *)(type metadata accessor for HourlyUsage() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  unint64_t v5 = (*(void *)(*(void *)v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v6 - 8) + 80);
  uint64_t v8 = (v5 + v7 + 9) & ~v7;
  uint64_t v16 = *(void *)(*(void *)(v6 - 8) + 64);
  uint64_t v9 = v1 + v4;
  uint64_t v10 = sub_100054A10();
  uint64_t v11 = (void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8);
  uint64_t v17 = *v11;
  (*v11)(v9, v10);
  uint64_t v12 = v9 + v2[8];
  uint64_t v13 = sub_100005EB4(&qword_100069EA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_bridgeObjectRelease();
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8))(v1 + v8, v14);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  v17(v1 + v8 + *(int *)(v6 + 24), v10);

  return _swift_deallocObject(v1, v8 + v16, v3 | v7 | 7);
}

uint64_t sub_100012B34(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012B9C@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t v7 = *(void *)(type metadata accessor for HourlyUsage() - 8);
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v10 = *(void *)(type metadata accessor for ScreenTimeWidgetGraph() - 8);
  uint64_t v11 = *(void *)(v3 + v9);
  uint64_t v12 = v3 + ((v9 + *(unsigned __int8 *)(v10 + 80) + 9) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
  int v13 = *(unsigned __int8 *)(v3 + v9 + 8);

  return sub_100010230(a1, v3 + v8, v11, v13, v12, a2, a3);
}

uint64_t sub_100012CA8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012CE0(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(v1 + 16))(*(void *)a1, *(double *)(a1 + 8));
}

uint64_t sub_100012D14(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100012D5C()
{
  return sub_100010754();
}

uint64_t sub_100012D64()
{
  return sub_10000D120(&qword_100069EF8, &qword_100069F00);
}

uint64_t sub_100012DA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v29 = a1;
  uint64_t v2 = sub_100054CB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v6 - 8);
  unint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100054C10();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v27 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v26 = (char *)&v26 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v26 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v26 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v26 - v21;
  sub_100054C40();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Calendar.Component.day(_:), v2);
  sub_100054C80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v20, v8, v9);
    sub_100054C40();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v24(v26, v22, v9);
    v24(v27, v17, v9);
    sub_1000549F0();
    uint64_t v25 = *(void (**)(char *, uint64_t))(v10 + 8);
    v25(v17, v9);
    v25(v20, v9);
    return ((uint64_t (*)(char *, uint64_t))v25)(v22, v9);
  }
  return result;
}

uint64_t sub_1000130F8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_10001F0C0(0, &qword_10006A118);
  uint64_t v2 = sub_100055990();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001318C()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_100069F08);
  sub_1000096F4(v0, (uint64_t)qword_100069F08);
  return sub_100054E90();
}

void sub_100013210(uint64_t a1)
{
  sub_10001337C(a1);
  int64_t v4 = v3 >> 1;
  uint64_t v5 = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!v5)
  {
LABEL_12:
    swift_unknownObjectRelease();
    sub_10001F2E8((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  sub_10002A208(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    if (v7 <= v4) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = v8 - v7;
    uint64_t v10 = (id *)(v6 + 8 * v7);
    while (v9)
    {
      id v11 = *v10;
      id v12 = [v11 identifier];
      uint64_t v13 = sub_100055A10();
      uint64_t v15 = v14;

      unint64_t v17 = _swiftEmptyArrayStorage[2];
      unint64_t v16 = _swiftEmptyArrayStorage[3];
      if (v17 >= v16 >> 1) {
        sub_10002A208(v16 > 1, v17 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v17 + 1;
      uint64_t v18 = &_swiftEmptyArrayStorage[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      --v9;
      ++v10;
      if (!--v5) {
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_14;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_10001337C(uint64_t a1)
{
  unint64_t v3 = *v1;
  id v12 = _swiftEmptyArrayStorage;
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100055F30();
    if (v4) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_15;
  }
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_100055E10();
    }
    else {
      id v6 = *(id *)(v3 + 8 * i + 32);
    }
    uint64_t v7 = v6;
    if ([v6 type] == (id)1 || objc_msgSend(v7, "type") == (id)2)
    {
      sub_100055E30();
      sub_100055E70();
      sub_100055E80();
      sub_100055E40();
    }
    else
    {
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v8 = (unint64_t)v12;
LABEL_16:
  swift_bridgeObjectRetain();
  if ((v8 & 0x8000000000000000) != 0 || (uint64_t v9 = (void *)v8, (v8 & 0x4000000000000000) != 0))
  {
    uint64_t v9 = sub_10001D298(v8);
    swift_release();
  }
  id v12 = v9;
  sub_10001D524((uint64_t *)&v12);
  swift_release();
  uint64_t v10 = sub_10001F144(a1, (unint64_t)v12);
  swift_release();
  return v10;
}

uint64_t sub_10001356C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100005F44(a1, (uint64_t)&v9, &qword_10006A0F0);
  if (v10)
  {
    sub_10001EA94(&v9, (uint64_t)&v11);
  }
  else
  {
    id v12 = &type metadata for ScreenTimeAppInfoCache;
    uint64_t v13 = &off_100066448;
    sub_100005FA8((uint64_t)&v9, &qword_10006A0F0);
  }
  sub_10001EA94(&v11, v3 + 16);
  sub_100005F44(a2, (uint64_t)&v9, &qword_10006A0F8);
  if (v10)
  {
    sub_10001EA94(&v9, (uint64_t)&v11);
  }
  else
  {
    id v12 = &type metadata for ScreenTimeIconCache;
    uint64_t v13 = &off_100066420;
    sub_100005FA8((uint64_t)&v9, &qword_10006A0F8);
  }
  sub_10001EA94(&v11, v3 + 56);
  sub_100005F44(a3, (uint64_t)&v9, &qword_10006A100);
  if (v10)
  {
    sub_100005FA8(a3, &qword_10006A100);
    sub_100005FA8(a2, &qword_10006A0F8);
    sub_100005FA8(a1, &qword_10006A0F0);
    sub_10001EA94(&v9, (uint64_t)&v11);
  }
  else
  {
    if (qword_100069918 != -1) {
      swift_once();
    }
    uint64_t v7 = qword_10006D138;
    id v12 = (ValueMetadata *)type metadata accessor for XPCPersistentStoreManager();
    uint64_t v13 = &off_100067080;
    *(void *)&long long v11 = v7;
    swift_retain();
    sub_100005FA8(a3, &qword_10006A100);
    sub_100005FA8(a2, &qword_10006A0F8);
    sub_100005FA8(a1, &qword_10006A0F0);
    sub_100005FA8((uint64_t)&v9, &qword_10006A100);
  }
  sub_10001EA94(&v11, v3 + 96);
  return v3;
}

uint64_t sub_100013764()
{
  uint64_t v0 = sub_100055CF0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100055CD0();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_1000557F0();
  __chkstk_darwin(v5 - 8);
  sub_10001F0C0(0, &qword_10006A080);
  sub_1000557E0();
  v7[1] = _swiftEmptyArrayStorage;
  sub_1000211D0(&qword_10006A0D8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005EB4(&qword_10006A0E0);
  sub_10000D120(&qword_10006A0E8, &qword_10006A0E0);
  sub_100055D90();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  uint64_t result = sub_100055D20();
  qword_10006D118 = result;
  return result;
}

uint64_t sub_1000139C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10)
{
  uint64_t v26 = a5;
  uint64_t v27 = a8;
  uint64_t v25 = a4;
  uint64_t v17 = sub_100005EB4(&qword_10006A060);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void *)(v18 + 64);
  __chkstk_darwin(v17);
  sub_10001AC50(a2 + 96, (uint64_t)v29);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v17);
  unint64_t v20 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  uint64_t v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v21 + v20, (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  uint64_t v22 = *sub_10001ADBC(v29, v29[3]);
  v28[3] = type metadata accessor for XPCPersistentStoreManager();
  v28[4] = &off_100067080;
  v28[0] = v22;
  swift_retain();
  sub_100013C68(v28, (void (*)(unsigned char *))sub_10001AD48, v21, v27, a3, v25, v26, a2, a9, a10, a6, a7);
  sub_10001E980((uint64_t)v28);
  swift_release();
  return sub_10001E980((uint64_t)v29);
}

uint64_t sub_100013BBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UsageTimelineEntry();
  __chkstk_darwin(v2 - 8);
  sub_10001EA2C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for UsageTimelineEntry);
  sub_100005EB4(&qword_10006A060);
  return sub_100055BB0();
}

uint64_t sub_100013C68(void *a1, void (*a2)(unsigned char *), uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, uint64_t a11, uint64_t a12)
{
  uint64_t v151 = a8;
  uint64_t v155 = a7;
  uint64_t v165 = a6;
  LODWORD(v166) = a5;
  uint64_t v169 = a4;
  v170 = a2;
  uint64_t v171 = a3;
  uint64_t v154 = sub_1000557F0();
  uint64_t v153 = *(void *)(v154 - 8);
  __chkstk_darwin(v154);
  v152 = (char *)v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_1000557B0();
  uint64_t v147 = *(void *)(v149 - 8);
  __chkstk_darwin(v149);
  uint64_t v146 = (uint64_t *)((char *)v129 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v150 = sub_100055810();
  uint64_t v148 = *(void *)(v150 - 8);
  uint64_t v17 = __chkstk_darwin(v150);
  uint64_t v144 = (char *)v129 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  unint64_t v145 = (char *)v129 - v19;
  uint64_t v161 = sub_100054CD0();
  uint64_t v160 = *(void *)(v161 - 8);
  uint64_t v20 = __chkstk_darwin(v161);
  uint64_t v141 = (char *)v129 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)v129 - v22;
  uint64_t v159 = sub_100054C10();
  uint64_t v168 = *(void *)(v159 - 8);
  uint64_t v24 = __chkstk_darwin(v159);
  uint64_t v140 = (char *)v129 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)v129 - v26;
  uint64_t v158 = sub_100054A10();
  uint64_t v157 = *(void *)(v158 - 8);
  uint64_t v28 = __chkstk_darwin(v158);
  uint64_t v30 = (char *)v129 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v156 = (uint64_t)v129 - v31;
  uint64_t v32 = sub_100005EB4(&qword_100069948);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  uint64_t v139 = (char *)v129 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  int v36 = (char *)v129 - v35;
  uint64_t v37 = sub_100005EB4(&qword_100069950);
  uint64_t v38 = __chkstk_darwin(v37 - 8);
  uint64_t v138 = (char *)v129 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v38);
  uint64_t v41 = (char *)v129 - v40;
  uint64_t v42 = type metadata accessor for UsageTimelineEntry();
  uint64_t v43 = __chkstk_darwin(v42 - 8);
  unsigned int v137 = (char *)v129 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v43);
  long long v46 = (char *)v129 - v45;
  uint64_t v164 = sub_1000557C0();
  uint64_t v143 = *(void *)(v164 - 8);
  __chkstk_darwin(v164);
  v163 = (char *)v129 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_1000558C0();
  uint64_t v167 = *(void *)(v172 - 8);
  uint64_t v48 = *(void *)(v167 + 64);
  uint64_t v49 = __chkstk_darwin(v172);
  uint64_t v142 = (char *)v129 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __chkstk_darwin(v49);
  uint64_t v52 = (char *)v129 - v51;
  __chkstk_darwin(v50);
  v162 = (char *)v129 - v53;
  if (*(unsigned char *)(*sub_10001ADBC(a1, a1[3]) + 24) != 1)
  {
    if (qword_1000698E8 != -1) {
      swift_once();
    }
    uint64_t v99 = sub_100054EA0();
    sub_1000096F4(v99, (uint64_t)qword_100069F08);
    uint64_t v100 = sub_100054E80();
    os_log_type_t v101 = sub_100055C90();
    if (os_log_type_enabled(v100, v101))
    {
      long long v102 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v102 = 0;
      _os_log_impl((void *)&_mh_execute_header, v100, v101, "Failed to initialize persistent store. Returning placeholder timeline entry", v102, 2u);
      swift_slowDealloc();
    }

    uint64_t v103 = v159;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v41, 1, 1, v159);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v157 + 56))(v36, 1, 1, v158);
    sub_100054BF0();
    sub_100054C90();
    uint64_t v104 = v167;
    uint64_t v105 = v172;
    (*(void (**)(char *, uint64_t, uint64_t))(v167 + 16))(v52, v169, v172);
    int v106 = (*(uint64_t (**)(char *, uint64_t))(v104 + 88))(v52, v105);
    char v107 = v166;
    if (v106 != enum case for WidgetFamily.systemSmall(_:))
    {
      if (v106 == enum case for WidgetFamily.systemMedium(_:))
      {
        uint64_t v108 = v156;
        uint64_t v109 = v156;
        uint64_t v110 = 15;
        goto LABEL_18;
      }
      if (v106 == enum case for WidgetFamily.systemLarge(_:) || v106 == enum case for WidgetFamily.systemExtraLarge(_:))
      {
        uint64_t v108 = v156;
        sub_100012DA0((uint64_t)v27, v156);
        goto LABEL_19;
      }
      if (v106 != enum case for WidgetFamily.accessoryCircular(_:)
        && v106 != enum case for WidgetFamily.accessoryRectangular(_:)
        && v106 != enum case for WidgetFamily.accessoryInline(_:))
      {
        sub_100012DA0((uint64_t)v27, v156);
        uint64_t v127 = v52;
        uint64_t v108 = v156;
        (*(void (**)(char *, uint64_t))(v167 + 8))(v127, v172);
        goto LABEL_19;
      }
    }
    uint64_t v108 = v156;
    uint64_t v109 = v156;
    uint64_t v110 = 9;
LABEL_18:
    sub_10001AE50(v110, (uint64_t)v27, v109);
LABEL_19:
    (*(void (**)(char *, uint64_t))(v160 + 8))(v23, v161);
    (*(void (**)(char *, uint64_t))(v168 + 8))(v27, v103);
    sub_100005660(0, (uint64_t)v41, 0, 0, 0, 0, (uint64_t)v36, v108, v46, a9, a10, 0.0, (uint64_t)_swiftEmptyArrayStorage, v107 & 1, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
    v170(v46);
    return sub_10001BDE0((uint64_t)v46, (uint64_t (*)(void))type metadata accessor for UsageTimelineEntry);
  }
  if (qword_1000698E8 != -1) {
    swift_once();
  }
  v129[0] = (uint64_t)v30;
  uint64_t v54 = sub_100054EA0();
  v129[1] = sub_1000096F4(v54, (uint64_t)qword_100069F08);
  uint64_t v55 = sub_100054E80();
  os_log_type_t v56 = sub_100055CB0();
  BOOL v57 = os_log_type_enabled(v55, v56);
  uint64_t v58 = v167;
  if (v57)
  {
    uint64_t v59 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v59 = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, v56, "Successfully loaded persistent store.", v59, 2u);
    swift_slowDealloc();
  }

  uint64_t v60 = swift_allocObject();
  *(unsigned char *)(v60 + 16) = 0;
  uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
  uint64_t v62 = v162;
  uint64_t v63 = v172;
  uint64_t v135 = v58 + 16;
  v134 = v61;
  v61(v162, v169, v172);
  uint64_t v64 = *(unsigned __int8 *)(v58 + 80);
  uint64_t v65 = (v64 + 72) & ~v64;
  uint64_t v156 = v64;
  uint64_t v133 = v64 | 7;
  uint64_t v66 = swift_allocObject();
  uint64_t v67 = (void (*)(void))v170;
  uint64_t v68 = v171;
  *(void *)(v66 + 16) = v60;
  *(void *)(v66 + 24) = v67;
  *(void *)(v66 + 32) = v68;
  *(double *)(v66 + 40) = a9;
  *(double *)(v66 + 48) = a10;
  uint64_t v69 = v58;
  uint64_t v70 = v155;
  *(void *)(v66 + 56) = v165;
  *(void *)(v66 + 64) = v70;
  uint64_t v71 = *(void (**)(uint64_t, char *, uint64_t))(v69 + 32);
  uint64_t v132 = v69 + 32;
  v131 = v71;
  v71(v66 + v65, v62, v63);
  int v130 = v166 & 1;
  *(unsigned char *)(v66 + v65 + v48) = v166 & 1;
  v178 = sub_10001B800;
  uint64_t v179 = v66;
  aBlock = _NSConcreteStackBlock;
  uint64_t v175 = 1107296256;
  v176 = sub_100015744;
  v177 = &unk_1000667E0;
  _Block_copy(&aBlock);
  v173 = _swiftEmptyArrayStorage;
  uint64_t v72 = sub_1000211D0(&qword_10006A068, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v136 = v60;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v73 = sub_100005EB4(&qword_10006A070);
  uint64_t v74 = sub_10000D120(&qword_10006A078, &qword_10006A070);
  sub_100055D90();
  sub_100055840();
  swift_allocObject();
  uint64_t v75 = sub_100055820();
  swift_release();
  if (!v70)
  {
    uint64_t v164 = v75;
    uint64_t v111 = sub_100054E80();
    os_log_type_t v112 = sub_100055C90();
    if (os_log_type_enabled(v111, v112))
    {
      uint64_t v113 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v111, v112, "Failed to provide non-null dsid. Returning placeholder.", v113, 2u);
      swift_slowDealloc();
    }

    uint64_t v114 = (uint64_t)v138;
    uint64_t v115 = v159;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v168 + 56))(v138, 1, 1, v159);
    uint64_t v116 = (uint64_t)v139;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v157 + 56))(v139, 1, 1, v158);
    uint64_t v117 = (uint64_t)v140;
    sub_100054BF0();
    v118 = v141;
    sub_100054C90();
    uint64_t v119 = v142;
    uint64_t v120 = v172;
    v134(v142, v169, v172);
    uint64_t v121 = v167;
    int v122 = (*(uint64_t (**)(char *, uint64_t))(v167 + 88))(v119, v120);
    char v123 = v166;
    if (v122 != enum case for WidgetFamily.systemSmall(_:))
    {
      if (v122 == enum case for WidgetFamily.systemMedium(_:))
      {
        uint64_t v124 = v129[0];
        uint64_t v125 = v129[0];
        uint64_t v126 = 15;
        goto LABEL_32;
      }
      if (v122 == enum case for WidgetFamily.systemLarge(_:) || v122 == enum case for WidgetFamily.systemExtraLarge(_:))
      {
        uint64_t v124 = v129[0];
        sub_100012DA0(v117, v129[0]);
        goto LABEL_33;
      }
      if (v122 != enum case for WidgetFamily.accessoryCircular(_:)
        && v122 != enum case for WidgetFamily.accessoryRectangular(_:)
        && v122 != enum case for WidgetFamily.accessoryInline(_:))
      {
        uint64_t v124 = v129[0];
        sub_100012DA0(v117, v129[0]);
        (*(void (**)(char *, uint64_t))(v121 + 8))(v142, v172);
        goto LABEL_33;
      }
    }
    uint64_t v124 = v129[0];
    uint64_t v125 = v129[0];
    uint64_t v126 = 9;
LABEL_32:
    sub_10001AE50(v126, v117, v125);
LABEL_33:
    (*(void (**)(char *, uint64_t))(v160 + 8))(v118, v161);
    (*(void (**)(uint64_t, uint64_t))(v168 + 8))(v117, v115);
    uint64_t v128 = v137;
    sub_100005660(0, v114, 0, 0, v165, 0, v116, v124, v137, a9, a10, 0.0, (uint64_t)_swiftEmptyArrayStorage, v123 & 1, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
    v170(v128);
    swift_release();
    sub_10001BDE0((uint64_t)v128, (uint64_t (*)(void))type metadata accessor for UsageTimelineEntry);
    return swift_release();
  }
  uint64_t v166 = v74;
  uint64_t v167 = v73;
  uint64_t v168 = v72;
  uint64_t v161 = a12;
  uint64_t v160 = a11;
  uint64_t v158 = ~v156;
  sub_10001F0C0(0, &qword_10006A080);
  swift_bridgeObjectRetain();
  id v76 = (void *)sub_100055D00();
  uint64_t v77 = v75;
  uint64_t v78 = v144;
  sub_100055800();
  uint64_t v79 = v146;
  *uint64_t v146 = 20;
  uint64_t v80 = v147;
  uint64_t v81 = v149;
  (*(void (**)(void *, void, uint64_t))(v147 + 104))(v79, enum case for DispatchTimeInterval.seconds(_:), v149);
  uint64_t v82 = v145;
  sub_100055850();
  (*(void (**)(void *, uint64_t))(v80 + 8))(v79, v81);
  uint64_t v83 = *(void (**)(char *, uint64_t))(v148 + 8);
  uint64_t v84 = v150;
  v83(v78, v150);
  sub_100055CE0();

  v83(v82, v84);
  if (qword_1000698F0 != -1) {
    swift_once();
  }
  uint64_t v159 = qword_10006D118;
  uint64_t v85 = v162;
  uint64_t v86 = v172;
  v134(v162, v169, v172);
  uint64_t v87 = (v156 + 80) & v158;
  unint64_t v88 = (v48 + v87 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v89 = swift_allocObject();
  *(void *)(v89 + 16) = v151;
  *(unsigned char *)(v89 + 24) = v130;
  *(void *)(v89 + 32) = v165;
  *(void *)(v89 + 40) = v70;
  uint64_t v90 = v161;
  *(void *)(v89 + 48) = v160;
  *(void *)(v89 + 56) = v90;
  *(void *)(v89 + 64) = v136;
  *(void *)(v89 + 72) = v77;
  v131(v89 + v87, v85, v86);
  uint64_t v91 = (double *)(v89 + v88);
  double *v91 = a9;
  v91[1] = a10;
  uint64_t v92 = (void *)(v89 + ((v88 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v93 = v171;
  *uint64_t v92 = v170;
  v92[1] = v93;
  v178 = sub_10001B9C0;
  uint64_t v179 = v89;
  aBlock = _NSConcreteStackBlock;
  uint64_t v175 = 1107296256;
  v176 = sub_100015744;
  v177 = &unk_100066830;
  uint64_t v94 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v95 = v152;
  sub_1000557D0();
  v173 = _swiftEmptyArrayStorage;
  uint64_t v96 = v163;
  uint64_t v97 = v164;
  sub_100055D90();
  sub_100055D10();
  _Block_release(v94);
  swift_release();
  (*(void (**)(char *, uint64_t))(v143 + 8))(v96, v97);
  (*(void (**)(char *, uint64_t))(v153 + 8))(v95, v154);
  swift_release();
  return swift_release();
}

uint64_t sub_1000150B8(uint64_t a1, void (*a2)(unsigned char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, double a8, double a9)
{
  int v57 = a7;
  uint64_t v47 = a6;
  uint64_t v48 = a2;
  uint64_t v49 = a4;
  uint64_t v50 = a3;
  uint64_t v51 = sub_1000558C0();
  uint64_t v59 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v58 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100054CD0();
  uint64_t v55 = *(void *)(v14 - 8);
  uint64_t v56 = v14;
  __chkstk_darwin(v14);
  uint64_t v53 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = sub_100054C10();
  uint64_t v60 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100054A10();
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v52 = (uint64_t)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100005EB4(&qword_100069948);
  __chkstk_darwin(v21 - 8);
  uint64_t v23 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v46 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for UsageTimelineEntry();
  __chkstk_darwin(v27 - 8);
  uint64_t v29 = (char *)&v46 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  *(unsigned char *)(a1 + 16) = 1;
  if (qword_1000698E8 != -1) {
    swift_once();
  }
  uint64_t v30 = sub_100054EA0();
  sub_1000096F4(v30, (uint64_t)qword_100069F08);
  uint64_t v31 = sub_100054E80();
  os_log_type_t v32 = sub_100055C90();
  if (os_log_type_enabled(v31, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 134349056;
    uint64_t v61 = 20;
    sub_100055D70();
    _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to return widget data in %{public}ld seconds. Returning placeholder", v33, 0xCu);
    swift_slowDealloc();
  }

  uint64_t v34 = v54;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56))(v26, 1, 1, v54);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v23, 1, 1, v18);
  swift_bridgeObjectRetain();
  sub_100054BF0();
  uint64_t v35 = v53;
  sub_100054C90();
  uint64_t v36 = v59;
  uint64_t v37 = (uint64_t)v26;
  uint64_t v38 = (uint64_t)v23;
  uint64_t v39 = v58;
  uint64_t v40 = v51;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v47, v51);
  int v41 = (*(uint64_t (**)(char *, uint64_t))(v36 + 88))(v39, v40);
  uint64_t v42 = v52;
  if (v41 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v41 == enum case for WidgetFamily.systemMedium(_:))
    {
      uint64_t v43 = v52;
      uint64_t v44 = 15;
      goto LABEL_9;
    }
    if (v41 == enum case for WidgetFamily.systemLarge(_:) || v41 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      sub_100012DA0((uint64_t)v17, v52);
      goto LABEL_10;
    }
    if (v41 != enum case for WidgetFamily.accessoryCircular(_:)
      && v41 != enum case for WidgetFamily.accessoryRectangular(_:)
      && v41 != enum case for WidgetFamily.accessoryInline(_:))
    {
      sub_100012DA0((uint64_t)v17, v52);
      (*(void (**)(char *, uint64_t))(v59 + 8))(v58, v40);
      goto LABEL_10;
    }
  }
  uint64_t v43 = v52;
  uint64_t v44 = 9;
LABEL_9:
  sub_10001AE50(v44, (uint64_t)v17, v43);
LABEL_10:
  (*(void (**)(char *, uint64_t))(v55 + 8))(v35, v56);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v17, v34);
  sub_100005660(0, v37, 0, 0, v49, a5, v38, v42, v29, a8, a9, 0.0, (uint64_t)_swiftEmptyArrayStorage, v57 & 1, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
  v48(v29);
  return sub_10001BDE0((uint64_t)v29, (uint64_t (*)(void))type metadata accessor for UsageTimelineEntry);
}

uint64_t sub_100015748(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, uint64_t a11, void (*a12)(unsigned char *), uint64_t a13)
{
  uint64_t v75 = a8;
  uint64_t v72 = a7;
  uint64_t v66 = a6;
  uint64_t v67 = a5;
  uint64_t v74 = a4;
  uint64_t v70 = a3;
  int v71 = a2;
  uint64_t v65 = a1;
  uint64_t v73 = a13;
  uint64_t v69 = a12;
  uint64_t v16 = sub_100005EB4(&qword_10006A088);
  __chkstk_darwin(v16 - 8);
  uint64_t v62 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_1000558C0();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(void *)(v19 + 64);
  uint64_t v21 = __chkstk_darwin(v18);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v62 - v22;
  uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v24((char *)&v62 - v22, a11, v18);
  uint64_t v68 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24(v68, (uint64_t)v23, v18);
  unint64_t v25 = (*(unsigned __int8 *)(v19 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v26 = v25 + v20;
  unint64_t v27 = (v25 + v20) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v28 = (v27 + 31) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v29 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v30 = (char *)swift_allocObject();
  uint64_t v31 = (double *)&v30[v27];
  uint64_t v32 = v75;
  *((void *)v30 + 2) = a7;
  *((void *)v30 + 3) = v32;
  uint64_t v33 = v65;
  *((void *)v30 + 4) = v65;
  uint64_t v63 = v19;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
  uint64_t v64 = v18;
  v34(&v30[v25], v23, v18);
  LOBYTE(v25) = v71;
  v30[v26] = v71;
  uint64_t v35 = v66;
  v31[1] = a9;
  v31[2] = a10;
  uint64_t v36 = &v30[v28];
  uint64_t v37 = v69;
  uint64_t v38 = v70;
  uint64_t v39 = v73;
  uint64_t v40 = v74;
  *(void *)uint64_t v36 = v70;
  *((void *)v36 + 1) = v40;
  int v41 = &v30[v29];
  *(void *)int v41 = v37;
  *((void *)v41 + 1) = v39;
  sub_10001AC50(v33 + 96, (uint64_t)v77);
  uint64_t v42 = sub_10001ADBC(v77, v77[3]);
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = sub_10001BB8C;
  *(void *)(v43 + 24) = v30;
  *(unsigned char *)(v43 + 32) = v25;
  *(void *)(v43 + 40) = v38;
  *(void *)(v43 + 48) = v40;
  uint64_t v44 = v67;
  *(void *)(v43 + 56) = v33;
  *(void *)(v43 + 64) = v44;
  *(void *)(v43 + 72) = v35;
  uint64_t v45 = *v42;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  sub_10003E140();
  if (*(unsigned char *)(v45 + 24) == 1)
  {
    id v46 = [*(id *)(v45 + 16) newBackgroundContext];
    [v46 setAutomaticallyMergesChangesFromParent:1];
    [v46 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    uint64_t v47 = (void *)swift_allocObject();
    v47[2] = sub_10001BCD8;
    v47[3] = v43;
    v47[4] = v46;
    uint64_t v48 = swift_allocObject();
    *(void *)(v48 + 16) = sub_10001BD9C;
    *(void *)(v48 + 24) = v47;
    aBlock[4] = sub_10001BDB8;
    aBlock[5] = v48;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10001AE28;
    aBlock[3] = &unk_1000668F8;
    uint64_t v49 = _Block_copy(aBlock);
    swift_retain();
    id v50 = v46;
    swift_retain();
    swift_release();
    [v50 performBlockAndWait:v49];

    _Block_release(v49);
    LOBYTE(v50) = swift_isEscapingClosureAtFileLocation();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v51 = (uint64_t)v68;
    if ((v50 & 1) == 0) {
      goto LABEL_9;
    }
    __break(1u);
  }
  if (qword_1000698E8 != -1) {
    swift_once();
  }
  uint64_t v52 = sub_100054EA0();
  sub_1000096F4(v52, (uint64_t)qword_100069F08);
  uint64_t v53 = sub_100054E80();
  os_log_type_t v54 = sub_100055C90();
  BOOL v55 = os_log_type_enabled(v53, v54);
  uint64_t v56 = v72;
  uint64_t v57 = v75;
  if (v55)
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v58 = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "Since persistence stores can't be loaded, no usage data can be retrieved.", v58, 2u);
    swift_slowDealloc();
  }

  uint64_t v59 = type metadata accessor for UsageData();
  uint64_t v60 = (uint64_t)v62;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v62, 1, 1, v59);
  uint64_t v51 = (uint64_t)v68;
  sub_100015E30(v60, 0, 0, 0, v56, a9, a10, v57, v33, (uint64_t)v68, v71 & 1, v70, v74, v69, v73);
  sub_100005FA8(v60, &qword_10006A088);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
LABEL_9:
  sub_10001E980((uint64_t)v77);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v51, v64);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100015E30(uint64_t a1, void *a2, int a3, int a4, uint64_t a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, uint64_t a12, uint64_t a13, void (*a14)(unsigned char *), uint64_t a15)
{
  uint64_t v62 = a10;
  int v60 = a4;
  int v61 = a3;
  id v64 = a2;
  uint64_t v63 = type metadata accessor for UsageTimelineEntry();
  uint64_t v19 = __chkstk_darwin(v63);
  uint64_t v59 = &v53[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v19);
  uint64_t v22 = &v53[-v21];
  uint64_t v23 = sub_100005EB4(&qword_10006A088);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v26 = &v53[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v24);
  unint64_t v28 = &v53[-v27];
  uint64_t v29 = type metadata accessor for UsageData();
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v32 = &v53[-((v31 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t result = swift_beginAccess();
  if ((*(unsigned char *)(a5 + 16) & 1) == 0)
  {
    uint64_t v57 = a15;
    uint64_t v58 = a14;
    uint64_t v56 = a12;
    sub_100055830();
    sub_100005F44(a1, (uint64_t)v28, &qword_10006A088);
    uint64_t v55 = v30;
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29) == 1)
    {
      sub_100005FA8((uint64_t)v28, &qword_10006A088);
      sub_10001633C(v60 & 0x101, v62, v61 & 1, a1, a11 & 1, v22, a6, a7);
      uint64_t v34 = v63;
      uint64_t v35 = &v22[*(int *)(v63 + 32)];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *uint64_t v35 = v56;
      v35[1] = a13;
      id v36 = v64;
      if (v64)
      {
        uint64_t v37 = *(int *)(v34 + 72);
        uint64_t v38 = *(void **)&v22[v37];
        id v39 = v64;

        *(void *)&v22[v37] = v36;
      }
      v58(v22);
      uint64_t v40 = v22;
    }
    else
    {
      int v54 = a11;
      uint64_t v41 = v56;
      uint64_t v42 = (uint64_t)v32;
      sub_100021218((uint64_t)v28, (uint64_t)v32, (uint64_t (*)(void))type metadata accessor for UsageData);
      if (qword_1000698E8 != -1) {
        swift_once();
      }
      uint64_t v43 = sub_100054EA0();
      sub_1000096F4(v43, (uint64_t)qword_100069F08);
      uint64_t v44 = sub_100054E80();
      os_log_type_t v45 = sub_100055CB0();
      if (os_log_type_enabled(v44, v45))
      {
        id v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "getCoreDataEntry returning entry", v46, 2u);
        swift_slowDealloc();
      }

      sub_10001EA2C((uint64_t)v32, (uint64_t)v26, (uint64_t (*)(void))type metadata accessor for UsageData);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v55 + 56))(v26, 0, 1, v29);
      uint64_t v40 = v59;
      sub_10001633C(v60 & 0x101, v62, v61 & 1, (uint64_t)v26, v54 & 1, v59, a6, a7);
      sub_100005FA8((uint64_t)v26, &qword_10006A088);
      uint64_t v47 = v63;
      uint64_t v48 = &v40[*(int *)(v63 + 32)];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *uint64_t v48 = v41;
      v48[1] = a13;
      id v49 = v64;
      if (v64)
      {
        uint64_t v50 = *(int *)(v47 + 72);
        uint64_t v51 = *(void **)&v40[v50];
        id v52 = v64;

        *(void *)&v40[v50] = v49;
      }
      v58(v40);
      sub_10001BDE0(v42, (uint64_t (*)(void))type metadata accessor for UsageData);
    }
    return sub_10001BDE0((uint64_t)v40, (uint64_t (*)(void))type metadata accessor for UsageTimelineEntry);
  }
  return result;
}

uint64_t sub_1000162F8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10001633C@<X0>(int a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, unsigned char *a6@<X8>, double a7@<D0>, double a8@<D1>)
{
  int v96 = a5;
  uint64_t v87 = a4;
  int v92 = a3;
  LODWORD(v93) = a1;
  uint64_t v98 = a6;
  uint64_t v11 = sub_100005EB4(&qword_10006A088);
  __chkstk_darwin(v11 - 8);
  unint64_t v88 = (uint64_t *)((char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for UsageData();
  uint64_t v85 = *(void *)(v13 - 8);
  uint64_t v86 = v13;
  __chkstk_darwin(v13);
  uint64_t v91 = (uint64_t)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(&qword_100069948);
  __chkstk_darwin(v15 - 8);
  uint64_t v97 = (char *)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v17 - 8);
  uint64_t v101 = (uint64_t)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000558C0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v89 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v85 - v23;
  uint64_t v25 = sub_100054CD0();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  unint64_t v28 = (char *)&v85 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_100054C10();
  uint64_t v29 = *(void *)(v99 - 8);
  __chkstk_darwin(v99);
  uint64_t v31 = (char *)&v85 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_100054A10();
  uint64_t v32 = *(void *)(v95 - 8);
  uint64_t v33 = __chkstk_darwin(v95);
  uint64_t v94 = (char *)&v85 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  uint64_t v100 = (uint64_t)&v85 - v35;
  sub_100054BF0();
  sub_100054C90();
  id v36 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v90 = a2;
  v36(v24, a2, v19);
  int v37 = (*(uint64_t (**)(char *, uint64_t))(v20 + 88))(v24, v19);
  if (v37 == enum case for WidgetFamily.systemSmall(_:)) {
    goto LABEL_2;
  }
  if (v37 == enum case for WidgetFamily.systemMedium(_:))
  {
    uint64_t v38 = v100;
    uint64_t v39 = v100;
    uint64_t v40 = 15;
    goto LABEL_5;
  }
  if (v37 == enum case for WidgetFamily.systemLarge(_:) || v37 == enum case for WidgetFamily.systemExtraLarge(_:))
  {
    uint64_t v38 = v100;
    sub_100012DA0((uint64_t)v31, v100);
  }
  else
  {
    if (v37 == enum case for WidgetFamily.accessoryCircular(_:)
      || v37 == enum case for WidgetFamily.accessoryRectangular(_:)
      || v37 == enum case for WidgetFamily.accessoryInline(_:))
    {
LABEL_2:
      uint64_t v38 = v100;
      uint64_t v39 = v100;
      uint64_t v40 = 9;
LABEL_5:
      sub_10001AE50(v40, (uint64_t)v31, v39);
      goto LABEL_6;
    }
    uint64_t v58 = v100;
    sub_100012DA0((uint64_t)v31, v100);
    uint64_t v59 = v24;
    uint64_t v38 = v58;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v59, v19);
  }
LABEL_6:
  (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
  uint64_t v41 = v31;
  uint64_t v42 = v99;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v41, v99);
  if (v93)
  {
    if ((v93 & 0x100) != 0)
    {
      int v60 = (void (*)(void, void, void))v88;
      sub_100005F44(v87, (uint64_t)v88, &qword_10006A088);
      if ((*(unsigned int (**)(void, uint64_t, uint64_t))(v85 + 48))(v60, 1, v86) == 1)
      {
        sub_100005FA8((uint64_t)v60, &qword_10006A088);
        uint64_t v61 = v101;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v101, 1, 1, v42);
        uint64_t v62 = (uint64_t)v97;
        uint64_t v49 = v95;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v97, 1, 1, v95);
        uint64_t v63 = (uint64_t)v94;
        (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v94, v38, v49);
        sub_100005660(0, v61, 0, 0, 0, 0, v62, v63, v98, a7, a8, 0.0, (uint64_t)_swiftEmptyArrayStorage, v96 & 1, (uint64_t)_swiftEmptyArrayStorage, 0, (unsigned __int16)(v92 & 0x100) >> 8, (uint64_t)_swiftEmptyArrayStorage, 0);
      }
      else
      {
        sub_100021218((uint64_t)v60, v91, (uint64_t (*)(void))type metadata accessor for UsageData);
        uint64_t v65 = v89;
        unint64_t v88 = *(void **)(v20 + 104);
        ((void (*)(char *, void, uint64_t))v88)(v89, enum case for WidgetFamily.systemLarge(_:), v19);
        sub_1000211D0((unint64_t *)&qword_10006A130, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
        sub_100055B40();
        sub_100055B40();
        uint64_t v67 = v102;
        uint64_t v66 = v103;
        uint64_t v68 = *(void (**)(char *, uint64_t))(v20 + 8);
        v68(v65, v19);
        if (v66 == v67)
        {
          uint64_t v69 = v91;
          uint64_t v70 = swift_bridgeObjectRetain();
          uint64_t v93 = (uint64_t)sub_10001F380(v70);
          swift_bridgeObjectRelease();
          sub_10001F6A8(v69, 6);
          uint64_t v72 = v71;
        }
        else
        {
          uint64_t v72 = _swiftEmptyArrayStorage;
          uint64_t v93 = (uint64_t)_swiftEmptyArrayStorage;
        }
        uint64_t v73 = v89;
        ((void (*)(char *, void, uint64_t))v88)(v89, enum case for WidgetFamily.systemMedium(_:), v19);
        sub_100055B40();
        sub_100055B40();
        uint64_t v75 = v102;
        uint64_t v74 = v103;
        v68(v73, v19);
        if (v74 == v75)
        {
          swift_bridgeObjectRelease();
          uint64_t v76 = v91;
          sub_10001F6A8(v91, 4);
          uint64_t v72 = v77;
        }
        else
        {
          uint64_t v76 = v91;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v101, 1, 1, v99);
        uint64_t v78 = (uint64_t)v97;
        uint64_t v49 = v95;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v97, 1, 1, v95);
        uint64_t v79 = (uint64_t)v94;
        uint64_t v80 = v100;
        (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v94, v100, v49);
        unint64_t v81 = *(void *)(v76 + 24);
        uint64_t v82 = *(void *)(v76 + 8);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v83 = sub_10001FC00(v81, v82, v80);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v84 = (uint64_t)v72;
        uint64_t v38 = v80;
        sub_100005660(0, v101, 0, 0, 0, 0, v78, v79, v98, a7, a8, *(double *)(v76 + 32), v83, v96 & 1, v84, 0, (unsigned __int16)(v92 & 0x100) >> 8, v93, 0);
        sub_10001BDE0(v76, (uint64_t (*)(void))type metadata accessor for UsageData);
      }
    }
    else
    {
      if (qword_1000698E8 != -1) {
        swift_once();
      }
      uint64_t v51 = sub_100054EA0();
      sub_1000096F4(v51, (uint64_t)qword_100069F08);
      id v52 = sub_100054E80();
      os_log_type_t v53 = sub_100055CB0();
      if (os_log_type_enabled(v52, v53))
      {
        int v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "getCoreDataEntry returning ask to sign into iCloud view", v54, 2u);
        swift_slowDealloc();
      }

      uint64_t v55 = v101;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v101, 1, 1, v42);
      uint64_t v56 = (uint64_t)v97;
      uint64_t v49 = v95;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v97, 1, 1, v95);
      uint64_t v57 = (uint64_t)v94;
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v94, v38, v49);
      sub_100005660(1, v55, 0, 0, 0, 0, v56, v57, v98, a7, a8, 0.0, (uint64_t)_swiftEmptyArrayStorage, v96 & 1, (uint64_t)_swiftEmptyArrayStorage, 0, (unsigned __int16)(v92 & 0x100) >> 8, (uint64_t)_swiftEmptyArrayStorage, 0);
    }
  }
  else
  {
    if (qword_1000698E8 != -1) {
      swift_once();
    }
    uint64_t v43 = sub_100054EA0();
    sub_1000096F4(v43, (uint64_t)qword_100069F08);
    uint64_t v44 = sub_100054E80();
    os_log_type_t v45 = sub_100055CB0();
    if (os_log_type_enabled(v44, v45))
    {
      id v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "getCoreDataEntry returning placeholder", v46, 2u);
      swift_slowDealloc();
    }

    uint64_t v47 = v101;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v101, 1, 1, v42);
    uint64_t v48 = (uint64_t)v97;
    uint64_t v49 = v95;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v97, 1, 1, v95);
    uint64_t v50 = (uint64_t)v94;
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v94, v38, v49);
    sub_100005660(0, v47, 0, 0, 0, 0, v48, v50, v98, a7, a8, 0.0, (uint64_t)_swiftEmptyArrayStorage, v96 & 1, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v38, v49);
}

void sub_100016F9C(void *a1, void (*a2)(char *, void, void, uint64_t), uint64_t a3, int a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v321 = a3;
  unint64_t v322 = a6;
  uint64_t v15 = sub_100005EB4(&qword_10006A088);
  __chkstk_darwin(v15 - 8);
  v320 = (char *)&v288 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100054C10();
  uint64_t v18 = __chkstk_darwin(*(void *)(v17 - 8));
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v21 = __chkstk_darwin(v20);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v28 = (uint64_t)&v288 - v27;
  if (!a1)
  {
    if (qword_1000698E8 != -1) {
      swift_once();
    }
    uint64_t v40 = sub_100054EA0();
    sub_1000096F4(v40, (uint64_t)qword_100069F08);
    uint64_t v41 = sub_100054E80();
    os_log_type_t v42 = sub_100055C90();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Since persistence stores can't be loaded, no usage data can be retrieved.", v43, 2u);
      swift_slowDealloc();
    }

    uint64_t v44 = type metadata accessor for UsageData();
    uint64_t v45 = (uint64_t)v320;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v320, 1, 1, v44);
    a2((char *)v45, 0, 0, 0);
    sub_100005FA8(v45, &qword_10006A088);
    return;
  }
  v314 = v23;
  uint64_t v317 = v26;
  os_log_t v318 = v22;
  uint64_t v311 = v24;
  uint64_t v312 = v25;
  uint64_t v29 = qword_1000698E8;
  id v30 = a1;
  LODWORD(v316) = a4;
  uint64_t v319 = v17;
  uint64_t v313 = a8;
  if (a4)
  {
    id v31 = v30;
    if (v29 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_100054EA0();
    uint64_t v33 = sub_1000096F4(v32, (uint64_t)qword_100069F08);
    unint64_t v34 = v322;
    swift_bridgeObjectRetain_n();
    uint64_t v310 = v33;
    uint64_t v35 = sub_100054E80();
    os_log_type_t v36 = sub_100055CB0();
    BOOL v37 = os_log_type_enabled(v35, v36);
    uint64_t v309 = a7;
    if (v37)
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v39 = (void *)swift_slowAlloc();
      v315 = (void (*)(char *, void, void, uint64_t))v28;
      id v326 = v39;
      *(_DWORD *)uint64_t v38 = 136446210;
      swift_bridgeObjectRetain();
      id v323 = (id)sub_10001C000(a5, v322, (uint64_t *)&v326);
      sub_100055D70();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Fetching information for user with dsid: %{public}s.", v38, 0xCu);
      swift_arrayDestroy();
      unint64_t v34 = v322;
      uint64_t v28 = (uint64_t)v315;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v53 = [self fetchRequest];
    sub_100005EB4(&qword_10006A0B8);
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_100056C10;
    sub_10001F0C0(0, &qword_10006A0C0);
    *(void *)(v57 + 56) = &type metadata for String;
    unint64_t v58 = sub_10001C7B4();
    *(void *)(v57 + 32) = 1684632420;
    *(void *)(v57 + 40) = 0xE400000000000000;
    *(void *)(v57 + 96) = &type metadata for String;
    *(void *)(v57 + 104) = v58;
    *(void *)(v57 + 64) = v58;
    *(void *)(v57 + 72) = a5;
    *(void *)(v57 + 80) = v34;
    swift_bridgeObjectRetain();
    uint64_t v59 = (void *)sub_100055C70();
    [v53 setPredicate:v59];

    id v326 = 0;
    id v60 = [v53 execute:&v326];
    id v61 = v326;
    if (!v60)
    {
      id v103 = v326;
      sub_100054AA0();

      swift_willThrow();
      swift_errorRelease();
      uint64_t v104 = sub_100054E80();
      os_log_type_t v105 = sub_100055C90();
      uint64_t v50 = v31;
      if (!os_log_type_enabled(v104, v105))
      {
        int v107 = 0;
LABEL_140:

        int v282 = 0;
        goto LABEL_141;
      }
      int v106 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v106 = 0;
      _os_log_impl((void *)&_mh_execute_header, v104, v105, "Fetching user information returned nil results", v106, 2u);
      int v107 = 0;
LABEL_138:
      swift_slowDealloc();
      goto LABEL_140;
    }
    uint64_t v62 = v60;
    sub_10001F0C0(0, &qword_10006A0A8);
    unint64_t v55 = sub_100055B60();
    id v63 = v61;

    uint64_t v50 = v31;
  }
  else
  {
    id v46 = v30;
    if (v29 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_100054EA0();
    sub_1000096F4(v47, (uint64_t)qword_100069F08);
    uint64_t v48 = sub_100054E80();
    os_log_type_t v49 = sub_100055CB0();
    uint64_t v50 = v46;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v51 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Fetching local user information", v51, 2u);
      swift_slowDealloc();
    }

    id v52 = [self fetchRequestMatchingLocalUser];
    id v326 = 0;
    id v53 = [v52 execute:&v326];

    id v54 = v326;
    if (!v53)
    {
      uint64_t v28 = (uint64_t)v326;
      uint64_t v102 = (void *)sub_100054AA0();

      swift_willThrow();
      LODWORD(v28) = 0;
      int v308 = 0;
      goto LABEL_52;
    }
    uint64_t v309 = a7;
    sub_10001F0C0(0, &qword_10006A0A8);
    unint64_t v55 = sub_100055B60();
    id v56 = v54;
  }

  if (v55 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v281 = sub_100055F30();
    swift_bridgeObjectRelease();
    LODWORD(v65) = v281 > 0;
    swift_bridgeObjectRetain();
    id v64 = (id)sub_100055F30();
    if (v64) {
      goto LABEL_23;
    }
    goto LABEL_132;
  }
  id v64 = *(id *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
  LODWORD(v65) = v64 != 0;
  swift_bridgeObjectRetain();
  if (!v64)
  {
LABEL_132:
    swift_bridgeObjectRelease();
    if (v65)
    {
      int v282 = 256;
      int v107 = 1;
LABEL_141:
      uint64_t v286 = type metadata accessor for UsageData();
      v287 = v320;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v286 - 8) + 56))(v320, 1, 1, v286);
      a2(v287, 0, 0, v282 | v107);

      uint64_t v101 = (uint64_t)v287;
LABEL_142:
      sub_100005FA8(v101, &qword_10006A088);
      goto LABEL_143;
    }
    if (qword_1000698E8 != -1) {
      swift_once();
    }
    uint64_t v283 = sub_100054EA0();
    sub_1000096F4(v283, (uint64_t)qword_100069F08);
    uint64_t v104 = sub_100054E80();
    os_log_type_t v284 = sub_100055C90();
    if (!os_log_type_enabled(v104, v284))
    {
      int v107 = 1;
      goto LABEL_140;
    }
    v285 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v285 = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, v284, "Fetching user information returned empty results", v285, 2u);
    int v107 = 1;
    goto LABEL_138;
  }
LABEL_23:
  uint64_t v304 = a5;
  if ((v55 & 0xC000000000000001) != 0) {
    goto LABEL_145;
  }
  if (!*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_147;
  }
  uint64_t v66 = a2;
  id v67 = *(id *)(v55 + 32);
LABEL_26:
  a2 = (void (*)(char *, void, void, uint64_t))v67;
  swift_bridgeObjectRelease();
  if (![a2 screenTimeEnabled])
  {
    if (qword_1000698E8 != -1) {
      swift_once();
    }
    uint64_t v94 = sub_100054EA0();
    sub_1000096F4(v94, (uint64_t)qword_100069F08);
    uint64_t v95 = sub_100054E80();
    os_log_type_t v96 = sub_100055CB0();
    if (os_log_type_enabled(v95, v96))
    {
      uint64_t v97 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v97 = 0;
      _os_log_impl((void *)&_mh_execute_header, v95, v96, "ScreenTime is disabled.", v97, 2u);
      swift_slowDealloc();
    }

    uint64_t v98 = type metadata accessor for UsageData();
    uint64_t v99 = v320;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 56))(v320, 1, 1, v98);
    if (v65) {
      uint64_t v100 = 257;
    }
    else {
      uint64_t v100 = 1;
    }
    v66(v99, 0, 0, v100);

    uint64_t v101 = (uint64_t)v99;
    goto LABEL_142;
  }
  int v308 = (int)v65;
  if (qword_1000698E8 != -1) {
LABEL_149:
  }
    swift_once();
  v307 = v66;
  uint64_t v68 = sub_100054EA0();
  uint64_t v310 = sub_1000096F4(v68, (uint64_t)qword_100069F08);
  uint64_t v69 = sub_100054E80();
  os_log_type_t v70 = sub_100055CB0();
  if (os_log_type_enabled(v69, v70))
  {
    int v71 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v71 = 0;
    _os_log_impl((void *)&_mh_execute_header, v69, v70, "ScreenTime is enabled.", v71, 2u);
    swift_slowDealloc();
  }

  uint64_t v72 = self;
  id v326 = 0;
  id v73 = [v72 fetchOrCreateUsageRequestForUser:a2 inContext:v50 error:&v326];
  os_log_t v74 = v318;
  if (!v73)
  {
    id v108 = v326;
    uint64_t v102 = (void *)sub_100054AA0();

    swift_willThrow();
    swift_bridgeObjectRelease();

    goto LABEL_51;
  }
  uint64_t v75 = v73;
  unint64_t v297 = v55;
  id v76 = v326;
  sub_100054C00();
  Class isa = sub_100054B70().super.isa;
  [v75 setRequestedDate:isa];

  id v296 = v75;
  [v75 setIsBackgroundTask:1];
  id v78 = [objc_allocWithZone((Class)NSDateFormatter) init];
  uint64_t v79 = (void (*)(void, void, void))v74[2].isa;
  uint64_t v80 = v314;
  v315 = (void (*)(char *, void, void, uint64_t))v28;
  os_log_t v294 = v74 + 2;
  v293 = v79;
  v79(v314, v28, v319);
  id v81 = v78;
  uint64_t v82 = sub_100054E80();
  os_log_type_t v83 = sub_100055CB0();
  uint64_t v84 = a2;
  a2 = (void (*)(char *, void, void, uint64_t))v83;
  BOOL v85 = os_log_type_enabled(v82, v83);
  uint64_t v28 = (uint64_t)&selRef_initWithFormat_;
  v306 = v84;
  v303 = v50;
  id v305 = v81;
  if (v85)
  {
    uint64_t v86 = (uint8_t *)swift_slowAlloc();
    v302 = swift_slowAlloc();
    id v326 = v302;
    *(_DWORD *)uint64_t v86 = 136446210;
    id v301 = v86 + 4;
    Class v87 = sub_100054B70().super.isa;
    id v88 = [v81 stringFromDate:v87];

    uint64_t v89 = sub_100055A10();
    os_log_t v90 = v74;
    unint64_t v92 = v91;

    id v323 = (id)sub_10001C000(v89, v92, (uint64_t *)&v326);
    uint64_t v93 = v306;
    sub_100055D70();

    uint64_t v50 = v303;
    swift_bridgeObjectRelease();
    unint64_t v55 = (unint64_t)v90[1].isa;
    ((void (*)(char *, uint64_t))v55)(v80, v319);
    _os_log_impl((void *)&_mh_execute_header, v82, (os_log_type_t)a2, "Creating usage request with timestamp %{public}s", v86, 0xCu);
    uint64_t v28 = (uint64_t)v302;
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v93 = v84;

    unint64_t v55 = (unint64_t)v74[1].isa;
    ((void (*)(char *, uint64_t))v55)(v80, v319);
  }

  id v326 = 0;
  unsigned int v109 = [v50 save:&v326];
  uint64_t v66 = v315;
  if (!v109)
  {
    id v114 = v326;
    uint64_t v102 = (void *)sub_100054AA0();

    swift_willThrow();
    ((void (*)(void (*)(char *, void, void, uint64_t), uint64_t))v55)(v66, v319);
LABEL_50:
    swift_bridgeObjectRelease();
LABEL_51:
    LODWORD(v28) = 1;
    a2 = v307;
LABEL_52:
    id v326 = v102;
    sub_100005EB4(&qword_10006A090);
    sub_10001F0C0(0, &qword_10006A098);
    swift_dynamicCast();
    id v64 = v323;
    if (qword_1000698E8 == -1)
    {
LABEL_53:
      uint64_t v115 = sub_100054EA0();
      sub_1000096F4(v115, (uint64_t)qword_100069F08);
      uint64_t v116 = v64;
      uint64_t v117 = sub_100054E80();
      os_log_type_t v118 = sub_100055C90();
      if (os_log_type_enabled(v117, v118))
      {
        v307 = a2;
        uint64_t v119 = swift_slowAlloc();
        LODWORD(v322) = v28;
        uint64_t v28 = v119;
        uint64_t v120 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 138543362;
        v325 = v116;
        uint64_t v121 = v50;
        int v122 = v116;
        a2 = v307;
        sub_100055D70();
        void *v120 = v116;

        uint64_t v50 = v121;
        _os_log_impl((void *)&_mh_execute_header, v117, v118, "Failed to fetch local user: %{public}@", (uint8_t *)v28, 0xCu);
        sub_100005EB4(&qword_10006A0A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        LODWORD(v28) = v322;
        swift_slowDealloc();
      }
      else
      {

        uint64_t v117 = v116;
      }

      uint64_t v123 = type metadata accessor for UsageData();
      uint64_t v124 = (uint64_t)v320;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v123 - 8) + 56))(v320, 1, 1, v123);
      if (v308) {
        int v125 = 256;
      }
      else {
        int v125 = 0;
      }
      a2((char *)v124, 0, 0, v125 | v28);

      sub_100005FA8(v124, &qword_10006A088);
      swift_errorRelease();
      return;
    }
LABEL_147:
    swift_once();
    goto LABEL_53;
  }
  uint64_t v289 = a9;
  v314 = &v324;
  os_log_t v110 = v318 + 1;
  id v111 = v326;
  uint64_t v112 = 1;
  uint64_t v65 = &selRef_initWithFormat_;
  *(void *)&long long v113 = 136380931;
  long long v292 = v113;
  v291 = (char *)&type metadata for Any + 8;
  *(void *)&long long v113 = 138543362;
  long long v290 = v113;
  *(void *)&long long v113 = 134349314;
  long long v295 = v113;
  v302 = v110;
  while (1)
  {
    os_log_t v318 = (os_log_t)v112;
    sleep(2u);
    id v128 = [v93 v65[37]];

    if (!v128) {
      break;
    }
    id v129 = [v93 v65[37]];
    if (!v129
      || (int v130 = v129, v131 = [v129 device],
                       v130,
                       !v131))
    {
      v177 = sub_100054E80();
      os_log_type_t v178 = sub_100055C90();
      if (os_log_type_enabled(v177, v178))
      {
        uint64_t v179 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v179 = 0;
        _os_log_impl((void *)&_mh_execute_header, v177, v178, "The user local device state did not contain device information.", v179, 2u);
        swift_slowDealloc();
      }

      uint64_t v180 = type metadata accessor for UsageData();
      uint64_t v181 = (uint64_t)v320;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v180 - 8) + 56))(v320, 1, 1, v180);
      if (v308) {
        uint64_t v182 = 257;
      }
      else {
        uint64_t v182 = 1;
      }
      v307((char *)v181, 0, 1, v182);

      sub_100005FA8(v181, &qword_10006A088);
      v183 = (void (*)(void, void, void, void))v315;
      goto LABEL_130;
    }
    id v132 = [self fetchRequestMatchingUser:v93 device:v131];
    id v326 = 0;
    id v133 = [v132 execute:&v326];

    uint64_t v28 = (uint64_t)v326;
    if (v133)
    {
      sub_10001F0C0(0, &qword_10006A0B0);
      unint64_t v134 = sub_100055B60();
      id v135 = (id)v28;

      goto LABEL_70;
    }
    id v162 = v326;
    uint64_t v102 = (void *)sub_100054AA0();

    uint64_t v28 = (uint64_t)v102;
    swift_willThrow();

LABEL_83:
    id v326 = v102;
    swift_errorRetain();
    sub_100005EB4(&qword_10006A090);
    sub_10001F0C0(0, &qword_10006A098);
    if (!swift_dynamicCast())
    {
      ((void (*)(void (*)(char *, void, void, uint64_t), uint64_t))v55)(v315, v319);

      swift_errorRelease();
      goto LABEL_50;
    }
    swift_errorRelease();
    id v164 = v323;
    if (v316)
    {
      unint64_t v165 = v322;
      swift_bridgeObjectRetain_n();
      id v166 = v164;
      uint64_t v167 = sub_100054E80();
      os_log_type_t v168 = sub_100055C90();
      a2 = (void (*)(char *, void, void, uint64_t))v168;
      if (os_log_type_enabled(v167, v168))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v169 = swift_slowAlloc();
        id v301 = (id)v55;
        v170 = (void *)v169;
        v325 = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = v292;
        swift_bridgeObjectRetain();
        *(void *)(v28 + 4) = sub_10001C000(v304, v165, (uint64_t *)&v325);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v28 + 12) = 2114;
        *(void *)(v28 + 14) = v166;
        void *v170 = v166;

        _os_log_impl((void *)&_mh_execute_header, v167, (os_log_type_t)a2, "Failed to fetch usage for user with dsid %{private}s: %{public}@", (uint8_t *)v28, 0x16u);
        sub_100005EB4(&qword_10006A0A0);
        swift_arrayDestroy();
        unint64_t v55 = (unint64_t)v301;
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v93 = v306;
      os_log_t v110 = v302;
    }
    else
    {
      id v171 = v323;
      uint64_t v172 = sub_100054E80();
      os_log_type_t v173 = sub_100055C90();
      uint64_t v28 = v173;
      if (os_log_type_enabled(v172, v173))
      {
        uint64_t v174 = swift_slowAlloc();
        uint64_t v175 = (void *)swift_slowAlloc();
        a2 = (void (*)(char *, void, void, uint64_t))v55;
        *(_DWORD *)uint64_t v174 = v290;
        *(void *)(v174 + 4) = v171;
        *uint64_t v175 = v171;
        _os_log_impl((void *)&_mh_execute_header, v172, (os_log_type_t)v28, "Failed to fetch usage for local user: %{public}@", (uint8_t *)v174, 0xCu);
        sub_100005EB4(&qword_10006A0A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
    }
    os_log_t v126 = v318;
    uint64_t v65 = &selRef_initWithFormat_;
    swift_errorRelease();
    if (v126 == (os_log_t)5)
    {
      ((void (*)(void (*)(char *, void, void, uint64_t), uint64_t))v55)(v315, v319);
      swift_bridgeObjectRelease();

      return;
    }
LABEL_62:
    BOOL v127 = __OFADD__(v126, 1);
    uint64_t v112 = (uint64_t)&v126->isa + 1;
    if (v127)
    {
      __break(1u);
LABEL_145:
      uint64_t v66 = a2;
      id v67 = (id)sub_100055E10();
      goto LABEL_26;
    }
  }
  id v136 = [self fetchRequestMatchingUser:v93 device:0];
  id v326 = 0;
  id v131 = [v136 execute:&v326];

  id v137 = v326;
  if (!v131)
  {
    id v163 = v326;
    uint64_t v102 = (void *)sub_100054AA0();

    uint64_t v28 = (uint64_t)v102;
    swift_willThrow();
    goto LABEL_83;
  }
  sub_10001F0C0(0, &qword_10006A0B0);
  unint64_t v134 = sub_100055B60();
  id v138 = v137;
LABEL_70:

  if (v134 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v176 = sub_100055F30();
    swift_bridgeObjectRelease();
    if (v176) {
      goto LABEL_72;
    }
LABEL_100:
    swift_bridgeObjectRelease();
    if (v316)
    {
      unint64_t v184 = v322;
      swift_bridgeObjectRetain_n();
      v185 = sub_100054E80();
      os_log_type_t v186 = sub_100055C90();
      BOOL v187 = os_log_type_enabled(v185, v186);
      v188 = (void (*)(void, void, void, void))v315;
      if (!v187)
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_126;
      }
      v189 = (uint8_t *)swift_slowAlloc();
      id v326 = (id)swift_slowAlloc();
      id v301 = (id)v55;
      *(_DWORD *)v189 = 136380675;
      swift_bridgeObjectRetain();
      id v323 = (id)sub_10001C000(v304, v184, (uint64_t *)&v326);
      v188 = (void (*)(void, void, void, void))v315;
      unint64_t v55 = (unint64_t)v301;
      sub_100055D70();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v185, v186, "Fetching usage for user with dsid %{private}s returned empty results", v189, 0xCu);
      swift_arrayDestroy();
      uint64_t v93 = v306;
      swift_slowDealloc();
    }
    else
    {
      v185 = sub_100054E80();
      os_log_type_t v249 = sub_100055C90();
      BOOL v250 = os_log_type_enabled(v185, v249);
      v188 = (void (*)(void, void, void, void))v315;
      if (!v250)
      {
LABEL_112:

LABEL_126:
        int v277 = v308;
        uint64_t v278 = type metadata accessor for UsageData();
        uint64_t v279 = (uint64_t)v320;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v278 - 8) + 56))(v320, 1, 1, v278);
        if (v277) {
          uint64_t v280 = 257;
        }
        else {
          uint64_t v280 = 1;
        }
        v307((char *)v279, 0, 1, v280);

        sub_100005FA8(v279, &qword_10006A088);
        v183 = v188;
LABEL_130:
        ((void (*)(void, void))v55)(v183, v319);
        goto LABEL_143;
      }
      v251 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v251 = 0;
      _os_log_impl((void *)&_mh_execute_header, v185, v249, "Fetching usage for local user returned empty results.", v251, 2u);
    }
    swift_slowDealloc();
    goto LABEL_112;
  }
  if (!*(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_100;
  }
LABEL_72:
  if ((v134 & 0xC000000000000001) != 0)
  {
    id v139 = (id)sub_100055E10();
  }
  else
  {
    if (!*(void *)((v134 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_149;
    }
    id v139 = *(id *)(v134 + 32);
  }
  uint64_t v140 = v139;
  swift_bridgeObjectRelease();
  [v50 refreshObject:v140 mergeChanges:1];
  id v141 = v305;
  id v142 = v140;
  id v143 = v141;
  uint64_t v28 = (uint64_t)v142;
  uint64_t v144 = sub_100054E80();
  os_log_type_t v145 = sub_100055CB0();
  int v146 = v145;
  BOOL v147 = os_log_type_enabled(v144, v145);
  id v301 = v143;
  if (v147)
  {
    uint64_t v148 = swift_slowAlloc();
    int v300 = v146;
    uint64_t v149 = v148;
    v299 = (void *)swift_slowAlloc();
    id v326 = v299;
    *(_DWORD *)uint64_t v149 = v295;
    id v323 = v318;
    sub_100055D70();
    *(_WORD *)(v149 + 12) = 2082;
    uint64_t v298 = v149 + 14;
    id v150 = [(id)v28 lastUpdatedDate];
    uint64_t v151 = v317;
    sub_100054BE0();

    Class v152 = sub_100054B70().super.isa;
    ((void (*)(uint64_t, uint64_t))v55)(v151, v319);
    unint64_t v153 = v55;
    id v154 = [v143 stringFromDate:v152];

    uint64_t v155 = sub_100055A10();
    unint64_t v157 = v156;

    unint64_t v55 = v153;
    uint64_t v158 = v302;
    id v323 = (id)sub_10001C000(v155, v157, (uint64_t *)&v326);
    sub_100055D70();

    uint64_t v159 = &selRef_initWithFormat_;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v144, (os_log_type_t)v300, "Attempt %{public}ld: Usage retrieved as of %{public}s", (uint8_t *)v149, 0x16u);
    swift_arrayDestroy();
    a2 = (void (*)(char *, void, void, uint64_t))v303;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    a2 = (void (*)(char *, void, void, uint64_t))v50;

    uint64_t v151 = v317;
    uint64_t v159 = &selRef_initWithFormat_;
    uint64_t v158 = v110;
  }
  id v160 = [(id)v28 v159[41]];
  sub_100054BE0();

  sub_1000211D0(&qword_100069ED8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v161 = v319;
  LOBYTE(v160) = sub_1000559B0();
  uint64_t v66 = (void (*)(char *, void, void, uint64_t))v55;
  ((void (*)(uint64_t, uint64_t))v55)(v151, v161);
  uint64_t v65 = &selRef_initWithFormat_;
  if (v160)
  {
    os_log_t v110 = v158;
    os_log_t v126 = v318;
    if (v318 != (os_log_t)5)
    {
      uint64_t v50 = a2;

      uint64_t v93 = v306;
      goto LABEL_62;
    }
    uint64_t v220 = v311;
    uint64_t v221 = v319;
    v293(v311, v315, v319);
    id v222 = v301;
    id v223 = (id)v28;
    id v224 = v222;
    id v225 = v223;
    v226 = sub_100054E80();
    os_log_type_t v227 = sub_100055C90();
    int v228 = v227;
    BOOL v229 = os_log_type_enabled(v226, v227);
    v230 = v306;
    if (v229)
    {
      uint64_t v231 = v220;
      uint64_t v232 = swift_slowAlloc();
      v320 = (char *)swift_slowAlloc();
      id v326 = v320;
      *(_DWORD *)uint64_t v232 = 136446466;
      LODWORD(v318) = v228;
      id v233 = [v225 lastUpdatedDate];
      os_log_t v316 = v226;
      id v234 = v233;
      uint64_t v235 = v317;
      sub_100054BE0();

      Class v236 = sub_100054B70().super.isa;
      ((void (*)(uint64_t, uint64_t))v55)(v235, v221);
      id v237 = [v224 stringFromDate:v236];
      id v301 = (id)v55;
      id v238 = v237;

      uint64_t v239 = sub_100055A10();
      unint64_t v241 = v240;

      id v323 = (id)sub_10001C000(v239, v241, (uint64_t *)&v326);
      sub_100055D70();

      swift_bridgeObjectRelease();
      *(_WORD *)(v232 + 12) = 2082;
      Class v242 = sub_100054B70().super.isa;
      id v243 = [v224 stringFromDate:v242];

      uint64_t v244 = sub_100055A10();
      unint64_t v246 = v245;

      id v323 = (id)sub_10001C000(v244, v246, (uint64_t *)&v326);
      v247 = (void (*)(uint64_t, uint64_t))v301;
      sub_100055D70();

      swift_bridgeObjectRelease();
      v247(v231, v319);
      os_log_t v248 = v316;
      _os_log_impl((void *)&_mh_execute_header, v316, (os_log_type_t)v318, "Returning the usage updated at %{public}s but requested at %{public}s", (uint8_t *)v232, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      v230 = v306;
      swift_slowDealloc();
    }
    else
    {

      v247 = (void (*)(uint64_t, uint64_t))v55;
      ((void (*)(uint64_t, uint64_t))v55)(v220, v221);
    }
    unint64_t v264 = v322;
    v265 = v225;
    swift_bridgeObjectRetain();
    uint64_t v266 = sub_100019678(v304, v264);
    v267 = (void (*)(uint64_t, void, void, uint64_t))v307;
    if ((v268 & 1) == 0)
    {
      id v269 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v266];
      v270 = v230;
      id v271 = [v230 appleID];
      v272 = v303;
      if (v271)
      {
        v273 = v271;
        uint64_t v274 = sub_100055A10();
        v276 = v275;
      }
      else
      {
        uint64_t v274 = 0;
        v276 = 0;
      }
      sub_1000198C8(v265, v269, v313, v289, v274, v276, v267, v321);

      swift_bridgeObjectRelease();
      v247((uint64_t)v315, v319);
      goto LABEL_143;
    }
LABEL_151:
    __break(1u);
    return;
  }
  uint64_t v190 = v312;
  uint64_t v191 = v319;
  v293(v312, v315, v319);
  id v192 = v301;
  id v193 = (id)v28;
  id v194 = v192;
  id v195 = v193;
  v196 = sub_100054E80();
  os_log_type_t v197 = sub_100055CB0();
  int v198 = v197;
  if (os_log_type_enabled(v196, v197))
  {
    uint64_t v199 = swift_slowAlloc();
    v320 = (char *)swift_slowAlloc();
    id v326 = v320;
    *(_DWORD *)uint64_t v199 = 136446466;
    os_log_t v318 = v196;
    id v200 = [v195 lastUpdatedDate];
    LODWORD(v316) = v198;
    id v201 = v200;
    uint64_t v202 = v317;
    sub_100054BE0();

    Class v203 = sub_100054B70().super.isa;
    ((void (*)(uint64_t, uint64_t))v66)(v202, v191);
    id v204 = [v194 stringFromDate:v203];
    id v301 = v66;
    v205 = v195;
    id v206 = v204;

    uint64_t v207 = sub_100055A10();
    unint64_t v209 = v208;

    id v323 = (id)sub_10001C000(v207, v209, (uint64_t *)&v326);
    sub_100055D70();

    swift_bridgeObjectRelease();
    *(_WORD *)(v199 + 12) = 2082;
    uint64_t v210 = v312;
    Class v211 = sub_100054B70().super.isa;
    id v212 = [v194 stringFromDate:v211];

    uint64_t v213 = sub_100055A10();
    unint64_t v215 = v214;

    id v323 = (id)sub_10001C000(v213, v215, (uint64_t *)&v326);
    id v195 = v205;
    v216 = (void (*)(uint64_t, uint64_t))v301;
    sub_100055D70();

    swift_bridgeObjectRelease();
    v216(v210, v191);
    os_log_t v217 = v318;
    _os_log_impl((void *)&_mh_execute_header, v318, (os_log_type_t)v316, "Returning the usage updated at %{public}s requested at %{public}s", (uint8_t *)v199, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    v218 = v306;
    swift_slowDealloc();

    unint64_t v219 = v322;
  }
  else
  {

    v216 = (void (*)(uint64_t, uint64_t))v66;
    ((void (*)(uint64_t, uint64_t))v66)(v190, v191);

    unint64_t v219 = v322;
    v218 = v306;
  }
  v252 = v195;
  swift_bridgeObjectRetain();
  uint64_t v253 = sub_100019678(v304, v219);
  v254 = (void (*)(uint64_t, void, void, uint64_t))v307;
  if (v255)
  {
    __break(1u);
    goto LABEL_151;
  }
  id v256 = [objc_allocWithZone((Class)NSNumber) initWithInteger:v253];
  v257 = v218;
  id v258 = [v218 appleID];
  v259 = v303;
  if (v258)
  {
    v260 = v258;
    uint64_t v261 = sub_100055A10();
    v263 = v262;
  }
  else
  {
    uint64_t v261 = 0;
    v263 = 0;
  }
  sub_1000198C8(v252, v256, v313, v289, v261, v263, v254, v321);

  swift_bridgeObjectRelease();
  v216((uint64_t)v315, v319);
LABEL_143:
  swift_bridgeObjectRelease();
}

uint64_t sub_100019678(uint64_t result, unint64_t a2)
{
  uint64_t v3 = HIBYTE(a2) & 0xF;
  uint64_t v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0) {
        id v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      }
      else {
        id v6 = (unsigned __int8 *)sub_100055E20();
      }
      uint64_t v7 = (uint64_t)sub_10001E218(v6, v4, 10);
      char v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3) {
        goto LABEL_50;
      }
      if (v3 == 1 || (BYTE1(result) - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (BYTE1(result) - 48);
      uint64_t v14 = v3 - 2;
      if (v14)
      {
        uint64_t v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          unsigned int v16 = *v15 - 48;
          if (v16 > 9) {
            goto LABEL_34;
          }
          uint64_t v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v17 + v16;
          if (__OFADD__(v17, v16)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v15;
          if (!--v14) {
            goto LABEL_37;
          }
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            uint64_t v7 = -(uint64_t)(BYTE1(result) - 48);
            uint64_t v10 = v3 - 2;
            if (v10)
            {
              uint64_t v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                unsigned int v12 = *v11 - 48;
                if (v12 > 9) {
                  goto LABEL_34;
                }
                uint64_t v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
                  goto LABEL_34;
                }
                uint64_t v7 = v13 - v12;
                if (__OFSUB__(v13, v12)) {
                  goto LABEL_34;
                }
                char v9 = 0;
                ++v11;
                if (!--v10) {
                  goto LABEL_37;
                }
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          uint64_t v7 = 0;
          char v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u) {
        goto LABEL_34;
      }
      uint64_t v7 = (result - 48);
      uint64_t v18 = v3 - 1;
      if (v18)
      {
        uint64_t v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          unsigned int v20 = *v19 - 48;
          if (v20 > 9) {
            goto LABEL_34;
          }
          uint64_t v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63) {
            goto LABEL_34;
          }
          uint64_t v7 = v21 + v20;
          if (__OFADD__(v21, v20)) {
            goto LABEL_34;
          }
          char v9 = 0;
          ++v19;
          if (!--v18) {
            goto LABEL_37;
          }
        }
      }
    }
LABEL_36:
    char v9 = 0;
    goto LABEL_37;
  }
  uint64_t v7 = (uint64_t)sub_10001E130(result, a2, 10);
  char v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if (v9) {
    return 0;
  }
  else {
    return v7;
  }
}

uint64_t sub_1000198C8(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(uint64_t, void, void, uint64_t), uint64_t a8)
{
  uint64_t v126 = a8;
  uint64_t v121 = a7;
  NSString v100 = a6;
  uint64_t v99 = a5;
  uint64_t v106 = a4;
  uint64_t v98 = a3;
  id v104 = a2;
  id v113 = a1;
  uint64_t v8 = sub_100005EB4(&qword_10006A088);
  __chkstk_darwin(v8 - 8);
  uint64_t v101 = (char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = sub_1000557C0();
  uint64_t v111 = *(void *)(v112 - 8);
  __chkstk_darwin(v112);
  unsigned int v109 = (char *)&v98 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_1000557F0();
  uint64_t v108 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  int v107 = (char *)&v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_t v115 = (dispatch_group_t)type metadata accessor for UsageData();
  Class isa = v115[-1].isa;
  uint64_t v12 = __chkstk_darwin(v115);
  uint64_t v105 = (uint64_t)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = v13;
  __chkstk_darwin(v12);
  id v114 = (uint64_t *)((char *)&v98 - v14);
  uint64_t v15 = sub_100054A10();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v98 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100054C10();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v98 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v98 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v29 = (char *)&v98 - v28;
  __chkstk_darwin(v27);
  id v31 = (char *)&v98 - v30;
  uint64_t v124 = sub_100054CD0();
  uint64_t v122 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v33 = (char *)&v98 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100054C90();
  sub_100054C00();
  uint64_t v119 = v33;
  sub_100054C40();
  unint64_t v34 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v118 = v20 + 8;
  uint64_t v117 = v34;
  v34(v29, v19);
  sub_100054C00();
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  uint64_t v120 = v31;
  v35(v29, v31, v19);
  uint64_t v123 = v26;
  uint64_t v125 = v19;
  v35(v23, v26, v19);
  id v36 = v113;
  sub_1000549F0();
  id v37 = objc_allocWithZone((Class)STUsageReporter);
  Class v38 = sub_1000549C0().super.isa;
  id v39 = [v37 initWithUsage:v36 dateInterval:v38];

  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  aBlock = 0;
  if ([v39 generateReport:&aBlock])
  {
    uint64_t v40 = aBlock;
    id v41 = [v39 applicationAndWebUsage];
    sub_10001F0C0(0, &qword_10006A108);
    uint64_t v42 = sub_100055B60();

    id v43 = [v39 categoryRatiosPerCalendarUnit:32 numberOfCategories:3];
    sub_100005EB4(&qword_10006A110);
    uint64_t v44 = sub_100055B60();

    id v45 = [v39 categoryUsage];
    uint64_t v46 = sub_100055B60();

    id v47 = [v39 screenTimeUsagePerCalendarUnit:32];
    uint64_t v48 = sub_100055B60();

    [v39 totalScreenTime];
    uint64_t v50 = v49;
    id v51 = [v36 lastUpdatedDate];
    id v52 = v114;
    sub_100054BE0();

    *id v52 = v42;
    v52[1] = v44;
    v52[2] = v46;
    v52[3] = v48;
    v52[4] = v50;
    sub_100013210(6);
    uint64_t v54 = v53;
    unint64_t v55 = dispatch_group_create();
    dispatch_group_enter(v55);
    id v56 = (void *)swift_allocObject();
    v56[2] = v54;
    v56[3] = v55;
    v56[4] = v102;
    uint64_t v57 = self;
    swift_bridgeObjectRetain();
    dispatch_group_t v115 = v55;
    swift_retain();
    id v58 = [v57 sharedCache];
    Class v59 = sub_100055BE0().super.isa;
    id v131 = sub_10001EAF4;
    id v132 = v56;
    aBlock = _NSConcreteStackBlock;
    uint64_t v128 = 1107296256;
    id v129 = sub_1000130F8;
    int v130 = &unk_100066948;
    id v60 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v58 fetchAppInfoForBundleIdentifiers:v59 completionHandler:v60];
    _Block_release(v60);
    swift_release();
    swift_bridgeObjectRelease();

    uint64_t v61 = swift_allocObject();
    *(void *)(v61 + 16) = 0;
    uint64_t v62 = (uint64_t)v104;
    uint64_t v63 = (uint64_t)[v104 integerValue];
    uint64_t v64 = v106;
    if (v63 >= 1)
    {
      if (v106)
      {
        dispatch_group_t v65 = v115;
        dispatch_group_enter(v115);
        uint64_t v66 = swift_allocObject();
        *(void *)(v66 + 16) = v61;
        *(void *)(v66 + 24) = v65;
        id v67 = v65;
        swift_retain();
        sub_100009928(v62, v98, v64, v99, v100, (uint64_t)sub_10001ED4C, v66);
        swift_release();
      }
    }
    sub_10001F0C0(0, &qword_10006A080);
    uint64_t v68 = (void *)sub_100055D00();
    uint64_t v69 = v105;
    sub_10001EA2C((uint64_t)v52, v105, (uint64_t (*)(void))type metadata accessor for UsageData);
    unint64_t v70 = (*((unsigned __int8 *)isa + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)isa + 80);
    unint64_t v71 = (v103 + v70 + 7) & 0xFFFFFFFFFFFFFFF8;
    uint64_t v72 = swift_allocObject();
    uint64_t v73 = v126;
    *(void *)(v72 + 16) = v121;
    *(void *)(v72 + 24) = v73;
    sub_100021218(v69, v72 + v70, (uint64_t (*)(void))type metadata accessor for UsageData);
    unint64_t v74 = v72 + v71;
    *(void *)unint64_t v74 = v61;
    *(_WORD *)(v74 + 8) = 257;
    id v131 = sub_10001EC60;
    id v132 = (void *)v72;
    aBlock = _NSConcreteStackBlock;
    uint64_t v128 = 1107296256;
    id v129 = sub_100015744;
    int v130 = &unk_1000669C0;
    uint64_t v75 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    id v76 = v107;
    sub_1000557D0();
    unint64_t v134 = _swiftEmptyArrayStorage;
    sub_1000211D0(&qword_10006A068, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100005EB4(&qword_10006A070);
    sub_10000D120(&qword_10006A078, &qword_10006A070);
    uint64_t v77 = v109;
    uint64_t v78 = v112;
    sub_100055D90();
    dispatch_group_t v79 = v115;
    sub_100055CC0();
    _Block_release(v75);

    (*(void (**)(char *, uint64_t))(v111 + 8))(v77, v78);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v76, v110);
    sub_10001BDE0((uint64_t)v114, (uint64_t (*)(void))type metadata accessor for UsageData);
    uint64_t v80 = v125;
    id v81 = v117;
    v117(v123, v125);
    v81(v120, v80);
    (*(void (**)(char *, uint64_t))(v122 + 8))(v119, v124);
    swift_release();
    return swift_release();
  }
  else
  {
    os_log_type_t v83 = aBlock;
    uint64_t v84 = (void **)sub_100054AA0();

    swift_willThrow();
    aBlock = v84;
    sub_100005EB4(&qword_10006A090);
    sub_10001F0C0(0, &qword_10006A098);
    swift_dynamicCast();
    BOOL v85 = v134;
    if (qword_1000698E8 != -1) {
      swift_once();
    }
    uint64_t v86 = sub_100054EA0();
    sub_1000096F4(v86, (uint64_t)qword_100069F08);
    Class v87 = v85;
    id v88 = sub_100054E80();
    os_log_type_t v89 = sub_100055C90();
    if (os_log_type_enabled(v88, v89))
    {
      os_log_t v90 = (uint8_t *)swift_slowAlloc();
      id v91 = v39;
      unint64_t v92 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_t v90 = 138543362;
      id v133 = v87;
      uint64_t v93 = v87;
      sub_100055D70();
      *unint64_t v92 = v87;

      _os_log_impl((void *)&_mh_execute_header, v88, v89, "Failed to generate usage report: %{public}@", v90, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      id v39 = v91;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v88 = v87;
    }
    dispatch_group_t v94 = v115;

    uint64_t v95 = (uint64_t)v101;
    (*((void (**)(char *, uint64_t, uint64_t, dispatch_group_t))isa + 7))(v101, 1, 1, v94);
    v121(v95, 0, 0, 257);

    sub_100005FA8(v95, &qword_10006A088);
    uint64_t v96 = v125;
    uint64_t v97 = v117;
    v117(v123, v125);
    v97(v120, v96);
    (*(void (**)(char *, uint64_t))(v122 + 8))(v119, v124);
    return swift_errorRelease();
  }
}

void sub_10001A770(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = a2 + 56;
  uint64_t v4 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  uint64_t v6 = v5 & *(void *)(a2 + 56);
  int64_t v18 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    int64_t v14 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v14 >= v18) {
      goto LABEL_21;
    }
    uint64_t v15 = *(void *)(v17 + 8 * v14);
    ++v7;
    if (!v15)
    {
      int64_t v7 = v14 + 1;
      if (v14 + 1 >= v18) {
        goto LABEL_21;
      }
      uint64_t v15 = *(void *)(v17 + 8 * v7);
      if (!v15)
      {
        int64_t v7 = v14 + 2;
        if (v14 + 2 >= v18) {
          goto LABEL_21;
        }
        uint64_t v15 = *(void *)(v17 + 8 * v7);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    uint64_t v6 = (v15 - 1) & v15;
LABEL_5:
    swift_bridgeObjectRetain();
    dispatch_group_enter(a3);
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = a3;
    uint64_t v9 = self;
    uint64_t v10 = a3;
    NSString v11 = sub_100055A00();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = sub_10001F0FC;
    *(void *)(v12 + 24) = v8;
    aBlock[4] = sub_10001F13C;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000986C;
    aBlock[3] = &unk_100066A60;
    uint64_t v13 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v9 iconImageForBundleIdentifier:v11 completionHandler:v13];
    _Block_release(v13);
    swift_release();
    swift_bridgeObjectRelease();
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v18)
  {
LABEL_21:
    swift_release();
    dispatch_group_leave(a3);
    return;
  }
  uint64_t v15 = *(void *)(v17 + 8 * v16);
  if (v15)
  {
    int64_t v7 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v7 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v7 >= v18) {
      goto LABEL_21;
    }
    uint64_t v15 = *(void *)(v17 + 8 * v7);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
}

void sub_10001AA30(void *a1, uint64_t a2, NSObject *a3)
{
  swift_beginAccess();
  uint64_t v6 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;

  id v7 = a1;
  dispatch_group_leave(a3);
}

uint64_t sub_10001AA94(void (*a1)(char *, void *, uint64_t, void), uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v9 = sub_100005EB4(&qword_10006A088);
  __chkstk_darwin(v9 - 8);
  NSString v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001EA2C(a3, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for UsageData);
  uint64_t v12 = type metadata accessor for UsageData();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  swift_beginAccess();
  uint64_t v13 = *(void **)(a4 + 16);
  id v14 = v13;
  a1(v11, v13, 1, a5 & 0x101);

  return sub_100005FA8((uint64_t)v11, &qword_10006A088);
}

uint64_t sub_10001ABE4()
{
  sub_10001E980(v0 + 16);
  sub_10001E980(v0 + 56);
  sub_10001E980(v0 + 96);

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for CoreDataUsageProvider()
{
  return self;
}

uint64_t sub_10001AC50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001ACB4()
{
  uint64_t v1 = sub_100005EB4(&qword_10006A060);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10001AD48(uint64_t a1)
{
  sub_100005EB4(&qword_10006A060);

  return sub_100013BBC(a1);
}

void *sub_10001ADBC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001AE00(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001AE28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_10001AE50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100054CB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005EB4(&qword_100069950);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  id v88 = (char *)v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  os_log_type_t v89 = (char *)v74 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)v74 - v16;
  __chkstk_darwin(v15);
  uint64_t v95 = (char *)v74 - v18;
  uint64_t v19 = sub_100054C10();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v23 = __chkstk_darwin(v22);
  __chkstk_darwin(v23);
  uint64_t v25 = __chkstk_darwin((char *)v74 - v24);
  uint64_t v26 = __chkstk_darwin(v25);
  unint64_t v92 = (char *)v74 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v97 = (char *)v74 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  dispatch_group_t v94 = (char *)v74 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v93 = a1;
  if (a1 <= 23)
  {
    id v81 = v33;
    uint64_t v82 = v17;
    uint64_t v78 = v32;
    uint64_t v75 = v37;
    uint64_t v76 = v36;
    v74[0] = v35;
    v74[1] = a3;
    uint64_t v86 = a2;
    Class v38 = (char *)v74 - v34;
    sub_100054C40();
    uint64_t v39 = v20;
    uint64_t v40 = v7 + 104;
    id v91 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
    v91(v9, enum case for Calendar.Component.day(_:), v6);
    id v41 = v95;
    uint64_t v96 = v38;
    sub_100054C80();
    uint64_t v44 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
    uint64_t v43 = v7 + 8;
    uint64_t v42 = v44;
    v44(v9, v6);
    id v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48);
    uint64_t v90 = v39 + 48;
    Class v87 = v45;
    uint64_t result = v45(v41, 1, v19);
    if (result != 1)
    {
      uint64_t v80 = v39;
      id v47 = v95;
      uint64_t v95 = *(char **)(v39 + 32);
      uint64_t v79 = v39 + 32;
      ((void (*)(char *, char *, uint64_t))v95)(v94, v47, v19);
      sub_100054C40();
      uint64_t v48 = enum case for Calendar.Component.hour(_:);
      uint64_t v49 = v91;
      v91(v9, enum case for Calendar.Component.hour(_:), v6);
      uint64_t v50 = sub_100054CC0();
      uint64_t result = v42(v9, v6);
      if (__OFADD__(v50, 1))
      {
        __break(1u);
      }
      else
      {
        unsigned int v77 = v48;
        uint64_t v86 = v40;
        v49(v9, v48, v6);
        id v51 = v82;
        sub_100054C80();
        uint64_t v83 = v43;
        uint64_t v84 = v6;
        BOOL v85 = (void (*)(char *, uint64_t))v42;
        v42(v9, v6);
        id v52 = v87;
        uint64_t result = v87(v51, 1, v19);
        if (result == 1)
        {
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
        uint64_t v53 = v92;
        uint64_t v54 = (void (*)(uint64_t, char *, uint64_t))v95;
        ((void (*)(char *, char *, uint64_t))v95)(v92, v51, v19);
        unint64_t v55 = v97;
        char v56 = sub_100054B80();
        uint64_t v57 = v80;
        if (v56)
        {
          (*(void (**)(char *, uint64_t))(v80 + 8))(v53, v19);
          id v58 = v81;
          (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v81, v55, v19);
        }
        else
        {
          id v58 = v81;
          v54((uint64_t)v81, v53, v19);
        }
        uint64_t v59 = v84;
        v54((uint64_t)v53, v58, v19);
        uint64_t v60 = v77;
        uint64_t result = ((uint64_t (*)(char *, void, uint64_t))v91)(v9, v77, v59);
        uint64_t v61 = v85;
        if (!__OFSUB__(0, v93))
        {
          uint64_t v62 = v89;
          sub_100054C80();
          v61(v9, v59);
          uint64_t result = v52(v62, 1, v19);
          if (result != 1)
          {
            uint64_t v63 = v78;
            ((void (*)(uint64_t, char *, uint64_t))v95)(v78, v62, v19);
            if (sub_100054B90())
            {
              (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v63, v19);
              (*(void (**)(uint64_t, char *, uint64_t))(v57 + 16))(v63, v96, v19);
            }
            uint64_t v64 = v84;
            v91(v9, v60, v84);
            dispatch_group_t v65 = v88;
            sub_100054C80();
            v85(v9, v64);
            uint64_t result = v87(v65, 1, v19);
            if (result != 1)
            {
              uint64_t v66 = v63;
              id v67 = v75;
              ((void (*)(char *, char *, uint64_t))v95)(v75, v65, v19);
              uint64_t v68 = v97;
              char v69 = sub_100054B80();
              uint64_t v70 = v76;
              if (v69)
              {
                (*(void (**)(char *, uint64_t))(v57 + 8))(v67, v19);
                unint64_t v71 = *(void (**)(uint64_t, char *, uint64_t))(v57 + 16);
                v71((uint64_t)v67, v68, v19);
              }
              else
              {
                unint64_t v71 = *(void (**)(uint64_t, char *, uint64_t))(v57 + 16);
              }
              uint64_t v72 = v74[0];
              v71(v70, (char *)v66, v19);
              v71(v72, v67, v19);
              sub_1000549F0();
              uint64_t v73 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
              v73((uint64_t)v67, v19);
              v73(v66, v19);
              v73((uint64_t)v92, v19);
              v73((uint64_t)v68, v19);
              v73((uint64_t)v94, v19);
              return ((uint64_t (*)(char *, uint64_t))v73)(v96, v19);
            }
LABEL_25:
            __break(1u);
            return result;
          }
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }

  return sub_100012DA0(a2, a3);
}

uint64_t sub_10001B710()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001B720()
{
  uint64_t v1 = sub_1000558C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v3 | 7;
  uint64_t v6 = *(void *)(v2 + 64) + v4 + 1;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10001B800()
{
  uint64_t v1 = *(void *)(sub_1000558C0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *((void *)v0 + 2);
  uint64_t v4 = (void (*)(unsigned char *))*((void *)v0 + 3);
  uint64_t v5 = *((void *)v0 + 4);
  double v6 = v0[5];
  double v7 = v0[6];
  uint64_t v8 = *((void *)v0 + 7);
  uint64_t v9 = *((void *)v0 + 8);
  int v10 = *((unsigned __int8 *)v0 + v2 + *(void *)(v1 + 64));

  return sub_1000150B8(v3, v4, v5, v8, v9, (uint64_t)v0 + v2, v10, v6, v7);
}

uint64_t sub_10001B894(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001B8A4()
{
  return swift_release();
}

uint64_t sub_10001B8AC()
{
  uint64_t v1 = sub_1000558C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10001B9C0()
{
  uint64_t v1 = *(void *)(sub_1000558C0() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_100015748(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 72), *(double *)(v0 + v3), *(double *)(v0 + v3 + 8), v0 + v2, *(void (**)(unsigned char *))(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10001BA78()
{
  uint64_t v1 = sub_1000558C0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((v4 + *(void *)(v2 + 64)) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10001BB8C(uint64_t a1, void *a2, int a3, __int16 a4)
{
  int v8 = a4 & 0x101;
  uint64_t v9 = *(void *)(sub_1000558C0() - 8);
  unint64_t v10 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v11 = v10 + *(void *)(v9 + 64);
  unint64_t v12 = ((v11 & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFFFF8;
  return sub_100015E30(a1, a2, a3, v8, v4[2], *(double *)((char *)v4 + (v11 & 0xFFFFFFFFFFFFFFF8) + 8), *(double *)((char *)v4 + (v11 & 0xFFFFFFFFFFFFFFF8) + 16), v4[3], v4[4], (uint64_t)v4 + v10, *((unsigned char *)v4 + v11), *(uint64_t *)((char *)v4 + v12), *(uint64_t *)((char *)v4 + v12 + 8), *(void (**)(unsigned char *))((char *)v4 + ((v12 + 23) & 0xFFFFFFFFFFFFFFF8)), *(uint64_t *)((char *)v4 + ((v12 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_10001BC88()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

void sub_10001BCD8(void *a1)
{
  sub_100016F9C(a1, *(void (**)(char *, void, void, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(void *)(v1 + 72));
}

uint64_t type metadata accessor for UsageData()
{
  uint64_t result = qword_10006A1C0;
  if (!qword_10006A1C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10001BD5C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001BD9C()
{
  return sub_10003E6BC(*(uint64_t (**)(uint64_t))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10001BDA8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001BDB8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10001BDE0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001BE40(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_10001BE7C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

void *sub_10001BEAC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_100055F80();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

unsigned char **sub_10001BF50(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10001BF60(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001BF88(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_10001C000(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_100055D70();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_10001C000(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001C0D4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001E9D0((uint64_t)v12, *a3);
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
      sub_10001E9D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001E980((uint64_t)v12);
  return v7;
}

uint64_t sub_10001C0D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100055D80();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001C290(a5, a6);
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
  uint64_t v8 = sub_100055E20();
  if (!v8)
  {
    sub_100055EC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100055F80();
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

uint64_t sub_10001C290(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001C328(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001C584(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001C584(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001C328(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001C4A0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100055DF0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100055EC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100055A70();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100055F80();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100055EC0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001C4A0(uint64_t a1, uint64_t a2)
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
  sub_100005EB4(&qword_10006A0D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001C508(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100055AC0();
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
    uint64_t v5 = sub_100055A90();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10001C584(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005EB4(&qword_10006A0D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10001C6D4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_10001C6FC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_100055D70();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    void *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_10001C7B4()
{
  unint64_t result = qword_10006A0C8;
  if (!qword_10006A0C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A0C8);
  }
  return result;
}

uint64_t sub_10001C808(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100056070();
  swift_bridgeObjectRetain();
  sub_100055A40();
  Swift::Int v8 = sub_1000560A0();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    unint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_100055FE0() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
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
      if (v19 || (sub_100055FE0() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *char v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10001CC98(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *char v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10001C9B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005EB4(&qword_10006A120);
  uint64_t v3 = sub_100055DD0();
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      sub_100056070();
      sub_100055A40();
      uint64_t result = sub_1000560A0();
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_10001CC98(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10001C9B8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10001CE34();
      goto LABEL_22;
    }
    sub_10001CFE8();
  }
  uint64_t v11 = *v4;
  sub_100056070();
  sub_100055A40();
  uint64_t result = sub_1000560A0();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_100055FE0(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_100056010();
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
          uint64_t result = sub_100055FE0();
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
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  Swift::Int *v21 = v8;
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

void *sub_10001CE34()
{
  uint64_t v1 = v0;
  sub_100005EB4(&qword_10006A120);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100055DC0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
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

uint64_t sub_10001CFE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100005EB4(&qword_10006A120);
  uint64_t v3 = sub_100055DD0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_100056070();
    swift_bridgeObjectRetain();
    sub_100055A40();
    uint64_t result = sub_1000560A0();
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
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

void *sub_10001D298(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100005EB4((uint64_t *)&unk_10006ADA0);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10001ED54((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100055F30();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_10001D390(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    if (v5 <= 0)
    {
      unint64_t v8 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = a2 + 56 * a3;
        if (v10 < (unint64_t)&v8[7 * v5 + 4] && (unint64_t)(v8 + 4) < v10 + 56 * v5) {
          goto LABEL_17;
        }
        swift_arrayInitWithCopy();
        return v8;
      }
    }
    else
    {
      sub_100005EB4(&qword_10006A208);
      unint64_t v8 = (void *)swift_allocObject();
      size_t v9 = j__malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 56);
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = (void *)sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10001D524(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10002CC74(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10001D5A0(v6);
  return sub_100055E40();
}

void sub_10001D5A0(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  Swift::Int v5 = sub_100055FB0(v4);
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_132;
    }
    if (v4) {
      sub_10001DD0C(0, v4, 1, a1);
    }
    return;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_140;
  }
  Swift::Int v7 = v5;
  uint64_t v110 = a1;
  if (v4 < 2)
  {
    unint64_t v10 = (char *)_swiftEmptyArrayStorage;
    uint64_t v119 = (uint64_t)_swiftEmptyArrayStorage;
    uint64_t v118 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      unint64_t v13 = _swiftEmptyArrayStorage[2];
LABEL_98:
      uint64_t v102 = v10;
      if (v13 >= 2)
      {
        uint64_t v103 = *v110;
        do
        {
          unint64_t v104 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_127;
          }
          if (!v103) {
            goto LABEL_139;
          }
          uint64_t v105 = v102;
          uint64_t v106 = *(void *)&v102[16 * v104 + 32];
          uint64_t v107 = *(void *)&v102[16 * v13 + 24];
          sub_10001DE04((void **)(v103 + 8 * v106), (id *)(v103 + 8 * *(void *)&v102[16 * v13 + 16]), v103 + 8 * v107, v118);
          if (v2) {
            break;
          }
          if (v107 < v106) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v105 = sub_10002AEE0((uint64_t)v105);
          }
          if (v104 >= *((void *)v105 + 2)) {
            goto LABEL_129;
          }
          uint64_t v108 = &v105[16 * v104 + 32];
          *(void *)uint64_t v108 = v106;
          *((void *)v108 + 1) = v107;
          unint64_t v109 = *((void *)v105 + 2);
          if (v13 > v109) {
            goto LABEL_130;
          }
          memmove(&v105[16 * v13 + 16], &v105[16 * v13 + 32], 16 * (v109 - v13));
          uint64_t v102 = v105;
          *((void *)v105 + 2) = v109 - 1;
          unint64_t v13 = v109 - 1;
        }
        while (v109 > 2);
      }
LABEL_95:
      swift_bridgeObjectRelease();
      *(void *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_100055B70();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v8 = v6 >> 1;
    sub_10001F0C0(0, &qword_10006A108);
    uint64_t v9 = sub_100055B80();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    uint64_t v118 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v119 = v9;
  }
  Swift::Int v114 = v7;
  Swift::Int v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v111 = *a1 - 8;
  uint64_t v112 = *a1 + 16;
  unint64_t v10 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v115 = v4;
  while (1)
  {
    Swift::Int v14 = v11++;
    Swift::Int v116 = v14;
    if (v11 < v4)
    {
      unint64_t v15 = *(void **)(v12 + 8 * v14);
      id v16 = *(id *)(v12 + 8 * v11);
      id v17 = v15;
      [v16 quantity];
      float v19 = v18;
      [v17 quantity];
      float v21 = v20;

      Swift::Int v11 = v14 + 2;
      if (v14 + 2 < v4)
      {
        uint64_t v22 = (id *)(v112 + 8 * v14);
        while (1)
        {
          unint64_t v23 = *(v22 - 1);
          id v24 = *v22;
          id v25 = v23;
          [v24 quantity];
          float v27 = v26;
          [v25 quantity];
          float v29 = v28;

          if (v21 < v19 == v29 >= v27) {
            break;
          }
          ++v11;
          ++v22;
          if (v4 == v11)
          {
            Swift::Int v11 = v4;
            break;
          }
        }
        Swift::Int v14 = v116;
      }
      if (v21 < v19)
      {
        if (v11 < v14) {
          goto LABEL_133;
        }
        if (v14 < v11)
        {
          uint64_t v30 = (uint64_t *)(v111 + 8 * v11);
          Swift::Int v31 = v11;
          Swift::Int v32 = v14;
          uint64_t v33 = (uint64_t *)(v12 + 8 * v14);
          do
          {
            if (v32 != --v31)
            {
              if (!v12) {
                goto LABEL_138;
              }
              uint64_t v34 = *v33;
              *uint64_t v33 = *v30;
              *uint64_t v30 = v34;
            }
            ++v32;
            --v30;
            ++v33;
          }
          while (v32 < v31);
        }
      }
    }
    if (v11 >= v4) {
      goto LABEL_47;
    }
    if (__OFSUB__(v11, v14)) {
      goto LABEL_131;
    }
    if (v11 - v14 >= v114) {
      goto LABEL_47;
    }
    if (__OFADD__(v14, v114)) {
      goto LABEL_134;
    }
    Swift::Int v35 = v14 + v114 >= v4 ? v4 : v14 + v114;
    if (v35 < v14) {
      break;
    }
    if (v11 != v35)
    {
      id v113 = v10;
      uint64_t v36 = v111 + 8 * v11;
      do
      {
        id v37 = *(void **)(v12 + 8 * v11);
        Swift::Int v38 = v14;
        uint64_t v39 = v36;
        do
        {
          uint64_t v40 = *(void **)v39;
          id v41 = v37;
          id v42 = v40;
          [v41 quantity];
          float v44 = v43;
          [v42 quantity];
          float v46 = v45;

          if (v46 >= v44) {
            break;
          }
          if (!v12) {
            goto LABEL_136;
          }
          id v47 = *(void **)v39;
          id v37 = *(void **)(v39 + 8);
          *(void *)uint64_t v39 = v37;
          *(void *)(v39 + 8) = v47;
          v39 -= 8;
          ++v38;
        }
        while (v11 != v38);
        ++v11;
        v36 += 8;
        Swift::Int v14 = v116;
      }
      while (v11 != v35);
      Swift::Int v11 = v35;
      unint64_t v10 = v113;
    }
LABEL_47:
    if (v11 < v14) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v10 = sub_10002AC58(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v49 = *((void *)v10 + 2);
    unint64_t v48 = *((void *)v10 + 3);
    unint64_t v13 = v49 + 1;
    if (v49 >= v48 >> 1) {
      unint64_t v10 = sub_10002AC58((char *)(v48 > 1), v49 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v13;
    uint64_t v50 = v10 + 32;
    id v51 = &v10[16 * v49 + 32];
    *(void *)id v51 = v14;
    *((void *)v51 + 1) = v11;
    if (v49)
    {
      Swift::Int v117 = v11;
      while (1)
      {
        unint64_t v52 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v57 = &v50[16 * v13];
          uint64_t v58 = *((void *)v57 - 8);
          uint64_t v59 = *((void *)v57 - 7);
          BOOL v63 = __OFSUB__(v59, v58);
          uint64_t v60 = v59 - v58;
          if (v63) {
            goto LABEL_115;
          }
          uint64_t v62 = *((void *)v57 - 6);
          uint64_t v61 = *((void *)v57 - 5);
          BOOL v63 = __OFSUB__(v61, v62);
          uint64_t v55 = v61 - v62;
          char v56 = v63;
          if (v63) {
            goto LABEL_116;
          }
          unint64_t v64 = v13 - 2;
          dispatch_group_t v65 = &v50[16 * v13 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v63 = __OFSUB__(v66, v67);
          uint64_t v68 = v66 - v67;
          if (v63) {
            goto LABEL_118;
          }
          BOOL v63 = __OFADD__(v55, v68);
          uint64_t v69 = v55 + v68;
          if (v63) {
            goto LABEL_121;
          }
          if (v69 >= v60)
          {
            Class v87 = &v50[16 * v52];
            uint64_t v89 = *(void *)v87;
            uint64_t v88 = *((void *)v87 + 1);
            BOOL v63 = __OFSUB__(v88, v89);
            uint64_t v90 = v88 - v89;
            if (v63) {
              goto LABEL_125;
            }
            BOOL v80 = v55 < v90;
            goto LABEL_85;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v81 = *((void *)v10 + 4);
            uint64_t v82 = *((void *)v10 + 5);
            BOOL v63 = __OFSUB__(v82, v81);
            uint64_t v74 = v82 - v81;
            char v75 = v63;
            goto LABEL_79;
          }
          uint64_t v54 = *((void *)v10 + 4);
          uint64_t v53 = *((void *)v10 + 5);
          BOOL v63 = __OFSUB__(v53, v54);
          uint64_t v55 = v53 - v54;
          char v56 = v63;
        }
        if (v56) {
          goto LABEL_117;
        }
        unint64_t v64 = v13 - 2;
        uint64_t v70 = &v50[16 * v13 - 32];
        uint64_t v72 = *(void *)v70;
        uint64_t v71 = *((void *)v70 + 1);
        BOOL v73 = __OFSUB__(v71, v72);
        uint64_t v74 = v71 - v72;
        char v75 = v73;
        if (v73) {
          goto LABEL_120;
        }
        uint64_t v76 = &v50[16 * v52];
        uint64_t v78 = *(void *)v76;
        uint64_t v77 = *((void *)v76 + 1);
        BOOL v63 = __OFSUB__(v77, v78);
        uint64_t v79 = v77 - v78;
        if (v63) {
          goto LABEL_123;
        }
        if (__OFADD__(v74, v79)) {
          goto LABEL_124;
        }
        if (v74 + v79 >= v55)
        {
          BOOL v80 = v55 < v79;
LABEL_85:
          if (v80) {
            unint64_t v52 = v64;
          }
          goto LABEL_87;
        }
LABEL_79:
        if (v75) {
          goto LABEL_119;
        }
        uint64_t v83 = &v50[16 * v52];
        uint64_t v85 = *(void *)v83;
        uint64_t v84 = *((void *)v83 + 1);
        BOOL v63 = __OFSUB__(v84, v85);
        uint64_t v86 = v84 - v85;
        if (v63) {
          goto LABEL_122;
        }
        if (v86 < v74) {
          goto LABEL_14;
        }
LABEL_87:
        unint64_t v91 = v52 - 1;
        if (v52 - 1 >= v13)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        uint64_t v92 = v12;
        if (!v12) {
          goto LABEL_137;
        }
        uint64_t v93 = v10;
        dispatch_group_t v94 = &v50[16 * v91];
        uint64_t v95 = *(void *)v94;
        uint64_t v96 = v50;
        unint64_t v97 = v52;
        uint64_t v98 = &v50[16 * v52];
        uint64_t v99 = *((void *)v98 + 1);
        uint64_t v100 = v92;
        sub_10001DE04((void **)(v92 + 8 * *(void *)v94), (id *)(v92 + 8 * *(void *)v98), v92 + 8 * v99, v118);
        if (v1) {
          goto LABEL_95;
        }
        if (v99 < v95) {
          goto LABEL_112;
        }
        if (v97 > *((void *)v93 + 2)) {
          goto LABEL_113;
        }
        *(void *)dispatch_group_t v94 = v95;
        *(void *)&v96[16 * v91 + 8] = v99;
        unint64_t v101 = *((void *)v93 + 2);
        if (v97 >= v101) {
          goto LABEL_114;
        }
        unint64_t v10 = v93;
        unint64_t v13 = v101 - 1;
        memmove(v98, v98 + 16, 16 * (v101 - 1 - v97));
        uint64_t v50 = v96;
        *((void *)v93 + 2) = v101 - 1;
        uint64_t v12 = v100;
        Swift::Int v11 = v117;
        if (v101 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    Swift::Int v4 = v115;
    if (v11 >= v115)
    {
      uint64_t v2 = v1;
      goto LABEL_98;
    }
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  sub_100055EC0();
  __break(1u);
}

void sub_10001DD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v8 = *(void **)(v6 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v10 = v7;
    while (1)
    {
      Swift::Int v11 = *(void **)v10;
      id v12 = v8;
      id v13 = v11;
      [v12 quantity];
      float v15 = v14;
      [v13 quantity];
      float v17 = v16;

      if (v17 >= v15)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v6) {
        break;
      }
      float v18 = *(void **)v10;
      uint64_t v8 = *(void **)(v10 + 8);
      *(void *)uint64_t v10 = v8;
      *(void *)(v10 + 8) = v18;
      v10 -= 8;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10001DE04(void **__src, id *a2, unint64_t a3, void **a4)
{
  Swift::Int v5 = a2;
  uint64_t v6 = __src;
  int64_t v7 = (char *)a2 - (char *)__src;
  int64_t v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v8 = (char *)a2 - (char *)__src;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v11 = a3 - (void)a2;
  }
  uint64_t v12 = v11 >> 3;
  uint64_t v39 = __src;
  Swift::Int v38 = a4;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7) {
      goto LABEL_46;
    }
    if (a4 != a2 || &a2[v12] <= a4) {
      memmove(a4, a2, 8 * v12);
    }
    unint64_t v23 = &a4[v12];
    id v37 = (char *)v23;
    uint64_t v39 = v5;
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_45;
    }
    id v24 = (id *)(a3 - 8);
    id v25 = v5;
    while (1)
    {
      float v26 = v24 + 1;
      float v27 = v23 - 1;
      float v28 = *--v25;
      id v29 = *(v23 - 1);
      id v30 = v28;
      [v29 quantity];
      float v32 = v31;
      [v30 quantity];
      float v34 = v33;

      if (v34 < v32) {
        break;
      }
      id v37 = (char *)(v23 - 1);
      if (v26 < v23 || v24 >= v23)
      {
        *id v24 = *v27;
        id v25 = v5;
        --v23;
        goto LABEL_43;
      }
      if (v26 != v23) {
        *id v24 = *v27;
      }
      id v25 = v5;
      --v23;
      if (v5 <= v6) {
        goto LABEL_45;
      }
LABEL_44:
      --v24;
      Swift::Int v5 = v25;
      if (v23 <= a4) {
        goto LABEL_45;
      }
    }
    if (v26 != v5 || v24 >= v5) {
      *id v24 = *v25;
    }
    uint64_t v39 = v25;
LABEL_43:
    if (v25 <= v6) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (v7 >= -7)
  {
    if (a4 != __src || &__src[v9] <= a4) {
      memmove(a4, __src, 8 * v9);
    }
    id v13 = &a4[v9];
    id v37 = (char *)v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      float v14 = a4;
      do
      {
        float v15 = *v14;
        id v16 = *v5;
        id v17 = v15;
        [v16 quantity];
        float v19 = v18;
        [v17 quantity];
        float v21 = v20;

        if (v21 >= v19)
        {
          if (v6 != v14) {
            *uint64_t v6 = *v14;
          }
          Swift::Int v38 = ++v14;
          uint64_t v22 = v5;
        }
        else
        {
          uint64_t v22 = v5 + 1;
          if (v6 < v5 || v6 >= v22 || v6 != v5) {
            *uint64_t v6 = *v5;
          }
        }
        ++v6;
        if (v14 >= v13) {
          break;
        }
        Swift::Int v5 = v22;
      }
      while ((unint64_t)v22 < a3);
      uint64_t v39 = v6;
    }
LABEL_45:
    sub_10002AD54((void **)&v39, (const void **)&v38, &v37);
    return 1;
  }
LABEL_46:
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

unsigned __int8 *sub_10001E130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100055AD0();
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
  uint64_t v5 = sub_10001E494();
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
    int64_t v7 = (unsigned __int8 *)sub_100055E20();
  }
LABEL_7:
  uint64_t v11 = sub_10001E218(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10001E218(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (uint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  float v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10001E494()
{
  unint64_t v0 = sub_100055AE0();
  uint64_t v4 = sub_10001E514(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_10001E514(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_10001E66C(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10001C4A0(v9, 0),
          unint64_t v12 = sub_10001E76C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_100055A30();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_100055A30();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_100055E20();
LABEL_4:

  return sub_100055A30();
}

uint64_t sub_10001E66C(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
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
    a1 = sub_10001C508(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10001C508(v6, v5, v4);
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
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_10001E76C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    v9[2] = a6;
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_10001C508(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_100055AB0();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_100055E20();
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
    uint64_t result = sub_10001C508(v12, a6, a7);
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
    unint64_t v12 = sub_100055A80();
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

uint64_t sub_10001E980(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001E9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001EA2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001EA94(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_10001EAAC()
{
  swift_bridgeObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001EAF4(uint64_t a1)
{
  sub_10001A770(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_10001EB00()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001EB38()
{
  uint64_t v1 = (int *)(type metadata accessor for UsageData() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 10;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = v0 + v3 + v1[11];
  uint64_t v7 = sub_100054C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_10001EC60()
{
  uint64_t v1 = *(void *)(type metadata accessor for UsageData() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void (**)(char *, void *, uint64_t, void))(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = v0 + v2;
  uint64_t v6 = v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = *(void *)v6;
  __int16 v8 = *(unsigned __int8 *)(v6 + 8);
  if (*(unsigned char *)(v6 + 9)) {
    __int16 v9 = 256;
  }
  else {
    __int16 v9 = 0;
  }

  return sub_10001AA94(v3, v4, v5, v7, v9 | v8);
}

uint64_t sub_10001ED0C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001ED4C(void *a1)
{
  sub_10001AA30(a1, *(void *)(v1 + 16), *(NSObject **)(v1 + 24));
}

uint64_t sub_10001ED54(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100055F30();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100055F30();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000D120(&qword_10006A128, &qword_10006A110);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100005EB4(&qword_10006A110);
          unint64_t v12 = sub_10001EF88(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10001F0C0(0, &qword_10006A108);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

void (*sub_10001EF88(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10001F038(v6, a2, a3);
  return sub_10001EFF0;
}

void sub_10001EFF0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10001F038(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100055E10();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_10001F0B8;
  }
  __break(1u);
  return result;
}

void sub_10001F0B8(id *a1)
{
}

uint64_t sub_10001F0C0(uint64_t a1, unint64_t *a2)
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

void sub_10001F0FC()
{
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 16));
}

uint64_t sub_10001F104()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F13C(uint64_t a1)
{
  return sub_100009844(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_10001F144(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100055F30();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100055F30();
    uint64_t result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100055F30();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    sub_10001F0C0(0, &qword_10006A108);
    Swift::Int v10 = 0;
    do
    {
      Swift::Int v11 = v10 + 1;
      sub_100055E00(v10);
      Swift::Int v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100055F40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

uint64_t sub_10001F2E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_100055C00();
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10001C808(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

void *sub_10001F380(uint64_t a1)
{
  if ((a1 & 0x8000000000000000) == 0 && (a1 & 0x4000000000000000) == 0)
  {
    uint64_t v1 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    goto LABEL_4;
  }
LABEL_42:
  unint64_t v36 = swift_bridgeObjectRetain();
  uint64_t v1 = (uint64_t)sub_10001D298(v36);
  swift_bridgeObjectRelease();
LABEL_4:
  uint64_t v37 = v1;
  sub_10001D524(&v37);
  uint64_t v2 = v37;
  LODWORD(v3) = v37 < 0 || (v37 & 0x4000000000000000) != 0;
  if (v3 != 1)
  {
    if (*(uint64_t *)(v37 + 16) >= 3) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = *(void *)(v37 + 16);
    }
    goto LABEL_11;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_100055F30();
    swift_release();
    swift_bridgeObjectRetain();
    uint64_t v33 = sub_100055F30();
    swift_release();
    if (v33 < 0) {
      goto LABEL_45;
    }
    if (v32 >= 3) {
      uint64_t v34 = 3;
    }
    else {
      uint64_t v34 = v32;
    }
    if (v32 >= 0) {
      uint64_t v4 = v34;
    }
    else {
      uint64_t v4 = 3;
    }
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_100055F30();
    swift_release();
    if (v35 < v4)
    {
      __break(1u);
      goto LABEL_42;
    }
LABEL_11:
    if ((v2 & 0xC000000000000001) != 0 && v4)
    {
      sub_10001F0C0(0, &qword_10006A108);
      Swift::Int v5 = 0;
      do
      {
        Swift::Int v6 = v5 + 1;
        sub_100055E00(v5);
        Swift::Int v5 = v6;
      }
      while (v4 != v6);
    }
    if (v3)
    {
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_100055F40();
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      unint64_t v13 = v12;
      swift_release_n();
      uint64_t v4 = v13 >> 1;
      uint64_t v2 = v7;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v9 = v2 + 32;
    }
    uint64_t v14 = v4 - v11;
    if (__OFSUB__(v4, v11))
    {
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      uint64_t result = (void *)swift_release();
      __break(1u);
      return result;
    }
    if (!v14) {
      break;
    }
    uint64_t v37 = (uint64_t)_swiftEmptyArrayStorage;
    sub_10002A228(0, v14 & ~(v14 >> 63), 0);
    if (v14 < 0) {
      goto LABEL_44;
    }
    if (v4 <= v11) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = v4;
    }
    uint64_t v16 = v37;
    uint64_t v17 = v15 - v11;
    uint64_t v3 = (id *)(v9 + 8 * v11);
    while (v17)
    {
      id v18 = *v3;
      id v19 = [v18 localizedDisplayName];
      uint64_t v20 = sub_100055A10();
      uint64_t v22 = v21;

      [v18 quantity];
      float v24 = v23;
      id v25 = [v18 identifier];
      uint64_t v26 = sub_100055A10();
      uint64_t v2 = v27;

      uint64_t v37 = v16;
      unint64_t v29 = *(void *)(v16 + 16);
      unint64_t v28 = *(void *)(v16 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_10002A228(v28 > 1, v29 + 1, 1);
        uint64_t v16 = v37;
      }
      *(void *)(v16 + 16) = v29 + 1;
      uint64_t v30 = v16 + 48 * v29;
      *(void *)(v30 + 32) = v20;
      *(void *)(v30 + 40) = v22;
      *(double *)(v30 + 48) = v24;
      *(void *)(v30 + 56) = v26;
      *(void *)(v30 + 64) = v2;
      *(void *)(v30 + 72) = 3;
      --v17;
      ++v3;
      if (!--v14)
      {
        swift_unknownObjectRelease();
        return (void *)v16;
      }
    }
    __break(1u);
  }
  swift_unknownObjectRelease();
  return _swiftEmptyArrayStorage;
}

void sub_10001F6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_10001337C(a2);
  int64_t v6 = v5 >> 1;
  uint64_t v7 = (v5 >> 1) - v4;
  if (__OFSUB__(v5 >> 1, v4))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!v7)
  {
LABEL_16:
    swift_unknownObjectRelease();
    return;
  }
  uint64_t v8 = v3;
  uint64_t v9 = v4;
  uint64_t v32 = v2;
  sub_10002A248(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    if (v9 <= v6) {
      uint64_t v10 = v6;
    }
    else {
      uint64_t v10 = v9;
    }
    uint64_t v11 = v10 - v9;
    unint64_t v12 = (id *)(v8 + 8 * v9);
    while (v11)
    {
      id v13 = *v12;
      id v14 = [v13 identifier];
      uint64_t v15 = sub_100055A10();
      uint64_t v33 = v16;
      uint64_t v34 = v15;

      id v17 = [v13 type];
      id v18 = &selRef_darkColorsMonogram;
      if (v17 == (id)1) {
        id v18 = &selRef_iconImage;
      }
      id v19 = [v13 *v18 v32];
      id v20 = [v13 type];
      uint64_t v21 = &selRef_lightColorsMonogram;
      if (v20 == (id)1) {
        uint64_t v21 = &selRef_iconImage;
      }
      id v22 = [v13 *v21];
      [v13 quantity];
      float v24 = v23;
      id v25 = [v13 localizedDisplayName];
      uint64_t v26 = sub_100055A10();
      uint64_t v28 = v27;

      unint64_t v30 = _swiftEmptyArrayStorage[2];
      unint64_t v29 = _swiftEmptyArrayStorage[3];
      if (v30 >= v29 >> 1) {
        sub_10002A248(v29 > 1, v30 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v30 + 1;
      float v31 = (double *)&_swiftEmptyArrayStorage[7 * v30];
      *((void *)v31 + 4) = v34;
      *((void *)v31 + 5) = v33;
      *((void *)v31 + 6) = v19;
      *((void *)v31 + 7) = v22;
      v31[8] = v24;
      *((void *)v31 + 9) = v26;
      *((void *)v31 + 10) = v28;
      --v11;
      ++v12;
      if (!--v7) {
        goto LABEL_16;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
LABEL_20:
  __break(1u);
}

uint64_t sub_10001F8D8(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
LABEL_30:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100055F30();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v6 = -v5;
    if (!__OFSUB__(0, v5)) {
      goto LABEL_4;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v2 = a2;
  uint64_t v3 = result;
  unint64_t v4 = a2 >> 62;
  if (a2 >> 62) {
    goto LABEL_30;
  }
  uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v6 = -v5;
  if (__OFSUB__(0, v5)) {
    goto LABEL_32;
  }
LABEL_4:
  uint64_t v7 = -v3;
  if (v6 > 0 || v6 <= v7)
  {
    Swift::Int v8 = v5 - v3;
    if (__OFADD__(v5, v7))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v5 < v8)
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v4)
    {
LABEL_8:
      uint64_t v9 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_13;
    }
  }
  else
  {
    if (v5 < 0)
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    Swift::Int v8 = 0;
    if (!v4) {
      goto LABEL_8;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100055F30();
  uint64_t result = swift_bridgeObjectRelease();
LABEL_13:
  if (v9 < v8)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (v8 < 0)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100055F30();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v10 < v5) {
    goto LABEL_35;
  }
  if (v5 < 0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8 != v5)
  {
    if (v8 < (unint64_t)v5)
    {
      sub_10001F0C0(0, &qword_10006A108);
      Swift::Int v11 = v8;
      do
      {
        Swift::Int v12 = v11 + 1;
        sub_100055E00(v11);
        Swift::Int v11 = v12;
      }
      while (v5 != v12);
      goto LABEL_25;
    }
LABEL_40:
    __break(1u);
    return result;
  }
LABEL_25:
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_100055F40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v13;
}

uint64_t sub_10001FAEC(unint64_t a1, unint64_t a2)
{
  unint64_t v4 = sub_1000248A8(a2, 0.0);
  swift_bridgeObjectRetain();
  sub_10001F8D8(a2, a1);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  unint64_t v10 = v9;
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v12 = (v10 >> 1) - v8;
  if (v10 >> 1 == v8)
  {
LABEL_2:
    swift_unknownObjectRelease();
    return (uint64_t)v4;
  }
  else
  {
    if ((uint64_t)(v10 >> 1) > v8)
    {
      unint64_t v13 = 0;
      uint64_t v14 = v6 + 8 * v8;
      while (1)
      {
        id v15 = *(id *)(v14 + 8 * v13);
        [v15 quantity];
        float v17 = v16;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_10002AEF4(v4);
          unint64_t v4 = (void *)result;
        }
        if (v13 >= v4[2]) {
          break;
        }
        *(double *)&v4[v13 + 4] = v17;

        if (v12 == ++v13) {
          goto LABEL_2;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001FC00(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v139 = a2;
  unint64_t v159 = a1;
  uint64_t v169 = type metadata accessor for HourlyUsage();
  uint64_t v167 = *(void *)(v169 - 8);
  __chkstk_darwin(v169);
  uint64_t v152 = (uint64_t)&v136 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v149 = sub_100005EB4(&qword_100069EA8);
  uint64_t v155 = *(void (***)(void, void, void))(v149 - 8);
  uint64_t v5 = __chkstk_darwin(v149);
  uint64_t v148 = (char *)&v136 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  BOOL v147 = (char *)&v136 - v7;
  uint64_t v168 = sub_100054A10();
  uint64_t v138 = *(void *)(v168 - 8);
  uint64_t v8 = __chkstk_darwin(v168);
  unint64_t v10 = (char *)&v136 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  unint64_t v153 = (char *)&v136 - v12;
  __chkstk_darwin(v11);
  uint64_t v151 = (char *)&v136 - v13;
  *(void *)&long long v161 = sub_100005EB4(&qword_10006A138);
  __chkstk_darwin(v161);
  unint64_t v165 = (uint64_t *)((char *)&v136 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v160 = (char *)sub_100005EB4(&qword_10006A140);
  __chkstk_darwin(v160);
  id v163 = (char *)&v136 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_100005EB4(&qword_10006A148);
  uint64_t v16 = __chkstk_darwin(v162);
  id v18 = (char *)&v136 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v20 = (char *)&v136 - v19;
  uint64_t v21 = sub_100054C10();
  id v22 = *(void **)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  id v25 = (char *)&v136 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v136 - v26;
  size_t v156 = sub_100005EB4(&qword_10006A150);
  uint64_t v28 = __chkstk_darwin(v156);
  unint64_t v157 = (char *)&v136 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v158 = (uint64_t)&v136 - v30;
  uint64_t v31 = sub_100055070();
  uint64_t v137 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v33 = (char *)&v136 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = _swiftEmptyArrayStorage;
  sub_100054A00();
  uint64_t v166 = a3;
  sub_1000549E0();
  sub_1000211D0(&qword_100069ED8, (void (*)(uint64_t))&type metadata accessor for Date);
  if (sub_1000559C0())
  {
    id v164 = v10;
    uint64_t v34 = v18;
    unint64_t v35 = v162;
    uint64_t v36 = *(int *)(v162 + 48);
    uint64_t v140 = v33;
    uint64_t v37 = &v20[v36];
    uint64_t v150 = v31;
    Swift::Int v38 = v27;
    uint64_t v39 = (void (*)(char *))v22[4];
    os_log_type_t v145 = v38;
    v39(v20);
    int v146 = v25;
    ((void (*)(char *, char *, uint64_t))v39)(v37, v25, v21);
    uint64_t v40 = &v34[*(int *)(v35 + 48)];
    id v41 = (void (*)(char *, char *, uint64_t))v22[2];
    v41(v34, v20, v21);
    v41(v40, v37, v21);
    uint64_t v42 = (uint64_t)v157;
    ((void (*)(char *, char *, uint64_t))v39)(v157, v34, v21);
    float v43 = (void (*)(char *, uint64_t))v22[1];
    v43(v40, v21);
    float v44 = &v34[*(int *)(v162 + 48)];
    ((void (*)(char *, char *, uint64_t))v39)(v34, v20, v21);
    ((void (*)(char *, char *, uint64_t))v39)(v44, v37, v21);
    ((void (*)(uint64_t, char *, uint64_t))v39)(v42 + *(int *)(v156 + 36), v44, v21);
    uint64_t v45 = v150;
    v43(v34, v21);
    float v46 = v140;
    sub_100021168(v42, v158);
    sub_100055060();
    uint64_t v47 = sub_1000211D0(&qword_10006A158, (void (*)(uint64_t))&type metadata accessor for DateBins);
    sub_100055C20();
    sub_100055C40();
    uint64_t v162 = sub_100055C30();
    uint64_t v48 = sub_10001FAEC(v159, v162);
    uint64_t v50 = v48;
    unint64_t v159 = *(void *)(v48 + 16);
    if (v159)
    {
      unint64_t v51 = 0;
      unint64_t v157 = (char *)(v48 + 32);
      size_t v156 = v137 + 16;
      id v141 = (void (**)(char *, uint64_t))(v155 + 1);
      uint64_t v155 = (void (**)(void, void, void))(v138 + 16);
      id v154 = (void (**)(char *, uint64_t))(v138 + 8);
      *(void *)&long long v49 = 134218498;
      long long v144 = v49;
      id v143 = (char *)&type metadata for Any + 8;
      uint64_t v142 = v47;
      uint64_t v158 = v48;
      while (v51 < *(void *)(v50 + 16))
      {
        double v52 = *(double *)&v157[8 * v51];
        uint64_t v53 = v163;
        (*(void (**)(char *, char *, uint64_t))v156)(v163, v46, v45);
        uint64_t v54 = v160;
        uint64_t v55 = &v53[*((int *)v160 + 9)];
        sub_100055C20();
        sub_100055C40();
        uint64_t v56 = (uint64_t)v165;
        sub_100005F44((uint64_t)v53, (uint64_t)v165, &qword_10006A140);
        uint64_t v57 = *(void *)v55;
        uint64_t v58 = (uint64_t *)(v56 + *(int *)(v161 + 36));
        uint64_t *v58 = v57;
        uint64_t v59 = *(void *)(v56 + *((int *)v54 + 10));
        if (v57 == v59)
        {
LABEL_11:
          sub_100005FA8(v56, &qword_10006A138);
          sub_100005FA8((uint64_t)v163, &qword_10006A140);
          if (qword_1000698E8 != -1) {
            swift_once();
          }
          uint64_t v60 = sub_100054EA0();
          sub_1000096F4(v60, (uint64_t)qword_100069F08);
          uint64_t v61 = v153;
          uint64_t v62 = v168;
          (*v155)(v153, v166, v168);
          BOOL v63 = sub_100054E80();
          os_log_type_t v64 = sub_100055CA0();
          if (os_log_type_enabled(v63, v64))
          {
            uint64_t v65 = swift_slowAlloc();
            uint64_t v171 = swift_slowAlloc();
            *(_DWORD *)uint64_t v65 = v144;
            *(void *)(v65 + 4) = v51;
            *(_WORD *)(v65 + 12) = 2048;
            *(void *)(v65 + 14) = v162;
            *(_WORD *)(v65 + 22) = 2080;
            sub_1000211D0(&qword_10006A160, (void (*)(uint64_t))&type metadata accessor for DateInterval);
            uint64_t v66 = sub_100055FC0();
            *(void *)(v65 + 24) = sub_10001C000(v66, v67, &v171);
            swift_bridgeObjectRelease();
            (*v154)(v61, v168);
            _os_log_impl((void *)&_mh_execute_header, v63, v64, "screenOnTime hourIndex %ld not in range. numberOfHours: %ld graphInterval %s", (uint8_t *)v65, 0x20u);
            swift_arrayDestroy();
            uint64_t v45 = v150;
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            (*v154)(v61, v62);
          }

          uint64_t v50 = v158;
        }
        else
        {
          while (1)
          {
            sub_100055C50();
            if (v57 == v51) {
              break;
            }
            uint64_t v57 = *v58;
            uint64_t v56 = (uint64_t)v165;
            if (*v58 == v59) {
              goto LABEL_11;
            }
          }
          sub_100005FA8((uint64_t)v165, &qword_10006A138);
          sub_100005FA8((uint64_t)v163, &qword_10006A140);
          if (v52 > 3600.0) {
            double v52 = 3600.0;
          }
          uint64_t v68 = v147;
          sub_100055080();
          uint64_t v69 = v149;
          sub_100054EF0();
          uint64_t v70 = *v141;
          (*v141)(v68, v69);
          uint64_t v71 = v148;
          sub_100055080();
          sub_100054F00();
          v70(v71, v69);
          uint64_t v72 = v151;
          sub_1000549F0();
          uint64_t v73 = v152;
          (*v155)(v152, v72, v168);
          uint64_t v74 = v169;
          sub_100055080();
          *(double *)(v73 + *(int *)(v74 + 20)) = v52;
          *(void *)(v73 + *(int *)(v74 + 28)) = _swiftEmptyArrayStorage;
          unint64_t v75 = (unint64_t)v172;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v75 = sub_100029560(0, *(void *)(v75 + 16) + 1, 1, v75);
          }
          unint64_t v77 = *(void *)(v75 + 16);
          unint64_t v76 = *(void *)(v75 + 24);
          uint64_t v50 = v158;
          if (v77 >= v76 >> 1) {
            unint64_t v75 = sub_100029560(v76 > 1, v77 + 1, 1, v75);
          }
          *(void *)(v75 + 16) = v77 + 1;
          sub_100021218(v152, v75+ ((*(unsigned __int8 *)(v167 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v167 + 80))+ *(void *)(v167 + 72) * v77, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
          uint64_t v172 = (void *)v75;
          (*v154)(v151, v168);
        }
        if (++v51 == v159) {
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      swift_bridgeObjectRelease();
      uint64_t v78 = v162;
      uint64_t v158 = *(void *)(v139 + 16);
      if (v158)
      {
        unint64_t v157 = (char *)(v139 + 32);
        id v163 = (char *)(v138 + 16);
        uint64_t v79 = (void (**)(char *, uint64_t))(v138 + 8);
        size_t v156 = 8 * v162;
        swift_bridgeObjectRetain();
        unint64_t v80 = 0;
        *(void *)&long long v81 = 134218754;
        long long v161 = v81;
        id v160 = (char *)&type metadata for Any + 8;
        while ((v78 & 0x8000000000000000) == 0)
        {
          unint64_t v82 = *(void *)&v157[8 * v80];
          swift_bridgeObjectRetain();
          unint64_t v159 = v80;
          if (v78)
          {
            uint64_t v83 = (void *)sub_100055B80();
            v83[2] = v78;
            bzero(v83 + 4, v156);
          }
          else
          {
            uint64_t v83 = _swiftEmptyArrayStorage;
          }
          swift_bridgeObjectRetain();
          sub_10001F8D8(v78, v82);
          uint64_t v85 = v84;
          uint64_t v87 = v86;
          unint64_t v89 = v88;
          swift_bridgeObjectRelease();
          unint64_t v90 = (v89 >> 1) - v87;
          if (v89 >> 1 != v87)
          {
            if ((uint64_t)(v89 >> 1) <= v87) {
              goto LABEL_84;
            }
            unint64_t v91 = 0;
            uint64_t v92 = v85 + 8 * v87;
            do
            {
              id v93 = *(id *)(v92 + 8 * v91);
              [v93 quantity];
              if (v91 >= v83[2]) {
                goto LABEL_80;
              }
              *(double *)&v83[v91 + 4] = v94;
            }
            while (v90 != ++v91);
          }
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          uint64_t v95 = v83[2];
          uint64_t v96 = v168;
          if (v95)
          {
            unint64_t v165 = v83 + 4;
            swift_beginAccess();
            for (unint64_t i = 0; v95 != i; ++i)
            {
              if ((int64_t)i >= v172[2])
              {
                if (qword_1000698E8 != -1) {
                  swift_once();
                }
                uint64_t v106 = sub_100054EA0();
                sub_1000096F4(v106, (uint64_t)qword_100069F08);
                uint64_t v107 = v164;
                (*(void (**)(char *, uint64_t, uint64_t))v163)(v164, v166, v96);
                uint64_t v108 = sub_100054E80();
                os_log_type_t v109 = sub_100055CA0();
                if (os_log_type_enabled(v108, v109))
                {
                  uint64_t v110 = swift_slowAlloc();
                  uint64_t v170 = swift_slowAlloc();
                  *(_DWORD *)uint64_t v110 = v161;
                  *(void *)(v110 + 4) = i;
                  *(_WORD *)(v110 + 12) = 2048;
                  *(void *)(v110 + 14) = v162;
                  *(_WORD *)(v110 + 22) = 2048;
                  *(void *)(v110 + 24) = v172[2];
                  *(_WORD *)(v110 + 32) = 2080;
                  sub_1000211D0(&qword_10006A160, (void (*)(uint64_t))&type metadata accessor for DateInterval);
                  uint64_t v111 = sub_100055FC0();
                  *(void *)(v110 + 34) = sub_10001C000(v111, v112, &v170);
                  swift_bridgeObjectRelease();
                  (*v79)(v107, v168);
                  _os_log_impl((void *)&_mh_execute_header, v108, v109, "categoryRatiosPerHour hourIndex %ld not in range. numberOfHours: %ld result.count: %ld graphInterval: %s", (uint8_t *)v110, 0x2Au);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  uint64_t v96 = v168;
                  swift_slowDealloc();
                }
                else
                {
                  (*v79)(v107, v96);
                }
              }
              else
              {
                uint64_t v98 = v165[i];
                swift_beginAccess();
                unint64_t v99 = (unint64_t)v172;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                  unint64_t v99 = sub_10002AF08(v99);
                }
                if (i >= *(void *)(v99 + 16)) {
                  goto LABEL_81;
                }
                unint64_t v100 = v99
                     + ((*(unsigned __int8 *)(v167 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v167 + 80))
                     + *(void *)(v167 + 72) * i;
                uint64_t v101 = *(int *)(v169 + 28);
                uint64_t v102 = *(void **)(v100 + v101);
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                *(void *)(v100 + v101) = v102;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  uint64_t v102 = sub_100029450(0, v102[2] + 1, 1, v102);
                  *(void *)(v100 + v101) = v102;
                }
                unint64_t v105 = v102[2];
                unint64_t v104 = v102[3];
                if (v105 >= v104 >> 1)
                {
                  uint64_t v102 = sub_100029450((void *)(v104 > 1), v105 + 1, 1, v102);
                  *(void *)(v100 + v101) = v102;
                }
                uint64_t v96 = v168;
                v102[2] = v105 + 1;
                v102[v105 + 4] = v98;
                uint64_t v172 = (void *)v99;
                swift_endAccess();
              }
            }
          }
          unint64_t v80 = v159 + 1;
          swift_bridgeObjectRelease();
          uint64_t v78 = v162;
          if (v80 == v158)
          {
            swift_bridgeObjectRelease();
            goto LABEL_53;
          }
        }
        goto LABEL_86;
      }
LABEL_53:
      swift_beginAccess();
      unint64_t v113 = (unint64_t)v172;
      uint64_t v168 = v172[2];
      if (!v168)
      {
LABEL_77:
        (*(void (**)(char *, uint64_t))(v137 + 8))(v140, v150);
        return (uint64_t)v172;
      }
      unint64_t v114 = 0;
      while (v114 < *(void *)(v113 + 16))
      {
        unint64_t v115 = v114 + 1;
        unint64_t v116 = (*(unsigned __int8 *)(v167 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v167 + 80);
        uint64_t v117 = *(void *)(v167 + 72) * v114;
        while (1)
        {
          uint64_t v118 = *(void *)(v113 + v116 + v117 + *(int *)(v169 + 28));
          unint64_t v119 = *(void *)(v118 + 16);
          if (v119 > 2) {
            break;
          }
          swift_beginAccess();
          unint64_t v113 = (unint64_t)v172;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v113 = sub_10002AF08(v113);
          }
          if (v114 >= *(void *)(v113 + 16)) {
            goto LABEL_79;
          }
          unint64_t v120 = v113 + v116 + v117;
          uint64_t v121 = *(int *)(v169 + 28);
          uint64_t v122 = *(void **)(v120 + v121);
          char v123 = swift_isUniquelyReferenced_nonNull_native();
          *(void *)(v120 + v121) = v122;
          if ((v123 & 1) == 0)
          {
            uint64_t v122 = sub_100029450(0, v122[2] + 1, 1, v122);
            *(void *)(v120 + v121) = v122;
          }
          unint64_t v125 = v122[2];
          unint64_t v124 = v122[3];
          if (v125 >= v124 >> 1)
          {
            uint64_t v122 = sub_100029450((void *)(v124 > 1), v125 + 1, 1, v122);
            *(void *)(v120 + v121) = v122;
          }
          v122[2] = v125 + 1;
          v122[v125 + 4] = 0;
          uint64_t v172 = (void *)v113;
          swift_endAccess();
          if (v114 >= *(void *)(v113 + 16)) {
            goto LABEL_78;
          }
        }
        uint64_t v126 = (double *)(v118 + 32);
        double v127 = 0.0;
        do
        {
          double v128 = *v126++;
          double v127 = v127 + v128;
          --v119;
        }
        while (v119);
        swift_beginAccess();
        unint64_t v113 = (unint64_t)v172;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v113 = sub_10002AF08(v113);
        }
        if (v114 >= *(void *)(v113 + 16)) {
          goto LABEL_83;
        }
        unint64_t v129 = v113 + v116 + v117;
        uint64_t v130 = *(int *)(v169 + 28);
        id v131 = *(void **)(v129 + v130);
        char v132 = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v129 + v130) = v131;
        if ((v132 & 1) == 0)
        {
          id v131 = sub_100029450(0, v131[2] + 1, 1, v131);
          *(void *)(v129 + v130) = v131;
        }
        unint64_t v134 = v131[2];
        unint64_t v133 = v131[3];
        if (v134 >= v133 >> 1)
        {
          id v131 = sub_100029450((void *)(v133 > 1), v134 + 1, 1, v131);
          *(void *)(v129 + v130) = v131;
        }
        v131[2] = v134 + 1;
        *(double *)&v131[v134 + 4] = fmax(1.0 - v127, 0.0);
        uint64_t v172 = (void *)v113;
        swift_endAccess();
        unint64_t v114 = v115;
        if (v115 == v168) {
          goto LABEL_77;
        }
      }
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
    }
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
  }
  __break(1u);
LABEL_86:
  uint64_t result = sub_100055EC0();
  __break(1u);
  return result;
}

uint64_t sub_100021168(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EB4(&qword_10006A150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000211D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100021218(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t *sub_100021280(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    uint64_t v7 = a2[4];
    a1[3] = a2[3];
    a1[4] = v7;
    uint64_t v8 = *(int *)(a3 + 36);
    uint64_t v9 = (char *)a1 + v8;
    unint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100054C10();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
  }
  return v5;
}

uint64_t sub_100021394(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  uint64_t v5 = sub_100054C10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_100021424(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100054C10();
  unint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

void *sub_1000214EC(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100054C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1000215D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(int *)(a3 + 36);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = sub_100054C10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

void *sub_100021654(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100054C10();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_100021718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002172C);
}

uint64_t sub_10002172C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_100054C10();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000217DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000217F0);
}

void *sub_1000217F0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100054C10();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 36);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100021898()
{
  uint64_t result = sub_100054C10();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100021978()
{
  unint64_t result = qword_10006A210;
  if (!qword_10006A210)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A210);
  }
  return result;
}

uint64_t sub_1000219CC()
{
  uint64_t v0 = sub_100054AD0();
  sub_10000972C(v0, qword_10006D120);
  sub_1000096F4(v0, (uint64_t)qword_10006D120);
  return sub_100054AB0();
}

uint64_t sub_100021A30@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000548A0();
  *a1 = v3;
  return result;
}

uint64_t sub_100021A6C()
{
  return sub_1000548B0();
}

void (*sub_100021AA4(void *a1))(void *a1)
{
  unint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_100054890();
  return sub_100021B00;
}

void sub_100021B00(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

unint64_t sub_100021B50()
{
  unint64_t result = qword_10006A218;
  if (!qword_10006A218)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A218);
  }
  return result;
}

unint64_t sub_100021BA8()
{
  unint64_t result = qword_10006A220;
  if (!qword_10006A220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A220);
  }
  return result;
}

uint64_t sub_100021BFC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_1000224D8();
  unint64_t v5 = sub_100009790();

  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100021C74()
{
  unint64_t result = qword_10006A228;
  if (!qword_10006A228)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A228);
  }
  return result;
}

unint64_t sub_100021CCC()
{
  unint64_t result = qword_10006A230;
  if (!qword_10006A230)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A230);
  }
  return result;
}

uint64_t sub_100021D20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100021D70@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000698F8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100054AD0();
  uint64_t v3 = sub_1000096F4(v2, (uint64_t)qword_10006D120);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_100021E18()
{
  return 0;
}

uint64_t static STUser.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_100021E34(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  unint64_t v6 = sub_1000224D8();
  unint64_t v7 = sub_10002252C();
  unint64_t v8 = sub_100009790();
  *unint64_t v5 = v2;
  v5[1] = sub_100021F08;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100021F08()
{
  uint64_t v2 = *v1;
  uint64_t result = swift_task_dealloc();
  if (v0)
  {
    unint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
  return result;
}

uint64_t sub_100022010@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100022084();
  *a1 = result;
  return result;
}

uint64_t sub_100022038(uint64_t a1)
{
  unint64_t v2 = sub_100021B50();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenScreenTimeDeepLinksIntent()
{
  return &type metadata for OpenScreenTimeDeepLinksIntent;
}

uint64_t sub_100022084()
{
  uint64_t v0 = sub_100054940();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  uint64_t v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100005EB4(&qword_10006A240);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  id v22 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v21 - v5;
  uint64_t v7 = sub_100005EB4(&qword_100069AB8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100054AC0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100054C30();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_1000559F0();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_100054AD0();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_100005EB4(&qword_10006A248);
  sub_1000559E0();
  sub_100054C20();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_100054AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 9;
  uint64_t v18 = sub_100054880();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v6, 1, 1, v18);
  v19(v22, 1, 1, v18);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  sub_100007620();
  return sub_1000548C0();
}

unint64_t sub_1000224D8()
{
  unint64_t result = qword_10006A250;
  if (!qword_10006A250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A250);
  }
  return result;
}

unint64_t sub_10002252C()
{
  unint64_t result = qword_10006A258;
  if (!qword_10006A258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A258);
  }
  return result;
}

uint64_t sub_100022580()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006A260);
  sub_1000096F4(v0, (uint64_t)qword_10006A260);
  return sub_100054E90();
}

id sub_1000226F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return [super dealloc];
}

uint64_t type metadata accessor for IntentHandler()
{
  return self;
}

uint64_t sub_10002274C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCPersistentStoreManager();
  v13[3] = v2;
  v13[4] = &off_100067080;
  v13[0] = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v4 = *sub_10001ADBC(v13, v2);
  swift_retain_n();
  swift_retain();
  sub_10003E140();
  if (*(unsigned char *)(v4 + 24) != 1) {
    goto LABEL_4;
  }
  id v5 = [*(id *)(v4 + 16) newBackgroundContext];
  [v5 setAutomaticallyMergesChangesFromParent:1];
  [v5 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  unint64_t v6 = (void *)swift_allocObject();
  uint64_t v6[2] = sub_100023460;
  v6[3] = v3;
  v6[4] = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1000234C8;
  *(void *)(v7 + 24) = v6;
  aBlock[4] = sub_1000234BC;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001AE28;
  aBlock[3] = &unk_100066BC8;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  id v9 = v5;
  swift_retain();
  swift_release();
  [v9 performBlockAndWait:v8];

  _Block_release(v8);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release_n();
  swift_release();
  swift_release();
  if (v9)
  {
    __break(1u);
LABEL_4:
    sub_1000497F0(v3);
    swift_release_n();
  }
  swift_beginAccess();
  uint64_t v10 = *(void *)(v3 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  sub_10001E980((uint64_t)v13);
  return v10;
}

void *sub_1000229D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for XPCPersistentStoreManager();
  v21[3] = v2;
  v21[4] = &off_100067080;
  v21[0] = a1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(_WORD *)(v3 + 40) = 0;
  uint64_t v4 = *sub_10001ADBC(v21, v2);
  swift_retain_n();
  swift_retain();
  sub_10003E140();
  if (*(unsigned char *)(v4 + 24) != 1) {
    goto LABEL_4;
  }
  id v5 = [*(id *)(v4 + 16) newBackgroundContext];
  [v5 setAutomaticallyMergesChangesFromParent:1];
  [v5 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  unint64_t v6 = (void *)swift_allocObject();
  uint64_t v6[2] = sub_10002336C;
  v6[3] = v3;
  v6[4] = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_10001BD9C;
  *(void *)(v7 + 24) = v6;
  v20[4] = sub_100023408;
  v20[5] = v7;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10001AE28;
  v20[3] = &unk_100066B28;
  uint64_t v8 = _Block_copy(v20);
  swift_retain();
  id v9 = v5;
  swift_retain();
  swift_release();
  [v9 performBlockAndWait:v8];

  _Block_release(v8);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release_n();
  swift_release();
  swift_release();
  if (v9)
  {
    __break(1u);
LABEL_4:
    id v10 = sub_1000490C4();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    __int16 v16 = v15;
    swift_beginAccess();
    uint64_t v17 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v10;
    *(void *)(v3 + 24) = v12;
    *(void *)(v3 + 32) = v14;
    *(_WORD *)(v3 + 40) = v16;
    sub_100023374(v17);
    swift_release_n();
  }
  swift_beginAccess();
  uint64_t v18 = *(void **)(v3 + 16);
  sub_1000233B4(v18);
  swift_release();
  sub_10001E980((uint64_t)v21);
  return v18;
}

id sub_100022CC0(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  BOOL v6 = a2 == 1701736270 && a3 == 0xE400000000000000;
  if (v6 || (sub_100055FE0() & 1) != 0)
  {
    uint64_t v7 = (objc_class *)[self mainBundle];
    v16._countAndFlagsBits = 0xE000000000000000;
    v17._object = (void *)0x80000001000599C0;
    v17._countAndFlagsBits = 0xD000000000000016;
    v18.value._countAndFlagsBits = 0;
    v18.value._object = 0;
    v8.super.Class isa = v7;
    v19._countAndFlagsBits = 0;
    v19._object = (void *)0xE000000000000000;
    sub_100054A40(v17, v18, v8, v19, v16);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  type metadata accessor for STUser();
  id v9 = [a1 stringValue];
  sub_100055A10();

  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v11 = sub_100055A00();
  swift_bridgeObjectRelease();
  NSString v12 = sub_100055A00();
  swift_bridgeObjectRelease();
  id v13 = [v10 initWithIdentifier:v11 displayString:v12];

  id v14 = [objc_allocWithZone((Class)NSNumber) initWithBool:a4 & 1];
  [v13 setIsRemote:v14];

  return v13;
}

void *sub_100022E94(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    sub_100055E60();
    uint64_t v4 = (char *)(a1 + 57);
    do
    {
      id v5 = *(void **)(v4 - 25);
      uint64_t v6 = *(void *)(v4 - 17);
      uint64_t v7 = *(void *)(v4 - 9);
      char v8 = *v4;
      v4 += 32;
      id v9 = v5;
      swift_bridgeObjectRetain();
      sub_100022CC0(v9, v6, v7, v8);
      swift_bridgeObjectRelease();

      sub_100055E30();
      sub_100055E70();
      sub_100055E80();
      sub_100055E40();
      --v2;
    }
    while (v2);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void sub_100022F7C(void *a1, uint64_t a2)
{
  if (qword_100069900 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100054EA0();
  sub_1000096F4(v4, (uint64_t)qword_10006A260);
  id v5 = sub_100054E80();
  os_log_type_t v6 = sub_100055CB0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "provide user options collection", v7, 2u);
    swift_slowDealloc();
  }

  if (qword_100069918 != -1) {
    swift_once();
  }
  uint64_t v8 = swift_retain();
  uint64_t v9 = sub_10002274C(v8);
  swift_release();
  id v10 = a1;
  sub_100022E94(v9);
  swift_bridgeObjectRelease();

  id v11 = objc_allocWithZone((Class)INObjectCollection);
  type metadata accessor for STUser();
  Class isa = sub_100055B50().super.isa;
  swift_bridgeObjectRelease();
  id v13 = [v11 initWithItems:isa];

  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v13, 0);
}

id sub_10002314C()
{
  if (qword_100069900 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_100054EA0();
  sub_1000096F4(v0, (uint64_t)qword_10006A260);
  uint64_t v1 = sub_100054E80();
  os_log_type_t v2 = sub_100055CB0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "get default user for widget. getting local user", v3, 2u);
    swift_slowDealloc();
  }

  if (qword_100069918 != -1) {
    swift_once();
  }
  uint64_t v4 = swift_retain();
  id v5 = sub_1000229D8(v4);
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  if (v5)
  {
    id v12 = sub_100022CC0(v5, v7, v9, v11 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v13 = sub_100054E80();
    os_log_type_t v14 = sub_100055C90();
    if (os_log_type_enabled(v13, v14))
    {
      __int16 v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "couldn't fetch local user to use as default user", v15, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
  return v12;
}

uint64_t sub_100023328()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {

    swift_bridgeObjectRelease();
  }

  return _swift_deallocObject(v0, 42, 7);
}

void *sub_10002336C(uint64_t a1)
{
  return sub_100049044(a1, v1);
}

void *sub_100023374(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_1000233B4(void *result)
{
  if (result)
  {
    id v1 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1000233F8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023408()
{
  return sub_10001AE00(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100023410(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100023420()
{
  return swift_release();
}

uint64_t sub_100023428()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100023460(uint64_t a1)
{
  sub_10004903C(a1, v1);
}

uint64_t sub_10002346C()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000234AC()
{
  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_1000234CC(uint64_t a1)
{
  uint64_t v2 = sub_100005EB4(&qword_100069AF0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005EB4(&qword_10006A588);
  uint64_t v6 = sub_100055F70();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100005F44(v12, (uint64_t)v5, &qword_100069AF0);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100029A50(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100005EB4(&qword_10006A590);
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    void v7[2] = v22;
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

unint64_t sub_1000236CC(uint64_t a1)
{
  uint64_t v2 = sub_100005EB4(&qword_100069AC8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (unsigned __int8 *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005EB4(&qword_10006A580);
  uint64_t v6 = sub_100055F70();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100005F44(v12, (uint64_t)v5, &qword_100069AC8);
    unsigned __int8 v14 = *v5;
    unint64_t result = sub_100029A50(*v5);
    if (v16) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(unsigned char *)(v7[6] + result) = v14;
    uint64_t v18 = v7[7];
    uint64_t v19 = sub_100054900();
    unint64_t result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(void *)(v19 - 8) + 32))(v18 + *(void *)(*(void *)(v19 - 8) + 72) * v17, v9, v19);
    uint64_t v20 = v7[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_11;
    }
    void v7[2] = v22;
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

unint64_t sub_1000238C4(uint64_t a1)
{
  uint64_t v2 = sub_100005EB4(&qword_10006A520);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005EB4(&qword_10006A518);
  uint64_t v6 = sub_100055F70();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100005F44(v12, (uint64_t)v5, &qword_10006A520);
    unint64_t result = sub_100029B34((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_100054A10();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    void v7[2] = v21;
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

unint64_t sub_100023AB8(uint64_t a1)
{
  uint64_t v2 = sub_100005EB4(&qword_10006A4E0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005EB4(&qword_10006A4D0);
  uint64_t v6 = sub_100055F70();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_100005F44(v12, (uint64_t)v5, &qword_10006A4E0);
    unint64_t result = sub_100029B34((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_100054A10();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    void v7[2] = v21;
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

unint64_t sub_100023CAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005EB4(&qword_10006A4A8);
  uint64_t v2 = (void *)sub_100055F70();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100029ABC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
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

uint64_t sub_100023DC0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000013;
  unint64_t v3 = 0x8000000100058630;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000013;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x6C41737961776C61;
      unint64_t v3 = 0xED00006465776F6CLL;
      break;
    case 2:
      unint64_t v5 = 0x74696D694C707061;
      unint64_t v3 = 0xE900000000000073;
      break;
    case 3:
      break;
    case 4:
      uint64_t v6 = "communicationSafety";
      goto LABEL_10;
    case 5:
      unint64_t v5 = 0xD00000000000001DLL;
      uint64_t v6 = "contentAndPrivacyRestrictions";
      goto LABEL_10;
    case 6:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x656D69746E776F64;
      break;
    case 7:
      unint64_t v5 = 0x69446E6565726373;
      unint64_t v3 = 0xEE0065636E617473;
      break;
    case 8:
      unint64_t v5 = 0xD00000000000001BLL;
      uint64_t v6 = "seeAllAppAndWebsiteActivity";
LABEL_10:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1953460082;
      break;
  }
  unint64_t v7 = 0x8000000100058630;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0x6C41737961776C61;
      unint64_t v7 = 0xED00006465776F6CLL;
      break;
    case 2:
      unint64_t v2 = 0x74696D694C707061;
      unint64_t v7 = 0xE900000000000073;
      break;
    case 3:
      break;
    case 4:
      uint64_t v8 = "communicationSafety";
      goto LABEL_20;
    case 5:
      unint64_t v2 = 0xD00000000000001DLL;
      uint64_t v8 = "contentAndPrivacyRestrictions";
      goto LABEL_20;
    case 6:
      unint64_t v7 = 0xE800000000000000;
      unint64_t v2 = 0x656D69746E776F64;
      break;
    case 7:
      unint64_t v2 = 0x69446E6565726373;
      unint64_t v7 = 0xEE0065636E617473;
      break;
    case 8:
      unint64_t v2 = 0xD00000000000001BLL;
      uint64_t v8 = "seeAllAppAndWebsiteActivity";
LABEL_20:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      break;
    default:
      unint64_t v7 = 0xE400000000000000;
      unint64_t v2 = 1953460082;
      break;
  }
  if (v5 == v2 && v3 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = sub_100055FE0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t sub_100024054()
{
  sub_100055A40();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000241AC(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v43 = a8;
  uint64_t v44 = a5;
  uint64_t v9 = v8;
  uint64_t v58 = a2;
  uint64_t v59 = a4;
  uint64_t v57 = a1;
  uint64_t v42 = *(void *)(a5 - 8);
  uint64_t v11 = __chkstk_darwin(a1);
  uint64_t v55 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v53 = (char *)&v40 - v13;
  char v15 = v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  id v41 = (char *)&v40 - v17;
  uint64_t v18 = sub_100055D50();
  uint64_t v45 = *(void *)(v18 - 8);
  uint64_t v46 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  unint64_t v51 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v40 = (char *)&v40 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v50 = *((void *)v15 - 1);
  __chkstk_darwin(v26);
  uint64_t v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = a6;
  double v52 = v15;
  uint64_t v60 = swift_getAssociatedTypeWitness();
  uint64_t v47 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v30 = (char *)&v40 - v29;
  Swift::Int v31 = sub_100055B00();
  uint64_t v61 = sub_100055EA0();
  uint64_t v56 = sub_100055EB0();
  sub_100055E50(v31);
  (*(void (**)(char *, uint64_t, void))(v50 + 16))(v28, v48, v52);
  uint64_t v59 = v30;
  uint64_t result = sub_100055AF0();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    uint64_t v33 = (uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
    uint64_t v34 = (uint64_t (**)(char *, uint64_t))(v54 + 8);
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_100055D60();
      uint64_t result = (*v33)(v23, 1, AssociatedTypeWitness);
      if (result == 1) {
        goto LABEL_18;
      }
      v57(v23, v55);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v55, v44);
        return (*v34)(v23, AssociatedTypeWitness);
      }
      uint64_t v9 = 0;
      (*v34)(v23, AssociatedTypeWitness);
      sub_100055E90();
      if (!--v31)
      {
        uint64_t v35 = v54;
        uint64_t v36 = v51;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  uint64_t v35 = v54;
  uint64_t v36 = v51;
LABEL_9:
  sub_100055D60();
  uint64_t v55 = *(char **)(v35 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v36, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v37 = v51;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v37, v46);
    return v61;
  }
  else
  {
    double v52 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
    uint64_t v54 = v35 + 32;
    Swift::Int v38 = (void (**)(char *, uint64_t))(v35 + 8);
    uint64_t v39 = v41;
    uint64_t v37 = v51;
    while (1)
    {
      v52(v39, v37, AssociatedTypeWitness);
      v57(v39, v53);
      if (v9) {
        break;
      }
      uint64_t v9 = 0;
      (*v38)(v39, AssociatedTypeWitness);
      sub_100055E90();
      sub_100055D60();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v55)(v37, 1, AssociatedTypeWitness) == 1) {
        goto LABEL_14;
      }
    }
    (*v38)(v39, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v59, v60);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v42 + 32))(v43, v53, v44);
  }
}

void *sub_1000248A8(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = (void *)sub_100055EC0();
    __break(1u);
    return result;
  }
  if (!a1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t result = (void *)sub_100055B80();
  result[2] = a1;
  uint64_t v4 = (double *)(result + 4);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  uint64_t v8 = (int64x2_t *)(result + 6);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    int64x2_t *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_10002499C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    uint64_t result = sub_100055EC0();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v4 = sub_100055750();
      unint64_t v5 = (char *)sub_100055B80();
      *((void *)v5 + 2) = a2;
      uint64_t v6 = *(void *)(v4 - 8);
      unint64_t v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      uint64_t v9 = a2 - 1;
      if (a2 != 1)
      {
        uint64_t v10 = *(void *)(v6 + 72);
        uint64_t v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      unint64_t v5 = (char *)&_swiftEmptyArrayStorage;
    }
    uint64_t v12 = sub_100055750();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

uint64_t sub_100024B44()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006A2A0);
  sub_1000096F4(v0, (uint64_t)qword_10006A2A0);
  return sub_100054E90();
}

BOOL sub_100024BC4(_OWORD *a1, long long *a2)
{
  long long v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  long long v3 = *a2;
  long long v4 = a2[1];
  void v7[2] = a1[2];
  v8[0] = v3;
  long long v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_10002CC9C((uint64_t)v7, (uint64_t)v8);
}

Swift::Int sub_100024C0C()
{
  return sub_1000560A0();
}

void sub_100024C50()
{
}

Swift::Int sub_100024C78()
{
  return sub_1000560A0();
}

uint64_t sub_100024CC8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  sub_100005F44(a5, (uint64_t)&v13, &qword_10006A100);
  if (v14)
  {
    sub_10001EA94(&v13, (uint64_t)&v15);
  }
  else
  {
    if (qword_100069918 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_10006D138;
    unint64_t v16 = (ValueMetadata *)type metadata accessor for XPCPersistentStoreManager();
    uint64_t v17 = &off_100067080;
    *(void *)&long long v15 = v11;
    swift_retain();
    sub_100005FA8((uint64_t)&v13, &qword_10006A100);
  }
  sub_10001EA94(&v15, v5 + 112);
  sub_100005F44(a1, (uint64_t)&v13, &qword_10006A0F0);
  if (v14)
  {
    sub_10001EA94(&v13, (uint64_t)&v15);
  }
  else
  {
    unint64_t v16 = &type metadata for ScreenTimeAppInfoCache;
    uint64_t v17 = &off_100066448;
    sub_100005FA8((uint64_t)&v13, &qword_10006A0F0);
  }
  sub_10001EA94(&v15, v5 + 16);
  sub_100005F44(a4, (uint64_t)&v13, &qword_10006A0F8);
  if (v14)
  {
    sub_100005FA8(a5, &qword_10006A100);
    sub_100005FA8(a4, &qword_10006A0F8);
    sub_100005FA8(a1, &qword_10006A0F0);
    sub_10001EA94(&v13, (uint64_t)&v15);
  }
  else
  {
    unint64_t v16 = &type metadata for ScreenTimeIconCache;
    uint64_t v17 = &off_100066420;
    sub_100005FA8(a5, &qword_10006A100);
    sub_100005FA8(a4, &qword_10006A0F8);
    sub_100005FA8(a1, &qword_10006A0F0);
    sub_100005FA8((uint64_t)&v13, &qword_10006A0F8);
  }
  sub_10001EA94(&v15, v5 + 72);
  if (!a2)
  {
    a2 = sub_100054E50();
    a3 = &protocol witness table for STDeviceActivityDataSource;
  }
  *(void *)(v5 + 56) = a2;
  *(void *)(v5 + 64) = a3;
  return v5;
}

uint64_t sub_100024EF0(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9)
{
  *(void *)(v10 + 200) = a9;
  *(void *)(v10 + 208) = v9;
  *(unsigned char *)(v10 + 584) = a8;
  *(void *)(v10 + 184) = a6;
  *(void *)(v10 + 192) = a7;
  *(double *)(v10 + 168) = a2;
  *(double *)(v10 + 176) = a3;
  *(void *)(v10 + 160) = a1;
  uint64_t v11 = sub_100055120();
  *(void *)(v10 + 216) = v11;
  *(void *)(v10 + 224) = *(void *)(v11 - 8);
  *(void *)(v10 + 232) = swift_task_alloc();
  sub_100005EB4(&qword_100069948);
  *(void *)(v10 + 240) = swift_task_alloc();
  *(void *)(v10 + 248) = swift_task_alloc();
  sub_100005EB4(&qword_100069950);
  *(void *)(v10 + 256) = swift_task_alloc();
  *(void *)(v10 + 264) = swift_task_alloc();
  *(void *)(v10 + 272) = swift_task_alloc();
  *(void *)(v10 + 280) = swift_task_alloc();
  *(void *)(v10 + 288) = swift_task_alloc();
  uint64_t v12 = sub_1000558C0();
  *(void *)(v10 + 296) = v12;
  *(void *)(v10 + 304) = *(void *)(v12 - 8);
  *(void *)(v10 + 312) = swift_task_alloc();
  uint64_t v13 = sub_100054A10();
  *(void *)(v10 + 320) = v13;
  *(void *)(v10 + 328) = *(void *)(v13 - 8);
  *(void *)(v10 + 336) = swift_task_alloc();
  *(void *)(v10 + 344) = swift_task_alloc();
  *(void *)(v10 + 352) = swift_task_alloc();
  *(void *)(v10 + 360) = swift_task_alloc();
  uint64_t v14 = sub_100054CD0();
  *(void *)(v10 + 368) = v14;
  *(void *)(v10 + 376) = *(void *)(v14 - 8);
  *(void *)(v10 + 384) = swift_task_alloc();
  uint64_t v15 = sub_100054C10();
  *(void *)(v10 + 392) = v15;
  *(void *)(v10 + 400) = *(void *)(v15 - 8);
  *(void *)(v10 + 408) = swift_task_alloc();
  *(void *)(v10 + 416) = swift_task_alloc();
  *(void *)(v10 + 424) = swift_task_alloc();
  *(void *)(v10 + 432) = swift_task_alloc();
  return _swift_task_switch(sub_100025224, 0, 0);
}

uint64_t sub_100025224()
{
  uint64_t v2 = *(void *)(v0 + 304);
  uint64_t v1 = *(void *)(v0 + 312);
  uint64_t v3 = *(void *)(v0 + 296);
  uint64_t v4 = *(void *)(v0 + 200);
  sub_100054BF0();
  sub_100054C90();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v5 == enum case for WidgetFamily.systemSmall(_:)) {
    goto LABEL_2;
  }
  if (v5 == enum case for WidgetFamily.systemMedium(_:))
  {
    uint64_t v6 = *(void *)(v0 + 432);
    uint64_t v7 = *(void *)(v0 + 360);
    uint64_t v8 = 15;
    goto LABEL_5;
  }
  if (v5 == enum case for WidgetFamily.systemLarge(_:) || v5 == enum case for WidgetFamily.systemExtraLarge(_:))
  {
    sub_100012DA0(*(void *)(v0 + 432), *(void *)(v0 + 360));
  }
  else
  {
    if (v5 == enum case for WidgetFamily.accessoryCircular(_:)
      || v5 == enum case for WidgetFamily.accessoryRectangular(_:)
      || v5 == enum case for WidgetFamily.accessoryInline(_:))
    {
LABEL_2:
      uint64_t v6 = *(void *)(v0 + 432);
      uint64_t v7 = *(void *)(v0 + 360);
      uint64_t v8 = 9;
LABEL_5:
      sub_10001AE50(v8, v6, v7);
      goto LABEL_6;
    }
    uint64_t v64 = *(void *)(v0 + 304);
    uint64_t v63 = *(void *)(v0 + 312);
    uint64_t v65 = *(void *)(v0 + 296);
    sub_100012DA0(*(void *)(v0 + 432), *(void *)(v0 + 360));
    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v65);
  }
LABEL_6:
  uint64_t v9 = *(void *)(v0 + 208);
  if (*(unsigned char *)(*sub_10001ADBC((void *)(v9 + 112), *(void *)(v9 + 136)) + 24))
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100054EA0();
    *(void *)(v0 + 440) = sub_1000096F4(v10, (uint64_t)qword_10006A2A0);
    uint64_t v11 = sub_100054E80();
    os_log_type_t v12 = sub_100055CB0();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Successfully loaded persistent store.", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v111 = (unsigned __int8 *)(v0 + 584);
    char v14 = *(unsigned char *)(v0 + 584);
    unint64_t v16 = *(void **)(v0 + 184);
    unint64_t v15 = *(void *)(v0 + 192);

    uint64_t v17 = *sub_10001ADBC((void *)(v9 + 112), *(void *)(v9 + 136));
    uint64_t v18 = type metadata accessor for XPCPersistentStoreManager();
    *(void *)(v0 + 40) = v18;
    *(void *)(v0 + 48) = &off_100067080;
    *(void *)(v0 + 16) = v17;
    uint64_t v19 = swift_allocObject();
    *(_WORD *)(v19 + 16) = 0;
    *(_OWORD *)(v19 + 24) = 0u;
    *(_OWORD *)(v19 + 40) = 0u;
    *(_OWORD *)(v19 + 56) = 0u;
    *(_OWORD *)(v19 + 65) = 0u;
    uint64_t v20 = *sub_10001ADBC((void *)(v0 + 16), v18);
    swift_retain();
    sub_100045778(v20, v16, v15, v14, v19);
    swift_beginAccess();
    char v21 = *(unsigned char *)(v19 + 16);
    uint64_t v22 = *(void *)(v19 + 32);
    *(void *)(v0 + 448) = *(void *)(v19 + 24);
    *(void *)(v0 + 456) = v22;
    uint64_t v23 = *(void **)(v19 + 40);
    uint64_t v106 = *(void *)(v19 + 48);
    uint64_t v24 = *(void *)(v19 + 56);
    uint64_t v25 = *(void *)(v19 + 64);
    *(void *)(v0 + 464) = v23;
    *(void *)(v0 + 472) = v24;
    uint64_t v26 = *(void *)(v19 + 72);
    *(void *)(v0 + 480) = v26;
    LOBYTE(v17) = *(unsigned char *)(v19 + 80);
    uint64_t v113 = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v115 = v23;
    swift_bridgeObjectRetain();
    swift_release();
    sub_10001E980(v0 + 16);
    if (v17)
    {
      if (v21)
      {
        if (v23)
        {
          uint64_t v27 = v115;
          BOOL v28 = (uint64_t)[v115 integerValue] > 0;
          uint64_t v29 = v113;
        }
        else
        {
          BOOL v28 = 0;
          uint64_t v29 = v113;
          uint64_t v27 = v115;
        }
        if (v29) {
          BOOL v77 = v28;
        }
        else {
          BOOL v77 = 0;
        }
        uint64_t v117 = (uint64_t (*)(BOOL, void *, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10006A560
                                                                                          + dword_10006A560);
        id v78 = v27;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v79 = (void *)swift_task_alloc();
        *(void *)(v0 + 488) = v79;
        *uint64_t v79 = v0;
        v79[1] = sub_100025D8C;
        return v117(v77, v23, v106, v24, v25, v29);
      }
      uint64_t v54 = sub_100054E80();
      os_log_type_t v55 = sub_100055CB0();
      if (os_log_type_enabled(v54, v55))
      {
        uint64_t v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v56 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "ScreenTime is disabled.", v56, 2u);
        swift_slowDealloc();
      }
      uint64_t v57 = *(void *)(v0 + 392);
      uint64_t v58 = *(void *)(v0 + 400);
      uint64_t v59 = *(void *)(v0 + 272);

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v59, 1, 1, v57);
      if (v23)
      {
        id v60 = [v115 stringValue];
        uint64_t v61 = sub_100055A10();
        uint64_t v94 = v62;
        uint64_t v96 = v61;
      }
      else
      {
        uint64_t v94 = 0;
        uint64_t v96 = 0;
      }
      uint64_t v81 = *(void *)(v0 + 400);
      uint64_t v105 = *(void *)(v0 + 392);
      uint64_t v109 = *(void *)(v0 + 432);
      uint64_t v82 = *(void *)(v0 + 376);
      uint64_t v83 = *(void *)(v0 + 360);
      uint64_t v100 = *(void *)(v0 + 368);
      uint64_t v102 = *(void *)(v0 + 384);
      uint64_t v84 = *(void *)(v0 + 352);
      uint64_t v85 = *(void *)(v0 + 320);
      uint64_t v86 = *(void *)(v0 + 328);
      uint64_t v98 = *(void *)(v0 + 272);
      uint64_t v87 = *(void *)(v0 + 248);
      unsigned __int8 v88 = *v111;
      double v90 = *(double *)(v0 + 168);
      double v89 = *(double *)(v0 + 176);
      unint64_t v91 = *(unsigned char **)(v0 + 160);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56))(v87, 1, 1, v85);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v86 + 16))(v84, v83, v85);
      sub_100005660(0, v98, 0, 0, v96, v94, v87, v84, v91, v90, v89, 0.0, (uint64_t)_swiftEmptyArrayStorage, v88, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
      (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v83, v85);
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v102, v100);
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v109, v105);
    }
    else
    {
      uint64_t v45 = sub_100054E80();
      os_log_type_t v46 = sub_100055C90();
      if (os_log_type_enabled(v45, v46))
      {
        uint64_t v47 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v47 = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Failed to fetch user. Returning placeholder timeline entry.", v47, 2u);
        swift_slowDealloc();
      }
      uint64_t v49 = *(void *)(v0 + 392);
      uint64_t v48 = *(void *)(v0 + 400);
      uint64_t v50 = *(void *)(v0 + 280);

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v50, 1, 1, v49);
      if (v23)
      {
        id v51 = [v115 stringValue];
        uint64_t v52 = sub_100055A10();
        uint64_t v93 = v53;
        uint64_t v95 = v52;
      }
      else
      {
        uint64_t v93 = 0;
        uint64_t v95 = 0;
      }
      uint64_t v66 = *(void *)(v0 + 400);
      uint64_t v104 = *(void *)(v0 + 392);
      uint64_t v108 = *(void *)(v0 + 432);
      uint64_t v67 = *(void *)(v0 + 376);
      uint64_t v68 = *(void *)(v0 + 360);
      uint64_t v99 = *(void *)(v0 + 368);
      uint64_t v101 = *(void *)(v0 + 384);
      uint64_t v69 = *(void *)(v0 + 352);
      uint64_t v71 = *(void *)(v0 + 320);
      uint64_t v70 = *(void *)(v0 + 328);
      uint64_t v97 = *(void *)(v0 + 280);
      uint64_t v72 = *(void *)(v0 + 248);
      int v73 = *v111;
      double v75 = *(double *)(v0 + 168);
      double v74 = *(double *)(v0 + 176);
      unint64_t v76 = *(unsigned char **)(v0 + 160);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v72, 1, 1, v71);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v69, v68, v71);
      sub_100005660(v73, v97, 0, 0, v95, v93, v72, v69, v76, v75, v74, 0.0, (uint64_t)_swiftEmptyArrayStorage, v73, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
      (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v68, v71);
      (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v101, v99);
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v108, v104);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v30 = sub_100054EA0();
    sub_1000096F4(v30, (uint64_t)qword_10006A2A0);
    Swift::Int v31 = sub_100054E80();
    os_log_type_t v32 = sub_100055C90();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to initialize persistent store. This prevented fetching user. Returning placeholder timeline entry", v33, 2u);
      swift_slowDealloc();
    }
    uint64_t v116 = *(void *)(v0 + 432);
    uint64_t v35 = *(void *)(v0 + 392);
    uint64_t v34 = *(void *)(v0 + 400);
    uint64_t v36 = *(void *)(v0 + 376);
    uint64_t v112 = *(void *)(v0 + 368);
    uint64_t v114 = *(void *)(v0 + 384);
    uint64_t v37 = *(void *)(v0 + 352);
    uint64_t v103 = *(void *)(v0 + 360);
    uint64_t v39 = *(void *)(v0 + 320);
    uint64_t v38 = *(void *)(v0 + 328);
    uint64_t v40 = *(void *)(v0 + 288);
    uint64_t v41 = *(void *)(v0 + 248);
    unsigned __int8 v107 = *(unsigned char *)(v0 + 584);
    double v43 = *(double *)(v0 + 168);
    double v42 = *(double *)(v0 + 176);
    uint64_t v110 = *(unsigned char **)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v40, 1, 1, v35);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56))(v41, 1, 1, v39);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v37, v103, v39);
    sub_100005660(0, v40, 0, 0, 0, 0, v41, v37, v110, v43, v42, 0.0, (uint64_t)_swiftEmptyArrayStorage, v107, (uint64_t)_swiftEmptyArrayStorage, 0, 0, (uint64_t)_swiftEmptyArrayStorage, 0);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v103, v39);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v114, v112);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v116, v35);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v92 = *(uint64_t (**)(void))(v0 + 8);
  return v92();
}

uint64_t sub_100025D8C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)v1 + 464);
  *(void *)(*(void *)v1 + 496) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_task_switch(sub_100025EE8, 0, 0);
}

uint64_t sub_100025EE8()
{
  uint64_t v1 = sub_100054E80();
  os_log_type_t v2 = sub_100055C80();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Fetch device activity started", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 424);
  uint64_t v20 = *(void *)(v0 + 432);
  uint64_t v5 = *(void *)(v0 + 400);
  uint64_t v21 = *(void *)(v0 + 416);
  uint64_t v22 = *(void *)(v0 + 408);
  uint64_t v6 = *(void *)(v0 + 392);
  uint64_t v8 = *(void *)(v0 + 224);
  uint64_t v7 = *(void *)(v0 + 232);
  uint64_t v9 = *(void *)(v0 + 208);
  uint64_t v10 = *(void *)(v0 + 216);
  uint64_t v11 = *(void *)(v0 + 200);

  (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v7, enum case for DynamicTypeSize.large(_:), v10);
  uint64_t v23 = sub_1000269F4(v11);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v10);
  *(unsigned char *)(v0 + 585) = sub_100026D40(v11);
  swift_bridgeObjectRetain();
  sub_100054C40();
  os_log_type_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v12(v21, v4, v6);
  v12(v22, v20, v6);
  sub_1000549F0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  *(void *)(v0 + 504) = v13;
  *(void *)(v0 + 512) = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v13(v4, v6);
  sub_10001AC50(v9 + 16, v0 + 56);
  sub_10001AC50(v9 + 72, v0 + 96);
  char v14 = (void *)swift_task_alloc();
  *(void *)(v0 + 520) = v14;
  void *v14 = v0;
  v14[1] = sub_100026174;
  uint64_t v16 = *(void *)(v0 + 448);
  uint64_t v15 = *(void *)(v0 + 456);
  uint64_t v17 = *(void *)(v0 + 360);
  uint64_t v18 = *(void *)(v0 + 344);
  return sub_1000282AC(v16, v15, v17, v18, v23);
}

uint64_t sub_100026174(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(*v5 + 344);
  uint64_t v8 = *(void *)(*v5 + 328);
  uint64_t v9 = *(void *)(*v5 + 320);
  *(void *)(v6 + 528) = a1;
  *(void *)(v6 + 536) = a2;
  *(void *)(v6 + 544) = a3;
  *(double *)(v6 + 552) = a4;
  *(void *)(v6 + 560) = v4;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  sub_10001E980(v6 + 96);
  sub_10001E980(v6 + 56);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  *(void *)(v6 + 568) = v10;
  *(void *)(v6 + 576) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v10(v7, v9);
  if (v4) {
    uint64_t v11 = sub_100026660;
  }
  else {
    uint64_t v11 = sub_100026350;
  }
  return _swift_task_switch(v11, 0, 0);
}

uint64_t sub_100026350()
{
  uint64_t v1 = *(void *)(v0 + 464);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 400) + 56))(*(void *)(v0 + 264), 1, 1, *(void *)(v0 + 392));
  if (v1)
  {
    id v2 = [*(id *)(v0 + 464) stringValue];
    uint64_t v3 = sub_100055A10();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  char v6 = *(unsigned char *)(v0 + 585);
  uint64_t v7 = *(void *)(v0 + 360);
  uint64_t v8 = *(void *)(v0 + 328);
  uint64_t v9 = *(void *)(v0 + 336);
  uint64_t v10 = *(void *)(v0 + 320);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(v8 + 56))(*(void *)(v0 + 240), 1, 1, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v7, v10);
  uint64_t v11 = *(void **)(v0 + 528);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = &_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v3;
  uint64_t v13 = v5;
  char v14 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
  uint64_t v24 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
  uint64_t v25 = *(void **)(v0 + 464);
  uint64_t v15 = *(void *)(v0 + 432);
  uint64_t v17 = *(void *)(v0 + 384);
  uint64_t v16 = *(void *)(v0 + 392);
  uint64_t v19 = *(void *)(v0 + 368);
  uint64_t v18 = *(void *)(v0 + 376);
  uint64_t v20 = *(void *)(v0 + 360);
  uint64_t v21 = *(void *)(v0 + 320);
  sub_100005660(0, *(void *)(v0 + 264), 0, 0, v12, v13, *(void *)(v0 + 240), *(void *)(v0 + 336), *(unsigned char **)(v0 + 160), *(double *)(v0 + 168), *(double *)(v0 + 176), *(double *)(v0 + 552), *(void *)(v0 + 536), *(unsigned char *)(v0 + 584), *(void *)(v0 + 544), 0, 1u, (uint64_t)v11, *(void *)(v0 + 496));
  v14(v20, v21);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  v24(v15, v16);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_100026660()
{
  uint64_t v1 = sub_100054E80();
  os_log_type_t v2 = sub_100055C90();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to get hourly usage. Returning placeholder timeline entry.", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 464);
  uint64_t v5 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 400);
  uint64_t v7 = *(void *)(v0 + 256);

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v7, 1, 1, v5);
  if (v4)
  {
    id v8 = [*(id *)(v0 + 464) stringValue];
    uint64_t v31 = sub_100055A10();
    uint64_t v30 = v9;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v30 = 0;
  }
  uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 568);
  uint64_t v10 = *(void *)(v0 + 496);
  uint64_t v29 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
  os_log_type_t v32 = *(void **)(v0 + 464);
  uint64_t v27 = *(void *)(v0 + 392);
  uint64_t v28 = *(void *)(v0 + 432);
  uint64_t v11 = *(void *)(v0 + 376);
  uint64_t v12 = *(void *)(v0 + 360);
  uint64_t v24 = *(void *)(v0 + 368);
  uint64_t v25 = *(void *)(v0 + 384);
  uint64_t v13 = *(void *)(v0 + 352);
  uint64_t v15 = *(void *)(v0 + 320);
  uint64_t v14 = *(void *)(v0 + 328);
  uint64_t v16 = *(void *)(v0 + 248);
  uint64_t v23 = *(void *)(v0 + 256);
  unsigned __int8 v17 = *(unsigned char *)(v0 + 584);
  double v19 = *(double *)(v0 + 168);
  double v18 = *(double *)(v0 + 176);
  uint64_t v20 = *(unsigned char **)(v0 + 160);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v16, 1, 1, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v12, v15);
  sub_100005660(0, v23, 0, 0, v31, v30, v16, v13, v20, v19, v18, 0.0, (uint64_t)&_swiftEmptyArrayStorage, v17, (uint64_t)&_swiftEmptyArrayStorage, 0, 1u, (uint64_t)&_swiftEmptyArrayStorage, v10);
  swift_errorRelease();
  v26(v12, v15);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v25, v24);
  v29(v28, v27);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = *(uint64_t (**)(void))(v0 + 8);
  return v21();
}

uint64_t sub_1000269F4(uint64_t a1)
{
  uint64_t v2 = sub_100055120();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000558C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  uint64_t v11 = 0;
  if (v10 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v10 == enum case for WidgetFamily.systemMedium(_:))
    {
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for DynamicTypeSize.large(_:), v2);
      sub_1000337F8(&qword_10006A568, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      char v12 = sub_1000559B0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v11 = 3;
      if ((v12 & 1) == 0) {
        return 4;
      }
    }
    else if (v10 == enum case for WidgetFamily.systemLarge(_:))
    {
      (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for DynamicTypeSize.large(_:), v2);
      sub_1000337F8(&qword_10006A568, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
      char v13 = sub_1000559B0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v11 = 6;
      if (v13) {
        return 4;
      }
    }
    else
    {
      if (v10 != enum case for WidgetFamily.systemExtraLarge(_:)
        && v10 != enum case for WidgetFamily.accessoryCircular(_:)
        && v10 != enum case for WidgetFamily.accessoryRectangular(_:)
        && v10 != enum case for WidgetFamily.accessoryInline(_:))
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      }
      return 0;
    }
  }
  return v11;
}

BOOL sub_100026D40(uint64_t a1)
{
  uint64_t v18 = a1;
  uint64_t v1 = sub_1000558C0();
  uint64_t v2 = *(void **)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v16 - v6;
  unsigned __int8 v17 = (void (*)(char *, void, uint64_t))v2[13];
  v17((char *)&v16 - v6, enum case for WidgetFamily.systemLarge(_:), v1);
  sub_1000337F8((unint64_t *)&qword_10006A130, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100055B40();
  sub_100055B40();
  uint64_t v9 = v20;
  uint64_t v8 = v21;
  int v10 = (void (*)(char *, uint64_t))v2[1];
  v10(v7, v1);
  uint64_t v11 = (void (*)(char *, uint64_t, uint64_t))v2[2];
  double v19 = v5;
  v11(v5, v18, v1);
  if (v8 == v9)
  {
    BOOL v12 = 1;
    char v13 = v19;
  }
  else
  {
    v17(v7, enum case for WidgetFamily.systemExtraLarge(_:), v1);
    uint64_t v14 = v19;
    sub_100055B40();
    sub_100055B40();
    BOOL v12 = v21 == v20;
    v10(v7, v1);
    char v13 = v14;
  }
  v10(v13, v1);
  return v12;
}

void sub_100026F88(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = (unsigned __int8 *)(a2 + 16);
    id v4 = a1;
    unsigned __int8 v5 = [v4 screenTimeEnabled];
    swift_beginAccess();
    *uint64_t v3 = v5;
    id v6 = [v4 altDSID];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_100055A10();
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
    }
    swift_beginAccess();
    *(void *)(a2 + 24) = v8;
    *(void *)(a2 + 32) = v10;
    swift_bridgeObjectRelease();
    id v14 = [v4 dsid];
    swift_beginAccess();
    uint64_t v15 = *(void **)(a2 + 40);
    *(void *)(a2 + 40) = v14;

    id v16 = [v4 localizedFullName];
    uint64_t v17 = sub_100055A10();
    uint64_t v19 = v18;

    swift_beginAccess();
    *(void *)(a2 + 48) = v17;
    *(void *)(a2 + 56) = v19;
    swift_bridgeObjectRelease();
    id v20 = [v4 appleID];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_100055A10();
      uint64_t v24 = v23;
    }
    else
    {

      uint64_t v22 = 0;
      uint64_t v24 = 0;
    }
    swift_beginAccess();
    *(void *)(a2 + 64) = v22;
    *(void *)(a2 + 72) = v24;
    *(unsigned char *)(a2 + 80) = 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_100054EA0();
    sub_1000096F4(v11, (uint64_t)qword_10006A2A0);
    oslog = sub_100054E80();
    os_log_type_t v12 = sub_100055C90();
    if (os_log_type_enabled(oslog, v12))
    {
      char v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "unable to fetch user properties", v13, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100027224(char a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = 1;
  uint64_t v9 = (void *)(v3 + 112);
  if (*(unsigned char *)(*sub_10001ADBC((void *)(v3 + 112), *(void *)(v3 + 136)) + 24) == 1)
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v10 = sub_100054EA0();
    sub_1000096F4(v10, (uint64_t)qword_10006A2A0);
    uint64_t v11 = sub_100054E80();
    os_log_type_t v12 = sub_100055CB0();
    if (os_log_type_enabled(v11, v12))
    {
      char v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Successfully loaded persistent store.", v13, 2u);
      swift_slowDealloc();
    }

    uint64_t v14 = *sub_10001ADBC(v9, *(void *)(v4 + 136));
    swift_retain();
    swift_retain();
    sub_10004686C(v14, a2, a3, a1 & 1, v8, v4);
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_100054EA0();
    sub_1000096F4(v15, (uint64_t)qword_10006A2A0);
    id v16 = sub_100054E80();
    os_log_type_t v17 = sub_100055C90();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to initialize persistent store; using DeviceActivity data",
        v18,
        2u);
      swift_slowDealloc();
    }
  }
  swift_beginAccess();
  uint64_t v19 = *(unsigned __int8 *)(v8 + 16);
  swift_release();
  return v19;
}

void sub_100027490(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = a1;
    id v4 = [v3 altDSID];
    if (v4)
    {
      unsigned __int8 v5 = v4;
      sub_100055A10();
    }
    uint64_t v9 = (unsigned char *)(a2 + 16);
    id v10 = [v3 userDeviceStates];
    if (v10)
    {
      uint64_t v11 = v10;
      sub_100033768();
      sub_1000337F8((unint64_t *)&qword_10006A558, (void (*)(uint64_t))sub_100033768);
      sub_100055BF0();
    }
    char v12 = sub_100054E60();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    unsigned char *v9 = v12 & 1;
  }
  else
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_100054EA0();
    sub_1000096F4(v6, (uint64_t)qword_10006A2A0);
    oslog = sub_100054E80();
    os_log_type_t v7 = sub_100055C90();
    if (os_log_type_enabled(oslog, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v7, "Failed to fetch user; using DeviceActivity data", v8, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_1000276C8(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v8 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v2 << 6))
  {
    uint64_t v10 = *(void *)(v1 + 56);
    uint64_t v11 = *(void *)(v10 + 48 * i + 40);
    if (v11 == 3)
    {
      if (v6) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v15 = (uint64_t *)(v10 + 48 * i);
      uint64_t v16 = v15[2];
      uint64_t v17 = v15[4];
      uint64_t v22 = v15[3];
      uint64_t v23 = *v15;
      uint64_t v24 = v15[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_10002A228(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v19 = _swiftEmptyArrayStorage[2];
      unint64_t v18 = _swiftEmptyArrayStorage[3];
      unint64_t v20 = v19 + 1;
      if (v19 >= v18 >> 1)
      {
        uint64_t result = sub_10002A228(v18 > 1, v19 + 1, 1);
        unint64_t v20 = v19 + 1;
      }
      _swiftEmptyArrayStorage[2] = v20;
      uint64_t v21 = &_swiftEmptyArrayStorage[6 * v19];
      v21[4] = v23;
      void v21[5] = v24;
      v21[6] = v16;
      v21[7] = v22;
      v21[8] = v17;
      v21[9] = v11;
      if (v6) {
        goto LABEL_4;
      }
    }
LABEL_7:
    int64_t v12 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v12 >= v7) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v12);
    ++v2;
    if (!v13)
    {
      int64_t v2 = v12 + 1;
      if (v12 + 1 >= v7) {
        goto LABEL_29;
      }
      unint64_t v13 = *(void *)(v3 + 8 * v2);
      if (!v13)
      {
        int64_t v2 = v12 + 2;
        if (v12 + 2 >= v7) {
          goto LABEL_29;
        }
        unint64_t v13 = *(void *)(v3 + 8 * v2);
        if (!v13)
        {
          int64_t v2 = v12 + 3;
          if (v12 + 3 >= v7) {
            goto LABEL_29;
          }
          unint64_t v13 = *(void *)(v3 + 8 * v2);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_29:
    swift_release();
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = *(void *)(v3 + 8 * v14);
  if (v13)
  {
    int64_t v2 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v2 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v2 >= v7) {
      goto LABEL_29;
    }
    unint64_t v13 = *(void *)(v3 + 8 * v2);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100027908(uint64_t result)
{
  uint64_t v1 = result;
  int64_t v2 = 0;
  uint64_t v3 = result + 64;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 64);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  if (!v6) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v8 | (v2 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v2 << 6))
  {
    uint64_t v10 = *(void *)(v1 + 56);
    if (*(void *)(v10 + 48 * i + 40) == 3)
    {
      int64_t v14 = (uint64_t *)(v10 + 48 * i);
      uint64_t v15 = v14[2];
      uint64_t v16 = v14[4];
      uint64_t v20 = v14[3];
      uint64_t v21 = *v14;
      uint64_t v22 = v14[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0) {
        uint64_t result = sub_10002A228(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v18 = _swiftEmptyArrayStorage[2];
      unint64_t v17 = _swiftEmptyArrayStorage[3];
      if (v18 >= v17 >> 1) {
        uint64_t result = sub_10002A228(v17 > 1, v18 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v18 + 1;
      unint64_t v19 = &_swiftEmptyArrayStorage[6 * v18];
      v19[4] = v21;
      v19[5] = v22;
      v19[6] = v15;
      v19[7] = v20;
      v19[8] = v16;
      v19[9] = 3;
      if (v6) {
        goto LABEL_4;
      }
    }
    else if (v6)
    {
      goto LABEL_4;
    }
LABEL_7:
    int64_t v11 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v11 >= v7) {
      goto LABEL_29;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v2;
    if (!v12)
    {
      int64_t v2 = v11 + 1;
      if (v11 + 1 >= v7) {
        goto LABEL_29;
      }
      unint64_t v12 = *(void *)(v3 + 8 * v2);
      if (!v12)
      {
        int64_t v2 = v11 + 2;
        if (v11 + 2 >= v7) {
          goto LABEL_29;
        }
        unint64_t v12 = *(void *)(v3 + 8 * v2);
        if (!v12)
        {
          int64_t v2 = v11 + 3;
          if (v11 + 3 >= v7) {
            goto LABEL_29;
          }
          unint64_t v12 = *(void *)(v3 + 8 * v2);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v6 = (v12 - 1) & v12;
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v7)
  {
LABEL_29:
    swift_release();
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v12 = *(void *)(v3 + 8 * v13);
  if (v12)
  {
    int64_t v2 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v2 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v2 >= v7) {
      goto LABEL_29;
    }
    unint64_t v12 = *(void *)(v3 + 8 * v2);
    ++v13;
    if (v12) {
      goto LABEL_22;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100027B44@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  *a3 = *(double *)(a2 + 16) < *(double *)(result + 16);
  return result;
}

uint64_t sub_100027B5C@<X0>(void *a1@<X0>, void *a2@<X1>, unsigned char *a3@<X8>)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = sub_100055FE0();
  }
  *a3 = result & 1;
  return result;
}

uint64_t sub_100027BB4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  void (*v21)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (!*(void *)(a3 + 16)) {
    return 0;
  }
  uint64_t v17 = *(void *)(a3 + 16);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v11 = *a2;
  uint64_t v10 = a2[1];
  uint64_t v12 = a2[2];
  uint64_t v13 = a2[3];
  uint64_t v19 = a2[5];
  uint64_t v20 = a2[4];
  swift_bridgeObjectRetain();
  uint64_t v14 = a3 + 40;
  uint64_t v18 = v13;
  while (1)
  {
    uint64_t v21 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v14 - 8);
    uint64_t v22 = v11;
    uint64_t v28 = v4;
    uint64_t v29 = v5;
    uint64_t v30 = v6;
    uint64_t v31 = v7;
    os_log_type_t v32 = v8;
    uint64_t v33 = v9;
    uint64_t v23 = v10;
    uint64_t v24 = v12;
    uint64_t v25 = v13;
    uint64_t v26 = v20;
    uint64_t v27 = v19;
    swift_retain();
    v21(&v34, &v28, &v22);
    if (v34) {
      break;
    }
    uint64_t v28 = v11;
    uint64_t v29 = v10;
    uint64_t v30 = v12;
    uint64_t v31 = v18;
    os_log_type_t v32 = v20;
    uint64_t v33 = v19;
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    uint64_t v24 = v6;
    uint64_t v25 = v7;
    uint64_t v26 = v8;
    uint64_t v27 = v9;
    v21(&v34, &v28, &v22);
    if (v34) {
      break;
    }
    swift_release();
    v14 += 16;
    BOOL v15 = v17-- == 1;
    uint64_t v13 = v18;
    if (v15)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = v4;
  uint64_t v29 = v5;
  uint64_t v30 = v6;
  uint64_t v31 = v7;
  os_log_type_t v32 = v8;
  uint64_t v33 = v9;
  uint64_t v22 = v11;
  uint64_t v23 = v10;
  uint64_t v24 = v12;
  uint64_t v25 = v18;
  uint64_t v26 = v20;
  uint64_t v27 = v19;
  v21(&v34, &v28, &v22);
  swift_release();
  return v34;
}

uint64_t sub_100027D98@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = a1;
  sub_10001ADBC(a1, a1[3]);
  if (sub_100055B30()) {
    return sub_10001AC50((uint64_t)v4, (uint64_t)a3);
  }
  uint64_t v50 = &_swiftEmptyDictionarySingleton;
  uint64_t v7 = *(void *)(a2 + 16);
  if (!v7)
  {
LABEL_19:
    uint64_t v37 = v4[3];
    uint64_t v38 = v4[4];
    uint64_t v39 = sub_10001ADBC(v4, v37);
    __chkstk_darwin(v39);
    v42[2] = &v50;
    uint64_t v41 = sub_1000241AC((void (*)(char *, char *))sub_1000336DC, (uint64_t)v42, v37, (char *)&type metadata for UsageItem, (uint64_t)&type metadata for Never, v38, (uint64_t)&protocol witness table for Never, v40);
    a3[3] = sub_100005EB4(&qword_10006A500);
    a3[4] = sub_10000D120(&qword_10006A508, &qword_10006A500);
    *a3 = v41;
    return swift_bridgeObjectRelease();
  }
  double v43 = v4;
  uint64_t v44 = 0;
  uint64_t v45 = a3;
  swift_bridgeObjectRetain();
  v42[4] = a2;
  uint64_t v8 = (uint64_t *)(a2 + 80);
  uint64_t v9 = &_swiftEmptyDictionarySingleton;
  while (1)
  {
    uint64_t v13 = *(v8 - 6);
    long long v48 = *(_OWORD *)(v8 - 5);
    uint64_t v14 = (void *)*(v8 - 3);
    uint64_t v15 = *(v8 - 2);
    uint64_t v16 = *(v8 - 1);
    uint64_t v17 = *v8;
    uint64_t v46 = v7;
    uint64_t v47 = v16;
    uint64_t v18 = v48;
    swift_bridgeObjectRetain_n();
    id v19 = *((id *)&v48 + 1);
    id v20 = v14;
    swift_bridgeObjectRetain_n();
    id v21 = v19;
    id v22 = v20;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v49 = v9;
    uint64_t v50 = (void *)0x8000000000000000;
    unint64_t v25 = sub_100029ABC(v13, v48);
    uint64_t v26 = v9[2];
    BOOL v27 = (v24 & 1) == 0;
    uint64_t v28 = v26 + v27;
    if (__OFADD__(v26, v27)) {
      break;
    }
    char v29 = v24;
    if (v9[3] >= v28)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v9 = v49;
        if (v24) {
          goto LABEL_5;
        }
      }
      else
      {
        sub_10002C61C();
        uint64_t v9 = v49;
        if (v29) {
          goto LABEL_5;
        }
      }
    }
    else
    {
      sub_10002B6EC(v28, isUniquelyReferenced_nonNull_native);
      unint64_t v30 = sub_100029ABC(v13, v48);
      if ((v29 & 1) != (v31 & 1)) {
        goto LABEL_22;
      }
      unint64_t v25 = v30;
      uint64_t v9 = v49;
      if (v29)
      {
LABEL_5:
        uint64_t v10 = (uint64_t *)(v9[7] + 56 * v25);
        uint64_t v11 = (void *)v10[2];
        *(void *)&long long v48 = v10[1];
        uint64_t v12 = (void *)v10[3];
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        *uint64_t v10 = v13;
        v10[1] = v18;
        v10[2] = (uint64_t)v21;
        v10[3] = (uint64_t)v22;
        v10[4] = v15;
        v10[5] = v47;
        v10[6] = v17;
        goto LABEL_6;
      }
    }
    v9[(v25 >> 6) + 8] |= 1 << v25;
    os_log_type_t v32 = (uint64_t *)(v9[6] + 16 * v25);
    *os_log_type_t v32 = v13;
    v32[1] = v18;
    uint64_t v33 = v9[7] + 56 * v25;
    *(void *)uint64_t v33 = v13;
    *(_OWORD *)(v33 + 8) = v48;
    *(void *)(v33 + 24) = v22;
    *(void *)(v33 + 32) = v15;
    *(void *)(v33 + 40) = v47;
    *(void *)(v33 + 48) = v17;
    uint64_t v34 = v9[2];
    BOOL v35 = __OFADD__(v34, 1);
    uint64_t v36 = v34 + 1;
    if (v35) {
      goto LABEL_21;
    }
    v9[2] = v36;
    swift_bridgeObjectRetain();
LABEL_6:
    v8 += 7;
    uint64_t v50 = v9;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    uint64_t v7 = v46 - 1;
    if (v46 == 1)
    {
      swift_bridgeObjectRelease();
      a3 = v45;
      uint64_t v4 = v43;
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = sub_100056020();
  __break(1u);
  return result;
}

uint64_t sub_100028158@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v10 = *a2;
  uint64_t v11 = *(void *)(*a2 + 16);
  swift_bridgeObjectRetain();
  if (!v11) {
    goto LABEL_6;
  }
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_100029ABC(v8, v7);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  uint64_t v14 = (uint64_t *)(*(void *)(v10 + 56) + 56 * v12);
  uint64_t v15 = v14[1];
  uint64_t v17 = (void *)v14[2];
  uint64_t v16 = (void *)v14[3];
  uint64_t v22 = *v14;
  uint64_t v18 = v14[6];
  uint64_t v23 = v14[5];
  swift_bridgeObjectRetain();
  id v21 = v17;
  id v19 = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!v15)
  {
LABEL_6:
    uint64_t result = swift_bridgeObjectRetain();
    goto LABEL_7;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = v23;
  uint64_t result = sub_1000336FC(v22, v15, v21, v19);
  uint64_t v5 = v18;
LABEL_7:
  *a3 = v4;
  a3[1] = v5;
  a3[2] = v6;
  a3[3] = v8;
  a3[4] = v7;
  a3[5] = v9;
  return result;
}

BOOL sub_10002828C(uint64_t a1)
{
  return *(void *)(a1 + 40) == 3;
}

void sub_10002829C(void *a1@<X8>)
{
  *a1 = &_swiftEmptyArrayStorage;
}

uint64_t sub_1000282AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[17] = a5;
  v6[18] = v5;
  v6[15] = a3;
  v6[16] = a4;
  v6[13] = a1;
  v6[14] = a2;
  uint64_t v7 = sub_100054E00();
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  uint64_t v8 = sub_100054E20();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  uint64_t v9 = sub_100054E10();
  v6[25] = v9;
  v6[26] = *(void *)(v9 - 8);
  v6[27] = swift_task_alloc();
  v6[28] = sub_100005EB4(&qword_10006A148);
  v6[29] = swift_task_alloc();
  v6[30] = swift_task_alloc();
  uint64_t v10 = sub_100054C10();
  v6[31] = v10;
  v6[32] = *(void *)(v10 - 8);
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v6[35] = sub_100005EB4(&qword_10006A150);
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  uint64_t v11 = sub_100055070();
  v6[38] = v11;
  v6[39] = *(void *)(v11 - 8);
  v6[40] = swift_task_alloc();
  uint64_t v12 = sub_100054CD0();
  v6[41] = v12;
  v6[42] = *(void *)(v12 - 8);
  v6[43] = swift_task_alloc();
  return _swift_task_switch(sub_1000285D8, 0, 0);
}

uint64_t sub_1000285D8()
{
  sub_100054C90();
  sub_100054A00();
  sub_1000549E0();
  sub_1000337F8(&qword_100069ED8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v1 = sub_1000559C0();
  if (v1)
  {
    uint64_t v25 = v0[37];
    uint64_t v23 = v0[36];
    uint64_t v24 = v0[35];
    uint64_t v20 = v0[33];
    uint64_t v5 = v0[31];
    uint64_t v6 = v0[29];
    uint64_t v27 = v0[27];
    uint64_t v28 = v0[26];
    uint64_t v29 = v0[25];
    uint64_t v32 = v0[24];
    uint64_t v30 = v0[23];
    uint64_t v31 = v0[22];
    uint64_t v26 = v0[16];
    uint64_t v7 = v0[28];
    uint64_t v21 = v0[30];
    uint64_t v22 = v7;
    uint64_t v8 = v21 + *(int *)(v7 + 48);
    id v19 = (void *)v0[32];
    uint64_t v9 = (void (*)(void))v19[4];
    v9();
    ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v8, v20, v5);
    uint64_t v10 = v6;
    uint64_t v11 = v6 + *(int *)(v7 + 48);
    uint64_t v12 = (void (*)(void))v19[2];
    uint64_t v13 = v10;
    v12();
    ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v11, v8, v5);
    ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v23, v13, v5);
    uint64_t v14 = (void (*)(uint64_t, uint64_t))v19[1];
    v14(v11, v5);
    uint64_t v15 = v13 + *(int *)(v22 + 48);
    ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v13, v21, v5);
    ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v15, v8, v5);
    ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v23 + *(int *)(v24 + 36), v15, v5);
    v14(v13, v5);
    sub_10000D080(v23, v25, &qword_10006A150);
    sub_100055060();
    sub_100054E50();
    uint64_t v16 = sub_100054A10();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(v27, v26, v16);
    (*(void (**)(uint64_t, void, uint64_t))(v28 + 104))(v27, enum case for DeviceActivityFilter.SegmentInterval.hourly(_:), v29);
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v32, enum case for _SegmentInterval.hourly(_:), v31);
    uint64_t v17 = (void *)swift_task_alloc();
    v0[44] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_100028960;
    uint64_t v2 = v0[24];
    uint64_t v3 = v0[13];
    uint64_t v4 = v0[14];
    uint64_t v1 = v0[27];
  }
  else
  {
    __break(1u);
  }
  return static STDeviceActivityDataSource.fetchData(segment:segmentInterval:userAltDSID:)(v1, v2, v3, v4);
}

uint64_t sub_100028960(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 216);
  uint64_t v5 = *(void *)(*v2 + 208);
  uint64_t v6 = *(void *)(*v2 + 200);
  uint64_t v7 = *(void *)(*v2 + 192);
  uint64_t v8 = *(void *)(*v2 + 184);
  uint64_t v9 = *(void *)(*v2 + 176);
  *(void *)(v3 + 360) = a1;
  *(void *)(v3 + 368) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v1) {
    uint64_t v10 = sub_100029228;
  }
  else {
    uint64_t v10 = sub_100028B38;
  }
  return _swift_task_switch(v10, 0, 0);
}

uint64_t sub_100028B38()
{
  uint64_t v1 = v0[45];
  if (v1)
  {
    uint64_t v56 = v0 + 2;
    uint64_t v2 = v0 + 7;
    uint64_t v3 = v0[17];
    uint64_t v54 = sub_10002D2F8(v1);
    uint64_t v57 = sub_10002FCA4(v54, v3);
    uint64_t v4 = sub_10002FF38(v1);
    uint64_t v5 = sub_10003049C(v4);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(v1 + 16);
    if (v7)
    {
      uint64_t v53 = v5;
      uint64_t v8 = v0[20];
      uint64_t v11 = *(void (**)(uint64_t, unint64_t, uint64_t))(v8 + 16);
      uint64_t v10 = v8 + 16;
      uint64_t v9 = v11;
      unint64_t v12 = v1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
      uint64_t v13 = *(void *)(v10 + 56);
      swift_bridgeObjectRetain();
      double v14 = 0.0;
      do
      {
        uint64_t v15 = v0[21];
        uint64_t v16 = v0[19];
        v9(v15, v12, v16);
        sub_100054DD0();
        double v14 = v14 + v17;
        (*(void (**)(uint64_t, uint64_t))(v10 - 8))(v15, v16);
        v12 += v13;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      uint64_t v2 = v0 + 7;
      uint64_t v6 = v53;
    }
    else
    {
      double v14 = 0.0;
    }
    uint64_t v27 = v0[43];
    uint64_t v28 = v0[40];
    v0[5] = sub_100005EB4(&qword_10006A480);
    v0[6] = sub_10000D120(&qword_10006A488, &qword_10006A480);
    uint64_t v29 = sub_100030B34(v54, 3);
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    v0[2] = v29;
    v0[3] = v31;
    sub_100027D98(v56, v57, v2);
    sub_10001E980((uint64_t)v56);
    sub_10001EA94((long long *)v2, (uint64_t)v56);
    uint64_t v32 = sub_10003111C(v4, v6, v56);
    swift_bridgeObjectRelease();
    uint64_t v33 = v0[5];
    uint64_t v34 = v0[6];
    BOOL v35 = sub_10001ADBC(v56, v33);
    uint64_t v36 = sub_100032868(v32, (uint64_t)v35, 3uLL, v6, v28, v27, v33, v34);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v55 = v36;
    if (v14 == 0.0)
    {
      if (qword_100069908 != -1) {
        swift_once();
      }
      uint64_t v37 = sub_100054EA0();
      sub_1000096F4(v37, (uint64_t)qword_10006A2A0);
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_100054E80();
      os_log_type_t v39 = sub_100055C80();
      if (os_log_type_enabled(v38, v39))
      {
        uint64_t v40 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v40 = 134217984;
        uint64_t v41 = *(void *)(v1 + 16);
        swift_bridgeObjectRelease();
        v0[12] = v41;
        sub_100055D70();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "total screen on time was 0 from %ld activity segment(s)", v40, 0xCu);
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    uint64_t v42 = v0[42];
    uint64_t v43 = v0[43];
    uint64_t v44 = v0[39];
    uint64_t v51 = v0[40];
    uint64_t v52 = v0[41];
    uint64_t v50 = v0[38];
    uint64_t v45 = v0[5];
    sub_10001ADBC(v56, v45);
    uint64_t v46 = *(void *)(v45 - 8);
    swift_task_alloc();
    (*(void (**)(void))(v46 + 16))();
    uint64_t v47 = sub_100055B90();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v51, v50);
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v43, v52);
    swift_task_dealloc();
    sub_10001E980((uint64_t)v56);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    long long v48 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, __n128))v0[1];
    v49.n128_f64[0] = v14;
    return v48(v47, v55, v57, v49);
  }
  else
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_100054EA0();
    sub_1000096F4(v18, (uint64_t)qword_10006A2A0);
    id v19 = sub_100054E80();
    os_log_type_t v20 = sub_100055C90();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "did not get any activity segments", v21, 2u);
      swift_slowDealloc();
    }

    sub_1000293C8();
    swift_allocError();
    swift_willThrow();
    uint64_t v23 = v0[42];
    uint64_t v22 = v0[43];
    uint64_t v24 = v0[41];
    (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
}

uint64_t sub_100029228()
{
  uint64_t v2 = v0[42];
  uint64_t v1 = v0[43];
  uint64_t v3 = v0[41];
  (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10002935C()
{
  sub_10001E980(v0 + 16);
  sub_10001E980(v0 + 72);
  sub_10001E980(v0 + 112);

  return _swift_deallocClassInstance(v0, 152, 7);
}

uint64_t type metadata accessor for DeviceActivityUsageProvider()
{
  return self;
}

unint64_t sub_1000293C8()
{
  unint64_t result = qword_10006A478;
  if (!qword_10006A478)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A478);
  }
  return result;
}

uint64_t sub_10002941C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100029594(a1, a2, a3, a4, &qword_100069D40, (uint64_t (*)(void))&type metadata accessor for Date, (uint64_t (*)(void))&type metadata accessor for Date);
}

void *sub_100029450(void *result, int64_t a2, char a3, void *a4)
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
      sub_100005EB4(&qword_100069DD0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10002CD3C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100029560(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_100029594(a1, a2, a3, a4, &qword_10006A4A0, (uint64_t (*)(void))type metadata accessor for HourlyUsage, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
}

uint64_t sub_100029594(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  if (a3)
  {
    unint64_t v11 = *(void *)(a4 + 24);
    uint64_t v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v12 = a2;
      }
    }
  }
  else
  {
    uint64_t v12 = a2;
  }
  uint64_t v13 = *(void *)(a4 + 16);
  if (v12 <= v13) {
    uint64_t v14 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v14 = v12;
  }
  if (!v14)
  {
    uint64_t v18 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100005EB4(a5);
  uint64_t v15 = *(void *)(a6(0) - 8);
  uint64_t v16 = *(void *)(v15 + 72);
  unint64_t v17 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v18 = (void *)swift_allocObject();
  size_t v19 = j__malloc_size(v18);
  if (!v16 || (v19 - v17 == 0x8000000000000000 ? (BOOL v20 = v16 == -1) : (BOOL v20 = 0), v20))
  {
LABEL_29:
    uint64_t result = sub_100055EC0();
    __break(1u);
    return result;
  }
  v18[2] = v13;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v16);
LABEL_19:
  uint64_t v21 = *(void *)(a6(0) - 8);
  unint64_t v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v23 = (unint64_t)v18 + v22;
  if (a1)
  {
    if ((unint64_t)v18 < a4 || v23 >= a4 + v22 + *(void *)(v21 + 72) * v13)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100030DF4(0, v13, v23, a4, a7);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v18;
}

char *sub_100029814(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005EB4(&qword_10006A208);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[56 * v8 + 32]) {
          memmove(v12, a4 + 32, 56 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100033BD4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_100029940(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005EB4(&qword_10006A570);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[32 * v8 + 32]) {
          memmove(v13, a4 + 32, 32 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10002CE28(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_100029A50(unsigned __int8 a1)
{
  sub_100056070();
  sub_100024054();
  Swift::Int v2 = sub_1000560A0();

  return sub_100029BCC(a1, v2);
}

unint64_t sub_100029ABC(uint64_t a1, uint64_t a2)
{
  sub_100056070();
  sub_100055A40();
  Swift::Int v4 = sub_1000560A0();

  return sub_100029F44(a1, a2, v4);
}

unint64_t sub_100029B34(uint64_t a1)
{
  sub_100054A10();
  sub_1000337F8(&qword_10006A4B0, (void (*)(uint64_t))&type metadata accessor for DateInterval);
  uint64_t v2 = sub_1000559A0();

  return sub_10002A028(a1, v2);
}

unint64_t sub_100029BCC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x8000000100058630;
      unint64_t v8 = 0xD000000000000013;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x6C41737961776C61;
          unint64_t v7 = 0xED00006465776F6CLL;
          break;
        case 2:
          unint64_t v8 = 0x74696D694C707061;
          unint64_t v7 = 0xE900000000000073;
          break;
        case 3:
          break;
        case 4:
          unint64_t v7 = 0x8000000100058650;
          break;
        case 5:
          unint64_t v8 = 0xD00000000000001DLL;
          unint64_t v7 = 0x8000000100058670;
          break;
        case 6:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x656D69746E776F64;
          break;
        case 7:
          unint64_t v8 = 0x69446E6565726373;
          unint64_t v7 = 0xEE0065636E617473;
          break;
        case 8:
          unint64_t v8 = 0xD00000000000001BLL;
          unint64_t v7 = 0x80000001000586B0;
          break;
        default:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 1953460082;
          break;
      }
      unint64_t v9 = 0x8000000100058630;
      unint64_t v10 = 0xD000000000000013;
      switch(v6)
      {
        case 1:
          unint64_t v9 = 0xED00006465776F6CLL;
          if (v8 == 0x6C41737961776C61) {
            goto LABEL_27;
          }
          goto LABEL_28;
        case 2:
          unint64_t v9 = 0xE900000000000073;
          if (v8 != 0x74696D694C707061) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 3:
          goto LABEL_26;
        case 4:
          int64_t v11 = "communicationLimits";
          goto LABEL_21;
        case 5:
          unint64_t v10 = 0xD00000000000001DLL;
          int64_t v11 = "communicationSafety";
LABEL_21:
          unint64_t v9 = (unint64_t)v11 | 0x8000000000000000;
          if (v8 != v10) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 6:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x656D69746E776F64) {
            goto LABEL_28;
          }
          goto LABEL_27;
        case 7:
          unint64_t v10 = 0x69446E6565726373;
          unint64_t v9 = 0xEE0065636E617473;
LABEL_26:
          if (v8 == v10) {
            goto LABEL_27;
          }
          goto LABEL_28;
        case 8:
          unint64_t v9 = 0x80000001000586B0;
          if (v8 != 0xD00000000000001BLL) {
            goto LABEL_28;
          }
          goto LABEL_27;
        default:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 1953460082) {
            goto LABEL_28;
          }
LABEL_27:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_28:
          char v12 = sub_100055FE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v12) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_100029F44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100055FE0() & 1) == 0)
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
      while (!v14 && (sub_100055FE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002A028(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100054A10();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1000337F8(&qword_10006A4B8, (void (*)(uint64_t))&type metadata accessor for DateInterval);
      char v15 = sub_1000559D0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_10002A1E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A268(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002A208(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A3C8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002A228(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A534(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002A248(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002A6BC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10002A268(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100005EB4(&qword_100069DD0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002A3C8(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100005EB4(&qword_10006A578);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002A534(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005EB4(&qword_10006A510);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[48 * v8]) {
      memmove(v12, v13, 48 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[48 * v8] || v12 >= &v13[48 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002A6BC(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005EB4(&qword_10006A208);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[56 * v8]) {
      memmove(v12, v13, 56 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[56 * v8] || v12 >= &v13[56 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002A848(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v44)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;

  uint64_t v8 = a4 + 1;
  if (a4 + 1 >= a3)
  {
    swift_bridgeObjectRelease();
    LOBYTE(v23) = 0;
    *a1 = v8;
  }
  else
  {
    uint64_t v10 = a3;
    size_t v11 = (uint64_t *)(a2 + 48 * v8);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    uint64_t v14 = v11[2];
    uint64_t v15 = v11[3];
    uint64_t v16 = v11[4];
    uint64_t v17 = v11[5];
    uint64_t v64 = v12;
    uint64_t v65 = v13;
    uint64_t v66 = v14;
    uint64_t v67 = v15;
    uint64_t v68 = v16;
    uint64_t v69 = v17;
    uint64_t v18 = (uint64_t *)(a2 + 48 * a4);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    uint64_t v21 = v18[2];
    uint64_t v22 = v18[3];
    uint64_t v23 = v18[4];
    uint64_t v24 = v18[5];
    uint64_t v58 = v19;
    uint64_t v59 = v20;
    id v60 = v21;
    uint64_t v61 = v22;
    uint64_t v62 = v23;
    uint64_t v63 = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    int v25 = sub_100027BB4(&v64, &v58, a5);
    if (v5)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v70 = v25;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v27 = a4 + 2;
      if (a4 + 2 >= v10)
      {
        swift_bridgeObjectRelease();
        *a1 = v27;
        LOBYTE(v23) = v70;
      }
      else
      {
        long long v48 = a5 + 40;
        uint64_t v28 = a2;
        LOBYTE(v23) = v70;
        uint64_t v47 = a5;
        uint64_t v46 = v10;
        do
        {
          uint64_t v31 = (uint64_t *)(v28 + 48 * v27);
          uint64_t v32 = v31[4];
          if (*(void *)(a5 + 16))
          {
            uint64_t v54 = *(void *)(a5 + 16);
            uint64_t v33 = v31[1];
            uint64_t v56 = *v31;
            uint64_t v34 = v31[2];
            uint64_t v35 = v31[3];
            uint64_t v36 = v31[5];
            uint64_t v37 = (uint64_t *)(v28 + 48 * v8);
            uint64_t v38 = v37[1];
            uint64_t v52 = *v37;
            uint64_t v53 = v35;
            uint64_t v39 = v37[2];
            uint64_t v50 = v27;
            uint64_t v51 = v37[3];
            uint64_t v40 = v37[4];
            uint64_t v41 = v37[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v42 = v40;
            uint64_t v43 = v48;
            uint64_t v55 = v41;
            do
            {
              uint64_t v44 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v43 - 8);
              uint64_t v64 = v56;
              uint64_t v65 = v33;
              uint64_t v66 = v34;
              uint64_t v67 = v53;
              uint64_t v68 = v32;
              uint64_t v69 = v36;
              uint64_t v57 = v44;
              uint64_t v58 = v52;
              uint64_t v59 = v38;
              id v60 = v39;
              uint64_t v61 = v51;
              uint64_t v62 = v42;
              uint64_t v63 = v41;
              swift_retain();
              v57(&v71, &v64, &v58);
              if (v71) {
                goto LABEL_8;
              }
              uint64_t v64 = v52;
              uint64_t v65 = v38;
              uint64_t v66 = v39;
              uint64_t v67 = v51;
              uint64_t v68 = v40;
              uint64_t v69 = v55;
              uint64_t v58 = v56;
              uint64_t v59 = v33;
              id v60 = v34;
              uint64_t v61 = v53;
              uint64_t v62 = v32;
              uint64_t v63 = v36;
              v57(&v71, &v64, &v58);
              if (v71)
              {
LABEL_8:
                a5 = v47;
                swift_bridgeObjectRelease();
                uint64_t v64 = v56;
                uint64_t v65 = v33;
                uint64_t v66 = v34;
                uint64_t v67 = v53;
                uint64_t v68 = v32;
                uint64_t v69 = v36;
                uint64_t v58 = v52;
                uint64_t v59 = v38;
                id v60 = v39;
                uint64_t v61 = v51;
                uint64_t v62 = v40;
                uint64_t v63 = v55;
                v57(&v71, &v64, &v58);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_release();
                int v29 = v71;
                swift_bridgeObjectRelease();
                LOBYTE(v23) = v70;
                BOOL v30 = (v70 & 1) == v29;
                uint64_t v10 = v46;
                uint64_t v28 = a2;
                uint64_t v27 = v50;
                if (v30) {
                  goto LABEL_10;
                }
                goto LABEL_20;
              }
              swift_release();
              v43 += 16;
              uint64_t v41 = v55;
              BOOL v30 = v54-- == 1;
              uint64_t v42 = v40;
            }
            while (!v30);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            a5 = v47;
            swift_bridgeObjectRelease();
            uint64_t v10 = v46;
            uint64_t v28 = a2;
            uint64_t v27 = v50;
            LOBYTE(v23) = v70;
            swift_bridgeObjectRelease();
            if ((v23 & 1) == 0) {
              goto LABEL_10;
            }
LABEL_20:
            swift_bridgeObjectRelease();
            *a1 = v27;
            return v23 & 1;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (v23) {
            goto LABEL_20;
          }
LABEL_10:
          uint64_t v8 = v27++;
        }
        while (v27 != v10);
        swift_bridgeObjectRelease();
        *a1 = v10;
      }
    }
  }
  return v23 & 1;
}

char *sub_10002AC58(char *result, int64_t a2, char a3, char *a4)
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
    sub_100005EB4(&qword_10006A538);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10002AD54(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_100055F80();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10002AE10(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -48)
  {
    uint64_t result = (char *)sub_100055F80();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 48;
    if (result != v3 || result >= &v3[48 * v6])
    {
      return (char *)memmove(result, v3, 48 * v6);
    }
  }
  return result;
}

char *sub_10002AEE0(uint64_t a1)
{
  return sub_10002AC58(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_10002AEF4(void *a1)
{
  return sub_100029450(0, a1[2], 0, a1);
}

uint64_t sub_10002AF08(unint64_t a1)
{
  return sub_100029594(0, *(void *)(a1 + 16), 0, a1, &qword_10006A4A0, (uint64_t (*)(void))type metadata accessor for HourlyUsage, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
}

uint64_t sub_10002AF60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005EB4(&qword_10006A540);
  char v43 = a2;
  uint64_t v6 = sub_100055F60();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  for (i = v5; ; uint64_t v5 = i)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v40) {
      break;
    }
    uint64_t v23 = v41;
    unint64_t v24 = v41[v22];
    ++v13;
    if (!v24)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v24 = v41[v13];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v43 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v13 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v24 = v41[v13];
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    BOOL v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = (uint64_t *)(*(void *)(v5 + 56) + 48 * v21);
    uint64_t v34 = *v33;
    uint64_t v35 = v33[1];
    uint64_t v36 = v33[2];
    uint64_t v37 = v33[4];
    uint64_t v44 = v33[5];
    uint64_t v45 = v33[3];
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_100056070();
    sub_100055A40();
    uint64_t result = sub_1000560A0();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v16 == v27;
        if (v16 == v27) {
          unint64_t v16 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      unint64_t v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v32;
    v18[1] = v31;
    uint64_t v19 = (void *)(*(void *)(v7 + 56) + 48 * v17);
    void *v19 = v34;
    v19[1] = v35;
    v19[2] = v36;
    v19[3] = v45;
    v19[4] = v37;
    v19[5] = v44;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v23 = v41;
  if ((v43 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10002B2C4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_100054A10();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100005EB4(&qword_10006A518);
  int v44 = a2;
  uint64_t v10 = sub_100055F60();
  uint64_t v11 = v10;
  if (*(void *)(v9 + 16))
  {
    int64_t v40 = v2;
    uint64_t v12 = 1 << *(unsigned char *)(v9 + 32);
    uint64_t v13 = *(void *)(v9 + 64);
    uint64_t v42 = (void *)(v9 + 64);
    if (v12 < 64) {
      uint64_t v14 = ~(-1 << v12);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v15 = v14 & v13;
    int64_t v41 = (unint64_t)(v12 + 63) >> 6;
    char v43 = (void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v6 + 32);
    uint64_t v46 = v5;
    uint64_t v16 = v10 + 64;
    uint64_t result = swift_retain();
    int64_t v18 = 0;
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
        if (v22 >= v41) {
          goto LABEL_34;
        }
        unint64_t v23 = v42[v22];
        ++v18;
        if (!v23)
        {
          int64_t v18 = v22 + 1;
          if (v22 + 1 >= v41) {
            goto LABEL_34;
          }
          unint64_t v23 = v42[v18];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v41)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v40;
              if (v44)
              {
                uint64_t v38 = 1 << *(unsigned char *)(v9 + 32);
                if (v38 >= 64) {
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v42 = -1 << v38;
                }
                *(void *)(v9 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v42[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v18 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_41;
                }
                if (v18 >= v41) {
                  goto LABEL_34;
                }
                unint64_t v23 = v42[v18];
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
      uint64_t v25 = v9;
      uint64_t v26 = *(void *)(v9 + 48);
      uint64_t v27 = v6;
      uint64_t v28 = *(void *)(v6 + 72);
      uint64_t v29 = v26 + v28 * v21;
      if (v44) {
        (*v45)(v8, v29, v46);
      }
      else {
        (*v43)(v8, v29, v46);
      }
      uint64_t v30 = *(void *)(*(void *)(v25 + 56) + 8 * v21);
      sub_1000337F8(&qword_10006A4B0, (void (*)(uint64_t))&type metadata accessor for DateInterval);
      uint64_t result = sub_1000559A0();
      uint64_t v31 = -1 << *(unsigned char *)(v11 + 32);
      unint64_t v32 = result & ~v31;
      unint64_t v33 = v32 >> 6;
      if (((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v32) & ~*(void *)(v16 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v34 = 0;
        unint64_t v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v36 = v33 == v35;
          if (v33 == v35) {
            unint64_t v33 = 0;
          }
          v34 |= v36;
          uint64_t v37 = *(void *)(v16 + 8 * v33);
        }
        while (v37 == -1);
        unint64_t v19 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(void *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v45)(*(void *)(v11 + 48) + v28 * v19, v8, v46);
      *(void *)(*(void *)(v11 + 56) + 8 * v19) = v30;
      ++*(void *)(v11 + 16);
      uint64_t v6 = v27;
      uint64_t v9 = v25;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v11;
  return result;
}

uint64_t sub_10002B6EC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005EB4(&qword_10006A548);
  char v43 = a2;
  uint64_t v6 = sub_100055F60();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v41 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v40 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    for (i = v5; ; uint64_t v5 = i)
    {
      if (v10)
      {
        unint64_t v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v21 = v20 | (v13 << 6);
      }
      else
      {
        int64_t v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v40) {
          goto LABEL_33;
        }
        unint64_t v23 = v41[v22];
        ++v13;
        if (!v23)
        {
          int64_t v13 = v22 + 1;
          if (v22 + 1 >= v40) {
            goto LABEL_33;
          }
          unint64_t v23 = v41[v13];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v40)
            {
LABEL_33:
              swift_release();
              uint64_t v3 = v2;
              if (v43)
              {
                uint64_t v39 = 1 << *(unsigned char *)(v5 + 32);
                if (v39 >= 64) {
                  bzero(v41, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v41 = -1 << v39;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v23 = v41[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v13 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_40;
                }
                if (v13 >= v40) {
                  goto LABEL_33;
                }
                unint64_t v23 = v41[v13];
                ++v24;
                if (v23) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v13 = v24;
          }
        }
LABEL_30:
        unint64_t v10 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
      uint64_t v31 = *v29;
      uint64_t v30 = v29[1];
      uint64_t v32 = *(void *)(v5 + 56) + 56 * v21;
      uint64_t v33 = *(void *)v32;
      long long v45 = *(_OWORD *)(v32 + 8);
      char v34 = *(void **)(v32 + 24);
      uint64_t v35 = *(void *)(v32 + 32);
      uint64_t v36 = *(void *)(v32 + 48);
      uint64_t v44 = *(void *)(v32 + 40);
      if ((v43 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        id v37 = *((id *)&v45 + 1);
        id v38 = v34;
        swift_bridgeObjectRetain();
      }
      sub_100056070();
      sub_100055A40();
      uint64_t result = sub_1000560A0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v27 = v16 == v26;
          if (v16 == v26) {
            unint64_t v16 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
      void *v18 = v31;
      v18[1] = v30;
      uint64_t v19 = *(void *)(v7 + 56) + 56 * v17;
      *(void *)uint64_t v19 = v33;
      *(_OWORD *)(v19 + 8) = v45;
      *(void *)(v19 + 24) = v34;
      *(void *)(v19 + 32) = v35;
      *(void *)(v19 + 40) = v44;
      *(void *)(v19 + 48) = v36;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10002BA60(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005EB4(&qword_10006A4A8);
  char v37 = a2;
  uint64_t v6 = sub_100055F60();
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
    unint64_t v23 = (void *)(v5 + 64);
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
          if ((v37 & 1) == 0) {
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
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_100056070();
    sub_100055A40();
    uint64_t result = sub_1000560A0();
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
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    void *v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10002BD68(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v5 = v3;
  uint64_t v7 = sub_100054A10();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  unint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v3;
  sub_100005EB4(a3);
  int v48 = a2;
  uint64_t v12 = sub_100055F60();
  uint64_t v13 = v11;
  uint64_t v14 = v12;
  if (!*(void *)(v13 + 16)) {
    goto LABEL_41;
  }
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  uint64_t v16 = *(void *)(v13 + 64);
  uint64_t v44 = (void *)(v13 + 64);
  if (v15 < 64) {
    uint64_t v17 = ~(-1 << v15);
  }
  else {
    uint64_t v17 = -1;
  }
  unint64_t v18 = v17 & v16;
  uint64_t v42 = v5;
  int64_t v43 = (unint64_t)(v15 + 63) >> 6;
  long long v45 = (void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  uint64_t v47 = v8;
  uint64_t v19 = (void (**)(char *, unint64_t, uint64_t))(v8 + 32);
  uint64_t v20 = v12 + 64;
  uint64_t result = swift_retain();
  int64_t v22 = 0;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v18)
    {
      unint64_t v24 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      unint64_t v25 = v24 | (v22 << 6);
      goto LABEL_22;
    }
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v26 >= v43) {
      break;
    }
    unint64_t v27 = v44;
    unint64_t v28 = v44[v26];
    ++v22;
    if (!v28)
    {
      int64_t v22 = v26 + 1;
      if (v26 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v28 = v44[v22];
      if (!v28)
      {
        int64_t v29 = v26 + 2;
        if (v29 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v5 = v42;
          if ((v48 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v28 = v44[v29];
        if (!v28)
        {
          while (1)
          {
            int64_t v22 = v29 + 1;
            if (__OFADD__(v29, 1)) {
              goto LABEL_43;
            }
            if (v22 >= v43) {
              goto LABEL_34;
            }
            unint64_t v28 = v44[v22];
            ++v29;
            if (v28) {
              goto LABEL_21;
            }
          }
        }
        int64_t v22 = v29;
      }
    }
LABEL_21:
    unint64_t v18 = (v28 - 1) & v28;
    unint64_t v25 = __clz(__rbit64(v28)) + (v22 << 6);
LABEL_22:
    uint64_t v30 = *(void *)(v47 + 72);
    unint64_t v31 = *(void *)(v13 + 48) + v30 * v25;
    if (v48)
    {
      (*v19)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
    }
    else
    {
      (*v45)(v10, v31, v7);
      uint64_t v32 = *(void *)(*(void *)(v13 + 56) + 8 * v25);
      swift_bridgeObjectRetain();
    }
    sub_1000337F8(&qword_10006A4B0, (void (*)(uint64_t))&type metadata accessor for DateInterval);
    uint64_t result = sub_1000559A0();
    uint64_t v33 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v34) & ~*(void *)(v20 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v20 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v23 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v19)(*(void *)(v14 + 48) + v30 * v23, v10, v7);
    *(void *)(*(void *)(v14 + 56) + 8 * v23) = v32;
    ++*(void *)(v14 + 16);
  }
  swift_release();
  uint64_t v5 = v42;
  unint64_t v27 = v44;
  if ((v48 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v13 + 32);
  if (v40 >= 64) {
    bzero(v27, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v27 = -1 << v40;
  }
  *(void *)(v13 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v5 = v14;
  return result;
}

void *sub_10002C190()
{
  uint64_t v1 = v0;
  sub_100005EB4(&qword_10006A540);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100055F50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v30 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v30 >= v13) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v30);
    ++v9;
    if (!v31)
    {
      int64_t v9 = v30 + 1;
      if (v30 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v31 = *(void *)(v6 + 8 * v9);
      if (!v31) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v31 - 1) & v31;
    unint64_t v15 = __clz(__rbit64(v31)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 48 * v15;
    unint64_t v21 = (uint64_t *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    uint64_t v24 = v21[2];
    uint64_t v25 = v21[3];
    uint64_t v26 = v21[4];
    uint64_t v27 = v21[5];
    unint64_t v28 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v28 = v19;
    v28[1] = v18;
    int64_t v29 = (void *)(*(void *)(v4 + 56) + v20);
    void *v29 = v22;
    v29[1] = v23;
    v29[2] = v24;
    v29[3] = v25;
    v29[4] = v26;
    void v29[5] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v32 = v30 + 2;
  if (v32 >= v13) {
    goto LABEL_26;
  }
  unint64_t v31 = *(void *)(v6 + 8 * v32);
  if (v31)
  {
    int64_t v9 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v31 = *(void *)(v6 + 8 * v9);
    ++v32;
    if (v31) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002C37C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100054A10();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EB4(&qword_10006A518);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_100055F50();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v20);
    ++v11;
    if (!v21)
    {
      int64_t v11 = v20 + 1;
      if (v20 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)(v24 + 8 * v11);
      if (!v21) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v21 - 1) & v21;
    unint64_t v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 8 * v16;
    uint64_t v19 = *(void *)(*(void *)(v6 + 56) + v18);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    *(void *)(*(void *)(v8 + 56) + v18) = v19;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v25)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v24 + 8 * v22);
  if (v21)
  {
    int64_t v11 = v22;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)(v24 + 8 * v11);
    ++v22;
    if (v21) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10002C61C()
{
  uint64_t v1 = v0;
  sub_100005EB4(&qword_10006A548);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100055F50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v31 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v31 >= v13) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v6 + 8 * v31);
    ++v9;
    if (!v32)
    {
      int64_t v9 = v31 + 1;
      if (v31 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v32 = *(void *)(v6 + 8 * v9);
      if (!v32) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v32 - 1) & v32;
    unint64_t v15 = __clz(__rbit64(v32)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 56 * v15;
    uint64_t v21 = *(void *)(v2 + 56) + v20;
    uint64_t v22 = *(void *)v21;
    uint64_t v23 = *(void **)(v21 + 24);
    uint64_t v24 = *(void *)(v21 + 32);
    uint64_t v25 = *(void *)(v21 + 40);
    uint64_t v26 = *(void *)(v21 + 48);
    uint64_t v27 = (void *)(*(void *)(v4 + 48) + v16);
    long long v34 = *(_OWORD *)(v21 + 8);
    *uint64_t v27 = v19;
    v27[1] = v18;
    uint64_t v28 = *(void *)(v4 + 56) + v20;
    *(void *)uint64_t v28 = v22;
    *(_OWORD *)(v28 + 8) = v34;
    *(void *)(v28 + 24) = v23;
    *(void *)(v28 + 32) = v24;
    *(void *)(v28 + 40) = v25;
    *(void *)(v28 + 48) = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v29 = *((id *)&v34 + 1);
    id v30 = v23;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v33 = v31 + 2;
  if (v33 >= v13) {
    goto LABEL_26;
  }
  unint64_t v32 = *(void *)(v6 + 8 * v33);
  if (v32)
  {
    int64_t v9 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v32 = *(void *)(v6 + 8 * v9);
    ++v33;
    if (v32) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002C830()
{
  uint64_t v1 = v0;
  sub_100005EB4(&qword_10006A4A8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100055F50();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
      goto LABEL_28;
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002C9E0(uint64_t *a1)
{
  uint64_t v3 = sub_100054A10();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EB4(a1);
  uint64_t v26 = v1;
  uint64_t v7 = *v1;
  uint64_t v8 = sub_100055F50();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v26 = v9;
    return result;
  }
  uint64_t result = (void *)(v8 + 64);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  }
  int64_t v13 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v14 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & *(void *)(v7 + 64);
  uint64_t v27 = v7 + 64;
  int64_t v28 = (unint64_t)(v14 + 63) >> 6;
  uint64_t v29 = v4 + 32;
  uint64_t v30 = v4 + 16;
  while (1)
  {
    if (v16)
    {
      unint64_t v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v22 + 1;
      if (v22 + 1 >= v28) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v27 + 8 * v13);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v16 = (v23 - 1) & v23;
    unint64_t v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    unint64_t v19 = *(void *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(void *)(v7 + 48) + v19, v3);
    uint64_t v20 = 8 * v18;
    uint64_t v21 = *(void *)(*(void *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(void *)(v9 + 48) + v19, v6, v3);
    *(void *)(*(void *)(v9 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v28) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v27 + 8 * v24);
  if (v23)
  {
    int64_t v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v13 >= v28) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v27 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002CC74(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10002CC88(uint64_t a1)
{
  return sub_10002A534(0, *(void *)(a1 + 16), 0, (char *)a1);
}

BOOL sub_10002CC9C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = sub_100055FE0(), result = 0, (v5 & 1) != 0))
  {
    if (*(double *)(a1 + 16) == *(double *)(a2 + 16))
    {
      if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
        return *(void *)(a1 + 40) == *(void *)(a2 + 40);
      }
      char v8 = sub_100055FE0();
      BOOL result = 0;
      if (v8) {
        return *(void *)(a1 + 40) == *(void *)(a2 + 40);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

char *sub_10002CD3C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  BOOL result = (char *)sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002CE28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002CF1C(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 40) = a5;
  *(void *)(v6 + 48) = a6;
  *(void *)(v6 + 24) = a3;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 16) = a2;
  *(unsigned char *)(v6 + 72) = a1;
  return _swift_task_switch(sub_10002CF48, 0, 0);
}

uint64_t sub_10002CF48()
{
  if (*(unsigned char *)(v0 + 72) == 1)
  {
    if (qword_100069908 != -1) {
      swift_once();
    }
    uint64_t v1 = sub_100054EA0();
    sub_1000096F4(v1, (uint64_t)qword_10006A2A0);
    uint64_t v2 = sub_100054E80();
    os_log_type_t v3 = sub_100055C80();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetch profile picture started", v4, 2u);
      swift_slowDealloc();
    }
    uint64_t v5 = *(void *)(v0 + 32);
    uint64_t v6 = *(void *)(v0 + 16);

    if (v6 && v5)
    {
      uint64_t v7 = *(void *)(v0 + 32);
      unint64_t v18 = (uint64_t (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100069AF8 + dword_100069AF8);
      id v8 = *(id *)(v0 + 16);
      uint64_t v9 = (void *)swift_task_alloc();
      *(void *)(v0 + 56) = v9;
      void *v9 = v0;
      v9[1] = sub_10002D190;
      uint64_t v10 = *(void *)(v0 + 40);
      uint64_t v11 = *(void *)(v0 + 48);
      uint64_t v12 = *(void *)(v0 + 24);
      return v18(v8, v12, v7, v10, v11);
    }
    uint64_t v14 = sub_100054E80();
    os_log_type_t v15 = sub_100055C90();
    if (os_log_type_enabled(v14, v15))
    {
      unint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "couldn't fetch profile pic because dsid or full name was nil", v16, 2u);
      swift_slowDealloc();
    }
  }
  unint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17(0);
}

uint64_t sub_10002D190(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10002D290, 0, 0);
}

uint64_t sub_10002D290()
{
  uint64_t v1 = *(void *)(v0 + 64);

  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10002D2F8(uint64_t a1)
{
  uint64_t v2 = sub_100054DC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v196 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100054D30();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v196 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100054D90();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  v226 = (char *)v196 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  v216 = (char *)v196 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  os_log_t v217 = (char *)v196 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)v196 - v19;
  __chkstk_darwin(v18);
  id v225 = (char *)v196 - v21;
  uint64_t v22 = sub_100054E00();
  __chkstk_darwin(v22);
  uint64_t v203 = *(void *)(a1 + 16);
  if (!v203)
  {
    v189 = 0;
    uint64_t v190 = 0;
    uint64_t v191 = 0;
    id v192 = 0;
    id v193 = 0;
    id v194 = 0;
    v247 = &_swiftEmptyDictionarySingleton;
LABEL_87:
    sub_100033548((uint64_t)v189);
    sub_100033548(v190);
    sub_100033548((uint64_t)v191);
    sub_100033548((uint64_t)v192);
    sub_100033548((uint64_t)v193);
    sub_100033548((uint64_t)v194);
    return (uint64_t)v247;
  }
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  uint64_t v26 = v25 + 16;
  id v206 = v27;
  uint64_t v205 = a1 + ((*(unsigned __int8 *)(v26 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 64));
  uint64_t v204 = *(void *)(v26 + 56);
  uint64_t v229 = v11 + 16;
  uint64_t v221 = v11;
  id v224 = (void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v215 = CTCategoryIdentifierSystemUnblockable;
  uint64_t v214 = CTCategoryIdentifierSystemBlockable;
  uint64_t v242 = v7 + 16;
  uint64_t v222 = CTCategoryIdentifierSystemHidden;
  uint64_t v236 = v3 + 16;
  id v237 = (void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v212 = v3;
  uint64_t v231 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v207 = v26;
  id v201 = (void (**)(char *, uint64_t))(v26 - 8);
  v196[1] = a1;
  uint64_t v28 = v24;
  uint64_t v29 = (char *)v196 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  int v198 = 0;
  os_log_type_t v197 = 0;
  id v200 = 0;
  uint64_t v199 = 0;
  id v238 = 0;
  uint64_t v239 = 0;
  uint64_t v240 = 0;
  unint64_t v241 = 0;
  id v233 = 0;
  uint64_t v232 = 0;
  uint64_t v235 = 0;
  uint64_t v234 = 0;
  uint64_t v30 = 0;
  v247 = &_swiftEmptyDictionarySingleton;
  uint64_t v243 = v2;
  uint64_t v244 = v6;
  unint64_t v245 = v5;
  uint64_t v210 = v7;
  unint64_t v246 = v9;
  uint64_t v213 = v20;
  uint64_t v230 = v10;
  uint64_t v202 = v28;
  unint64_t v209 = v29;
  while (1)
  {
    uint64_t v208 = v30;
    v206(v29, v205 + v204 * v30, v28);
    uint64_t v32 = sub_100054DF0();
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33)
    {
      unint64_t v34 = (*(unsigned __int8 *)(v221 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v221 + 80);
      uint64_t v219 = v32;
      unint64_t v35 = v32 + v34;
      os_log_type_t v227 = *(void (**)(void, void, void))(v221 + 72);
      char v36 = *(void (**)(char *, char *, uint64_t))(v221 + 16);
      uint64_t v37 = v230;
      int v228 = v36;
      do
      {
        BOOL v38 = v225;
        v36(v225, (char *)v35, v37);
        sub_100054D40();
        uint64_t v37 = v230;
        double v40 = v39;
        v36(v20, v38, v230);
        if (v40 <= 0.0)
        {
          uint64_t v52 = *v224;
          (*v224)(v20, v37);
        }
        else
        {
          uint64_t v41 = sub_100055A10();
          uint64_t v43 = v42;
          uint64_t v44 = sub_100055A10();
          uint64_t v46 = v45;
          uint64_t v47 = sub_100055A10();
          uint64_t v223 = v48;
          if (sub_100054D50() == v41 && v49 == v43)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v50 = v217;
            uint64_t v37 = v230;
            uint64_t v51 = v228;
            v228(v217, v20, v230);
LABEL_12:
            uint64_t v54 = v51;
            uint64_t v52 = *v224;
            (*v224)(v50, v37);
            swift_bridgeObjectRelease();
            uint64_t v55 = v216;
            v54(v216, v20, v37);
            uint64_t v2 = v243;
            uint64_t v6 = v244;
            uint64_t v5 = v245;
LABEL_13:
            v52(v55, v37);
            swift_bridgeObjectRelease();
            v52(v20, v37);
            goto LABEL_14;
          }
          uint64_t v220 = v47;
          char v53 = sub_100055FE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v50 = v217;
          uint64_t v37 = v230;
          uint64_t v51 = v228;
          v228(v217, v20, v230);
          if (v53) {
            goto LABEL_12;
          }
          if (sub_100054D50() == v44 && v56 == v46) {
            char v57 = 1;
          }
          else {
            char v57 = sub_100055FE0();
          }
          uint64_t v5 = v245;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v52 = *v224;
          uint64_t v58 = v230;
          (*v224)(v217, v230);
          uint64_t v55 = v216;
          v228(v216, v213, v58);
          if (v57)
          {
            uint64_t v2 = v243;
            uint64_t v6 = v244;
            uint64_t v37 = v230;
            uint64_t v20 = v213;
            goto LABEL_13;
          }
          uint64_t v59 = sub_100054D50();
          uint64_t v6 = v244;
          if (v59 == v220 && v60 == v223)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v37 = v230;
            v52(v216, v230);
            uint64_t v20 = v213;
            v52(v213, v37);
          }
          else
          {
            char v61 = sub_100055FE0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v37 = v230;
            v52(v216, v230);
            uint64_t v20 = v213;
            v52(v213, v37);
            if ((v61 & 1) == 0)
            {
              uint64_t v62 = sub_100054D50();
              uint64_t v64 = v63;
              uint64_t v65 = sub_100054D70();
              if (v66)
              {
                uint64_t v67 = v65;
                uint64_t v68 = v66;
              }
              else
              {
                swift_bridgeObjectRetain();
                uint64_t v67 = v62;
                uint64_t v68 = v64;
              }
              uint64_t v69 = (uint64_t)v200;
              uint64_t v70 = (void *)swift_allocObject();
              v70[2] = v67;
              v70[3] = v68;
              v70[4] = v62;
              v70[5] = v64;
              swift_bridgeObjectRetain();
              sub_100033548((uint64_t)v198);
              sub_100054D40();
              double v72 = v71;
              uint64_t v73 = v62;
              uint64_t v74 = swift_allocObject();
              *(void *)(v74 + 16) = sub_100033678;
              *(void *)(v74 + 24) = v70;
              sub_100033548(v69);
              double v75 = v247;
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              os_log_t v248 = v75;
              uint64_t v220 = v73;
              uint64_t v223 = v64;
              unint64_t v78 = sub_100029ABC(v73, v64);
              uint64_t v79 = v75[2];
              BOOL v80 = (v77 & 1) == 0;
              uint64_t v81 = v79 + v80;
              if (__OFADD__(v79, v80)) {
                goto LABEL_93;
              }
              char v82 = v77;
              if (v75[3] >= v81)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  sub_10002C190();
                }
              }
              else
              {
                sub_10002AF60(v81, isUniquelyReferenced_nonNull_native);
                unint64_t v83 = sub_100029ABC(v220, v223);
                if ((v82 & 1) != (v84 & 1)) {
                  goto LABEL_95;
                }
                unint64_t v78 = v83;
              }
              uint64_t v9 = v246;
              uint64_t v85 = v248;
              swift_bridgeObjectRelease();
              uint64_t v86 = swift_bridgeObjectRetain();
              if ((v82 & 1) == 0)
              {
                (*(void (**)(void **__return_ptr, uint64_t))(v74 + 16))(&v248, v86);
                uint64_t v87 = v248;
                uint64_t v88 = v249;
                uint64_t v89 = v250;
                long long v90 = v251;
                uint64_t v91 = v252;
                v85[(v78 >> 6) + 8] |= 1 << v78;
                uint64_t v92 = (void *)(v85[6] + 16 * v78);
                uint64_t v93 = v223;
                *uint64_t v92 = v220;
                v92[1] = v93;
                uint64_t v94 = v85[7] + 48 * v78;
                *(void *)uint64_t v94 = v87;
                *(void *)(v94 + 8) = v88;
                *(void *)(v94 + 16) = v89;
                *(_OWORD *)(v94 + 24) = v90;
                *(void *)(v94 + 40) = v91;
                uint64_t v95 = v85[2];
                BOOL v96 = __OFADD__(v95, 1);
                uint64_t v97 = v95 + 1;
                if (v96) {
                  goto LABEL_94;
                }
                v85[2] = v97;
                swift_bridgeObjectRetain();
              }
              uint64_t v98 = v85;
              uint64_t v99 = v85[7];
              v247 = v98;
              swift_bridgeObjectRelease();
              *(double *)(v99 + 48 * v78 + 16) = v72 + *(double *)(v99 + 48 * v78 + 16);
              swift_bridgeObjectRelease();
              uint64_t v37 = v230;
              v52(v225, v230);
              id v200 = sub_100033CE8;
              int v198 = sub_100033678;
              os_log_type_t v197 = v70;
              uint64_t v199 = v74;
              uint64_t v2 = v243;
              uint64_t v6 = v244;
              uint64_t v5 = v245;
              goto LABEL_15;
            }
          }
          uint64_t v2 = v243;
        }
LABEL_14:
        v52(v225, v37);
        uint64_t v9 = v246;
LABEL_15:
        v35 += (unint64_t)v227;
        --v33;
        char v36 = v228;
      }
      while (v33);
    }
    swift_bridgeObjectRelease();
    uint64_t v100 = sub_100054DF0();
    uint64_t v220 = *(void *)(v100 + 16);
    if (v220) {
      break;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    uint64_t v31 = v208 + 1;
    uint64_t v29 = v209;
    uint64_t v28 = v202;
    (*v201)(v209, v202);
    uint64_t v30 = v31;
    if (v31 == v203)
    {
      swift_bridgeObjectRelease();
      id v194 = v235;
      id v192 = v241;
      uint64_t v190 = (uint64_t)v200;
      id v193 = v233;
      uint64_t v191 = v239;
      v189 = v198;
      goto LABEL_87;
    }
  }
  unint64_t v101 = 0;
  uint64_t v102 = v221;
  uint64_t v219 = v100 + ((*(unsigned __int8 *)(v102 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v102 + 80));
  uint64_t v103 = v230;
  uint64_t v218 = v100;
  while (1)
  {
    if (v101 >= *(void *)(v100 + 16)) {
      goto LABEL_92;
    }
    uint64_t v105 = *(void *)(v102 + 72);
    uint64_t v223 = v101;
    (*(void (**)(char *, unint64_t, uint64_t))(v102 + 16))(v226, v219 + v105 * v101, v103);
    uint64_t v106 = sub_100055A10();
    uint64_t v108 = v107;
    if (sub_100054D50() != v106 || v109 != v108) {
      break;
    }
    swift_bridgeObjectRelease_n();
LABEL_44:
    unint64_t v104 = v223 + 1;
    uint64_t v103 = v230;
    (*v224)(v226, v230);
    unint64_t v101 = v104;
    uint64_t v102 = v221;
    uint64_t v100 = v218;
    if (v104 == v220) {
      goto LABEL_3;
    }
  }
  char v110 = sub_100055FE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v110) {
    goto LABEL_44;
  }
  uint64_t v111 = sub_100054D80();
  uint64_t v112 = *(void *)(v111 + 16);
  if (!v112)
  {
LABEL_68:
    swift_bridgeObjectRelease();
    uint64_t v152 = sub_100054D60();
    uint64_t v153 = *(void *)(v152 + 16);
    if (v153)
    {
      unint64_t v154 = (*(unsigned __int8 *)(v212 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v212 + 80);
      uint64_t v211 = v152;
      unint64_t v155 = v152 + v154;
      size_t v156 = *(void (**)(char *, char *, uint64_t))(v212 + 72);
      unint64_t v157 = *(void (**)(void, void, void))(v212 + 16);
      int v228 = v156;
      os_log_type_t v227 = v157;
      v157(v5, v152 + v154, v2);
      while (1)
      {
        sub_100054DA0();
        if (v160 > 0.0)
        {
          uint64_t v161 = sub_100054DB0();
          uint64_t v163 = v162;
          uint64_t v164 = swift_allocObject();
          *(void *)(v164 + 16) = v161;
          *(void *)(v164 + 24) = v163;
          swift_bridgeObjectRetain();
          sub_100033548((uint64_t)v233);
          sub_100054DA0();
          double v166 = v165;
          uint64_t v167 = swift_allocObject();
          *(void *)(v167 + 16) = sub_100033590;
          *(void *)(v167 + 24) = v164;
          sub_100033548((uint64_t)v235);
          uint64_t v168 = v247;
          char v169 = swift_isUniquelyReferenced_nonNull_native();
          os_log_t v248 = v168;
          unint64_t v171 = sub_100029ABC(v161, v163);
          uint64_t v172 = v168[2];
          BOOL v173 = (v170 & 1) == 0;
          uint64_t v174 = v172 + v173;
          if (__OFADD__(v172, v173)) {
            goto LABEL_89;
          }
          char v175 = v170;
          if (v168[3] >= v174)
          {
            if ((v169 & 1) == 0) {
              sub_10002C190();
            }
          }
          else
          {
            sub_10002AF60(v174, v169);
            unint64_t v176 = sub_100029ABC(v161, v163);
            if ((v175 & 1) != (v177 & 1)) {
              goto LABEL_95;
            }
            unint64_t v171 = v176;
          }
          uint64_t v5 = v245;
          os_log_type_t v178 = v248;
          swift_bridgeObjectRelease();
          uint64_t v179 = swift_bridgeObjectRetain();
          if ((v175 & 1) == 0)
          {
            (*(void (**)(void **__return_ptr, uint64_t))(v167 + 16))(&v248, v179);
            uint64_t v180 = v248;
            uint64_t v181 = v249;
            uint64_t v182 = v250;
            long long v183 = v251;
            uint64_t v184 = v252;
            v178[(v171 >> 6) + 8] |= 1 << v171;
            v185 = (uint64_t *)(v178[6] + 16 * v171);
            uint64_t *v185 = v161;
            v185[1] = v163;
            uint64_t v186 = v178[7] + 48 * v171;
            *(void *)uint64_t v186 = v180;
            *(void *)(v186 + 8) = v181;
            *(void *)(v186 + 16) = v182;
            *(_OWORD *)(v186 + 24) = v183;
            *(void *)(v186 + 40) = v184;
            uint64_t v187 = v178[2];
            BOOL v96 = __OFADD__(v187, 1);
            uint64_t v188 = v187 + 1;
            if (v96) {
              goto LABEL_91;
            }
            v178[2] = v188;
            swift_bridgeObjectRetain();
          }
          uint64_t v158 = v178;
          uint64_t v159 = v178[7];
          v247 = v158;
          swift_bridgeObjectRelease();
          *(double *)(v159 + 48 * v171 + 16) = v166 + *(double *)(v159 + 48 * v171 + 16);
          swift_bridgeObjectRelease();
          uint64_t v235 = sub_1000335D0;
          id v233 = sub_100033590;
          uint64_t v232 = v164;
          uint64_t v234 = v167;
          uint64_t v2 = v243;
          uint64_t v6 = v244;
          uint64_t v9 = v246;
          size_t v156 = v228;
          unint64_t v157 = v227;
        }
        (*v231)(v5, v2);
        v155 += (unint64_t)v156;
        if (!--v153) {
          break;
        }
        v157(v5, v155, v2);
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v20 = v213;
    goto LABEL_44;
  }
  unint64_t v113 = (*(unsigned __int8 *)(v210 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v210 + 80);
  uint64_t v211 = v111;
  unint64_t v114 = v111 + v113;
  id v115 = *(void (**)(char *, char *, uint64_t))(v210 + 72);
  uint64_t v116 = *(void (**)(void, void, void))(v210 + 16);
  int v228 = v115;
  os_log_type_t v227 = v116;
  v116(v9, v111 + v113, v6);
  while (1)
  {
    sub_100054D00();
    if (v119 <= 0.0) {
      goto LABEL_52;
    }
    uint64_t v120 = sub_100054D10();
    uint64_t v122 = v121;
    uint64_t v123 = sub_100054D20();
    if (v124)
    {
      uint64_t v125 = v123;
      uint64_t v126 = v124;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v125 = v120;
      uint64_t v126 = v122;
    }
    double v127 = (void *)swift_allocObject();
    v127[2] = v125;
    v127[3] = v126;
    v127[4] = v120;
    v127[5] = v122;
    swift_bridgeObjectRetain();
    sub_100033548((uint64_t)v239);
    sub_100054D00();
    double v129 = v128;
    uint64_t v130 = swift_allocObject();
    *(void *)(v130 + 16) = sub_10003361C;
    *(void *)(v130 + 24) = v127;
    sub_100033548((uint64_t)v241);
    id v131 = v247;
    char v132 = swift_isUniquelyReferenced_nonNull_native();
    os_log_t v248 = v131;
    unint64_t v134 = sub_100029ABC(v120, v122);
    uint64_t v135 = v131[2];
    BOOL v136 = (v133 & 1) == 0;
    uint64_t v137 = v135 + v136;
    if (__OFADD__(v135, v136)) {
      break;
    }
    char v138 = v133;
    if (v131[3] >= v137)
    {
      if ((v132 & 1) == 0) {
        sub_10002C190();
      }
    }
    else
    {
      sub_10002AF60(v137, v132);
      unint64_t v139 = sub_100029ABC(v120, v122);
      if ((v138 & 1) != (v140 & 1)) {
        goto LABEL_95;
      }
      unint64_t v134 = v139;
    }
    uint64_t v5 = v245;
    id v141 = v248;
    swift_bridgeObjectRelease();
    uint64_t v142 = swift_bridgeObjectRetain();
    if ((v138 & 1) == 0)
    {
      (*(void (**)(void **__return_ptr, uint64_t))(v130 + 16))(&v248, v142);
      id v143 = v248;
      uint64_t v144 = v249;
      uint64_t v145 = v250;
      long long v146 = v251;
      uint64_t v147 = v252;
      v141[(v134 >> 6) + 8] |= 1 << v134;
      uint64_t v148 = (uint64_t *)(v141[6] + 16 * v134);
      *uint64_t v148 = v120;
      v148[1] = v122;
      uint64_t v149 = v141[7] + 48 * v134;
      *(void *)uint64_t v149 = v143;
      *(void *)(v149 + 8) = v144;
      *(void *)(v149 + 16) = v145;
      *(_OWORD *)(v149 + 24) = v146;
      *(void *)(v149 + 40) = v147;
      uint64_t v150 = v141[2];
      BOOL v96 = __OFADD__(v150, 1);
      uint64_t v151 = v150 + 1;
      if (v96) {
        goto LABEL_90;
      }
      v141[2] = v151;
      swift_bridgeObjectRetain();
    }
    uint64_t v117 = v141;
    uint64_t v118 = v141[7];
    v247 = v117;
    swift_bridgeObjectRelease();
    *(double *)(v118 + 48 * v134 + 16) = v129 + *(double *)(v118 + 48 * v134 + 16);
    swift_bridgeObjectRelease();
    uint64_t v240 = v130;
    unint64_t v241 = sub_100033CE8;
    id v238 = v127;
    uint64_t v239 = sub_10003361C;
    uint64_t v2 = v243;
    uint64_t v6 = v244;
    uint64_t v9 = v246;
    id v115 = v228;
    uint64_t v116 = v227;
LABEL_52:
    (*v237)(v9, v6);
    v114 += (unint64_t)v115;
    if (!--v112) {
      goto LABEL_68;
    }
    v116(v9, v114, v6);
  }
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  uint64_t result = sub_100056020();
  __break(1u);
  return result;
}

uint64_t sub_10002E78C(char *__src, char *a2, unint64_t a3, char *__dst, uint64_t a5)
{
  void (*v46)(char *__return_ptr, uint64_t *, uint64_t *);
  char *v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  uint64_t result;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v63;
  char *v64;
  char *v65;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *__return_ptr, uint64_t *, uint64_t *);
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char *v95;

  uint64_t v5 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 48;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 48;
  uint64_t v95 = __src;
  uint64_t v94 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -47)
    {
      if (__dst != a2 || &a2[48 * v11] <= __dst) {
        memmove(__dst, a2, 48 * v11);
      }
      uint64_t v30 = &v5[48 * v11];
      uint64_t v93 = v30;
      uint64_t v95 = v6;
      uint64_t v31 = (char *)a3;
      if (v10 >= 48 && v7 < v6)
      {
        uint64_t v32 = *(void *)(a5 + 16);
        char v53 = v32;
        uint64_t v60 = v7;
        char v61 = v5;
        while (1)
        {
          uint64_t v33 = v31 - 48;
          unint64_t v34 = v30 - 48;
          uint64_t v35 = *((void *)v30 - 6);
          if (!v32) {
            goto LABEL_45;
          }
          uint64_t v56 = v31 - 48;
          uint64_t v58 = v30;
          uint64_t v63 = v31;
          uint64_t v65 = v6;
          uint64_t v36 = *((void *)v30 - 5);
          uint64_t v37 = *((void *)v30 - 4);
          uint64_t v38 = *((void *)v30 - 3);
          uint64_t v39 = *((void *)v30 - 2);
          uint64_t v41 = *((void *)v6 - 6);
          uint64_t v40 = *((void *)v6 - 5);
          uint64_t v54 = v6 - 48;
          uint64_t v55 = v30 - 48;
          uint64_t v68 = *((void *)v30 - 1);
          uint64_t v42 = *((void *)v6 - 4);
          uint64_t v43 = *((void *)v6 - 2);
          double v72 = *((void *)v6 - 3);
          uint64_t v70 = *((void *)v6 - 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v44 = a5 + 40;
          uint64_t v45 = v32;
          double v75 = v41;
          char v77 = v36;
          while (1)
          {
            uint64_t v46 = *(void (**)(char *__return_ptr, uint64_t *, uint64_t *))(v44 - 8);
            uint64_t v87 = v35;
            uint64_t v88 = v36;
            uint64_t v89 = v37;
            long long v90 = v38;
            uint64_t v91 = v39;
            uint64_t v92 = v68;
            uint64_t v81 = v41;
            char v82 = v40;
            unint64_t v83 = v42;
            char v84 = v72;
            uint64_t v85 = v43;
            uint64_t v86 = v70;
            swift_retain();
            v46(&v80, &v87, &v81);
            if (v80) {
              break;
            }
            uint64_t v87 = v75;
            uint64_t v88 = v40;
            uint64_t v89 = v42;
            long long v90 = v72;
            uint64_t v91 = v43;
            uint64_t v92 = v70;
            uint64_t v81 = v35;
            char v82 = v77;
            unint64_t v83 = v37;
            char v84 = v38;
            uint64_t v85 = v39;
            uint64_t v86 = v68;
            v46(&v80, &v87, &v81);
            if (v80 == 1) {
              break;
            }
            swift_release();
            v44 += 16;
            --v45;
            uint64_t v41 = v75;
            uint64_t v36 = v77;
            if (!v45)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v7 = v60;
              uint64_t v5 = v61;
              uint64_t v31 = v63;
              uint64_t v6 = v65;
              uint64_t v32 = v53;
              uint64_t v33 = v56;
              uint64_t v30 = v58;
              unint64_t v34 = v55;
              goto LABEL_45;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v87 = v35;
          uint64_t v88 = v77;
          uint64_t v89 = v37;
          long long v90 = v38;
          uint64_t v91 = v39;
          uint64_t v92 = v68;
          uint64_t v81 = v75;
          char v82 = v40;
          unint64_t v83 = v42;
          char v84 = v72;
          uint64_t v85 = v43;
          uint64_t v86 = v70;
          v46(&v80, &v87, &v81);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v7 = v60;
          uint64_t v5 = v61;
          uint64_t v31 = v63;
          uint64_t v6 = v65;
          uint64_t v32 = v53;
          uint64_t v33 = v56;
          uint64_t v30 = v58;
          unint64_t v34 = v55;
          if (v80)
          {
            uint64_t v47 = v54;
            if (v63 != v65 || v56 >= v65)
            {
              uint64_t v48 = *(_OWORD *)v54;
              uint64_t v49 = *((_OWORD *)v54 + 2);
              *((_OWORD *)v56 + 1) = *((_OWORD *)v54 + 1);
              *((_OWORD *)v56 + 2) = v49;
              *(_OWORD *)uint64_t v56 = v48;
            }
            uint64_t v95 = v54;
            if (v58 <= v61) {
              goto LABEL_51;
            }
          }
          else
          {
LABEL_45:
            uint64_t v93 = v34;
            if (v31 < v30 || v33 >= v30 || v31 != v30)
            {
              uint64_t v50 = *(_OWORD *)v34;
              uint64_t v51 = *((_OWORD *)v34 + 2);
              *((_OWORD *)v33 + 1) = *((_OWORD *)v34 + 1);
              *((_OWORD *)v33 + 2) = v51;
              *(_OWORD *)uint64_t v33 = v50;
            }
            uint64_t v47 = v6;
            uint64_t v30 = v34;
            if (v34 <= v5) {
              goto LABEL_51;
            }
          }
          uint64_t v6 = v47;
          uint64_t v31 = v33;
          if (v47 <= v7) {
            goto LABEL_51;
          }
        }
      }
      goto LABEL_51;
    }
  }
  else if (v8 >= -47)
  {
    if (__dst != __src || &__src[48 * v9] <= __dst) {
      memmove(__dst, __src, 48 * v9);
    }
    uint64_t v67 = &v5[48 * v9];
    uint64_t v93 = v67;
    unint64_t v12 = a3;
    if (v8 >= 48 && (unint64_t)v6 < a3)
    {
      uint64_t v13 = *(void *)(a5 + 16);
      char v57 = v13;
      do
      {
        if (!v13) {
          goto LABEL_20;
        }
        uint64_t v59 = v7;
        uint64_t v14 = *(void *)v6;
        uint64_t v15 = *((void *)v6 + 1);
        uint64_t v16 = *((void *)v6 + 2);
        uint64_t v17 = *((void *)v6 + 3);
        uint64_t v18 = *((void *)v6 + 4);
        uint64_t v64 = v6;
        uint64_t v19 = *((void *)v6 + 5);
        uint64_t v20 = *((void *)v5 + 1);
        unint64_t v76 = *(void *)v5;
        unint64_t v78 = v17;
        uint64_t v21 = *((void *)v5 + 2);
        uint64_t v22 = *((void *)v5 + 4);
        uint64_t v69 = *((void *)v5 + 3);
        double v71 = v14;
        uint64_t v74 = *((void *)v5 + 5);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v23 = a5 + 40;
        uint64_t v24 = v13;
        while (1)
        {
          uint64_t v73 = v24;
          uint64_t v79 = *(void (**)(char *__return_ptr, uint64_t *, uint64_t *))(v23 - 8);
          uint64_t v87 = v71;
          uint64_t v88 = v15;
          uint64_t v89 = v16;
          long long v90 = v78;
          uint64_t v91 = v18;
          uint64_t v92 = v19;
          uint64_t v81 = v76;
          char v82 = v20;
          unint64_t v83 = v21;
          char v84 = v69;
          uint64_t v85 = v22;
          uint64_t v86 = v74;
          swift_retain();
          v79(&v80, &v87, &v81);
          if (v80) {
            break;
          }
          uint64_t v87 = v76;
          uint64_t v88 = v20;
          uint64_t v89 = v21;
          long long v90 = v69;
          uint64_t v91 = v22;
          uint64_t v92 = v74;
          uint64_t v81 = v71;
          char v82 = v15;
          unint64_t v83 = v16;
          char v84 = v78;
          uint64_t v85 = v18;
          uint64_t v86 = v19;
          v79(&v80, &v87, &v81);
          if (v80 == 1) {
            break;
          }
          swift_release();
          v23 += 16;
          uint64_t v24 = v73 - 1;
          if (v73 == 1)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v7 = v59;
            unint64_t v12 = a3;
            uint64_t v6 = v64;
            uint64_t v13 = v57;
            goto LABEL_20;
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v87 = v71;
        uint64_t v88 = v15;
        uint64_t v89 = v16;
        long long v90 = v78;
        uint64_t v91 = v18;
        uint64_t v92 = v19;
        uint64_t v81 = v76;
        char v82 = v20;
        unint64_t v83 = v21;
        char v84 = v69;
        uint64_t v85 = v22;
        uint64_t v86 = v74;
        v79(&v80, &v87, &v81);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v7 = v59;
        unint64_t v12 = a3;
        uint64_t v6 = v64;
        uint64_t v13 = v57;
        if (v80)
        {
          uint64_t v25 = v64 + 48;
          if (v59 < v64 || v59 >= v25 || v59 != v64)
          {
            long long v26 = *(_OWORD *)v64;
            long long v27 = *((_OWORD *)v64 + 2);
            *((_OWORD *)v59 + 1) = *((_OWORD *)v64 + 1);
            *((_OWORD *)v59 + 2) = v27;
            *(_OWORD *)uint64_t v59 = v26;
          }
        }
        else
        {
LABEL_20:
          if (v7 != v5)
          {
            long long v28 = *(_OWORD *)v5;
            long long v29 = *((_OWORD *)v5 + 2);
            *((_OWORD *)v7 + 1) = *((_OWORD *)v5 + 1);
            *((_OWORD *)v7 + 2) = v29;
            *(_OWORD *)uint64_t v7 = v28;
          }
          v5 += 48;
          uint64_t v94 = v5;
          uint64_t v25 = v6;
        }
        v7 += 48;
        if (v5 >= v67) {
          break;
        }
        uint64_t v6 = v25;
      }
      while ((unint64_t)v25 < v12);
      uint64_t v95 = v7;
    }
LABEL_51:
    sub_10002AE10((void **)&v95, (const void **)&v94, &v93);
    return 1;
  }
  swift_bridgeObjectRelease();
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_10002EE7C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  void (*v19)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v20;
  long long v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  uint64_t v23 = result;
  long long v26 = a3;
  if (a3 != a2)
  {
    uint64_t v5 = *a4;
    long long v27 = *(void *)(a5 + 16);
    uint64_t v24 = a5 + 40;
    uint64_t v25 = *a4;
    do
    {
      if (v27)
      {
        uint64_t v6 = v26;
        uint64_t v7 = (uint64_t *)(v5 + 48 * v26);
        uint64_t v8 = *v7;
        uint64_t v35 = v7[1];
        uint64_t v9 = v7[2];
        uint64_t v10 = v7[3];
        uint64_t v11 = v7[4];
        uint64_t v12 = v7[5];
        do
        {
          long long v29 = (void *)(v5 + 48 * v6);
          uint64_t v30 = v6 - 1;
          uint64_t v13 = *(v29 - 6);
          long long v28 = v29 - 6;
          uint64_t v14 = *(v29 - 5);
          uint64_t v15 = *(v29 - 4);
          unint64_t v34 = *(v29 - 3);
          uint64_t v16 = *(v29 - 2);
          uint64_t v31 = *(v29 - 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v17 = v24;
          uint64_t v18 = v27;
          uint64_t v33 = v13;
          while (1)
          {
            uint64_t v32 = v18;
            uint64_t v19 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v17 - 8);
            uint64_t v42 = v8;
            uint64_t v43 = v35;
            uint64_t v44 = v9;
            uint64_t v45 = v10;
            uint64_t v46 = v11;
            uint64_t v47 = v12;
            uint64_t v36 = v13;
            uint64_t v37 = v14;
            uint64_t v38 = v15;
            uint64_t v39 = v34;
            uint64_t v40 = v16;
            uint64_t v41 = v31;
            swift_retain();
            v19(&v48, &v42, &v36);
            if (v48) {
              break;
            }
            uint64_t v42 = v33;
            uint64_t v43 = v14;
            uint64_t v44 = v15;
            uint64_t v45 = v34;
            uint64_t v46 = v16;
            uint64_t v47 = v31;
            uint64_t v36 = v8;
            uint64_t v37 = v35;
            uint64_t v38 = v9;
            uint64_t v39 = v10;
            uint64_t v40 = v11;
            uint64_t v41 = v12;
            v19(&v48, &v42, &v36);
            if (v48 == 1) {
              break;
            }
            swift_release();
            v17 += 16;
            uint64_t v18 = v32 - 1;
            uint64_t v13 = v33;
            if (v32 == 1)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t result = swift_bridgeObjectRelease();
              uint64_t v5 = v25;
              goto LABEL_4;
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v42 = v8;
          uint64_t v43 = v35;
          uint64_t v44 = v9;
          uint64_t v45 = v10;
          uint64_t v46 = v11;
          uint64_t v47 = v12;
          uint64_t v36 = v33;
          uint64_t v37 = v14;
          uint64_t v38 = v15;
          uint64_t v39 = v34;
          uint64_t v40 = v16;
          uint64_t v41 = v31;
          v19(&v48, &v42, &v36);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t result = swift_release();
          uint64_t v5 = v25;
          uint64_t v6 = v30;
          if ((v48 & 1) == 0) {
            break;
          }
          if (!v25)
          {
            __break(1u);
            return result;
          }
          uint64_t v8 = *v29;
          uint64_t v20 = v29[1];
          uint64_t v9 = v29[2];
          uint64_t v10 = v29[3];
          uint64_t v11 = v29[4];
          uint64_t v12 = v29[5];
          uint64_t v21 = *((_OWORD *)v29 - 2);
          *(_OWORD *)long long v29 = *v28;
          *((_OWORD *)v29 + 1) = v21;
          *((_OWORD *)v29 + 2) = *((_OWORD *)v29 - 1);
          *(void *)long long v28 = v8;
          *(v29 - 5) = v20;
          uint64_t v35 = v20;
          *(v29 - 4) = v9;
          *(v29 - 3) = v10;
          *(v29 - 2) = v11;
          *(v29 - 1) = v12;
        }
        while (v30 != v23);
      }
LABEL_4:
      ++v26;
    }
    while (v26 != a2);
  }
  return result;
}

uint64_t sub_10002F1D8(uint64_t *a1, uint64_t a2)
{
  void (*v42)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  long long v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char *v47;
  uint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  char v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  unint64_t v106;
  char *v107;
  unint64_t v108;
  uint64_t result;
  uint64_t *v110;
  void *v111;
  Swift::Int v112;
  Swift::Int v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *__dst;
  uint64_t v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;

  Swift::Int v4 = a1[1];
  swift_bridgeObjectRetain_n();
  Swift::Int v5 = sub_100055FB0(v4);
  if (v5 >= v4)
  {
    if (v4 < 0) {
      goto LABEL_138;
    }
    if (!v4) {
      goto LABEL_113;
    }
    swift_bridgeObjectRetain();
    sub_10002EE7C(0, v4, 1, a1, a2);
    if (v126) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_145;
  }
  double v127 = a2;
  uint64_t v112 = v5;
  unint64_t v113 = v4;
  char v110 = a1;
  if (v4 < 2)
  {
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    uint64_t v111 = _swiftEmptyArrayStorage;
    if (v4 == 1) {
      goto LABEL_13;
    }
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
    uint64_t v46 = _swiftEmptyArrayStorage[2];
LABEL_100:
    if (v46 >= 2)
    {
      uint64_t v99 = *v110;
      BOOL v136 = *v110;
      do
      {
        uint64_t v100 = v46 - 2;
        if (v46 < 2) {
          goto LABEL_131;
        }
        if (!v99) {
          goto LABEL_144;
        }
        unint64_t v101 = v11;
        uint64_t v102 = *(void *)&v11[16 * v100 + 32];
        uint64_t v103 = *(void *)&v11[16 * v46 + 24];
        unint64_t v104 = (char *)(v99 + 48 * v102);
        uint64_t v105 = (char *)(v99 + 48 * *(void *)&v11[16 * v46 + 16]);
        uint64_t v106 = v99 + 48 * v103;
        swift_bridgeObjectRetain();
        sub_10002E78C(v104, v105, v106, __dst, v127);
        if (v126)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v98 = v111;
          goto LABEL_96;
        }
        swift_bridgeObjectRelease();
        if (v103 < v102) {
          goto LABEL_132;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v101 = sub_10002AEE0((uint64_t)v11);
        }
        if (v100 >= *((void *)v101 + 2)) {
          goto LABEL_133;
        }
        uint64_t v107 = &v101[16 * v100 + 32];
        *(void *)uint64_t v107 = v102;
        *((void *)v107 + 1) = v103;
        uint64_t v108 = *((void *)v101 + 2);
        if (v46 > v108) {
          goto LABEL_134;
        }
        uint64_t v11 = v101;
        memmove(&v101[16 * v46 + 16], &v101[16 * v46 + 32], 16 * (v108 - v46));
        *((void *)v101 + 2) = v108 - 1;
        uint64_t v46 = v108 - 1;
        uint64_t v99 = v136;
      }
      while (v108 > 2);
    }
    swift_bridgeObjectRelease();
    v111[2] = 0;
LABEL_112:
    swift_bridgeObjectRelease();
LABEL_113:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease_n();
  }
  uint64_t v7 = v6 >> 1;
  uint64_t v8 = sub_100055B80();
  *(void *)(v8 + 16) = v7;
  uint64_t v111 = (void *)v8;
  __dst = (char *)(v8 + 32);
LABEL_13:
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v117 = a2 + 40;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  uint64_t v12 = v113;
  uint64_t v125 = v10;
  while (1)
  {
    swift_bridgeObjectRetain();
    char v13 = sub_10002A848(&v143, v10, v12, v9, v127);
    if (v126)
    {
      swift_bridgeObjectRelease();
      uint64_t v98 = v111;
LABEL_96:
      v98[2] = 0;
      goto LABEL_113;
    }
    uint64_t v14 = v143;
    if (v13)
    {
      if (v143 < v9) {
        goto LABEL_136;
      }
      if (v9 < v143)
      {
        uint64_t v15 = 48 * v143;
        uint64_t v16 = 48 * v9;
        uint64_t v17 = v143;
        uint64_t v18 = v9;
        do
        {
          if (v18 != --v17)
          {
            if (!v10) {
              goto LABEL_143;
            }
            uint64_t v19 = (_OWORD *)(v10 + v16);
            uint64_t v20 = v10 + v15;
            uint64_t v21 = *(void *)(v10 + v16);
            uint64_t v22 = *(void *)(v10 + v16 + 8);
            uint64_t v23 = *(void *)(v10 + v16 + 16);
            long long v24 = *(_OWORD *)(v10 + v16 + 24);
            uint64_t v25 = *(void *)(v10 + v16 + 40);
            long long v27 = *(_OWORD *)(v10 + v15 - 32);
            long long v26 = *(_OWORD *)(v10 + v15 - 16);
            _OWORD *v19 = *(_OWORD *)(v10 + v15 - 48);
            v19[1] = v27;
            v19[2] = v26;
            *(void *)(v20 - 48) = v21;
            *(void *)(v20 - 40) = v22;
            *(void *)(v20 - 32) = v23;
            *(_OWORD *)(v20 - 24) = v24;
            *(void *)(v20 - 8) = v25;
          }
          ++v18;
          v15 -= 48;
          v16 += 48;
        }
        while (v18 < v17);
      }
    }
    if (v14 < v113)
    {
      if (__OFSUB__(v14, v9)) {
        goto LABEL_137;
      }
      if (v14 - v9 < v112) {
        break;
      }
    }
LABEL_46:
    if (v14 < v9) {
      goto LABEL_135;
    }
    uint64_t v124 = v14;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10002AC58(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    uint64_t v45 = *((void *)v11 + 2);
    uint64_t v44 = *((void *)v11 + 3);
    uint64_t v46 = v45 + 1;
    if (v45 >= v44 >> 1) {
      uint64_t v11 = sub_10002AC58((char *)(v44 > 1), v45 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v46;
    uint64_t v47 = v11 + 32;
    uint64_t v48 = (uint64_t *)&v11[16 * v45 + 32];
    *uint64_t v48 = v9;
    v48[1] = v124;
    if (v45)
    {
      uint64_t v10 = v125;
      while (1)
      {
        uint64_t v49 = v46 - 1;
        if (v46 >= 4)
        {
          uint64_t v54 = &v47[16 * v46];
          uint64_t v55 = *((void *)v54 - 8);
          uint64_t v56 = *((void *)v54 - 7);
          uint64_t v60 = __OFSUB__(v56, v55);
          char v57 = v56 - v55;
          if (v60) {
            goto LABEL_120;
          }
          uint64_t v59 = *((void *)v54 - 6);
          uint64_t v58 = *((void *)v54 - 5);
          uint64_t v60 = __OFSUB__(v58, v59);
          uint64_t v52 = v58 - v59;
          char v53 = v60;
          if (v60) {
            goto LABEL_121;
          }
          char v61 = v46 - 2;
          uint64_t v62 = &v47[16 * v46 - 32];
          uint64_t v64 = *(void *)v62;
          uint64_t v63 = *((void *)v62 + 1);
          uint64_t v60 = __OFSUB__(v63, v64);
          uint64_t v65 = v63 - v64;
          if (v60) {
            goto LABEL_123;
          }
          uint64_t v60 = __OFADD__(v52, v65);
          uint64_t v66 = v52 + v65;
          if (v60) {
            goto LABEL_126;
          }
          if (v66 >= v57)
          {
            char v84 = &v47[16 * v49];
            uint64_t v86 = *(void *)v84;
            uint64_t v85 = *((void *)v84 + 1);
            uint64_t v60 = __OFSUB__(v85, v86);
            uint64_t v87 = v85 - v86;
            if (v60) {
              goto LABEL_130;
            }
            char v77 = v52 < v87;
            goto LABEL_84;
          }
        }
        else
        {
          if (v46 != 3)
          {
            unint64_t v78 = *((void *)v11 + 4);
            uint64_t v79 = *((void *)v11 + 5);
            uint64_t v60 = __OFSUB__(v79, v78);
            double v71 = v79 - v78;
            double v72 = v60;
            goto LABEL_78;
          }
          uint64_t v51 = *((void *)v11 + 4);
          uint64_t v50 = *((void *)v11 + 5);
          uint64_t v60 = __OFSUB__(v50, v51);
          uint64_t v52 = v50 - v51;
          char v53 = v60;
        }
        if (v53) {
          goto LABEL_122;
        }
        char v61 = v46 - 2;
        uint64_t v67 = &v47[16 * v46 - 32];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        uint64_t v70 = __OFSUB__(v68, v69);
        double v71 = v68 - v69;
        double v72 = v70;
        if (v70) {
          goto LABEL_125;
        }
        uint64_t v73 = &v47[16 * v49];
        double v75 = *(void *)v73;
        uint64_t v74 = *((void *)v73 + 1);
        uint64_t v60 = __OFSUB__(v74, v75);
        unint64_t v76 = v74 - v75;
        if (v60) {
          goto LABEL_128;
        }
        if (__OFADD__(v71, v76)) {
          goto LABEL_129;
        }
        if (v71 + v76 >= v52)
        {
          char v77 = v52 < v76;
LABEL_84:
          if (v77) {
            uint64_t v49 = v61;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v72) {
          goto LABEL_124;
        }
        BOOL v80 = &v47[16 * v49];
        char v82 = *(void *)v80;
        uint64_t v81 = *((void *)v80 + 1);
        uint64_t v60 = __OFSUB__(v81, v82);
        unint64_t v83 = v81 - v82;
        if (v60) {
          goto LABEL_127;
        }
        if (v83 < v71) {
          goto LABEL_94;
        }
LABEL_86:
        uint64_t v88 = v49 - 1;
        if (v49 - 1 >= v46)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_141;
        }
        uint64_t v89 = v47;
        long long v90 = &v47[16 * v88];
        uint64_t v91 = *(void *)v90;
        uint64_t v92 = v49;
        uint64_t v93 = &v89[16 * v49];
        uint64_t v94 = *((void *)v93 + 1);
        uint64_t v95 = (char *)(v10 + 48 * *(void *)v90);
        uint64_t v135 = (char *)(v10 + 48 * *(void *)v93);
        swift_bridgeObjectRetain();
        sub_10002E78C(v95, v135, v10 + 48 * v94, __dst, v127);
        swift_bridgeObjectRelease();
        if (v94 < v91) {
          goto LABEL_117;
        }
        if (v92 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        BOOL v96 = v92;
        *(void *)long long v90 = v91;
        uint64_t v47 = v11 + 32;
        *(void *)&v11[16 * v88 + 40] = v94;
        uint64_t v97 = *((void *)v11 + 2);
        if (v92 >= v97) {
          goto LABEL_119;
        }
        uint64_t v46 = v97 - 1;
        memmove(v93, v93 + 16, 16 * (v97 - 1 - v96));
        *((void *)v11 + 2) = v97 - 1;
        uint64_t v10 = v125;
        if (v97 <= 2) {
          goto LABEL_94;
        }
      }
    }
    uint64_t v46 = 1;
    uint64_t v10 = v125;
LABEL_94:
    uint64_t v12 = v113;
    uint64_t v9 = v124;
    if (v124 >= v113) {
      goto LABEL_100;
    }
  }
  uint64_t v28 = v9 + v112;
  if (__OFADD__(v9, v112)) {
    goto LABEL_139;
  }
  if (v28 >= v113) {
    uint64_t v28 = v113;
  }
  if (v28 >= v9)
  {
    if (v14 != v28)
    {
      double v119 = *(void *)(v127 + 16);
      id v115 = v9;
      uint64_t v116 = v11;
      unint64_t v114 = v28;
      do
      {
        if (!v119) {
          goto LABEL_33;
        }
        long long v29 = (uint64_t *)(v10 + 48 * v14);
        uint64_t v30 = *v29;
        uint64_t v31 = v29[1];
        uint64_t v32 = v29[2];
        uint64_t v33 = v29[3];
        uint64_t v34 = v29[4];
        uint64_t v35 = v29[5];
        uint64_t v36 = v14;
        uint64_t v123 = v14;
        do
        {
          id v131 = v35;
          char v132 = v33;
          uint64_t v121 = (uint64_t *)(v10 + 48 * v36);
          uint64_t v122 = v36 - 1;
          uint64_t v130 = *(v121 - 6);
          uint64_t v120 = v121 - 6;
          uint64_t v37 = *(v121 - 5);
          uint64_t v38 = *(v121 - 4);
          uint64_t v39 = *(v121 - 2);
          double v128 = *(v121 - 1);
          double v129 = *(v121 - 3);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v40 = v117;
          uint64_t v41 = v119;
          unint64_t v134 = v30;
          while (1)
          {
            char v133 = v41;
            uint64_t v42 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v40 - 8);
            id v143 = v30;
            uint64_t v144 = v31;
            uint64_t v145 = v32;
            long long v146 = v132;
            uint64_t v147 = v34;
            uint64_t v148 = v131;
            uint64_t v137 = v130;
            char v138 = v37;
            unint64_t v139 = v38;
            char v140 = v129;
            id v141 = v39;
            uint64_t v142 = v128;
            swift_retain();
            v42(&v149, &v143, &v137);
            if (v149) {
              break;
            }
            id v143 = v130;
            uint64_t v144 = v37;
            uint64_t v145 = v38;
            long long v146 = v129;
            uint64_t v147 = v39;
            uint64_t v148 = v128;
            uint64_t v137 = v134;
            char v138 = v31;
            unint64_t v139 = v32;
            char v140 = v132;
            id v141 = v34;
            uint64_t v142 = v131;
            v42(&v149, &v143, &v137);
            if (v149 == 1) {
              break;
            }
            swift_release();
            v40 += 16;
            uint64_t v41 = v133 - 1;
            uint64_t v30 = v134;
            if (v133 == 1)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              uint64_t v9 = v115;
              uint64_t v11 = v116;
              uint64_t v14 = v123;
              uint64_t v10 = v125;
              goto LABEL_33;
            }
          }
          swift_bridgeObjectRelease();
          id v143 = v134;
          uint64_t v144 = v31;
          uint64_t v145 = v32;
          long long v146 = v132;
          uint64_t v147 = v34;
          uint64_t v148 = v131;
          uint64_t v137 = v130;
          char v138 = v37;
          unint64_t v139 = v38;
          char v140 = v129;
          id v141 = v39;
          uint64_t v142 = v128;
          v42(&v149, &v143, &v137);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t v9 = v115;
          uint64_t v11 = v116;
          uint64_t v14 = v123;
          uint64_t v10 = v125;
          uint64_t v36 = v122;
          if ((v149 & 1) == 0) {
            break;
          }
          if (!v125) {
            goto LABEL_142;
          }
          uint64_t v30 = *v121;
          uint64_t v31 = v121[1];
          uint64_t v32 = v121[2];
          uint64_t v33 = v121[3];
          uint64_t v34 = v121[4];
          uint64_t v35 = v121[5];
          uint64_t v43 = *((_OWORD *)v121 - 2);
          *(_OWORD *)uint64_t v121 = *(_OWORD *)v120;
          *((_OWORD *)v121 + 1) = v43;
          *((_OWORD *)v121 + 2) = *((_OWORD *)v121 - 1);
          char *v120 = v30;
          *(v121 - 5) = v31;
          *(v121 - 4) = v32;
          *(v121 - 3) = v33;
          *(v121 - 2) = v34;
          *(v121 - 1) = v35;
        }
        while (v122 != v115);
LABEL_33:
        ++v14;
      }
      while (v14 != v114);
      uint64_t v14 = v114;
    }
    goto LABEL_46;
  }
LABEL_140:
  __break(1u);
LABEL_141:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_142:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_143:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_144:
  swift_bridgeObjectRelease_n();
  __break(1u);
LABEL_145:
  swift_bridgeObjectRelease_n();
  uint64_t result = sub_100055EC0();
  __break(1u);
  return result;
}

uint64_t sub_10002FC00(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_10002CC88(v4);
  }
  uint64_t v5 = *(void *)(v4 + 16);
  v7[0] = v4 + 32;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  sub_10002F1D8(v7, a2);
  swift_bridgeObjectRelease();
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_10002FCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (!a2) {
    return (uint64_t)v2;
  }
  uint64_t v3 = swift_bridgeObjectRetain();
  uint64_t v32 = (void *)sub_1000276C8(v3);
  swift_bridgeObjectRetain();
  sub_10002FC00((uint64_t *)&v32, (uint64_t)&off_1000661C8);
  swift_bridgeObjectRelease();
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = v32;
    uint64_t v32 = _swiftEmptyArrayStorage;
    sub_10002A248(0, 0, 0);
    uint64_t v2 = v32;
    swift_retain();
    unint64_t v5 = 0;
    long long v27 = v4;
    uint64_t v6 = v4 + 9;
    while (1)
    {
      unint64_t v7 = v27[2];
      if (v5 == v7)
      {
LABEL_12:
        swift_release_n();
        return (uint64_t)v2;
      }
      if (v5 >= v7) {
        break;
      }
      uint64_t v8 = *(v6 - 3);
      uint64_t v9 = *v6;
      id v10 = objc_allocWithZone((Class)STUsageDetailItem);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      NSString v11 = sub_100055A00();
      id v12 = [v10 initWithType:v9 identifier:v11];

      id v13 = [v12 localizedDisplayName];
      uint64_t v14 = sub_100055A10();
      uint64_t v30 = v15;
      uint64_t v31 = v14;

      uint64_t v16 = &selRef_darkColorsMonogram;
      if (v9 == 2)
      {
        uint64_t v17 = &selRef_lightColorsMonogram;
      }
      else
      {
        uint64_t v16 = &selRef_iconImage;
        uint64_t v17 = &selRef_iconImage;
      }
      id v29 = [v12 *v16];
      id v18 = [v12 *v17];
      id v19 = [v12 identifier];
      uint64_t v20 = sub_100055A10();
      uint64_t v22 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      uint64_t v32 = v2;
      unint64_t v24 = v2[2];
      unint64_t v23 = v2[3];
      if (v24 >= v23 >> 1)
      {
        sub_10002A248(v23 > 1, v24 + 1, 1);
        uint64_t v2 = v32;
      }
      ++v5;
      v2[2] = v24 + 1;
      uint64_t v25 = &v2[7 * v24];
      v25[4] = v20;
      v25[5] = v22;
      v25[6] = v29;
      v25[7] = v18;
      v25[8] = v8;
      v25[9] = v31;
      v25[10] = v30;
      v6 += 6;
      if (a2 == v5) {
        goto LABEL_12;
      }
    }
    __break(1u);
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_10002FF38(uint64_t a1)
{
  uint64_t v2 = sub_100054A10();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v49 - v7;
  uint64_t v9 = sub_100054E00();
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v15 = (char *)v49 - v14;
  uint64_t v16 = *(void *)(a1 + 16);
  if (v16)
  {
    uint64_t v60 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    uint64_t v61 = v13 + 16;
    unint64_t v56 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    uint64_t v17 = a1 + v56;
    uint64_t v18 = *(void *)(v13 + 72);
    uint64_t v63 = (void (**)(char *, char *, uint64_t))(v3 + 16);
    uint64_t v54 = (void (**)(unint64_t, char *, uint64_t))(v13 + 32);
    uint64_t v55 = v18;
    v49[1] = a1;
    uint64_t v50 = v3;
    uint64_t v52 = (void (**)(char *, uint64_t))(v13 + 8);
    char v53 = (void (**)(char *, uint64_t))(v3 + 8);
    swift_bridgeObjectRetain();
    uint64_t v19 = v17;
    uint64_t v20 = 0;
    uint64_t v66 = v6;
    uint64_t v67 = &_swiftEmptyDictionarySingleton;
    uint64_t v58 = v9;
    uint64_t v59 = v8;
    char v57 = v12;
    uint64_t v51 = v15;
    uint64_t v62 = v2;
    while (1)
    {
      uint64_t v64 = v19;
      uint64_t v65 = v16;
      uint64_t v21 = v60;
      ((void (*)(char *))v60)(v15);
      sub_100054DE0();
      uint64_t v22 = v8;
      unint64_t v23 = *v63;
      (*v63)(v6, v22, v2);
      v21(v12, v15, v9);
      sub_100033548((uint64_t)v20);
      unint64_t v24 = v67;
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v68 = v24;
      unint64_t v27 = sub_100029B34((uint64_t)v6);
      uint64_t v28 = v24[2];
      BOOL v29 = (v26 & 1) == 0;
      uint64_t v30 = v28 + v29;
      if (__OFADD__(v28, v29)) {
        break;
      }
      char v31 = v26;
      if (v24[3] >= v30)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_10002C9E0(&qword_10006A528);
          unint64_t v24 = v68;
        }
      }
      else
      {
        sub_10002BD68(v30, isUniquelyReferenced_nonNull_native, &qword_10006A528);
        unint64_t v24 = v68;
        unint64_t v32 = sub_100029B34((uint64_t)v66);
        if ((v31 & 1) != (v33 & 1)) {
          goto LABEL_23;
        }
        unint64_t v27 = v32;
      }
      swift_bridgeObjectRelease();
      if (v31)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v24[(v27 >> 6) + 8] |= 1 << v27;
        unint64_t v34 = v24[6] + *(void *)(v50 + 72) * v27;
        swift_bridgeObjectRetain();
        v23((char *)v34, v66, v62);
        *(void *)(v24[7] + 8 * v27) = _swiftEmptyArrayStorage;
        uint64_t v35 = v24[2];
        BOOL v36 = __OFADD__(v35, 1);
        uint64_t v37 = v35 + 1;
        if (v36) {
          goto LABEL_22;
        }
        v24[2] = v37;
      }
      uint64_t v38 = v24[7];
      swift_bridgeObjectRelease();
      unint64_t v39 = *(void *)(v38 + 8 * v27);
      char v40 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v38 + 8 * v27) = v39;
      uint64_t v41 = v65;
      if ((v40 & 1) == 0)
      {
        unint64_t v39 = sub_100029594(0, *(void *)(v39 + 16) + 1, 1, v39, &qword_10006A530, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.ActivitySegment, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.ActivitySegment);
        *(void *)(v38 + 8 * v27) = v39;
      }
      unint64_t v43 = *(void *)(v39 + 16);
      unint64_t v42 = *(void *)(v39 + 24);
      uint64_t v67 = v24;
      if (v43 >= v42 >> 1)
      {
        unint64_t v39 = sub_100029594(v42 > 1, v43 + 1, 1, v39, &qword_10006A530, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.ActivitySegment, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.ActivitySegment);
        *(void *)(v38 + 8 * v27) = v39;
      }
      *(void *)(v39 + 16) = v43 + 1;
      uint64_t v44 = v55;
      id v12 = v57;
      uint64_t v9 = v58;
      (*v54)(v39 + v56 + v43 * v55, v57, v58);
      uint64_t v45 = *v53;
      uint64_t v6 = v66;
      uint64_t v2 = v62;
      (*v53)(v66, v62);
      uint64_t v8 = v59;
      v45(v59, v2);
      uint64_t v15 = v51;
      (*v52)(v51, v9);
      uint64_t v19 = v64 + v44;
      uint64_t v20 = sub_10002829C;
      uint64_t v16 = v41 - 1;
      if (!v16)
      {
        swift_bridgeObjectRelease();
        uint64_t v46 = sub_10002829C;
        uint64_t v47 = v67;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    uint64_t result = sub_100056020();
    __break(1u);
  }
  else
  {
    uint64_t v46 = 0;
    uint64_t v47 = &_swiftEmptyDictionarySingleton;
LABEL_20:
    sub_100033548((uint64_t)v46);
    return (uint64_t)v47;
  }
  return result;
}

uint64_t sub_10003049C(uint64_t a1)
{
  uint64_t v2 = sub_100054E00();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100054A10();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005EB4(&qword_10006A4C0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v63 = (char *)&v54 - v14;
  unint64_t v15 = sub_1000238C4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v55 = a1 + 64;
  uint64_t v17 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v68 = v15;
  unint64_t v69 = v18 & v16;
  uint64_t v65 = v7 + 16;
  uint64_t v66 = v7;
  uint64_t v62 = (void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
  uint64_t v58 = v3;
  uint64_t v59 = a1;
  uint64_t v19 = (void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v60 = (void (**)(uint64_t, uint64_t))(v7 + 8);
  int64_t v56 = (unint64_t)(v17 + 63) >> 6;
  int64_t v54 = v56 - 1;
  uint64_t v20 = (uint64_t)v9;
  swift_bridgeObjectRetain();
  int64_t v64 = 0;
  uint64_t v67 = v9;
  uint64_t v57 = v6;
  for (i = v13; ; uint64_t v13 = i)
  {
    if (v69)
    {
      unint64_t v21 = __clz(__rbit64(v69));
      v69 &= v69 - 1;
      uint64_t v22 = (uint64_t)v63;
      unint64_t v23 = v21 | (v64 << 6);
LABEL_8:
      uint64_t v24 = v59;
      (*(void (**)(char *, unint64_t, uint64_t))(v66 + 16))(v13, *(void *)(v59 + 48) + *(void *)(v66 + 72) * v23, v6);
      uint64_t v25 = *(void *)(v24 + 56);
      uint64_t v26 = sub_100005EB4(&qword_10006A4C8);
      *(void *)&v13[*(int *)(v26 + 48)] = *(void *)(v25 + 8 * v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v13, 0, 1, v26);
      swift_bridgeObjectRetain();
      uint64_t v20 = (uint64_t)v67;
      goto LABEL_27;
    }
    uint64_t v22 = (uint64_t)v63;
    int64_t v27 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      goto LABEL_45;
    }
    if (v27 < v56)
    {
      unint64_t v28 = *(void *)(v55 + 8 * v27);
      if (v28) {
        goto LABEL_12;
      }
      int64_t v29 = v64 + 2;
      ++v64;
      if (v27 + 1 < v56)
      {
        unint64_t v28 = *(void *)(v55 + 8 * v29);
        if (v28) {
          goto LABEL_15;
        }
        int64_t v64 = v27 + 1;
        if (v27 + 2 < v56)
        {
          unint64_t v28 = *(void *)(v55 + 8 * (v27 + 2));
          if (v28)
          {
            v27 += 2;
            goto LABEL_12;
          }
          int64_t v29 = v27 + 3;
          int64_t v64 = v27 + 2;
          if (v27 + 3 < v56) {
            break;
          }
        }
      }
    }
LABEL_26:
    uint64_t v30 = sub_100005EB4(&qword_10006A4C8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v13, 1, 1, v30);
    unint64_t v69 = 0;
LABEL_27:
    sub_10000D080((uint64_t)v13, v22, &qword_10006A4C0);
    uint64_t v31 = sub_100005EB4(&qword_10006A4C8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 48))(v22, 1, v31) == 1)
    {
      swift_release();
      return v68;
    }
    uint64_t v32 = *(void *)(v22 + *(int *)(v31 + 48));
    (*v62)(v20, v22, v6);
    uint64_t v33 = *(void *)(v32 + 16);
    if (v33)
    {
      uint64_t v34 = v32 + ((*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80));
      uint64_t v35 = *(void *)(v58 + 72);
      BOOL v36 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
      swift_bridgeObjectRetain();
      double v37 = 0.0;
      do
      {
        v36(v5, v34, v2);
        sub_100054DD0();
        double v37 = v37 + v38;
        (*v19)(v5, v2);
        v34 += v35;
        --v33;
      }
      while (v33);
      swift_bridgeObjectRelease_n();
      uint64_t v6 = v57;
      uint64_t v20 = (uint64_t)v67;
    }
    else
    {
      swift_bridgeObjectRelease();
      double v37 = 0.0;
    }
    unint64_t v39 = (void *)v68;
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v70 = v39;
    unint64_t v42 = sub_100029B34(v20);
    uint64_t v43 = v39[2];
    BOOL v44 = (v41 & 1) == 0;
    uint64_t v45 = v43 + v44;
    if (__OFADD__(v43, v44))
    {
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    char v46 = v41;
    if (v39[3] >= v45)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        sub_10002C37C();
      }
    }
    else
    {
      sub_10002B2C4(v45, isUniquelyReferenced_nonNull_native);
      unint64_t v47 = sub_100029B34(v20);
      if ((v46 & 1) != (v48 & 1)) {
        goto LABEL_47;
      }
      unint64_t v42 = v47;
    }
    uint64_t v49 = v70;
    unint64_t v68 = (unint64_t)v70;
    if (v46)
    {
      *(double *)(v70[7] + 8 * v42) = v37;
    }
    else
    {
      v70[(v42 >> 6) + 8] |= 1 << v42;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v66 + 16))(v49[6] + *(void *)(v66 + 72) * v42, v20, v6);
      *(double *)(v49[7] + 8 * v42) = v37;
      uint64_t v50 = v49[2];
      BOOL v51 = __OFADD__(v50, 1);
      uint64_t v52 = v50 + 1;
      if (v51) {
        goto LABEL_44;
      }
      void v49[2] = v52;
    }
    swift_bridgeObjectRelease();
    (*v60)(v20, v6);
  }
  unint64_t v28 = *(void *)(v55 + 8 * v29);
  if (v28)
  {
LABEL_15:
    int64_t v27 = v29;
LABEL_12:
    unint64_t v69 = (v28 - 1) & v28;
    unint64_t v23 = __clz(__rbit64(v28)) + (v27 << 6);
    int64_t v64 = v27;
    goto LABEL_8;
  }
  while (1)
  {
    int64_t v27 = v29 + 1;
    if (__OFADD__(v29, 1)) {
      break;
    }
    if (v27 >= v56)
    {
      int64_t v64 = v54;
      goto LABEL_26;
    }
    unint64_t v28 = *(void *)(v55 + 8 * v27);
    ++v29;
    if (v28) {
      goto LABEL_12;
    }
  }
LABEL_46:
  __break(1u);
LABEL_47:
  uint64_t result = sub_100056020();
  __break(1u);
  return result;
}

uint64_t sub_100030B34(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result + 64;
  uint64_t v5 = 1 << *(unsigned char *)(result + 32);
  uint64_t v6 = -1;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  unint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  int64_t v9 = 0;
  while (v7)
  {
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
LABEL_5:
    if (*(void *)(*(void *)(result + 56) + 48 * v11 + 40) == 3)
    {
      uint64_t v15 = swift_bridgeObjectRetain();
      uint64_t v16 = sub_100027908(v15);
      uint64_t v17 = sub_100005EB4(&qword_10006A500);
      uint64_t v21 = v17;
      uint64_t v22 = sub_10000D120(&qword_10006A508, &qword_10006A500);
      v20[0] = v16;
      goto LABEL_27;
    }
  }
  int64_t v12 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v12 >= v8) {
    goto LABEL_26;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v12);
  ++v9;
  if (v13) {
    goto LABEL_24;
  }
  int64_t v9 = v12 + 1;
  if (v12 + 1 >= v8) {
    goto LABEL_26;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13) {
    goto LABEL_24;
  }
  int64_t v9 = v12 + 2;
  if (v12 + 2 >= v8) {
    goto LABEL_26;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13) {
    goto LABEL_24;
  }
  int64_t v9 = v12 + 3;
  if (v12 + 3 >= v8) {
    goto LABEL_26;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13) {
    goto LABEL_24;
  }
  int64_t v9 = v12 + 4;
  if (v12 + 4 >= v8) {
    goto LABEL_26;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v9);
  if (v13)
  {
LABEL_24:
    unint64_t v7 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v9 << 6);
    goto LABEL_5;
  }
  int64_t v14 = v12 + 5;
  if (v14 >= v8)
  {
LABEL_26:
    uint64_t v17 = sub_100005EB4(&qword_10006A4E8);
    uint64_t v21 = v17;
    uint64_t v22 = sub_10000D120(&qword_10006A4F0, &qword_10006A4E8);
    v20[0] = v3;
    swift_bridgeObjectRetain();
LABEL_27:
    uint64_t v18 = sub_10001ADBC(v20, v17);
    __chkstk_darwin(v18);
    uint64_t v19 = sub_100055B20();
    sub_100005EB4(&qword_10006A4F8);
    uint64_t result = swift_arrayDestroy();
    if ((a2 & 0x8000000000000000) == 0)
    {
      sub_10001E980((uint64_t)v20);
      return v19;
    }
    goto LABEL_30;
  }
  unint64_t v13 = *(void *)(v4 + 8 * v14);
  if (v13)
  {
    int64_t v9 = v14;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v9 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v9 >= v8) {
      goto LABEL_26;
    }
    unint64_t v13 = *(void *)(v4 + 8 * v9);
    ++v14;
    if (v13) {
      goto LABEL_24;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100030DF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a5(0) - 8);
    uint64_t v10 = a4 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    uint64_t v11 = *(void *)(v9 + 72);
    unint64_t v12 = v10 + v11 * a1;
    unint64_t v13 = a3 + v11 * v5;
    if (v12 >= v13 || v12 + v11 * v5 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

uint64_t sub_100030F50(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6)
{
  double v10 = a6 / a4;
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
    double v10 = 0.0;
  }
  double v11 = a6 / a5;
  if ((*(void *)&a5 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
    double v11 = 0.0;
  }
  if (a4 < a5) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  int64_t v14 = (void *)*a3;
  int64_t v27 = (void *)*a3;
  *a3 = 0x8000000000000000;
  unint64_t v16 = sub_100029ABC(a1, a2);
  uint64_t v17 = v14[2];
  BOOL v18 = (v15 & 1) == 0;
  uint64_t v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_20:
    sub_10002C830();
    int64_t v14 = v27;
    goto LABEL_13;
  }
  char v6 = v15;
  if (v14[3] >= v19)
  {
    if (isUniquelyReferenced_nonNull_native) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  sub_10002BA60(v19, isUniquelyReferenced_nonNull_native);
  int64_t v14 = v27;
  unint64_t v20 = sub_100029ABC(a1, a2);
  if ((v6 & 1) != (v21 & 1)) {
    goto LABEL_22;
  }
  unint64_t v16 = v20;
LABEL_13:
  *a3 = v14;
  swift_bridgeObjectRelease();
  uint64_t v22 = (void *)*a3;
  if ((v6 & 1) == 0)
  {
    v22[(v16 >> 6) + 8] |= 1 << v16;
    unint64_t v23 = (uint64_t *)(v22[6] + 16 * v16);
    *unint64_t v23 = a1;
    v23[1] = a2;
    *(void *)(v22[7] + 8 * v16) = 0;
    uint64_t v24 = v22[2];
    swift_bridgeObjectRetain();
    if (!__OFADD__(v24, 1))
    {
      void v22[2] = v24 + 1;
      goto LABEL_16;
    }
    __break(1u);
LABEL_22:
    uint64_t result = sub_100056020();
    __break(1u);
    return result;
  }
LABEL_16:
  swift_bridgeObjectRetain();
  uint64_t v25 = v22[7];
  swift_bridgeObjectRelease();
  *(double *)(v25 + 8 * v16) = v12 + *(double *)(v25 + 8 * v16);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003111C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v208 = a2;
  uint64_t v5 = sub_100054DC0();
  uint64_t v213 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v249 = (char *)&v198 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v251 = sub_100054D30();
  uint64_t v214 = *(void *)(v251 - 8);
  __chkstk_darwin(v251);
  uint64_t v250 = (char *)&v198 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100054D90();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v219 = (char *)&v198 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v202 = (char *)&v198 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v229 = (char *)&v198 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  BOOL v18 = (char *)&v198 - v17;
  __chkstk_darwin(v16);
  uint64_t v252 = (char *)&v198 - v19;
  uint64_t v236 = sub_100054E00();
  uint64_t v20 = *(void *)(v236 - 8);
  __chkstk_darwin(v236);
  uint64_t v235 = (char *)&v198 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v224 = sub_100054A10();
  uint64_t v22 = *(void *)(v224 - 8);
  uint64_t v23 = __chkstk_darwin(v224);
  uint64_t v220 = (uint64_t)&v198 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v222 = (uint64_t)&v198 - v25;
  uint64_t v26 = sub_100005EB4(&qword_10006A4C0);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  uint64_t v211 = (char *)&v198 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v210 = (uint64_t)&v198 - v29;
  unint64_t v221 = sub_100023AB8((uint64_t)_swiftEmptyArrayStorage);
  sub_10001ADBC(a3, a3[3]);
  int v204 = sub_100055B30();
  uint64_t v198 = 0;
  uint64_t v30 = *(void *)(a1 + 64);
  uint64_t v200 = a1 + 64;
  uint64_t v31 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v32 = -1;
  if (v31 < 64) {
    uint64_t v32 = ~(-1 << v31);
  }
  unint64_t v33 = v32 & v30;
  os_log_t v217 = (void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
  unint64_t v209 = (void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
  uint64_t v234 = v20 + 16;
  uint64_t v205 = v20;
  id v233 = (void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v241 = v9 + 16;
  uint64_t v230 = v9;
  id v237 = (void (**)(char *, uint64_t))(v9 + 8);
  uint64_t v231 = CTCategoryIdentifierSystemHidden;
  v247 = (void (**)(char *, uint64_t))(v214 + 8);
  uint64_t v248 = v214 + 16;
  uint64_t v242 = (void (**)(char *, uint64_t))(v213 + 8);
  uint64_t v243 = v213 + 16;
  uint64_t v227 = CTCategoryIdentifierSystemUnblockable;
  uint64_t v226 = CTCategoryIdentifierSystemBlockable;
  uint64_t v212 = v22;
  uint64_t v207 = (void (**)(uint64_t, uint64_t))(v22 + 8);
  int64_t v203 = (unint64_t)(v31 + 63) >> 6;
  int64_t v199 = v203 - 1;
  uint64_t v206 = a1;
  swift_bridgeObjectRetain();
  int64_t v34 = 0;
  uint64_t v253 = v5;
  id v201 = v18;
  uint64_t v223 = v8;
  while (1)
  {
    if (v33)
    {
      uint64_t v216 = (v33 - 1) & v33;
      unint64_t v38 = __clz(__rbit64(v33)) | (v34 << 6);
      uint64_t v39 = (uint64_t)v211;
LABEL_8:
      uint64_t v40 = v206;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v212 + 16))(v39, *(void *)(v206 + 48) + *(void *)(v212 + 72) * v38, v224);
      uint64_t v41 = *(void *)(v40 + 56);
      uint64_t v42 = sub_100005EB4(&qword_10006A4C8);
      *(void *)(v39 + *(int *)(v42 + 48)) = *(void *)(v41 + 8 * v38);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v39, 0, 1, v42);
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
    int64_t v43 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      goto LABEL_159;
    }
    uint64_t v39 = (uint64_t)v211;
    if (v43 < v203)
    {
      unint64_t v44 = *(void *)(v200 + 8 * v43);
      if (v44) {
        goto LABEL_12;
      }
      v34 += 2;
      if (v43 + 1 >= v203)
      {
        int64_t v34 = v43;
      }
      else
      {
        unint64_t v44 = *(void *)(v200 + 8 * v34);
        if (v44)
        {
          ++v43;
LABEL_12:
          uint64_t v216 = (v44 - 1) & v44;
          unint64_t v38 = __clz(__rbit64(v44)) + (v43 << 6);
          int64_t v34 = v43;
          goto LABEL_8;
        }
        if (v43 + 2 < v203)
        {
          unint64_t v44 = *(void *)(v200 + 8 * (v43 + 2));
          if (v44)
          {
            v43 += 2;
            goto LABEL_12;
          }
          int64_t v196 = v43 + 3;
          if (v43 + 3 >= v203)
          {
            int64_t v34 = v43 + 2;
          }
          else
          {
            unint64_t v44 = *(void *)(v200 + 8 * v196);
            if (v44)
            {
              v43 += 3;
              goto LABEL_12;
            }
            while (1)
            {
              int64_t v43 = v196 + 1;
              if (__OFADD__(v196, 1)) {
                goto LABEL_160;
              }
              if (v43 >= v203) {
                break;
              }
              unint64_t v44 = *(void *)(v200 + 8 * v43);
              ++v196;
              if (v44) {
                goto LABEL_12;
              }
            }
            int64_t v34 = v199;
          }
        }
      }
    }
    uint64_t v45 = sub_100005EB4(&qword_10006A4C8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v39, 1, 1, v45);
    uint64_t v216 = 0;
LABEL_18:
    uint64_t v46 = v210;
    sub_10000D080(v39, v210, &qword_10006A4C0);
    uint64_t v47 = sub_100005EB4(&qword_10006A4C8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 48))(v46, 1, v47) == 1) {
      break;
    }
    int64_t v215 = v34;
    uint64_t v48 = *(void *)(v46 + *(int *)(v47 + 48));
    (*v209)(v222, v46, v224);
    unint64_t v255 = sub_100023CAC((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v49 = *(void *)(v48 + 16);
    if (!v49)
    {
      swift_bridgeObjectRelease();
      char v53 = _swiftEmptyArrayStorage;
      goto LABEL_43;
    }
    unint64_t v50 = v48 + ((*(unsigned __int8 *)(v205 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v205 + 80));
    uint64_t v51 = *(void *)(v205 + 72);
    uint64_t v52 = *(void (**)(char *, unint64_t, uint64_t))(v205 + 16);
    uint64_t v246 = v48;
    swift_bridgeObjectRetain();
    char v53 = _swiftEmptyArrayStorage;
    do
    {
      int64_t v54 = v235;
      uint64_t v55 = v236;
      v52(v235, v50, v236);
      uint64_t v56 = sub_100054DF0();
      (*v233)(v54, v55);
      uint64_t v57 = *(void *)(v56 + 16);
      int64_t v58 = v53[2];
      int64_t v59 = v58 + v57;
      if (__OFADD__(v58, v57))
      {
LABEL_150:
        __break(1u);
LABEL_151:
        __break(1u);
LABEL_152:
        __break(1u);
LABEL_153:
        __break(1u);
LABEL_154:
        __break(1u);
LABEL_155:
        __break(1u);
LABEL_156:
        __break(1u);
LABEL_157:
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        sub_100056020();
        __break(1u);
LABEL_162:
        sub_100055F80();
        __break(1u);
LABEL_163:
        uint64_t result = sub_100056020();
        __break(1u);
        return result;
      }
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v61 = (uint64_t)v53;
      if (isUniquelyReferenced_nonNull_native && v59 <= v53[3] >> 1)
      {
        if (!*(void *)(v56 + 16)) {
          goto LABEL_21;
        }
      }
      else
      {
        if (v58 <= v59) {
          int64_t v62 = v58 + v57;
        }
        else {
          int64_t v62 = v58;
        }
        uint64_t v61 = sub_100029594(isUniquelyReferenced_nonNull_native, v62, 1, (unint64_t)v53, &qword_10006A4D8, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.CategoryActivity, (uint64_t (*)(void))&type metadata accessor for _DeviceActivityData.CategoryActivity);
        if (!*(void *)(v56 + 16))
        {
LABEL_21:
          char v53 = (void *)v61;
          if (v57) {
            goto LABEL_152;
          }
          goto LABEL_22;
        }
      }
      uint64_t v63 = *(void *)(v61 + 16);
      if ((*(void *)(v61 + 24) >> 1) - v63 < v57) {
        goto LABEL_154;
      }
      unint64_t v64 = (*(unsigned __int8 *)(v230 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v230 + 80);
      uint64_t v65 = *(void *)(v230 + 72);
      unint64_t v66 = v61 + v64 + v65 * v63;
      if (v56 + v64 < v66 + v65 * v57 && v66 < v56 + v64 + v65 * v57) {
        goto LABEL_162;
      }
      char v53 = (void *)v61;
      swift_arrayInitWithCopy();
      if (v57)
      {
        uint64_t v68 = v53[2];
        BOOL v69 = __OFADD__(v68, v57);
        uint64_t v70 = v68 + v57;
        if (v69) {
          goto LABEL_156;
        }
        v53[2] = v70;
      }
LABEL_22:
      swift_bridgeObjectRelease();
      v50 += v51;
      --v49;
    }
    while (v49);
    swift_bridgeObjectRelease_n();
    uint64_t v5 = v253;
LABEL_43:
    uint64_t v71 = v208;
    uint64_t v72 = *(void *)(v208 + 16);
    double v73 = 0.0;
    int v228 = v53;
    if (v72)
    {
      unint64_t v74 = sub_100029B34(v222);
      char v53 = v228;
      if (v75) {
        double v73 = *(double *)(*(void *)(v71 + 56) + 8 * v74);
      }
    }
    uint64_t v76 = v53[2];
    if (v76)
    {
      char v77 = (char *)v53
          + ((*(unsigned __int8 *)(v230 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v230 + 80));
      uint64_t v78 = *(void *)(v230 + 72);
      uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v230 + 16);
      swift_bridgeObjectRetain();
      double v80 = 0.0;
      uint64_t v240 = v77;
      uint64_t v238 = v76;
      uint64_t v81 = v252;
      char v82 = v237;
      uint64_t v83 = v223;
      do
      {
        v79(v81, v77, v83);
        sub_100054D40();
        uint64_t v81 = v252;
        double v80 = v80 + v84;
        uint64_t v85 = *v82;
        (*v82)(v252, v83);
        v77 += v78;
        --v76;
      }
      while (v76);
      uint64_t v239 = v85;
      uint64_t v244 = (void (*)(char *))v79;
      uint64_t v232 = v78;
      swift_bridgeObjectRelease();
      if (v204)
      {
        uint64_t v86 = v202;
        uint64_t v87 = v240;
        uint64_t v88 = v201;
        uint64_t v89 = v223;
        while (1)
        {
          uint64_t v240 = v87;
          v244(v88);
          uint64_t v90 = sub_100055A10();
          uint64_t v92 = v91;
          uint64_t v93 = sub_100055A10();
          uint64_t v95 = v94;
          uint64_t v96 = sub_100055A10();
          uint64_t v98 = v97;
          if (sub_100054D50() == v90 && v99 == v92) {
            break;
          }
          char v101 = sub_100055FE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v100 = v229;
          ((void (*)(char *, char *, uint64_t))v244)(v229, v88, v89);
          if (v101) {
            goto LABEL_55;
          }
          if (sub_100054D50() == v93 && v104 == v95)
          {
            swift_bridgeObjectRelease_n();
            v239(v229, v89);
LABEL_56:
            ((void (*)(char *, char *, uint64_t))v244)(v86, v88, v89);
LABEL_57:
            uint64_t v102 = v239;
            v239(v86, v89);
            uint64_t v103 = v102;
            goto LABEL_58;
          }
          char v105 = sub_100055FE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v239(v229, v89);
          ((void (*)(char *, char *, uint64_t))v244)(v86, v88, v89);
          if (v105) {
            goto LABEL_57;
          }
          if (sub_100054D50() == v96 && v106 == v98)
          {
            swift_bridgeObjectRelease_n();
            uint64_t v103 = v239;
            v239(v86, v89);
            goto LABEL_59;
          }
          char v107 = sub_100055FE0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v103 = v239;
          v239(v86, v89);
          if (v107) {
            goto LABEL_59;
          }
          uint64_t v108 = sub_100054D50();
          uint64_t v110 = v109;
          sub_100054D40();
          sub_100030F50(v108, v110, &v255, v73, v80, v111);
LABEL_58:
          swift_bridgeObjectRelease();
LABEL_59:
          v103(v88, v89);
          uint64_t v87 = &v240[v232];
          if (!--v238) {
            goto LABEL_126;
          }
        }
        swift_bridgeObjectRelease_n();
        uint64_t v100 = v229;
        ((void (*)(char *, char *, uint64_t))v244)(v229, v88, v89);
LABEL_55:
        v239(v100, v89);
        swift_bridgeObjectRelease();
        goto LABEL_56;
      }
      unint64_t v112 = 0;
      uint64_t v245 = *(void *)&v80 & 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v246 = *(void *)&v73 & 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v113 = v238;
      uint64_t v114 = v232;
      id v115 = (void (*)(char *, char *, uint64_t))v244;
      uint64_t v116 = v223;
      uint64_t v117 = v219;
      while (2)
      {
        if (v112 >= v228[2]) {
          goto LABEL_155;
        }
        v115(v117, &v240[v114 * v112], v116);
        uint64_t v118 = sub_100055A10();
        uint64_t v120 = v119;
        if (sub_100054D50() == v118 && v121 == v120)
        {
          swift_bridgeObjectRelease_n();
          goto LABEL_73;
        }
        char v122 = sub_100055FE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v122 & 1) == 0)
        {
          uint64_t v123 = sub_100054D80();
          uint64_t v124 = *(void *)(v123 + 16);
          unint64_t v225 = v112;
          if (v124)
          {
            unint64_t v125 = (*(unsigned __int8 *)(v214 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v214 + 80);
            uint64_t v218 = v123;
            unint64_t v126 = v123 + v125;
            uint64_t v127 = *(void *)(v214 + 72);
            double v128 = *(void (**)(char *, unint64_t, uint64_t))(v214 + 16);
            v128(v250, v123 + v125, v251);
            while (1)
            {
              uint64_t v132 = sub_100054D10();
              uint64_t v134 = v133;
              sub_100054D00();
              if (v73 >= v80)
              {
                if (v246)
                {
                  double v136 = v135 / v73;
                  goto LABEL_88;
                }
              }
              else if (v245)
              {
                double v136 = v135 / v80;
                goto LABEL_88;
              }
              double v136 = 0.0;
LABEL_88:
              swift_bridgeObjectRetain();
              unint64_t v137 = v255;
              char v138 = swift_isUniquelyReferenced_nonNull_native();
              v254 = (void *)v137;
              unint64_t v255 = 0x8000000000000000;
              unint64_t v140 = sub_100029ABC(v132, v134);
              uint64_t v141 = *(void *)(v137 + 16);
              BOOL v142 = (v139 & 1) == 0;
              uint64_t v143 = v141 + v142;
              if (__OFADD__(v141, v142))
              {
                __break(1u);
LABEL_149:
                __break(1u);
                goto LABEL_150;
              }
              char v144 = v139;
              if (*(void *)(v137 + 24) >= v143)
              {
                if ((v138 & 1) == 0) {
                  sub_10002C830();
                }
              }
              else
              {
                sub_10002BA60(v143, v138);
                unint64_t v145 = sub_100029ABC(v132, v134);
                if ((v144 & 1) != (v146 & 1)) {
                  goto LABEL_161;
                }
                unint64_t v140 = v145;
              }
              uint64_t v147 = v254;
              unint64_t v255 = (unint64_t)v254;
              swift_bridgeObjectRelease();
              if ((v144 & 1) == 0)
              {
                v147[(v140 >> 6) + 8] |= 1 << v140;
                uint64_t v148 = (uint64_t *)(v147[6] + 16 * v140);
                *uint64_t v148 = v132;
                v148[1] = v134;
                *(void *)(v147[7] + 8 * v140) = 0;
                uint64_t v149 = v147[2];
                uint64_t v150 = v149 + 1;
                BOOL v151 = __OFADD__(v149, 1);
                swift_bridgeObjectRetain();
                if (v151) {
                  goto LABEL_151;
                }
                v147[2] = v150;
              }
              swift_bridgeObjectRetain();
              uint64_t v129 = v147[7];
              swift_bridgeObjectRelease();
              *(double *)(v129 + 8 * v140) = v136 + *(double *)(v129 + 8 * v140);
              swift_bridgeObjectRelease_n();
              id v131 = v250;
              uint64_t v130 = v251;
              (*v247)(v250, v251);
              v126 += v127;
              if (!--v124)
              {
                swift_bridgeObjectRelease();
                uint64_t v5 = v253;
                uint64_t v117 = v219;
                unint64_t v112 = v225;
                goto LABEL_102;
              }
              v128(v131, v126, v130);
            }
          }
          swift_bridgeObjectRelease();
LABEL_102:
          uint64_t v152 = sub_100054D60();
          uint64_t v153 = *(void *)(v152 + 16);
          if (v153)
          {
            unint64_t v154 = (*(unsigned __int8 *)(v213 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v213 + 80);
            uint64_t v218 = v152;
            unint64_t v155 = v152 + v154;
            uint64_t v156 = *(void *)(v213 + 72);
            unint64_t v157 = *(void (**)(char *, unint64_t, uint64_t))(v213 + 16);
            v157(v249, v152 + v154, v5);
            while (1)
            {
              uint64_t v160 = sub_100054DB0();
              uint64_t v162 = v161;
              sub_100054DA0();
              if (v73 >= v80)
              {
                if (v246)
                {
                  double v164 = v163 / v73;
                  goto LABEL_112;
                }
              }
              else if (v245)
              {
                double v164 = v163 / v80;
                goto LABEL_112;
              }
              double v164 = 0.0;
LABEL_112:
              swift_bridgeObjectRetain();
              unint64_t v165 = v255;
              char v166 = swift_isUniquelyReferenced_nonNull_native();
              v254 = (void *)v165;
              unint64_t v255 = 0x8000000000000000;
              unint64_t v168 = sub_100029ABC(v160, v162);
              uint64_t v169 = *(void *)(v165 + 16);
              BOOL v170 = (v167 & 1) == 0;
              uint64_t v171 = v169 + v170;
              if (__OFADD__(v169, v170)) {
                goto LABEL_149;
              }
              char v172 = v167;
              if (*(void *)(v165 + 24) >= v171)
              {
                if ((v166 & 1) == 0) {
                  sub_10002C830();
                }
              }
              else
              {
                sub_10002BA60(v171, v166);
                unint64_t v173 = sub_100029ABC(v160, v162);
                if ((v172 & 1) != (v174 & 1)) {
                  goto LABEL_161;
                }
                unint64_t v168 = v173;
              }
              char v175 = v254;
              unint64_t v255 = (unint64_t)v254;
              swift_bridgeObjectRelease();
              if ((v172 & 1) == 0)
              {
                v175[(v168 >> 6) + 8] |= 1 << v168;
                unint64_t v176 = (uint64_t *)(v175[6] + 16 * v168);
                *unint64_t v176 = v160;
                v176[1] = v162;
                *(void *)(v175[7] + 8 * v168) = 0;
                uint64_t v177 = v175[2];
                uint64_t v178 = v177 + 1;
                BOOL v179 = __OFADD__(v177, 1);
                swift_bridgeObjectRetain();
                if (v179) {
                  goto LABEL_153;
                }
                v175[2] = v178;
              }
              swift_bridgeObjectRetain();
              uint64_t v158 = v175[7];
              swift_bridgeObjectRelease();
              *(double *)(v158 + 8 * v168) = v164 + *(double *)(v158 + 8 * v168);
              swift_bridgeObjectRelease_n();
              uint64_t v159 = v249;
              uint64_t v5 = v253;
              (*v242)(v249, v253);
              v155 += v156;
              if (!--v153)
              {
                swift_bridgeObjectRelease();
                uint64_t v116 = v223;
                uint64_t v117 = v219;
                uint64_t v113 = v238;
                unint64_t v112 = v225;
                goto LABEL_73;
              }
              v157(v159, v155, v5);
            }
          }
          swift_bridgeObjectRelease();
          uint64_t v116 = v223;
          uint64_t v113 = v238;
        }
LABEL_73:
        ++v112;
        v239(v117, v116);
        uint64_t v114 = v232;
        id v115 = (void (*)(char *, char *, uint64_t))v244;
        if (v112 == v113) {
          break;
        }
        continue;
      }
    }
LABEL_126:
    swift_bridgeObjectRelease();
    uint64_t v180 = *v217;
    uint64_t v181 = v220;
    (*v217)(v220, v222, v224);
    unint64_t v182 = v255;
    unint64_t v183 = v221;
    int v184 = swift_isUniquelyReferenced_nonNull_native();
    v254 = (void *)v183;
    unint64_t v186 = sub_100029B34(v181);
    uint64_t v187 = *(void *)(v183 + 16);
    BOOL v188 = (v185 & 1) == 0;
    uint64_t v189 = v187 + v188;
    if (__OFADD__(v187, v188)) {
      goto LABEL_157;
    }
    char v190 = v185;
    if (*(void *)(v183 + 24) >= v189)
    {
      if ((v184 & 1) == 0) {
        sub_10002C9E0(&qword_10006A4D0);
      }
    }
    else
    {
      sub_10002BD68(v189, v184, &qword_10006A4D0);
      unint64_t v191 = sub_100029B34(v220);
      if ((v190 & 1) != (v192 & 1)) {
        goto LABEL_163;
      }
      unint64_t v186 = v191;
    }
    unint64_t v221 = (unint64_t)v254;
    if (v190)
    {
      uint64_t v35 = v254[7];
      swift_bridgeObjectRelease();
      *(void *)(v35 + 8 * v186) = v182;
    }
    else
    {
      v254[(v186 >> 6) + 8] |= 1 << v186;
      v180(*(void *)(v221 + 48) + *(void *)(v212 + 72) * v186, v220, v224);
      unint64_t v193 = v221;
      *(void *)(*(void *)(v221 + 56) + 8 * v186) = v182;
      uint64_t v194 = *(void *)(v193 + 16);
      BOOL v69 = __OFADD__(v194, 1);
      uint64_t v195 = v194 + 1;
      if (v69) {
        goto LABEL_158;
      }
      *(void *)(v193 + 16) = v195;
    }
    swift_bridgeObjectRelease();
    BOOL v36 = *v207;
    uint64_t v37 = v224;
    (*v207)(v220, v224);
    v36(v222, v37);
    uint64_t v5 = v253;
    int64_t v34 = v215;
    unint64_t v33 = v216;
  }
  swift_release();
  return v221;
}

uint64_t sub_100032868(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v104 = a4;
  unint64_t v109 = a3;
  uint64_t v108 = a2;
  uint64_t v107 = a1;
  uint64_t v101 = type metadata accessor for HourlyUsage();
  uint64_t v112 = *(void *)(v101 - 8);
  __chkstk_darwin(v101);
  uint64_t v121 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_100055F20();
  __chkstk_darwin(v106);
  char v105 = (char *)&v86 - v12;
  uint64_t v110 = a7;
  uint64_t v111 = a8;
  uint64_t v103 = sub_100055F10();
  uint64_t v117 = *(void (**)(void))(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v102 = (char *)&v86 - v13;
  uint64_t v14 = sub_100054C10();
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v120 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  char v122 = (char *)&v86 - v17;
  uint64_t v100 = sub_100054A10();
  uint64_t v89 = *(void (***)(char *, uint64_t))(v100 - 8);
  __chkstk_darwin(v100);
  uint64_t v114 = (char *)&v86 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100005EB4(&qword_100069EA8);
  uint64_t v119 = *(void **)(v86 - 8);
  __chkstk_darwin(v86);
  uint64_t v123 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100055070();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v113 = (char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100005EB4(&qword_10006A490);
  __chkstk_darwin(v23 - 8);
  id v115 = (char *)&v86 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100005EB4(&qword_10006A498);
  uint64_t v26 = v25 - 8;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v86 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v86 - v30;
  uint64_t v32 = v21;
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  uint64_t v34 = v21 + 16;
  unint64_t v33 = v35;
  v35(v29, a5, v20);
  uint64_t v36 = sub_1000337F8(&qword_10006A158, (void (*)(uint64_t))&type metadata accessor for DateBins);
  sub_100055C20();
  *(void *)&v29[*(int *)(v26 + 44)] = v124;
  sub_10000D080((uint64_t)v29, (uint64_t)v31, &qword_10006A498);
  uint64_t v37 = &v31[*(int *)(v26 + 44)];
  uint64_t v38 = *(void *)v37;
  uint64_t v116 = v31;
  sub_100055C40();
  if (v38 == v124)
  {
    uint64_t v39 = _swiftEmptyArrayStorage;
    uint64_t v40 = (uint64_t)v116;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v119[7])(v115, 1, 1, v86);
LABEL_40:
    sub_100005FA8(v40, &qword_10006A498);
    return (uint64_t)v39;
  }
  uint64_t v97 = v33;
  uint64_t v98 = v34;
  uint64_t v118 = (void (**)(void))(v119 + 2);
  uint64_t v96 = (void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v99 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v119 + 7);
  uint64_t v95 = (unsigned int (**)(char *, uint64_t, uint64_t))(v119 + 6);
  uint64_t v94 = (void (**)(char *, char *, uint64_t))(v119 + 4);
  uint64_t v90 = (void (**)(char *, uint64_t))((char *)v117 + 8);
  ++v89;
  uint64_t v88 = (void (**)(char *, uint64_t))(v119 + 1);
  uint64_t v119 = _swiftEmptyArrayStorage;
  uint64_t v41 = (uint64_t)v114;
  uint64_t v42 = v20;
  int64_t v43 = v123;
  uint64_t v44 = v36;
  uint64_t v40 = (uint64_t)v116;
  uint64_t v45 = v86;
  uint64_t v93 = v42;
  uint64_t v92 = v44;
  uint64_t v91 = v37;
  while (1)
  {
    uint64_t v46 = (void (*)(unint64_t *, void))sub_100055C60();
    uint64_t v47 = v115;
    uint64_t v117 = *v118;
    v117(v115);
    v46(&v124, 0);
    uint64_t v48 = v113;
    v97(v113, v40, v42);
    sub_100055C50();
    (*v96)(v48, v42);
    uint64_t v49 = *v99;
    (*v99)(v47, 0, 1, v45);
    if ((*v95)(v47, 1, v45) == 1)
    {
      uint64_t v40 = (uint64_t)v116;
      uint64_t v39 = v119;
      goto LABEL_40;
    }
    uint64_t v50 = v45;
    uint64_t v87 = v49;
    (*v94)(v43, v47, v45);
    sub_100054EF0();
    sub_100054F00();
    uint64_t v51 = v41;
    sub_1000549F0();
    uint64_t v52 = v107;
    if (*(void *)(v107 + 16) && (unint64_t v53 = sub_100029B34(v41), (v54 & 1) != 0))
    {
      unint64_t v55 = *(void *)(*(void *)(v52 + 56) + 8 * v53);
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v55 = sub_100023CAC((uint64_t)_swiftEmptyArrayStorage);
    }
    uint64_t v56 = v104;
    uint64_t v57 = v103;
    int64_t v58 = v102;
    uint64_t v59 = 0;
    if (*(void *)(v104 + 16))
    {
      unint64_t v60 = sub_100029B34(v51);
      if (v61) {
        uint64_t v59 = *(void *)(*(void *)(v56 + 56) + 8 * v60);
      }
    }
    int64_t v62 = sub_1000248A8(v109, 0.0);
    sub_100055B10();
    sub_100055EF0();
    sub_100055F00();
    if (v125) {
      break;
    }
    double v66 = 1.0;
LABEL_27:
    (*v90)(v58, v57);
    swift_bridgeObjectRelease();
    if (v66 <= 0.0) {
      double v66 = 0.0;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v62 = sub_100029450(0, v62[2] + 1, 1, v62);
    }
    unint64_t v72 = v62[2];
    unint64_t v71 = v62[3];
    if (v72 >= v71 >> 1) {
      int64_t v62 = sub_100029450((void *)(v71 > 1), v72 + 1, 1, v62);
    }
    v62[2] = v72 + 1;
    *(double *)&v62[v72 + 4] = v66;
    sub_100054EF0();
    sub_100054F00();
    double v73 = v121;
    unint64_t v74 = v123;
    sub_1000549F0();
    uint64_t v75 = v101;
    ((void (*)(char *, char *, uint64_t))v117)(&v73[*(int *)(v101 + 24)], v74, v50);
    *(void *)&v73[*(int *)(v75 + 20)] = v59;
    *(void *)&v73[*(int *)(v75 + 28)] = v62;
    unint64_t v76 = (unint64_t)v119;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v76 = sub_100029594(0, *(void *)(v76 + 16) + 1, 1, v76, &qword_10006A4A0, (uint64_t (*)(void))type metadata accessor for HourlyUsage, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
    }
    uint64_t v77 = v100;
    uint64_t v78 = v114;
    unint64_t v80 = *(void *)(v76 + 16);
    unint64_t v79 = *(void *)(v76 + 24);
    uint64_t v81 = v112;
    uint64_t v82 = (uint64_t)v121;
    if (v80 >= v79 >> 1)
    {
      uint64_t v85 = sub_100029594(v79 > 1, v80 + 1, 1, v76, &qword_10006A4A0, (uint64_t (*)(void))type metadata accessor for HourlyUsage, (uint64_t (*)(void))type metadata accessor for HourlyUsage);
      uint64_t v81 = v112;
      unint64_t v76 = v85;
      uint64_t v82 = (uint64_t)v121;
    }
    *(void *)(v76 + 16) = v80 + 1;
    unint64_t v83 = (*(unsigned __int8 *)(v81 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v81 + 80);
    uint64_t v119 = (void *)v76;
    sub_1000334C4(v82, v76 + v83 + *(void *)(v81 + 72) * v80);
    uint64_t v41 = (uint64_t)v78;
    (*v89)(v78, v77);
    int64_t v43 = v74;
    (*v88)(v74, v50);
    uint64_t v84 = *(void *)v91;
    uint64_t v45 = v50;
    uint64_t v40 = (uint64_t)v116;
    uint64_t v42 = v93;
    sub_100055C40();
    if (v84 == v124)
    {
      uint64_t v39 = v119;
      v87(v115, 1, 1, v86);
      goto LABEL_40;
    }
  }
  unint64_t v63 = v124;
  uint64_t v64 = v126;
  uint64_t v65 = v127;
  double v66 = 1.0;
  while (!*(void *)(v55 + 16))
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_18:
    sub_100055F00();
    unint64_t v63 = v124;
    uint64_t v64 = v126;
    uint64_t v65 = v127;
    if (!v125) {
      goto LABEL_27;
    }
  }
  swift_bridgeObjectRetain();
  unint64_t v67 = sub_100029ABC(v64, v65);
  if ((v68 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  double v69 = *(double *)(*(void *)(v55 + 56) + 8 * v67);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result)
  {
    if ((v63 & 0x8000000000000000) != 0) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t result = (uint64_t)sub_10002AEF4(v62);
    int64_t v62 = (void *)result;
    if ((v63 & 0x8000000000000000) != 0) {
      goto LABEL_42;
    }
  }
  if (v63 < v62[2])
  {
    *(double *)&v62[v63 + 4] = v69;
    double v66 = v66 - v69;
    goto LABEL_18;
  }
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1000334C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HourlyUsage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100033528(uint64_t *a1, uint64_t *a2)
{
  return sub_100027BB4(a1, a2, *(void *)(v2 + 16)) & 1;
}

uint64_t sub_100033548(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100033558()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033590@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v2 = *(void *)(v1 + 24);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = 0;
  a1[3] = v3;
  a1[4] = v2;
  a1[5] = 2;
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_1000335C0()
{
  return _swift_deallocObject(v0, 32, 7);
}

double sub_1000335D0@<D0>(_OWORD *a1@<X8>)
{
  (*(void (**)(_OWORD *__return_ptr))(v1 + 16))(v5);
  long long v3 = v5[1];
  *a1 = v5[0];
  a1[1] = v3;
  double result = *(double *)&v6;
  a1[2] = v6;
  return result;
}

uint64_t sub_10003361C@<X0>(void *a1@<X8>)
{
  return sub_100033680(1, a1);
}

uint64_t sub_100033624()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033638()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100033678@<X0>(void *a1@<X8>)
{
  return sub_100033680(3, a1);
}

uint64_t sub_100033680@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2[3];
  uint64_t v4 = v2[4];
  uint64_t v5 = v2[5];
  *a2 = v2[2];
  a2[1] = v3;
  a2[2] = 0;
  a2[3] = v4;
  a2[4] = v5;
  a2[5] = a1;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000336CC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000336DC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_100028158(a1, *(uint64_t **)(v2 + 16), a2);
}

uint64_t sub_1000336FC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100033758()
{
  return _swift_deallocObject(v0, 17, 7);
}

unint64_t sub_100033768()
{
  unint64_t result = qword_10006A550;
  if (!qword_10006A550)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006A550);
  }
  return result;
}

uint64_t sub_1000337A8()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 81, 7);
}

uint64_t sub_1000337F8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for UsageItem()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UsageItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for UsageItem(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  return a1;
}

__n128 initializeWithTake for UsageItem(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for UsageItem(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  uint64_t v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  return a1;
}

uint64_t getEnumTagSinglePayload for UsageItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UsageItem(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UsageItem()
{
  return &type metadata for UsageItem;
}

uint64_t getEnumTagSinglePayload for UsageProviderError(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for UsageProviderError(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x100033B44);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for UsageProviderError()
{
  return &type metadata for UsageProviderError;
}

unint64_t sub_100033B80()
{
  unint64_t result = qword_10006A598;
  if (!qword_10006A598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A598);
  }
  return result;
}

uint64_t sub_100033BD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100055F80();
  __break(1u);
  return result;
}

BOOL sub_100033CCC(uint64_t a1)
{
  return sub_10002828C(a1);
}

ValueMetadata *type metadata accessor for MostUsedItemsMedium()
{
  return &type metadata for MostUsedItemsMedium;
}

uint64_t initializeBufferWithCopyOfBuffer for MostUsedItemsPlaceholderMedium(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for MostUsedItemsPlaceholderMedium(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MostUsedItemsPlaceholderMedium(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MostUsedItemsPlaceholderMedium()
{
  return &type metadata for MostUsedItemsPlaceholderMedium;
}

uint64_t *sub_100033DB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100033EE0(uint64_t a1)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }

  return swift_bridgeObjectRelease();
}

void *sub_100033F80(void *a1, void *a2, uint64_t a3)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100055880();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_100034058(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

char *sub_100034158(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100055880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  return a1;
}

char *sub_100034234(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    uint64_t v6 = sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_100034334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100034348);
}

uint64_t sub_100034348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C98);
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

uint64_t sub_10003440C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100034420);
}

uint64_t sub_100034420(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005EB4(&qword_100069C98);
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

uint64_t type metadata accessor for MostUsedItemsLarge(uint64_t a1)
{
  return sub_10003CD80(a1, qword_10006A5F8);
}

void sub_100034500()
{
  sub_10003DA3C(319, (unint64_t *)&qword_100069D08, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_1000345C4(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    *(void *)((char *)a1 + v9) = *(void *)((char *)a2 + v9);
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t sub_1000346F4(uint64_t a1)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_100055880();
    unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_100034798(void *a1, void *a2, int *a3)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100055880();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

void *sub_100034878(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
  return a1;
}

char *sub_100034974(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100055880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

char *sub_100034A5C(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    uint64_t v6 = sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  a1[a3[7]] = a2[a3[7]];
  return a1;
}

uint64_t sub_100034B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100034B70);
}

uint64_t sub_100034B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 28));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_100034C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100034C58);
}

uint64_t sub_100034C58(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005EB4(&qword_100069C98);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 28)) = a2 + 1;
  }
  return result;
}

uint64_t type metadata accessor for MostUsedItemsPlaceholderView(uint64_t a1)
{
  return sub_10003CD80(a1, qword_10006A690);
}

void sub_100034D38()
{
  sub_10003DA3C(319, (unint64_t *)&qword_100069D08, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_100034DF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100034E14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v50 = sub_1000553B0();
  __chkstk_darwin(v50);
  uint64_t v49 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005EB4(&qword_10006A790);
  uint64_t v54 = *(void *)(v4 - 8);
  uint64_t v55 = v4;
  __chkstk_darwin(v4);
  uint64_t v51 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005EB4(&qword_10006A798);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100005EB4(&qword_10006A7A0) - 8;
  __chkstk_darwin(v53);
  uint64_t v52 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100055670();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100055740();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (_OWORD *)((char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = sub_100055750();
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  _OWORD *v18 = xmmword_1000577D0;
  (*(void (**)(_OWORD *, void, uint64_t))(v16 + 104))(v18, enum case for GridItem.Size.flexible(_:), v15);
  sub_100055760();
  uint64_t v22 = type metadata accessor for MostUsedItemsLarge(0);
  uint64_t v23 = *(int *)(v22 + 24);
  uint64_t v48 = v2;
  uint64_t v24 = *(char **)(v2 + v23);
  uint64_t v47 = sub_10002499C((uint64_t)v21, (uint64_t)v24);
  uint64_t v25 = *(int *)(v22 + 20);
  uint64_t v26 = sub_1000353D4(v24, *(void *)(v2 + v25));
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Color.RGBColorSpace.sRGB(_:), v11);
  uint64_t v27 = sub_100055690();
  sub_100055360();
  uint64_t v57 = v26;
  int v58 = 0;
  sub_10003ABB4(&qword_10006A7A8, (void (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  sub_1000560B0();
  sub_100005EB4(&qword_10006A7B0);
  sub_10003DC18(&qword_10006A7B8, &qword_10006A7B0, (void (*)(void))sub_10003ADF8);
  uint64_t v28 = v51;
  sub_1000557A0();
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_100055790();
  uint64_t v30 = *(void *)(v48 + v25);
  uint64_t v31 = v54;
  uint64_t v32 = v28;
  unint64_t v33 = v28;
  uint64_t v34 = v55;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v9, v32, v55);
  uint64_t v35 = (uint64_t *)&v9[*(int *)(v7 + 44)];
  *uint64_t v35 = v29;
  v35[1] = v30;
  uint64_t v36 = *(void (**)(char *, uint64_t))(v31 + 8);
  swift_bridgeObjectRetain();
  v36(v33, v34);
  LOBYTE(v36) = sub_100055490();
  uint64_t v37 = v52;
  sub_100005F44((uint64_t)v9, v52, &qword_10006A798);
  uint64_t v38 = v37 + *(int *)(v53 + 44);
  *(unsigned char *)uint64_t v38 = (_BYTE)v36;
  *(_OWORD *)(v38 + 8) = 0u;
  *(_OWORD *)(v38 + 24) = 0u;
  *(unsigned char *)(v38 + 40) = 1;
  sub_100005FA8((uint64_t)v9, &qword_10006A798);
  uint64_t v39 = sub_100055770();
  uint64_t v41 = v40;
  uint64_t v42 = sub_100005EB4(&qword_10006A7D0);
  uint64_t v43 = v56;
  uint64_t v44 = v56 + *(int *)(v42 + 36);
  sub_100038954(v27, v44);
  uint64_t v45 = (uint64_t *)(v44 + *(int *)(sub_100005EB4(&qword_10006A7D8) + 36));
  *uint64_t v45 = v39;
  v45[1] = v41;
  sub_10000D080(v37, v43, &qword_10006A7A0);
  return swift_release();
}

char *sub_1000353D4(char *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  double v3 = ceil((double)v2 / (double)(uint64_t)result);
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v4 = (uint64_t)v3;
  if ((uint64_t)v3 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v4)
  {
    if (!v2)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if (v4 - 1 >= (unint64_t)v2)
    {
LABEL_27:
      __break(1u);
      return result;
    }
    uint64_t v34 = *(void *)(a2 + 16);
    uint64_t v6 = sub_100029814(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    uint64_t v7 = 0;
    uint64_t v32 = a2 + 32;
    uint64_t v8 = (uint64_t *)(a2 + 80);
    uint64_t v35 = v4;
    while (1)
    {
      uint64_t v11 = *(v8 - 6);
      long long v36 = *(_OWORD *)(v8 - 5);
      uint64_t v12 = (void *)*(v8 - 3);
      uint64_t v13 = *(v8 - 2);
      uint64_t v15 = *(v8 - 1);
      uint64_t v14 = *v8;
      unint64_t v16 = *((void *)v6 + 2);
      unint64_t v17 = *((void *)v6 + 3);
      unint64_t v18 = v16 + 1;
      swift_bridgeObjectRetain();
      id v19 = *((id *)&v36 + 1);
      id v20 = v12;
      uint64_t result = (char *)swift_bridgeObjectRetain();
      if (v16 >= v17 >> 1)
      {
        uint64_t result = sub_100029814((char *)(v17 > 1), v16 + 1, 1, v6);
        uint64_t v6 = result;
      }
      *((void *)v6 + 2) = v18;
      uint64_t v21 = &v6[56 * v16];
      *((void *)v21 + 4) = v11;
      *(_OWORD *)(v21 + 40) = v36;
      *((void *)v21 + 7) = v20;
      *((void *)v21 + 8) = v13;
      *((void *)v21 + 9) = v15;
      *((void *)v21 + 10) = v14;
      uint64_t v9 = v35;
      uint64_t v22 = v35 + v7;
      if (__OFADD__(v35, v7)) {
        break;
      }
      if (v22 < v34)
      {
        if (v22 < 0) {
          goto LABEL_21;
        }
        uint64_t v23 = (uint64_t *)(v32 + 56 * v22);
        uint64_t v33 = *v23;
        long long v37 = *(_OWORD *)(v23 + 1);
        uint64_t v24 = (void *)v23[3];
        uint64_t v25 = v23[4];
        uint64_t v27 = v23[5];
        uint64_t v26 = v23[6];
        unint64_t v28 = *((void *)v6 + 3);
        int64_t v29 = v16 + 2;
        swift_bridgeObjectRetain();
        id v30 = *((id *)&v37 + 1);
        id v31 = v24;
        swift_bridgeObjectRetain();
        if (v18 >= v28 >> 1) {
          uint64_t v6 = sub_100029814((char *)(v28 > 1), v29, 1, v6);
        }
        uint64_t v9 = v35;
        *((void *)v6 + 2) = v29;
        uint64_t v10 = &v6[56 * v18];
        *((void *)v10 + 4) = v33;
        *(_OWORD *)(v10 + 40) = v37;
        *((void *)v10 + 7) = v31;
        *((void *)v10 + 8) = v25;
        *((void *)v10 + 9) = v27;
        *((void *)v10 + 10) = v26;
      }
      ++v7;
      v8 += 7;
      if (v9 == v7) {
        return v6;
      }
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  return (char *)&_swiftEmptyArrayStorage;
}

uint64_t sub_100035650()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  sub_10000C828(v0);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  sub_100005EB4(&qword_10006A6F0);
  sub_100005EB4(&qword_10006A7C8);
  sub_10000D120(&qword_10006A700, &qword_10006A6F0);
  sub_10003ADF8();
  return sub_100055720();
}

uint64_t sub_100035744@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v60 = a1;
  uint64_t v68 = a3;
  uint64_t v4 = sub_1000553F0();
  uint64_t v64 = *(void *)(v4 - 8);
  uint64_t v65 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005EB4(&qword_10006A730);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (int *)type metadata accessor for MostUsedItemCell(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100005EB4(&qword_10006A710);
  __chkstk_darwin(v61);
  uint64_t v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(&qword_10006A738);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v62 = v15;
  uint64_t v63 = v16;
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100005EB4(&qword_10006A6F8);
  uint64_t v19 = __chkstk_darwin(v59);
  uint64_t v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v59 - v23;
  __chkstk_darwin(v22);
  unint64_t v67 = (char *)&v59 - v25;
  uint64_t v26 = sub_100005EB4(&qword_10006A7C8);
  __chkstk_darwin(v26 - 8);
  uint64_t v66 = (uint64_t)&v59 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v9 = swift_getKeyPath();
  sub_100005EB4(&qword_10006A740);
  swift_storeEnumTagMultiPayload();
  *(void *)&v12[v10[5]] = swift_getKeyPath();
  sub_100005EB4(&qword_100069C90);
  swift_storeEnumTagMultiPayload();
  sub_10000D080((uint64_t)v9, (uint64_t)v12, &qword_10006A730);
  unint64_t v28 = &v12[v10[6]];
  long long v29 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v28 = *(_OWORD *)a2;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v28 + 6) = *(void *)(a2 + 48);
  uint64_t v30 = v60;
  *(void *)&v12[v10[7]] = v60;
  strcpy((char *)v70, "MostUsedItem");
  BYTE5(v70[1]) = 0;
  HIWORD(v70[1]) = -5120;
  uint64_t v69 = v30;
  sub_10003AC08(a2);
  v71._countAndFlagsBits = sub_100055FC0();
  sub_100055A60(v71);
  swift_bridgeObjectRelease();
  sub_10003ABB4(&qword_10006A720, (void (*)(uint64_t))type metadata accessor for MostUsedItemCell);
  sub_100055650();
  uint64_t v31 = (uint64_t)v24;
  swift_bridgeObjectRelease();
  sub_10003AD90((uint64_t)v12, type metadata accessor for MostUsedItemCell);
  sub_1000553E0();
  unint64_t v32 = sub_10003AAB8();
  uint64_t v33 = v61;
  sub_100055640();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v6, v65);
  sub_100005FA8((uint64_t)v14, &qword_10006A710);
  double v34 = *(double *)(a2 + 32);
  v70[0] = v33;
  v70[1] = v32;
  swift_getOpaqueTypeConformance2();
  uint64_t v35 = v62;
  sub_100055660();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v18, v35);
  uint64_t v36 = *(void *)(a2 + 48);
  v70[0] = *(void *)(a2 + 40);
  v70[1] = v36;
  sub_10000D02C();
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_100055540();
  uint64_t v39 = v38;
  LOBYTE(a2) = v40 & 1;
  sub_100055130();
  sub_10000AB4C(v37, v39, a2);
  swift_bridgeObjectRelease();
  sub_100005FA8((uint64_t)v21, &qword_10006A6F8);
  if (v34 < 0.0) {
    goto LABEL_9;
  }
  if (qword_100069938 != -1) {
    swift_once();
  }
  uint64_t v41 = (void *)qword_10006B0D0;
  uint64_t v42 = v34 < 60.0 ? 128 : 96;
  [(id)qword_10006B0D0 setAllowedUnits:v42];
  [v41 setUnitsStyle:3];
  id v43 = [v41 stringFromTimeInterval:v34];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = sub_100055A10();
    unint64_t v47 = v46;
  }
  else
  {
LABEL_9:
    uint64_t v45 = 0;
    unint64_t v47 = 0xE000000000000000;
  }
  if (sub_100055A50())
  {
    v70[0] = v45;
    v70[1] = v47;
    uint64_t v48 = sub_100055540();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100055310();
    uint64_t v48 = sub_100055530();
  }
  uint64_t v51 = v48;
  uint64_t v52 = v49;
  char v53 = v50 & 1;
  uint64_t v54 = (uint64_t)v67;
  sub_100055140();
  sub_10000AB4C(v51, v52, v53);
  swift_bridgeObjectRelease();
  sub_100005FA8(v31, &qword_10006A6F8);
  uint64_t v55 = sub_100055780();
  uint64_t v56 = v66;
  sub_10004CAF0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v66, 0.0, 1, 0.0, 1, v55, v57);
  sub_100005FA8(v54, &qword_10006A6F8);
  return sub_10000D080(v56, v68, &qword_10006A7C8);
}

uint64_t sub_100035EFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)a1;
  long long v3 = *(_OWORD *)(a1 + 24);
  v5[0] = *(_OWORD *)(a1 + 8);
  v5[1] = v3;
  _OWORD v5[2] = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  return sub_100035744(v2, (uint64_t)v5, a2);
}

uint64_t sub_100035F48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = sub_100005EB4(&qword_10006A6D0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100005EB4(&qword_10006A6D8);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005EB4(&qword_10006A6E0);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_100055360();
  *((void *)v5 + 1) = 0x4030000000000000;
  v5[16] = 0;
  v30[1] = &v5[*(int *)(sub_100005EB4(&qword_10006A6E8) + 44)];
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_10000C828(v14);
  swift_bridgeObjectRelease();
  uint64_t v32 = v15;
  swift_getKeyPath();
  sub_100005EB4(&qword_10006A6F0);
  sub_100005EB4(&qword_10006A6F8);
  sub_10000D120(&qword_10006A700, &qword_10006A6F0);
  sub_10003A9D8();
  sub_100055720();
  uint64_t v16 = sub_100055790();
  sub_100005F44((uint64_t)v5, (uint64_t)v9, &qword_10006A6D0);
  uint64_t v17 = (uint64_t *)&v9[*(int *)(v7 + 44)];
  *uint64_t v17 = v16;
  v17[1] = a1;
  swift_bridgeObjectRetain();
  sub_100005FA8((uint64_t)v5, &qword_10006A6D0);
  LOBYTE(v16) = sub_1000554C0();
  sub_1000550C0();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  sub_100005F44((uint64_t)v9, (uint64_t)v13, &qword_10006A6D8);
  uint64_t v26 = &v13[*(int *)(v11 + 44)];
  *uint64_t v26 = v16;
  *((void *)v26 + 1) = v19;
  *((void *)v26 + 2) = v21;
  *((void *)v26 + 3) = v23;
  *((void *)v26 + 4) = v25;
  v26[40] = 0;
  sub_100005FA8((uint64_t)v9, &qword_10006A6D8);
  LOBYTE(v16) = sub_1000554D0();
  uint64_t v27 = v31;
  sub_100005F44((uint64_t)v13, v31, &qword_10006A6E0);
  uint64_t v28 = v27 + *(int *)(sub_100005EB4(&qword_10006A728) + 36);
  *(unsigned char *)uint64_t v28 = v16;
  *(_OWORD *)(v28 + 8) = 0u;
  *(_OWORD *)(v28 + 24) = 0u;
  *(unsigned char *)(v28 + 40) = 1;
  return sub_100005FA8((uint64_t)v13, &qword_10006A6E0);
}

uint64_t sub_100036264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v63 = a3;
  uint64_t v5 = sub_1000553F0();
  uint64_t v60 = *(void *)(v5 - 8);
  uint64_t v61 = v5;
  __chkstk_darwin(v5);
  uint64_t v59 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005EB4(&qword_10006A730);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = (int *)type metadata accessor for MostUsedItemCell(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_100005EB4(&qword_10006A710);
  __chkstk_darwin(v56);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(&qword_10006A738);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v57 = v15;
  uint64_t v58 = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = sub_100005EB4(&qword_10006A6F8);
  uint64_t v19 = __chkstk_darwin(v55);
  uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v24 = (char *)&v54 - v23;
  __chkstk_darwin(v22);
  uint64_t v62 = (char *)&v54 - v25;
  uint64_t *v9 = swift_getKeyPath();
  sub_100005EB4(&qword_10006A740);
  swift_storeEnumTagMultiPayload();
  *(void *)&v12[v10[5]] = swift_getKeyPath();
  sub_100005EB4(&qword_100069C90);
  swift_storeEnumTagMultiPayload();
  sub_10000D080((uint64_t)v9, (uint64_t)v12, &qword_10006A730);
  uint64_t v26 = &v12[v10[6]];
  long long v27 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v26 = *(_OWORD *)a2;
  *((_OWORD *)v26 + 1) = v27;
  *((_OWORD *)v26 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v26 + 6) = *(void *)(a2 + 48);
  *(void *)&v12[v10[7]] = a1;
  strcpy((char *)v65, "MostUsedItem");
  BYTE5(v65[1]) = 0;
  HIWORD(v65[1]) = -5120;
  uint64_t v64 = a1;
  sub_10003AC08(a2);
  v66._countAndFlagsBits = sub_100055FC0();
  sub_100055A60(v66);
  swift_bridgeObjectRelease();
  sub_10003ABB4(&qword_10006A720, (void (*)(uint64_t))type metadata accessor for MostUsedItemCell);
  sub_100055650();
  uint64_t v28 = (uint64_t)v24;
  swift_bridgeObjectRelease();
  sub_10003AD90((uint64_t)v12, type metadata accessor for MostUsedItemCell);
  long long v29 = v59;
  sub_1000553E0();
  unint64_t v30 = sub_10003AAB8();
  uint64_t v31 = v56;
  sub_100055640();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v29, v61);
  sub_100005FA8((uint64_t)v14, &qword_10006A710);
  double v32 = *(double *)(a2 + 32);
  v65[0] = v31;
  v65[1] = v30;
  swift_getOpaqueTypeConformance2();
  uint64_t v33 = v57;
  sub_100055660();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v18, v33);
  uint64_t v34 = *(void *)(a2 + 48);
  v65[0] = *(void *)(a2 + 40);
  v65[1] = v34;
  sub_10000D02C();
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_100055540();
  uint64_t v37 = v36;
  LOBYTE(a2) = v38 & 1;
  sub_100055130();
  sub_10000AB4C(v35, v37, a2);
  swift_bridgeObjectRelease();
  sub_100005FA8((uint64_t)v21, &qword_10006A6F8);
  if (v32 < 0.0) {
    goto LABEL_9;
  }
  if (qword_100069938 != -1) {
    swift_once();
  }
  uint64_t v39 = (void *)qword_10006B0D0;
  uint64_t v40 = v32 < 60.0 ? 128 : 96;
  [(id)qword_10006B0D0 setAllowedUnits:v40];
  [v39 setUnitsStyle:3];
  id v41 = [v39 stringFromTimeInterval:v32];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = sub_100055A10();
    unint64_t v45 = v44;
  }
  else
  {
LABEL_9:
    uint64_t v43 = 0;
    unint64_t v45 = 0xE000000000000000;
  }
  if (sub_100055A50())
  {
    v65[0] = v43;
    v65[1] = v45;
    uint64_t v46 = sub_100055540();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100055310();
    uint64_t v46 = sub_100055530();
  }
  uint64_t v49 = v46;
  uint64_t v50 = v47;
  char v51 = v48 & 1;
  uint64_t v52 = (uint64_t)v62;
  sub_100055140();
  sub_10000AB4C(v49, v50, v51);
  swift_bridgeObjectRelease();
  sub_100005FA8(v28, &qword_10006A6F8);
  return sub_10000D080(v52, v63, &qword_10006A6F8);
}

uint64_t sub_100036970@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)a1;
  long long v3 = *(_OWORD *)(a1 + 24);
  v5[0] = *(_OWORD *)(a1 + 8);
  v5[1] = v3;
  _OWORD v5[2] = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  return sub_100036264(v2, (uint64_t)v5, a2);
}

uint64_t sub_1000369B8@<X0>(uint64_t a1@<X8>)
{
  return sub_100035F48(*v1, a1);
}

uint64_t sub_1000369C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v45 = a2;
  uint64_t v2 = sub_100005EB4(&qword_10006A9E8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v44 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v40 - v5;
  uint64_t v7 = sub_1000558C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = type metadata accessor for AppIcon(0);
  uint64_t v15 = (int *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v43 = (uint64_t)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (uint64_t *)((char *)&v40 - v19);
  __chkstk_darwin(v18);
  uint64_t v42 = (uint64_t)&v40 - v21;
  sub_1000522C4((uint64_t)v13);
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for WidgetFamily.systemMedium(_:), v7);
  sub_10003ABB4((unint64_t *)&qword_10006A130, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100055B40();
  sub_100055B40();
  uint64_t v23 = v46;
  uint64_t v22 = v47;
  uint64_t v24 = *(void (**)(char *, uint64_t))(v8 + 8);
  v24(v11, v7);
  v24(v13, v7);
  if (v22 == v23) {
    double v25 = 20.0;
  }
  else {
    double v25 = 29.0;
  }
  uint64_t v26 = type metadata accessor for MostUsedItemCell(0);
  uint64_t v27 = v41;
  uint64_t v28 = v41 + *(int *)(v26 + 24);
  unint64_t v30 = *(void **)(v28 + 16);
  long long v29 = *(void **)(v28 + 24);
  *uint64_t v20 = swift_getKeyPath();
  sub_100005EB4(&qword_10006A9F0);
  swift_storeEnumTagMultiPayload();
  *(double *)((char *)v20 + v15[7]) = v25;
  *(uint64_t *)((char *)v20 + v15[8]) = (uint64_t)v29;
  *(uint64_t *)((char *)v20 + v15[9]) = (uint64_t)v30;
  uint64_t v31 = v42;
  sub_10003CDC0((uint64_t)v20, v42, type metadata accessor for AppIcon);
  id v32 = v29;
  id v33 = v30;
  *(void *)uint64_t v6 = sub_100055360();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v34 = sub_100005EB4(&qword_10006A9F8);
  sub_100036DE8(v27, (uint64_t)&v6[*(int *)(v34 + 44)]);
  uint64_t v35 = v43;
  sub_10003AE28(v31, v43, type metadata accessor for AppIcon);
  uint64_t v36 = v44;
  sub_100005F44((uint64_t)v6, v44, &qword_10006A9E8);
  uint64_t v37 = v45;
  sub_10003AE28(v35, v45, type metadata accessor for AppIcon);
  uint64_t v38 = sub_100005EB4(&qword_10006AA00);
  sub_100005F44(v36, v37 + *(int *)(v38 + 48), &qword_10006A9E8);
  sub_100005FA8((uint64_t)v6, &qword_10006A9E8);
  sub_10003AD90(v31, type metadata accessor for AppIcon);
  sub_100005FA8(v36, &qword_10006A9E8);
  return sub_10003AD90(v35, type metadata accessor for AppIcon);
}

uint64_t sub_100036DE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v74 = sub_100005EB4(&qword_10006AA08);
  uint64_t v73 = *(void *)(v74 - 8);
  uint64_t v3 = __chkstk_darwin(v74);
  uint64_t v80 = (uint64_t)v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v78 = (char *)v72 - v6;
  __chkstk_darwin(v5);
  uint64_t v79 = (uint64_t)v72 - v7;
  uint64_t v8 = sub_100055880();
  uint64_t v82 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000558C0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v72 - v16;
  uint64_t v18 = sub_100005EB4(&qword_10006AA10);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v77 = (uint64_t)v72 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)v72 - v21;
  uint64_t v84 = a1;
  sub_1000522C4((uint64_t)v17);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for WidgetFamily.systemLarge(_:), v11);
  sub_10003ABB4((unint64_t *)&qword_10006A130, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100055B40();
  sub_100055B40();
  uint64_t v23 = v97;
  uint64_t v24 = v88;
  double v25 = *(void (**)(char *, uint64_t))(v12 + 8);
  v25(v15, v11);
  v25(v17, v11);
  unint64_t v83 = v22;
  uint64_t v76 = v8;
  uint64_t v75 = v10;
  if (v23 == v24)
  {
    uint64_t v26 = type metadata accessor for MostUsedItemCell(0);
    uint64_t v27 = v84;
    uint64_t v28 = v84 + *(int *)(v26 + 24);
    unint64_t v29 = *(void *)(v28 + 48);
    uint64_t v97 = *(void *)(v28 + 40);
    unint64_t v98 = v29;
    sub_10000D02C();
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_100055540();
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    char v36 = v35 & 1;
    sub_10005228C((uint64_t)v10);
    sub_100037780(1, v30, v32, v34, (uint64_t)&v97);
    sub_10000AB4C(v30, v32, v36);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v10, v8);
    uint64_t v38 = v97;
    uint64_t v37 = v98;
    char v39 = v99;
    v72[1] = v101;
    uint64_t v88 = v97;
    unint64_t v89 = v98;
    char v90 = v99;
    uint64_t v91 = v100;
    uint64_t v92 = v101;
    char v93 = v102;
    uint64_t v94 = v103;
    uint64_t v95 = v104;
    char v96 = v105;
    unint64_t v86 = 0;
    unint64_t v87 = 0xE000000000000000;
    sub_100055DE0(27);
    swift_bridgeObjectRelease();
    unint64_t v86 = 0xD000000000000019;
    unint64_t v87 = 0x8000000100059C40;
    uint64_t v85 = *(void *)(v27 + *(int *)(v26 + 28));
    v106._countAndFlagsBits = sub_100055FC0();
    sub_100055A60(v106);
    swift_bridgeObjectRelease();
    sub_100005EB4(&qword_10006AA18);
    sub_10003CE28();
    sub_100055650();
    swift_bridgeObjectRelease();
    sub_10000AB4C(v38, v37, v39);
    uint64_t v22 = v83;
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v40 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v73 + 56))(v22, v40, 1, v74);
  uint64_t v41 = type metadata accessor for MostUsedItemCell(0);
  double v42 = *(double *)(v84 + *(int *)(v41 + 24) + 32);
  if (v42 >= 0.0)
  {
    uint64_t v45 = v76;
    if (qword_100069938 != -1) {
      swift_once();
    }
    uint64_t v47 = (void *)qword_10006B0D0;
    if (v42 < 60.0) {
      uint64_t v48 = 128;
    }
    else {
      uint64_t v48 = 96;
    }
    [(id)qword_10006B0D0 setAllowedUnits:v48];
    [v47 setUnitsStyle:1];
    id v49 = [v47 stringFromTimeInterval:v42];
    uint64_t v46 = v82;
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v44 = sub_100055A10();
      unint64_t v43 = v51;
    }
    else
    {
      uint64_t v44 = 0;
      unint64_t v43 = 0xE000000000000000;
    }
  }
  else
  {
    unint64_t v43 = 0xE200000000000000;
    uint64_t v44 = 11565;
    uint64_t v45 = v76;
    uint64_t v46 = v82;
  }
  uint64_t v97 = v44;
  unint64_t v98 = v43;
  sub_10000D02C();
  uint64_t v52 = sub_100055540();
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  char v58 = v57 & 1;
  uint64_t v59 = v84;
  uint64_t v60 = (uint64_t)v75;
  sub_10005228C((uint64_t)v75);
  sub_100037780(0, v52, v54, v56, (uint64_t)&v97);
  sub_10000AB4C(v52, v54, v58);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v60, v45);
  uint64_t v61 = v97;
  uint64_t v62 = v98;
  LOBYTE(v60) = v99;
  uint64_t v82 = v100;
  uint64_t v88 = v97;
  unint64_t v89 = v98;
  char v90 = v99;
  uint64_t v91 = v100;
  uint64_t v92 = v101;
  char v93 = v102;
  uint64_t v94 = v103;
  uint64_t v95 = v104;
  char v96 = v105;
  unint64_t v86 = 0;
  unint64_t v87 = 0xE000000000000000;
  sub_100055DE0(24);
  swift_bridgeObjectRelease();
  unint64_t v86 = 0xD000000000000016;
  unint64_t v87 = 0x8000000100059C20;
  uint64_t v85 = *(void *)(v59 + *(int *)(v41 + 28));
  v107._countAndFlagsBits = sub_100055FC0();
  sub_100055A60(v107);
  swift_bridgeObjectRelease();
  sub_100005EB4(&qword_10006AA18);
  sub_10003CE28();
  uint64_t v63 = v78;
  sub_100055650();
  swift_bridgeObjectRelease();
  sub_10000AB4C(v61, v62, v60);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v64 = (uint64_t)v63;
  uint64_t v65 = v79;
  sub_10000D080(v64, v79, &qword_10006AA08);
  uint64_t v66 = (uint64_t)v83;
  uint64_t v67 = v77;
  sub_100005F44((uint64_t)v83, v77, &qword_10006AA10);
  uint64_t v68 = v80;
  sub_100005F44(v65, v80, &qword_10006AA08);
  uint64_t v69 = v81;
  sub_100005F44(v67, v81, &qword_10006AA10);
  uint64_t v70 = sub_100005EB4(&qword_10006AA48);
  sub_100005F44(v68, v69 + *(int *)(v70 + 48), &qword_10006AA08);
  sub_100005FA8(v65, &qword_10006AA08);
  sub_100005FA8(v66, &qword_10006AA10);
  sub_100005FA8(v68, &qword_10006AA08);
  return sub_100005FA8(v67, &qword_10006AA10);
}

uint64_t sub_100037780@<X0>(char a1@<W0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  v48[2] = a3;
  uint64_t v49 = a4;
  v48[1] = a2;
  uint64_t v7 = sub_100055670();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100055880();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100055870();
  char v15 = sub_100055860();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v15)
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for Color.RGBColorSpace.sRGB(_:), v7);
    sub_100055690();
    sub_100055680();
    swift_release();
    if (a1) {
      sub_100055500();
    }
    else {
      sub_1000554F0();
    }
    uint64_t v17 = sub_100055520();
    uint64_t v19 = v18;
    char v21 = v20;
    uint64_t v23 = v22;
    swift_release();
    if (a1)
    {
      id v24 = [self labelColor];
      sub_1000556A0();
    }
    else
    {
      swift_retain();
    }
    char v30 = v21 & 1;
    uint64_t v41 = sub_100055510();
    uint64_t v49 = v23;
    uint64_t v42 = v41;
    uint64_t v34 = v43;
    char v36 = v44;
    uint64_t v38 = v45;
    swift_release();
    swift_release();
    uint64_t v39 = v17;
    uint64_t v40 = v19;
    uint64_t v32 = v42;
  }
  else
  {
    if (a1)
    {
      uint64_t v16 = &selRef_labelColor;
      sub_100055500();
    }
    else
    {
      uint64_t v16 = &selRef_tertiaryLabelColor;
      sub_1000554F0();
    }
    uint64_t v25 = sub_100055520();
    uint64_t v27 = v26;
    char v29 = v28;
    swift_release();
    char v30 = v29 & 1;
    id v31 = [self *v16];
    sub_1000556A0();
    uint64_t v32 = sub_100055510();
    uint64_t v34 = v33;
    char v36 = v35;
    uint64_t v38 = v37;
    swift_release();
    uint64_t v39 = v25;
    uint64_t v40 = v27;
  }
  sub_10000AB4C(v39, v40, v30);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)a5 = v32;
  *(void *)(a5 + 8) = v34;
  *(unsigned char *)(a5 + 16) = v36 & 1;
  *(void *)(a5 + 24) = v38;
  *(void *)(a5 + 32) = KeyPath;
  *(unsigned char *)(a5 + 40) = 1;
  *(void *)(a5 + 48) = result;
  *(void *)(a5 + 56) = 1;
  *(unsigned char *)(a5 + 64) = 0;
  return result;
}

uint64_t sub_100037B28@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_100055300();
  *(void *)(a1 + 8) = 0x4028000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = sub_100005EB4(&qword_10006A9E0);
  return sub_1000369C0(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_100037B74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v2 = sub_100005EB4(&qword_10006ABA8);
  __chkstk_darwin(v2 - 8);
  char v44 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_1000556C0();
  uint64_t v36 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000550E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v35 - v11;
  uint64_t v45 = sub_100005EB4(&qword_10006ABB0);
  uint64_t v42 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  char v35 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_100005EB4(&qword_10006ABB8) - 8;
  __chkstk_darwin(v39);
  char v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_100005EB4(&qword_10006ABC0);
  __chkstk_darwin(v40);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_100005EB4(&qword_10006ABC8);
  uint64_t v41 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v37 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000525B8((uint64_t)v12);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for ColorScheme.light(_:), v6);
  char v19 = sub_1000550D0();
  char v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  v20(v10, v6);
  v20(v12, v6);
  uint64_t v21 = type metadata accessor for AppIcon(0);
  uint64_t v22 = 28;
  if (v19) {
    uint64_t v22 = 24;
  }
  id v23 = *(id *)(v1 + *(int *)(v21 + v22));
  sub_1000556B0();
  uint64_t v24 = v36;
  uint64_t v25 = v38;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v38);
  sub_1000556E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v25);
  uint64_t v26 = (uint64_t)v44;
  sub_100055890();
  uint64_t v27 = sub_1000558B0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 0, 1, v27);
  char v28 = v35;
  sub_1000556D0();
  swift_release();
  sub_100005FA8(v26, &qword_10006ABA8);
  sub_100055770();
  sub_100055100();
  uint64_t v29 = v42;
  uint64_t v30 = v45;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v15, v28, v45);
  id v31 = &v15[*(int *)(v39 + 44)];
  long long v32 = v48;
  *(_OWORD *)id v31 = v47;
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v49;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v30);
  sub_100005F44((uint64_t)v15, (uint64_t)v17, &qword_10006ABB8);
  v17[*(int *)(v40 + 36)] = 1;
  sub_100005FA8((uint64_t)v15, &qword_10006ABB8);
  sub_10003DCAC();
  uint64_t v33 = v37;
  sub_1000555A0();
  sub_100005FA8((uint64_t)v17, &qword_10006ABC0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v41 + 32))(v46, v33, v43);
}

uint64_t sub_100038150@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100005EB4(&qword_10006A748);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100005EB4(&qword_10006A750);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100055360();
  *(void *)uint64_t v8 = result;
  *((void *)v8 + 1) = 0x4030000000000000;
  v8[16] = 0;
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_100005EB4(&qword_10006A758);
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a1;
    *(unsigned char *)(v13 + 24) = a2 & 1;
    sub_100005EB4(&qword_10006A760);
    sub_10003AC70();
    sub_100055730();
    char v14 = sub_1000554C0();
    sub_1000550C0();
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    sub_100005F44((uint64_t)v8, (uint64_t)v11, &qword_10006A748);
    id v23 = &v11[*(int *)(v9 + 36)];
    *id v23 = v14;
    *((void *)v23 + 1) = v16;
    *((void *)v23 + 2) = v18;
    *((void *)v23 + 3) = v20;
    *((void *)v23 + 4) = v22;
    v23[40] = 0;
    sub_100005FA8((uint64_t)v8, &qword_10006A748);
    char v24 = sub_1000554D0();
    sub_100005F44((uint64_t)v11, a3, &qword_10006A750);
    uint64_t v25 = a3 + *(int *)(sub_100005EB4(&qword_10006A780) + 36);
    *(unsigned char *)uint64_t v25 = v24;
    *(_OWORD *)(v25 + 8) = 0u;
    *(_OWORD *)(v25 + 24) = 0u;
    *(unsigned char *)(v25 + 40) = 1;
    return sub_100005FA8((uint64_t)v11, &qword_10006A750);
  }
  return result;
}

uint64_t sub_100038384(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = type metadata accessor for MostUsedItemNoContentView(0);
  __chkstk_darwin(v4);
  uint64_t v6 = (uint64_t *)((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100005EB4(&qword_10006A788);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    unsigned char *v9 = 1;
    swift_storeEnumTagMultiPayload();
    sub_10003AD1C();
    sub_10003ABB4(&qword_10006A778, (void (*)(uint64_t))type metadata accessor for MostUsedItemNoContentView);
    return sub_1000553A0();
  }
  else
  {
    *uint64_t v6 = swift_getKeyPath();
    sub_100005EB4(&qword_100069C90);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v6 + *(int *)(v4 + 20)) = 1;
    sub_10003AE28((uint64_t)v6, (uint64_t)v9, type metadata accessor for MostUsedItemNoContentView);
    swift_storeEnumTagMultiPayload();
    sub_10003AD1C();
    sub_10003ABB4(&qword_10006A778, (void (*)(uint64_t))type metadata accessor for MostUsedItemNoContentView);
    sub_1000553A0();
    return sub_10003AD90((uint64_t)v6, type metadata accessor for MostUsedItemNoContentView);
  }
}

uint64_t sub_1000385B4@<X0>(uint64_t a1@<X8>)
{
  return sub_100038150(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_1000385C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for MostUsedItemsPlaceholderView(0);
  uint64_t v5 = v4 - 8;
  uint64_t v6 = *(void *)(v4 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  __chkstk_darwin(v4);
  uint64_t v8 = sub_100005EB4(&qword_10006A7F8);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(a1 + *(int *)(v5 + 28));
  if (v13 < 0)
  {
    __break(1u);
  }
  else
  {
    v18[0] = 0;
    v18[1] = v13;
    swift_getKeyPath();
    sub_10003AE28(a1, (uint64_t)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for MostUsedItemsPlaceholderView);
    unint64_t v14 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    uint64_t v15 = swift_allocObject();
    sub_10003CDC0((uint64_t)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for MostUsedItemsPlaceholderView);
    sub_100005EB4(&qword_100069B08);
    sub_100005EB4(&qword_10006A800);
    sub_10000AA7C();
    sub_10003B014();
    sub_100055720();
    char v16 = sub_100055490();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(a2, v12, v8);
    uint64_t v17 = a2 + *(int *)(sub_100005EB4(&qword_10006A820) + 36);
    *(unsigned char *)uint64_t v17 = v16;
    *(_OWORD *)(v17 + 8) = 0u;
    *(_OWORD *)(v17 + 24) = 0u;
    *(unsigned char *)(v17 + 40) = 1;
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return result;
}

double sub_100038860@<D0>(uint64_t a1@<X1>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_100055350();
  uint64_t v5 = (int *)type metadata accessor for MostUsedItemsPlaceholderView(0);
  uint64_t v6 = *(void *)(a1 + v5[5]);
  uint64_t v7 = *(void *)(a1 + v5[6]);
  char v8 = *(unsigned char *)(a1 + v5[7]);
  char v9 = v6 == 1;
  if (v6 == 1) {
    double v10 = 0.0;
  }
  else {
    double v10 = INFINITY;
  }
  uint64_t v18 = v4;
  uint64_t v19 = 0x4030000000000000;
  char v20 = 0;
  uint64_t v21 = v6;
  uint64_t v22 = v7;
  char v23 = v8;
  sub_100055780();
  sub_10004CD44(0.0, 1, 0.0, 1, v10, v9, 0.0, 1, v17, 0.0, 1, 0.0, 1);
  long long v11 = v17[7];
  a2[6] = v17[6];
  a2[7] = v11;
  long long v12 = v17[9];
  a2[8] = v17[8];
  a2[9] = v12;
  long long v13 = v17[3];
  a2[2] = v17[2];
  a2[3] = v13;
  long long v14 = v17[5];
  a2[4] = v17[4];
  a2[5] = v14;
  double result = *(double *)v17;
  long long v16 = v17[1];
  *a2 = v17[0];
  a2[1] = v16;
  return result;
}

uint64_t sub_100038954@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  uint64_t v2 = sub_1000553D0();
  __chkstk_darwin(v2 - 8);
  v27[1] = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100055440();
  uint64_t v28 = *(void *)(v4 - 8);
  uint64_t v29 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005EB4(&qword_10006A7E0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  double v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100055880();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)v27 - v16;
  sub_10005228C((uint64_t)v27 - v16);
  sub_100055870();
  char v18 = sub_100055860();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, v11);
  v19(v17, v11);
  if (v18)
  {
    sub_1000553C0();
    sub_100055430();
    uint64_t v21 = v28;
    uint64_t v20 = v29;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(&v10[*(int *)(v7 + 36)], v6, v29);
    *(void *)double v10 = v30;
    uint64_t v22 = *(void (**)(char *, uint64_t))(v21 + 8);
    swift_retain();
    v22(v6, v20);
    uint64_t v23 = v31;
    sub_10000D080((uint64_t)v10, v31, &qword_10006A7E0);
    uint64_t v24 = 0;
    uint64_t v25 = v23;
  }
  else
  {
    uint64_t v24 = 1;
    uint64_t v25 = v31;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v25, v24, 1, v7);
}

uint64_t sub_100038C68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100055670();
  __chkstk_darwin(v3);
  (*(void (**)(char *, void))(v5 + 104))((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t v6 = sub_100055690();
  *(void *)a1 = sub_1000552F0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v7 = sub_100005EB4(&qword_10006A7E8);
  sub_1000385C0(v1, a1 + *(int *)(v7 + 44));
  uint64_t v8 = sub_100055770();
  uint64_t v10 = v9;
  uint64_t v11 = a1 + *(int *)(sub_100005EB4(&qword_10006A7F0) + 36);
  sub_100038954(v6, v11);
  swift_release();
  uint64_t result = sub_100005EB4(&qword_10006A7D8);
  uint64_t v13 = (uint64_t *)(v11 + *(int *)(result + 36));
  uint64_t *v13 = v8;
  v13[1] = v10;
  return result;
}

uint64_t sub_100038DD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100038DEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100038E08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100038E24(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6 = type metadata accessor for MostUsedItemNoContentView(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_100005EB4(&qword_10006A788);
  __chkstk_darwin(v9);
  uint64_t v11 = (BOOL *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    *uint64_t v11 = a2 == 1;
    swift_storeEnumTagMultiPayload();
    sub_10003AD1C();
    sub_10003ABB4(&qword_10006A778, (void (*)(uint64_t))type metadata accessor for MostUsedItemNoContentView);
    return sub_1000553A0();
  }
  else
  {
    uint64_t *v8 = swift_getKeyPath();
    sub_100005EB4(&qword_100069C90);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v8 + *(int *)(v6 + 20)) = a2 == 1;
    sub_10003AE28((uint64_t)v8, (uint64_t)v11, type metadata accessor for MostUsedItemNoContentView);
    swift_storeEnumTagMultiPayload();
    sub_10003AD1C();
    sub_10003ABB4(&qword_10006A778, (void (*)(uint64_t))type metadata accessor for MostUsedItemNoContentView);
    sub_1000553A0();
    return sub_10003AD90((uint64_t)v8, type metadata accessor for MostUsedItemNoContentView);
  }
}

void sub_100039064()
{
  uint64_t v1 = v0[1];
  if (v1 < 0)
  {
    __break(1u);
  }
  else
  {
    char v2 = *((unsigned char *)v0 + 16);
    uint64_t v3 = *v0;
    swift_getKeyPath();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v3;
    *(void *)(v4 + 24) = v1;
    *(unsigned char *)(v4 + 32) = v2;
    sub_100005EB4(&qword_100069B08);
    sub_100005EB4(&qword_10006A760);
    sub_10000AA7C();
    sub_10003AC70();
    sub_100055720();
  }
}

uint64_t sub_100039150@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v45 = a1;
  uint64_t v47 = a2;
  uint64_t v2 = sub_100005EB4(&qword_10006AA58);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v46 = &v44[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v6 = &v44[-v5];
  uint64_t v7 = sub_100055160();
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = &v44[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_100005EB4(&qword_10006AA60);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = &v44[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_100005EB4(&qword_10006AA68);
  uint64_t v16 = v15 - 8;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = &v44[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = &v44[-v21];
  __chkstk_darwin(v20);
  uint64_t v24 = &v44[-v23];
  uint64_t v25 = (char *)v10 + *(int *)(v8 + 28);
  uint64_t v26 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v27 = sub_100055320();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104))(v25, v26, v27);
  __asm { FMOV            V0.2D, #7.25 }
  *uint64_t v10 = _Q0;
  LOBYTE(v25) = v45;
  sub_100055770();
  sub_100055100();
  sub_10003AE28((uint64_t)v10, (uint64_t)v14, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v33 = &v14[*(int *)(v12 + 44)];
  long long v34 = v49;
  *uint64_t v33 = v48;
  v33[1] = v34;
  v33[2] = v50;
  sub_10003AD90((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  id v35 = [self tertiarySystemFillColor];
  uint64_t v36 = sub_1000556A0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100005F44((uint64_t)v14, (uint64_t)v22, &qword_10006AA60);
  uint64_t v38 = (uint64_t *)&v22[*(int *)(v16 + 44)];
  *uint64_t v38 = KeyPath;
  v38[1] = v36;
  sub_100005FA8((uint64_t)v14, &qword_10006AA60);
  sub_10000D080((uint64_t)v22, (uint64_t)v24, &qword_10006AA68);
  *(void *)uint64_t v6 = sub_100055360();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  uint64_t v39 = sub_100005EB4(&qword_10006AA70);
  sub_100039544((char)v25, (uint64_t)&v6[*(int *)(v39 + 44)]);
  sub_100005F44((uint64_t)v24, (uint64_t)v19, &qword_10006AA68);
  uint64_t v40 = v46;
  sub_100005F44((uint64_t)v6, (uint64_t)v46, &qword_10006AA58);
  uint64_t v41 = v47;
  sub_100005F44((uint64_t)v19, v47, &qword_10006AA68);
  uint64_t v42 = sub_100005EB4(&qword_10006AA78);
  sub_100005F44((uint64_t)v40, v41 + *(int *)(v42 + 48), &qword_10006AA58);
  sub_100005FA8((uint64_t)v6, &qword_10006AA58);
  sub_100005FA8((uint64_t)v24, &qword_10006AA68);
  sub_100005FA8((uint64_t)v40, &qword_10006AA58);
  return sub_100005FA8((uint64_t)v19, &qword_10006AA68);
}

uint64_t sub_100039544@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v121 = a2;
  uint64_t v119 = sub_100005EB4(&qword_10006AA80);
  uint64_t v3 = __chkstk_darwin(v119);
  uint64_t v116 = (char *)&v112 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v120 = (uint64_t)&v112 - v5;
  uint64_t v131 = sub_100005EB4(&qword_100069C18);
  __chkstk_darwin(v131);
  uint64_t v7 = (char *)&v112 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = sub_100055160();
  __chkstk_darwin(v123);
  unint64_t v124 = (char *)&v112 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100005EB4(&qword_100069C20);
  __chkstk_darwin(v126);
  uint64_t v128 = (uint64_t)&v112 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_100005EB4(&qword_100069C28);
  __chkstk_darwin(v125);
  uint64_t v129 = (uint64_t)&v112 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_100005EB4(&qword_100069C30);
  __chkstk_darwin(v127);
  uint64_t v130 = (uint64_t)&v112 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005EB4(&qword_10006AA88);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v112 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005EB4(&qword_10006AA90);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v118 = (uint64_t)&v112 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v132 = (uint64_t)&v112 - v19;
  __asm { FMOV            V0.2D, #4.0 }
  long long v122 = _Q0;
  uint64_t v117 = v7;
  if (a1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v132, 1, 1, v12);
  }
  else
  {
    sub_100055310();
    uint64_t v25 = sub_100055530();
    uint64_t v27 = v26;
    uint64_t v28 = (uint64_t)v7;
    char v30 = v29 & 1;
    sub_100055500();
    uint64_t v115 = v12;
    uint64_t v114 = sub_100055520();
    uint64_t v113 = v31;
    char v33 = v32;
    uint64_t v35 = v34;
    swift_release();
    char v36 = v33 & 1;
    sub_10000AB4C(v25, v27, v30);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v38 = v124;
    uint64_t v39 = &v124[*(int *)(v123 + 20)];
    uint64_t v40 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v41 = sub_100055320();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 104))(v39, v40, v41);
    *uint64_t v38 = v122;
    id v42 = [self labelColor];
    uint64_t v43 = sub_1000556A0();
    uint64_t v44 = swift_getKeyPath();
    uint64_t v45 = v128;
    sub_10003AE28((uint64_t)v38, v128, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    uint64_t v46 = (uint64_t *)(v45 + *(int *)(v126 + 36));
    *uint64_t v46 = v44;
    v46[1] = v43;
    sub_10003AD90((uint64_t)v38, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    uint64_t v47 = v129;
    sub_100005F44(v45, v129, &qword_100069C20);
    *(void *)(v47 + *(int *)(v125 + 36)) = 0x3FB47AE147AE147BLL;
    sub_100005FA8(v45, &qword_100069C20);
    LOBYTE(v43) = sub_100055490();
    sub_1000550C0();
    uint64_t v49 = v48;
    uint64_t v51 = v50;
    uint64_t v53 = v52;
    uint64_t v55 = v54;
    uint64_t v56 = v130;
    sub_100005F44(v47, v130, &qword_100069C28);
    uint64_t v57 = v56 + *(int *)(v127 + 36);
    *(unsigned char *)uint64_t v57 = v43;
    *(void *)(v57 + 8) = v49;
    *(void *)(v57 + 16) = v51;
    *(void *)(v57 + 24) = v53;
    *(void *)(v57 + 32) = v55;
    *(unsigned char *)(v57 + 40) = 0;
    sub_100005FA8(v47, &qword_100069C28);
    uint64_t v58 = sub_100055770();
    uint64_t v60 = v59;
    sub_100005F44(v56, v28, &qword_100069C30);
    uint64_t v61 = (uint64_t *)(v28 + *(int *)(v131 + 36));
    uint64_t *v61 = v58;
    v61[1] = v60;
    sub_100005F44(v28, (uint64_t)&v15[*(int *)(v115 + 36)], &qword_100069C18);
    uint64_t v62 = v114;
    uint64_t v63 = v113;
    *(void *)uint64_t v15 = v114;
    *((void *)v15 + 1) = v63;
    v15[16] = v36;
    *((void *)v15 + 3) = v35;
    *((void *)v15 + 4) = KeyPath;
    *((void *)v15 + 5) = 1;
    v15[48] = 0;
    uint64_t v64 = v62;
    sub_10000C29C(v62, v63, v36);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100005FA8(v28, &qword_100069C18);
    sub_100005FA8(v56, &qword_100069C30);
    sub_10000AB4C(v64, v63, v36);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v65 = (uint64_t)v15;
    uint64_t v66 = v132;
    sub_10000D080(v65, v132, &qword_10006AA88);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v13 + 56))(v66, 0, 1, v115);
  }
  sub_100055310();
  uint64_t v67 = sub_100055530();
  uint64_t v115 = v68;
  uint64_t v70 = v69;
  char v72 = v71 & 1;
  uint64_t v114 = swift_getKeyPath();
  uint64_t v73 = sub_100055500();
  uint64_t v74 = swift_getKeyPath();
  uint64_t v75 = v124;
  uint64_t v76 = &v124[*(int *)(v123 + 20)];
  uint64_t v77 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v78 = sub_100055320();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v78 - 8) + 104))(v76, v77, v78);
  *uint64_t v75 = v122;
  id v79 = [self tertiaryLabelColor];
  uint64_t v80 = sub_1000556A0();
  uint64_t v81 = swift_getKeyPath();
  uint64_t v82 = v128;
  sub_10003AE28((uint64_t)v75, v128, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  unint64_t v83 = (uint64_t *)(v82 + *(int *)(v126 + 36));
  *unint64_t v83 = v81;
  v83[1] = v80;
  sub_10003AD90((uint64_t)v75, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v84 = v129;
  sub_100005F44(v82, v129, &qword_100069C20);
  *(void *)(v84 + *(int *)(v125 + 36)) = 0x3FB47AE147AE147BLL;
  sub_100005FA8(v82, &qword_100069C20);
  LOBYTE(v80) = sub_100055490();
  sub_1000550C0();
  uint64_t v86 = v85;
  uint64_t v88 = v87;
  uint64_t v90 = v89;
  uint64_t v92 = v91;
  uint64_t v93 = v130;
  sub_100005F44(v84, v130, &qword_100069C28);
  uint64_t v94 = v93 + *(int *)(v127 + 36);
  *(unsigned char *)uint64_t v94 = v80;
  *(void *)(v94 + 8) = v86;
  *(void *)(v94 + 16) = v88;
  *(void *)(v94 + 24) = v90;
  *(void *)(v94 + 32) = v92;
  *(unsigned char *)(v94 + 40) = 0;
  sub_100005FA8(v84, &qword_100069C28);
  uint64_t v95 = sub_100055770();
  uint64_t v97 = v96;
  uint64_t v98 = (uint64_t)v117;
  sub_100005F44(v93, (uint64_t)v117, &qword_100069C30);
  char v99 = (uint64_t *)(v98 + *(int *)(v131 + 36));
  uint64_t *v99 = v95;
  v99[1] = v97;
  uint64_t v100 = (uint64_t)v116;
  sub_100005F44(v98, (uint64_t)&v116[*(int *)(v119 + 36)], &qword_100069C18);
  uint64_t v101 = v67;
  uint64_t v102 = v115;
  *(void *)uint64_t v100 = v67;
  *(void *)(v100 + 8) = v102;
  LOBYTE(v80) = v72;
  *(unsigned char *)(v100 + 16) = v72;
  uint64_t v103 = v114;
  *(void *)(v100 + 24) = v70;
  *(void *)(v100 + 32) = v103;
  *(void *)(v100 + 40) = 1;
  *(unsigned char *)(v100 + 48) = 0;
  *(void *)(v100 + 56) = v74;
  *(void *)(v100 + 64) = v73;
  uint64_t v104 = v101;
  uint64_t v105 = v102;
  sub_10000C29C(v101, v102, v80);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100005FA8(v98, &qword_100069C18);
  sub_100005FA8(v93, &qword_100069C30);
  sub_10000AB4C(v104, v105, v80);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v106 = v120;
  sub_10000D080(v100, v120, &qword_10006AA80);
  uint64_t v107 = v132;
  uint64_t v108 = v118;
  sub_100005F44(v132, v118, &qword_10006AA90);
  sub_100005F44(v106, v100, &qword_10006AA80);
  uint64_t v109 = v121;
  sub_100005F44(v108, v121, &qword_10006AA90);
  uint64_t v110 = sub_100005EB4(&qword_10006AA98);
  sub_100005F44(v100, v109 + *(int *)(v110 + 48), &qword_10006AA80);
  sub_100005FA8(v106, &qword_10006AA80);
  sub_100005FA8(v107, &qword_10006AA90);
  sub_100005FA8(v100, &qword_10006AA80);
  return sub_100005FA8(v108, &qword_10006AA90);
}

uint64_t sub_10003A03C@<X0>(uint64_t a1@<X8>)
{
  int v3 = *v1;
  *(void *)a1 = sub_100055300();
  *(void *)(a1 + 8) = 0x4018000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = sub_100005EB4(&qword_10006AA50);
  return sub_100039150(v3, a1 + *(int *)(v4 + 44));
}

uint64_t sub_10003A08C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v48 = a2;
  uint64_t v2 = sub_100055160();
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2);
  uint64_t v5 = (_OWORD *)((char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_100005EB4(&qword_10006AA60);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005EB4(&qword_10006AA68);
  uint64_t v11 = v10 - 8;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v47 = (uint64_t)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v45 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v45 - v17;
  uint64_t v19 = (char *)v5 + *(int *)(v3 + 28);
  uint64_t v20 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v21 = sub_100055320();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104))(v19, v20, v21);
  __asm { FMOV            V0.2D, #7.25 }
  *uint64_t v5 = _Q0;
  type metadata accessor for MostUsedItemNoContentView(0);
  uint64_t v27 = v46;
  sub_100055770();
  sub_100055100();
  sub_10003AE28((uint64_t)v5, (uint64_t)v9, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v28 = &v9[*(int *)(v7 + 44)];
  long long v29 = v67;
  *(_OWORD *)uint64_t v28 = v66;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v68;
  sub_10003AD90((uint64_t)v5, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  id v30 = [self tertiarySystemFillColor];
  uint64_t v31 = sub_1000556A0();
  uint64_t KeyPath = swift_getKeyPath();
  sub_100005F44((uint64_t)v9, (uint64_t)v16, &qword_10006AA60);
  char v33 = (uint64_t *)&v16[*(int *)(v11 + 44)];
  *char v33 = KeyPath;
  v33[1] = v31;
  sub_100005FA8((uint64_t)v9, &qword_10006AA60);
  sub_10000D080((uint64_t)v16, (uint64_t)v18, &qword_10006AA68);
  uint64_t v34 = sub_100055360();
  sub_10003A4FC(v27, (uint64_t)v49);
  *(_OWORD *)((char *)&v51[5] + 7) = v49[5];
  *(_OWORD *)((char *)&v51[6] + 7) = v49[6];
  *(_OWORD *)((char *)&v51[7] + 7) = v50[0];
  v51[8] = *(_OWORD *)((char *)v50 + 9);
  *(_OWORD *)((char *)&v51[1] + 7) = v49[1];
  *(_OWORD *)((char *)&v51[2] + 7) = v49[2];
  *(_OWORD *)((char *)&v51[3] + 7) = v49[3];
  *(_OWORD *)((char *)&v51[4] + 7) = v49[4];
  char v52 = 0;
  *(_OWORD *)((char *)v51 + 7) = v49[0];
  uint64_t v35 = v47;
  sub_100005F44((uint64_t)v18, v47, &qword_10006AA68);
  uint64_t v36 = v48;
  sub_100005F44(v35, v48, &qword_10006AA68);
  uint64_t v37 = *(int *)(sub_100005EB4(&qword_10006AAB8) + 48);
  *(_OWORD *)&v54[17] = v51[1];
  *(_OWORD *)&v54[81] = v51[5];
  *(_OWORD *)&v54[97] = v51[6];
  *(_OWORD *)&v54[113] = v51[7];
  *(_OWORD *)&v54[129] = v51[8];
  *(_OWORD *)&v54[33] = v51[2];
  *(_OWORD *)&v54[49] = v51[3];
  uint64_t v38 = v36 + v37;
  long long v53 = (unint64_t)v34;
  v54[0] = 0;
  *(_OWORD *)&v54[65] = v51[4];
  *(_OWORD *)&v54[1] = v51[0];
  long long v39 = *(_OWORD *)&v54[128];
  *(_OWORD *)(v38 + 128) = *(_OWORD *)&v54[112];
  *(_OWORD *)(v38 + 144) = v39;
  *(unsigned char *)(v38 + 160) = v54[144];
  long long v40 = *(_OWORD *)&v54[64];
  *(_OWORD *)(v38 + 64) = *(_OWORD *)&v54[48];
  *(_OWORD *)(v38 + 80) = v40;
  long long v41 = *(_OWORD *)&v54[96];
  *(_OWORD *)(v38 + 96) = *(_OWORD *)&v54[80];
  *(_OWORD *)(v38 + 112) = v41;
  long long v42 = *(_OWORD *)v54;
  *(_OWORD *)uint64_t v38 = v53;
  *(_OWORD *)(v38 + 16) = v42;
  long long v43 = *(_OWORD *)&v54[32];
  *(_OWORD *)(v38 + 32) = *(_OWORD *)&v54[16];
  *(_OWORD *)(v38 + 48) = v43;
  sub_10003CFD8((uint64_t)&v53);
  sub_100005FA8((uint64_t)v18, &qword_10006AA68);
  long long v62 = v51[5];
  long long v63 = v51[6];
  long long v64 = v51[7];
  long long v65 = v51[8];
  long long v58 = v51[1];
  long long v59 = v51[2];
  long long v60 = v51[3];
  long long v61 = v51[4];
  v55[0] = v34;
  v55[1] = 0;
  char v56 = 0;
  long long v57 = v51[0];
  sub_10003D0D8((uint64_t)v55);
  return sub_100005FA8(v35, &qword_10006AA68);
}

uint64_t sub_10003A4FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100055880();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(a1 + *(int *)(type metadata accessor for MostUsedItemNoContentView(0) + 20)))
  {
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v8 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v44 = 0;
    int v43 = 0;
  }
  else
  {
    sub_100055310();
    uint64_t v9 = sub_100055530();
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    char v15 = v14 & 1;
    sub_10005228C((uint64_t)v7);
    sub_100037780(1, v9, v11, v13, (uint64_t)&v56);
    sub_10000AB4C(v9, v11, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v8 = v58;
    uint64_t v49 = v59;
    uint64_t v50 = v56;
    uint64_t v47 = v61;
    uint64_t v48 = v60;
    uint64_t v45 = v57;
    uint64_t v46 = v62;
    uint64_t v44 = v63;
    int v43 = v64;
  }
  uint64_t v16 = v4;
  sub_100055310();
  uint64_t v17 = sub_100055530();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  char v23 = v22 & 1;
  sub_10005228C((uint64_t)v7);
  sub_100037780(0, v17, v19, v21, (uint64_t)&v56);
  sub_10000AB4C(v17, v19, v23);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  uint64_t v24 = v56;
  uint64_t v25 = v57;
  LOBYTE(v21) = v58;
  uint64_t v26 = v59;
  uint64_t v27 = v60;
  uint64_t v42 = v59;
  unsigned __int8 v28 = v61;
  uint64_t v30 = v62;
  uint64_t v29 = v63;
  unsigned __int8 v31 = v64;
  unsigned __int8 v54 = v58;
  unsigned __int8 v51 = v64;
  *(_DWORD *)(a2 + 65) = v55[0];
  *(_DWORD *)(a2 + 68) = *(_DWORD *)((char *)v55 + 3);
  *(_DWORD *)(a2 + 89) = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 92) = *(_DWORD *)&v53[3];
  int v32 = *(_DWORD *)v52;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v52[3];
  *(_DWORD *)(a2 + 113) = v32;
  uint64_t v33 = v50;
  uint64_t v34 = v44;
  uint64_t v35 = v45;
  *(void *)a2 = v50;
  *(void *)(a2 + 8) = v35;
  uint64_t v36 = v49;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = v36;
  uint64_t v37 = v36;
  uint64_t v49 = v36;
  uint64_t v38 = v48;
  *(void *)(a2 + 32) = v48;
  uint64_t v48 = v38;
  uint64_t v39 = v47;
  *(void *)(a2 + 40) = v47;
  uint64_t v47 = v39;
  uint64_t v40 = v46;
  *(void *)(a2 + 48) = v46;
  *(void *)(a2 + 56) = v34;
  uint64_t v46 = v40;
  *(unsigned char *)(a2 + 64) = v43;
  *(void *)(a2 + 72) = v24;
  *(void *)(a2 + 80) = v25;
  *(unsigned char *)(a2 + 88) = v21;
  *(void *)(a2 + 96) = v26;
  *(void *)(a2 + 104) = v27;
  *(unsigned char *)(a2 + 112) = v28;
  *(void *)(a2 + 120) = v30;
  *(void *)(a2 + 128) = v29;
  *(unsigned char *)(a2 + 136) = v31;
  sub_10003D074(v33, v35, v8, v37);
  sub_10000C29C(v24, v25, v21);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_10000AB4C(v24, v25, v21);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_10003D174(v50, v35, v8, v49);
}

uint64_t sub_10003A8DC()
{
  uint64_t v1 = sub_100005EB4(&qword_10006AAA0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v3 = sub_100055300();
  *((void *)v3 + 1) = 0x4028000000000000;
  v3[16] = 0;
  uint64_t v4 = sub_100005EB4(&qword_10006AAA8);
  sub_10003A08C(v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  sub_10000D120(&qword_10006AAB0, &qword_10006AAA0);
  sub_1000555F0();
  return sub_100005FA8((uint64_t)v3, &qword_10006AAA0);
}

unint64_t sub_10003A9D8()
{
  unint64_t result = qword_10006A708;
  if (!qword_10006A708)
  {
    sub_100007D80(&qword_10006A6F8);
    sub_100007D80(&qword_10006A710);
    sub_10003AAB8();
    swift_getOpaqueTypeConformance2();
    sub_10003ABB4((unint64_t *)&qword_100069C88, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A708);
  }
  return result;
}

unint64_t sub_10003AAB8()
{
  unint64_t result = qword_10006A718;
  if (!qword_10006A718)
  {
    sub_100007D80(&qword_10006A710);
    sub_10003ABB4(&qword_10006A720, (void (*)(uint64_t))type metadata accessor for MostUsedItemCell);
    sub_10003ABB4((unint64_t *)&qword_100069C88, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A718);
  }
  return result;
}

uint64_t type metadata accessor for MostUsedItemCell(uint64_t a1)
{
  return sub_10003CD80(a1, (uint64_t *)&unk_10006A910);
}

uint64_t sub_10003ABB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10003AC08(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  swift_bridgeObjectRetain();
  id v4 = v2;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_10003AC54()
{
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_10003AC64(uint64_t a1)
{
  return sub_100038384(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

unint64_t sub_10003AC70()
{
  unint64_t result = qword_10006A768;
  if (!qword_10006A768)
  {
    sub_100007D80(&qword_10006A760);
    sub_10003AD1C();
    sub_10003ABB4(&qword_10006A778, (void (*)(uint64_t))type metadata accessor for MostUsedItemNoContentView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A768);
  }
  return result;
}

unint64_t sub_10003AD1C()
{
  unint64_t result = qword_10006A770;
  if (!qword_10006A770)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A770);
  }
  return result;
}

uint64_t type metadata accessor for MostUsedItemNoContentView(uint64_t a1)
{
  return sub_10003CD80(a1, qword_10006A880);
}

uint64_t sub_10003AD90(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003ADF0()
{
  return sub_100035650();
}

uint64_t sub_10003ADF8()
{
  return sub_10003C840(&qword_10006A7C0, &qword_10006A7C8, (void (*)(void))sub_10003A9D8);
}

uint64_t sub_10003AE28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003AE90()
{
  uint64_t v1 = *(void *)(type metadata accessor for MostUsedItemsPlaceholderView(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

double sub_10003AF94@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for MostUsedItemsPlaceholderView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100038860(v4, a1);
}

unint64_t sub_10003B014()
{
  unint64_t result = qword_10006A808;
  if (!qword_10006A808)
  {
    sub_100007D80(&qword_10006A800);
    sub_10000D120(&qword_10006A810, &qword_10006A818);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A808);
  }
  return result;
}

void *sub_10003B0B4(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

void *sub_10003B1D0(void *a1, void *a2, uint64_t a3)
{
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100055880();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_10003B29C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_10003B380(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_100055880();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

void *sub_10003B454(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_100069C90);
    uint64_t v6 = sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100055880();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10003B540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003B554);
}

uint64_t sub_10003B554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_100069C98);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_10003B628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003B63C);
}

uint64_t sub_10003B63C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005EB4(&qword_100069C98);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

void sub_10003B6FC()
{
  sub_10003DA3C(319, (unint64_t *)&qword_100069D08, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for MostUsedItemPlaceholderView(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for MostUsedItemPlaceholderView(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x10003B918);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MostUsedItemPlaceholderView()
{
  return &type metadata for MostUsedItemPlaceholderView;
}

uint64_t *sub_10003B950(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100005EB4(&qword_10006A740);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000558C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    unsigned int v10 = (uint64_t *)((char *)a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *unsigned int v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    char v15 = (char *)a1 + v13;
    uint64_t v16 = (char *)a2 + v13;
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)char v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = (void *)*((void *)v16 + 2);
    uint64_t v19 = (void *)*((void *)v16 + 3);
    *((void *)v15 + 2) = v18;
    *((void *)v15 + 3) = v19;
    *((_OWORD *)v15 + 2) = *((_OWORD *)v16 + 2);
    *((void *)v15 + 6) = *((void *)v16 + 6);
    *(uint64_t *)((char *)a1 + v14) = *(uint64_t *)((char *)a2 + v14);
    swift_bridgeObjectRetain();
    id v20 = v18;
    id v21 = v19;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_10003BB48(uint64_t a1, uint64_t a2)
{
  sub_100005EB4(&qword_10006A740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000558C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *sub_10003BC78(void *a1, void *a2, int *a3)
{
  sub_100005EB4(&qword_10006A740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000558C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_100055880();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    void *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  uint64_t v16 = (void *)*((void *)v14 + 2);
  uint64_t v17 = (void *)*((void *)v14 + 3);
  *((void *)v13 + 2) = v16;
  *((void *)v13 + 3) = v17;
  *((_OWORD *)v13 + 2) = *((_OWORD *)v14 + 2);
  *((void *)v13 + 6) = *((void *)v14 + 6);
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_bridgeObjectRetain();
  id v18 = v16;
  id v19 = v17;
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_10003BE20(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_10006A740);
    sub_100005EB4(&qword_10006A740);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000558C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100005FA8((uint64_t)a1 + v7, &qword_100069C90);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      void *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *uint64_t v12 = *(void *)((char *)a2 + v11);
  v12[1] = *(void *)((char *)a2 + v11 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)v13[2];
  uint64_t v15 = (void *)v12[2];
  void v12[2] = v14;
  id v16 = v14;

  uint64_t v17 = (void *)v13[3];
  id v18 = (void *)v12[3];
  uint64_t v12[3] = v17;
  id v19 = v17;

  v12[4] = v13[4];
  v12[5] = v13[5];
  v12[6] = v13[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  return a1;
}

char *sub_10003C030(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100005EB4(&qword_10006A740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000558C0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_100055880();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  id v16 = &a2[v13];
  long long v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  *((_OWORD *)v15 + 2) = *((_OWORD *)v16 + 2);
  *((void *)v15 + 6) = *((void *)v16 + 6);
  *(void *)&a1[v14] = *(void *)&a2[v14];
  return a1;
}

char *sub_10003C1CC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_10006A740);
    uint64_t v6 = sub_100005EB4(&qword_10006A740);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000558C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_100005FA8((uint64_t)&a1[v8], &qword_100069C90);
    uint64_t v11 = sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_100055880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *(void *)&a2[v13 + 8];
  *(void *)uint64_t v14 = *(void *)&a2[v13];
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  long long v17 = (void *)*((void *)v14 + 2);
  *((void *)v14 + 2) = *((void *)v15 + 2);

  id v18 = (void *)*((void *)v14 + 3);
  *((void *)v14 + 3) = *((void *)v15 + 3);

  *((void *)v14 + 4) = *((void *)v15 + 4);
  uint64_t v19 = *((void *)v15 + 6);
  *((void *)v14 + 5) = *((void *)v15 + 5);
  *((void *)v14 + 6) = v19;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

uint64_t sub_10003C3C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003C3D8);
}

uint64_t sub_10003C3D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_10006A730);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100005EB4(&qword_100069C98);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_10003C4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003C50C);
}

uint64_t sub_10003C50C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100005EB4(&qword_10006A730);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100005EB4(&qword_100069C98);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_10003C628()
{
  sub_10003DA3C(319, (unint64_t *)&unk_10006A920, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
  if (v0 <= 0x3F)
  {
    sub_10003DA3C(319, (unint64_t *)&qword_100069D08, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

__n128 initializeBufferWithCopyOfBuffer for MostUsedItemsPlaceholderRowView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for MostUsedItemsPlaceholderRowView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MostUsedItemsPlaceholderRowView(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(unsigned char *)(result + 16) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MostUsedItemsPlaceholderRowView()
{
  return &type metadata for MostUsedItemsPlaceholderRowView;
}

uint64_t sub_10003C7FC()
{
  return sub_10003C840(&qword_10006A958, &qword_10006A728, (void (*)(void))sub_10003C8BC);
}

uint64_t sub_10003C840(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007D80(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10003C8BC()
{
  return sub_10003C840(&qword_10006A960, &qword_10006A6E0, (void (*)(void))sub_10003C8EC);
}

unint64_t sub_10003C8EC()
{
  unint64_t result = qword_10006A968;
  if (!qword_10006A968)
  {
    sub_100007D80(&qword_10006A6D8);
    sub_10000D120(&qword_10006A970, &qword_10006A6D0);
    sub_10000D120(&qword_10006A978, &qword_10006A980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A968);
  }
  return result;
}

uint64_t sub_10003C9B0()
{
  return sub_10003C840(&qword_10006A988, &qword_10006A780, (void (*)(void))sub_10003C9F4);
}

unint64_t sub_10003C9F4()
{
  unint64_t result = qword_10006A990;
  if (!qword_10006A990)
  {
    sub_100007D80(&qword_10006A750);
    sub_10000D120(&qword_10006A998, &qword_10006A748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A990);
  }
  return result;
}

unint64_t sub_10003CA98()
{
  unint64_t result = qword_10006A9A0;
  if (!qword_10006A9A0)
  {
    sub_100007D80(&qword_10006A7D0);
    sub_10003C840(&qword_10006A9A8, &qword_10006A7A0, (void (*)(void))sub_10003CB64);
    sub_10000D120(&qword_10006A9C0, &qword_10006A7D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A9A0);
  }
  return result;
}

unint64_t sub_10003CB64()
{
  unint64_t result = qword_10006A9B0;
  if (!qword_10006A9B0)
  {
    sub_100007D80(&qword_10006A798);
    sub_10000D120(&qword_10006A9B8, &qword_10006A790);
    sub_10000D120(&qword_10006A978, &qword_10006A980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A9B0);
  }
  return result;
}

unint64_t sub_10003CC2C()
{
  unint64_t result = qword_10006A9C8;
  if (!qword_10006A9C8)
  {
    sub_100007D80(&qword_10006A7F0);
    sub_10000D120(&qword_10006A9D0, &qword_10006A9D8);
    sub_10000D120(&qword_10006A9C0, &qword_10006A7D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A9C8);
  }
  return result;
}

uint64_t sub_10003CCF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003CD0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003CD28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003CD44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for AppIcon(uint64_t a1)
{
  return sub_10003CD80(a1, (uint64_t *)&unk_10006AB20);
}

uint64_t sub_10003CD80(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003CDC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10003CE28()
{
  unint64_t result = qword_10006AA20;
  if (!qword_10006AA20)
  {
    sub_100007D80(&qword_10006AA18);
    sub_10003CEC8();
    sub_10000D120(&qword_100069B50, &qword_100069B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AA20);
  }
  return result;
}

unint64_t sub_10003CEC8()
{
  unint64_t result = qword_10006AA28;
  if (!qword_10006AA28)
  {
    sub_100007D80(&qword_10006AA30);
    sub_10000D120(&qword_10006AA38, &qword_10006AA40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AA28);
  }
  return result;
}

uint64_t sub_10003CF68@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1000551F0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10003CF98()
{
  return sub_100055200();
}

uint64_t sub_10003CFD8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_10003D074(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  sub_10000C29C(v2, v3, v4);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_10003D074(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000C29C(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10003D0D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 104);
  char v4 = *(unsigned char *)(a1 + 112);
  sub_10003D174(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  sub_10000AB4C(v2, v3, v4);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10003D174(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_10000AB4C(result, a2, a3 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10003D1D8()
{
  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_10003D1E8(uint64_t a1)
{
  return sub_100038E24(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32));
}

uint64_t *sub_10003D1F4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    sub_100005EB4(&qword_10006A9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000550E0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v10 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v10;
    uint64_t v11 = a3[7];
    uint64_t v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v12;
    id v13 = v10;
    id v14 = v12;
  }
  return a1;
}

void sub_10003D32C(uint64_t a1, uint64_t a2)
{
  sub_100005EB4(&qword_10006A9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1000550E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  int v5 = *(void **)(a1 + *(int *)(a2 + 28));
}

void *sub_10003D3D8(void *a1, void *a2, int *a3)
{
  sub_100005EB4(&qword_10006A9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1000550E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  uint64_t v8 = *(void **)((char *)a2 + v7);
  *(void *)((char *)a1 + v7) = v8;
  uint64_t v9 = a3[7];
  uint64_t v10 = *(void **)((char *)a2 + v9);
  *(void *)((char *)a1 + v9) = v10;
  id v11 = v8;
  id v12 = v10;
  return a1;
}

void *sub_10003D4C0(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_10006A9F0);
    sub_100005EB4(&qword_10006A9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1000550E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = *(void **)((char *)a2 + v7);
  uint64_t v9 = *(void **)((char *)a1 + v7);
  *(void *)((char *)a1 + v7) = v8;
  id v10 = v8;

  uint64_t v11 = a3[7];
  id v12 = *(void **)((char *)a2 + v11);
  id v13 = *(void **)((char *)a1 + v11);
  *(void *)((char *)a1 + v11) = v12;
  id v14 = v12;

  return a1;
}

char *sub_10003D5D4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_100005EB4(&qword_10006A9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1000550E0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *sub_10003D6BC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_100005FA8((uint64_t)a1, &qword_10006A9F0);
    uint64_t v6 = sub_100005EB4(&qword_10006A9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1000550E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = *(void **)&a1[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];

  uint64_t v10 = a3[7];
  uint64_t v11 = *(void **)&a1[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];

  return a1;
}

uint64_t sub_10003D7CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003D7E0);
}

uint64_t sub_10003D7E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100005EB4(&qword_10006AAC0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10003D8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10003D8B8);
}

uint64_t sub_10003D8B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100005EB4(&qword_10006AAC0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_10003D978()
{
  sub_10003DA3C(319, (unint64_t *)&unk_10006AB30, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10003DA3C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1000550F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10003DA90()
{
  return sub_10000D120(&qword_10006AB68, &qword_10006AB70);
}

uint64_t sub_10003DACC()
{
  return sub_10000D120(&qword_10006AB78, &qword_10006AB80);
}

unint64_t sub_10003DB0C()
{
  unint64_t result = qword_10006AB88;
  if (!qword_10006AB88)
  {
    sub_100007D80(&qword_10006AB90);
    sub_10000D120(&qword_10006AAB0, &qword_10006AAA0);
    sub_10003ABB4((unint64_t *)&qword_100069C88, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AB88);
  }
  return result;
}

uint64_t sub_10003DBDC()
{
  return sub_10003DC18(&qword_10006AB98, &qword_10006ABA0, (void (*)(void))sub_10003AC70);
}

uint64_t sub_10003DC18(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007D80(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10003DC90()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10003DCAC()
{
  unint64_t result = qword_10006ABD0;
  if (!qword_10006ABD0)
  {
    sub_100007D80(&qword_10006ABC0);
    sub_10003DD28();
    sub_10003DDBC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006ABD0);
  }
  return result;
}

unint64_t sub_10003DD28()
{
  unint64_t result = qword_10006ABD8;
  if (!qword_10006ABD8)
  {
    sub_100007D80(&qword_10006ABB8);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006ABD8);
  }
  return result;
}

unint64_t sub_10003DDBC()
{
  unint64_t result = qword_10006ABE0;
  if (!qword_10006ABE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006ABE0);
  }
  return result;
}

uint64_t sub_10003DE10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10003DE6C()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006ABF0);
  sub_1000096F4(v0, (uint64_t)qword_10006ABF0);
  return sub_100054E90();
}

uint64_t sub_10003DEF0()
{
  type metadata accessor for XPCPersistentStoreManager();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_10003DF2C();
  qword_10006D138 = v0;
  return result;
}

uint64_t sub_10003DF2C()
{
  uint64_t v1 = v0;
  uint64_t v2 = self;
  id v3 = [v2 managedObjectModel];
  id v4 = objc_allocWithZone((Class)NSPersistentContainer);
  NSString v5 = sub_100055A00();
  id v6 = [v4 initWithName:v5 managedObjectModel:v3];

  *(void *)(v1 + 16) = v6;
  *(unsigned char *)(v1 + 24) = 0;
  *(void *)(v1 + 32) = [objc_allocWithZone((Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory()) init];
  id v7 = [v2 localPersistentXPCStoreDescription];
  uint64_t v8 = sub_100054E30();
  v16[3] = v8;
  v16[4] = sub_10003EBA8();
  uint64_t v9 = sub_10003EC00(v16);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v8 - 8) + 104))(v9, enum case for ScreenTimeFeatureFlags.simplifiedAgent(_:), v8);
  LOBYTE(v8) = sub_100054CF0();
  sub_10001E980((uint64_t)v16);
  if (v8) {
    [v7 setOption:*(void *)(v1 + 32) forKey:NSXPCStoreServerEndpointFactoryKey];
  }
  unint64_t v10 = *(void **)(v1 + 16);
  sub_100005EB4((uint64_t *)&unk_10006ADA0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100057DC0;
  *(void *)(v11 + 32) = v7;
  v16[0] = v11;
  sub_100055B70();
  sub_10003EB48();
  id v12 = v10;
  id v13 = v7;
  Class isa = sub_100055B50().super.isa;
  swift_bridgeObjectRelease();
  [v12 setPersistentStoreDescriptions:isa];

  return v1;
}

void sub_10003E140()
{
  if ((*(unsigned char *)(v0 + 24) & 1) == 0)
  {
    uint64_t v1 = *(void **)(v0 + 16);
    id v2 = [v1 persistentStoreDescriptions];
    sub_10003EB48();
    unint64_t v3 = sub_100055B60();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_100055F30();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v4)
    {
      aBlock[4] = sub_10003EB88;
      aBlock[5] = v0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10003E630;
      aBlock[3] = &unk_1000670A0;
      NSString v5 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v1 loadPersistentStoresWithCompletionHandler:v5];
      _Block_release(v5);
      if (*(unsigned char *)(v0 + 24) == 1)
      {
        if (qword_100069910 != -1) {
          swift_once();
        }
        uint64_t v6 = sub_100054EA0();
        sub_1000096F4(v6, (uint64_t)qword_10006ABF0);
        id v7 = sub_100054E80();
        os_log_type_t v8 = sub_100055CB0();
        if (os_log_type_enabled(v7, v8))
        {
          uint64_t v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "Successfully loaded persistent stores", v9, 2u);
          swift_slowDealloc();
        }
      }
    }
    else
    {
      *(unsigned char *)(v0 + 24) = 0;
      if (qword_100069910 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_100054EA0();
      sub_1000096F4(v10, (uint64_t)qword_10006ABF0);
      oslog = sub_100054E80();
      os_log_type_t v11 = sub_100055C90();
      if (os_log_type_enabled(oslog, v11))
      {
        id v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v11, "No persistent stores available to load", v12, 2u);
        swift_slowDealloc();
      }
    }
  }
}

void sub_10003E428(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    *(unsigned char *)(a3 + 24) = 0;
    swift_errorRetain();
    if (qword_100069910 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100054EA0();
    sub_1000096F4(v3, (uint64_t)qword_10006ABF0);
    swift_errorRetain();
    swift_errorRetain();
    oslog = sub_100054E80();
    os_log_type_t v4 = sub_100055C90();
    if (os_log_type_enabled(oslog, v4))
    {
      NSString v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v6 = (void *)swift_slowAlloc();
      *(_DWORD *)NSString v5 = 138412290;
      swift_errorRetain();
      uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
      sub_100055D70();
      *uint64_t v6 = v8;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Failed to load persistent store: %@", v5, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 1;
  }
}

void sub_10003E630(uint64_t a1, void *a2, void *a3)
{
  NSString v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(v7, a3);
  swift_release();
}

uint64_t sub_10003E6BC(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_10003E6EC()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for XPCPersistentStoreManager()
{
  return self;
}

id sub_10003E794()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STWidgetXPCStoreServerEndpointFactory();
  return [super dealloc];
}

uint64_t type metadata accessor for STWidgetXPCStoreServerEndpointFactory()
{
  return self;
}

uint64_t sub_10003E7EC(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

unint64_t sub_10003EB48()
{
  unint64_t result = qword_10006AD90;
  if (!qword_10006AD90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006AD90);
  }
  return result;
}

void sub_10003EB88(uint64_t a1, uint64_t a2)
{
  sub_10003E428(a1, a2, v2);
}

uint64_t sub_10003EB90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003EBA0()
{
  return swift_release();
}

unint64_t sub_10003EBA8()
{
  unint64_t result = qword_10006AD98;
  if (!qword_10006AD98)
  {
    sub_100054E30();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AD98);
  }
  return result;
}

uint64_t *sub_10003EC00(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10003EC64()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006AE10);
  sub_1000096F4(v0, (uint64_t)qword_10006AE10);
  return sub_100054E90();
}

uint64_t sub_10003ECDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v42 = sub_100005EB4(&qword_10006AE48);
  __chkstk_darwin(v42);
  unsigned __int8 v51 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100005EB4(&qword_10006AE88);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005EB4(&qword_100069C98);
  __chkstk_darwin(v7 - 8);
  uint64_t v49 = (uint64_t *)((char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = sub_100005EB4(&qword_10006A730);
  __chkstk_darwin(v9 - 8);
  uint64_t v47 = (uint64_t *)((char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_100005EB4(&qword_10006AAC0);
  __chkstk_darwin(v11 - 8);
  uint64_t v46 = (uint64_t *)((char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = type metadata accessor for UsageTimelineEntry();
  __chkstk_darwin(v48);
  id v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (int *)type metadata accessor for WidgetView();
  __chkstk_darwin(v15);
  long long v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100005EB4(&qword_10006AE40);
  uint64_t v44 = *(void *)(v18 - 8);
  uint64_t v45 = v18;
  __chkstk_darwin(v18);
  uint64_t v50 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100069920 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_100054EA0();
  sub_1000096F4(v20, (uint64_t)qword_10006AE10);
  id v21 = sub_100054E80();
  os_log_type_t v22 = sub_100055CB0();
  if (os_log_type_enabled(v21, v22))
  {
    char v23 = (uint8_t *)swift_slowAlloc();
    long long v41 = v15;
    *(_WORD *)char v23 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Getting widget body", v23, 2u);
    uint64_t v15 = v41;
    swift_slowDealloc();
  }

  sub_1000400E0(a1, (uint64_t)v14);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = (uint64_t)v46;
  *uint64_t v46 = KeyPath;
  sub_100005EB4(&qword_10006A9F0);
  swift_storeEnumTagMultiPayload();
  uint64_t v26 = swift_getKeyPath();
  uint64_t v27 = (uint64_t)v47;
  *uint64_t v47 = v26;
  sub_100005EB4(&qword_10006A740);
  swift_storeEnumTagMultiPayload();
  uint64_t v28 = swift_getKeyPath();
  uint64_t v29 = (uint64_t)v49;
  *uint64_t v49 = v28;
  sub_100005EB4(&qword_100069C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v30 = swift_getKeyPath();
  *(void *)&v17[v15[9]] = swift_getKeyPath();
  sub_100005EB4(&qword_10006AE90);
  swift_storeEnumTagMultiPayload();
  sub_100040538((uint64_t)v14, (uint64_t)v17);
  sub_10000D080(v25, (uint64_t)&v17[v15[5]], &qword_10006AAC0);
  sub_10000D080(v27, (uint64_t)&v17[v15[6]], &qword_10006A730);
  sub_10000D080(v29, (uint64_t)&v17[v15[7]], &qword_100069C98);
  unsigned __int8 v31 = &v17[v15[8]];
  *(void *)unsigned __int8 v31 = v30;
  v31[8] = 0;
  sub_10003FA58(*(unsigned char *)(a1 + *(int *)(v48 + 48)), *(void *)(a1 + *(int *)(v48 + 32)), *(void *)(a1 + *(int *)(v48 + 32) + 8), (uint64_t)v6);
  uint64_t v32 = sub_100054B00();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v6, 0, 1, v32);
  uint64_t v33 = sub_100040608(&qword_10006AE50, (void (*)(uint64_t))type metadata accessor for WidgetView);
  sub_1000555B0();
  sub_100005FA8((uint64_t)v6, &qword_10006AE88);
  sub_10004059C((uint64_t)v17);
  uint64_t v34 = enum case for DynamicTypeSize.xxLarge(_:);
  uint64_t v35 = sub_100055120();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v35 - 8) + 104))(v51, v34, v35);
  sub_100040608(&qword_10006AE98, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
  uint64_t result = sub_1000559D0();
  if (result)
  {
    char v52 = v15;
    uint64_t v53 = v33;
    swift_getOpaqueTypeConformance2();
    sub_10000D120(&qword_10006AE58, &qword_10006AE48);
    uint64_t v37 = v50;
    uint64_t v38 = (uint64_t)v51;
    uint64_t v39 = v45;
    sub_100055620();
    sub_100005FA8(v38, &qword_10006AE48);
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v37, v39);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10003F3C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_100005EB4(&qword_10006AE68);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v32 = v1;
  uint64_t v33 = v2;
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100005EB4(&qword_10006AE70);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  uint64_t v35 = v6;
  __chkstk_darwin(v5);
  unsigned __int8 v31 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100055310();
  uint64_t v8 = sub_100055530();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  uint64_t v13 = sub_100005EB4(&qword_10006AE30);
  uint64_t v14 = sub_10000D120(&qword_10006AE78, &qword_10006AE30);
  sub_100055390();
  sub_10000AB4C(v8, v10, v12);
  swift_bridgeObjectRelease();
  sub_100005EB4(&qword_10006AE80);
  uint64_t v15 = sub_1000558C0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void *)(v16 + 72);
  unint64_t v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_100057E90;
  unint64_t v20 = v19 + v18;
  id v21 = *(void (**)(unint64_t, void, uint64_t))(v16 + 104);
  v21(v20, enum case for WidgetFamily.systemSmall(_:), v15);
  v21(v20 + v17, enum case for WidgetFamily.systemMedium(_:), v15);
  v21(v20 + 2 * v17, enum case for WidgetFamily.systemLarge(_:), v15);
  uint64_t v37 = v13;
  uint64_t v38 = v14;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v24 = v31;
  uint64_t v23 = v32;
  sub_100055380();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v23);
  sub_100055310();
  uint64_t v25 = sub_100055530();
  uint64_t v27 = v26;
  LOBYTE(v13) = v28 & 1;
  uint64_t v37 = v23;
  uint64_t v38 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v34;
  sub_100055370();
  sub_10000AB4C(v25, v27, v13);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v24, v29);
}

uint64_t sub_10003F818@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100005EB4(&qword_10006AE30);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for STSelectUserIntent();
  sub_100005EB4(&qword_10006AE38);
  uint64_t v6 = sub_100007D80(&qword_10006AE40);
  uint64_t v7 = sub_100007D80(&qword_10006AE48);
  uint64_t v8 = type metadata accessor for WidgetView();
  uint64_t v9 = sub_100040608(&qword_10006AE50, (void (*)(uint64_t))type metadata accessor for WidgetView);
  uint64_t v13 = v8;
  uint64_t v14 = v9;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v11 = sub_10000D120(&qword_10006AE58, &qword_10006AE48);
  uint64_t v13 = v6;
  uint64_t v14 = v7;
  uint64_t v15 = OpaqueTypeConformance2;
  uint64_t v16 = v11;
  swift_getOpaqueTypeConformance2();
  sub_10004008C();
  sub_1000558E0();
  sub_10003F3C4(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_10003FA58(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v8 = [objc_allocWithZone((Class)NSProcessInfo) init];
  if ([v8 isiOSAppOnMac])
  {

LABEL_4:
    sub_10003FC94(a2, a3, a4);
    return;
  }
  unsigned int v9 = [v8 isMacCatalystApp];

  if (v9) {
    goto LABEL_4;
  }
  if (a3 && (a1 & 1) != 0)
  {
    NSString v10 = sub_100055A00();
    uint64_t v11 = objc_opt_new();
    [v11 setScheme:STPrefsURLComponentScheme];
    [v11 setFragment:STPrefsURLComponentFragmentDay];
    id v12 = v11;
    id v13 = objc_alloc((Class)NSString);
    id v14 = [v13 initWithFormat:@"%@&path=CHILD_%@/SCREEN_TIME_SUMMARY", STPrefsURLComponentPathScreenTimeRoot, v10];
    [v12 setPath:v14];

    uint64_t v15 = [v12 URL];

    id v19 = v15;
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    [v16 setScheme:STPrefsURLComponentScheme];
    [v16 setFragment:STPrefsURLComponentFragmentDay];
    id v17 = v16;
    [v17 setPath:STPrefsURLComponentPathScreenTimeSummary];
    unint64_t v18 = [v17 URL];

    id v19 = v18;
  }
  sub_100054AF0();
}

uint64_t sub_10003FC94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100054B00();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unsigned int v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100005EB4(&qword_10006AE88);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = [objc_allocWithZone((Class)NSURLComponents) init];
  NSString v14 = sub_100055A00();
  [v13 setScheme:v14];

  NSString v15 = sub_100055A00();
  [v13 setPath:v15];

  if (a2)
  {
    sub_100005EB4(&qword_10006A0B8);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_100056C20;
    *(void *)(v16 + 56) = &type metadata for String;
    *(void *)(v16 + 64) = sub_10001C7B4();
    *(void *)(v16 + 32) = a1;
    *(void *)(v16 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_100055A20();
    NSString v17 = sub_100055A00();
    swift_bridgeObjectRelease();
    [v13 setQuery:v17];
  }
  id v18 = [v13 URL];
  if (v18)
  {
    id v19 = v18;
    sub_100054AF0();

    unint64_t v20 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v20(v12, v9, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6);
    if (result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v20)(a3, v12, v6);
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  __break(1u);
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  if (qword_100069918 != -1) {
    swift_once();
  }
  sub_10003E140();
  sub_10004000C();
  sub_1000556F0();
  return 0;
}

unint64_t sub_10004000C()
{
  unint64_t result = qword_10006AE28;
  if (!qword_10006AE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AE28);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScreenTimeConfigurableWidget()
{
  return &type metadata for ScreenTimeConfigurableWidget;
}

uint64_t sub_100040070()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10004008C()
{
  unint64_t result = qword_10006AE60;
  if (!qword_10006AE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006AE60);
  }
  return result;
}

uint64_t sub_1000400E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UsageTimelineEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100040144()
{
  return sub_100055280();
}

uint64_t sub_100040168()
{
  return sub_100055290();
}

uint64_t sub_10004018C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100040428(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_1000401B8()
{
  return sub_1000551B0();
}

uint64_t sub_1000401DC()
{
  return sub_1000551B0();
}

uint64_t sub_100040200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100040428(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_10004022C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100040428(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for ColorScheme, (uint64_t (*)(char *))&EnvironmentValues.colorScheme.setter);
}

uint64_t sub_10004026C()
{
  return sub_100055280();
}

uint64_t sub_100040290()
{
  return sub_100055290();
}

uint64_t sub_1000402B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100040428(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for WidgetRenderingMode, (uint64_t (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

uint64_t sub_1000402F4()
{
  sub_100055270();
  sub_100040608(&qword_10006AEA0, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  sub_1000552E0();
  return v1;
}

uint64_t sub_100040370@<X0>(unsigned char *a1@<X8>)
{
  sub_100055270();
  sub_100040608(&qword_10006AEA0, (void (*)(uint64_t))&type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey);
  uint64_t result = sub_1000552E0();
  *a1 = v3;
  return result;
}

uint64_t sub_100040404()
{
  return sub_1000551C0();
}

uint64_t sub_100040428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  __chkstk_darwin();
  unsigned int v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1000404F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100040428(a1, a2, a3, a4, (void (*)(void))&type metadata accessor for DynamicTypeSize, (uint64_t (*)(char *))&EnvironmentValues.dynamicTypeSize.setter);
}

uint64_t sub_100040538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UsageTimelineEntry();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004059C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WidgetView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000405F8(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100040608(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100040650()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for UsageIntentTimelineProvider()
{
  return &type metadata for UsageIntentTimelineProvider;
}

unint64_t sub_100040754()
{
  unint64_t result = qword_10006AEC0[0];
  if (!qword_10006AEC0[0])
  {
    type metadata accessor for UsageTimelineEntry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10006AEC0);
  }
  return result;
}

uint64_t sub_1000407AC()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006AEA8);
  sub_1000096F4(v0, (uint64_t)qword_10006AEA8);
  return sub_100054E90();
}

uint64_t sub_100040830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  uint64_t v8 = sub_1000558C0();
  v7[10] = v8;
  v7[11] = *(void *)(v8 - 8);
  v7[12] = swift_task_alloc();
  type metadata accessor for UsageTimelineEntry();
  v7[13] = swift_task_alloc();
  return _swift_task_switch(sub_100040920, 0, 0);
}

uint64_t sub_100040920()
{
  unsigned __int8 v1 = *(void **)(v0 + 48);
  type metadata accessor for UsageProvider();
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 112) = inited;
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  id v3 = [v1 displayString];
  uint64_t v4 = sub_100055A10();
  uint64_t v6 = v5;

  *(void *)(v0 + 120) = v6;
  sub_100055940();
  double v8 = v7;
  double v10 = v9;
  id v11 = [v1 identifier];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100055A10();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  *(void *)(v0 + 128) = v15;
  id v16 = [*(id *)(v0 + 48) isRemote];
  if (v16)
  {
    NSString v17 = v16;
    char v18 = [v16 BOOLValue];
  }
  else
  {
    char v18 = 0;
  }
  sub_100055950();
  id v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v19;
  void *v19 = v0;
  v19[1] = sub_100040ADC;
  uint64_t v21 = *(void *)(v0 + 96);
  uint64_t v20 = *(void *)(v0 + 104);
  return sub_100043FC4(v20, v4, v6, v13, v15, v18, v21, v8, v10);
}

uint64_t sub_100040ADC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96);
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  uint64_t v3 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100040C90, 0, 0);
}

uint64_t sub_100040C90()
{
  if (qword_100069928 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100054EA0();
  sub_1000096F4(v1, (uint64_t)qword_10006AEA8);
  uint64_t v2 = sub_100054E80();
  os_log_type_t v3 = sub_100055CB0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "getSnapshot calling completion", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[13];
  uint64_t v6 = (void (*)(uint64_t))v0[8];

  v6(v5);
  double v7 = sub_100054E80();
  os_log_type_t v8 = sub_100055CB0();
  if (os_log_type_enabled(v7, v8))
  {
    double v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "getSnapshot done", v9, 2u);
    swift_slowDealloc();
  }
  uint64_t v10 = v0[13];

  sub_1000438C4(v10);
  swift_task_dealloc();
  swift_task_dealloc();
  id v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_100040E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100055BD0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100055BC0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100043774(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100055BA0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100040FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  uint64_t v8 = sub_100054C10();
  v7[10] = v8;
  v7[11] = *(void *)(v8 - 8);
  v7[12] = swift_task_alloc();
  sub_100055900();
  v7[13] = swift_task_alloc();
  uint64_t v9 = sub_100005EB4(&qword_10006AED8);
  v7[14] = v9;
  v7[15] = *(void *)(v9 - 8);
  v7[16] = swift_task_alloc();
  uint64_t v10 = sub_1000558C0();
  v7[17] = v10;
  v7[18] = *(void *)(v10 - 8);
  v7[19] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for UsageTimelineEntry();
  v7[20] = v11;
  v7[21] = *(void *)(v11 - 8);
  v7[22] = swift_task_alloc();
  return _swift_task_switch(sub_1000411FC, 0, 0);
}

uint64_t sub_1000411FC()
{
  uint64_t v1 = *(void **)(v0 + 48);
  type metadata accessor for UsageProvider();
  uint64_t inited = swift_initStackObject();
  *(void *)(v0 + 184) = inited;
  *(void *)(inited + 16) = 0;
  *(void *)(inited + 24) = 0;
  id v3 = [v1 displayString];
  uint64_t v4 = sub_100055A10();
  uint64_t v6 = v5;

  *(void *)(v0 + 192) = v6;
  sub_100055940();
  double v8 = v7;
  double v10 = v9;
  id v11 = [v1 identifier];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_100055A10();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  *(void *)(v0 + 200) = v15;
  id v16 = [*(id *)(v0 + 48) isRemote];
  if (v16)
  {
    NSString v17 = v16;
    char v18 = [v16 BOOLValue];
  }
  else
  {
    char v18 = 0;
  }
  sub_100055950();
  id v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v19;
  void *v19 = v0;
  v19[1] = sub_1000413BC;
  uint64_t v20 = *(void *)(v0 + 176);
  uint64_t v21 = *(void *)(v0 + 152);
  return sub_100043FC4(v20, v4, v6, v13, v15, v18, v21, v8, v10);
}

uint64_t sub_1000413BC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  uint64_t v3 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100041570, 0, 0);
}

uint64_t sub_100041570()
{
  if (qword_100069928 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100054EA0();
  sub_1000096F4(v1, (uint64_t)qword_10006AEA8);
  uint64_t v2 = sub_100054E80();
  os_log_type_t v3 = sub_100055CB0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "getTimeline calling completion", v4, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[21];
  uint64_t v6 = v0[22];
  uint64_t v8 = v0[15];
  uint64_t v7 = v0[16];
  uint64_t v21 = v0[14];
  uint64_t v9 = v0[11];
  uint64_t v10 = v0[12];
  uint64_t v11 = v0[10];
  uint64_t v20 = (void (*)(uint64_t))v0[8];

  sub_100005EB4(&qword_10006AEE8);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100056C20;
  sub_1000400E0(v6, v13 + v12);
  sub_100054BB0();
  sub_1000558F0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
  sub_100040754();
  sub_100055970();
  v20(v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v21);
  uint64_t v14 = sub_100054E80();
  os_log_type_t v15 = sub_100055CB0();
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "getTimeline done", v16, 2u);
    swift_slowDealloc();
  }
  uint64_t v17 = v0[22];

  sub_1000438C4(v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

void sub_100041834(unsigned char *a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v1 = sub_100054CD0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100054C10();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000558C0();
  uint64_t v39 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v40 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v43 = (char *)&v34 - v12;
  uint64_t v13 = sub_100054A10();
  uint64_t v35 = *(void *)(v13 - 8);
  uint64_t v36 = v13;
  __chkstk_darwin(v13);
  uint64_t v38 = (uint64_t)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(&qword_100069948);
  __chkstk_darwin(v15 - 8);
  uint64_t v42 = (uint64_t)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v17 - 8);
  uint64_t v41 = (uint64_t)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100069928 != -1) {
    swift_once();
  }
  uint64_t v19 = sub_100054EA0();
  sub_1000096F4(v19, (uint64_t)qword_10006AEA8);
  uint64_t v20 = sub_100054E80();
  os_log_type_t v21 = sub_100055CB0();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = v8;
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "placeholder called", v22, 2u);
    uint64_t v8 = v34;
    swift_slowDealloc();
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v41, 1, 1, v5);
  sub_100055940();
  double v24 = v23;
  double v26 = v25;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 56))(v42, 1, 1, v36);
  uint64_t v27 = v43;
  sub_100055950();
  sub_100054BF0();
  sub_100054C90();
  uint64_t v28 = v39;
  uint64_t v29 = v40;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v40, v27, v9);
  int v30 = (*(uint64_t (**)(char *, uint64_t))(v28 + 88))(v29, v9);
  uint64_t v31 = v38;
  if (v30 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v30 == enum case for WidgetFamily.systemMedium(_:))
    {
      uint64_t v32 = v38;
      uint64_t v33 = 15;
      goto LABEL_9;
    }
    if (v30 == enum case for WidgetFamily.systemLarge(_:) || v30 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      sub_100012DA0((uint64_t)v8, v38);
      goto LABEL_10;
    }
    if (v30 != enum case for WidgetFamily.accessoryCircular(_:)
      && v30 != enum case for WidgetFamily.accessoryRectangular(_:)
      && v30 != enum case for WidgetFamily.accessoryInline(_:))
    {
      sub_100012DA0((uint64_t)v8, v38);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v40, v9);
      goto LABEL_10;
    }
  }
  uint64_t v32 = v38;
  uint64_t v33 = 9;
LABEL_9:
  sub_10001AE50(v33, (uint64_t)v8, v32);
LABEL_10:
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v43, v9);
  sub_100005660(0, v41, 0, 0, 0, 0, v42, v31, v37, v24, v26, 0.0, (uint64_t)&_swiftEmptyArrayStorage, 0, (uint64_t)&_swiftEmptyArrayStorage, 0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0);
}

uint64_t sub_100041E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100043B54;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100041F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100043B54;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_100041FD4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000420B0;
  return v6(a1);
}

uint64_t sub_1000420B0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000421A8(void *a1, uint64_t a2, void (*a3)(unsigned char *), uint64_t a4)
{
  uint64_t v76 = a3;
  uint64_t v77 = a4;
  uint64_t v75 = a2;
  uint64_t v5 = sub_100054CD0();
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  __chkstk_darwin(v5);
  char v71 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100054C10();
  uint64_t v70 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  long long v68 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_1000558C0();
  uint64_t v67 = *(void *)(v69 - 8);
  uint64_t v8 = __chkstk_darwin(v69);
  uint64_t v73 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  long long v65 = (char *)&v59 - v10;
  uint64_t v11 = sub_100054A10();
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  __chkstk_darwin(v11);
  uint64_t v66 = (uint64_t)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005EB4(&qword_100069948);
  __chkstk_darwin(v13 - 8);
  unsigned __int8 v64 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v15 - 8);
  uint64_t v74 = (uint64_t)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for UsageTimelineEntry();
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100055960();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(void *)(v21 + 64);
  __chkstk_darwin(v20);
  double v23 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005EB4(&qword_10006AEE0);
  __chkstk_darwin(v24 - 8);
  double v26 = (char *)&v59 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100069928 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_100054EA0();
  uint64_t v61 = sub_1000096F4(v27, (uint64_t)qword_10006AEA8);
  uint64_t v28 = sub_100054E80();
  os_log_type_t v29 = sub_100055CB0();
  if (os_log_type_enabled(v28, v29))
  {
    int v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "getSnapshot called", v30, 2u);
    swift_slowDealloc();
  }

  id v31 = [a1 user];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = sub_100055BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v26, 1, 1, v33);
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v75, v20);
    unint64_t v34 = (*(unsigned __int8 *)(v21 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    uint64_t v35 = (char *)swift_allocObject();
    *((void *)v35 + 2) = 0;
    *((void *)v35 + 3) = 0;
    *((void *)v35 + 4) = v32;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(&v35[v34], v23, v20);
    uint64_t v36 = &v35[(v22 + v34 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v37 = v77;
    *(void *)uint64_t v36 = v76;
    *((void *)v36 + 1) = v37;
    swift_retain();
    sub_100040E50((uint64_t)v26, (uint64_t)&unk_10006AF18, (uint64_t)v35);
    return swift_release();
  }
  uint64_t v39 = sub_100054E80();
  os_log_type_t v40 = sub_100055C90();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to provide user. Returning placeholder", v41, 2u);
    swift_slowDealloc();
  }

  uint64_t v42 = v70;
  uint64_t v43 = v72;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v70 + 56))(v74, 1, 1, v72);
  sub_100055940();
  double v45 = v44;
  double v47 = v46;
  uint64_t v48 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v64, 1, 1, v63);
  uint64_t v49 = v65;
  sub_100055950();
  uint64_t v50 = (uint64_t)v68;
  sub_100054BF0();
  unsigned __int8 v51 = v71;
  sub_100054C90();
  uint64_t v52 = v67;
  uint64_t v53 = v73;
  uint64_t v54 = v69;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v73, v49, v69);
  int v55 = (*(uint64_t (**)(char *, uint64_t))(v52 + 88))(v53, v54);
  uint64_t v56 = v66;
  if (v55 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v55 == enum case for WidgetFamily.systemMedium(_:))
    {
      uint64_t v57 = v66;
      uint64_t v58 = 15;
      goto LABEL_13;
    }
    if (v55 == enum case for WidgetFamily.systemLarge(_:) || v55 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      sub_100012DA0(v50, v66);
      goto LABEL_14;
    }
    if (v55 != enum case for WidgetFamily.accessoryCircular(_:)
      && v55 != enum case for WidgetFamily.accessoryRectangular(_:)
      && v55 != enum case for WidgetFamily.accessoryInline(_:))
    {
      sub_100012DA0(v50, v66);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v73, v54);
      goto LABEL_14;
    }
  }
  uint64_t v57 = v66;
  uint64_t v58 = 9;
LABEL_13:
  sub_10001AE50(v58, v50, v57);
LABEL_14:
  (*(void (**)(char *, uint64_t))(v59 + 8))(v51, v60);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v50, v43);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v49, v54);
  sub_100005660(0, v74, 0, 0, 0, 0, v48, v56, v19, v45, v47, 0.0, (uint64_t)&_swiftEmptyArrayStorage, 0, (uint64_t)&_swiftEmptyArrayStorage, 0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0);
  v76(v19);
  return sub_1000438C4((uint64_t)v19);
}

uint64_t sub_100042A8C(void *a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v87 = a3;
  uint64_t v88 = a4;
  uint64_t v86 = a2;
  uint64_t v5 = sub_100055900();
  __chkstk_darwin(v5 - 8);
  uint64_t v82 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100054CD0();
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v78 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100054C10();
  uint64_t v80 = *(void *)(v8 - 8);
  uint64_t v81 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  id v79 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v76 = (char *)&v66 - v11;
  uint64_t v77 = sub_1000558C0();
  uint64_t v75 = *(void *)(v77 - 8);
  uint64_t v12 = __chkstk_darwin(v77);
  unint64_t v83 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v72 = (char *)&v66 - v14;
  uint64_t v15 = sub_100054A10();
  uint64_t v69 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v74 = (uint64_t)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100005EB4(&qword_100069948);
  __chkstk_darwin(v17 - 8);
  uint64_t v85 = (uint64_t)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100005EB4(&qword_100069950);
  __chkstk_darwin(v19 - 8);
  uint64_t v84 = (uint64_t)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100005EB4(&qword_10006AED8);
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v70 = (char *)&v66 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100055960();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(void *)(v23 + 64);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_100005EB4(&qword_10006AEE0);
  __chkstk_darwin(v26 - 8);
  uint64_t v28 = (char *)&v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100069928 != -1) {
    swift_once();
  }
  uint64_t v29 = sub_100054EA0();
  uint64_t v68 = sub_1000096F4(v29, (uint64_t)qword_10006AEA8);
  int v30 = sub_100054E80();
  os_log_type_t v31 = sub_100055CB0();
  if (os_log_type_enabled(v30, v31))
  {
    id v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "getTimeline called", v32, 2u);
    swift_slowDealloc();
  }

  id v33 = [a1 user];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = sub_100055BD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v28, 1, 1, v35);
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v25, v86, v22);
    unint64_t v36 = (*(unsigned __int8 *)(v23 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    uint64_t v37 = (char *)swift_allocObject();
    *((void *)v37 + 2) = 0;
    *((void *)v37 + 3) = 0;
    *((void *)v37 + 4) = v34;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(&v37[v36], v25, v22);
    uint64_t v38 = &v37[(v24 + v36 + 7) & 0xFFFFFFFFFFFFFFF8];
    uint64_t v39 = v88;
    *(void *)uint64_t v38 = v87;
    *((void *)v38 + 1) = v39;
    swift_retain();
    sub_100040E50((uint64_t)v28, (uint64_t)&unk_10006AEF8, (uint64_t)v37);
    return swift_release();
  }
  uint64_t v41 = sub_100054E80();
  os_log_type_t v42 = sub_100055C90();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Failed to provide user. Returning placeholder", v43, 2u);
    swift_slowDealloc();
  }

  sub_100005EB4(&qword_10006AEE8);
  uint64_t v68 = type metadata accessor for UsageTimelineEntry();
  unint64_t v44 = (*(unsigned __int8 *)(*(void *)(v68 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v68 - 8) + 80);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_100056C20;
  double v46 = (unsigned char *)(v45 + v44);
  uint64_t v48 = v80;
  uint64_t v47 = v81;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 56))(v84, 1, 1, v81);
  sub_100055940();
  double v50 = v49;
  double v52 = v51;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v69 + 56))(v85, 1, 1, v15);
  uint64_t v53 = v72;
  sub_100055950();
  uint64_t v54 = (uint64_t)v76;
  sub_100054BF0();
  int v55 = v78;
  sub_100054C90();
  uint64_t v56 = v75;
  uint64_t v57 = v83;
  uint64_t v58 = v77;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v83, v53, v77);
  int v59 = (*(uint64_t (**)(char *, uint64_t))(v56 + 88))(v57, v58);
  uint64_t v60 = v74;
  if (v59 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v59 == enum case for WidgetFamily.systemMedium(_:))
    {
      uint64_t v61 = v74;
      uint64_t v62 = 15;
      goto LABEL_13;
    }
    if (v59 == enum case for WidgetFamily.systemLarge(_:) || v59 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      sub_100012DA0(v54, v74);
      goto LABEL_14;
    }
    if (v59 != enum case for WidgetFamily.accessoryCircular(_:)
      && v59 != enum case for WidgetFamily.accessoryRectangular(_:)
      && v59 != enum case for WidgetFamily.accessoryInline(_:))
    {
      sub_100012DA0(v54, v74);
      (*(void (**)(char *, uint64_t))(v56 + 8))(v83, v58);
      goto LABEL_14;
    }
  }
  uint64_t v61 = v74;
  uint64_t v62 = 9;
LABEL_13:
  sub_10001AE50(v62, v54, v61);
LABEL_14:
  (*(void (**)(char *, uint64_t))(v66 + 8))(v55, v67);
  uint64_t v63 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
  v63(v54, v47);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v58);
  sub_100005660(0, v84, 0, 0, 0, 0, v85, v60, v46, v50, v52, 0.0, (uint64_t)&_swiftEmptyArrayStorage, 0, (uint64_t)&_swiftEmptyArrayStorage, 0, 0, (uint64_t)&_swiftEmptyArrayStorage, 0);
  unsigned __int8 v64 = v79;
  sub_100054BB0();
  sub_1000558F0();
  v63((uint64_t)v64, v47);
  sub_100040754();
  long long v65 = v70;
  sub_100055970();
  v87(v65);
  return (*(uint64_t (**)(char *, uint64_t))(v71 + 8))(v65, v73);
}

uint64_t sub_100043544(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100055960() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  void *v13 = v2;
  v13[1] = sub_100043680;
  return sub_100040FF4(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_100043680()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100043774(uint64_t a1)
{
  uint64_t v2 = sub_100005EB4(&qword_10006AEE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000437D4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10004380C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100043680;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10006AF00 + dword_10006AF00);
  return v6(a1, v4);
}

uint64_t sub_1000438C4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UsageTimelineEntry();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100043924()
{
  uint64_t v1 = sub_100055960();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100043A18(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100055960() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  void *v13 = v2;
  v13[1] = sub_100043B54;
  return sub_100040830(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_100043B58()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006AF20);
  sub_1000096F4(v0, (uint64_t)qword_10006AF20);
  return sub_100054E90();
}

uint64_t sub_100043BDC()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  sub_100055A40();
  swift_bridgeObjectRelease();
  id v2 = *(id *)(v0 + 16);
  sub_100055D40();

  id v3 = *(id *)(v1 + 24);
  sub_100055D40();

  if ((*(void *)(v1 + 32) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v4 = *(void *)(v1 + 32);
  }
  else {
    Swift::UInt64 v4 = 0;
  }
  sub_100056090(v4);
  swift_bridgeObjectRetain();
  sub_100055A40();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100043CA4(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  _OWORD v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  long long v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  uint64_t v7[2] = *(_OWORD *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 48);
  return sub_100044B9C((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_100043D00@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Int sub_100043D0C()
{
  return sub_1000560A0();
}

Swift::Int sub_100043D50()
{
  return sub_1000560A0();
}

BOOL sub_100043D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (*(double *)(a1 + 32) != *(double *)(a2 + 32)) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  unint64_t v5 = (double *)(a1 + 40);
  uint64_t v6 = (double *)(a2 + 40);
  do
  {
    double v7 = *v5++;
    double v8 = v7;
    double v9 = *v6++;
    double v10 = v9;
    BOOL v12 = v4-- != 0;
    BOOL result = v8 == v10;
  }
  while (v8 == v10 && v12);
  return result;
}

uint64_t sub_100043E00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100054A10();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t sub_100043E6C()
{
  if (*(void *)(v0 + 16))
  {
    uint64_t v1 = *(void *)(v0 + 16);
  }
  else
  {
    uint64_t v2 = v0;
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    type metadata accessor for DeviceActivityUsageProvider();
    memset(v4, 0, sizeof(v4));
    uint64_t v5 = 0;
    swift_allocObject();
    uint64_t v1 = sub_100024CC8((uint64_t)v8, 0, 0, (uint64_t)v6, (uint64_t)v4);
    *(void *)(v2 + 16) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_100043F1C()
{
  if (*(void *)(v0 + 24))
  {
    uint64_t v1 = *(void *)(v0 + 24);
  }
  else
  {
    uint64_t v2 = v0;
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    uint64_t v7 = 0;
    memset(v6, 0, sizeof(v6));
    type metadata accessor for CoreDataUsageProvider();
    memset(v4, 0, sizeof(v4));
    uint64_t v5 = 0;
    swift_allocObject();
    uint64_t v1 = sub_10001356C((uint64_t)v8, (uint64_t)v6, (uint64_t)v4);
    *(void *)(v2 + 24) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_100043FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, double a8, double a9)
{
  *(void *)(v10 + 112) = a7;
  *(void *)(v10 + 120) = v9;
  *(unsigned char *)(v10 + 168) = a6;
  *(void *)(v10 + 96) = a4;
  *(void *)(v10 + 104) = a5;
  *(double *)(v10 + 80) = a8;
  *(double *)(v10 + 88) = a9;
  *(void *)(v10 + 64) = a2;
  *(void *)(v10 + 72) = a3;
  *(void *)(v10 + 56) = a1;
  return _swift_task_switch(sub_100043FF8, 0, 0);
}

uint64_t sub_100043FF8()
{
  char v1 = *(unsigned char *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 96);
  unint64_t v2 = *(void *)(v0 + 104);
  sub_100043E6C();
  char v4 = sub_100027224(v1, v3, v2);
  swift_release();
  if ((v4 & 1) != 0
    && (uint64_t v5 = sub_100054E30(),
        *(void *)(v0 + 40) = v5,
        *(void *)(v0 + 48) = sub_100048348((unint64_t *)&qword_10006AD98, (void (*)(uint64_t))&type metadata accessor for ScreenTimeFeatureFlags), uint64_t v6 = sub_10003EC00((uint64_t *)(v0 + 16)), (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v5 - 8) + 104))(v6, enum case for ScreenTimeFeatureFlags.newUsage(_:), v5), LOBYTE(v5) = sub_100054CF0(), sub_10001E980(v0 + 16), (v5 & 1) != 0))
  {
    if (qword_100069930 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_100054EA0();
    sub_1000096F4(v7, (uint64_t)qword_10006AF20);
    double v8 = sub_100054E80();
    os_log_type_t v9 = sub_100055CB0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Using Device Activity to show widget usage data", v10, 2u);
      swift_slowDealloc();
    }

    *(void *)(v0 + 128) = sub_100043E6C();
    uint64_t v11 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_100044418;
    uint64_t v12 = *(void *)(v0 + 104);
    uint64_t v13 = *(void *)(v0 + 112);
    char v14 = *(unsigned char *)(v0 + 168);
    uint64_t v15 = *(void *)(v0 + 96);
    double v16 = *(double *)(v0 + 80);
    double v17 = *(double *)(v0 + 88);
    uint64_t v18 = *(void *)(v0 + 64);
    uint64_t v19 = *(void *)(v0 + 72);
    uint64_t v20 = *(void *)(v0 + 56);
    return sub_100024EF0(v20, v16, v17, v18, v19, v15, v12, v14, v13);
  }
  else
  {
    if (qword_100069930 != -1) {
      swift_once();
    }
    uint64_t v22 = sub_100054EA0();
    sub_1000096F4(v22, (uint64_t)qword_10006AF20);
    uint64_t v23 = sub_100054E80();
    os_log_type_t v24 = sub_100055CB0();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Using Core Data to show widget usage data", v25, 2u);
      swift_slowDealloc();
    }
    uint64_t v26 = *(void *)(v0 + 112);
    char v27 = *(unsigned char *)(v0 + 168);
    uint64_t v29 = *(void *)(v0 + 80);
    uint64_t v28 = *(void *)(v0 + 88);
    long long v35 = *(_OWORD *)(v0 + 64);
    long long v36 = *(_OWORD *)(v0 + 96);

    uint64_t v30 = sub_100043F1C();
    *(void *)(v0 + 144) = v30;
    uint64_t v31 = swift_task_alloc();
    *(void *)(v0 + 152) = v31;
    *(void *)(v31 + 16) = v30;
    *(unsigned char *)(v31 + 24) = v27;
    *(_OWORD *)(v31 + 32) = v36;
    *(_OWORD *)(v31 + 48) = v35;
    *(void *)(v31 + 64) = v26;
    *(void *)(v31 + 72) = v29;
    *(void *)(v31 + 80) = v28;
    id v32 = (void *)swift_task_alloc();
    *(void *)(v0 + 160) = v32;
    uint64_t v33 = type metadata accessor for UsageTimelineEntry();
    *id v32 = v0;
    v32[1] = sub_100044528;
    uint64_t v34 = *(void *)(v0 + 56);
    return withCheckedContinuation<A>(isolation:function:_:)(v34, 0, 0, 0xD00000000000003DLL, 0x8000000100059FC0, sub_1000446B8, v31, v33);
  }
}

uint64_t sub_100044418()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100044528()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  char v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100044654()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for UsageProvider()
{
  return self;
}

uint64_t sub_1000446B8(uint64_t a1)
{
  return sub_1000139C8(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void *)(v1 + 64), *(double *)(v1 + 72), *(double *)(v1 + 80));
}

BOOL sub_1000446D4(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = sub_100054C10();
  uint64_t v57 = *(void (**)(char *, uint64_t))(v60 - 8);
  uint64_t v4 = __chkstk_darwin(v60);
  int v59 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v58 = (char *)&v55 - v6;
  uint64_t v7 = type metadata accessor for HourlyUsage();
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v62 = (uint64_t)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v61 = (uint64_t)&v55 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  char v14 = (char *)&v55 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  double v17 = (char *)&v55 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v55 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v55 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v55 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v55 - v27;
  char v29 = sub_1000549D0();
  sub_10004843C(a1, (uint64_t)v28);
  sub_10004843C(a2, (uint64_t)v26);
  if ((v29 & 1) == 0)
  {
    sub_10001268C((uint64_t)v26);
    sub_10001268C((uint64_t)v28);
    sub_10004843C(a1, (uint64_t)v23);
    sub_10004843C(a2, (uint64_t)v20);
    goto LABEL_7;
  }
  double v30 = *(double *)&v28[*(int *)(v7 + 20)];
  sub_10001268C((uint64_t)v28);
  double v31 = *(double *)&v26[*(int *)(v7 + 20)];
  sub_10001268C((uint64_t)v26);
  sub_10004843C(a1, (uint64_t)v23);
  sub_10004843C(a2, (uint64_t)v20);
  if (v30 != v31)
  {
LABEL_7:
    sub_10001268C((uint64_t)v20);
    sub_10001268C((uint64_t)v23);
    sub_10004843C(a1, (uint64_t)v17);
    sub_10004843C(a2, (uint64_t)v14);
    goto LABEL_8;
  }
  sub_100005EB4(&qword_100069EA8);
  uint64_t v32 = v7;
  uint64_t v33 = v58;
  sub_100054EF0();
  uint64_t v55 = v32;
  uint64_t v34 = v59;
  sub_100054EF0();
  int v56 = sub_100054BC0();
  long long v35 = (void (*)(char *, uint64_t))*((void *)v57 + 1);
  long long v36 = v34;
  uint64_t v37 = (uint64_t)v17;
  uint64_t v38 = v14;
  uint64_t v39 = v60;
  v35(v36, v60);
  uint64_t v40 = v39;
  char v14 = v38;
  double v17 = (char *)v37;
  uint64_t v57 = v35;
  v35(v33, v40);
  sub_10001268C((uint64_t)v20);
  sub_10001268C((uint64_t)v23);
  sub_10004843C(a1, v37);
  sub_10004843C(a2, (uint64_t)v14);
  if ((v56 & 1) == 0)
  {
LABEL_8:
    sub_10001268C((uint64_t)v14);
    sub_10001268C((uint64_t)v17);
    uint64_t v53 = a1;
    uint64_t v50 = v61;
    sub_10004843C(v53, v61);
    uint64_t v51 = v62;
    sub_10004843C(a2, v62);
    goto LABEL_9;
  }
  uint64_t v41 = v55;
  sub_100005EB4(&qword_100069EA8);
  os_log_type_t v42 = v58;
  sub_100054F00();
  uint64_t v43 = v59;
  sub_100054F00();
  char v44 = sub_100054BC0();
  uint64_t v45 = v43;
  uint64_t v46 = (uint64_t)v14;
  uint64_t v47 = v60;
  uint64_t v48 = v57;
  v57(v45, v60);
  v48(v42, v47);
  sub_10001268C(v46);
  sub_10001268C((uint64_t)v17);
  uint64_t v49 = a1;
  uint64_t v50 = v61;
  sub_10004843C(v49, v61);
  uint64_t v51 = v62;
  sub_10004843C(a2, v62);
  if ((v44 & 1) == 0)
  {
LABEL_9:
    BOOL v52 = 0;
    goto LABEL_10;
  }
  BOOL v52 = sub_100043D8C(*(void *)(v50 + *(int *)(v41 + 28)), *(void *)(v51 + *(int *)(v41 + 28)));
LABEL_10:
  sub_10001268C(v50);
  sub_10001268C(v51);
  return v52;
}

uint64_t sub_100044B9C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (v4 || (char v5 = sub_100055FE0(), result = 0, (v5 & 1) != 0))
  {
    sub_10001F0C0(0, &qword_10006B0C8);
    if ((sub_100055D30() & 1) != 0 && (sub_100055D30() & 1) != 0 && *(double *)(a1 + 32) == *(double *)(a2 + 32))
    {
      if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48))
      {
        return 1;
      }
      else
      {
        return sub_100055FE0();
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100044C88(char a1, id a2, unint64_t a3, uint64_t a4)
{
  if (a1)
  {
    unint64_t v5 = a3;
    if (a3)
    {
      uint64_t v7 = qword_100069930;
      swift_bridgeObjectRetain();
      if (v7 != -1) {
        goto LABEL_58;
      }
      while (1)
      {
        uint64_t v8 = sub_100054EA0();
        sub_1000096F4(v8, (uint64_t)qword_10006AF20);
        swift_bridgeObjectRetain_n();
        uint64_t v9 = sub_100054E80();
        os_log_type_t v10 = sub_100055CB0();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = (uint8_t *)swift_slowAlloc();
          id v58 = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v11 = 136446210;
          swift_bridgeObjectRetain();
          sub_10001C000((uint64_t)a2, v5, (uint64_t *)&v58);
          sub_100055D70();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "Fetching information for user with dsid: %{public}s.", v11, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v17 = [self fetchRequest];
        sub_100005EB4(&qword_10006A0B8);
        uint64_t v31 = swift_allocObject();
        *(_OWORD *)(v31 + 16) = xmmword_100056C10;
        sub_10001F0C0(0, &qword_10006A0C0);
        *(void *)(v31 + 56) = &type metadata for String;
        unint64_t v32 = sub_10001C7B4();
        *(void *)(v31 + 32) = 1684632420;
        *(void *)(v31 + 40) = 0xE400000000000000;
        *(void *)(v31 + 96) = &type metadata for String;
        *(void *)(v31 + 104) = v32;
        *(void *)(v31 + 64) = v32;
        *(void *)(v31 + 72) = a2;
        *(void *)(v31 + 80) = v5;
        uint64_t v33 = (void *)sub_100055C70();
        [v17 setPredicate:v33];

        id v58 = 0;
        id v34 = [v17 execute:&v58];
        id v35 = v58;
        if (!v34) {
          break;
        }
        a2 = v34;
        sub_10001F0C0(0, &qword_10006A0A8);
        unint64_t v5 = sub_100055B60();
        id v36 = v35;

LABEL_28:
        if (v5 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v49 = sub_100055F30();
          swift_bridgeObjectRelease();
          BOOL v38 = v49 > 0;
          swift_bridgeObjectRetain();
          if (!sub_100055F30())
          {
LABEL_44:
            swift_bridgeObjectRelease();
            if (!v38)
            {
              if (qword_100069930 != -1) {
                swift_once();
              }
              uint64_t v50 = sub_100054EA0();
              sub_1000096F4(v50, (uint64_t)qword_10006AF20);
              uint64_t v43 = sub_100054E80();
              os_log_type_t v51 = sub_100055C90();
              if (os_log_type_enabled(v43, v51))
              {
                BOOL v52 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)BOOL v52 = 0;
                _os_log_impl((void *)&_mh_execute_header, v43, v51, "Fetching user information returned empty results", v52, 2u);
LABEL_49:
                swift_slowDealloc();
              }
              goto LABEL_50;
            }
            goto LABEL_51;
          }
        }
        else
        {
          uint64_t v37 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
          BOOL v38 = v37 != 0;
          swift_bridgeObjectRetain();
          if (!v37) {
            goto LABEL_44;
          }
        }
        if ((v5 & 0xC000000000000001) != 0)
        {
          id v39 = (id)sub_100055E10();
          goto LABEL_33;
        }
        if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v39 = *(id *)(v5 + 32);
LABEL_33:
          uint64_t v40 = v39;
          swift_bridgeObjectRelease();
          id v41 = v40;
          sub_100026F88(v40, a4);
          swift_bridgeObjectRelease();

          return;
        }
        __break(1u);
LABEL_58:
        swift_once();
      }
      id v42 = v58;
      sub_100054AA0();

      swift_willThrow();
      swift_errorRelease();
      uint64_t v43 = sub_100054E80();
      os_log_type_t v44 = sub_100055C90();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Fetching user information returned nil results", v45, 2u);
        goto LABEL_49;
      }
LABEL_50:

LABEL_51:
      if (qword_100069908 != -1) {
        swift_once();
      }
      uint64_t v53 = sub_100054EA0();
      sub_1000096F4(v53, (uint64_t)qword_10006A2A0);
      uint64_t v54 = sub_100054E80();
      os_log_type_t v55 = sub_100055C90();
      if (os_log_type_enabled(v54, v55))
      {
        int v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v56 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "unable to fetch user properties", v56, 2u);
        swift_slowDealloc();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100069930 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_100054EA0();
      sub_1000096F4(v19, (uint64_t)qword_10006AF20);
      uint64_t v20 = sub_100054E80();
      os_log_type_t v21 = sub_100055C90();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "Failed to provide DSID. Returning nil user.", v22, 2u);
        swift_slowDealloc();
      }

      if (qword_100069908 != -1) {
        swift_once();
      }
      sub_1000096F4(v19, (uint64_t)qword_10006A2A0);
      oslog = sub_100054E80();
      os_log_type_t v23 = sub_100055C90();
      if (os_log_type_enabled(oslog, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v23, "unable to fetch user properties", v24, 2u);
        swift_slowDealloc();
      }
    }
  }
  else
  {
    if (qword_100069930 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100054EA0();
    sub_1000096F4(v12, (uint64_t)qword_10006AF20);
    uint64_t v13 = sub_100054E80();
    os_log_type_t v14 = sub_100055CB0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Fetching local user information", v15, 2u);
      swift_slowDealloc();
    }

    id v16 = [self fetchRequestMatchingLocalUser];
    id v58 = 0;
    id v17 = [v16 execute:&v58];

    a2 = v58;
    if (v17)
    {
      sub_10001F0C0(0, &qword_10006A0A8);
      unint64_t v5 = sub_100055B60();
      id v18 = a2;
      goto LABEL_28;
    }
    id v25 = v58;
    sub_100054AA0();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v26 = sub_100054E80();
    os_log_type_t v27 = sub_100055C90();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      char v29 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 138543362;
      swift_errorRetain();
      double v30 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v58 = v30;
      sub_100055D70();
      void *v29 = v30;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to fetch user: %{public}@", v28, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    if (qword_100069908 != -1) {
      swift_once();
    }
    sub_1000096F4(v12, (uint64_t)qword_10006A2A0);
    uint64_t v46 = sub_100054E80();
    os_log_type_t v47 = sub_100055C90();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "unable to fetch user properties", v48, 2u);
      swift_slowDealloc();
    }

    swift_errorRelease();
  }
}

uint64_t sub_100045778(uint64_t a1, void *a2, unint64_t a3, char a4, uint64_t a5)
{
  uint64_t v34 = type metadata accessor for XPCPersistentStoreManager();
  id v35 = &off_100067080;
  v33[0] = a1;
  int v10 = *(unsigned __int8 *)(*sub_10001ADBC(v33, v34) + 24);
  uint64_t v11 = qword_100069930;
  swift_retain_n();
  swift_retain();
  if (v10 != 1) {
    goto LABEL_9;
  }
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100054EA0();
  sub_1000096F4(v12, (uint64_t)qword_10006AF20);
  uint64_t v13 = sub_100054E80();
  os_log_type_t v14 = sub_100055CB0();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Successfully loaded persistent store.", v15, 2u);
    swift_slowDealloc();
  }

  id v16 = sub_10001ADBC(v33, v34);
  uint64_t v11 = swift_allocObject();
  char v17 = a4 & 1;
  *(unsigned char *)(v11 + 16) = v17;
  *(void *)(v11 + 24) = a2;
  *(void *)(v11 + 32) = a3;
  *(void *)(v11 + 40) = sub_10004778C;
  *(void *)(v11 + 48) = a5;
  uint64_t v18 = *v16;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  sub_10003E140();
  if (*(unsigned char *)(v18 + 24) != 1)
  {
    swift_retain();
    sub_100044C88(v17, a2, a3, a5);
    swift_bridgeObjectRelease();
    swift_release();
    swift_release_n();
    goto LABEL_19;
  }
  id v19 = [*(id *)(v18 + 16) newBackgroundContext];
  [v19 setAutomaticallyMergesChangesFromParent:1];
  [v19 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = sub_100046E18;
  void v20[3] = v11;
  v20[4] = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = sub_1000234C8;
  *(void *)(v21 + 24) = v20;
  aBlock[4] = sub_1000234BC;
  aBlock[5] = v21;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001AE28;
  aBlock[3] = &unk_1000672D0;
  uint64_t v22 = _Block_copy(aBlock);
  swift_retain();
  id v23 = v19;
  swift_retain();
  swift_release();
  [v23 performBlockAndWait:v22];

  _Block_release(v22);
  LOBYTE(v23) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  if (v23)
  {
    __break(1u);
LABEL_9:
    if (v11 != -1) {
      swift_once();
    }
    uint64_t v24 = sub_100054EA0();
    sub_1000096F4(v24, (uint64_t)qword_10006AF20);
    id v25 = sub_100054E80();
    os_log_type_t v26 = sub_100055C90();
    if (os_log_type_enabled(v25, v26))
    {
      os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to load persistent store. This prevented fetching user data.", v27, 2u);
      swift_slowDealloc();
    }

    if (qword_100069908 != -1) {
      swift_once();
    }
    sub_1000096F4(v24, (uint64_t)qword_10006A2A0);
    uint64_t v28 = sub_100054E80();
    os_log_type_t v29 = sub_100055C90();
    if (os_log_type_enabled(v28, v29))
    {
      double v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "unable to fetch user properties", v30, 2u);
      swift_slowDealloc();
    }
  }
LABEL_19:
  sub_10001E980((uint64_t)v33);
  return swift_release_n();
}

void sub_100045C80(char a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a1)
  {
    unint64_t v5 = a3;
    if (a3)
    {
      uint64_t v7 = qword_100069930;
      swift_bridgeObjectRetain();
      if (v7 != -1) {
        goto LABEL_62;
      }
      while (1)
      {
        uint64_t v8 = sub_100054EA0();
        sub_1000096F4(v8, (uint64_t)qword_10006AF20);
        swift_bridgeObjectRetain_n();
        uint64_t v9 = sub_100054E80();
        os_log_type_t v10 = sub_100055CB0();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = (uint8_t *)swift_slowAlloc();
          v65[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v11 = 136446210;
          swift_bridgeObjectRetain();
          sub_10001C000(a2, v5, (uint64_t *)v65);
          sub_100055D70();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "Fetching information for user with dsid: %{public}s.", v11, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v17 = [self fetchRequest];
        sub_100005EB4(&qword_10006A0B8);
        uint64_t v33 = swift_allocObject();
        *(_OWORD *)(v33 + 16) = xmmword_100056C10;
        sub_10001F0C0(0, &qword_10006A0C0);
        *(void *)(v33 + 56) = &type metadata for String;
        unint64_t v34 = sub_10001C7B4();
        *(void *)(v33 + 32) = 1684632420;
        *(void *)(v33 + 40) = 0xE400000000000000;
        *(void *)(v33 + 96) = &type metadata for String;
        *(void *)(v33 + 104) = v34;
        *(void *)(v33 + 64) = v34;
        *(void *)(v33 + 72) = a2;
        *(void *)(v33 + 80) = v5;
        id v35 = (void *)sub_100055C70();
        [v17 setPredicate:v35];

        v65[0] = 0;
        id v36 = [v17 execute:v65];
        id v37 = v65[0];
        if (!v36) {
          break;
        }
        BOOL v38 = v36;
        sub_10001F0C0(0, &qword_10006A0A8);
        unint64_t v19 = sub_100055B60();
        id v39 = v37;

LABEL_28:
        if (v19 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v56 = sub_100055F30();
          swift_bridgeObjectRelease();
          unint64_t v5 = v56 > 0;
          swift_bridgeObjectRetain();
          if (!sub_100055F30())
          {
LABEL_48:
            swift_bridgeObjectRelease();
            if ((v5 & 1) == 0)
            {
              if (qword_100069930 != -1) {
                swift_once();
              }
              uint64_t v57 = sub_100054EA0();
              sub_1000096F4(v57, (uint64_t)qword_10006AF20);
              uint64_t v50 = sub_100054E80();
              os_log_type_t v58 = sub_100055C90();
              if (os_log_type_enabled(v50, v58))
              {
                int v59 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)int v59 = 0;
                _os_log_impl((void *)&_mh_execute_header, v50, v58, "Fetching user information returned empty results", v59, 2u);
LABEL_53:
                swift_slowDealloc();
              }
              goto LABEL_54;
            }
            goto LABEL_55;
          }
        }
        else
        {
          uint64_t v40 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
          unint64_t v5 = v40 != 0;
          swift_bridgeObjectRetain();
          if (!v40) {
            goto LABEL_48;
          }
        }
        if ((v19 & 0xC000000000000001) != 0)
        {
          id v41 = (id)sub_100055E10();
          goto LABEL_33;
        }
        if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v41 = *(id *)(v19 + 32);
LABEL_33:
          id v42 = v41;
          swift_bridgeObjectRelease();
          id v43 = v42;
          id v44 = [v43 altDSID];
          if (v44)
          {
            uint64_t v45 = v44;
            sub_100055A10();
          }
          id v46 = [v43 userDeviceStates];
          if (v46)
          {
            os_log_type_t v47 = v46;
            sub_10001F0C0(0, (unint64_t *)&qword_10006A550);
            sub_100046E48();
            sub_100055BF0();
          }
          char v48 = sub_100054E60();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_beginAccess();
          *(unsigned char *)(a4 + 16) = v48 & 1;
          swift_bridgeObjectRelease();

          return;
        }
        __break(1u);
LABEL_62:
        swift_once();
      }
      id v49 = v65[0];
      sub_100054AA0();

      swift_willThrow();
      swift_errorRelease();
      uint64_t v50 = sub_100054E80();
      os_log_type_t v51 = sub_100055C90();
      if (os_log_type_enabled(v50, v51))
      {
        BOOL v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Fetching user information returned nil results", v52, 2u);
        goto LABEL_53;
      }
LABEL_54:

LABEL_55:
      if (qword_100069908 != -1) {
        swift_once();
      }
      uint64_t v60 = sub_100054EA0();
      sub_1000096F4(v60, (uint64_t)qword_10006A2A0);
      uint64_t v61 = sub_100054E80();
      os_log_type_t v62 = sub_100055C90();
      if (os_log_type_enabled(v61, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v63 = 0;
        _os_log_impl((void *)&_mh_execute_header, v61, v62, "Failed to fetch user; using DeviceActivity data", v63, 2u);
        swift_slowDealloc();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100069930 != -1) {
        swift_once();
      }
      uint64_t v21 = sub_100054EA0();
      sub_1000096F4(v21, (uint64_t)qword_10006AF20);
      uint64_t v22 = sub_100054E80();
      os_log_type_t v23 = sub_100055C90();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to provide DSID. Returning nil user.", v24, 2u);
        swift_slowDealloc();
      }

      if (qword_100069908 != -1) {
        swift_once();
      }
      sub_1000096F4(v21, (uint64_t)qword_10006A2A0);
      oslog = sub_100054E80();
      os_log_type_t v25 = sub_100055C90();
      if (os_log_type_enabled(oslog, v25))
      {
        os_log_type_t v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, oslog, v25, "Failed to fetch user; using DeviceActivity data",
          v26,
          2u);
        swift_slowDealloc();
      }
    }
  }
  else
  {
    if (qword_100069930 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100054EA0();
    sub_1000096F4(v12, (uint64_t)qword_10006AF20);
    uint64_t v13 = sub_100054E80();
    os_log_type_t v14 = sub_100055CB0();
    a2 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)a2, "Fetching local user information", v15, 2u);
      swift_slowDealloc();
    }

    id v16 = [self fetchRequestMatchingLocalUser];
    v65[0] = 0;
    id v17 = [v16 execute:v65];

    id v18 = v65[0];
    if (v17)
    {
      sub_10001F0C0(0, &qword_10006A0A8);
      unint64_t v19 = sub_100055B60();
      id v20 = v18;
      goto LABEL_28;
    }
    id v27 = v65[0];
    sub_100054AA0();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v28 = sub_100054E80();
    os_log_type_t v29 = sub_100055C90();
    if (os_log_type_enabled(v28, v29))
    {
      double v30 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = (void *)swift_slowAlloc();
      *(_DWORD *)double v30 = 138543362;
      swift_errorRetain();
      unint64_t v32 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v65[0] = v32;
      sub_100055D70();
      *uint64_t v31 = v32;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to fetch user: %{public}@", v30, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    if (qword_100069908 != -1) {
      swift_once();
    }
    sub_1000096F4(v12, (uint64_t)qword_10006A2A0);
    uint64_t v53 = sub_100054E80();
    os_log_type_t v54 = sub_100055C90();
    if (os_log_type_enabled(v53, v54))
    {
      os_log_type_t v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v55 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "Failed to fetch user; using DeviceActivity data", v55, 2u);
      swift_slowDealloc();
    }

    swift_errorRelease();
  }
}

uint64_t sub_10004686C(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = a5;
  *(void *)(v12 + 24) = a6;
  uint64_t v37 = type metadata accessor for XPCPersistentStoreManager();
  BOOL v38 = &off_100067080;
  v36[0] = a1;
  int v13 = *(unsigned __int8 *)(*sub_10001ADBC(v36, v37) + 24);
  uint64_t v14 = qword_100069930;
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  if (v13 != 1) {
    goto LABEL_9;
  }
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_100054EA0();
  sub_1000096F4(v15, (uint64_t)qword_10006AF20);
  id v16 = sub_100054E80();
  os_log_type_t v17 = sub_100055CB0();
  if (os_log_type_enabled(v16, v17))
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Successfully loaded persistent store.", v18, 2u);
    swift_slowDealloc();
  }

  unint64_t v19 = sub_10001ADBC(v36, v37);
  uint64_t v14 = swift_allocObject();
  char v20 = a4 & 1;
  *(unsigned char *)(v14 + 16) = v20;
  *(void *)(v14 + 24) = a2;
  *(void *)(v14 + 32) = a3;
  *(void *)(v14 + 40) = sub_100046E0C;
  *(void *)(v14 + 48) = v12;
  uint64_t v21 = *v19;
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  sub_10003E140();
  if (*(unsigned char *)(v21 + 24) != 1)
  {
    swift_retain();
    swift_retain();
    sub_100045C80(v20, a2, a3, a5);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_release();
    goto LABEL_19;
  }
  id v22 = [*(id *)(v21 + 16) newBackgroundContext];
  [v22 setAutomaticallyMergesChangesFromParent:1];
  [v22 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  os_log_type_t v23 = (void *)swift_allocObject();
  void v23[2] = sub_100046E18;
  void v23[3] = v14;
  v23[4] = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = sub_10001BD9C;
  *(void *)(v24 + 24) = v23;
  aBlock[4] = sub_100023408;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001AE28;
  aBlock[3] = &unk_100067230;
  os_log_type_t v25 = _Block_copy(aBlock);
  swift_retain();
  id v26 = v22;
  swift_retain();
  swift_release();
  [v26 performBlockAndWait:v25];

  _Block_release(v25);
  LOBYTE(v26) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  if (v26)
  {
    __break(1u);
LABEL_9:
    if (v14 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_100054EA0();
    sub_1000096F4(v27, (uint64_t)qword_10006AF20);
    uint64_t v28 = sub_100054E80();
    os_log_type_t v29 = sub_100055C90();
    if (os_log_type_enabled(v28, v29))
    {
      double v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to load persistent store. This prevented fetching user data.", v30, 2u);
      swift_slowDealloc();
    }

    if (qword_100069908 != -1) {
      swift_once();
    }
    sub_1000096F4(v27, (uint64_t)qword_10006A2A0);
    uint64_t v31 = sub_100054E80();
    os_log_type_t v32 = sub_100055C90();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to fetch user; using DeviceActivity data", v33, 2u);
      swift_slowDealloc();
    }
  }
LABEL_19:
  sub_10001E980((uint64_t)v36);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100046DCC()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100046E0C(void *a1)
{
  sub_100027490(a1, *(void *)(v1 + 16));
}

uint64_t sub_100046E20()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100046E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100046E40()
{
  return swift_release();
}

unint64_t sub_100046E48()
{
  unint64_t result = qword_10006A558;
  if (!qword_10006A558)
  {
    sub_10001F0C0(255, (unint64_t *)&qword_10006A550);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A558);
  }
  return result;
}

void sub_100046EB0(char a1, void *a2, unint64_t a3, void (*a4)(void *))
{
  if (a1)
  {
    unint64_t v6 = a3;
    if (a3)
    {
      BOOL v4 = a2;
      uint64_t v7 = qword_100069930;
      swift_bridgeObjectRetain();
      if (v7 != -1) {
        goto LABEL_44;
      }
      while (1)
      {
        uint64_t v8 = sub_100054EA0();
        sub_1000096F4(v8, (uint64_t)qword_10006AF20);
        swift_bridgeObjectRetain_n();
        uint64_t v9 = sub_100054E80();
        os_log_type_t v10 = sub_100055CB0();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = (uint8_t *)swift_slowAlloc();
          id v49 = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v11 = 136446210;
          swift_bridgeObjectRetain();
          sub_10001C000((uint64_t)v4, v6, (uint64_t *)&v49);
          sub_100055D70();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v9, v10, "Fetching information for user with dsid: %{public}s.", v11, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        id v17 = [self fetchRequest];
        sub_100005EB4(&qword_10006A0B8);
        uint64_t v30 = swift_allocObject();
        *(_OWORD *)(v30 + 16) = xmmword_100056C10;
        sub_10001F0C0(0, &qword_10006A0C0);
        *(void *)(v30 + 56) = &type metadata for String;
        unint64_t v31 = sub_10001C7B4();
        *(void *)(v30 + 32) = 1684632420;
        *(void *)(v30 + 40) = 0xE400000000000000;
        *(void *)(v30 + 96) = &type metadata for String;
        *(void *)(v30 + 104) = v31;
        *(void *)(v30 + 64) = v31;
        *(void *)(v30 + 72) = v4;
        *(void *)(v30 + 80) = v6;
        os_log_type_t v32 = (void *)sub_100055C70();
        [v17 setPredicate:v32];

        id v49 = 0;
        id v33 = [v17 execute:&v49];
        id v34 = v49;
        if (!v33) {
          break;
        }
        BOOL v4 = v33;
        sub_10001F0C0(0, &qword_10006A0A8);
        unint64_t v6 = sub_100055B60();
        id v35 = v34;

LABEL_22:
        if (v6 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v45 = sub_100055F30();
          swift_bridgeObjectRelease();
          BOOL v37 = v45 > 0;
          swift_bridgeObjectRetain();
          if (!sub_100055F30())
          {
LABEL_34:
            swift_bridgeObjectRelease();
            if (!v37)
            {
              if (qword_100069930 != -1) {
                swift_once();
              }
              uint64_t v46 = sub_100054EA0();
              sub_1000096F4(v46, (uint64_t)qword_10006AF20);
              id v42 = sub_100054E80();
              os_log_type_t v47 = sub_100055C90();
              if (os_log_type_enabled(v42, v47))
              {
                char v48 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)char v48 = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, v47, "Fetching user information returned empty results", v48, 2u);
LABEL_39:
                swift_slowDealloc();
              }
              goto LABEL_40;
            }
            goto LABEL_41;
          }
        }
        else
        {
          uint64_t v36 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
          BOOL v37 = v36 != 0;
          swift_bridgeObjectRetain();
          if (!v36) {
            goto LABEL_34;
          }
        }
        if ((v6 & 0xC000000000000001) != 0)
        {
          id v38 = (id)sub_100055E10();
          goto LABEL_27;
        }
        if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v38 = *(id *)(v6 + 32);
LABEL_27:
          id v39 = v38;
          swift_bridgeObjectRelease();
          id v40 = v39;
          a4(v39);
          swift_bridgeObjectRelease();

          return;
        }
        __break(1u);
LABEL_44:
        swift_once();
      }
      id v41 = v49;
      sub_100054AA0();

      swift_willThrow();
      swift_errorRelease();
      id v42 = sub_100054E80();
      os_log_type_t v43 = sub_100055C90();
      if (os_log_type_enabled(v42, v43))
      {
        id v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Fetching user information returned nil results", v44, 2u);
        goto LABEL_39;
      }
LABEL_40:

LABEL_41:
      a4(0);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (qword_100069930 != -1) {
        swift_once();
      }
      uint64_t v20 = sub_100054EA0();
      sub_1000096F4(v20, (uint64_t)qword_10006AF20);
      uint64_t v21 = sub_100054E80();
      os_log_type_t v22 = sub_100055C90();
      if (os_log_type_enabled(v21, v22))
      {
        os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed to provide DSID. Returning nil user.", v23, 2u);
        swift_slowDealloc();
      }

      a4(0);
    }
  }
  else
  {
    if (qword_100069930 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_100054EA0();
    sub_1000096F4(v12, (uint64_t)qword_10006AF20);
    int v13 = sub_100054E80();
    os_log_type_t v14 = sub_100055CB0();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Fetching local user information", v15, 2u);
      swift_slowDealloc();
    }

    id v16 = [self fetchRequestMatchingLocalUser];
    id v49 = 0;
    id v17 = [v16 execute:&v49];

    id v18 = v49;
    if (v17)
    {
      sub_10001F0C0(0, &qword_10006A0A8);
      unint64_t v6 = sub_100055B60();
      id v19 = v18;
      goto LABEL_22;
    }
    id v24 = v49;
    sub_100054AA0();

    swift_willThrow();
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v25 = sub_100054E80();
    os_log_type_t v26 = sub_100055C90();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 138543362;
      swift_errorRetain();
      os_log_type_t v29 = (void *)_swift_stdlib_bridgeErrorToNSError();
      id v49 = v29;
      sub_100055D70();
      *uint64_t v28 = v29;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to fetch user: %{public}@", v27, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    a4(0);
    swift_errorRelease();
  }
}

void sub_10004778C(void *a1)
{
  sub_100026F88(a1, v1);
}

uint64_t sub_100047798()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000477D8()
{
  sub_100046EB0(*(unsigned char *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void (**)(void *))(v0 + 40));
}

uint64_t sub_1000477EC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t destroy for MostUsedItem(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MostUsedItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  BOOL v4 = *(void **)(a2 + 16);
  unint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  id v6 = v4;
  id v7 = v5;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for MostUsedItem(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  BOOL v4 = (void *)a2[2];
  unint64_t v5 = (void *)a1[2];
  a1[2] = v4;
  id v6 = v4;

  id v7 = (void *)a2[3];
  uint64_t v8 = (void *)a1[3];
  a1[3] = v7;
  id v9 = v7;

  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for MostUsedItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  BOOL v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  unint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for MostUsedItem()
{
  return &type metadata for MostUsedItem;
}

uint64_t *sub_1000479C8(uint64_t *a1, uint64_t *a2, int *a3)
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
    uint64_t v7 = sub_100054A10();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    id v9 = (char *)a1 + v8;
    os_log_type_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_100005EB4(&qword_100069EA8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100047AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = sub_100005EB4(&qword_100069EA8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100047BB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005EB4(&qword_100069EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100047C90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005EB4(&qword_100069EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100047D7C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005EB4(&qword_100069EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100047E54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100054A10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_100005EB4(&qword_100069EA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100047F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100047F48);
}

uint64_t sub_100047F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100054A10();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100005EB4(&qword_100069EA8);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_100048060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100048074);
}

uint64_t sub_100048074(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_100054A10();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_100005EB4(&qword_100069EA8);
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 24);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for HourlyUsage()
{
  uint64_t result = qword_10006B078;
  if (!qword_10006B078) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000481D4()
{
  sub_100054A10();
  if (v0 <= 0x3F)
  {
    sub_1000482B4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1000482B4()
{
  if (!qword_10006B088)
  {
    sub_100054C10();
    sub_100048348(&qword_100069ED8, (void (*)(uint64_t))&type metadata accessor for Date);
    unint64_t v0 = sub_100054F10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10006B088);
    }
  }
}

uint64_t sub_100048348(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100048390()
{
  return sub_100048348(&qword_10006A4B0, (void (*)(uint64_t))&type metadata accessor for DateInterval);
}

unint64_t sub_1000483DC()
{
  unint64_t result = qword_10006B0C0;
  if (!qword_10006B0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B0C0);
  }
  return result;
}

void *sub_100048430()
{
  return &protocol witness table for String;
}

uint64_t sub_10004843C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HourlyUsage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for UsageTitleView(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for UsageTitleView(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = (a2 - 1);
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
  *(unsigned char *)(result + 9) = v3;
  return result;
}

ValueMetadata *type metadata accessor for UsageTitleView()
{
  return &type metadata for UsageTitleView;
}

uint64_t sub_100048504()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_100048520()
{
  id result = [objc_allocWithZone((Class)NSDateComponentsFormatter) init];
  qword_10006B0D0 = (uint64_t)result;
  return result;
}

uint64_t sub_100048554@<X0>(double a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v57 = a3;
  uint64_t v5 = sub_1000551A0();
  uint64_t v55 = *(void *)(v5 - 8);
  uint64_t v56 = v5;
  __chkstk_darwin(v5);
  os_log_type_t v54 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005EB4(&qword_10006B0D8);
  __chkstk_darwin(v7 - 8);
  char v48 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100005EB4(&qword_10006B0E0);
  __chkstk_darwin(v53);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0 || a1 < 0.0)
  {
    unint64_t v11 = 0xE200000000000000;
    uint64_t v12 = 11565;
  }
  else
  {
    if (qword_100069938 != -1) {
      swift_once();
    }
    os_log_type_t v43 = (void *)qword_10006B0D0;
    if (a1 < 60.0) {
      uint64_t v44 = 128;
    }
    else {
      uint64_t v44 = 96;
    }
    [(id)qword_10006B0D0 setAllowedUnits:v44];
    [v43 setUnitsStyle:1];
    id v45 = [v43 stringFromTimeInterval:a1];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v12 = sub_100055A10();
      unint64_t v11 = v47;
    }
    else
    {
      uint64_t v12 = 0;
      unint64_t v11 = 0xE000000000000000;
    }
  }
  uint64_t v60 = v12;
  unint64_t v61 = v11;
  sub_10000D02C();
  uint64_t v13 = sub_100055540();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = swift_getKeyPath();
  uint64_t v50 = v13;
  uint64_t v60 = v13;
  unint64_t v61 = v15;
  uint64_t v49 = v15;
  char v62 = v17 & 1;
  uint64_t v52 = v19;
  uint64_t v63 = v19;
  uint64_t v64 = KeyPath;
  uint64_t v51 = KeyPath;
  uint64_t v65 = 0x3FE8000000000000;
  uint64_t v66 = v21;
  uint64_t v67 = 1;
  char v68 = 0;
  if ((a2 & 1) != 0 || a1 < 0.0) {
    goto LABEL_13;
  }
  if (qword_100069938 != -1) {
    swift_once();
  }
  os_log_type_t v22 = (void *)qword_10006B0D0;
  uint64_t v23 = a1 < 60.0 ? 128 : 96;
  [(id)qword_10006B0D0 setAllowedUnits:v23];
  [v22 setUnitsStyle:3];
  id v24 = [v22 stringFromTimeInterval:a1];
  if (!v24)
  {
LABEL_13:
    uint64_t v26 = 0;
    unint64_t v28 = 0xE000000000000000;
  }
  else
  {
    os_log_type_t v25 = v24;
    uint64_t v26 = sub_100055A10();
    unint64_t v28 = v27;
  }
  if (sub_100055A50())
  {
    uint64_t v58 = v26;
    unint64_t v59 = v28;
    uint64_t v29 = sub_100055540();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_100055310();
    uint64_t v29 = sub_100055530();
  }
  uint64_t v32 = v29;
  uint64_t v33 = v30;
  char v34 = v31 & 1;
  sub_100005EB4(&qword_10006B0E8);
  sub_100048BEC();
  uint64_t v35 = (uint64_t)v48;
  sub_1000555E0();
  sub_10000AB4C(v32, v33, v34);
  swift_bridgeObjectRelease();
  sub_10000AB4C(v50, v49, v17 & 1);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v36 = v54;
  sub_100055190();
  uint64_t v37 = swift_getKeyPath();
  id v38 = (uint64_t *)&v10[*(int *)(v53 + 36)];
  uint64_t v39 = sub_100005EB4(&qword_100069E20);
  uint64_t v41 = v55;
  uint64_t v40 = v56;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))((char *)v38 + *(int *)(v39 + 28), v36, v56);
  *id v38 = v37;
  sub_100048D2C(v35, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v40);
  sub_100048D94(v35);
  return sub_100048DF4((uint64_t)v10, v57);
}

uint64_t sub_100048A98@<X0>(uint64_t a1@<X8>)
{
  return sub_100048554(*(double *)v1, *(unsigned char *)(v1 + 8), a1);
}

uint64_t sub_100048AA4()
{
  return sub_100055210();
}

uint64_t sub_100048AC8(uint64_t a1)
{
  uint64_t v2 = sub_1000551A0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100055220();
}

uint64_t sub_100048B90@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100055230();
  *a1 = v3;
  return result;
}

uint64_t sub_100048BBC()
{
  return sub_100055240();
}

unint64_t sub_100048BEC()
{
  unint64_t result = qword_10006B0F0;
  if (!qword_10006B0F0)
  {
    sub_100007D80(&qword_10006B0E8);
    sub_100048C78();
    sub_100048F68(&qword_100069B50, &qword_100069B58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B0F0);
  }
  return result;
}

unint64_t sub_100048C78()
{
  unint64_t result = qword_10006B0F8;
  if (!qword_10006B0F8)
  {
    sub_100007D80(&qword_10006B100);
    sub_100048F68(&qword_10006B108, &qword_10006B110);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B0F8);
  }
  return result;
}

uint64_t sub_100048D04()
{
  return sub_100055210();
}

uint64_t sub_100048D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EB4(&qword_10006B0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100048D94(uint64_t a1)
{
  uint64_t v2 = sub_100005EB4(&qword_10006B0D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100048DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005EB4(&qword_10006B0E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100048E60()
{
  unint64_t result = qword_10006B118;
  if (!qword_10006B118)
  {
    sub_100007D80(&qword_10006B0E0);
    sub_100048EEC();
    sub_100048F68(&qword_10006B128, &qword_100069E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B118);
  }
  return result;
}

unint64_t sub_100048EEC()
{
  unint64_t result = qword_10006B120;
  if (!qword_10006B120)
  {
    sub_100007D80(&qword_10006B0D8);
    sub_100048BEC();
    sub_10000D244();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B120);
  }
  return result;
}

uint64_t sub_100048F68(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007D80(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100048FB8()
{
  uint64_t v0 = sub_100054EA0();
  sub_10000972C(v0, qword_10006B130);
  sub_1000096F4(v0, (uint64_t)qword_10006B130);
  return sub_100054E90();
}

void sub_10004903C(uint64_t a1, uint64_t a2)
{
}

void *sub_100049044(uint64_t a1, uint64_t a2)
{
  id v3 = sub_1000490C4();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  __int16 v9 = v8;
  swift_beginAccess();
  uint64_t v10 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v3;
  *(void *)(a2 + 24) = v5;
  *(void *)(a2 + 32) = v7;
  *(_WORD *)(a2 + 40) = v9;
  return sub_100023374(v10);
}

id sub_1000490C4()
{
  uint64_t v0 = sub_100054A90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [self fetchRequestMatchingLocalUser];
  id v42 = 0;
  id v5 = [v4 execute:&v42];

  id v6 = v42;
  if (!v5)
  {
    id v23 = v42;
    id v24 = (void *)sub_100054AA0();

    swift_willThrow();
    id v42 = v24;
    sub_100005EB4(&qword_10006A090);
    sub_10001F0C0(0, &qword_10006A098);
    swift_dynamicCast();
    os_log_type_t v25 = (void *)v41[2];
    if (qword_100069940 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_100054EA0();
    sub_1000096F4(v26, (uint64_t)qword_10006B130);
    unint64_t v27 = v25;
    unint64_t v28 = sub_100054E80();
    os_log_type_t v29 = sub_100055C90();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      char v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138412290;
      v41[1] = v27;
      uint64_t v32 = v27;
      sub_100055D70();
      *char v31 = v27;

      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Failed to fetch local user: %@", v30, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v28 = v27;
    }

    swift_errorRelease();
    return 0;
  }
  sub_10001F0C0(0, &qword_10006A0A8);
  unint64_t v7 = sub_100055B60();
  id v8 = v6;

  if (!(v7 >> 62))
  {
    __int16 v9 = *(void **)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_4;
    }
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  __int16 v9 = (void *)sub_100055F30();
  swift_bridgeObjectRelease();
  if (!v9)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    if (qword_100069940 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_100054EA0();
    sub_1000096F4(v35, (uint64_t)qword_10006B130);
    uint64_t v36 = sub_100054E80();
    os_log_type_t v37 = sub_100055C90();
    if (os_log_type_enabled(v36, v37))
    {
      id v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Fetching local user returned empty results.", v38, 2u);
      swift_slowDealloc();
    }

    return 0;
  }
LABEL_4:
  if ((v7 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_100055E10();
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_34;
    }
    id v10 = *(id *)(v7 + 32);
  }
  __int16 v9 = v10;
  swift_bridgeObjectRelease();
  if (qword_100069940 != -1) {
LABEL_34:
  }
    swift_once();
  uint64_t v11 = sub_100054EA0();
  sub_1000096F4(v11, (uint64_t)qword_10006B130);
  uint64_t v12 = sub_100054E80();
  os_log_type_t v13 = sub_100055CB0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Successfully fetched local user.", v14, 2u);
    swift_slowDealloc();
  }

  sub_100054A80();
  id v15 = [v9 givenName];
  if (v15)
  {
    char v16 = v15;
    sub_100055A10();

    sub_100054A50();
    id v17 = [v9 familyName];
    if (v17)
    {
      uint64_t v18 = v17;
      sub_100055A10();

      sub_100054A60();
    }
    uint64_t v19 = sub_100054E80();
    os_log_type_t v20 = sub_100055CB0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Successfully fetched given name of local user.", v21, 2u);
      swift_slowDealloc();
    }

    sub_100054A70();
    id v22 = [v9 dsid];
  }
  else
  {
    id v22 = [v9 dsid];
    uint64_t v33 = (objc_class *)[self mainBundle];
    v40._countAndFlagsBits = 0xE000000000000000;
    v43._object = (void *)0x80000001000599C0;
    v43._countAndFlagsBits = 0xD000000000000016;
    v44.value._countAndFlagsBits = 0;
    v44.value._object = 0;
    v34.super.Class isa = v33;
    v45._countAndFlagsBits = 0;
    v45._object = (void *)0xE000000000000000;
    sub_100054A40(v43, v44, v34, v45, v40);
  }
  [v9 isParent];

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v22;
}

void sub_1000497F0(uint64_t a1)
{
  uint64_t v2 = sub_100054A90();
  id v3 = *(NSObject **)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v106 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = sub_1000490C4();
  uint64_t v121 = v9;
  if (!v6)
  {
    if (qword_100069940 != -1) {
      goto LABEL_79;
    }
    goto LABEL_61;
  }
  uint64_t v111 = v7;
  uint64_t v113 = v6;
  id v10 = (char **)(a1 + 16);
  uint64_t v112 = (char **)(a1 + 16);
  if ((v8 & 1) == 0) {
    goto LABEL_82;
  }
  os_log_t v128 = v3;
  uint64_t v117 = v5;
  uint64_t v118 = v2;
  int v107 = v8;
  id v110 = [self fetchRequest];
  sub_10001F0C0(0, &qword_10006A0C0);
  sub_100005EB4(&qword_10006A0B8);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100058380;
  *(void *)(v11 + 56) = &type metadata for String;
  unint64_t v12 = sub_10001C7B4();
  *(void *)(v11 + 32) = 0xD000000000000018;
  *(void *)(v11 + 40) = 0x800000010005A050;
  *(void *)(v11 + 96) = &type metadata for String;
  *(void *)(v11 + 104) = v12;
  *(void *)(v11 + 64) = v12;
  *(void *)(v11 + 72) = 0xD000000000000010;
  *(void *)(v11 + 80) = 0x800000010005A070;
  sub_100055A10();
  NSString v13 = sub_100055A00();
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_10001F0C0(0, &qword_10006B148);
  *(void *)(v11 + 136) = v14;
  uint64_t v15 = sub_10004A71C(&qword_10006B150, &qword_10006B148);
  *(void *)(v11 + 112) = v13;
  *(void *)(v11 + 176) = &type metadata for String;
  *(void *)(v11 + 184) = v12;
  *(void *)(v11 + 144) = v15;
  *(void *)(v11 + 152) = 0xD000000000000010;
  *(void *)(v11 + 160) = 0x800000010005A070;
  sub_100055A10();
  NSString v16 = sub_100055A00();
  swift_bridgeObjectRelease();
  *(void *)(v11 + 216) = v14;
  *(void *)(v11 + 224) = v15;
  *(void *)(v11 + 192) = v16;
  id v17 = (void *)sub_100055C70();
  id v18 = v110;
  [v110 setPredicate:v17];

  v131[0] = 0;
  id v19 = [v18 execute:v131];
  id v20 = v131[0];
  if (!v19)
  {
    id v79 = v131[0];
    uint64_t v80 = (void *)sub_100054AA0();

    swift_willThrow();
    v131[0] = v80;
    sub_100005EB4(&qword_10006A090);
    sub_10001F0C0(0, &qword_10006A098);
    swift_dynamicCast();
    uint64_t v81 = v130;
    if (qword_100069940 != -1) {
      swift_once();
    }
    uint64_t v82 = sub_100054EA0();
    sub_1000096F4(v82, (uint64_t)qword_10006B130);
    id v83 = v81;
    uint64_t v84 = sub_100054E80();
    os_log_type_t v85 = sub_100055C90();
    if (os_log_type_enabled(v84, v85))
    {
      uint64_t v86 = (uint8_t *)swift_slowAlloc();
      uint64_t v87 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v86 = 138412290;
      uint64_t v129 = (uint64_t)v83;
      id v88 = v83;
      sub_100055D70();
      *uint64_t v87 = v83;

      _os_log_impl((void *)&_mh_execute_header, v84, v85, "Failed to fetch managed users: %@", v86, 0xCu);
      sub_100005EB4(&qword_10006A0A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
      uint64_t v84 = v113;
    }

    swift_errorRelease();
    return;
  }
  uint64_t v21 = v19;
  sub_10001F0C0(0, &qword_10006A0A8);
  unint64_t v22 = sub_100055B60();
  id v23 = v20;

  if (qword_100069940 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_100054EA0();
  v106[1] = sub_1000096F4(v24, (uint64_t)qword_10006B130);
  os_log_type_t v25 = sub_100054E80();
  os_log_type_t v26 = sub_100055CB0();
  BOOL v27 = os_log_type_enabled(v25, v26);
  uint64_t v28 = v118;
  os_log_type_t v29 = v117;
  if (v27)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Successfully fetched managed users.", v30, 2u);
    swift_slowDealloc();
  }

  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v31 = sub_100055F30();
    swift_bridgeObjectRelease();
    if (v31) {
      goto LABEL_10;
    }
    goto LABEL_81;
  }
  uint64_t v31 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v31)
  {
LABEL_81:

    swift_bridgeObjectRelease();
    LOWORD(v8) = v107;
    id v10 = v112;
LABEL_82:
    char v97 = BYTE1(v8);
    char v98 = v8 & 1;
    swift_beginAccess();
    char v99 = *v10;
    uint64_t v100 = v113;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *id v10 = v99;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v99 = sub_100029940(0, *((void *)v99 + 2) + 1, 1, v99);
      *uint64_t v112 = v99;
    }
    unint64_t v103 = *((void *)v99 + 2);
    unint64_t v102 = *((void *)v99 + 3);
    if (v103 >= v102 >> 1)
    {
      char v99 = sub_100029940((char *)(v102 > 1), v103 + 1, 1, v99);
      *uint64_t v112 = v99;
    }
    *((void *)v99 + 2) = v103 + 1;
    uint64_t v104 = &v99[32 * v103];
    uint64_t v105 = v111;
    *((void *)v104 + 4) = v100;
    *((void *)v104 + 5) = v105;
    *((void *)v104 + 6) = v121;
    v104[56] = v98;
    v104[57] = v97 & 1;
    swift_endAccess();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_10:
  unint64_t v32 = 0;
  unint64_t v120 = v22 & 0xC000000000000001;
  uint64_t v109 = v22 & 0xFFFFFFFFFFFFFF8;
  unint64_t v108 = v22 + 32;
  os_log_t v119 = v128 + 1;
  uint64_t v126 = (char *)&type metadata for Swift.AnyObject + 8;
  unint64_t v115 = v22;
  uint64_t v114 = v31;
  while (1)
  {
    if (v120)
    {
      id v33 = (id)sub_100055E10();
    }
    else
    {
      if (v32 >= *(void *)(v109 + 16)) {
        goto LABEL_78;
      }
      id v33 = *(id *)(v108 + 8 * v32);
    }
    NSBundle v34 = v33;
    BOOL v35 = __OFADD__(v32, 1);
    unint64_t v36 = v32 + 1;
    if (v35) {
      goto LABEL_77;
    }
    unint64_t v125 = v36;
    id v37 = [v33 givenName];
    if (!v37)
    {
      swift_bridgeObjectRelease();
      id v89 = [v34 dsid];
      id v90 = [v89 stringValue];

      uint64_t v91 = sub_100055A10();
      unint64_t v93 = v92;

      swift_bridgeObjectRetain();
      uint64_t v94 = sub_100054E80();
      os_log_type_t v95 = sub_100055C90();
      if (os_log_type_enabled(v94, v95))
      {
        uint64_t v96 = (uint8_t *)swift_slowAlloc();
        uint64_t v130 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v96 = 136380675;
        swift_bridgeObjectRetain();
        uint64_t v129 = sub_10001C000(v91, v93, (uint64_t *)&v130);
        sub_100055D70();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v94, v95, "Failed to fetch given name for remote user with dsid: %{private}s", v96, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_bridgeObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
      }

      return;
    }
    id v38 = v37;
    sub_100055A10();

    sub_100054A80();
    sub_100054A50();
    id v39 = [v34 familyName];
    if (v39)
    {
      Swift::String v40 = v39;
      sub_100055A10();

      sub_100054A60();
    }
    uint64_t v41 = sub_100054A70();
    uint64_t v43 = v42;
    id v44 = [v34 userDeviceStates];
    if (v44) {
      break;
    }
    swift_bridgeObjectRelease();

LABEL_12:
    ((void (*)(char *, uint64_t))v119->isa)(v29, v28);
    unint64_t v32 = v125;
    if (v125 == v31) {
      goto LABEL_81;
    }
  }
  Swift::String v45 = v44;
  uint64_t v116 = v41;
  uint64_t v123 = v43;
  id v124 = v34;
  uint64_t v46 = sub_10001F0C0(0, (unint64_t *)&qword_10006A550);
  sub_10004A71C((unint64_t *)&qword_10006A558, (unint64_t *)&qword_10006A550);
  uint64_t v47 = sub_100055BF0();

  uint64_t v127 = v46;
  if ((v47 & 0xC000000000000001) != 0)
  {
    sub_100055DA0();
    sub_100055C10();
    uint64_t v47 = (uint64_t)v131[0];
    os_log_t v128 = (os_log_t)v131[1];
    uint64_t v48 = (uint64_t)v131[2];
    id v49 = v131[3];
    unint64_t v50 = (unint64_t)v131[4];
  }
  else
  {
    id v49 = 0;
    uint64_t v51 = -1 << *(unsigned char *)(v47 + 32);
    uint64_t v52 = *(void *)(v47 + 56);
    os_log_t v128 = (os_log_t)(v47 + 56);
    uint64_t v48 = ~v51;
    uint64_t v53 = -v51;
    if (v53 < 64) {
      uint64_t v54 = ~(-1 << v53);
    }
    else {
      uint64_t v54 = -1;
    }
    unint64_t v50 = v54 & v52;
  }
  uint64_t v122 = v48;
  int64_t v55 = (unint64_t)(v48 + 64) >> 6;
  if (v47 < 0) {
    goto LABEL_31;
  }
LABEL_29:
  if (v50)
  {
    uint64_t v56 = (v50 - 1) & v50;
    unint64_t v57 = __clz(__rbit64(v50)) | ((void)v49 << 6);
    uint64_t v58 = (char *)v49;
    goto LABEL_48;
  }
  int64_t v61 = (int64_t)v49 + 1;
  if (!__OFADD__(v49, 1))
  {
    if (v61 >= v55) {
      goto LABEL_58;
    }
    unint64_t isa = (unint64_t)v128[v61].isa;
    uint64_t v58 = (char *)v49 + 1;
    if (!isa)
    {
      uint64_t v58 = (char *)v49 + 2;
      if ((uint64_t)v49 + 2 >= v55) {
        goto LABEL_58;
      }
      unint64_t isa = (unint64_t)v128[(void)v58].isa;
      if (!isa)
      {
        uint64_t v58 = (char *)v49 + 3;
        if ((uint64_t)v49 + 3 >= v55) {
          goto LABEL_58;
        }
        unint64_t isa = (unint64_t)v128[(void)v58].isa;
        if (!isa)
        {
          uint64_t v58 = (char *)v49 + 4;
          if ((uint64_t)v49 + 4 >= v55) {
            goto LABEL_58;
          }
          unint64_t isa = (unint64_t)v128[(void)v58].isa;
          if (!isa)
          {
            uint64_t v63 = (char *)v49 + 5;
            while ((char *)v55 != v63)
            {
              unint64_t isa = (unint64_t)v128[(void)v63++].isa;
              if (isa)
              {
                uint64_t v58 = v63 - 1;
                goto LABEL_47;
              }
            }
            goto LABEL_58;
          }
        }
      }
    }
LABEL_47:
    uint64_t v56 = (isa - 1) & isa;
    unint64_t v57 = __clz(__rbit64(isa)) + ((void)v58 << 6);
LABEL_48:
    id v60 = *(id *)(*(void *)(v47 + 48) + 8 * v57);
    if (v60)
    {
      while (1)
      {
        id v64 = [v60 device];
        if (!v64) {
          __break(1u);
        }
        uint64_t v65 = v64;
        unsigned int v66 = [v64 platform];

        if (v66 != 4) {
          break;
        }

        id v49 = v58;
        unint64_t v50 = v56;
        if ((v47 & 0x8000000000000000) == 0) {
          goto LABEL_29;
        }
LABEL_31:
        uint64_t v59 = sub_100055DB0();
        if (v59)
        {
          uint64_t v129 = v59;
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v60 = v130;
          swift_unknownObjectRelease();
          uint64_t v58 = (char *)v49;
          uint64_t v56 = v50;
          if (v60) {
            continue;
          }
        }
        goto LABEL_58;
      }
      id v67 = [v124 dsid];
      char v68 = v112;
      swift_beginAccess();
      uint64_t v69 = *v68;
      char v70 = swift_isUniquelyReferenced_nonNull_native();
      *char v68 = v69;
      if ((v70 & 1) == 0)
      {
        uint64_t v69 = sub_100029940(0, *((void *)v69 + 2) + 1, 1, v69);
        *char v68 = v69;
      }
      unint64_t v72 = *((void *)v69 + 2);
      unint64_t v71 = *((void *)v69 + 3);
      if (v72 >= v71 >> 1)
      {
        uint64_t v69 = sub_100029940((char *)(v71 > 1), v72 + 1, 1, v69);
        *uint64_t v112 = v69;
      }
      *((void *)v69 + 2) = v72 + 1;
      uint64_t v73 = &v69[32 * v72];
      uint64_t v74 = v116;
      *((void *)v73 + 4) = v67;
      *((void *)v73 + 5) = v74;
      *((void *)v73 + 6) = v123;
      *((_WORD *)v73 + 28) = 256;
      swift_endAccess();

LABEL_59:
      sub_10004A760();
      uint64_t v28 = v118;
      os_log_type_t v29 = v117;
      uint64_t v31 = v114;
      goto LABEL_12;
    }
LABEL_58:
    swift_bridgeObjectRelease();
    goto LABEL_59;
  }
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  swift_once();
LABEL_61:
  uint64_t v75 = sub_100054EA0();
  sub_1000096F4(v75, (uint64_t)qword_10006B130);
  os_log_t v128 = (os_log_t)sub_100054E80();
  os_log_type_t v76 = sub_100055C90();
  if (os_log_type_enabled(v128, v76))
  {
    uint64_t v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v77 = 0;
    _os_log_impl((void *)&_mh_execute_header, v128, v76, "couldn't fetch local user", v77, 2u);
    swift_slowDealloc();
  }
  os_log_t v78 = v128;
}

uint64_t sub_10004A71C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001F0C0(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004A760()
{
  return swift_release();
}

uint64_t destroy for UserDetail(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserDetail(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for UserDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

__n128 initializeWithTake for UserDetail(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for UserDetail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDetail(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 26)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserDetail(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 26) = 1;
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
    *(unsigned char *)(result + 26) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDetail()
{
  return &type metadata for UserDetail;
}

char *sub_10004A968(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v34 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = (int *)type metadata accessor for UsageTimelineEntry();
    uint64_t v8 = v7[5];
    uint64_t v9 = &v4[v8];
    id v10 = &a2[v8];
    uint64_t v11 = sub_100054C10();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = v7[6];
    NSString v13 = &v4[v12];
    uint64_t v14 = &a2[v12];
    uint64_t v15 = *((void *)v14 + 1);
    *(void *)NSString v13 = *(void *)v14;
    *((void *)v13 + 1) = v15;
    *(_OWORD *)&v4[v7[7]] = *(_OWORD *)&a2[v7[7]];
    uint64_t v16 = v7[8];
    id v17 = &v4[v16];
    id v18 = &a2[v16];
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)id v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    uint64_t v20 = v7[9];
    uint64_t v21 = &v4[v20];
    unint64_t v22 = &a2[v20];
    uint64_t v23 = sub_100054A10();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    os_log_type_t v25 = v22;
    os_log_type_t v26 = a3;
    v24(v21, v25, v23);
    v24(&v4[v7[10]], &a2[v7[10]], v23);
    *(void *)&v4[v7[11]] = *(void *)&a2[v7[11]];
    v4[v7[12]] = a2[v7[12]];
    *(void *)&v4[v7[13]] = *(void *)&a2[v7[13]];
    v4[v7[14]] = a2[v7[14]];
    v4[v7[15]] = a2[v7[15]];
    *(void *)&v4[v7[16]] = *(void *)&a2[v7[16]];
    *(void *)&v4[v7[17]] = *(void *)&a2[v7[17]];
    uint64_t v27 = v7[18];
    uint64_t v28 = *(void **)&a2[v27];
    *(void *)&v4[v27] = v28;
    uint64_t v29 = v26[5];
    uint64_t v30 = &v4[v29];
    uint64_t v31 = &a2[v29];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v32 = v28;
    sub_100005EB4(&qword_10006A9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v33 = sub_1000550E0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 16))(v30, v31, v33);
    }
    else
    {
      *(void *)uint64_t v30 = *(void *)v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v35 = v26[6];
    unint64_t v36 = &v4[v35];
    id v37 = &a2[v35];
    sub_100005EB4(&qword_10006A740);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v38 = sub_1000558C0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 16))(v36, v37, v38);
    }
    else
    {
      *(void *)unint64_t v36 = *(void *)v37;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v39 = v26[7];
    Swift::String v40 = &v4[v39];
    uint64_t v41 = &a2[v39];
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v42 = sub_100055880();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 16))(v40, v41, v42);
    }
    else
    {
      *(void *)Swift::String v40 = *(void *)v41;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v43 = v26[8];
    id v44 = &v4[v43];
    Swift::String v45 = &a2[v43];
    uint64_t v46 = *(void *)v45;
    char v47 = v45[8];
    sub_10004AE04(*(void *)v45, v47);
    *(void *)id v44 = v46;
    v44[8] = v47;
    uint64_t v48 = v26[9];
    id v49 = &v4[v48];
    unint64_t v50 = &a2[v48];
    sub_100005EB4(&qword_10006AE90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v51 = sub_100055120();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
    }
    else
    {
      *(void *)id v49 = *(void *)v50;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_10004AE04(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10004AE10(uint64_t a1, int *a2)
{
  uint64_t v4 = (int *)type metadata accessor for UsageTimelineEntry();
  uint64_t v5 = a1 + v4[5];
  uint64_t v6 = sub_100054C10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + v4[9];
  uint64_t v8 = sub_100054A10();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(a1 + v4[10], v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v10 = a1 + a2[5];
  sub_100005EB4(&qword_10006A9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1000550E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = a1 + a2[6];
  sub_100005EB4(&qword_10006A740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_1000558C0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  uint64_t v14 = a1 + a2[7];
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_100055880();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  }
  else
  {
    swift_release();
  }
  sub_10004B134(*(void *)(a1 + a2[8]), *(unsigned char *)(a1 + a2[8] + 8));
  uint64_t v16 = a1 + a2[9];
  sub_100005EB4(&qword_10006AE90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = sub_100055120();
    id v18 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8);
    return v18(v16, v17);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10004B134(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unsigned char *sub_10004B140(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v5 = (int *)type metadata accessor for UsageTimelineEntry();
  uint64_t v6 = v5[5];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = v5[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = v12[1];
  *uint64_t v11 = *v12;
  v11[1] = v13;
  *(_OWORD *)&a1[v5[7]] = *(_OWORD *)&a2[v5[7]];
  uint64_t v14 = v5[8];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = v5[9];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = sub_100054A10();
  unint64_t v22 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v21 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v22(v19, v20, v21);
  v22(&a1[v5[10]], &a2[v5[10]], v21);
  *(void *)&a1[v5[11]] = *(void *)&a2[v5[11]];
  a1[v5[12]] = a2[v5[12]];
  *(void *)&a1[v5[13]] = *(void *)&a2[v5[13]];
  a1[v5[14]] = a2[v5[14]];
  a1[v5[15]] = a2[v5[15]];
  *(void *)&a1[v5[16]] = *(void *)&a2[v5[16]];
  *(void *)&a1[v5[17]] = *(void *)&a2[v5[17]];
  uint64_t v23 = v5[18];
  uint64_t v24 = *(void **)&a2[v23];
  *(void *)&a1[v23] = v24;
  uint64_t v25 = a3[5];
  os_log_type_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v28 = v24;
  sub_100005EB4(&qword_10006A9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = sub_1000550E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v26, v27, v29);
  }
  else
  {
    *os_log_type_t v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v30 = a3[6];
  uint64_t v31 = &a1[v30];
  id v32 = &a2[v30];
  sub_100005EB4(&qword_10006A740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v33 = sub_1000558C0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
  }
  else
  {
    *uint64_t v31 = *v32;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = a3[7];
  uint64_t v35 = &a1[v34];
  unint64_t v36 = &a2[v34];
  sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v37 = sub_100055880();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
  }
  else
  {
    *uint64_t v35 = *v36;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v38 = a3[8];
  uint64_t v39 = &a1[v38];
  Swift::String v40 = &a2[v38];
  uint64_t v41 = *(void *)v40;
  char v42 = v40[8];
  sub_10004AE04(*(void *)v40, v42);
  *(void *)uint64_t v39 = v41;
  v39[8] = v42;
  uint64_t v43 = a3[9];
  id v44 = &a1[v43];
  Swift::String v45 = &a2[v43];
  sub_100005EB4(&qword_10006AE90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v46 = sub_100055120();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
  }
  else
  {
    *id v44 = *v45;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

unsigned char *sub_10004B580(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for UsageTimelineEntry();
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = v6[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = v6[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  uint64_t v17 = v6[8];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  void *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = v6[9];
  uint64_t v21 = &a1[v20];
  unint64_t v22 = &a2[v20];
  uint64_t v23 = sub_100054A10();
  uint64_t v24 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 24);
  v24(v21, v22, v23);
  v24(&a1[v6[10]], &a2[v6[10]], v23);
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v6[12]] = a2[v6[12]];
  *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[v6[14]] = a2[v6[14]];
  a1[v6[15]] = a2[v6[15]];
  *(void *)&a1[v6[16]] = *(void *)&a2[v6[16]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[17]] = *(void *)&a2[v6[17]];
  uint64_t v25 = v6[18];
  os_log_type_t v26 = *(void **)&a1[v25];
  uint64_t v27 = *(void **)&a2[v25];
  *(void *)&a1[v25] = v27;
  id v28 = v27;

  if (a1 != a2)
  {
    uint64_t v29 = a3[5];
    uint64_t v30 = &a1[v29];
    uint64_t v31 = &a2[v29];
    sub_100005FA8((uint64_t)&a1[v29], &qword_10006A9F0);
    sub_100005EB4(&qword_10006A9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_1000550E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    }
    else
    {
      *uint64_t v30 = *v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v33 = a3[6];
    uint64_t v34 = &a1[v33];
    uint64_t v35 = &a2[v33];
    sub_100005FA8((uint64_t)&a1[v33], &qword_10006A740);
    sub_100005EB4(&qword_10006A740);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v36 = sub_1000558C0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v36 - 8) + 16))(v34, v35, v36);
    }
    else
    {
      *uint64_t v34 = *v35;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v37 = a3[7];
    uint64_t v38 = &a1[v37];
    uint64_t v39 = &a2[v37];
    sub_100005FA8((uint64_t)&a1[v37], &qword_100069C90);
    sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v40 = sub_100055880();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v40 - 8) + 16))(v38, v39, v40);
    }
    else
    {
      *uint64_t v38 = *v39;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v41 = a3[8];
  char v42 = &a1[v41];
  uint64_t v43 = &a2[v41];
  uint64_t v44 = *(void *)v43;
  char v45 = v43[8];
  sub_10004AE04(*(void *)v43, v45);
  uint64_t v46 = *(void *)v42;
  char v47 = v42[8];
  *(void *)char v42 = v44;
  v42[8] = v45;
  sub_10004B134(v46, v47);
  if (a1 != a2)
  {
    uint64_t v48 = a3[9];
    id v49 = &a1[v48];
    unint64_t v50 = &a2[v48];
    sub_100005FA8((uint64_t)&a1[v48], &qword_10006AE90);
    sub_100005EB4(&qword_10006AE90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v51 = sub_100055120();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
    }
    else
    {
      *id v49 = *v50;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

unsigned char *sub_10004BA64(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for UsageTimelineEntry();
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
  *(_OWORD *)&a1[v6[8]] = *(_OWORD *)&a2[v6[8]];
  uint64_t v11 = v6[9];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_100054A10();
  uint64_t v15 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32);
  v15(v12, v13, v14);
  v15(&a1[v6[10]], &a2[v6[10]], v14);
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  a1[v6[12]] = a2[v6[12]];
  *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
  a1[v6[14]] = a2[v6[14]];
  a1[v6[15]] = a2[v6[15]];
  *(void *)&a1[v6[16]] = *(void *)&a2[v6[16]];
  *(void *)&a1[v6[17]] = *(void *)&a2[v6[17]];
  *(void *)&a1[v6[18]] = *(void *)&a2[v6[18]];
  uint64_t v16 = a3[5];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = sub_100005EB4(&qword_10006A9F0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_1000550E0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64));
  }
  uint64_t v21 = a3[6];
  unint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_100005EB4(&qword_10006A740);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v25 = sub_1000558C0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v25 - 8) + 32))(v22, v23, v25);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v22, v23, *(void *)(*(void *)(v24 - 8) + 64));
  }
  uint64_t v26 = a3[7];
  uint64_t v27 = &a1[v26];
  id v28 = &a2[v26];
  uint64_t v29 = sub_100005EB4(&qword_100069C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v30 = sub_100055880();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v30 - 8) + 32))(v27, v28, v30);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
  }
  uint64_t v31 = a3[8];
  uint64_t v32 = a3[9];
  uint64_t v33 = &a1[v31];
  uint64_t v34 = &a2[v31];
  *(void *)uint64_t v33 = *(void *)v34;
  v33[8] = v34[8];
  uint64_t v35 = &a1[v32];
  uint64_t v36 = &a2[v32];
  uint64_t v37 = sub_100005EB4(&qword_10006AE90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = sub_100055120();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v38 - 8) + 32))(v35, v36, v38);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  return a1;
}

unsigned char *sub_10004BE90(unsigned char *a1, unsigned char *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = (int *)type metadata accessor for UsageTimelineEntry();
  uint64_t v7 = v6[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_100054C10();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = v6[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = (uint64_t *)&a2[v11];
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[v6[7]] = *(_OWORD *)&a2[v6[7]];
  uint64_t v16 = v6[8];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = (uint64_t *)&a2[v16];
  uint64_t v20 = *v18;
  uint64_t v19 = v18[1];
  *uint64_t v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  uint64_t v21 = v6[9];
  unint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = sub_100054A10();
  uint64_t v25 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v24 - 8) + 40);
  v25(v22, v23, v24);
  v25(&a1[v6[10]], &a2[v6[10]], v24);
  *(void *)&a1[v6[11]] = *(void *)&a2[v6[11]];
  swift_bridgeObjectRelease();
  a1[v6[12]] = a2[v6[12]];
  *(void *)&a1[v6[13]] = *(void *)&a2[v6[13]];
  swift_bridgeObjectRelease();
  a1[v6[14]] = a2[v6[14]];
  a1[v6[15]] = a2[v6[15]];
  *(void *)&a1[v6[16]] = *(void *)&a2[v6[16]];
  swift_bridgeObjectRelease();
  *(void *)&a1[v6[17]] = *(void *)&a2[v6[17]];
  uint64_t v26 = v6[18];
  uint64_t v27 = *(void **)&a1[v26];
  *(void *)&a1[v26] = *(void *)&a2[v26];

  if (a1 != a2)
  {
    uint64_t v28 = a3[5];
    uint64_t v29 = &a1[v28];
    uint64_t v30 = &a2[v28];
    sub_100005FA8((uint64_t)&a1[v28], &qword_10006A9F0);
    uint64_t v31 = sub_100005EB4(&qword_10006A9F0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_1000550E0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v32 - 8) + 32))(v29, v30, v32);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v29, v30, *(void *)(*(void *)(v31 - 8) + 64));
    }
    uint64_t v33 = a3[6];
    uint64_t v34 = &a1[v33];
    uint64_t v35 = &a2[v33];
    sub_100005FA8((uint64_t)&a1[v33], &qword_10006A740);
    uint64_t v36 = sub_100005EB4(&qword_10006A740);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v37 = sub_1000558C0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v37 - 8) + 32))(v34, v35, v37);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v34, v35, *(void *)(*(void *)(v36 - 8) + 64));
    }
    uint64_t v38 = a3[7];
    uint64_t v39 = &a1[v38];
    uint64_t v40 = &a2[v38];
    sub_100005FA8((uint64_t)&a1[v38], &qword_100069C90);
    uint64_t v41 = sub_100005EB4(&qword_100069C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v42 = sub_100055880();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v42 - 8) + 32))(v39, v40, v42);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v39, v40, *(void *)(*(void *)(v41 - 8) + 64));
    }
  }
  uint64_t v43 = a3[8];
  uint64_t v44 = &a1[v43];
  char v45 = &a2[v43];
  uint64_t v46 = *(void *)v45;
  LOBYTE(v45) = v45[8];
  uint64_t v47 = *(void *)v44;
  char v48 = v44[8];
  *(void *)uint64_t v44 = v46;
  v44[8] = (_BYTE)v45;
  sub_10004B134(v47, v48);
  if (a1 != a2)
  {
    uint64_t v49 = a3[9];
    unint64_t v50 = &a1[v49];
    uint64_t v51 = &a2[v49];
    sub_100005FA8((uint64_t)&a1[v49], &qword_10006AE90);
    uint64_t v52 = sub_100005EB4(&qword_10006AE90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v53 = sub_100055120();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v53 - 8) + 32))(v50, v51, v53);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v50, v51, *(void *)(*(void *)(v52 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10004C35C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004C370);
}

uint64_t sub_10004C370(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UsageTimelineEntry();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_10:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_100005EB4(&qword_10006AAC0);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_9:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_10;
  }
  uint64_t v14 = sub_100005EB4(&qword_10006A730);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v12 = *(void *)(v14 - 8);
    uint64_t v13 = a3[6];
    goto LABEL_9;
  }
  uint64_t v15 = sub_100005EB4(&qword_100069C98);
  if (*(_DWORD *)(*(void *)(v15 - 8) + 84) == a2)
  {
    uint64_t v8 = v15;
    uint64_t v12 = *(void *)(v15 - 8);
    uint64_t v13 = a3[7];
    goto LABEL_9;
  }
  if (a2 == 254)
  {
    unsigned int v17 = *(unsigned __int8 *)(a1 + a3[8] + 8);
    if (v17 > 1) {
      return (v17 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v18 = sub_100005EB4(&qword_10006B158);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
    uint64_t v20 = v18;
    uint64_t v21 = a1 + a3[9];
    return v19(v21, a2, v20);
  }
}

uint64_t sub_10004C594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004C5A8);
}

uint64_t sub_10004C5A8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = type metadata accessor for UsageTimelineEntry();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_100005EB4(&qword_10006AAC0);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  uint64_t v16 = sub_100005EB4(&qword_10006A730);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[6];
    goto LABEL_9;
  }
  uint64_t result = sub_100005EB4(&qword_100069C98);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  if (a3 == 254)
  {
    *(unsigned char *)(a1 + a4[8] + 8) = -(char)a2;
  }
  else
  {
    uint64_t v18 = sub_100005EB4(&qword_10006B158);
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v20 = v18;
    uint64_t v21 = a1 + a4[9];
    return v19(v21, a2, a2, v20);
  }
  return result;
}

uint64_t type metadata accessor for WidgetView()
{
  uint64_t result = qword_10006B1B8;
  if (!qword_10006B1B8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10004C81C()
{
  type metadata accessor for UsageTimelineEntry();
  if (v0 <= 0x3F)
  {
    sub_10004CA10(319, (unint64_t *)&unk_10006AB30, (void (*)(uint64_t))&type metadata accessor for ColorScheme);
    if (v1 <= 0x3F)
    {
      sub_10004CA10(319, (unint64_t *)&unk_10006A920, (void (*)(uint64_t))&type metadata accessor for WidgetFamily);
      if (v2 <= 0x3F)
      {
        sub_10004CA10(319, (unint64_t *)&qword_100069D08, (void (*)(uint64_t))&type metadata accessor for WidgetRenderingMode);
        if (v3 <= 0x3F)
        {
          sub_10004CA10(319, (unint64_t *)&unk_10006B1C8, (void (*)(uint64_t))&type metadata accessor for DynamicTypeSize);
          if (v4 <= 0x3F) {
            swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_10004CA10(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1000550F0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_10004CA64()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_10004CA80@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10004CB60(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, (uint64_t)&unk_100069B68, (void (*)(uint64_t, uint64_t, uint64_t))sub_100005F44, &qword_100069B70).n128_u64[0];
  return result;
}

double sub_10004CAF0@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_10004CB60(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, (uint64_t)&unk_10006A6F8, (void (*)(uint64_t, uint64_t, uint64_t))sub_100005F44, &qword_10006A7C8).n128_u64[0];
  return result;
}

__n128 sub_10004CB60@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t, uint64_t, uint64_t), uint64_t *a18)
{
  uint64_t v20 = a17;
  uint64_t v21 = a18;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  int v24 = a8 & 1;
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (v24) {
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
    sub_100055CA0();
    uint64_t v31 = (void *)sub_100055450();
    sub_100054E70();

    uint64_t v21 = a18;
    uint64_t v20 = a17;
  }
  sub_100055170();
  v20(v18, a9, a16);
  uint64_t v32 = (_OWORD *)(a9 + *(int *)(sub_100005EB4(v21) + 36));
  v32[4] = v38;
  v32[5] = v39;
  v32[6] = v40;
  *uint64_t v32 = v34;
  v32[1] = v35;
  __n128 result = v37;
  v32[2] = v36;
  v32[3] = v37;
  return result;
}

__n128 sub_10004CD44@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_100055CA0();
    uint64_t v23 = (void *)sub_100055450();
    sub_100054E70();
  }
  sub_100055170();
  long long v24 = v13[1];
  *a9 = *v13;
  a9[1] = v24;
  *(_OWORD *)((char *)a9 + 25) = *(_OWORD *)((char *)v13 + 25);
  a9[7] = v30;
  a9[8] = v31;
  a9[9] = v32;
  a9[3] = v26;
  a9[4] = v27;
  __n128 result = v29;
  a9[5] = v28;
  a9[6] = v29;
  return result;
}

uint64_t sub_10004CEF0@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
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
    sub_100055CA0();
    uint64_t v25 = (void *)sub_100055450();
    sub_100054E70();
  }
  sub_100055170();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;

  return swift_bridgeObjectRetain();
}

uint64_t sub_10004D0AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v2 = sub_100055410();
  uint64_t v33 = *(void *)(v2 - 8);
  uint64_t v34 = v2;
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000550E0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v29 - v10;
  uint64_t v30 = sub_100005EB4(&qword_10006B208);
  __chkstk_darwin(v30);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100005EB4(&qword_10006B210);
  uint64_t v31 = *(void *)(v14 - 8);
  uint64_t v32 = v14;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100055670();
  __chkstk_darwin(v17);
  (*(void (**)(char *, void))(v19 + 104))((char *)&v29 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for Color.RGBColorSpace.sRGB(_:));
  uint64_t v20 = sub_100055690();
  uint64_t v21 = *(void *)&v1[*(int *)(type metadata accessor for UsageTimelineEntry() + 52)];
  *(void *)uint64_t v13 = sub_1000552F0();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v22 = sub_100005EB4(&qword_10006B218);
  sub_10004D564(v1, v20, v21, (uint64_t)&v13[*(int *)(v22 + 44)]);
  type metadata accessor for WidgetView();
  sub_100052300(&qword_10006A9F0, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v11);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, enum case for ColorScheme.light(_:), v5);
  char v23 = sub_1000550D0();
  long long v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v24(v9, v5);
  v24(v11, v5);
  uint64_t v25 = self;
  long long v26 = &selRef_systemBackgroundColor;
  if ((v23 & 1) == 0) {
    long long v26 = &selRef_systemGray6Color;
  }
  id v27 = [v25 *v26];
  uint64_t v36 = sub_1000556A0();
  sub_100055400();
  sub_10000D120(&qword_10006B220, &qword_10006B208);
  sub_100055630();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v34);
  swift_release();
  sub_100005FA8((uint64_t)v13, &qword_10006B208);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v31 + 32))(v35, v16, v32);
}

uint64_t sub_10004D564@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v104 = a4;
  uint64_t v105 = a3;
  uint64_t v6 = sub_100005EB4(&qword_10006B228);
  __chkstk_darwin(v6 - 8);
  uint64_t v91 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = sub_100005EB4(&qword_10006B230);
  uint64_t v8 = __chkstk_darwin(v97);
  id v90 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v92 = (char *)&v87 - v10;
  uint64_t v94 = sub_100005EB4(&qword_10006B238);
  __chkstk_darwin(v94);
  uint64_t v96 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100005EB4(&qword_10006B240);
  __chkstk_darwin(v12 - 8);
  id v89 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100005EB4(&qword_10006B248);
  uint64_t v14 = __chkstk_darwin(v93);
  id v88 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v87 = (char *)&v87 - v16;
  uint64_t v17 = sub_100005EB4(&qword_10006B250);
  uint64_t v102 = *(void *)(v17 - 8);
  uint64_t v103 = v17;
  __chkstk_darwin(v17);
  os_log_type_t v95 = (char *)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_1000558C0();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = __chkstk_darwin(v19);
  char v23 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v87 - v24;
  uint64_t v26 = sub_100005EB4(&qword_10006B258);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  uint64_t v101 = (char *)&v87 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v98 = (uint64_t)&v87 - v29;
  uint64_t v30 = sub_100005EB4(&qword_10006B260);
  uint64_t v31 = __chkstk_darwin(v30 - 8);
  uint64_t v100 = (char *)&v87 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v35 = (char *)&v87 - v34;
  __chkstk_darwin(v33);
  __n128 v37 = (char *)&v87 - v36;
  *(void *)uint64_t v35 = sub_100055350();
  *((void *)v35 + 1) = 0;
  v35[16] = 0;
  uint64_t v38 = sub_100005EB4(&qword_10006B268);
  sub_10004DEDC(a1, a2, v105, (uint64_t)&v35[*(int *)(v38 + 44)]);
  char v99 = v37;
  sub_10000D080((uint64_t)v35, (uint64_t)v37, &qword_10006B260);
  type metadata accessor for WidgetView();
  sub_100052300(&qword_10006A740, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v25);
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v23, enum case for WidgetFamily.systemMedium(_:), v19);
  sub_1000527F8();
  sub_100055B40();
  sub_100055B40();
  uint64_t v40 = v106;
  uint64_t v39 = v107;
  uint64_t v41 = *(void (**)(char *, uint64_t))(v20 + 8);
  v41(v23, v19);
  v41(v25, v19);
  if (v39 == v40)
  {
    uint64_t v43 = (uint64_t)v96;
    uint64_t v42 = v97;
    uint64_t v44 = *(void *)(*(void *)&a1[*(int *)(type metadata accessor for UsageTimelineEntry() + 52)] + 16);
    unsigned __int8 v45 = sub_100055460();
    unsigned __int8 v46 = sub_100055480();
    char v47 = sub_100055470();
    sub_100055470();
    int v48 = sub_100055470();
    if (v44)
    {
      if (v48 != v45) {
        char v47 = sub_100055470();
      }
      sub_100055470();
      uint64_t v49 = v42;
      uint64_t v50 = a2;
      if (sub_100055470() != v46) {
        char v47 = sub_100055470();
      }
      uint64_t v51 = (uint64_t)v95;
      uint64_t v52 = (uint64_t)v91;
      uint64_t v53 = (uint64_t)v92;
      uint64_t v54 = v105;
      uint64_t v55 = (uint64_t)v90;
      unsigned char *v91 = v47;
      uint64_t v56 = sub_100005EB4(&qword_10006B278);
      sub_1000514C8(v54, (uint64_t)a1, v50, v52 + *(int *)(v56 + 44));
      uint64_t v57 = sub_100055770();
      uint64_t v59 = v58;
      uint64_t v60 = v55 + *(int *)(v49 + 36);
      sub_100051CD0(v50, v60);
      int64_t v61 = (uint64_t *)(v60 + *(int *)(sub_100005EB4(&qword_10006B280) + 36));
      uint64_t *v61 = v57;
      v61[1] = v59;
      sub_10000D080(v52, v55, &qword_10006B228);
      char v62 = &qword_10006B230;
      sub_10000D080(v55, v53, &qword_10006B230);
      sub_100005F44(v53, v43, &qword_10006B230);
      swift_storeEnumTagMultiPayload();
      sub_100052850(&qword_10006B288, &qword_10006B248, &qword_10006B290, &qword_10006B240);
      sub_100052850(&qword_10006B2A0, &qword_10006B230, &qword_10006B2A8, &qword_10006B228);
      sub_1000553A0();
      uint64_t v63 = v53;
    }
    else
    {
      if (v48 != v45) {
        char v47 = sub_100055470();
      }
      sub_100055470();
      unsigned __int8 v72 = sub_100055470();
      uint64_t v73 = v93;
      uint64_t v74 = a2;
      uint64_t v75 = (uint64_t)a1;
      uint64_t v76 = (uint64_t)v87;
      uint64_t v77 = (uint64_t)v88;
      os_log_t v78 = v89;
      if (v72 != v46) {
        char v47 = sub_100055470();
      }
      unsigned char *v78 = v47;
      uint64_t v79 = sub_100005EB4(&qword_10006B2B0);
      sub_100050E74(v75, v74, (uint64_t)&v78[*(int *)(v79 + 44)]);
      uint64_t v80 = sub_100055770();
      uint64_t v82 = v81;
      uint64_t v83 = v77 + *(int *)(v73 + 36);
      sub_100051CD0(v74, v83);
      uint64_t v84 = (uint64_t *)(v83 + *(int *)(sub_100005EB4(&qword_10006B280) + 36));
      uint64_t *v84 = v80;
      v84[1] = v82;
      sub_10000D080((uint64_t)v78, v77, &qword_10006B240);
      char v62 = &qword_10006B248;
      sub_10000D080(v77, v76, &qword_10006B248);
      sub_100005F44(v76, v43, &qword_10006B248);
      swift_storeEnumTagMultiPayload();
      sub_100052850(&qword_10006B288, &qword_10006B248, &qword_10006B290, &qword_10006B240);
      sub_100052850(&qword_10006B2A0, &qword_10006B230, &qword_10006B2A8, &qword_10006B228);
      uint64_t v51 = (uint64_t)v95;
      sub_1000553A0();
      uint64_t v63 = v76;
    }
    sub_100005FA8(v63, v62);
    uint64_t v65 = v103;
    uint64_t v66 = v104;
    uint64_t v68 = (uint64_t)v101;
    uint64_t v67 = v102;
    uint64_t v70 = (uint64_t)v99;
    uint64_t v69 = (uint64_t)v100;
    uint64_t v71 = v98;
    sub_10000D080(v51, v98, &qword_10006B250);
    uint64_t v64 = 0;
  }
  else
  {
    uint64_t v64 = 1;
    uint64_t v65 = v103;
    uint64_t v66 = v104;
    uint64_t v68 = (uint64_t)v101;
    uint64_t v67 = v102;
    uint64_t v70 = (uint64_t)v99;
    uint64_t v69 = (uint64_t)v100;
    uint64_t v71 = v98;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v67 + 56))(v71, v64, 1, v65);
  sub_100005F44(v70, v69, &qword_10006B260);
  sub_100005F44(v71, v68, &qword_10006B258);
  sub_100005F44(v69, v66, &qword_10006B260);
  uint64_t v85 = sub_100005EB4(&qword_10006B270);
  sub_100005F44(v68, v66 + *(int *)(v85 + 48), &qword_10006B258);
  sub_100005FA8(v71, &qword_10006B258);
  sub_100005FA8(v70, &qword_10006B260);
  sub_100005FA8(v68, &qword_10006B258);
  return sub_100005FA8(v69, &qword_10006B260);
}

uint64_t sub_10004DEDC@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v145 = a3;
  uint64_t v147 = a2;
  uint64_t v158 = a4;
  uint64_t v152 = sub_100005EB4(&qword_10006B2E8);
  uint64_t v5 = __chkstk_darwin(v152);
  char v144 = (char *)&v141 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v146 = (uint64_t)&v141 - v7;
  uint64_t v148 = sub_100005EB4(&qword_10006B2F0);
  __chkstk_darwin(v148);
  uint64_t v151 = (uint64_t)&v141 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = sub_100005EB4(&qword_10006B2F8);
  uint64_t v9 = __chkstk_darwin(v150);
  BOOL v142 = (char *)&v141 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v143 = (uint64_t)&v141 - v11;
  uint64_t v156 = sub_100005EB4(&qword_10006B300);
  uint64_t v154 = *(void *)(v156 - 8);
  __chkstk_darwin(v156);
  uint64_t v149 = (char *)&v141 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100005EB4(&qword_10006B308);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  unint64_t v157 = (char *)&v141 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  unint64_t v155 = (char *)&v141 - v16;
  uint64_t v17 = sub_1000558C0();
  uint64_t v167 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  char v166 = (char *)&v141 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v165 = (uint64_t)&v141 - v20;
  uint64_t v21 = sub_100005EB4(&qword_10006B310);
  __chkstk_darwin(v21 - 8);
  char v23 = (char *)&v141 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005EB4(&qword_10006B318);
  __chkstk_darwin(v24);
  uint64_t v26 = (char *)&v141 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_100005EB4(&qword_10006B320);
  __chkstk_darwin(v162);
  uint64_t v28 = (char *)&v141 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_100005EB4(&qword_10006B328);
  __chkstk_darwin(v159);
  uint64_t v163 = (uint64_t)&v141 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = sub_100005EB4(&qword_10006B330);
  uint64_t v30 = __chkstk_darwin(v161);
  uint64_t v153 = (char *)&v141 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v160 = (char *)&v141 - v33;
  __chkstk_darwin(v32);
  uint64_t v169 = (uint64_t)&v141 - v34;
  *(void *)char v23 = sub_100055360();
  *((void *)v23 + 1) = 0x4020000000000000;
  v23[16] = 0;
  uint64_t v35 = sub_100005EB4(&qword_10006B338);
  sub_10004EDC4(a1, (uint64_t)&v23[*(int *)(v35 + 44)]);
  char v36 = sub_1000554A0();
  uint64_t v164 = type metadata accessor for WidgetView();
  uint64_t v37 = *(int *)(v164 + 32);
  unint64_t v168 = a1;
  uint64_t v38 = &a1[v37];
  uint64_t v39 = *(void *)v38;
  char v40 = v38[8];
  sub_10004AE04(*(void *)v38, v40);
  char v41 = sub_1000525F4(v39, v40);
  sub_10004B134(v39, v40);
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  if ((v41 & 1) == 0)
  {
    sub_1000550C0();
    uint64_t v43 = v47;
    uint64_t v44 = v48;
    uint64_t v45 = v49;
    uint64_t v46 = v50;
  }
  sub_100005F44((uint64_t)v23, (uint64_t)v26, &qword_10006B310);
  uint64_t v51 = &v26[*(int *)(v24 + 36)];
  *uint64_t v51 = v36;
  *((void *)v51 + 1) = v43;
  *((void *)v51 + 2) = v44;
  *((void *)v51 + 3) = v45;
  *((void *)v51 + 4) = v46;
  v51[40] = v41 & 1;
  sub_100005FA8((uint64_t)v23, &qword_10006B310);
  char v52 = sub_1000554C0();
  uint64_t v53 = *(void *)v38;
  char v54 = v38[8];
  sub_10004AE04(*(void *)v38, v54);
  char v55 = sub_1000525F4(v53, v54);
  sub_10004B134(v53, v54);
  uint64_t v56 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  if ((v55 & 1) == 0)
  {
    sub_1000550C0();
    uint64_t v42 = v59;
    uint64_t v56 = v60;
    uint64_t v57 = v61;
    uint64_t v58 = v62;
  }
  sub_100005F44((uint64_t)v26, (uint64_t)v28, &qword_10006B318);
  uint64_t v63 = &v28[*(int *)(v162 + 36)];
  *uint64_t v63 = v52;
  *((void *)v63 + 1) = v42;
  *((void *)v63 + 2) = v56;
  *((void *)v63 + 3) = v57;
  *((void *)v63 + 4) = v58;
  v63[40] = v55 & 1;
  sub_100005FA8((uint64_t)v26, &qword_10006B318);
  char v64 = sub_1000554D0();
  uint64_t v65 = *(void *)v38;
  char v66 = v38[8];
  sub_10004AE04(*(void *)v38, v66);
  char v67 = sub_1000525F4(v65, v66);
  sub_10004B134(v65, v66);
  uint64_t v68 = (uint64_t)v168;
  if ((v67 & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v69 = v165;
  sub_100052300(&qword_10006A740, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, v165);
  uint64_t v71 = v166;
  uint64_t v70 = v167;
  (*(void (**)(char *, void, uint64_t))(v167 + 104))(v166, enum case for WidgetFamily.systemMedium(_:), v17);
  sub_1000527F8();
  sub_100055B40();
  sub_100055B40();
  uint64_t v72 = v170;
  uint64_t v73 = v171;
  uint64_t v74 = *(void (**)(char *, uint64_t))(v70 + 8);
  uint64_t v75 = v71;
  uint64_t v68 = (uint64_t)v168;
  v74(v75, v17);
  v74((char *)v69, v17);
  if (v73 != v72)
  {
    char v84 = 1;
    uint64_t v77 = 0;
    uint64_t v79 = 0;
    uint64_t v81 = 0;
    uint64_t v83 = 0;
  }
  else
  {
LABEL_7:
    sub_1000550C0();
    uint64_t v77 = v76;
    uint64_t v79 = v78;
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    char v84 = 0;
  }
  uint64_t v85 = v163;
  uint64_t v86 = v159;
  sub_100005F44((uint64_t)v28, v163, &qword_10006B320);
  uint64_t v87 = v85 + *(int *)(v86 + 36);
  *(unsigned char *)uint64_t v87 = v64;
  *(void *)(v87 + 8) = v77;
  *(void *)(v87 + 16) = v79;
  *(void *)(v87 + 24) = v81;
  *(void *)(v87 + 32) = v83;
  *(unsigned char *)(v87 + 40) = v84;
  sub_100005FA8((uint64_t)v28, &qword_10006B320);
  char v88 = sub_1000554B0();
  uint64_t v89 = *(void *)v38;
  char v90 = v38[8];
  sub_10004AE04(*(void *)v38, v90);
  char v91 = sub_1000525F4(v89, v90);
  sub_10004B134(v89, v90);
  if ((v91 & 1) == 0)
  {
    uint64_t v93 = enum case for WidgetFamily.systemLarge(_:);
    uint64_t v100 = (uint64_t)v160;
    uint64_t v99 = v161;
    goto LABEL_13;
  }
  uint64_t v92 = v165;
  sub_100052300(&qword_10006A740, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, v165);
  uint64_t v93 = enum case for WidgetFamily.systemLarge(_:);
  os_log_type_t v95 = v166;
  uint64_t v94 = v167;
  (*(void (**)(char *, void, uint64_t))(v167 + 104))(v166, enum case for WidgetFamily.systemLarge(_:), v17);
  sub_1000527F8();
  sub_100055B40();
  sub_100055B40();
  uint64_t v97 = v170;
  uint64_t v96 = v171;
  uint64_t v98 = *(void (**)(char *, uint64_t))(v94 + 8);
  v98(v95, v17);
  v98((char *)v92, v17);
  if (v96 == v97)
  {
    uint64_t v85 = v163;
    uint64_t v100 = (uint64_t)v160;
    uint64_t v99 = v161;
    uint64_t v68 = (uint64_t)v168;
LABEL_13:
    sub_1000550C0();
    uint64_t v102 = v101;
    uint64_t v104 = v103;
    uint64_t v106 = v105;
    uint64_t v108 = v107;
    char v109 = 0;
    goto LABEL_15;
  }
  char v109 = 1;
  uint64_t v102 = 0;
  uint64_t v104 = 0;
  uint64_t v106 = 0;
  uint64_t v108 = 0;
  uint64_t v85 = v163;
  uint64_t v100 = (uint64_t)v160;
  uint64_t v99 = v161;
  uint64_t v68 = (uint64_t)v168;
LABEL_15:
  sub_100005F44(v85, v100, &qword_10006B328);
  uint64_t v110 = v100 + *(int *)(v99 + 36);
  *(unsigned char *)uint64_t v110 = v88;
  *(void *)(v110 + 8) = v102;
  *(void *)(v110 + 16) = v104;
  *(void *)(v110 + 24) = v106;
  *(void *)(v110 + 32) = v108;
  *(unsigned char *)(v110 + 40) = v109;
  sub_100005FA8(v85, &qword_10006B328);
  sub_10000D080(v100, v169, &qword_10006B330);
  uint64_t v111 = v165;
  sub_100052300(&qword_10006A740, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, v165);
  uint64_t v113 = v166;
  uint64_t v112 = v167;
  (*(void (**)(char *, uint64_t, uint64_t))(v167 + 104))(v166, v93, v17);
  sub_1000527F8();
  sub_100055B40();
  sub_100055B40();
  uint64_t v115 = v170;
  uint64_t v114 = v171;
  uint64_t v116 = *(void (**)(char *, uint64_t))(v112 + 8);
  v116(v113, v17);
  v116((char *)v111, v17);
  if (v114 == v115)
  {
    uint64_t v117 = *(void *)(*(void *)(v68 + *(int *)(type metadata accessor for UsageTimelineEntry() + 52)) + 16);
    unsigned __int8 v118 = sub_100055460();
    char v119 = sub_100055480();
    char v120 = sub_100055470();
    sub_100055470();
    int v121 = sub_100055470();
    if (v117)
    {
      if (v121 != v118) {
        char v120 = sub_100055470();
      }
      sub_100055470();
      char v122 = sub_100055470();
      uint64_t v123 = (uint64_t)v157;
      uint64_t v124 = (uint64_t)v155;
      uint64_t v125 = (uint64_t)v149;
      if (v122 != v119) {
        char v120 = sub_100055470();
      }
      uint64_t v126 = (uint64_t)v144;
      *char v144 = v120;
      uint64_t v127 = sub_100005EB4(&qword_10006B348);
      sub_1000507FC(v145, v68, v147, v126 + *(int *)(v127 + 44));
      os_log_t v128 = &qword_10006B2E8;
      uint64_t v129 = v146;
      sub_10000D080(v126, v146, &qword_10006B2E8);
      sub_100005F44(v129, v151, &qword_10006B2E8);
      swift_storeEnumTagMultiPayload();
      sub_10000D120(&qword_10006B350, &qword_10006B2F8);
    }
    else
    {
      if (v121 != v118) {
        char v120 = sub_100055470();
      }
      sub_100055470();
      char v135 = sub_100055470();
      uint64_t v123 = (uint64_t)v157;
      uint64_t v124 = (uint64_t)v155;
      uint64_t v125 = (uint64_t)v149;
      if (v135 != v119) {
        char v120 = sub_100055470();
      }
      uint64_t v136 = (uint64_t)v142;
      *BOOL v142 = v120;
      uint64_t v137 = sub_100005EB4(&qword_10006B360);
      sub_100050388(v68, v147, v136 + *(int *)(v137 + 44));
      os_log_t v128 = &qword_10006B2F8;
      uint64_t v129 = v143;
      sub_10000D080(v136, v143, &qword_10006B2F8);
      sub_100005F44(v129, v151, &qword_10006B2F8);
      swift_storeEnumTagMultiPayload();
      sub_10000D120(&qword_10006B350, &qword_10006B2F8);
    }
    sub_10000D120(&qword_10006B358, &qword_10006B2E8);
    sub_1000553A0();
    sub_100005FA8(v129, v128);
    uint64_t v131 = v158;
    uint64_t v132 = v156;
    uint64_t v133 = v154;
    uint64_t v134 = (uint64_t)v153;
    sub_10000D080(v125, v124, &qword_10006B300);
    uint64_t v130 = 0;
  }
  else
  {
    uint64_t v130 = 1;
    uint64_t v123 = (uint64_t)v157;
    uint64_t v131 = v158;
    uint64_t v132 = v156;
    uint64_t v124 = (uint64_t)v155;
    uint64_t v133 = v154;
    uint64_t v134 = (uint64_t)v153;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v133 + 56))(v124, v130, 1, v132);
  uint64_t v138 = v169;
  sub_100005F44(v169, v134, &qword_10006B330);
  sub_100005F44(v124, v123, &qword_10006B308);
  sub_100005F44(v134, v131, &qword_10006B330);
  uint64_t v139 = sub_100005EB4(&qword_10006B340);
  sub_100005F44(v123, v131 + *(int *)(v139 + 48), &qword_10006B308);
  sub_100005FA8(v124, &qword_10006B308);
  sub_100005FA8(v138, &qword_10006B330);
  sub_100005FA8(v123, &qword_10006B308);
  return sub_100005FA8(v134, &qword_10006B330);
}

uint64_t sub_10004EDC4@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v134 = a2;
  uint64_t v3 = sub_1000558C0();
  uint64_t v131 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v130 = (char *)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v129 = (uint64_t)&v116 - v6;
  uint64_t v128 = sub_100054A10();
  uint64_t v127 = *(void *)(v128 - 8);
  __chkstk_darwin(v128);
  uint64_t v126 = (char *)&v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = type metadata accessor for ScreenTimeWidgetGraph();
  uint64_t v8 = __chkstk_darwin(v125);
  uint64_t v133 = (uint64_t)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v136 = (uint64_t *)((char *)&v116 - v10);
  uint64_t v11 = sub_100005EB4(&qword_10006B398);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v116 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = type metadata accessor for WidgetView();
  __chkstk_darwin(v124);
  uint64_t v15 = (char *)&v116 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100005EB4(&qword_10006B3A0);
  __chkstk_darwin(v16);
  uint64_t v18 = (uint64_t *)((char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = sub_100005EB4(&qword_10006B3A8);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v116 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100005EB4(&qword_10006B3B0);
  __chkstk_darwin(v22);
  char v119 = (char *)&v116 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100005EB4(&qword_10006B3B8);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v132 = (uint64_t)&v116 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v135 = (uint64_t)&v116 - v27;
  BOOL v28 = *a1 == 1;
  uint64_t v123 = v18;
  uint64_t v122 = v16;
  uint64_t v121 = v22;
  uint64_t v120 = v11;
  if (v28)
  {
    sub_100055310();
    uint64_t v29 = sub_100055530();
    uint64_t v31 = v30;
    char v33 = v32 & 1;
    sub_1000554F0();
    unsigned __int8 v118 = a1;
    uint64_t v34 = sub_100055520();
    uint64_t v117 = v3;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    char v39 = v38;
    uint64_t v116 = v19;
    swift_release();
    sub_10000AB4C(v29, v31, v33);
    swift_bridgeObjectRelease();
    id v40 = [self secondaryLabelColor];
    sub_1000556A0();
    uint64_t v41 = sub_100055510();
    uint64_t v43 = v42;
    char v45 = v44;
    uint64_t v47 = v46;
    swift_release();
    LOBYTE(v31) = v45 & 1;
    uint64_t v48 = v35;
    uint64_t v3 = v117;
    sub_10000AB4C(v48, v37, v39 & 1);
    swift_bridgeObjectRelease();
    *(void *)uint64_t v21 = v41;
    *((void *)v21 + 1) = v43;
    v21[16] = v45 & 1;
    *((void *)v21 + 3) = v47;
    swift_storeEnumTagMultiPayload();
    sub_10000C29C(v41, v43, v45 & 1);
    sub_10000D120(&qword_10006B3C8, &qword_10006B398);
    swift_bridgeObjectRetain();
    uint64_t v49 = (uint64_t)v119;
    sub_1000553A0();
    sub_100005F44(v49, (uint64_t)v123, &qword_10006B3B0);
    swift_storeEnumTagMultiPayload();
    sub_10005298C();
    a1 = v118;
    sub_1000553A0();
    sub_100005FA8(v49, &qword_10006B3B0);
    sub_10000AB4C(v41, v43, v31);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  uint64_t v50 = type metadata accessor for UsageTimelineEntry();
  int v51 = a1[*(int *)(v50 + 60)];
  sub_100052A2C((uint64_t)a1, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for WidgetView);
  if (v51 == 1)
  {
    sub_100052AE8((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for WidgetView);
LABEL_7:
    *(void *)uint64_t v13 = sub_100055300();
    *((void *)v13 + 1) = 0;
    v13[16] = 1;
    uint64_t v53 = sub_100005EB4(&qword_10006B3E8);
    sub_10004FBEC((uint64_t)a1, (uint64_t)&v13[*(int *)(v53 + 44)]);
    sub_100005F44((uint64_t)v13, (uint64_t)v21, &qword_10006B398);
    swift_storeEnumTagMultiPayload();
    sub_10000D120(&qword_10006B3C8, &qword_10006B398);
    uint64_t v54 = (uint64_t)v119;
    sub_1000553A0();
    sub_100005F44(v54, (uint64_t)v123, &qword_10006B3B0);
    swift_storeEnumTagMultiPayload();
    sub_10005298C();
    sub_1000553A0();
    sub_100005FA8(v54, &qword_10006B3B0);
    sub_100005FA8((uint64_t)v13, &qword_10006B398);
    goto LABEL_9;
  }
  int v52 = v15[*(int *)(v50 + 56)];
  sub_100052AE8((uint64_t)v15, (uint64_t (*)(void))type metadata accessor for WidgetView);
  if (v52 == 1) {
    goto LABEL_7;
  }
  sub_100055310();
  uint64_t v55 = sub_100055530();
  unsigned __int8 v118 = a1;
  uint64_t v57 = v56;
  char v59 = v58 & 1;
  sub_1000554F0();
  uint64_t v60 = v3;
  uint64_t v61 = sub_100055520();
  uint64_t v63 = v62;
  char v65 = v64;
  swift_release();
  char v66 = v65 & 1;
  sub_10000AB4C(v55, v57, v59);
  swift_bridgeObjectRelease();
  id v67 = [self secondaryLabelColor];
  sub_1000556A0();
  uint64_t v68 = sub_100055510();
  uint64_t v70 = v69;
  char v72 = v71;
  uint64_t v74 = v73;
  swift_release();
  char v75 = v66;
  uint64_t v3 = v60;
  sub_10000AB4C(v61, v63, v75);
  swift_bridgeObjectRelease();
  uint64_t v76 = v123;
  uint64_t *v123 = v68;
  v76[1] = v70;
  a1 = v118;
  *((unsigned char *)v76 + 16) = v72 & 1;
  v76[3] = v74;
  swift_storeEnumTagMultiPayload();
  sub_10005298C();
  sub_1000553A0();
LABEL_9:
  uint64_t v77 = (int *)type metadata accessor for UsageTimelineEntry();
  uint64_t v78 = *(void *)&a1[v77[11]];
  uint64_t v79 = v127;
  uint64_t v80 = v126;
  uint64_t v81 = v128;
  (*(void (**)(char *, unsigned char *, uint64_t))(v127 + 16))(v126, &a1[v77[10]], v128);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v83 = (char *)v136;
  *uint64_t v136 = KeyPath;
  sub_100005EB4(&qword_100069C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v84 = v125;
  *(void *)&v83[*(int *)(v125 + 20)] = v78;
  (*(void (**)(char *, char *, uint64_t))(v79 + 32))(&v83[*(int *)(v84 + 24)], v80, v81);
  swift_bridgeObjectRetain();
  uint64_t v85 = v129;
  sub_100052300(&qword_10006A740, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, v129);
  uint64_t v87 = v130;
  uint64_t v86 = v131;
  (*(void (**)(char *, void, uint64_t))(v131 + 104))(v130, enum case for WidgetFamily.systemLarge(_:), v3);
  sub_1000527F8();
  sub_100055B40();
  sub_100055B40();
  uint64_t v88 = v141;
  uint64_t v89 = v137;
  char v90 = *(void (**)(char *, uint64_t))(v86 + 8);
  v90(v87, v3);
  v90((char *)v85, v3);
  if (v88 == v89)
  {
    uint64_t v91 = *(void *)&a1[v77[16]];
    uint64_t v92 = *(void *)(v91 + 16);
    if (v92)
    {
      sub_100005EB4(&qword_100069EE0);
      uint64_t v93 = swift_allocObject();
      *(_OWORD *)(v93 + 16) = xmmword_100057E90;
      uint64_t v94 = self;
      swift_bridgeObjectRetain();
      id v95 = [v94 systemBlueColor];
      *(void *)(v93 + 32) = sub_1000556A0();
      id v96 = [v94 systemTealColor];
      *(void *)(v93 + 40) = sub_1000556A0();
      id v97 = [v94 systemOrangeColor];
      *(void *)(v93 + 48) = sub_1000556A0();
      uint64_t v141 = v93;
      sub_100055B70();
      uint64_t v137 = v91;
      uint64_t v138 = v92;
      uint64_t v139 = v141;
      char v140 = 1;
    }
    else
    {
      uint64_t v101 = a1[v77[14]];
      sub_100005EB4(&qword_100069EE0);
      uint64_t v102 = swift_allocObject();
      *(_OWORD *)(v102 + 16) = xmmword_100057E90;
      uint64_t v103 = self;
      id v104 = [v103 systemBlueColor];
      *(void *)(v102 + 32) = sub_1000556A0();
      id v105 = [v103 systemTealColor];
      *(void *)(v102 + 40) = sub_1000556A0();
      id v106 = [v103 systemOrangeColor];
      *(void *)(v102 + 48) = sub_1000556A0();
      uint64_t v141 = v102;
      sub_100055B70();
      uint64_t v137 = v101;
      uint64_t v138 = 3;
      uint64_t v139 = v141;
      char v140 = 0;
    }
    sub_100052B9C();
    sub_100052BF0();
    sub_1000553A0();
    uint64_t v98 = v142;
    uint64_t v131 = v141;
    uint64_t v99 = v143;
    unsigned __int8 v100 = v144;
  }
  else
  {
    uint64_t v131 = 0;
    uint64_t v98 = 0;
    uint64_t v99 = 0;
    unsigned __int8 v100 = -1;
  }
  uint64_t v107 = v135;
  uint64_t v108 = v132;
  sub_100005F44(v135, v132, &qword_10006B3B8);
  char v109 = v136;
  uint64_t v110 = v133;
  sub_100052A2C((uint64_t)v136, v133, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  uint64_t v111 = v134;
  sub_100005F44(v108, v134, &qword_10006B3B8);
  uint64_t v112 = sub_100005EB4(&qword_10006B3D0);
  sub_100052A2C(v110, v111 + *(int *)(v112 + 48), (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  uint64_t v113 = v111 + *(int *)(v112 + 64);
  uint64_t v114 = v131;
  *(void *)uint64_t v113 = v131;
  *(void *)(v113 + 8) = v98;
  *(void *)(v113 + 16) = v99;
  *(unsigned char *)(v113 + 24) = v100;
  sub_100052A94(v114, v98, v99, v100);
  sub_100052AE8((uint64_t)v109, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  sub_100005FA8(v107, &qword_10006B3B8);
  sub_100052B48(v114, v98, v99, v100);
  sub_100052AE8(v110, (uint64_t (*)(void))type metadata accessor for ScreenTimeWidgetGraph);
  return sub_100005FA8(v108, &qword_10006B3B8);
}

uint64_t sub_10004FBEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = sub_100055340();
  uint64_t v61 = *(void *)(v63 - 8);
  __chkstk_darwin(v63);
  char v59 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100005EB4(&qword_10006B3F0);
  uint64_t v5 = __chkstk_darwin(v62);
  uint64_t v60 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v48 - v8;
  __chkstk_darwin(v7);
  uint64_t v64 = (uint64_t)&v48 - v10;
  uint64_t v11 = sub_100005EB4(&qword_10006ABA8);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000556C0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100005EB4(&qword_10006ABB0);
  uint64_t v53 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  int v52 = (char *)&v48 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_100005EB4(&qword_10006ABB8);
  __chkstk_darwin(v51);
  uint64_t v21 = (char *)&v48 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100005EB4(&qword_10006ABC0);
  uint64_t v56 = *(void *)(v22 - 8);
  uint64_t v57 = v22;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v48 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100005EB4(&qword_10006B3F8);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v58 = (uint64_t)&v48 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  uint64_t v54 = (uint64_t)&v48 - v28;
  uint64_t v55 = type metadata accessor for UsageTimelineEntry();
  uint64_t v29 = *(void **)(a1 + *(int *)(v55 + 72));
  if (v29)
  {
    id v30 = v29;
    sub_1000556B0();
    uint64_t v49 = v18;
    (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, enum case for Image.ResizingMode.stretch(_:), v14);
    sub_1000556E0();
    uint64_t v50 = a1;
    swift_release();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    sub_1000558A0();
    uint64_t v31 = sub_1000558B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v13, 0, 1, v31);
    char v32 = v52;
    sub_1000556D0();
    swift_release();
    sub_100005FA8((uint64_t)v13, &qword_10006ABA8);
    sub_100055770();
    sub_100055100();
    uint64_t v33 = v53;
    uint64_t v34 = v49;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v21, v32, v49);
    uint64_t v35 = &v21[*(int *)(v51 + 36)];
    long long v36 = v70;
    *(_OWORD *)uint64_t v35 = v69;
    *((_OWORD *)v35 + 1) = v36;
    *((_OWORD *)v35 + 2) = v71;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v34);
    sub_100005F44((uint64_t)v21, (uint64_t)v24, &qword_10006ABB8);
    uint64_t v37 = v57;
    v24[*(int *)(v57 + 36)] = 1;
    a1 = v50;
    sub_100005FA8((uint64_t)v21, &qword_10006ABB8);
    uint64_t v38 = v54;
    sub_10000D080((uint64_t)v24, v54, &qword_10006ABC0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v56 + 56))(v38, 0, 1, v37);
  }
  else
  {
    uint64_t v38 = v54;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v56 + 56))(v54, 1, 1, v57);
  }
  uint64_t v39 = *(void *)(a1 + *(int *)(v55 + 68));
  uint64_t v40 = sub_1000554E0();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v65 = v39;
  char v66 = 0;
  uint64_t v67 = KeyPath;
  uint64_t v68 = v40;
  uint64_t v42 = v59;
  sub_100055330();
  sub_100005EB4(&qword_10006B400);
  sub_100052CF4();
  uint64_t v43 = (uint64_t)v60;
  sub_100055600();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v63);
  swift_release();
  swift_release();
  sub_100055150();
  sub_100005FA8(v43, &qword_10006B3F0);
  uint64_t v44 = v64;
  sub_10000D080((uint64_t)v9, v64, &qword_10006B3F0);
  uint64_t v45 = v58;
  sub_100005F44(v38, v58, &qword_10006B3F8);
  sub_100005F44(v44, (uint64_t)v9, &qword_10006B3F0);
  sub_100005F44(v45, a2, &qword_10006B3F8);
  uint64_t v46 = sub_100005EB4(&qword_10006B428);
  sub_100005F44((uint64_t)v9, a2 + *(int *)(v46 + 48), &qword_10006B3F0);
  sub_100005FA8(v44, &qword_10006B3F0);
  sub_100005FA8(v38, &qword_10006B3F8);
  sub_100005FA8((uint64_t)v9, &qword_10006B3F0);
  return sub_100005FA8(v45, &qword_10006B3F8);
}

uint64_t sub_100050388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v56 = a3;
  uint64_t v57 = a2;
  uint64_t v4 = type metadata accessor for MostUsedItemsPlaceholderView(0);
  uint64_t v5 = (int *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_100005EB4(&qword_10006B368);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100005EB4(&qword_10006B370);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v55 = (uint64_t)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v54 = (uint64_t)&v48 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v53 = (char *)&v48 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v48 - v19;
  uint64_t v52 = *(int *)(type metadata accessor for UsageTimelineEntry() + 56);
  char v21 = *(unsigned char *)(a1 + v52);
  *uint64_t v7 = swift_getKeyPath();
  uint64_t v51 = sub_100005EB4(&qword_100069C90);
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v7 + v5[7]) = 2;
  *(uint64_t *)((char *)v7 + v5[8]) = 3;
  *((unsigned char *)v7 + v5[9]) = v21;
  uint64_t v22 = sub_100055770();
  uint64_t v50 = (void (*)(uint64_t, uint64_t, uint64_t))sub_100052A2C;
  sub_10004CB60(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v22, v23, (uint64_t)type metadata accessor for MostUsedItemsPlaceholderView, (void (*)(uint64_t, uint64_t, uint64_t))sub_100052A2C, &qword_10006B368);
  sub_100052AE8((uint64_t)v7, type metadata accessor for MostUsedItemsPlaceholderView);
  uint64_t v24 = sub_100055770();
  uint64_t v26 = v25;
  uint64_t v27 = *(int *)(v12 + 44);
  uint64_t v49 = v20;
  uint64_t v28 = &v20[v27];
  sub_100051CD0(v57, (uint64_t)&v20[v27]);
  uint64_t v48 = sub_100005EB4(&qword_10006B280);
  uint64_t v29 = (uint64_t *)&v28[*(int *)(v48 + 36)];
  uint64_t *v29 = v24;
  v29[1] = v26;
  sub_10000D080((uint64_t)v10, (uint64_t)v20, &qword_10006B368);
  LOBYTE(v28) = *(unsigned char *)(a1 + v52);
  *uint64_t v7 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  *(uint64_t *)((char *)v7 + v5[7]) = 2;
  *(uint64_t *)((char *)v7 + v5[8]) = 2;
  *((unsigned char *)v7 + v5[9]) = (_BYTE)v28;
  uint64_t v30 = sub_100055770();
  sub_10004CB60(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, 0.0, 1, v30, v31, (uint64_t)type metadata accessor for MostUsedItemsPlaceholderView, v50, &qword_10006B368);
  sub_100052AE8((uint64_t)v7, type metadata accessor for MostUsedItemsPlaceholderView);
  uint64_t v32 = sub_100055770();
  uint64_t v34 = v33;
  uint64_t v35 = *(int *)(v12 + 44);
  uint64_t v36 = (uint64_t)v53;
  uint64_t v37 = &v53[v35];
  sub_100051CD0(v57, (uint64_t)&v53[v35]);
  uint64_t v38 = (uint64_t *)&v37[*(int *)(v48 + 36)];
  *uint64_t v38 = v32;
  v38[1] = v34;
  sub_10000D080((uint64_t)v10, v36, &qword_10006B368);
  uint64_t v39 = (uint64_t)v49;
  uint64_t v40 = v54;
  sub_100005F44((uint64_t)v49, v54, &qword_10006B370);
  uint64_t v41 = v36;
  uint64_t v42 = v55;
  sub_100005F44(v36, v55, &qword_10006B370);
  uint64_t v43 = v40;
  uint64_t v44 = v40;
  uint64_t v45 = v56;
  sub_100005F44(v43, v56, &qword_10006B370);
  uint64_t v46 = sub_100005EB4(&qword_10006B378);
  sub_100005F44(v42, v45 + *(int *)(v46 + 48), &qword_10006B370);
  sub_100005FA8(v41, &qword_10006B370);
  sub_100005FA8(v39, &qword_10006B370);
  sub_100005FA8(v42, &qword_10006B370);
  return sub_100005FA8(v44, &qword_10006B370);
}

uint64_t sub_1000507FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v75 = a2;
  uint64_t v76 = a3;
  uint64_t v72 = a4;
  uint64_t v74 = type metadata accessor for MostUsedItemsLarge(0);
  uint64_t v5 = __chkstk_darwin(v74);
  uint64_t v7 = (uint64_t *)((char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  uint64_t v9 = (uint64_t *)((char *)&v63 - v8);
  uint64_t v10 = sub_100005EB4(&qword_10006B380);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v69 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v73 = sub_100005EB4(&qword_10006B388);
  uint64_t v15 = __chkstk_darwin(v73);
  uint64_t v71 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v70 = (uint64_t)&v63 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  char v66 = (char *)&v63 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v68 = (uint64_t)&v63 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v63 - v24;
  __chkstk_darwin(v23);
  uint64_t v67 = (uint64_t)&v63 - v26;
  unint64_t v27 = *(void *)(a1 + 16);
  if (v27 >= 6) {
    uint64_t v28 = 6;
  }
  else {
    uint64_t v28 = *(void *)(a1 + 16);
  }
  uint64_t v63 = a1 + 32;
  sub_100056000();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v29 = (void *)swift_dynamicCastClass();
  if (!v29)
  {
    swift_bridgeObjectRelease();
    uint64_t v29 = _swiftEmptyArrayStorage;
  }
  uint64_t v30 = v29[2];
  swift_release();
  if (v30 == v28)
  {
    uint64_t v31 = (void *)swift_dynamicCastClass();
    if (!v31)
    {
      swift_bridgeObjectRelease();
      uint64_t v31 = _swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v31 = sub_10001D390(a1, v63, 0, (2 * v28) | 1);
  }
  swift_bridgeObjectRelease();
  uint64_t *v9 = swift_getKeyPath();
  uint64_t v65 = sub_100005EB4(&qword_100069C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = v74;
  *(uint64_t *)((char *)v9 + *(int *)(v74 + 20)) = (uint64_t)v31;
  *(uint64_t *)((char *)v9 + *(int *)(v32 + 24)) = 2;
  uint64_t v33 = sub_100055780();
  sub_10004CB60(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v14, 0.0, 1, 0.0, 1, v33, v34, (uint64_t)type metadata accessor for MostUsedItemsLarge, (void (*)(uint64_t, uint64_t, uint64_t))sub_100052A2C, &qword_10006B380);
  sub_100052AE8((uint64_t)v9, type metadata accessor for MostUsedItemsLarge);
  uint64_t v35 = sub_100055770();
  uint64_t v37 = v36;
  uint64_t v38 = (uint64_t)&v25[*(int *)(v73 + 36)];
  sub_100051CD0(v76, v38);
  uint64_t v64 = sub_100005EB4(&qword_10006B280);
  uint64_t v39 = (uint64_t *)(v38 + *(int *)(v64 + 36));
  *uint64_t v39 = v35;
  v39[1] = v37;
  sub_10000D080((uint64_t)v14, (uint64_t)v25, &qword_10006B380);
  uint64_t v40 = (uint64_t)v25;
  uint64_t v41 = v67;
  sub_10000D080(v40, v67, &qword_10006B388);
  if (v27 >= 4) {
    uint64_t v42 = 4;
  }
  else {
    uint64_t v42 = v27;
  }
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v43 = (void *)swift_dynamicCastClass();
  if (!v43)
  {
    swift_bridgeObjectRelease();
    uint64_t v43 = _swiftEmptyArrayStorage;
  }
  uint64_t v44 = v43[2];
  swift_release();
  if (v44 == v42)
  {
    uint64_t v45 = (void *)swift_dynamicCastClass();
    if (!v45)
    {
      swift_bridgeObjectRelease();
      uint64_t v45 = _swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v45 = sub_10001D390(a1, v63, 0, (2 * v42) | 1);
  }
  swift_bridgeObjectRelease();
  *uint64_t v7 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v46 = v74;
  *(uint64_t *)((char *)v7 + *(int *)(v74 + 20)) = (uint64_t)v45;
  *(uint64_t *)((char *)v7 + *(int *)(v46 + 24)) = 2;
  uint64_t v47 = sub_100055780();
  uint64_t v48 = v69;
  sub_10004CB60(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v69, 0.0, 1, 0.0, 1, v47, v49, (uint64_t)type metadata accessor for MostUsedItemsLarge, (void (*)(uint64_t, uint64_t, uint64_t))sub_100052A2C, &qword_10006B380);
  sub_100052AE8((uint64_t)v7, type metadata accessor for MostUsedItemsLarge);
  uint64_t v50 = sub_100055770();
  uint64_t v52 = v51;
  uint64_t v53 = (uint64_t)v66;
  uint64_t v54 = (uint64_t)&v66[*(int *)(v73 + 36)];
  sub_100051CD0(v76, v54);
  uint64_t v55 = (uint64_t *)(v54 + *(int *)(v64 + 36));
  *uint64_t v55 = v50;
  v55[1] = v52;
  sub_10000D080(v48, v53, &qword_10006B380);
  uint64_t v56 = v53;
  uint64_t v57 = v68;
  sub_10000D080(v56, v68, &qword_10006B388);
  uint64_t v58 = v70;
  sub_100005F44(v41, v70, &qword_10006B388);
  uint64_t v59 = v71;
  sub_100005F44(v57, v71, &qword_10006B388);
  uint64_t v60 = v72;
  sub_100005F44(v58, v72, &qword_10006B388);
  uint64_t v61 = sub_100005EB4(&qword_10006B390);
  sub_100005F44(v59, v60 + *(int *)(v61 + 48), &qword_10006B388);
  sub_100005FA8(v57, &qword_10006B388);
  sub_100005FA8(v41, &qword_10006B388);
  sub_100005FA8(v59, &qword_10006B388);
  return sub_100005FA8(v58, &qword_10006B388);
}

uint64_t sub_100050E74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v64 = a2;
  uint64_t v60 = a3;
  uint64_t v62 = sub_100005EB4(&qword_10006B280);
  __chkstk_darwin(v62);
  uint64_t v66 = (uint64_t)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100005EB4(&qword_10006B2C8);
  uint64_t v5 = __chkstk_darwin(v61);
  uint64_t v59 = (uint64_t)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v58 = (uint64_t)&v48 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v57 = (uint64_t)&v48 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v48 - v15;
  __chkstk_darwin(v14);
  uint64_t v65 = (uint64_t)&v48 - v17;
  uint64_t v18 = type metadata accessor for UsageTimelineEntry();
  uint64_t v56 = *(int *)(v18 + 56);
  LODWORD(v54) = *(unsigned __int8 *)(a1 + v56);
  uint64_t v19 = *(int *)(v18 + 28);
  uint64_t v63 = a1;
  uint64_t v55 = v19;
  sub_100055770();
  sub_100055170();
  uint64_t v20 = v79;
  uint64_t v21 = v81;
  uint64_t v22 = v83;
  uint64_t v49 = v85;
  uint64_t v50 = v87;
  uint64_t v51 = v89;
  uint64_t v52 = v92;
  uint64_t v53 = v91;
  char v78 = v80;
  char v77 = v82;
  char v76 = v84;
  char v75 = v86;
  char v74 = v88;
  char v73 = v90;
  uint64_t v23 = sub_100055770();
  uint64_t v25 = v24;
  uint64_t v26 = v66;
  uint64_t v27 = v63;
  sub_100051CD0(v64, v66);
  uint64_t v28 = (uint64_t *)(v26 + *(int *)(v62 + 36));
  *uint64_t v28 = v23;
  v28[1] = v25;
  sub_100005F44(v26, (uint64_t)&v16[*(int *)(v61 + 36)], &qword_10006B280);
  *(void *)uint64_t v16 = 4;
  v16[8] = v54;
  *((void *)v16 + 2) = v20;
  v16[24] = v78;
  *((void *)v16 + 4) = v21;
  v16[40] = v77;
  *((void *)v16 + 6) = v22;
  v16[56] = v76;
  *((void *)v16 + 8) = v49;
  v16[72] = v75;
  *((void *)v16 + 10) = v50;
  v16[88] = v74;
  *((void *)v16 + 12) = v51;
  v16[104] = v73;
  uint64_t v29 = v52;
  *((void *)v16 + 14) = v53;
  *((void *)v16 + 15) = v29;
  sub_100005FA8(v26, &qword_10006B280);
  sub_10000D080((uint64_t)v16, v65, &qword_10006B2C8);
  LODWORD(v56) = *(unsigned __int8 *)(v27 + v56);
  sub_100055770();
  sub_100055170();
  uint64_t v30 = v93;
  uint64_t v31 = v95;
  uint64_t v32 = v97;
  uint64_t v33 = v99;
  uint64_t v34 = v101;
  uint64_t v55 = v105;
  uint64_t v53 = v103;
  uint64_t v54 = v106;
  char v72 = v94;
  char v71 = v96;
  char v70 = v98;
  char v69 = v100;
  char v68 = v102;
  char v67 = v104;
  uint64_t v35 = sub_100055770();
  uint64_t v37 = v36;
  uint64_t v38 = v66;
  sub_100051CD0(v64, v66);
  uint64_t v39 = (uint64_t *)(v38 + *(int *)(v62 + 36));
  *uint64_t v39 = v35;
  v39[1] = v37;
  sub_100005F44(v38, (uint64_t)&v11[*(int *)(v61 + 36)], &qword_10006B280);
  *(void *)uint64_t v11 = 3;
  v11[8] = v56;
  *((void *)v11 + 2) = v30;
  v11[24] = v72;
  *((void *)v11 + 4) = v31;
  v11[40] = v71;
  *((void *)v11 + 6) = v32;
  v11[56] = v70;
  *((void *)v11 + 8) = v33;
  v11[72] = v69;
  *((void *)v11 + 10) = v34;
  v11[88] = v68;
  *((void *)v11 + 12) = v53;
  v11[104] = v67;
  uint64_t v40 = v54;
  *((void *)v11 + 14) = v55;
  *((void *)v11 + 15) = v40;
  sub_100005FA8(v38, &qword_10006B280);
  uint64_t v41 = v57;
  sub_10000D080((uint64_t)v11, v57, &qword_10006B2C8);
  uint64_t v42 = v65;
  uint64_t v43 = v58;
  sub_100005F44(v65, v58, &qword_10006B2C8);
  uint64_t v44 = v59;
  sub_100005F44(v41, v59, &qword_10006B2C8);
  uint64_t v45 = v60;
  sub_100005F44(v43, v60, &qword_10006B2C8);
  uint64_t v46 = sub_100005EB4(&qword_10006B2D0);
  sub_100005F44(v44, v45 + *(int *)(v46 + 48), &qword_10006B2C8);
  sub_100005FA8(v41, &qword_10006B2C8);
  sub_100005FA8(v42, &qword_10006B2C8);
  sub_100005FA8(v44, &qword_10006B2C8);
  return sub_100005FA8(v43, &qword_10006B2C8);
}

uint64_t sub_1000514C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v85 = a3;
  uint64_t v81 = a4;
  uint64_t v83 = sub_100005EB4(&qword_10006B280);
  __chkstk_darwin(v83);
  uint64_t v87 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_100005EB4(&qword_10006B2D8);
  uint64_t v6 = __chkstk_darwin(v82);
  uint64_t v80 = (uint64_t)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v79 = (uint64_t)&v62 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v62 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v78 = (uint64_t)&v62 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v62 - v16;
  __chkstk_darwin(v15);
  uint64_t v86 = (uint64_t)&v62 - v18;
  unint64_t v77 = *(void *)(a1 + 16);
  if (v77 >= 4) {
    uint64_t v19 = 4;
  }
  else {
    uint64_t v19 = v77;
  }
  uint64_t v62 = a1 + 32;
  uint64_t v20 = sub_100056000();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v21 = (void *)swift_dynamicCastClass();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = _swiftEmptyArrayStorage;
  }
  uint64_t v22 = v21[2];
  swift_release();
  uint64_t v75 = v20;
  if (v22 == v19)
  {
    uint64_t v23 = (void *)swift_dynamicCastClass();
    if (!v23)
    {
      swift_bridgeObjectRelease();
      uint64_t v23 = _swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v23 = sub_10001D390(a1, v62, 0, (2 * v19) | 1);
  }
  swift_bridgeObjectRelease();
  uint64_t v76 = *(int *)(type metadata accessor for UsageTimelineEntry() + 28);
  double v24 = *(double *)(v84 + v76) * 0.3;
  uint64_t v25 = sub_100055770();
  sub_10004CEF0(v24, 0, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v88, 0.0, 1, INFINITY, 0, v25, v26, (uint64_t)v23);
  swift_release();
  unint64_t v28 = v88;
  uint64_t v27 = v89;
  char v29 = v90;
  uint64_t v74 = v91;
  LODWORD(v73) = v92;
  uint64_t v72 = v93;
  LODWORD(v71) = v94;
  uint64_t v70 = v95;
  LODWORD(v69) = v96;
  uint64_t v68 = v97;
  int v67 = v98;
  uint64_t v66 = v99;
  int v65 = v100;
  uint64_t v64 = v101;
  uint64_t v63 = v102;
  uint64_t v30 = sub_100055770();
  uint64_t v32 = v31;
  uint64_t v33 = v87;
  sub_100051CD0(v85, v87);
  uint64_t v34 = (uint64_t *)(v33 + *(int *)(v83 + 36));
  *uint64_t v34 = v30;
  v34[1] = v32;
  sub_100005F44(v33, (uint64_t)&v17[*(int *)(v82 + 36)], &qword_10006B280);
  *(void *)uint64_t v17 = v28;
  *((void *)v17 + 1) = v27;
  v17[16] = v29;
  *((void *)v17 + 3) = v74;
  v17[32] = v73;
  *((void *)v17 + 5) = v72;
  v17[48] = v71;
  *((void *)v17 + 7) = v70;
  v17[64] = v69;
  *((void *)v17 + 9) = v68;
  v17[80] = v67;
  *((void *)v17 + 11) = v66;
  v17[96] = v65;
  uint64_t v35 = v63;
  *((void *)v17 + 13) = v64;
  *((void *)v17 + 14) = v35;
  sub_100005FA8(v33, &qword_10006B280);
  sub_10000D080((uint64_t)v17, v86, &qword_10006B2D8);
  if (v77 >= 3) {
    uint64_t v36 = 3;
  }
  else {
    uint64_t v36 = v77;
  }
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain_n();
  uint64_t v37 = (void *)swift_dynamicCastClass();
  if (!v37)
  {
    swift_bridgeObjectRelease();
    uint64_t v37 = _swiftEmptyArrayStorage;
  }
  uint64_t v38 = v37[2];
  swift_release();
  if (v38 == v36)
  {
    uint64_t v39 = (void *)swift_dynamicCastClass();
    if (!v39)
    {
      swift_bridgeObjectRelease();
      uint64_t v39 = _swiftEmptyArrayStorage;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v39 = sub_10001D390(a1, v62, 0, (2 * v36) | 1);
  }
  swift_bridgeObjectRelease();
  double v40 = *(double *)(v84 + v76) * 0.3;
  uint64_t v41 = sub_100055770();
  sub_10004CEF0(v40, 0, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)&v88, 0.0, 1, INFINITY, 0, v41, v42, (uint64_t)v39);
  swift_release();
  unint64_t v77 = v88;
  uint64_t v76 = v89;
  char v43 = v90;
  uint64_t v44 = v91;
  char v45 = v92;
  uint64_t v46 = v93;
  char v47 = v94;
  uint64_t v75 = v95;
  LODWORD(v74) = v96;
  uint64_t v73 = v97;
  LODWORD(v72) = v98;
  uint64_t v71 = v99;
  LODWORD(v70) = v100;
  uint64_t v69 = v101;
  uint64_t v68 = v102;
  uint64_t v48 = sub_100055770();
  uint64_t v50 = v49;
  uint64_t v51 = v87;
  sub_100051CD0(v85, v87);
  uint64_t v52 = (uint64_t *)(v51 + *(int *)(v83 + 36));
  *uint64_t v52 = v48;
  v52[1] = v50;
  sub_100005F44(v51, (uint64_t)&v12[*(int *)(v82 + 36)], &qword_10006B280);
  uint64_t v53 = v76;
  *(void *)uint64_t v12 = v77;
  *((void *)v12 + 1) = v53;
  v12[16] = v43;
  *((void *)v12 + 3) = v44;
  v12[32] = v45;
  *((void *)v12 + 5) = v46;
  v12[48] = v47;
  *((void *)v12 + 7) = v75;
  v12[64] = v74;
  *((void *)v12 + 9) = v73;
  v12[80] = v72;
  *((void *)v12 + 11) = v71;
  v12[96] = v70;
  uint64_t v54 = v68;
  *((void *)v12 + 13) = v69;
  *((void *)v12 + 14) = v54;
  sub_100005FA8(v51, &qword_10006B280);
  uint64_t v55 = v78;
  sub_10000D080((uint64_t)v12, v78, &qword_10006B2D8);
  uint64_t v56 = v86;
  uint64_t v57 = v79;
  sub_100005F44(v86, v79, &qword_10006B2D8);
  uint64_t v58 = v80;
  sub_100005F44(v55, v80, &qword_10006B2D8);
  uint64_t v59 = v81;
  sub_100005F44(v57, v81, &qword_10006B2D8);
  uint64_t v60 = sub_100005EB4(&qword_10006B2E0);
  sub_100005F44(v58, v59 + *(int *)(v60 + 48), &qword_10006B2D8);
  sub_100005FA8(v55, &qword_10006B2D8);
  sub_100005FA8(v56, &qword_10006B2D8);
  sub_100005FA8(v58, &qword_10006B2D8);
  return sub_100005FA8(v57, &qword_10006B2D8);
}

uint64_t sub_100051CD0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v50 = a2;
  uint64_t v2 = sub_1000550E0();
  uint64_t v45 = *(void *)(v2 - 8);
  uint64_t v46 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  char v43 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v42 = (uint64_t)v38 - v5;
  uint64_t v48 = sub_100005EB4(&qword_10006B2B8);
  __chkstk_darwin(v48);
  uint64_t v49 = (void *)((char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1000553D0();
  __chkstk_darwin(v7 - 8);
  v38[1] = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100055440();
  uint64_t v39 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v10 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_100005EB4(&qword_10006A7E0);
  uint64_t v11 = __chkstk_darwin(v47);
  uint64_t v13 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v40 = (uint64_t)v38 - v14;
  uint64_t v15 = sub_100055880();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)v38 - v20;
  type metadata accessor for WidgetView();
  sub_100052300(&qword_100069C90, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x800000010005A090, (uint64_t)v21);
  sub_100055870();
  char v22 = sub_100055860();
  uint64_t v23 = *(void (**)(char *, uint64_t))(v16 + 8);
  v23(v19, v15);
  v23(v21, v15);
  if (v22)
  {
    sub_1000553C0();
    sub_100055430();
    uint64_t v24 = v39;
    uint64_t v25 = v41;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(&v13[*(int *)(v47 + 36)], v10, v41);
    *(void *)uint64_t v13 = v44;
    uint64_t v26 = *(void (**)(char *, uint64_t))(v24 + 8);
    swift_retain();
    v26(v10, v25);
    uint64_t v27 = v40;
    sub_10000D080((uint64_t)v13, v40, &qword_10006A7E0);
    sub_100005F44(v27, (uint64_t)v49, &qword_10006A7E0);
    swift_storeEnumTagMultiPayload();
    sub_100052910();
    sub_1000553A0();
    return sub_100005FA8(v27, &qword_10006A7E0);
  }
  else
  {
    uint64_t v29 = v42;
    sub_100052300(&qword_10006A9F0, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, v42);
    uint64_t v31 = v45;
    uint64_t v30 = v46;
    uint64_t v32 = v43;
    (*(void (**)(char *, void, uint64_t))(v45 + 104))(v43, enum case for ColorScheme.light(_:), v46);
    char v33 = sub_1000550D0();
    uint64_t v34 = *(void (**)(char *, uint64_t))(v31 + 8);
    v34(v32, v30);
    v34((char *)v29, v30);
    uint64_t v35 = self;
    uint64_t v36 = &selRef_secondarySystemBackgroundColor;
    if ((v33 & 1) == 0) {
      uint64_t v36 = &selRef_systemGray5Color;
    }
    id v37 = [v35 *v36];
    *uint64_t v49 = sub_1000556A0();
    swift_storeEnumTagMultiPayload();
    sub_100052910();
    return sub_1000553A0();
  }
}

uint64_t sub_10005228C@<X0>(uint64_t a1@<X8>)
{
  return sub_100052300(&qword_100069C90, (uint64_t (*)(void))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x800000010005A090, a1);
}

uint64_t sub_1000522C4@<X0>(uint64_t a1@<X8>)
{
  return sub_100052300(&qword_10006A740, (uint64_t (*)(void))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, a1);
}

uint64_t sub_100052300@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v27 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1000552D0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100005EB4(a1);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005F44(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_100055CA0();
    uint64_t v21 = sub_100055450();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v25 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v26 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_10001C000(v27, v25, &v29);
      sub_100055D70();
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_1000552C0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1000525B8@<X0>(uint64_t a1@<X8>)
{
  return sub_100052300(&qword_10006A9F0, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_1000525F4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1000552D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_100055CA0();
  uint64_t v9 = sub_100055450();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v13 = sub_10001C000(1819242306, 0xE400000000000000, &v14);
    sub_100055D70();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000552C0();
  swift_getAtKeyPath();
  sub_10004B134(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

unint64_t sub_1000527F8()
{
  unint64_t result = qword_10006A130;
  if (!qword_10006A130)
  {
    sub_1000558C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006A130);
  }
  return result;
}

uint64_t sub_100052850(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007D80(a2);
    sub_10000D120(a3, a4);
    sub_10000D120(&qword_10006B298, &qword_10006B280);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100052910()
{
  unint64_t result = qword_10006B2C0;
  if (!qword_10006B2C0)
  {
    sub_100007D80(&qword_10006A7E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B2C0);
  }
  return result;
}

unint64_t sub_10005298C()
{
  unint64_t result = qword_10006B3C0;
  if (!qword_10006B3C0)
  {
    sub_100007D80(&qword_10006B3B0);
    sub_10000D120(&qword_10006B3C8, &qword_10006B398);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B3C0);
  }
  return result;
}

uint64_t sub_100052A2C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100052A94(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_100052AAC(result, a2, a3, a4 & 1);
  }
  return result;
}

uint64_t sub_100052AAC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100052AE8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100052B48(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  if (a4 != 255) {
    return sub_100052B60(result, a2, a3, a4 & 1);
  }
  return result;
}

uint64_t sub_100052B60(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4) {
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

unint64_t sub_100052B9C()
{
  unint64_t result = qword_10006B3D8;
  if (!qword_10006B3D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B3D8);
  }
  return result;
}

unint64_t sub_100052BF0()
{
  unint64_t result = qword_10006B3E0;
  if (!qword_10006B3E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B3E0);
  }
  return result;
}

uint64_t sub_100052C44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100055250();
  *a1 = result;
  return result;
}

uint64_t sub_100052C70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100055250();
  *a1 = result;
  return result;
}

uint64_t sub_100052C9C()
{
  return sub_100055260();
}

uint64_t sub_100052CC8()
{
  return sub_100055260();
}

unint64_t sub_100052CF4()
{
  unint64_t result = qword_10006B408;
  if (!qword_10006B408)
  {
    sub_100007D80(&qword_10006B400);
    sub_100052D94();
    sub_10000D120(&qword_10006B418, &qword_10006B420);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B408);
  }
  return result;
}

unint64_t sub_100052D94()
{
  unint64_t result = qword_10006B410;
  if (!qword_10006B410)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B410);
  }
  return result;
}

uint64_t sub_100052DE8()
{
  return swift_getOpaqueTypeConformance2();
}

id STSelectUserIntent.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id STSelectUserIntent.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSelectUserIntent();
  return [super init];
}

uint64_t type metadata accessor for STSelectUserIntent()
{
  return self;
}

id STUser.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id STSelectUserIntent.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntent();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id STSelectUserIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100055A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithIdentifier:v6 backingStore:a3];

  return v7;
}

id STSelectUserIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100055A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for STSelectUserIntent();
  id v6 = [super initWithIdentifier:v5 backingStore:a3];

  return v6;
}

id STSelectUserIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100055A00();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100055A00();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.unint64_t isa = sub_100055980().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.unint64_t isa = 0;
  }
  id v10 = [objc_allocWithZone(v5) initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id STSelectUserIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = sub_100055A00();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100055A00();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9.super.unint64_t isa = sub_100055980().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.unint64_t isa = 0;
  }
  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for STSelectUserIntent();
  id v10 = [super initWithDomain:v7 verb:v8 parametersByName:v9.super.isa];

  return v10;
}

id STSelectUserIntent.__deallocating_deinit()
{
  return sub_100053BF8(type metadata accessor for STSelectUserIntent);
}

unint64_t STSelectUserIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100053C30(a1);
}

Swift::Int sub_1000534D4()
{
  Swift::UInt v1 = *v0;
  sub_100056070();
  sub_100056080(v1);
  return sub_1000560A0();
}

void sub_10005351C()
{
  sub_100056080(*v0);
}

Swift::Int sub_100053548()
{
  Swift::UInt v1 = *v0;
  sub_100056070();
  sub_100056080(v1);
  return sub_1000560A0();
}

unint64_t sub_10005358C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_100053C30(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t STSelectUserIntentResponse.code.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR___STSelectUserIntentResponse_code;
  swift_beginAccess();
  return *(void *)v1;
}

char *STSelectUserIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[objc_allocWithZone(v2) init];
  id v6 = &v5[OBJC_IVAR___STSelectUserIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

char *STSelectUserIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  NSString v5 = (char *)[v2 init];
  id v6 = &v5[OBJC_IVAR___STSelectUserIntentResponse_code];
  swift_beginAccess();
  *(void *)id v6 = a1;
  NSString v7 = v5;
  [v7 setUserActivity:a2];

  return v7;
}

id STSelectUserIntentResponse.init()()
{
  *(void *)&v0[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return [super init];
}

id STSelectUserIntentResponse.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  [super initWithCoder:a1];

  return v3;
}

id STSelectUserIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithBackingStore:a1];

  return v3;
}

id STSelectUserIntentResponse.init(backingStore:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  [super initWithBackingStore:a1];

  return v3;
}

id sub_100053A00(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  *(void *)&a1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  return [super a3];
}

id STSelectUserIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  if (a1)
  {
    v2.super.unint64_t isa = sub_100055980().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.unint64_t isa = 0;
  }
  id v3 = [objc_allocWithZone(v1) initWithPropertiesByName:v2.super.isa];

  return v3;
}

id STSelectUserIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___STSelectUserIntentResponse_code] = 0;
  if (a1)
  {
    v2.super.unint64_t isa = sub_100055980().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.unint64_t isa = 0;
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STSelectUserIntentResponse();
  [v5 initWithPropertiesByName:v2.super.isa];

  if (v3) {
  return v3;
  }
}

id STSelectUserIntentResponse.__deallocating_deinit()
{
  return sub_100053BF8(type metadata accessor for STSelectUserIntentResponse);
}

id sub_100053BF8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  [super dealloc];
}

unint64_t sub_100053C30(unint64_t result)
{
  if (result > 6) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for STSelectUserIntentResponse()
{
  return self;
}

unint64_t sub_100053C68()
{
  unint64_t result = qword_10006B438;
  if (!qword_10006B438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10006B438);
  }
  return result;
}

uint64_t sub_100053CBC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  objc_super v3 = (void *)(*a1 + OBJC_IVAR___STSelectUserIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_100053D10(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  objc_super v3 = (void *)(*a2 + OBJC_IVAR___STSelectUserIntentResponse_code);
  uint64_t result = swift_beginAccess();
  *objc_super v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for STSelectUserIntentResponseCode()
{
  return &type metadata for STSelectUserIntentResponseCode;
}

id STUser.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100055A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100055A00();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100055A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  id v11 = [objc_allocWithZone(v6) initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

id STUser.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2)
  {
    NSString v8 = sub_100055A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  NSString v9 = sub_100055A00();
  swift_bridgeObjectRelease();
  if (a6)
  {
    NSString v10 = sub_100055A00();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for STUser();
  [super initWithIdentifier:v8 displayString:v9 pronunciationHint:v10];

  return v11;
}

uint64_t type metadata accessor for STUser()
{
  return self;
}

id STUser.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for STUser();
  [super initWithCoder:a1];

  return v3;
}

id STUser.__deallocating_deinit()
{
  return sub_1000547C8(type metadata accessor for STUser);
}

id static STUserResolutionResult.success(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  [super successWithResolvedObject:a1];

  return v2;
}

id static STUserResolutionResult.disambiguation(with:)(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100054250();
    swift_bridgeObjectRetain();
    sub_100055EE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_100055FF0();
    sub_100054250();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_100054250();
  Class isa = sub_100055B50().super.isa;
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  [super disambiguationWithObjectsToDisambiguate:isa];

  return v3;
}

unint64_t sub_100054250()
{
  unint64_t result = qword_10006B4B8;
  if (!qword_10006B4B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10006B4B8);
  }
  return result;
}

id static STUserResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  v4.receiver = (id)swift_getObjCClassFromMetadata();
  v4.super_class = (Class)&OBJC_METACLASS___STUserResolutionResult;
  [super confirmationRequiredWithObjectToConfirm:a1];

  return v2;
}

void static STUserResolutionResult.success(with:)()
{
}

void static STUserResolutionResult.disambiguation(with:)()
{
}

void static STUserResolutionResult.confirmationRequired(with:)()
{
}

id STUserResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  id v4 = objc_allocWithZone(v2);
  Class isa = sub_100055980().super.isa;
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithJSONDictionary:isa forIntent:a2];

  return v6;
}

id STUserResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  Class isa = sub_100055980().super.isa;
  swift_bridgeObjectRelease();
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for STUserResolutionResult();
  id v5 = objc_msgSendSuper2(&v8, "initWithJSONDictionary:forIntent:", isa, a2);

  id v6 = v5;
  if (v6) {

  }
  return v6;
}

uint64_t type metadata accessor for STUserResolutionResult()
{
  return self;
}

id STUserResolutionResult.__deallocating_deinit()
{
  return sub_1000547C8(type metadata accessor for STUserResolutionResult);
}

id sub_1000547C8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t sub_100054800()
{
  return static AppIntentInternal.sideEffect.getter();
}

uint64_t sub_100054810()
{
  return static AppIntentInternal.shortcutsMetadata.getter();
}

uint64_t sub_100054820()
{
  return static AppIntentInternal.attributionBundleIdentifier.getter();
}

uint64_t sub_100054840()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100054850()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100054860()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100054880()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_100054890()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000548A0()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_1000548B0()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_1000548C0()
{
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)();
}

uint64_t sub_1000548D0()
{
  return DisplayRepresentation.Image.init(utTypeIdentifier:)();
}

uint64_t sub_1000548E0()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_1000548F0()
{
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)();
}

uint64_t sub_100054900()
{
  return type metadata accessor for DisplayRepresentation();
}

uint64_t sub_100054910()
{
  return _URLRepresentableEnum.urlRepresentationParameter.getter();
}

uint64_t sub_100054920()
{
  return _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)();
}

uint64_t sub_100054930()
{
  return _EnumURLRepresentation.init(_:)();
}

uint64_t sub_100054940()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_100054980()
{
  return static PersistentlyIdentifiable.persistentIdentifier.getter();
}

uint64_t sub_100054990()
{
  return TypeDisplayRepresentation.init(name:numericFormat:)();
}

uint64_t sub_1000549A0()
{
  return type metadata accessor for TypeDisplayRepresentation();
}

uint64_t sub_1000549B0()
{
  return static FormatStyle<>.dateTime.getter();
}

NSDateInterval sub_1000549C0()
{
  return DateInterval._bridgeToObjectiveC()();
}

uint64_t sub_1000549D0()
{
  return static DateInterval.== infix(_:_:)();
}

uint64_t sub_1000549E0()
{
  return DateInterval.end.getter();
}

uint64_t sub_1000549F0()
{
  return DateInterval.init(start:end:)();
}

uint64_t sub_100054A00()
{
  return DateInterval.start.getter();
}

uint64_t sub_100054A10()
{
  return type metadata accessor for DateInterval();
}

uint64_t sub_100054A20()
{
  return DateComponents.init(calendar:timeZone:era:year:month:day:hour:minute:second:nanosecond:weekday:weekdayOrdinal:quarter:weekOfMonth:weekOfYear:yearForWeekOfYear:)();
}

uint64_t sub_100054A30()
{
  return type metadata accessor for DateComponents();
}

uint64_t sub_100054A40(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100054A50()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t sub_100054A60()
{
  return PersonNameComponents.familyName.setter();
}

uint64_t sub_100054A70()
{
  return PersonNameComponents.formatted()()._countAndFlagsBits;
}

uint64_t sub_100054A80()
{
  return PersonNameComponents.init()();
}

uint64_t sub_100054A90()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t sub_100054AA0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100054AB0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100054AC0()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_100054AD0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100054AE0()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_100054AF0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100054B00()
{
  return type metadata accessor for URL();
}

uint64_t sub_100054B10()
{
  return Date.FormatStyle.hour(_:)();
}

uint64_t sub_100054B20()
{
  return static Date.FormatStyle.Symbol.Hour.defaultDigits(amPM:)();
}

uint64_t sub_100054B30()
{
  return static Date.FormatStyle.Symbol.Hour.AMPMStyle.abbreviated.getter();
}

uint64_t sub_100054B40()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour.AMPMStyle();
}

uint64_t sub_100054B50()
{
  return type metadata accessor for Date.FormatStyle.Symbol.Hour();
}

uint64_t sub_100054B60()
{
  return type metadata accessor for Date.FormatStyle();
}

NSDate sub_100054B70()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100054B80()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_100054B90()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_100054BA0()
{
  return static Date.- infix(_:_:)();
}

uint64_t sub_100054BB0()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t sub_100054BC0()
{
  return static Date.== infix(_:_:)();
}

uint64_t sub_100054BD0()
{
  return static Date.+= infix(_:_:)();
}

uint64_t sub_100054BE0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100054BF0()
{
  return static Date.now.getter();
}

uint64_t sub_100054C00()
{
  return Date.init()();
}

uint64_t sub_100054C10()
{
  return type metadata accessor for Date();
}

uint64_t sub_100054C20()
{
  return static Locale.current.getter();
}

uint64_t sub_100054C30()
{
  return type metadata accessor for Locale();
}

uint64_t sub_100054C40()
{
  return Calendar.startOfDay(for:)();
}

uint64_t sub_100054C50()
{
  return type metadata accessor for Calendar.MatchingPolicy();
}

uint64_t sub_100054C60()
{
  return type metadata accessor for Calendar.SearchDirection();
}

uint64_t sub_100054C70()
{
  return type metadata accessor for Calendar.RepeatedTimePolicy();
}

uint64_t sub_100054C80()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_100054C90()
{
  return static Calendar.current.getter();
}

uint64_t sub_100054CA0()
{
  return Calendar.nextDate(after:matching:matchingPolicy:repeatedTimePolicy:direction:)();
}

uint64_t sub_100054CB0()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_100054CC0()
{
  return Calendar.component(_:from:)();
}

uint64_t sub_100054CD0()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_100054CE0()
{
  return type metadata accessor for TimeZone();
}

uint64_t sub_100054CF0()
{
  return isFeatureEnabled(_:)();
}

uint64_t sub_100054D00()
{
  return _DeviceActivityData.ApplicationActivity.totalActivityDuration.getter();
}

uint64_t sub_100054D10()
{
  return _DeviceActivityData.ApplicationActivity.bundleIdentifier.getter();
}

uint64_t sub_100054D20()
{
  return _DeviceActivityData.ApplicationActivity.localizedDisplayName.getter();
}

uint64_t sub_100054D30()
{
  return type metadata accessor for _DeviceActivityData.ApplicationActivity();
}

uint64_t sub_100054D40()
{
  return _DeviceActivityData.CategoryActivity.totalActivityDuration.getter();
}

uint64_t sub_100054D50()
{
  return _DeviceActivityData.CategoryActivity.identifier.getter();
}

uint64_t sub_100054D60()
{
  return _DeviceActivityData.CategoryActivity.webDomainActivities.getter();
}

uint64_t sub_100054D70()
{
  return _DeviceActivityData.CategoryActivity.localizedDisplayName.getter();
}

uint64_t sub_100054D80()
{
  return _DeviceActivityData.CategoryActivity.applicationActivities.getter();
}

uint64_t sub_100054D90()
{
  return type metadata accessor for _DeviceActivityData.CategoryActivity();
}

uint64_t sub_100054DA0()
{
  return _DeviceActivityData.WebDomainActivity.totalActivityDuration.getter();
}

uint64_t sub_100054DB0()
{
  return _DeviceActivityData.WebDomainActivity.domain.getter();
}

uint64_t sub_100054DC0()
{
  return type metadata accessor for _DeviceActivityData.WebDomainActivity();
}

uint64_t sub_100054DD0()
{
  return _DeviceActivityData.ActivitySegment.totalActivityDuration.getter();
}

uint64_t sub_100054DE0()
{
  return _DeviceActivityData.ActivitySegment.dateInterval.getter();
}

uint64_t sub_100054DF0()
{
  return _DeviceActivityData.ActivitySegment.categoryActivities.getter();
}

uint64_t sub_100054E00()
{
  return type metadata accessor for _DeviceActivityData.ActivitySegment();
}

uint64_t sub_100054E10()
{
  return type metadata accessor for DeviceActivityFilter.SegmentInterval();
}

uint64_t sub_100054E20()
{
  return type metadata accessor for _SegmentInterval();
}

uint64_t sub_100054E30()
{
  return type metadata accessor for ScreenTimeFeatureFlags();
}

uint64_t sub_100054E50()
{
  return type metadata accessor for STDeviceActivityDataSource();
}

uint64_t sub_100054E60()
{
  return dispatch thunk of static DeviceActivityDataSourceProtocol.hasData(forUserWithAltDSID:userDeviceStates:)();
}

uint64_t sub_100054E70()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100054E80()
{
  return Logger.logObject.getter();
}

uint64_t sub_100054E90()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100054EA0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100054EB0()
{
  return AxisGridLine.init(centered:stroke:)();
}

uint64_t sub_100054EC0()
{
  return type metadata accessor for AxisGridLine();
}

uint64_t sub_100054ED0()
{
  return ChartContent.foregroundStyle<A>(_:)();
}

uint64_t sub_100054EE0()
{
  return ChartContent.compositingLayer<A>(style:)();
}

uint64_t sub_100054EF0()
{
  return ChartBinRange.lowerBound.getter();
}

uint64_t sub_100054F00()
{
  return ChartBinRange.upperBound.getter();
}

uint64_t sub_100054F10()
{
  return type metadata accessor for ChartBinRange();
}

uint64_t sub_100054F20()
{
  return static AxisMarkPreset.automatic.getter();
}

uint64_t sub_100054F30()
{
  return type metadata accessor for AxisMarkPreset();
}

uint64_t sub_100054F40()
{
  return AxisValueLabel.init<A>(format:centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:)();
}

uint64_t sub_100054F50()
{
  return AxisValueLabel.init(centered:anchor:multiLabelAlignment:collisionResolution:offsetsMarks:orientation:horizontalSpacing:verticalSpacing:content:)();
}

uint64_t sub_100054F60()
{
  return static PlottableValue.value<>(_:_:)();
}

uint64_t sub_100054F70()
{
  return static PlottableValue.value(_:_:)();
}

uint64_t sub_100054F80()
{
  return static AxisMarkPosition.automatic.getter();
}

uint64_t sub_100054F90()
{
  return type metadata accessor for AxisMarkPosition();
}

uint64_t sub_100054FA0()
{
  return static AxisValueLabelOrientation.automatic.getter();
}

uint64_t sub_100054FB0()
{
  return type metadata accessor for AxisValueLabelOrientation();
}

uint64_t sub_100054FC0()
{
  return static AxisValueLabelCollisionResolution.disabled.getter();
}

uint64_t sub_100054FD0()
{
  return static AxisValueLabelCollisionResolution.automatic.getter();
}

uint64_t sub_100054FE0()
{
  return type metadata accessor for AxisValueLabelCollisionResolution();
}

uint64_t sub_100054FF0()
{
  return Chart.init(content:)();
}

uint64_t sub_100055000()
{
  return BarMark.init<A, B>(x:y:width:height:stacking:)();
}

uint64_t sub_100055010()
{
  return type metadata accessor for BarMark();
}

uint64_t sub_100055020()
{
  return static AxisTick.Length.automatic.getter();
}

uint64_t sub_100055030()
{
  return type metadata accessor for AxisTick.Length();
}

uint64_t sub_100055040()
{
  return AxisTick.init(centered:length:stroke:)();
}

uint64_t sub_100055050()
{
  return type metadata accessor for AxisTick();
}

uint64_t sub_100055060()
{
  return DateBins.init(timeInterval:range:)();
}

uint64_t sub_100055070()
{
  return type metadata accessor for DateBins();
}

uint64_t sub_100055080()
{
  return DateBins.subscript.getter();
}

uint64_t sub_100055090()
{
  return AxisMarks.init<A>(preset:position:values:content:)();
}

uint64_t sub_1000550A0()
{
  return AxisValue.as<A>(_:)();
}

uint64_t sub_1000550B0()
{
  return type metadata accessor for ScaleType();
}

uint64_t sub_1000550C0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_1000550D0()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_1000550E0()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_1000550F0()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_100055100()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100055110()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100055120()
{
  return type metadata accessor for DynamicTypeSize();
}

uint64_t sub_100055130()
{
  return ModifiedContent<>.accessibility(label:)();
}

uint64_t sub_100055140()
{
  return ModifiedContent<>.accessibility(value:)();
}

uint64_t sub_100055150()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t sub_100055160()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_100055170()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100055180()
{
  return static ContentTransition.interpolate.getter();
}

uint64_t sub_100055190()
{
  return static ContentTransition.numericText(countsDown:)();
}

uint64_t sub_1000551A0()
{
  return type metadata accessor for ContentTransition();
}

uint64_t sub_1000551B0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000551C0()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_1000551D0()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_1000551E0()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000551F0()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_100055200()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_100055210()
{
  return EnvironmentValues.contentTransition.getter();
}

uint64_t sub_100055220()
{
  return EnvironmentValues.contentTransition.setter();
}

uint64_t sub_100055230()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100055240()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100055250()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_100055260()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_100055270()
{
  return type metadata accessor for EnvironmentValues.ShowsWidgetBackgroundKey();
}

uint64_t sub_100055280()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100055290()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

uint64_t sub_1000552A0()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_1000552B0()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_1000552C0()
{
  return EnvironmentValues.init()();
}

uint64_t sub_1000552D0()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_1000552E0()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_1000552F0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_100055300()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100055310()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100055320()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_100055330()
{
  return static AccessibilityTraits.isHeader.getter();
}

uint64_t sub_100055340()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_100055350()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100055360()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100055370()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100055380()
{
  return WidgetConfiguration.supportedFamilies(_:)();
}

uint64_t sub_100055390()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_1000553A0()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_1000553B0()
{
  return type metadata accessor for PinnedScrollableViews();
}

uint64_t sub_1000553C0()
{
  return static _ForegroundLayerLevel.secondary.getter();
}

uint64_t sub_1000553D0()
{
  return type metadata accessor for _ForegroundLayerLevel();
}

uint64_t sub_1000553E0()
{
  return static AccessibilityChildBehavior.ignore.getter();
}

uint64_t sub_1000553F0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_100055400()
{
  return static ContainerBackgroundPlacement.widget.getter();
}

uint64_t sub_100055410()
{
  return type metadata accessor for ContainerBackgroundPlacement();
}

uint64_t sub_100055420()
{
  return type metadata accessor for AccessibilityAttachmentModifier();
}

uint64_t sub_100055430()
{
  return _ForegroundLayerLevelViewModifier.init(level:)();
}

uint64_t sub_100055440()
{
  return type metadata accessor for _ForegroundLayerLevelViewModifier();
}

uint64_t sub_100055450()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100055460()
{
  return static Axis.Set.horizontal.getter();
}

uint64_t sub_100055470()
{
  return Axis.Set.init(rawValue:)();
}

uint64_t sub_100055480()
{
  return static Axis.Set.vertical.getter();
}

uint64_t sub_100055490()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_1000554A0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_1000554B0()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_1000554C0()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_1000554D0()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_1000554E0()
{
  return static Font.title.getter();
}

uint64_t sub_1000554F0()
{
  return static Font.caption.getter();
}

uint64_t sub_100055500()
{
  return static Font.footnote.getter();
}

uint64_t sub_100055510()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_100055520()
{
  return Text.font(_:)();
}

uint64_t sub_100055530()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100055540()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100055550()
{
  return View.chartXAxis<A>(content:)();
}

uint64_t sub_100055560()
{
  return View.chartYAxis<A>(content:)();
}

uint64_t sub_100055570()
{
  return View.chartLegend(_:)();
}

uint64_t sub_100055580()
{
  return View.chartXScale<A>(domain:type:)();
}

uint64_t sub_100055590()
{
  return View.chartYScale<A>(domain:type:)();
}

uint64_t sub_1000555A0()
{
  return View.widgetAccentable(_:)();
}

uint64_t sub_1000555B0()
{
  return View.widgetURL(_:)();
}

uint64_t sub_1000555C0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_1000555D0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_1000555E0()
{
  return View.accessibility(label:)();
}

uint64_t sub_1000555F0()
{
  return View.accessibility(hidden:)();
}

uint64_t sub_100055600()
{
  return View.accessibility(addTraits:)();
}

uint64_t sub_100055610()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100055620()
{
  return View.dynamicTypeSize<A>(_:)();
}

uint64_t sub_100055630()
{
  return View.containerBackground<A>(_:for:)();
}

uint64_t sub_100055640()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_100055650()
{
  return View.accessibilityIdentifier(_:)();
}

uint64_t sub_100055660()
{
  return View.accessibilitySortPriority(_:)();
}

uint64_t sub_100055670()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_100055680()
{
  return Color.opacity(_:)();
}

uint64_t sub_100055690()
{
  return Color.init(_:red:green:blue:opacity:)();
}

uint64_t sub_1000556A0()
{
  return Color.init(_:)();
}

uint64_t sub_1000556B0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_1000556C0()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_1000556D0()
{
  return Image.widgetAccentedRenderingMode(_:)();
}

uint64_t sub_1000556E0()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_1000556F0()
{
  return static Widget.main()();
}

uint64_t sub_100055700()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100055710()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100055720()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100055730()
{
  return ForEach<>.init(_:content:)();
}

uint64_t sub_100055740()
{
  return type metadata accessor for GridItem.Size();
}

uint64_t sub_100055750()
{
  return type metadata accessor for GridItem();
}

uint64_t sub_100055760()
{
  return GridItem.init(_:spacing:alignment:)();
}

uint64_t sub_100055770()
{
  return static Alignment.center.getter();
}

uint64_t sub_100055780()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100055790()
{
  return static Animation.default.getter();
}

uint64_t sub_1000557A0()
{
  return LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)();
}

uint64_t sub_1000557B0()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_1000557C0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000557D0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000557E0()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t sub_1000557F0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100055800()
{
  return static DispatchTime.now()();
}

uint64_t sub_100055810()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100055820()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_100055830()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t sub_100055840()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_100055850()
{
  return + infix(_:_:)();
}

uint64_t sub_100055860()
{
  return static WidgetRenderingMode.== infix(_:_:)();
}

uint64_t sub_100055870()
{
  return static WidgetRenderingMode.accented.getter();
}

uint64_t sub_100055880()
{
  return type metadata accessor for WidgetRenderingMode();
}

uint64_t sub_100055890()
{
  return static WidgetAccentedRenderingMode.desaturated.getter();
}

uint64_t sub_1000558A0()
{
  return static WidgetAccentedRenderingMode.fullColor.getter();
}

uint64_t sub_1000558B0()
{
  return type metadata accessor for WidgetAccentedRenderingMode();
}

uint64_t sub_1000558C0()
{
  return type metadata accessor for WidgetFamily();
}

uint64_t sub_1000558D0()
{
  return TimelineEntry.relevance.getter();
}

uint64_t sub_1000558E0()
{
  return IntentConfiguration.init<A>(kind:intent:provider:content:)();
}

uint64_t sub_1000558F0()
{
  return static TimelineReloadPolicy.after(_:)();
}

uint64_t sub_100055900()
{
  return type metadata accessor for TimelineReloadPolicy();
}

uint64_t sub_100055920()
{
  return IntentTimelineProvider.recommendations()();
}

uint64_t sub_100055940()
{
  return TimelineProviderContext.displaySize.getter();
}

uint64_t sub_100055950()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_100055960()
{
  return type metadata accessor for TimelineProviderContext();
}

uint64_t sub_100055970()
{
  return Timeline.init(entries:policy:)();
}

NSDictionary sub_100055980()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100055990()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000559A0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000559B0()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_1000559C0()
{
  return dispatch thunk of static Comparable.<= infix(_:_:)();
}

uint64_t sub_1000559D0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_1000559E0()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_1000559F0()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_100055A00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100055A10()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100055A20()
{
  return String.init(format:_:)();
}

uint64_t sub_100055A30()
{
  return static String._uncheckedFromUTF8(_:)();
}

uint64_t sub_100055A40()
{
  return String.hash(into:)();
}

uint64_t sub_100055A50()
{
  return String.count.getter();
}

void sub_100055A60(Swift::String a1)
{
}

Swift::Int sub_100055A70()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100055A80()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100055A90()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100055AB0()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100055AC0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100055AD0()
{
  return String.init<A>(_:)();
}

uint64_t sub_100055AE0()
{
  return String.subscript.getter();
}

uint64_t sub_100055AF0()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t sub_100055B00()
{
  return dispatch thunk of Sequence.underestimatedCount.getter();
}

uint64_t sub_100055B10()
{
  return Sequence.enumerated()();
}

uint64_t sub_100055B20()
{
  return Sequence.sorted(by:)();
}

uint64_t sub_100055B30()
{
  return Sequence.contains(where:)();
}

uint64_t sub_100055B40()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_100055B50()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100055B60()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100055B70()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100055B80()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100055B90()
{
  return Array.init<A>(_:)();
}

uint64_t sub_100055BA0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100055BB0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_100055BC0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100055BD0()
{
  return type metadata accessor for TaskPriority();
}

NSSet sub_100055BE0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_100055BF0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100055C00()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100055C10()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_100055C20()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t sub_100055C30()
{
  return dispatch thunk of Collection.distance(from:to:)();
}

uint64_t sub_100055C40()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t sub_100055C50()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t sub_100055C60()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t sub_100055C70()
{
  return NSPredicate.init(format:_:)();
}

uint64_t sub_100055C80()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100055C90()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100055CA0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100055CB0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100055CC0()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_100055CD0()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100055CE0()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t sub_100055CF0()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100055D00()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100055D10()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100055D20()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100055D30()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100055D40()
{
  return NSObject.hash(into:)();
}

uint64_t sub_100055D50()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100055D60()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t sub_100055D70()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100055D80()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100055D90()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100055DA0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100055DB0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100055DC0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100055DD0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

void sub_100055DE0(Swift::Int a1)
{
}

uint64_t sub_100055DF0()
{
  return _StringGuts.copyUTF8(into:)();
}

void sub_100055E00(Swift::Int a1)
{
}

uint64_t sub_100055E10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100055E20()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100055E30()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100055E40()
{
  return specialized ContiguousArray._endMutation()();
}

void sub_100055E50(Swift::Int a1)
{
}

uint64_t sub_100055E60()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100055E70()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100055E80()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100055E90()
{
  return ContiguousArray.append(_:)();
}

uint64_t sub_100055EA0()
{
  return ContiguousArray.init()();
}

uint64_t sub_100055EB0()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t sub_100055EC0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100055ED0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100055EE0()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100055EF0()
{
  return EnumeratedSequence.makeIterator()();
}

uint64_t sub_100055F00()
{
  return EnumeratedSequence.Iterator.next()();
}

uint64_t sub_100055F10()
{
  return type metadata accessor for EnumeratedSequence.Iterator();
}

uint64_t sub_100055F20()
{
  return type metadata accessor for EnumeratedSequence();
}

uint64_t sub_100055F30()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100055F40()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_100055F50()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100055F60()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100055F70()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100055F80()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100055F90(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

Swift::Int sub_100055FB0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100055FC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100055FE0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100055FF0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100056000()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t sub_100056010()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100056020()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100056030()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100056040()
{
  return Error._code.getter();
}

uint64_t sub_100056050()
{
  return Error._domain.getter();
}

uint64_t sub_100056060()
{
  return Error._userInfo.getter();
}

uint64_t sub_100056070()
{
  return Hasher.init(_seed:)();
}

void sub_100056080(Swift::UInt a1)
{
}

void sub_100056090(Swift::UInt64 a1)
{
}

Swift::Int sub_1000560A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000560B0()
{
  return dispatch thunk of OptionSet.init(rawValue:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_setFragment_(void *a1, const char *a2, ...)
{
  return [a1 setFragment:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return [a1 setScheme:];
}