__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_249341774(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_249341794(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)result = (a2 - 1);
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

void type metadata accessor for CGSize()
{
  if (!qword_2696A0300)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2696A0300);
    }
  }
}

uint64_t sub_249341814()
{
  return 1;
}

uint64_t sub_24934181C()
{
  return sub_24934E3B8();
}

uint64_t sub_249341860()
{
  return sub_24934E3A8();
}

uint64_t sub_249341888()
{
  return sub_24934E3B8();
}

double sub_2493418C8@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = swift_dynamicCastObjCProtocolConditional();
  if (v4)
  {
    v5 = (void *)v4;
    id v6 = a1;
    id v7 = objc_msgSend(v5, sel_accessibilityChartDescriptor);
    if (v7)
    {
      id v8 = v7;
      *(void *)(a2 + 24) = &type metadata for BaseStyle.ChartConfiguration;
      *(void *)(a2 + 32) = &off_26FCFBA30;

      *(void *)a2 = v8;
      return result;
    }
  }
  *(void *)(a2 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_249341980@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A04C8);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

uint64_t sub_2493419F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  int v42 = a4;
  uint64_t v45 = a1;
  uint64_t v46 = a5;
  uint64_t v44 = sub_24934E008();
  uint64_t v7 = *(void *)(v44 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v44);
  v43 = &v41[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = sub_24934DF68();
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  v12 = &v41[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0358);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  v16 = &v41[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0360);
  MEMORY[0x270FA5388](v17 - 8);
  v19 = &v41[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = (char *)v12 + *(int *)(v10 + 28);
  uint64_t v21 = *MEMORY[0x263F19860];
  uint64_t v22 = sub_24934DFC8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v22 - 8) + 104))(v20, v21, v22);
  __asm { FMOV            V0.2D, #3.0 }
  _OWORD *v12 = _Q0;
  uint64_t v28 = sub_24934E0D8();
  sub_2493430C0((uint64_t)v12, (uint64_t)v16);
  *(void *)&v16[*(int *)(v14 + 44)] = v28;
  sub_249343124((uint64_t)v12);
  LOBYTE(v14) = v42 & 1;
  sub_249342F5C(a2, a3, v42 & 1);
  sub_249343180(a2, a3, v14);
  double v30 = v29;
  sub_249342F68(a2, a3, v14);
  sub_24934E168();
  sub_249341D8C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v19, 0.0, 1, v30 * 0.35, 0);
  sub_249344B80((uint64_t)v16, &qword_2696A0358);
  uint64_t v31 = sub_24934E168();
  v33 = v32;
  v35 = v43;
  uint64_t v34 = v44;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 16))(v43, v45, v44);
  unint64_t v36 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v37 = swift_allocObject();
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v7 + 32))(v37 + v36, v35, v34);
  uint64_t v38 = v46;
  sub_249344B1C((uint64_t)v19, v46, &qword_2696A0360);
  v39 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))(v38
                                                                   + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A0368)
                                                                            + 36));
  *v39 = sub_24934342C;
  v39[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v37;
  v39[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t *@<X8>))v31;
  v39[3] = v33;
  return sub_249344B80((uint64_t)v19, &qword_2696A0360);
}

__n128 sub_249341D8C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_24934E268();
    v23 = (void *)sub_24934E018();
    sub_24934DD88();
  }
  sub_24934DF78();
  sub_249344B1C(v13, a9, &qword_2696A0358);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A0360) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

__n128 sub_249341F4C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_24934E268();
    v23 = (void *)sub_24934E018();
    sub_24934DD88();
  }
  sub_24934DF78();
  sub_2493430C0(v13, a9);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A04D0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_249342104@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = sub_24934E178();
  a3[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0370);
  return sub_24934215C(a1, a2, (uint64_t)a3 + *(int *)(v7 + 44));
}

uint64_t sub_24934215C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v56 = a1;
  uint64_t v57 = a2;
  uint64_t v60 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0378);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v53 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v59 = (uint64_t)&v52 - v5;
  uint64_t v6 = sub_24934DF68() - 8;
  uint64_t v54 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0358);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0380);
  uint64_t v14 = v13 - 8;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v58 = (uint64_t)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  v19 = (char *)&v52 - v18;
  MEMORY[0x270FA5388](v17);
  uint64_t v55 = (uint64_t)&v52 - v20;
  uint64_t v21 = &v8[*(int *)(v6 + 28)];
  uint64_t v22 = *MEMORY[0x263F19860];
  uint64_t v23 = sub_24934DFC8();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104);
  v24(v21, v22, v23);
  __asm { FMOV            V0.2D, #3.0 }
  long long v52 = _Q0;
  *(_OWORD *)uint64_t v8 = _Q0;
  uint64_t v30 = sub_24934E0C8();
  sub_2493430C0((uint64_t)v8, (uint64_t)v12);
  *(void *)&v12[*(int *)(v10 + 44)] = v30;
  sub_249343124((uint64_t)v8);
  sub_24934DEB8();
  sub_24934DFF8();
  sub_24934E168();
  sub_24934DEA8();
  sub_249344B1C((uint64_t)v12, (uint64_t)v19, &qword_2696A0358);
  long long v31 = &v19[*(int *)(v14 + 44)];
  long long v32 = v62;
  *(_OWORD *)long long v31 = v61;
  *((_OWORD *)v31 + 1) = v32;
  *((_OWORD *)v31 + 2) = v63;
  sub_249344B80((uint64_t)v12, &qword_2696A0358);
  uint64_t v33 = (uint64_t)v19;
  uint64_t v34 = v55;
  sub_249343D9C(v33, v55, &qword_2696A0380);
  v24(&v8[*(int *)(v54 + 28)], v22, v23);
  *(_OWORD *)uint64_t v8 = v52;
  uint64_t v35 = sub_24934E0C8();
  sub_24934DE48();
  uint64_t v36 = v53;
  sub_2493430C0((uint64_t)v8, v53);
  uint64_t v37 = v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A0388) + 36);
  long long v38 = v65;
  *(_OWORD *)uint64_t v37 = v64;
  *(_OWORD *)(v37 + 16) = v38;
  *(void *)(v37 + 32) = v66;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0390);
  *(void *)(v36 + *(int *)(v39 + 52)) = v35;
  *(_WORD *)(v36 + *(int *)(v39 + 56)) = 256;
  uint64_t v40 = sub_24934E168();
  uint64_t v42 = v41;
  v43 = (uint64_t *)(v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A0398) + 36));
  uint64_t *v43 = v40;
  v43[1] = v42;
  sub_249343124((uint64_t)v8);
  uint64_t v44 = v59;
  sub_249343D9C(v36, v59, &qword_2696A0378);
  uint64_t v45 = v34;
  uint64_t v46 = v34;
  uint64_t v47 = v58;
  sub_249344B1C(v46, v58, &qword_2696A0380);
  uint64_t v48 = v44;
  sub_249344B1C(v44, v36, &qword_2696A0378);
  uint64_t v49 = v60;
  sub_249344B1C(v47, v60, &qword_2696A0380);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03A0);
  sub_249344B1C(v36, v49 + *(int *)(v50 + 48), &qword_2696A0378);
  sub_249344B80(v48, &qword_2696A0378);
  sub_249344B80(v45, &qword_2696A0380);
  sub_249344B80(v36, &qword_2696A0378);
  return sub_249344B80(v47, &qword_2696A0380);
}

uint64_t sub_249342604@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2493419F0(a1, *(void *)v2, *(void *)(v2 + 8), *(unsigned __int8 *)(v2 + 16), a2);
}

uint64_t sub_249342610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249342B44(a1, a2, a3, &qword_2696A03C0, &qword_2696A03C8);
}

uint64_t sub_249342624@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  v44[0] = a4;
  uint64_t v7 = sub_24934DF68();
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (_OWORD *)((char *)v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A04D0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A04D8);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = (char *)v10 + *(int *)(v8 + 28);
  uint64_t v19 = *MEMORY[0x263F19860];
  uint64_t v20 = sub_24934DFC8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  __asm { FMOV            V0.2D, #3.0 }
  *uint64_t v10 = _Q0;
  sub_249342F5C(a1, a2, a3 & 1);
  sub_249343180(a1, a2, a3 & 1);
  double v27 = v26;
  sub_249342F68(a1, a2, a3 & 1);
  sub_24934E168();
  sub_249341F4C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v13, 0.0, 1, v27 * 0.35, 0);
  sub_249343124((uint64_t)v10);
  uint64_t v28 = sub_24934E0C8();
  sub_249344B1C((uint64_t)v13, (uint64_t)v17, &qword_2696A04D0);
  *(void *)&v17[*(int *)(v15 + 44)] = v28;
  sub_249344B80((uint64_t)v13, &qword_2696A04D0);
  uint64_t v29 = sub_24934E168();
  uint64_t v31 = v30;
  uint64_t v32 = sub_24934E0D8();
  uint64_t v33 = sub_24934E0C8();
  sub_24934DE48();
  double v34 = *(double *)&v44[1];
  uint64_t v35 = v44[3];
  uint64_t v36 = v44[4];
  uint64_t v37 = v44[5];
  uint64_t v38 = sub_24934E168();
  uint64_t v40 = v39;
  uint64_t v41 = v44[0];
  sub_249344B1C((uint64_t)v17, v44[0], &qword_2696A04D8);
  uint64_t v42 = v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A04E0) + 36);
  *(void *)uint64_t v42 = v32;
  *(double *)(v42 + 8) = v34 * 0.5;
  *(double *)(v42 + 16) = v34;
  *(void *)(v42 + 24) = v44[2];
  *(void *)(v42 + 32) = v35;
  *(void *)(v42 + 40) = v36;
  *(void *)(v42 + 48) = v37;
  *(void *)(v42 + 56) = v33;
  *(_WORD *)(v42 + 64) = 256;
  *(void *)(v42 + 72) = v38;
  *(void *)(v42 + 80) = v40;
  *(void *)(v42 + 88) = v29;
  *(void *)(v42 + 96) = v31;
  return sub_249344B80((uint64_t)v17, &qword_2696A04D8);
}

uint64_t sub_249342954@<X0>(uint64_t a1@<X8>)
{
  return sub_249342624(*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1);
}

uint64_t sub_249342960()
{
  return sub_24934DE88();
}

uint64_t sub_24934297C()
{
  return swift_release();
}

float BootScreenStyle.Configuration.progress.getter()
{
  return *(float *)v0;
}

void BootScreenStyle.Configuration.progress.setter(float a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*BootScreenStyle.Configuration.progress.modify())()
{
  return nullsub_1;
}

BrailleSymbology::BootScreenStyle::Configuration __swiftcall BootScreenStyle.Configuration.init(progress:)(BrailleSymbology::BootScreenStyle::Configuration progress)
{
  v1->progress = progress.progress;
  return progress;
}

uint64_t BootScreenStyle.body(content:)()
{
  return swift_release();
}

uint64_t sub_249342B30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_249342B44(a1, a2, a3, &qword_2696A0310, &qword_2696A0318);
}

uint64_t sub_249342B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t *a5)
{
  return swift_release();
}

double sub_249342C00@<D0>(_OWORD *a1@<X8>)
{
  sub_249343E00();
  sub_24934DFA8();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

double sub_249342C50@<D0>(_OWORD *a1@<X8>)
{
  sub_249343E00();
  sub_24934DFA8();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_249342CA0()
{
  return sub_24934DFB8();
}

uint64_t sub_249342CEC()
{
  return sub_24934DFB8();
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

unint64_t sub_249342DC4()
{
  unint64_t result = qword_2696A0320;
  if (!qword_2696A0320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0320);
  }
  return result;
}

_UNKNOWN **sub_249342E18()
{
  return &protocol witness table for BootScreenStyle.Configuration;
}

unint64_t sub_249342E28()
{
  unint64_t result = qword_2696A0328;
  if (!qword_2696A0328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0328);
  }
  return result;
}

unint64_t sub_249342E7C(uint64_t a1)
{
  unint64_t result = sub_249342EA4();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_249342EA4()
{
  unint64_t result = qword_2696A0338;
  if (!qword_2696A0338)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0338);
  }
  return result;
}

uint64_t sub_249342EF8()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for BootScreenStyle()
{
  return &type metadata for BootScreenStyle;
}

ValueMetadata *type metadata accessor for BootScreenStyle.Configuration()
{
  return &type metadata for BootScreenStyle.Configuration;
}

uint64_t sub_249342F34(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE08progressC5StyleyQrqd__AA08ProgresscE0Rd__lFQOyAA01_C16Modifier_ContentVy16BrailleSymbology010BootScreenE0VG_AH0if9IndicatorE0V0cE0VQo_HOTm(a1, &qword_2696A0310, &qword_2696A0318);
}

ValueMetadata *type metadata accessor for BrailleProgressIndicatorStyle()
{
  return &type metadata for BrailleProgressIndicatorStyle;
}

uint64_t sub_249342F5C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_249342F68(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return swift_release();
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for BrailleProgressIndicatorStyle.ViewStyle()
{
  return &type metadata for BrailleProgressIndicatorStyle.ViewStyle;
}

uint64_t sub_249342FA8()
{
  return swift_getOpaqueTypeConformance2();
}

_UNKNOWN **sub_249342FC4()
{
  return &off_26FCFB780;
}

unint64_t sub_249342FD4()
{
  unint64_t result = qword_2696A0340;
  if (!qword_2696A0340)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0340);
  }
  return result;
}

unint64_t sub_249343028(uint64_t a1)
{
  unint64_t result = sub_249343050();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_249343050()
{
  unint64_t result = qword_2696A0350;
  if (!qword_2696A0350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0350);
  }
  return result;
}

uint64_t sub_2493430A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2493430C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_24934DF68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249343124(uint64_t a1)
{
  uint64_t v2 = sub_24934DF68();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_249343180(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_24934DF98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v10 = sub_24934E268();
  uint64_t v11 = sub_24934E018();
  os_log_type_t v12 = v10;
  if (os_log_type_enabled(v11, v10))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    v18[0] = a2;
    uint64_t v15 = v14;
    double v19 = *(double *)&v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    v18[1] = sub_2493436E4(0x657A69534743, 0xE600000000000000, (uint64_t *)&v19);
    sub_24934E2A8();
    _os_log_impl(&dword_24933F000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v15;
    a2 = v18[0];
    MEMORY[0x24C59BD30](v16, -1, -1);
    MEMORY[0x24C59BD30](v13, -1, -1);
  }

  sub_24934DF88();
  swift_getAtKeyPath();
  sub_249342F68(a1, a2, 0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19;
}

uint64_t sub_24934339C()
{
  uint64_t v1 = sub_24934E008();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24934342C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_24934E008() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_249342104(a1, v6, a2);
}

uint64_t sub_2493434AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24934DF98();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249344B1C(v2, (uint64_t)v17, &qword_2696A03B0);
  if (v18 == 1) {
    return sub_249343D9C((uint64_t)v17, a1, &qword_2696A03B8);
  }
  os_log_type_t v9 = sub_24934E268();
  os_log_type_t v10 = sub_24934E018();
  os_log_type_t v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    v15[1] = a1;
    uint64_t v14 = v13;
    uint64_t v16 = v13;
    *(_DWORD *)os_log_type_t v12 = 136315138;
    v15[2] = sub_2493436E4(0xD00000000000002DLL, 0x8000000249351420, &v16);
    sub_24934E2A8();
    _os_log_impl(&dword_24933F000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24C59BD30](v14, -1, -1);
    MEMORY[0x24C59BD30](v12, -1, -1);
  }

  sub_24934DF88();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2493436E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2493437B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_249343974((uint64_t)v12, *a3);
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
      sub_249343974((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2493437B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24934E2B8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2493439D0(a5, a6);
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
  uint64_t v8 = sub_24934E2E8();
  if (!v8)
  {
    sub_24934E2F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24934E338();
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

uint64_t sub_249343974(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2493439D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_249343A68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_249343C48(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_249343C48(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_249343A68(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_249343BE0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24934E2D8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24934E2F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24934E1E8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24934E338();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24934E2F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_249343BE0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_249343C48(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03A8);
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
  uint64_t result = sub_24934E338();
  __break(1u);
  return result;
}

uint64_t sub_249343D9C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_249343E00()
{
  unint64_t result = qword_2696A03D0;
  if (!qword_2696A03D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A03D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for BrailleSliderStyle()
{
  return &type metadata for BrailleSliderStyle;
}

ValueMetadata *type metadata accessor for BaseStyle()
{
  return &type metadata for BaseStyle;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrailleProgressIndicatorStyle.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BrailleProgressIndicatorStyle.Configuration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BrailleProgressIndicatorStyle.Configuration()
{
  return &type metadata for BrailleProgressIndicatorStyle.Configuration;
}

unint64_t sub_249343EDC()
{
  unint64_t result = qword_2696A03D8;
  if (!qword_2696A03D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0368);
    sub_249344E74(&qword_2696A03E0, &qword_2696A0360, (void (*)(void))sub_249343FA0);
    sub_249344EF4(&qword_2696A0408, &qword_2696A0410);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A03D8);
  }
  return result;
}

unint64_t sub_249343FA0()
{
  unint64_t result = qword_2696A03E8;
  if (!qword_2696A03E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0358);
    sub_249344040();
    sub_249344EF4(&qword_2696A03F8, &qword_2696A0400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A03E8);
  }
  return result;
}

unint64_t sub_249344040()
{
  unint64_t result = qword_2696A03F0;
  if (!qword_2696A03F0)
  {
    sub_24934DF68();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A03F0);
  }
  return result;
}

uint64_t sub_249344098(uint64_t a1)
{
  return get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE08progressC5StyleyQrqd__AA08ProgresscE0Rd__lFQOyAA01_C16Modifier_ContentVy16BrailleSymbology010BootScreenE0VG_AH0if9IndicatorE0V0cE0VQo_HOTm(a1, &qword_2696A03C0, &qword_2696A03C8);
}

uint64_t get_witness_table_qd0__7SwiftUI4ViewHD3_AaBPAAE08progressC5StyleyQrqd__AA08ProgresscE0Rd__lFQOyAA01_C16Modifier_ContentVy16BrailleSymbology010BootScreenE0VG_AH0if9IndicatorE0V0cE0VQo_HOTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_249344144()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_249344194()
{
  unint64_t result = qword_2696A0418;
  if (!qword_2696A0418)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0418);
  }
  return result;
}

uint64_t sub_2493441E8()
{
  return swift_getOpaqueTypeConformance2();
}

_UNKNOWN **sub_249344204()
{
  return &off_26FCFB870;
}

unint64_t sub_249344214()
{
  unint64_t result = qword_2696A0420;
  if (!qword_2696A0420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0420);
  }
  return result;
}

unint64_t sub_249344268(uint64_t a1)
{
  unint64_t result = sub_249344290();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_249344290()
{
  unint64_t result = qword_2696A0430;
  if (!qword_2696A0430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0430);
  }
  return result;
}

_UNKNOWN **sub_2493442E4()
{
  return &off_26FCFB878;
}

unint64_t sub_2493442F4()
{
  unint64_t result = qword_2696A0438;
  if (!qword_2696A0438)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0438);
  }
  return result;
}

unint64_t sub_249344348(uint64_t a1)
{
  unint64_t result = sub_249344370();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_249344370()
{
  unint64_t result = qword_2696A0448;
  if (!qword_2696A0448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0448);
  }
  return result;
}

unint64_t sub_2493443C4()
{
  unint64_t result = qword_2696A04C0;
  if (!qword_2696A04C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A04C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for BaseStyle.ChartConfiguration()
{
  return &type metadata for BaseStyle.ChartConfiguration;
}

uint64_t initializeBufferWithCopyOfBuffer for BaseStyle.Configuration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BaseStyle.Configuration(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t initializeWithCopy for BaseStyle.Configuration(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for BaseStyle.Configuration(uint64_t *a1, uint64_t *a2)
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
        unint64_t result = (uint64_t *)swift_release();
        *long long v3 = v12;
      }
      else
      {
        size_t v11 = *(uint64_t (**)(void))(v10 + 24);
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

uint64_t assignWithTake for BaseStyle.Configuration(uint64_t a1, uint64_t a2)
{
  __swift_destroy_boxed_opaque_existential_0Tm(a1);
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BaseStyle.Configuration(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BaseStyle.Configuration(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BaseStyle.Configuration()
{
  return &type metadata for BaseStyle.Configuration;
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for BrailleSliderStyle.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 12)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BrailleSliderStyle.Configuration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BrailleSliderStyle.Configuration()
{
  return &type metadata for BrailleSliderStyle.Configuration;
}

uint64_t destroy for BrailleSliderStyle.ViewStyle(uint64_t a1)
{
  return sub_249342F68(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_249342F5C(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_249342F5C(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_249342F68(v6, v7, v8);
  return a1;
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwta_0(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_249342F68(v4, v5, v6);
  return a1;
}

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwet_0(uint64_t a1, unsigned int a2)
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

uint64_t _s16BrailleSymbology29BrailleProgressIndicatorStyleV9ViewStyleVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for BrailleSliderStyle.ViewStyle()
{
  return &type metadata for BrailleSliderStyle.ViewStyle;
}

uint64_t sub_249344A6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_249344B00()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_249344B1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_249344B80(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for BaseStyle.ResolvedStyle(unsigned int *a1, int a2)
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

unsigned char *storeEnumTagSinglePayload for BaseStyle.ResolvedStyle(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x249344CCCLL);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_249344CF4()
{
  return 0;
}

ValueMetadata *type metadata accessor for BaseStyle.ResolvedStyle()
{
  return &type metadata for BaseStyle.ResolvedStyle;
}

unint64_t sub_249344D10()
{
  unint64_t result = qword_2696A04E8;
  if (!qword_2696A04E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A04E0);
    sub_249344DB0();
    sub_249344EF4(&qword_2696A0500, &qword_2696A0508);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A04E8);
  }
  return result;
}

unint64_t sub_249344DB0()
{
  unint64_t result = qword_2696A04F0;
  if (!qword_2696A04F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A04D8);
    sub_249344E74(&qword_2696A04F8, &qword_2696A04D0, (void (*)(void))sub_249344040);
    sub_249344EF4(&qword_2696A03F8, &qword_2696A0400);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A04F0);
  }
  return result;
}

uint64_t sub_249344E74(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_249344EF4(unint64_t *a1, uint64_t *a2)
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

unint64_t sub_249344F3C()
{
  unint64_t result = qword_2696A0510;
  if (!qword_2696A0510)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0510);
  }
  return result;
}

uint64_t StyleConfiguration.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t StyleConfiguration.wrappedValue.getter()
{
  sub_2493434AC((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  return swift_dynamicCast();
}

uint64_t sub_24934502C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270EFFE88](a1, a2, a3, a4, a6, a5);
}

uint64_t sub_249345044(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v5 = (char *)&v7 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - v4, a1, AssociatedTypeWitness);
  sub_249345C74((uint64_t)v5, AssociatedTypeWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_249345154()
{
  return swift_release();
}

uint64_t sub_249345210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2493495CC(a1, *(void *)(*(void *)v2 + 80), *(void *)(*(void *)v2 + 88), a2);
}

uint64_t sub_249345260()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 96);
  swift_getAssociatedTypeWitness();
  uint64_t v2 = sub_24934DDF8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_249345318()
{
  sub_249345260();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_249345370@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for StyleProvider();
  uint64_t result = sub_24934DDB8();
  *a1 = result;
  return result;
}

double sub_2493453B4()
{
  qword_2696A1850 = 0;
  double result = 0.0;
  xmmword_2696A1830 = 0u;
  unk_2696A1840 = 0u;
  return result;
}

uint64_t sub_2493453CC@<X0>(uint64_t a1@<X8>)
{
  if (qword_2696A02E0 != -1) {
    swift_once();
  }

  return sub_2493460BC((uint64_t)&xmmword_2696A1830, a1);
}

void sub_24934543C()
{
  xmmword_2696A1860 = 0uLL;
}

double sub_24934544C@<D0>(_OWORD *a1@<X8>)
{
  if (qword_2696A02E8 != -1) {
    swift_once();
  }
  double result = *(double *)&xmmword_2696A1860;
  *a1 = xmmword_2696A1860;
  return result;
}

uint64_t sub_2493454A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_249346934();

  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t sub_24934550C()
{
  sub_249346124();

  return sub_24934DFA8();
}

double sub_249345554()
{
  sub_249343E00();
  sub_24934DFA8();
  return v1;
}

uint64_t sub_249345590(uint64_t a1, uint64_t a2)
{
  swift_getWitnessTable();
  sub_24934DFE8();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0708);
  uint64_t v4 = sub_24934DF58();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v17 - v9;
  swift_getKeyPath();
  long long v17 = *(_OWORD *)(a2 + 16);
  long long v21 = v17;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v20);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v17 - 8) + 16))(boxed_opaque_existential_1, v2);
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24934E078();
  swift_release();
  sub_249344B80((uint64_t)v20, &qword_2696A03B8);
  unint64_t v13 = sub_2493468D8();
  uint64_t v18 = WitnessTable;
  unint64_t v19 = v13;
  uint64_t v14 = swift_getWitnessTable();
  sub_24934B218(v8, v4, v14);
  uint64_t v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v8, v4);
  sub_24934B218(v10, v4, v14);
  return ((uint64_t (*)(char *, uint64_t))v15)(v10, v4);
}

uint64_t sub_2493457E4()
{
  return sub_24934DFA8();
}

uint64_t sub_249345824()
{
  return sub_24934DFA8();
}

uint64_t sub_249345864(uint64_t a1)
{
  sub_2493460BC(a1, (uint64_t)v3);
  sub_2493460BC((uint64_t)v3, (uint64_t)&v2);
  sub_249346124();
  sub_24934DFB8();
  return sub_249344B80((uint64_t)v3, &qword_2696A03B8);
}

uint64_t sub_2493458D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwxx_0(uint64_t result)
{
  if ((*(unsigned char *)(result + 40) & 1) == 0) {
    return swift_release();
  }
  if (*(void *)(result + 24)) {
    return __swift_destroy_boxed_opaque_existential_0Tm(result);
  }
  return result;
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwcp_0(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 40))
  {
    uint64_t v3 = *(void *)(a2 + 24);
    if (v3)
    {
      uint64_t v4 = *(void *)(a2 + 32);
      *(void *)(a1 + 24) = v3;
      *(void *)(a1 + 32) = v4;
      (**(void (***)(uint64_t))(v3 - 8))(a1);
    }
    else
    {
      long long v5 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v5;
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
    }
    *(unsigned char *)(a1 + 40) = 1;
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    *(unsigned char *)(a1 + 40) = 0;
    swift_retain();
  }
  return a1;
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwca_0(uint64_t a1, long long *a2)
{
  if ((long long *)a1 != a2)
  {
    sub_249344B80(a1, &qword_2696A03B0);
    if (*((unsigned char *)a2 + 40))
    {
      uint64_t v4 = *((void *)a2 + 3);
      if (v4)
      {
        *(void *)(a1 + 24) = v4;
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      }
      else
      {
        long long v5 = *a2;
        long long v6 = a2[1];
        *(void *)(a1 + 32) = *((void *)a2 + 4);
        *(_OWORD *)a1 = v5;
        *(_OWORD *)(a1 + 16) = v6;
      }
      *(unsigned char *)(a1 + 40) = 1;
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      *(unsigned char *)(a1 + 40) = 0;
      swift_retain();
    }
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for BrailleSliderView(_OWORD *a1, _OWORD *a2)
{
  if (a1 != a2)
  {
    sub_249344B80((uint64_t)a1, &qword_2696A03B0);
    long long v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  }
  return a1;
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s16BrailleSymbology21BrailleBootScreenViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t type metadata accessor for StyleConfiguration()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_249345B64()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = sub_24934DDF8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for StyleProvider()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_249345C2C()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_249345C38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32))(a3, a1, a2);
}

uint64_t sub_249345C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_24934DDC8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t sub_249345D64(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 88);
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  unint64_t v8 = (char *)v10 - v7;
  v10[2] = v4;
  v10[3] = v3;
  swift_getKeyPath();
  v10[0] = v4;
  v10[1] = v3;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, AssociatedTypeWitness);
  swift_retain();
  return sub_24934DDE8();
}

uint64_t sub_249345EC4()
{
  return sub_249345154();
}

uint64_t sub_249345EE8(uint64_t a1)
{
  return sub_249345D64(a1);
}

uint64_t sub_249345F0C()
{
  return 16;
}

__n128 sub_249345F18(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_249345F24(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v8 - v4, a1);
  swift_beginAccess();
  sub_249345044((uint64_t)v5);
  swift_endAccess();
  return v1;
}

uint64_t sub_249346078(uint64_t a1)
{
  return sub_249345F24(a1);
}

uint64_t sub_2493460BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_249346124()
{
  unint64_t result = qword_2696A0680[0];
  if (!qword_2696A0680[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2696A0680);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

ValueMetadata *type metadata accessor for BrailleMapDimensionsKey()
{
  return &type metadata for BrailleMapDimensionsKey;
}

ValueMetadata *type metadata accessor for StyleConfigurationKey()
{
  return &type metadata for StyleConfigurationKey;
}

uint64_t sub_2493461C8()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_249346258(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_249346310(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_24934633C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24934638C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_2493463DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24934642C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_24934647C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_2493465D8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x2493467F0);
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

uint64_t type metadata accessor for BaseStyleEnvironmentModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_249346830()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_2493468D8()
{
  unint64_t result = qword_2696A0710;
  if (!qword_2696A0710)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0708);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0710);
  }
  return result;
}

unint64_t sub_249346934()
{
  unint64_t result = qword_2696A0718;
  if (!qword_2696A0718)
  {
    type metadata accessor for CGSize();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0718);
  }
  return result;
}

uint64_t sub_24934698C()
{
  return swift_getWitnessTable();
}

id BRLSSymbologyRendererForObject(void *a1)
{
  id v1 = a1;
  sub_2493471D4((uint64_t)&v10);
  if (v11)
  {
    sub_24934736C(&v10, (uint64_t)&aBlock);
    sub_24934736C(&aBlock, (uint64_t)&v10);
    uint64_t v2 = swift_allocObject();
    sub_24934736C(&v10, v2 + 16);

    size_t v8 = sub_24934744C;
    uint64_t v9 = v2;
    *(void *)&long long aBlock = MEMORY[0x263EF8330];
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v6 = sub_249346C20;
    unsigned int v7 = &block_descriptor;
    uint64_t v3 = _Block_copy(&aBlock);
    swift_release();
  }
  else
  {
    sub_249344B80((uint64_t)&v10, &qword_2696A0728);

    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t (*symbologyRendererForObject(_:)())(void *)
{
  sub_2493471D4((uint64_t)&v2);
  if (v3)
  {
    sub_24934736C(&v2, (uint64_t)v4);
    sub_24934736C(v4, (uint64_t)&v2);
    uint64_t v0 = swift_allocObject();
    sub_24934736C(&v2, v0 + 16);
    return sub_249348978;
  }
  else
  {
    sub_249344B80((uint64_t)&v2, &qword_2696A0728);
    return 0;
  }
}

void sub_249346C20(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

Swift::Void __swiftcall NSObject.accessibilityInvalidateBrailleStyleConfiguration()()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0730);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  id v4 = objc_getAssociatedObject(v0, &unk_2696A0720);
  swift_endAccess();
  if (v4)
  {
    sub_24934E2C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_24934746C((uint64_t)v9, (uint64_t)v13);
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0740);
    if (swift_dynamicCast())
    {
      if (*((void *)&v11 + 1))
      {
        sub_24934736C(&v10, (uint64_t)v13);
        uint64_t v5 = sub_24934E248();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
        sub_2493474D4((uint64_t)v13, (uint64_t)&v10);
        sub_24934E228();
        uint64_t v6 = sub_24934E218();
        uint64_t v7 = swift_allocObject();
        uint64_t v8 = MEMORY[0x263F8F500];
        *(void *)(v7 + 16) = v6;
        *(void *)(v7 + 24) = v8;
        sub_24934736C(&v10, v7 + 32);
        sub_249346FE0((uint64_t)v3, (uint64_t)&unk_2696A0750, v7);
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
        return;
      }
    }
    else
    {
      uint64_t v12 = 0;
      long long v10 = 0u;
      long long v11 = 0u;
    }
  }
  else
  {
    sub_249344B80((uint64_t)v13, &qword_2696A0738);
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v12 = 0;
  }
  sub_249344B80((uint64_t)&v10, &qword_2696A0728);
}

uint64_t sub_249346EB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_24934E228();
  *(void *)(v4 + 24) = sub_24934E218();
  uint64_t v6 = sub_24934E208();
  return MEMORY[0x270FA2498](sub_249346F48, v6, v5);
}

uint64_t sub_249346F48()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_249346FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24934E248();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24934E238();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_249344B80(a1, &qword_2696A0730);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24934E208();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_24934718C(void *a1)
{
  id v1 = a1;
  NSObject.accessibilityInvalidateBrailleStyleConfiguration()();
}

uint64_t sub_2493471D4@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  id v3 = objc_getAssociatedObject(v1, &unk_2696A0720);
  swift_endAccess();
  if (v3)
  {
    sub_24934E2C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_24934746C((uint64_t)v10, (uint64_t)v11);
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0740);
    if (swift_dynamicCast())
    {
      if (*((void *)&v14 + 1)) {
        return sub_24934736C(&v13, a1);
      }
    }
    else
    {
      uint64_t v15 = 0;
      long long v13 = 0u;
      long long v14 = 0u;
    }
  }
  else
  {
    sub_249344B80((uint64_t)v11, &qword_2696A0738);
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v15 = 0;
  }
  sub_249344B80((uint64_t)&v13, &qword_2696A0728);
  uint64_t v5 = sub_2493483DC();
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    uint64_t v9 = sub_249348824(0, &qword_2696A0760);
    sub_24934A44C((uint64_t)v1, v9, v7, (uint64_t)&off_26FCFBD10, v8, (void *)a1);
  }
  else
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  sub_249348910(a1, (uint64_t)&v13);
  return sub_249347E14((uint64_t)&v13);
}

uint64_t sub_24934736C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_249347384(void *a1, void *a2)
{
  uint64_t v3 = a2[3];
  uint64_t v4 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v3);
  objc_msgSend(a1, sel_dimensions);
  v6[2] = a1;
  return (*(uint64_t (**)(uint64_t, void (*)(uint64_t, unint64_t), void *, uint64_t, uint64_t))(v4 + 16))(2, sub_24934881C, v6, v3, v4);
}

uint64_t sub_249347414()
{
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_24934744C(void *a1)
{
  return sub_249347384(a1, (void *)(v1 + 16));
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

uint64_t sub_24934746C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0738);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2493474D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_249347538()
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 32);

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_249347578(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_24934762C;
  return sub_249346EB0(a1, v4, v5, v1 + 32);
}

uint64_t sub_24934762C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_249347720(uint64_t a1, unint64_t a2, id a3)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  objc_msgSend(a3, sel_dimensions);
  double v7 = v6;
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  objc_msgSend(a3, sel_dimensions);
  if ((~*(void *)&v8 & 0x7FF0000000000000) == 0)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  if (v8 <= -9.22337204e18)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  if (v8 >= 9.22337204e18) {
    goto LABEL_52;
  }
  uint64_t v9 = (uint64_t)v7;
  uint64_t v10 = (uint64_t)v8;
  unint64_t v11 = a2 >> 62;
  uint64_t v12 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_54;
      }
      uint64_t v12 = (int)v12;
LABEL_12:
      if ((unsigned __int128)(v9 * (__int128)v10) >> 64 != (v9 * v10) >> 63) {
        goto LABEL_53;
      }
      if (v12 == v9 * v10)
      {
        switch((int)v11)
        {
          case 1:
            if (a1 >> 32 < (int)a1) {
              goto LABEL_56;
            }
            sub_249348860(a1, a2);
            uint64_t v23 = sub_24934DCF8();
            if (!v23)
            {
              sub_24934DD08();
              uint64_t v30 = 0;
              LODWORD(v29) = 0;
LABEL_44:
              sub_249347CFC(v30, v29, v10, (uint64_t)v7, a3, v28);
              sub_2493488B8(a1, a2);
              return;
            }
            uint64_t v24 = v23;
            uint64_t v25 = sub_24934DD18();
            uint64_t v26 = (int)a1 - v25;
            if (!__OFSUB__((int)a1, v25))
            {
              uint64_t v27 = sub_24934DD08();
              if (v27 >= (a1 >> 32) - (int)a1) {
                uint64_t v29 = (a1 >> 32) - (int)a1;
              }
              else {
                LODWORD(v29) = v27;
              }
              uint64_t v30 = (unsigned char *)(v24 + v26);
              goto LABEL_44;
            }
            break;
          case 2:
            uint64_t v31 = *(void *)(a1 + 16);
            uint64_t v32 = *(void *)(a1 + 24);
            swift_retain();
            swift_retain();
            uint64_t v33 = sub_24934DCF8();
            if (!v33) {
              goto LABEL_28;
            }
            uint64_t v34 = sub_24934DD18();
            if (__OFSUB__(v31, v34)) {
              goto LABEL_61;
            }
            v33 += v31 - v34;
LABEL_28:
            BOOL v15 = __OFSUB__(v32, v31);
            uint64_t v35 = v32 - v31;
            if (v15) {
              goto LABEL_57;
            }
            uint64_t v36 = sub_24934DD08();
            if (v33)
            {
              if (v36 >= v35) {
                int v38 = v35;
              }
              else {
                int v38 = v36;
              }
              uint64_t v39 = (unsigned char *)v33;
            }
            else
            {
              uint64_t v39 = 0;
              int v38 = 0;
            }
            sub_249347CFC(v39, v38, v10, (uint64_t)v7, a3, v37);
            swift_release();
            swift_release();
            return;
          case 3:
            *(void *)((char *)&v49 + 6) = 0;
            *(void *)&long long v49 = 0;
            int v16 = 0;
            goto LABEL_35;
          default:
            *(void *)&long long v49 = a1;
            WORD4(v49) = a2;
            BYTE10(v49) = BYTE2(a2);
            BYTE11(v49) = BYTE3(a2);
            BYTE12(v49) = BYTE4(a2);
            int v16 = BYTE6(a2);
            BYTE13(v49) = BYTE5(a2);
LABEL_35:
            sub_249347CFC(&v49, v16, (uint64_t)v8, (uint64_t)v7, a3, 9.22337204e18);
            return;
        }
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
      }
      objc_msgSend(a3, sel_dimensions);
      *(void *)&long long v49 = v17;
      *((void *)&v49 + 1) = v18;
      type metadata accessor for CGSize();
      uint64_t v19 = sub_24934E1C8();
      unint64_t v21 = v20;
      uint64_t v22 = 0;
      switch((int)v11)
      {
        case 1:
          LODWORD(v22) = HIDWORD(a1) - a1;
          if (__OFSUB__(HIDWORD(a1), a1)) {
            goto LABEL_58;
          }
          uint64_t v22 = (int)v22;
LABEL_39:
          *(void *)&long long v49 = v22;
          uint64_t v42 = sub_24934E348();
          unint64_t v44 = v43;
          os_log_type_t v45 = sub_24934E258();
          sub_249348824(0, &qword_2696A07A0);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v46 = sub_24934E278();
          if (os_log_type_enabled(v46, v45))
          {
            uint64_t v47 = swift_slowAlloc();
            uint64_t v48 = swift_slowAlloc();
            *(void *)&long long v49 = v48;
            *(_DWORD *)uint64_t v47 = 136315394;
            swift_bridgeObjectRetain();
            sub_2493436E4(v19, v21, (uint64_t *)&v49);
            sub_24934E2A8();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v47 + 12) = 2080;
            swift_bridgeObjectRetain();
            sub_2493436E4(v42, v44, (uint64_t *)&v49);
            sub_24934E2A8();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_24933F000, v46, v45, "Failed to create map {%s} + {%s}", (uint8_t *)v47, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x24C59BD30](v48, -1, -1);
            MEMORY[0x24C59BD30](v47, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }

          break;
        case 2:
          uint64_t v41 = *(void *)(a1 + 16);
          uint64_t v40 = *(void *)(a1 + 24);
          BOOL v15 = __OFSUB__(v40, v41);
          uint64_t v22 = v40 - v41;
          if (!v15) {
            goto LABEL_39;
          }
          goto LABEL_59;
        case 3:
          goto LABEL_39;
        default:
          uint64_t v22 = BYTE6(a2);
          goto LABEL_39;
      }
      return;
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_12;
      }
      goto LABEL_55;
    case 3uLL:
      goto LABEL_12;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_12;
  }
}

unsigned char *sub_249347CFC(unsigned char *result, int a2, uint64_t a3, uint64_t a4, id a5, double a6)
{
  if (a3 < 0) {
    goto LABEL_20;
  }
  if (a3)
  {
    if (a4 < 0)
    {
LABEL_21:
      __break(1u);
      return result;
    }
    uint64_t v9 = result;
    uint64_t v10 = 0;
    while (v10 != a3)
    {
      if (a4)
      {
        uint64_t v11 = a4 * v10;
        if ((unsigned __int128)(a4 * (__int128)v10) >> 64 != (a4 * v10) >> 63) {
          goto LABEL_19;
        }
        uint64_t v12 = 0;
        while (1)
        {
          uint64_t v13 = v11 + v12;
          if (__OFADD__(v11, v12)) {
            break;
          }
          double v14 = (double)v12++;
          LOBYTE(a6) = v9[v13];
          if ((float)((float)((float)LODWORD(a6) / -255.0) + 1.0) <= 0.1) {
            *(float *)&a6 = 0.0;
          }
          else {
            *(float *)&a6 = 1.0;
          }
          unint64_t result = objc_msgSend(a5, sel_setHeight_atPoint_, a6, v14, (double)v10);
          if (a4 == v12) {
            goto LABEL_5;
          }
        }
        __break(1u);
        break;
      }
LABEL_5:
      if (++v10 == a3) {
        return result;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_249347E14(uint64_t a1)
{
  sub_249348910(a1, (uint64_t)v11);
  uint64_t v3 = v12;
  if (v12)
  {
    uint64_t v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    MEMORY[0x270FA5388](v4);
    double v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v5 + 16))(v7);
    double v8 = (void *)sub_24934E358();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  }
  else
  {
    double v8 = 0;
  }
  swift_beginAccess();
  objc_setAssociatedObject(v1, &unk_2696A0720, v8, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  return sub_249344B80(a1, &qword_2696A0728);
}

uint64_t sub_249347F8C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0778);
  uint64_t v2 = (void *)sub_24934E378();
  swift_beginAccess();
  id v3 = objc_getAssociatedObject(v2, &unk_2696A0721);
  swift_endAccess();
  swift_unknownObjectRelease();
  if (v3)
  {
    sub_24934E2C8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_24934746C((uint64_t)v11, (uint64_t)v12);
  if (v12[3])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0788);
    if (swift_dynamicCast()) {
      return v10;
    }
  }
  else
  {
    sub_249344B80((uint64_t)v12, &qword_2696A0738);
  }
  if (qword_2696A02F0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_249348980();
  uint64_t v6 = v5;
  v12[0] = v1;
  double v7 = (void *)sub_24934E378();
  v12[0] = v4;
  v12[1] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0780);
  double v8 = (void *)sub_24934E288();
  swift_beginAccess();
  objc_setAssociatedObject(v7, &unk_2696A0721, v8, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_249348174@<X0>(uint64_t a1@<X8>)
{
  if (!sub_2493483DC()) {
    goto LABEL_4;
  }
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = sub_24934E298();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v16[-1] - v5;
  sub_249349854((uint64_t)&v16[-1] - v5);
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_4:
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v21 = 0;
LABEL_5:
    uint64_t v8 = MEMORY[0x263F1BA00];
    *(void *)(a1 + 24) = MEMORY[0x263F1BA08];
    *(void *)(a1 + 32) = v8;
    return sub_249344B80((uint64_t)&v19, &qword_2696A0758);
  }
  uint64_t v17 = AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 32))(boxed_opaque_existential_1, v6, AssociatedTypeWitness);
  uint64_t v11 = v17;
  uint64_t v12 = AssociatedConformanceWitness;
  uint64_t v13 = __swift_project_boxed_opaque_existential_1(v16, v17);
  *((void *)&v20 + 1) = v11;
  uint64_t v21 = *(void *)(v12 + 8);
  double v14 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v14, v13, v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
  if (!*((void *)&v20 + 1)) {
    goto LABEL_5;
  }
  return sub_24934736C(&v19, a1);
}

uint64_t sub_2493483DC()
{
  swift_getObjectType();
  uint64_t v6 = v0;
  sub_249348824(0, &qword_2696A0760);
  id v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0768);
  if (swift_dynamicCast())
  {
    sub_24934736C(v4, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    uint64_t v2 = sub_2493499F0();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  }
  else
  {
    uint64_t v5 = 0;
    memset(v4, 0, sizeof(v4));
    sub_249344B80((uint64_t)v4, &qword_2696A0770);
    return sub_249347F8C();
  }
  return v2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_249348558(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_249348634;
  return v6(a1);
}

uint64_t sub_249348634()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_24934872C()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_249348764(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_24934762C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2696A0790 + dword_2696A0790);
  return v6(a1, v4);
}

void sub_24934881C(uint64_t a1, unint64_t a2)
{
  sub_249347720(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_249348824(uint64_t a1, unint64_t *a2)
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

uint64_t sub_249348860(uint64_t a1, unint64_t a2)
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

uint64_t sub_2493488B8(uint64_t a1, unint64_t a2)
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

uint64_t sub_249348910(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249348980()
{
  uint64_t v1 = (uint64_t *)(v0 + 16);
  while (1)
  {
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v3 = NSStringFromClass(ObjCClassFromMetadata);
    uint64_t v4 = sub_24934E1B8();
    uint64_t v6 = v5;

    swift_beginAccess();
    uint64_t v7 = *v1;
    if (*(void *)(*v1 + 16))
    {
      unint64_t v8 = sub_249348E3C(v4, v6);
      if (v9) {
        break;
      }
    }
    swift_bridgeObjectRelease();
    swift_endAccess();
    if (![(objc_class *)ObjCClassFromMetadata superclass]) {
      return 0;
    }
    swift_getObjCClassMetadata();
  }
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 16 * v8);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_249348A6C()
{
  type metadata accessor for PlatformStyleRegistry();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_249348AAC();
  *(void *)(v0 + 16) = result;
  qword_2696A1870 = v0;
  return result;
}

uint64_t sub_249348AAC()
{
  uint64_t v0 = (void *)sub_249348CC0(MEMORY[0x263F8EE78]);
  long long v23 = xmmword_24934F020;
  uint64_t v24 = &type metadata for BaseStyle;
  unint64_t v25 = sub_249344194();
  uint64_t v26 = &type metadata for BrailleProgressIndicatorStyle;
  unint64_t v27 = sub_249348F98();
  double v28 = &type metadata for BrailleSliderStyle;
  unint64_t v29 = sub_249348FEC();
  uint64_t v1 = 32;
  while (1)
  {
    long long v21 = *(_OWORD *)&v22[v1];
    sub_249349934();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    uint64_t v3 = NSStringFromClass(ObjCClassFromMetadata);
    uint64_t v4 = sub_24934E1B8();
    uint64_t v6 = v5;

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v9 = sub_249348E3C(v4, v6);
    uint64_t v10 = v0[2];
    BOOL v11 = (v8 & 1) == 0;
    uint64_t v12 = v10 + v11;
    if (__OFADD__(v10, v11)) {
      break;
    }
    char v13 = v8;
    if (v0[3] >= v12)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        if (v8) {
          goto LABEL_2;
        }
      }
      else
      {
        sub_249349320();
        if (v13) {
          goto LABEL_2;
        }
      }
    }
    else
    {
      sub_249349040(v12, isUniquelyReferenced_nonNull_native);
      unint64_t v14 = sub_249348E3C(v4, v6);
      if ((v13 & 1) != (v15 & 1)) {
        goto LABEL_18;
      }
      unint64_t v9 = v14;
      if (v13)
      {
LABEL_2:
        *(_OWORD *)(v0[7] + 16 * v9) = v21;
        goto LABEL_3;
      }
    }
    v0[(v9 >> 6) + 8] |= 1 << v9;
    int v16 = (uint64_t *)(v0[6] + 16 * v9);
    uint64_t *v16 = v4;
    v16[1] = v6;
    *(_OWORD *)(v0[7] + 16 * v9) = v21;
    uint64_t v17 = v0[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_17;
    }
    v0[2] = v19;
    swift_bridgeObjectRetain();
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v1 += 16;
    if (v1 == 80) {
      return (uint64_t)v0;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  uint64_t result = sub_24934E388();
  __break(1u);
  return result;
}

unint64_t sub_249348CC0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A07B8);
  uint64_t v2 = (void *)sub_24934E328();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_249348E3C(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v9 = (uint64_t *)(v2[6] + 16 * result);
    *unint64_t v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
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

uint64_t sub_249348DE0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for PlatformStyleRegistry()
{
  return self;
}

unint64_t sub_249348E3C(uint64_t a1, uint64_t a2)
{
  sub_24934E398();
  sub_24934E1D8();
  uint64_t v4 = sub_24934E3B8();

  return sub_249348EB4(a1, a2, v4);
}

unint64_t sub_249348EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24934E368() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        long long v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24934E368() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_249348F98()
{
  unint64_t result = qword_2696A07A8;
  if (!qword_2696A07A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A07A8);
  }
  return result;
}

unint64_t sub_249348FEC()
{
  unint64_t result = qword_2696A07B0;
  if (!qword_2696A07B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A07B0);
  }
  return result;
}

uint64_t sub_249349040(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A07B8);
  char v36 = a2;
  uint64_t v6 = sub_24934E318();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v23 = v22 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1)) {
          goto LABEL_38;
        }
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v2;
          if (v36)
          {
            uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
            if (v35 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *uint64_t v9 = -1 << v35;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v25 = v9[v15];
        if (!v25)
        {
          int64_t v26 = v15 + 1;
          if (v15 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v25 = v9[v26];
          if (!v25)
          {
            while (1)
            {
              int64_t v15 = v26 + 1;
              if (__OFADD__(v26, 1)) {
                break;
              }
              if (v15 >= v12) {
                goto LABEL_31;
              }
              unint64_t v25 = v9[v15];
              ++v26;
              if (v25) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        unint64_t v11 = (v25 - 1) & v25;
        unint64_t v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      uint64_t v27 = 16 * v23;
      double v28 = (uint64_t *)(*(void *)(v5 + 48) + v27);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      long long v37 = *(_OWORD *)(*(void *)(v5 + 56) + v27);
      if ((v36 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_24934E398();
      sub_24934E1D8();
      uint64_t result = sub_24934E3B8();
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v33 = v18 == v32;
          if (v18 == v32) {
            unint64_t v18 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v13 + 8 * v18);
        }
        while (v34 == -1);
        unint64_t v19 = __clz(__rbit64(~v34)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = 16 * v19;
      long long v21 = (void *)(*(void *)(v7 + 48) + v20);
      *long long v21 = v30;
      v21[1] = v29;
      *(_OWORD *)(*(void *)(v7 + 56) + v20) = v37;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void *sub_249349320()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A07B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_24934E308();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    if (!v23) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    long long v21 = (void *)(*(void *)(v4 + 48) + v16);
    *long long v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t PrimitiveBrailleSymbologyStyle.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_24934DFE8();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, a1, v4);
}

void sub_249349524(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 1;
}

uint64_t static PrimitiveBrailleSymbologyStyle._makeConfiguration(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);

  return v3(a1, 1, 1, AssociatedTypeWitness);
}

uint64_t dispatch thunk of static PrimitiveBrailleSymbologyStyle._makeConfiguration(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t sub_2493495CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = a4;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)&AssociatedConformanceWitness - v7;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v9 = type metadata accessor for BaseStyleEnvironmentModifier();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  int64_t v13 = (char *)&AssociatedConformanceWitness - v12;
  uint64_t v14 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v16 = (char *)&AssociatedConformanceWitness - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a3 + 64))(a2, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v8, v20, AssociatedTypeWitness);
  sub_249345C38((uint64_t)v8, AssociatedTypeWitness, (uint64_t)v13);
  MEMORY[0x24C59B3B0](v13, a2, v9, *(void *)(a3 + 8));
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, a2);
}

uint64_t sub_249349854@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);

  return v4(a1, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_249349934()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_249349950@<X0>(uint64_t a1@<X8>)
{
  return static PrimitiveBrailleSymbologyStyle._makeConfiguration(_:)(a1);
}

uint64_t dispatch thunk of PrimitiveBrailleSymbologyStyle.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of BrailleSymbologyStyleProvider.accessibilityBrailleSymbologyStyleConfiguration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _BrailleView.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2493499A4()
{
  sub_24934DFE8();

  return swift_getWitnessTable();
}

uint64_t sub_2493499F0()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_249349A0C()
{
  return swift_initClassMetadata2();
}

CGColorSpaceRef sub_249349A68()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F00250]);
  qword_2696A07C0 = (uint64_t)result;
  return result;
}

uint64_t sub_249349A94(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0730);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24934E248();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_weakInit();
  sub_24934E228();
  swift_retain();
  uint64_t v9 = sub_24934E218();
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = MEMORY[0x263F8F500];
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v11;
  *(void *)(v10 + 32) = *(void *)(v2 + 80);
  *(_OWORD *)(v10 + 40) = *(_OWORD *)(v3 + 88);
  *(void *)(v10 + 56) = *(void *)(v2 + 104);
  *(void *)(v10 + 64) = v8;
  swift_release();
  sub_249346FE0((uint64_t)v6, (uint64_t)&unk_2696A0870, v10);
  return swift_release();
}

uint64_t sub_249349C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 72) = a4;
  sub_24934E228();
  *(void *)(v4 + 80) = sub_24934E218();
  uint64_t v6 = sub_24934E208();
  return MEMORY[0x270FA2498](sub_249349CE4, v6, v5);
}

uint64_t sub_249349CE4()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = MEMORY[0x24C59BDD0](Strong + 16);
    swift_release();
    if (v2)
    {
      v0[5] = swift_getObjectType();
      v0[2] = v2;
      UIAccessibilityPostNotification(0, 0);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
    }
  }
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_249349DB0()
{
  if (*(void *)(v0 + 48))
  {
    swift_retain();
    sub_24934DD98();
    swift_release();
  }
  sub_24934AFB8(v0 + 16);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_249349E10()
{
  sub_249349DB0();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for BrailleMapRenderer()
{
  return swift_getGenericMetadata();
}

uint64_t sub_249349E5C()
{
  return swift_release();
}

void sub_249349EC0(void (*a1)(void), double a2, double a3, double a4, double a5, uint64_t a6, uint64_t a7, void (*a8)(void))
{
  if (a2 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (a2 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (a3 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (a3 >= 9.22337204e18)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (a4 <= -9.22337204e18)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if (a4 >= 9.22337204e18)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if ((*(void *)&a2 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a3 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a4 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(void *)&a5 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_35;
  }
  if (a5 <= -9.22337204e18)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  if (a5 >= 9.22337204e18)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    swift_once();
    goto LABEL_18;
  }
  size_t v10 = (uint64_t)a2;
  if ((uint64_t)a2 < 1) {
    return;
  }
  size_t v11 = (uint64_t)a3;
  if ((uint64_t)a3 < 1 || (uint64_t)a4 < 1 || (uint64_t)a5 < 1) {
    return;
  }
  uint64_t v8 = a8;
  uint64_t v9 = a1;
  if (qword_2696A02F8 != -1) {
    goto LABEL_38;
  }
LABEL_18:
  if (qword_2696A07C0)
  {
    uint64_t v12 = (CGColorSpace *)(id)qword_2696A07C0;
    CGContextRef v13 = CGBitmapContextCreate(0, v10, v11, 8uLL, v10, v12, 0);
    if (v13)
    {
      context = v13;
      v9();
      Data = CGBitmapContextGetData(context);
      if (Data)
      {
        uint64_t v15 = Data;
        int64_t Width = CGBitmapContextGetWidth(context);
        int64_t Height = CGBitmapContextGetHeight(context);
        if ((unsigned __int128)(Width * (__int128)Height) >> 64 != (Width * Height) >> 63)
        {
          __break(1u);
          return;
        }
        uint64_t v18 = sub_24934AF04(v15, Width * Height);
        unint64_t v20 = v19;
        v8();
        sub_2493488B8(v18, v20);
      }

      uint64_t v21 = context;
    }
    else
    {
      uint64_t v21 = v12;
    }
  }
}

uint64_t sub_24934A148()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v3 = *(void *)(*(void *)v0 + 96);
  uint64_t v4 = *(void *)(*(void *)v0 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = sub_24934E298();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  size_t v10 = (char *)v16 - v9;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v8);
  CGContextRef v13 = (char *)v16 - v12;
  uint64_t result = MEMORY[0x24C59BDD0](v2);
  if (result)
  {
    uint64_t v15 = *(void *)(v1 + 24);
    v16[2] = result;
    uint64_t v16[3] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0848);
    swift_getAssociatedTypeWitness();
    uint64_t result = swift_dynamicCast();
    if (result)
    {
      (*(void (**)(void, uint64_t, uint64_t))(v3 + 56))(v16[1], v4, v3);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, AssociatedTypeWitness) == 1)
      {
        swift_unknownObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, AssociatedTypeWitness);
        swift_retain();
        sub_249345D64((uint64_t)v13);
        swift_release();
        swift_unknownObjectRelease();
        return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, AssociatedTypeWitness);
      }
    }
  }
  return result;
}

uint64_t sub_24934A3F4()
{
  return sub_24934A148();
}

uint64_t sub_24934A418()
{
  return sub_249349E5C();
}

void sub_24934A43C(void (*a1)(void), uint64_t a2, double a3, double a4)
{
  sub_249349EC0(a1, a3, a4, *(double *)(v4 + 16), *(double *)(v4 + 24), a2, *(void *)(v4 + 32), *(void (**)(void))(v4 + 40));
}

uint64_t sub_24934A44C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void *a6@<X8>)
{
  uint64_t v44 = a4;
  uint64_t v46 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_24934E298();
  uint64_t v43 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v38 - v13;
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v12);
  unint64_t v17 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  unint64_t v19 = (char *)&v38 - v18;
  uint64_t v47 = a1;
  swift_getAssociatedTypeWitness();
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
  {
    uint64_t v39 = (uint64_t *)v11;
    uint64_t v40 = v17;
    uint64_t v41 = a1;
    uint64_t v42 = v19;
    uint64_t v20 = v45;
    uint64_t v21 = v51;
    if (v51)
    {
      uint64_t v22 = a3;
      unint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(a5 + 56);
      uint64_t v24 = swift_unknownObjectRetain();
      v23(v24, a3, a5);
      uint64_t v25 = v20;
      uint64_t v26 = AssociatedTypeWitness;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v14, 1, AssociatedTypeWitness) != 1)
      {
        uint64_t v29 = v42;
        (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v42, v14, v26);
        uint64_t v47 = v22;
        uint64_t v48 = MEMORY[0x263F1B720];
        uint64_t v49 = a5;
        uint64_t v50 = MEMORY[0x263F1B718];
        uint64_t v30 = type metadata accessor for BrailleMapRenderer();
        char v31 = *(uint64_t (**)(char *, char *, uint64_t))(v25 + 16);
        uint64_t v43 = v21;
        uint64_t v32 = (uint64_t)v40;
        uint64_t v33 = v31(v40, v29, v26);
        uint64_t v39 = &v38;
        MEMORY[0x270FA5388](v33);
        *(&v38 - 6) = a2;
        *(&v38 - 5) = v22;
        uint64_t v34 = v44;
        *(&v38 - 4) = v44;
        *(&v38 - 3) = a5;
        *(&v38 - 2) = v41;
        swift_allocObject();
        uint64_t v35 = sub_24934AACC(v32, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24934AFE0);
        char v36 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
        v36(v32, v26);
        v35[3] = v34;
        swift_unknownObjectWeakAssign();
        long long v37 = v46;
        v46[3] = v30;
        v37[4] = &off_26FCFBE08;
        swift_unknownObjectRelease();
        *long long v37 = v35;
        v36((uint64_t)v42, v26);
        return swift_unknownObjectRelease();
      }
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t *))(v43 + 8))(v14, v39);
    }
  }
  else
  {
    uint64_t v51 = 0;
  }
  uint64_t v27 = v46;
  v46[4] = 0;
  *uint64_t v27 = 0u;
  v27[1] = 0u;
  return swift_unknownObjectRelease();
}

uint64_t sub_24934A824@<X0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a2 + 8))(v10, a1, a2);
  uint64_t v4 = __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  MEMORY[0x270FA5388](v4);
  (*(void (**)(char *))(v6 + 16))((char *)&v10[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_24934E148();
  uint64_t result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  *a3 = v7;
  return result;
}

uint64_t sub_24934A930(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_24934A950(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_24934A950(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0850);
    size_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    size_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    memcpy(v12, v13, 24 * v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_24934E338();
  __break(1u);
  return result;
}

void *sub_24934AACC(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(*v3 + 88);
  uint64_t v7 = *(void *)(*v3 + 96);
  uint64_t v8 = *(void *)(*v3 + 104);
  v16[0] = *(void *)(*v3 + 80);
  v16[1] = v6;
  v16[2] = v7;
  uint64_t v16[3] = v8;
  uint64_t v9 = type metadata accessor for RootView();
  MEMORY[0x270FA5388](v9);
  size_t v11 = (char *)v16 - v10;
  v3[3] = 0;
  swift_unknownObjectWeakInit();
  v3[6] = 0;
  type metadata accessor for StyleProvider();
  v3[4] = sub_249346078(a1);
  swift_getWitnessTable();
  sub_24934DEF8();
  uint64_t v12 = swift_retain();
  sub_24934B254(v12, a2, v6, v8, (uint64_t)v11);
  v3[5] = sub_24934DEE8();
  swift_retain();
  uint64_t v13 = sub_24934DEC8();
  swift_release();
  v16[0] = v13;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0858);
  sub_24934AFF8();
  uint64_t v14 = sub_24934DE08();
  swift_release();
  swift_release();
  v3[6] = v14;
  swift_release();
  return v3;
}

uint64_t sub_24934ACE8()
{
  uint64_t v0 = (void *)_AXSVoiceOverTouchActive2DBrailleDisplays();
  uint64_t v1 = MEMORY[0x263F8EE78];
  if (v0)
  {
    id v2 = v0;
    sub_24934E1F8();
  }
  return v1;
}

uint64_t sub_24934AE40(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_24934AF04(unsigned char *__src, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 <= 14) {
    return sub_24934AE40(__src, &__src[a2]);
  }
  sub_24934DD28();
  swift_allocObject();
  sub_24934DCE8();
  if ((unint64_t)a2 < 0x7FFFFFFF) {
    return a2 << 32;
  }
  sub_24934DD38();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_24934AFB8(uint64_t a1)
{
  return a1;
}

uint64_t sub_24934AFE0@<X0>(uint64_t *a1@<X8>)
{
  return sub_24934A824(*(void *)(v1 + 16), *(void *)(v1 + 32), a1);
}

uint64_t sub_24934AFF0(uint64_t a1)
{
  return sub_249349A94(a1, v1);
}

unint64_t sub_24934AFF8()
{
  unint64_t result = qword_2696A0860;
  if (!qword_2696A0860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_2696A0860);
  }
  return result;
}

uint64_t sub_24934B054()
{
  swift_weakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24934B08C()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_24934B0CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_24934762C;
  return sub_249349C4C(a1, v4, v5, v6);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for BrailleDisplay(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BrailleDisplay(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BrailleDisplay()
{
  return &type metadata for BrailleDisplay;
}

uint64_t sub_24934B21C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, a1, a2);
}

uint64_t sub_24934B254@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = a3;
  v10[3] = a4;
  void v10[4] = a1;
  type metadata accessor for StyleProvider();
  swift_retain();
  swift_getWitnessTable();
  *(void *)a5 = sub_24934DE28();
  *(void *)(a5 + 8) = v11;
  *(unsigned char *)(a5 + 16) = v12 & 1;
  uint64_t v13 = type metadata accessor for RootView();
  a2(v13, v14, v15, v16);
  return swift_release();
}

uint64_t sub_24934B390()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = *((unsigned __int8 *)v0 + 16);
  uint64_t v4 = type metadata accessor for StyleProvider();
  uint64_t WitnessTable = swift_getWitnessTable();

  return MEMORY[0x270EFF108](v1, v2, v3, v4, WitnessTable);
}

uint64_t sub_24934B410@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  v73 = a2;
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[2];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v69 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  long long v65 = (char *)&v52 - v6;
  uint64_t v74 = v3;
  swift_getAssociatedConformanceWitness();
  uint64_t v70 = AssociatedTypeWitness;
  uint64_t v71 = type metadata accessor for BaseStyleEnvironmentModifier();
  uint64_t v7 = sub_24934DF58();
  uint64_t v66 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v64 = (uint64_t)&v52 - v8;
  uint64_t v9 = a1[3];
  v67 = a1;
  uint64_t v10 = a1[5];
  uint64_t v11 = sub_24934E138();
  uint64_t v54 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v52 - v12;
  uint64_t v14 = sub_24934DF58();
  uint64_t v55 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v52 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0920);
  uint64_t v17 = sub_24934DF58();
  uint64_t v57 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v56 = (char *)&v52 - v18;
  uint64_t v53 = v19;
  uint64_t v72 = v7;
  uint64_t v20 = sub_24934DF58();
  uint64_t v61 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v58 = (char *)&v52 - v21;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0928);
  uint64_t v62 = v20;
  uint64_t v52 = sub_24934DF58();
  uint64_t v63 = *(void *)(v52 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](v52);
  uint64_t v59 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v60 = (char *)&v52 - v24;
  uint64_t v25 = (void *)sub_24934ACE8();
  if (v25[2])
  {
    uint64_t v26 = v25[4];
    uint64_t v27 = v25[5];
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v26 = 0;
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_24934DFD8();
  MEMORY[0x270FA5388](v28);
  *(&v52 - 6) = v4;
  *(&v52 - 5) = v9;
  *(&v52 - 4) = v74;
  *(&v52 - 3) = v10;
  *(&v52 - 2) = v68;
  sub_24934E128();
  sub_24934E168();
  uint64_t WitnessTable = swift_getWitnessTable();
  sub_24934E0A8();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v11);
  uint64_t v81 = sub_24934E0D8();
  sub_24934E028();
  uint64_t v85 = WitnessTable;
  uint64_t v86 = MEMORY[0x263F18860];
  uint64_t v30 = swift_getWitnessTable();
  char v31 = v56;
  sub_24934E068();
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v14);
  sub_24934B390();
  sub_24934B390();
  uint64_t v32 = (uint64_t)v65;
  sub_249345154();
  swift_release();
  uint64_t v33 = v64;
  sub_249345210(v32, v64);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v32, v70);
  uint64_t v34 = sub_249344EF4(&qword_2696A0930, &qword_2696A0920);
  uint64_t v83 = v30;
  uint64_t v84 = v34;
  uint64_t v35 = v53;
  uint64_t v36 = swift_getWitnessTable();
  long long v37 = v58;
  uint64_t v38 = v72;
  MEMORY[0x24C59B5D0](v33, v35, v72, v36);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v33, v38);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v31, v35);
  swift_getKeyPath();
  uint64_t v81 = v26;
  uint64_t v82 = v27;
  uint64_t v39 = *(void *)(v74 + 8);
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v79 = v39;
  uint64_t v80 = v40;
  uint64_t v41 = swift_getWitnessTable();
  uint64_t v77 = v36;
  uint64_t v78 = v41;
  uint64_t v42 = v62;
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v44 = v59;
  sub_24934E078();
  swift_release();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v37, v42);
  uint64_t v45 = sub_249344EF4(&qword_2696A0938, &qword_2696A0928);
  uint64_t v75 = v43;
  uint64_t v76 = v45;
  uint64_t v46 = v52;
  swift_getWitnessTable();
  uint64_t v47 = v63;
  uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  uint64_t v49 = v60;
  v48(v60, v44, v46);
  uint64_t v50 = *(void (**)(char *, uint64_t))(v47 + 8);
  v50(v44, v46);
  v48(v73, v49, v46);
  return ((uint64_t (*)(char *, uint64_t))v50)(v49, v46);
}

uint64_t sub_24934BCFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char *a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = v9;
  v16[1] = v10;
  v16[2] = v11;
  uint64_t v16[3] = v12;
  uint64_t v13 = a1 + *(int *)(type metadata accessor for RootView() + 52);
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14(v8, v13, a2);
  v14(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_24934BE1C@<X0>(uint64_t a1@<X8>)
{
  sub_2493434AC((uint64_t)v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  swift_dynamicCast();
  sub_24934D89C((uint64_t)v5);
  v6[0] = swift_getKeyPath();
  char v7 = 0;
  uint64_t KeyPath = swift_getKeyPath();
  sub_2493434AC((uint64_t)v5);
  swift_dynamicCast();
  sub_24934736C(&v4, (uint64_t)v5);
  sub_249344B1C((uint64_t)v5, a1 + 56, &qword_2696A03B8);
  *(void *)(a1 + 48) = KeyPath;
  sub_249344B1C((uint64_t)v6, a1, &qword_2696A0980);
  sub_249344B80((uint64_t)v5, &qword_2696A03B8);
  return sub_249344B80((uint64_t)v6, &qword_2696A0980);
}

uint64_t sub_24934BF38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_24934DD78();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24934DD68();
  sub_2493434AC((uint64_t)v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  swift_dynamicCast();
  id v6 = v15;
  id v7 = objc_msgSend(v15, sel_dictionaryRepresentation);

  sub_24934E198();
  id v8 = objc_allocWithZone(MEMORY[0x263F214E8]);
  uint64_t v9 = (void *)sub_24934E188();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithDictionary_, v9);

  sub_24934DD58();
  swift_allocObject();
  uint64_t v10 = sub_24934DD48();
  sub_24934DBE0(&qword_2696A09B8, MEMORY[0x263F22168]);
  uint64_t v11 = sub_24934DDA8();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v3 + 16))(a1, v5, v2);
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A09C0) + 36));
  uint64_t *v12 = v11;
  v12[1] = v10;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24934C19C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0940);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2493434AC((uint64_t)v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  swift_dynamicCast();
  v17[2] = v19[10];
  char v18 = 0;
  sub_2493434AC((uint64_t)v19);
  swift_dynamicCast();
  v19[0] = v19[11];
  sub_24934D3CC();
  sub_24934DE58();
  char v6 = sub_24934E028();
  sub_24934DE18();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v5, v2);
  uint64_t v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2696A0950) + 36);
  *(unsigned char *)uint64_t v15 = v6;
  *(void *)(v15 + 8) = v8;
  *(void *)(v15 + 16) = v10;
  *(void *)(v15 + 24) = v12;
  *(void *)(v15 + 32) = v14;
  *(unsigned char *)(v15 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24934C374()
{
  sub_2493434AC((uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  swift_dynamicCast();
  v3[0] = v3[10];
  sub_24934E158();
  sub_2493434AC((uint64_t)v3);
  swift_dynamicCast();
  sub_2493434AC((uint64_t)v3);
  uint64_t result = swift_dynamicCast();
  if (v1 > v2)
  {
    __break(1u);
  }
  else
  {
    *(float *)uint64_t v3 = v1;
    *(float *)&v3[1] = v2;
    sub_24934D3CC();
    return sub_24934E118();
  }
  return result;
}

uint64_t sub_24934C4A4()
{
  return sub_24934E098();
}

uint64_t BrailleBootScreenView.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

uint64_t BrailleBootScreenView.body.getter@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_24934DFD8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0878);
  return sub_24934C558(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_24934C558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0940);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = sub_24934E0F8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24934E0E8();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, *MEMORY[0x263F1B4B8], v10);
  uint64_t v14 = sub_24934E108();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v15 = sub_24934E0C8();
  sub_2493434AC((uint64_t)&v22);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2696A03B8);
  swift_dynamicCast();
  char v23 = 0;
  int v21 = 1065353216;
  int v22 = v24;
  sub_24934D3CC();
  sub_24934DE58();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v16(v7, v9, v3);
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0958);
  v16((char *)(a2 + *(int *)(v17 + 48)), v7, v3);
  char v18 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_retain();
  swift_retain();
  v18(v9, v3);
  v18(v7, v3);
  swift_release();
  return swift_release();
}

uint64_t sub_24934C850@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 40) = 0;
  return result;
}

unint64_t sub_24934C890(uint64_t a1)
{
  unint64_t result = sub_24934C8B8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24934C8B8()
{
  unint64_t result = qword_2696A0880;
  if (!qword_2696A0880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0880);
  }
  return result;
}

uint64_t sub_24934C90C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24934C928@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_24934DFD8();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696A0878);
  return sub_24934C558(v1, a1 + *(int *)(v3 + 44));
}

ValueMetadata *type metadata accessor for BrailleBootScreenView()
{
  return &type metadata for BrailleBootScreenView;
}

uint64_t sub_24934C998()
{
  return sub_249344EF4(&qword_2696A0888, qword_2696A0890);
}

uint64_t sub_24934C9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

uint64_t sub_24934C9DC()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24934CA78(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 24);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  if (v7 > 7
    || (*(_DWORD *)(v6 + 80) & 0x100000) != 0
    || ((v7 + 17) & (unint64_t)~v7) + *(void *)(v6 + 64) > 0x18)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = v10 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16));
    swift_retain();
  }
  else
  {
    uint64_t v11 = *a2;
    uint64_t v12 = a2[1];
    char v13 = *((unsigned char *)a2 + 16);
    sub_24934CBA4();
    *(void *)a1 = v11;
    *(void *)(a1 + 8) = v12;
    *(unsigned char *)(a1 + 16) = v13;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v6 + 16))((a1 + v7 + 17) & ~v7, ((unint64_t)a2 + v7 + 17) & ~v7, v5);
  }
  return a1;
}

uint64_t sub_24934CBA4()
{
  return swift_retain();
}

uint64_t sub_24934CBAC(uint64_t a1, uint64_t a2)
{
  sub_24934CC28();
  uint64_t v4 = *(void *)(*(void *)(a2 + 24) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

uint64_t sub_24934CC28()
{
  return swift_release();
}

uint64_t sub_24934CC30(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_24934CBA4();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 16))((*(unsigned __int8 *)(v9 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v9 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_24934CCD0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_24934CBA4();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_24934CC28();
  uint64_t v9 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v9 + 24))((*(unsigned __int8 *)(v9 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v9 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
  return a1;
}

uint64_t sub_24934CD7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 17 + a2) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_24934CDF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_24934CC28();
  uint64_t v7 = *(void *)(*(void *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))((*(unsigned __int8 *)(v7 + 80) + 17 + a1) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), (*(unsigned __int8 *)(v7 + 80) + 17 + a2) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_24934CE8C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 24) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0xFE) {
    unsigned int v7 = 254;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 17) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if (v5 > 0xFE) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 17) & ~v6);
      }
      unsigned int v15 = *((unsigned __int8 *)a1 + 16);
      if (v15 > 1) {
        return (v15 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_24934D02C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 24) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE) {
    unsigned int v8 = 254;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 17) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x24934D298);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v7 > 0xFE)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 17] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if (a2 > 0xFE)
        {
          a1[16] = 0;
          *(void *)a1 = a2 - 255;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          a1[16] = -(char)a2;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for RootView()
{
  return swift_getGenericMetadata();
}

unint64_t sub_24934D2D8(uint64_t a1)
{
  unint64_t result = sub_24934D300();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24934D300()
{
  unint64_t result = qword_2696A0918;
  if (!qword_2696A0918)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0918);
  }
  return result;
}

uint64_t sub_24934D354()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24934D370()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24934D3B4@<X0>(char *a1@<X8>)
{
  return sub_24934BCFC(*(void *)(v1 + 48), *(void *)(v1 + 24), a1);
}

unint64_t sub_24934D3CC()
{
  unint64_t result = qword_2696A0948;
  if (!qword_2696A0948)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0948);
  }
  return result;
}

uint64_t sub_24934D420()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_24934D458()
{
  return swift_retain();
}

ValueMetadata *type metadata accessor for BrailleProgressView()
{
  return &type metadata for BrailleProgressView;
}

uint64_t sub_24934D470()
{
  return swift_getWitnessTable();
}

unint64_t sub_24934D6CC()
{
  unint64_t result = qword_2696A0960;
  if (!qword_2696A0960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0950);
    sub_249344EF4(&qword_2696A0968, &qword_2696A0940);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0960);
  }
  return result;
}

unint64_t sub_24934D76C(uint64_t a1)
{
  unint64_t result = sub_24934D794();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24934D794()
{
  unint64_t result = qword_2696A0970;
  if (!qword_2696A0970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0970);
  }
  return result;
}

uint64_t sub_24934D7E8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24934D804(uint64_t a1)
{
  unint64_t result = sub_24934D82C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24934D82C()
{
  unint64_t result = qword_2696A0978;
  if (!qword_2696A0978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0978);
  }
  return result;
}

uint64_t sub_24934D880()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24934D89C(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for BrailleChartView()
{
  return &type metadata for BrailleChartView;
}

ValueMetadata *type metadata accessor for BrailleBaseView()
{
  return &type metadata for BrailleBaseView;
}

ValueMetadata *type metadata accessor for BrailleSliderView()
{
  return &type metadata for BrailleSliderView;
}

unint64_t sub_24934D924()
{
  unint64_t result = qword_2696A0988;
  if (!qword_2696A0988)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0990);
    sub_24934D9C4();
    sub_249344EF4((unint64_t *)&qword_2696A0710, &qword_2696A0708);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0988);
  }
  return result;
}

unint64_t sub_24934D9C4()
{
  unint64_t result = qword_2696A0998;
  if (!qword_2696A0998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A0980);
    sub_24934DA38();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A0998);
  }
  return result;
}

unint64_t sub_24934DA38()
{
  unint64_t result = qword_2696A09A0;
  if (!qword_2696A09A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A09A0);
  }
  return result;
}

uint64_t sub_24934DA8C()
{
  return sub_249344EF4(&qword_2696A09A8, &qword_2696A09B0);
}

uint64_t sub_24934DAC8()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24934DAE4(uint64_t a1)
{
  unint64_t result = sub_24934DA38();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24934DB10()
{
  unint64_t result = qword_2696A09C8;
  if (!qword_2696A09C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2696A09C0);
    sub_24934DBE0(&qword_2696A09D0, MEMORY[0x263F22178]);
    sub_249344EF4(&qword_2696A09D8, (uint64_t *)&unk_2696A09E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2696A09C8);
  }
  return result;
}

uint64_t sub_24934DBE0(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_24934DC34@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result = objc_msgSend(a1, sel_progress);
  *(void *)a2 = v4 | 0x3F80000000000000;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

id sub_24934DC70@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  objc_msgSend(a1, sel_value);
  unsigned int v5 = v4;
  objc_msgSend(a1, sel_minimumValue);
  unsigned int v7 = v6;
  id result = objc_msgSend(a1, sel_maximumValue);
  *(void *)a2 = v5 | ((unint64_t)v7 << 32);
  *(_DWORD *)(a2 + 8) = v9;
  *(unsigned char *)(a2 + 12) = 0;
  return result;
}

uint64_t sub_24934DCE8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_24934DCF8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_24934DD08()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_24934DD18()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_24934DD28()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_24934DD38()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_24934DD48()
{
  return MEMORY[0x270F09CF0]();
}

uint64_t sub_24934DD58()
{
  return MEMORY[0x270F09CF8]();
}

uint64_t sub_24934DD68()
{
  return MEMORY[0x270F09D00]();
}

uint64_t sub_24934DD78()
{
  return MEMORY[0x270F09D08]();
}

uint64_t sub_24934DD88()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_24934DD98()
{
  return MEMORY[0x270EE3BA8]();
}

uint64_t sub_24934DDA8()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_24934DDB8()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_24934DDC8()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_24934DDD8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_24934DDE8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_24934DDF8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_24934DE08()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_24934DE18()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_24934DE28()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_24934DE48()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_24934DE58()
{
  return MEMORY[0x270EFF390]();
}

uint64_t sub_24934DE68()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_24934DE78()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_24934DE88()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_24934DE98()
{
  return MEMORY[0x270EFF540]();
}

uint64_t sub_24934DEA8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_24934DEB8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_24934DEC8()
{
  return MEMORY[0x270EFF720]();
}

uint64_t sub_24934DED8()
{
  return MEMORY[0x270EFF730]();
}

uint64_t sub_24934DEE8()
{
  return MEMORY[0x270EFF738]();
}

uint64_t sub_24934DEF8()
{
  return MEMORY[0x270EFF758]();
}

uint64_t sub_24934DF08()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_24934DF38()
{
  return MEMORY[0x270EFFE90]();
}

uint64_t sub_24934DF48()
{
  return MEMORY[0x270EFFEA8]();
}

uint64_t sub_24934DF58()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_24934DF68()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_24934DF78()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_24934DF88()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_24934DF98()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_24934DFA8()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_24934DFB8()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_24934DFC8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_24934DFD8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_24934DFE8()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_24934DFF8()
{
  return MEMORY[0x270F02758]();
}

uint64_t sub_24934E008()
{
  return MEMORY[0x270F02770]();
}

uint64_t sub_24934E018()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_24934E028()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_24934E038()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_24934E048()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_24934E058()
{
  return MEMORY[0x270F032F0]();
}

uint64_t sub_24934E068()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_24934E078()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_24934E088()
{
  return MEMORY[0x270F03538]();
}

uint64_t sub_24934E098()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_24934E0A8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_24934E0B8()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_24934E0C8()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_24934E0D8()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_24934E0E8()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_24934E0F8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_24934E108()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_24934E118()
{
  return MEMORY[0x270F04A40]();
}

uint64_t sub_24934E128()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_24934E138()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_24934E148()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_24934E158()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_24934E168()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_24934E178()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_24934E188()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_24934E198()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_24934E1A8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24934E1B8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24934E1C8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24934E1D8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24934E1E8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24934E1F8()
{
  return MEMORY[0x270EF1BA8]();
}

uint64_t sub_24934E208()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24934E218()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_24934E228()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_24934E238()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24934E248()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24934E258()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24934E268()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_24934E278()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_24934E288()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_24934E298()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24934E2A8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24934E2B8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24934E2C8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_24934E2D8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24934E2E8()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24934E2F8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24934E308()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_24934E318()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_24934E328()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_24934E338()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24934E348()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24934E358()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_24934E368()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24934E378()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_24934E388()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_24934E398()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24934E3A8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24934E3B8()
{
  return MEMORY[0x270F9FC90]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGSize CGSizeFromString(NSString *string)
{
  MEMORY[0x270F82BB0](string);
  result.height = v2;
  result.width = v1;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXSVoiceOverTouchActive2DBrailleDisplays()
{
  return MEMORY[0x270F90B60]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x270FA0298]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}