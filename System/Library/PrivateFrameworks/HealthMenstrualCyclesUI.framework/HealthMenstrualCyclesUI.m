uint64_t PregnancyStripedLinearGaugeStyle.makeBody(configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t KeyPath;
  uint64_t v9;
  void v11[2];

  v4 = sub_23F842680();
  v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  v9 = a2 + *(int *)(type metadata accessor for PregnancyStripedLinearGauge() + 20);
  *(void *)v9 = KeyPath;
  *(unsigned char *)(v9 + 8) = 0;
  v11[1] = 0x4008000000000000;
  sub_23F83CBC8();
  return sub_23F8424F0();
}

uint64_t sub_23F83B3E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23F842680();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  uint64_t v9 = a2 + *(int *)(type metadata accessor for PregnancyStripedLinearGauge() + 20);
  *(void *)uint64_t v9 = KeyPath;
  *(unsigned char *)(v9 + 8) = 0;
  v11[1] = 0x4008000000000000;
  sub_23F83CBC8();
  return sub_23F8424F0();
}

uint64_t sub_23F83B528@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_23F83D9DC(0, &qword_268C413A0, &qword_268C413A8, (uint64_t (*)(uint64_t))sub_23F83DA7C, &qword_268C413F8);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (uint64_t *)((char *)v30 - v7);
  uint64_t *v8 = sub_23F8427B0();
  v8[1] = v9;
  sub_23F83E6FC();
  sub_23F83B6B4(a2, a1, (uint64_t)v8 + *(int *)(v10 + 44));
  uint64_t v11 = sub_23F8427A0();
  uint64_t v13 = v12;
  sub_23F842530();
  double v15 = v14;
  sub_23F842530();
  double v17 = v15 - v16;
  sub_23F842670();
  double v19 = v18 * v17;
  sub_23F842530();
  uint64_t v20 = sub_23F8427B0();
  uint64_t v22 = v21;
  sub_23F83C154((uint64_t)v30, v19);
  sub_23F83E794((uint64_t)v8, a3);
  sub_23F83D948();
  uint64_t v24 = a3 + *(int *)(v23 + 36);
  *(void *)uint64_t v24 = v11;
  *(void *)(v24 + 8) = v13;
  *(void *)(v24 + 16) = v20;
  *(void *)(v24 + 24) = v22;
  long long v25 = v30[7];
  *(_OWORD *)(v24 + 128) = v30[6];
  *(_OWORD *)(v24 + 144) = v25;
  *(_OWORD *)(v24 + 160) = v30[8];
  long long v26 = v30[3];
  *(_OWORD *)(v24 + 64) = v30[2];
  *(_OWORD *)(v24 + 80) = v26;
  long long v27 = v30[5];
  *(_OWORD *)(v24 + 96) = v30[4];
  *(_OWORD *)(v24 + 112) = v27;
  long long v28 = v30[1];
  *(_OWORD *)(v24 + 32) = v30[0];
  *(_OWORD *)(v24 + 48) = v28;
  return sub_23F83E824((uint64_t)v8);
}

void sub_23F83B6B4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v78 = a2;
  uint64_t v79 = a1;
  uint64_t v73 = a3;
  sub_23F83DC44();
  uint64_t v74 = v3;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v77 = (uint64_t)&v72 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F83DC1C(0);
  uint64_t v76 = v5;
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v72 = (uint64_t)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v75 = (uint64_t)&v72 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v80 = (uint64_t)&v72 - v10;
  sub_23F83DB88();
  v81 = (char *)v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_23F842790();
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  v82 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  double v18 = (char *)&v72 - v17;
  uint64_t v19 = sub_23F8424B0();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F83DB28();
  uint64_t v24 = v23;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  long long v27 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  v29 = (char *)&v72 - v28;
  if (qword_268C41358 != -1) {
    swift_once();
  }
  uint64_t v30 = __swift_project_value_buffer(v19, (uint64_t)qword_268C41850);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v30, v19);
  uint64_t v31 = sub_23F842730();
  uint64_t v32 = *MEMORY[0x263F19860];
  uint64_t v33 = sub_23F842620();
  v34 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 104);
  v34(v18, v32, v33);
  sub_23F83EBDC((uint64_t)v18, (uint64_t)v13, MEMORY[0x263F1B7A0]);
  *(_WORD *)&v13[*((int *)v81 + 9)] = 256;
  sub_23F83EBDC((uint64_t)v13, (uint64_t)&v27[*(int *)(v24 + 36)], (uint64_t (*)(void))sub_23F83DB88);
  *(void *)long long v27 = v31;
  __asm { FMOV            V0.2D, #1.5 }
  *(_OWORD *)(v27 + 8) = _Q0;
  swift_retain();
  sub_23F83EC44((uint64_t)v13, (uint64_t (*)(void))sub_23F83DB88);
  sub_23F83EC44((uint64_t)v18, MEMORY[0x263F1B7A0]);
  swift_release();
  v81 = v29;
  sub_23F83EB74((uint64_t)v27, (uint64_t)v29, (uint64_t (*)(void))sub_23F83DB28);
  v34(v82, v32, v33);
  sub_23F83E954();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v41 = self;
  id v42 = objc_msgSend(v41, sel_bundleForClass_, ObjCClassFromMetadata);
  v43 = (void *)sub_23F842800();
  v44 = self;
  id v45 = objc_msgSend(v44, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v43, v42, 0);

  if (v45)
  {
    uint64_t v46 = MEMORY[0x2455D37A0](v45);
    uint64_t v47 = (uint64_t)v82;
    uint64_t v48 = v77;
    sub_23F83EBDC((uint64_t)v82, v77, MEMORY[0x263F1B7A0]);
    uint64_t v49 = v74;
    *(void *)(v48 + *(int *)(v74 + 52)) = v46;
    *(_WORD *)(v48 + *(int *)(v49 + 56)) = 256;
    sub_23F83EC44(v47, MEMORY[0x263F1B7A0]);
    sub_23F842530();
    sub_23F842530();
    uint64_t v50 = v79 + *(int *)(type metadata accessor for PregnancyStripedLinearGauge() + 20);
    uint64_t v51 = *(void *)v50;
    LOBYTE(v46) = *(unsigned char *)(v50 + 8);
    sub_23F83CF00(*(void *)v50, v46);
    sub_23F83E994(v51, v46);
    sub_23F83D024(v51, v46);
    sub_23F842530();
    sub_23F8427B0();
    sub_23F842520();
    uint64_t v52 = v75;
    sub_23F83EBDC(v48, v75, (uint64_t (*)(void))sub_23F83DC44);
    v53 = (_OWORD *)(v52 + *(int *)(v76 + 36));
    long long v54 = v84;
    _OWORD *v53 = v83;
    v53[1] = v54;
    v53[2] = v85;
    sub_23F83EC44(v48, (uint64_t (*)(void))sub_23F83DC44);
    uint64_t v55 = v80;
    sub_23F83EB74(v52, v80, (uint64_t (*)(void))sub_23F83DC1C);
    id v56 = objc_msgSend(v41, sel_bundleForClass_, ObjCClassFromMetadata);
    v57 = (void *)sub_23F842800();
    id v58 = objc_msgSend(v44, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v57, v56, 0);

    if (v58)
    {
      uint64_t v59 = MEMORY[0x2455D37A0](v58);
      sub_23F842530();
      double v61 = v60;
      sub_23F842530();
      double v63 = v61 - v62;
      sub_23F842670();
      double v65 = v64 * v63;
      uint64_t v66 = (uint64_t)v81;
      sub_23F83EBDC((uint64_t)v81, (uint64_t)v27, (uint64_t (*)(void))sub_23F83DB28);
      uint64_t v67 = v72;
      sub_23F83EBDC(v55, v72, (uint64_t (*)(void))sub_23F83DC1C);
      uint64_t v68 = v73;
      sub_23F83EBDC((uint64_t)v27, v73, (uint64_t (*)(void))sub_23F83DB28);
      sub_23F83DA7C();
      uint64_t v70 = v69;
      sub_23F83EBDC(v67, v68 + *(int *)(v69 + 48), (uint64_t (*)(void))sub_23F83DC1C);
      uint64_t v71 = v68 + *(int *)(v70 + 64);
      *(void *)uint64_t v71 = v59;
      *(_WORD *)(v71 + 8) = 256;
      *(double *)(v71 + 16) = v65;
      *(void *)(v71 + 24) = 0;
      swift_retain();
      sub_23F83EC44(v55, (uint64_t (*)(void))sub_23F83DC1C);
      sub_23F83EC44(v66, (uint64_t (*)(void))sub_23F83DB28);
      swift_release();
      sub_23F83EC44(v67, (uint64_t (*)(void))sub_23F83DC1C);
      sub_23F83EC44((uint64_t)v27, (uint64_t (*)(void))sub_23F83DB28);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_23F83BEEC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_23F842600();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  sub_23F83E544();
  return sub_23F83BF38((char *)(a1 + *(int *)(v2 + 44)));
}

uint64_t sub_23F83BF38@<X0>(char *a1@<X8>)
{
  sub_23F83E4E0(0, &qword_268C41498, MEMORY[0x263F19FF0], MEMORY[0x263F8D8F0]);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t v8 = sub_23F842650();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v19 - v13;
  sub_23F842660();
  sub_23F842640();
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  sub_23F83E5DC((uint64_t)v7, (uint64_t)v5);
  v15(a1, v12, v8);
  sub_23F83E440();
  sub_23F83E5DC((uint64_t)v5, (uint64_t)&a1[*(int *)(v16 + 48)]);
  sub_23F83E670((uint64_t)v7);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v14, v8);
  sub_23F83E670((uint64_t)v5);
  return ((uint64_t (*)(char *, uint64_t))v17)(v12, v8);
}

uint64_t sub_23F83C154@<X0>(uint64_t a1@<X8>, double a2@<D1>)
{
  uint64_t v16 = sub_23F842720();
  uint64_t v15 = sub_23F842710();
  type metadata accessor for PregnancyStripedLinearGauge();
  sub_23F83CF0C();
  sub_23F842500();
  sub_23F8424D0();
  uint64_t v14 = sub_23F8427A0();
  uint64_t v5 = v4;
  sub_23F842500();
  sub_23F8427A0();
  sub_23F842520();
  sub_23F842500();
  int v43 = v28;
  __int16 v44 = v29;
  *(_DWORD *)uint64_t v49 = *(_DWORD *)v27;
  *(_DWORD *)&v49[3] = *(_DWORD *)&v27[3];
  *(_DWORD *)uint64_t v52 = *(_DWORD *)v26;
  *(_DWORD *)&v52[3] = *(_DWORD *)&v26[3];
  WORD3(v33) = v29;
  *(_DWORD *)((char *)&v33 + 2) = v28;
  double v6 = a2 + *(double *)v39 * -0.5;
  long long v30 = v17;
  long long v31 = v18;
  *(void *)&long long v32 = v19;
  *((void *)&v32 + 1) = v15;
  *(_DWORD *)((char *)&v35 + 1) = *(_DWORD *)v27;
  DWORD1(v35) = *(_DWORD *)&v27[3];
  LOWORD(v33) = 256;
  *((void *)&v33 + 1) = v14;
  *(void *)&long long v34 = v5;
  *((void *)&v34 + 1) = v20;
  LOBYTE(v35) = v21;
  *((void *)&v35 + 1) = v22;
  LOBYTE(v36) = v23;
  *(_DWORD *)((char *)&v36 + 1) = *(_DWORD *)v26;
  DWORD1(v36) = *(_DWORD *)&v26[3];
  *((void *)&v36 + 1) = v24;
  *(void *)&long long v37 = v25;
  *((double *)&v37 + 1) = v6;
  uint64_t v38 = 0;
  long long v7 = v36;
  long long v8 = v37;
  *(void *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 120) = v8;
  *(_OWORD *)(a1 + 104) = v7;
  long long v9 = v34;
  *(_OWORD *)(a1 + 88) = v35;
  long long v10 = v31;
  *(_OWORD *)(a1 + 8) = v30;
  long long v11 = v32;
  long long v12 = v33;
  *(_OWORD *)(a1 + 72) = v9;
  *(_OWORD *)(a1 + 56) = v12;
  *(_OWORD *)(a1 + 40) = v11;
  *(_OWORD *)(a1 + 24) = v10;
  *(void *)a1 = v16;
  v39[0] = v17;
  v39[1] = v18;
  uint64_t v40 = v19;
  uint64_t v41 = v15;
  __int16 v42 = 256;
  uint64_t v45 = v14;
  uint64_t v46 = v5;
  uint64_t v47 = v20;
  char v48 = v21;
  uint64_t v50 = v22;
  char v51 = v23;
  uint64_t v53 = v24;
  uint64_t v54 = v25;
  double v55 = v6;
  uint64_t v56 = 0;
  swift_retain();
  sub_23F83E8AC((uint64_t)&v30);
  sub_23F83E8E4((uint64_t)v39);
  return swift_release();
}

uint64_t sub_23F83C428(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  MEMORY[0x270FA5388](a1 - 8);
  sub_23F83EBDC(v1, (uint64_t)&v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], (uint64_t (*)(void))type metadata accessor for PregnancyStripedLinearGauge);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  sub_23F83EB74((uint64_t)&v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)], v5 + v4, (uint64_t (*)(void))type metadata accessor for PregnancyStripedLinearGauge);
  long long v9 = sub_23F83D85C;
  uint64_t v10 = v5;
  uint64_t v8 = v1;
  sub_23F83D8E4();
  sub_23F83E38C();
  sub_23F83F624(&qword_268C414A8, (void (*)(uint64_t))sub_23F83D8E4);
  sub_23F83F624(&qword_268C414B0, (void (*)(uint64_t))sub_23F83E38C);
  sub_23F842700();
  return swift_release();
}

uint64_t sub_23F83C608(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = sub_23F842590();
  uint64_t result = MEMORY[0x270FA5388](v8);
  long long v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v13 = ceil((a1 + a2) / (a3 + a4));
  if ((~*(void *)&v13 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v13 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v13 >= 9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v14 = (uint64_t)v13;
  if ((uint64_t)v13 < 0)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = (void (**)(char *, uint64_t))(v10 + 8);
    do
    {
      sub_23F8426C0();
      sub_23F8426A0();
      sub_23F8426B0();
      v21[0] = v18;
      v21[1] = v19;
      unsigned __int8 v22 = v20;
      sub_23F83F510((uint64_t)v21, (uint64_t)v23);
      sub_23F83F584((uint64_t)v23, (void (*)(void, void, void, void, void))sub_23F83F56C);
      sub_23F842580();
      sub_23F842570();
      sub_23F83F584((uint64_t)v21, (void (*)(void, void, void, void, void))sub_23F83F5C4);
      (*v16)(v12, v8);
      uint64_t result = sub_23F83F5C4(v18, *((uint64_t *)&v18 + 1), v19, *((uint64_t *)&v19 + 1), v20);
      ++v15;
    }
    while (v14 != v15);
  }
  return result;
}

uint64_t sub_23F83C83C()
{
  return sub_23F8426F0();
}

uint64_t sub_23F83C858()
{
  uint64_t v1 = sub_23F842610();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  uint64_t v6 = v0[1];
  uint64_t v7 = v0[2];
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v5;
  v8[3] = v6;
  v8[4] = v7;
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F19790], v1);
  swift_retain();
  return sub_23F842750();
}

void sub_23F83C98C()
{
  qword_268C41348 = 0;
}

double static PregnancyStripedFillProgressKey.defaultValue.getter()
{
  if (qword_268C41340 != -1) {
    swift_once();
  }
  return *(double *)&qword_268C41348;
}

double sub_23F83C9E4@<D0>(void *a1@<X8>)
{
  if (qword_268C41340 != -1) {
    swift_once();
  }
  double result = *(double *)&qword_268C41348;
  *a1 = qword_268C41348;
  return result;
}

uint64_t sub_23F83CA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_23F83F200();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

double EnvironmentValues.pregnancyStripedFillProgress.getter()
{
  sub_23F83CC1C();
  sub_23F8425E0();
  return v1;
}

double sub_23F83CAE0@<D0>(double *a1@<X8>)
{
  sub_23F83CC1C();
  sub_23F8425E0();
  double result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_23F83CB30()
{
  return sub_23F8425F0();
}

uint64_t type metadata accessor for PregnancyStripedLinearGauge()
{
  uint64_t result = qword_268C41380;
  if (!qword_268C41380) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_23F83CBC8()
{
  unint64_t result = qword_268C41360;
  if (!qword_268C41360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C41360);
  }
  return result;
}

unint64_t sub_23F83CC1C()
{
  unint64_t result = qword_268C41368;
  if (!qword_268C41368)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C41368);
  }
  return result;
}

uint64_t EnvironmentValues.pregnancyStripedFillProgress.setter()
{
  return sub_23F8425F0();
}

uint64_t (*EnvironmentValues.pregnancyStripedFillProgress.modify(uint64_t a1))(void *a1)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_23F83CC1C();
  sub_23F8425E0();
  return sub_23F83CD0C;
}

uint64_t sub_23F83CD0C(void *a1)
{
  a1[1] = *a1;
  return sub_23F8425F0();
}

uint64_t sub_23F83CD44()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for PregnancyStripedLinearGaugeStyle()
{
  return &type metadata for PregnancyStripedLinearGaugeStyle;
}

ValueMetadata *type metadata accessor for PregnancyStripedFillProgressKey()
{
  return &type metadata for PregnancyStripedFillProgressKey;
}

uint64_t sub_23F83CD80()
{
  return sub_23F83F624(&qword_268C41370, (void (*)(uint64_t))type metadata accessor for PregnancyStripedLinearGauge);
}

uint64_t *sub_23F83CDC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23F842680();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    long long v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)v10;
    char v12 = v10[8];
    sub_23F83CF00(*(void *)v10, v12);
    *(void *)long long v9 = v11;
    v9[8] = v12;
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    sub_23F83CF0C();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return a1;
}

uint64_t sub_23F83CF00(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

void sub_23F83CF0C()
{
  if (!qword_268C41378)
  {
    sub_23F83CBC8();
    unint64_t v0 = sub_23F842510();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41378);
    }
  }
}

uint64_t sub_23F83CF68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23F842680();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_23F83D024(*(void *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  sub_23F83CF0C();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_23F83D024(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23F83D030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F842680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  sub_23F83CF00(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = v11;
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  sub_23F83CF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t sub_23F83D118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F842680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = *(unsigned char *)(v9 + 8);
  sub_23F83CF00(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = *(unsigned char *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = v11;
  sub_23F83D024(v12, v13);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  sub_23F83CF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 24))(v15, v16, v17);
  return a1;
}

uint64_t sub_23F83D20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F842680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  uint64_t v11 = a1 + v8;
  uint64_t v12 = a2 + v8;
  sub_23F83CF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t sub_23F83D2DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F842680();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  LOBYTE(v9) = *((unsigned char *)v9 + 8);
  uint64_t v11 = *(void *)v8;
  char v12 = *(unsigned char *)(v8 + 8);
  *(void *)uint64_t v8 = v10;
  *(unsigned char *)(v8 + 8) = (_BYTE)v9;
  sub_23F83D024(v11, v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  sub_23F83CF0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 40))(v14, v15, v16);
  return a1;
}

uint64_t sub_23F83D3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23F83D3D0);
}

uint64_t sub_23F83D3D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F842680();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_23F83CF0C();
    char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_23F83D4F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23F83D50C);
}

uint64_t sub_23F83D50C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_23F842680();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
  }
  else
  {
    sub_23F83CF0C();
    char v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_23F83D638()
{
  sub_23F842680();
  if (v0 <= 0x3F)
  {
    sub_23F83CF0C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_23F83D708()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F83D724()
{
  unint64_t v1 = (int *)(type metadata accessor for PregnancyStripedLinearGauge() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_23F842680();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  sub_23F83D024(*(void *)(v6 + v1[7]), *(unsigned char *)(v6 + v1[7] + 8));
  uint64_t v8 = v6 + v1[8];
  sub_23F83CF0C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_23F83D85C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for PregnancyStripedLinearGauge() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_23F83B528(a1, v6, a2);
}

uint64_t sub_23F83D8DC@<X0>(uint64_t a1@<X8>)
{
  return sub_23F83BEEC(a1);
}

void sub_23F83D8E4()
{
  if (!qword_268C41390)
  {
    sub_23F83D948();
    sub_23F83E260();
    unint64_t v0 = sub_23F842560();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41390);
    }
  }
}

void sub_23F83D948()
{
  if (!qword_268C41398)
  {
    sub_23F83D9DC(255, &qword_268C413A0, &qword_268C413A8, (uint64_t (*)(uint64_t))sub_23F83DA7C, &qword_268C413F8);
    sub_23F83DE28();
    unint64_t v0 = sub_23F8425A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41398);
    }
  }
}

void sub_23F83D9DC(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  if (!*a2)
  {
    sub_23F83E4E0(255, a3, a4, MEMORY[0x263F1BAC8]);
    sub_23F83DDC4(a5, a3, a4);
    unint64_t v9 = sub_23F842780();
    if (!v10) {
      atomic_store(v9, a2);
    }
  }
}

void sub_23F83DA7C()
{
  if (!qword_268C413B0)
  {
    sub_23F83DB28();
    sub_23F83DC1C(255);
    sub_23F83E02C(255, &qword_268C413E0, (void (*)(uint64_t))sub_23F83DCF4);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1) {
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_268C413B0);
    }
  }
}

void sub_23F83DB28()
{
  if (!qword_268C413B8)
  {
    sub_23F83DB88();
    unint64_t v0 = sub_23F8425A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C413B8);
    }
  }
}

void sub_23F83DB88()
{
  if (!qword_268C413C0)
  {
    sub_23F842790();
    sub_23F83F624(&qword_268C413C8, MEMORY[0x263F1B7A0]);
    unint64_t v0 = sub_23F8424E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C413C0);
    }
  }
}

void sub_23F83DC1C(uint64_t a1)
{
}

void sub_23F83DC44()
{
  if (!qword_268C413D8)
  {
    sub_23F842790();
    sub_23F83F624(&qword_268C413C8, MEMORY[0x263F1B7A0]);
    unint64_t v0 = sub_23F8424C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C413D8);
    }
  }
}

void sub_23F83DCF4()
{
  if (!qword_268C413E8)
  {
    sub_23F83DD70();
    unint64_t v0 = sub_23F8424C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C413E8);
    }
  }
}

unint64_t sub_23F83DD70()
{
  unint64_t result = qword_268C413F0;
  if (!qword_268C413F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C413F0);
  }
  return result;
}

uint64_t sub_23F83DDC4(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_23F83E4E0(255, a2, a3, MEMORY[0x263F1BAC8]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_23F83DE28()
{
  if (!qword_268C41400)
  {
    sub_23F83DEC4(255);
    sub_23F83E15C(&qword_268C41450, sub_23F83DEC4, (void (*)(void))sub_23F83E120);
    unint64_t v0 = sub_23F842630();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41400);
    }
  }
}

void sub_23F83DEC4(uint64_t a1)
{
}

void sub_23F83DEEC()
{
  if (!qword_268C41410)
  {
    sub_23F83D9DC(255, &qword_268C41418, &qword_268C41420, (uint64_t (*)(uint64_t))sub_23F83DF78, &qword_268C41448);
    unint64_t v0 = sub_23F8425A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41410);
    }
  }
}

void sub_23F83DF78()
{
  if (!qword_268C41428)
  {
    sub_23F83E02C(255, &qword_268C41430, sub_23F83E004);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268C41428);
    }
  }
}

void sub_23F83E004(uint64_t a1)
{
}

void sub_23F83E02C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_23F8425A0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_23F83E090()
{
  if (!qword_268C41440)
  {
    sub_23F83DD70();
    unint64_t v0 = sub_23F8425B0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41440);
    }
  }
}

uint64_t sub_23F83E120()
{
  return sub_23F83E15C(&qword_268C41458, (void (*)(uint64_t))sub_23F83DEEC, (void (*)(void))sub_23F83E1DC);
}

uint64_t sub_23F83E15C(unint64_t *a1, void (*a2)(uint64_t), void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23F83E1DC()
{
  unint64_t result = qword_268C41460;
  if (!qword_268C41460)
  {
    sub_23F83D9DC(255, &qword_268C41418, &qword_268C41420, (uint64_t (*)(uint64_t))sub_23F83DF78, &qword_268C41448);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C41460);
  }
  return result;
}

unint64_t sub_23F83E260()
{
  unint64_t result = qword_268C41468;
  if (!qword_268C41468)
  {
    sub_23F83D948();
    sub_23F83E308();
    sub_23F83F624(&qword_268C41478, (void (*)(uint64_t))sub_23F83DE28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C41468);
  }
  return result;
}

unint64_t sub_23F83E308()
{
  unint64_t result = qword_268C41470;
  if (!qword_268C41470)
  {
    sub_23F83D9DC(255, &qword_268C413A0, &qword_268C413A8, (uint64_t (*)(uint64_t))sub_23F83DA7C, &qword_268C413F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C41470);
  }
  return result;
}

void sub_23F83E38C()
{
  if (!qword_268C41480)
  {
    sub_23F83E4E0(255, &qword_268C41488, (uint64_t (*)(uint64_t))sub_23F83E440, MEMORY[0x263F1BAC8]);
    sub_23F83DDC4(&qword_268C414A0, &qword_268C41488, (uint64_t (*)(uint64_t))sub_23F83E440);
    unint64_t v0 = sub_23F842770();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C41480);
    }
  }
}

void sub_23F83E440()
{
  if (!qword_268C41490)
  {
    sub_23F842650();
    sub_23F83E4E0(255, &qword_268C41498, MEMORY[0x263F19FF0], MEMORY[0x263F8D8F0]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_268C41490);
    }
  }
}

void sub_23F83E4E0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void sub_23F83E544()
{
  if (!qword_268C414B8)
  {
    sub_23F83E4E0(255, &qword_268C41488, (uint64_t (*)(uint64_t))sub_23F83E440, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_23F842540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C414B8);
    }
  }
}

uint64_t sub_23F83E5DC(uint64_t a1, uint64_t a2)
{
  sub_23F83E4E0(0, &qword_268C41498, MEMORY[0x263F19FF0], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F83E670(uint64_t a1)
{
  sub_23F83E4E0(0, &qword_268C41498, MEMORY[0x263F19FF0], MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23F83E6FC()
{
  if (!qword_268C414C0)
  {
    sub_23F83E4E0(255, &qword_268C413A8, (uint64_t (*)(uint64_t))sub_23F83DA7C, MEMORY[0x263F1BAC8]);
    unint64_t v0 = sub_23F842540();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C414C0);
    }
  }
}

uint64_t sub_23F83E794(uint64_t a1, uint64_t a2)
{
  sub_23F83D9DC(0, &qword_268C413A0, &qword_268C413A8, (uint64_t (*)(uint64_t))sub_23F83DA7C, &qword_268C413F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23F83E824(uint64_t a1)
{
  sub_23F83D9DC(0, &qword_268C413A0, &qword_268C413A8, (uint64_t (*)(uint64_t))sub_23F83DA7C, &qword_268C413F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23F83E8AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23F83E8E4(uint64_t a1)
{
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_23F83E954()
{
  unint64_t result = qword_268C414C8;
  if (!qword_268C414C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C414C8);
  }
  return result;
}

double sub_23F83E994(uint64_t a1, char a2)
{
  uint64_t v4 = sub_23F8425D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_23F842820();
  uint64_t v9 = sub_23F842690();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    double v14 = *(double *)&v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_23F83ECA4(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_23F837000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455D3D20](v11, -1, -1);
    MEMORY[0x2455D3D20](v10, -1, -1);
  }

  sub_23F8425C0();
  swift_getAtKeyPath();
  sub_23F83D024(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_23F83EB74(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23F83EBDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23F83EC44(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_23F83ECA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_23F83ED78(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23F83EEC8((uint64_t)v12, *a3);
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
      sub_23F83EEC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_23F83ED78(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_23F83EF24(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_23F842880();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
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

uint64_t sub_23F83EEC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23F83EF24(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23F83EFBC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23F83F0BC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23F83F0BC((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23F83EFBC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
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
      unint64_t v3 = sub_23F83F058(v2, 0);
      uint64_t result = sub_23F842870();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_23F842810();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_23F83F058(uint64_t a1, uint64_t a2)
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
  sub_23F83F1A4();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23F83F0BC(char *result, int64_t a2, char a3, char *a4)
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
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_23F83F1A4();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  char v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_23F83F1A4()
{
  if (!qword_268C414D0)
  {
    unint64_t v0 = sub_23F842890();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C414D0);
    }
  }
}

unint64_t sub_23F83F200()
{
  unint64_t result = qword_268C414D8;
  if (!qword_268C414D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C414D8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for GaugeStripedBackground(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for GaugeStripedBackground()
{
  return swift_release();
}

void *assignWithCopy for GaugeStripedBackground(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for GaugeStripedBackground(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for GaugeStripedBackground(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GaugeStripedBackground(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GaugeStripedBackground()
{
  return &type metadata for GaugeStripedBackground;
}

uint64_t sub_23F83F3D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F83F4B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23F83F4CC()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23F83F504(double a1, double a2)
{
  return sub_23F83C608(a1, a2, *(double *)(v2 + 24), *(double *)(v2 + 32));
}

uint64_t sub_23F83F510(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23F83F56C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_23F83F584(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_23F83F5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 - 2 <= 3) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23F83F5DC()
{
  return sub_23F83F624(&qword_268C414E0, (void (*)(uint64_t))sub_23F83F66C);
}

uint64_t sub_23F83F624(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_23F83F66C()
{
  if (!qword_268C414E8)
  {
    unint64_t v0 = sub_23F842760();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C414E8);
    }
  }
}

void static UIColor.pregnancyGreen.getter()
{
}

void static UIColor.pregnancyPill.getter()
{
}

void static UIColor.pregnancyDarkGreen.getter()
{
}

void sub_23F83F738()
{
  sub_23F83E954();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_23F842800();
  id v3 = objc_msgSend(self, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  if (!v3) {
    __break(1u);
  }
}

void static UIColor.pregnancyGreenPrediction.getter()
{
  sub_23F83E954();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = (void *)sub_23F842800();
  id v3 = objc_msgSend(self, sel_colorNamed_inBundle_compatibleWithTraitCollection_, v2, v1, 0);

  if (v3)
  {
    objc_msgSend(v3, sel_colorWithAlphaComponent_, 0.5);
  }
  else
  {
    __break(1u);
  }
}

uint64_t PregnancyModeTimelineViewModel.currentDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 20);
  uint64_t v4 = sub_23F842410();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t type metadata accessor for PregnancyModeTimelineViewModel()
{
  uint64_t result = qword_26AF30F78;
  if (!qword_26AF30F78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id PregnancyModeTimelineViewModel.pregnancySample.getter()
{
  uint64_t v1 = *(void **)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 24));
  return v1;
}

uint64_t PregnancyModeTimelineViewModel.pregnancyStartDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 28);
  uint64_t v4 = sub_23F842410();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t PregnancyModeTimelineViewModel.estimatedDueDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 32);
  uint64_t v4 = sub_23F842410();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

double PregnancyModeTimelineViewModel.currentValue.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 36));
}

double PregnancyModeTimelineViewModel.filledProgress.getter()
{
  return *(double *)(v0 + *(int *)(type metadata accessor for PregnancyModeTimelineViewModel() + 40));
}

uint64_t PregnancyModeTimelineViewModel.init(currentDay:pregnancySample:estimatedDueDate:today:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  v133 = a4;
  v134 = a3;
  uint64_t v129 = a1;
  sub_23F8407F0();
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v113 = (uint64_t)&v107 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v114 = (uint64_t)&v107 - v11;
  uint64_t v12 = sub_23F842420();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v107 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_23F842490();
  uint64_t v132 = *(void *)(v130 - 8);
  MEMORY[0x270FA5388](v130);
  v131 = (char *)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_23F842410();
  uint64_t v135 = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  v109 = (char *)&v107 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v110 = (char *)&v107 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v112 = (char *)&v107 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v108 = (char *)&v107 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  v124 = (char *)&v107 - v28;
  uint64_t v29 = MEMORY[0x270FA5388](v27);
  v115 = (char *)&v107 - v30;
  uint64_t v31 = MEMORY[0x270FA5388](v29);
  v127 = (char *)&v107 - v32;
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v126 = (char *)&v107 - v34;
  MEMORY[0x270FA5388](v33);
  long long v36 = (char *)&v107 - v35;
  uint64_t v37 = sub_23F8427D0();
  uint64_t v119 = *(void *)(v37 - 8);
  uint64_t v120 = v37;
  (*(void (**)(uint64_t, uint64_t))(v119 + 16))(a5, a1);
  uint64_t v38 = (int *)type metadata accessor for PregnancyModeTimelineViewModel();
  uint64_t v39 = a5 + v38[8];
  uint64_t v123 = v18;
  uint64_t v40 = *(void (**)(void))(v18 + 16);
  ((void (*)(uint64_t, char *, uint64_t))v40)(v39, v134, v17);
  *(void *)(a5 + v38[6]) = a2;
  id v118 = a2;
  id v41 = objc_msgSend(v118, sel_startDate);
  uint64_t v107 = a5 + v38[7];
  sub_23F8423F0();

  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F07740], v12);
  __int16 v42 = v131;
  sub_23F842430();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_23F8427C0();
  uint64_t v44 = v132 + 8;
  int v43 = *(void (**)(char *, uint64_t))(v132 + 8);
  uint64_t v45 = v130;
  v43(v42, v130);
  v121 = v38;
  uint64_t v122 = a5;
  uint64_t v46 = a5 + v38[5];
  char v48 = v134;
  uint64_t v47 = v135;
  ((void (*)(uint64_t, char *, uint64_t))v40)(v46, v36, v135);
  sub_23F842470();
  int v116 = sub_23F842460();
  uint64_t v49 = v42;
  uint64_t v50 = v126;
  uint64_t v51 = v44;
  v43(v49, v45);
  uint64_t v52 = (void (*)(uint64_t, uint64_t))v43;
  v128 = v36;
  LOBYTE(v45) = sub_23F8423C0();
  ((void (*)(char *, char *, uint64_t))v40)(v50, v48, v47);
  uint64_t v53 = v127;
  uint64_t v125 = v18 + 16;
  v40();
  uint64_t v132 = v51;
  v111 = v40;
  v117 = v43;
  if (v45)
  {
    uint64_t v54 = (uint64_t)v131;
    sub_23F842470();
    uint64_t v55 = v114;
    sub_23F840848(v54, v114);
    v52(v54, v130);
    uint64_t v56 = v135;
    ((void (*)(char *, char *, uint64_t))v40)(v124, v53, v135);
    uint64_t v57 = v123;
    uint64_t v58 = v123;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v123 + 48))(v55, 1, v56) == 1)
    {
      uint64_t v59 = v115;
      (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v115, v124, v135);
      sub_23F840B50(v55);
    }
    else
    {
      uint64_t v64 = v135;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v124, v135);
      uint64_t v59 = v115;
      (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v115, v55, v64);
    }
    double v65 = v126;
    sub_23F842108(&qword_268C414F8, MEMORY[0x263F07490]);
    uint64_t v66 = v135;
    char v67 = sub_23F8427F0();
    double v61 = *(void (**)(char *, uint64_t))(v58 + 8);
    v61(v59, v66);
    v61(v127, v66);
    v61(v65, v66);
    uint64_t v63 = (uint64_t)v131;
    if ((v67 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v58 = v123;
    double v60 = v53;
    double v61 = *(void (**)(char *, uint64_t))(v123 + 8);
    uint64_t v62 = v135;
    v61(v60, v135);
    v61(v50, v62);
    uint64_t v63 = (uint64_t)v131;
  }
  sub_23F842470();
  uint64_t v68 = v128;
  int v69 = sub_23F842460();
  uint64_t v70 = v130;
  uint64_t v71 = (void (*)(uint64_t, uint64_t))v117;
  v117((char *)v63, v130);
  if (v69 & v116)
  {

    uint64_t v72 = v135;
    v61(v133, v135);
    v61(v134, v72);
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v129, v120);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v61)(v68, v72);
    uint64_t v75 = v121;
    uint64_t v74 = v122;
    *(void *)(v122 + v121[9]) = 0x3FF0000000000000;
    double v76 = 1.0;
    goto LABEL_25;
  }
  sub_23F842470();
  uint64_t v77 = v113;
  uint64_t v78 = v71;
  uint64_t v79 = v133;
  sub_23F840848(v63, v113);
  v78(v63, v70);
  uint64_t v80 = v112;
  v81 = v79;
  uint64_t v82 = v135;
  long long v83 = v111;
  ((void (*)(char *, char *, uint64_t))v111)(v112, v81, v135);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v77, 1, v82) == 1)
  {
    long long v84 = v108;
    (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v108, v80, v135);
    sub_23F840B50(v77);
  }
  else
  {
    long long v85 = v80;
    uint64_t v86 = v135;
    v61(v85, v135);
    long long v84 = v108;
    (*(void (**)(char *, uint64_t, uint64_t))(v58 + 32))(v108, v77, v86);
  }
  v87 = v110;
  v88 = v109;
  v89 = v134;
  char v90 = sub_23F8423D0();
  uint64_t v91 = v135;
  v61(v84, v135);
  ((void (*)(char *, char *, uint64_t))v83)(v87, v128, v91);
  ((void (*)(char *, char *, uint64_t))v83)(v88, v89, v91);
  if (v90)
  {
    sub_23F842108(&qword_268C414F8, MEMORY[0x263F07490]);
    v92 = v88;
    uint64_t v93 = v135;
    char v94 = sub_23F8427F0();
    v61(v92, v93);
    v61(v87, v93);
    if ((v94 & 1) == 0)
    {
LABEL_15:

      uint64_t v95 = v135;
      v61(v133, v135);
      v61(v134, v95);
      (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v129, v120);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v61)(v128, v95);
      uint64_t v75 = v121;
      uint64_t v74 = v122;
      *(void *)(v122 + v121[9]) = 0x3FEE3D70A3D70A3DLL;
      double v76 = 0.92;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v96 = v135;
    v61(v88, v135);
    v61(v87, v96);
  }
  sub_23F842108(&qword_268C414F8, MEMORY[0x263F07490]);
  v97 = v128;
  if (sub_23F8427F0())
  {
    v98 = v134;
    sub_23F8423B0();
    double v100 = v99;
    sub_23F8423B0();
    double v102 = v101;

    double v103 = v102 / v100;
    if (v102 / v100 <= 0.003) {
      double v103 = 0.003;
    }
    if (v103 <= 1.0) {
      double v76 = v103;
    }
    else {
      double v76 = 1.0;
    }
    uint64_t v75 = v121;
    v104 = v97;
    uint64_t v74 = v122;
    *(double *)(v122 + v121[9]) = v76;
    uint64_t v105 = v135;
    v61(v133, v135);
    v61(v98, v105);
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v129, v120);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v61)(v104, v105);
  }
  else
  {

    uint64_t v106 = v135;
    v61(v133, v135);
    v61(v134, v106);
    (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v129, v120);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v61)(v97, v106);
    uint64_t v75 = v121;
    uint64_t v74 = v122;
    *(void *)(v122 + v121[9]) = 0;
    double v76 = 0.0;
  }
LABEL_25:
  *(double *)(v74 + v75[10]) = v76;
  return result;
}

void sub_23F8407F0()
{
  if (!qword_268C414F0)
  {
    sub_23F842410();
    unint64_t v0 = sub_23F842850();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268C414F0);
    }
  }
}

uint64_t sub_23F840848@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v24 = a2;
  uint64_t v3 = sub_23F842480();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23F8407F0();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23F842410();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v22 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v21 - v14;
  uint64_t v16 = *MEMORY[0x263F07870];
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v21(v6, v16, v3);
  uint64_t v23 = a1;
  sub_23F842450();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v4 + 8);
  v17(v6, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_23F840B50((uint64_t)v9);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v24, 1, 1, v10);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v15, v9, v10);
    uint64_t v19 = v22;
    sub_23F842440();
    v21(v6, *MEMORY[0x263F078C8], v3);
    sub_23F842450();
    v17(v6, v3);
    uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v19, v10);
    return ((uint64_t (*)(char *, uint64_t))v20)(v15, v10);
  }
}

uint64_t sub_23F840B50(uint64_t a1)
{
  sub_23F8407F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PregnancyModeTimelineViewModel.startDateShorthandText.getter()
{
  uint64_t v0 = sub_23F842370();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v27 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_23F842390();
  uint64_t v2 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23F8423A0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v24 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v24 - v13;
  uint64_t v15 = sub_23F842410();
  uint64_t v24 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for PregnancyModeTimelineViewModel();
  uint64_t v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v26 + *(int *)(v19 + 28), v15);
  MEMORY[0x2455D3390](v20);
  sub_23F842380();
  sub_23F842350();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v25);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  uint64_t v22 = v27;
  sub_23F842360();
  sub_23F842340();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v29);
  v21(v12, v5);
  sub_23F842108(&qword_268C41500, MEMORY[0x263F07258]);
  sub_23F842400();
  v21(v14, v5);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v24);
  return v30;
}

uint64_t PregnancyModeTimelineViewModel.estimatedDueDateShorthandText.getter()
{
  uint64_t v0 = sub_23F842370();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v27 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_23F842390();
  uint64_t v2 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23F8423A0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v24 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v24 - v13;
  uint64_t v15 = sub_23F842410();
  uint64_t v24 = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for PregnancyModeTimelineViewModel();
  uint64_t v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v26 + *(int *)(v19 + 32), v15);
  MEMORY[0x2455D3390](v20);
  sub_23F842380();
  sub_23F842350();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v25);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  uint64_t v22 = v27;
  sub_23F842360();
  sub_23F842340();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v22, v29);
  v21(v12, v5);
  sub_23F842108(&qword_268C41500, MEMORY[0x263F07258]);
  sub_23F842400();
  v21(v14, v5);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v24);
  return v30;
}

uint64_t PregnancyModeTimelineViewModel.hash(into:)()
{
  sub_23F8427D0();
  sub_23F842108(&qword_268C41508, MEMORY[0x263F090E8]);
  sub_23F8427E0();
  uint64_t v1 = type metadata accessor for PregnancyModeTimelineViewModel();
  sub_23F842410();
  sub_23F842108(&qword_268C41510, MEMORY[0x263F07490]);
  sub_23F8427E0();
  id v2 = *(id *)(v0 + *(int *)(v1 + 24));
  sub_23F842840();

  sub_23F8427E0();
  sub_23F8427E0();
  sub_23F8428B0();
  return sub_23F8428B0();
}

uint64_t PregnancyModeTimelineViewModel.hashValue.getter()
{
  return sub_23F8428C0();
}

uint64_t sub_23F8414B0()
{
  return sub_23F8428C0();
}

uint64_t sub_23F8414F4()
{
  return sub_23F8428C0();
}

BOOL _s23HealthMenstrualCyclesUI30PregnancyModeTimelineViewModelV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  sub_23F8427D0();
  sub_23F842108(&qword_268C41520, MEMORY[0x263F090E8]);
  sub_23F842860();
  if (!v6
    && (uint64_t v4 = type metadata accessor for PregnancyModeTimelineViewModel(), (sub_23F8423E0() & 1) != 0)
    && (sub_23F842150(), (sub_23F842830() & 1) != 0)
    && (sub_23F8423E0() & 1) != 0
    && (sub_23F8423E0() & 1) != 0
    && *(double *)(a1 + *(int *)(v4 + 36)) == *(double *)(a2 + *(int *)(v4 + 36)))
  {
    return *(double *)(a1 + *(int *)(v4 + 40)) == *(double *)(a2 + *(int *)(v4 + 40));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23F84165C()
{
  return sub_23F842108(&qword_268C41518, (void (*)(uint64_t))type metadata accessor for PregnancyModeTimelineViewModel);
}

char *initializeBufferWithCopyOfBuffer for PregnancyModeTimelineViewModel(char *a1, char *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = (char *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_23F8427D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = sub_23F842410();
    uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    v12(v9, v10, v11);
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = *(void **)&a2[v13];
    *(void *)&a1[v13] = v15;
    uint64_t v16 = &a1[v14];
    uint64_t v17 = &a2[v14];
    id v18 = v15;
    v12(v16, v17, v11);
    v12(&a1[a3[8]], &a2[a3[8]], v11);
    uint64_t v19 = a3[10];
    *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
    *(void *)&a1[v19] = *(void *)&a2[v19];
  }
  return a1;
}

uint64_t destroy for PregnancyModeTimelineViewModel(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_23F8427D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + a2[5];
  uint64_t v6 = sub_23F842410();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v9)((void *)(v6 - 8), v5, v6);

  v9(a1 + a2[7], v6);
  uint64_t v7 = a1 + a2[8];
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(v7, v6);
}

uint64_t initializeWithCopy for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23F8427D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23F842410();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)(a2 + v12);
  *(void *)(a1 + v12) = v14;
  uint64_t v15 = a1 + v13;
  uint64_t v16 = a2 + v13;
  id v17 = v14;
  v11(v15, v16, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  uint64_t v18 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v18) = *(void *)(a2 + v18);
  return a1;
}

uint64_t assignWithCopy for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23F8427D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23F842410();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = *(void **)(a2 + v12);
  uint64_t v14 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = v13;
  id v15 = v13;

  v11(a1 + a3[7], a2 + a3[7], v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  return a1;
}

uint64_t initializeWithTake for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23F8427D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23F842410();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  uint64_t v12 = a3[7];
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  v11(a1 + v12, a2 + v12, v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  uint64_t v13 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_23F8427D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_23F842410();
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40);
  v11(v8, v9, v10);
  uint64_t v12 = a3[6];
  uint64_t v13 = *(void **)(a1 + v12);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);

  v11(a1 + a3[7], a2 + a3[7], v10);
  v11(a1 + a3[8], a2 + a3[8], v10);
  uint64_t v14 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23F841DE8);
}

uint64_t sub_23F841DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_23F8427D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_23F842410();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t storeEnumTagSinglePayload for PregnancyModeTimelineViewModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23F841F10);
}

uint64_t sub_23F841F10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_23F8427D0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23F842410();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_23F842020()
{
  uint64_t result = sub_23F8427D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_23F842410();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_23F842108(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23F842150()
{
  unint64_t result = qword_268C41528;
  if (!qword_268C41528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268C41528);
  }
  return result;
}

uint64_t sub_23F842190()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

id sub_23F8421C4()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_268C41530 = (uint64_t)result;
  return result;
}

uint64_t sub_23F84221C()
{
  uint64_t v0 = sub_23F8424B0();
  __swift_allocate_value_buffer(v0, qword_268C41850);
  __swift_project_value_buffer(v0, (uint64_t)qword_268C41850);
  if (qword_268C41350 != -1) {
    swift_once();
  }
  id v1 = (id)qword_268C41530;
  return sub_23F8424A0();
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

uint64_t sub_23F842340()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_23F842350()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_23F842360()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_23F842370()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_23F842380()
{
  return MEMORY[0x270EF0570]();
}

uint64_t sub_23F842390()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_23F8423A0()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_23F8423B0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_23F8423C0()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_23F8423D0()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_23F8423E0()
{
  return MEMORY[0x270EF0B88]();
}

uint64_t sub_23F8423F0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_23F842400()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_23F842410()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23F842420()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_23F842430()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_23F842440()
{
  return MEMORY[0x270EF1100]();
}

uint64_t sub_23F842450()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_23F842460()
{
  return MEMORY[0x270EF13B0]();
}

uint64_t sub_23F842470()
{
  return MEMORY[0x270EF13D8]();
}

uint64_t sub_23F842480()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_23F842490()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_23F8424A0()
{
  return MEMORY[0x270EEB1B0]();
}

uint64_t sub_23F8424B0()
{
  return MEMORY[0x270EEB1C0]();
}

uint64_t sub_23F8424C0()
{
  return MEMORY[0x270EFEEC0]();
}

uint64_t sub_23F8424D0()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_23F8424E0()
{
  return MEMORY[0x270EFF230]();
}

uint64_t sub_23F8424F0()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_23F842500()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_23F842510()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_23F842520()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_23F842530()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_23F842540()
{
  return MEMORY[0x270EFF918]();
}

uint64_t sub_23F842560()
{
  return MEMORY[0x270EFFA10]();
}

uint64_t sub_23F842570()
{
  return MEMORY[0x270EFFFB8]();
}

uint64_t sub_23F842580()
{
  return MEMORY[0x270EFFFD8]();
}

uint64_t sub_23F842590()
{
  return MEMORY[0x270EFFFE8]();
}

uint64_t sub_23F8425A0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23F8425B0()
{
  return MEMORY[0x270F002F8]();
}

uint64_t sub_23F8425C0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23F8425D0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23F8425E0()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_23F8425F0()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_23F842600()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_23F842610()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_23F842620()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_23F842630()
{
  return MEMORY[0x270F01AE0]();
}

uint64_t sub_23F842640()
{
  return MEMORY[0x270F01FB0]();
}

uint64_t sub_23F842650()
{
  return MEMORY[0x270F01FD8]();
}

uint64_t sub_23F842660()
{
  return MEMORY[0x270F01FE0]();
}

uint64_t sub_23F842670()
{
  return MEMORY[0x270F01FE8]();
}

uint64_t sub_23F842680()
{
  return MEMORY[0x270F01FF0]();
}

uint64_t sub_23F842690()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23F8426A0()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_23F8426B0()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_23F8426C0()
{
  return MEMORY[0x270F02EE8]();
}

uint64_t sub_23F8426D0()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23F8426E0()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23F8426F0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23F842700()
{
  return MEMORY[0x270F03E10]();
}

uint64_t sub_23F842710()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_23F842720()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_23F842730()
{
  return MEMORY[0x270F04598]();
}

uint64_t sub_23F842740()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_23F842750()
{
  return MEMORY[0x270F04930]();
}

uint64_t sub_23F842760()
{
  return MEMORY[0x270F04938]();
}

uint64_t sub_23F842770()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_23F842780()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_23F842790()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_23F8427A0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_23F8427B0()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_23F8427C0()
{
  return MEMORY[0x270EF3388]();
}

uint64_t sub_23F8427D0()
{
  return MEMORY[0x270EF3390]();
}

uint64_t sub_23F8427E0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23F8427F0()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_23F842800()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23F842810()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23F842820()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23F842830()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23F842840()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_23F842850()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23F842860()
{
  return MEMORY[0x270F9E578]();
}

uint64_t sub_23F842870()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23F842880()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23F842890()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_23F8428A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23F8428B0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_23F8428C0()
{
  return MEMORY[0x270F9FC90]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HKUIDynamicColorWithColors()
{
  return MEMORY[0x270F38308]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}