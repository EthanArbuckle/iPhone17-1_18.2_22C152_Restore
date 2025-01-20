uint64_t sub_23EEF3C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23EEF3C90);
}

uint64_t sub_23EEF3C90(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20DF8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_23EF03ED8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for CornersHighlightView()
{
  uint64_t result = qword_268C26080;
  if (!qword_268C26080) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_23EEF3DF0()
{
  sub_23EDC3390();
  if (v0 <= 0x3F)
  {
    sub_23EF03ED8();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_23EEF3F04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EEF3F20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v24 = a1;
  uint64_t v3 = type metadata accessor for CornersHighlightView();
  uint64_t v4 = v3 - 8;
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26090);
  MEMORY[0x270FA5388](v22);
  uint64_t v9 = (uint64_t *)((char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26098);
  uint64_t v10 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v9 = sub_23EF04FD8();
  v9[1] = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260A0);
  sub_23EEF4254(v2, (uint64_t)v9 + *(int *)(v14 + 44));
  char v25 = *(unsigned char *)(v2 + *(int *)(v4 + 52));
  sub_23EEF7020(v2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for CornersHighlightView);
  unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v16 = swift_allocObject();
  sub_23EEF61D4((uint64_t)v7, v16 + v15);
  sub_23EDB8A58(&qword_268C260A8, &qword_268C26090);
  sub_23EF04BE8();
  swift_release();
  sub_23EDB8D1C((uint64_t)v9, &qword_268C26090);
  sub_23EEF7020(v2, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for CornersHighlightView);
  uint64_t v17 = swift_allocObject();
  sub_23EEF61D4((uint64_t)v7, v17 + v15);
  uint64_t v19 = v23;
  uint64_t v18 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(v24, v12, v23);
  v20 = (void *)(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C260B0) + 36));
  void *v20 = 0;
  v20[1] = 0;
  v20[2] = sub_23EEF62BC;
  v20[3] = v17;
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v19);
}

uint64_t sub_23EEF4254@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260B8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)&v33[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260C0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = &v33[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260C8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = type metadata accessor for CornersHighlightView();
  uint64_t v14 = a1 + *(int *)(v13 + 24);
  char v15 = *(unsigned char *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  v33[8] = v15;
  uint64_t v34 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20E68);
  sub_23EF04DC8();
  if (v35)
  {
    double v17 = 38.0;
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + *(int *)(v13 + 36));
    if (*(void *)(v18 + 16))
    {
      sub_23EEF5DA8(v18);
      double v17 = v19 * 0.02;
    }
    else
    {
      double v17 = 28.0;
    }
  }
  sub_23EEF4568();
  uint64_t v21 = sub_23EEF4608(v20, v17, 0.18);
  swift_bridgeObjectRelease();
  *uint64_t v6 = sub_23EF04FD8();
  v6[1] = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260D0);
  sub_23EEF46AC(a1, v21, (uint64_t *)((char *)v6 + *(int *)(v23 + 44)));
  sub_23EDB8CB8((uint64_t)v6, (uint64_t)v9, &qword_268C260B8);
  sub_23EDB8D1C((uint64_t)v6, &qword_268C260B8);
  uint64_t v24 = sub_23EF04FD8();
  uint64_t v26 = v25;
  uint64_t v27 = (uint64_t)&v12[*(int *)(v10 + 36)];
  sub_23EEF4AC8(v21, a1, v27);
  v28 = (uint64_t *)(v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C260D8) + 36));
  uint64_t *v28 = v24;
  v28[1] = v26;
  sub_23EDB95C8((uint64_t)v9, (uint64_t)v12, &qword_268C260C0);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_23EF05058();
  BOOL v30 = *(void *)(*(void *)(a1 + *(int *)(v13 + 36)) + 16) == 0;
  sub_23EDB8CB8((uint64_t)v12, a2, &qword_268C260C8);
  uint64_t v31 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C260E0) + 36);
  *(void *)uint64_t v31 = v29;
  *(unsigned char *)(v31 + 8) = v30;
  return sub_23EDB8D1C((uint64_t)v12, &qword_268C260C8);
}

double sub_23EEF4568()
{
  uint64_t v1 = type metadata accessor for CornersHighlightView();
  if (*(void *)(*(void *)(v0 + *(int *)(v1 + 36)) + 16))
  {
    sub_23EEF5E54(*(void *)(v0 + *(int *)(v1 + 36)), *(CGFloat *)(v0 + *(int *)(v1 + 56)));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C20E68);
    sub_23EF04DC8();
    if (v3 == 1) {
      return sub_23EEF604C();
    }
    else {
      return sub_23EEF6110();
    }
  }
  return result;
}

uint64_t sub_23EEF4608(uint64_t a1, double a2, double a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C22830);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_23EF12290;
  unint64_t v7 = *(void *)(a1 + 16);
  if (!v7)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(_OWORD *)(result + 32) = *(_OWORD *)(a1 + 32);
  if (v7 == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  *(_OWORD *)(result + 48) = *(_OWORD *)(a1 + 48);
  if (v7 < 3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(_OWORD *)(result + 64) = *(_OWORD *)(a1 + 64);
  if (v7 != 3)
  {
    *(_OWORD *)(result + 80) = *(_OWORD *)(a1 + 80);
    *(double *)(result + 96) = a2;
    *(double *)(result + 104) = a3;
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_23EEF46AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v31 = a2;
  v33 = a3;
  uint64_t v4 = sub_23EF040B8();
  MEMORY[0x270FA5388](v4 - 8);
  BOOL v30 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_23EF050B8();
  uint64_t v6 = *(void *)(v29 - 8);
  MEMORY[0x270FA5388](v29);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26160);
  MEMORY[0x270FA5388](v28);
  uint64_t v10 = (uint64_t *)((char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26168);
  uint64_t v11 = *(void *)(v32 - 8);
  MEMORY[0x270FA5388](v32);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26170);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  double v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  double v19 = (char *)&v28 - v18;
  sub_23EF04C88();
  uint64_t v20 = *(void *)(a1 + *(int *)(type metadata accessor for CornersHighlightView() + 36));
  uint64_t v21 = sub_23EF04CB8();
  swift_release();
  if (*(void *)(v20 + 16))
  {
    uint64_t v22 = v29;
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F1B970], v29);
    uint64_t v23 = (uint64_t)v30;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v30, v8, v22);
    sub_23EEF7020(v23, (uint64_t)v10 + *(int *)(v28 + 36), MEMORY[0x263F190D8]);
    *uint64_t v10 = v31;
    swift_bridgeObjectRetain();
    sub_23EEF7088(v23);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
    sub_23EDB8CB8((uint64_t)v10, (uint64_t)v13, &qword_268C26160);
    uint64_t v24 = v32;
    *(void *)&v13[*(int *)(v32 + 36)] = 0x3FF0000000000000;
    sub_23EDB8D1C((uint64_t)v10, &qword_268C26160);
    sub_23EDB95C8((uint64_t)v13, (uint64_t)v19, &qword_268C26168);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v19, 0, 1, v24);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v19, 1, 1, v32);
  }
  sub_23EDB8CB8((uint64_t)v19, (uint64_t)v17, &qword_268C26170);
  uint64_t v25 = v33;
  uint64_t *v33 = v21;
  v25[1] = 0;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26178);
  sub_23EDB8CB8((uint64_t)v17, (uint64_t)v25 + *(int *)(v26 + 48), &qword_268C26170);
  swift_retain();
  sub_23EDB8D1C((uint64_t)v19, &qword_268C26170);
  sub_23EDB8D1C((uint64_t)v17, &qword_268C26170);
  return swift_release();
}

uint64_t sub_23EEF4AC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v71 = a3;
  uint64_t v5 = type metadata accessor for CornersHighlightView();
  uint64_t v6 = (int *)(v5 - 8);
  uint64_t v64 = *(void *)(v5 - 8);
  uint64_t v63 = *(void *)(v64 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v73 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260E8);
  MEMORY[0x270FA5388](v61);
  v60 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260F0);
  uint64_t v68 = *(void *)(v66 - 8);
  MEMORY[0x270FA5388](v66);
  v72 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C260F8);
  uint64_t v69 = *(void *)(v10 - 8);
  uint64_t v70 = v10;
  MEMORY[0x270FA5388](v10);
  v62 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26100) - 8;
  MEMORY[0x270FA5388](v67);
  v65 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_23EF03D28();
  uint64_t v13 = v95;
  uint64_t v14 = v97;
  uint64_t v15 = v98;
  uint64_t v16 = v99;
  uint64_t v17 = *(void *)(a2 + v6[12]);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = a2 + v6[8];
  char v20 = *(unsigned char *)v19;
  uint64_t v21 = *(void *)(v19 + 8);
  LOBYTE(v85) = v20;
  *((void *)&v85 + 1) = v21;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20E68);
  sub_23EF04DC8();
  if ((_BYTE)v76) {
    double v22 = 0.0;
  }
  else {
    double v22 = 1.0;
  }
  uint64_t v23 = a2 + v6[7];
  char v24 = *(unsigned char *)v23;
  uint64_t v25 = *(void *)(v23 + 8);
  LOBYTE(v85) = v24;
  *((void *)&v85 + 1) = v25;
  sub_23EF04DC8();
  if ((_BYTE)v76) {
    double v26 = 0.96;
  }
  else {
    double v26 = 1.0;
  }
  sub_23EF05108();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_23EF04C88();
  uint64_t v31 = sub_23EF04CB8();
  swift_release();
  *(void *)&long long v85 = a1;
  *((void *)&v85 + 1) = v13;
  *(void *)&long long v86 = v96;
  *((void *)&v86 + 1) = v14;
  *(void *)&long long v87 = v15;
  *((void *)&v87 + 1) = v16;
  *(void *)&long long v88 = KeyPath;
  *((void *)&v88 + 1) = v17;
  *(double *)&long long v89 = v22;
  *((double *)&v89 + 1) = v26;
  *(double *)&long long v90 = v26;
  *((void *)&v90 + 1) = v28;
  *(void *)&long long v91 = v30;
  *((void *)&v91 + 1) = v31;
  uint64_t v92 = 0x4020000000000000;
  uint64_t v93 = 0;
  uint64_t v94 = 0;
  long long v83 = 0x4020000000000000uLL;
  uint64_t v84 = 0;
  long long v78 = v87;
  long long v79 = v88;
  long long v81 = v90;
  long long v82 = v91;
  long long v80 = v89;
  long long v76 = v85;
  long long v77 = v86;
  uint64_t v74 = sub_23EE96078(0, 0xD000000000000018);
  uint64_t v75 = v32;
  sub_23ED9D714();
  uint64_t v33 = sub_23EF04988();
  uint64_t v35 = v34;
  char v37 = v36 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C26108);
  sub_23EEF69AC(&qword_268C26110, &qword_268C26108, (void (*)(void))sub_23EEF697C);
  uint64_t v38 = (uint64_t)v60;
  sub_23EF04A88();
  sub_23EDBD444(v33, v35, v37);
  swift_bridgeObjectRelease();
  sub_23EEF6B1C((uint64_t)&v85);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20DF8);
  sub_23EF04558();
  LOBYTE(v74) = 7;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20E18);
  unint64_t v39 = sub_23EEF6B84();
  unint64_t v40 = sub_23EDC33F8();
  uint64_t v41 = v61;
  sub_23EF04AF8();
  swift_release();
  swift_release();
  sub_23EDB8D1C(v38, &qword_268C260E8);
  uint64_t v42 = v6[11];
  uint64_t v59 = a2;
  uint64_t v74 = *(void *)(a2 + v42);
  uint64_t v43 = v73;
  sub_23EEF7020(a2, v73, (uint64_t (*)(void))type metadata accessor for CornersHighlightView);
  uint64_t v44 = *(unsigned __int8 *)(v64 + 80);
  uint64_t v45 = (v44 + 16) & ~v44;
  uint64_t v64 = v44 | 7;
  uint64_t v46 = swift_allocObject();
  sub_23EEF61D4(v43, v46 + v45);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C22E38);
  *(void *)&long long v76 = v41;
  *((void *)&v76 + 1) = v58;
  *(void *)&long long v77 = v39;
  *((void *)&v77 + 1) = v40;
  swift_getOpaqueTypeConformance2();
  sub_23EE1A54C();
  v47 = v62;
  uint64_t v48 = v66;
  v49 = v72;
  sub_23EF04BE8();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v49, v48);
  uint64_t v50 = v73;
  sub_23EEF7020(v59, v73, (uint64_t (*)(void))type metadata accessor for CornersHighlightView);
  uint64_t v51 = swift_allocObject();
  sub_23EEF61D4(v50, v51 + v45);
  uint64_t v53 = v69;
  uint64_t v52 = v70;
  uint64_t v54 = (uint64_t)v65;
  (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v65, v47, v70);
  v55 = (uint64_t (**)())(v54 + *(int *)(v67 + 44));
  *v55 = sub_23EEF6D2C;
  v55[1] = (uint64_t (*)())v51;
  v55[2] = 0;
  v55[3] = 0;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v47, v52);
  return sub_23EDB95C8(v54, v71, &qword_268C26100);
}

uint64_t sub_23EEF5224(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a2 + 16))
  {
    uint64_t v2 = sub_23EF05068();
  }
  else
  {
    sub_23EF05078();
    sub_23EF05018();
    uint64_t v2 = swift_release();
  }
  MEMORY[0x270FA5388](v2);
  sub_23EF03F38();
  return swift_release();
}

uint64_t sub_23EEF532C()
{
  return sub_23EF04DD8();
}

uint64_t sub_23EEF539C(uint64_t a1)
{
  uint64_t v2 = sub_23EF05128();
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_23EF05148();
  uint64_t v16 = *(void *)(v5 - 8);
  uint64_t v17 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CornersHighlightView();
  uint64_t v15 = *(void *)(v8 - 8);
  uint64_t v9 = *(void *)(v15 + 64);
  MEMORY[0x270FA5388](v8 - 8);
  sub_23EF05078();
  sub_23EF05018();
  swift_release();
  uint64_t v20 = a1;
  sub_23EF03F38();
  swift_release();
  sub_23EF05078();
  sub_23EF05038();
  swift_release();
  uint64_t v19 = a1;
  sub_23EF03F38();
  swift_release();
  sub_23EDB6A74();
  uint64_t v10 = (void *)sub_23EF05868();
  sub_23EEF7020(a1, (uint64_t)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for CornersHighlightView);
  unint64_t v11 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  uint64_t v12 = swift_allocObject();
  sub_23EEF61D4((uint64_t)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  aBlock[4] = sub_23EEF6F68;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23ED9E120;
  aBlock[3] = &block_descriptor_20;
  uint64_t v13 = _Block_copy(aBlock);
  swift_release();
  sub_23EF05138();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_23EEF6CE0((unint64_t *)&qword_268C23050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C228A0);
  sub_23EDB8A58((unint64_t *)&qword_268C23060, (uint64_t *)&unk_268C228A0);
  sub_23EF05A68();
  MEMORY[0x2455BEAB0](0, v7, v4, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v7, v17);
}

uint64_t sub_23EEF57D0()
{
  return sub_23EF04DD8();
}

uint64_t sub_23EEF5844()
{
  return sub_23EF04DD8();
}

uint64_t sub_23EEF58B4(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = sub_23EF05128();
  uint64_t v24 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_23EF05148();
  uint64_t v8 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for CornersHighlightView();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  uint64_t v14 = MEMORY[0x270FA5388](v11 - 8);
  char v15 = *a2;
  if (*(void *)(*(void *)(a3 + *(int *)(v14 + 44)) + 16))
  {
    sub_23EDB6A74();
    uint64_t v22 = sub_23EF05868();
    sub_23EEF7020(a3, (uint64_t)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for CornersHighlightView);
    unint64_t v16 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v17 = swift_allocObject();
    sub_23EEF61D4((uint64_t)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
    *(unsigned char *)(v17 + v16 + v13) = v15;
    aBlock[4] = sub_23EEF64FC;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23ED9E120;
    aBlock[3] = &block_descriptor_39;
    uint64_t v18 = _Block_copy(aBlock);
    swift_release();
    sub_23EF05138();
    aBlock[0] = MEMORY[0x263F8EE78];
    sub_23EEF6CE0((unint64_t *)&qword_268C23050, MEMORY[0x263F8F030]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C228A0);
    sub_23EDB8A58((unint64_t *)&qword_268C23060, (uint64_t *)&unk_268C228A0);
    sub_23EF05A68();
    uint64_t v19 = (void *)v22;
    MEMORY[0x2455BEAB0](0, v10, v7, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v23);
  }
  else
  {
    uint64_t v21 = sub_23EF05078();
    MEMORY[0x270FA5388](v21);
    *(&v22 - 2) = a3;
    *((unsigned char *)&v22 - 8) = v15;
    sub_23EF03F38();
    return swift_release();
  }
}

uint64_t sub_23EEF5CC0()
{
  return sub_23EF04DD8();
}

uint64_t sub_23EEF5D3C()
{
  return sub_23EF04DD8();
}

uint64_t sub_23EEF5DA8(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v1 == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v1 < 3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v1 == 3) {
LABEL_9:
  }
    __break(1u);
  return result;
}

uint64_t sub_23EEF5E54(uint64_t a1, CGFloat a2)
{
  int64_t v4 = *(void *)(a1 + 16);
  double v5 = (double)v4;
  if (!v4)
  {
    double v8 = 0.0;
    v7.f64[0] = 0.0;
    goto LABEL_11;
  }
  if (v4 == 1)
  {
    uint64_t v6 = 0;
    float64x2_t v7 = 0uLL;
  }
  else
  {
    uint64_t v6 = v4 & 0x7FFFFFFFFFFFFFFELL;
    uint64_t v9 = (float64x2_t *)(a1 + 48);
    float64x2_t v7 = 0uLL;
    uint64_t v10 = v4 & 0x7FFFFFFFFFFFFFFELL;
    do
    {
      float64x2_t v7 = vaddq_f64(vaddq_f64(v7, v9[-1]), *v9);
      v9 += 2;
      v10 -= 2;
    }
    while (v10);
    if (v4 == v6) {
      goto LABEL_10;
    }
  }
  int64_t v11 = v4 - v6;
  uint64_t v12 = (float64x2_t *)(a1 + 16 * v6 + 32);
  do
  {
    float64x2_t v13 = *v12++;
    float64x2_t v7 = vaddq_f64(v7, v13);
    --v11;
  }
  while (v11);
LABEL_10:
  double v8 = v7.f64[1];
LABEL_11:
  float64_t v14 = v7.f64[0] / v5;
  v26.CGFloat a = 1.0;
  v26.b = 0.0;
  v26.c = 0.0;
  v26.d = 1.0;
  v26.tx = 0.0;
  v26.ty = 0.0;
  double v15 = v8 / v5;
  CGAffineTransformTranslate(&v25, &v26, v7.f64[0] / v5, v8 / v5);
  CGAffineTransform v26 = v25;
  CGAffineTransformScale(&v25, &v26, a2, a2);
  CGAffineTransform v26 = v25;
  CGAffineTransformTranslate(&v25, &v26, -v14, -v15);
  CGFloat a = MEMORY[0x263F8EE78];
  if (v4)
  {
    long long v23 = *(_OWORD *)&v25.c;
    long long v24 = *(_OWORD *)&v25.a;
    long long v22 = *(_OWORD *)&v25.tx;
    *(void *)&v25.CGFloat a = MEMORY[0x263F8EE78];
    sub_23EDCE8C0(0, v4, 0);
    CGFloat a = v25.a;
    uint64_t v17 = a1 + 40;
    do
    {
      CGPoint v27 = *(CGPoint *)(v17 - 8);
      *(_OWORD *)&v26.CGFloat a = v24;
      *(_OWORD *)&v26.c = v23;
      *(_OWORD *)&v26.tx = v22;
      CGPoint v18 = CGPointApplyAffineTransform(v27, &v26);
      v25.CGFloat a = a;
      unint64_t v20 = *(void *)(*(void *)&a + 16);
      unint64_t v19 = *(void *)(*(void *)&a + 24);
      if (v20 >= v19 >> 1)
      {
        sub_23EDCE8C0(v19 > 1, v20 + 1, 1);
        CGFloat a = v25.a;
      }
      *(void *)(*(void *)&a + 16) = v20 + 1;
      *(CGPoint *)(*(void *)&a + 16 * v20 + 32) = v18;
      v17 += 16;
      --v4;
    }
    while (v4);
  }
  return *(void *)&a;
}

double sub_23EEF604C()
{
  double v1 = *(double *)(v0 + *(int *)(type metadata accessor for CornersHighlightView() + 48) + 8);
  sub_23EF03EB8();
  double v3 = v2;
  sub_23EF03EA8();
  double v5 = v3 + v4;
  sub_23EF03EA8();
  double v7 = v5 + v6;
  sub_23EF03EB8();
  double v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C213F0);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_23EF0B790;
  double result = (v7 - v1) * 0.5;
  *(void *)(v10 + 32) = 0x4038000000000000;
  *(double *)(v10 + 40) = result;
  *(double *)(v10 + 48) = v9 + -24.0;
  double v12 = (v1 + v7) * 0.5;
  *(double *)(v10 + 56) = result;
  *(double *)(v10 + 64) = v9 + -24.0;
  *(double *)(v10 + 72) = v12;
  *(void *)(v10 + 80) = 0x4038000000000000;
  *(double *)(v10 + 88) = v12;
  return result;
}

double sub_23EEF6110()
{
  type metadata accessor for CornersHighlightView();
  sub_23EF03EB8();
  double v1 = v0;
  sub_23EF03EA8();
  double v3 = v1 + v2;
  sub_23EF03EA8();
  double v5 = v3 + v4;
  sub_23EF03EB8();
  double v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C213F0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_23EF0B790;
  double v9 = (v7 + -224.0) * 0.5;
  double v10 = (v5 + -224.0) * 0.5;
  *(double *)(v8 + 32) = v9;
  *(double *)(v8 + 40) = v10;
  double v11 = (v7 + 224.0) * 0.5;
  *(double *)(v8 + 48) = v11;
  *(double *)(v8 + 56) = v10;
  double result = (v5 + 224.0) * 0.5;
  *(double *)(v8 + 64) = v11;
  *(double *)(v8 + 72) = result;
  *(double *)(v8 + 80) = v9;
  *(double *)(v8 + 88) = result;
  return result;
}

uint64_t sub_23EEF61D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CornersHighlightView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EEF6238(uint64_t a1, char *a2)
{
  uint64_t v5 = *(void *)(type metadata accessor for CornersHighlightView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_23EEF58B4(a1, a2, v6);
}

uint64_t sub_23EEF62BC()
{
  return sub_23EF04548();
}

uint64_t sub_23EEF633C()
{
  uint64_t v1 = type metadata accessor for CornersHighlightView();
  unint64_t v2 = (*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = sub_23EF045D8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3)) {
    (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20DF8);
  swift_release();
  swift_release();
  swift_release();
  unint64_t v5 = v0 + v2 + *(int *)(v1 + 28);
  uint64_t v6 = sub_23EF03ED8();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23EEF64FC()
{
  type metadata accessor for CornersHighlightView();
  return sub_23EEF5D3C();
}

uint64_t block_copy_helper_38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_38()
{
  return swift_release();
}

uint64_t sub_23EEF6598()
{
  return sub_23EEF5CC0();
}

double sub_23EEF65B8@<D0>(uint64_t a1@<X8>)
{
  sub_23EEF7428(*v1, (uint64_t)v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t (*sub_23EEF6604(void *a1))()
{
  *a1 = *v1;
  a1[1] = v1;
  swift_bridgeObjectRetain();
  return sub_23EEF6650;
}

uint64_t sub_23EEF6658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23EEF76A0();
  return MEMORY[0x270F04808](a1, a2, a3, v6);
}

uint64_t sub_23EEF66BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23EEF76A0();
  return MEMORY[0x270F047D0](a1, a2, a3, v6);
}

uint64_t sub_23EEF6720(uint64_t a1)
{
  unint64_t v2 = sub_23EEF76A0();
  return MEMORY[0x270F047E0](a1, v2);
}

double sub_23EEF676C@<D0>(uint64_t a1@<X8>)
{
  sub_23EEF76F4(*v1, (uint64_t)v5);
  double result = *(double *)v5;
  long long v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_23EEF67B4@<X0>(void *a1@<X8>)
{
  *a1 = *v1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23EEF67C0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v2;
  return result;
}

uint64_t sub_23EEF67EC(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[1];
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v2;
  }
  return result;
}

uint64_t sub_23EEF6860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23EEF7840();
  return MEMORY[0x270F04808](a1, a2, a3, v6);
}

uint64_t sub_23EEF68C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23EEF7840();
  return MEMORY[0x270F047D0](a1, a2, a3, v6);
}

uint64_t sub_23EEF6928(uint64_t a1)
{
  unint64_t v2 = sub_23EEF7840();
  return MEMORY[0x270F047E0](a1, v2);
}

uint64_t sub_23EEF697C()
{
  return sub_23EEF69AC(&qword_268C26118, &qword_268C26120, (void (*)(void))sub_23EEF6A28);
}

uint64_t sub_23EEF69AC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_23EEF6A28()
{
  return sub_23EEF69AC(&qword_268C26128, &qword_268C26130, (void (*)(void))sub_23EEF6A58);
}

unint64_t sub_23EEF6A58()
{
  unint64_t result = qword_268C26138;
  if (!qword_268C26138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26140);
    sub_23EDB8A58(&qword_268C26148, &qword_268C26150);
    sub_23EDB8A58(&qword_268C20D98, &qword_268C20DA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26138);
  }
  return result;
}

uint64_t sub_23EEF6B1C(uint64_t a1)
{
  return a1;
}

unint64_t sub_23EEF6B84()
{
  unint64_t result = qword_268C26158;
  if (!qword_268C26158)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C260E8);
    sub_23EEF69AC(&qword_268C26110, &qword_268C26108, (void (*)(void))sub_23EEF697C);
    sub_23EEF6CE0((unint64_t *)&qword_268C20F30, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26158);
  }
  return result;
}

uint64_t sub_23EEF6C60(uint64_t a1, uint64_t a2)
{
  type metadata accessor for CornersHighlightView();
  return sub_23EEF5224(a1, a2);
}

uint64_t sub_23EEF6CE0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23EEF6D2C()
{
  uint64_t v1 = *(void *)(type metadata accessor for CornersHighlightView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
  return sub_23EEF539C(v2);
}

uint64_t sub_23EEF6D8C()
{
  return sub_23EEF5844();
}

uint64_t objectdestroyTm_28()
{
  uint64_t v1 = type metadata accessor for CornersHighlightView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = sub_23EF045D8();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v0 + v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v3, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20DF8);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 28);
  uint64_t v7 = sub_23EF03ED8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23EEF6F68()
{
  return sub_23EF04548();
}

uint64_t sub_23EEF6FE8()
{
  return sub_23EEF532C();
}

uint64_t sub_23EEF7004()
{
  return sub_23EEF57D0();
}

uint64_t sub_23EEF7020(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23EEF7088(uint64_t a1)
{
  uint64_t v2 = sub_23EF040B8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for CornersHighlightShape()
{
  return &type metadata for CornersHighlightShape;
}

ValueMetadata *type metadata accessor for MaskHighlightShape()
{
  return &type metadata for MaskHighlightShape;
}

unint64_t sub_23EEF7108()
{
  unint64_t result = qword_268C26180;
  if (!qword_268C26180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C260B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26090);
    sub_23EDB8A58(&qword_268C260A8, &qword_268C26090);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26180);
  }
  return result;
}

uint64_t sub_23EEF71F8()
{
  return sub_23EDB8A58(&qword_268C26188, &qword_268C26190);
}

unint64_t sub_23EEF7238()
{
  unint64_t result = qword_268C26198;
  if (!qword_268C26198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26198);
  }
  return result;
}

unint64_t sub_23EEF7290()
{
  unint64_t result = qword_268C261A0;
  if (!qword_268C261A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C261A0);
  }
  return result;
}

unint64_t sub_23EEF72E8()
{
  unint64_t result = qword_268C261A8;
  if (!qword_268C261A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C261A8);
  }
  return result;
}

uint64_t sub_23EEF733C()
{
  return sub_23EDB8A58(&qword_268C261B0, &qword_268C261B8);
}

unint64_t sub_23EEF737C()
{
  unint64_t result = qword_268C261C0;
  if (!qword_268C261C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C261C0);
  }
  return result;
}

unint64_t sub_23EEF73D4()
{
  unint64_t result = qword_268C261C8;
  if (!qword_268C261C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C261C8);
  }
  return result;
}

void sub_23EEF7428(double *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2 = *((void *)a1 + 2);
  if (!v2)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v2 == 1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v2 < 3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v2 == 3)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v2 < 5)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v2 == 5)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v2 < 7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v2 == 7)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v5 = *((void *)a1 + 4);
  uint64_t v6 = *((void *)a1 + 5);
  uint64_t v7 = *((void *)a1 + 6);
  uint64_t v8 = *((void *)a1 + 7);
  uint64_t v9 = *((void *)a1 + 8);
  uint64_t v10 = *((void *)a1 + 9);
  uint64_t v11 = *((void *)a1 + 10);
  uint64_t v12 = *((void *)a1 + 11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C213F0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23EF0C7E0;
  *(void *)(inited + 32) = v5;
  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v8;
  *(void *)(inited + 64) = v9;
  *(void *)(inited + 72) = v10;
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_23EF0C7E0;
  *(void *)(v14 + 32) = v7;
  *(void *)(v14 + 40) = v8;
  *(void *)(v14 + 48) = v9;
  *(void *)(v14 + 56) = v10;
  *(void *)(v14 + 64) = v11;
  *(void *)(v14 + 72) = v12;
  uint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_23EF0C7E0;
  *(void *)(v15 + 32) = v9;
  *(void *)(v15 + 40) = v10;
  *(void *)(v15 + 48) = v11;
  *(void *)(v15 + 56) = v12;
  *(void *)(v15 + 64) = v5;
  *(void *)(v15 + 72) = v6;
  uint64_t v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_23EF0C7E0;
  *(void *)(v16 + 32) = v11;
  *(void *)(v16 + 40) = v12;
  *(void *)(v16 + 48) = v5;
  *(void *)(v16 + 56) = v6;
  *(void *)(v16 + 64) = v7;
  *(void *)(v16 + 72) = v8;
  id v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824C0]), sel_init);
  if (v2 < 9)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v2 != 9)
  {
    CGPoint v18 = v17;
    double v19 = a1[12];
    double v20 = a1[13];
    sub_23EE97738((id)inited, v19, v20);
    objc_msgSend(v18, sel_stroke);
    swift_bridgeObjectRelease();
    sub_23EE97738((id)v14, v19, v20);
    objc_msgSend(v18, sel_stroke);
    swift_bridgeObjectRelease();
    sub_23EE97738((id)v15, v19, v20);
    objc_msgSend(v18, sel_stroke);
    swift_bridgeObjectRelease();
    sub_23EE97738((id)v16, v19, v20);
    objc_msgSend(v18, sel_stroke);
    swift_setDeallocating();
    id v21 = objc_msgSend(v18, sel_CGPath);
    sub_23EF048F8();

    *(_OWORD *)a2 = v22;
    *(_OWORD *)(a2 + 16) = v23;
    *(unsigned char *)(a2 + 32) = v24;
    return;
  }
LABEL_21:
  __break(1u);
}

unint64_t sub_23EEF76A0()
{
  unint64_t result = qword_268C261D0;
  if (!qword_268C261D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C261D0);
  }
  return result;
}

void sub_23EEF76F4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C213F0);
  uint64_t inited = (char *)swift_initStackObject();
  *((_OWORD *)inited + 1) = xmmword_23EF0B790;
  unint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v5 == 1)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v6 = inited;
  *((_OWORD *)inited + 2) = *(_OWORD *)(a1 + 32);
  if (v5 < 3)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v5 == 3)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  *((_OWORD *)inited + 3) = *(_OWORD *)(a1 + 48);
  if (v5 < 5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 == 5)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *((_OWORD *)inited + 4) = *(_OWORD *)(a1 + 64);
  if (v5 < 7)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v5 == 7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *((_OWORD *)inited + 5) = *(_OWORD *)(a1 + 80);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F824C0]), sel_init);
  if (v5 >= 9)
  {
    uint64_t v8 = v7;
    sub_23EE97A70(v6, *(double *)(a1 + 96));
    swift_setDeallocating();
    id v9 = objc_msgSend(v8, sel_CGPath);
    sub_23EF048F8();

    *(_OWORD *)a2 = v10;
    *(_OWORD *)(a2 + 16) = v11;
    *(unsigned char *)(a2 + 32) = v12;
    return;
  }
LABEL_19:
  __break(1u);
}

unint64_t sub_23EEF7840()
{
  unint64_t result = qword_268C261D8;
  if (!qword_268C261D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C261D8);
  }
  return result;
}

uint64_t sub_23EEF7894()
{
  return sub_23EEF7004();
}

uint64_t type metadata accessor for UIKitAnimator()
{
  return self;
}

uint64_t sub_23EEF78E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C261E8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v30 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C261F0);
  MEMORY[0x270FA5388](v9 - 8);
  long long v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C261F8);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  uint64_t v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  id v17 = (char *)&v30 - v16;
  *(void *)long long v11 = sub_23EF04358();
  *((void *)v11 + 1) = 0x4008000000000000;
  v11[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26200);
  sub_23EEF7CF0((long long *)a1, (uint64_t)&v11[*(int *)(v18 + 44)]);
  sub_23EDB8CB8((uint64_t)v11, (uint64_t)v15, &qword_268C261F0);
  sub_23EDB8D1C((uint64_t)v11, &qword_268C261F0);
  sub_23EDB95C8((uint64_t)v15, (uint64_t)v17, &qword_268C261F8);
  uint64_t v19 = sub_23EF04C98();
  long long v44 = *(_OWORD *)(a1 + 72);
  uint64_t v45 = *(void *)(a1 + 88);
  long long v32 = *(_OWORD *)(a1 + 72);
  uint64_t v33 = *(void *)(a1 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C22F10);
  sub_23EF04DC8();
  long long v32 = v44;
  uint64_t v33 = v45;
  sub_23EF04DC8();
  sub_23EF04FD8();
  sub_23EF03DC8();
  *(void *)&long long v32 = v19;
  WORD4(v32) = 256;
  uint64_t v33 = v39;
  char v34 = v40;
  uint64_t v35 = v41;
  char v36 = v42;
  long long v37 = v43;
  char v38 = 0;
  double v20 = (_OWORD *)swift_allocObject();
  long long v21 = *(_OWORD *)(a1 + 48);
  v20[3] = *(_OWORD *)(a1 + 32);
  v20[4] = v21;
  long long v22 = *(_OWORD *)(a1 + 80);
  v20[5] = *(_OWORD *)(a1 + 64);
  v20[6] = v22;
  long long v23 = *(_OWORD *)(a1 + 16);
  v20[1] = *(_OWORD *)a1;
  v20[2] = v23;
  sub_23EE5C334(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C26208);
  sub_23EEFA2C0();
  sub_23EF04A18();
  swift_release();
  swift_release();
  sub_23EDB8CB8((uint64_t)v17, (uint64_t)v15, &qword_268C261F8);
  char v24 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  CGAffineTransform v25 = v30;
  v24(v30, v8, v3);
  uint64_t v26 = v31;
  sub_23EDB8CB8((uint64_t)v15, v31, &qword_268C261F8);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26228);
  v24((char *)(v26 + *(int *)(v27 + 48)), v25, v3);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v4 + 8);
  v28(v8, v3);
  sub_23EDB8D1C((uint64_t)v17, &qword_268C261F8);
  v28(v25, v3);
  return sub_23EDB8D1C((uint64_t)v15, &qword_268C261F8);
}

uint64_t sub_23EEF7CF0@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26230);
  MEMORY[0x270FA5388](v30);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26238);
  MEMORY[0x270FA5388](v31);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26240);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  long long v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v29 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26248);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  id v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v19 = (char *)&v29 - v18;
  *(void *)uint64_t v19 = sub_23EF042B8();
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26250);
  sub_23EEF80B8(a1, (uint64_t)&v19[*(int *)(v20 + 44)]);
  *(void *)uint64_t v4 = sub_23EF042B8();
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26258);
  sub_23EEF9120(a1, (uint64_t)&v4[*(int *)(v21 + 44)]);
  long long v22 = a1[1];
  long long v34 = *a1;
  long long v35 = v22;
  long long v23 = a1[3];
  long long v36 = a1[2];
  long long v37 = v23;
  long long v33 = v22;
  sub_23EDB8A58(&qword_268C26260, &qword_268C26230);
  sub_23ED9D714();
  sub_23EF04A98();
  sub_23EDB8D1C((uint64_t)v4, &qword_268C26230);
  sub_23EF04838();
  sub_23EEFA360();
  sub_23EF049E8();
  sub_23EDB8D1C((uint64_t)v6, &qword_268C26238);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v11, v7);
  sub_23EDB8CB8((uint64_t)v19, (uint64_t)v17, &qword_268C26248);
  char v24 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v24(v11, v13, v7);
  uint64_t v25 = v32;
  sub_23EDB8CB8((uint64_t)v17, v32, &qword_268C26248);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26270);
  v24((char *)(v25 + *(int *)(v26 + 48)), v11, v7);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v8 + 8);
  v27(v13, v7);
  sub_23EDB8D1C((uint64_t)v19, &qword_268C26248);
  v27(v11, v7);
  return sub_23EDB8D1C((uint64_t)v17, &qword_268C26248);
}

uint64_t sub_23EEF80B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v107 = a2;
  uint64_t v104 = sub_23EF04928();
  uint64_t v102 = *(void *)(v104 - 8);
  MEMORY[0x270FA5388](v104);
  v100 = (char *)&v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262A0);
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  v111 = (char *)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262A8) - 8;
  MEMORY[0x270FA5388](v97);
  uint64_t v96 = (char *)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262B0);
  MEMORY[0x270FA5388](v103);
  uint64_t v98 = (uint64_t)&v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262B8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v99 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v101 = (uint64_t)&v92 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C24050);
  uint64_t v92 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C24820);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262C0);
  uint64_t v18 = v17 - 8;
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262C8);
  uint64_t v22 = v21 - 8;
  MEMORY[0x270FA5388](v21);
  char v24 = (char *)&v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262D0);
  MEMORY[0x270FA5388](v93);
  uint64_t v26 = (char *)&v92 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C262D8);
  uint64_t v28 = MEMORY[0x270FA5388](v27 - 8);
  uint64_t v109 = (uint64_t)&v92 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  uint64_t v110 = (uint64_t)&v92 - v30;
  v108 = a1;
  uint64_t v95 = *a1;
  uint64_t v94 = a1[1];
  swift_retain();
  sub_23EF04DF8();
  *(void *)&long long v113 = sub_23EE96078(0, 0x435F4E4F54545542);
  *((void *)&v113 + 1) = v31;
  sub_23EDB8A58(&qword_268C24088, &qword_268C24050);
  sub_23ED9D714();
  sub_23EF04A98();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v13, v11);
  LOBYTE(v13) = sub_23EF04788();
  sub_23EF03C68();
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  sub_23EDB8CB8((uint64_t)v16, (uint64_t)v20, &qword_268C24820);
  uint64_t v40 = &v20[*(int *)(v18 + 44)];
  *uint64_t v40 = (char)v13;
  *((void *)v40 + 1) = v33;
  *((void *)v40 + 2) = v35;
  *((void *)v40 + 3) = v37;
  *((void *)v40 + 4) = v39;
  v40[40] = 0;
  sub_23EDB8D1C((uint64_t)v16, &qword_268C24820);
  sub_23EDB8CB8((uint64_t)v20, (uint64_t)v24, &qword_268C262C0);
  *(void *)&v24[*(int *)(v22 + 44)] = 0x4000000000000000;
  sub_23EDB8D1C((uint64_t)v20, &qword_268C262C0);
  uint64_t v41 = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))swift_allocObject();
  char v42 = v108;
  long long v43 = *((_OWORD *)v108 + 3);
  *((_OWORD *)v41 + 3) = *((_OWORD *)v108 + 2);
  *((_OWORD *)v41 + 4) = v43;
  long long v44 = v42[5];
  *((_OWORD *)v41 + 5) = v42[4];
  *((_OWORD *)v41 + 6) = v44;
  long long v45 = v42[1];
  *((_OWORD *)v41 + 1) = *v42;
  *((_OWORD *)v41 + 2) = v45;
  sub_23EE5C334((uint64_t)v42);
  uint64_t v46 = sub_23EF04FD8();
  uint64_t v48 = v47;
  sub_23EDB8CB8((uint64_t)v24, (uint64_t)v26, &qword_268C262C8);
  v49 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))&v26[*(int *)(v93 + 36)];
  char *v49 = sub_23EEFA45C;
  v49[1] = v41;
  v49[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v46;
  v49[3] = v48;
  sub_23EDB8D1C((uint64_t)v24, &qword_268C262C8);
  sub_23EEFA464();
  uint64_t v50 = v109;
  sub_23EF04B28();
  sub_23EDB8D1C((uint64_t)v26, &qword_268C262D0);
  sub_23EDB95C8(v50, v110, &qword_268C262D8);
  *(void *)&long long v113 = v95;
  *((void *)&v113 + 1) = v94;
  swift_bridgeObjectRetain();
  uint64_t v51 = sub_23EF04988();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  LOBYTE(v22) = v56 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v58 = sub_23EF04868();
  uint64_t v59 = swift_getKeyPath();
  *(void *)&long long v113 = v51;
  *((void *)&v113 + 1) = v53;
  LOBYTE(v114) = v22;
  *((void *)&v114 + 1) = v55;
  *(void *)&long long v115 = KeyPath;
  *((void *)&v115 + 1) = 1;
  LOBYTE(v116) = 0;
  *((void *)&v116 + 1) = v59;
  *(void *)&long long v117 = v58;
  sub_23EF04838();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C262F8);
  sub_23EEFA630();
  sub_23EF049E8();
  sub_23EDBD444(v51, v53, v22);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v60 = v102;
  uint64_t v61 = v100;
  uint64_t v62 = v104;
  (*(void (**)(char *, void, uint64_t))(v102 + 104))(v100, *MEMORY[0x263F1A7A0], v104);
  uint64_t v63 = swift_getKeyPath();
  uint64_t v64 = v96;
  v65 = (uint64_t *)&v96[*(int *)(v97 + 44)];
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26308);
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))((char *)v65 + *(int *)(v66 + 28), v61, v62);
  uint64_t *v65 = v63;
  uint64_t v67 = v105;
  uint64_t v68 = v64;
  uint64_t v69 = (uint64_t)v64;
  uint64_t v70 = v111;
  uint64_t v71 = v106;
  (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v68, v111, v106);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v61, v62);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v71);
  uint64_t v72 = v98;
  sub_23EDB8CB8(v69, v98, &qword_268C262A8);
  *(void *)(v72 + *(int *)(v103 + 36)) = 0x4000000000000000;
  sub_23EDB8D1C(v69, &qword_268C262A8);
  sub_23EEFA6F8();
  uint64_t v73 = (uint64_t)v99;
  sub_23EF04B28();
  sub_23EDB8D1C(v72, &qword_268C262B0);
  uint64_t v74 = v101;
  sub_23EDB95C8(v73, v101, &qword_268C262B8);
  uint64_t v75 = sub_23EF042B8();
  long long v113 = *(_OWORD *)(v108 + 9);
  *(void *)&long long v114 = v108[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C22F10);
  sub_23EF04DC8();
  double v76 = v112;
  uint64_t v77 = sub_23EF04FD8();
  sub_23EE53660(0.0, 1, 0.0, 1, v76, 0, 0.0, 1, (uint64_t)&v113, 0.0, 1, 5.0, 0, v77, v78, v75, 0, 1);
  uint64_t v79 = v110;
  uint64_t v80 = v109;
  sub_23EDB8CB8(v110, v109, &qword_268C262D8);
  sub_23EDB8CB8(v74, v73, &qword_268C262B8);
  uint64_t v81 = v107;
  sub_23EDB8CB8(v80, v107, &qword_268C262D8);
  long long v82 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C26328);
  uint64_t v83 = v81 + v82[12];
  *(void *)uint64_t v83 = 0;
  *(unsigned char *)(v83 + 8) = 0;
  sub_23EDB8CB8(v73, v81 + v82[16], &qword_268C262B8);
  uint64_t v84 = v81 + v82[20];
  *(void *)uint64_t v84 = 0;
  *(unsigned char *)(v84 + 8) = 0;
  uint64_t v85 = v81 + v82[24];
  long long v86 = v120;
  *(_OWORD *)(v85 + 96) = v119;
  *(_OWORD *)(v85 + 112) = v86;
  uint64_t v87 = v121;
  long long v88 = v116;
  *(_OWORD *)(v85 + 32) = v115;
  *(_OWORD *)(v85 + 48) = v88;
  long long v89 = v118;
  *(_OWORD *)(v85 + 64) = v117;
  *(_OWORD *)(v85 + 80) = v89;
  long long v90 = v114;
  *(_OWORD *)uint64_t v85 = v113;
  *(_OWORD *)(v85 + 16) = v90;
  *(void *)(v85 + 128) = v87;
  *(void *)(v85 + 136) = 0x3FF0000000000000;
  sub_23EDB8D1C(v74, &qword_268C262B8);
  sub_23EDB8D1C(v79, &qword_268C262D8);
  sub_23EDB8D1C(v73, &qword_268C262B8);
  return sub_23EDB8D1C(v80, &qword_268C262D8);
}

uint64_t sub_23EEF8C4C@<X0>(uint64_t a1@<X8>)
{
  sub_23EE96078(1, 0x435F4E4F54545542);
  sub_23ED9D714();
  uint64_t v2 = sub_23EF04988();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_23EF04878();
  uint64_t v7 = sub_23EF04958();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_23EDBD444(v2, v4, v6);
  swift_bridgeObjectRelease();
  if (qword_268C20390 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_23EF04938();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  sub_23EDBD444(v7, v9, v11 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v16 & 1;
  *(void *)(a1 + 24) = v18;
  return result;
}

uint64_t sub_23EEF8DBC@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_23EF03ED8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C22630);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_23EF056E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  sub_23EF056C8();
  sub_23EE5C334((uint64_t)a2);
  uint64_t v14 = sub_23EF056B8();
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 128) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v17;
  long long v18 = a2[3];
  *(_OWORD *)(v16 + 64) = a2[2];
  *(_OWORD *)(v16 + 80) = v18;
  long long v19 = a2[5];
  *(_OWORD *)(v16 + 96) = a2[4];
  *(_OWORD *)(v16 + 112) = v19;
  long long v20 = a2[1];
  *(_OWORD *)(v16 + 32) = *a2;
  *(_OWORD *)(v16 + 48) = v20;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v16 + v15, v9, v6);
  sub_23EDC4C6C((uint64_t)v12, (uint64_t)&unk_268C26338, v16);
  swift_release();
  uint64_t result = sub_23EF04C98();
  *a3 = result;
  return result;
}

uint64_t sub_23EEF8FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[7] = a4;
  v5[8] = a5;
  sub_23EF056C8();
  v5[9] = sub_23EF056B8();
  uint64_t v7 = sub_23EF05688();
  return MEMORY[0x270FA2498](sub_23EEF906C, v7, v6);
}

uint64_t sub_23EEF906C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_release();
  sub_23EF03EB8();
  uint64_t v3 = v2;
  sub_23EF03EB8();
  uint64_t v4 = *(void *)(v1 + 88);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 72);
  *(void *)(v0 + 32) = v4;
  *(void *)(v0 + 40) = v3;
  *(void *)(v0 + 48) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C22F10);
  sub_23EF04DD8();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_23EEF9120@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v85 = sub_23EF04EF8();
  uint64_t v83 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  uint64_t v81 = (char *)v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C223A0);
  MEMORY[0x270FA5388](v80);
  uint64_t v5 = (char *)v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C223A8);
  MEMORY[0x270FA5388](v82);
  uint64_t v86 = (uint64_t)v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C223B0);
  uint64_t v7 = MEMORY[0x270FA5388](v84);
  uint64_t v89 = (uint64_t)v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v88 = (uint64_t)v78 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26278);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  uint64_t v13 = (char *)v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v90 = (uint64_t)v78 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26280);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  uint64_t v87 = (uint64_t)v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  long long v20 = (char *)v78 - v19;
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = (char *)v78 - v22;
  MEMORY[0x270FA5388](v21);
  uint64_t v92 = (uint64_t)v78 - v24;
  uint64_t v25 = a1[2];
  uint64_t v26 = a1[3];
  uint64_t v27 = a1[5];
  uint64_t v79 = a1[4];
  *(void *)&long long v121 = v25;
  *((void *)&v121 + 1) = v26;
  unint64_t v28 = sub_23ED9D714();
  swift_bridgeObjectRetain();
  v78[3] = v28;
  uint64_t v29 = sub_23EF04988();
  uint64_t v31 = v30;
  char v33 = v32;
  uint64_t v35 = v34;
  if (v27) {
    uint64_t v36 = sub_23EF04FF8();
  }
  else {
    uint64_t v36 = sub_23EF04FD8();
  }
  char v38 = v33 & 1;
  sub_23EE4FBF0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v121, 0.0, 1, 0.0, 1, v36, v37, v29, v31, v38, v35);
  sub_23EDBD444(v29, v31, v38);
  swift_bridgeObjectRelease();
  v120[6] = v127;
  v120[7] = v128;
  v120[8] = v129;
  v120[2] = v123;
  v120[3] = v124;
  v120[4] = v125;
  v120[5] = v126;
  v120[0] = v121;
  v120[1] = v122;
  long long v117 = v127;
  long long v118 = v128;
  long long v119 = v129;
  long long v113 = v123;
  long long v114 = v124;
  long long v115 = v125;
  long long v116 = v126;
  long long v111 = v121;
  long long v112 = v122;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C21628);
  unint64_t v40 = sub_23EE02620();
  sub_23EF04B28();
  sub_23EE12BD8((uint64_t)v120);
  sub_23EDB95C8((uint64_t)v23, v92, &qword_268C26280);
  if (v27)
  {
    swift_bridgeObjectRetain();
    v78[2] = v40;
    uint64_t v41 = v81;
    sub_23EF04EE8();
    sub_23EF04FD8();
    sub_23EF03DC8();
    v78[1] = v39;
    uint64_t v42 = v83;
    uint64_t v43 = v85;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v5, v41, v85);
    long long v44 = &v5[*(int *)(v80 + 36)];
    long long v45 = v131;
    *(_OWORD *)long long v44 = v130;
    *((_OWORD *)v44 + 1) = v45;
    *((_OWORD *)v44 + 2) = v132;
    (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
    sub_23EF04C78();
    uint64_t v46 = sub_23EF04CB8();
    swift_release();
    LOBYTE(v43) = sub_23EF04748();
    uint64_t v47 = v86;
    sub_23EDB8CB8((uint64_t)v5, v86, &qword_268C223A0);
    uint64_t v48 = v47 + *(int *)(v82 + 36);
    *(void *)uint64_t v48 = v46;
    *(unsigned char *)(v48 + 8) = v43;
    sub_23EDB8D1C((uint64_t)v5, &qword_268C223A0);
    LOBYTE(v43) = sub_23EF04738();
    sub_23EF03C68();
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t v54 = v53;
    uint64_t v56 = v55;
    uint64_t v57 = v89;
    sub_23EDB8CB8(v47, v89, &qword_268C223A8);
    uint64_t v58 = v57 + *(int *)(v84 + 36);
    *(unsigned char *)uint64_t v58 = v43;
    *(void *)(v58 + 8) = v50;
    *(void *)(v58 + 16) = v52;
    *(void *)(v58 + 24) = v54;
    *(void *)(v58 + 32) = v56;
    *(unsigned char *)(v58 + 40) = 0;
    sub_23EDB8D1C(v47, &qword_268C223A8);
    uint64_t v59 = v88;
    sub_23EDB95C8(v57, v88, &qword_268C223B0);
    *(void *)&long long v111 = v79;
    *((void *)&v111 + 1) = v27;
    uint64_t v60 = sub_23EF04988();
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    char v66 = v65 & 1;
    uint64_t v67 = sub_23EF04FE8();
    sub_23EE4FBF0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v102, 0.0, 1, 0.0, 1, v67, v68, v60, v62, v66, v64);
    sub_23EDBD444(v60, v62, v66);
    swift_bridgeObjectRelease();
    long long v117 = v108;
    long long v118 = v109;
    long long v119 = v110;
    long long v113 = v104;
    long long v114 = v105;
    long long v115 = v106;
    long long v116 = v107;
    long long v111 = v102;
    long long v112 = v103;
    long long v99 = v108;
    long long v100 = v109;
    long long v101 = v110;
    long long v95 = v104;
    long long v96 = v105;
    long long v97 = v106;
    long long v98 = v107;
    long long v93 = v102;
    long long v94 = v103;
    sub_23EF04B28();
    sub_23EE12BD8((uint64_t)&v111);
    sub_23EDB8CB8(v59, v57, &qword_268C223B0);
    uint64_t v69 = v87;
    sub_23EDB8CB8((uint64_t)v20, v87, &qword_268C26280);
    sub_23EDB8CB8(v57, (uint64_t)v13, &qword_268C223B0);
    uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26298);
    sub_23EDB8CB8(v69, (uint64_t)&v13[*(int *)(v70 + 48)], &qword_268C26280);
    sub_23EDB8D1C((uint64_t)v20, &qword_268C26280);
    sub_23EDB8D1C(v59, &qword_268C223B0);
    sub_23EDB8D1C(v69, &qword_268C26280);
    sub_23EDB8D1C(v57, &qword_268C223B0);
    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26288);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v71 - 8) + 56))(v13, 0, 1, v71);
    uint64_t v72 = v90;
    sub_23EDB95C8((uint64_t)v13, v90, &qword_268C26278);
  }
  else
  {
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26288);
    uint64_t v72 = v90;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v90, 1, 1, v73);
  }
  uint64_t v74 = v92;
  sub_23EDB8CB8(v92, (uint64_t)v20, &qword_268C26280);
  sub_23EDB8CB8(v72, (uint64_t)v13, &qword_268C26278);
  uint64_t v75 = v91;
  sub_23EDB8CB8((uint64_t)v20, v91, &qword_268C26280);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26290);
  sub_23EDB8CB8((uint64_t)v13, v75 + *(int *)(v76 + 48), &qword_268C26278);
  sub_23EDB8D1C(v72, &qword_268C26278);
  sub_23EDB8D1C(v74, &qword_268C26280);
  sub_23EDB8D1C((uint64_t)v13, &qword_268C26278);
  return sub_23EDB8D1C((uint64_t)v20, &qword_268C26280);
}

uint64_t sub_23EEF9A94@<X0>(uint64_t *a1@<X8>)
{
  long long v3 = v1[3];
  v9[2] = v1[2];
  v9[3] = v3;
  long long v4 = v1[5];
  v9[4] = v1[4];
  v9[5] = v4;
  long long v5 = v1[1];
  v9[0] = *v1;
  v9[1] = v5;
  *a1 = sub_23EF04F98();
  a1[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C261E0);
  return sub_23EEF78E0((uint64_t)v9, (uint64_t)a1 + *(int *)(v7 + 44));
}

uint64_t type metadata accessor for PINTopBarModelFactory()
{
  return self;
}

uint64_t destroy for PINTopBarModel()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for PINTopBarModel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PINTopBarModel(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[7];
  a1[6] = a2[6];
  a1[7] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PINTopBarModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v6;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PINTopBarModel()
{
  return &type metadata for PINTopBarModel;
}

uint64_t sub_23EEF9D10(uint64_t a1)
{
  uint64_t v2 = sub_23EF04928();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23EF04148();
}

uint64_t sub_23EEF9DD8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v9 = a1[6];
  uint64_t v8 = a1[7];
  uint64_t v10 = a1[9];
  unint64_t v11 = a1[10];
  uint64_t v12 = (void (**)(char *, uint64_t))a1[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v13 = (void *)sub_23EE02E6C(v10, v11, v12);
  swift_bridgeObjectRelease();
  id v14 = objc_msgSend(v13, sel_stringFromNumber_, a1[8]);

  if (v14)
  {
    uint64_t v15 = sub_23EF05418();
    unint64_t v17 = v16;
  }
  else
  {
    uint64_t v15 = 0;
    unint64_t v17 = 0xE000000000000000;
  }
  if (a1[11] == 682 && (a1[9] == 5390675 && a1[10] == 0xE300000000000000 || (sub_23EF05CB8() & 1) != 0))
  {
    uint64_t v18 = (void (**)(char *, uint64_t))sub_23EF039D8();
    uint64_t v19 = (void *)sub_23EE02E6C(844251475, 0xE400000000000000, v18);
    id v20 = objc_msgSend(v19, sel_stringFromNumber_, a1[8]);

    if (v20)
    {
      uint64_t v21 = sub_23EF05418();
      unint64_t v23 = v22;
    }
    else
    {
      uint64_t v21 = 0;
      unint64_t v23 = 0xE000000000000000;
    }
  }
  else
  {
    uint64_t v21 = 0;
    unint64_t v23 = 0;
  }
  *a4 = v9;
  a4[1] = v8;
  a4[2] = v15;
  a4[3] = v17;
  a4[4] = v21;
  a4[5] = v23;
  a4[6] = a2;
  a4[7] = a3;
  return swift_retain();
}

uint64_t destroy for PINTopBar()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PINTopBar(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for PINTopBar(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a2[7];
  a1[6] = a2[6];
  a1[7] = v4;
  swift_retain();
  swift_release();
  a1[8] = a2[8];
  a1[9] = a2[9];
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PINTopBar(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = v6;
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PINTopBar(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PINTopBar(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 96) = 1;
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
    *(unsigned char *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PINTopBar()
{
  return &type metadata for PINTopBar;
}

uint64_t sub_23EEFA278()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EEFA298()
{
  return (*(uint64_t (**)(void))(v0 + 64))();
}

unint64_t sub_23EEFA2C0()
{
  unint64_t result = qword_268C26210;
  if (!qword_268C26210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26208);
    sub_23EE6F604();
    sub_23EDB8A58(&qword_268C26218, &qword_268C26220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26210);
  }
  return result;
}

unint64_t sub_23EEFA360()
{
  unint64_t result = qword_268C26268;
  if (!qword_268C26268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26238);
    sub_23EDB8A58(&qword_268C26260, &qword_268C26230);
    sub_23EE065E4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26268);
  }
  return result;
}

uint64_t objectdestroyTm_29()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23EEFA45C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23EEF8DBC(a1, (_OWORD *)(v2 + 16), a2);
}

unint64_t sub_23EEFA464()
{
  unint64_t result = qword_268C262E0;
  if (!qword_268C262E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262D0);
    sub_23EEFA504();
    sub_23EDB8A58(&qword_268C25AC8, &qword_268C25AD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C262E0);
  }
  return result;
}

unint64_t sub_23EEFA504()
{
  unint64_t result = qword_268C262E8;
  if (!qword_268C262E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262C8);
    sub_23EEFA5A4();
    sub_23EDB8A58(&qword_268C21598, &qword_268C215A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C262E8);
  }
  return result;
}

unint64_t sub_23EEFA5A4()
{
  unint64_t result = qword_268C262F0;
  if (!qword_268C262F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262C0);
    sub_23EE85368();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C262F0);
  }
  return result;
}

unint64_t sub_23EEFA630()
{
  unint64_t result = qword_268C26300;
  if (!qword_268C26300)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262F8);
    sub_23EDF8D88();
    sub_23EDB8A58(&qword_268C20D88, &qword_268C20D90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26300);
  }
  return result;
}

uint64_t sub_23EEFA6D0()
{
  return sub_23EF04138();
}

unint64_t sub_23EEFA6F8()
{
  unint64_t result = qword_268C26310;
  if (!qword_268C26310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262B0);
    sub_23EEFA798();
    sub_23EDB8A58(&qword_268C21598, &qword_268C215A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26310);
  }
  return result;
}

unint64_t sub_23EEFA798()
{
  unint64_t result = qword_268C26318;
  if (!qword_268C26318)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262A8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C262F8);
    sub_23EEFA630();
    swift_getOpaqueTypeConformance2();
    sub_23EDB8A58(&qword_268C26320, &qword_268C26308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26318);
  }
  return result;
}

uint64_t sub_23EEFA86C()
{
  uint64_t v1 = sub_23EF03ED8();
  uint64_t v2 = *(void *)(v1 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 128) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_23EEFA960(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_23EF03ED8() - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + 32;
  uint64_t v8 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 128) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_23EDB9720;
  return sub_23EEF8FD4(a1, v5, v6, v7, v8);
}

uint64_t sub_23EEFAA5C()
{
  return sub_23EDB8A58(&qword_268C26340, &qword_268C26348);
}

uint64_t sub_23EEFAA9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_23EEFAAD4(uint64_t TupleTypeMetadata, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (uint64_t *)TupleTypeMetadata;
  uint64_t v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    uint64_t v6 = *v5;
  }
  else
  {
    MEMORY[0x270FA5388](TupleTypeMetadata);
    uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (a2)
    {
      unint64_t v9 = 0;
      if (a2 < 4) {
        goto LABEL_9;
      }
      if ((unint64_t)(v8 - (char *)v5) < 0x20) {
        goto LABEL_9;
      }
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v10 = (long long *)(v5 + 2);
      uint64_t v11 = v8 + 16;
      unint64_t v12 = a2 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        long long v13 = *v10;
        *(v11 - 1) = *(v10 - 1);
        *uint64_t v11 = v13;
        v10 += 2;
        v11 += 2;
        v12 -= 4;
      }
      while (v12);
      if (v9 != a2)
      {
LABEL_9:
        unint64_t v14 = a2 - v9;
        uint64_t v15 = v9;
        unint64_t v16 = &v8[8 * v9];
        unint64_t v17 = &v5[v15];
        do
        {
          uint64_t v18 = *v17++;
          *(void *)unint64_t v16 = v18;
          v16 += 8;
          --v14;
        }
        while (v14);
      }
    }
    TupleTypeMetadatCGFloat a = swift_getTupleTypeMetadata();
    uint64_t v6 = TupleTypeMetadata;
  }
  MEMORY[0x270FA5388](TupleTypeMetadata);
  id v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    uint64_t v21 = (int *)(v6 + 32);
    unint64_t v22 = a2;
    do
    {
      if (a2 == 1) {
        int v23 = 0;
      }
      else {
        int v23 = *v21;
      }
      uint64_t v25 = *v5++;
      uint64_t v24 = v25;
      uint64_t v26 = *v4++;
      (*(void (**)(char *, uint64_t))(*(void *)(v24 - 8) + 16))(&v20[v23], v26);
      v21 += 4;
      --v22;
    }
    while (v22);
  }
  return sub_23EF050D8();
}

uint64_t sub_23EEFAC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23EF04448();
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_23EF04458();
}

uint64_t sub_23EEFAD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_23EF04448();
  MEMORY[0x270FA5388](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_23EF04458();
}

double sub_23EEFAE88()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C26498);
  sub_23EF04DC8();
  return v1;
}

__n128 sub_23EEFAEDC@<Q0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C26498);
  sub_23EF04DE8();
  __n128 result = v5;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(__n128 *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = v6;
  return result;
}

uint64_t sub_23EEFAF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v66 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_23EF04028();
  swift_getTupleTypeMetadata2();
  uint64_t v57 = sub_23EF050C8();
  v55[1] = swift_getWitnessTable();
  uint64_t v3 = sub_23EF04E18();
  uint64_t v59 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v58 = (char *)v55 - v4;
  uint64_t v73 = v5;
  uint64_t v6 = sub_23EF04028();
  uint64_t v61 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v56 = (char *)v55 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26470);
  uint64_t v68 = v6;
  uint64_t v8 = sub_23EF04028();
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v63 = (char *)v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v60 = (char *)v55 - v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v62 = (char *)v55 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26478);
  sub_23EF04028();
  sub_23EF04028();
  sub_23EF04028();
  swift_getTupleTypeMetadata3();
  sub_23EF050C8();
  swift_getWitnessTable();
  uint64_t v14 = sub_23EF04E18();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  char v65 = (char *)v55 - v19;
  uint64_t v67 = v8;
  uint64_t v20 = sub_23EF04468();
  uint64_t v69 = *(void *)(v20 - 8);
  uint64_t v70 = v20;
  MEMORY[0x270FA5388](v20);
  unint64_t v22 = (char *)v55 - v21;
  LOBYTE(v8) = sub_23EE0487C();
  uint64_t v23 = *(void *)(v66 + 24);
  uint64_t v74 = v2;
  uint64_t v75 = v23;
  uint64_t v76 = WitnessTable;
  sub_23EF042B8();
  if (v8)
  {
    sub_23EF04E08();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    uint64_t v25 = v65;
    v24(v65, v18, v14);
    uint64_t v26 = *(void (**)(char *, uint64_t))(v15 + 8);
    v26(v18, v14);
    v24(v18, v25, v14);
    uint64_t v79 = swift_getWitnessTable();
    uint64_t v80 = MEMORY[0x263F19100];
    uint64_t v27 = swift_getWitnessTable();
    uint64_t v28 = sub_23EDB8A58(&qword_268C26488, &qword_268C26470);
    uint64_t v77 = v27;
    uint64_t v78 = v28;
    swift_getWitnessTable();
    sub_23EEFAC98((uint64_t)v18, v14);
    v26(v18, v14);
    v26(v65, v14);
  }
  else
  {
    char v65 = v22;
    uint64_t v66 = v14;
    uint64_t v29 = v68;
    uint64_t v30 = v58;
    sub_23EF04E08();
    sub_23EF04FD8();
    uint64_t v31 = v73;
    uint64_t v32 = swift_getWitnessTable();
    char v33 = v56;
    sub_23EF04B88();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v30, v31);
    uint64_t v34 = v33;
    if (qword_268C20330 != -1) {
      swift_once();
    }
    double v35 = 20.0;
    if (byte_268C267C8) {
      double v35 = 30.0;
    }
    double v36 = v35 * *(double *)&qword_268C255E8;
    char v37 = *(unsigned char *)(WitnessTable + 40);
    sub_23EEFAEDC((uint64_t)v98);
    uint64_t v91 = 0x4054000000000000;
    double v92 = v36;
    char v93 = v37;
    uint64_t v94 = v98[0];
    uint64_t v95 = v98[1];
    long long v96 = v99;
    long long v97 = v100;
    sub_23EF04FD8();
    uint64_t v89 = v32;
    uint64_t v90 = MEMORY[0x263F19100];
    uint64_t v38 = swift_getWitnessTable();
    sub_23EEFD1F0();
    uint64_t v39 = v60;
    sub_23EF049D8();
    v101[0] = v98[0];
    sub_23EEFD244((uint64_t)v101);
    swift_release();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v34, v29);
    uint64_t v40 = sub_23EDB8A58(&qword_268C26488, &qword_268C26470);
    uint64_t v87 = v38;
    uint64_t v88 = v40;
    uint64_t v41 = v67;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v42 = v64;
    uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v64 + 16);
    long long v44 = v62;
    v43(v62, v39, v41);
    long long v45 = *(void (**)(char *, uint64_t))(v42 + 8);
    v45(v39, v41);
    uint64_t v46 = (uint64_t)v63;
    v43(v63, v44, v41);
    uint64_t v47 = v66;
    swift_getWitnessTable();
    unint64_t v22 = v65;
    sub_23EEFAD90(v46, v47, v41);
    v45((char *)v46, v41);
    v45(v44, v41);
  }
  uint64_t v48 = swift_getWitnessTable();
  uint64_t v85 = swift_getWitnessTable();
  uint64_t v86 = MEMORY[0x263F19100];
  uint64_t v49 = swift_getWitnessTable();
  uint64_t v50 = sub_23EDB8A58(&qword_268C26488, &qword_268C26470);
  uint64_t v83 = v49;
  uint64_t v84 = v50;
  uint64_t v51 = swift_getWitnessTable();
  uint64_t v81 = v48;
  uint64_t v82 = v51;
  uint64_t v52 = v70;
  swift_getWitnessTable();
  uint64_t v53 = v69;
  (*(void (**)(uint64_t, char *, uint64_t))(v69 + 16))(v71, v22, v52);
  return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v22, v52);
}

uint64_t sub_23EEFB96C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v38 = a4;
  uint64_t v32 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23EF04028();
  uint64_t v35 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = sub_23EF04028();
  uint64_t v37 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v30 - v13;
  uint64_t v15 = sub_23EF04028();
  uint64_t v36 = *(void *)(v15 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v16);
  uint64_t v31 = (char *)&v30 - v20;
  int v33 = *(unsigned __int8 *)(a1 + 40);
  int v34 = v33 ^ 1;
  (*(void (**)(uint64_t))(a1 + 48))(v19);
  sub_23EF05108();
  sub_23EF04A08();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, a2);
  sub_23EF04758();
  v49[7] = a3;
  v49[8] = MEMORY[0x263F18880];
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_23EF04BC8();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v9);
  sub_23EF04738();
  uint64_t v22 = MEMORY[0x263F18C10];
  v49[5] = WitnessTable;
  v49[6] = MEMORY[0x263F18C10];
  uint64_t v23 = swift_getWitnessTable();
  sub_23EF04BC8();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v12);
  v49[3] = v23;
  v49[4] = v22;
  uint64_t v24 = swift_getWitnessTable();
  uint64_t v25 = v36;
  uint64_t v26 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  uint64_t v27 = v31;
  v26(v31, v18, v15);
  uint64_t v28 = *(void (**)(char *, uint64_t))(v25 + 8);
  v28(v18, v15);
  uint64_t v46 = 0;
  LOBYTE(v14) = v33;
  char v47 = v33;
  LOBYTE(WitnessTable) = v34;
  char v48 = v34;
  v49[0] = &v46;
  v26(v18, v27, v15);
  uint64_t v43 = 0;
  char v44 = WitnessTable;
  char v45 = (char)v14;
  v49[1] = v18;
  v49[2] = &v43;
  v42[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26478);
  v42[1] = v15;
  v42[2] = v42[0];
  unint64_t v39 = sub_23EEFD27C();
  uint64_t v40 = v24;
  unint64_t v41 = v39;
  sub_23EEFAAD4((uint64_t)v49, 3uLL, (uint64_t)v42);
  v28(v27, v15);
  return ((uint64_t (*)(char *, uint64_t))v28)(v18, v15);
}

uint64_t sub_23EEFBE48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v23[1] = a4;
  uint64_t v7 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_23EF04028();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  uint64_t v17 = (char *)v23 - v16;
  (*(void (**)(uint64_t))(a1 + 48))(v15);
  v28.origin.x = sub_23EEFAE88();
  CGRectGetMidX(v28);
  v29.origin.x = sub_23EEFAE88();
  CGRectGetMidY(v29);
  sub_23EF04C08();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a2);
  unint64_t v18 = sub_23EE92ABC();
  v27[2] = a3;
  v27[3] = v18;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v20(v17, v14, v10);
  uint64_t v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v14, v10);
  v20(v14, v17, v10);
  uint64_t v25 = 0;
  char v26 = 1;
  v27[0] = v14;
  v27[1] = &v25;
  v24[0] = v10;
  v24[1] = MEMORY[0x263F1B6B0];
  v23[2] = WitnessTable;
  v23[3] = MEMORY[0x263F1B698];
  sub_23EEFAAD4((uint64_t)v27, 2uLL, (uint64_t)v24);
  v21(v17, v10);
  return ((uint64_t (*)(char *, uint64_t))v21)(v14, v10);
}

uint64_t sub_23EEFC0F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23EEFAF3C(a1, a2);
}

uint64_t sub_23EEFC130(void *a1)
{
  uint64_t v3 = sub_23EF05128();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_23EF05148();
  uint64_t v7 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23EDB6A74();
  uint64_t v10 = (void *)sub_23EF05868();
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v11 + 64) = v12;
  uint64_t v13 = *(void *)(v1 + 64);
  long long v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v11 + 32) = v14;
  *(void *)(v11 + 80) = v13;
  *(void *)(v11 + 88) = a1;
  aBlock[4] = sub_23EEFD974;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23ED9E120;
  aBlock[3] = &block_descriptor_40;
  uint64_t v15 = _Block_copy(aBlock);
  sub_23EEFD998(v1);
  id v16 = a1;
  swift_release();
  sub_23EF05138();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_23EDE0138();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C228A0);
  sub_23EDB8A58((unint64_t *)&qword_268C23060, (uint64_t *)&unk_268C228A0);
  sub_23EF05A68();
  MEMORY[0x2455BEAB0](0, v9, v6, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v19);
}

uint64_t sub_23EEFC3F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  sub_23EEFD998(a1);
  __swift_instantiateConcreteTypeFromMangledName(qword_268C264B8);
  sub_23EF04E98();
  sub_23EEFD244((uint64_t)&v2);
  return swift_release();
}

id sub_23EEFC474()
{
  double v1 = *(double *)v0;
  double v2 = *(double *)(v0 + 8);
  char v3 = *(unsigned char *)(v0 + 16);
  id v4 = objc_allocWithZone((Class)type metadata accessor for StatusBarSafeAreaView());
  return sub_23EEFC5F0(v3, v1, v2);
}

uint64_t sub_23EEFC4BC(void *a1)
{
  return sub_23EEFC130(a1);
}

uint64_t sub_23EEFC500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23EEFD8D8();
  return MEMORY[0x270F02710](a1, a2, a3, v6);
}

uint64_t sub_23EEFC564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_23EEFD8D8();
  return MEMORY[0x270F026D8](a1, a2, a3, v6);
}

void sub_23EEFC5C8()
{
}

id sub_23EEFC5F0(char a1, double a2, double a3)
{
  id v4 = &v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_safeRect];
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  uint64_t v5 = &v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  unint64_t v6 = &v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_cornerRadii];
  *(_OWORD *)unint64_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  uint64_t v7 = (double *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_idealSize];
  double *v7 = a2;
  v7[1] = a3;
  if (a1) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  *(void *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_corner] = v8;
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for StatusBarSafeAreaView();
  return objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, 0, 0);
}

void sub_23EEFC7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  objc_super v10 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v12 = (char *)&v51 - v11;
  uint64_t v13 = OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize;
  long long v14 = &v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize];
  if (v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize + 16])
  {
    uint64_t v13 = OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_idealSize;
    uint64_t v15 = (double *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_idealSize];
  }
  else
  {
    uint64_t v15 = (double *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_maxAllowedSize];
  }
  double v16 = v15[1];
  double v17 = *(double *)&v3[v13];
  id v18 = objc_msgSend(v3, sel_view);
  if (!v18)
  {
    __break(1u);
    return;
  }
  uint64_t v19 = v18;
  objc_msgSend(v18, sel__rectTuckedInBoundingPathCorner_withSize_cornerRadii_minimumPadding_, *(void *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_corner], v17, v16, 0.0, 0.0, 0.0, 0.0, 0.0);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v59.origin.x = v21;
  v59.origin.y = v23;
  v59.size.width = v25;
  v59.size.height = v27;
  if (CGRectIsEmpty(v59))
  {
    if (a1 >= 11)
    {
      if (qword_268C202B0 != -1) {
        swift_once();
      }
      uint64_t v28 = __swift_project_value_buffer(v7, (uint64_t)qword_268C26648);
      sub_23EDBA140(v28, (uint64_t)v12);
      uint64_t v29 = sub_23EF03AA8();
      uint64_t v30 = *(void *)(v29 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v12, 1, v29) == 1)
      {
        sub_23EDBA1A8((uint64_t)v12);
      }
      else
      {
        char v44 = sub_23EF03A88();
        os_log_type_t v45 = sub_23EF057D8();
        if (os_log_type_enabled(v44, v45))
        {
          uint64_t v46 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v46 = 0;
          _os_log_impl(&dword_23ED94000, v44, v45, "getSuitableSafeRect - failure - 10 iterations reached", v46, 2u);
          MEMORY[0x2455BF9E0](v46, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v29);
      }
      return;
    }
    uint64_t v39 = *(void *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_idealSize + 8];
    *(double *)long long v14 = v17 * 0.92;
    *((void *)v14 + 1) = v39;
    v14[16] = 0;
    uint64_t v40 = a1 + 1;
    long long v56 = 0u;
    long long v57 = 0u;
    char v58 = 1;
    unint64_t v41 = &v56;
    goto LABEL_20;
  }
  double v53 = v17;
  sub_23EEFCDFC(a2, (uint64_t)v54);
  if ((v55 & 1) == 0)
  {
    CGFloat v31 = *(double *)v54;
    CGFloat v32 = *(double *)&v54[1];
    CGFloat v34 = *(double *)&v54[2];
    CGFloat v33 = *(double *)&v54[3];
    v60.origin.x = v21;
    v60.origin.y = v23;
    v60.size.width = v25;
    v60.size.height = v27;
    double MinY = CGRectGetMinY(v60);
    v61.origin.x = v31;
    v61.origin.y = v32;
    v61.size.width = v34;
    v61.size.height = v33;
    if (vabdd_f64(MinY, CGRectGetMinY(v61)) <= 0.00001)
    {
      if (a3 > 2) {
        return;
      }
      uint64_t v47 = *(void *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_idealSize + 8];
      *(double *)long long v14 = v53 * 0.92;
      *((void *)v14 + 1) = v47;
      v14[16] = 0;
      uint64_t v43 = a3 + 1;
      uint64_t v40 = 0;
      unint64_t v41 = (long long *)a2;
LABEL_21:
      sub_23EEFC7BC(v40, v41, v43);
      return;
    }
  }
  v62.origin.x = v21;
  v62.origin.y = v23;
  v62.size.width = v25;
  v62.size.height = v27;
  double Width = CGRectGetWidth(v62);
  v63.origin.x = v21;
  v63.origin.y = v23;
  v63.size.width = v25;
  v63.size.height = v27;
  if (Width >= CGRectGetHeight(v63))
  {
    uint64_t v42 = *(void *)&v3[OBJC_IVAR____TtC19ContactlessReaderUI21StatusBarSafeAreaView_idealSize + 8];
    *(double *)long long v14 = v53 * 0.92;
    *((void *)v14 + 1) = v42;
    v14[16] = 0;
    *(CGFloat *)&long long v56 = v21;
    *((CGFloat *)&v56 + 1) = v23;
    *(CGFloat *)&long long v57 = v25;
    *((CGFloat *)&v57 + 1) = v27;
    char v58 = 0;
    unint64_t v41 = &v56;
    uint64_t v40 = 0;
LABEL_20:
    uint64_t v43 = 0;
    goto LABEL_21;
  }
  if (qword_268C202B0 != -1) {
    swift_once();
  }
  uint64_t v36 = __swift_project_value_buffer(v7, (uint64_t)qword_268C26648);
  sub_23EDBA140(v36, (uint64_t)v10);
  uint64_t v37 = sub_23EF03AA8();
  uint64_t v38 = *(void *)(v37 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v10, 1, v37) == 1)
  {
    sub_23EDBA1A8((uint64_t)v10);
  }
  else
  {
    char v48 = sub_23EF03A88();
    os_log_type_t v49 = sub_23EF057D8();
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_23ED94000, v48, v49, "getSuitableSafeRect - failure - width < height", v50, 2u);
      MEMORY[0x2455BF9E0](v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v38 + 8))(v10, v37);
  }
}

id sub_23EEFCD8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StatusBarSafeAreaView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for StatusBarSafeAreaView()
{
  return self;
}

uint64_t sub_23EEFCDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_268C263E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EEFD01C()
{
  swift_release();
  return swift_release();
}

uint64_t sub_23EEFD058(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_23EEFD0A8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23EEFD130(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t type metadata accessor for SafeNotchView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23EEFD1A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EEFD1E4@<X0>(uint64_t a1@<X8>)
{
  return sub_23EEFBE48(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_23EEFD1F0()
{
  unint64_t result = qword_268C26480;
  if (!qword_268C26480)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26480);
  }
  return result;
}

uint64_t sub_23EEFD244(uint64_t a1)
{
  return a1;
}

uint64_t sub_23EEFD270@<X0>(uint64_t a1@<X8>)
{
  return sub_23EEFB96C(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_23EEFD27C()
{
  unint64_t result = qword_268C26490;
  if (!qword_268C26490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C26478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C26490);
  }
  return result;
}

uint64_t destroy for StatusBarSafeArea()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for StatusBarSafeArea(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarSafeArea(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

uint64_t assignWithTake for StatusBarSafeArea(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarSafeArea(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarSafeArea(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarSafeArea()
{
  return &type metadata for StatusBarSafeArea;
}

unsigned char *storeEnumTagSinglePayload for NotchSide(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23EEFD5E8);
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

ValueMetadata *type metadata accessor for NotchSide()
{
  return &type metadata for NotchSide;
}

uint64_t sub_23EEFD620()
{
  return swift_getWitnessTable();
}

unint64_t sub_23EEFD880()
{
  unint64_t result = qword_268C264A8;
  if (!qword_268C264A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C264A8);
  }
  return result;
}

unint64_t sub_23EEFD8D8()
{
  unint64_t result = qword_268C264B0;
  if (!qword_268C264B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C264B0);
  }
  return result;
}

uint64_t sub_23EEFD92C()
{
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23EEFD974()
{
  return sub_23EEFC3F0(v0 + 16);
}

uint64_t block_copy_helper_39(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_39()
{
  return swift_release();
}

uint64_t sub_23EEFD998(uint64_t a1)
{
  return a1;
}

uint64_t sub_23EEFD9D0()
{
  uint64_t result = sub_23EF05028();
  qword_268C26978 = result;
  return result;
}

uint64_t sub_23EEFDA08()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_23EEFDAA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(_DWORD *)(v6 + 80);
  uint64_t v9 = v7 + v8;
  uint64_t v10 = v7 + 7;
  unint64_t v11 = ((v7 + 7 + ((v7 + v8) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    uint64_t v14 = *a2;
    *unsigned int v4 = *a2;
    unsigned int v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
  }
  else
  {
    uint64_t v15 = ~v8;
    double v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, v5);
    unint64_t v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    id v18 = (void *)((v10 + v17) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v19 = v18[1];
    double v20 = (void *)((v10 + (((unint64_t)v4 + v9) & v15)) & 0xFFFFFFFFFFFFFFF8);
    void *v20 = *v18;
    v20[1] = v19;
  }
  swift_retain();
  return v4;
}

uint64_t sub_23EEFDBF0(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void (**)(unint64_t, uint64_t))(v4 + 8);
  v5(a1, v3);
  v5((*(void *)(v4 + 64) + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), v3);
  return swift_release();
}

uint64_t sub_23EEFDC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  long long v12 = (uint64_t *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  uint64_t v15 = (void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v15 = v14;
  v15[1] = v13;
  swift_retain();
  return a1;
}

uint64_t sub_23EEFDD5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  long long v12 = (void *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = (void *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *long long v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23EEFDE2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_OWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_23EEFDEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  uint64_t v8 = *(void *)(v6 + 64);
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v10 = (v8 + v9 + a1) & ~v9;
  uint64_t v11 = (v8 + v9 + a2) & ~v9;
  v7(v10, v11, v5);
  *(_OWORD *)((v8 + 7 + v10) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)((v8 + 7 + v11) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_23EEFDFB4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v8 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = v6 + 7;
  if (v7 < a2)
  {
    unint64_t v11 = ((v10 + (v9 & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v12 = a2 - v7;
    uint64_t v13 = v11 & 0xFFFFFFF8;
    if ((v11 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = v12 + 1;
    }
    if (v14 >= 0x10000) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 < 0x100) {
      unsigned int v15 = 1;
    }
    if (v14 >= 2) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
    switch(v16)
    {
      case 1:
        int v17 = *((unsigned __int8 *)a1 + v11);
        if (!v17) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v17 = *(unsigned __int16 *)((char *)a1 + v11);
        if (v17) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x23EEFE118);
      case 4:
        int v17 = *(_DWORD *)((char *)a1 + v11);
        if (!v17) {
          break;
        }
LABEL_22:
        int v19 = v17 - 1;
        if (v13)
        {
          int v19 = 0;
          LODWORD(v13) = *a1;
        }
        return v7 + (v13 | v19) + 1;
      default:
        break;
    }
  }
  if (v5 >= 0x7FFFFFFF) {
    return (*(uint64_t (**)(void))(v4 + 48))();
  }
  unint64_t v20 = *(void *)((v10 + (((unint64_t)a1 + v9) & ~v8)) & 0xFFFFFFFFFFFFFFF8);
  if (v20 >= 0xFFFFFFFF) {
    LODWORD(v20) = -1;
  }
  return (v20 + 1);
}

void sub_23EEFE12C(unsigned char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = v9 + v10;
  uint64_t v12 = (v9 + v10) & ~v10;
  uint64_t v13 = v9 + 7;
  size_t v14 = ((v13 + v12) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v8 >= a3)
  {
    int v18 = 0;
    int v19 = a2 - v8;
    if (a2 <= v8)
    {
LABEL_17:
      switch(v18)
      {
        case 1:
          a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)&a1[v14] = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)&a1[v14] = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              CGFloat v23 = (void *)((v13 + ((unint64_t)&a1[v11] & ~v10)) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                uint64_t v24 = a2 ^ 0x80000000;
                v23[1] = 0;
              }
              else
              {
                uint64_t v24 = a2 - 1;
              }
              *CGFloat v23 = v24;
            }
            else
            {
              double v22 = *(void (**)(void))(v6 + 56);
              v22();
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    unsigned int v15 = a3 - v8;
    if (((v13 + v12) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v16 = v15 + 1;
    }
    else {
      unsigned int v16 = 2;
    }
    if (v16 >= 0x10000) {
      int v17 = 4;
    }
    else {
      int v17 = 2;
    }
    if (v16 < 0x100) {
      int v17 = 1;
    }
    if (v16 >= 2) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    int v19 = a2 - v8;
    if (a2 <= v8) {
      goto LABEL_17;
    }
  }
  if (v14) {
    int v20 = 1;
  }
  else {
    int v20 = v19;
  }
  if (v14)
  {
    int v21 = ~v8 + a2;
    bzero(a1, v14);
    *(_DWORD *)a1 = v21;
  }
  switch(v18)
  {
    case 1:
      a1[v14] = v20;
      break;
    case 2:
      *(_WORD *)&a1[v14] = v20;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x23EEFE330);
    case 4:
      *(_DWORD *)&a1[v14] = v20;
      break;
    default:
      return;
  }
}

uint64_t type metadata accessor for AnimationCompletionModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_23EEFE370(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t sub_23EEFE378(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = a1 - 8;
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](a1);
  unsigned int v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C22630);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)(v4 + 24);
  uint64_t v12 = *(void *)(v4 + 32);
  uint64_t result = sub_23EF053B8();
  if (result)
  {
    uint64_t v14 = sub_23EF056E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v10, 1, 1, v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
    sub_23EF056C8();
    uint64_t v15 = sub_23EF056B8();
    unint64_t v16 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    int v17 = (char *)swift_allocObject();
    uint64_t v18 = MEMORY[0x263F8F500];
    *((void *)v17 + 2) = v15;
    *((void *)v17 + 3) = v18;
    *((void *)v17 + 4) = v11;
    *((void *)v17 + 5) = v12;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v17[v16], v7, a1);
    sub_23EDC4C6C((uint64_t)v10, (uint64_t)&unk_268C26548, (uint64_t)v17);
    return swift_release();
  }
  return result;
}

uint64_t sub_23EEFE584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t *(*sub_23EEFE5B8(void *a1, uint64_t a2))(uint64_t *result, char a2)
{
  *a1 = a2;
  a1[1] = v2;
  return sub_23EEFE5DC;
}

uint64_t *sub_23EEFE5DC(uint64_t *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (uint64_t *)sub_23EEFE378(*result);
  }
  return result;
}

uint64_t sub_23EEFE608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  sub_23EF056C8();
  v6[5] = sub_23EF056B8();
  uint64_t v8 = sub_23EF05688();
  return MEMORY[0x270FA2498](sub_23EEFE6A4, v8, v7);
}

uint64_t sub_23EEFE6A4()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v2 = (void (**)(void))(v1 + *(int *)(type metadata accessor for AnimationCompletionModifier() + 40));
  (*v2)();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_23EEFE734@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_getWitnessTable();
  uint64_t v4 = sub_23EF04508();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a2, a1, v4);
}

uint64_t sub_23EEFE7D0(uint64_t a1, uint64_t a2)
{
  sub_23EEFEC7C(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8);
  return v4(a1);
}

void (*sub_23EEFE83C(void *a1, uint64_t a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_23EEFE5B8(v4, a2);
  return sub_23EDEE290;
}

uint64_t sub_23EEFE89C()
{
  return swift_getWitnessTable();
}

uint64_t sub_23EEFE8B8()
{
  return swift_getWitnessTable();
}

uint64_t sub_23EEFE8D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EEFE918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F01128](a1, a2, a3, a4, a5, WitnessTable);
}

uint64_t sub_23EEFE9AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270F01120](a1, a2, a3, a4, a5, WitnessTable);
}

uint64_t sub_23EEFEA40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23EEFE734(a1, a2);
}

uint64_t sub_23EEFEA58()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = (int *)(type metadata accessor for AnimationCompletionModifier() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v2 + 80);
  swift_unknownObjectRelease();
  uint64_t v4 = v0 + v3;
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8);
  v5(v4, v1);
  v5(v4 + v2[11], v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23EEFEB74(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = v1[5];
  uint64_t v6 = *(void *)(type metadata accessor for AnimationCompletionModifier() - 8);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = (uint64_t)v1 + ((*(unsigned __int8 *)(v6 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_23EDB9720;
  return sub_23EEFE608(a1, v7, v8, v9, v4, v5);
}

uint64_t sub_23EEFEC7C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 24))(v2, a1);
  return sub_23EEFE378(a2);
}

uint64_t sub_23EEFECE4()
{
  type metadata accessor for AnimationCompletionModifier();
  swift_getWitnessTable();
  sub_23EF04508();
  return swift_getWitnessTable();
}

uint64_t sub_23EEFED64(uint64_t a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v6 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    uint64_t v6 = a1;
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)(a1 + v7);
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_23EF045D8();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    swift_retain();
    swift_retain();
    if (v12(v9, 1, v10))
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C80);
      memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    uint64_t v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
    v8[v14[9]] = v9[v14[9]];
    *(void *)&v8[v14[10]] = *(void *)&v9[v14[10]];
    v8[v14[11]] = v9[v14[11]];
    uint64_t v15 = a3[6];
    uint64_t v16 = v6 + v15;
    uint64_t v17 = (uint64_t)a2 + v15;
    swift_retain();
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
    uint64_t v19 = a3[7];
    long long v20 = *(_OWORD *)((char *)a2 + v19 + 24);
    *(_OWORD *)(v6 + v19 + 24) = v20;
    (**(void (***)(void))(v20 - 8))();
  }
  return v6;
}

uint64_t sub_23EEFEFE0(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[5];
  uint64_t v5 = sub_23EF045D8();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
  swift_release();
  uint64_t v7 = a1 + a2[6];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = a1 + a2[7];
  return __swift_destroy_boxed_opaque_existential_1Tm(v9);
}

uint64_t sub_23EEFF114(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_23EF045D8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_retain();
  swift_retain();
  if (v11(v8, 1, v9))
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C80);
    memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v13 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
  v7[v13[9]] = v8[v13[9]];
  *(void *)&v7[v13[10]] = *(void *)&v8[v13[10]];
  v7[v13[11]] = v8[v13[11]];
  uint64_t v14 = a3[6];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  swift_retain();
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = a3[7];
  long long v19 = *(_OWORD *)(a2 + v18 + 24);
  *(_OWORD *)(a1 + v18 + 24) = v19;
  (**(void (***)(void))(v19 - 8))();
  return a1;
}

uint64_t sub_23EEFF33C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_23EF045D8();
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
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C80);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
  v7[v15[9]] = v8[v15[9]];
  *(void *)&v7[v15[10]] = *(void *)&v8[v15[10]];
  swift_retain();
  swift_release();
  v7[v15[11]] = v8[v15[11]];
  uint64_t v16 = a3[6];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24))(v17, v18, v19);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  return a1;
}

uint64_t sub_23EEFF594(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_23EF045D8();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C80);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  int v12 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
  v7[v12[9]] = v8[v12[9]];
  *(void *)&v7[v12[10]] = *(void *)&v8[v12[10]];
  v7[v12[11]] = v8[v12[11]];
  uint64_t v13 = a3[6];
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  long long v20 = *(_OWORD *)(v19 + 16);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *(_OWORD *)(v18 + 16) = v20;
  *(void *)(v18 + 32) = *(void *)(v19 + 32);
  return a1;
}

uint64_t sub_23EEFF758(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)(a1 + v6);
  uint64_t v8 = (char *)(a2 + v6);
  uint64_t v9 = sub_23EF045D8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C80);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
  v7[v15[9]] = v8[v15[9]];
  *(void *)&v7[v15[10]] = *(void *)&v8[v15[10]];
  swift_release();
  v7[v15[11]] = v8[v15[11]];
  uint64_t v16 = a3[6];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[7];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = a2 + v20;
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + v20);
  long long v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v21 + 32) = *(void *)(v22 + 32);
  return a1;
}

uint64_t sub_23EEFF9AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23EEFF9C0);
}

uint64_t sub_23EEFF9C0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t sub_23EEFFAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23EEFFB08);
}

uint64_t sub_23EEFFB08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v5 + *(int *)(a4 + 20);
      int v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = v5 + *(int *)(a4 + 24);
      return v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for RegisteringDescription()
{
  uint64_t result = qword_268C26550;
  if (!qword_268C26550) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_23EEFFC88()
{
  sub_23EDBB858();
  if (v0 <= 0x3F)
  {
    sub_23EDBB988();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_23EEFFD64()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23EEFFD80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v155 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C24908);
  uint64_t v151 = *(void *)(v2 - 8);
  uint64_t v152 = v2;
  MEMORY[0x270FA5388](v2);
  v148 = (char *)&v147 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C24910);
  MEMORY[0x270FA5388](v150);
  v149 = (char *)&v147 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C24918);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v154 = (char *)&v147 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v153 = (uint64_t)&v147 - v8;
  uint64_t v9 = type metadata accessor for RegisteringDescription();
  uint64_t v174 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v175 = v10;
  uint64_t v176 = (uint64_t)&v147 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23EF04638();
  uint64_t v171 = *(void *)(v11 - 8);
  uint64_t v172 = v11;
  MEMORY[0x270FA5388](v11);
  v170 = (char *)&v147 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v195 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20CD8);
  MEMORY[0x270FA5388](v195);
  v196 = (char *)&v147 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_23EF04298();
  uint64_t v191 = *(void *)(v14 - 8);
  v192 = (char *)v14;
  uint64_t v15 = MEMORY[0x270FA5388](v14);
  v190 = (char *)&v147 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v147 - v17;
  uint64_t v19 = sub_23EF045F8();
  uint64_t v187 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v147 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C216D8);
  uint64_t v185 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v147 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C216E0);
  uint64_t v188 = *(void *)(v25 - 8);
  v189 = (void (*)(void, void, void))v25;
  MEMORY[0x270FA5388](v25);
  v183 = (char *)&v147 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26560) - 8;
  MEMORY[0x270FA5388](v186);
  v184 = (char *)&v147 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26568);
  MEMORY[0x270FA5388](v28);
  uint64_t v30 = (char *)&v147 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26570);
  uint64_t v157 = *(void *)(v159 - 8);
  MEMORY[0x270FA5388](v159);
  v156 = (char *)&v147 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26578);
  uint64_t v162 = *(void *)(v164 - 8);
  MEMORY[0x270FA5388](v164);
  v160 = (char *)&v147 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26580);
  uint64_t v165 = *(void *)(v167 - 8);
  MEMORY[0x270FA5388](v167);
  v163 = (char *)&v147 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26588);
  MEMORY[0x270FA5388](v158);
  v166 = (char *)&v147 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v161 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26590);
  MEMORY[0x270FA5388](v161);
  uint64_t v169 = (uint64_t)&v147 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C26598);
  uint64_t v36 = MEMORY[0x270FA5388](v168);
  uint64_t v194 = (uint64_t)&v147 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v193 = (uint64_t)&v147 - v38;
  uint64_t v173 = v9;
  uint64_t v177 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  sub_23EF03D78();
  LOBYTE(v197) = 1;
  sub_23EF04EB8();
  uint64_t v181 = *((void *)&v215 + 1);
  uint64_t v182 = v215;
  int v180 = v216;
  uint64_t v179 = v28;
  uint64_t v39 = &v30[*(int *)(v28 + 64)];
  *(void *)&long long v206 = 0;
  sub_23EF04DB8();
  uint64_t v40 = *((void *)&v197 + 1);
  *(void *)uint64_t v39 = v197;
  *((void *)v39 + 1) = v40;
  sub_23EF01194();
  v178 = &v30[*(int *)(v28 + 52)];
  sub_23EF03D58();
  sub_23EF045E8();
  sub_23EDB8A58(&qword_268C217D0, &qword_268C216D8);
  sub_23EF01C20(&qword_268C217D8, MEMORY[0x263F1A1D8]);
  unint64_t v41 = v183;
  sub_23EF049B8();
  (*(void (**)(char *, uint64_t))(v187 + 8))(v21, v19);
  (*(void (**)(char *, uint64_t))(v185 + 8))(v24, v22);
  sub_23EF04288();
  uint64_t v42 = v191;
  uint64_t v43 = v192;
  (*(void (**)(char *, char *, char *))(v191 + 16))(v190, v18, v192);
  sub_23EF01C20((unint64_t *)&qword_268C20D30, MEMORY[0x263F196B8]);
  char v44 = v43;
  uint64_t v45 = sub_23EF03E78();
  uint64_t v47 = v188;
  uint64_t v46 = v189;
  uint64_t v48 = (uint64_t)v184;
  (*(void (**)(char *, char *, void))(v188 + 16))(v184, v41, v189);
  *(void *)(v48 + *(int *)(v186 + 44)) = v45;
  (*(void (**)(char *, char *))(v42 + 8))(v18, v44);
  (*(void (**)(char *, void (*)(void, void, void)))(v47 + 8))(v41, v46);
  sub_23EF04FD8();
  sub_23EF03DC8();
  uint64_t v49 = (uint64_t)v178;
  sub_23EDB8CB8(v48, (uint64_t)v178, &qword_268C26560);
  uint64_t v50 = (_OWORD *)(v49 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268C265A0) + 36));
  uint64_t v51 = (uint64_t)v196;
  long long v52 = *(_OWORD *)((char *)&v223[3] + 8);
  *uint64_t v50 = *(_OWORD *)((char *)&v223[2] + 8);
  v50[1] = v52;
  v50[2] = *(_OWORD *)((char *)&v223[4] + 8);
  sub_23EDB8D1C(v48, &qword_268C26560);
  uint64_t v53 = v179;
  *(void *)&v30[*(int *)(v179 + 56)] = 0x4014000000000000;
  *(void *)&v30[*(int *)(v53 + 60)] = 0x3FE0000000000000;
  uint64_t v54 = v53;
  uint64_t v55 = *(int *)(v53 + 68);
  v192 = v30;
  long long v56 = &v30[v55];
  uint64_t v57 = v181;
  *(void *)long long v56 = v182;
  *((void *)v56 + 1) = v57;
  v56[16] = v180;
  uint64_t v58 = *MEMORY[0x263F18CB8];
  uint64_t v59 = sub_23EF03FB8();
  uint64_t v60 = *(void *)(v59 - 8);
  CGRect v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 104);
  uint64_t v62 = v60 + 104;
  v61(v51, v58, v59);
  uint64_t v63 = sub_23EF01C20(&qword_268C20D08, MEMORY[0x263F18D80]);
  if (sub_23EF053B8())
  {
    uint64_t v187 = v63;
    uint64_t v188 = v62;
    v189 = v61;
    LODWORD(v190) = v58;
    uint64_t v191 = v59;
    uint64_t v64 = sub_23EDB8A58(&qword_268C265A8, &qword_268C26568);
    uint64_t v65 = sub_23EDB8A58(&qword_268C20D18, &qword_268C20CD8);
    uint64_t v66 = v156;
    uint64_t v67 = v195;
    uint64_t v68 = (uint64_t)v192;
    sub_23EF04A58();
    sub_23EDB8D1C(v51, &qword_268C20CD8);
    sub_23EDB8D1C(v68, &qword_268C26568);
    uint64_t v69 = v170;
    sub_23EF04618();
    *(void *)&long long v215 = v54;
    *((void *)&v215 + 1) = v67;
    *(void *)&long long v216 = v64;
    v192 = (char *)v65;
    *((void *)&v216 + 1) = v65;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v72 = v159;
    uint64_t v71 = v160;
    sub_23EF04AE8();
    (*(void (**)(char *, uint64_t))(v171 + 8))(v69, v172);
    (*(void (**)(char *, uint64_t))(v157 + 8))(v66, v72);
    uint64_t v73 = v177;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
    sub_23EF04558();
    LOBYTE(v206) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C20CB0);
    *(void *)&long long v197 = v72;
    *((void *)&v197 + 1) = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_23EDBB8C0();
    uint64_t v75 = v163;
    uint64_t v74 = v164;
    sub_23EF04AF8();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v162 + 8))(v71, v74);
    LOBYTE(v68) = sub_23EF04758();
    sub_23EF03C68();
    uint64_t v77 = v76;
    uint64_t v79 = v78;
    uint64_t v81 = v80;
    uint64_t v83 = v82;
    uint64_t v85 = v165;
    uint64_t v84 = (uint64_t)v166;
    uint64_t v86 = v167;
    (*(void (**)(char *, char *, uint64_t))(v165 + 16))(v166, v75, v167);
    uint64_t v87 = v84 + *(int *)(v158 + 36);
    *(unsigned char *)uint64_t v87 = v68;
    *(void *)(v87 + 8) = v77;
    *(void *)(v87 + 16) = v79;
    *(void *)(v87 + 24) = v81;
    *(void *)(v87 + 32) = v83;
    *(unsigned char *)(v87 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v85 + 8))(v75, v86);
    LOBYTE(v68) = sub_23EF04768();
    sub_23EF03C68();
    uint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v93 = v92;
    uint64_t v95 = v94;
    uint64_t v96 = v169;
    sub_23EDB8CB8(v84, v169, &qword_268C26588);
    uint64_t v97 = v96 + *(int *)(v161 + 36);
    *(unsigned char *)uint64_t v97 = v68;
    *(void *)(v97 + 8) = v89;
    *(void *)(v97 + 16) = v91;
    *(void *)(v97 + 24) = v93;
    *(void *)(v97 + 32) = v95;
    *(unsigned char *)(v97 + 40) = 0;
    sub_23EDB8D1C(v84, &qword_268C26588);
    uint64_t v98 = v176;
    sub_23EF018D8(v73, v176);
    unint64_t v99 = (*(unsigned __int8 *)(v174 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v174 + 80);
    uint64_t v100 = swift_allocObject();
    sub_23EF01940(v98, v100 + v99);
    uint64_t v101 = v194;
    sub_23EDB8CB8(v96, v194, &qword_268C26590);
    long long v102 = (uint64_t (**)())(v101 + *(int *)(v168 + 36));
    *long long v102 = sub_23EF019A4;
    v102[1] = (uint64_t (*)())v100;
    v102[2] = 0;
    v102[3] = 0;
    sub_23EDB8D1C(v96, &qword_268C26590);
    sub_23EDB95C8(v101, v193, &qword_268C26598);
    sub_23EF042E8();
    if (qword_268C203E0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  id v103 = (id)qword_268C268D8;
  uint64_t v104 = sub_23EF04978();
  uint64_t v106 = v105;
  char v108 = v107 & 1;
  sub_23EF047D8();
  uint64_t v109 = sub_23EF04958();
  uint64_t v111 = v110;
  char v113 = v112;
  swift_release();
  sub_23EDBD444(v104, v106, v108);
  swift_bridgeObjectRelease();
  if (qword_268C20398 != -1) {
    swift_once();
  }
  char v114 = v113 & 1;
  uint64_t v115 = sub_23EF04938();
  uint64_t v117 = v116;
  uint64_t v119 = v118;
  char v121 = v120 & 1;
  sub_23EDBD444(v109, v111, v114);
  swift_bridgeObjectRelease();
  uint64_t v122 = sub_23EF04FD8();
  sub_23EE4FBF0(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v215, 0.0, 1, 0.0, 1, v122, v123, v115, v117, v121, v119);
  sub_23EDBD444(v115, v117, v121);
  swift_bridgeObjectRelease();
  long long v212 = v221;
  long long v213 = v222;
  long long v214 = v223[0];
  long long v208 = v217;
  long long v209 = v218;
  long long v210 = v219;
  long long v211 = v220;
  long long v206 = v215;
  long long v207 = v216;
  uint64_t KeyPath = swift_getKeyPath();
  long long v203 = v212;
  long long v204 = v213;
  v205[0] = v214;
  long long v199 = v208;
  long long v200 = v209;
  long long v201 = v210;
  long long v202 = v211;
  long long v197 = v206;
  long long v198 = v207;
  *(void *)&v205[1] = KeyPath;
  BYTE8(v205[1]) = 1;
  uint64_t v125 = (uint64_t)v196;
  v189(v196, v190, v191);
  uint64_t result = sub_23EF053B8();
  uint64_t v127 = v194;
  uint64_t v128 = v193;
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268C21BC0);
    sub_23EDDFDC0();
    long long v129 = v148;
    sub_23EF04A58();
    sub_23EDB8D1C(v125, &qword_268C20CD8);
    long long v221 = v203;
    long long v222 = v204;
    v223[0] = v205[0];
    *(_OWORD *)((char *)v223 + 9) = *(_OWORD *)((char *)v205 + 9);
    long long v217 = v199;
    long long v218 = v200;
    long long v219 = v201;
    long long v220 = v202;
    long long v215 = v197;
    long long v216 = v198;
    sub_23EDDFEE4((uint64_t)&v215);
    char v130 = sub_23EF04768();
    sub_23EF03C68();
    uint64_t v132 = v131;
    uint64_t v134 = v133;
    uint64_t v136 = v135;
    uint64_t v138 = v137;
    uint64_t v140 = v151;
    uint64_t v139 = v152;
    uint64_t v141 = (uint64_t)v149;
    (*(void (**)(char *, char *, uint64_t))(v151 + 16))(v149, v129, v152);
    uint64_t v142 = v141 + *(int *)(v150 + 36);
    *(unsigned char *)uint64_t v142 = v130;
    *(void *)(v142 + 8) = v132;
    *(void *)(v142 + 16) = v134;
    *(void *)(v142 + 24) = v136;
    *(void *)(v142 + 32) = v138;
    *(unsigned char *)(v142 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v140 + 8))(v129, v139);
    sub_23EE85A30();
    uint64_t v143 = (uint64_t)v154;
    sub_23EF04B28();
    sub_23EDB8D1C(v141, &qword_268C24910);
    uint64_t v144 = v153;
    sub_23EDB95C8(v143, v153, &qword_268C24918);
    sub_23EDB8CB8(v128, v127, &qword_268C26598);
    sub_23EDB8CB8(v144, v143, &qword_268C24918);
    uint64_t v145 = v155;
    sub_23EDB8CB8(v127, v155, &qword_268C26598);
    uint64_t v146 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C265B0);
    sub_23EDB8CB8(v143, v145 + *(int *)(v146 + 48), &qword_268C24918);
    sub_23EDB8D1C(v144, &qword_268C24918);
    sub_23EDB8D1C(v128, &qword_268C26598);
    sub_23EDB8D1C(v143, &qword_268C24918);
    return sub_23EDB8D1C(v127, &qword_268C26598);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23EF01194()
{
  sub_23EF042E8();
  if (qword_268C203E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_268C268D8;
  uint64_t v1 = sub_23EF04978();
  uint64_t v3 = v2;
  char v5 = v4 & 1;
  sub_23EF04838();
  uint64_t v6 = sub_23EF04918();
  uint64_t v8 = v7;
  char v10 = v9 & 1;
  sub_23EDBD444(v1, v3, v5);
  swift_bridgeObjectRelease();
  sub_23EF047B8();
  uint64_t v11 = sub_23EF04958();
  uint64_t v13 = v12;
  char v15 = v14;
  swift_release();
  sub_23EDBD444(v6, v8, v10);
  swift_bridgeObjectRelease();
  if (qword_268C20398 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_23EF04938();
  uint64_t v18 = v17;
  char v20 = v19 & 1;
  sub_23EDBD444(v11, v13, v15 & 1);
  swift_bridgeObjectRelease();
  sub_23EF04B28();
  sub_23EDBD444(v16, v18, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EF013F0(uint64_t a1)
{
  uint64_t v23 = a1;
  uint64_t v26 = sub_23EF05128();
  uint64_t v29 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_23EF05148();
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  MEMORY[0x270FA5388](v3);
  char v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RegisteringDescription();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = sub_23EF05178();
  uint64_t v25 = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v15 = (char *)&v22 - v14;
  sub_23EDB6A74();
  uint64_t v22 = sub_23EF05868();
  sub_23EF05168();
  MEMORY[0x2455BE400](v13, 0.3);
  uint64_t v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v13, v9);
  sub_23EF018D8(v23, (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v16 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = swift_allocObject();
  sub_23EF01940((uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  aBlock[4] = sub_23EF01B7C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23ED9E120;
  aBlock[3] = &block_descriptor_41;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release();
  sub_23EF05138();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_23EF01C20((unint64_t *)&qword_268C23050, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C228A0);
  sub_23EDB8A58((unint64_t *)&qword_268C23060, (uint64_t *)&unk_268C228A0);
  uint64_t v19 = v26;
  sub_23EF05A68();
  char v20 = (void *)v22;
  MEMORY[0x2455BEA70](v15, v5, v2, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v2, v19);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v28);
  return ((uint64_t (*)(char *, uint64_t))v24)(v15, v25);
}

uint64_t sub_23EF0183C()
{
  return sub_23EF04E98();
}

uint64_t sub_23EF018D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RegisteringDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EF01940(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RegisteringDescription();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23EF019A4()
{
  return sub_23EF01B94(sub_23EF013F0);
}

uint64_t objectdestroyTm_30()
{
  uint64_t v1 = (int *)type metadata accessor for RegisteringDescription();
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*((void *)v1 - 1) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v1 - 1) + 80));
  swift_release();
  swift_release();
  uint64_t v3 = v2 + v1[5];
  uint64_t v4 = sub_23EF045D8();
  uint64_t v5 = *(void *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4)) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C88);
  swift_release();
  uint64_t v6 = v2 + v1[6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268C20C90);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  __swift_destroy_boxed_opaque_existential_1Tm(v2 + v1[7]);
  return swift_deallocObject();
}

uint64_t sub_23EF01B7C()
{
  return sub_23EF01B94((uint64_t (*)(uint64_t))sub_23EF0183C);
}

uint64_t sub_23EF01B94(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for RegisteringDescription() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t block_copy_helper_40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 4UIAccessibilityPostNotification(*MEMORY[0x263F83200], 0) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_40()
{
  return swift_release();
}

uint64_t sub_23EF01C20(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23EF01C68()
{
  return sub_23EDB8A58(&qword_268C265B8, &qword_268C265C0);
}

uint64_t sub_23EF01CA4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v3 = 0x6E41656369766564;
    }
    else {
      uint64_t v3 = 0x656369766564;
    }
    if (v2 == 1) {
      unint64_t v4 = 0xED00006472614364;
    }
    else {
      unint64_t v4 = 0xE600000000000000;
    }
    int v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1) {
        uint64_t v6 = 0x6E41656369766564;
      }
      else {
        uint64_t v6 = 0x656369766564;
      }
      if (v5 == 1) {
        unint64_t v7 = 0xED00006472614364;
      }
      else {
        unint64_t v7 = 0xE600000000000000;
      }
      if (v3 != v6) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v4 = 0xE400000000000000;
    uint64_t v3 = 1702060386;
    int v5 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }
  unint64_t v7 = 0xE400000000000000;
  if (v3 != 1702060386)
  {
LABEL_21:
    char v8 = sub_23EF05CB8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7) {
    goto LABEL_21;
  }
  char v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23EF01DC0(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEA0000000000736BLL;
  uint64_t v3 = 0x6E697264646F6F66;
  uint64_t v4 = a1;
  uint64_t v5 = 0x6E697264646F6F66;
  unint64_t v6 = 0xEA0000000000736BLL;
  switch(v4)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x676E6970706F6873;
      break;
    case 2:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x6C6576617274;
      break;
    case 3:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v5 = 0x7365636976726573;
      break;
    case 4:
      unint64_t v6 = 0xE300000000000000;
      uint64_t v5 = 7239014;
      break;
    case 5:
      unint64_t v6 = 0xE600000000000000;
      uint64_t v5 = 0x68746C616568;
      break;
    case 6:
      uint64_t v5 = 0x726F70736E617274;
      unint64_t v6 = 0xE900000000000074;
      break;
    case 7:
      unint64_t v6 = 0xE700000000000000;
      uint64_t v5 = 0x6E776F6E6B6E75;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      if (v5 == 0x676E6970706F6873) {
        goto LABEL_22;
      }
      goto LABEL_25;
    case 2:
      unint64_t v2 = 0xE600000000000000;
      if (v5 != 0x6C6576617274) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      unint64_t v2 = 0xE800000000000000;
      if (v5 != 0x7365636976726573) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v2 = 0xE300000000000000;
      if (v5 != 7239014) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v2 = 0xE600000000000000;
      if (v5 != 0x68746C616568) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      uint64_t v3 = 0x726F70736E617274;
      unint64_t v2 = 0xE900000000000074;
      goto LABEL_21;
    case 7:
      unint64_t v2 = 0xE700000000000000;
      if (v5 != 0x6E776F6E6B6E75) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v3) {
        goto LABEL_25;
      }
LABEL_22:
      if (v6 == v2) {
        char v7 = 1;
      }
      else {
LABEL_25:
      }
        char v7 = sub_23EF05CB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_23EF0203C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1702060386;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1702060386;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x6C616974696E69;
      break;
    case 2:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x64656B63656863;
      break;
    case 3:
      unint64_t v3 = 0xE700000000000000;
      uint64_t v5 = 0x676E6964616F6CLL;
      break;
    case 4:
      uint64_t v5 = 0x42746E656D796170;
      unint64_t v3 = 0xEB00000000657361;
      break;
    case 5:
      uint64_t v5 = 0x49746E656D796170;
      uint64_t v6 = 0x6C616974696ELL;
      goto LABEL_8;
    case 6:
      uint64_t v5 = 0x43746E656D796170;
      uint64_t v6 = 0x64656B636568;
LABEL_8:
      unint64_t v3 = v6 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xE700000000000000;
      if (v5 == 0x6C616974696E69) {
        goto LABEL_20;
      }
      goto LABEL_23;
    case 2:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x64656B63656863) {
        goto LABEL_23;
      }
      goto LABEL_20;
    case 3:
      unint64_t v7 = 0xE700000000000000;
      if (v5 != 0x676E6964616F6CLL) {
        goto LABEL_23;
      }
      goto LABEL_20;
    case 4:
      unint64_t v7 = 0xEB00000000657361;
      if (v5 != 0x42746E656D796170) {
        goto LABEL_23;
      }
      goto LABEL_20;
    case 5:
      uint64_t v2 = 0x49746E656D796170;
      unint64_t v7 = 0xEE006C616974696ELL;
      goto LABEL_19;
    case 6:
      unint64_t v7 = 0xEE0064656B636568;
      if (v5 != 0x43746E656D796170) {
        goto LABEL_23;
      }
      goto LABEL_20;
    default:
LABEL_19:
      if (v5 != v2) {
        goto LABEL_23;
      }
LABEL_20:
      if (v3 == v7) {
        char v8 = 1;
      }
      else {
LABEL_23:
      }
        char v8 = sub_23EF05CB8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8 & 1;
  }
}

uint64_t sub_23EF022B4()
{
  sub_23EF05508();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23EF023E4()
{
  return sub_23EF05DF8();
}

uint64_t sub_23EF02528()
{
  return sub_23EF05DF8();
}

uint64_t sub_23EF02668(unsigned __int8 *a1, char *a2)
{
  return sub_23EF01DC0(*a1, *a2);
}

uint64_t sub_23EF02674()
{
  return sub_23EF02528();
}

uint64_t sub_23EF02680()
{
  return sub_23EF022B4();
}

uint64_t sub_23EF02688()
{
  return sub_23EF02528();
}

uint64_t sub_23EF02690@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23EF02D58();
  *a1 = result;
  return result;
}

void sub_23EF026C0(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xEA0000000000736BLL;
  uint64_t v3 = 0x6E697264646F6F66;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE800000000000000;
      uint64_t v3 = 0x676E6970706F6873;
      goto LABEL_3;
    case 2:
      *a1 = 0x6C6576617274;
      a1[1] = 0xE600000000000000;
      break;
    case 3:
      *a1 = 0x7365636976726573;
      a1[1] = 0xE800000000000000;
      break;
    case 4:
      *a1 = 7239014;
      a1[1] = 0xE300000000000000;
      break;
    case 5:
      *a1 = 0x68746C616568;
      a1[1] = 0xE600000000000000;
      break;
    case 6:
      *a1 = 0x726F70736E617274;
      a1[1] = 0xE900000000000074;
      break;
    case 7:
      *a1 = 0x6E776F6E6B6E75;
      a1[1] = 0xE700000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

void sub_23EF027D4(void *a1@<X8>)
{
  *a1 = &unk_26F295C98;
}

uint64_t type metadata accessor for MerchantCategoryDefinitions()
{
  return self;
}

unint64_t sub_23EF02808()
{
  unint64_t result = sub_23EDF5BDC((uint64_t)&unk_26F2933B8);
  qword_268C26980 = result;
  return result;
}

uint64_t sub_23EF02830(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268C21A00);
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)(a1 - 5951) > 0xFFFFFFFFFFFFFFF4
    || (unint64_t)(a1 - 5963) <= 0x24 && ((1 << (a1 - 75)) & 0x1FE00000FFLL) != 0)
  {
    return 0x676E6970706F6873;
  }
  if ((unint64_t)(a1 - 4000) > 0xFFFFFFFFFFFFFC17) {
    return 0x6C6576617274;
  }
  if (qword_268C20410 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_268C26980;
  if (*(void *)(qword_268C26980 + 16) && (unint64_t v8 = sub_23EEEB940(a1), (v9 & 1) != 0))
  {
    uint64_t v5 = 0x6E697264646F6F66;
    switch(*(unsigned char *)(*(void *)(v7 + 56) + v8))
    {
      case 1:
        return 0x676E6970706F6873;
      case 2:
        return 0x6C6576617274;
      case 3:
        uint64_t v5 = 0x7365636976726573;
        break;
      case 4:
        uint64_t v5 = 7239014;
        break;
      case 5:
        uint64_t v5 = 0x68746C616568;
        break;
      case 6:
        uint64_t v5 = 0x726F70736E617274;
        break;
      case 7:
        uint64_t v5 = 0x6E776F6E6B6E75;
        break;
      default:
        return v5;
    }
  }
  else
  {
    if (qword_268C202A8 != -1) {
      swift_once();
    }
    uint64_t v5 = 0x6E776F6E6B6E75;
    uint64_t v10 = __swift_project_value_buffer(v2, (uint64_t)qword_268C26630);
    sub_23EDBA140(v10, (uint64_t)v4);
    uint64_t v11 = sub_23EF03AA8();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v4, 1, v11) == 1)
    {
      sub_23EDBA1A8((uint64_t)v4);
    }
    else
    {
      uint64_t v13 = sub_23EF03A88();
      os_log_type_t v14 = sub_23EF057D8();
      if (os_log_type_enabled(v13, v14))
      {
        char v15 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v15 = 0;
        _os_log_impl(&dword_23ED94000, v13, v14, "Category not found - unknown", v15, 2u);
        MEMORY[0x2455BF9E0](v15, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v11);
    }
  }
  return v5;
}

unsigned char *storeEnumTagSinglePayload for MerchantCategory(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23EF02C68);
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

ValueMetadata *type metadata accessor for MerchantCategory()
{
  return &type metadata for MerchantCategory;
}

unint64_t sub_23EF02CA4()
{
  unint64_t result = qword_268C265C8;
  if (!qword_268C265C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268C265D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C265C8);
  }
  return result;
}

unint64_t sub_23EF02D04()
{
  unint64_t result = qword_268C265D8;
  if (!qword_268C265D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C265D8);
  }
  return result;
}

uint64_t sub_23EF02D58()
{
  unint64_t v0 = sub_23EF05C78();
  swift_bridgeObjectRelease();
  if (v0 >= 8) {
    return 8;
  }
  else {
    return v0;
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_23EF02DC8()
{
  return MEMORY[0x270EEDDD0]();
}

uint64_t sub_23EF02DD8()
{
  return MEMORY[0x270EEDE10]();
}

uint64_t sub_23EF02DE8()
{
  return MEMORY[0x270EEDE18]();
}

uint64_t sub_23EF02DF8()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_23EF02E08()
{
  return MEMORY[0x270EEE0D0]();
}

uint64_t sub_23EF02E18()
{
  return MEMORY[0x270EEE158]();
}

uint64_t sub_23EF02E28()
{
  return MEMORY[0x270EEE208]();
}

uint64_t sub_23EF02E38()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23EF02E48()
{
  return MEMORY[0x270EEE378]();
}

uint64_t sub_23EF02E58()
{
  return MEMORY[0x270EEE3B8]();
}

uint64_t sub_23EF02E68()
{
  return MEMORY[0x270EEE3D0]();
}

uint64_t sub_23EF02E78()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_23EF02E88()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_23EF02E98()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_23EF02EA8()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_23EF02EB8()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_23EF02EC8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_23EF02ED8()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_23EF02EE8()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_23EF02EF8()
{
  return MEMORY[0x270EEEA90]();
}

uint64_t sub_23EF02F08()
{
  return MEMORY[0x270EEEAE8]();
}

uint64_t sub_23EF02F18()
{
  return MEMORY[0x270EEEBC8]();
}

uint64_t sub_23EF02F28()
{
  return MEMORY[0x270EEEBD0]();
}

uint64_t sub_23EF02F38()
{
  return MEMORY[0x270EEEBD8]();
}

uint64_t sub_23EF02F48()
{
  return MEMORY[0x270EEEDA8]();
}

uint64_t sub_23EF02F58()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_23EF02F68()
{
  return MEMORY[0x270EEEE88]();
}

uint64_t sub_23EF02F78()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23EF02F88()
{
  return MEMORY[0x270EEF128]();
}

uint64_t sub_23EF02FD8()
{
  return MEMORY[0x270EEF7C8]();
}

uint64_t sub_23EF03008()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_23EF03018()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_23EF03028()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_23EF03038()
{
  return MEMORY[0x270EEF870]();
}

uint64_t sub_23EF03048()
{
  return MEMORY[0x270EEF8C0]();
}

uint64_t sub_23EF03058()
{
  return MEMORY[0x270EEF8D8]();
}

uint64_t sub_23EF03068()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_23EF03078()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_23EF03088()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_23EF03098()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_23EF030A8()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_23EF030B8()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_23EF030C8()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_23EF030D8()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_23EF030E8()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_23EF030F8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23EF03108()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_23EF03118()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_23EF03128()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_23EF03138()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_23EF03148()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_23EF03158()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23EF03168()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23EF03178()
{
  return MEMORY[0x270EF0D78]();
}

uint64_t sub_23EF03188()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_23EF03198()
{
  return MEMORY[0x270EF0D98]();
}

uint64_t sub_23EF031A8()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_23EF031B8()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_23EF031C8()
{
  return MEMORY[0x270EF0E00]();
}

uint64_t sub_23EF031D8()
{
  return MEMORY[0x270EF0ED0]();
}

uint64_t sub_23EF031E8()
{
  return MEMORY[0x270EF0EE0]();
}

uint64_t sub_23EF031F8()
{
  return MEMORY[0x270EF0EF8]();
}

uint64_t sub_23EF03208()
{
  return MEMORY[0x270EF0F48]();
}

uint64_t sub_23EF03218()
{
  return MEMORY[0x270EF0F70]();
}

uint64_t sub_23EF03228()
{
  return MEMORY[0x270EF0F90]();
}

uint64_t sub_23EF03238()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23EF03248()
{
  return MEMORY[0x270EF0FF8]();
}

uint64_t sub_23EF03258()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_23EF03268()
{
  return MEMORY[0x270EF1020]();
}

uint64_t sub_23EF03278()
{
  return MEMORY[0x270EF1028]();
}

uint64_t sub_23EF03288()
{
  return MEMORY[0x270EF1050]();
}

uint64_t sub_23EF03298()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_23EF032A8()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_23EF032B8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23EF032C8()
{
  return MEMORY[0x270F9C880]();
}

uint64_t sub_23EF032D8()
{
  return MEMORY[0x270EFA5A0]();
}

uint64_t sub_23EF032E8()
{
  return MEMORY[0x270EFA5A8]();
}

uint64_t sub_23EF032F8()
{
  return MEMORY[0x270EFA5B8]();
}

uint64_t sub_23EF03308()
{
  return MEMORY[0x270EFA5C0]();
}

uint64_t sub_23EF03318()
{
  return MEMORY[0x270EFA5E8]();
}

uint64_t sub_23EF03328()
{
  return MEMORY[0x270EFA610]();
}

uint64_t sub_23EF03338()
{
  return MEMORY[0x270EFA618]();
}

uint64_t sub_23EF03348()
{
  return MEMORY[0x270EFA628]();
}

uint64_t sub_23EF03358()
{
  return MEMORY[0x270EFA638]();
}

uint64_t sub_23EF03368()
{
  return MEMORY[0x270EFA648]();
}

uint64_t sub_23EF03378()
{
  return MEMORY[0x270EFA660]();
}

uint64_t sub_23EF03388()
{
  return MEMORY[0x270EFA680]();
}

uint64_t sub_23EF03398()
{
  return MEMORY[0x270EFA688]();
}

uint64_t sub_23EF033A8()
{
  return MEMORY[0x270EFA698]();
}

uint64_t sub_23EF033B8()
{
  return MEMORY[0x270EFA6A8]();
}

uint64_t sub_23EF033C8()
{
  return MEMORY[0x270EFA6F0]();
}

uint64_t sub_23EF033D8()
{
  return MEMORY[0x270EFA700]();
}

uint64_t sub_23EF033E8()
{
  return MEMORY[0x270EFA738]();
}

uint64_t sub_23EF033F8()
{
  return MEMORY[0x270EFA740]();
}

uint64_t sub_23EF03408()
{
  return MEMORY[0x270EFA748]();
}

uint64_t sub_23EF03418()
{
  return MEMORY[0x270EFA750]();
}

uint64_t sub_23EF03428()
{
  return MEMORY[0x270EFA780]();
}

uint64_t sub_23EF03438()
{
  return MEMORY[0x270EFA7A8]();
}

uint64_t sub_23EF03448()
{
  return MEMORY[0x270EFA7B0]();
}

uint64_t sub_23EF03458()
{
  return MEMORY[0x270EFA7B8]();
}

uint64_t sub_23EF03468()
{
  return MEMORY[0x270EFA7D0]();
}

uint64_t sub_23EF03478()
{
  return MEMORY[0x270EFA7E0]();
}

uint64_t sub_23EF03488()
{
  return MEMORY[0x270EFA7F0]();
}

uint64_t sub_23EF03498()
{
  return MEMORY[0x270EFA7F8]();
}

uint64_t sub_23EF034A8()
{
  return MEMORY[0x270EFA998]();
}

uint64_t sub_23EF034B8()
{
  return MEMORY[0x270EFA9A0]();
}

uint64_t sub_23EF034C8()
{
  return MEMORY[0x270EFA9B8]();
}

uint64_t sub_23EF034D8()
{
  return MEMORY[0x270EFA9D8]();
}

uint64_t sub_23EF034E8()
{
  return MEMORY[0x270EFA9E0]();
}

uint64_t sub_23EF034F8()
{
  return MEMORY[0x270EFA9E8]();
}

uint64_t sub_23EF03508()
{
  return MEMORY[0x270EFA9F0]();
}

uint64_t sub_23EF03518()
{
  return MEMORY[0x270EFA9F8]();
}

uint64_t sub_23EF03528()
{
  return MEMORY[0x270EFAA08]();
}

uint64_t sub_23EF03568()
{
  return MEMORY[0x270EFAA50]();
}

uint64_t sub_23EF03578()
{
  return MEMORY[0x270EFAA58]();
}

uint64_t sub_23EF03588()
{
  return MEMORY[0x270EFAA60]();
}

uint64_t sub_23EF03598()
{
  return MEMORY[0x270EFAA68]();
}

uint64_t sub_23EF035A8()
{
  return MEMORY[0x270EFAA70]();
}

uint64_t sub_23EF035B8()
{
  return MEMORY[0x270EFAA78]();
}

uint64_t sub_23EF035C8()
{
  return MEMORY[0x270EFAA80]();
}

uint64_t sub_23EF035D8()
{
  return MEMORY[0x270EFAA88]();
}

uint64_t sub_23EF035E8()
{
  return MEMORY[0x270EFAA90]();
}

uint64_t sub_23EF035F8()
{
  return MEMORY[0x270EFAA98]();
}

uint64_t sub_23EF03608()
{
  return MEMORY[0x270EFAAA8]();
}

uint64_t sub_23EF03618()
{
  return MEMORY[0x270EFAAB0]();
}

uint64_t sub_23EF03628()
{
  return MEMORY[0x270EFAAB8]();
}

uint64_t sub_23EF03638()
{
  return MEMORY[0x270EFAAD8]();
}

uint64_t sub_23EF03648()
{
  return MEMORY[0x270EFAAF0]();
}

uint64_t sub_23EF03658()
{
  return MEMORY[0x270EFAB30]();
}

uint64_t sub_23EF03668()
{
  return MEMORY[0x270EFAB38]();
}

uint64_t sub_23EF03678()
{
  return MEMORY[0x270EFAB40]();
}

uint64_t sub_23EF03688()
{
  return MEMORY[0x270EFAB48]();
}

uint64_t sub_23EF03698()
{
  return MEMORY[0x270EFAB50]();
}

uint64_t sub_23EF036A8()
{
  return MEMORY[0x270EFAB60]();
}

uint64_t sub_23EF036B8()
{
  return MEMORY[0x270EFAB68]();
}

uint64_t sub_23EF036C8()
{
  return MEMORY[0x270EFAB70]();
}

uint64_t sub_23EF036D8()
{
  return MEMORY[0x270EFAB88]();
}

uint64_t sub_23EF036E8()
{
  return MEMORY[0x270EFAB98]();
}

uint64_t sub_23EF036F8()
{
  return MEMORY[0x270EFABA8]();
}

uint64_t sub_23EF03708()
{
  return MEMORY[0x270EFABB0]();
}

uint64_t sub_23EF03718()
{
  return MEMORY[0x270EFABC0]();
}

uint64_t sub_23EF03728()
{
  return MEMORY[0x270EFABC8]();
}

uint64_t sub_23EF03738()
{
  return MEMORY[0x270EFABE0]();
}

uint64_t sub_23EF03748()
{
  return MEMORY[0x270EFABE8]();
}

uint64_t sub_23EF03758()
{
  return MEMORY[0x270EFAC00]();
}

uint64_t sub_23EF03768()
{
  return MEMORY[0x270EFAC30]();
}

uint64_t sub_23EF03778()
{
  return MEMORY[0x270EFACB8]();
}

uint64_t sub_23EF03788()
{
  return MEMORY[0x270EFACC0]();
}

uint64_t sub_23EF03798()
{
  return MEMORY[0x270EFACD0]();
}

uint64_t sub_23EF037A8()
{
  return MEMORY[0x270EFACD8]();
}

uint64_t sub_23EF037B8()
{
  return MEMORY[0x270EFACE8]();
}

uint64_t sub_23EF037C8()
{
  return MEMORY[0x270EFAD00]();
}

uint64_t sub_23EF037D8()
{
  return MEMORY[0x270EFAD08]();
}

uint64_t sub_23EF037E8()
{
  return MEMORY[0x270EFAD18]();
}

uint64_t sub_23EF037F8()
{
  return MEMORY[0x270EFAD40]();
}

uint64_t sub_23EF03808()
{
  return MEMORY[0x270EFAD98]();
}

uint64_t sub_23EF03818()
{
  return MEMORY[0x270EFAE30]();
}

uint64_t sub_23EF03828()
{
  return MEMORY[0x270EFAF78]();
}

uint64_t sub_23EF03838()
{
  return MEMORY[0x270EFAF80]();
}

uint64_t sub_23EF03848()
{
  return MEMORY[0x270EFAF88]();
}

uint64_t sub_23EF03858()
{
  return MEMORY[0x270EFAFA0]();
}

uint64_t sub_23EF03868()
{
  return MEMORY[0x270EFAFB0]();
}

uint64_t sub_23EF03878()
{
  return MEMORY[0x270EFAFC8]();
}

uint64_t sub_23EF03888()
{
  return MEMORY[0x270EFAFF8]();
}

uint64_t sub_23EF03898()
{
  return MEMORY[0x270EFB028]();
}

uint64_t sub_23EF038A8()
{
  return MEMORY[0x270EFB030]();
}

uint64_t sub_23EF038B8()
{
  return MEMORY[0x270EFB038]();
}

uint64_t sub_23EF038C8()
{
  return MEMORY[0x270EFB040]();
}

uint64_t sub_23EF038D8()
{
  return MEMORY[0x270EFB048]();
}

uint64_t sub_23EF038E8()
{
  return MEMORY[0x270EFB078]();
}

uint64_t sub_23EF038F8()
{
  return MEMORY[0x270EFB080]();
}

uint64_t sub_23EF03908()
{
  return MEMORY[0x270EFB088]();
}

uint64_t sub_23EF03918()
{
  return MEMORY[0x270EFB158]();
}

uint64_t sub_23EF03928()
{
  return MEMORY[0x270EFB288]();
}

uint64_t sub_23EF03938()
{
  return MEMORY[0x270EFB2A0]();
}

uint64_t sub_23EF03948()
{
  return MEMORY[0x270EFB2B0]();
}

uint64_t sub_23EF03958()
{
  return MEMORY[0x270EFB2B8]();
}

uint64_t sub_23EF03968()
{
  return MEMORY[0x270EFB2E8]();
}

uint64_t sub_23EF03978()
{
  return MEMORY[0x270EFB348]();
}

uint64_t sub_23EF03988()
{
  return MEMORY[0x270EFB350]();
}

uint64_t sub_23EF03998()
{
  return MEMORY[0x270EFB428]();
}

uint64_t sub_23EF039A8()
{
  return MEMORY[0x270EFB458]();
}

uint64_t sub_23EF039B8()
{
  return MEMORY[0x270EFB468]();
}

uint64_t sub_23EF039C8()
{
  return MEMORY[0x270EFB470]();
}

uint64_t sub_23EF039D8()
{
  return MEMORY[0x270EFB488]();
}

uint64_t sub_23EF039E8()
{
  return MEMORY[0x270EFB490]();
}

uint64_t sub_23EF039F8()
{
  return MEMORY[0x270EFB4A8]();
}

uint64_t sub_23EF03A08()
{
  return MEMORY[0x270EFB4D8]();
}

uint64_t sub_23EF03A18()
{
  return MEMORY[0x270EFB6F0]();
}

uint64_t sub_23EF03A28()
{
  return MEMORY[0x270EFB6F8]();
}

uint64_t sub_23EF03A38()
{
  return MEMORY[0x270EFB760]();
}

uint64_t sub_23EF03A48()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_23EF03A58()
{
  return MEMORY[0x270FA2AA0]();
}

uint64_t sub_23EF03A68()
{
  return MEMORY[0x270FA2AD8]();
}

uint64_t sub_23EF03A78()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_23EF03A88()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_23EF03A98()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_23EF03AA8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_23EF03AB8()
{
  return MEMORY[0x270F83888]();
}

uint64_t sub_23EF03AC8()
{
  return MEMORY[0x270F83890]();
}

uint64_t sub_23EF03AD8()
{
  return MEMORY[0x270F838B0]();
}

uint64_t sub_23EF03AE8()
{
  return MEMORY[0x270F838B8]();
}

uint64_t sub_23EF03AF8()
{
  return MEMORY[0x270F838C0]();
}

uint64_t sub_23EF03B08()
{
  return MEMORY[0x270F838C8]();
}

uint64_t sub_23EF03B18()
{
  return MEMORY[0x270F838D8]();
}

uint64_t sub_23EF03B28()
{
  return MEMORY[0x270F83918]();
}

uint64_t sub_23EF03B38()
{
  return MEMORY[0x270F83920]();
}

uint64_t sub_23EF03B48()
{
  return MEMORY[0x270F83938]();
}

uint64_t sub_23EF03B58()
{
  return MEMORY[0x270F83940]();
}

uint64_t sub_23EF03B68()
{
  return MEMORY[0x270F83950]();
}

uint64_t sub_23EF03B78()
{
  return MEMORY[0x270F83958]();
}

uint64_t sub_23EF03B88()
{
  return MEMORY[0x270F83960]();
}

uint64_t sub_23EF03B98()
{
  return MEMORY[0x270EE3BB0]();
}

uint64_t sub_23EF03BA8()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_23EF03BB8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_23EF03BC8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_23EF03BD8()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_23EF03BE8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_23EF03BF8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_23EF03C08()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_23EF03C18()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_23EF03C28()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_23EF03C38()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_23EF03C48()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_23EF03C58()
{
  return MEMORY[0x270EFEBD0]();
}

uint64_t sub_23EF03C68()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_23EF03C78()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_23EF03C88()
{
  return MEMORY[0x270EFEEA0]();
}

uint64_t sub_23EF03C98()
{
  return MEMORY[0x270EFEEA8]();
}

uint64_t sub_23EF03CA8()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_23EF03CB8()
{
  return MEMORY[0x270EFEF58]();
}

uint64_t sub_23EF03CC8()
{
  return MEMORY[0x270EFEF68]();
}

uint64_t sub_23EF03CD8()
{
  return MEMORY[0x270EFEFB8]();
}

uint64_t sub_23EF03CE8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_23EF03CF8()
{
  return MEMORY[0x270EFF008]();
}

uint64_t sub_23EF03D08()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_23EF03D18()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_23EF03D28()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_23EF03D38()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_23EF03D48()
{
  return MEMORY[0x270EFF1D8]();
}

uint64_t sub_23EF03D58()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_23EF03D68()
{
  return MEMORY[0x270EFF3F8]();
}

uint64_t sub_23EF03D78()
{
  return MEMORY[0x270EFF408]();
}

uint64_t sub_23EF03D88()
{
  return MEMORY[0x270EFF418]();
}

uint64_t sub_23EF03D98()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_23EF03DA8()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_23EF03DB8()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_23EF03DC8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_23EF03DD8()
{
  return MEMORY[0x270EFF5E0]();
}

uint64_t sub_23EF03DE8()
{
  return MEMORY[0x270EFF5E8]();
}

uint64_t sub_23EF03DF8()
{
  return MEMORY[0x270EFF5F8]();
}

uint64_t sub_23EF03E08()
{
  return MEMORY[0x270EFF608]();
}

uint64_t sub_23EF03E18()
{
  return MEMORY[0x270EFF610]();
}

uint64_t sub_23EF03E28()
{
  return MEMORY[0x270EFF618]();
}

uint64_t sub_23EF03E38()
{
  return MEMORY[0x270EFF620]();
}

uint64_t sub_23EF03E48()
{
  return MEMORY[0x270EFF628]();
}

uint64_t sub_23EF03E58()
{
  return MEMORY[0x270EFF638]();
}

uint64_t sub_23EF03E68()
{
  return MEMORY[0x270EFF640]();
}

uint64_t sub_23EF03E78()
{
  return MEMORY[0x270EFF648]();
}

uint64_t sub_23EF03E88()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_23EF03E98()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_23EF03EA8()
{
  return MEMORY[0x270EFF6C0]();
}

uint64_t sub_23EF03EB8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_23EF03EC8()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_23EF03ED8()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_23EF03EE8()
{
  return MEMORY[0x270EFF7D8]();
}

uint64_t sub_23EF03EF8()
{
  return MEMORY[0x270EFF7F0]();
}

uint64_t sub_23EF03F08()
{
  return MEMORY[0x270EFF818]();
}

uint64_t sub_23EF03F18()
{
  return MEMORY[0x270EFF838]();
}

uint64_t sub_23EF03F28()
{
  return MEMORY[0x270EFF850]();
}

uint64_t sub_23EF03F38()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_23EF03F48()
{
  return MEMORY[0x270EFFA58]();
}

uint64_t sub_23EF03F58()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_23EF03F68()
{
  return MEMORY[0x270EFFAA0]();
}

uint64_t sub_23EF03F78()
{
  return MEMORY[0x270EFFAA8]();
}

uint64_t sub_23EF03F88()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_23EF03F98()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_23EF03FA8()
{
  return MEMORY[0x270EFFBF8]();
}

uint64_t sub_23EF03FB8()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_23EF03FC8()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_23EF03FD8()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_23EF03FE8()
{
  return MEMORY[0x270F000F0]();
}

uint64_t sub_23EF03FF8()
{
  return MEMORY[0x270F00118]();
}

uint64_t sub_23EF04008()
{
  return MEMORY[0x270F00120]();
}

uint64_t sub_23EF04018()
{
  return MEMORY[0x270F00148]();
}

uint64_t sub_23EF04028()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_23EF04038()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_23EF04048()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_23EF04058()
{
  return MEMORY[0x270F00240]();
}

uint64_t sub_23EF04068()
{
  return MEMORY[0x270F00248]();
}

uint64_t sub_23EF04078()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_23EF04088()
{
  return MEMORY[0x270F00628]();
}

uint64_t sub_23EF04098()
{
  return MEMORY[0x270F00630]();
}

uint64_t sub_23EF040A8()
{
  return MEMORY[0x270F00650]();
}

uint64_t sub_23EF040B8()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_23EF040C8()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_23EF040D8()
{
  return MEMORY[0x270F00820]();
}

uint64_t sub_23EF040E8()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_23EF040F8()
{
  return MEMORY[0x270F00838]();
}

uint64_t sub_23EF04108()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_23EF04118()
{
  return MEMORY[0x270F00908]();
}

uint64_t sub_23EF04128()
{
  return MEMORY[0x270F00910]();
}

uint64_t sub_23EF04138()
{
  return MEMORY[0x270F009D0]();
}

uint64_t sub_23EF04148()
{
  return MEMORY[0x270F009D8]();
}

uint64_t sub_23EF04158()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_23EF04168()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_23EF04178()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_23EF04188()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_23EF04198()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_23EF041A8()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_23EF041B8()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_23EF041C8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_23EF041D8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_23EF041E8()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_23EF041F8()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_23EF04208()
{
  return MEMORY[0x270F00DF0]();
}

uint64_t sub_23EF04218()
{
  return MEMORY[0x270F00E00]();
}

uint64_t sub_23EF04228()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_23EF04238()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_23EF04248()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_23EF04258()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_23EF04268()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23EF04278()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23EF04288()
{
  return MEMORY[0x270F00FA0]();
}

uint64_t sub_23EF04298()
{
  return MEMORY[0x270F00FA8]();
}

uint64_t sub_23EF042A8()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_23EF042B8()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_23EF042E8()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_23EF042F8()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_23EF04308()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_23EF04318()
{
  return MEMORY[0x270F013E0]();
}

uint64_t sub_23EF04328()
{
  return MEMORY[0x270F013E8]();
}

uint64_t sub_23EF04338()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_23EF04348()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_23EF04358()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_23EF04368()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_23EF04378()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_23EF04388()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_23EF04398()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_23EF043A8()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_23EF043C8()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_23EF043D8()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_23EF043E8()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_23EF043F8()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_23EF04408()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_23EF04418()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_23EF04438()
{
  return MEMORY[0x270F01790]();
}

uint64_t sub_23EF04448()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_23EF04458()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23EF04468()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_23EF04478()
{
  return MEMORY[0x270F018D8]();
}

uint64_t sub_23EF04488()
{
  return MEMORY[0x270F018F0]();
}

uint64_t sub_23EF04498()
{
  return MEMORY[0x270F01940]();
}

uint64_t sub_23EF044A8()
{
  return MEMORY[0x270F01950]();
}

uint64_t sub_23EF044B8()
{
  return MEMORY[0x270F01A48]();
}

uint64_t sub_23EF044C8()
{
  return MEMORY[0x270F01A68]();
}

uint64_t sub_23EF044D8()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_23EF044E8()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_23EF044F8()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_23EF04508()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_23EF04518()
{
  return MEMORY[0x270F01F00]();
}

uint64_t sub_23EF04528()
{
  return MEMORY[0x270F01F10]();
}

uint64_t sub_23EF04538()
{
  return MEMORY[0x270F01F18]();
}

uint64_t sub_23EF04548()
{
  return MEMORY[0x270F01F20]();
}

uint64_t sub_23EF04558()
{
  return MEMORY[0x270F01F28]();
}

uint64_t sub_23EF04568()
{
  return MEMORY[0x270F01F38]();
}

uint64_t sub_23EF04578()
{
  return MEMORY[0x270F01F40]();
}

uint64_t sub_23EF04588()
{
  return MEMORY[0x270F01F70]();
}

uint64_t sub_23EF04598()
{
  return MEMORY[0x270F01F90]();
}

uint64_t sub_23EF045A8()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_23EF045B8()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_23EF045C8()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_23EF045D8()
{
  return MEMORY[0x270F02260]();
}

uint64_t sub_23EF045E8()
{
  return MEMORY[0x270F02290]();
}

uint64_t sub_23EF045F8()
{
  return MEMORY[0x270F022A0]();
}

uint64_t sub_23EF04608()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_23EF04618()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_23EF04628()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_23EF04638()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_23EF04648()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_23EF04658()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_23EF04668()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_23EF04678()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_23EF04698()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_23EF046A8()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_23EF046B8()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_23EF046D8()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_23EF046E8()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_23EF046F8()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_23EF04708()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23EF04718()
{
  return MEMORY[0x270F029F8]();
}

uint64_t sub_23EF04728()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_23EF04738()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_23EF04748()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_23EF04758()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_23EF04768()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_23EF04778()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_23EF04788()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_23EF04798()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_23EF047A8()
{
  return MEMORY[0x270F02AB0]();
}

uint64_t sub_23EF047B8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_23EF047C8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_23EF047D8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_23EF047E8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_23EF047F8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_23EF04808()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_23EF04818()
{
  return MEMORY[0x270F02BC8]();
}

uint64_t sub_23EF04828()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_23EF04838()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_23EF04848()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_23EF04858()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_23EF04868()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_23EF04878()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_23EF04888()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_23EF04898()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_23EF048A8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_23EF048B8()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_23EF048C8()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_23EF048D8()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_23EF048E8()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_23EF048F8()
{
  return MEMORY[0x270F02F00]();
}

uint64_t sub_23EF04908()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_23EF04918()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_23EF04928()
{
  return MEMORY[0x270F02FE8]();
}

uint64_t sub_23EF04938()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_23EF04948()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_23EF04958()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_23EF04968()
{
  return MEMORY[0x270F03158]();
}

uint64_t sub_23EF04978()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_23EF04988()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_23EF04998()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23EF049A8()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23EF049B8()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_23EF049C8()
{
  return MEMORY[0x270F03310]();
}

uint64_t sub_23EF049D8()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_23EF049E8()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_23EF049F8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_23EF04A08()
{
  return MEMORY[0x270F03520]();
}

uint64_t sub_23EF04A18()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_23EF04A28()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23EF04A38()
{
  return MEMORY[0x270F03708]();
}

uint64_t sub_23EF04A48()
{
  return MEMORY[0x270F03788]();
}

uint64_t sub_23EF04A58()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_23EF04A68()
{
  return MEMORY[0x270F03968]();
}

uint64_t sub_23EF04A78()
{
  return MEMORY[0x270F03970]();
}

uint64_t sub_23EF04A88()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_23EF04A98()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_23EF04AA8()
{
  return MEMORY[0x270F03A40]();
}

uint64_t sub_23EF04AB8()
{
  return MEMORY[0x270F03AD8]();
}

uint64_t sub_23EF04AC8()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_23EF04AD8()
{
  return MEMORY[0x270F03B50]();
}

uint64_t sub_23EF04AE8()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_23EF04AF8()
{
  return MEMORY[0x270F03BD0]();
}

uint64_t sub_23EF04B08()
{
  return MEMORY[0x270F03C30]();
}

uint64_t sub_23EF04B18()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_23EF04B28()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_23EF04B38()
{
  return MEMORY[0x270F03DC8]();
}

uint64_t sub_23EF04B48()
{
  return MEMORY[0x270F03DD0]();
}

uint64_t sub_23EF04B58()
{
  return MEMORY[0x270F03E10]();
}

uint64_t sub_23EF04B68()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_23EF04B78()
{
  return MEMORY[0x270F03F70]();
}

uint64_t sub_23EF04B88()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_23EF04B98()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_23EF04BA8()
{
  return MEMORY[0x270F040B0]();
}

uint64_t sub_23EF04BB8()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_23EF04BC8()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_23EF04BD8()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_23EF04BE8()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_23EF04BF8()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_23EF04C08()
{
  return MEMORY[0x270F041B8]();
}

uint64_t sub_23EF04C18()
{
  return MEMORY[0x270F041E8]();
}

uint64_t sub_23EF04C28()
{
  return MEMORY[0x270F04260]();
}

uint64_t sub_23EF04C38()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_23EF04C48()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_23EF04C58()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_23EF04C68()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_23EF04C78()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_23EF04C88()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_23EF04C98()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_23EF04CA8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_23EF04CB8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_23EF04CC8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_23EF04CD8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_23EF04CE8()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_23EF04CF8()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_23EF04D08()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_23EF04D18()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_23EF04D28()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_23EF04D38()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_23EF04D48()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_23EF04D78()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_23EF04D98()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_23EF04DB8()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23EF04DC8()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23EF04DD8()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23EF04DE8()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_23EF04DF8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_23EF04E08()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_23EF04E18()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_23EF04E28()
{
  return MEMORY[0x270F04980]();
}

uint64_t sub_23EF04E38()
{
  return MEMORY[0x270F04988]();
}

uint64_t sub_23EF04E48()
{
  return MEMORY[0x270F04990]();
}

uint64_t sub_23EF04E58()
{
  return MEMORY[0x270F04998]();
}

uint64_t sub_23EF04E68()
{
  return MEMORY[0x270F049A0]();
}

uint64_t sub_23EF04E78()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_23EF04E88()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_23EF04E98()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_23EF04EA8()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_23EF04EB8()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_23EF04EC8()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_23EF04ED8()
{
  return MEMORY[0x270F04C18]();
}

uint64_t sub_23EF04EE8()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_23EF04EF8()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_23EF04F08()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_23EF04F18()
{
  return MEMORY[0x270F04CE8]();
}

uint64_t sub_23EF04F28()
{
  return MEMORY[0x270F04EC8]();
}

uint64_t sub_23EF04F38()
{
  return MEMORY[0x270F04ED8]();
}

uint64_t sub_23EF04F48()
{
  return MEMORY[0x270F04F78]();
}

uint64_t sub_23EF04F58()
{
  return MEMORY[0x270F04F90]();
}

uint64_t sub_23EF04F68()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_23EF04F78()
{
  return MEMORY[0x270F04FA0]();
}

uint64_t sub_23EF04F88()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_23EF04F98()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_23EF04FA8()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_23EF04FB8()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_23EF04FC8()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_23EF04FD8()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_23EF04FE8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_23EF04FF8()
{
  return MEMORY[0x270F05098]();
}

uint64_t sub_23EF05008()
{
  return MEMORY[0x270F050B8]();
}

uint64_t sub_23EF05018()
{
  return MEMORY[0x270F050C0]();
}

uint64_t sub_23EF05028()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_23EF05038()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_23EF05048()
{
  return MEMORY[0x270F050F8]();
}

uint64_t sub_23EF05058()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_23EF05068()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_23EF05078()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_23EF05088()
{
  return MEMORY[0x270F05158]();
}

uint64_t sub_23EF05098()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_23EF050A8()
{
  return MEMORY[0x270F05170]();
}

uint64_t sub_23EF050B8()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_23EF050C8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_23EF050D8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_23EF050E8()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_23EF050F8()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_23EF05108()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_23EF05118()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_23EF05128()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23EF05138()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23EF05148()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23EF05158()
{
  return MEMORY[0x270FA0AB0]();
}

uint64_t sub_23EF05168()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_23EF05178()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_23EF05188()
{
  return MEMORY[0x270FA0B60]();
}

uint64_t sub_23EF05198()
{
  return MEMORY[0x270FA0B70]();
}

uint64_t sub_23EF051A8()
{
  return MEMORY[0x270FA0B98]();
}

uint64_t sub_23EF051B8()
{
  return MEMORY[0x270FA0BB0]();
}

uint64_t sub_23EF051C8()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_23EF051D8()
{
  return MEMORY[0x270F069C8]();
}

uint64_t sub_23EF051E8()
{
  return MEMORY[0x270F069E8]();
}

uint64_t sub_23EF051F8()
{
  return MEMORY[0x270F069F0]();
}

uint64_t sub_23EF05208()
{
  return MEMORY[0x270F069F8]();
}

uint64_t sub_23EF05218()
{
  return MEMORY[0x270F06A00]();
}

uint64_t sub_23EF05228()
{
  return MEMORY[0x270F06A08]();
}

uint64_t sub_23EF05238()
{
  return MEMORY[0x270F06A10]();
}

uint64_t sub_23EF05248()
{
  return MEMORY[0x270F06A20]();
}

uint64_t sub_23EF05258()
{
  return MEMORY[0x270F06A28]();
}

uint64_t sub_23EF05268()
{
  return MEMORY[0x270F06A30]();
}

uint64_t sub_23EF05278()
{
  return MEMORY[0x270F06A78]();
}

uint64_t sub_23EF05288()
{
  return MEMORY[0x270F06A80]();
}

uint64_t sub_23EF05298()
{
  return MEMORY[0x270F06A88]();
}

uint64_t sub_23EF052A8()
{
  return MEMORY[0x270F06A98]();
}

uint64_t sub_23EF052B8()
{
  return MEMORY[0x270F06AA0]();
}

uint64_t sub_23EF052C8()
{
  return MEMORY[0x270F06AA8]();
}

uint64_t sub_23EF052D8()
{
  return MEMORY[0x270F06AB0]();
}

uint64_t sub_23EF052E8()
{
  return MEMORY[0x270F06AB8]();
}

uint64_t sub_23EF052F8()
{
  return MEMORY[0x270F06AE0]();
}

uint64_t sub_23EF05308()
{
  return MEMORY[0x270F06AF8]();
}

uint64_t sub_23EF05318()
{
  return MEMORY[0x270F06B00]();
}

uint64_t sub_23EF05328()
{
  return MEMORY[0x270F06B08]();
}

uint64_t sub_23EF05338()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23EF05348()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23EF05358()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23EF05368()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_23EF05378()
{
  return MEMORY[0x270FA2B48]();
}

uint64_t sub_23EF05388()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_23EF05398()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_23EF053A8()
{
  return MEMORY[0x270F9D568]();
}

uint64_t sub_23EF053B8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23EF053C8()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_23EF053D8()
{
  return MEMORY[0x270EF1968]();
}

uint64_t sub_23EF053E8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23EF053F8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23EF05408()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23EF05418()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23EF05428()
{
  return MEMORY[0x270EF1A18]();
}

uint64_t sub_23EF05438()
{
  return MEMORY[0x270EF1A30]();
}

uint64_t sub_23EF05448()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_23EF05458()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23EF05468()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_23EF05478()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_23EF05488()
{
  return MEMORY[0x270EF1B10]();
}

uint64_t sub_23EF05498()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23EF054A8()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_23EF054B8()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_23EF054C8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_23EF054D8()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_23EF054E8()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_23EF054F8()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_23EF05508()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23EF05518()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23EF05528()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_23EF05538()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_23EF05548()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23EF05558()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23EF05568()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_23EF05578()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_23EF05588()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_23EF05598()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_23EF055A8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_23EF055B8()
{
  return MEMORY[0x270F9D888]();
}

uint64_t sub_23EF055C8()
{
  return MEMORY[0x270F9D8D8]();
}

uint64_t sub_23EF055D8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_23EF055E8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_23EF055F8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_23EF05608()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23EF05618()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23EF05628()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23EF05638()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_23EF05648()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23EF05658()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23EF05668()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23EF05678()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23EF05688()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23EF05698()
{
  return MEMORY[0x270FA1E18]();
}

uint64_t sub_23EF056A8()
{
  return MEMORY[0x270FA1E20]();
}

uint64_t sub_23EF056B8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_23EF056C8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_23EF056D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_23EF056E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23EF056F8()
{
  return MEMORY[0x270FA1FB0]();
}

uint64_t sub_23EF05718()
{
  return MEMORY[0x270EF1CC0]();
}

uint64_t sub_23EF05728()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_23EF05738()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_23EF05748()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_23EF05758()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_23EF05768()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_23EF05778()
{
  return MEMORY[0x270EE5860]();
}

uint64_t sub_23EF05788()
{
  return MEMORY[0x270EE5878]();
}

uint64_t sub_23EF05798()
{
  return MEMORY[0x270EF1DD0]();
}

uint64_t sub_23EF057A8()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_23EF057B8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23EF057C8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23EF057D8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23EF057E8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23EF057F8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23EF05808()
{
  return MEMORY[0x270EF1F58]();
}

uint64_t sub_23EF05818()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_23EF05828()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_23EF05838()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_23EF05848()
{
  return MEMORY[0x270FA0C90]();
}

uint64_t sub_23EF05858()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_23EF05868()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23EF05878()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_23EF05888()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_23EF05898()
{
  return MEMORY[0x270FA0DE0]();
}

uint64_t sub_23EF058A8()
{
  return MEMORY[0x270FA0DE8]();
}

uint64_t sub_23EF058B8()
{
  return MEMORY[0x270FA0E28]();
}

uint64_t sub_23EF058C8()
{
  return MEMORY[0x270FA0EA0]();
}

uint64_t sub_23EF058D8()
{
  return MEMORY[0x270FA0EC0]();
}

uint64_t sub_23EF058E8()
{
  return MEMORY[0x270FA0EE0]();
}

uint64_t sub_23EF058F8()
{
  return MEMORY[0x270FA0F58]();
}

uint64_t sub_23EF05918()
{
  return MEMORY[0x270EF2170]();
}

uint64_t sub_23EF05928()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_23EF05938()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_23EF05948()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23EF05958()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_23EF05968()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_23EF05978()
{
  return MEMORY[0x270EF2248]();
}

uint64_t sub_23EF05988()
{
  return MEMORY[0x270EF2250]();
}

uint64_t sub_23EF05998()
{
  return MEMORY[0x270EF2268]();
}

uint64_t sub_23EF059A8()
{
  return MEMORY[0x270F9E3B0]();
}

uint64_t sub_23EF059B8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_23EF059C8()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_23EF059D8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_23EF059E8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_23EF059F8()
{
  return MEMORY[0x270EF2448]();
}

uint64_t sub_23EF05A08()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23EF05A18()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_23EF05A28()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_23EF05A38()
{
  return MEMORY[0x270FA13A0]();
}

uint64_t sub_23EF05A48()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23EF05A68()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23EF05A78()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_23EF05A88()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_23EF05A98()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_23EF05AA8()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_23EF05AB8()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_23EF05AC8()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_23EF05AD8()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_23EF05AE8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_23EF05AF8()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_23EF05B08()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_23EF05B18()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_23EF05B28()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_23EF05B38()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23EF05B48()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23EF05B58()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23EF05B68()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23EF05B78()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23EF05B88()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_23EF05B98()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_23EF05BA8()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_23EF05BB8()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_23EF05BC8()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23EF05BD8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_23EF05BE8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_23EF05BF8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23EF05C08()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23EF05C18()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23EF05C28()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23EF05C38()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_23EF05C48()
{
  return MEMORY[0x270F9F0D8]();
}

uint64_t sub_23EF05C58()
{
  return MEMORY[0x270F9F0E0]();
}

uint64_t sub_23EF05C78()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23EF05C88()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23EF05C98()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23EF05CA8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_23EF05CB8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23EF05CC8()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_23EF05CE8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_23EF05CF8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23EF05D08()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_23EF05D48()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_23EF05D58()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23EF05D68()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23EF05D78()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23EF05D88()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23EF05D98()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_23EF05DA8()
{
  return MEMORY[0x270F9FC30]();
}

uint64_t sub_23EF05DB8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_23EF05DC8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23EF05DD8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23EF05DE8()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_23EF05DF8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23EF05E08()
{
  return MEMORY[0x270F9FFE8]();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x270EE2230]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB938](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x270EFB960](retstr, t, angle, x, y, z);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x270EE9B20](original, attributes);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x270EF4420]();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterBlock()
{
  return MEMORY[0x270EF4458]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x270EF4478]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x270EF4490]();
}

uint64_t IOHIDEventSystemClientUnregisterEventFilterBlock()
{
  return MEMORY[0x270EF44B8]();
}

uint64_t MCGestaltIsInternalBuild()
{
  return MEMORY[0x270F49670]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x270F77180]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F82C80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F82D70]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
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

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
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

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x270FA05D8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x270FA05E0]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x270FA0600]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x270FA0608]();
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

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

uint64_t vfx_script_clock_delta_time()
{
  return MEMORY[0x270F83970]();
}

uint64_t vfx_script_clock_simulation_index()
{
  return MEMORY[0x270F83978]();
}

uint64_t vfx_script_clock_time()
{
  return MEMORY[0x270F83980]();
}

uint64_t vfx_script_curve_create()
{
  return MEMORY[0x270F839A0]();
}

uint64_t vfx_script_curve_destroy()
{
  return MEMORY[0x270F839A8]();
}

uint64_t vfx_script_curve_evaluate()
{
  return MEMORY[0x270F839B0]();
}

uint64_t vfx_script_get_arguments_buffer()
{
  return MEMORY[0x270F839B8]();
}

uint64_t vfx_script_get_iteration_range()
{
  return MEMORY[0x270F839C0]();
}

uint64_t vfx_script_texture_sample1d()
{
  return MEMORY[0x270F839C8]();
}