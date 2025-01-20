uint64_t sub_20988DC8C(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20988DCDC()
{
  v2[0] = *(_OWORD *)(v0 + 48);
  v2[1] = *(_OWORD *)(v0 + 64);
  sub_20988DBF8((uint64_t)v2);
  sub_20988DBF8((uint64_t)v2);
  sub_2098BE368();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB0);
  sub_2098BF0F8();
  sub_20988DC48();
  sub_20988DC8C((uint64_t)v2);
  return swift_bridgeObjectRelease();
}

void (*sub_20988DDB0(void *a1))(void **a1, char a2)
{
  v3 = malloc(0xB8uLL);
  *a1 = v3;
  _OWORD *v3 = *(_OWORD *)(v1 + 48);
  v3[1] = *(_OWORD *)(v1 + 64);
  sub_20988DBF8((uint64_t)v3);
  sub_20988DBF8((uint64_t)v3);
  v3[2] = *v3;
  v3[3] = v3[1];
  *((void *)v3 + 22) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB0);
  MEMORY[0x210505230]();
  sub_20988DC48();
  return sub_20988DE84;
}

void sub_20988DE84(void **a1, char a2)
{
  v6 = *a1;
  if (a2)
  {
    uint64_t v2 = v6[16];
    uint64_t v3 = v6[17];
    sub_2098BE368();
    sub_20988DBF8((uint64_t)v6);
    *((_OWORD *)v6 + 4) = *(_OWORD *)v6;
    *((_OWORD *)v6 + 5) = *((_OWORD *)v6 + 1);
    v6[18] = v2;
    v6[19] = v3;
    sub_2098BF0F8();
    sub_20988DC48();
    sub_2097EBD24();
  }
  else
  {
    uint64_t v4 = v6[16];
    uint64_t v5 = v6[17];
    sub_20988DBF8((uint64_t)v6);
    *((_OWORD *)v6 + 6) = *(_OWORD *)v6;
    *((_OWORD *)v6 + 7) = *((_OWORD *)v6 + 1);
    v6[20] = v4;
    v6[21] = v5;
    sub_2098BF0F8();
    sub_20988DC48();
  }
  sub_20988DC8C((uint64_t)v6);
  free(v6);
}

uint64_t sub_20988DFB0()
{
  v3[0] = *(_OWORD *)(v0 + 48);
  v3[1] = *(_OWORD *)(v0 + 64);
  sub_20988DBF8((uint64_t)v3);
  sub_20988DBF8((uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB0);
  sub_2098BF108();
  sub_20988DC48();
  sub_20988DC8C((uint64_t)v3);
  return v2;
}

uint64_t sub_20988E070()
{
  uint64_t v5 = v0;
  v6[0] = *(_OWORD *)(v0 + 80);
  v6[1] = *(_OWORD *)(v0 + 96);
  sub_20988DBF8((uint64_t)v6);
  sub_20988DBF8((uint64_t)v6);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB8);
  MEMORY[0x210505230](&v4, v1);
  sub_20988DC48();
  uint64_t v3 = v4;
  sub_20988DC8C((uint64_t)v6);
  return v3;
}

uint64_t sub_20988E118()
{
  v2[0] = *(_OWORD *)(v0 + 80);
  v2[1] = *(_OWORD *)(v0 + 96);
  sub_20988DBF8((uint64_t)v2);
  sub_20988DBF8((uint64_t)v2);
  sub_2098BE368();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB8);
  sub_2098BF0F8();
  sub_20988DC48();
  sub_20988DC8C((uint64_t)v2);
  return swift_bridgeObjectRelease();
}

void (*sub_20988E1EC(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0xB8uLL);
  *a1 = v3;
  _OWORD *v3 = *(_OWORD *)(v1 + 80);
  v3[1] = *(_OWORD *)(v1 + 96);
  sub_20988DBF8((uint64_t)v3);
  sub_20988DBF8((uint64_t)v3);
  _OWORD v3[2] = *v3;
  v3[3] = v3[1];
  *((void *)v3 + 22) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB8);
  MEMORY[0x210505230]();
  sub_20988DC48();
  return sub_20988DE84;
}

uint64_t sub_20988E2C0()
{
  v3[0] = *(_OWORD *)(v0 + 80);
  v3[1] = *(_OWORD *)(v0 + 96);
  sub_20988DBF8((uint64_t)v3);
  sub_20988DBF8((uint64_t)v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCB8);
  sub_2098BF108();
  sub_20988DC48();
  sub_20988DC8C((uint64_t)v3);
  return v2;
}

uint64_t sub_20988E380()
{
  uint64_t v5 = v0;
  long long v6 = *(_OWORD *)(v0 + 112);
  char v7 = *(unsigned char *)(v0 + 128);
  sub_20985C6DC((uint64_t)&v6);
  sub_20985C6DC((uint64_t)&v6);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  MEMORY[0x210505230](&v4, v1);
  sub_2097FFA54();
  char v3 = v4;
  sub_20985C744((uint64_t)&v6);
  return v3 & 1;
}

uint64_t sub_20988E420()
{
  long long v2 = *(_OWORD *)(v0 + 112);
  char v3 = *(unsigned char *)(v0 + 128);
  sub_20985C6DC((uint64_t)&v2);
  sub_20985C6DC((uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  sub_2098BF0F8();
  sub_2097FFA54();
  return sub_20985C744((uint64_t)&v2);
}

void (*sub_20988E4E8(void *a1))(void **a1, char a2)
{
  char v3 = (char *)malloc(0x68uLL);
  *a1 = v3;
  *(_OWORD *)char v3 = *(_OWORD *)(v1 + 112);
  v3[16] = *(unsigned char *)(v1 + 128);
  sub_20985C6DC((uint64_t)v3);
  sub_20985C6DC((uint64_t)v3);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)v3;
  v3[40] = v3[16];
  *((void *)v3 + 12) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  MEMORY[0x210505230]();
  sub_2097FFA54();
  return sub_20988E5BC;
}

void sub_20988E5BC(void **a1, char a2)
{
  char v4 = (char *)*a1;
  if (a2)
  {
    char v2 = v4[17];
    sub_20985C6DC((uint64_t)v4);
    *((_OWORD *)v4 + 3) = *(_OWORD *)v4;
    v4[64] = v4[16];
    v4[18] = v2 & 1;
  }
  else
  {
    char v3 = v4[17];
    sub_20985C6DC((uint64_t)v4);
    *(_OWORD *)(v4 + 72) = *(_OWORD *)v4;
    v4[88] = v4[16];
    v4[19] = v3 & 1;
  }
  sub_2098BF0F8();
  sub_2097FFA54();
  sub_20985C744((uint64_t)v4);
  free(v4);
}

uint64_t sub_20988E6B8()
{
  long long v3 = *(_OWORD *)(v0 + 112);
  char v4 = *(unsigned char *)(v0 + 128);
  sub_20985C6DC((uint64_t)&v3);
  sub_20985C6DC((uint64_t)&v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  sub_2098BF108();
  sub_2097FFA54();
  sub_20985C744((uint64_t)&v3);
  return v2;
}

uint64_t sub_20988E770()
{
  uint64_t v5 = v0;
  long long v6 = *(_OWORD *)(v0 + 136);
  char v7 = *(unsigned char *)(v0 + 152);
  sub_20985C6DC((uint64_t)&v6);
  sub_20985C6DC((uint64_t)&v6);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  MEMORY[0x210505230](&v4, v1);
  sub_2097FFA54();
  char v3 = v4;
  sub_20985C744((uint64_t)&v6);
  return v3 & 1;
}

uint64_t sub_20988E810()
{
  long long v2 = *(_OWORD *)(v0 + 136);
  char v3 = *(unsigned char *)(v0 + 152);
  sub_20985C6DC((uint64_t)&v2);
  sub_20985C6DC((uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  sub_2098BF0F8();
  sub_2097FFA54();
  return sub_20985C744((uint64_t)&v2);
}

void (*sub_20988E8D8(void *a1))(void **a1, char a2)
{
  char v3 = (char *)malloc(0x68uLL);
  *a1 = v3;
  *(_OWORD *)char v3 = *(_OWORD *)(v1 + 136);
  v3[16] = *(unsigned char *)(v1 + 152);
  sub_20985C6DC((uint64_t)v3);
  sub_20985C6DC((uint64_t)v3);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)v3;
  v3[40] = v3[16];
  *((void *)v3 + 12) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  MEMORY[0x210505230]();
  sub_2097FFA54();
  return sub_20988E5BC;
}

uint64_t sub_20988E9AC()
{
  long long v3 = *(_OWORD *)(v0 + 136);
  char v4 = *(unsigned char *)(v0 + 152);
  sub_20985C6DC((uint64_t)&v3);
  sub_20985C6DC((uint64_t)&v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  sub_2098BF108();
  sub_2097FFA54();
  sub_20985C744((uint64_t)&v3);
  return v2;
}

uint64_t sub_20988EA64()
{
  return *(unsigned char *)(v0 + 153) & 1;
}

uint64_t sub_20988EA70(uint64_t result)
{
  *(unsigned char *)(v1 + 153) = result & 1;
  return result;
}

uint64_t (*sub_20988EA7C())(void)
{
  return nullsub_1;
}

uint64_t sub_20988EA9C()
{
  uint64_t v5 = v0;
  long long v6 = *(_OWORD *)(v0 + 160);
  char v7 = *(unsigned char *)(v0 + 176);
  sub_20985C6DC((uint64_t)&v6);
  sub_20985C6DC((uint64_t)&v6);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  MEMORY[0x210505230](&v4, v1);
  sub_2097FFA54();
  char v3 = v4;
  sub_20985C744((uint64_t)&v6);
  return v3 & 1;
}

uint64_t sub_20988EB3C()
{
  long long v2 = *(_OWORD *)(v0 + 160);
  char v3 = *(unsigned char *)(v0 + 176);
  sub_20985C6DC((uint64_t)&v2);
  sub_20985C6DC((uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  sub_2098BF0F8();
  sub_2097FFA54();
  return sub_20985C744((uint64_t)&v2);
}

void (*sub_20988EC04(void *a1))(void **a1, char a2)
{
  char v3 = (char *)malloc(0x68uLL);
  *a1 = v3;
  *(_OWORD *)char v3 = *(_OWORD *)(v1 + 160);
  v3[16] = *(unsigned char *)(v1 + 176);
  sub_20985C6DC((uint64_t)v3);
  sub_20985C6DC((uint64_t)v3);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)v3;
  v3[40] = v3[16];
  *((void *)v3 + 12) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  MEMORY[0x210505230]();
  sub_2097FFA54();
  return sub_20988E5BC;
}

uint64_t sub_20988ECD8()
{
  long long v3 = *(_OWORD *)(v0 + 160);
  char v4 = *(unsigned char *)(v0 + 176);
  sub_20985C6DC((uint64_t)&v3);
  sub_20985C6DC((uint64_t)&v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCC0);
  sub_2098BF108();
  sub_2097FFA54();
  sub_20985C744((uint64_t)&v3);
  return v2;
}

uint64_t sub_20988ED90()
{
  uint64_t v2 = *(void *)(v0 + 184);
  sub_20988EDC8(v2);
  return v2;
}

uint64_t sub_20988EDC8(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_20988EE04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v12 = a1;
  char v7 = sub_20988FF3C;
  v19 = 0;
  __src[0] = v20;
  __src[1] = (void *)200;
  memcpy(v20, v1, sizeof(v20));
  memcpy(__dst, v20, sizeof(__dst));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F01E8);
  unint64_t v5 = (*(void *)(*(void *)(v13 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (uint64_t)__src - v5;
  unint64_t v6 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)__src - v5);
  uint64_t v16 = (uint64_t)__src - v6;
  v19 = (char *)__src - v6;
  uint64_t v10 = sub_2098BE7A8();
  sub_20988FDE0((uint64_t)v1);
  v8 = &v17;
  v18 = v1;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F01F0);
  sub_20988FF44();
  sub_2098BF0B8();
  sub_20988FFC8(v11);
  unint64_t v14 = sub_209890D34();
  sub_2097E7FAC(v15, v13, v16);
  sub_209890DB8(v15);
  sub_209891160(v16, v15);
  sub_2097E7FAC(v15, v13, v12);
  sub_209890DB8(v15);
  return sub_209890DB8(v16);
}

uint64_t sub_20988EFBC@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v68 = a2;
  v69 = a1;
  uint64_t v74 = 0;
  v70 = sub_2098958D0;
  v71 = sub_2098957DC;
  v176 = 0;
  v175 = 0;
  v174 = 0;
  v173 = 0;
  v171 = 0;
  memset(v153, 0, sizeof(v153));
  __src = v177;
  size_t __n = 200;
  memcpy(v177, a1, sizeof(v177));
  memcpy(__dst, v177, sizeof(__dst));
  unint64_t v75 = (*(void *)(*(void *)(sub_2098BE1C8() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  v76 = (char *)&v16 - v75;
  uint64_t v3 = sub_2098BF348();
  unint64_t v77 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v3);
  v78 = (char *)&v16 - v77;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC68);
  uint64_t v80 = *(void *)(v79 - 8);
  uint64_t v81 = v79 - 8;
  unint64_t v82 = (*(void *)(v80 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v79);
  uint64_t v83 = (uint64_t)&v16 - v82;
  unint64_t v84 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v82);
  uint64_t v85 = (uint64_t)&v16 - v84;
  v176 = (char *)&v16 - v84;
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC70);
  unint64_t v87 = (*(void *)(*(void *)(v86 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v86);
  v88 = (char *)&v16 - v87;
  unint64_t v89 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v87);
  v90 = (char *)&v16 - v89;
  unint64_t v91 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v89);
  v92 = (char *)&v16 - v91;
  v175 = (char *)&v16 - v91;
  uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0248);
  unint64_t v94 = (*(void *)(*(void *)(v93 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v93);
  uint64_t v95 = (uint64_t)&v16 - v94;
  unint64_t v96 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v94);
  uint64_t v97 = (uint64_t)&v16 - v96;
  unint64_t v98 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v96);
  v99 = (uint64_t *)((char *)&v16 - v98);
  v174 = (char *)&v16 - v98;
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0290);
  unint64_t v101 = (*(void *)(*(void *)(v100 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v100);
  v102 = (char *)&v16 - v101;
  unint64_t v103 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v16 - v101);
  v104 = (char *)&v16 - v103;
  v173 = (char *)&v16 - v103;
  id v105 = (id)sub_20988D234();
  id v106 = objc_msgSend(v105, sel_memojiMetadata);
  if (v106)
  {
    id v67 = v106;
    id v62 = v106;
    uint64_t v63 = sub_2098BE068();
    unint64_t v64 = v10;

    uint64_t v65 = v63;
    unint64_t v66 = v64;
  }
  else
  {
    uint64_t v65 = 0;
    unint64_t v66 = 0xF000000000000000;
  }
  unint64_t v61 = v66;
  uint64_t v60 = v65;

  v172[0] = v60;
  v172[1] = v61;
  BOOL v59 = (v61 & 0xF000000000000000) != 0xF000000000000000;
  BOOL v58 = v59;
  sub_209894738((uint64_t)v172);
  sub_20988FDE0((uint64_t)v69);
  if (v58) {
    int v57 = v69[153];
  }
  else {
    int v57 = 0;
  }
  int v56 = v57;
  sub_20988FFC8((uint64_t)v69);
  if (v56)
  {
    sub_209890124(v97);
    unint64_t v55 = sub_20989304C();
    sub_2097E7FAC(v97, v93, (uint64_t)v99);
    sub_2098930F0(v97);
    sub_209892E58(v99, v95);
    sub_2097E7FAC(v95, v93, v97);
    sub_2098930F0(v95);
    sub_2097E8280(v97, v93, v93, v55, v55, (uint64_t)v102);
  }
  else
  {
    v171 = v99;
    sub_209890124(v97);
    unint64_t v54 = sub_20989304C();
    sub_2097E7FAC(v97, v93, (uint64_t)v99);
    sub_2098930F0(v97);
    sub_209892E58(v99, v95);
    sub_2097E7FAC(v95, v93, v97);
    sub_2098930F0(v95);
    sub_2097E8378(v97, v93, v93, v54, v54, (uint64_t)v102);
  }
  sub_2098930F0(v97);
  sub_20989478C(v102, v104);
  sub_2098930F0((uint64_t)v99);
  if (sub_20988E770())
  {
    unsigned int v50 = 1;
    sub_2098BF3C8();
    sub_2098BF338();
    uint64_t v46 = 0;
    sub_209808A30();
    id v47 = sub_2098B03A4();
    sub_2098425FC();
    v107[2] = 0;
    v107[3] = 0;
    char v108 = 0;
    char v109 = v50 & 1;
    uint64_t v11 = sub_2098BF3A8();
    v49 = v107;
    v107[0] = v11;
    v107[1] = v12;
    sub_20988FDE0((uint64_t)v69);
    uint64_t v48 = swift_allocObject();
    memcpy((void *)(v48 + 16), v69, 0xC8uLL);
    sub_2097FCD6C();
    sub_2098BF078();
    unint64_t v51 = sub_20981D9C4();
    sub_2097E7FAC(v83, v79, v85);
    v53 = *(void (**)(uint64_t, uint64_t))(v80 + 8);
    uint64_t v52 = v80 + 8;
    v53(v83, v79);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v80 + 16))(v83, v85, v79);
    sub_2097E7FAC(v83, v79, (uint64_t)v88);
    v53(v83, v79);
    (*(void (**)(char *, void, void, uint64_t))(v80 + 56))(v88, 0, v50, v79);
    sub_2097E8B9C(v88, v79, v90);
    sub_209894AE8((uint64_t)v88);
    sub_209894B9C(v90, v92);
    v53(v85, v79);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v80 + 56))(v88, 1, 1, v79);
    sub_20981D9C4();
    sub_2097E8B9C(v88, v79, v90);
    sub_209894AE8((uint64_t)v88);
    sub_209894B9C(v90, v92);
  }
  if (sub_20988E380())
  {
    uint64_t v26 = sub_2098BE7A8();
    sub_20988FDE0((uint64_t)v69);
    v27 = &v16;
    MEMORY[0x270FA5388](&v16);
    v24 = &v16 - 4;
    *(&v16 - 2) = v13;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCD8);
    sub_2097FFC7C();
    int v35 = 1;
    sub_2098BF0B8();
    sub_20988FFC8((uint64_t)v69);
    v28 = v132;
    v132[0] = v142;
    v132[1] = v143;
    char v133 = v144 & 1;
    uint64_t v134 = v145;
    uint64_t v135 = v146;
    char v136 = v147 & 1 & v35;
    uint64_t v137 = v148;
    uint64_t v138 = v149;
    uint64_t v139 = v150;
    uint64_t v140 = v151;
    uint64_t v141 = v152;
    uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC90);
    unint64_t v43 = sub_2097FFD00();
    v45 = v153;
    sub_2097E7FAC((uint64_t)v28, v42, (uint64_t)v153);
    sub_2097FFD84((uint64_t)v28);
    uint64_t v29 = v153[0];
    uint64_t v30 = v153[1];
    int v31 = LOBYTE(v153[2]);
    uint64_t v32 = v153[3];
    uint64_t v33 = v153[4];
    int v34 = LOBYTE(v153[5]);
    uint64_t v36 = v153[6];
    uint64_t v37 = v153[7];
    uint64_t v38 = v153[8];
    uint64_t v39 = v153[9];
    uint64_t v40 = v153[10];
    sub_2097EA700(v153[3], v153[4], v153[5] & 1);
    sub_2098BE368();
    sub_20980493C(v37, v38, v39, v40);
    v41 = v111;
    v111[0] = v29;
    v111[1] = v30;
    char v112 = v31 & 1 & v35;
    uint64_t v113 = v32;
    uint64_t v114 = v33;
    char v115 = v34 & 1 & v35;
    uint64_t v116 = v36;
    uint64_t v117 = v37;
    uint64_t v118 = v38;
    uint64_t v119 = v39;
    uint64_t v120 = v40;
    sub_2097E7FAC((uint64_t)v111, v42, (uint64_t)v121);
    sub_2097FFD84((uint64_t)v41);
    v44 = v110;
    v110[0] = v121[0];
    v110[1] = v121[1];
    v110[2] = v122 & 1;
    v110[3] = v123;
    v110[4] = v124;
    v110[5] = v125 & 1;
    v110[6] = v126;
    v110[7] = v127;
    v110[8] = v128;
    v110[9] = v129;
    v110[10] = v130;
    sub_2097E8B9C(v110, v42, v131);
    sub_209895538((uint64_t)v44);
    uint64_t v160 = v131[0];
    uint64_t v161 = v131[1];
    uint64_t v162 = v131[2];
    uint64_t v163 = v131[3];
    uint64_t v164 = v131[4];
    uint64_t v165 = v131[5];
    uint64_t v166 = v131[6];
    uint64_t v167 = v131[7];
    uint64_t v168 = v131[8];
    uint64_t v169 = v131[9];
    uint64_t v170 = v131[10];
    sub_2097FFD84((uint64_t)v45);
  }
  else
  {
    v23 = v158;
    memset(v158, 0, sizeof(v158));
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC90);
    sub_2097FFD00();
    sub_2097E8B9C(v23, v22, v159);
    uint64_t v160 = v159[0];
    uint64_t v161 = v159[1];
    uint64_t v162 = v159[2];
    uint64_t v163 = v159[3];
    uint64_t v164 = v159[4];
    uint64_t v165 = v159[5];
    uint64_t v166 = v159[6];
    uint64_t v167 = v159[7];
    uint64_t v168 = v159[8];
    uint64_t v169 = v159[9];
    uint64_t v170 = v159[10];
  }
  sub_209894CC8((uint64_t *)v104, (uint64_t)v102);
  v19 = v157;
  v157[0] = v102;
  sub_2098950DC(v92, v90);
  v157[1] = v90;
  v21 = &v160;
  v20 = v156;
  sub_209895208(&v160, v156);
  v157[2] = v20;
  uint64_t v17 = v155;
  v155[0] = v100;
  v155[1] = v86;
  v155[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC98);
  unint64_t v14 = sub_209895374();
  v18 = v154;
  v154[0] = v14;
  v154[1] = sub_209895410();
  v154[2] = sub_2098954A4();
  sub_2097E8010((uint64_t)v19, 3uLL, (uint64_t)v17, v68);
  sub_209895538((uint64_t)v20);
  sub_209894AE8((uint64_t)v90);
  sub_2098955D8((uint64_t)v102);
  sub_209895538((uint64_t)v21);
  sub_209894AE8((uint64_t)v92);
  return sub_2098955D8((uint64_t)v104);
}

uint64_t sub_20988FDE0(uint64_t a1)
{
  id v3 = *(id *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 184);
  swift_retain();
  swift_retain();
  id v1 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_2098BE368();
  swift_retain();
  swift_retain();
  sub_2098BE368();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_20988EDC8(v4);
  return a1;
}

uint64_t sub_20988FF3C@<X0>(uint64_t a1@<X8>)
{
  return sub_20988EFBC(*(unsigned __int8 **)(v1 + 16), a1);
}

unint64_t sub_20988FF44()
{
  uint64_t v2 = qword_2675F01F8;
  if (!qword_2675F01F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F01F0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F01F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20988FFC8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 184);
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2097FA6E0(v3);
  return a1;
}

uint64_t sub_209890124@<X0>(uint64_t a1@<X8>)
{
  uint64_t v137 = v159;
  uint64_t v99 = a1;
  uint64_t v105 = 0;
  unint64_t v101 = sub_20989322C;
  v102 = sub_209893238;
  uint64_t v166 = 0;
  uint64_t v165 = 0;
  uint64_t v164 = 0;
  uint64_t v143 = 0;
  uint64_t v144 = 0;
  __src = v167;
  size_t __n = 200;
  memcpy(v167, v1, sizeof(v167));
  memcpy(__dst, v167, sizeof(__dst));
  uint64_t v106 = sub_2098BEFA8();
  uint64_t v107 = *(void *)(v106 - 8);
  uint64_t v108 = v106 - 8;
  unint64_t v109 = (*(void *)(v107 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v106);
  uint64_t v110 = (uint64_t)v59 - v109;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
  unint64_t v112 = (*(void *)(*(void *)(v111 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v111);
  uint64_t v113 = (uint64_t)v59 - v112;
  unint64_t v114 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v59 - v112);
  uint64_t v115 = (uint64_t)v59 - v114;
  unint64_t v116 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v59 - v114);
  uint64_t v117 = (void *)((char *)v59 - v116);
  v137[58] = (char *)v59 - v116;
  uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
  uint64_t v119 = *(void *)(v118 - 8);
  uint64_t v120 = v118 - 8;
  unint64_t v121 = (*(void *)(v119 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v118);
  char v122 = (char *)v59 - v121;
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
  unint64_t v124 = (*(void *)(*(void *)(v123 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v123);
  uint64_t v125 = (uint64_t)v59 - v124;
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
  unint64_t v127 = (*(void *)(*(void *)(v126 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v126);
  uint64_t v128 = (uint64_t)v59 - v127;
  unint64_t v129 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v59 - v127);
  uint64_t v130 = (uint64_t)v59 - v129;
  unint64_t v131 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v59 - v129);
  uint64_t v132 = (uint64_t)v59 - v131;
  v137[57] = (char *)v59 - v131;
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0248);
  unint64_t v134 = (*(void *)(*(void *)(v133 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v133);
  uint64_t v135 = (char *)v59 - v134;
  unint64_t v136 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v59 - v134);
  uint64_t v138 = (char *)v59 - v136;
  v137[56] = (char *)v59 - v136;
  uint64_t v140 = v1[23];
  uint64_t v139 = v1[24];
  sub_20988EDC8(v140);
  if (v140)
  {
    uint64_t v97 = v140;
    uint64_t v98 = v139;
    uint64_t v96 = v139;
    uint64_t v84 = v140;
    uint64_t v143 = v140;
    uint64_t v144 = v139;
    swift_retain();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = v96;
    uint64_t v9 = v7;
    uint64_t v10 = v100;
    uint64_t v85 = v9;
    *(void *)(v9 + 16) = v84;
    *(void *)(v9 + 24) = v8;
    sub_20988FDE0(v10);
    v88 = v59;
    MEMORY[0x270FA5388](v59);
    uint64_t v86 = &v59[-4];
    v59[-2] = v11;
    uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0280);
    sub_209893240();
    sub_2098BF068();
    sub_20988FFC8(v100);
    uint64_t v89 = *sub_209805C50();
    uint64_t v90 = *sub_209805CE4();
    unint64_t v91 = sub_209892C3C();
    sub_2097F8398();
    sub_2098BEDE8();
    (*(void (**)(char *, uint64_t))(v119 + 8))(v122, v118);
    sub_2098BF088();
    unint64_t v93 = sub_209892B9C();
    unint64_t v94 = sub_20981C4F0();
    uint64_t v92 = MEMORY[0x263F1B638];
    __int16 v142 = sub_20981AA88();
    __int16 v141 = v142 & 0x101;
    sub_2098BEEA8();
    sub_20989342C(v125);
    unint64_t v95 = sub_209892AF8();
    sub_2097E7FAC(v130, v126, v132);
    sub_20989342C(v130);
    sub_20989348C(v132, v128);
    sub_2097E7FAC(v128, v126, v130);
    sub_20989342C(v128);
    unint64_t v12 = sub_20989284C();
    sub_2097E8280(v130, v126, v111, v95, v12, (uint64_t)v135);
    sub_20989342C(v130);
    sub_209892CC0(v135, v138);
    sub_20989342C(v132);
    swift_release();
  }
  else
  {
    v59[5] = sub_20988D6C0();
    v59[1] = sub_20981AA08();
    v59[2] = v13;
    v59[3] = v14;
    v59[4] = v15;
    sub_20981AA1C(v110);
    uint64_t v60 = sub_2098BEFF8();
    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v110, v106);
    swift_release();
    unint64_t v61 = v163;
    v137[22] = v60;
    sub_2098BECF8();
    sub_2097FF904();
    uint64_t v16 = v137;
    uint64_t v17 = v137[23];
    uint64_t v18 = v137[24];
    char v19 = v163[24];
    char v20 = v163[25];
    unint64_t v66 = v162;
    v137[19] = v17;
    v16[20] = v18;
    int v75 = 1;
    v162[16] = v19 & 1;
    v162[17] = v20 & 1;
    uint64_t v62 = *sub_209805C50();
    uint64_t v63 = *sub_209805CE4();
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBA8);
    unint64_t v65 = sub_20987D934();
    sub_2097F8398();
    sub_2098BEDE8();
    sub_2097FF904();
    v21 = v137;
    char v22 = v75;
    uint64_t v23 = v137[26];
    uint64_t v24 = v137[27];
    char v25 = v163[48];
    char v26 = v163[49];
    uint64_t v27 = v137[29];
    char v28 = v163[64];
    uint64_t v29 = v137[31];
    char v30 = v163[80];
    uint64_t v31 = v137[33];
    uint64_t v32 = v137[34];
    v71 = v161;
    v137[10] = v23;
    v21[11] = v24;
    v161[16] = v25 & 1 & v22;
    v161[17] = v26 & v22;
    v21[13] = v27;
    v161[32] = v28 & 1 & v22;
    v21[15] = v29;
    v161[48] = v30 & 1 & v22;
    v21[17] = v31;
    v21[18] = v32;
    sub_2098BF088();
    uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBB8);
    unint64_t v69 = sub_20989262C();
    unint64_t v70 = sub_20981C4F0();
    uint64_t v68 = MEMORY[0x263F1B638];
    __int16 v160 = sub_20981AA88();
    v159[76] = v160 & v75;
    v159[77] = HIBYTE(v160) & v75;
    sub_2098BEEA8();
    sub_2097FF904();
    uint64_t v33 = v137;
    char v34 = v75;
    uint64_t v35 = v137[35];
    uint64_t v36 = v137[36];
    char v37 = v163[120];
    char v38 = v163[121];
    uint64_t v39 = v137[38];
    char v40 = v163[136];
    uint64_t v41 = v137[40];
    char v42 = v163[152];
    uint64_t v43 = v137[42];
    uint64_t v44 = v137[43];
    char v45 = v163[176];
    char v46 = v163[177];
    uint64_t v74 = v159;
    *uint64_t v137 = v35;
    v33[1] = v36;
    v159[16] = v37 & 1 & v34;
    v159[17] = v38 & v34;
    v33[3] = v39;
    v159[32] = v40 & 1 & v34;
    v33[5] = v41;
    v159[48] = v42 & 1 & v34;
    v33[7] = v43;
    v33[8] = v44;
    v159[72] = v45 & v34;
    v159[73] = v46 & v34;
    uint64_t v47 = sub_2097FF028();
    v73 = &v158;
    uint64_t v158 = v47;
    uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBD8);
    sub_2098926CC();
    sub_2098BED38();
    sub_2097FF904();
    sub_2097FF904();
    uint64_t v48 = v137[45];
    uint64_t v49 = v137[46];
    uint64_t v50 = v137[48];
    uint64_t v51 = v137[50];
    uint64_t v52 = v137[52];
    uint64_t v53 = v137[53];
    uint64_t v54 = v137[55];
    unint64_t v82 = v146;
    v146[0] = v48;
    v146[1] = v49;
    char v147 = v163[200] & 1 & v75;
    char v148 = v163[201] & v75;
    uint64_t v149 = v50;
    char v150 = v163[216] & 1 & v75;
    uint64_t v151 = v51;
    char v152 = v163[232] & 1 & v75;
    uint64_t v153 = v52;
    uint64_t v154 = v53;
    char v155 = v163[256] & v75;
    char v156 = v163[257] & v75;
    uint64_t v157 = v54;
    sub_2098BF3C8();
    uint64_t v76 = v55;
    uint64_t v77 = sub_20980894C();
    uint64_t v78 = v56;
    swift_bridgeObjectRelease();
    uint64_t v81 = v145;
    v145[0] = v77;
    v145[1] = v78;
    uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBF8);
    unint64_t v80 = sub_209892770();
    sub_2097FCD6C();
    sub_2098BED68();
    sub_2097EBD24();
    sub_209892814();
    unint64_t v83 = sub_20989284C();
    sub_2097E7FAC(v115, v111, (uint64_t)v117);
    sub_209892974(v115);
    sub_209892A00(v117, v113);
    sub_2097E7FAC(v113, v111, v115);
    sub_209892974(v113);
    unint64_t v57 = sub_209892AF8();
    sub_2097E8378(v115, v126, v111, v57, v83, (uint64_t)v135);
    sub_209892974(v115);
    sub_209892CC0(v135, v138);
    sub_209892974((uint64_t)v117);
  }
  sub_209892E58((uint64_t *)v138, (uint64_t)v135);
  sub_20989304C();
  sub_2097E7FAC((uint64_t)v135, v133, v99);
  sub_2098930F0((uint64_t)v135);
  return sub_2098930F0((uint64_t)v138);
}

unint64_t sub_209890D34()
{
  uint64_t v2 = qword_2675F0200;
  if (!qword_2675F0200)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F01E8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0200);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209890DB8(uint64_t a1)
{
  uint64_t v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0208) + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() != 1) {
      goto LABEL_3;
    }
    swift_release();
    swift_release();
    uint64_t v10 = a1 + v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
    uint64_t v3 = sub_2098BE968();
    (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(v10);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
LABEL_3:
      uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
      (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v12);
      goto LABEL_7;
    }
    swift_release();
    swift_release();
    uint64_t v11 = a1 + v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
    uint64_t v2 = sub_2098BE968();
    (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v11);
  }
LABEL_7:
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0230);
  uint64_t v7 = a1 + v12 + *(int *)(v6 + 48);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC68);
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v9 + 48))(v7, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }
  uint64_t v5 = a1 + v12 + *(int *)(v6 + 64);
  if (*(void *)(v5 + 48))
  {
    sub_2097E9C1C(*(void *)(v5 + 24), *(void *)(v5 + 32), *(unsigned char *)(v5 + 40) & 1);
    swift_bridgeObjectRelease();
    if (*(void *)(v5 + 80))
    {
      sub_2097E9C1C(*(void *)(v5 + 56), *(void *)(v5 + 64), *(unsigned char *)(v5 + 72) & 1);
      swift_bridgeObjectRelease();
    }
  }
  return a1;
}

uint64_t sub_209891160(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 16);
  uint64_t v37 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0208) + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0210);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = *(void *)(a1 + v37);
      swift_retain();
      uint64_t v35 = a2 + v37;
      *(void *)uint64_t v35 = v31;
      *(void *)(v35 + 8) = *(void *)(a1 + v37 + 8);
      *(_WORD *)(v35 + 16) = *(_WORD *)(a1 + v37 + 16);
      memcpy((void *)(a2 + v37 + 24), (const void *)(a1 + v37 + 24), 0x30uLL);
      *(_WORD *)(v35 + 72) = *(_WORD *)(a1 + v37 + 72);
      uint64_t v32 = *(void *)(a1 + v37 + 80);
      swift_retain();
      *(void *)(v35 + 80) = v32;
      uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
      uint64_t v34 = a2 + v37 + *(int *)(v2 + 36);
      uint64_t v33 = a1 + v37 + *(int *)(v2 + 36);
      uint64_t v3 = sub_2098BE968();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v34, v33);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
LABEL_5:
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
    (*(void (**)(void))(*(void *)(v4 - 8) + 16))();
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
    memcpy((void *)(a2 + v37 + *(int *)(v5 + 36)), (const void *)(a1 + v37 + *(int *)(v5 + 36)), 0x30uLL);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
    *(_WORD *)(a2 + v37 + *(int *)(v6 + 36)) = *(_WORD *)(a1 + v37 + *(int *)(v6 + 36));
    goto LABEL_7;
  }
  uint64_t v26 = *(void *)(a1 + v37);
  swift_retain();
  uint64_t v30 = a2 + v37;
  *(void *)uint64_t v30 = v26;
  *(void *)(v30 + 8) = *(void *)(a1 + v37 + 8);
  *(_WORD *)(v30 + 16) = *(_WORD *)(a1 + v37 + 16);
  memcpy((void *)(a2 + v37 + 24), (const void *)(a1 + v37 + 24), 0x30uLL);
  *(_WORD *)(v30 + 72) = *(_WORD *)(a1 + v37 + 72);
  uint64_t v27 = *(void *)(a1 + v37 + 80);
  swift_retain();
  *(void *)(v30 + 80) = v27;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
  uint64_t v29 = a2 + v37 + *(int *)(v7 + 36);
  uint64_t v28 = a1 + v37 + *(int *)(v7 + 36);
  uint64_t v8 = sub_2098BE968();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v29, v28);
LABEL_7:
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0230);
  __dst = (void *)(a2 + v37 + *(int *)(v21 + 48));
  __src = (void *)(a1 + v37 + *(int *)(v21 + 48));
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC68);
  uint64_t v25 = *(void *)(v24 - 8);
  if ((*(unsigned int (**)(void *, uint64_t))(v25 + 48))(__src, 1))
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC70);
    memcpy(__dst, __src, *(void *)(*(void *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v25 + 16))(__dst, __src, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
  }
  char v19 = (char *)(a2 + v37 + *(int *)(v21 + 64));
  char v20 = (void *)(a1 + v37 + *(int *)(v21 + 64));
  if (v20[6])
  {
    *(_OWORD *)char v19 = *(_OWORD *)v20;
    v19[16] = *((unsigned char *)v20 + 16);
    uint64_t v15 = v20[3];
    uint64_t v16 = v20[4];
    char v17 = *((unsigned char *)v20 + 40);
    sub_2097EA700(v15, v16, v17 & 1);
    *((void *)v19 + 3) = v15;
    *((void *)v19 + 4) = v16;
    v19[40] = v17 & 1;
    uint64_t v18 = v20[6];
    sub_2098BE368();
    *((void *)v19 + 6) = v18;
    if (v20[10])
    {
      uint64_t v11 = v20[7];
      uint64_t v12 = v20[8];
      char v13 = *((unsigned char *)v20 + 72);
      sub_2097EA700(v11, v12, v13 & 1);
      *((void *)v19 + 7) = v11;
      *((void *)v19 + 8) = v12;
      v19[72] = v13 & 1;
      uint64_t v14 = v20[10];
      sub_2098BE368();
      *((void *)v19 + 10) = v14;
    }
    else
    {
      *(_OWORD *)(v19 + 56) = *(_OWORD *)(v20 + 7);
      *(_OWORD *)(v19 + 72) = *(_OWORD *)(v20 + 9);
    }
  }
  else
  {
    memcpy(v19, v20, 0x58uLL);
  }
  return a2;
}

uint64_t sub_2098918E4(uint64_t a1)
{
  v3[4] = a1;
  uint64_t v2 = (uint64_t (*)(void))sub_20988EC04(v3);
  sub_2098BF568();
  return v2();
}

uint64_t sub_209891950@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  memset(v126, 0, 32);
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v127 = a1;
  uint64_t v124 = sub_20988DB50();
  uint64_t v125 = v2;
  sub_2097FCD6C();
  uint64_t v120 = sub_2098BEC08();
  uint64_t v121 = v3;
  char v122 = v4;
  uint64_t v123 = v5;
  uint64_t v37 = v120;
  uint64_t v38 = v3;
  char v39 = v4;
  uint64_t v40 = v5;
  sub_2098BEA48();
  uint64_t v116 = v37;
  uint64_t v117 = v38;
  char v118 = v39 & 1;
  uint64_t v119 = v40;
  uint64_t v112 = sub_2098BEBC8();
  uint64_t v113 = v6;
  char v114 = v7;
  uint64_t v115 = v8;
  uint64_t v42 = v112;
  uint64_t v43 = v6;
  char v41 = v7;
  uint64_t v44 = v8;
  swift_release();
  sub_2097E9C1C(v37, v38, v39 & 1);
  swift_bridgeObjectRelease();
  uint64_t v108 = v42;
  uint64_t v109 = v43;
  char v110 = v41 & 1;
  uint64_t v111 = v44;
  uint64_t v104 = sub_2098BEBB8();
  uint64_t v105 = v9;
  char v106 = v10;
  uint64_t v107 = v11;
  uint64_t v45 = v104;
  uint64_t v46 = v9;
  char v47 = v10;
  uint64_t v48 = v11;
  sub_2097E9C1C(v42, v43, v41 & 1);
  swift_bridgeObjectRelease();
  v101[0] = v45;
  v101[1] = v46;
  char v102 = v47 & 1;
  uint64_t v103 = v48;
  sub_2097E7FAC((uint64_t)v101, MEMORY[0x263F1A830], (uint64_t)v126);
  sub_2097F23B4((uint64_t)v101);
  uint64_t v49 = sub_20988E070();
  uint64_t v50 = v12;
  if (v12)
  {
    uint64_t v87 = v49;
    uint64_t v88 = v12;
    sub_2098BE368();
    uint64_t v83 = v49;
    uint64_t v84 = v50;
    uint64_t v79 = sub_2098BEC08();
    uint64_t v80 = v13;
    char v81 = v14;
    uint64_t v82 = v15;
    uint64_t v23 = v13;
    char v24 = v14;
    uint64_t v25 = v15;
    sub_2098BEA38();
    uint64_t v75 = v79;
    uint64_t v76 = v23;
    char v77 = v24 & 1;
    uint64_t v78 = v25;
    uint64_t v71 = sub_2098BEBC8();
    uint64_t v72 = v16;
    char v73 = v17;
    uint64_t v74 = v18;
    uint64_t v26 = v16;
    char v27 = v17;
    uint64_t v28 = v18;
    swift_release();
    sub_2097E9C1C(v79, v23, v24 & 1);
    swift_bridgeObjectRelease();
    uint64_t v70 = sub_2097FF028();
    uint64_t v66 = v71;
    uint64_t v67 = v26;
    char v68 = v27 & 1;
    uint64_t v69 = v28;
    uint64_t v62 = sub_2098BEB98();
    uint64_t v63 = v19;
    char v64 = v20;
    uint64_t v65 = v21;
    uint64_t v29 = v19;
    char v30 = v20;
    uint64_t v31 = v21;
    sub_2097FF904();
    sub_2097E9C1C(v66, v26, v27 & 1);
    swift_bridgeObjectRelease();
    v59[0] = v62;
    v59[1] = v29;
    char v60 = v30 & 1;
    uint64_t v61 = v31;
    uint64_t v35 = MEMORY[0x263F1A830];
    sub_2097E7FAC((uint64_t)v59, MEMORY[0x263F1A830], (uint64_t)&v85);
    sub_2097F23B4((uint64_t)v59);
    long long v32 = v85;
    char v33 = v86;
    uint64_t v34 = *((void *)&v86 + 1);
    sub_2097EA700(v85, *((uint64_t *)&v85 + 1), v86 & 1);
    sub_2098BE368();
    long long v52 = v32;
    char v53 = v33 & 1;
    uint64_t v54 = v34;
    sub_2097E7FAC((uint64_t)&v52, v35, (uint64_t)v55);
    sub_2097F23B4((uint64_t)&v52);
    v51[0] = v55[0];
    v51[1] = v55[1];
    v51[2] = v56 & 1;
    v51[3] = v57;
    sub_2097E8B9C(v51, v35, v58);
    sub_2097F2354((uint64_t)v51);
    uint64_t v97 = v58[0];
    uint64_t v98 = v58[1];
    uint64_t v99 = v58[2];
    uint64_t v100 = v58[3];
    sub_2097F23B4((uint64_t)&v85);
    swift_bridgeObjectRelease();
  }
  else
  {
    memset(v95, 0, sizeof(v95));
    sub_2097E8B9C(v95, MEMORY[0x263F1A830], v96);
    uint64_t v97 = v96[0];
    uint64_t v98 = v96[1];
    uint64_t v99 = v96[2];
    uint64_t v100 = v96[3];
  }
  sub_2097FD0A8((uint64_t)v126, (uint64_t)v93);
  v94[0] = v93;
  sub_2097F2204((uint64_t)&v97, (uint64_t)v92);
  v94[1] = v92;
  v91[0] = MEMORY[0x263F1A830];
  v91[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC28);
  uint64_t v89 = MEMORY[0x263F1A820];
  unint64_t v90 = sub_2097F22C4();
  sub_2097E8010((uint64_t)v94, 2uLL, (uint64_t)v91, a2);
  sub_2097F2354((uint64_t)v92);
  sub_2097F23B4((uint64_t)v93);
  sub_2097F2354((uint64_t)&v97);
  return sub_2097F23B4((uint64_t)v126);
}

uint64_t sub_209892018(void (*a1)(void))
{
  return swift_release();
}

uint64_t sub_209892078@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v82 = 0;
  uint64_t v81 = 0;
  uint64_t v20 = sub_2098BEFA8();
  uint64_t v18 = *(void *)(v20 - 8);
  uint64_t v19 = v20 - 8;
  unint64_t v11 = (*(void *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20);
  uint64_t v21 = (uint64_t)&v11 - v11;
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0280);
  unint64_t v12 = (*(void *)(*(void *)(v42 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v42);
  uint64_t v44 = (uint64_t)&v11 - v12;
  unint64_t v13 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v11 - v12);
  uint64_t v45 = (uint64_t *)((char *)&v11 - v13);
  uint64_t v82 = (char *)&v11 - v13;
  uint64_t v81 = a1;
  uint64_t v22 = sub_20988D6C0();
  double v14 = sub_20981AA08();
  uint64_t v15 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  sub_20981AA1C(v21);
  uint64_t v23 = sub_2098BEFF8();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v20);
  swift_release();
  char v24 = v65;
  v65[0] = v23;
  sub_2098BECF8();
  sub_2097FF904();
  uint64_t v29 = v62;
  v62[0] = v65[1];
  v62[1] = v65[2];
  int v33 = 1;
  char v63 = v66 & 1;
  char v64 = v67 & 1;
  sub_2098BF088();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBA8);
  unint64_t v27 = sub_20987D934();
  unint64_t v28 = sub_20981C4F0();
  uint64_t v26 = MEMORY[0x263F1B638];
  __int16 v61 = sub_20981AA88();
  char v59 = v61 & v33;
  char v60 = HIBYTE(v61) & v33;
  sub_2098BEEA8();
  sub_2097FF904();
  long long v32 = v54;
  v54[0] = v68;
  v54[1] = v69;
  char v55 = v70 & 1 & v33;
  char v56 = v71 & v33;
  char v57 = v72 & v33;
  char v58 = v73 & v33;
  uint64_t v7 = sub_2097FF028();
  uint64_t v31 = &v53;
  uint64_t v53 = v7;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBC8);
  sub_209893388();
  sub_2098BED38();
  sub_2097FF904();
  sub_2097FF904();
  uint64_t v40 = v47;
  v47[0] = v74;
  v47[1] = v75;
  char v48 = v76 & 1 & v33;
  char v49 = v77 & v33;
  char v50 = v78 & v33;
  char v51 = v79 & v33;
  uint64_t v52 = v80;
  sub_2098BF3C8();
  uint64_t v34 = v8;
  uint64_t v35 = sub_20980894C();
  uint64_t v36 = v9;
  swift_bridgeObjectRelease();
  char v39 = v46;
  v46[0] = v35;
  v46[1] = v36;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECBE8);
  unint64_t v38 = sub_2098932E4();
  sub_2097FCD6C();
  sub_2098BED68();
  sub_2097EBD24();
  sub_209894598();
  unint64_t v43 = sub_209893240();
  sub_2097E7FAC(v44, v42, (uint64_t)v45);
  sub_2098945D0(v44);
  sub_20989465C(v45, v44);
  sub_2097E7FAC(v44, v42, v41);
  sub_2098945D0(v44);
  return sub_2098945D0((uint64_t)v45);
}

unint64_t sub_20989262C()
{
  uint64_t v2 = qword_2675ECBB0;
  if (!qword_2675ECBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECBB8);
    sub_20987D934();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECBB0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098926CC()
{
  uint64_t v2 = qword_2675ECBD0;
  if (!qword_2675ECBD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECBD8);
    sub_20989262C();
    sub_20981C610();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECBD0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_209892770()
{
  uint64_t v2 = qword_2675ECBF0;
  if (!qword_2675ECBF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECBF8);
    sub_2098926CC();
    sub_2097FF9D0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECBF0);
    return WitnessTable;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_209892814()
{
}

unint64_t sub_20989284C()
{
  uint64_t v2 = qword_2675F0250;
  if (!qword_2675F0250)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0228);
    sub_209892770();
    sub_2098928F0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0250);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098928F0()
{
  uint64_t v2 = qword_2675F0258;
  if (!qword_2675F0258)
  {
    sub_2098BE968();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0258);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209892974(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
  uint64_t v1 = sub_2098BE968();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t sub_209892A00(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = a1[1];
  *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
  memcpy((void *)(a2 + 24), a1 + 3, 0x32uLL);
  uint64_t v5 = a1[10];
  swift_retain();
  *(void *)(a2 + 80) = v5;
  uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
  uint64_t v2 = sub_2098BE968();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2 + v6, (uint64_t)a1 + v6);
  return a2;
}

unint64_t sub_209892AF8()
{
  uint64_t v2 = qword_2675F0260;
  if (!qword_2675F0260)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0240);
    sub_209892B9C();
    sub_20981C610();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0260);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_209892B9C()
{
  uint64_t v2 = qword_2675F0268;
  if (!qword_2675F0268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0238);
    sub_209892C3C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0268);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_209892C3C()
{
  uint64_t v2 = qword_2675F0270;
  if (!qword_2675F0270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0220);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0270);
    return WitnessTable;
  }
  return v2;
}

char *sub_209892CC0(char *a1, char *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    memcpy(a2, a1, 0x58uLL);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
    uint64_t v9 = &a2[*(int *)(v5 + 36)];
    uint64_t v8 = &a1[*(int *)(v5 + 36)];
    uint64_t v6 = sub_2098BE968();
    (*(void (**)(char *, char *))(*(void *)(v6 - 8) + 32))(v9, v8);
  }
  else
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
    (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 32))(a2, a1);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
    memcpy(&a2[*(int *)(v3 + 36)], &a1[*(int *)(v3 + 36)], 0x30uLL);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
    *(_WORD *)&a2[*(int *)(v4 + 36)] = *(_WORD *)&a1[*(int *)(v4 + 36)];
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_209892E58(uint64_t *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = *a1;
    swift_retain();
    *(void *)a2 = v8;
    *(void *)(a2 + 8) = a1[1];
    *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
    memcpy((void *)(a2 + 24), a1 + 3, 0x32uLL);
    uint64_t v9 = a1[10];
    swift_retain();
    *(void *)(a2 + 80) = v9;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
    uint64_t v11 = a2 + *(int *)(v5 + 36);
    uint64_t v10 = (uint64_t)a1 + *(int *)(v5 + 36);
    uint64_t v6 = sub_2098BE968();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(v11, v10);
  }
  else
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)(v2 - 8) + 16))(a2, a1);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
    memcpy((void *)(a2 + *(int *)(v3 + 36)), (char *)a1 + *(int *)(v3 + 36), 0x30uLL);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
    *(_WORD *)(a2 + *(int *)(v4 + 36)) = *(_WORD *)((char *)a1 + *(int *)(v4 + 36));
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

unint64_t sub_20989304C()
{
  uint64_t v2 = qword_2675F0278;
  if (!qword_2675F0278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0248);
    sub_209892AF8();
    sub_20989284C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0278);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098930F0(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    swift_release();
    uint64_t v4 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
    uint64_t v2 = sub_2098BE968();
    (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v4);
  }
  else
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  }
  return a1;
}

uint64_t sub_2098931EC()
{
  return swift_deallocObject();
}

uint64_t sub_20989322C()
{
  return sub_209892018(*(void (**)(void))(v0 + 16));
}

uint64_t sub_209893238@<X0>(uint64_t a1@<X8>)
{
  return sub_209892078(*(void *)(v1 + 16), a1);
}

unint64_t sub_209893240()
{
  uint64_t v2 = qword_2675F0288;
  if (!qword_2675F0288)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0280);
    sub_2098932E4();
    sub_2098928F0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0288);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098932E4()
{
  uint64_t v2 = qword_2675ECBE0;
  if (!qword_2675ECBE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECBE8);
    sub_209893388();
    sub_2097FF9D0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECBE0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_209893388()
{
  uint64_t v2 = qword_2675ECBC0;
  if (!qword_2675ECBC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECBC8);
    sub_20987D934();
    sub_20981C610();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECBC0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20989342C(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_20989348C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
  memcpy((void *)(a2 + *(int *)(v3 + 36)), (const void *)(a1 + *(int *)(v3 + 36)), 0x30uLL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
  uint64_t result = a2;
  *(_WORD *)(a2 + *(int *)(v4 + 36)) = *(_WORD *)(a1 + *(int *)(v4 + 36));
  return result;
}

void *sub_209893554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,__int16 a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26)
{
  __src[0] = a1;
  __src[1] = a2;
  __src[2] = a3;
  __src[3] = a4;
  __src[4] = a5;
  __src[5] = a6;
  __src[6] = a7;
  __src[7] = a8;
  __src[8] = a10;
  __src[9] = a11;
  __src[10] = a12;
  __src[11] = a13;
  __src[12] = a14;
  __src[13] = a15;
  __src[14] = a16;
  __src[15] = a17;
  LOBYTE(__src[16]) = a18 & 1;
  __src[17] = a19;
  __src[18] = a20;
  LOWORD(__src[19]) = a21 & 0x101;
  __src[20] = a22;
  __src[21] = a23;
  LOBYTE(__src[22]) = a24 & 1;
  __src[23] = a25;
  __src[24] = a26;
  return memcpy(a9, __src, 0xC8uLL);
}

uint64_t sub_209893694@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_20988EE04(a1);
}

uint64_t sub_2098936DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_209893710(uint64_t a1)
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = a1;
  if (*(void *)(a1 + 184)) {
    return swift_release();
  }
  return result;
}

uint64_t sub_20989382C(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *a2;
  swift_retain();
  *(void *)a1 = v6;
  uint64_t v7 = a2[1];
  swift_retain();
  *(void *)(a1 + 8) = v7;
  uint64_t v8 = (void *)a2[2];
  id v2 = v8;
  *(void *)(a1 + 16) = v8;
  uint64_t v9 = a2[3];
  swift_retain();
  *(void *)(a1 + 24) = v9;
  uint64_t v10 = a2[4];
  swift_retain();
  *(void *)(a1 + 32) = v10;
  uint64_t v11 = a2[5];
  swift_retain();
  *(void *)(a1 + 40) = v11;
  uint64_t v12 = a2[6];
  swift_retain();
  *(void *)(a1 + 48) = v12;
  uint64_t v13 = a2[7];
  swift_retain();
  *(void *)(a1 + 56) = v13;
  *(void *)(a1 + 64) = a2[8];
  uint64_t v14 = a2[9];
  sub_2098BE368();
  *(void *)(a1 + 72) = v14;
  uint64_t v15 = a2[10];
  swift_retain();
  *(void *)(a1 + 80) = v15;
  uint64_t v16 = a2[11];
  swift_retain();
  *(void *)(a1 + 88) = v16;
  *(void *)(a1 + 96) = a2[12];
  uint64_t v17 = a2[13];
  sub_2098BE368();
  *(void *)(a1 + 104) = v17;
  uint64_t v18 = a2[14];
  swift_retain();
  *(void *)(a1 + 112) = v18;
  uint64_t v19 = a2[15];
  swift_retain();
  *(void *)(a1 + 120) = v19;
  *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
  uint64_t v20 = a2[17];
  swift_retain();
  *(void *)(a1 + 136) = v20;
  uint64_t v21 = a2[18];
  swift_retain();
  *(void *)(a1 + 144) = v21;
  *(unsigned char *)(a1 + 152) = *((unsigned char *)a2 + 152);
  *(unsigned char *)(a1 + 153) = *((unsigned char *)a2 + 153);
  uint64_t v22 = a2[20];
  swift_retain();
  *(void *)(a1 + 160) = v22;
  uint64_t v24 = a2[21];
  swift_retain();
  *(void *)(a1 + 168) = v24;
  *(unsigned char *)(a1 + 176) = *((unsigned char *)a2 + 176);
  if (a2[23])
  {
    uint64_t v4 = a2[23];
    uint64_t v5 = a2[24];
    swift_retain();
    *(void *)(a1 + 184) = v4;
    *(void *)(a1 + 192) = v5;
  }
  else
  {
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 23);
  }
  return a1;
}

uint64_t sub_209893AD4(uint64_t a1, uint64_t *a2)
{
  uint64_t v9 = *a2;
  swift_retain();
  *(void *)a1 = v9;
  swift_release();
  uint64_t v10 = a2[1];
  swift_retain();
  *(void *)(a1 + 8) = v10;
  swift_release();
  uint64_t v11 = (void *)a2[2];
  id v2 = v11;
  uint64_t v3 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v11;

  uint64_t v12 = a2[3];
  swift_retain();
  *(void *)(a1 + 24) = v12;
  swift_release();
  uint64_t v13 = a2[4];
  swift_retain();
  *(void *)(a1 + 32) = v13;
  swift_release();
  uint64_t v14 = a2[5];
  swift_retain();
  *(void *)(a1 + 40) = v14;
  swift_release();
  uint64_t v15 = a2[6];
  swift_retain();
  *(void *)(a1 + 48) = v15;
  swift_release();
  uint64_t v16 = a2[7];
  swift_retain();
  *(void *)(a1 + 56) = v16;
  swift_release();
  *(void *)(a1 + 64) = a2[8];
  uint64_t v17 = a2[9];
  sub_2098BE368();
  *(void *)(a1 + 72) = v17;
  swift_bridgeObjectRelease();
  uint64_t v18 = a2[10];
  swift_retain();
  *(void *)(a1 + 80) = v18;
  swift_release();
  uint64_t v19 = a2[11];
  swift_retain();
  *(void *)(a1 + 88) = v19;
  swift_release();
  *(void *)(a1 + 96) = a2[12];
  uint64_t v20 = a2[13];
  sub_2098BE368();
  *(void *)(a1 + 104) = v20;
  swift_bridgeObjectRelease();
  uint64_t v21 = a2[14];
  swift_retain();
  *(void *)(a1 + 112) = v21;
  swift_release();
  uint64_t v22 = a2[15];
  swift_retain();
  *(void *)(a1 + 120) = v22;
  swift_release();
  *(unsigned char *)(a1 + 128) = a2[16] & 1;
  uint64_t v23 = a2[17];
  swift_retain();
  *(void *)(a1 + 136) = v23;
  swift_release();
  uint64_t v24 = a2[18];
  swift_retain();
  *(void *)(a1 + 144) = v24;
  swift_release();
  *(unsigned char *)(a1 + 152) = a2[19] & 1;
  *(unsigned char *)(a1 + 153) = *((unsigned char *)a2 + 153) & 1;
  uint64_t v25 = a2[20];
  swift_retain();
  *(void *)(a1 + 160) = v25;
  swift_release();
  uint64_t v26 = a2[21];
  swift_retain();
  *(void *)(a1 + 168) = v26;
  swift_release();
  *(unsigned char *)(a1 + 176) = a2[22] & 1;
  if (*(void *)(a1 + 184))
  {
    if (a2[23])
    {
      uint64_t v7 = a2[23];
      uint64_t v8 = a2[24];
      swift_retain();
      *(void *)(a1 + 184) = v7;
      *(void *)(a1 + 192) = v8;
      swift_release();
    }
    else
    {
      swift_release();
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 23);
    }
  }
  else if (a2[23])
  {
    uint64_t v5 = a2[23];
    uint64_t v6 = a2[24];
    swift_retain();
    *(void *)(a1 + 184) = v5;
    *(void *)(a1 + 192) = v6;
  }
  else
  {
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 23);
  }
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy200_8(void *a1, const void *a2)
{
}

uint64_t sub_209893F48(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  id v2 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128) & 1;
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  swift_release();
  *(unsigned char *)(a1 + 152) = *(unsigned char *)(a2 + 152) & 1;
  *(unsigned char *)(a1 + 153) = *(unsigned char *)(a2 + 153) & 1;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_release();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_release();
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176) & 1;
  if (*(void *)(a1 + 184))
  {
    if (*(void *)(a2 + 184))
    {
      uint64_t v3 = *(void *)(a2 + 192);
      *(void *)(a1 + 184) = *(void *)(a2 + 184);
      *(void *)(a1 + 192) = v3;
      swift_release();
    }
    else
    {
      swift_release();
      *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    }
  }
  else if (*(void *)(a2 + 184))
  {
    uint64_t v4 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = *(void *)(a2 + 184);
    *(void *)(a1 + 192) = v4;
  }
  else
  {
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  }
  return a1;
}

uint64_t sub_20989422C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 200))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

void *sub_209894344(void *result, int a2, int a3)
{
  int v3 = result + 25;
  if (a2 < 0)
  {
    result[23] = 0;
    result[22] = 0;
    result[21] = 0;
    result[20] = 0;
    result[19] = 0;
    result[18] = 0;
    result[17] = 0;
    result[16] = 0;
    result[15] = 0;
    result[14] = 0;
    result[13] = 0;
    result[12] = 0;
    result[11] = 0;
    result[10] = 0;
    result[9] = 0;
    result[8] = 0;
    result[7] = 0;
    result[6] = 0;
    result[5] = 0;
    result[4] = 0;
    result[3] = 0;
    result[2] = 0;
    result[1] = 0;
    *uint64_t result = a2 + 0x80000000;
    result[24] = 0;
    if (a3 < 0) {
      unsigned char *v3 = 1;
    }
  }
  else
  {
    if (a3 < 0) {
      unsigned char *v3 = 0;
    }
    if (a2) {
      result[1] = (a2 - 1);
    }
  }
  return result;
}

void *type metadata accessor for IdentityBaseView()
{
  return &unk_26BD392B0;
}

unint64_t sub_209894568()
{
  return sub_209890D34();
}

unint64_t sub_209894580()
{
  return sub_20989304C();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_209894598()
{
}

uint64_t sub_2098945D0(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0280) + 36);
  uint64_t v1 = sub_2098BE968();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t sub_20989465C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  swift_retain();
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = a1[1];
  *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
  *(_WORD *)(a2 + 18) = *((_WORD *)a1 + 9);
  uint64_t v5 = a1[3];
  swift_retain();
  *(void *)(a2 + 24) = v5;
  uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0280) + 36);
  uint64_t v2 = sub_2098BE968();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2 + v6, (uint64_t)a1 + v6);
  return a2;
}

uint64_t sub_209894738(uint64_t a1)
{
  if ((*(void *)(a1 + 8) & 0xF000000000000000) != 0xF000000000000000) {
    sub_2097FA618(*(void *)a1, *(void *)(a1 + 8));
  }
  return a1;
}

char *sub_20989478C(char *a1, char *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      memcpy(a2, a1, 0x58uLL);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
      uint64_t v11 = &a2[*(int *)(v7 + 36)];
      uint64_t v10 = &a1[*(int *)(v7 + 36)];
      uint64_t v8 = sub_2098BE968();
      (*(void (**)(char *, char *))(*(void *)(v8 - 8) + 32))(v11, v10);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
LABEL_5:
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
    (*(void (**)(char *, char *))(*(void *)(v4 - 8) + 32))(a2, a1);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
    memcpy(&a2[*(int *)(v5 + 36)], &a1[*(int *)(v5 + 36)], 0x30uLL);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
    *(_WORD *)&a2[*(int *)(v6 + 36)] = *(_WORD *)&a1[*(int *)(v6 + 36)];
    goto LABEL_7;
  }
  memcpy(a2, a1, 0x58uLL);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
  uint64_t v13 = &a2[*(int *)(v2 + 36)];
  uint64_t v12 = &a1[*(int *)(v2 + 36)];
  uint64_t v3 = sub_2098BE968();
  (*(void (**)(char *, char *))(*(void *)(v3 - 8) + 32))(v13, v12);
LABEL_7:
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_209894AE8(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC68);
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

void *sub_209894B9C(const void *a1, void *a2)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC68);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC70);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_209894CC8(uint64_t *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = *a1;
      swift_retain();
      *(void *)a2 = v10;
      *(void *)(a2 + 8) = a1[1];
      *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
      memcpy((void *)(a2 + 24), a1 + 3, 0x32uLL);
      uint64_t v11 = a1[10];
      swift_retain();
      *(void *)(a2 + 80) = v11;
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
      uint64_t v13 = a2 + *(int *)(v7 + 36);
      uint64_t v12 = (uint64_t)a1 + *(int *)(v7 + 36);
      uint64_t v8 = sub_2098BE968();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v13, v12);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
LABEL_5:
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)(v4 - 8) + 16))(a2, a1);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0238);
    memcpy((void *)(a2 + *(int *)(v5 + 36)), (char *)a1 + *(int *)(v5 + 36), 0x30uLL);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0240);
    *(_WORD *)(a2 + *(int *)(v6 + 36)) = *(_WORD *)((char *)a1 + *(int *)(v6 + 36));
    goto LABEL_7;
  }
  uint64_t v14 = *a1;
  swift_retain();
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = a1[1];
  *(_WORD *)(a2 + 16) = *((_WORD *)a1 + 8);
  memcpy((void *)(a2 + 24), a1 + 3, 0x32uLL);
  uint64_t v15 = a1[10];
  swift_retain();
  *(void *)(a2 + 80) = v15;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228);
  uint64_t v17 = a2 + *(int *)(v2 + 36);
  uint64_t v16 = (uint64_t)a1 + *(int *)(v2 + 36);
  uint64_t v3 = sub_2098BE968();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v17, v16);
LABEL_7:
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  return a2;
}

void *sub_2098950DC(const void *a1, void *a2)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC68);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC70);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

char *sub_209895208(void *a1, char *a2)
{
  if (a1[6])
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    a2[16] = *((unsigned char *)a1 + 16);
    uint64_t v7 = a1[3];
    uint64_t v8 = a1[4];
    char v9 = *((unsigned char *)a1 + 40);
    sub_2097EA700(v7, v8, v9 & 1);
    *((void *)a2 + 3) = v7;
    *((void *)a2 + 4) = v8;
    a2[40] = v9 & 1;
    uint64_t v10 = a1[6];
    sub_2098BE368();
    *((void *)a2 + 6) = v10;
    if (a1[10])
    {
      uint64_t v3 = a1[7];
      uint64_t v4 = a1[8];
      char v5 = *((unsigned char *)a1 + 72);
      sub_2097EA700(v3, v4, v5 & 1);
      *((void *)a2 + 7) = v3;
      *((void *)a2 + 8) = v4;
      a2[72] = v5 & 1;
      uint64_t v6 = a1[10];
      sub_2098BE368();
      *((void *)a2 + 10) = v6;
    }
    else
    {
      *(_OWORD *)(a2 + 56) = *(_OWORD *)(a1 + 7);
      *(_OWORD *)(a2 + 72) = *(_OWORD *)(a1 + 9);
    }
  }
  else
  {
    memcpy(a2, a1, 0x58uLL);
  }
  return a2;
}

unint64_t sub_209895374()
{
  uint64_t v2 = qword_2675F0298;
  if (!qword_2675F0298)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0290);
    sub_20989304C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0298);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_209895410()
{
  uint64_t v2 = qword_2675ECC78;
  if (!qword_2675ECC78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECC70);
    sub_20981D9C4();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECC78);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098954A4()
{
  uint64_t v2 = qword_2675ECCA0;
  if (!qword_2675ECCA0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECC98);
    sub_2097FFD00();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECCA0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209895538(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    sub_2097E9C1C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40) & 1);
    swift_bridgeObjectRelease();
    if (*(void *)(a1 + 80))
    {
      sub_2097E9C1C(*(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned char *)(a1 + 72) & 1);
      swift_bridgeObjectRelease();
    }
  }
  return a1;
}

uint64_t sub_2098955D8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0210);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      swift_release();
      swift_release();
      uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
      uint64_t v3 = sub_2098BE968();
      (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(v5);
      return a1;
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0218);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      swift_release();
      swift_release();
      uint64_t v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0228) + 36);
      uint64_t v2 = sub_2098BE968();
      (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v6);
      return a1;
    }
  }
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0220);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

uint64_t sub_2098957DC@<X0>(uint64_t a1@<X8>)
{
  return sub_209891950(*(void *)(v1 + 16), a1);
}

uint64_t sub_2098957E4()
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 200)) {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_2098958D0()
{
  return sub_2098918E4(v0 + 16);
}

uint64_t sub_2098958D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v21 = MEMORY[0x263F1A8A0];
  uint64_t v26 = sub_209895FA8;
  uint64_t v23 = sub_20989636C;
  uint64_t v52 = 0;
  size_t v19 = 40;
  memset(&v51[3], 0, 0x28uLL);
  memcpy(__dst, v40, sizeof(__dst));
  uint64_t v12 = __dst[0];
  uint64_t v16 = __dst[1];
  int v17 = LOBYTE(__dst[2]);
  uint64_t v18 = __dst[3];
  uint64_t v13 = __dst[4];
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A0);
  uint64_t v32 = *(void *)(v34 - 8);
  uint64_t v33 = v34 - 8;
  unint64_t v9 = (*(void *)(v32 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v34);
  uint64_t v35 = (char *)&v9 - v9;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A8);
  unint64_t v10 = (*(void *)(*(void *)(v37 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v37);
  uint64_t v39 = (uint64_t)&v9 - v10;
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B0);
  unint64_t v11 = (*(void *)(*(void *)(v41 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v41);
  uint64_t v43 = (uint64_t)&v9 - v11;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B8);
  uint64_t v15 = *(void *)(*(void *)(v45 - 8) + 64);
  unint64_t v14 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](v40);
  uint64_t v47 = (uint64_t)&v9 - v14;
  uint64_t v2 = MEMORY[0x270FA5388](v1);
  uint64_t v48 = (uint64_t)&v9 - v3;
  uint64_t v52 = (char *)&v9 - v3;
  v51[3] = v4;
  void v51[4] = v16;
  LOBYTE(v51[5]) = v17 & 1;
  v51[6] = v18;
  v51[7] = v5;
  sub_209895F20(v2);
  uint64_t v22 = swift_allocObject();
  memcpy((void *)(v22 + 16), v40, v19);
  sub_209895F20((uint64_t)v40);
  uint64_t v24 = &v49;
  char v50 = v40;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02C0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02C8);
  unint64_t v6 = sub_209896374();
  v51[1] = v20;
  v51[2] = v6;
  swift_getOpaqueTypeConformance2();
  sub_2098BF068();
  sub_209896410((uint64_t)v40);
  uint64_t v7 = sub_209896514(*((unsigned char *)v40 + 16) & 1);
  uint64_t v31 = v51;
  v51[0] = v7;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02D8);
  unint64_t v28 = sub_209896568();
  unint64_t v29 = sub_2098965EC();
  uint64_t v30 = sub_2098698D8();
  sub_2098BEC68();
  sub_2097FF904();
  (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v34);
  uint64_t v36 = *sub_20989667C();
  unint64_t v38 = sub_2098966E0();
  sub_2097F853C();
  sub_2098BECE8();
  sub_209896808(v39);
  uint64_t v42 = sub_209896888(*((unsigned char *)v40 + 16) & 1);
  sub_2098968D8();
  sub_2098BED28();
  swift_release();
  sub_20989697C(v43);
  unint64_t v46 = sub_209896A70();
  sub_2097E7FAC(v47, v45, v48);
  sub_209896B14(v47);
  sub_209896C3C(v48, v47);
  sub_2097E7FAC(v47, v45, v44);
  sub_209896B14(v47);
  return sub_209896B14(v48);
}

uint64_t sub_209895EC4(uint64_t a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 24);
  uint64_t v1 = swift_retain();
  v3(v1);
  return swift_release();
}

uint64_t sub_209895F20(uint64_t a1)
{
  return a1;
}

uint64_t sub_209895F60()
{
  return swift_deallocObject();
}

uint64_t sub_209895FA8()
{
  return sub_209895EC4(v0 + 16);
}

uint64_t sub_209895FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v15 = a1;
  uint64_t v21 = 0;
  uint64_t v32 = MEMORY[0x263F1A8A0];
  char v55 = 0;
  uint64_t v54 = 0;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02C0);
  uint64_t v33 = *(void *)(v39 - 8);
  uint64_t v34 = v39 - 8;
  unint64_t v12 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v15);
  uint64_t v37 = (uint64_t)&v12 - v12;
  unint64_t v13 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = (_OWORD *)MEMORY[0x270FA5388](v2);
  uint64_t v38 = (uint64_t)&v12 - v13;
  char v55 = (char *)&v12 - v13;
  uint64_t v54 = v4;
  long long v56 = *v4;
  sub_209897714();
  unint64_t v14 = &v52;
  long long v52 = v56;
  sub_2097FCD6C();
  uint64_t v48 = sub_2098BEC08();
  uint64_t v49 = v5;
  char v50 = v6;
  uint64_t v51 = v7;
  uint64_t v23 = v45;
  v45[0] = v48;
  v45[1] = v5;
  int v16 = 1;
  int v22 = 1;
  char v46 = v6 & 1;
  uint64_t v47 = v7;
  uint64_t v8 = sub_209896450();
  double v20 = sub_209838254(v8, v9 & 1);
  uint64_t v17 = *sub_2098964B0();
  uint64_t v18 = MEMORY[0x263F1A830];
  uint64_t v19 = MEMORY[0x263F1A820];
  sub_2097F8398();
  uint64_t v24 = &v53;
  int v28 = 0;
  sub_2098BEDF8();
  sub_2097F23B4((uint64_t)v23);
  uint64_t v25 = __dst;
  uint64_t v26 = 144;
  memcpy(__dst, v24, sizeof(__dst));
  unint64_t v29 = v44;
  memcpy(v44, __dst, sizeof(v44));
  sub_2098BEA98();
  uint64_t v27 = v10;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02C8);
  unint64_t v31 = sub_209896374();
  sub_2098BEC78();
  sub_2097F23B4((uint64_t)v29);
  uint64_t v42 = v30;
  unint64_t v43 = v31;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_2097E7FAC(v37, v39, v38);
  uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
  uint64_t v40 = v33 + 8;
  v41(v37, v39);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v37, v38, v39);
  sub_2097E7FAC(v37, v39, v35);
  v41(v37, v39);
  return ((uint64_t (*)(uint64_t, uint64_t))v41)(v38, v39);
}

uint64_t sub_20989636C@<X0>(uint64_t a1@<X8>)
{
  return sub_209895FB0(*(void *)(v1 + 16), a1);
}

unint64_t sub_209896374()
{
  uint64_t v2 = qword_2675F02D0;
  if (!qword_2675F02D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02C8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F02D0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209896410(uint64_t a1)
{
  return a1;
}

uint64_t sub_209896450()
{
  return 0;
}

uint64_t *sub_2098964B0()
{
  if (qword_2675F5B30 != -1) {
    swift_once();
  }
  return &qword_2675F5B38;
}

uint64_t sub_209896514(char a1)
{
  if (a1) {
    return 0;
  }
  else {
    return sub_2098BEF38();
  }
}

unint64_t sub_209896568()
{
  uint64_t v2 = qword_2675F02E0;
  if (!qword_2675F02E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02A0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F02E0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098965EC()
{
  uint64_t v2 = qword_2675F02E8;
  if (!qword_2675F02E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02D8);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F02E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t *sub_20989667C()
{
  if (qword_2675F5B40 != -1) {
    swift_once();
  }
  return &qword_2675F5B48;
}

unint64_t sub_2098966E0()
{
  uint64_t v2 = qword_2675F02F0;
  if (!qword_2675F02F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02A8);
    sub_209896568();
    sub_209896784();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F02F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_209896784()
{
  uint64_t v2 = qword_2675F02F8;
  if (!qword_2675F02F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0300);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F02F8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209896808(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A0);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A8);
  swift_release();
  return a1;
}

uint64_t sub_209896888(char a1)
{
  if (a1) {
    return sub_2098BEF38();
  }
  else {
    return sub_2098BEF58();
  }
}

unint64_t sub_2098968D8()
{
  uint64_t v2 = qword_2675F0308;
  if (!qword_2675F0308)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02B0);
    sub_2098966E0();
    sub_20987252C();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0308);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20989697C(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A0);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A8);
  swift_release();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B0) + 36);
  uint64_t v5 = *(int *)(sub_2098BE6B8() + 20);
  uint64_t v2 = sub_2098BE798();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4 + v5);
  return a1;
}

unint64_t sub_209896A70()
{
  uint64_t v2 = qword_2675F0310;
  if (!qword_2675F0310)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F02B8);
    sub_2098968D8();
    sub_2097E91D8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0310);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_209896B14(uint64_t a1)
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A0);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A8);
  swift_release();
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B0) + 36);
  uint64_t v5 = *(int *)(sub_2098BE6B8() + 20);
  uint64_t v2 = sub_2098BE798();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(a1 + v4 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B8);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_209896C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F02A8) + 36);
  uint64_t v9 = *(void *)(a1 + v8);
  swift_retain();
  uint64_t v3 = a2 + v8;
  *(void *)uint64_t v3 = v9;
  *(_OWORD *)(v3 + 8) = *(_OWORD *)(a1 + v8 + 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B0);
  unint64_t v11 = (char *)(a1 + *(int *)(v4 + 36));
  unint64_t v12 = (char *)(a2 + *(int *)(v4 + 36));
  *(_OWORD *)unint64_t v12 = *(_OWORD *)v11;
  uint64_t v10 = *(int *)(sub_2098BE6B8() + 20);
  uint64_t v5 = sub_2098BE798();
  (*(void (**)(char *, char *))(*(void *)(v5 - 8) + 16))(&v12[v10], &v11[v10]);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EFC00);
  *(_WORD *)&v12[*(int *)(v6 + 36)] = *(_WORD *)&v11[*(int *)(v6 + 36)];
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F02B8) + 36);
  uint64_t v15 = *(void *)(a1 + v14);
  swift_retain();
  *(void *)(a2 + v14) = v15;
  uint64_t v17 = *(void *)(a1 + v14 + 8);
  swift_retain();
  uint64_t result = a2;
  *(void *)(a2 + v14 + 8) = v17;
  return result;
}

uint64_t sub_209896E30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  memset(__b, 0, sizeof(__b));
  sub_2098BE368();
  sub_2098BE368();
  __b[0] = a1;
  __b[1] = a2;
  LOBYTE(__b[2]) = a3 & 1;
  swift_retain();
  swift_retain();
  __b[3] = a4;
  __b[4] = a5;
  sub_2098BE368();
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_20981E52C();
  uint64_t result = a1;
  *(void *)a6 = a1;
  *(void *)(a6 + 8) = a2;
  *(unsigned char *)(a6 + 16) = a3 & 1;
  *(void *)(a6 + 24) = a4;
  *(void *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_209896F84@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_2098958D8(a1);
}

uint64_t sub_209896FCC()
{
  return sub_2098BF8D8();
}

uint64_t sub_209897028()
{
  return sub_209896FCC();
}

double sub_209897048()
{
  double result = 50.0;
  qword_2675F5B38 = 0x4049000000000000;
  return result;
}

double sub_20989705C()
{
  double result = 15.0;
  qword_2675F5B48 = 15.0;
  return result;
}

unint64_t sub_20989706C()
{
  uint64_t v2 = qword_2675F0318;
  if (!qword_2675F0318)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0318);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098970EC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_209897120()
{
  return sub_209897138();
}

unint64_t sub_209897138()
{
  uint64_t v2 = qword_2675F0320;
  if (!qword_2675F0320)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0320);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098971B8()
{
  return swift_release();
}

uint64_t sub_2098971EC(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  sub_2098BE368();
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  return result;
}

uint64_t sub_209897268(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  sub_2098BE368();
  *(void *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  swift_retain();
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  swift_release();
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy40_8(void *a1, const void *a2)
{
}

uint64_t sub_20989732C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16) & 1;
  uint64_t v2 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v2;
  swift_release();
  return a1;
}

uint64_t sub_20989739C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)(a1 + 8))) {
        int v3 = *(void *)(a1 + 8);
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_2098974B4(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)uint64_t result = a2 + 0x80000000;
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)(result + 32) = 0;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 40) = 1;
      }
      else {
        __break(1u);
      }
    }
  }
  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(unsigned char *)(result + 40) = 0;
      }
      else {
        __break(1u);
      }
    }
    if (a2) {
      *(void *)(result + 8) = a2 - 1;
    }
  }
  return result;
}

void *type metadata accessor for ButtonView()
{
  return &unk_26BD393A0;
}

void *type metadata accessor for ButtonType()
{
  return &unk_26BD39440;
}

void *type metadata accessor for ButtonViewConstants()
{
  return &unk_26BD39460;
}

unint64_t sub_2098976FC()
{
  return sub_209896A70();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_209897714()
{
}

void sub_209897740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v55 = a1;
  uint64_t v54 = a2;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v53 = a5;
  uint64_t v65 = 0;
  uint64_t v48 = sub_2097DFE10;
  uint64_t v49 = sub_20989B21C;
  uint64_t v90 = 0;
  uint64_t v91 = 0;
  uint64_t v89 = 0;
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  uint64_t v86 = 0;
  id v83 = 0;
  id v82 = 0;
  uint64_t v50 = 0;
  uint64_t v92 = a6;
  uint64_t v60 = sub_2098BE308();
  uint64_t v58 = *(void *)(v60 - 8);
  uint64_t v59 = v60 - 8;
  unint64_t v56 = (*(void *)(v58 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = (char *)&v23 - v56;
  char v57 = (char *)&v23 - v56;
  uint64_t v90 = MEMORY[0x270FA5388](v55);
  uint64_t v91 = v7;
  uint64_t v89 = v8;
  uint64_t v87 = v9;
  uint64_t v88 = v10;
  uint64_t v86 = v11;
  uint64_t v12 = sub_2098388C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v6, v12, v60);
  char v67 = sub_2098BE2E8();
  int v66 = sub_2098BF728();
  char v63 = &v84;
  uint64_t v84 = 2;
  unint64_t v61 = sub_2097DFBE0();
  unint64_t v62 = sub_2097DFC5C();
  sub_2097DFCD8();
  sub_2098BF448();
  uint32_t v64 = v85;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
  uint64_t v68 = sub_2098BFB28();
  if (os_log_type_enabled(v67, (os_log_type_t)v66))
  {
    uint64_t v13 = v50;
    uint64_t v38 = (uint8_t *)sub_2098BF7D8();
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
    uint64_t v37 = 0;
    uint64_t v39 = sub_2097DFD54(0);
    uint64_t v40 = sub_2097DFD54(v37);
    uint64_t v44 = &v72;
    char v72 = v38;
    uint64_t v45 = &v71;
    uint64_t v71 = v39;
    uint64_t v42 = &v70;
    uint64_t v70 = v40;
    unsigned int v41 = 0;
    sub_2097DFDB0(0, &v72);
    sub_2097DFDB0(v41, v44);
    uint64_t v69 = v68;
    unint64_t v43 = &v23;
    MEMORY[0x270FA5388](&v23);
    uint64_t v14 = v45;
    uint64_t v15 = &v23 - 6;
    char v46 = &v23 - 6;
    v15[2] = (uint64_t)v44;
    v15[3] = (uint64_t)v14;
    v15[4] = v16;
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
    sub_2097DFE40();
    sub_2098BF428();
    if (v13)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_209754000, v67, (os_log_type_t)v66, "printAccountAccessSummary was called. Printing Account Summary on iOS", v38, v64);
      uint64_t v35 = 0;
      sub_2097DFF3C(v39);
      sub_2097DFF3C(v40);
      sub_2098BF7B8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  (*(void (**)(char *, uint64_t))(v58 + 8))(v57, v60);
  uint64_t v25 = 0;
  sub_20989B12C();
  id v34 = sub_209897F98(v25);
  id v83 = v34;
  int v31 = 1;
  sub_2098BF3C8();
  uint64_t v23 = v17;
  id v24 = (id)sub_2098BF358();
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_setJobName_, v24);

  objc_msgSend(v34, sel_setOutputType_, v25);
  objc_msgSend(v34, sel_setOrientation_, v25);
  id v33 = objc_msgSend(self, sel_sharedPrintController);
  id v82 = v33;
  id v18 = v34;
  objc_msgSend(v33, sel_setPrintInfo_, v34);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0330);
  swift_retain();
  uint64_t v80 = v55;
  uint64_t v81 = v54;
  uint64_t v26 = sub_2098BE598();
  uint64_t v27 = sub_2098BE588();
  swift_release();
  objc_msgSend(v33, sel_setPrintingItem_, v27);
  swift_unknownObjectRelease();
  uint64_t v29 = 7;
  uint64_t v30 = swift_allocObject();
  uint64_t v28 = v30 + 16;
  swift_retain();
  swift_weakInit();
  swift_release();
  swift_retain();
  swift_retain();
  uint64_t v19 = (void *)swift_allocObject();
  uint64_t v20 = v52;
  uint64_t v21 = v53;
  int v22 = v49;
  v19[2] = v30;
  v19[3] = v20;
  v19[4] = v21;
  char v78 = v22;
  char v79 = v19;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v74 = 1107296256;
  int v75 = 0;
  char v76 = sub_2098991CC;
  char v77 = &block_descriptor_9;
  uint64_t v32 = _Block_copy(&aBlock);
  swift_release();
  swift_release();
  objc_msgSend(v33, sel_presentAnimated_completionHandler_, v31 & 1, v32);
  _Block_release(v32);
}

id sub_209897F98(uint64_t a1)
{
  if (a1)
  {
    uint64_t v3 = sub_2098BF2B8();
    swift_bridgeObjectRelease();
    int v4 = (void *)v3;
  }
  else
  {
    int v4 = 0;
  }
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_printInfoWithDictionary_, v4);

  return v2;
}

uint64_t sub_209898064(uint64_t a1, int a2, void *a3, uint64_t a4, void (*a5)(void), uint64_t a6)
{
  uint64_t v165 = a1;
  int v164 = a2;
  id v159 = a3;
  uint64_t v160 = a4;
  uint64_t v161 = a5;
  uint64_t v162 = a6;
  uint64_t v149 = sub_2097E1A98;
  char v150 = sub_209813A8C;
  uint64_t v151 = sub_209813AD8;
  char v152 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
  uint64_t v153 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
  uint64_t v154 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E2728;
  char v155 = sub_2097DFE10;
  char v156 = sub_2097DFE10;
  uint64_t v157 = sub_2097DFE10;
  uint64_t v214 = 0;
  char v213 = 0;
  uint64_t v212 = 0;
  uint64_t v211 = 0;
  uint64_t v209 = 0;
  uint64_t v210 = 0;
  uint64_t v163 = 0;
  uint64_t v158 = 0;
  uint64_t v201 = 0;
  id v194 = 0;
  uint64_t v166 = sub_2098BE308();
  uint64_t v167 = *(void *)(v166 - 8);
  uint64_t v168 = v166 - 8;
  uint64_t v174 = *(void *)(v167 + 64);
  unint64_t v169 = (v174 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v165);
  uint64_t v170 = (char *)&v53 - v169;
  unint64_t v171 = v169;
  uint64_t v7 = MEMORY[0x270FA5388](v6);
  v172 = (char *)&v53 - v171;
  unint64_t v173 = (v174 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v7);
  v175 = (char *)&v53 - v173;
  unint64_t v176 = (v174 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  v177 = (char *)&v53 - v176;
  uint64_t v214 = v9;
  char v213 = v10 & 1;
  uint64_t v212 = v11;
  uint64_t v178 = v12 + 16;
  uint64_t v211 = v12 + 16;
  uint64_t v209 = v13;
  uint64_t v210 = v14;
  v179 = &v208;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_endAccess();
  if (Strong)
  {
    uint64_t v148 = Strong;
    uint64_t v140 = v148;
    uint64_t v201 = v148;
    if (v164)
    {
      uint64_t v17 = v175;
      uint64_t v18 = sub_2098388C0();
      (*(void (**)(char *, uint64_t, uint64_t))(v167 + 16))(v17, v18, v166);
      uint64_t v138 = sub_2098BE2E8();
      int v137 = sub_2098BF728();
      uint64_t v135 = &v185;
      uint64_t v185 = 2;
      unint64_t v133 = sub_2097DFBE0();
      unint64_t v134 = sub_2097DFC5C();
      sub_2097DFCD8();
      sub_2098BF448();
      uint32_t v136 = v186;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
      uint64_t v139 = sub_2098BFB28();
      if (os_log_type_enabled(v138, (os_log_type_t)v137))
      {
        uint64_t v19 = v158;
        uint64_t v123 = (uint8_t *)sub_2098BF7D8();
        uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
        uint64_t v122 = 0;
        uint64_t v124 = sub_2097DFD54(0);
        uint64_t v125 = sub_2097DFD54(v122);
        unint64_t v129 = &v184;
        v184 = v123;
        uint64_t v130 = &v183;
        uint64_t v183 = v124;
        uint64_t v127 = &v182;
        uint64_t v182 = v125;
        unsigned int v126 = 0;
        sub_2097DFDB0(0, &v184);
        sub_2097DFDB0(v126, v129);
        uint64_t v181 = v139;
        uint64_t v128 = &v53;
        MEMORY[0x270FA5388](&v53);
        uint64_t v20 = v130;
        uint64_t v21 = &v53 - 6;
        unint64_t v131 = &v53 - 6;
        v21[2] = v129;
        v21[3] = v20;
        v21[4] = v22;
        uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
        sub_2097DFE40();
        sub_2098BF428();
        if (v19)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_209754000, v138, (os_log_type_t)v137, "Successfully printed account recovery summary. Storing timestamp to server...", v123, v136);
          uint64_t v120 = 0;
          sub_2097DFF3C(v124);
          sub_2097DFF3C(v125);
          sub_2098BF7B8();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v167 + 8))(v175, v166);
      sub_209899294();
      swift_retain();
      ((void (*)(uint64_t, void))v161)(1, 0);
      swift_release();
    }
    else
    {
      id v23 = v159;
      if (v159)
      {
        id v119 = v159;
        uint64_t v26 = v170;
        unint64_t v93 = v159;
        id v194 = v159;
        uint64_t v27 = sub_2098388C0();
        (*(void (**)(char *, uint64_t, uint64_t))(v167 + 16))(v26, v27, v166);
        id v28 = v93;
        uint64_t v101 = 7;
        uint64_t v99 = swift_allocObject();
        *(void *)(v99 + 16) = v93;
        sub_2097DEB6C();
        swift_bridgeObjectRelease();
        char v110 = sub_2098BE2E8();
        int v111 = sub_2098BF708();
        uint64_t v96 = &v192;
        uint64_t v192 = 12;
        unint64_t v94 = sub_2097DFBE0();
        unint64_t v95 = sub_2097DFC5C();
        sub_2097DFCD8();
        sub_2098BF448();
        uint32_t v97 = v193;
        uint64_t v98 = 17;
        uint64_t v104 = swift_allocObject();
        *(unsigned char *)(v104 + 16) = 64;
        uint64_t v105 = swift_allocObject();
        *(unsigned char *)(v105 + 16) = 8;
        uint64_t v100 = 32;
        uint64_t v29 = swift_allocObject();
        uint64_t v30 = v99;
        uint64_t v102 = v29;
        *(void *)(v29 + 16) = v149;
        *(void *)(v29 + 24) = v30;
        uint64_t v31 = swift_allocObject();
        uint64_t v32 = v102;
        uint64_t v103 = v31;
        *(void *)(v31 + 16) = v150;
        *(void *)(v31 + 24) = v32;
        uint64_t v33 = swift_allocObject();
        uint64_t v34 = v103;
        uint64_t v107 = v33;
        *(void *)(v33 + 16) = v151;
        *(void *)(v33 + 24) = v34;
        uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
        uint64_t v106 = sub_2098BFB28();
        uint64_t v108 = v35;
        swift_retain();
        uint64_t v36 = v104;
        uint64_t v37 = v108;
        *uint64_t v108 = v152;
        v37[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v36;
        swift_retain();
        uint64_t v38 = v105;
        uint64_t v39 = v108;
        v108[2] = v153;
        v39[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v38;
        swift_retain();
        uint64_t v40 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v107;
        unsigned int v41 = v108;
        v108[4] = v154;
        v41[5] = v40;
        sub_2097E2734();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v110, (os_log_type_t)v111))
        {
          uint64_t v42 = v158;
          uint64_t v86 = (uint8_t *)sub_2098BF7D8();
          uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
          uint64_t v87 = sub_2097DFD54(1);
          uint64_t v88 = sub_2097DFD54(0);
          uint64_t v89 = &v191;
          v191 = v86;
          uint64_t v90 = &v190;
          uint64_t v190 = v87;
          uint64_t v91 = &v189;
          uint64_t v189 = v88;
          sub_2097DFDB0(2, &v191);
          sub_2097DFDB0(1, v89);
          v187 = v152;
          uint64_t v188 = v104;
          sub_2097DFDC4(&v187, (uint64_t)v89, (uint64_t)v90, (uint64_t)v91);
          uint64_t v92 = v42;
          if (v42)
          {
            __break(1u);
          }
          else
          {
            v187 = v153;
            uint64_t v188 = v105;
            sub_2097DFDC4(&v187, (uint64_t)&v191, (uint64_t)&v190, (uint64_t)&v189);
            uint64_t v84 = 0;
            v187 = v154;
            uint64_t v188 = v107;
            sub_2097DFDC4(&v187, (uint64_t)&v191, (uint64_t)&v190, (uint64_t)&v189);
            _os_log_impl(&dword_209754000, v110, (os_log_type_t)v111, "Failed to print account recovery summary. Error: %@", v86, v97);
            sub_2097DFF3C(v87);
            sub_2097DFF3C(v88);
            sub_2098BF7B8();
            swift_release();
            swift_release();
            swift_release();
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
        }

        (*(void (**)(char *, uint64_t))(v167 + 8))(v170, v166);
        swift_retain();
        id v43 = v93;
        int v83 = 1;
        v161(v93);
        sub_20989B728(v93, v83 & 1);
        swift_release();
      }
      else
      {
        id v24 = v172;
        uint64_t v25 = sub_2098388C0();
        (*(void (**)(char *, uint64_t, uint64_t))(v167 + 16))(v24, v25, v166);
        uint64_t v117 = sub_2098BE2E8();
        int v116 = sub_2098BF708();
        char v114 = &v199;
        uint64_t v199 = 2;
        unint64_t v112 = sub_2097DFBE0();
        unint64_t v113 = sub_2097DFC5C();
        sub_2097DFCD8();
        sub_2098BF448();
        uint32_t v115 = v200;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
        uint64_t v118 = sub_2098BFB28();
        if (os_log_type_enabled(v117, (os_log_type_t)v116))
        {
          uint64_t v44 = v158;
          char v73 = (uint8_t *)sub_2098BF7D8();
          uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
          uint64_t v72 = 0;
          uint64_t v74 = sub_2097DFD54(0);
          uint64_t v75 = sub_2097DFD54(v72);
          char v79 = &v198;
          v198 = v73;
          uint64_t v80 = &v197;
          uint64_t v197 = v74;
          char v77 = &v196;
          uint64_t v196 = v75;
          unsigned int v76 = 0;
          sub_2097DFDB0(0, &v198);
          sub_2097DFDB0(v76, v79);
          uint64_t v195 = v118;
          char v78 = &v53;
          MEMORY[0x270FA5388](&v53);
          uint64_t v45 = v80;
          char v46 = &v53 - 6;
          uint64_t v81 = &v53 - 6;
          void v46[2] = v79;
          v46[3] = v45;
          v46[4] = v47;
          uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
          sub_2097DFE40();
          sub_2098BF428();
          if (v44)
          {
            __break(1u);
          }
          else
          {
            _os_log_impl(&dword_209754000, v117, (os_log_type_t)v116, "User tapped Cancel. Printing flow aborted.", v73, v115);
            uint64_t v70 = 0;
            sub_2097DFF3C(v74);
            sub_2097DFF3C(v75);
            sub_2098BF7B8();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }

        (*(void (**)(char *, uint64_t))(v167 + 8))(v172, v166);
        swift_retain();
        sub_20989B6C0();
        id v68 = sub_2097DA9F0();
        int v69 = 1;
        ((void (*)(void))v161)();
        sub_20989B728(v68, v69 & 1);
        swift_release();
      }
    }
    return swift_release();
  }
  else
  {
    uint64_t v15 = v177;
    uint64_t v16 = sub_2098388C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v167 + 16))(v15, v16, v166);
    uint64_t v146 = sub_2098BE2E8();
    int v145 = sub_2098BF708();
    uint64_t v143 = &v206;
    uint64_t v206 = 2;
    unint64_t v141 = sub_2097DFBE0();
    unint64_t v142 = sub_2097DFC5C();
    sub_2097DFCD8();
    sub_2098BF448();
    uint32_t v144 = v207;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
    uint64_t v147 = sub_2098BFB28();
    if (os_log_type_enabled(v146, (os_log_type_t)v145))
    {
      uint64_t v49 = v158;
      uint64_t v58 = (uint8_t *)sub_2098BF7D8();
      uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
      uint64_t v57 = 0;
      uint64_t v59 = sub_2097DFD54(0);
      uint64_t v60 = sub_2097DFD54(v57);
      uint32_t v64 = &v205;
      v205 = v58;
      uint64_t v65 = &v204;
      uint64_t v204 = v59;
      unint64_t v62 = &v203;
      uint64_t v203 = v60;
      unsigned int v61 = 0;
      sub_2097DFDB0(0, &v205);
      sub_2097DFDB0(v61, v64);
      uint64_t v202 = v147;
      char v63 = &v53;
      MEMORY[0x270FA5388](&v53);
      uint64_t v50 = v65;
      uint64_t v51 = &v53 - 6;
      int v66 = &v53 - 6;
      v51[2] = v64;
      v51[3] = v50;
      void v51[4] = v52;
      uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
      sub_2097DFE40();
      sub_2098BF428();
      if (v49)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_209754000, v146, (os_log_type_t)v145, "printAccountAccessSummary: Self is nil.", v58, v144);
        uint64_t v55 = 0;
        sub_2097DFF3C(v59);
        sub_2097DFF3C(v60);
        sub_2098BF7B8();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v167 + 8))(v177, v166);
    swift_retain();
    sub_20989B6C0();
    id v53 = sub_2097DA9F0();
    int v54 = 1;
    ((void (*)(void))v161)();
    sub_20989B728(v53, v54 & 1);
    return swift_release();
  }
}

uint64_t sub_2098991CC(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v9 = *(void (**)(void *, void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = a4;
  if (a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = 0;
  }
  v9(a2, a3 & 1);

  return swift_release();
}

void sub_209899294()
{
  uint64_t v159 = 0;
  unint64_t v141 = sub_20989B390;
  unint64_t v142 = sub_20989B4C4;
  uint64_t v143 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
  uint32_t v144 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
  int v145 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20989B510;
  uint64_t v146 = sub_20989A644;
  uint64_t v147 = sub_2097DFE10;
  uint64_t v148 = "Fatal error";
  uint64_t v149 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  char v150 = "AppleAccountUI/PrintableAccountAccessSummaryInfoHandler.swift";
  uint64_t v196 = 0;
  id v195 = 0;
  id v194 = 0;
  uint64_t v151 = 0;
  uint64_t v186 = 0;
  uint64_t v187 = 0;
  uint64_t v185 = 0;
  uint64_t v181 = 0;
  uint64_t v152 = sub_2098BE308();
  uint64_t v153 = *(void *)(v152 - 8);
  uint64_t v154 = v152 - 8;
  unint64_t v155 = (*(void *)(v153 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v1 = MEMORY[0x270FA5388](0);
  char v156 = (char *)v47 - v155;
  unint64_t v157 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v158 = (char *)v47 - v157;
  uint64_t v160 = sub_2098BE158();
  uint64_t v161 = *(void *)(v160 - 8);
  uint64_t v162 = v160 - 8;
  unint64_t v163 = (*(void *)(v161 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v159);
  int v164 = (char *)v47 - v163;
  uint64_t v196 = v0;
  sub_20989B294();
  id v165 = sub_2097DA9F0();
  id v195 = v165;
  id v166 = objc_msgSend(self, sel_defaultStore);
  if (v166)
  {
    id v140 = v166;
  }
  else
  {
    char v44 = 2;
    uint64_t v45 = 120;
    int v46 = 0;
    sub_2098BF9C8();
    __break(1u);
  }
  id v138 = v140;
  id v139 = objc_msgSend(v140, sel_aa_primaryAppleAccount);

  id v194 = v139;
  id v3 = v139;
  if (v139)
  {
    id v137 = v139;
    id v135 = v139;
    id v136 = objc_msgSend(v139, sel_aa_altDSID);
    if (v136)
    {
      id v134 = v136;
      id v129 = v136;
      uint64_t v130 = sub_2098BF368();
      uint64_t v131 = v4;

      uint64_t v132 = v130;
      uint64_t v133 = v131;
    }
    else
    {
      uint64_t v132 = 0;
      uint64_t v133 = 0;
    }
    uint64_t v126 = v133;
    uint64_t v125 = v132;

    uint64_t v127 = v125;
    uint64_t v128 = v126;
  }
  else
  {
    uint64_t v127 = 0;
    uint64_t v128 = 0;
  }
  uint64_t v123 = v128;
  uint64_t v124 = v127;
  if (v128)
  {
    uint64_t v121 = v124;
    uint64_t v122 = v123;
    uint64_t v84 = v123;
    uint64_t v85 = v124;
    uint64_t v186 = v124;
    uint64_t v187 = v123;
    sub_2098BE148();
    sub_2098BE118();
    uint64_t v103 = v5;
    uint64_t v185 = v5;
    (*(void (**)(char *, uint64_t))(v161 + 8))(v164, v160);
    uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0340);
    uint64_t v88 = 1;
    uint64_t v98 = sub_2098BFB28();
    uint32_t v97 = v6;
    uint64_t v7 = sub_209813CF0();
    uint64_t v86 = *v7;
    uint64_t v87 = v7[1];
    sub_2098BE368();
    uint64_t v8 = v86;
    uint64_t v9 = v87;
    char v10 = v97;
    uint64_t v96 = MEMORY[0x263F8D310];
    v97[3] = MEMORY[0x263F8D310];
    *char v10 = v8;
    v10[1] = v9;
    uint64_t v100 = 0;
    uint64_t v11 = sub_2098BFB18();
    unint64_t v93 = &v183;
    uint64_t v183 = v11;
    uint64_t v184 = v12;
    uint64_t v90 = "";
    int v91 = 1;
    sub_2098BF3C8();
    uint64_t v89 = v13;
    sub_2098BFB08();
    swift_bridgeObjectRelease();
    uint64_t v182 = v103;
    sub_2098BFAF8();
    sub_2098BF3C8();
    uint64_t v92 = v14;
    sub_2098BFB08();
    swift_bridgeObjectRelease();
    uint64_t v95 = v183;
    uint64_t v94 = v184;
    sub_2098BE368();
    sub_2097EBD24();
    uint64_t v15 = sub_2098BF3B8();
    uint64_t v16 = v97;
    uint64_t v17 = v15;
    uint64_t v18 = v98;
    v97[7] = v96;
    v16[4] = v17;
    v16[5] = v19;
    sub_2097E2734();
    uint64_t v101 = v18;
    sub_20989B2FC();
    uint64_t v20 = (void *)sub_2098BF6D8();
    uint64_t v21 = v158;
    id v102 = v20;
    uint64_t v181 = v20;
    uint64_t v22 = sub_2098388C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v21, v22, v152);
    uint64_t v110 = 7;
    uint64_t v111 = swift_allocObject();
    *(void *)(v111 + 16) = v103;
    id v119 = sub_2098BE2E8();
    int v120 = sub_2098BF728();
    uint64_t v106 = &v179;
    uint64_t v179 = 12;
    unint64_t v104 = sub_2097DFBE0();
    unint64_t v105 = sub_2097DFC5C();
    sub_2097DFCD8();
    sub_2098BF448();
    uint32_t v107 = v180;
    uint64_t v108 = 17;
    uint64_t v113 = swift_allocObject();
    *(unsigned char *)(v113 + 16) = 0;
    uint64_t v114 = swift_allocObject();
    *(unsigned char *)(v114 + 16) = 8;
    uint64_t v109 = 32;
    uint64_t v23 = swift_allocObject();
    uint64_t v24 = v111;
    uint64_t v112 = v23;
    *(void *)(v23 + 16) = v141;
    *(void *)(v23 + 24) = v24;
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v112;
    uint64_t v116 = v25;
    *(void *)(v25 + 16) = v142;
    *(void *)(v25 + 24) = v26;
    uint64_t v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
    uint64_t v115 = sub_2098BFB28();
    uint64_t v117 = v27;
    swift_retain();
    uint64_t v28 = v113;
    uint64_t v29 = v117;
    *uint64_t v117 = v143;
    v29[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v28;
    swift_retain();
    uint64_t v30 = v114;
    uint64_t v31 = v117;
    v117[2] = v144;
    v31[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v30;
    swift_retain();
    uint64_t v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v116;
    uint64_t v33 = v117;
    v117[4] = v145;
    v33[5] = v32;
    sub_2097E2734();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v119, (os_log_type_t)v120))
    {
      uint64_t v34 = v151;
      char v77 = (uint8_t *)sub_2098BF7D8();
      uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
      uint64_t v76 = 0;
      uint64_t v78 = sub_2097DFD54(0);
      uint64_t v79 = sub_2097DFD54(v76);
      uint64_t v80 = &v171;
      unint64_t v171 = v77;
      uint64_t v81 = &v170;
      uint64_t v170 = v78;
      uint64_t v82 = &v169;
      uint64_t v169 = v79;
      sub_2097DFDB0(0, &v171);
      sub_2097DFDB0(1, v80);
      uint64_t v167 = v143;
      uint64_t v168 = v113;
      sub_2097DFDC4(&v167, (uint64_t)v80, (uint64_t)v81, (uint64_t)v82);
      uint64_t v83 = v34;
      if (v34)
      {
        __break(1u);
      }
      else
      {
        uint64_t v167 = v144;
        uint64_t v168 = v114;
        sub_2097DFDC4(&v167, (uint64_t)&v171, (uint64_t)&v170, (uint64_t)&v169);
        uint64_t v74 = 0;
        uint64_t v167 = v145;
        uint64_t v168 = v116;
        sub_2097DFDC4(&v167, (uint64_t)&v171, (uint64_t)&v170, (uint64_t)&v169);
        _os_log_impl(&dword_209754000, v119, (os_log_type_t)v120, "Print date: %f", v77, v107);
        uint64_t v73 = 0;
        sub_2097DFF3C(v78);
        sub_2097DFF3C(v79);
        sub_2098BF7B8();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, uint64_t))(v153 + 8))(v158, v152);
    id v35 = v165;
    if (v165)
    {
      id v72 = v165;
      id v71 = v165;
      id v36 = v102;
      uint64_t v37 = sub_209813C0C();
      uint64_t v66 = *v37;
      uint64_t v67 = v37[1];
      sub_2098BE368();
      id v70 = (id)sub_2098BF358();
      swift_bridgeObjectRelease();
      sub_2098BE368();
      id v69 = (id)sub_2098BF358();
      swift_bridgeObjectRelease();
      v177 = v146;
      uint64_t v178 = 0;
      uint64_t aBlock = MEMORY[0x263EF8330];
      int v173 = 1107296256;
      int v174 = 0;
      v175 = sub_2097DED24;
      unint64_t v176 = &block_descriptor_23;
      id v68 = _Block_copy(&aBlock);
      objc_msgSend(v71, sel_setConfigurationInfo_forIdentifier_forAltDSID_completion_, v102, v70, v69);
      _Block_release(v68);

      swift_unknownObjectRelease();
    }

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v38 = v156;
    uint64_t v39 = sub_2098388C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v153 + 16))(v38, v39, v152);
    uint32_t v64 = sub_2098BE2E8();
    int v63 = sub_2098BF708();
    unsigned int v61 = &v192;
    uint64_t v192 = 2;
    unint64_t v59 = sub_2097DFBE0();
    unint64_t v60 = sub_2097DFC5C();
    sub_2097DFCD8();
    sub_2098BF448();
    uint32_t v62 = v193;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
    uint64_t v65 = sub_2098BFB28();
    if (os_log_type_enabled(v64, (os_log_type_t)v63))
    {
      uint64_t v40 = v151;
      uint64_t v49 = (uint8_t *)sub_2098BF7D8();
      v47[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
      uint64_t v48 = 0;
      uint64_t v50 = sub_2097DFD54(0);
      uint64_t v51 = sub_2097DFD54(v48);
      uint64_t v55 = &v191;
      v191 = v49;
      uint64_t v56 = &v190;
      uint64_t v190 = v50;
      id v53 = &v189;
      uint64_t v189 = v51;
      unsigned int v52 = 0;
      sub_2097DFDB0(0, &v191);
      sub_2097DFDB0(v52, v55);
      uint64_t v188 = v65;
      int v54 = v47;
      MEMORY[0x270FA5388](v47);
      unsigned int v41 = v56;
      uint64_t v42 = &v47[-6];
      uint64_t v57 = &v47[-6];
      v42[2] = v55;
      v42[3] = v41;
      v42[4] = v43;
      uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
      sub_2097DFE40();
      sub_2098BF428();
      if (v40)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_209754000, v64, (os_log_type_t)v63, "AltDSID nil. Aborting storePrintDate flow.", v49, v62);
        v47[0] = 0;
        sub_2097DFF3C(v50);
        sub_2097DFF3C(v51);
        sub_2098BF7B8();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    (*(void (**)(char *, uint64_t))(v153 + 8))(v156, v152);
  }
}

uint64_t sub_20989A644(unsigned int a1, void *a2)
{
  unsigned int v81 = a1;
  id v80 = a2;
  uint64_t v73 = sub_2097E1A98;
  uint64_t v74 = sub_2097E2598;
  uint64_t v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
  uint64_t v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
  char v77 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E2728;
  uint64_t v78 = sub_2097DFE10;
  char v103 = 0;
  uint64_t v102 = 0;
  uint64_t v79 = 0;
  uint64_t v82 = sub_2098BE308();
  uint64_t v83 = *(void *)(v82 - 8);
  uint64_t v84 = v82 - 8;
  unint64_t v85 = (*(void *)(v83 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v81);
  uint64_t v86 = (char *)v28 - v85;
  unint64_t v87 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  char v4 = MEMORY[0x270FA5388](v2);
  uint64_t v88 = (char *)v28 - v87;
  char v103 = v4 & 1;
  uint64_t v102 = v5;
  if (v4)
  {
    uint64_t v6 = v88;
    uint64_t v7 = sub_2098388C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v6, v7, v82);
    id v71 = sub_2098BE2E8();
    int v70 = sub_2098BF728();
    id v68 = &v93;
    uint64_t v93 = 2;
    unint64_t v66 = sub_2097DFBE0();
    unint64_t v67 = sub_2097DFC5C();
    sub_2097DFCD8();
    sub_2098BF448();
    uint32_t v69 = v94;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
    uint64_t v72 = sub_2098BFB28();
    if (os_log_type_enabled(v71, (os_log_type_t)v70))
    {
      uint64_t v8 = v79;
      uint64_t v56 = (uint8_t *)sub_2098BF7D8();
      uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
      uint64_t v55 = 0;
      uint64_t v57 = sub_2097DFD54(0);
      uint64_t v58 = sub_2097DFD54(v55);
      uint32_t v62 = &v92;
      uint64_t v92 = v56;
      int v63 = &v91;
      uint64_t v91 = v57;
      unint64_t v60 = &v90;
      uint64_t v90 = v58;
      unsigned int v59 = 0;
      sub_2097DFDB0(0, &v92);
      sub_2097DFDB0(v59, v62);
      uint64_t v89 = v72;
      unsigned int v61 = v28;
      MEMORY[0x270FA5388](v28);
      uint64_t v9 = v63;
      char v10 = &v28[-6];
      uint32_t v64 = &v28[-6];
      v10[2] = v62;
      v10[3] = v9;
      v10[4] = v11;
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
      sub_2097DFE40();
      sub_2098BF428();
      if (v8)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_209754000, v71, (os_log_type_t)v70, "Successfully stored account summary print date.", v56, v69);
        uint64_t v53 = 0;
        sub_2097DFF3C(v57);
        sub_2097DFF3C(v58);
        sub_2098BF7B8();
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v88, v82);
  }
  else
  {
    uint64_t v13 = v86;
    uint64_t v14 = sub_2098388C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v83 + 16))(v13, v14, v82);
    id v15 = v80;
    uint64_t v42 = 7;
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v80;
    sub_2097DEB6C();
    swift_bridgeObjectRelease();
    uint64_t v51 = sub_2098BE2E8();
    int v52 = sub_2098BF708();
    uint64_t v38 = &v100;
    uint64_t v100 = 12;
    unint64_t v36 = sub_2097DFBE0();
    unint64_t v37 = sub_2097DFC5C();
    sub_2097DFCD8();
    sub_2098BF448();
    uint32_t v39 = v101;
    uint64_t v40 = 17;
    uint64_t v45 = swift_allocObject();
    *(unsigned char *)(v45 + 16) = 64;
    uint64_t v46 = swift_allocObject();
    *(unsigned char *)(v46 + 16) = 8;
    uint64_t v41 = 32;
    uint64_t v16 = swift_allocObject();
    uint64_t v17 = v43;
    uint64_t v44 = v16;
    *(void *)(v16 + 16) = v73;
    *(void *)(v16 + 24) = v17;
    uint64_t v18 = swift_allocObject();
    uint64_t v19 = v44;
    uint64_t v48 = v18;
    *(void *)(v18 + 16) = v74;
    *(void *)(v18 + 24) = v19;
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
    uint64_t v47 = sub_2098BFB28();
    uint64_t v49 = v20;
    swift_retain();
    uint64_t v21 = v45;
    uint64_t v22 = v49;
    uint8_t *v49 = v75;
    v22[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v21;
    swift_retain();
    uint64_t v23 = v46;
    uint64_t v24 = v49;
    v49[2] = v76;
    v24[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v23;
    swift_retain();
    uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v48;
    uint64_t v26 = v49;
    v49[4] = v77;
    v26[5] = v25;
    sub_2097E2734();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v51, (os_log_type_t)v52))
    {
      uint64_t v27 = v79;
      uint64_t v29 = (uint8_t *)sub_2098BF7D8();
      v28[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
      uint64_t v30 = sub_2097DFD54(1);
      uint64_t v31 = sub_2097DFD54(0);
      uint64_t v32 = &v99;
      uint64_t v99 = v29;
      uint64_t v33 = &v98;
      uint64_t v98 = v30;
      uint64_t v34 = &v97;
      uint64_t v97 = v31;
      sub_2097DFDB0(2, &v99);
      sub_2097DFDB0(1, v32);
      uint64_t v95 = v75;
      uint64_t v96 = v45;
      sub_2097DFDC4(&v95, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34);
      uint64_t v35 = v27;
      if (v27)
      {
        __break(1u);
      }
      else
      {
        uint64_t v95 = v76;
        uint64_t v96 = v46;
        sub_2097DFDC4(&v95, (uint64_t)&v99, (uint64_t)&v98, (uint64_t)&v97);
        v28[1] = 0;
        uint64_t v95 = v77;
        uint64_t v96 = v48;
        sub_2097DFDC4(&v95, (uint64_t)&v99, (uint64_t)&v98, (uint64_t)&v97);
        _os_log_impl(&dword_209754000, v51, (os_log_type_t)v52, "Failed to store account summary print date. Error: %@", v29, v39);
        sub_2097DFF3C(v30);
        sub_2097DFF3C(v31);
        sub_2098BF7B8();
        swift_release();
        swift_release();
        swift_release();
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v86, v82);
  }
}

unint64_t sub_20989B12C()
{
  uint64_t v2 = qword_2675F0328;
  if (!qword_2675F0328)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F0328);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_20989B194()
{
  return swift_deallocObject();
}

uint64_t sub_20989B1D4()
{
  return swift_deallocObject();
}

uint64_t sub_20989B21C(uint64_t a1, char a2, void *a3)
{
  return sub_209898064(a1, a2 & 1, a3, *(void *)(v3 + 16), *(void (**)(void))(v3 + 24), *(void *)(v3 + 32));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

unint64_t sub_20989B294()
{
  uint64_t v2 = qword_2675F0338;
  if (!qword_2675F0338)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F0338);
    return ObjCClassMetadata;
  }
  return v2;
}

unint64_t sub_20989B2FC()
{
  uint64_t v2 = qword_2675F0348;
  if (!qword_2675F0348)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F0348);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_20989B364()
{
  return swift_deallocObject();
}

uint64_t sub_20989B390(uint64_t a1)
{
  return nullsub_1(a1);
}

uint64_t sub_20989B398(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_20989B3C0(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  uint64_t v5 = *a1;
  sub_2098BF7F8();
  uint64_t result = a1;
  *a1 = v5 + 8;
  return result;
}

uint64_t sub_20989B42C()
{
  return swift_deallocObject();
}

uint64_t sub_20989B458()
{
  return swift_deallocObject();
}

uint64_t sub_20989B484()
{
  return swift_deallocObject();
}

uint64_t sub_20989B4C4()
{
  return sub_20989B398(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_20989B4D0()
{
  return swift_deallocObject();
}

void *sub_20989B510(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_20989B3C0(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t block_copy_helper_21(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_22()
{
  return swift_release();
}

uint64_t type metadata accessor for PrintableAccountAccessSummaryInfoHandler()
{
  return self;
}

uint64_t sub_20989B5A8()
{
  return swift_deallocObject();
}

uint64_t sub_20989B5E8()
{
  return swift_deallocObject();
}

uint64_t sub_20989B614()
{
  return swift_deallocObject();
}

uint64_t sub_20989B640()
{
  return swift_deallocObject();
}

uint64_t sub_20989B680()
{
  return swift_deallocObject();
}

unint64_t sub_20989B6C0()
{
  uint64_t v2 = qword_2675F0350;
  if (!qword_2675F0350)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F0350);
    return ObjCClassMetadata;
  }
  return v2;
}

void sub_20989B728(void *a1, char a2)
{
  if (a2) {
}
  }

uint64_t sub_20989B75C()
{
  return swift_deallocObject();
}

uint64_t sub_20989B79C()
{
  return swift_deallocObject();
}

uint64_t sub_20989B7C8()
{
  return swift_deallocObject();
}

uint64_t sub_20989B7F4()
{
  return swift_deallocObject();
}

uint64_t sub_20989B834()
{
  return swift_deallocObject();
}

uint64_t sub_20989B874()
{
  return swift_deallocObject();
}

Swift::Void __swiftcall RemoteUIController.registerAppleAccountAvatarPickerView()()
{
}

unint64_t sub_20989B924()
{
  uint64_t v2 = qword_2675F0358;
  if (!qword_2675F0358)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0358);
    return WitnessTable;
  }
  return v2;
}

void sub_20989B9A0(void *a1)
{
  swift_getObjectType();
  id v2 = a1;
  RemoteUIController.registerAppleAccountAvatarPickerView()();
}

Swift::Void __swiftcall RemoteUIController.registerSIWASharingTipView()()
{
}

unint64_t sub_20989BABC()
{
  uint64_t v2 = qword_2675F0360;
  if (!qword_2675F0360)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0360);
    return WitnessTable;
  }
  return v2;
}

void sub_20989BB38(void *a1)
{
  swift_getObjectType();
  id v2 = a1;
  RemoteUIController.registerSIWASharingTipView()();
}

Swift::Void __swiftcall RemoteUIController.addAccountUserInfo(account:)(ACAccount account)
{
  id v3 = (id)sub_2098BF758();
  uint64_t v1 = account.super.isa;
  sub_20989BBE0(account.super.isa);
}

void sub_20989BBE0(void *a1)
{
  id v1 = a1;
  sub_20989BC54();
  sub_2098BF788();
}

unint64_t sub_20989BC54()
{
  uint64_t v2 = qword_2675F0368;
  if (!qword_2675F0368)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0368);
    return WitnessTable;
  }
  return v2;
}

void sub_20989BCD4(void *a1, uint64_t a2, void *a3)
{
  swift_getObjectType();
  id v4 = a3;
  id v5 = a1;
  RemoteUIController.addAccountUserInfo(account:)((ACAccount)a3);
}

id sub_20989BD34()
{
  sub_20980C484();
  id result = sub_2097DA9F0();
  qword_2675F6F28 = (uint64_t)result;
  return result;
}

uint64_t *sub_20989BD68()
{
  if (qword_2675F5CD0 != -1) {
    swift_once();
  }
  return &qword_2675F6F28;
}

void *sub_20989BDCC()
{
  uint64_t v2 = (void *)*sub_20989BD68();
  id v0 = v2;
  return v2;
}

void *sub_20989BDFC@<X0>(void *a1@<X8>)
{
  id result = sub_20989BDCC();
  *a1 = result;
  return result;
}

uint64_t sub_20989BE28()
{
  sub_20989BC54();
  sub_2098BF778();
  return v1;
}

void (*sub_20989BE74(uint64_t *a1))(id *a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_20989BE28();
  return sub_20989BED0;
}

void sub_20989BED0(id *a1, char a2)
{
  if (a2)
  {
    id v3 = *a1;
    id v2 = *a1;
    sub_20989BBE0(v3);
  }
  else
  {
    sub_20989BBE0(*a1);
  }
}

void *type metadata accessor for AccountInformationKey()
{
  return &unk_26BD397A0;
}

uint64_t sub_20989BF54()
{
  type metadata accessor for EDPRecoveryTokenModel();
  uint64_t result = sub_20989C000();
  qword_2675F6F30 = result;
  return result;
}

uint64_t type metadata accessor for EDPRecoveryTokenModel()
{
  uint64_t v1 = qword_2675F6300;
  if (!qword_2675F6300) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_20989C000()
{
  return sub_20989CA60();
}

uint64_t *sub_20989C03C()
{
  if (qword_2675F5D60 != -1) {
    swift_once();
  }
  return &qword_2675F6F30;
}

uint64_t sub_20989C0A0()
{
  uint64_t v1 = *sub_20989C03C();
  swift_retain();
  return v1;
}

uint64_t sub_20989C0D0()
{
  return sub_2098BF3C8();
}

uint64_t sub_20989C100()
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 16);
  sub_20989CAF0(v2, *(void *)(v0 + 24), *(unsigned char *)(v0 + 32));
  swift_endAccess();
  return v2;
}

uint64_t sub_20989C168(uint64_t a1, uint64_t a2, char a3)
{
  sub_20989CAF0(a1, a2, a3);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v5 = *(void *)(v3 + 24);
  char v6 = *(unsigned char *)(v3 + 32);
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(unsigned char *)(v3 + 32) = a3;
  sub_20989CB78(v4, v5, v6);
  swift_endAccess();
  return sub_20989CB78(a1, a2, a3);
}

uint64_t (*sub_20989C1F0())()
{
  return sub_2097F99C8;
}

uint64_t sub_20989C24C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = a3;
  return sub_20989CB78(a1, a2, a3);
}

uint64_t sub_20989C2B4()
{
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v0 + 160))();
  swift_release();
  swift_beginAccess();
  uint64_t v3 = *(void *)(v2 + 16);
  sub_20989CAF0(v3, *(void *)(v2 + 24), *(unsigned char *)(v2 + 32));
  swift_endAccess();
  return v3;
}

uint64_t sub_20989C378@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v2 = swift_retain();
  *(void *)a2 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 120))(v2);
  *(void *)(a2 + 8) = v3;
  *(unsigned char *)(a2 + 16) = v4;
  return swift_release();
}

uint64_t sub_20989C400(uint64_t a1)
{
  sub_2098A3208(a1, (uint64_t)v5);
  uint64_t v2 = v5[0];
  uint64_t v3 = v5[1];
  char v4 = v6;
  swift_retain();
  sub_20989C480(v2, v3, v4);
  return swift_release();
}

uint64_t sub_20989C480(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  char v17 = a3;
  uint64_t v14 = v3;
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  sub_20989CAF0(a1, a2, a3);
  uint64_t v10 = v3;
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  char v13 = a3;
  (*(void (**)(uint64_t, uint64_t (*)(), unsigned char *, uint64_t))(*(void *)v3 + 168))(KeyPath, sub_20989CC00, v9, MEMORY[0x263F8EE60] + 8);
  swift_release();
  sub_20989CB78(a1, a2, a3);
  swift_release();
  return sub_20989CB78(a1, a2, a3);
}

uint64_t sub_20989C5C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_20989CAF0(a2, a3, a4);
  sub_20989CAF0(a2, a3, a4);
  swift_beginAccess();
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  char v6 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  *(unsigned char *)(a1 + 32) = a4;
  sub_20989CB78(v4, v5, v6);
  swift_endAccess();
  return sub_20989CB78(a2, a3, a4);
}

void (*sub_20989C6A0(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v7 = malloc(0x40uLL);
  *a1 = v7;
  v7[5] = v1;
  uint64_t v6 = sub_2098BE248();
  uint64_t v4 = *(void *)(v6 - 8);
  uint64_t v5 = malloc(*(void *)(v4 + 64));
  v7[6] = v5;
  swift_getKeyPath();
  (*(void (**)(void))(*(void *)v1 + 160))();
  swift_release();
  (*(void (**)(void *, uint64_t, uint64_t))(v4 + 16))(v5, v3 + OBJC_IVAR____TtC14AppleAccountUI21EDPRecoveryTokenModel___observationRegistrar, v6);
  v7[4] = v3;
  swift_getKeyPath();
  sub_20989CC34();
  sub_2098BE228();
  swift_release();
  (*(void (**)(void *, uint64_t))(v4 + 8))(v5, v6);
  v7[7] = sub_20989C1F0();
  return sub_20989C868;
}

void sub_20989C868(uint64_t *a1, char a2)
{
  uint64_t v6 = *a1;
  if (a2)
  {
    uint64_t v3 = *(void **)(v6 + 48);
    uint64_t v2 = *(void *)(v6 + 40);
    (*(void (**)(uint64_t, void))(v6 + 56))(v6, 0);
    sub_20989C924(v2);
    free(v3);
  }
  else
  {
    uint64_t v5 = *(void **)(v6 + 48);
    uint64_t v4 = *(void *)(v6 + 40);
    (*(void (**)(uint64_t, void))(v6 + 56))(v6, 0);
    sub_20989C924(v4);
    free(v5);
  }
  free((void *)v6);
}

uint64_t sub_20989C924(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v12 = 0;
  uint64_t v10 = sub_2098BE248();
  uint64_t v7 = *(void *)(v10 - 8);
  uint64_t v8 = v10 - 8;
  unint64_t v3 = (*(void *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v9 = (char *)&v2 - v3;
  uint64_t v12 = v4;
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v2 - v3, v4 + OBJC_IVAR____TtC14AppleAccountUI21EDPRecoveryTokenModel___observationRegistrar);
  uint64_t v5 = &v11;
  uint64_t v11 = v4;
  uint64_t KeyPath = swift_getKeyPath();
  sub_20989CC34();
  sub_2098BE218();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v10);
}

uint64_t sub_20989CA60()
{
  uint64_t v1 = sub_2098BF3C8();
  sub_20989C24C(v1, v2, 0, v0 + 16);
  sub_2098BE238();
  return v4;
}

uint64_t sub_20989CAF0(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3 || a3 == 1 || a3 == 2) {
    return sub_2098BE368();
  }
  return result;
}

uint64_t sub_20989CB78(uint64_t a1, uint64_t a2, char a3)
{
  if (!a3 || a3 == 1 || a3 == 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20989CC00()
{
  return sub_20989C5C4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

unint64_t sub_20989CC34()
{
  uint64_t v2 = qword_2675F0370;
  if (!qword_2675F0370)
  {
    type metadata accessor for EDPRecoveryTokenModel();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0370);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_20989CCB8()
{
  return sub_2098BE238();
}

uint64_t sub_20989CCD0()
{
  v1[25] = v0;
  v1[17] = v1;
  v1[18] = 0;
  v1[19] = 0;
  v1[21] = 0;
  v1[15] = 0;
  v1[16] = 0;
  v1[23] = 0;
  uint64_t v2 = sub_2098BE308();
  v1[26] = v2;
  v1[27] = *(void *)(v2 - 8);
  v1[28] = swift_task_alloc();
  v1[18] = v0;
  sub_2098BF5B8();
  v1[29] = sub_2098BF5A8();
  uint64_t v5 = sub_2098BF578();
  v1[30] = v5;
  v1[31] = v3;
  return MEMORY[0x270FA2498](sub_20989CE18, v5, v3);
}

uint64_t sub_20989CE18()
{
  v0[17] = v0;
  sub_2098119C0();
  id v1 = objc_msgSend(self, sel_cdpContextForPrimaryAccount);
  id v10 = sub_20989DC38(v1);
  v0[32] = v10;
  v0[19] = v10;
  uint64_t v2 = sub_2098BF3C8();
  sub_20989C480(v2, v3, 0);
  id v4 = v10;
  if (v10)
  {
    *(void *)(v9 + 16) = *(void *)(v9 + 136);
    *(void *)(v9 + 56) = v9 + 160;
    *(void *)(v9 + 24) = sub_20989D1A8;
    *(void *)(v9 + 112) = swift_continuation_init();
    *(void *)(v9 + 80) = MEMORY[0x263EF8330];
    *(_DWORD *)(v9 + 88) = 0x40000000;
    *(_DWORD *)(v9 + 92) = 0;
    *(void *)(v9 + 96) = sub_20989DCFC;
    *(void *)(v9 + 104) = &block_descriptor_1;
    objc_msgSend(v10, sel_fetchEDPTokenWithCompletion_);
    return __swift_continuation_await_point();
  }
  else
  {
    uint64_t v6 = sub_2098BF3C8();
    sub_20989C480(v6, v7, 2);

    swift_release();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(*(void *)(v9 + 136) + 8);
    return v8();
  }
}

uint64_t sub_20989D1A8()
{
  uint64_t v6 = (void *)*v0;
  v6[17] = *v0;
  uint64_t v1 = v6[6];
  v6[33] = v1;
  if (v1)
  {
    uint64_t v2 = v6[31];
    uint64_t v3 = v6[30];
    id v4 = sub_20989D520;
  }
  else
  {
    uint64_t v2 = v6[31];
    uint64_t v3 = v6[30];
    id v4 = sub_20989D308;
  }
  return MEMORY[0x270FA2498](v4, v3, v2);
}

uint64_t sub_20989D308()
{
  uint64_t v1 = (void *)v0[32];
  v0[17] = v0;
  uint64_t v10 = v0[20];

  if (v10)
  {
    *(void *)(v9 + 168) = v10;
    *(void *)(v9 + 176) = v10;
    sub_2098BF3C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEDA0);
    sub_20989DC78();
    uint64_t v7 = sub_2098BF318();
    uint64_t v8 = v2;
    swift_bridgeObjectRelease();
    *(void *)(v9 + 120) = v7;
    *(void *)(v9 + 128) = v8;
    sub_20989C480(v7, v8, 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = sub_2098BF3C8();
    sub_20989C480(v3, v4, 2);
  }

  swift_release();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v9 + 136) + 8);
  return v5();
}

uint64_t sub_20989D520()
{
  uint64_t v35 = v0;
  id v19 = *(id *)(v0 + 264);
  id v16 = *(id *)(v0 + 256);
  uint64_t v15 = *(void *)(v0 + 224);
  uint64_t v17 = *(void *)(v0 + 216);
  uint64_t v18 = *(void *)(v0 + 208);
  *(void *)(v0 + 136) = v0;
  swift_willThrow();

  id v1 = v19;
  *(void *)(v0 + 184) = v19;
  uint64_t v2 = sub_2098388C0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v2, v18);
  id v3 = v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v19;
  sub_2097DEB6C();
  swift_bridgeObjectRelease();
  uint64_t v28 = sub_2098BE2E8();
  os_log_type_t v29 = sub_2098BF708();
  *(void *)(v0 + 192) = 12;
  sub_2097DFBE0();
  sub_2097DFC5C();
  sub_2097DFCD8();
  sub_2098BF448();
  uint32_t size = *(_DWORD *)(v0 + 272);
  uint64_t v24 = swift_allocObject();
  *(unsigned char *)(v24 + 16) = 64;
  uint64_t v25 = swift_allocObject();
  *(unsigned char *)(v25 + 16) = 8;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = sub_2097E1A98;
  *(void *)(v22 + 24) = v21;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = sub_209813A8C;
  *(void *)(v23 + 24) = v22;
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = sub_209813AD8;
  *(void *)(v26 + 24) = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
  sub_2098BFB28();
  uint64_t v27 = v4;
  swift_retain();
  void *v27 = sub_2097E22B8;
  v27[1] = v24;
  swift_retain();
  v27[2] = sub_2097E22B8;
  v27[3] = v25;
  swift_retain();
  v27[4] = sub_2097E2728;
  v27[5] = v26;
  sub_2097E2734();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v28, v29))
  {
    buf = (uint8_t *)sub_2098BF7D8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
    uint64_t v12 = sub_2097DFD54(1);
    uint64_t v13 = sub_2097DFD54(0);
    uint64_t v30 = buf;
    uint64_t v31 = v12;
    uint64_t v32 = v13;
    sub_2097DFDB0(2, &v30);
    sub_2097DFDB0(1, &v30);
    uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
    uint64_t v34 = v24;
    sub_2097DFDC4(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E22B8;
    uint64_t v34 = v25;
    sub_2097DFDC4(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    uint64_t v33 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2097E2728;
    uint64_t v34 = v26;
    sub_2097DFDC4(&v33, (uint64_t)&v30, (uint64_t)&v31, (uint64_t)&v32);
    _os_log_impl(&dword_209754000, v28, v29, "error when fetching the token with error=%@...", buf, size);
    sub_2097DFF3C(v12);
    sub_2097DFF3C(v13);
    sub_2098BF7B8();
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
  }
  id v10 = *(id *)(v14 + 264);
  uint64_t v8 = *(void *)(v14 + 224);
  uint64_t v9 = *(void *)(v14 + 208);
  uint64_t v7 = *(void *)(v14 + 216);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  swift_release();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(v14 + 136) + 8);
  return v5();
}

id sub_20989DC38(void *a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_2098A0850(a1);
}

unint64_t sub_20989DC78()
{
  uint64_t v2 = qword_2675F0380;
  if (!qword_2675F0380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675EEDA0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0380);
    return WitnessTable;
  }
  return v2;
}

void sub_20989DCFC(uint64_t a1, id a2, void *a3)
{
  id v3 = a2;
  id v4 = a3;
  uint64_t v14 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0458);
    sub_2097F631C(v14, (uint64_t)a3, v8);
  }
  else
  {
    id v5 = a2;
    if (a2)
    {
      uint64_t v9 = sub_2098BF498();

      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v15 = v10;
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0458);
    sub_2097F6378(v14, (uint64_t)&v15, v6);
  }
}

uint64_t sub_20989DE30()
{
  return swift_deallocObject();
}

uint64_t sub_20989DE70(void *a1)
{
  uint64_t v6 = a1;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  uint64_t v4 = *a1;
  uint64_t v11 = sub_2098BE248();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  uint64_t v1 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v4 - v2;
  uint64_t v15 = v1;
  uint64_t v14 = *(void *)(v4 + *MEMORY[0x263F8EA20] + 8);
  uint64_t v13 = v5;
  (*(void (**)(char *, uint64_t))(v8 + 16))((char *)&v4 - v2, v5 + OBJC_IVAR____TtC14AppleAccountUI21EDPRecoveryTokenModel___observationRegistrar);
  id v7 = &v12;
  uint64_t v12 = v5;
  sub_20989CC34();
  sub_2098BE208();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

uint64_t sub_20989DFE0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v17 = a5;
  uint64_t v18 = a1;
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  uint64_t v31 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  uint64_t v32 = a4;
  uint64_t v13 = *a1;
  uint64_t v11 = sub_2098BE248();
  uint64_t v14 = *(void *)(v11 - 8);
  uint64_t v12 = v11 - 8;
  uint64_t v5 = MEMORY[0x270FA5388](v18);
  uint64_t v15 = (char *)v10 - v6;
  uint64_t v31 = v5;
  uint64_t v30 = *(void *)(v13 + *MEMORY[0x263F8EA20] + 8);
  uint64_t v28 = v7;
  uint64_t v29 = v20;
  uint64_t v27 = v16;
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)v10 - v6, v16 + OBJC_IVAR____TtC14AppleAccountUI21EDPRecoveryTokenModel___observationRegistrar);
  uint64_t v23 = &v26;
  uint64_t v26 = v16;
  sub_20989CC34();
  uint64_t v8 = v22;
  sub_2098BE1F8();
  uint64_t v24 = v8;
  uint64_t v25 = v8;
  if (v8) {
    v10[1] = v25;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v15, v11);
}

uint64_t sub_20989E1FC()
{
  sub_2098A09B0(v0 + 16);
  uint64_t v3 = OBJC_IVAR____TtC14AppleAccountUI21EDPRecoveryTokenModel___observationRegistrar;
  uint64_t v1 = sub_2098BE248();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

uint64_t sub_20989E27C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_20989E2E4()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EDPTokenRowElement() + 20));
  sub_2098BE368();
  return v2;
}

uint64_t sub_20989E32C()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for EDPTokenRowElement() + 24));
  sub_2098BE368();
  return v2;
}

uint64_t sub_20989E374@<X0>(uint64_t a1@<X8>)
{
  uint64_t v51 = a1;
  uint64_t v65 = 0;
  uint64_t v53 = &unk_2675F03B0;
  uint64_t v54 = MEMORY[0x263F1AAD0];
  uint64_t v55 = MEMORY[0x263F1B280];
  uint64_t v56 = sub_2098A1810;
  uint64_t v57 = &unk_2675F0400;
  uint64_t v109 = 0;
  uint64_t v108 = 0;
  uint32_t v107 = 0;
  uint64_t v106 = 0;
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0388);
  unint64_t v59 = (*(void *)(*(void *)(v58 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](0);
  unint64_t v60 = (char *)&v22 - v59;
  unint64_t v61 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v62 = (uint64_t)&v22 - v61;
  unint64_t v63 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v4);
  uint32_t v64 = (char *)&v22 - v63;
  uint64_t v109 = (char *)&v22 - v63;
  uint64_t v66 = sub_2098BF5E8();
  uint64_t v67 = *(void *)(v66 - 8);
  uint64_t v68 = v66 - 8;
  unint64_t v69 = (*(void *)(v67 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v65);
  int v70 = (char *)&v22 - v69;
  uint64_t v86 = type metadata accessor for EDPTokenRowElement();
  uint64_t v71 = *(void *)(v86 - 8);
  uint64_t v72 = v71;
  uint64_t v73 = *(void *)(v71 + 64);
  unint64_t v74 = (v73 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v86);
  uint64_t v75 = (uint64_t)&v22 - v74;
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0390);
  unint64_t v77 = (*(void *)(*(void *)(v76 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v76);
  uint64_t v78 = (uint64_t)&v22 - v77;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0398);
  unint64_t v80 = (*(void *)(*(void *)(v79 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v79);
  uint64_t v81 = (uint64_t)&v22 - v80;
  unint64_t v82 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v22 - v80);
  uint64_t v83 = (uint64_t)&v22 - v82;
  unint64_t v84 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v22 - v82);
  uint64_t v85 = (uint64_t)&v22 - v84;
  uint64_t v108 = (char *)&v22 - v84;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03A0);
  unint64_t v88 = (*(void *)(*(void *)(v87 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = MEMORY[0x270FA5388](v86);
  uint64_t v89 = (uint64_t)&v22 - v88;
  unint64_t v90 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v91 = (uint64_t *)((char *)&v22 - v90);
  uint32_t v107 = (char *)&v22 - v90;
  uint64_t v106 = v1;
  uint64_t v11 = *(void *)(v1 + *(int *)(v10 + 28));
  uint64_t v92 = v11;
  uint64_t v12 = swift_retain();
  uint64_t v93 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 120))(v12);
  uint64_t v94 = v13;
  int v95 = v14;
  swift_release();
  if (!(_BYTE)v95)
  {
    uint64_t v49 = v93;
    uint64_t v50 = v94;
    uint64_t v43 = v93;
    uint64_t v44 = v94;
LABEL_6:
    uint64_t v42 = v44;
    uint64_t v29 = v43;
    uint64_t v102 = v43;
    uint64_t v103 = v44;
    sub_2098BE368();
    unint64_t v37 = &v22;
    MEMORY[0x270FA5388](&v22);
    uint64_t v15 = &v22 - 4;
    uint64_t v34 = &v22 - 4;
    v15[2] = v29;
    v15[3] = v16;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
    uint64_t v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F03F0);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675EEFC0);
    uint64_t v31 = sub_2098BE8C8();
    unint64_t v17 = sub_20981CBFC();
    uint64_t v98 = v30;
    uint64_t v99 = v31;
    unint64_t v100 = v17;
    uint64_t v101 = MEMORY[0x263F1A0D8];
    uint64_t v33 = 1;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v96 = v32;
    uint64_t v97 = OpaqueTypeConformance2;
    uint64_t v36 = swift_getOpaqueTypeConformance2();
    sub_2097F8518();
    sub_2098BF0B8();
    swift_bridgeObjectRelease();
    sub_2098A0A60(v52, v75);
    unint64_t v38 = (*(unsigned __int8 *)(v72 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
    uint64_t v40 = swift_allocObject();
    sub_2098A0CB4(v75, v40 + v38);
    unint64_t v39 = sub_2098A10D8();
    sub_20983ACD4();
    sub_2098BEDB8();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v66);
    swift_release();
    sub_2098A1A48(v78);
    unint64_t v41 = sub_2098A1034();
    sub_2097E7FAC(v83, v79, v85);
    sub_2098A1AC4(v83);
    sub_2098A1BC0(v85, v81);
    sub_2097E7FAC(v81, v79, v83);
    sub_2098A1AC4(v81);
    unint64_t v19 = sub_2098A0E54();
    sub_2097E8280(v83, v79, v58, v41, v19, v89);
    sub_2098A1AC4(v83);
    sub_2098A115C(v89, (uint64_t)v91);
    sub_2098A1AC4(v85);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (v95 == 1)
  {
    uint64_t v47 = v93;
    uint64_t v48 = v94;
    uint64_t v43 = v93;
    uint64_t v44 = v94;
    goto LABEL_6;
  }
  uint64_t v45 = v93;
  uint64_t v46 = v94;
  uint64_t v28 = v94;
  uint64_t v104 = v93;
  uint64_t v105 = v94;
  sub_2098BF1B8();
  sub_2098A0A60(v52, v75);
  unint64_t v23 = (*(unsigned __int8 *)(v72 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
  uint64_t v26 = swift_allocObject();
  sub_2098A0CB4(v75, v26 + v23);
  uint64_t v24 = MEMORY[0x263F1BA08];
  uint64_t v25 = MEMORY[0x263F1BA00];
  sub_20983ACD4();
  sub_2098BEDB8();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v70, v66);
  swift_release();
  unint64_t v27 = sub_2098A0E54();
  sub_2097E7FAC(v62, v58, (uint64_t)v64);
  sub_2098A0EF4(v62);
  sub_2098A0F78(v64, v60);
  sub_2097E7FAC((uint64_t)v60, v58, v62);
  sub_2098A0EF4((uint64_t)v60);
  unint64_t v20 = sub_2098A1034();
  sub_2097E8378(v62, v79, v58, v20, v27, v89);
  sub_2098A0EF4(v62);
  sub_2098A115C(v89, (uint64_t)v91);
  sub_2098A0EF4((uint64_t)v64);
  swift_bridgeObjectRelease();
LABEL_7:
  sub_2098A1388(v91, v89);
  sub_2098A15E0();
  sub_2097E7FAC(v89, v87, v51);
  sub_2098A1684(v89);
  return sub_2098A1684((uint64_t)v91);
}

uint64_t sub_20989EF5C(uint64_t a1)
{
  v1[4] = a1;
  v1[2] = v1;
  v1[3] = 0;
  v1[3] = a1;
  sub_2098BF5B8();
  v1[5] = sub_2098BF5A8();
  uint64_t v4 = sub_2098BF578();
  v1[6] = v4;
  v1[7] = v2;
  return MEMORY[0x270FA2498](sub_20989F018, v4, v2);
}

uint64_t sub_20989F018()
{
  uint64_t v4 = v0[4];
  v0[2] = v0;
  uint64_t v1 = *(void *)(v4 + *(int *)(type metadata accessor for EDPTokenRowElement() + 28));
  v0[8] = v1;
  swift_retain();
  uint64_t v6 = (uint64_t (*)(void))(*(void *)(*(void *)v1 + 152) + **(int **)(*(void *)v1 + 152));
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v5 + 72) = v2;
  *uint64_t v2 = *(void *)(v5 + 16);
  v2[1] = sub_20989F15C;
  return v6();
}

uint64_t sub_20989F15C()
{
  uint64_t v4 = *v0;
  *(void *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(void *)(v4 + 56);
  uint64_t v2 = *(void *)(v4 + 48);
  return MEMORY[0x270FA2498](sub_20989F2BC, v2, v1);
}

uint64_t sub_20989F2BC()
{
  *(void *)(v0 + 16) = v0;
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(*(void *)(v0 + 16) + 8);
  return v1();
}

uint64_t sub_20989F34C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v21 = a3;
  uint64_t v87 = a1;
  uint64_t v86 = a2;
  uint64_t v70 = 0;
  uint64_t v22 = MEMORY[0x263F1AAD0];
  uint64_t v23 = MEMORY[0x263F1B280];
  uint64_t v179 = 0;
  uint64_t v177 = 0;
  uint64_t v178 = 0;
  uint64_t v24 = sub_2098BE698();
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = v24 - 8;
  unint64_t v27 = (*(void *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v28 = (char *)v18 - v27;
  uint64_t v84 = sub_2098BE8C8();
  uint64_t v81 = *(void *)(v84 - 8);
  uint64_t v82 = v84 - 8;
  unint64_t v29 = (*(void *)(v81 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v84);
  uint64_t v83 = (char *)v18 - v29;
  unint64_t v30 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675EEAE0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v70);
  uint64_t v55 = (uint64_t)v18 - v30;
  uint64_t v58 = sub_2098BEB28();
  uint64_t v56 = *(void *)(v58 - 8);
  uint64_t v57 = v58 - 8;
  unint64_t v31 = (*(void *)(v56 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v58);
  unint64_t v59 = (char *)v18 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03F0);
  uint64_t v33 = *(void *)(v32 - 8);
  uint64_t v34 = v32 - 8;
  unint64_t v35 = (*(void *)(v33 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v32);
  uint64_t v78 = (char *)v18 - v35;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
  uint64_t v37 = *(void *)(v36 - 8);
  uint64_t v38 = v36 - 8;
  uint64_t v42 = *(void *)(v37 + 64);
  unint64_t v39 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v3 = MEMORY[0x270FA5388](v86);
  uint64_t v40 = (uint64_t)v18 - v39;
  unint64_t v41 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v43 = (uint64_t)v18 - v41;
  unint64_t v44 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v45 = (uint64_t)v18 - v44;
  uint64_t v179 = (char *)v18 - v44;
  uint64_t v177 = v6;
  uint64_t v178 = v5;
  sub_2098BE368();
  uint64_t v46 = v146;
  v146[0] = v87;
  v146[1] = v86;
  sub_2097FCD6C();
  uint64_t v142 = sub_2098BEC08();
  uint64_t v143 = v7;
  unsigned __int8 v144 = v8;
  uint64_t v145 = v9;
  uint64_t v48 = v142;
  uint64_t v49 = v7;
  int v47 = v8;
  uint64_t v50 = v9;
  uint64_t v138 = v142;
  uint64_t v139 = v7;
  int v77 = 1;
  char v140 = v8 & 1;
  uint64_t v141 = v9;
  uint64_t v134 = sub_2098BEBB8();
  uint64_t v135 = v10;
  unsigned __int8 v136 = v11;
  uint64_t v137 = v12;
  uint64_t v61 = v134;
  uint64_t v62 = v10;
  int v63 = v11;
  uint64_t v64 = v12;
  sub_2097E9C1C(v48, v49, v47 & 1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v59, *MEMORY[0x263F1A6C8], v58);
  unsigned int v51 = *MEMORY[0x263F1A5F8];
  uint64_t v54 = sub_2098BEA58();
  uint64_t v52 = *(void *)(v54 - 8);
  uint64_t v53 = v54 - 8;
  (*(void (**)(uint64_t, void))(v52 + 104))(v55, v51);
  uint64_t v13 = *(void (**)(uint64_t))(v52 + 56);
  int v74 = 0;
  v13(v55);
  uint64_t v60 = sub_2098BEAB8();
  sub_2097FCDE8(v55);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v59, v58);
  uint64_t v130 = v61;
  uint64_t v131 = v62;
  char v132 = v63 & 1 & v77;
  uint64_t v133 = v64;
  uint64_t v126 = sub_2098BEBC8();
  uint64_t v127 = v14;
  unsigned __int8 v128 = v15;
  uint64_t v129 = v16;
  uint64_t v65 = v126;
  uint64_t v66 = v14;
  int v67 = v15;
  uint64_t v68 = v16;
  swift_release();
  sub_2097E9C1C(v61, v62, v63 & 1);
  swift_bridgeObjectRelease();
  unint64_t v69 = v123;
  v123[0] = v65;
  v123[1] = v66;
  char v124 = v67 & 1 & v77;
  uint64_t v125 = v68;
  sub_2098BED78();
  sub_2097F23B4((uint64_t)v69);
  uint64_t v73 = v118;
  v118[0] = v146[2];
  v118[1] = v146[3];
  char v119 = v147 & 1 & v77;
  uint64_t v120 = v148;
  uint64_t v121 = v149;
  char v122 = v150;
  int v72 = sub_2098BE9A8();
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEF80);
  sub_20981C928();
  sub_2098BEE58();
  sub_20981C9C8((uint64_t)v73);
  uint64_t v76 = v107;
  v107[0] = v151;
  v107[1] = v152;
  char v108 = v153 & 1 & v77;
  uint64_t v109 = v154;
  uint64_t v110 = v155;
  char v111 = v156;
  char v112 = v157;
  uint64_t v113 = v158;
  uint64_t v114 = v159;
  uint64_t v115 = v160;
  uint64_t v116 = v161;
  char v117 = v162 & 1 & v77;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEF90);
  sub_20981CA1C();
  sub_2098BEEB8();
  sub_20981C9C8((uint64_t)v76);
  uint64_t v85 = v94;
  v94[0] = v163;
  v94[1] = v164;
  char v95 = v165 & 1 & v77;
  uint64_t v96 = v166;
  uint64_t v97 = v167;
  char v98 = v168;
  char v99 = v169;
  uint64_t v100 = v170;
  uint64_t v101 = v171;
  uint64_t v102 = v172;
  uint64_t v103 = v173;
  char v104 = v174 & 1 & v77;
  char v105 = v175 & v77;
  char v106 = v176 & v77;
  sub_20989FDD8();
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEFC0);
  unint64_t v80 = sub_20981CBFC();
  sub_2098BED08();
  (*(void (**)(char *, uint64_t))(v81 + 8))(v83, v84);
  sub_20981C9C8((uint64_t)v85);
  if (sub_2098BF3E8())
  {
    sub_2098BE688();
  }
  else
  {
    uint64_t v20 = sub_2098BFB28();
    sub_2098A3184();
    sub_2098BF838();
  }
  uint64_t v90 = v79;
  uint64_t v91 = v84;
  unint64_t v92 = v80;
  uint64_t v93 = MEMORY[0x263F1A0D8];
  v18[1] = 1;
  v18[0] = swift_getOpaqueTypeConformance2();
  sub_2098BEE98();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v28, v24);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v78, v32);
  uint64_t v88 = v32;
  uint64_t v89 = v18[0];
  v18[2] = swift_getOpaqueTypeConformance2();
  sub_2097E7FAC(v43, v36, v45);
  unint64_t v19 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
  v18[3] = v37 + 8;
  v19(v43, v36);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v40, v45, v36);
  sub_2097E7FAC(v40, v36, v21);
  v19(v40, v36);
  return ((uint64_t (*)(uint64_t, uint64_t))v19)(v45, v36);
}

uint64_t sub_20989FDD8()
{
  return sub_2098BE8B8();
}

BOOL sub_20989FDF0()
{
  sub_2098BFB28();
  *(void *)uint64_t v0 = "label";
  *(void *)(v0 + 8) = 5;
  *(unsigned char *)(v0 + 16) = 2;
  sub_2097E2734();
  uint64_t v2 = sub_2098BFAB8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 != 0;
}

uint64_t sub_20989FED4()
{
  sub_2098BE368();
  if (sub_20989FDF0())
  {
    swift_bridgeObjectRelease();
    char v1 = 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_20989FF5C()
{
  return 1;
}

uint64_t sub_20989FF74()
{
  return 0;
}

uint64_t sub_20989FF80()
{
  return sub_2098BF3C8();
}

uint64_t sub_20989FFB4()
{
  return sub_20989FF80();
}

uint64_t sub_20989FFCC()
{
  return sub_2098BFB48() & 1;
}

uint64_t sub_2098A0018()
{
  return sub_2098BF458();
}

uint64_t sub_2098A0058()
{
  return sub_2098BF478();
}

uint64_t sub_2098A00A0()
{
  return sub_2098BF468();
}

BOOL sub_2098A00E8@<W0>(unsigned char *a1@<X8>)
{
  BOOL result = sub_20989FDF0();
  *a1 = result;
  return result;
}

uint64_t sub_2098A0128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20989FF80();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_2098A0158()
{
  return sub_20989FFB4();
}

uint64_t sub_2098A0170@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20989FED4();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2098A01A4()
{
  return sub_20989FF74();
}

uint64_t sub_2098A01C0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_20989FF5C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_2098A01F4()
{
  return sub_2098BFC28();
}

uint64_t sub_2098A0224()
{
  return sub_2098BFC38();
}

uint64_t sub_2098A0254@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a2;
  uint64_t v48 = a1;
  int v63 = 0;
  uint64_t v62 = 0;
  uint64_t v60 = 0;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0418);
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = v35 - 8;
  unint64_t v38 = (*(void *)(v36 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v35);
  unint64_t v39 = (char *)v21 - v38;
  int v63 = (char *)v21 - v38;
  uint64_t v40 = 0;
  uint64_t v41 = sub_2098BF298();
  uint64_t v42 = *(void *)(v41 - 8);
  uint64_t v43 = v41 - 8;
  unint64_t v44 = (*(void *)(v42 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v40);
  uint64_t v45 = (char *)v21 - v44;
  uint64_t v46 = type metadata accessor for EDPTokenRowElement();
  unint64_t v47 = (*(void *)(*(void *)(v46 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v46);
  uint64_t v50 = (uint64_t)v21 - v47;
  uint64_t v62 = (char *)v21 - v47;
  char v61 = 0;
  uint64_t v60 = v3;
  uint64_t v49 = *(int *)(v2 + 28);
  uint64_t v51 = *sub_20989C03C();
  swift_retain();
  uint64_t v4 = v48;
  char v61 = 8;
  *(void *)(v50 + v49) = v51;
  uint64_t v54 = v4[3];
  uint64_t v52 = v4[4];
  __swift_project_boxed_opaque_existential_0(v4, v54);
  uint64_t v5 = v53;
  uint64_t v6 = sub_2098BFBE8();
  uint64_t v55 = v5;
  uint64_t v56 = v6;
  uint64_t v57 = v7;
  uint64_t v58 = v5;
  if (v5)
  {
    uint64_t v22 = v58;
  }
  else
  {
    unsigned __int8 v8 = v48;
    uint64_t v9 = v57;
    uint64_t v10 = (uint64_t *)(v50 + *(int *)(v46 + 20));
    char v61 = 10;
    *uint64_t v10 = v56;
    v10[1] = v9;
    unint64_t v31 = v59;
    sub_2097EBD50((uint64_t)v8, (uint64_t)v59);
    uint64_t v11 = v55;
    sub_2098BF288();
    uint64_t v32 = v11;
    uint64_t v33 = v11;
    if (v11)
    {
      uint64_t v22 = v33;
    }
    else
    {
      char v61 = 11;
      (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v50, v45, v41);
      uint64_t v27 = v48[3];
      uint64_t v28 = v48[4];
      __swift_project_boxed_opaque_existential_0(v48, v27);
      sub_2098A1DAC();
      uint64_t v12 = v32;
      sub_2098BFC08();
      uint64_t v29 = v12;
      uint64_t v30 = v12;
      if (!v12)
      {
        uint64_t v13 = sub_2098BFAC8();
        uint64_t v23 = 0;
        uint64_t v24 = v13;
        uint64_t v25 = v14;
        uint64_t v26 = 0;
        uint64_t v15 = v35;
        uint64_t v16 = v39;
        uint64_t v17 = v36;
        uint64_t v18 = v25;
        unint64_t v19 = (uint64_t *)(v50 + *(int *)(v46 + 24));
        char v61 = 15;
        uint64_t *v19 = v24;
        v19[1] = v18;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v16, v15);
        sub_2098A0A60(v50, v34);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
        return sub_2098A1E2C(v50);
      }
      uint64_t v22 = v30;
    }
  }
  v21[1] = v22;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v48);
  if (v61) {
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v50, v41);
  }
  if ((v61 & 2) != 0) {
    sub_2097EBD24();
  }
  return swift_release();
}

uint64_t sub_2098A07B0@<X0>(uint64_t a1@<X8>)
{
  return sub_20989E374(a1);
}

uint64_t sub_2098A07C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2098A0254(a1, a2);
}

uint64_t sub_2098A0820@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_20989E2E4();
  *a1 = result;
  a1[1] = v2;
  return result;
}

id sub_2098A0850(void *a1)
{
  id v4 = objc_msgSend(v1, sel_initWithContext_);

  return v4;
}

uint64_t sub_2098A0898()
{
  return swift_deallocObject();
}

uint64_t sub_2098A08C4()
{
  return swift_deallocObject();
}

uint64_t sub_2098A08F0()
{
  return swift_deallocObject();
}

uint64_t sub_2098A0930()
{
  return swift_deallocObject();
}

uint64_t sub_2098A0970()
{
  return swift_deallocObject();
}

uint64_t sub_2098A09B0(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for EDPTokenRowElement()
{
  uint64_t v1 = qword_2675F6310;
  if (!qword_2675F6310) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_2098A0A60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v11 = (int *)type metadata accessor for EDPTokenRowElement();
  uint64_t v3 = (void *)(a1 + v11[5]);
  uint64_t v6 = (void *)(a2 + v11[5]);
  void *v6 = *v3;
  uint64_t v7 = v3[1];
  sub_2098BE368();
  v6[1] = v7;
  uint64_t v4 = v11[6];
  uint64_t v9 = a2 + v4;
  *(void *)(a2 + v4) = *(void *)(a1 + v4);
  uint64_t v10 = *(void *)(a1 + v4 + 8);
  sub_2098BE368();
  *(void *)(v9 + 8) = v10;
  uint64_t v13 = v11[7];
  uint64_t v14 = *(void *)(a1 + v13);
  swift_retain();
  uint64_t result = a2;
  *(void *)(a2 + v13) = v14;
  return result;
}

uint64_t sub_2098A0B80()
{
  type metadata accessor for EDPTokenRowElement();
  uint64_t v0 = sub_2098BF298();
  (*(void (**)(void))(*(void *)(v0 - 8) + 8))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

__n128 sub_2098A0CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  uint64_t v3 = (int *)type metadata accessor for EDPTokenRowElement();
  *(_OWORD *)(a2 + v3[5]) = *(_OWORD *)(a1 + v3[5]);
  __n128 result = *(__n128 *)(a1 + v3[6]);
  *(__n128 *)(a2 + v3[6]) = result;
  *(void *)(a2 + v3[7]) = *(void *)(a1 + v3[7]);
  return result;
}

uint64_t sub_2098A0D5C()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = *(void *)(type metadata accessor for EDPTokenRowElement() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  void *v3 = *(void *)(v5 + 16);
  v3[1] = sub_2097DBA54;
  return sub_20989EF5C(v0 + v6);
}

unint64_t sub_2098A0E54()
{
  uint64_t v2 = qword_2675F03B8;
  if (!qword_2675F03B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0388);
    sub_20983AEFC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F03B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A0EF4(uint64_t a1)
{
  swift_release();
  uint64_t v3 = *(int *)(sub_2098BE5C8() + 20);
  uint64_t v1 = sub_2098BF5E8();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

char *sub_2098A0F78(char *a1, char *a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *((void *)a1 + 1);
  swift_retain();
  *(void *)a2 = v4;
  *((void *)a2 + 1) = v5;
  uint64_t v6 = *(int *)(sub_2098BE5C8() + 20);
  uint64_t v2 = sub_2098BF5E8();
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(&a2[v6], &a1[v6]);
  return a2;
}

unint64_t sub_2098A1034()
{
  uint64_t v2 = qword_2675F03C0;
  if (!qword_2675F03C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0398);
    sub_2098A10D8();
    sub_20983AEFC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F03C0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A10D8()
{
  uint64_t v2 = qword_2675F03C8;
  if (!qword_2675F03C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0390);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F03C8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A115C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = *(void *)(a1 + 8);
    *(void *)a2 = *(void *)a1;
    *(void *)(a2 + 8) = v8;
    uint64_t v9 = sub_2098BE5C8();
    uint64_t v13 = a2 + *(int *)(v9 + 20);
    uint64_t v12 = a1 + *(int *)(v9 + 20);
    uint64_t v10 = sub_2098BF5E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v13, v12);
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 16);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D8);
    uint64_t v15 = a2 + *(int *)(v2 + 44);
    uint64_t v14 = a1 + *(int *)(v2 + 44);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(v15, v14);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0398);
    uint64_t v16 = (void *)(a2 + *(int *)(v4 + 36));
    uint64_t v17 = (void *)(a1 + *(int *)(v4 + 36));
    uint64_t v5 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v5;
    uint64_t v6 = sub_2098BE5C8();
    unint64_t v19 = (char *)v16 + *(int *)(v6 + 20);
    uint64_t v18 = (char *)v17 + *(int *)(v6 + 20);
    uint64_t v7 = sub_2098BF5E8();
    (*(void (**)(char *, char *))(*(void *)(v7 - 8) + 32))(v19, v18);
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_2098A1388(uint64_t *a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = *a1;
    uint64_t v11 = a1[1];
    swift_retain();
    *(void *)a2 = v10;
    *(void *)(a2 + 8) = v11;
    uint64_t v7 = sub_2098BE5C8();
    uint64_t v13 = a2 + *(int *)(v7 + 20);
    uint64_t v12 = (uint64_t)a1 + *(int *)(v7 + 20);
    uint64_t v8 = sub_2098BF5E8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 16))(v13, v12);
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(unsigned char *)(a2 + 16) = *((unsigned char *)a1 + 16);
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D8);
    uint64_t v15 = a2 + *(int *)(v2 + 44);
    uint64_t v14 = (uint64_t)a1 + *(int *)(v2 + 44);
    uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v15, v14);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0398);
    uint64_t v18 = (void *)(a2 + *(int *)(v4 + 36));
    unint64_t v19 = (uint64_t *)((char *)a1 + *(int *)(v4 + 36));
    uint64_t v16 = *v19;
    uint64_t v17 = v19[1];
    swift_retain();
    void *v18 = v16;
    v18[1] = v17;
    uint64_t v5 = sub_2098BE5C8();
    uint64_t v21 = (char *)v18 + *(int *)(v5 + 20);
    uint64_t v20 = (char *)v19 + *(int *)(v5 + 20);
    uint64_t v6 = sub_2098BF5E8();
    (*(void (**)(char *, char *))(*(void *)(v6 - 8) + 16))(v21, v20);
  }
  swift_storeEnumTagMultiPayload();
  return a2;
}

unint64_t sub_2098A15E0()
{
  uint64_t v2 = qword_2675F03E8;
  if (!qword_2675F03E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F03A0);
    sub_2098A1034();
    sub_2098A0E54();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F03E8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A1684(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    swift_release();
    uint64_t v5 = a1 + *(int *)(sub_2098BE5C8() + 20);
    uint64_t v3 = sub_2098BF5E8();
    (*(void (**)(uint64_t))(*(void *)(v3 - 8) + 8))(v5);
  }
  else
  {
    uint64_t v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D8) + 44);
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
    (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v6);
    uint64_t v7 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0398) + 36);
    swift_release();
    uint64_t v8 = v7 + *(int *)(sub_2098BE5C8() + 20);
    uint64_t v2 = sub_2098BF5E8();
    (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v8);
  }
  return a1;
}

uint64_t sub_2098A1810@<X0>(uint64_t a1@<X8>)
{
  return sub_20989F34C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t sub_2098A181C()
{
  type metadata accessor for EDPTokenRowElement();
  uint64_t v0 = sub_2098BF298();
  (*(void (**)(void))(*(void *)(v0 - 8) + 8))();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2098A1950()
{
  uint64_t v5 = v1;
  *(void *)(v1 + 16) = v1;
  uint64_t v2 = *(void *)(type metadata accessor for EDPTokenRowElement() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v3;
  void *v3 = *(void *)(v5 + 16);
  v3[1] = sub_2097DBA54;
  return sub_20989EF5C(v0 + v6);
}

uint64_t sub_2098A1A48(uint64_t a1)
{
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D8) + 44);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

uint64_t sub_2098A1AC4(uint64_t a1)
{
  uint64_t v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D8) + 44);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v4);
  uint64_t v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0398) + 36);
  swift_release();
  uint64_t v6 = *(int *)(sub_2098BE5C8() + 20);
  uint64_t v2 = sub_2098BF5E8();
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v5 + v6);
  return a1;
}

uint64_t sub_2098A1BC0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 16);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F03D8) + 44);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F03E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2 + v5, a1 + v5);
  uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0398) + 36);
  uint64_t v8 = *(void *)(a1 + v7);
  uint64_t v9 = *(void *)(a1 + v7 + 8);
  swift_retain();
  uint64_t v10 = (void *)(a2 + v7);
  *uint64_t v10 = v8;
  v10[1] = v9;
  uint64_t v11 = *(int *)(sub_2098BE5C8() + 20);
  uint64_t v3 = sub_2098BF5E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a2 + v7 + v11, a1 + v7 + v11);
  return a2;
}

unint64_t sub_2098A1D2C()
{
  uint64_t v2 = qword_2675F0408;
  if (!qword_2675F0408)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0408);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A1DAC()
{
  uint64_t v2 = qword_2675F0410;
  if (!qword_2675F0410)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0410);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A1E2C(uint64_t a1)
{
  uint64_t v1 = sub_2098BF298();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for EDPTokenRowElement();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

unint64_t sub_2098A1EDC()
{
  return sub_2098A1EF4();
}

unint64_t sub_2098A1EF4()
{
  uint64_t v2 = qword_2675F0420;
  if (!qword_2675F0420)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0420);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A1F74()
{
  return sub_2098A1F8C();
}

unint64_t sub_2098A1F8C()
{
  uint64_t v2 = qword_2675F0428;
  if (!qword_2675F0428)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0428);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A200C()
{
  return sub_2098A2024();
}

unint64_t sub_2098A2024()
{
  uint64_t v2 = qword_2675F0430;
  if (!qword_2675F0430)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0430);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A20A4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2098A20D8()
{
  return sub_2098A20F0();
}

unint64_t sub_2098A20F0()
{
  uint64_t v2 = qword_2675F0438;
  if (!qword_2675F0438)
  {
    type metadata accessor for EDPTokenRowElement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0438);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A2174()
{
  return sub_2098A218C();
}

unint64_t sub_2098A218C()
{
  uint64_t v2 = qword_2675F0440;
  if (!qword_2675F0440)
  {
    type metadata accessor for EDPTokenRowElement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0440);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A2210()
{
  return sub_2098A2228();
}

unint64_t sub_2098A2228()
{
  uint64_t v2 = qword_2675F0448;
  if (!qword_2675F0448)
  {
    type metadata accessor for EDPTokenRowElement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0448);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A22AC()
{
  return type metadata accessor for EDPRecoveryTokenModel();
}

uint64_t sub_2098A22C8()
{
  uint64_t updated = sub_2098BE248();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_2098A23B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_20989CAF0(*(void *)a2, v4, v5);
  uint64_t result = a1;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_2098A2410(uint64_t a1)
{
  return sub_20989CB78(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2098A2438(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  char v8 = *(unsigned char *)(a2 + 16);
  sub_20989CAF0(*(void *)a2, v7, v8);
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  char v4 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_20989CB78(v2, v3, v4);
  return a1;
}

uint64_t sub_2098A24A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_20989CB78(v6, v7, v8);
  return a1;
}

uint64_t sub_2098A24F8(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 17))
    {
      int v4 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v2 = *(unsigned __int8 *)(a1 + 16) ^ 0xFF;
      if (v2 >= 0xFD) {
        unsigned int v2 = -1;
      }
      int v4 = v2;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_2098A25F0(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = (unsigned char *)(result + 17);
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(unsigned char *)(result + 16) = 0;
    if (a3 >= 0xFE) {
      unsigned char *v3 = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      unsigned char *v3 = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2098A27A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2098A27B0(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2;
  return result;
}

void *type metadata accessor for EDPRecoveryTokenModel.Content()
{
  return &unk_26BD39970;
}

unint64_t sub_2098A27CC(void *a1, uint64_t *a2, int *a3)
{
  int v18 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v18 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    swift_retain();
    *a1 = v13;
    return *a1 + ((v18 + 16) & ~(unint64_t)v18);
  }
  else
  {
    uint64_t v3 = sub_2098BF298();
    (*(void (**)(void *, uint64_t *))(*(void *)(v3 - 8) + 16))(a1, a2);
    uint64_t v4 = a3[5];
    uint64_t v7 = (char *)a1 + v4;
    *(void *)((char *)a1 + v4) = *(uint64_t *)((char *)a2 + v4);
    uint64_t v8 = *(uint64_t *)((char *)a2 + v4 + 8);
    sub_2098BE368();
    *((void *)v7 + 1) = v8;
    uint64_t v5 = a3[6];
    uint64_t v9 = (char *)a1 + v5;
    *(void *)((char *)a1 + v5) = *(uint64_t *)((char *)a2 + v5);
    uint64_t v10 = *(uint64_t *)((char *)a2 + v5 + 8);
    sub_2098BE368();
    *((void *)v9 + 1) = v10;
    uint64_t v11 = a3[7];
    uint64_t v12 = *(uint64_t *)((char *)a2 + v11);
    swift_retain();
    *(void *)((char *)a1 + v11) = v12;
    return (unint64_t)a1;
  }
}

uint64_t sub_2098A2968(uint64_t a1)
{
  uint64_t v1 = sub_2098BF298();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2098A2A08(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v7 = (void *)(a1 + a3[5]);
  *uint64_t v7 = *v4;
  uint64_t v8 = v4[1];
  sub_2098BE368();
  v7[1] = v8;
  uint64_t v5 = (void *)(a2 + a3[6]);
  uint64_t v9 = (void *)(a1 + a3[6]);
  *uint64_t v9 = *v5;
  uint64_t v10 = v5[1];
  sub_2098BE368();
  v9[1] = v10;
  uint64_t v14 = a3[7];
  uint64_t v15 = *(void *)(a2 + v14);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + v14) = v15;
  return result;
}

uint64_t sub_2098A2B1C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 24))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v7 = (void *)(a1 + a3[5]);
  *uint64_t v7 = *v4;
  uint64_t v8 = v4[1];
  sub_2098BE368();
  v7[1] = v8;
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)(a2 + a3[6]);
  uint64_t v9 = (void *)(a1 + a3[6]);
  *uint64_t v9 = *v5;
  uint64_t v10 = v5[1];
  sub_2098BE368();
  v9[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void *)(a2 + v13);
  swift_retain();
  *(void *)(a1 + v13) = v14;
  swift_release();
  return a1;
}

__n128 sub_2098A2C50(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32))(a1, a2);
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  __n128 result = *(__n128 *)(a2 + a3[6]);
  *(__n128 *)(a1 + a3[6]) = result;
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return result;
}

uint64_t sub_2098A2CF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(a1, a2);
  uint64_t v4 = (void *)(a2 + a3[5]);
  uint64_t v5 = (void *)(a1 + a3[5]);
  *uint64_t v5 = *v4;
  v5[1] = v4[1];
  swift_bridgeObjectRelease();
  uint64_t v6 = (void *)(a2 + a3[6]);
  uint64_t v7 = (void *)(a1 + a3[6]);
  *uint64_t v7 = *v6;
  v7[1] = v6[1];
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_2098A2DE8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2098A2E10(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_2098BF298();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t sub_2098A2F38()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2098A2F60(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2098BF298();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_2098A305C()
{
  uint64_t v2 = sub_2098BF298();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void *type metadata accessor for EDPTokenRowElement.CodingKeys()
{
  return &unk_26BD39A00;
}

unint64_t sub_2098A316C()
{
  return sub_2098A15E0();
}

unint64_t sub_2098A3184()
{
  uint64_t v2 = qword_2675F0450;
  if (!qword_2675F0450)
  {
    sub_2098BE698();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0450);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A3208(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  char v5 = *(unsigned char *)(a1 + 16);
  sub_20989CAF0(*(void *)a1, v4, v5);
  uint64_t result = a2;
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = v5;
  return result;
}

uint64_t sub_2098A3264()
{
  swift_retain();
  sub_2098BF028();
  swift_release();
  return v1;
}

uint64_t sub_2098A32D0()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC38);
  sub_2098BF038();
  sub_2097FFA54();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2098A3378()
{
  return swift_release();
}

void (*sub_2098A3444(void *a1))(void **a1, char a2)
{
  char v5 = malloc(0x60uLL);
  *a1 = v5;
  uint64_t v3 = *v2;
  v5[9] = *v2;
  uint64_t v4 = v2[1];
  v5[10] = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *char v5 = v3;
  v5[1] = v4;
  v5[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC38);
  sub_2098BF038();
  sub_2097FFA54();
  return sub_2098A3528;
}

void sub_2098A3528(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = v8[10];
    uint64_t v3 = v8[9];
    uint64_t v2 = v8[6];
    swift_retain();
    swift_retain();
    swift_retain();
    v8[2] = v3;
    v8[3] = v4;
    v8[7] = v2;
    sub_2098BF048();
    sub_2097FFA54();
    sub_2097FF904();
  }
  else
  {
    uint64_t v7 = v8[10];
    uint64_t v6 = v8[9];
    uint64_t v5 = v8[6];
    swift_retain();
    swift_retain();
    v8[4] = v6;
    v8[5] = v7;
    v8[8] = v5;
    sub_2098BF048();
    sub_2097FFA54();
  }
  swift_release();
  swift_release();
  free(v8);
}

uint64_t sub_2098A3674()
{
  return sub_2098BEF98();
}

uint64_t sub_2098A36A8()
{
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC38);
  sub_2098BF058();
  sub_2097FFA54();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2098A3768()
{
  sub_2098BE368();
  sub_2098BF028();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2098A37FC()
{
  sub_2098BE368();
  swift_retain();
  sub_2098BE368();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC40);
  sub_2098BF038();
  sub_2098A38C0();
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_2098A38C0()
{
}

uint64_t sub_2098A38F8()
{
  return swift_bridgeObjectRelease();
}

void (*sub_2098A39E8(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x98uLL);
  *a1 = v6;
  uint64_t v3 = v2[2];
  v6[15] = v3;
  uint64_t v4 = v2[3];
  v6[16] = v4;
  uint64_t v5 = v2[4];
  v6[17] = v5;
  sub_2098BE368();
  swift_retain();
  sub_2098BE368();
  swift_retain();
  void *v6 = v3;
  v6[1] = v4;
  _OWORD v6[2] = v5;
  v6[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC40);
  sub_2098BF038();
  sub_2098A38C0();
  return sub_2098A3AE0;
}

void sub_2098A3AE0(void **a1, char a2)
{
  uint64_t v12 = *a1;
  if (a2)
  {
    uint64_t v6 = v12[17];
    uint64_t v5 = v12[16];
    uint64_t v2 = v12[15];
    uint64_t v3 = v12[9];
    uint64_t v4 = v12[10];
    sub_2098BE368();
    sub_2098BE368();
    swift_retain();
    v12[3] = v2;
    v12[4] = v5;
    v12[5] = v6;
    v12[11] = v3;
    v12[12] = v4;
    sub_2098BF048();
    sub_2098A38C0();
    sub_2097EBD24();
  }
  else
  {
    uint64_t v11 = v12[17];
    uint64_t v10 = v12[16];
    uint64_t v7 = v12[15];
    uint64_t v8 = v12[9];
    uint64_t v9 = v12[10];
    sub_2098BE368();
    swift_retain();
    v12[6] = v7;
    v12[7] = v10;
    v12[8] = v11;
    v12[13] = v8;
    v12[14] = v9;
    sub_2098BF048();
    sub_2098A38C0();
  }
  swift_bridgeObjectRelease();
  swift_release();
  free(v12);
}

uint64_t sub_2098A3C6C()
{
  sub_2098BE368();
  swift_retain();
  sub_2098BE368();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC40);
  sub_2098BF058();
  sub_2098A38C0();
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_2098A3D48()
{
  sub_2098BE368();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECCF8);
  sub_2098BF028();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2098A3DE8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2098A3ED8()
{
  sub_2098BE368();
  swift_retain();
  sub_2098BE368();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC48);
  sub_2098BF058();
  sub_2098A38C0();
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_2098A3FB4()
{
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  swift_release();
  return v1 & 1;
}

uint64_t sub_2098A4050()
{
  return swift_release();
}

void (*sub_2098A4110(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v5 = malloc(0x48uLL);
  *a1 = v5;
  char v3 = *(unsigned char *)(v2 + 64);
  v5[67] = v3 & 1;
  uint64_t v4 = *(void *)(v2 + 72);
  *((void *)v5 + 6) = v4;
  swift_retain();
  swift_retain();
  *uint64_t v5 = v3 & 1;
  *((void *)v5 + 1) = v4;
  *((void *)v5 + 7) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  return sub_2097E65E4;
}

uint64_t sub_2098A41FC()
{
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF058();
  sub_2097E63E8();
  swift_release();
  return v1;
}

uint64_t sub_2098A42B0()
{
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  swift_release();
  return v1 & 1;
}

uint64_t sub_2098A434C()
{
  return swift_release();
}

void (*sub_2098A440C(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v5 = malloc(0x48uLL);
  *a1 = v5;
  char v3 = *(unsigned char *)(v2 + 80);
  v5[67] = v3 & 1;
  uint64_t v4 = *(void *)(v2 + 88);
  *((void *)v5 + 6) = v4;
  swift_retain();
  swift_retain();
  *uint64_t v5 = v3 & 1;
  *((void *)v5 + 1) = v4;
  *((void *)v5 + 7) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  return sub_2097E65E4;
}

uint64_t sub_2098A44F8()
{
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF058();
  sub_2097E63E8();
  swift_release();
  return v1;
}

void (*sub_2098A45AC(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v5 = malloc(0x48uLL);
  *a1 = v5;
  char v3 = *(unsigned char *)(v2 + 96);
  v5[67] = v3 & 1;
  uint64_t v4 = *(void *)(v2 + 104);
  *((void *)v5 + 6) = v4;
  swift_retain();
  swift_retain();
  *uint64_t v5 = v3 & 1;
  *((void *)v5 + 1) = v4;
  *((void *)v5 + 7) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  return sub_2097E65E4;
}

uint64_t sub_2098A4698()
{
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF058();
  sub_2097E63E8();
  swift_release();
  return v1;
}

id sub_2098A474C()
{
  v7[3] = 0;
  id v4 = *(id *)(v0 + 112);
  uint64_t v5 = *(void **)(v0 + 120);
  id v1 = v4;
  swift_retain();
  id v2 = v4;
  swift_retain();
  v7[0] = v4;
  v7[1] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC58);
  sub_2098BF038();
  sub_20981EDF8(v7);
  id v6 = v7[2];

  swift_release();
  return v6;
}

id sub_2098A47F4()
{
  v7[5] = 0;
  id v4 = *(id *)(v0 + 112);
  uint64_t v5 = *(void **)(v0 + 120);
  id v1 = v4;
  swift_retain();
  id v2 = v4;
  swift_retain();
  v7[0] = v4;
  v7[1] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC58);
  sub_2098BF058();
  sub_20981EDF8(v7);
  id v6 = v7[2];

  swift_release();
  return v6;
}

uint64_t AppleAccountHeaderView.init(contact:account:showAccountDetails:showEditButton:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  memset(__b, 0, sizeof(__b));
  sub_2098BF3C8();
  sub_2098BEF98();
  uint64_t v25 = sub_2098A3264();
  uint64_t v4 = v3;
  swift_retain();
  swift_retain();
  __b[0] = v25;
  __b[1] = v4;
  sub_2098BF3C8();
  uint64_t v17 = sub_2098A3768();
  uint64_t v23 = v5;
  uint64_t v24 = v6;
  sub_2098BE368();
  swift_retain();
  __b[2] = v17;
  __b[3] = v23;
  __b[4] = v24;
  uint64_t v18 = sub_2098A3D48();
  uint64_t v21 = v7;
  uint64_t v22 = v8;
  sub_2098BE368();
  swift_retain();
  void __b[5] = v18;
  __b[6] = v21;
  __b[7] = v22;
  LOBYTE(__b[8]) = sub_2097E62E4() & 1;
  __b[9] = v9;
  LOBYTE(__b[10]) = sub_2097E62E4() & 1;
  __b[11] = v10;
  char v19 = sub_2097E62E4();
  uint64_t v20 = v11;
  swift_retain();
  LOBYTE(__b[12]) = v19 & 1;
  __b[13] = v20;
  sub_20981ECC4();
  id v12 = a1;
  sub_2098A4D1C(a1);
  sub_2098BF028();
  id v13 = v33;
  swift_retain();
  __b[14] = v33;
  __b[15] = v34;
  sub_2098BF028();
  swift_retain();
  LOBYTE(__b[8]) = v31 & 1;
  __b[9] = v32;
  swift_release();
  sub_2098BF028();
  swift_retain();
  LOBYTE(__b[10]) = v29 & 1;
  __b[11] = v30;
  swift_release();
  id v14 = a2;
  id v15 = a2;
  __b[16] = a2;
  v36[0] = v25;
  v36[1] = v4;
  v36[2] = v17;
  v36[3] = v23;
  v36[4] = v24;
  v36[5] = v18;
  v36[6] = v21;
  v36[7] = v22;
  LOBYTE(v36[8]) = v31 & 1;
  v36[9] = v32;
  LOBYTE(v36[10]) = v29 & 1;
  v36[11] = v30;
  LOBYTE(v36[12]) = v19 & 1;
  v36[13] = v20;
  v36[14] = v33;
  v36[15] = v34;
  v36[16] = a2;
  sub_2098242E8((uint64_t)v36);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  memcpy(a3, v36, 0x88uLL);

  return sub_209824238((uint64_t)__b);
}

id sub_2098A4D1C(void *a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_2098A85C4(a1);
}

uint64_t (*sub_2098A4D5C())()
{
  memcpy(__dst, v0, sizeof(__dst));
  sub_2098242E8((uint64_t)__dst);
  uint64_t v2 = swift_allocObject();
  memcpy((void *)(v2 + 16), __dst, 0x88uLL);
  return sub_2098A4F18;
}

uint64_t sub_2098A4DEC(const void *a1)
{
  uint64_t v6 = a1;
  sub_2098242E8((uint64_t)a1);
  memcpy(__dst, a1, sizeof(__dst));
  uint64_t v3 = (void (*)(void))sub_2098A45AC(v4);
  sub_2098BF568();
  v3();
  return sub_209824238((uint64_t)__dst);
}

uint64_t sub_2098A4E80()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2098A4F18()
{
  return sub_2098A4DEC((const void *)(v0 + 16));
}

uint64_t AppleAccountHeaderView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v46 = a1;
  uint64_t v20 = MEMORY[0x263F1B188];
  uint64_t v21 = sub_2098A5AB8;
  uint64_t v28 = sub_2098A7E68;
  uint64_t v53 = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0460);
  unint64_t v11 = (*(void *)(*(void *)(v27 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v27);
  uint64_t v30 = (uint64_t)&v11 - v11;
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0468);
  unint64_t v12 = (*(void *)(*(void *)(v38 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v38);
  uint64_t v39 = (uint64_t)&v11 - v12;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0470);
  unint64_t v13 = (*(void *)(*(void *)(v40 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v40);
  uint64_t v45 = (uint64_t)&v11 - v13;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0478);
  unint64_t v14 = (*(void *)(*(void *)(v47 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v47);
  uint64_t v49 = (char *)&v11 - v14;
  unint64_t v15 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)&v11 - v14);
  uint64_t v50 = (char *)&v11 - v15;
  uint64_t v53 = (char *)&v11 - v15;
  uint64_t v25 = v54;
  size_t v26 = 136;
  memcpy(v54, v2, sizeof(v54));
  memcpy(__dst, v16, sizeof(__dst));
  sub_2098242E8((uint64_t)v54);
  uint64_t v22 = v51;
  v51[2] = v25;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0480);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0488);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECB98);
  unint64_t v19 = sub_2098A6F10();
  unint64_t v3 = sub_2098A7030();
  v52[1] = v17;
  v52[2] = v18;
  v52[3] = v19;
  v52[4] = v3;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_2097F8398();
  sub_2098BF0C8();
  sub_20985A818((uint64_t)v25);
  sub_2098242E8((uint64_t)v25);
  uint64_t v29 = swift_allocObject();
  memcpy((void *)(v29 + 16), v25, v26);
  sub_2098A7E70();
  sub_2098BEE88();
  sub_2097FA6E0((uint64_t)v28);
  sub_2098A7EF4(v30);
  uint64_t v31 = *sub_209805A0C();
  uint64_t v32 = *sub_209805A9C();
  uint64_t v33 = *sub_209805B2C();
  sub_209805BBC();
  sub_2098BE498();
  uint64_t v34 = v4;
  uint64_t v35 = v5;
  uint64_t v36 = v6;
  uint64_t v37 = v7;
  sub_2098A7F70();
  sub_2098BEE48();
  sub_2098A8010(v39);
  id v8 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
  uint64_t v9 = MEMORY[0x210505070](v8);
  unint64_t v44 = v52;
  v52[0] = v9;
  unint64_t v42 = sub_2098A810C();
  uint64_t v41 = MEMORY[0x263F1B440];
  uint64_t v43 = MEMORY[0x263F1B420];
  sub_209820B20();
  sub_2098BEC58();
  sub_2097FF904();
  sub_2098A8010(v45);
  unint64_t v48 = sub_2098A81AC();
  sub_2097E7FAC((uint64_t)v49, v47, (uint64_t)v50);
  sub_2098A8250((uint64_t)v49);
  sub_2098A8368(v50, v49);
  sub_2097E7FAC((uint64_t)v49, v47, v46);
  sub_2098A8250((uint64_t)v49);
  return sub_2098A8250((uint64_t)v50);
}

uint64_t sub_2098A53F0@<X0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v87 = a2;
  uint64_t v71 = a1;
  uint64_t v74 = 0;
  uint64_t v75 = sub_2098A97D8;
  uint64_t v84 = MEMORY[0x263F1B188];
  uint64_t v110 = 0;
  uint64_t v109 = 0;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0488);
  unint64_t v37 = (*(void *)(*(void *)(v80 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v80);
  uint64_t v79 = (uint64_t)&v37 - v37;
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0480);
  uint64_t v85 = *(void *)(v91 - 8);
  uint64_t v86 = v91 - 8;
  unint64_t v38 = (*(void *)(v85 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v71);
  uint64_t v89 = (uint64_t)&v37 - v38;
  unint64_t v39 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v90 = (uint64_t)&v37 - v39;
  uint64_t v110 = (char *)&v37 - v39;
  uint64_t v109 = v4;
  sub_2098242E8(v4);
  uint64_t v40 = v108;
  size_t v72 = 136;
  memcpy(v108, v71, sizeof(v108));
  id v60 = sub_2098A47F4();
  uint64_t v61 = v5;
  uint64_t v54 = v6;
  sub_209824238((uint64_t)v40);
  sub_2098242E8((uint64_t)v71);
  uint64_t v41 = v107;
  memcpy(v107, v71, v72);
  uint64_t v55 = sub_2098A36A8();
  uint64_t v56 = v7;
  uint64_t v57 = v8;
  sub_209824238((uint64_t)v41);
  sub_2098242E8((uint64_t)v71);
  unint64_t v42 = v106;
  memcpy(v106, v71, v72);
  uint64_t v58 = sub_2098A3C6C();
  uint64_t v59 = v9;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  sub_209824238((uint64_t)v42);
  sub_2098242E8((uint64_t)v71);
  uint64_t v43 = v105;
  memcpy(v105, v71, v72);
  uint64_t v14 = sub_2098A3ED8();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  sub_209824238((uint64_t)v43);
  sub_2098242E8((uint64_t)v71);
  unint64_t v44 = v104;
  memcpy(v104, v71, v72);
  uint64_t v21 = sub_2098A41FC();
  uint64_t v23 = v22;
  int v47 = v24;
  sub_209824238((uint64_t)v44);
  sub_2098242E8((uint64_t)v71);
  uint64_t v45 = v103;
  memcpy(v103, v71, v72);
  uint64_t v50 = sub_2098A44F8();
  uint64_t v51 = v25;
  int v48 = v26;
  sub_209824238((uint64_t)v45);
  sub_2098242E8((uint64_t)v71);
  uint64_t v46 = v102;
  memcpy(v102, v71, v72);
  uint64_t v52 = sub_2098A4698();
  uint64_t v53 = v27;
  int v49 = v28;
  sub_209824238((uint64_t)v46);
  memcpy(&v101, v71, v72);
  uint64_t v29 = sub_2098A4D5C();
  int v63 = 1;
  LOBYTE(v36) = v48 & 1;
  HIBYTE(v36) = 1;
  uint64_t v62 = v111;
  sub_209893554((uint64_t)v60, v61, v54, v55, v56, v57, v58, v59, v111, v11, v13, v14, v16, v18, v20, v21, v23, v47 & 1, v50,
    v51,
    v36,
    v52,
    v53,
    v49 & 1,
    (uint64_t)v29,
    v30);
  unint64_t v69 = v100;
  memcpy(v100, v62, sizeof(v100));
  sub_2098BF3C8();
  uint64_t v64 = v31;
  uint64_t v65 = sub_20980894C();
  uint64_t v66 = v32;
  swift_bridgeObjectRelease();
  uint64_t v68 = v99;
  v99[0] = v65;
  v99[1] = v66;
  unint64_t v67 = sub_2098A6FB4();
  sub_2097FCD6C();
  sub_2098BED48();
  sub_2097EBD24();
  sub_2098A9620((uint64_t)v69);
  sub_2098242E8((uint64_t)v71);
  uint64_t v70 = v98;
  memcpy(v98, v71, v72);
  uint64_t v77 = sub_2098A4698();
  uint64_t v78 = v33;
  int v73 = v34;
  sub_209824238((uint64_t)v70);
  sub_2098242E8((uint64_t)v71);
  uint64_t v76 = swift_allocObject();
  memcpy((void *)(v76 + 16), v71, v72);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECB98);
  unint64_t v82 = sub_2098A6F10();
  unint64_t v83 = sub_2098A7030();
  sub_2098BEE08();
  swift_release();
  swift_release();
  swift_release();
  sub_2098A97E0(v79);
  uint64_t v94 = v80;
  uint64_t v95 = v81;
  unint64_t v96 = v82;
  unint64_t v97 = v83;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  sub_2097E7FAC(v89, v91, v90);
  uint64_t v93 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  uint64_t v92 = v85 + 8;
  v93(v89, v91);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v85 + 16))(v89, v90, v91);
  sub_2097E7FAC(v89, v91, v87);
  v93(v89, v91);
  return ((uint64_t (*)(uint64_t, uint64_t))v93)(v90, v91);
}

uint64_t sub_2098A5AB8@<X0>(uint64_t a1@<X8>)
{
  return sub_2098A53F0(*(const void **)(v1 + 16), a1);
}

uint64_t sub_2098A5AC0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  v34[8] = a1;
  sub_2098242E8((uint64_t)a1);
  memcpy(__dst, a1, sizeof(__dst));
  id v9 = sub_2098A47F4();
  sub_209824238((uint64_t)__dst);
  id v2 = a1[16];
  v24[0] = nullsub_1(v9);
  v24[1] = v3;
  v24[2] = v4;
  v24[3] = v5;
  sub_2098242E8((uint64_t)a1);
  uint64_t v11 = swift_allocObject();
  memcpy((void *)(v11 + 16), a1, 0x88uLL);
  sub_20984F290();
  sub_2098BECC8();
  sub_2097FA6E0((uint64_t)sub_2098A99EC);
  sub_20984F1A8((uint64_t)v24);
  v23[0] = v26;
  v23[1] = v27;
  v23[2] = v28;
  v23[3] = v29;
  v23[4] = v30;
  v23[5] = v31;
  v23[6] = v32;
  v23[7] = v33;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECB98);
  sub_2098A7030();
  sub_2097E7FAC((uint64_t)v23, v21, (uint64_t)v34);
  sub_2098A99F4((uint64_t)v23);
  uint64_t v12 = v34[0];
  uint64_t v13 = v34[1];
  id v14 = (id)v34[2];
  id v15 = (id)v34[3];
  uint64_t v16 = v34[4];
  uint64_t v17 = v34[5];
  uint64_t v18 = v34[6];
  uint64_t v19 = v34[7];
  swift_retain();
  swift_retain();
  id v6 = v14;
  id v7 = v15;
  sub_20988EDC8(v16);
  sub_20988EDC8(v18);
  v22[0] = v12;
  v22[1] = v13;
  v22[2] = v14;
  v22[3] = v15;
  v22[4] = v16;
  v22[5] = v17;
  v22[6] = v18;
  v22[7] = v19;
  sub_2097E7FAC((uint64_t)v22, v21, a2);
  sub_2098A99F4((uint64_t)v22);
  return sub_2098A99F4((uint64_t)v34);
}

uint64_t sub_2098A5D58(void *__src)
{
  uint64_t v3 = __src;
  memcpy(v2, __src, sizeof(v2));
  return sub_2098A5DA4();
}

uint64_t sub_2098A5DA4()
{
  char v157 = sub_2097DFE10;
  uint64_t v158 = sub_2097DFE10;
  uint64_t v159 = sub_2097DFE10;
  uint64_t v160 = sub_2097DFE10;
  v222 = 0;
  uint64_t v161 = 0;
  uint64_t v213 = 0;
  unint64_t v214 = 0;
  id v199 = 0;
  id v191 = 0;
  id v185 = 0;
  uint64_t v162 = sub_2098BE308();
  uint64_t v163 = *(void *)(v162 - 8);
  uint64_t v164 = v162 - 8;
  unint64_t v165 = (*(void *)(v163 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v162);
  uint64_t v166 = (char *)v40 - v165;
  unint64_t v167 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v40 - v165);
  char v168 = (char *)v40 - v167;
  unint64_t v169 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v40 - v167);
  uint64_t v170 = (char *)v40 - v169;
  unint64_t v171 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v40 - v169);
  uint64_t v172 = (char *)v40 - v171;
  uint64_t v173 = __dst;
  size_t v174 = 136;
  memcpy(__dst, v0, sizeof(__dst));
  v222 = v0;
  sub_2098242E8((uint64_t)__dst);
  char v175 = v221;
  memcpy(v221, v173, v174);
  id v176 = sub_2098A474C();
  sub_209824238((uint64_t)v175);
  id v177 = objc_msgSend(v176, sel_imageData);
  if (v177)
  {
    id v156 = v177;
    id v151 = v177;
    uint64_t v152 = sub_2098BE068();
    unint64_t v153 = v4;

    uint64_t v154 = v152;
    unint64_t v155 = v153;
  }
  else
  {
    uint64_t v154 = 0;
    unint64_t v155 = 0xF000000000000000;
  }
  unint64_t v149 = v155;
  uint64_t v150 = v154;
  if ((v155 & 0xF000000000000000) != 0xF000000000000000)
  {
    uint64_t v147 = v150;
    unint64_t v148 = v149;
    unint64_t v141 = v149;
    uint64_t v142 = v150;
    uint64_t v213 = v150;
    unint64_t v214 = v149;

    uint64_t v143 = __dst;
    sub_2098242E8((uint64_t)__dst);
    unsigned __int8 v144 = v212;
    memcpy(v212, v143, sizeof(v212));
    id v145 = sub_2098A474C();
    sub_209824238((uint64_t)v144);
    objc_msgSend(v145, sel_cropRect);
    CGFloat v208 = v5;
    CGFloat v209 = v6;
    CGFloat v210 = v7;
    CGFloat v211 = v8;
    v146.origin.x = v5;
    v146.origin.y = v6;
    v146.size.width = v7;
    v146.size.height = v8;

    CGRect v207 = v146;
    if (!CGRectIsNull(v146))
    {
      sub_2097FA524();
      sub_2097FA58C(v142, v141);
      id v140 = sub_2097F63CC(v142, v141);
      if (v140)
      {
        id v139 = v140;
        id v131 = v140;
        id v191 = v140;
        uint64_t v130 = __dst;
        sub_2098242E8((uint64_t)__dst);
        char v132 = v190;
        memcpy(v190, v130, sizeof(v190));
        id v133 = sub_2098A474C();
        sub_209824238((uint64_t)v132);
        objc_msgSend(v133, sel_cropRect);
        double v186 = v9;
        double v187 = v10;
        double v188 = v11;
        double v189 = v12;
        double v134 = v9;
        double v135 = v10;
        double v136 = v11;
        double v137 = v12;

        id v138 = sub_2097F68DC(v134, v135, v136, v137);
        if (v138)
        {
          id v129 = v138;
          uint64_t v13 = v172;
          id v121 = v138;
          id v185 = v138;
          uint64_t v14 = sub_2098388C0();
          (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v13, v14, v162);
          uint64_t v127 = sub_2098BE2E8();
          int v126 = sub_2098BF728();
          char v124 = &v183;
          uint64_t v183 = 2;
          unint64_t v122 = sub_2097DFBE0();
          unint64_t v123 = sub_2097DFC5C();
          sub_2097DFCD8();
          sub_2098BF448();
          uint32_t v125 = v184;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
          uint64_t v128 = sub_2098BFB28();
          if (os_log_type_enabled(v127, (os_log_type_t)v126))
          {
            uint64_t v15 = v161;
            char v111 = (uint8_t *)sub_2098BF7D8();
            uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
            uint64_t v110 = 0;
            uint64_t v112 = sub_2097DFD54(0);
            uint64_t v113 = sub_2097DFD54(v110);
            char v117 = &v181;
            uint64_t v181 = v111;
            uint64_t v118 = &v180;
            uint64_t v180 = v112;
            uint64_t v115 = &v179;
            uint64_t v179 = v113;
            unsigned int v114 = 0;
            sub_2097DFDB0(0, &v181);
            sub_2097DFDB0(v114, v117);
            uint64_t v178 = v128;
            uint64_t v116 = v40;
            MEMORY[0x270FA5388](v40);
            uint64_t v16 = v118;
            uint64_t v17 = &v40[-6];
            char v119 = &v40[-6];
            v17[2] = v117;
            v17[3] = v16;
            v17[4] = v18;
            uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
            sub_2097DFE40();
            sub_2098BF428();
            if (v15)
            {
              __break(1u);
            }
            else
            {
              _os_log_impl(&dword_209754000, v127, (os_log_type_t)v126, "Setting image to croppedUIImage...", v111, v125);
              uint64_t v108 = 0;
              sub_2097DFF3C(v112);
              sub_2097DFF3C(v113);
              sub_2098BF7B8();
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }

          (*(void (**)(char *, uint64_t))(v163 + 8))(v172, v162);
          char v106 = __dst;
          sub_2098242E8((uint64_t)__dst);
          uint32_t v107 = v182;
          memcpy(v182, v106, sizeof(v182));
          id v19 = v121;
          sub_2098BEF88();
          sub_2098A3378();
          sub_209824238((uint64_t)v107);

          return sub_2097FA618(v142, v141);
        }
      }
    }
    sub_2097FA524();
    sub_2097FA58C(v142, v141);
    id v105 = sub_2097F63CC(v142, v141);
    if (v105)
    {
      id v104 = v105;
      uint64_t v20 = v170;
      id v96 = v105;
      id v199 = v105;
      uint64_t v21 = sub_2098388C0();
      (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v20, v21, v162);
      uint64_t v102 = sub_2098BE2E8();
      int v101 = sub_2098BF728();
      char v99 = &v197;
      uint64_t v197 = 2;
      unint64_t v97 = sub_2097DFBE0();
      unint64_t v98 = sub_2097DFC5C();
      sub_2097DFCD8();
      sub_2098BF448();
      uint32_t v100 = v198;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
      uint64_t v103 = sub_2098BFB28();
      if (os_log_type_enabled(v102, (os_log_type_t)v101))
      {
        uint64_t v22 = v161;
        uint64_t v86 = (uint8_t *)sub_2098BF7D8();
        uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
        uint64_t v85 = 0;
        uint64_t v87 = sub_2097DFD54(0);
        uint64_t v88 = sub_2097DFD54(v85);
        uint64_t v92 = &v195;
        id v195 = v86;
        uint64_t v93 = &v194;
        uint64_t v194 = v87;
        uint64_t v90 = &v193;
        uint64_t v193 = v88;
        unsigned int v89 = 0;
        sub_2097DFDB0(0, &v195);
        sub_2097DFDB0(v89, v92);
        uint64_t v192 = v103;
        uint64_t v91 = v40;
        MEMORY[0x270FA5388](v40);
        uint64_t v23 = v93;
        int v24 = &v40[-6];
        uint64_t v94 = &v40[-6];
        v24[2] = v92;
        v24[3] = v23;
        void v24[4] = v25;
        uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
        sub_2097DFE40();
        sub_2098BF428();
        if (v22)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_209754000, v102, (os_log_type_t)v101, "Setting image to newImage...", v86, v100);
          uint64_t v83 = 0;
          sub_2097DFF3C(v87);
          sub_2097DFF3C(v88);
          sub_2098BF7B8();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v163 + 8))(v170, v162);
      uint64_t v81 = __dst;
      sub_2098242E8((uint64_t)__dst);
      unint64_t v82 = v196;
      memcpy(v196, v81, sizeof(v196));
      id v26 = v96;
      sub_2098BEF88();
      sub_2098A3378();
      sub_209824238((uint64_t)v82);
    }
    else
    {
      uint64_t v27 = v168;
      uint64_t v28 = sub_2098388C0();
      (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v27, v28, v162);
      uint64_t v79 = sub_2098BE2E8();
      int v78 = sub_2098BF728();
      uint64_t v76 = &v205;
      uint64_t v205 = 2;
      unint64_t v74 = sub_2097DFBE0();
      unint64_t v75 = sub_2097DFC5C();
      sub_2097DFCD8();
      sub_2098BF448();
      uint32_t v77 = v206;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
      uint64_t v80 = sub_2098BFB28();
      if (os_log_type_enabled(v79, (os_log_type_t)v78))
      {
        uint64_t v29 = v161;
        uint64_t v64 = (uint8_t *)sub_2098BF7D8();
        uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
        uint64_t v63 = 0;
        uint64_t v65 = sub_2097DFD54(0);
        uint64_t v66 = sub_2097DFD54(v63);
        uint64_t v70 = &v203;
        uint64_t v203 = v64;
        uint64_t v71 = &v202;
        uint64_t v202 = v65;
        uint64_t v68 = &v201;
        uint64_t v201 = v66;
        unsigned int v67 = 0;
        sub_2097DFDB0(0, &v203);
        sub_2097DFDB0(v67, v70);
        uint64_t v200 = v80;
        unint64_t v69 = v40;
        MEMORY[0x270FA5388](v40);
        uint64_t v30 = v71;
        uint64_t v31 = &v40[-6];
        size_t v72 = &v40[-6];
        v31[2] = v70;
        v31[3] = v30;
        v31[4] = v32;
        uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
        sub_2097DFE40();
        sub_2098BF428();
        if (v29)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_209754000, v79, (os_log_type_t)v78, "Something bad has happened. Setting to default placeholder image...", v64, v77);
          uint64_t v61 = 0;
          sub_2097DFF3C(v65);
          sub_2097DFF3C(v66);
          sub_2098BF7B8();
          swift_bridgeObjectRelease();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }

      (*(void (**)(char *, uint64_t))(v163 + 8))(v168, v162);
      uint64_t v59 = __dst;
      sub_2098242E8((uint64_t)__dst);
      id v60 = v204;
      memcpy(v204, v59, sizeof(v204));
      sub_2098BF3C8();
      sub_2098BEF98();
      sub_2098A3378();
      sub_209824238((uint64_t)v60);
    }
    return sub_2097FA618(v142, v141);
  }
  int v34 = v166;

  uint64_t v35 = sub_2098388C0();
  (*(void (**)(char *, uint64_t, uint64_t))(v163 + 16))(v34, v35, v162);
  uint64_t v57 = sub_2098BE2E8();
  int v56 = sub_2098BF708();
  uint64_t v54 = &v219;
  uint64_t v219 = 2;
  unint64_t v52 = sub_2097DFBE0();
  unint64_t v53 = sub_2097DFC5C();
  sub_2097DFCD8();
  sub_2098BF448();
  uint32_t v55 = v220;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
  uint64_t v58 = sub_2098BFB28();
  if (os_log_type_enabled(v57, (os_log_type_t)v56))
  {
    uint64_t v36 = v161;
    unint64_t v42 = (uint8_t *)sub_2098BF7D8();
    v40[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
    uint64_t v41 = 0;
    uint64_t v43 = sub_2097DFD54(0);
    uint64_t v44 = sub_2097DFD54(v41);
    int v48 = &v218;
    v218 = v42;
    int v49 = &v217;
    uint64_t v217 = v43;
    uint64_t v46 = &v216;
    uint64_t v216 = v44;
    unsigned int v45 = 0;
    sub_2097DFDB0(0, &v218);
    sub_2097DFDB0(v45, v48);
    uint64_t v215 = v58;
    int v47 = v40;
    MEMORY[0x270FA5388](v40);
    unint64_t v37 = v49;
    unint64_t v38 = &v40[-6];
    uint64_t v50 = &v40[-6];
    v38[2] = v48;
    v38[3] = v37;
    v38[4] = v39;
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
    sub_2097DFE40();
    sub_2098BF428();
    if (v36)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_209754000, v57, (os_log_type_t)v56, "AppleAccountHeaderView: self.pickerContact.imageData is nil.", v42, v55);
      v40[1] = 0;
      sub_2097DFF3C(v43);
      sub_2097DFF3C(v44);
      sub_2098BF7B8();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v163 + 8))(v166, v162);
}

unint64_t sub_2098A6F10()
{
  uint64_t v2 = qword_2675F0490;
  if (!qword_2675F0490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0488);
    sub_2098A6FB4();
    sub_2098928F0();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0490);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A6FB4()
{
  uint64_t v2 = qword_2675ECB70;
  if (!qword_2675ECB70)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECB70);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A7030()
{
  uint64_t v2 = qword_2675ECB90;
  if (!qword_2675ECB90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675ECB98);
    sub_20984F290();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECB90);
    return WitnessTable;
  }
  return v2;
}

void sub_2098A70D0(void *a1)
{
  unint64_t v123 = a1;
  unint64_t v153 = 0;
  uint64_t v152 = 0;
  id v151 = 0;
  id v149 = 0;
  uint64_t v144 = 0;
  uint64_t v145 = 0;
  uint64_t v142 = 0;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECB68);
  unint64_t v112 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v113 = (char *)v19 - v112;
  uint64_t v114 = sub_2098BDFF8();
  uint64_t v115 = *(void *)(v114 - 8);
  uint64_t v116 = v114 - 8;
  unint64_t v117 = (*(void *)(v115 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v114);
  uint64_t v118 = (char *)v19 - v117;
  unint64_t v153 = (char *)v19 - v117;
  unint64_t v119 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v2);
  uint64_t v120 = (char *)v19 - v119;
  unint64_t v121 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388]((char *)v19 - v119);
  unint64_t v122 = (char *)v19 - v121;
  uint64_t v152 = (char *)v19 - v121;
  id v151 = v5;
  memcpy(__dst, v5, sizeof(__dst));
  sub_2098A5DA4();
  char v124 = (id *)&v155;
  sub_2098A9450(v123 + 16, &v155);
  sub_2098A9464(v124);
  sub_2098A9450(v124, &v156);
  if (v156)
  {
    id v93 = v156;
    uint64_t v142 = v156;
    id v94 = (id)*MEMORY[0x263EFAD78];
    id v9 = v94;
    uint64_t v10 = sub_2098BF368();
    uint64_t v139 = MEMORY[0x263F8D310];
    v138[0] = v10;
    v138[1] = v11;
    if (MEMORY[0x263F8D310])
    {
      uint64_t v90 = v138;
      uint64_t v87 = v139;
      __swift_project_boxed_opaque_existential_0(v138, v139);
      uint64_t v85 = *(void *)(v87 - 8);
      uint64_t v86 = v87 - 8;
      uint64_t v12 = *(void *)(v85 + 64);
      unsigned int v89 = v19;
      unint64_t v84 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v19);
      uint64_t v88 = (char *)v19 - v84;
      (*(void (**)(void))(v85 + 16))();
      uint64_t v91 = sub_2098BFB38();
      (*(void (**)(char *, uint64_t))(v85 + 8))(v88, v87);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v90);
      uint64_t v92 = v91;
    }
    else
    {
      uint64_t v92 = 0;
    }
    uint64_t v82 = v92;
    id v83 = objc_msgSend(v93, sel_objectForKeyedSubscript_);
    swift_unknownObjectRelease();
    if (v83)
    {
      id v81 = v83;
      id v80 = v83;
      uint64_t v79 = v125;
      sub_2098BF828();
      sub_209861FA4((uint64_t)v79, (uint64_t)&v135);
      swift_unknownObjectRelease();
    }
    else
    {
      long long v135 = 0uLL;
      uint64_t v136 = 0;
      uint64_t v137 = 0;
    }
    sub_209862120(&v135, &v140);
    if (v141)
    {
      if (swift_dynamicCast())
      {
        uint64_t v74 = v125[4];
        uint64_t v75 = v125[5];
      }
      else
      {
        uint64_t v74 = 0;
        uint64_t v75 = 0;
      }
      uint64_t v73 = v75;
      uint64_t v72 = v74;

      uint64_t v77 = v72;
      uint64_t v78 = v73;
    }
    else
    {
      uint64_t v76 = 0;

      sub_209812814((uint64_t)&v140);
      uint64_t v77 = v76;
      uint64_t v78 = v76;
    }
    uint64_t v69 = v78;
    uint64_t v70 = v77;
    id v71 = (id)*MEMORY[0x263EFADB8];
    id v13 = v71;
    uint64_t v14 = sub_2098BF368();
    uint64_t v132 = MEMORY[0x263F8D310];
    v131[0] = v14;
    v131[1] = v15;
    if (MEMORY[0x263F8D310])
    {
      uint64_t v66 = v131;
      uint64_t v63 = v132;
      __swift_project_boxed_opaque_existential_0(v131, v132);
      uint64_t v61 = *(void *)(v63 - 8);
      uint64_t v62 = v63 - 8;
      uint64_t v16 = *(void *)(v61 + 64);
      uint64_t v65 = v19;
      unint64_t v60 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388](v19);
      uint64_t v64 = (char *)v19 - v60;
      (*(void (**)(void))(v61 + 16))();
      uint64_t v67 = sub_2098BFB38();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v64, v63);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v66);
      uint64_t v68 = v67;
    }
    else
    {
      uint64_t v68 = 0;
    }
    uint64_t v58 = v68;
    id v59 = objc_msgSend(v93, sel_objectForKeyedSubscript_);
    swift_unknownObjectRelease();
    if (v59)
    {
      id v57 = v59;
      id v56 = v59;
      uint32_t v55 = v126;
      sub_2098BF828();
      sub_209861FA4((uint64_t)v55, (uint64_t)&v128);
      swift_unknownObjectRelease();
    }
    else
    {
      long long v128 = 0uLL;
      uint64_t v129 = 0;
      uint64_t v130 = 0;
    }
    sub_209862120(&v128, &v133);
    if (v134)
    {
      if (swift_dynamicCast())
      {
        uint64_t v50 = v126[4];
        uint64_t v51 = v126[5];
      }
      else
      {
        uint64_t v50 = 0;
        uint64_t v51 = 0;
      }
      uint64_t v49 = v51;
      uint64_t v48 = v50;

      uint64_t v53 = v48;
      uint64_t v54 = v49;
    }
    else
    {
      uint64_t v52 = 0;

      sub_209812814((uint64_t)&v133);
      uint64_t v53 = v52;
      uint64_t v54 = v52;
    }
    uint64_t v17 = v122;
    uint64_t v39 = v54;
    uint64_t v38 = v53;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v115 + 56))(v113, 1, 1, v114);
    uint64_t v40 = 0;
    sub_2098BDFC8();
    sub_2098242E8((uint64_t)v123);
    unsigned int v45 = v127;
    memcpy(v127, v123, sizeof(v127));
    id v42 = self;
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v17, v118, v114);
    id v43 = (id)sub_2098BDFD8();
    int v47 = *(void (**)(char *, uint64_t))(v115 + 8);
    uint64_t v46 = v115 + 8;
    v47(v122, v114);
    type metadata accessor for Options();
    uint64_t v41 = sub_2098BFB28();
    sub_2098A959C();
    sub_2098BF838();
    id v44 = objc_msgSend(v42, sel_localizedStringFromPersonNameComponents_style_options_, v43, 2, v126[6]);

    sub_2098BF368();
    sub_2098A38F8();

    sub_209824238((uint64_t)v45);
    v47(v118, v114);
  }
  else
  {
    sub_2098A9490();
    id v111 = sub_2097DA9F0();
    id v149 = v111;
    sub_2098BDFE8();
    sub_2098242E8((uint64_t)v123);
    uint64_t v95 = v148;
    size_t v105 = 136;
    memcpy(v148, v123, sizeof(v148));
    id v96 = sub_2098A474C();
    sub_209824238((uint64_t)v95);
    id v99 = objc_msgSend(v96, sel_givenName);
    uint64_t v97 = sub_2098BF368();
    uint64_t v98 = v6;

    sub_2098BDFA8();
    sub_2098242E8((uint64_t)v123);
    uint32_t v100 = v147;
    memcpy(v147, v123, v105);
    id v101 = sub_2098A474C();
    sub_209824238((uint64_t)v100);
    id v104 = objc_msgSend(v101, sel_familyName);
    uint64_t v102 = sub_2098BF368();
    uint64_t v103 = v7;

    sub_2098BDFB8();
    CGFloat v8 = v120;

    sub_2098242E8((uint64_t)v123);
    uint64_t v108 = v146;
    memcpy(v146, v123, v105);
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v8, v122, v114);
    id v106 = (id)sub_2098BDFD8();
    uint64_t v110 = *(void (**)(char *, uint64_t))(v115 + 8);
    uint64_t v109 = v115 + 8;
    v110(v120, v114);
    id v107 = objc_msgSend(v111, sel_stringFromPersonNameComponents_, v106);

    sub_2098BF368();
    sub_2098A38F8();

    sub_209824238((uint64_t)v108);
    v110(v122, v114);
  }
  unint64_t v37 = (id *)&v154;
  sub_2098A9450(v123 + 16, &v154);
  sub_2098A9464(v37);
  sub_2098A9450(v37, &v157);
  if (v157)
  {
    id v33 = v157;
    id v34 = objc_msgSend(v157, sel_aa_formattedUsername);
    if (v34)
    {
      id v32 = v34;
      id v27 = v34;
      uint64_t v28 = sub_2098BF368();
      uint64_t v29 = v18;

      uint64_t v30 = v28;
      uint64_t v31 = v29;
    }
    else
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    uint64_t v26 = v31;
    uint64_t v25 = v30;

    uint64_t v35 = v25;
    uint64_t v36 = v26;
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
  }
  uint64_t v23 = v36;
  uint64_t v24 = v35;
  if (v36)
  {
    uint64_t v21 = v24;
    uint64_t v22 = v23;
    v19[2] = v23;
    v19[1] = v24;
    uint64_t v144 = v24;
    uint64_t v145 = v23;
    sub_2098242E8((uint64_t)v123);
    uint64_t v20 = v143;
    memcpy(v143, v123, sizeof(v143));
    sub_2098A3DE8();
    sub_209824238((uint64_t)v20);
  }
}

uint64_t sub_2098A7DD0()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_2098A7E68()
{
  sub_2098A70D0((void *)(v0 + 16));
}

unint64_t sub_2098A7E70()
{
  uint64_t v2 = qword_2675F0498;
  if (!qword_2675F0498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0460);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0498);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A7EF4(uint64_t a1)
{
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F04A0) + 44);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0480);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

unint64_t sub_2098A7F70()
{
  uint64_t v2 = qword_2675F04A8;
  if (!qword_2675F04A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0468);
    sub_2098A7E70();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F04A8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A8010(uint64_t a1)
{
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F04A0) + 44);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0480);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0468) + 36);
  if (*(void *)(a1 + v5)) {
    swift_release();
  }
  if (*(void *)(a1 + v5 + 16)) {
    swift_release();
  }
  return a1;
}

unint64_t sub_2098A810C()
{
  uint64_t v2 = qword_2675F04B0;
  if (!qword_2675F04B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0470);
    sub_2098A7F70();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F04B0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A81AC()
{
  uint64_t v2 = qword_2675F04B8;
  if (!qword_2675F04B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0478);
    sub_2098A810C();
    sub_209820090();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F04B8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A8250(uint64_t a1)
{
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F04A0) + 44);
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0480);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  uint64_t v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0468) + 36);
  if (*(void *)(a1 + v5)) {
    swift_release();
  }
  if (*(void *)(a1 + v5 + 16)) {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0478);
  swift_release();
  return a1;
}

char *sub_2098A8368(char *a1, char *a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F04A0) + 44);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0480);
  (*(void (**)(char *, char *))(*(void *)(v2 - 8) + 16))(&a2[v17], &a1[v17]);
  uint64_t v19 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0468) + 36);
  if (*(void *)&a1[v19])
  {
    uint64_t v14 = *(void *)&a1[v19];
    uint64_t v15 = *(void *)&a1[v19 + 8];
    swift_retain();
    uint64_t v3 = &a2[v19];
    *(void *)uint64_t v3 = v14;
    *((void *)v3 + 1) = v15;
  }
  else
  {
    *(_OWORD *)&a2[v19] = *(_OWORD *)&a1[v19];
  }
  uint64_t v12 = &a2[v19];
  id v13 = &a1[v19];
  if (*(void *)&a1[v19 + 16])
  {
    uint64_t v10 = *((void *)v13 + 2);
    uint64_t v11 = *(void *)&a1[v19 + 24];
    swift_retain();
    *((void *)v12 + 2) = v10;
    *(void *)&a2[v19 + 24] = v11;
  }
  else
  {
    *((_OWORD *)v12 + 1) = *((_OWORD *)v13 + 1);
  }
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0470);
  memcpy(&a2[*(int *)(v4 + 36)], &a1[*(int *)(v4 + 36)], 0x29uLL);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0478);
  id v9 = &a2[*(int *)(v5 + 36)];
  CGFloat v8 = &a1[*(int *)(v5 + 36)];
  uint64_t v7 = *(void *)v8;
  swift_retain();
  uint64_t result = a2;
  *(void *)id v9 = v7;
  v9[8] = v8[8];
  return result;
}

uint64_t sub_2098A85AC@<X0>(uint64_t a1@<X8>)
{
  return AppleAccountHeaderView.body.getter(a1);
}

id sub_2098A85C4(void *a1)
{
  id v4 = objc_msgSend(v1, sel_initWithContact_);

  return v4;
}

uint64_t sub_2098A860C()
{
  return sub_2098BFCE8();
}

uint64_t sub_2098A8650()
{
  return sub_2098BFC78() & 1;
}

uint64_t sub_2098A868C()
{
  return sub_2098BFCA8();
}

uint64_t sub_2098A86CC()
{
  return sub_2098BFC88();
}

uint64_t sub_2098A870C()
{
  return sub_2098BFC98();
}

uint64_t sub_2098A874C()
{
  return sub_2098BFC48() & 1;
}

uint64_t sub_2098A8790()
{
  return sub_2098BFC58();
}

uint64_t sub_2098A87D0()
{
  return sub_2098BFC68();
}

uint64_t sub_2098A8810()
{
  return sub_2098BFCD8();
}

uint64_t sub_2098A8854()
{
  return sub_2098BFCB8();
}

uint64_t sub_2098A8898()
{
  return sub_2098BFCC8();
}

uint64_t sub_2098A88DC()
{
  return sub_2098BF868();
}

uint64_t sub_2098A88F4()
{
  return sub_2098BF888() & 1;
}

uint64_t sub_2098A8910()
{
  return sub_2098BF848() & 1;
}

uint64_t sub_2098A892C()
{
  return sub_2098BF858() & 1;
}

uint64_t sub_2098A8948()
{
  return sub_2098BF878() & 1;
}

uint64_t sub_2098A8964()
{
  return sub_2098BF8A8();
}

uint64_t sub_2098A89A0()
{
  return sub_2098BF898();
}

uint64_t sub_2098A89B8()
{
  return sub_2098BFB48() & 1;
}

uint64_t sub_2098A8A04()
{
  return sub_2098BF838();
}

uint64_t sub_2098A8A44@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = nullsub_1(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_2098A8A74()
{
  return swift_getOpaqueTypeConformance2();
}

void destroy for AppleAccountHeaderView(uint64_t a1)
{
  swift_release();
}

uint64_t initializeWithCopy for AppleAccountHeaderView(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *a2;
  swift_retain();
  *(void *)a1 = v5;
  uint64_t v6 = a2[1];
  swift_retain();
  *(void *)(a1 + 8) = v6;
  *(void *)(a1 + 16) = a2[2];
  uint64_t v7 = a2[3];
  sub_2098BE368();
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = a2[4];
  swift_retain();
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = a2[5];
  uint64_t v9 = a2[6];
  sub_2098BE368();
  *(void *)(a1 + 48) = v9;
  uint64_t v10 = a2[7];
  swift_retain();
  *(void *)(a1 + 56) = v10;
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
  uint64_t v11 = a2[9];
  swift_retain();
  *(void *)(a1 + 72) = v11;
  *(unsigned char *)(a1 + 80) = *((unsigned char *)a2 + 80);
  uint64_t v12 = a2[11];
  swift_retain();
  *(void *)(a1 + 88) = v12;
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a2 + 96);
  uint64_t v13 = a2[13];
  swift_retain();
  *(void *)(a1 + 104) = v13;
  uint64_t v14 = (void *)a2[14];
  id v2 = v14;
  *(void *)(a1 + 112) = v14;
  uint64_t v15 = a2[15];
  swift_retain();
  *(void *)(a1 + 120) = v15;
  uint64_t v17 = (void *)a2[16];
  id v3 = v17;
  uint64_t result = a1;
  *(void *)(a1 + 128) = v17;
  return result;
}

uint64_t assignWithCopy for AppleAccountHeaderView(uint64_t a1, uint64_t *a2)
{
  uint64_t v6 = *a2;
  swift_retain();
  *(void *)a1 = v6;
  swift_release();
  uint64_t v7 = a2[1];
  swift_retain();
  *(void *)(a1 + 8) = v7;
  swift_release();
  *(void *)(a1 + 16) = a2[2];
  uint64_t v8 = a2[3];
  sub_2098BE368();
  *(void *)(a1 + 24) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[4];
  swift_retain();
  *(void *)(a1 + 32) = v9;
  swift_release();
  *(void *)(a1 + 40) = a2[5];
  uint64_t v10 = a2[6];
  sub_2098BE368();
  *(void *)(a1 + 48) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = a2[7];
  swift_retain();
  *(void *)(a1 + 56) = v11;
  swift_release();
  *(unsigned char *)(a1 + 64) = a2[8] & 1;
  uint64_t v12 = a2[9];
  swift_retain();
  *(void *)(a1 + 72) = v12;
  swift_release();
  *(unsigned char *)(a1 + 80) = a2[10] & 1;
  uint64_t v13 = a2[11];
  swift_retain();
  *(void *)(a1 + 88) = v13;
  swift_release();
  *(unsigned char *)(a1 + 96) = a2[12] & 1;
  uint64_t v14 = a2[13];
  swift_retain();
  *(void *)(a1 + 104) = v14;
  swift_release();
  uint64_t v15 = (void *)a2[14];
  id v2 = v15;
  id v3 = *(void **)(a1 + 112);
  *(void *)(a1 + 112) = v15;

  uint64_t v16 = a2[15];
  swift_retain();
  *(void *)(a1 + 120) = v16;
  swift_release();
  uint64_t v19 = *(void **)(a1 + 128);
  uint64_t v18 = (void *)a2[16];
  id v4 = v18;
  *(void *)(a1 + 128) = v18;

  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> __swift_memcpy136_8(void *a1, const void *a2)
{
}

uint64_t assignWithTake for AppleAccountHeaderView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64) & 1;
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80) & 1;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96) & 1;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  id v2 = *(void **)(a1 + 112);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);

  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  id v3 = *(void **)(a1 + 128);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppleAccountHeaderView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 136))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)a1)) {
        int v3 = *(void *)a1;
      }
      int v4 = v3;
    }
  }
  else
  {
    int v4 = -1;
  }
  return (v4 + 1);
}

void *storeEnumTagSinglePayload for AppleAccountHeaderView(void *result, int a2, int a3)
{
  int v3 = result + 17;
  if (a2 < 0)
  {
    result[15] = 0;
    result[14] = 0;
    result[13] = 0;
    result[12] = 0;
    result[11] = 0;
    result[10] = 0;
    result[9] = 0;
    result[8] = 0;
    result[7] = 0;
    result[6] = 0;
    result[5] = 0;
    result[4] = 0;
    result[3] = 0;
    result[2] = 0;
    result[1] = 0;
    *uint64_t result = a2 + 0x80000000;
    result[16] = 0;
    if (a3 < 0) {
      unsigned char *v3 = 1;
    }
  }
  else
  {
    if (a3 < 0) {
      unsigned char *v3 = 0;
    }
    if (a2) {
      *uint64_t result = (a2 - 1);
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleAccountHeaderView()
{
  return &type metadata for AppleAccountHeaderView;
}

unint64_t sub_2098A9438()
{
  return sub_2098A81AC();
}

void *sub_2098A9450(void *a1, void *a2)
{
  uint64_t result = a2;
  *a2 = *a1;
  return result;
}

id *sub_2098A9464(id *a1)
{
  id v1 = *a1;
  return a1;
}

unint64_t sub_2098A9490()
{
  uint64_t v2 = qword_2675F04C0;
  if (!qword_2675F04C0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F04C0);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t type metadata accessor for Options()
{
  uint64_t v4 = qword_2675ECD40;
  if (!qword_2675ECD40)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2675ECD40);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_2098A959C()
{
  uint64_t v2 = qword_2675ECD28;
  if (!qword_2675ECD28)
  {
    type metadata accessor for Options();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECD28);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098A9620(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 184)) {
    swift_release();
  }
  return a1;
}

uint64_t sub_2098A9740()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2098A97D8@<X0>(uint64_t a1@<X8>)
{
  return sub_2098A5AC0((id *)(v1 + 16), a1);
}

uint64_t sub_2098A97E0(uint64_t a1)
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 184)) {
    swift_release();
  }
  uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0488) + 36);
  uint64_t v1 = sub_2098BE968();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v3);
  return a1;
}

uint64_t sub_2098A9954()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2098A99EC()
{
  return sub_2098A5D58((void *)(v0 + 16));
}

uint64_t sub_2098A99F4(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    swift_release();
  }
  if (*(void *)(a1 + 48)) {
    swift_release();
  }
  return a1;
}

unint64_t sub_2098A9A94()
{
  return sub_2098A9AAC();
}

unint64_t sub_2098A9AAC()
{
  uint64_t v2 = qword_2675ECD20;
  if (!qword_2675ECD20)
  {
    type metadata accessor for Options();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECD20);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A9B30()
{
  return sub_2098A959C();
}

unint64_t sub_2098A9B48()
{
  return sub_2098A9B60();
}

unint64_t sub_2098A9B60()
{
  uint64_t v2 = qword_2675ECD18;
  if (!qword_2675ECD18)
  {
    type metadata accessor for Options();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECD18);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A9BE4()
{
  return sub_2098A9BFC();
}

unint64_t sub_2098A9BFC()
{
  uint64_t v2 = qword_2675ECD30;
  if (!qword_2675ECD30)
  {
    type metadata accessor for Options();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECD30);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A9C80()
{
  uint64_t v2 = qword_2675ECD38;
  if (!qword_2675ECD38)
  {
    type metadata accessor for Options();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECD38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098A9D04()
{
  uint64_t v2 = qword_2675ECCF0;
  if (!qword_2675ECCF0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECCF0);
    return WitnessTable;
  }
  return v2;
}

id AccountManagerHelper.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *AccountManagerHelper.init()()
{
  uint64_t v26 = "Fatal error";
  id v27 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  uint64_t v28 = "AppleAccountUI/AccountManagerHelper.swift";
  id v42 = 0;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F04D0);
  uint64_t v30 = *(void *)(v34 - 8);
  uint64_t v31 = v34 - 8;
  unint64_t v29 = (*(void *)(v30 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v34);
  uint64_t v33 = (uint64_t)&v16 - v29;
  uint64_t v1 = v0;
  uint64_t v2 = v0;
  uint64_t v3 = v0;
  id v42 = v0;
  uint64_t v32 = OBJC_IVAR___AAUIAccountManagerHelper__account;
  uint64_t v36 = 0;
  sub_2098AA150(0, v33);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(&v0[v32], v33, v34);

  uint64_t v37 = OBJC_IVAR___AAUIAccountManagerHelper_serviceOwnersManager;
  unint64_t v38 = sub_2098AA1B4();
  id v39 = objc_msgSend(self, sel_defaultStore);
  if (!v39)
  {
    sub_2098BF9C8();
    __break(1u);
    goto LABEL_5;
  }
  id v25 = v39;
  id v4 = sub_2098AAB18(v39);
  id v5 = v35;
  *(void *)&v35[v37] = v4;

  uint64_t v22 = OBJC_IVAR___AAUIAccountManagerHelper_accountManager;
  unint64_t v23 = sub_2098AAB58();
  id v24 = objc_msgSend(self, sel_defaultStore);
  if (v24)
  {
    uint64_t v21 = v24;
LABEL_5:
    id v6 = sub_2098AAB18(v21);
    id v7 = v35;
    *(void *)&v35[v22] = v6;

    uint64_t v16 = v42;
    uint64_t v8 = (objc_class *)type metadata accessor for AccountManagerHelper();
    v41.receiver = v16;
    v41.super_class = v8;
    uint64_t v9 = (char *)objc_msgSendSuper2(&v41, sel_init);
    uint64_t v20 = v9;
    uint64_t v10 = v9;
    uint64_t v11 = v9;
    uint64_t v12 = v9;
    uint64_t v13 = v9;
    id v42 = v9;
    uint64_t v17 = (id *)&v9[OBJC_IVAR___AAUIAccountManagerHelper_accountManager];
    uint64_t v18 = &v40;
    swift_beginAccess();
    id v19 = *v17;
    id v14 = v19;
    swift_endAccess();
    objc_msgSend(v19, sel_setDelegate_, v9);
    swift_unknownObjectRelease();

    sub_2098AB870();
    return v20;
  }
  uint64_t result = (char *)sub_2098BF9C8();
  __break(1u);
  return result;
}

void sub_2098AA150(void *a1@<X0>, uint64_t a2@<X8>)
{
  v6[1] = a1;
  id v2 = a1;
  v6[0] = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F04E8);
  sub_2097D9158((uint64_t)v6, v3, a2);
}

unint64_t sub_2098AA1B4()
{
  uint64_t v2 = qword_2675F04D8;
  if (!qword_2675F04D8)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F04D8);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_2098AA21C()
{
  sub_2098AA1B4();
  id v2 = objc_msgSend(self, sel_defaultStore);
  if (v2)
  {
    uint64_t v1 = v2;
  }
  else
  {
    sub_2098BF9C8();
    __break(1u);
  }
  return sub_2098AAB18(v1);
}

id sub_2098AA308()
{
  sub_2098AAB58();
  id v2 = objc_msgSend(self, sel_defaultStore);
  if (v2)
  {
    uint64_t v1 = v2;
  }
  else
  {
    sub_2098BF9C8();
    __break(1u);
  }
  return sub_2098AAB18(v1);
}

uint64_t sub_2098AA418()
{
  id v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2098BE468();
  swift_release();
  swift_release();

  return v3;
}

void sub_2098AA4B4(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & *MEMORY[0x263F8EED0]) + 0x68))(v2);
}

void sub_2098AA544(id *a1, id *a2)
{
  sub_2098243C8(a1, &v6);
  uint64_t v5 = v6;
  id v4 = *a2;
  id v2 = *a2;
  (*(void (**)(uint64_t))((*v4 & *MEMORY[0x263F8EED0]) + 0x70))(v5);
}

void sub_2098AA5E0(void *a1)
{
  id v2 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = a1;
  sub_2098BE478();
}

void (*sub_2098AA684(void *a1))(uint64_t *a1, char a2)
{
  id v4 = malloc(0x40uLL);
  *a1 = v4;
  void v4[4] = v3;
  id v1 = v3;
  v4[5] = swift_getKeyPath();
  v4[6] = swift_getKeyPath();
  v4[7] = sub_2098BE458();
  return sub_2097D95FC;
}

uint64_t sub_2098AA75C()
{
  return swift_endAccess();
}

uint64_t sub_2098AA7D0(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2675F04F0);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F04D0);
  sub_2098BE448();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_2098AA914(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  void *v6 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2675F04F0);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  __uint32_t size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_2098AA75C();
  return sub_2098AAA1C;
}

void sub_2098AAA1C(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_2098AA7D0((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_2098AA7D0((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

id sub_2098AAB18(void *a1)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_2098AC4FC(a1);
}

unint64_t sub_2098AAB58()
{
  uint64_t v2 = qword_2675F04E0;
  if (!qword_2675F04E0)
  {
    self;
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_2675F04E0);
    return ObjCClassMetadata;
  }
  return v2;
}

void *sub_2098AABC0()
{
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___AAUIAccountManagerHelper_serviceOwnersManager);
  id v1 = v3;
  return v3;
}

uint64_t type metadata accessor for AccountManagerHelper()
{
  uint64_t v1 = qword_2675F6338;
  if (!qword_2675F6338) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

id sub_2098AACD4()
{
  uint64_t v3 = (id *)(v0 + OBJC_IVAR___AAUIAccountManagerHelper_accountManager);
  swift_beginAccess();
  id v4 = *v3;
  id v1 = *v3;
  swift_endAccess();
  return v4;
}

void sub_2098AAD8C(void *a1)
{
  id v2 = a1;
  id v4 = (void **)(v1 + OBJC_IVAR___AAUIAccountManagerHelper_accountManager);
  swift_beginAccess();
  uint64_t v3 = *v4;
  *id v4 = a1;

  swift_endAccess();
}

void sub_2098AAE10(id *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  id v2 = *a1;
  *a2 = (*(uint64_t (**)(id))((*v3 & *MEMORY[0x263F8EED0]) + 0x98))(v2);
}

void sub_2098AAEA0(id *a1, id *a2)
{
  id v4 = *a1;
  id v2 = *a1;
  uint64_t v6 = *a2;
  id v3 = *a2;
  (*(void (**)(id))((*v6 & *MEMORY[0x263F8EED0]) + 0xA0))(v4);
}

uint64_t (*sub_2098AAF48())()
{
  return sub_2097DA4B0;
}

uint64_t sub_2098AAFB4()
{
  uint64_t v15 = v0;
  uint64_t v11 = (void *)(*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x98))();
  uint64_t v10 = (void *)*MEMORY[0x263F26D28];
  id v1 = (id)*MEMORY[0x263F26D28];
  id v12 = objc_msgSend(v11, sel_accounts);
  if (v12)
  {
    type metadata accessor for AIDAServiceType();
    sub_20980C484();
    sub_2098ABB08();
    uint64_t v8 = sub_2098BF2C8();

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v9)
  {
    uint64_t v7 = v9;
  }
  else
  {
    sub_2098BF9C8();
    __break(1u);
  }
  id v13 = v10;
  uint64_t v4 = type metadata accessor for AIDAServiceType();
  unint64_t v5 = sub_20980C484();
  unint64_t v2 = sub_2098ABB08();
  MEMORY[0x210505430](&v14, &v13, v7, v4, v5, v2);
  sub_2097ECA5C(&v13);
  uint64_t v6 = v14;

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2098AB1DC()
{
  uint64_t v15 = v0;
  uint64_t v11 = (void *)(*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x98))();
  uint64_t v10 = (void *)*MEMORY[0x263F26D48];
  id v1 = (id)*MEMORY[0x263F26D48];
  id v12 = objc_msgSend(v11, sel_accounts);
  if (v12)
  {
    type metadata accessor for AIDAServiceType();
    sub_20980C484();
    sub_2098ABB08();
    uint64_t v8 = sub_2098BF2C8();

    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (v9)
  {
    uint64_t v7 = v9;
  }
  else
  {
    sub_2098BF9C8();
    __break(1u);
  }
  id v13 = v10;
  uint64_t v4 = type metadata accessor for AIDAServiceType();
  unint64_t v5 = sub_20980C484();
  unint64_t v2 = sub_2098ABB08();
  MEMORY[0x210505430](&v14, &v13, v7, v4, v5, v2);
  sub_2097ECA5C(&v13);
  uint64_t v6 = v14;

  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2098AB404()
{
  uint64_t v6 = v0;
  uint64_t v4 = (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0xB0))();
  id v1 = v3;
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = (*(uint64_t (**)(void *))((*v3 & *MEMORY[0x263F8EED0]) + 0xB8))(v1);
    sub_2097ECA5C((id *)&v4);
  }

  return v5;
}

uint64_t sub_2098AB4F8()
{
  type metadata accessor for AIDAServiceType();
  sub_20980C484();
  sub_2098ABB08();
  uint64_t v19 = sub_2098BF2A8();
  uint64_t v17 = *(void **)(v0 + OBJC_IVAR___AAUIAccountManagerHelper_serviceOwnersManager);
  id v1 = v17;
  uint64_t v16 = (void *)*MEMORY[0x263F26D28];
  id v2 = (id)*MEMORY[0x263F26D28];
  id v18 = objc_msgSend(v17, sel_accountForService_, v16);

  id v3 = v18;
  if (v18)
  {
    id v4 = (id)*MEMORY[0x263F26D28];
    id v5 = v18;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2675F0508);
    sub_2098BF2F8();
  }
  id v13 = *(id *)(v15 + OBJC_IVAR___AAUIAccountManagerHelper_serviceOwnersManager);
  id v6 = v13;
  id v12 = (id)*MEMORY[0x263F26D48];
  id v7 = (id)*MEMORY[0x263F26D48];
  id v14 = objc_msgSend(v13, sel_accountForService_, v12);

  id v8 = v14;
  if (v14)
  {
    id v9 = (id)*MEMORY[0x263F26D48];
    id v10 = v14;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2675F0508);
    sub_2098BF2F8();
  }
  sub_2098BE368();

  sub_20981227C();
  return v19;
}

uint64_t sub_2098AB870()
{
  uint64_t v17 = v0;
  id v9 = (void *)MEMORY[0x263F8EED0];
  id v7 = (id)(*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x98))();
  id v1 = v8;
  uint64_t v5 = swift_allocObject();
  id v2 = v8;
  swift_unknownObjectWeakInit();

  swift_retain();
  uint64_t v15 = sub_2098ABFA0;
  uint64_t v16 = v5;
  uint64_t aBlock = MEMORY[0x263EF8330];
  int v11 = 1107296256;
  int v12 = 0;
  id v13 = sub_2098ABFA8;
  id v14 = &block_descriptor_10;
  id v6 = _Block_copy(&aBlock);
  swift_release();
  swift_release();
  objc_msgSend(v7, sel_addAccountChangeObserver_handler_, v8, v6);
  _Block_release(v6);
  swift_unknownObjectRelease();

  uint64_t v3 = (*(uint64_t (**)(void))((*v8 & *v9) + 0xC0))();
  return (*(uint64_t (**)(uint64_t))((*v8 & *v9) + 0x70))(v3);
}

uint64_t type metadata accessor for AIDAServiceType()
{
  uint64_t v4 = qword_2675ECB20;
  if (!qword_2675ECB20)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    uint64_t v4 = ForeignTypeMetadata;
    if (!v0)
    {
      unint64_t v1 = ForeignTypeMetadata;
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2675ECB20);
      return v1;
    }
  }
  return v4;
}

unint64_t sub_2098ABB08()
{
  uint64_t v2 = qword_2675F0500;
  if (!qword_2675F0500)
  {
    type metadata accessor for AIDAServiceType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0500);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098ABB8C()
{
  return swift_deallocObject();
}

void sub_2098ABBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = 0;
  v30[3] = a1;
  v30[2] = a2;
  v30[1] = a3 + 16;
  uint64_t v16 = (void *)*MEMORY[0x263F26D28];
  id v3 = (id)*MEMORY[0x263F26D28];
  id v28 = v16;
  uint64_t v17 = type metadata accessor for AIDAServiceType();
  unint64_t v18 = sub_20980C484();
  sub_2098ABB08();
  MEMORY[0x210505430](&v29, &v28, a1, v17, v18);
  sub_2097ECA5C(&v28);
  id v27 = v29;
  sub_2098BE368();
  if (v27)
  {
    v30[0] = v27;
  }
  else
  {
    id v14 = (void *)*MEMORY[0x263F26D48];
    id v4 = (id)*MEMORY[0x263F26D48];
    id v26 = v14;
    MEMORY[0x210505430](v30);
    sub_2097ECA5C(&v26);
    sub_2097ECA5C(&v27);
  }
  swift_bridgeObjectRelease();
  id v12 = (id)v30[0];
  uint64_t v25 = v30[0];
  id v13 = (void *)*MEMORY[0x263F26D28];
  id v5 = (id)*MEMORY[0x263F26D28];
  id v22 = v13;
  MEMORY[0x210505430](&v23);
  sub_2097ECA5C(&v22);
  id v21 = v23;
  sub_2098BE368();
  if (v21)
  {
    id v24 = v21;
  }
  else
  {
    int v11 = (void *)*MEMORY[0x263F26D48];
    id v6 = (id)*MEMORY[0x263F26D48];
    id v20 = v11;
    MEMORY[0x210505430](&v24);
    sub_2097ECA5C(&v20);
    sub_2097ECA5C(&v21);
  }
  swift_bridgeObjectRelease();
  id v9 = v24;
  swift_beginAccess();
  id v10 = (void *)MEMORY[0x210506E20](a3 + 16);
  swift_endAccess();
  if (v10)
  {
    id v7 = v12;
    if (v9) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = v12 != 0;
    }

    if (v8)
    {
      (*(void (**)(void))((*v10 & *MEMORY[0x263F8EED0]) + 0x70))(0);

      return;
    }
  }
}

void sub_2098ABFA0(uint64_t a1, uint64_t a2)
{
  sub_2098ABBCC(a1, a2, v2);
}

uint64_t sub_2098ABFA8(uint64_t a1, void *a2, void *a3)
{
  id v6 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  id v3 = a2;
  type metadata accessor for AIDAServiceType();
  sub_20980C484();
  sub_2098ABB08();
  uint64_t v8 = sub_2098BF2C8();
  id v4 = a3;
  sub_2098BF2C8();
  v6(v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain();
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

id AccountManagerHelper.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountManagerHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2098AC1E4()
{
  return type metadata accessor for AccountManagerHelper();
}

uint64_t sub_2098AC200()
{
  uint64_t updated = sub_2098AC454();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t method lookup function for AccountManagerHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountManagerHelper.accountManager.getter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0x98))();
}

uint64_t dispatch thunk of AccountManagerHelper.accountManager.setter()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0xA0))();
}

uint64_t dispatch thunk of AccountManagerHelper.accountManager.modify()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0xA8))();
}

uint64_t dispatch thunk of AccountManagerHelper.accounts(for:)()
{
  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x263F8EED0]) + 0xC8))();
}

uint64_t sub_2098AC454()
{
  uint64_t v4 = qword_2675F0578;
  if (!qword_2675F0578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F04E8);
    unint64_t v3 = sub_2098BE488();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_2675F0578);
      return v1;
    }
  }
  return v4;
}

id sub_2098AC4FC(void *a1)
{
  id v4 = objc_msgSend(v1, sel_initWithAccountStore_);

  return v4;
}

uint64_t sub_2098AC544()
{
  return sub_2098BFA18();
}

uint64_t sub_2098AC584()
{
  return sub_2098BFA48();
}

uint64_t sub_2098AC5CC()
{
  return sub_2098BFA28();
}

uint64_t sub_2098AC614()
{
  return sub_2098BFA88();
}

uint64_t sub_2098AC650()
{
  return sub_2098BFA58();
}

uint64_t sub_2098AC69C()
{
  return sub_2098BFA68() & 1;
}

uint64_t sub_2098AC6EC()
{
  return sub_2098BFA78();
}

uint64_t sub_2098AC738()
{
  return sub_2098BFB48() & 1;
}

uint64_t sub_2098AC784()
{
  return sub_2098BFA38();
}

unint64_t sub_2098AC7D0()
{
  return sub_2098AC7E8();
}

unint64_t sub_2098AC7E8()
{
  uint64_t v2 = qword_2675ECB48;
  if (!qword_2675ECB48)
  {
    type metadata accessor for AIDAServiceType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECB48);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AC86C()
{
  return sub_2098AC884();
}

unint64_t sub_2098AC884()
{
  uint64_t v2 = qword_2675ECB60;
  if (!qword_2675ECB60)
  {
    type metadata accessor for AIDAServiceType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECB60);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AC908()
{
  return sub_2098AC920();
}

unint64_t sub_2098AC920()
{
  uint64_t v2 = qword_2675ECB38;
  if (!qword_2675ECB38)
  {
    type metadata accessor for AIDAServiceType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECB38);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AC9A4()
{
  uint64_t v2 = qword_2675ECB50;
  if (!qword_2675ECB50)
  {
    type metadata accessor for AIDAServiceType();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675ECB50);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098ACA28()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 20));
  sub_2098BE368();
  return v2;
}

uint64_t type metadata accessor for LockDownModeRowElement()
{
  uint64_t v1 = qword_2675F6850;
  if (!qword_2675F6850) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

uint64_t sub_2098ACAE8()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 24));
  sub_2098BE368();
  return v2;
}

uint64_t sub_2098ACB30()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 28));
  sub_2098BE368();
  return v2;
}

uint64_t sub_2098ACB78()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 32));
  sub_2098BE368();
  return v2;
}

uint64_t sub_2098ACBC0()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 36));
  sub_2098BE368();
  return v2;
}

uint64_t sub_2098ACC08()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 40));
  sub_2098BE368();
  return v2;
}

uint64_t sub_2098ACC50()
{
  uint64_t v2 = *(void *)(v0 + *(int *)(type metadata accessor for LockDownModeRowElement() + 44));
  sub_2098BE368();
  return v2;
}

uint64_t sub_2098ACC98()
{
  type metadata accessor for LockDownModeRowElement();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  swift_release();
  return v1 & 1;
}

uint64_t sub_2098ACD44()
{
  return swift_release();
}

void (*sub_2098ACE14(void *a1))(uint64_t *a1, char a2)
{
  id v6 = malloc(0x48uLL);
  *a1 = v6;
  char v1 = (char *)(v3 + *(int *)(type metadata accessor for LockDownModeRowElement() + 48));
  char v4 = *v1;
  v6[67] = *v1 & 1;
  uint64_t v5 = *((void *)v1 + 1);
  *((void *)v6 + 6) = v5;
  swift_retain();
  swift_retain();
  unsigned char *v6 = v4 & 1;
  *((void *)v6 + 1) = v5;
  *((void *)v6 + 7) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  return sub_2097E65E4;
}

uint64_t sub_2098ACF14()
{
  type metadata accessor for LockDownModeRowElement();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF058();
  sub_2097E63E8();
  swift_release();
  return v1;
}

uint64_t sub_2098ACFD8()
{
  type metadata accessor for LockDownModeRowElement();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  swift_release();
  return v1 & 1;
}

uint64_t sub_2098AD084()
{
  return swift_release();
}

void (*sub_2098AD154(void *a1))(uint64_t *a1, char a2)
{
  id v6 = malloc(0x48uLL);
  *a1 = v6;
  char v1 = (char *)(v3 + *(int *)(type metadata accessor for LockDownModeRowElement() + 52));
  char v4 = *v1;
  v6[67] = *v1 & 1;
  uint64_t v5 = *((void *)v1 + 1);
  *((void *)v6 + 6) = v5;
  swift_retain();
  swift_retain();
  unsigned char *v6 = v4 & 1;
  *((void *)v6 + 1) = v5;
  *((void *)v6 + 7) = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF038();
  sub_2097E63E8();
  return sub_2097E65E4;
}

uint64_t sub_2098AD254()
{
  type metadata accessor for LockDownModeRowElement();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECC50);
  sub_2098BF058();
  sub_2097E63E8();
  swift_release();
  return v1;
}

uint64_t sub_2098AD318@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v17 = 0;
  id v12 = sub_2098AE2E8;
  uint64_t v30 = 0;
  uint64_t v29 = 0;
  uint64_t v1 = type metadata accessor for LockDownModeRowElement();
  unint64_t v7 = (*(void *)(*(void *)(v1 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v1);
  uint64_t v16 = (uint64_t)&v7 - v7;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0580);
  unint64_t v8 = (*(void *)(*(void *)(v19 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (uint64_t)&v7 - v8;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0588);
  unint64_t v10 = (*(void *)(*(void *)(v23 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v9);
  uint64_t v25 = (uint64_t)&v7 - v10;
  unint64_t v11 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v26 = (uint64_t)&v7 - v11;
  uint64_t v30 = (char *)&v7 - v11;
  uint64_t v29 = v4;
  sub_2098AE034(v4, v5);
  id v13 = &v27;
  uint64_t v28 = v16;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0590);
  unint64_t v15 = sub_2098AE2F0();
  sub_2097E8C00();
  int v18 = 1;
  sub_2098BF098();
  sub_2098AE498(v16);
  unint64_t v20 = sub_2098AE5DC();
  sub_2097E9670();
  sub_2098BEE58();
  sub_2098AE660(v21);
  unint64_t v24 = sub_2098AE758();
  sub_2097E7FAC(v25, v23, v26);
  sub_2098AE660(v25);
  sub_2098AE7F8(v26, v25);
  sub_2097E7FAC(v25, v23, v22);
  sub_2098AE660(v25);
  return sub_2098AE660(v26);
}

uint64_t sub_2098AD5A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v54 = a2;
  uint64_t v55 = a1;
  id v56 = &unk_2098EEFC8;
  id v57 = &unk_2098EEF70;
  uint64_t v97 = 0;
  id v96 = 0;
  uint64_t v95 = 0;
  uint64_t v94 = 0;
  uint64_t v58 = sub_2098BF298();
  uint64_t v59 = *(void *)(v58 - 8);
  uint64_t v60 = v58 - 8;
  unint64_t v61 = (*(void *)(v59 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v58);
  uint64_t v62 = &v23[-v61];
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C8);
  uint64_t v64 = *(void *)(v63 - 8);
  uint64_t v65 = v63 - 8;
  unint64_t v66 = (*(void *)(v64 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v63);
  uint64_t v67 = &v23[-v66];
  unint64_t v68 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v23[-v66]);
  uint64_t v69 = &v23[-v68];
  unint64_t v70 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v23[-v68]);
  id v71 = &v23[-v70];
  uint64_t v97 = &v23[-v70];
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C0);
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = v72 - 8;
  unint64_t v75 = (*(void *)(v73 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v72);
  uint64_t v76 = &v23[-v75];
  unint64_t v77 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v23[-v75]);
  uint64_t v78 = &v23[-v77];
  unint64_t v79 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v23[-v77]);
  id v80 = &v23[-v79];
  id v96 = &v23[-v79];
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0590);
  unint64_t v82 = (*(void *)(*(void *)(v81 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v81);
  id v83 = &v23[-v82];
  unint64_t v84 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](&v23[-v82]);
  uint64_t v85 = &v23[-v84];
  uint64_t v95 = &v23[-v84];
  uint64_t v94 = a1;
  if (sub_2098ACC98())
  {
    uint64_t v8 = v55;
    uint64_t v48 = type metadata accessor for LockDownModeRowElement();
    uint64_t v9 = (uint64_t *)(v8 + *(int *)(v48 + 24));
    uint64_t v45 = *v9;
    uint64_t v47 = v9[1];
    sub_2098BE368();
    unint64_t v10 = (uint64_t *)(v8 + *(int *)(v48 + 32));
    uint64_t v44 = *v10;
    uint64_t v46 = v10[1];
    sub_2098BE368();
    unint64_t v49 = sub_2098AE414();
    sub_2097FE7B0(v45, v47, v44, v46, v48, (uint64_t)v78);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v88 = v48;
    unint64_t v89 = v49;
    uint64_t v50 = 1;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    sub_2097E7FAC((uint64_t)v78, v72, (uint64_t)v80);
    uint64_t v53 = *(void (**)(unsigned char *, uint64_t))(v73 + 8);
    uint64_t v52 = v73 + 8;
    v53(v78, v72);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v73 + 16))(v76, v80, v72);
    sub_2097E7FAC((uint64_t)v76, v72, (uint64_t)v78);
    v53(v76, v72);
    uint64_t v86 = v48;
    unint64_t v87 = v49;
    uint64_t v11 = swift_getOpaqueTypeConformance2();
    sub_2097E8280((uint64_t)v78, v72, v63, OpaqueTypeConformance2, v11, (uint64_t)v83);
    v53(v78, v72);
    sub_2098B00E0((uint64_t)v83, (uint64_t)v85);
    v53(v80, v72);
  }
  else
  {
    uint64_t v12 = v55;
    unint64_t v38 = (int *)type metadata accessor for LockDownModeRowElement();
    id v13 = (uint64_t *)(v12 + v38[6]);
    uint64_t v29 = *v13;
    uint64_t v37 = v13[1];
    sub_2098BE368();
    uint64_t v14 = (uint64_t *)(v12 + v38[7]);
    uint64_t v26 = *v14;
    uint64_t v36 = v14[1];
    sub_2098BE368();
    unint64_t v15 = (uint64_t *)(v12 + v38[9]);
    uint64_t v27 = *v15;
    uint64_t v35 = v15[1];
    sub_2098BE368();
    uint64_t v16 = (uint64_t *)(v12 + v38[10]);
    uint64_t v28 = *v16;
    uint64_t v34 = v16[1];
    sub_2098BE368();
    uint64_t v17 = (uint64_t *)(v12 + v38[11]);
    uint64_t v25 = *v17;
    uint64_t v33 = v17[1];
    sub_2098BE368();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v59 + 16))(v62, v12, v58);
    uint64_t v31 = sub_2098AD254();
    uint64_t v32 = v18;
    int v24 = v19;
    unint64_t v39 = sub_2098AE414();
    uint64_t v30 = v22;
    v22[7] = v39;
    sub_209800198(v29, v37, v26, v36, v27, v35, v28, v34, (uint64_t)v69, v25, v33, (uint64_t)v62, v31, v32, v24 & 1, (uint64_t)v38);
    swift_release();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v59 + 8))(v62, v58);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v92 = v38;
    unint64_t v93 = v39;
    uint64_t v40 = 1;
    uint64_t v41 = swift_getOpaqueTypeConformance2();
    sub_2097E7FAC((uint64_t)v69, v63, (uint64_t)v71);
    id v43 = *(void (**)(unsigned char *, uint64_t))(v64 + 8);
    uint64_t v42 = v64 + 8;
    v43(v69, v63);
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v64 + 16))(v67, v71, v63);
    sub_2097E7FAC((uint64_t)v67, v63, (uint64_t)v69);
    v43(v67, v63);
    uint64_t v90 = v38;
    unint64_t v91 = v39;
    uint64_t v20 = swift_getOpaqueTypeConformance2();
    sub_2097E8378((uint64_t)v69, v72, v63, v20, v41, (uint64_t)v83);
    v43(v69, v63);
    sub_2098B00E0((uint64_t)v83, (uint64_t)v85);
    v43(v71, v63);
  }
  sub_2098B01DC((uint64_t)v85, (uint64_t)v83);
  sub_2098AE2F0();
  sub_2097E7FAC((uint64_t)v83, v81, v54);
  sub_2098B02D8((uint64_t)v83);
  return sub_2098B02D8((uint64_t)v85);
}

uint64_t sub_2098AE034(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_2098BF298();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  uint64_t v30 = (int *)type metadata accessor for LockDownModeRowElement();
  uint64_t v3 = (void *)(a1 + v30[5]);
  id v13 = (void *)(a2 + v30[5]);
  *id v13 = *v3;
  uint64_t v14 = v3[1];
  sub_2098BE368();
  v13[1] = v14;
  uint64_t v4 = v30[6];
  uint64_t v15 = a2 + v4;
  *(void *)(a2 + v4) = *(void *)(a1 + v4);
  uint64_t v16 = *(void *)(a1 + v4 + 8);
  sub_2098BE368();
  *(void *)(v15 + 8) = v16;
  uint64_t v5 = v30[7];
  uint64_t v17 = a2 + v5;
  *(void *)(a2 + v5) = *(void *)(a1 + v5);
  uint64_t v18 = *(void *)(a1 + v5 + 8);
  sub_2098BE368();
  *(void *)(v17 + 8) = v18;
  uint64_t v6 = v30[8];
  uint64_t v19 = a2 + v6;
  *(void *)(a2 + v6) = *(void *)(a1 + v6);
  uint64_t v20 = *(void *)(a1 + v6 + 8);
  sub_2098BE368();
  *(void *)(v19 + 8) = v20;
  uint64_t v7 = v30[9];
  uint64_t v21 = a2 + v7;
  *(void *)(a2 + v7) = *(void *)(a1 + v7);
  uint64_t v22 = *(void *)(a1 + v7 + 8);
  sub_2098BE368();
  *(void *)(v21 + 8) = v22;
  uint64_t v8 = v30[10];
  uint64_t v23 = a2 + v8;
  *(void *)(a2 + v8) = *(void *)(a1 + v8);
  uint64_t v24 = *(void *)(a1 + v8 + 8);
  sub_2098BE368();
  *(void *)(v23 + 8) = v24;
  uint64_t v9 = v30[11];
  uint64_t v25 = a2 + v9;
  *(void *)(a2 + v9) = *(void *)(a1 + v9);
  uint64_t v26 = *(void *)(a1 + v9 + 8);
  sub_2098BE368();
  *(void *)(v25 + 8) = v26;
  uint64_t v10 = v30[12];
  uint64_t v28 = a2 + v10;
  *(unsigned char *)(a2 + v10) = *(unsigned char *)(a1 + v10);
  uint64_t v29 = *(void *)(a1 + v10 + 8);
  swift_retain();
  *(void *)(v28 + 8) = v29;
  uint64_t v11 = v30[13];
  uint64_t v32 = a2 + v11;
  *(unsigned char *)(a2 + v11) = *(unsigned char *)(a1 + v11);
  uint64_t v33 = *(void *)(a1 + v11 + 8);
  swift_retain();
  uint64_t result = a2;
  *(void *)(v32 + 8) = v33;
  return result;
}

uint64_t sub_2098AE2E8@<X0>(uint64_t a1@<X8>)
{
  return sub_2098AD5A8(*(void *)(v1 + 16), a1);
}

unint64_t sub_2098AE2F0()
{
  uint64_t v2 = qword_2675F0598;
  if (!qword_2675F0598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0590);
    type metadata accessor for LockDownModeRowElement();
    sub_2098AE414();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0598);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AE414()
{
  uint64_t v2 = qword_2675F05A0;
  if (!qword_2675F05A0)
  {
    type metadata accessor for LockDownModeRowElement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05A0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098AE498(uint64_t a1)
{
  uint64_t v1 = sub_2098BF298();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  type metadata accessor for LockDownModeRowElement();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return a1;
}

unint64_t sub_2098AE5DC()
{
  uint64_t v2 = qword_2675F05A8;
  if (!qword_2675F05A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0580);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05A8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098AE660(uint64_t a1)
{
  uint64_t v3 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B0) + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C8);
  }
  else {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C0);
  }
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1 + v3);
  return a1;
}

unint64_t sub_2098AE758()
{
  uint64_t v2 = qword_2675F05D0;
  if (!qword_2675F05D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675F0588);
    sub_2098AE5DC();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05D0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098AE7F8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(unsigned char *)(a2 + 16) = *(unsigned char *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C8);
  }
  else {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C0);
  }
  (*(void (**)(void))(*(void *)(v2 - 8) + 16))();
  swift_storeEnumTagMultiPayload();
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0588);
  memcpy((void *)(a2 + *(int *)(v3 + 36)), (const void *)(a1 + *(int *)(v3 + 36)), 0x29uLL);
  return a2;
}

uint64_t sub_2098AE984()
{
  return sub_2098BF3C8();
}

uint64_t sub_2098AEAEC()
{
  return sub_2098AE984();
}

uint64_t sub_2098AEB14()
{
  return sub_2098BFB48() & 1;
}

unint64_t sub_2098AEB60()
{
  uint64_t v2 = qword_2675F05D8;
  if (!qword_2675F05D8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05D8);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098AEBE0()
{
  return sub_2098BF458();
}

uint64_t sub_2098AEC20()
{
  return sub_2098BF478();
}

uint64_t sub_2098AEC68()
{
  return sub_2098BF468();
}

uint64_t sub_2098AECB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2098AE984();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_2098AECE4()
{
  return sub_2098AEAEC();
}

uint64_t sub_2098AED00()
{
  return sub_2098BFC28();
}

unint64_t sub_2098AED30()
{
  uint64_t v2 = qword_2675F05E0;
  if (!qword_2675F05E0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05E0);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098AEDB0()
{
  return sub_2098BFC38();
}

uint64_t sub_2098AEDE0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v80 = a2;
  uint64_t v97 = a1;
  uint64_t v115 = 0;
  uint64_t v114 = 0;
  uint64_t v112 = 0;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05E8);
  uint64_t v82 = *(void *)(v81 - 8);
  uint64_t v83 = v81 - 8;
  unint64_t v84 = (*(void *)(v82 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v81);
  uint64_t v85 = (char *)v43 - v84;
  uint64_t v115 = (char *)v43 - v84;
  uint64_t v86 = 0;
  uint64_t v87 = sub_2098BF298();
  uint64_t v88 = *(void *)(v87 - 8);
  uint64_t v89 = v87 - 8;
  unint64_t v90 = (*(void *)(v88 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v86);
  unint64_t v91 = (char *)v43 - v90;
  uint64_t v92 = (int *)type metadata accessor for LockDownModeRowElement();
  unint64_t v93 = (*(void *)(*((void *)v92 - 1) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v92);
  uint64_t v96 = (uint64_t)v43 - v93;
  uint64_t v114 = (char *)v43 - v93;
  __int16 v113 = 0;
  uint64_t v112 = v3;
  uint64_t v95 = *(int *)(v2 + 52);
  int v94 = 1;
  char v4 = sub_2097E62E4();
  uint64_t v5 = v97;
  __int16 v113 = 512;
  uint64_t v6 = v96 + v95;
  *(unsigned char *)uint64_t v6 = v4 & v94;
  *(void *)(v6 + 8) = v7;
  uint64_t v100 = v5[3];
  uint64_t v98 = v5[4];
  __swift_project_boxed_opaque_existential_0(v5, v100);
  uint64_t v8 = v99;
  uint64_t v9 = sub_2098BFBE8();
  uint64_t v101 = v8;
  uint64_t v102 = v9;
  uint64_t v103 = v10;
  uint64_t v104 = v8;
  if (v8)
  {
    uint64_t v44 = v104;
  }
  else
  {
    uint64_t v11 = v97;
    uint64_t v12 = v103;
    id v13 = (uint64_t *)(v96 + v92[5]);
    __int16 v113 = 514;
    *id v13 = v102;
    v13[1] = v12;
    unint64_t v77 = v111;
    sub_2097EBD50((uint64_t)v11, (uint64_t)v111);
    uint64_t v14 = v101;
    sub_2098BF288();
    uint64_t v78 = v14;
    uint64_t v79 = v14;
    if (v14)
    {
      uint64_t v44 = v79;
    }
    else
    {
      __int16 v113 = 515;
      (*(void (**)(uint64_t, char *, uint64_t))(v88 + 32))(v96, v91, v87);
      uint64_t v73 = v97[3];
      uint64_t v74 = v97[4];
      __swift_project_boxed_opaque_existential_0(v97, v73);
      sub_2098AED30();
      uint64_t v15 = v78;
      sub_2098BFC08();
      uint64_t v75 = v15;
      uint64_t v76 = v15;
      if (!v15)
      {
        char v110 = 0;
        uint64_t v16 = sub_2098BFAC8();
        uint64_t v69 = 0;
        uint64_t v70 = v16;
        uint64_t v71 = v17;
        uint64_t v72 = 0;
        uint64_t v18 = (uint64_t *)(v96 + v92[6]);
        __int16 v113 = 519;
        uint64_t *v18 = v16;
        v18[1] = v17;
        char v109 = 1;
        uint64_t v19 = sub_2098BFAC8();
        uint64_t v65 = 0;
        uint64_t v66 = v19;
        uint64_t v67 = v20;
        uint64_t v68 = 0;
        uint64_t v21 = (uint64_t *)(v96 + v92[7]);
        __int16 v113 = 527;
        uint64_t *v21 = v19;
        v21[1] = v20;
        char v108 = 4;
        uint64_t v22 = sub_2098BFAC8();
        uint64_t v61 = 0;
        uint64_t v62 = v22;
        uint64_t v63 = v23;
        uint64_t v64 = 0;
        uint64_t v24 = (uint64_t *)(v96 + v92[8]);
        __int16 v113 = 543;
        uint64_t *v24 = v22;
        v24[1] = v23;
        char v107 = 2;
        uint64_t v25 = sub_2098BFAC8();
        uint64_t v57 = 0;
        uint64_t v58 = v25;
        uint64_t v59 = v26;
        uint64_t v60 = 0;
        uint64_t v27 = (uint64_t *)(v96 + v92[9]);
        __int16 v113 = 575;
        uint64_t *v27 = v25;
        v27[1] = v26;
        char v106 = 3;
        uint64_t v28 = sub_2098BFAC8();
        uint64_t v53 = 0;
        uint64_t v54 = v28;
        uint64_t v55 = v29;
        uint64_t v56 = 0;
        uint64_t v30 = (uint64_t *)(v96 + v92[10]);
        __int16 v113 = 639;
        *uint64_t v30 = v28;
        v30[1] = v29;
        char v105 = 5;
        uint64_t v31 = sub_2098BFAC8();
        uint64_t v49 = 0;
        uint64_t v50 = v31;
        uint64_t v51 = v32;
        uint64_t v52 = 0;
        uint64_t v33 = (uint64_t *)(v96 + v92[11]);
        __int16 v113 = 767;
        *uint64_t v33 = v31;
        v33[1] = v32;
        sub_2098BE288();
        id v45 = (id)sub_2098BE268();
        int v46 = MEMORY[0x2105043C0]();

        uint64_t v48 = (unsigned char *)(v96 + v92[12]);
        __int16 v113 = 1023;
        int v47 = 1;
        char v34 = sub_2097E62E4();
        uint64_t v35 = v48;
        uint64_t v36 = v82;
        char v37 = v34;
        unint64_t v38 = v85;
        uint64_t v40 = v39;
        uint64_t v41 = v81;
        *uint64_t v48 = v37 & v47;
        *((void *)v35 + 1) = v40;
        (*(void (**)(char *, uint64_t))(v36 + 8))(v38, v41);
        sub_2098AE034(v96, v80);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v97);
        return sub_2098AE498(v96);
      }
      uint64_t v44 = v76;
    }
  }
  v43[0] = v44;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v97);
  if (v113) {
    (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v96, v87);
  }
  if ((v113 & 2) != 0) {
    sub_2097EBD24();
  }
  if ((v113 & 4) != 0) {
    sub_2097EBD24();
  }
  if ((v113 & 8) != 0) {
    sub_2097EBD24();
  }
  if ((v113 & 0x10) != 0) {
    sub_2097EBD24();
  }
  if ((v113 & 0x20) != 0) {
    sub_2097EBD24();
  }
  if ((v113 & 0x40) != 0) {
    sub_2097EBD24();
  }
  uint64_t result = v96 + v92[13];
  sub_2097E63E8();
  return result;
}

uint64_t sub_2098AF92C@<X0>(uint64_t a1@<X8>)
{
  return sub_2098AD318(a1);
}

uint64_t sub_2098AF944@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2098AEDE0(a1, a2);
}

uint64_t sub_2098AF99C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2098ACA28();
  *a1 = result;
  a1[1] = v2;
  return result;
}

unint64_t sub_2098AF9CC()
{
  return sub_2098AF9E4();
}

unint64_t sub_2098AF9E4()
{
  uint64_t v2 = qword_2675F05F0;
  if (!qword_2675F05F0)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05F0);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AFA64()
{
  return sub_2098AFA7C();
}

unint64_t sub_2098AFA7C()
{
  uint64_t v2 = qword_2675F05F8;
  if (!qword_2675F05F8)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F05F8);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AFAFC()
{
  return sub_2098AFB14();
}

unint64_t sub_2098AFB14()
{
  uint64_t v2 = qword_2675F0600;
  if (!qword_2675F0600)
  {
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0600);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098AFB94()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2098AFBC8()
{
  return sub_2098AFBE0();
}

unint64_t sub_2098AFBE0()
{
  uint64_t v2 = qword_2675F0608;
  if (!qword_2675F0608)
  {
    type metadata accessor for LockDownModeRowElement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0608);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AFC64()
{
  return sub_2098AFC7C();
}

unint64_t sub_2098AFC7C()
{
  uint64_t v2 = qword_2675F0610;
  if (!qword_2675F0610)
  {
    type metadata accessor for LockDownModeRowElement();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0610);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_2098AFD00()
{
  return sub_2098AE414();
}

uint64_t sub_2098AFD18()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2098AFD40(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v9 = sub_2098BF298();
  if (a2 == *(_DWORD *)(*(void *)(v9 - 8) + 84))
  {
    return (*(unsigned int (**)(uint64_t, void, uint64_t))(*(void *)(v9 - 8) + 48))(a1, a2, v9);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    int v4 = -1;
    if (*(void *)(a1 + *(int *)(a3 + 20) + 8) < 0x100000000uLL) {
      int v4 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    }
    return (v4 + 1);
  }
  else
  {
    __break(1u);
  }
  return v5;
}

uint64_t sub_2098AFE68()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2098AFE90(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2098BF298();
  if (a3 == *(_DWORD *)(*(void *)(result - 8) + 84)) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)(result - 8) + 56))(a1, a2, a2, result);
  }
  if (a3 == 0x7FFFFFFF) {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2 - 1;
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t sub_2098AFF8C()
{
  uint64_t v2 = sub_2098BF298();
  if (v0 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return v2;
}

void *type metadata accessor for LockDownModeRowElement.CodingKeys()
{
  return &unk_26BD39C68;
}

unint64_t sub_2098B00C8()
{
  return sub_2098AE758();
}

uint64_t sub_2098B00E0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C8);
  }
  else {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C0);
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 32))(a2, a1);
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_2098B01DC(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C8);
  }
  else {
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C0);
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a2, a1);
  swift_storeEnumTagMultiPayload();
  return a2;
}

uint64_t sub_2098B02D8(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05B8);
  if (swift_getEnumCaseMultiPayload() == 1) {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C8);
  }
  else {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F05C0);
  }
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(a1);
  return a1;
}

id sub_2098B03A4()
{
  return sub_209808A98();
}

uint64_t sub_2098B03EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC14AppleAccountUI17CustodianListItem_custodianID;
  uint64_t v2 = sub_2098BE1A8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t sub_2098B0460@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = OBJC_IVAR____TtC14AppleAccountUI17CustodianListItem_custodianID;
  uint64_t v2 = sub_2098BE1A8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v1 + v4);
}

uint64_t sub_2098B04CC()
{
  swift_retain();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2098BE468();
  swift_release();
  swift_release();
  swift_release();
  return v1 & 1;
}

uint64_t sub_2098B056C@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 128))(v2) & 1;
  return swift_release();
}

uint64_t sub_2098B05F0(char *a1, uint64_t *a2)
{
  char v4 = *a1;
  uint64_t v3 = *a2;
  swift_retain();
  (*(void (**)(void))(*(void *)v3 + 136))(v4 & 1);
  return swift_release();
}

uint64_t sub_2098B0670()
{
  return sub_2098BE478();
}

void (*sub_2098B0714(void *a1))(void (***a1)(void, void))
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v2;
  swift_retain();
  void v3[5] = swift_getKeyPath();
  v3[6] = swift_getKeyPath();
  v3[7] = sub_2098BE458();
  return sub_2097E4630;
}

uint64_t sub_2098B07EC()
{
  return swift_endAccess();
}

uint64_t sub_2098B0860(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE7B8);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE7B0);
  sub_2098BE448();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_2098B09A4(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  void *v6 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE7B8);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  __uint32_t size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_2098B07EC();
  return sub_2098B0AAC;
}

void sub_2098B0AAC(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_2098B0860((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_2098B0860((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

void *sub_2098B0BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9)
{
  return sub_2098B0C40(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void *sub_2098B0C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9)
{
  uint64_t v76 = a1;
  uint64_t v71 = a2;
  uint64_t v78 = a3;
  uint64_t v79 = a4;
  uint64_t v66 = a5;
  uint64_t v67 = a6;
  uint64_t v68 = a7;
  unint64_t v69 = a8;
  uint64_t v70 = a9;
  uint64_t v57 = "Fatal error";
  uint64_t v58 = "Unexpectedly found nil while unwrapping an Optional value";
  uint64_t v59 = "AppleAccountUI/CustodianListItem.swift";
  uint64_t v104 = 0;
  uint64_t v105 = 0;
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  uint64_t v97 = 0;
  uint64_t v96 = 0;
  char v90 = 0;
  char v84 = 0;
  uint64_t v81 = 0;
  unint64_t v82 = 0;
  uint64_t v80 = 0;
  uint64_t v60 = 0;
  uint64_t v61 = sub_2098BE1A8();
  uint64_t v62 = *(void *)(v61 - 8);
  uint64_t v63 = v61 - 8;
  unint64_t v64 = (*(void *)(v62 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](0);
  uint64_t v65 = (char *)v29 - v64;
  uint64_t v72 = sub_2098BDF28();
  uint64_t v73 = *(void *)(v72 - 8);
  uint64_t v74 = v72 - 8;
  unint64_t v75 = (*(void *)(v73 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = MEMORY[0x270FA5388](v79);
  unint64_t v77 = (char *)v29 - v75;
  uint64_t v104 = v76;
  uint64_t v105 = v11;
  uint64_t v102 = v12;
  uint64_t v103 = v10;
  uint64_t v100 = v13;
  uint64_t v101 = v14;
  uint64_t v98 = v15;
  uint64_t v99 = v16;
  uint64_t v97 = v17;
  uint64_t v96 = v9;
  sub_2098BE368();
  uint64_t v92 = v78;
  uint64_t v93 = v79;
  if (v79)
  {
    uint64_t v94 = v92;
    uint64_t v95 = v93;
  }
  else
  {
    uint64_t v94 = sub_2098BF3C8();
    uint64_t v95 = v18;
    sub_2097EBD24();
  }
  uint64_t v52 = v91;
  v91[0] = v94;
  v91[1] = v95;
  sub_2098BDF18();
  unint64_t v49 = sub_2097FCD6C();
  uint64_t v53 = sub_2098BF818();
  uint64_t v54 = v19;
  uint64_t v50 = *(void (**)(char *, uint64_t))(v73 + 8);
  uint64_t v51 = v73 + 8;
  v50(v77, v72);
  sub_2097EBD24();
  int v55 = sub_2098BF3E8();
  char v90 = v55 & 1;
  swift_bridgeObjectRelease();
  if (v55)
  {
    sub_2098BE368();
    uint64_t v47 = v66;
    uint64_t v48 = v67;
  }
  else
  {
    sub_2098BE368();
    if (v79)
    {
      uint64_t v45 = v78;
      uint64_t v46 = v79;
    }
    else
    {
      sub_2098BF9C8();
      __break(1u);
    }
    uint64_t v47 = v45;
    uint64_t v48 = v46;
  }
  uint64_t v20 = v56;
  uint64_t v21 = v48;
  v56[4] = v47;
  v20[5] = v21;
  sub_2098BE368();
  uint64_t v86 = v76;
  uint64_t v87 = v71;
  if (v71)
  {
    uint64_t v88 = v86;
    uint64_t v89 = v87;
  }
  else
  {
    uint64_t v88 = sub_2098BF3C8();
    uint64_t v89 = v22;
    sub_2097EBD24();
  }
  uint64_t v41 = v85;
  v85[0] = v88;
  v85[1] = v89;
  sub_2098BDF18();
  uint64_t v42 = sub_2098BF818();
  uint64_t v43 = v23;
  v50(v77, v72);
  sub_2097EBD24();
  int v44 = sub_2098BF3E8();
  char v84 = v44 & 1;
  swift_bridgeObjectRelease();
  if (v44)
  {
    sub_2098BE368();
    uint64_t v39 = v66;
    uint64_t v40 = v67;
  }
  else
  {
    sub_2098BE368();
    if (v71)
    {
      uint64_t v37 = v76;
      uint64_t v38 = v71;
    }
    else
    {
      sub_2098BF9C8();
      __break(1u);
    }
    uint64_t v39 = v37;
    uint64_t v40 = v38;
  }
  unint64_t v24 = v69;
  uint64_t v25 = v68;
  uint64_t v26 = v56;
  uint64_t v27 = v40;
  v56[2] = v39;
  v26[3] = v27;
  sub_209807C08(v25, v24);
  if ((v69 & 0xF000000000000000) == 0xF000000000000000) {
    goto LABEL_25;
  }
  uint64_t v35 = v68;
  unint64_t v36 = v69;
  unint64_t v33 = v69;
  uint64_t v32 = v68;
  uint64_t v81 = v68;
  unint64_t v82 = v69;
  sub_2097FA58C(v68, v69);
  uint64_t v34 = sub_2098B1668(v32, v33);
  if (!v34)
  {
    sub_2097FA618(v32, v33);
LABEL_25:
    sub_2098BF3C8();
    v56[6] = sub_2098BEF98();
    goto LABEL_26;
  }
  uint64_t v31 = v34;
  uint64_t v30 = v34;
  uint64_t v80 = v34;
  swift_retain();
  v56[6] = v30;
  swift_release();
  sub_2097FA618(v32, v33);
LABEL_26:
  (*(void (**)(char *, uint64_t, uint64_t))(v62 + 16))(v65, v70, v61);
  (*(void (**)(uint64_t, char *, uint64_t))(v62 + 32))((uint64_t)v56 + OBJC_IVAR____TtC14AppleAccountUI17CustodianListItem_custodianID, v65, v61);
  v29[0] = (uint64_t)v56 + OBJC_IVAR____TtC14AppleAccountUI17CustodianListItem__selected;
  v29[1] = (uint64_t)&v83;
  swift_beginAccess();
  sub_2097E42C8(1, v29[0]);
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v70, v61);
  sub_209807C54(v68, v69);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v56;
}

uint64_t sub_2098B1668(uint64_t a1, unint64_t a2)
{
  sub_2097FA524();
  sub_2097FA58C(a1, a2);
  id v8 = sub_2097F63CC(a1, a2);
  if (v8)
  {
    id v2 = v8;
    uint64_t v4 = sub_2098BEF88();
    swift_retain();

    sub_2097FA618(a1, a2);
    sub_2097FF904();
    return v4;
  }
  else
  {
    sub_2097FA618(a1, a2);
    return 0;
  }
}

uint64_t sub_2098B176C()
{
  sub_2097EBD24();
  sub_2097EBD24();
  sub_2097FF904();
  uint64_t v4 = OBJC_IVAR____TtC14AppleAccountUI17CustodianListItem_custodianID;
  uint64_t v1 = sub_2098BE1A8();
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4);
  uint64_t v5 = OBJC_IVAR____TtC14AppleAccountUI17CustodianListItem__selected;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE7B0);
  (*(void (**)(uint64_t))(*(void *)(v2 - 8) + 8))(v0 + v5);
  return v6;
}

uint64_t sub_2098B1850()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2098B18B8()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 120))();
}

uint64_t sub_2098B1900@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CustodianListItem();
  uint64_t result = sub_2098BE418();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for CustodianListItem()
{
  uint64_t v1 = qword_2675F6980;
  if (!qword_2675F6980) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

unint64_t sub_2098B19B4()
{
  return sub_2098B19CC();
}

unint64_t sub_2098B19CC()
{
  uint64_t v2 = qword_2675F0618;
  if (!qword_2675F0618)
  {
    sub_2098BE1A8();
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F0618);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_2098B1A50()
{
  return type metadata accessor for CustodianListItem();
}

uint64_t sub_2098B1A6C()
{
  uint64_t updated = sub_2098BE1A8();
  if (v0 <= 0x3F)
  {
    uint64_t updated = sub_2097ED0C0();
    if (v1 <= 0x3F)
    {
      uint64_t updated = swift_updateClassMetadata2();
      if (!updated) {
        return 0;
      }
    }
  }
  return updated;
}

void *sub_2098B1BD8()
{
  uint64_t v3 = *(void **)(v0 + 24);
  id v1 = v3;
  return v3;
}

uint64_t sub_2098B1C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v6[1] = a1;
  sub_2098BE368();
  v6[0] = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEEC0);
  sub_2097D9158((uint64_t)v6, v2, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2098B1C6C()
{
  swift_retain();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2098BE468();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2098B1D08@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v2 = swift_retain();
  *a2 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 104))(v2);
  return swift_release();
}

uint64_t sub_2098B1D88(uint64_t *a1, uint64_t *a2)
{
  sub_2097E2C44(a1, &v6);
  uint64_t v4 = v6;
  uint64_t v5 = *a2;
  swift_retain();
  (*(void (**)(uint64_t))(*(void *)v5 + 112))(v4);
  return swift_release();
}

uint64_t sub_2098B1E14()
{
  return swift_bridgeObjectRelease();
}

void (*sub_2098B1EB8(void *a1))(void (***a1)(void, void))
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[4] = v2;
  swift_retain();
  void v3[5] = swift_getKeyPath();
  v3[6] = swift_getKeyPath();
  v3[7] = sub_2098BE458();
  return sub_2097E4630;
}

uint64_t sub_2098B1F90()
{
  return sub_2098BFB28();
}

uint64_t sub_2098B1FC4()
{
  return swift_endAccess();
}

uint64_t sub_2098B2038(uint64_t a1)
{
  uint64_t v7 = a1;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0628);
  uint64_t v5 = *(void *)(v8 - 8);
  uint64_t v6 = v8 - 8;
  v4[0] = (*(void *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v8);
  v4[1] = (char *)v4 - v4[0];
  uint64_t v11 = v2;
  uint64_t v10 = v1;
  (*(void (**)(void))(v5 + 16))();
  v4[2] = &v9;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0620);
  sub_2098BE448();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v7, v8);
}

void (*sub_2098B217C(void *a1))(void **a1, char a2)
{
  uint64_t v6 = malloc(0x28uLL);
  *a1 = v6;
  void *v6 = v1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0628);
  v6[1] = v2;
  uint64_t v4 = *(void *)(v2 - 8);
  void v6[2] = v4;
  __uint32_t size = *(void *)(v4 + 64);
  v6[3] = malloc(__size);
  v6[4] = malloc(__size);
  sub_2098B1FC4();
  return sub_2098B2284;
}

void sub_2098B2284(void **a1, char a2)
{
  uint64_t v8 = *a1;
  if (a2)
  {
    uint64_t v4 = (void *)v8[4];
    uint64_t v5 = (void *)v8[3];
    uint64_t v3 = v8[1];
    uint64_t v2 = v8[2];
    (*(void (**)(void))(v2 + 16))();
    sub_2098B2038((uint64_t)v5);
    (*(void (**)(void *, uint64_t))(v2 + 8))(v4, v3);
    free(v4);
    free(v5);
  }
  else
  {
    uint64_t v6 = (void *)v8[4];
    uint64_t v7 = (void *)v8[3];
    sub_2098B2038((uint64_t)v6);
    free(v6);
    free(v7);
  }
  free(v8);
}

uint64_t sub_2098B2380(void *a1, void *a2)
{
  return sub_2098B23D4(a1, a2);
}

uint64_t sub_2098B23D4(void *a1, void *a2)
{
  id v21 = a1;
  id v20 = a2;
  uint64_t v25 = 0;
  uint64_t v24 = 0;
  uint64_t v23 = 0;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0620);
  uint64_t v13 = *(void *)(v17 - 8);
  uint64_t v14 = v17 - 8;
  unint64_t v11 = (*(void *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v16 = (uint64_t)&v10 - v11;
  uint64_t v25 = MEMORY[0x270FA5388](v21);
  uint64_t v24 = v3;
  uint64_t v23 = v2;
  uint64_t v15 = OBJC_IVAR____TtC14AppleAccountUI28ReviewCustodianListViewModel__custodianListItems;
  uint64_t v12 = 0;
  type metadata accessor for CustodianListItem();
  uint64_t v4 = sub_2098BFB28();
  sub_2098B1C04(v4, v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v2 + v15, v16, v17);
  id v5 = v21;
  id v6 = v20;
  *(void *)(v2 + 16) = v21;
  id v7 = v6;
  *(void *)(v2 + 24) = v20;
  id v19 = *(id *)(v2 + 24);
  id v8 = v19;
  swift_retain();
  uint64_t v18 = v22;
  objc_msgSend(v19, sel_setDataDelegate_);
  swift_unknownObjectRelease();

  return v22;
}

uint64_t sub_2098B2560()
{
  uint64_t v3 = OBJC_IVAR____TtC14AppleAccountUI28ReviewCustodianListViewModel__custodianListItems;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675F0620);
  (*(void (**)(uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v3);
  return v4;
}

uint64_t sub_2098B25EC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2098B2654@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ReviewCustodianListViewModel();
  uint64_t result = sub_2098BE418();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for ReviewCustodianListViewModel()
{
  uint64_t v1 = qword_2675F6A30;
  if (!qword_2675F6A30) {
    return swift_getSingletonMetadata();
  }
  return v1;
}

void sub_2098B2708()
{
  uint64_t v4 = *(void **)(v0 + 24);
  id v1 = v4;
  id v5 = objc_msgSend(v4, sel_localContacts);
  if (v5)
  {
    sub_2097D970C();
    uint64_t v2 = sub_2098BF498();

    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = 0;
  }

  if (v3)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675EE698);
    sub_2098128E4();
    sub_2098BF428();
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2098B2898(uint64_t a1, uint64_t a2)
{
  uint64_t v121 = a1;
  uint64_t v120 = a2;
  uint64_t v117 = 0;
  char v110 = sub_2097DFE10;
  id v111 = sub_2098B3CE4;
  id v149 = 0;
  id v148 = 0;
  uint64_t v147 = 0;
  uint64_t v140 = 0;
  id v138 = 0;
  uint64_t v112 = sub_2098BE308();
  uint64_t v113 = *(void *)(v112 - 8);
  uint64_t v114 = v112 - 8;
  unint64_t v115 = (*(void *)(v113 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v112);
  uint64_t v116 = (char *)v30 - v115;
  unint64_t v118 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2675F0698) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v117);
  uint64_t v119 = (uint64_t)v30 - v118;
  uint64_t v122 = sub_2098BE1A8();
  uint64_t v123 = *(void *)(v122 - 8);
  uint64_t v124 = v122 - 8;
  unint64_t v125 = (*(void *)(v123 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v2 = MEMORY[0x270FA5388](v121);
  int v126 = (char *)v30 - v125;
  unint64_t v127 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  long long v128 = (char *)v30 - v127;
  unint64_t v129 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v130 = (char *)v30 - v129;
  unint64_t v131 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  id v8 = (id *)MEMORY[0x270FA5388](v6);
  uint64_t v132 = (char *)v30 - v131;
  id v149 = (char *)v30 - v131;
  id v133 = *v8;
  id v148 = v133;
  uint64_t v147 = v9;
  id v134 = objc_msgSend(v133, sel_custodianID);
  if (v134)
  {
    id v108 = v134;
    id v107 = v134;
    sub_2098BE188();
    (*(void (**)(uint64_t, char *, uint64_t))(v123 + 32))(v119, v130, v122);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v123 + 56))(v119, 0, 1, v122);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v123 + 56))(v119, 1, 1, v122);
  }
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v123 + 48))(v119, 1, v122) == 1)
  {
    uint64_t v10 = v116;
    sub_2098B3C34(v119);
    uint64_t v11 = sub_2098388C0();
    (*(void (**)(char *, uint64_t, uint64_t))(v113 + 16))(v10, v11, v112);
    uint64_t v105 = sub_2098BE2E8();
    int v104 = sub_2098BF708();
    uint64_t v102 = &v145;
    uint64_t v145 = 2;
    unint64_t v100 = sub_2097DFBE0();
    unint64_t v101 = sub_2097DFC5C();
    sub_2097DFCD8();
    sub_2098BF448();
    uint32_t v103 = v146;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD68);
    uint64_t v106 = sub_2098BFB28();
    if (os_log_type_enabled(v105, (os_log_type_t)v104))
    {
      uint64_t v34 = (uint8_t *)sub_2098BF7D8();
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD50);
      uint64_t v33 = 0;
      uint64_t v35 = sub_2097DFD54(0);
      uint64_t v36 = sub_2097DFD54(v33);
      uint64_t v40 = &v144;
      uint64_t v144 = v34;
      uint64_t v41 = &v143;
      uint64_t v143 = v35;
      uint64_t v38 = &v142;
      uint64_t v142 = v36;
      unsigned int v37 = 0;
      sub_2097DFDB0(0, &v144);
      sub_2097DFDB0(v37, v40);
      uint64_t v141 = v106;
      uint64_t v39 = v30;
      MEMORY[0x270FA5388](v30);
      uint64_t v25 = v41;
      uint64_t v26 = &v30[-6];
      uint64_t v42 = &v30[-6];
      v26[2] = v40;
      v26[3] = v25;
      v26[4] = v27;
      uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675ECD00);
      sub_2097DFE40();
      uint64_t v28 = v109;
      sub_2098BF428();
      uint64_t v44 = v28;
      if (v28)
      {
        __break(1u);
      }
      else
      {
        _os_log_impl(&dword_209754000, v105, (os_log_type_t)v104, "Local contact does not contain custodianID. Skipping adding it to the list.", v34, v103);
        v30[1] = 0;
        sub_2097DFF3C(v35);
        sub_2097DFF3C(v36);
        sub_2098BF7B8();
        swift_bridgeObjectRelease();
        uint64_t v31 = v44;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v31 = v109;
    }
    v30[0] = v31;

    (*(void (**)(char *, uint64_t))(v113 + 8))(v116, v112);
    return v30[0];
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v123 + 32))(v132, v119, v122);
  uint64_t v95 = type metadata accessor for Status();
  uint64_t v12 = sub_2098BFB28();
  *uint64_t v13 = 2;
  v13[1] = 1;
  v13[2] = 3;
  sub_2097E2734();
  uint64_t v93 = v12;
  unint64_t v96 = sub_209807240();
  uint64_t v94 = sub_2098BF658();
  uint64_t v140 = v94;
  id v139 = objc_msgSend(v133, sel_trustedContactStatus);
  int v99 = sub_2098BF668();
  swift_retain();
  uint64_t v97 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
  uint64_t v98 = v123 + 16;
  v97(v128, v132, v122);
  if ((v99 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v135 = (*(uint64_t (**)(void))(*(void *)v120 + 104))();
  v97(v126, v128, v122);
  uint64_t v88 = v30;
  MEMORY[0x270FA5388](v30);
  uint64_t v89 = &v30[-4];
  uint64_t v29 = v14;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEEC0);
  sub_2098B3D10();
  uint64_t v15 = v109;
  int v16 = sub_2098BF438();
  uint64_t v91 = v15;
  int v92 = v16;
  if (v15)
  {
    __break(1u);
LABEL_11:
    BOOL v86 = 0;
    uint64_t v87 = v109;
    goto LABEL_12;
  }
  int v85 = v92;
  (*(void (**)(char *, uint64_t))(v123 + 8))(v126, v122);
  sub_20981227C();
  BOOL v86 = (v85 & 1) == 0;
  uint64_t v87 = v91;
LABEL_12:
  uint64_t v81 = v87;
  BOOL v84 = v86;
  swift_release();
  unint64_t v82 = *(void (**)(char *, uint64_t))(v123 + 8);
  uint64_t v83 = v123 + 8;
  v82(v128, v122);
  if (v84)
  {
    uint64_t v79 = type metadata accessor for CustodianListItem();
    id v80 = objc_msgSend(v133, sel_fullName);
    if (v80)
    {
      id v78 = v80;
      id v73 = v80;
      uint64_t v74 = sub_2098BF368();
      uint64_t v75 = v17;

      uint64_t v76 = v74;
      uint64_t v77 = v75;
    }
    else
    {
      uint64_t v76 = 0;
      uint64_t v77 = 0;
    }
    uint64_t v70 = v77;
    uint64_t v71 = v76;
    id v72 = objc_msgSend(v133, sel_firstName);
    if (v72)
    {
      id v69 = v72;
      id v64 = v72;
      uint64_t v65 = sub_2098BF368();
      uint64_t v66 = v18;

      uint64_t v67 = v65;
      uint64_t v68 = v66;
    }
    else
    {
      uint64_t v67 = 0;
      uint64_t v68 = 0;
    }
    uint64_t v58 = v68;
    uint64_t v59 = v67;
    id v60 = objc_msgSend(v133, sel_handle);
    uint64_t v61 = sub_2098BF368();
    uint64_t v62 = v19;
    id v63 = objc_msgSend(v133, sel_imageData);
    if (v63)
    {
      id v57 = v63;
      id v52 = v63;
      uint64_t v53 = sub_2098BE068();
      unint64_t v54 = v20;

      uint64_t v55 = v53;
      unint64_t v56 = v54;
    }
    else
    {
      uint64_t v55 = 0;
      unint64_t v56 = 0xF000000000000000;
    }
    unint64_t v47 = v56;
    uint64_t v46 = v55;
    v97(v130, v132, v122);
    id v21 = sub_2098B0BA8(v71, v70, v59, v58, v61, v62, v46, v47, (uint64_t)v130);
    uint64_t v22 = v120;
    uint64_t v51 = v21;

    id v138 = v51;
    swift_retain();
    uint64_t v48 = &v137;
    uint64_t v137 = v51;
    uint64_t v23 = *(uint64_t (**)(void))(*(void *)v22 + 120);
    unint64_t v49 = &v136;
    uint64_t v50 = (void (*)(void))v23();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2675EEEC0);
    sub_2098BF4F8();
    v50();
    swift_release();
  }
  swift_bridgeObjectRelease();
  v82(v132, v122);
  uint64_t result = v81;
  uint64_t v45 = v81;
  return result;
}

uint64_t sub_2098B38E8(uint64_t a1)
{
  return sub_2098B2898(a1, v1);
}

uint64_t sub_2098B390C(uint64_t *a1, uint64_t a2)
{
  uint64_t v6 = a1;
  uint64_t v7 = a2;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v10 = sub_2098BE1A8();
  uint64_t v8 = *(void *)(v10 - 8);
  uint64_t v9 = v10 - 8;
  unint64_t v5 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v10);
  uint64_t v11 = (char *)&v4 - v5;
  uint64_t v14 = *v6;
  uint64_t v13 = v2;
  (*(void (**)(void))(v8 + 16))();
  int v12 = sub_2098BE178();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v10);
  return v12 & 1;
}

uint64_t sub_2098B3A78()
{
  return type metadata accessor for ReviewCustodianListViewModel();
}

uint64_t sub_2098B3A94()
{
  uint64_t updated = sub_2098B3B8C();
  if (v0 <= 0x3F)
  {
    uint64_t updated = swift_updateClassMetadata2();
    if (!updated) {
      return 0;
    }
  }
  return updated;
}

uint64_t sub_2098B3B8C()
{
  uint64_t v4 = qword_2675F0630;
  if (!qword_2675F0630)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675EEEC0);
    unint64_t v3 = sub_2098BE488();
    uint64_t v4 = v3;
    if (!v0)
    {
      unint64_t v1 = v3;
      atomic_store(v3, (unint64_t *)&qword_2675F0630);
      return v1;
    }
  }
  return v4;
}

uint64_t sub_2098B3C34(uint64_t a1)
{
  uint64_t v3 = sub_2098BE1A8();
  uint64_t v4 = *(void *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1)) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return a1;
}

uint64_t sub_2098B3CE4(uint64_t *a1)
{
  return sub_2098B390C(a1, *(void *)(v1 + 16)) & 1;
}

unint64_t sub_2098B3D10()
{
  uint64_t v2 = qword_2675F06A0;
  if (!qword_2675F06A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2675EEEC0);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&qword_2675F06A0);
    return WitnessTable;
  }
  return v2;
}

id sub_2098B3D94()
{
  sub_209808A30();
  type metadata accessor for ResourceBundleClass();
  id result = sub_209808A98();
  qword_2675F6D48 = (uint64_t)result;
  return result;
}

uint64_t *sub_2098B3DDC()
{
  if (qword_2675F6D40 != -1) {
    swift_once();
  }
  return &qword_2675F6D48;
}

uint64_t sub_2098B3E40()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6F50);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6F50);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B3ED0()
{
  if (qword_2675F6D50 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6F50);
}

uint64_t sub_2098B3F40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B3ED0();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B3FA4()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6F68);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6F68);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4034()
{
  if (qword_2675F6D58 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6F68);
}

uint64_t sub_2098B40A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4034();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4108()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6F80);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6F80);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4198()
{
  if (qword_2675F6D60 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6F80);
}

uint64_t sub_2098B4208@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4198();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B426C()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6F98);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6F98);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B42FC()
{
  if (qword_2675F6D68 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6F98);
}

uint64_t sub_2098B436C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B42FC();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B43D0()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6FB0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6FB0);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4460()
{
  if (qword_2675F6D70 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6FB0);
}

uint64_t sub_2098B44D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4460();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4534()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6FC8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6FC8);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B45C4()
{
  if (qword_2675F6D78 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6FC8);
}

uint64_t sub_2098B4634@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B45C4();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4698()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6FE0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6FE0);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4728()
{
  if (qword_2675F6D80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6FE0);
}

uint64_t sub_2098B4798@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4728();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B47FC()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F6FF8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F6FF8);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B488C()
{
  if (qword_2675F6D88 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F6FF8);
}

uint64_t sub_2098B48FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B488C();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4960()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7010);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7010);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B49F0()
{
  if (qword_2675F6D90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7010);
}

uint64_t sub_2098B4A60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B49F0();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4AC4()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7028);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7028);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4B54()
{
  if (qword_2675F6D98 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7028);
}

uint64_t sub_2098B4BC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4B54();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4C28()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7040);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7040);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4CB8()
{
  if (qword_2675F6DA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7040);
}

uint64_t sub_2098B4D28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4CB8();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4D8C()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7058);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7058);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4E1C()
{
  if (qword_2675F6DA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7058);
}

uint64_t sub_2098B4E8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4E1C();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B4EF0()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7070);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7070);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B4F80()
{
  if (qword_2675F6DB0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7070);
}

uint64_t sub_2098B4FF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B4F80();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5054()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7088);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7088);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B50E4()
{
  if (qword_2675F6DB8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7088);
}

uint64_t sub_2098B5154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B50E4();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B51B8()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F70A0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F70A0);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5248()
{
  if (qword_2675F6DC0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F70A0);
}

uint64_t sub_2098B52B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5248();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B531C()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F70B8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F70B8);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B53AC()
{
  if (qword_2675F6DC8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F70B8);
}

uint64_t sub_2098B541C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B53AC();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5480()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F70D0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F70D0);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5510()
{
  if (qword_2675F6DD0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F70D0);
}

uint64_t sub_2098B5580@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5510();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B55E4()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F70E8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F70E8);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5674()
{
  if (qword_2675F6DD8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F70E8);
}

uint64_t sub_2098B56E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5674();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5748()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7100);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7100);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B57D8()
{
  if (qword_2675F6DE0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7100);
}

uint64_t sub_2098B5848@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B57D8();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B58AC()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7118);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7118);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B593C()
{
  if (qword_2675F6DE8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7118);
}

uint64_t sub_2098B59AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B593C();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5A10()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7130);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7130);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5AA0()
{
  if (qword_2675F6DF0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7130);
}

uint64_t sub_2098B5B10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5AA0();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5B74()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7148);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7148);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5C04()
{
  if (qword_2675F6DF8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7148);
}

uint64_t sub_2098B5C74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5C04();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5CD8()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7160);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7160);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5D68()
{
  if (qword_2675F6E00 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7160);
}

uint64_t sub_2098B5DD8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5D68();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5E3C()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7178);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7178);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B5ECC()
{
  if (qword_2675F6E08 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7178);
}

uint64_t sub_2098B5F3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B5ECC();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B5FA0()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7190);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7190);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B6030()
{
  if (qword_2675F6E10 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7190);
}

uint64_t sub_2098B60A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B6030();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B6104()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F71A8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F71A8);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B6194()
{
  if (qword_2675F6E18 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F71A8);
}

uint64_t sub_2098B6204@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B6194();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B6268()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F71C0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F71C0);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B62F8()
{
  if (qword_2675F6E20 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F71C0);
}

uint64_t sub_2098B6368@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B62F8();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B63CC()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F71D8);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F71D8);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B645C()
{
  if (qword_2675F6E28 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F71D8);
}

uint64_t sub_2098B64CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B645C();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B6530()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F71F0);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F71F0);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B65C0()
{
  if (qword_2675F6E30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F71F0);
}

uint64_t sub_2098B6630@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B65C0();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t sub_2098B6694()
{
  uint64_t v2 = sub_2098BE2D8();
  __swift_allocate_value_buffer(v2, qword_2675F7208);
  __swift_project_value_buffer(v2, (uint64_t)qword_2675F7208);
  sub_2098BF3C8();
  id v0 = (id)*sub_2098B3DDC();
  return sub_2098BE2C8();
}

uint64_t sub_2098B6724()
{
  if (qword_2675F6E38 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_2098BE2D8();
  return __swift_project_value_buffer(v0, (uint64_t)qword_2675F7208);
}

uint64_t sub_2098B6794@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2098B6724();
  uint64_t v1 = sub_2098BE2D8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 16))(a1, v3);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t __getNSSManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AAUIChooseContactController _selectionCompleted](v0);
}

void _AAUISignInViewControllerCommonInit_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_209754000, a2, a3, "Error returned when attempting to copy persona context: %@", a5, a6, a7, a8, 2u);
}

void _AAUISignInViewControllerCommonInit_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 userPersonaNickName];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Initializing AAUISignInViewController with persona type %@", (uint8_t *)&v4, 0xCu);
}

uint64_t __getBYWarrantyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __46__AAUIGrandSlamRemoteUIPresenter_loadRequest___block_invoke_cold_1(v0);
}

uint64_t __getFAFamilySetupGetStartedViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFAFamilySetupOrganizerViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFAFamilySetupOrganizerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFAFamilySetupBuddyMLRequestClass_block_invoke_cold_1(v0);
}

uint64_t __getFAFamilySetupBuddyMLRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __45__AAUICDPRecoveryKeyHook__deleteRecoveryKey___block_invoke_cold_1(v0);
}

uint64_t __getFAFamilyDetailsCacheClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getFALaunchScreenTimeSetupHookClass_block_invoke_cold_1(v0);
}

uint64_t __getFALaunchScreenTimeSetupHookClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AAUICDPCustodianHook initWithAccountManager:contactsProvider:](v0);
}

uint64_t __getFAFamilySetupPrompterClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AAUIAccountConversionHook signOutPrimaryAccountWithShouldRetainTrust:viewController:completion:](v0);
}

uint64_t __getAMSUIPaymentVerificationTokenFetchTaskClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __52__AAUIDTOHelper_shouldAllowOpForContext_completion___block_invoke_cold_1(v0);
}

uint64_t __getFAProfilePictureStoreClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __85__AAUISignOutFlowControllerDelegate_signOutFlowController_signOutAccount_completion___block_invoke_cold_1(v0);
}

uint64_t __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AAUIServiceSignInController _commonInit](v0);
}

uint64_t __getBFFPaneHeaderViewClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getBFFStyleClass_block_invoke_cold_1(v0);
}

uint64_t __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[AAUIAuthKitPasswordChangeHook processElement:attributes:objectModel:completion:](v0);
}

uint64_t sub_2098BDEB8()
{
  return MEMORY[0x270EEC080]();
}

uint64_t sub_2098BDEC8()
{
  return MEMORY[0x270EEC0A0]();
}

uint64_t sub_2098BDED8()
{
  return MEMORY[0x270EEC0C8]();
}

uint64_t sub_2098BDEE8()
{
  return MEMORY[0x270EEC0D0]();
}

uint64_t sub_2098BDEF8()
{
  return MEMORY[0x270EEC0E0]();
}

uint64_t sub_2098BDF08()
{
  return MEMORY[0x270EEDD10]();
}

uint64_t sub_2098BDF18()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2098BDF28()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2098BDF38()
{
  return MEMORY[0x270EEEC10]();
}

uint64_t sub_2098BDF48()
{
  return MEMORY[0x270EEEC18]();
}

uint64_t sub_2098BDF58()
{
  return MEMORY[0x270EEEC20]();
}

uint64_t sub_2098BDF68()
{
  return MEMORY[0x270EEEC28]();
}

uint64_t sub_2098BDF78()
{
  return MEMORY[0x270EEED68]();
}

uint64_t sub_2098BDF88()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_2098BDF98()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2098BDFA8()
{
  return MEMORY[0x270EEF330]();
}

uint64_t sub_2098BDFB8()
{
  return MEMORY[0x270EEF358]();
}

uint64_t sub_2098BDFC8()
{
  return MEMORY[0x270EEF388]();
}

uint64_t sub_2098BDFD8()
{
  return MEMORY[0x270EEF3F0]();
}

uint64_t sub_2098BDFE8()
{
  return MEMORY[0x270EEF450]();
}

uint64_t sub_2098BDFF8()
{
  return MEMORY[0x270EEF460]();
}

uint64_t sub_2098BE008()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2098BE018()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2098BE028()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2098BE038()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2098BE048()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2098BE058()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2098BE068()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2098BE078()
{
  return MEMORY[0x270EF0420]();
}

uint64_t sub_2098BE088()
{
  return MEMORY[0x270EF0440]();
}

uint64_t sub_2098BE098()
{
  return MEMORY[0x270EF0448]();
}

uint64_t sub_2098BE0A8()
{
  return MEMORY[0x270EF0498]();
}

uint64_t sub_2098BE0B8()
{
  return MEMORY[0x270EF04B0]();
}

uint64_t sub_2098BE0C8()
{
  return MEMORY[0x270EF0548]();
}

uint64_t sub_2098BE0D8()
{
  return MEMORY[0x270EF0568]();
}

uint64_t sub_2098BE0E8()
{
  return MEMORY[0x270EF0580]();
}

uint64_t sub_2098BE0F8()
{
  return MEMORY[0x270EF0598]();
}

uint64_t sub_2098BE108()
{
  return MEMORY[0x270EF06E0]();
}

uint64_t sub_2098BE118()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t sub_2098BE128()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2098BE138()
{
  return MEMORY[0x270EF0C20]();
}

uint64_t sub_2098BE148()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2098BE158()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2098BE168()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2098BE178()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_2098BE188()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t sub_2098BE198()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2098BE1A8()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2098BE1B8()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2098BE1C8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2098BE1D8()
{
  return MEMORY[0x270FA1128]();
}

uint64_t sub_2098BE1E8()
{
  return MEMORY[0x270FA1138]();
}

uint64_t sub_2098BE1F8()
{
  return MEMORY[0x270FA11F8]();
}

uint64_t sub_2098BE208()
{
  return MEMORY[0x270FA1208]();
}

uint64_t sub_2098BE218()
{
  return MEMORY[0x270FA1220]();
}

uint64_t sub_2098BE228()
{
  return MEMORY[0x270FA1228]();
}

uint64_t sub_2098BE238()
{
  return MEMORY[0x270FA1238]();
}

uint64_t sub_2098BE248()
{
  return MEMORY[0x270FA1250]();
}

uint64_t sub_2098BE258()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_2098BE268()
{
  return MEMORY[0x270F47B30]();
}

uint64_t sub_2098BE278()
{
  return MEMORY[0x270F47B38]();
}

uint64_t sub_2098BE288()
{
  return MEMORY[0x270F47B40]();
}

uint64_t sub_2098BE298()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_2098BE2A8()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_2098BE2B8()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_2098BE2C8()
{
  return MEMORY[0x270EEB1D0]();
}

uint64_t sub_2098BE2D8()
{
  return MEMORY[0x270EEB1E0]();
}

uint64_t sub_2098BE2E8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2098BE2F8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2098BE308()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2098BE318()
{
  return MEMORY[0x270F05B48]();
}

uint64_t sub_2098BE328()
{
  return MEMORY[0x270F05B58]();
}

uint64_t sub_2098BE338()
{
  return MEMORY[0x270F05B68]();
}

uint64_t sub_2098BE348()
{
  return MEMORY[0x270F05B90]();
}

uint64_t sub_2098BE358()
{
  return MEMORY[0x270F05BC0]();
}

uint64_t sub_2098BE368()
{
  return MEMORY[0x270F05BF8]();
}

uint64_t sub_2098BE378()
{
  return MEMORY[0x270F05C00]();
}

uint64_t sub_2098BE388()
{
  return MEMORY[0x270F05C08]();
}

uint64_t sub_2098BE398()
{
  return MEMORY[0x270F05C50]();
}

uint64_t sub_2098BE3A8()
{
  return MEMORY[0x270F05C88]();
}

uint64_t sub_2098BE3B8()
{
  return MEMORY[0x270F05CE8]();
}

uint64_t sub_2098BE3C8()
{
  return MEMORY[0x270F05D38]();
}

uint64_t sub_2098BE3D8()
{
  return MEMORY[0x270F05D50]();
}

uint64_t sub_2098BE3E8()
{
  return MEMORY[0x270F05D58]();
}

uint64_t sub_2098BE3F8()
{
  return MEMORY[0x270F05D60]();
}

uint64_t sub_2098BE408()
{
  return MEMORY[0x270F05D80]();
}

uint64_t sub_2098BE418()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2098BE428()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2098BE438()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2098BE448()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_2098BE458()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_2098BE468()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2098BE478()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2098BE488()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2098BE498()
{
  return MEMORY[0x270EFECF0]();
}

uint64_t sub_2098BE4A8()
{
  return MEMORY[0x270EFEEB8]();
}

uint64_t sub_2098BE4B8()
{
  return MEMORY[0x270EFEEC0]();
}

uint64_t sub_2098BE4C8()
{
  return MEMORY[0x270EFEF50]();
}

uint64_t sub_2098BE4D8()
{
  return MEMORY[0x270EFEFC0]();
}

uint64_t sub_2098BE4E8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2098BE4F8()
{
  return MEMORY[0x270EFEFE8]();
}

uint64_t sub_2098BE508()
{
  return MEMORY[0x270EFF100]();
}

uint64_t sub_2098BE518()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2098BE528()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_2098BE538()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_2098BE548()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_2098BE558()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_2098BE568()
{
  return MEMORY[0x270EFF658]();
}

uint64_t sub_2098BE578()
{
  return MEMORY[0x270EFF668]();
}

uint64_t sub_2098BE588()
{
  return MEMORY[0x270EFF710]();
}

uint64_t sub_2098BE598()
{
  return MEMORY[0x270EFF738]();
}

uint64_t sub_2098BE5A8()
{
  return MEMORY[0x270EFF8F8]();
}

uint64_t sub_2098BE5B8()
{
  return MEMORY[0x270EFF900]();
}

uint64_t sub_2098BE5C8()
{
  return MEMORY[0x270EFF908]();
}

uint64_t sub_2098BE5D8()
{
  return MEMORY[0x270EFFA08]();
}

uint64_t sub_2098BE5E8()
{
  return MEMORY[0x270EFFA48]();
}

uint64_t sub_2098BE5F8()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_2098BE608()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2098BE618()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_2098BE628()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_2098BE638()
{
  return MEMORY[0x270EFFD10]();
}

uint64_t sub_2098BE648()
{
  return MEMORY[0x270EFFD18]();
}

uint64_t sub_2098BE658()
{
  return MEMORY[0x270F00078]();
}

uint64_t sub_2098BE668()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_2098BE678()
{
  return MEMORY[0x270F001D0]();
}

uint64_t sub_2098BE688()
{
  return MEMORY[0x270F00560]();
}

uint64_t sub_2098BE698()
{
  return MEMORY[0x270F00578]();
}

uint64_t sub_2098BE6A8()
{
  return MEMORY[0x270F00580]();
}

uint64_t sub_2098BE6B8()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_2098BE6C8()
{
  return MEMORY[0x270F005F8]();
}

uint64_t sub_2098BE6D8()
{
  return MEMORY[0x270F5A9B0]();
}

uint64_t sub_2098BE6E8()
{
  return MEMORY[0x270F5A9B8]();
}

uint64_t sub_2098BE6F8()
{
  return MEMORY[0x270F00DE8]();
}

uint64_t sub_2098BE708()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_2098BE718()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2098BE728()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_2098BE738()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_2098BE748()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_2098BE758()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_2098BE768()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_2098BE778()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_2098BE788()
{
  return MEMORY[0x270F01290]();
}

uint64_t sub_2098BE798()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_2098BE7A8()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2098BE7B8()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_2098BE7C8()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_2098BE7D8()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_2098BE7E8()
{
  return MEMORY[0x270F01660]();
}

uint64_t sub_2098BE7F8()
{
  return MEMORY[0x270F01690]();
}

uint64_t sub_2098BE808()
{
  return MEMORY[0x270F017E0]();
}

uint64_t sub_2098BE818()
{
  return MEMORY[0x270F017E8]();
}

uint64_t sub_2098BE828()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_2098BE838()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_2098BE848()
{
  return MEMORY[0x270F01A10]();
}

uint64_t sub_2098BE858()
{
  return MEMORY[0x270F01A60]();
}

uint64_t sub_2098BE868()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_2098BE878()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_2098BE888()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_2098BE898()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_2098BE8A8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_2098BE8B8()
{
  return MEMORY[0x270F02120]();
}

uint64_t sub_2098BE8C8()
{
  return MEMORY[0x270F02128]();
}

uint64_t sub_2098BE8D8()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_2098BE8E8()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_2098BE8F8()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_2098BE908()
{
  return MEMORY[0x270F026D8]();
}

uint64_t sub_2098BE918()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_2098BE928()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_2098BE938()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_2098BE948()
{
  return MEMORY[0x270F02710]();
}

uint64_t sub_2098BE958()
{
  return MEMORY[0x270F02728]();
}

uint64_t sub_2098BE968()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_2098BE978()
{
  return MEMORY[0x270F02888]();
}

uint64_t sub_2098BE988()
{
  return MEMORY[0x270F02898]();
}

uint64_t sub_2098BE998()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_2098BE9A8()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_2098BE9B8()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2098BE9C8()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_2098BE9D8()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_2098BE9E8()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_2098BE9F8()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_2098BEA08()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_2098BEA18()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2098BEA28()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_2098BEA38()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_2098BEA48()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_2098BEA58()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_2098BEA68()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_2098BEA78()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_2098BEA88()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_2098BEA98()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_2098BEAA8()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_2098BEAB8()
{
  return MEMORY[0x270F02C68]();
}

uint64_t sub_2098BEAC8()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_2098BEAD8()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_2098BEAE8()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_2098BEAF8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_2098BEB08()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_2098BEB18()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_2098BEB28()
{
  return MEMORY[0x270F02D30]();
}

uint64_t sub_2098BEB38()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_2098BEB48()
{
  return MEMORY[0x270F02D78]();
}

uint64_t sub_2098BEB58()
{
  return MEMORY[0x270F02D80]();
}

uint64_t sub_2098BEB68()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_2098BEB78()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_2098BEB88()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2098BEB98()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_2098BEBA8()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_2098BEBB8()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_2098BEBC8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2098BEBD8()
{
  return MEMORY[0x270F03160]();
}

uint64_t sub_2098BEBE8()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_2098BEBF8()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_2098BEC08()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2098BEC18()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_2098BEC28()
{
  return MEMORY[0x270F05DA0]();
}

uint64_t sub_2098BEC38()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2098BEC48()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2098BEC58()
{
  return MEMORY[0x270F03318]();
}

uint64_t sub_2098BEC68()
{
  return MEMORY[0x270F03340]();
}

uint64_t sub_2098BEC78()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_2098BEC88()
{
  return MEMORY[0x270F03378]();
}

uint64_t sub_2098BEC98()
{
  return MEMORY[0x270F03428]();
}

uint64_t sub_2098BECA8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_2098BECB8()
{
  return MEMORY[0x270F03488]();
}

uint64_t sub_2098BECC8()
{
  return MEMORY[0x270F034E8]();
}

uint64_t sub_2098BECD8()
{
  return MEMORY[0x270F03580]();
}

uint64_t sub_2098BECE8()
{
  return MEMORY[0x270F03590]();
}

uint64_t sub_2098BECF8()
{
  return MEMORY[0x270F035E8]();
}

uint64_t sub_2098BED08()
{
  return MEMORY[0x270F036B0]();
}

uint64_t sub_2098BED18()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2098BED28()
{
  return MEMORY[0x270F037A0]();
}

uint64_t sub_2098BED38()
{
  return MEMORY[0x270F037B0]();
}

uint64_t sub_2098BED48()
{
  return MEMORY[0x270F03900]();
}

uint64_t sub_2098BED58()
{
  return MEMORY[0x270F03940]();
}

uint64_t sub_2098BED68()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_2098BED78()
{
  return MEMORY[0x270F03CE8]();
}

uint64_t sub_2098BED88()
{
  return MEMORY[0x270F03D40]();
}

uint64_t sub_2098BED98()
{
  return MEMORY[0x270F03E58]();
}

uint64_t sub_2098BEDA8()
{
  return MEMORY[0x270F03F00]();
}

uint64_t sub_2098BEDB8()
{
  return MEMORY[0x270F03F30]();
}

uint64_t sub_2098BEDC8()
{
  return MEMORY[0x270F03F40]();
}

uint64_t sub_2098BEDD8()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_2098BEDE8()
{
  return MEMORY[0x270F03FE8]();
}

uint64_t sub_2098BEDF8()
{
  return MEMORY[0x270F03FF8]();
}

uint64_t sub_2098BEE08()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_2098BEE18()
{
  return MEMORY[0x270F04028]();
}

uint64_t sub_2098BEE28()
{
  return MEMORY[0x270F040F8]();
}

uint64_t sub_2098BEE38()
{
  return MEMORY[0x270F04100]();
}

uint64_t sub_2098BEE48()
{
  return MEMORY[0x270F04108]();
}

uint64_t sub_2098BEE58()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_2098BEE68()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_2098BEE78()
{
  return MEMORY[0x270F04150]();
}

uint64_t sub_2098BEE88()
{
  return MEMORY[0x270F04178]();
}

uint64_t sub_2098BEE98()
{
  return MEMORY[0x270F041C8]();
}

uint64_t sub_2098BEEA8()
{
  return MEMORY[0x270F041F8]();
}

uint64_t sub_2098BEEB8()
{
  return MEMORY[0x270F04210]();
}

uint64_t sub_2098BEEC8()
{
  return MEMORY[0x270F042A8]();
}

uint64_t sub_2098BEED8()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_2098BEEE8()
{
  return MEMORY[0x270F042E8]();
}

uint64_t sub_2098BEEF8()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_2098BEF08()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_2098BEF18()
{
  return MEMORY[0x270F04360]();
}

uint64_t sub_2098BEF28()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_2098BEF38()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2098BEF48()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2098BEF58()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2098BEF68()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_2098BEF78()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_2098BEF88()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_2098BEF98()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2098BEFA8()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2098BEFB8()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_2098BEFC8()
{
  return MEMORY[0x270F046D0]();
}

uint64_t sub_2098BEFD8()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_2098BEFE8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_2098BEFF8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2098BF008()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_2098BF018()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_2098BF028()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2098BF038()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2098BF048()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2098BF058()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_2098BF068()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_2098BF078()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_2098BF088()
{
  return MEMORY[0x270F04948]();
}

uint64_t sub_2098BF098()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_2098BF0A8()
{
  return MEMORY[0x270F04A58]();
}

uint64_t sub_2098BF0B8()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_2098BF0C8()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_2098BF0D8()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_2098BF0E8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2098BF0F8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2098BF108()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_2098BF118()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_2098BF128()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_2098BF138()
{
  return MEMORY[0x270F04D00]();
}

uint64_t sub_2098BF148()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_2098BF158()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_2098BF168()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_2098BF178()
{
  return MEMORY[0x270F04D80]();
}

uint64_t sub_2098BF188()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_2098BF198()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2098BF1A8()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_2098BF1B8()
{
  return MEMORY[0x270F051A0]();
}

uint64_t sub_2098BF1C8()
{
  return MEMORY[0x270F05260]();
}

uint64_t sub_2098BF1D8()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_2098BF1E8()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_2098BF1F8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2098BF208()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2098BF218()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2098BF228()
{
  return MEMORY[0x270F5A9C0]();
}

uint64_t sub_2098BF238()
{
  return MEMORY[0x270F5A9C8]();
}

uint64_t sub_2098BF248()
{
  return MEMORY[0x270F5A9D0]();
}

uint64_t sub_2098BF258()
{
  return MEMORY[0x270F5A9D8]();
}

uint64_t sub_2098BF268()
{
  return MEMORY[0x270F5A9E0]();
}

uint64_t sub_2098BF278()
{
  return MEMORY[0x270F5A9E8]();
}

uint64_t sub_2098BF288()
{
  return MEMORY[0x270F5A9F0]();
}

uint64_t sub_2098BF298()
{
  return MEMORY[0x270F5A9F8]();
}

uint64_t sub_2098BF2A8()
{
  return MEMORY[0x270F9CFB0]();
}

uint64_t sub_2098BF2B8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2098BF2C8()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2098BF2D8()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_2098BF2E8()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_2098BF2F8()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_2098BF308()
{
  return MEMORY[0x270F9D330]();
}

uint64_t sub_2098BF318()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2098BF328()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_2098BF338()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_2098BF348()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_2098BF358()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2098BF368()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2098BF378()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2098BF388()
{
  return MEMORY[0x270EF1AB8]();
}

uint64_t sub_2098BF398()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2098BF3A8()
{
  return MEMORY[0x270EF1AF8]();
}

uint64_t sub_2098BF3B8()
{
  return MEMORY[0x270F9D6C0]();
}

uint64_t sub_2098BF3C8()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_2098BF3D8()
{
  return MEMORY[0x270F9D6E8]();
}

uint64_t sub_2098BF3E8()
{
  return MEMORY[0x270F9D7D0]();
}

uint64_t sub_2098BF3F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2098BF408()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_2098BF418()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_2098BF428()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_2098BF438()
{
  return MEMORY[0x270F9D9D8]();
}

uint64_t sub_2098BF448()
{
  return MEMORY[0x270F9DA30]();
}

uint64_t sub_2098BF458()
{
  return MEMORY[0x270F9DAE8]();
}

uint64_t sub_2098BF468()
{
  return MEMORY[0x270F9DAF0]();
}

uint64_t sub_2098BF478()
{
  return MEMORY[0x270F9DAF8]();
}

uint64_t sub_2098BF488()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2098BF498()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2098BF4A8()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_2098BF4B8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2098BF4C8()
{
  return MEMORY[0x270F9DC38]();
}

uint64_t sub_2098BF4D8()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_2098BF4E8()
{
  return MEMORY[0x270FA1428]();
}

uint64_t sub_2098BF4F8()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_2098BF508()
{
  return MEMORY[0x270FA1450]();
}

uint64_t sub_2098BF518()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_2098BF528()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_2098BF538()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_2098BF548()
{
  return MEMORY[0x270FA14A8]();
}

uint64_t sub_2098BF558()
{
  return MEMORY[0x270EF1BD8]();
}

uint64_t sub_2098BF568()
{
  return MEMORY[0x270F9DD48]();
}

uint64_t sub_2098BF578()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2098BF598()
{
  return MEMORY[0x270FA1E70]();
}

uint64_t sub_2098BF5A8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2098BF5B8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2098BF5C8()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_2098BF5D8()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2098BF5E8()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2098BF5F8()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_2098BF618()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_2098BF628()
{
  return MEMORY[0x270F9DD80]();
}

uint64_t sub_2098BF638()
{
  return MEMORY[0x270F9DDB8]();
}

uint64_t sub_2098BF648()
{
  return MEMORY[0x270F9DDC8]();
}

uint64_t sub_2098BF658()
{
  return MEMORY[0x270F9DED0]();
}

uint64_t sub_2098BF668()
{
  return MEMORY[0x270F9DF90]();
}

uint64_t sub_2098BF678()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2098BF688()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_2098BF698()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2098BF6A8()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_2098BF6B8()
{
  return MEMORY[0x270FA14D0]();
}

uint64_t sub_2098BF6C8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2098BF6D8()
{
  return MEMORY[0x270EF1DE8]();
}

uint64_t sub_2098BF6E8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2098BF6F8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2098BF708()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2098BF718()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2098BF728()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2098BF738()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2098BF748()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2098BF758()
{
  return MEMORY[0x270F5AA00]();
}

uint64_t sub_2098BF768()
{
  return MEMORY[0x270F5AA10]();
}

uint64_t sub_2098BF778()
{
  return MEMORY[0x270F5AA18]();
}

uint64_t sub_2098BF788()
{
  return MEMORY[0x270F5AA20]();
}

uint64_t sub_2098BF798()
{
  return MEMORY[0x270EF2010]();
}

uint64_t sub_2098BF7A8()
{
  return MEMORY[0x270EF2020]();
}

uint64_t sub_2098BF7B8()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_2098BF7C8()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_2098BF7D8()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_2098BF7E8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2098BF7F8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2098BF808()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2098BF818()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2098BF828()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2098BF838()
{
  return MEMORY[0x270F9E7A0]();
}

uint64_t sub_2098BF848()
{
  return MEMORY[0x270F9E7A8]();
}

uint64_t sub_2098BF858()
{
  return MEMORY[0x270F9E7B0]();
}

uint64_t sub_2098BF868()
{
  return MEMORY[0x270F9E7B8]();
}

uint64_t sub_2098BF878()
{
  return MEMORY[0x270F9E7C0]();
}

uint64_t sub_2098BF888()
{
  return MEMORY[0x270F9E7C8]();
}

uint64_t sub_2098BF898()
{
  return MEMORY[0x270F9E7D0]();
}

uint64_t sub_2098BF8A8()
{
  return MEMORY[0x270F9E7D8]();
}

uint64_t sub_2098BF8B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2098BF8C8()
{
  return MEMORY[0x270F9E890]();
}

uint64_t sub_2098BF8D8()
{
  return MEMORY[0x270F9E898]();
}

uint64_t sub_2098BF8E8()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2098BF8F8()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_2098BF908()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2098BF928()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_2098BF938()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_2098BF948()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_2098BF958()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_2098BF968()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2098BF978()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2098BF988()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2098BF998()
{
  return MEMORY[0x270F9ED68]();
}

uint64_t sub_2098BF9A8()
{
  return MEMORY[0x270FA14E0]();
}

uint64_t sub_2098BF9B8()
{
  return MEMORY[0x270F9EE10]();
}

uint64_t sub_2098BF9C8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2098BF9D8()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2098BF9E8()
{
  return MEMORY[0x270F9F008]();
}

uint64_t sub_2098BF9F8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2098BFA08()
{
  return MEMORY[0x270F9F148]();
}

uint64_t sub_2098BFA18()
{
  return MEMORY[0x270F9F198]();
}

uint64_t sub_2098BFA28()
{
  return MEMORY[0x270F9F1A0]();
}

uint64_t sub_2098BFA38()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_2098BFA48()
{
  return MEMORY[0x270F9F1B0]();
}

uint64_t sub_2098BFA58()
{
  return MEMORY[0x270F9F1B8]();
}

uint64_t sub_2098BFA68()
{
  return MEMORY[0x270F9F1C0]();
}

uint64_t sub_2098BFA78()
{
  return MEMORY[0x270F9F1C8]();
}

uint64_t sub_2098BFA88()
{
  return MEMORY[0x270F9F1D0]();
}

uint64_t sub_2098BFA98()
{
  return MEMORY[0x270F9F220]();
}

uint64_t sub_2098BFAA8()
{
  return MEMORY[0x270F9F228]();
}

uint64_t sub_2098BFAB8()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2098BFAC8()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2098BFAD8()
{
  return MEMORY[0x270F9F278]();
}

uint64_t sub_2098BFAE8()
{
  return MEMORY[0x270F9F778]();
}

uint64_t sub_2098BFAF8()
{
  return MEMORY[0x270F9F780]();
}

uint64_t sub_2098BFB08()
{
  return MEMORY[0x270F9F788]();
}

uint64_t sub_2098BFB18()
{
  return MEMORY[0x270F9F790]();
}

uint64_t sub_2098BFB28()
{
  return MEMORY[0x270F9F7B8]();
}

uint64_t sub_2098BFB38()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2098BFB48()
{
  return MEMORY[0x270F9F940]();
}

uint64_t sub_2098BFB58()
{
  return MEMORY[0x270F9FA20]();
}

uint64_t sub_2098BFB68()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2098BFB88()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2098BFB98()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2098BFBA8()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2098BFBB8()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2098BFBC8()
{
  return MEMORY[0x270F9FC58]();
}

uint64_t sub_2098BFBD8()
{
  return MEMORY[0x270F9FD38]();
}

uint64_t sub_2098BFBE8()
{
  return MEMORY[0x270F5AA28]();
}

uint64_t sub_2098BFBF8()
{
  return MEMORY[0x270F5AA30]();
}

uint64_t sub_2098BFC08()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2098BFC18()
{
  return MEMORY[0x270F9FFF0]();
}

uint64_t sub_2098BFC28()
{
  return MEMORY[0x270FA00B0]();
}

uint64_t sub_2098BFC38()
{
  return MEMORY[0x270FA00B8]();
}

uint64_t sub_2098BFC48()
{
  return MEMORY[0x270FA00C8]();
}

uint64_t sub_2098BFC58()
{
  return MEMORY[0x270FA00D0]();
}

uint64_t sub_2098BFC68()
{
  return MEMORY[0x270FA00D8]();
}

uint64_t sub_2098BFC78()
{
  return MEMORY[0x270FA00E0]();
}

uint64_t sub_2098BFC88()
{
  return MEMORY[0x270FA00E8]();
}

uint64_t sub_2098BFC98()
{
  return MEMORY[0x270FA00F0]();
}

uint64_t sub_2098BFCA8()
{
  return MEMORY[0x270FA00F8]();
}

uint64_t sub_2098BFCB8()
{
  return MEMORY[0x270FA0100]();
}

uint64_t sub_2098BFCC8()
{
  return MEMORY[0x270FA0108]();
}

uint64_t sub_2098BFCD8()
{
  return MEMORY[0x270FA0110]();
}

uint64_t sub_2098BFCE8()
{
  return MEMORY[0x270FA0118]();
}

uint64_t sub_2098BFCF8()
{
  return MEMORY[0x270FA0128]();
}

uint64_t AALocalizedStringForServiceType()
{
  return MEMORY[0x270F0CE18]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B70](gray, alpha);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x270EE6750](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CKBalloonViewForClass()
{
  return MEMORY[0x270F15BF0]();
}

uint64_t IMSPISendMessageWithAttachments()
{
  return MEMORY[0x270F3CB68]();
}

uint64_t IMSPISendRichLink()
{
  return MEMORY[0x270F3CB70]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F82BC8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x270F82CC8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x270F82CD0](category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x270F82DD0](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F82DD8](image);
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x270F82E80]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x270F82E90]();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

uint64_t _AALogSystem()
{
  return MEMORY[0x270F0CE28]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x270FA0168]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x270F91820]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x270F91838]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x270F91848]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x270FA01A8]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x270FA23D0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x270FA23F8]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x270FA2400]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x270FA2408]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x270FA2410]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x270FA0238]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0340]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x270FA04D0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x270FA0580]();
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

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_SoftwareUpdateServices(double a1)
{
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___SUManagerClient(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SoftwareUpdateServices)) {
    return dlopenHelper_SoftwareUpdateServices(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___SUScanOptions(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SoftwareUpdateServices)) {
    return dlopenHelper_SoftwareUpdateServices(result);
  }
  return result;
}

double gotLoadHelper_x8__SUErrorDomain(double result)
{
  if (!atomic_load((unsigned int *)&dlopenHelperFlag_SoftwareUpdateServices)) {
    return dlopenHelper_SoftwareUpdateServices(result);
  }
  return result;
}