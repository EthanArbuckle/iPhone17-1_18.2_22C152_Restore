uint64_t destroy for CACUILanguageView()
{
  uint64_t vars8;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for CACUILanguageView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CACUILanguageView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for CACUILanguageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CACUILanguageView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CACUILanguageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageView()
{
  return &type metadata for CACUILanguageView;
}

uint64_t sub_23AAD4C8C()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_23AAD4CA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23AAD4CBC()
{
  return sub_23AAE41E0();
}

uint64_t sub_23AAD4D04()
{
  return sub_23AAE41C0();
}

uint64_t sub_23AAD4D30()
{
  return sub_23AAE41E0();
}

uint64_t sub_23AAD4D74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58600);
  uint64_t v53 = *(void *)(v55 - 8);
  MEMORY[0x270FA5388](v55);
  v52 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58608);
  uint64_t v56 = *(void *)(v3 - 8);
  uint64_t v57 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v54 = (char *)&v49 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58610);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v13 = (char *)&v49 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58618);
  MEMORY[0x270FA5388](v14 - 8);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58620);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v49 = (uint64_t)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58628);
  uint64_t v21 = MEMORY[0x270FA5388](v20 - 8);
  uint64_t v50 = (uint64_t)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v24 = (char *)&v49 - v23;
  uint64_t v51 = (uint64_t)v1;
  long long v61 = *v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_23AAE3AD0();
  uint64_t v25 = v17;
  swift_release();
  swift_release();
  sub_23AAD9EDC((uint64_t)&v61);
  uint64_t v26 = *(void *)(v60 + 16);
  swift_bridgeObjectRelease();
  uint64_t v27 = 1;
  if (!v26)
  {
    *(void *)v13 = sub_23AAE3BE0();
    *((void *)v13 + 1) = 0;
    v13[16] = 1;
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58658);
    sub_23AAD5468((uint64_t *)&v13[*(int *)(v28 + 44)]);
    sub_23AADBB64((uint64_t)v13, (uint64_t)v11, &qword_268A58610);
    sub_23AADBB64((uint64_t)v11, (uint64_t)v16, &qword_268A58610);
    v29 = &v16[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A58660) + 48)];
    *(void *)v29 = 0;
    v29[8] = 1;
    sub_23AADBBC8((uint64_t)v13, &qword_268A58610);
    sub_23AADBBC8((uint64_t)v11, &qword_268A58610);
    id v30 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
    uint64_t v31 = MEMORY[0x23ECBF350](v30);
    char v32 = sub_23AAE3CC0();
    uint64_t v33 = v49;
    sub_23AADBB64((uint64_t)v16, v49, &qword_268A58618);
    uint64_t v34 = v33 + *(int *)(v25 + 36);
    *(void *)uint64_t v34 = v31;
    *(unsigned char *)(v34 + 8) = v32;
    sub_23AADBBC8((uint64_t)v16, &qword_268A58618);
    sub_23AADC00C(v33, (uint64_t)v24, &qword_268A58620);
    uint64_t v27 = 0;
  }
  uint64_t v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v24, v27, 1, v25);
  MEMORY[0x270FA5388](v35);
  uint64_t v36 = v51;
  *(&v49 - 2) = v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58630);
  sub_23AADBF84(&qword_268A58638, &qword_268A58630);
  v37 = v52;
  sub_23AAE3D30();
  long long v59 = *(_OWORD *)(v36 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58640);
  uint64_t v38 = sub_23AAE3E90();
  MEMORY[0x270FA5388](v38);
  *(&v49 - 2) = v36;
  sub_23AADBF84(&qword_268A58648, &qword_268A58600);
  uint64_t v39 = v55;
  sub_23AAE3DD0();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v37, v39);
  uint64_t v41 = v56;
  uint64_t v40 = v57;
  v42 = v54;
  (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v54, v6, v57);
  uint64_t v43 = v50;
  sub_23AADBB64((uint64_t)v24, v50, &qword_268A58628);
  v44 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v44(v6, v42, v40);
  uint64_t v45 = v58;
  sub_23AADBB64(v43, v58, &qword_268A58628);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58650);
  v44((char *)(v45 + *(int *)(v46 + 48)), v6, v40);
  v47 = *(void (**)(char *, uint64_t))(v41 + 8);
  v47(v42, v40);
  sub_23AADBBC8((uint64_t)v24, &qword_268A58628);
  v47(v6, v40);
  return sub_23AADBBC8(v43, &qword_268A58628);
}

uint64_t sub_23AAD5468@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v43 = a1;
  uint64_t v1 = sub_23AAE3C80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v41 = v1;
  uint64_t v42 = v2;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v4 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58668);
  uint64_t v40 = *(void *)(v5 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58670);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  v44 = (char *)&v37 - v13;
  type metadata accessor for CACUILocaleUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v15 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v16 = sub_23AAE3A50();
  uint64_t v18 = v17;

  uint64_t v45 = v16;
  uint64_t v46 = v18;
  sub_23AAD9F7C();
  uint64_t v19 = sub_23AAE3D60();
  uint64_t v38 = v20;
  uint64_t v39 = v19;
  uint64_t v37 = v21;
  LOBYTE(v16) = v22 & 1;
  sub_23AAE3B30();
  uint64_t v23 = v4;
  sub_23AAE3C70();
  sub_23AADBF84(&qword_268A58680, &qword_268A58668);
  sub_23AADB870(&qword_268A58688, MEMORY[0x263F1A1E0]);
  uint64_t v24 = v5;
  uint64_t v25 = v41;
  sub_23AAE3D90();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v23, v25);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v24);
  uint64_t v26 = v9;
  uint64_t v27 = v44;
  uint64_t v28 = v12;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v44, v12, v8);
  v29 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v29(v12, v27, v8);
  id v30 = v43;
  uint64_t v31 = v38;
  uint64_t v32 = v39;
  uint64_t v33 = v37;
  *uint64_t v43 = v39;
  v30[1] = v33;
  *((unsigned char *)v30 + 16) = v16;
  v30[3] = v31;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58690);
  v29((char *)v30 + *(int *)(v34 + 48), v28, v8);
  sub_23AAD9FD0(v32, v33, v16);
  uint64_t v35 = *(void (**)(char *, uint64_t))(v26 + 8);
  swift_bridgeObjectRetain();
  v35(v44, v8);
  v35(v28, v8);
  sub_23AAD9FE0(v32, v33, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23AAD58B8@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v86 = a2;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586B0);
  MEMORY[0x270FA5388](v78);
  uint64_t v82 = (uint64_t)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586B8);
  MEMORY[0x270FA5388](v81);
  v68 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586C0);
  uint64_t v83 = *(void *)(v5 - 8);
  uint64_t v84 = v5;
  MEMORY[0x270FA5388](v5);
  v79 = (char *)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586C8);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v85 = (uint64_t)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v76 = (char *)&v67 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v77 = (uint64_t)&v67 - v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v80 = (uint64_t)&v67 - v14;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586D0);
  MEMORY[0x270FA5388](v71);
  uint64_t v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586D8);
  MEMORY[0x270FA5388](v72);
  v67 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586E0);
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A586E8);
  uint64_t v23 = MEMORY[0x270FA5388](v22 - 8);
  uint64_t v75 = (uint64_t)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v67 - v26;
  uint64_t v28 = MEMORY[0x270FA5388](v25);
  id v30 = (char *)&v67 - v29;
  MEMORY[0x270FA5388](v28);
  uint64_t v73 = (uint64_t)&v67 - v31;
  type metadata accessor for CACUILocaleUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v69 = self;
  uint64_t v70 = ObjCClassFromMetadata;
  id v33 = objc_msgSend(v69, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v34 = sub_23AAE3A50();
  uint64_t v36 = v35;

  uint64_t v88 = v34;
  uint64_t v89 = v36;
  sub_23AAD9F7C();
  uint64_t v88 = sub_23AAE3D60();
  uint64_t v89 = v37;
  char v90 = v38 & 1;
  uint64_t v91 = v39;
  v87 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A586F0);
  sub_23AADA138();
  sub_23AAE3EC0();
  v74 = a1;
  v92[0] = *a1;
  swift_retain();
  uint64_t v40 = sub_23AAE0CEC();
  sub_23AAD9EDC((uint64_t)v92);
  uint64_t v41 = *(void *)(v40 + 16);
  swift_bridgeObjectRelease();
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  if (v41)
  {
    v42(v16, v21, v18);
    swift_storeEnumTagMultiPayload();
    sub_23AADA200();
    sub_23AADA5AC(&qword_268A58710, &qword_268A586E0, (void (*)(void))sub_23AADA138);
    sub_23AAE3C60();
  }
  else
  {
    uint64_t v43 = (uint64_t)v67;
    v42(v67, v21, v18);
    sub_23AADBB64(v43, (uint64_t)v16, &qword_268A586D8);
    swift_storeEnumTagMultiPayload();
    sub_23AADA200();
    sub_23AADA5AC(&qword_268A58710, &qword_268A586E0, (void (*)(void))sub_23AADA138);
    sub_23AAE3C60();
    sub_23AADBBC8(v43, &qword_268A586D8);
  }
  sub_23AADC00C((uint64_t)v27, (uint64_t)v30, &qword_268A586E8);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  uint64_t v44 = v73;
  sub_23AADC00C((uint64_t)v30, v73, &qword_268A586E8);
  id v45 = objc_msgSend(v69, sel_bundleForClass_, v70);
  uint64_t v46 = sub_23AAE3A50();
  uint64_t v48 = v47;

  uint64_t v88 = v46;
  uint64_t v89 = v48;
  uint64_t v88 = sub_23AAE3D60();
  uint64_t v89 = v49;
  char v90 = v50 & 1;
  uint64_t v91 = v51;
  MEMORY[0x270FA5388](v88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58720);
  sub_23AADA2FC();
  v52 = v79;
  sub_23AAE3EC0();
  swift_retain();
  uint64_t v53 = sub_23AAE0E50();
  sub_23AAD9EDC((uint64_t)v92);
  uint64_t v54 = *(void *)(v53 + 16);
  swift_bridgeObjectRelease();
  uint64_t v55 = v83;
  uint64_t v56 = *(void (**)(uint64_t, char *, uint64_t))(v83 + 16);
  if (v54)
  {
    uint64_t v57 = v84;
    v56(v82, v52, v84);
    swift_storeEnumTagMultiPayload();
    sub_23AADA50C();
    sub_23AADA5AC(&qword_268A58768, &qword_268A586C0, (void (*)(void))sub_23AADA2FC);
    uint64_t v58 = (uint64_t)v76;
    sub_23AAE3C60();
  }
  else
  {
    uint64_t v59 = (uint64_t)v68;
    uint64_t v57 = v84;
    v56((uint64_t)v68, v52, v84);
    sub_23AADBB64(v59, v82, &qword_268A586B8);
    swift_storeEnumTagMultiPayload();
    sub_23AADA50C();
    sub_23AADA5AC(&qword_268A58768, &qword_268A586C0, (void (*)(void))sub_23AADA2FC);
    uint64_t v58 = (uint64_t)v76;
    sub_23AAE3C60();
    sub_23AADBBC8(v59, &qword_268A586B8);
  }
  uint64_t v60 = v77;
  sub_23AADC00C(v58, v77, &qword_268A586C8);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v52, v57);
  uint64_t v61 = v80;
  sub_23AADC00C(v60, v80, &qword_268A586C8);
  uint64_t v62 = v75;
  sub_23AADBB64(v44, v75, &qword_268A586E8);
  uint64_t v63 = v85;
  sub_23AADBB64(v61, v85, &qword_268A586C8);
  uint64_t v64 = v86;
  sub_23AADBB64(v62, v86, &qword_268A586E8);
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58770);
  sub_23AADBB64(v63, v64 + *(int *)(v65 + 48), &qword_268A586C8);
  sub_23AADBBC8(v61, &qword_268A586C8);
  sub_23AADBBC8(v44, &qword_268A586E8);
  sub_23AADBBC8(v63, &qword_268A586C8);
  return sub_23AADBBC8(v62, &qword_268A586E8);
}

uint64_t sub_23AAD6334(uint64_t a1)
{
  long long v7 = *(_OWORD *)a1;
  swift_retain();
  sub_23AAE0CEC();
  sub_23AAD9EDC((uint64_t)&v7);
  swift_getKeyPath();
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(void *)(v2 + 112) = *(void *)(a1 + 96);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_23AADA0AC(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58778);
  sub_23AADBF84(&qword_268A58788, &qword_268A58778);
  sub_23AADA644();
  sub_23AADA1AC();
  return sub_23AAE3EB0();
}

uint64_t sub_23AAD6470@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = a1[2];
  char v8 = *((unsigned char *)a1 + 24);
  long long v17 = *(_OWORD *)a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  sub_23AAD9EDC((uint64_t)&v17);
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v9 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v9 + 96) = v10;
  uint64_t v11 = *(void *)(a2 + 96);
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v9 + 32) = v12;
  long long v13 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v9 + 64) = v13;
  *(void *)(v9 + 112) = v11;
  *(void *)(v9 + 120) = v6;
  *(void *)(v9 + 128) = v5;
  *(void *)(v9 + 136) = v7;
  *(unsigned char *)(v9 + 144) = v8;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = v15;
  *(void *)(a3 + 16) = v16;
  *(void *)(a3 + 24) = v6;
  *(void *)(a3 + 32) = v5;
  *(void *)(a3 + 40) = v7;
  *(unsigned char *)(a3 + 48) = v8;
  *(void *)(a3 + 56) = sub_23AADA97C;
  *(void *)(a3 + 64) = v9;
  swift_bridgeObjectRetain_n();
  return sub_23AADA0AC(a2);
}

uint64_t sub_23AAD659C(long long *a1)
{
  long long v2 = *a1;
  swift_retain();
  sub_23AAE21C4();
  return sub_23AAD9EDC((uint64_t)&v2);
}

uint64_t sub_23AAD65FC(uint64_t a1)
{
  long long v7 = *(_OWORD *)a1;
  swift_retain();
  sub_23AAE0E50();
  sub_23AAD9EDC((uint64_t)&v7);
  swift_getKeyPath();
  uint64_t v2 = swift_allocObject();
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 96) = v3;
  *(void *)(v2 + 112) = *(void *)(a1 + 96);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  sub_23AADA0AC(a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58778);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58780);
  sub_23AADBF84(&qword_268A58788, &qword_268A58778);
  sub_23AADA644();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58730);
  sub_23AADA3E4(&qword_268A58738, &qword_268A58730, (void (*)(void))sub_23AADA46C, (void (*)(void))sub_23AADA1AC);
  swift_getOpaqueTypeConformance2();
  return sub_23AAE3EB0();
}

uint64_t sub_23AAD67C0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58780);
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v25 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = *((unsigned __int8 *)a1 + 24);
  v56[0] = *(_OWORD *)a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  sub_23AAD9EDC((uint64_t)v56);
  uint64_t v11 = v43;
  uint64_t v24 = v44;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v8;
  *(void *)(v12 + 24) = v7;
  *(void *)(v12 + 32) = v9;
  *(unsigned char *)(v12 + 40) = v10;
  long long v13 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v12 + 112) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v12 + 128) = v13;
  *(void *)(v12 + 144) = *(void *)(a2 + 96);
  long long v14 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v12 + 48) = *(_OWORD *)a2;
  *(_OWORD *)(v12 + 64) = v14;
  long long v15 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v12 + 80) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v12 + 96) = v15;
  swift_bridgeObjectRetain();
  sub_23AADA724((uint64_t)v56);
  swift_bridgeObjectRetain();
  sub_23AADA0AC(a2);
  uint64_t v16 = sub_23AAE0CEC();
  sub_23AAD9EDC((uint64_t)v56);
  uint64_t v17 = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  if (v17 || (v10 & 1) != 0)
  {
    uint64_t v30 = 0;
    uint64_t v31 = v11;
    uint64_t v32 = v24;
    uint64_t v33 = v8;
    uint64_t v34 = v7;
    uint64_t v35 = v9;
    uint64_t v36 = v10;
    uint64_t v37 = sub_23AADA710;
    uint64_t v38 = v12;
    uint64_t v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    char v42 = 1;
  }
  else
  {
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v19 = swift_allocObject();
    *(unsigned char *)(v19 + 16) = 1;
    uint64_t v30 = 0;
    uint64_t v31 = v11;
    uint64_t v32 = v24;
    uint64_t v33 = v8;
    uint64_t v34 = v7;
    uint64_t v35 = v9;
    uint64_t v36 = 0;
    uint64_t v37 = sub_23AADA710;
    uint64_t v38 = v12;
    uint64_t v39 = KeyPath;
    uint64_t v40 = sub_23AADA834;
    uint64_t v41 = v19;
    char v42 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58748);
  sub_23AADA46C();
  sub_23AADA1AC();
  sub_23AAE3C60();
  long long v29 = *(_OWORD *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58640);
  uint64_t v20 = sub_23AAE3E90();
  MEMORY[0x270FA5388](v20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58730);
  sub_23AADA3E4(&qword_268A58738, &qword_268A58730, (void (*)(void))sub_23AADA46C, (void (*)(void))sub_23AADA1AC);
  uint64_t v21 = v25;
  sub_23AAE3DD0();
  swift_release();
  swift_release();
  sub_23AADA774(v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v21, v27);
}

void sub_23AAD6BC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4)
  {
    switch(a3)
    {
      case 1:
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
        sub_23AAE3E80();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58640);
        sub_23AAE3E80();
        break;
      case 2:
        return;
      default:
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
        sub_23AAE3E80();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58640);
        sub_23AAE3E80();
        sub_23AAE4040();
        sub_23AAE4120();
        sub_23AAE3FE0();
        sub_23AAE4160();
        sub_23AADA858();
        uint64_t v11 = (void *)sub_23AAE40C0();
        if (qword_268A585F8 != -1) {
          swift_once();
        }
        unint64_t v12 = qword_268A58920;
        swift_bridgeObjectRetain();
        char v13 = sub_23AADC3B8((uint64_t)v11, v12);
        swift_bridgeObjectRelease();
        if (v13)
        {
          uint64_t v14 = sub_23AAE3FA0();
          uint64_t v16 = v15;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
          uint64_t v17 = swift_allocObject();
          *(_OWORD *)(v17 + 16) = xmmword_23AAE4830;
          *(void *)(v17 + 56) = MEMORY[0x263F8D310];
          *(void *)(v17 + 64) = sub_23AAD9FF0();
          *(void *)(v17 + 32) = v14;
          *(void *)(v17 + 40) = v16;
          sub_23AAE3A90();
          swift_bridgeObjectRelease();

          goto LABEL_13;
        }
        swift_bridgeObjectRelease();

        break;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
    sub_23AAE3E80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58640);
    sub_23AAE3E80();
    sub_23AAE4040();
    sub_23AAE4120();
    sub_23AAE3FE0();
    sub_23AAE4160();
    sub_23AADA858();
    long long v4 = (void *)sub_23AAE40C0();
    if (qword_268A585F8 != -1) {
      swift_once();
    }
    unint64_t v5 = qword_268A58920;
    swift_bridgeObjectRetain();
    char v6 = sub_23AADC3B8((uint64_t)v4, v5);
    swift_bridgeObjectRelease();
    if (v6)
    {
      uint64_t v7 = sub_23AAE3FA0();
      uint64_t v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_23AAE4830;
      *(void *)(v10 + 56) = MEMORY[0x263F8D310];
      *(void *)(v10 + 64) = sub_23AAD9FF0();
      *(void *)(v10 + 32) = v7;
      *(void *)(v10 + 40) = v9;
      sub_23AAE3A90();
      swift_bridgeObjectRelease();

LABEL_13:
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_23AAD7150@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = sub_23AAE3E10();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v56 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v55 = (char *)&v46 - v6;
  uint64_t v7 = sub_23AAE3A80();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACUILocaleUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v13 = sub_23AAE3A50();
  uint64_t v15 = v14;

  *(void *)&long long v58 = v13;
  *((void *)&v58 + 1) = v15;
  sub_23AAD9F7C();
  uint64_t v16 = sub_23AAE3D60();
  uint64_t v53 = v17;
  uint64_t v54 = v16;
  int v51 = v18;
  uint64_t v52 = v19;
  id v49 = v11;
  uint64_t v50 = ObjCClassFromMetadata;
  id v20 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v46 = sub_23AAE3A50();

  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_23AAE4830;
  long long v58 = *(_OWORD *)(v2 + 40);
  uint64_t v59 = *(void *)(v2 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
  sub_23AAE3E70();
  if (v61) {
    uint64_t v22 = v60;
  }
  else {
    uint64_t v22 = 4271950;
  }
  if (v61) {
    unint64_t v23 = v61;
  }
  else {
    unint64_t v23 = 0xE300000000000000;
  }
  id v24 = objc_msgSend(self, sel_currentLocale);
  sub_23AAE3A70();

  uint64_t v25 = sub_23AAE3A60();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v48);
  if (v27)
  {
    *(void *)&long long v58 = v25;
    *((void *)&v58 + 1) = v27;
    uint64_t v22 = sub_23AAE40E0();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v23 = v29;
  }
  *(void *)(v21 + 56) = MEMORY[0x263F8D310];
  *(void *)(v21 + 64) = sub_23AAD9FF0();
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v23;
  uint64_t v30 = sub_23AAE3FB0();
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
  *(void *)&long long v58 = v30;
  *((void *)&v58 + 1) = v32;
  uint64_t v48 = sub_23AAE3D60();
  sub_23AAE3DF0();
  id v33 = objc_msgSend(v49, sel_bundleForClass_, v50);
  uint64_t v34 = sub_23AAE3A50();
  uint64_t v36 = v35;

  *(void *)&long long v58 = v34;
  *((void *)&v58 + 1) = v36;
  uint64_t v37 = sub_23AAE3D60();
  uint64_t v39 = v38;
  LOBYTE(v36) = v40 & 1;
  uint64_t v41 = swift_allocObject();
  long long v42 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v41 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v41 + 96) = v42;
  *(void *)(v41 + 112) = *(void *)(v2 + 96);
  long long v43 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v41 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v41 + 32) = v43;
  long long v44 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v41 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v41 + 64) = v44;
  sub_23AADA0AC(v2);
  sub_23AAE3E00();
  swift_release();
  sub_23AAD9FE0(v37, v39, v36);
  swift_bridgeObjectRelease();
  return sub_23AAE3DE0();
}

uint64_t sub_23AAD76B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = a1;
  uint64_t v3 = sub_23AAE3E10();
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v56 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  char v55 = (char *)&v46 - v6;
  uint64_t v7 = sub_23AAE3A80();
  uint64_t v47 = *(void *)(v7 - 8);
  uint64_t v48 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACUILocaleUtilities();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v11 = self;
  id v12 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v13 = sub_23AAE3A50();
  uint64_t v15 = v14;

  *(void *)&long long v58 = v13;
  *((void *)&v58 + 1) = v15;
  sub_23AAD9F7C();
  uint64_t v16 = sub_23AAE3D60();
  uint64_t v53 = v17;
  uint64_t v54 = v16;
  int v51 = v18;
  uint64_t v52 = v19;
  id v49 = v11;
  uint64_t v50 = ObjCClassFromMetadata;
  id v20 = objc_msgSend(v11, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v46 = sub_23AAE3A50();

  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_23AAE4830;
  long long v58 = *(_OWORD *)(v2 + 80);
  uint64_t v59 = *(void *)(v2 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
  sub_23AAE3E70();
  if (v61) {
    uint64_t v22 = v60;
  }
  else {
    uint64_t v22 = 4271950;
  }
  if (v61) {
    unint64_t v23 = v61;
  }
  else {
    unint64_t v23 = 0xE300000000000000;
  }
  id v24 = objc_msgSend(self, sel_currentLocale);
  sub_23AAE3A70();

  uint64_t v25 = sub_23AAE3A60();
  uint64_t v27 = v26;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v9, v48);
  if (v27)
  {
    *(void *)&long long v58 = v25;
    *((void *)&v58 + 1) = v27;
    uint64_t v22 = sub_23AAE40E0();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    unint64_t v23 = v29;
  }
  *(void *)(v21 + 56) = MEMORY[0x263F8D310];
  *(void *)(v21 + 64) = sub_23AAD9FF0();
  *(void *)(v21 + 32) = v22;
  *(void *)(v21 + 40) = v23;
  uint64_t v30 = sub_23AAE3FB0();
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
  *(void *)&long long v58 = v30;
  *((void *)&v58 + 1) = v32;
  uint64_t v48 = sub_23AAE3D60();
  sub_23AAE3DF0();
  id v33 = objc_msgSend(v49, sel_bundleForClass_, v50);
  uint64_t v34 = sub_23AAE3A50();
  uint64_t v36 = v35;

  *(void *)&long long v58 = v34;
  *((void *)&v58 + 1) = v36;
  uint64_t v37 = sub_23AAE3D60();
  uint64_t v39 = v38;
  LOBYTE(v36) = v40 & 1;
  uint64_t v41 = swift_allocObject();
  long long v42 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v41 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v41 + 96) = v42;
  *(void *)(v41 + 112) = *(void *)(v2 + 96);
  long long v43 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v41 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v41 + 32) = v43;
  long long v44 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v41 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v41 + 64) = v44;
  sub_23AADA0AC(v2);
  sub_23AAE3E00();
  swift_release();
  sub_23AAD9FE0(v37, v39, v36);
  swift_bridgeObjectRelease();
  return sub_23AAE3DE0();
}

uint64_t sub_23AAD7C24@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAD4D74(a1);
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

uint64_t sub_23AAD7CB4(long long *a1)
{
  long long v3 = *(long long *)((char *)a1 + 40);
  uint64_t v4 = *((void *)a1 + 7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
  uint64_t result = sub_23AAE3E70();
  if (v6)
  {
    long long v3 = *a1;
    swift_retain();
    sub_23AAE1200(v5, v6);
    sub_23AAD9EDC((uint64_t)&v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23AAD7D4C(long long *a1)
{
  long long v3 = a1[5];
  uint64_t v4 = *((void *)a1 + 12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A586A0);
  uint64_t result = sub_23AAE3E70();
  if (v6)
  {
    long long v3 = *a1;
    swift_retain();
    sub_23AAE1A48(v5, v6);
    sub_23AAD9EDC((uint64_t)&v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23AAD7DE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v30 = a1;
  uint64_t v3 = sub_23AAE3A80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23AAE3C20();
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A588F0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_23AAE3C40();
  sub_23AAD813C(v2, (uint64_t)&v33);
  char v12 = v34;
  uint64_t v13 = *(void *)v35;
  long long v14 = v33;
  long long v15 = *(_OWORD *)&v35[8];
  long long v16 = *(_OWORD *)v36;
  long long v33 = (unint64_t)v11;
  char v34 = 1;
  *(_OWORD *)uint64_t v35 = v14;
  v35[16] = v12;
  *(void *)uint64_t v36 = v13;
  *(_OWORD *)&v36[8] = v15;
  long long v37 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A588F8);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_23AAE4830;
  sub_23AAE3C10();
  sub_23AAE3C00();
  id v18 = objc_msgSend(self, sel_currentLocale);
  sub_23AAE3A70();

  uint64_t v19 = sub_23AAE3A60();
  uint64_t v21 = v20;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v21)
  {
    uint64_t v31 = v19;
    uint64_t v32 = v21;
    sub_23AAD9F7C();
    sub_23AAE40E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  sub_23AAE3BF0();
  swift_bridgeObjectRelease();
  sub_23AAE3C00();
  *(void *)(v17 + 32) = sub_23AAE3C30();
  *(void *)(v17 + 40) = v22;
  *(unsigned char *)(v17 + 48) = v23 & 1;
  *(void *)(v17 + 56) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58900);
  sub_23AADBF84(&qword_268A58908, &qword_268A58900);
  sub_23AAE3DC0();
  swift_bridgeObjectRelease();
  uint64_t v25 = *(void *)&v36[8];
  uint64_t v26 = *(void *)&v36[16];
  long long v27 = v37;
  sub_23AAD9FE0(*(uint64_t *)v35, *(uint64_t *)&v35[8], v35[16]);
  swift_bridgeObjectRelease();
  sub_23AADBFC8(v25, v26, v27, *((uint64_t *)&v27 + 1));
  return sub_23AADC00C((uint64_t)v10, v30, &qword_268A588F0);
}

uint64_t sub_23AAD813C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_23AAE3A80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_OWORD *)v68 = *(_OWORD *)a1;
  *(_OWORD *)&v68[9] = *(_OWORD *)(a1 + 9);
  uint64_t v9 = *(void *)&v68[8];
  uint64_t v8 = *(void *)v68;
  id v10 = objc_msgSend(self, sel_currentLocale);
  sub_23AAE3A70();

  uint64_t v11 = sub_23AAE3A60();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v13)
  {
    uint64_t v66 = v11;
    uint64_t v67 = v13;
    sub_23AAD9F7C();
    uint64_t v8 = sub_23AAE40E0();
    uint64_t v9 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  uint64_t v66 = v8;
  uint64_t v67 = v9;
  sub_23AAD9F7C();
  uint64_t v15 = sub_23AAE3D60();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  uint64_t v20 = *(void *)(a1 + 32);
  char v21 = *(unsigned char *)(a1 + 40);
  sub_23AADBB4C(v20, v21);
  char v22 = sub_23AAD9C08(v20, v21);
  sub_23AADBB58(v20, v21);
  char v23 = self;
  uint64_t v24 = &selRef_labelColor;
  if ((v22 & 1) == 0) {
    uint64_t v24 = &selRef_secondaryLabelColor;
  }
  MEMORY[0x23ECBF350]([v23 *v24]);
  uint64_t v25 = sub_23AAE3D40();
  uint64_t v63 = v26;
  uint64_t v64 = v25;
  int v62 = v27;
  uint64_t v65 = v28;
  swift_release();
  sub_23AAD9FE0(v15, v17, v19);
  swift_bridgeObjectRelease();
  sub_23AADC070((uint64_t)&v68[16], (uint64_t)v69);
  sub_23AADC070((uint64_t)v69, (uint64_t)&v70);
  uint64_t v29 = 0;
  if (v71 == 1)
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    if (v70 >= 3)
    {
      type metadata accessor for CACUILocaleUtilities();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v34 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
      uint64_t v35 = sub_23AAE3A50();
      uint64_t v37 = v36;

      uint64_t v66 = v35;
      uint64_t v67 = v37;
      uint64_t v38 = sub_23AAE3D60();
      uint64_t v40 = v39;
      char v42 = v41 & 1;
      sub_23AAE3D20();
      uint64_t v43 = sub_23AAE3D50();
      uint64_t v60 = v44;
      uint64_t v61 = v45;
      char v47 = v46;
      swift_release();
      LOBYTE(v34) = v47 & 1;
      sub_23AAD9FE0(v38, v40, v42);
      swift_bridgeObjectRelease();
      sub_23AADBB4C(v20, v21);
      sub_23AAD9C08(v20, v21);
      sub_23AADBB58(v20, v21);
      id v48 = objc_msgSend(self, sel_secondaryLabelColor);
      MEMORY[0x23ECBF350](v48);
      uint64_t v49 = v60;
      uint64_t v29 = sub_23AAE3D40();
      uint64_t v30 = v50;
      char v52 = v51;
      uint64_t v32 = v53;
      swift_release();
      uint64_t v31 = v52 & 1;
      sub_23AAD9FE0(v43, v49, (char)v34);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
  }
  char v54 = v62;
  char v55 = v62 & 1;
  uint64_t v57 = v63;
  uint64_t v56 = v64;
  *(void *)a2 = v64;
  *(void *)(a2 + 8) = v57;
  *(unsigned char *)(a2 + 16) = v54 & 1;
  *(void *)(a2 + 24) = v65;
  *(void *)(a2 + 32) = v29;
  *(void *)(a2 + 40) = v30;
  *(void *)(a2 + 48) = v31;
  *(void *)(a2 + 56) = v32;
  sub_23AAD9FD0(v56, v57, v54 & 1);
  swift_bridgeObjectRetain();
  sub_23AADC0CC(v29, v30, v31, v32);
  sub_23AADBFC8(v29, v30, v31, v32);
  sub_23AAD9FE0(v56, v57, v55);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23AAD8604()
{
  return sub_23AAE3DA0();
}

uint64_t sub_23AAD8620@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAD7DE4(a1);
}

uint64_t sub_23AAD865C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_23AAE3BE0();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A587E8);
  return sub_23AAD86AC(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_23AAD86AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v124 = a2;
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A587F0);
  MEMORY[0x270FA5388](v123);
  uint64_t v4 = (char *)v92 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A587F8);
  MEMORY[0x270FA5388](v112);
  v108 = (char *)v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((void *)&v122 + 1) = sub_23AAE3C80();
  uint64_t v101 = *(void *)(*((void *)&v122 + 1) - 8);
  MEMORY[0x270FA5388](*((void *)&v122 + 1));
  v100 = (char *)v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58668);
  uint64_t v99 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v106 = (char *)v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58670);
  uint64_t v105 = *(void *)(v107 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v107);
  v98 = (char *)v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v104 = (char *)v92 - v10;
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58800);
  MEMORY[0x270FA5388](v115);
  v114 = (_OWORD *)((char *)v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58808);
  MEMORY[0x270FA5388](v109);
  uint64_t v111 = (uint64_t)v92 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58810);
  MEMORY[0x270FA5388](v102);
  uint64_t v14 = (char *)v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58818);
  MEMORY[0x270FA5388](v110);
  uint64_t v16 = (char *)v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58820);
  MEMORY[0x270FA5388](v116);
  v113 = (char *)v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58828);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)v92 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58830);
  uint64_t v22 = MEMORY[0x270FA5388](v21 - 8);
  v121 = (char *)v92 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v120 = (char *)v92 - v24;
  uint64_t v26 = *(void *)(a1 + 24);
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v27 = *(void *)(a1 + 40);
  int v28 = *(unsigned __int8 *)(a1 + 48);
  uint64_t KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  int v117 = sub_23AAE3CC0();
  sub_23AAE3B00();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  int v118 = v28;
  if (v28 == 1)
  {
    uint64_t v37 = v4;
    uint64_t v38 = v122;
    v92[1] = v18;
    v93 = v14;
    v94 = v16;
    uint64_t v95 = (uint64_t)v20;
    uint64_t v103 = v27;
    uint64_t v96 = v26;
    uint64_t v97 = v25;
    uint64_t v39 = v124;
    switch(v27)
    {
      case 1:
        uint64_t v54 = v105;
        uint64_t v55 = *((void *)&v122 + 1);
        uint64_t v56 = v104;
        uint64_t v57 = v37;
        sub_23AAE3B30();
        long long v58 = v100;
        sub_23AAE3C70();
        uint64_t v102 = sub_23AADBF84(&qword_268A58680, &qword_268A58668);
        uint64_t v95 = sub_23AADB870(&qword_268A58688, MEMORY[0x263F1A1E0]);
        uint64_t v59 = v98;
        uint64_t v60 = v106;
        sub_23AAE3D90();
        (*(void (**)(char *, uint64_t))(v101 + 8))(v58, v55);
        (*(void (**)(char *, uint64_t))(v99 + 8))(v60, v38);
        uint64_t v61 = v107;
        (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v56, v59, v107);
        (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v57, v56, v61);
        swift_storeEnumTagMultiPayload();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A588A0);
        *(void *)&long long v130 = v38;
        *((void *)&v130 + 1) = v55;
        *(void *)&long long v131 = v102;
        *((void *)&v131 + 1) = v95;
        swift_getOpaqueTypeConformance2();
        sub_23AADB9DC();
        uint64_t v62 = (uint64_t)v108;
        sub_23AAE3C60();
        sub_23AADBB64(v62, v111, &qword_268A587F8);
        swift_storeEnumTagMultiPayload();
        sub_23AADB750();
        sub_23AADB8B8();
        uint64_t v63 = v56;
        uint64_t v64 = (uint64_t)v113;
        sub_23AAE3C60();
        sub_23AADBBC8(v62, &qword_268A587F8);
        sub_23AADBB64(v64, (uint64_t)v114, &qword_268A58820);
        swift_storeEnumTagMultiPayload();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58868);
        sub_23AADA3E4(&qword_268A58870, &qword_268A58820, (void (*)(void))sub_23AADB750, (void (*)(void))sub_23AADB8B8);
        sub_23AADBAD0();
        uint64_t v48 = (uint64_t)v120;
        sub_23AAE3C60();
        sub_23AADBBC8(v64, &qword_268A58820);
        (*(void (**)(char *, uint64_t))(v54 + 8))(v63, v61);
        goto LABEL_10;
      case 2:
        uint64_t v26 = v96;
        uint64_t v25 = v97;
        if (v96 == *(void *)(a1 + 8) && v97 == *(void *)(a1 + 16) || (sub_23AAE4190() & 1) != 0)
        {
          uint64_t v65 = sub_23AAE3E30();
          sub_23AAE3CE0();
          sub_23AAE3CF0();
          uint64_t v66 = sub_23AAE3D10();
          swift_release();
          uint64_t v67 = swift_getKeyPath();
          unsigned __int8 v68 = sub_23AAE3CD0();
          sub_23AAE3B00();
          *(void *)&long long v125 = v65;
          *((void *)&v125 + 1) = v67;
          *(void *)&long long v126 = v66;
          *((void *)&v126 + 1) = v68;
          *(void *)&long long v127 = v69;
          *((void *)&v127 + 1) = v70;
          *(void *)&long long v128 = v71;
          *((void *)&v128 + 1) = v72;
          __int16 v129 = 0;
        }
        else
        {
          long long v127 = 0u;
          long long v128 = 0u;
          long long v126 = 0u;
          long long v125 = 0u;
          __int16 v129 = 256;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58838);
        sub_23AADB634();
        sub_23AAE3C60();
        long long v84 = v131;
        long long v85 = v132;
        long long v86 = v133;
        char v87 = v134;
        char v88 = v135;
        uint64_t v89 = v114;
        uint64_t v48 = (uint64_t)v120;
        char v51 = v118;
        _OWORD *v114 = v130;
        v89[1] = v84;
        v89[2] = v85;
        v89[3] = v86;
        *((unsigned char *)v89 + 64) = v87;
        *((unsigned char *)v89 + 65) = v88;
        swift_storeEnumTagMultiPayload();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58868);
        sub_23AADA3E4(&qword_268A58870, &qword_268A58820, (void (*)(void))sub_23AADB750, (void (*)(void))sub_23AADB8B8);
        sub_23AADBAD0();
        sub_23AAE3C60();
        uint64_t v49 = (uint64_t)v121;
        uint64_t v50 = KeyPath;
        break;
      default:
        uint64_t v73 = sub_23AAE3E30();
        sub_23AAE3CE0();
        sub_23AAE3D00();
        uint64_t v74 = sub_23AAE3D10();
        swift_release();
        uint64_t v75 = swift_getKeyPath();
        *(void *)&long long v130 = v73;
        *((void *)&v130 + 1) = v75;
        *(void *)&long long v131 = v74;
        type metadata accessor for CACUILocaleUtilities();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v77 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
        uint64_t v78 = sub_23AAE3A50();
        uint64_t v80 = v79;

        *(void *)&long long v125 = v78;
        *((void *)&v125 + 1) = v80;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58850);
        sub_23AADB6B0();
        sub_23AAD9F7C();
        uint64_t v81 = v95;
        sub_23AAE3DB0();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        sub_23AADBB64(v81, (uint64_t)v93, &qword_268A58828);
        swift_storeEnumTagMultiPayload();
        sub_23AADB7C4();
        uint64_t v82 = (uint64_t)v94;
        sub_23AAE3C60();
        sub_23AADBB64(v82, v111, &qword_268A58818);
        swift_storeEnumTagMultiPayload();
        sub_23AADB750();
        sub_23AADB8B8();
        uint64_t v83 = (uint64_t)v113;
        sub_23AAE3C60();
        sub_23AADBBC8(v82, &qword_268A58818);
        sub_23AADBB64(v83, (uint64_t)v114, &qword_268A58820);
        swift_storeEnumTagMultiPayload();
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58868);
        sub_23AADA3E4(&qword_268A58870, &qword_268A58820, (void (*)(void))sub_23AADB750, (void (*)(void))sub_23AADB8B8);
        sub_23AADBAD0();
        uint64_t v48 = (uint64_t)v120;
        sub_23AAE3C60();
        sub_23AADBBC8(v83, &qword_268A58820);
        sub_23AADBBC8(v81, &qword_268A58828);
LABEL_10:
        uint64_t v49 = (uint64_t)v121;
        uint64_t v25 = v97;
        uint64_t v50 = KeyPath;
        uint64_t v26 = v96;
        char v51 = v118;
        break;
    }
    uint64_t v52 = v103;
    char v53 = v117;
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_23AAE3EF0();
    int v41 = sub_23AAE3C90();
    sub_23AAE3F00();
    *(_DWORD *)uint64_t v4 = v27;
    *((void *)v4 + 1) = v26;
    *((void *)v4 + 2) = v25;
    *((void *)v4 + 3) = v40;
    *((_DWORD *)v4 + 8) = v41;
    *((void *)v4 + 5) = v42;
    *((void *)v4 + 6) = v43;
    v4[56] = 1;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A588A0);
    uint64_t v44 = sub_23AADBF84(&qword_268A58680, &qword_268A58668);
    uint64_t v45 = sub_23AADB870(&qword_268A58688, MEMORY[0x263F1A1E0]);
    long long v130 = v122;
    *(void *)&long long v131 = v44;
    *((void *)&v131 + 1) = v45;
    swift_getOpaqueTypeConformance2();
    sub_23AADB9DC();
    uint64_t v46 = (uint64_t)v108;
    sub_23AAE3C60();
    sub_23AADBB64(v46, v111, &qword_268A587F8);
    swift_storeEnumTagMultiPayload();
    sub_23AADB750();
    sub_23AADB8B8();
    uint64_t v47 = (uint64_t)v113;
    sub_23AAE3C60();
    sub_23AADBBC8(v46, &qword_268A587F8);
    sub_23AADBB64(v47, (uint64_t)v114, &qword_268A58820);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58868);
    sub_23AADA3E4(&qword_268A58870, &qword_268A58820, (void (*)(void))sub_23AADB750, (void (*)(void))sub_23AADB8B8);
    sub_23AADBAD0();
    uint64_t v48 = (uint64_t)v120;
    sub_23AAE3C60();
    sub_23AADBBC8(v47, &qword_268A58820);
    uint64_t v49 = (uint64_t)v121;
    uint64_t v50 = KeyPath;
    char v51 = v118;
    uint64_t v52 = v27;
    char v53 = v117;
    uint64_t v39 = v124;
  }
  sub_23AADBB64(v48, v49, &qword_268A58830);
  *(void *)uint64_t v39 = v26;
  *(void *)(v39 + 8) = v25;
  *(void *)(v39 + 16) = v52;
  *(unsigned char *)(v39 + 24) = v51;
  *(void *)(v39 + 32) = v50;
  *(unsigned char *)(v39 + 40) = 0;
  *(unsigned char *)(v39 + 48) = v53;
  *(void *)(v39 + 56) = v30;
  *(void *)(v39 + 64) = v32;
  *(void *)(v39 + 72) = v34;
  *(void *)(v39 + 80) = v36;
  *(unsigned char *)(v39 + 88) = 0;
  *(void *)(v39 + 96) = 0;
  *(unsigned char *)(v39 + 104) = 1;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A588C8);
  sub_23AADBB64(v49, v39 + *(int *)(v90 + 64), &qword_268A58830);
  swift_bridgeObjectRetain();
  sub_23AADBB4C(v50, 0);
  sub_23AADBBC8(v48, &qword_268A58830);
  sub_23AADBBC8(v49, &qword_268A58830);
  swift_bridgeObjectRelease();
  return sub_23AADBB58(v50, 0);
}

uint64_t sub_23AAD9A30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A587C8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v7 = *(_OWORD *)(v1 + 48);
  v15[2] = *(_OWORD *)(v1 + 32);
  v15[3] = v7;
  uint64_t v16 = *(void *)(v1 + 64);
  long long v8 = *(_OWORD *)(v1 + 16);
  v15[0] = *(_OWORD *)v1;
  v15[1] = v8;
  uint64_t v9 = swift_allocObject();
  long long v10 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v9 + 64) = v10;
  *(void *)(v9 + 80) = *(void *)(v1 + 64);
  long long v11 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v9 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v9 + 32) = v11;
  uint64_t v14 = v15;
  sub_23AADB5D4((uint64_t)v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A587D0);
  sub_23AADBF84(&qword_268A587D8, &qword_268A587D0);
  sub_23AAE3EA0();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 16))(a1, v6, v3);
  *(unsigned char *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268A587E0) + 36)) = 0;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_23AAD9C08(uint64_t a1, char a2)
{
  uint64_t v4 = sub_23AAE3BD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_23AAE4070();
  uint64_t v9 = sub_23AAE3CB0();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_23AADA990(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_23AAD2000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23ECBFB40](v11, -1, -1);
    MEMORY[0x23ECBFB40](v10, -1, -1);
  }

  sub_23AAE3BC0();
  swift_getAtKeyPath();
  sub_23AADBB58(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_23AAD9DE0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_23AAD9E60()
{
  return sub_23AAE3AE0();
}

uint64_t sub_23AAD9EDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23AAD9F08@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAD58B8(*(_OWORD **)(v1 + 16), a1);
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

uint64_t sub_23AAD9F58@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAD76B4(a1);
}

unint64_t sub_23AAD9F7C()
{
  unint64_t result = qword_268A58678;
  if (!qword_268A58678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58678);
  }
  return result;
}

uint64_t sub_23AAD9FD0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_23AAD9FE0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_23AAD9FF0()
{
  unint64_t result = qword_268A586A8;
  if (!qword_268A586A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A586A8);
  }
  return result;
}

uint64_t sub_23AADA044@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23AAE3BA0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_23AADA074()
{
  return sub_23AAE3BB0();
}

uint64_t sub_23AADA0A4()
{
  return sub_23AAD7D4C((long long *)(v0 + 16));
}

uint64_t sub_23AADA0AC(uint64_t a1)
{
  return a1;
}

uint64_t sub_23AADA130()
{
  return sub_23AAD6334(*(void *)(v0 + 16));
}

unint64_t sub_23AADA138()
{
  unint64_t result = qword_268A586F8;
  if (!qword_268A586F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A586F0);
    sub_23AADA1AC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A586F8);
  }
  return result;
}

unint64_t sub_23AADA1AC()
{
  unint64_t result = qword_268A58700;
  if (!qword_268A58700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58700);
  }
  return result;
}

unint64_t sub_23AADA200()
{
  unint64_t result = qword_268A58708;
  if (!qword_268A58708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A586D8);
    sub_23AADA5AC(&qword_268A58710, &qword_268A586E0, (void (*)(void))sub_23AADA138);
    sub_23AADA2A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58708);
  }
  return result;
}

unint64_t sub_23AADA2A0()
{
  unint64_t result = qword_268A58718;
  if (!qword_268A58718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58718);
  }
  return result;
}

uint64_t sub_23AADA2F4()
{
  return sub_23AAD65FC(*(void *)(v0 + 16));
}

unint64_t sub_23AADA2FC()
{
  unint64_t result = qword_268A58728;
  if (!qword_268A58728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58720);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58730);
    sub_23AADA3E4(&qword_268A58738, &qword_268A58730, (void (*)(void))sub_23AADA46C, (void (*)(void))sub_23AADA1AC);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58728);
  }
  return result;
}

uint64_t sub_23AADA3E4(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23AADA46C()
{
  unint64_t result = qword_268A58740;
  if (!qword_268A58740)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58748);
    sub_23AADA1AC();
    sub_23AADBF84(&qword_268A58750, &qword_268A58758);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58740);
  }
  return result;
}

unint64_t sub_23AADA50C()
{
  unint64_t result = qword_268A58760;
  if (!qword_268A58760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A586B8);
    sub_23AADA5AC(&qword_268A58768, &qword_268A586C0, (void (*)(void))sub_23AADA2FC);
    sub_23AADA2A0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58760);
  }
  return result;
}

uint64_t sub_23AADA5AC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

uint64_t sub_23AADA63C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23AAD67C0(a1, v2 + 16, a2);
}

unint64_t sub_23AADA644()
{
  unint64_t result = qword_268A58790;
  if (!qword_268A58790)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58790);
  }
  return result;
}

uint64_t sub_23AADA6A0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 152, 7);
}

void sub_23AADA710()
{
  sub_23AAD6BC4(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
}

uint64_t sub_23AADA724(uint64_t a1)
{
  return a1;
}

uint64_t sub_23AADA750@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAD7150(a1);
}

uint64_t sub_23AADA774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (a13)
  {
    return sub_23AADA814(a8);
  }
  else
  {
    sub_23AADA814(a8);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_23AADA814(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23AADA824()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unsigned char *sub_23AADA834(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_23AADA850()
{
  return sub_23AAD7CB4((long long *)(v0 + 16));
}

unint64_t sub_23AADA858()
{
  unint64_t result = qword_268A58798;
  if (!qword_268A58798)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A58798);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_23AADA904@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23AAD6470(a1, v2 + 16, a2);
}

uint64_t sub_23AADA90C()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 145, 7);
}

uint64_t sub_23AADA97C()
{
  return sub_23AAD659C((long long *)(v0 + 16));
}

unint64_t sub_23AADA990(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_23AADAA64(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23AADC160((uint64_t)v12, *a3);
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
      sub_23AADC160((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_23AADAA64(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_23AADAB64(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_23AAE4150();
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

uint64_t sub_23AADAB64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23AADABFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23AADAD00(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23AADAD00((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23AADABFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23AADAC98(v2, 0);
      uint64_t result = sub_23AAE4130();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_23AAE3FF0();
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

void *sub_23AADAC98(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58910);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23AADAD00(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58910);
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

uint64_t sub_23AADADEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23AAE3B80();
  *a1 = result;
  return result;
}

uint64_t sub_23AADAE18()
{
  return sub_23AAE3B90();
}

__n128 sub_23AADAE44@<Q0>(char a1@<W1>, uint64_t a2@<X8>)
{
  sub_23AAE3E60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A587A0);
  sub_23AAE3E60();
  sub_23AAE3E60();
  sub_23AAE3E60();
  type metadata accessor for CACUILanguageViewModel();
  sub_23AADB870(&qword_268A587A8, (void (*)(uint64_t))type metadata accessor for CACUILanguageViewModel);
  *(void *)a2 = sub_23AAE3B50();
  *(void *)(a2 + 8) = v4;
  *(unsigned char *)(a2 + 16) = a1;
  *(unsigned char *)(a2 + 24) = v6.n128_u8[0];
  *(void *)(a2 + 32) = v6.n128_u64[1];
  *(__n128 *)(a2 + 40) = v6;
  *(void *)(a2 + 56) = v7;
  *(unsigned char *)(a2 + 64) = v6.n128_u8[0];
  *(void *)(a2 + 72) = v6.n128_u64[1];
  __n128 result = v6;
  *(__n128 *)(a2 + 80) = v6;
  *(void *)(a2 + 96) = v7;
  return result;
}

uint64_t destroy for LanguageDownloadButton(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for LanguageDownloadButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v7 = (_OWORD *)(a2 + 56);
  uint64_t v6 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v8 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v6;
    *(void *)(a1 + 64) = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 56) = *v7;
  }
  return a1;
}

uint64_t assignWithCopy for LanguageDownloadButton(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 40) = v4;
  uint64_t v6 = *(void *)(a2 + 56);
  if (!v5)
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v6;
      *(void *)(a1 + 64) = v8;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for LanguageDownloadButton(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  uint64_t v6 = *(void *)(a1 + 56);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  if (!v6)
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = v5;
      *(void *)(a1 + 64) = v8;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v5;
  *(void *)(a1 + 64) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageDownloadButton(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageDownloadButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageDownloadButton()
{
  return &type metadata for LanguageDownloadButton;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACUILanguageView.ContextView(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CACUILanguageView.ContextView(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23AADB454);
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

uint64_t sub_23AADB47C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23AADB484(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageView.ContextView()
{
  return &type metadata for CACUILanguageView.ContextView;
}

uint64_t sub_23AADB49C()
{
  return sub_23AADBF84(&qword_268A587B0, &qword_268A587B8);
}

unint64_t sub_23AADB4DC()
{
  unint64_t result = qword_268A587C0;
  if (!qword_268A587C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A587C0);
  }
  return result;
}

uint64_t sub_23AADB530()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23AADB54C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72)) {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, 88, 7);
}

uint64_t sub_23AADB59C()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 72);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_23AADB5CC@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAD865C(*(void *)(v1 + 16), a1);
}

uint64_t sub_23AADB5D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23AADB624(v2);
  return a1;
}

uint64_t sub_23AADB624(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_23AADB634()
{
  unint64_t result = qword_268A58840;
  if (!qword_268A58840)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58838);
    sub_23AADB6B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58840);
  }
  return result;
}

unint64_t sub_23AADB6B0()
{
  unint64_t result = qword_268A58848;
  if (!qword_268A58848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58850);
    sub_23AADBF84(&qword_268A58858, &qword_268A58860);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58848);
  }
  return result;
}

unint64_t sub_23AADB750()
{
  unint64_t result = qword_268A58878;
  if (!qword_268A58878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58818);
    sub_23AADB7C4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58878);
  }
  return result;
}

unint64_t sub_23AADB7C4()
{
  unint64_t result = qword_268A58880;
  if (!qword_268A58880)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58828);
    sub_23AADB6B0();
    sub_23AADB870(&qword_268A58888, MEMORY[0x263F1A478]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58880);
  }
  return result;
}

uint64_t sub_23AADB870(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_23AADB8B8()
{
  unint64_t result = qword_268A58890;
  if (!qword_268A58890)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A587F8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58668);
    sub_23AAE3C80();
    sub_23AADBF84(&qword_268A58680, &qword_268A58668);
    sub_23AADB870(&qword_268A58688, MEMORY[0x263F1A1E0]);
    swift_getOpaqueTypeConformance2();
    sub_23AADB9DC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58890);
  }
  return result;
}

unint64_t sub_23AADB9DC()
{
  unint64_t result = qword_268A58898;
  if (!qword_268A58898)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A588A0);
    sub_23AADBA7C();
    sub_23AADBF84(&qword_268A588B0, &qword_268A588B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58898);
  }
  return result;
}

unint64_t sub_23AADBA7C()
{
  unint64_t result = qword_268A588A8;
  if (!qword_268A588A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A588A8);
  }
  return result;
}

unint64_t sub_23AADBAD0()
{
  unint64_t result = qword_268A588C0;
  if (!qword_268A588C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58868);
    sub_23AADB634();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A588C0);
  }
  return result;
}

uint64_t sub_23AADBB4C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_23AADBB58(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23AADBB64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23AADBBC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for CACUILanguageData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for LanguageListItem(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);

  return sub_23AADBB58(v2, v3);
}

uint64_t initializeWithCopy for LanguageListItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  char v5 = *(unsigned char *)(a2 + 40);
  swift_bridgeObjectRetain();
  sub_23AADBB4C(v4, v5);
  *(void *)(a1 + 32) = v4;
  *(unsigned char *)(a1 + 40) = v5;
  return a1;
}

uint64_t assignWithCopy for LanguageListItem(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = v2[2];
  *(unsigned char *)(a1 + 24) = *((unsigned char *)v2 + 24);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = v2[4];
  LOBYTE(v2) = *((unsigned char *)v2 + 40);
  sub_23AADBB4C(v5, (char)v2);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = v5;
  *(unsigned char *)(a1 + 40) = (_BYTE)v2;
  sub_23AADBB58(v6, v7);
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

uint64_t assignWithTake for LanguageListItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = v5;
  sub_23AADBB58(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for LanguageListItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LanguageListItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 41) = 1;
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
    *(unsigned char *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LanguageListItem()
{
  return &type metadata for LanguageListItem;
}

unint64_t sub_23AADBEA4()
{
  unint64_t result = qword_268A588D0;
  if (!qword_268A588D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A587E0);
    sub_23AADBF84(&qword_268A588D8, &qword_268A587C8);
    sub_23AADBF84(&qword_268A588E0, &qword_268A588E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A588D0);
  }
  return result;
}

uint64_t sub_23AADBF68()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23AADBF84(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23AADBFC8(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23AAD9FE0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23AADC00C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_23AADC070(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_23AADC0CC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_23AAD9FD0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
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

uint64_t sub_23AADC160(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23AADC1C4()
{
  unint64_t result = qword_268A58918;
  if (!qword_268A58918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A588F0);
    sub_23AADBF84(&qword_268A58908, &qword_268A58900);
    sub_23AADB870(&qword_268A58888, MEMORY[0x263F1A478]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58918);
  }
  return result;
}

uint64_t sub_23AADC2A4()
{
  sub_23AADA858();
  uint64_t result = sub_23AAE40D0();
  qword_268A59260 = result;
  return result;
}

id sub_23AADC308()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58928);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_23AAE4B70;
  if (qword_268A585F0 != -1) {
    swift_once();
  }
  unint64_t v2 = (void *)qword_268A59260;
  *(void *)(v0 + 32) = qword_268A59260;
  sub_23AAE4020();
  qword_268A58920 = v0;

  return v2;
}

uint64_t sub_23AADC3B8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = sub_23AAE4170())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)MEMORY[0x23ECBF670](0, a2);
LABEL_5:
      uint64_t v6 = v5;
      sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
      char v7 = sub_23AAE40B0();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = sub_23AAE40B0();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      MEMORY[0x23ECBF670](v9, a2);
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = sub_23AAE40B0();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23AADC59C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_23AADC650(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_23AADC6A4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t (*sub_23AADC710())()
{
  return j__swift_endAccess;
}

id CACLanguageViewBridge.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

char *CACLanguageViewBridge.init()()
{
  uint64_t v1 = OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_model;
  type metadata accessor for CACUILanguageViewModel();
  swift_allocObject();
  uint64_t v2 = v0;
  *(void *)&v0[v1] = sub_23AAE0FA8(MEMORY[0x263F8EE78]);
  *(void *)&v2[OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate] = 0;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CACLanguageViewBridge();
  uint64_t v3 = (char *)objc_msgSendSuper2(&v6, sel_init);
  *(void *)(*(void *)&v3[OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_model]
            + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate) = v3;
  unint64_t v4 = v3;
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_23AADC890()
{
  swift_retain();
  sub_23AADAE44(0, (uint64_t)v2);
  id v0 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268A58940));
  return sub_23AAE3C50();
}

uint64_t sub_23AADC978(uint64_t a1)
{
  swift_retain();
  sub_23AADAE44(0, (uint64_t)v13);
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 16);
    if (v2)
    {
      sub_23AAD9F7C();
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v3 = a1 + 40;
      unint64_t v4 = (char *)MEMORY[0x263F8EE78];
      do
      {
        uint64_t v5 = sub_23AAE40F0();
        uint64_t v7 = v6;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v4 = sub_23AADD7F0(0, *((void *)v4 + 2) + 1, 1, v4);
        }
        unint64_t v9 = *((void *)v4 + 2);
        unint64_t v8 = *((void *)v4 + 3);
        if (v9 >= v8 >> 1) {
          unint64_t v4 = sub_23AADD7F0((char *)(v8 > 1), v9 + 1, 1, v4);
        }
        v3 += 16;
        *((void *)v4 + 2) = v9 + 1;
        uint64_t v10 = &v4[32 * v9];
        *((void *)v10 + 4) = v5;
        *((void *)v10 + 5) = v7;
        *((void *)v10 + 6) = 0;
        v10[56] = 1;
        --v2;
      }
      while (v2);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_retain();
      unint64_t v4 = (char *)MEMORY[0x263F8EE78];
    }
    sub_23AAE23F4((uint64_t)v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  id v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_268A58940));
  return sub_23AAE3C50();
}

uint64_t sub_23AADCBF0()
{
  return sub_23AAE3AE0();
}

void sub_23AADCCD8(void *a1)
{
  uint64_t v2 = sub_23AADD8FC(a1);
  if (v2)
  {
    uint64_t v3 = (uint64_t)v2;
    swift_retain();
    sub_23AAE23F4(v3);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_23AAE4080();
    sub_23AAE4120();
    swift_bridgeObjectRelease();
    id v4 = objc_msgSend(a1, sel_description);
    sub_23AAE3F90();

    sub_23AAE3FE0();
    swift_bridgeObjectRelease();
    sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
    id v11 = (id)sub_23AAE40C0();
    if (qword_268A585F8 != -1) {
      swift_once();
    }
    unint64_t v5 = qword_268A58920;
    swift_bridgeObjectRetain();
    char v6 = sub_23AADC3B8((uint64_t)v11, v5);
    swift_bridgeObjectRelease();
    if (v6)
    {
      uint64_t v7 = sub_23AAE3FA0();
      uint64_t v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_23AAE4830;
      *(void *)(v10 + 56) = MEMORY[0x263F8D310];
      *(void *)(v10 + 64) = sub_23AAD9FF0();
      *(void *)(v10 + 32) = v7;
      *(void *)(v10 + 40) = v9;
      sub_23AAE3A90();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_23AADCFB8(void *a1)
{
  uint64_t result = sub_23AADE408(a1);
  if (v2)
  {
    uint64_t v5 = result;
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    char v8 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58948);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23AAE4830;
    *(void *)(inited + 32) = v5;
    *(void *)(inited + 40) = v6;
    *(void *)(inited + 48) = v7;
    *(unsigned char *)(inited + 56) = v8 & 1;
    swift_retain();
    sub_23AAE23F4(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    return swift_release();
  }
  return result;
}

id CACLanguageViewBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CACLanguageViewBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall CACLanguageViewBridge.downloadLanguage(withIdentifier:)(Swift::String withIdentifier)
{
}

uint64_t sub_23AADD270(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = sub_23AAE3F90();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CACLanguageViewBridge.cancelDownload(withIdentifier:)(Swift::String withIdentifier)
{
}

Swift::Void __swiftcall CACLanguageViewBridge.selectedLanguage(withIdentifier:)(Swift::String withIdentifier)
{
}

uint64_t sub_23AADD344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  sub_23AAE4050();
  if (qword_268A585F0 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_268A59260;
  sub_23AAE4120();
  swift_bridgeObjectRelease();
  sub_23AAE3FE0();
  if (qword_268A585F8 != -1) {
    swift_once();
  }
  unint64_t v9 = qword_268A58920;
  swift_bridgeObjectRetain();
  char v10 = sub_23AADC3B8(v8, v9);
  swift_bridgeObjectRelease();
  if (v10)
  {
    uint64_t v11 = sub_23AAE3FA0();
    uint64_t v13 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_23AAE4830;
    *(void *)(v14 + 56) = MEMORY[0x263F8D310];
    *(void *)(v14 + 64) = sub_23AAD9FF0();
    *(void *)(v14 + 32) = v11;
    *(void *)(v14 + 40) = v13;
    sub_23AAE3A90();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v15 = (void **)(v6 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  uint64_t result = swift_beginAccess();
  uint64_t v17 = *v15;
  if (v17)
  {
    swift_unknownObjectRetain();
    uint64_t v18 = (void *)sub_23AAE3F80();
    objc_msgSend(v17, *a6, v18);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23AADD580(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = MEMORY[0x263F8EE78];
  sub_23AAE2B94(0, v2, 0);
  uint64_t v3 = v12;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_23AADC160(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_23AAE2B94(0, *(void *)(v3 + 16) + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = *(void *)(v3 + 16);
      unint64_t v5 = *(void *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_23AAE2B94((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v3 = v12;
      }
      *(void *)(v3 + 16) = v6 + 1;
      uint64_t v7 = v3 + 16 * v6;
      *(void *)(v7 + 32) = v9;
      *(void *)(v7 + 40) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t type metadata accessor for CACLanguageViewBridge()
{
  return self;
}

uint64_t sub_23AADD6EC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_23AADD76C()
{
  return sub_23AAE3AE0();
}

char *sub_23AADD7F0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58948);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23AADD8FC(void *a1)
{
  id v1 = objc_msgSend(a1, sel_allKeys);
  uint64_t v2 = sub_23AAE4010();

  uint64_t v3 = sub_23AADD580(v2);
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return (char *)MEMORY[0x263F8EE78];
  }
  char v5 = (unint64_t *)(v3 + 40);
  unint64_t v6 = (char *)MEMORY[0x263F8EE78];
  do
  {
    unint64_t v11 = *(v5 - 1);
    unint64_t v12 = *v5;
    swift_bridgeObjectRetain();
    uint64_t v13 = (void *)sub_23AAE3F80();
    id v14 = objc_msgSend(a1, sel_objectForKey_, v13);

    if (v14)
    {
      sub_23AAE4100();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v29, 0, sizeof(v29));
    }
    sub_23AADEE88((uint64_t)v29, (uint64_t)&v30);
    if (v32)
    {
      if (swift_dynamicCast())
      {
        unint64_t v30 = v11;
        unint64_t v31 = v12;
        *(void *)&v29[0] = 95;
        *((void *)&v29[0] + 1) = 0xE100000000000000;
        sub_23AAD9F7C();
        uint64_t v15 = sub_23AAE40F0();
        uint64_t v17 = v16;
        swift_bridgeObjectRelease();
        if (sub_23AAE4000())
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = 2;
        }
        else if (sub_23AAE4000())
        {
          swift_bridgeObjectRelease();
          uint64_t v18 = 1;
        }
        else
        {
          char v23 = sub_23AAE4000();
          swift_bridgeObjectRelease();
          uint64_t v18 = v23 & 1;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          unint64_t v6 = sub_23AADD7F0(0, *((void *)v6 + 2) + 1, 1, v6);
        }
        unint64_t v25 = *((void *)v6 + 2);
        unint64_t v24 = *((void *)v6 + 3);
        if (v25 >= v24 >> 1) {
          unint64_t v6 = sub_23AADD7F0((char *)(v24 > 1), v25 + 1, 1, v6);
        }
        *((void *)v6 + 2) = v25 + 1;
        uint64_t v26 = &v6[32 * v25];
        *((void *)v26 + 4) = v15;
        *((void *)v26 + 5) = v17;
        *((void *)v26 + 6) = v18;
        v26[56] = 1;
        goto LABEL_5;
      }
    }
    else
    {
      sub_23AADEEF0((uint64_t)&v30);
    }
    sub_23AAE4060();
    unint64_t v30 = 0;
    unint64_t v31 = 0xE000000000000000;
    sub_23AAE4120();
    swift_bridgeObjectRelease();
    unint64_t v30 = 0xD000000000000015;
    unint64_t v31 = 0x800000023AAE71D0;
    sub_23AAE3FE0();
    swift_bridgeObjectRelease();
    sub_23AAE3FE0();
    id v19 = objc_msgSend(a1, sel_description);
    sub_23AAE3F90();

    sub_23AAE3FE0();
    swift_bridgeObjectRelease();
    sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
    uint64_t v20 = (void *)sub_23AAE40C0();
    if (qword_268A585F8 != -1) {
      swift_once();
    }
    unint64_t v21 = qword_268A58920;
    swift_bridgeObjectRetain();
    char v22 = sub_23AADC3B8((uint64_t)v20, v21);
    swift_bridgeObjectRelease();
    if (v22)
    {
      uint64_t v7 = sub_23AAE3FA0();
      uint64_t v9 = v8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
      uint64_t v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_23AAE4830;
      *(void *)(v10 + 56) = MEMORY[0x263F8D310];
      *(void *)(v10 + 64) = sub_23AAD9FF0();
      *(void *)(v10 + 32) = v7;
      *(void *)(v10 + 40) = v9;
      sub_23AAE3A90();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
LABEL_5:
    v5 += 2;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v6;
}

unint64_t sub_23AADDE00(void *a1)
{
  uint64_t v2 = (void *)sub_23AAE3F80();
  id v3 = objc_msgSend(a1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_23AAE4100();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_23AADEE88((uint64_t)&v31, (uint64_t)&v33);
  if (!*((void *)&v34 + 1)) {
    goto LABEL_15;
  }
  sub_23AADEF50(0, &qword_268A58958);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  objc_msgSend(v30, sel_floatValue);
  float v5 = v4;

  unint64_t v6 = (void *)sub_23AAE3F80();
  id v7 = objc_msgSend(a1, sel_objectForKey_, v6);

  if (v7)
  {
    sub_23AAE4100();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_23AADEE88((uint64_t)&v31, (uint64_t)&v33);
  if (*((void *)&v34 + 1))
  {
    if (swift_dynamicCast())
    {
      objc_msgSend(v30, sel_floatValue);
      float v9 = v8;

      if (v5 > 0.0 && v9 >= 0.0)
      {
        uint64_t v10 = (void *)sub_23AAE3F80();
        id v11 = objc_msgSend(a1, sel_objectForKey_, v10);

        if (v11)
        {
          sub_23AAE4100();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v31 = 0u;
          long long v32 = 0u;
        }
        sub_23AADEE88((uint64_t)&v31, (uint64_t)&v33);
        if (*((void *)&v34 + 1))
        {
          if (swift_dynamicCast())
          {
            objc_msgSend(v30, sel_floatValue);
            float v20 = v19;

            if (v20 >= 0.0) {
              return COERCE_UNSIGNED_INT(v9 / v5) | ((unint64_t)LODWORD(v20) << 32);
            }
          }
        }
        else
        {
          sub_23AADEEF0((uint64_t)&v33);
        }
        sub_23AAE4060();
        *(void *)&long long v33 = 0;
        *((void *)&v33 + 1) = 0xE000000000000000;
        sub_23AAE4120();
        swift_bridgeObjectRelease();
        strcpy((char *)&v31, "Issue in time ");
        HIBYTE(v31) = -18;
        char v22 = (void *)sub_23AAE3F80();
        id v23 = objc_msgSend(a1, sel_objectForKey_, v22);

        if (v23)
        {
          sub_23AAE4100();
          swift_unknownObjectRelease();
        }
        else
        {
          long long v33 = 0u;
          long long v34 = 0u;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58950);
        sub_23AAE3FC0();
        sub_23AAE3FE0();
        swift_bridgeObjectRelease();
        sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
        unint64_t v12 = (void *)sub_23AAE40C0();
        if (qword_268A585F8 != -1) {
          swift_once();
        }
        unint64_t v24 = qword_268A58920;
        swift_bridgeObjectRetain();
        char v25 = sub_23AADC3B8((uint64_t)v12, v24);
        swift_bridgeObjectRelease();
        if (v25)
        {
          uint64_t v26 = sub_23AAE3FA0();
          uint64_t v28 = v27;
          __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
          uint64_t v29 = swift_allocObject();
          *(_OWORD *)(v29 + 16) = xmmword_23AAE4830;
          *(void *)(v29 + 56) = MEMORY[0x263F8D310];
          *(void *)(v29 + 64) = sub_23AAD9FF0();
          *(void *)(v29 + 32) = v26;
          *(void *)(v29 + 40) = v28;
          sub_23AAE3A90();
          swift_bridgeObjectRelease();

          goto LABEL_20;
        }
        swift_bridgeObjectRelease();
LABEL_35:

        return 0;
      }
    }
  }
  else
  {
LABEL_15:
    sub_23AADEEF0((uint64_t)&v33);
  }
LABEL_16:
  sub_23AAE4060();
  sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
  unint64_t v12 = (void *)sub_23AAE40C0();
  if (qword_268A585F8 != -1) {
    swift_once();
  }
  unint64_t v13 = qword_268A58920;
  swift_bridgeObjectRetain();
  char v14 = sub_23AADC3B8((uint64_t)v12, v13);
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0) {
    goto LABEL_35;
  }
  uint64_t v15 = sub_23AAE3FA0();
  uint64_t v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_23AAE4830;
  *(void *)(v18 + 56) = MEMORY[0x263F8D310];
  *(void *)(v18 + 64) = sub_23AAD9FF0();
  *(void *)(v18 + 32) = v15;
  *(void *)(v18 + 40) = v17;
  sub_23AAE3A90();

LABEL_20:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_23AADE408(void *a1)
{
  *(void *)&long long v27 = 0x65676175676E614CLL;
  *((void *)&v27 + 1) = 0xE800000000000000;
  uint64_t v2 = MEMORY[0x263F8D310];
  id v3 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_23AAE41A0());
  swift_unknownObjectRelease();
  if (v3)
  {
    sub_23AAE4100();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  sub_23AADEE88((uint64_t)&v27, (uint64_t)&v29);
  if (!v31)
  {
    sub_23AADEEF0((uint64_t)&v29);
    goto LABEL_9;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_9:
    sub_23AAE4060();
    unint64_t v29 = 0;
    unint64_t v30 = 0xE000000000000000;
    sub_23AAE4120();
    sub_23AAE3FE0();
    id v6 = objc_msgSend(a1, sel_description);
    goto LABEL_10;
  }
  *(void *)&long long v27 = 0x6573616850;
  *((void *)&v27 + 1) = 0xE500000000000000;
  uint64_t v4 = MEMORY[0x263F8D310];
  id v5 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_23AAE41A0());
  swift_unknownObjectRelease();
  if (v5)
  {
    sub_23AAE4100();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
  }
  sub_23AADEE88((uint64_t)&v27, (uint64_t)&v29);
  if (v31)
  {
    uint64_t v2 = MEMORY[0x263F8D310];
    if (swift_dynamicCast())
    {
      if (v25 == 1701602377 && v26 == 0xE400000000000000
        || (sub_23AAE4190() & 1) != 0
        || v25 == 0x64656C6C617453 && v26 == 0xE700000000000000
        || (sub_23AAE4190() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      if (v25 == 0x656C6C65636E6143 && v26 == 0xE900000000000064
        || (sub_23AAE4190() & 1) != 0
        || v25 == 0x64616F6C6E776F44 && v26 == 0xEA00000000006465
        || (sub_23AAE4190() & 1) != 0)
      {
        goto LABEL_41;
      }
      if ((v25 != 0x64616F6C6E776F44 || v26 != 0xEB00000000676E69) && (sub_23AAE4190() & 1) == 0)
      {
        if (v25 == 0x64616F6C6E776F44 && v26 == 0xEE0064656C696146 || (sub_23AAE4190() & 1) != 0)
        {
LABEL_41:
          swift_bridgeObjectRelease();
LABEL_42:
          unint64_t v29 = v25;
          unint64_t v30 = v26;
          *(void *)&long long v27 = 95;
          *((void *)&v27 + 1) = 0xE100000000000000;
          sub_23AAD9F7C();
          uint64_t v22 = sub_23AAE40F0();
          swift_bridgeObjectRelease();
          return v22;
        }
        swift_bridgeObjectRelease();
        sub_23AAE4070();
        unint64_t v29 = 0;
        unint64_t v30 = 0xE000000000000000;
        sub_23AAE4120();
        swift_bridgeObjectRelease();
        unint64_t v29 = 0xD000000000000024;
        unint64_t v30 = 0x800000023AAE7150;
        goto LABEL_11;
      }
      swift_bridgeObjectRelease();
      sub_23AADDE00(a1);
      if ((v24 & 1) == 0) {
        goto LABEL_42;
      }
      swift_bridgeObjectRelease();
      sub_23AAE4060();
      unint64_t v29 = 0;
      unint64_t v30 = 0xE000000000000000;
      sub_23AAE4120();
      swift_bridgeObjectRelease();
      unint64_t v29 = 0xD00000000000002ALL;
      unint64_t v30 = 0x800000023AAE7180;
      id v6 = objc_msgSend(a1, sel_description);
LABEL_10:
      id v7 = v6;
      sub_23AAE3F90();

LABEL_11:
      sub_23AAE3FE0();
      swift_bridgeObjectRelease();
      sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
      float v8 = (void *)sub_23AAE40C0();
      if (qword_268A585F8 != -1) {
        swift_once();
      }
      unint64_t v9 = qword_268A58920;
      swift_bridgeObjectRetain();
      char v10 = sub_23AADC3B8((uint64_t)v8, v9);
      swift_bridgeObjectRelease();
      if (v10)
      {
        uint64_t v11 = sub_23AAE3FA0();
        uint64_t v13 = v12;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_23AAE4830;
        *(void *)(v14 + 56) = v2;
        *(void *)(v14 + 64) = sub_23AAD9FF0();
        *(void *)(v14 + 32) = v11;
        *(void *)(v14 + 40) = v13;
        sub_23AAE3A90();
        swift_bridgeObjectRelease();

LABEL_34:
        swift_bridgeObjectRelease();
        return 0;
      }
      swift_bridgeObjectRelease();

      return 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23AADEEF0((uint64_t)&v29);
  }
  sub_23AAE4060();
  sub_23AADEF50(0, (unint64_t *)&qword_268A58798);
  uint64_t v15 = (void *)sub_23AAE40C0();
  if (qword_268A585F8 != -1) {
    swift_once();
  }
  unint64_t v16 = qword_268A58920;
  swift_bridgeObjectRetain();
  char v17 = sub_23AADC3B8((uint64_t)v15, v16);
  swift_bridgeObjectRelease();
  if (v17)
  {
    uint64_t v18 = sub_23AAE3FA0();
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_23AAE4830;
    *(void *)(v21 + 56) = v4;
    *(void *)(v21 + 64) = sub_23AAD9FF0();
    *(void *)(v21 + 32) = v18;
    *(void *)(v21 + 40) = v20;
    sub_23AAE3A90();

    goto LABEL_34;
  }

  return 0;
}

uint64_t sub_23AADEC74@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = (void *)(*a1 + OBJC_IVAR____TtC19CommandAndControlUI21CACLanguageViewBridge_delegate);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for CACLanguageViewBridge(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CACLanguageViewBridge);
}

uint64_t dispatch thunk of CACLanguageViewBridge.delegate.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.delegate.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.delegate.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.makeLanguageUI()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.makeLanguageUI(withLocales:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.setSelected(languageIdentifier:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.updateInstallationStatus(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of CACLanguageViewBridge.updateDownloadStatus(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t sub_23AADEE88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23AADEEF0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58950);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23AADEF50(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23AADEF8C()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for CACUILocaleUtilities()
{
  return self;
}

uint64_t destroy for CACUILanguageData()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CACUILanguageData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CACUILanguageData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CACUILanguageData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for CACUILanguageData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 25)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CACUILanguageData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 25) = 1;
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
    *(unsigned char *)(result + 25) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageData()
{
  return &type metadata for CACUILanguageData;
}

uint64_t sub_23AADF160()
{
  return MEMORY[0x263F8D320];
}

uint64_t sub_23AADF16C()
{
  return sub_23AAE41E0();
}

uint64_t sub_23AADF1DC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return sub_23AAE41C0();
  }
  sub_23AAE41C0();
  sub_23AAE41D0();
  return sub_23AAE41D0();
}

uint64_t sub_23AADF298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5) {
    return sub_23AAE41C0();
  }
  sub_23AAE41C0();
  sub_23AAE41D0();
  return sub_23AAE41D0();
}

uint64_t sub_23AADF388(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    sub_23AAE41D0();
    sub_23AAE41D0();
  }
  return sub_23AAE41E0();
}

BOOL sub_23AADF4A4(float *a1, float *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_23AADF4D0()
{
  return sub_23AADF16C();
}

uint64_t sub_23AADF4D8()
{
  return sub_23AAE41D0();
}

uint64_t sub_23AADF520()
{
  return sub_23AAE41E0();
}

uint64_t sub_23AADF580(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *(void *)a2;
  if (*((unsigned char *)a1 + 8) == 1)
  {
    switch(v2)
    {
      case 1:
        BOOL v4 = v3 == 1;
        goto LABEL_15;
      case 2:
        BOOL v4 = v3 == 2;
        goto LABEL_15;
      case 3:
        if (v3 > 2) {
          int v6 = *(unsigned __int8 *)(a2 + 8);
        }
        else {
          int v6 = 0;
        }
        if (v6 != 1) {
          return 0;
        }
        goto LABEL_19;
      default:
        BOOL v4 = v3 == 0;
LABEL_15:
        if (v4) {
          char v7 = *(unsigned char *)(a2 + 8);
        }
        else {
          char v7 = 0;
        }
        if ((v7 & 1) == 0) {
          return 0;
        }
LABEL_19:
        uint64_t result = 1;
        break;
    }
  }
  else if (*(unsigned char *)(a2 + 8))
  {
    return 0;
  }
  else
  {
    LODWORD(v3) = *(float *)&v2 == *(float *)&v3;
    if (*((float *)&v2 + 1) == *((float *)&v3 + 1)) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_23AADF634()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_23AAE41B0();
  sub_23AADF1DC((uint64_t)v4, v1, v2);
  return sub_23AAE41E0();
}

uint64_t sub_23AADF684(uint64_t a1)
{
  return sub_23AADF1DC(a1, *(void *)v1, *(unsigned char *)(v1 + 8));
}

uint64_t sub_23AADF690()
{
  uint64_t v1 = *(void *)v0;
  char v2 = *(unsigned char *)(v0 + 8);
  sub_23AAE41B0();
  sub_23AADF1DC((uint64_t)v4, v1, v2);
  return sub_23AAE41E0();
}

BOOL sub_23AADF6DC(uint64_t a1, uint64_t a2)
{
  return sub_23AADF89C(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24), *(void *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), *(unsigned char *)(a2 + 24));
}

uint64_t sub_23AADF700()
{
  return sub_23AADF388(*(void *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_23AADF710(uint64_t a1)
{
  return sub_23AADF298(a1, *(void *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_23AADF720()
{
  int v1 = *(unsigned __int8 *)(v0 + 24);
  sub_23AAE41B0();
  swift_bridgeObjectRetain();
  sub_23AAE3FD0();
  swift_bridgeObjectRelease();
  sub_23AAE41C0();
  if (v1 != 1)
  {
    sub_23AAE41D0();
    sub_23AAE41D0();
  }
  return sub_23AAE41E0();
}

uint64_t sub_23AADF838@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_23AADF848()
{
  unint64_t result = qword_268A58960;
  if (!qword_268A58960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58960);
  }
  return result;
}

BOOL sub_23AADF89C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, unint64_t a7, char a8)
{
  if (a1 == a5 && a2 == a6 || (v12 = sub_23AAE4190(), BOOL result = 0, (v12 & 1) != 0))
  {
    if (a4)
    {
      switch(a3)
      {
        case 1:
          return (a8 & 1) != 0 && a7 == 1;
        case 2:
          return (a8 & 1) != 0 && a7 == 2;
        case 3:
          return (a8 & 1) != 0 && a7 > 2;
        default:
          return (a8 & 1) != 0 && !a7;
      }
    }
    return (a8 & 1) == 0 && *(float *)&a3 == *(float *)&a7 && *((float *)&a3 + 1) == *((float *)&a7 + 1);
  }
  return result;
}

uint64_t __swift_memcpy9_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)BOOL result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACUILanguageData.InstallationStatus(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CACUILanguageData.InstallationStatus(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)BOOL result = (a2 - 1);
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

uint64_t sub_23AADFA08(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_23AADFA24(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)BOOL result = (a2 - 1);
    *(unsigned char *)(result + 8) = 1;
  }
  else
  {
    *(unsigned char *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for CACUILanguageData.InstallationStatus()
{
  return &type metadata for CACUILanguageData.InstallationStatus;
}

unint64_t sub_23AADFA58()
{
  unint64_t result = qword_268A58968;
  if (!qword_268A58968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58968);
  }
  return result;
}

void *__swift_memcpy8_4(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACUILanguageData.InstallationStatus.DownloadProgress(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CACUILanguageData.InstallationStatus.DownloadProgress(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CACUILanguageData.InstallationStatus.DownloadProgress()
{
  return &type metadata for CACUILanguageData.InstallationStatus.DownloadProgress;
}

unint64_t sub_23AADFB14()
{
  unint64_t result = qword_268A58970;
  if (!qword_268A58970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58970);
  }
  return result;
}

ValueMetadata *type metadata accessor for DownloadProgressView()
{
  return &type metadata for DownloadProgressView;
}

uint64_t sub_23AADFB78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23AADFB94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23AAE3E40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v6 = self;
  id v7 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v7, sel_scaledValueForValue_, 2.0);

  sub_23AAE3B10();
  uint64_t v8 = v56;
  uint64_t v9 = v57;
  uint64_t v10 = v58;
  uint64_t v11 = v59;
  uint64_t v12 = v60;
  id v13 = objc_msgSend(self, sel_secondarySystemFillColor);
  uint64_t v14 = MEMORY[0x23ECBF350](v13);
  uint64_t KeyPath = swift_getKeyPath();
  double v16 = COERCE_DOUBLE(sub_23AAE3CA0());
  uint64_t v49 = v11;
  uint64_t v48 = v8;
  uint64_t v47 = v9;
  uint64_t v46 = v10;
  uint64_t v45 = v12;
  if (v17)
  {
    uint64_t v18 = 0x3FB999999999999ALL;
  }
  else
  {
    uint64_t v18 = *(void *)&v16;
    if (v16 < 0.1) {
      uint64_t v18 = 0x3FB999999999999ALL;
    }
  }
  id v19 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v19, sel_scaledValueForValue_, 2.0);

  sub_23AAE3B10();
  uint64_t v20 = v61;
  uint64_t v21 = v63;
  uint64_t v22 = v64;
  uint64_t v23 = v65;
  uint64_t v44 = sub_23AAE3EE0();
  uint64_t v43 = sub_23AAE3CA0();
  char v25 = v24;
  sub_23AAE3F00();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  sub_23AAE3E30();
  uint64_t v30 = v62;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B4C0], v2);
  uint64_t v42 = sub_23AAE3E50();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v31 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v31, sel_scaledValueForValue_, 8.0);

  id v32 = objc_msgSend(v6, sel_defaultMetrics);
  objc_msgSend(v32, sel_scaledValueForValue_, 8.0);

  sub_23AAE3ED0();
  sub_23AAE3B40();
  uint64_t v33 = v66;
  char v34 = v67;
  uint64_t v35 = v68;
  char v36 = v69;
  char v55 = v25 & 1;
  char v53 = v67;
  char v51 = v69;
  *(_DWORD *)(a1 + 129) = *(_DWORD *)v54;
  *(_DWORD *)(a1 + 132) = *(_DWORD *)&v54[3];
  *(_DWORD *)(a1 + 177) = *(_DWORD *)v52;
  *(_DWORD *)(a1 + 180) = *(_DWORD *)&v52[3];
  int v37 = *(_DWORD *)v50;
  *(_DWORD *)(a1 + 196) = *(_DWORD *)&v50[3];
  *(_DWORD *)(a1 + 193) = v37;
  uint64_t v38 = v47;
  *(void *)a1 = v48;
  *(void *)(a1 + 8) = v38;
  *(void *)(a1 + 16) = v46;
  *(void *)(a1 + 24) = v49;
  *(void *)(a1 + 32) = v45;
  *(void *)(a1 + 40) = KeyPath;
  *(void *)(a1 + 48) = v14;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v18;
  *(void *)(a1 + 72) = v20;
  *(void *)(a1 + 80) = v30;
  *(void *)(a1 + 88) = v21;
  *(void *)(a1 + 96) = v22;
  *(void *)(a1 + 104) = v23;
  uint64_t v39 = v43;
  *(void *)(a1 + 112) = v44;
  *(void *)(a1 + 120) = v39;
  *(unsigned char *)(a1 + 128) = v25 & 1;
  *(void *)(a1 + 136) = 0xBFF921FB54442D18;
  *(void *)(a1 + 144) = v27;
  *(void *)(a1 + 152) = v29;
  *(void *)(a1 + 160) = v42;
  *(void *)(a1 + 168) = v33;
  *(unsigned char *)(a1 + 176) = v34;
  *(void *)(a1 + 184) = v35;
  *(unsigned char *)(a1 + 192) = v36;
  *(_OWORD *)(a1 + 200) = v70;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

double sub_23AAE0084@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_23AAE3ED0();
  uint64_t v4 = v3;
  sub_23AADFB94((uint64_t)v12);
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  long long v5 = v12[11];
  *(_OWORD *)(a1 + 176) = v12[10];
  *(_OWORD *)(a1 + 192) = v5;
  *(_OWORD *)(a1 + 208) = v12[12];
  *(void *)(a1 + 224) = v13;
  long long v6 = v12[7];
  *(_OWORD *)(a1 + 112) = v12[6];
  *(_OWORD *)(a1 + 128) = v6;
  long long v7 = v12[9];
  *(_OWORD *)(a1 + 144) = v12[8];
  *(_OWORD *)(a1 + 160) = v7;
  long long v8 = v12[3];
  *(_OWORD *)(a1 + 48) = v12[2];
  *(_OWORD *)(a1 + 64) = v8;
  long long v9 = v12[5];
  *(_OWORD *)(a1 + 80) = v12[4];
  *(_OWORD *)(a1 + 96) = v9;
  double result = *(double *)v12;
  long long v11 = v12[1];
  *(_OWORD *)(a1 + 16) = v12[0];
  *(_OWORD *)(a1 + 32) = v11;
  return result;
}

uint64_t sub_23AAE0134@<X0>(uint64_t a1@<X8>, float a2@<S0>)
{
  uint64_t v43 = a1;
  uint64_t v3 = sub_23AAE3E40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58978);
  MEMORY[0x270FA5388](v42);
  long long v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58668);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58980);
  uint64_t v39 = *(void *)(v13 - 8);
  uint64_t v40 = v13;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58988);
  uint64_t v16 = MEMORY[0x270FA5388](v41);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v39 - v19;
  if (a2 == 0.0)
  {
    sub_23AAE3E30();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B4C0], v3);
    uint64_t v21 = sub_23AAE3E50();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_23AAE3CE0();
    sub_23AAE3D00();
    uint64_t v22 = sub_23AAE3D10();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    char v24 = self;
    id v25 = objc_msgSend(v24, sel_defaultMetrics);
    objc_msgSend(v25, sel_scaledValueForValue_, 22.0);

    id v26 = objc_msgSend(v24, sel_defaultMetrics);
    objc_msgSend(v26, sel_scaledValueForValue_, 22.0);

    sub_23AAE3ED0();
    sub_23AAE3B40();
    uint64_t v27 = v45;
    char v28 = BYTE8(v45);
    uint64_t v29 = v46;
    char v30 = BYTE8(v46);
    *(void *)long long v8 = v21;
    *((void *)v8 + 1) = KeyPath;
    *((void *)v8 + 2) = v22;
    *((void *)v8 + 3) = v27;
    v8[32] = v28;
    *((void *)v8 + 5) = v29;
    v8[48] = v30;
    *(_OWORD *)(v8 + 56) = v47;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A589A0);
    sub_23AAE08F0();
    sub_23AAE09E0();
    return sub_23AAE3C60();
  }
  else
  {
    *(float *)&long long v45 = a2;
    BYTE4(v45) = 0;
    int v44 = 1065353216;
    sub_23AAE0778();
    sub_23AAE3B20();
    sub_23AADBF84(&qword_268A58680, &qword_268A58668);
    sub_23AAE07CC();
    sub_23AAE3D90();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    id v32 = self;
    id v33 = objc_msgSend(v32, sel_defaultMetrics);
    objc_msgSend(v33, sel_scaledValueForValue_, 22.0);

    id v34 = objc_msgSend(v32, sel_defaultMetrics);
    objc_msgSend(v34, sel_scaledValueForValue_, 22.0);

    sub_23AAE3ED0();
    sub_23AAE3B40();
    uint64_t v36 = v39;
    uint64_t v35 = v40;
    (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v18, v15, v40);
    int v37 = &v18[*(int *)(v41 + 36)];
    long long v38 = v46;
    *(_OWORD *)int v37 = v45;
    *((_OWORD *)v37 + 1) = v38;
    *((_OWORD *)v37 + 2) = v47;
    (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v35);
    sub_23AAE0820((uint64_t)v18, (uint64_t)v20);
    sub_23AAE0888((uint64_t)v20, (uint64_t)v8);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A589A0);
    sub_23AAE08F0();
    sub_23AAE09E0();
    sub_23AAE3C60();
    return sub_23AAE0A5C((uint64_t)v20);
  }
}

uint64_t sub_23AAE0770@<X0>(uint64_t a1@<X8>)
{
  return sub_23AAE0134(a1, *v1);
}

unint64_t sub_23AAE0778()
{
  unint64_t result = qword_268A58990;
  if (!qword_268A58990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58990);
  }
  return result;
}

unint64_t sub_23AAE07CC()
{
  unint64_t result = qword_268A58998;
  if (!qword_268A58998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58998);
  }
  return result;
}

uint64_t sub_23AAE0820(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23AAE0888(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_23AAE08F0()
{
  unint64_t result = qword_268A589A8;
  if (!qword_268A589A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58988);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58668);
    sub_23AADBF84(&qword_268A58680, &qword_268A58668);
    sub_23AAE07CC();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A589A8);
  }
  return result;
}

unint64_t sub_23AAE09E0()
{
  unint64_t result = qword_268A589B0;
  if (!qword_268A589B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A589A0);
    sub_23AADB6B0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A589B0);
  }
  return result;
}

uint64_t sub_23AAE0A5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58988);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DownloadProgressStyle()
{
  return &type metadata for DownloadProgressStyle;
}

unint64_t sub_23AAE0AD8()
{
  unint64_t result = qword_268A589B8;
  if (!qword_268A589B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A589C0);
    sub_23AAE08F0();
    sub_23AAE09E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A589B8);
  }
  return result;
}

uint64_t sub_23AAE0B54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23AAE0B70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23AAE3B60();
  *a1 = result;
  return result;
}

uint64_t sub_23AAE0B9C()
{
  return sub_23AAE3B70();
}

uint64_t sub_23AAE0BC8()
{
  return sub_23AADBF84(&qword_268A589C8, &qword_268A589D0);
}

uint64_t sub_23AAE0C04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23AAE0C78()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_23AAE0CEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  uint64_t v0 = *(void *)(v9 + 16);
  if (v0)
  {
    uint64_t v1 = (unsigned char *)(v9 + 56);
    uint64_t v2 = MEMORY[0x263F8EE78];
    do
    {
      if (*v1 == 1 && *((void *)v1 - 1) == 2)
      {
        uint64_t v7 = *((void *)v1 - 3);
        uint64_t v6 = *((void *)v1 - 2);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_23AAE2B74(0, *(void *)(v2 + 16) + 1, 1);
        }
        unint64_t v4 = *(void *)(v2 + 16);
        unint64_t v3 = *(void *)(v2 + 24);
        if (v4 >= v3 >> 1) {
          sub_23AAE2B74((char *)(v3 > 1), v4 + 1, 1);
        }
        *(void *)(v2 + 16) = v4 + 1;
        uint64_t v5 = v2 + 32 * v4;
        *(void *)(v5 + 32) = v7;
        *(void *)(v5 + 40) = v6;
        *(void *)(v5 + 48) = 2;
        *(unsigned char *)(v5 + 56) = 1;
      }
      v1 += 32;
      --v0;
    }
    while (v0);
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_23AAE0E50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  uint64_t v0 = *(void *)(v12 + 16);
  if (v0)
  {
    uint64_t v1 = (unsigned __int8 *)(v12 + 56);
    uint64_t v2 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v6 = *((void *)v1 - 1);
      int v7 = *v1;
      if (v7 != 1 || v6 != 2)
      {
        uint64_t v10 = *((void *)v1 - 3);
        uint64_t v9 = *((void *)v1 - 2);
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_23AAE2B74(0, *(void *)(v2 + 16) + 1, 1);
        }
        unint64_t v4 = *(void *)(v2 + 16);
        unint64_t v3 = *(void *)(v2 + 24);
        if (v4 >= v3 >> 1) {
          sub_23AAE2B74((char *)(v3 > 1), v4 + 1, 1);
        }
        *(void *)(v2 + 16) = v4 + 1;
        uint64_t v5 = v2 + 32 * v4;
        *(void *)(v5 + 32) = v10;
        *(void *)(v5 + 40) = v9;
        *(void *)(v5 + 48) = v6;
        *(unsigned char *)(v5 + 56) = v7;
      }
      v1 += 32;
      --v0;
    }
    while (v0);
  }
  else
  {
    uint64_t v2 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_23AAE0FA8(char *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A30);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A28);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = v1 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__languages;
  v16[0] = (char *)MEMORY[0x263F8EE78];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58778);
  sub_23AAE3AB0();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 32))(v11, v10, v7);
  uint64_t v12 = v1 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__selectedLanguageIdentifier;
  v16[0] = 0;
  v16[1] = (char *)0xE000000000000000;
  sub_23AAE3AB0();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v4 + 32))(v12, v6, v3);
  *(void *)(v1 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate) = 0;
  v16[0] = a1;
  swift_bridgeObjectRetain();
  sub_23AAE2DBC(v16);
  swift_bridgeObjectRelease();
  uint64_t v13 = v16[0];
  swift_getKeyPath();
  swift_getKeyPath();
  v16[0] = v13;
  swift_retain();
  sub_23AAE3AE0();
  return v1;
}

uint64_t sub_23AAE1200(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23AAE3F20();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v4);
  long long v45 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_23AAE3F40();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v43 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23AAE3F10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (uint64_t *)((char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_23AAE3F70();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v40 = (char *)&v38 - v15;
  LODWORD(v38) = sub_23AAE4050();
  if (qword_268A585F0 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_268A59260;
  strcpy((char *)&aBlock, "UI: Download ");
  HIWORD(aBlock) = -4864;
  uint64_t v39 = a1;
  uint64_t v17 = a2;
  sub_23AAE3FE0();
  if (qword_268A585F8 != -1) {
    swift_once();
  }
  unint64_t v18 = qword_268A58920;
  swift_bridgeObjectRetain();
  char v19 = sub_23AADC3B8(v16, v18);
  swift_bridgeObjectRelease();
  if (v19)
  {
    uint64_t v20 = sub_23AAE3FA0();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_23AAE4830;
    *(void *)(v23 + 56) = MEMORY[0x263F8D310];
    *(void *)(v23 + 64) = sub_23AAD9FF0();
    *(void *)(v23 + 32) = v20;
    *(void *)(v23 + 40) = v22;
    sub_23AAE3A90();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  char v24 = *(void **)(v49 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate);
  uint64_t v25 = v17;
  uint64_t v26 = v39;
  if (v24)
  {
    swift_unknownObjectRetain();
    uint64_t v27 = (void *)sub_23AAE3F80();
    objc_msgSend(v24, sel_downloadLanguageWithIdentifier_, v27, v38);

    swift_unknownObjectRelease();
  }
  sub_23AAE2A50();
  uint64_t v38 = sub_23AAE40A0();
  sub_23AAE3F50();
  *uint64_t v10 = 1;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F018], v7);
  char v28 = v40;
  sub_23AAE3F60();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v29 = v42;
  char v30 = *(void (**)(char *, uint64_t))(v41 + 8);
  v30(v14, v42);
  id v31 = (void *)swift_allocObject();
  v31[2] = v49;
  v31[3] = v26;
  v31[4] = v25;
  char v53 = sub_23AAE3A34;
  uint64_t v54 = v31;
  *(void *)&long long aBlock = MEMORY[0x263EF8330];
  *((void *)&aBlock + 1) = 1107296256;
  char v51 = sub_23AAE1A04;
  uint64_t v52 = &block_descriptor_23;
  id v32 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  id v33 = v43;
  sub_23AAE3F30();
  *(void *)&long long aBlock = MEMORY[0x263F8EE78];
  sub_23AAE2AB8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A18);
  sub_23AAE2B10();
  id v34 = v45;
  uint64_t v35 = v48;
  sub_23AAE4110();
  uint64_t v36 = (void *)v38;
  MEMORY[0x23ECBF5C0](v28, v33, v34, v32);
  _Block_release(v32);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v35);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v46);
  return ((uint64_t (*)(char *, uint64_t))v30)(v28, v29);
}

uint64_t sub_23AAE181C(void (*a1)(uint64_t *, void), uint64_t a2, uint64_t a3)
{
  swift_getKeyPath();
  uint64_t KeyPath = swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  unint64_t v9 = sub_23AAE395C(v18[0], a2, a3);
  LOBYTE(a2) = v10;
  uint64_t result = swift_bridgeObjectRelease();
  if (a2) {
    return result;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v9 >= *(void *)(v18[0] + 16))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    uint64_t result = (uint64_t)sub_23AAE3934(KeyPath);
    uint64_t KeyPath = result;
    *uint64_t v3 = result;
LABEL_9:
    if (v9 >= *(void *)(KeyPath + 16))
    {
      __break(1u);
    }
    else
    {
      uint64_t v17 = KeyPath + v4;
      *(void *)(v17 + 48) = 1;
      *(unsigned char *)(v17 + 56) = 1;
      a1(v18, 0);
      swift_release();
      return swift_release();
    }
    return result;
  }
  uint64_t v4 = 32 * v9;
  unint64_t v12 = v18[0] + 32 * v9;
  uint64_t v13 = *(void *)(v12 + 48);
  int v14 = *(unsigned __int8 *)(v12 + 56);
  uint64_t result = swift_bridgeObjectRelease();
  if (v14 == 1 && (unint64_t)(v13 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    a1 = (void (*)(uint64_t *, void))sub_23AAE3AC0();
    uint64_t v3 = v16;
    uint64_t KeyPath = *v16;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v3 = KeyPath;
    if (result) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_23AAE1A04(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_23AAE1A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23AAE3F20();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  MEMORY[0x270FA5388](v4);
  long long v45 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_23AAE3F40();
  uint64_t v44 = *(void *)(v46 - 8);
  MEMORY[0x270FA5388](v46);
  uint64_t v43 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23AAE3F10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v10 = (uint64_t *)((char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_23AAE3F70();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t v42 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  int v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v40 = (char *)&v38 - v15;
  LODWORD(v38) = sub_23AAE4050();
  if (qword_268A585F0 != -1) {
    swift_once();
  }
  uint64_t v16 = qword_268A59260;
  uint64_t aBlock = 0x636E6143203A4955;
  unint64_t v51 = 0xEB00000000206C65;
  uint64_t v39 = a1;
  uint64_t v17 = a2;
  sub_23AAE3FE0();
  if (qword_268A585F8 != -1) {
    swift_once();
  }
  unint64_t v18 = qword_268A58920;
  swift_bridgeObjectRetain();
  char v19 = sub_23AADC3B8(v16, v18);
  swift_bridgeObjectRelease();
  if (v19)
  {
    uint64_t v20 = sub_23AAE3FA0();
    uint64_t v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_23AAE4830;
    *(void *)(v23 + 56) = MEMORY[0x263F8D310];
    *(void *)(v23 + 64) = sub_23AAD9FF0();
    *(void *)(v23 + 32) = v20;
    *(void *)(v23 + 40) = v22;
    sub_23AAE3A90();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  char v24 = *(void **)(v49 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate);
  uint64_t v25 = v17;
  uint64_t v26 = v39;
  if (v24)
  {
    swift_unknownObjectRetain();
    uint64_t v27 = (void *)sub_23AAE3F80();
    objc_msgSend(v24, sel_cancelDownloadWithIdentifier_, v27, v38);

    swift_unknownObjectRelease();
  }
  sub_23AAE2A50();
  uint64_t v38 = sub_23AAE40A0();
  sub_23AAE3F50();
  *char v10 = 1;
  (*(void (**)(void *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F8F018], v7);
  char v28 = v40;
  sub_23AAE3F60();
  (*(void (**)(void *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v29 = v42;
  char v30 = *(void (**)(char *, uint64_t))(v41 + 8);
  v30(v14, v42);
  id v31 = (void *)swift_allocObject();
  v31[2] = v49;
  v31[3] = v26;
  v31[4] = v25;
  uint64_t v54 = sub_23AAE2A94;
  char v55 = v31;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v51 = 1107296256;
  uint64_t v52 = sub_23AAE1A04;
  char v53 = &block_descriptor;
  id v32 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  id v33 = v43;
  sub_23AAE3F30();
  uint64_t aBlock = MEMORY[0x263F8EE78];
  sub_23AAE2AB8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A18);
  sub_23AAE2B10();
  id v34 = v45;
  uint64_t v35 = v48;
  sub_23AAE4110();
  uint64_t v36 = (void *)v38;
  MEMORY[0x23ECBF5C0](v28, v33, v34, v32);
  _Block_release(v32);

  (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v35);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v46);
  return ((uint64_t (*)(char *, uint64_t))v30)(v28, v29);
}

uint64_t sub_23AAE2060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  unint64_t v5 = sub_23AAE395C(v13[0], a2, a3);
  LOBYTE(a2) = v6;
  uint64_t result = swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v8 = (void (*)(uint64_t *, void))sub_23AAE3AC0();
    char v10 = v9;
    uint64_t v11 = *v9;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    *char v10 = v11;
    if (result)
    {
      if ((v5 & 0x8000000000000000) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_23AAE3934(v11);
      uint64_t v11 = result;
      *char v10 = result;
      if ((v5 & 0x8000000000000000) == 0)
      {
LABEL_4:
        if (v5 < *(void *)(v11 + 16))
        {
          unint64_t v12 = v11 + 32 * v5;
          *(void *)(v12 + 48) = 0;
          *(unsigned char *)(v12 + 56) = 1;
          v8(v13, 0);
          swift_release();
          return swift_release();
        }
LABEL_9:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_23AAE21C4()
{
  sub_23AAE4050();
  if (qword_268A585F0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268A59260;
  strcpy((char *)v11, "UI: Selected ");
  HIWORD(v11[1]) = -4864;
  sub_23AAE3FE0();
  if (qword_268A585F8 != -1) {
    swift_once();
  }
  unint64_t v2 = qword_268A58920;
  swift_bridgeObjectRetain();
  char v3 = sub_23AADC3B8(v1, v2);
  swift_bridgeObjectRelease();
  if (v3)
  {
    uint64_t v4 = sub_23AAE3FA0();
    uint64_t v6 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58698);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_23AAE4830;
    *(void *)(v7 + 56) = MEMORY[0x263F8D310];
    *(void *)(v7 + 64) = sub_23AAD9FF0();
    *(void *)(v7 + 32) = v4;
    *(void *)(v7 + 40) = v6;
    sub_23AAE3A90();
    swift_bridgeObjectRelease();
  }
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v9 = *(void **)(v0 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel_delegate);
  if (v9)
  {
    swift_unknownObjectRetain();
    char v10 = (void *)sub_23AAE3F80();
    objc_msgSend(v9, sel_selectedLanguageWithIdentifier_, v10, v11[0], v11[1]);

    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23AAE23F4(uint64_t a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_23AAE3AD0();
  swift_release();
  swift_release();
  unint64_t v2 = v23;
  uint64_t v22 = *(void *)(a1 + 16);
  if (!v22)
  {
LABEL_34:
    uint64_t v23 = v2;
    swift_bridgeObjectRetain_n();
    sub_23AAE2DBC(&v23);
    swift_bridgeObjectRelease_n();
    char v19 = v23;
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v23 = v19;
    swift_retain();
    return sub_23AAE3AE0();
  }
  uint64_t v21 = a1 + 32;
  swift_bridgeObjectRetain();
  uint64_t v3 = 0;
  while (1)
  {
    uint64_t v5 = (uint64_t *)(v21 + 32 * v3);
    uint64_t v6 = *v5;
    uint64_t v7 = v5[1];
    uint64_t v8 = v5[2];
    char v9 = *((unsigned char *)v5 + 24);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_23AAE3AD0();
    swift_release();
    swift_release();
    uint64_t v10 = *((void *)v23 + 2);
    if (!v10)
    {
LABEL_15:
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        unint64_t v2 = sub_23AADD7F0(0, *((void *)v2 + 2) + 1, 1, v2);
      }
      unint64_t v15 = *((void *)v2 + 2);
      unint64_t v14 = *((void *)v2 + 3);
      if (v15 >= v14 >> 1) {
        unint64_t v2 = sub_23AADD7F0((char *)(v14 > 1), v15 + 1, 1, v2);
      }
      *((void *)v2 + 2) = v15 + 1;
      uint64_t v4 = &v2[32 * v15];
      *((void *)v4 + 4) = v6;
      *((void *)v4 + 5) = v7;
      *((void *)v4 + 6) = v8;
      v4[56] = v9;
      goto LABEL_4;
    }
    BOOL v11 = *((void *)v23 + 4) == v6 && *((void *)v23 + 5) == v7;
    if (v11 || (sub_23AAE4190() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      unint64_t v12 = 0;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
LABEL_31:
        unint64_t v2 = sub_23AAE3934((uint64_t)v2);
        if ((v12 & 0x8000000000000000) != 0) {
          break;
        }
      }
      goto LABEL_12;
    }
    if (v10 == 1) {
      goto LABEL_15;
    }
    uint64_t v16 = v23 + 72;
    unint64_t v12 = 1;
    while (1)
    {
      BOOL v17 = *((void *)v16 - 1) == v6 && *(void *)v16 == v7;
      if (v17 || (sub_23AAE4190() & 1) != 0) {
        break;
      }
      unint64_t v18 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
        __break(1u);
        goto LABEL_36;
      }
      v16 += 32;
      ++v12;
      if (v18 == v10) {
        goto LABEL_15;
      }
    }
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_31;
    }
    if ((v12 & 0x8000000000000000) != 0) {
      break;
    }
LABEL_12:
    if (v12 >= *((void *)v2 + 2)) {
      goto LABEL_37;
    }
    uint64_t v13 = &v2[32 * v12];
    *((void *)v13 + 4) = v6;
    *((void *)v13 + 5) = v7;
    *((void *)v13 + 6) = v8;
    v13[56] = v9;
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v3 == v22)
    {
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_23AAE272C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__languages;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A28);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC19CommandAndControlUI22CACUILanguageViewModel__selectedLanguageIdentifier;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A30);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_23AAE2828()
{
  return type metadata accessor for CACUILanguageViewModel();
}

uint64_t type metadata accessor for CACUILanguageViewModel()
{
  uint64_t result = qword_268A589E8;
  if (!qword_268A589E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_23AAE287C()
{
  sub_23AAE2950();
  if (v0 <= 0x3F)
  {
    sub_23AAE29AC();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_23AAE2950()
{
  if (!qword_268A589F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58778);
    unint64_t v0 = sub_23AAE3AF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268A589F8);
    }
  }
}

void sub_23AAE29AC()
{
  if (!qword_268A58A00)
  {
    unint64_t v0 = sub_23AAE3AF0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268A58A00);
    }
  }
}

uint64_t sub_23AAE2A04()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_23AAE2A10@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CACUILanguageViewModel();
  uint64_t result = sub_23AAE3AA0();
  *a1 = result;
  return result;
}

unint64_t sub_23AAE2A50()
{
  unint64_t result = qword_268A58A08;
  if (!qword_268A58A08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268A58A08);
  }
  return result;
}

uint64_t sub_23AAE2A94()
{
  return sub_23AAE2060(v0[2], v0[3], v0[4]);
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

unint64_t sub_23AAE2AB8()
{
  unint64_t result = qword_268A58A10;
  if (!qword_268A58A10)
  {
    sub_23AAE3F20();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58A10);
  }
  return result;
}

unint64_t sub_23AAE2B10()
{
  unint64_t result = qword_268A58A20;
  if (!qword_268A58A20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268A58A18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268A58A20);
  }
  return result;
}

char *sub_23AAE2B74(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_23AAE2BB4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_23AAE2B94(char *a1, int64_t a2, char a3)
{
  unint64_t result = sub_23AAE2CB8(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_23AAE2BB4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58948);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_23AAE2CB8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268A58A38);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_23AAE2DBC(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_23AAE3948((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_23AAE2E28(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_23AAE2E28(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_23AAE4180();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_156;
    }
    if (v3) {
      return sub_23AAE3510(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_155;
  }
  uint64_t v108 = result;
  uint64_t v105 = a1;
  if (v3 <= 1)
  {
    uint64_t v7 = MEMORY[0x263F8EE78];
    uint64_t v112 = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x263F8EE78] + 16);
      uint64_t v10 = MEMORY[0x263F8EE78];
LABEL_121:
      uint64_t result = v10;
      uint64_t v107 = v7;
      if (v11 >= 2)
      {
        uint64_t v97 = *v105;
        do
        {
          unint64_t v98 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_150;
          }
          if (!v97) {
            goto LABEL_163;
          }
          uint64_t v99 = result;
          uint64_t v100 = *(void *)(result + 32 + 16 * v98);
          uint64_t v101 = *(void *)(result + 32 + 16 * (v11 - 1) + 8);
          uint64_t result = sub_23AAE35F4((char *)(v97 + 32 * v100), (char *)(v97 + 32 * *(void *)(result + 32 + 16 * (v11 - 1))), v97 + 32 * v101, v112);
          if (v1) {
            break;
          }
          if (v101 < v100) {
            goto LABEL_151;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_23AAE3920(v99);
            uint64_t v99 = result;
          }
          if (v98 >= *(void *)(v99 + 16)) {
            goto LABEL_152;
          }
          uint64_t v102 = (void *)(v99 + 32 + 16 * v98);
          *uint64_t v102 = v100;
          v102[1] = v101;
          unint64_t v103 = *(void *)(v99 + 16);
          if (v11 > v103) {
            goto LABEL_153;
          }
          memmove((void *)(v99 + 32 + 16 * (v11 - 1)), (const void *)(v99 + 32 + 16 * v11), 16 * (v103 - v11));
          uint64_t result = v99;
          *(void *)(v99 + 16) = v103 - 1;
          unint64_t v11 = v103 - 1;
        }
        while (v103 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(void *)(v107 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v107 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t result = sub_23AAE4030();
    *(void *)(result + 16) = v6;
    uint64_t v107 = result;
    uint64_t v112 = (char *)(result + 32);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *a1;
  uint64_t v106 = *a1 + 8;
  uint64_t v104 = *a1 + 24;
  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v109 = v3;
  uint64_t v111 = *a1;
  while (1)
  {
    uint64_t v12 = v8++;
    if (v8 >= v3) {
      goto LABEL_49;
    }
    uint64_t v13 = (uint64_t *)(v9 + 32 * v8);
    uint64_t result = *v13;
    uint64_t v14 = v13[1];
    unint64_t v15 = (void *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_48;
      }
      int v17 = 0;
    }
    else
    {
      uint64_t result = sub_23AAE4190();
      int v17 = result;
      uint64_t v18 = v12 + 2;
      if (v12 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    char v19 = (void *)(v106 + 32 * v18);
    do
    {
      uint64_t result = *(v19 - 1);
      uint64_t v21 = (void *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if (v17) {
          goto LABEL_37;
        }
      }
      else
      {
        uint64_t result = sub_23AAE4190();
        if ((v17 ^ result)) {
          goto LABEL_36;
        }
      }
      v19 += 4;
      uint64_t v20 = v18 + 1;
      uint64_t v8 = v18;
      uint64_t v18 = v20;
    }
    while (v20 < v3);
    uint64_t v18 = v20;
LABEL_36:
    uint64_t v8 = v18;
    if (v17)
    {
LABEL_37:
      if (v18 < v12) {
        goto LABEL_159;
      }
      if (v12 < v18)
      {
        uint64_t v23 = 32 * v18 - 32;
        uint64_t v24 = 32 * v12;
        uint64_t v25 = v18;
        uint64_t v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9) {
              goto LABEL_162;
            }
            uint64_t v29 = (_OWORD *)(v9 + v24);
            char v30 = (_OWORD *)(v9 + v23);
            uint64_t v31 = *(void *)(v9 + v24);
            uint64_t v32 = *(void *)(v9 + v24 + 8);
            uint64_t v33 = *(void *)(v9 + v24 + 16);
            char v34 = *(unsigned char *)(v9 + v24 + 24);
            if (v24 != v23 || v29 >= v30 + 2)
            {
              long long v27 = v30[1];
              _OWORD *v29 = *v30;
              v29[1] = v27;
            }
            uint64_t v28 = v9 + v23;
            *(void *)uint64_t v28 = v31;
            *(void *)(v28 + 8) = v32;
            *(void *)(v28 + 16) = v33;
            *(unsigned char *)(v28 + 24) = v34;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_48:
      uint64_t v8 = v18;
    }
LABEL_49:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12)) {
        goto LABEL_154;
      }
      if (v8 - v12 < v108) {
        break;
      }
    }
LABEL_70:
    if (v8 < v12) {
      goto LABEL_149;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_23AAE3824(0, *(void *)(v10 + 16) + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    unint64_t v47 = *(void *)(v10 + 16);
    unint64_t v46 = *(void *)(v10 + 24);
    unint64_t v11 = v47 + 1;
    if (v47 >= v46 >> 1)
    {
      uint64_t result = (uint64_t)sub_23AAE3824((char *)(v46 > 1), v47 + 1, 1, (char *)v10);
      uint64_t v10 = result;
    }
    *(void *)(v10 + 16) = v11;
    uint64_t v48 = v10 + 32;
    uint64_t v49 = (uint64_t *)(v10 + 32 + 16 * v47);
    *uint64_t v49 = v12;
    v49[1] = v8;
    if (v47)
    {
      uint64_t v9 = v111;
      while (1)
      {
        unint64_t v50 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v55 = v48 + 16 * v11;
          uint64_t v56 = *(void *)(v55 - 64);
          uint64_t v57 = *(void *)(v55 - 56);
          BOOL v61 = __OFSUB__(v57, v56);
          uint64_t v58 = v57 - v56;
          if (v61) {
            goto LABEL_138;
          }
          uint64_t v60 = *(void *)(v55 - 48);
          uint64_t v59 = *(void *)(v55 - 40);
          BOOL v61 = __OFSUB__(v59, v60);
          uint64_t v53 = v59 - v60;
          char v54 = v61;
          if (v61) {
            goto LABEL_139;
          }
          unint64_t v62 = v11 - 2;
          uint64_t v63 = (uint64_t *)(v48 + 16 * (v11 - 2));
          uint64_t v65 = *v63;
          uint64_t v64 = v63[1];
          BOOL v61 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          if (v61) {
            goto LABEL_140;
          }
          BOOL v61 = __OFADD__(v53, v66);
          uint64_t v67 = v53 + v66;
          if (v61) {
            goto LABEL_142;
          }
          if (v67 >= v58)
          {
            long long v85 = (uint64_t *)(v48 + 16 * v50);
            uint64_t v87 = *v85;
            uint64_t v86 = v85[1];
            BOOL v61 = __OFSUB__(v86, v87);
            uint64_t v88 = v86 - v87;
            if (v61) {
              goto LABEL_148;
            }
            BOOL v78 = v53 < v88;
            goto LABEL_108;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v79 = *(void *)(v10 + 32);
            uint64_t v80 = *(void *)(v10 + 40);
            BOOL v61 = __OFSUB__(v80, v79);
            uint64_t v72 = v80 - v79;
            char v73 = v61;
            goto LABEL_102;
          }
          uint64_t v52 = *(void *)(v10 + 32);
          uint64_t v51 = *(void *)(v10 + 40);
          BOOL v61 = __OFSUB__(v51, v52);
          uint64_t v53 = v51 - v52;
          char v54 = v61;
        }
        if (v54) {
          goto LABEL_141;
        }
        unint64_t v62 = v11 - 2;
        uint64_t v68 = (uint64_t *)(v48 + 16 * (v11 - 2));
        uint64_t v70 = *v68;
        uint64_t v69 = v68[1];
        BOOL v71 = __OFSUB__(v69, v70);
        uint64_t v72 = v69 - v70;
        char v73 = v71;
        if (v71) {
          goto LABEL_143;
        }
        uint64_t v74 = (uint64_t *)(v48 + 16 * v50);
        uint64_t v76 = *v74;
        uint64_t v75 = v74[1];
        BOOL v61 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v61) {
          goto LABEL_145;
        }
        if (__OFADD__(v72, v77)) {
          goto LABEL_147;
        }
        if (v72 + v77 >= v53)
        {
          BOOL v78 = v53 < v77;
LABEL_108:
          if (v78) {
            unint64_t v50 = v62;
          }
          goto LABEL_110;
        }
LABEL_102:
        if (v73) {
          goto LABEL_144;
        }
        uint64_t v81 = (uint64_t *)(v48 + 16 * v50);
        uint64_t v83 = *v81;
        uint64_t v82 = v81[1];
        BOOL v61 = __OFSUB__(v82, v83);
        uint64_t v84 = v82 - v83;
        if (v61) {
          goto LABEL_146;
        }
        if (v84 < v72) {
          goto LABEL_15;
        }
LABEL_110:
        unint64_t v89 = v50 - 1;
        if (v50 - 1 >= v11)
        {
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
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
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
          goto LABEL_158;
        }
        if (!v9) {
          goto LABEL_161;
        }
        uint64_t v90 = v10;
        uint64_t v91 = v9;
        v92 = (uint64_t *)(v48 + 16 * v89);
        uint64_t v93 = *v92;
        v94 = (void *)(v48 + 16 * v50);
        uint64_t v95 = v94[1];
        uint64_t result = sub_23AAE35F4((char *)(v91 + 32 * *v92), (char *)(v91 + 32 * *v94), v91 + 32 * v95, v112);
        if (v1) {
          goto LABEL_118;
        }
        if (v95 < v93) {
          goto LABEL_135;
        }
        if (v50 > *(void *)(v90 + 16)) {
          goto LABEL_136;
        }
        uint64_t *v92 = v93;
        *(void *)(v48 + 16 * v89 + 8) = v95;
        unint64_t v96 = *(void *)(v90 + 16);
        if (v50 >= v96) {
          goto LABEL_137;
        }
        uint64_t v10 = v90;
        unint64_t v11 = v96 - 1;
        uint64_t result = (uint64_t)memmove((void *)(v48 + 16 * v50), v94 + 2, 16 * (v96 - 1 - v50));
        *(void *)(v90 + 16) = v96 - 1;
        BOOL v78 = v96 > 2;
        uint64_t v9 = v111;
        if (!v78) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v11 = 1;
    uint64_t v9 = v111;
LABEL_15:
    uint64_t v3 = v109;
    if (v8 >= v109)
    {
      uint64_t v7 = v107;
      goto LABEL_121;
    }
  }
  if (__OFADD__(v12, v108)) {
    goto LABEL_157;
  }
  if (v12 + v108 >= v3) {
    uint64_t v35 = v3;
  }
  else {
    uint64_t v35 = v12 + v108;
  }
  if (v35 >= v12)
  {
    if (v8 != v35)
    {
      uint64_t v110 = v12;
      uint64_t v36 = v104 + 32 * v8;
      do
      {
        uint64_t v37 = v110;
        uint64_t v38 = v36;
        do
        {
          uint64_t result = *(void *)(v38 - 24);
          uint64_t v39 = (_OWORD *)(v38 - 24);
          if (result == *(void *)(v38 - 56) && *(void *)(v38 - 16) == *(void *)(v38 - 48)) {
            break;
          }
          uint64_t result = sub_23AAE4190();
          if ((result & 1) == 0) {
            break;
          }
          if (!v9) {
            goto LABEL_160;
          }
          long long v42 = *(_OWORD *)(v38 - 56);
          long long v41 = *(_OWORD *)(v38 - 40);
          *(unsigned char *)(v38 - 32) = *(unsigned char *)v38;
          v38 -= 32;
          uint64_t v43 = *(void *)(v38 + 8);
          uint64_t v44 = *(void *)(v38 + 16);
          uint64_t v45 = *(void *)(v38 + 24);
          *uint64_t v39 = v42;
          v39[1] = v41;
          *(void *)(v38 - 24) = v43;
          *(void *)(v38 - 16) = v44;
          *(void *)(v38 - 8) = v45;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v36 += 32;
      }
      while (v8 != v35);
      uint64_t v8 = v35;
      uint64_t v12 = v110;
    }
    goto LABEL_70;
  }
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
  return result;
}

uint64_t sub_23AAE3510(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 32 * a3 + 24;
LABEL_5:
    uint64_t v9 = v6;
    uint64_t v10 = v8;
    while (1)
    {
      uint64_t result = *(void *)(v10 - 24);
      unint64_t v11 = (_OWORD *)(v10 - 24);
      BOOL v12 = result == *(void *)(v10 - 56) && *(void *)(v10 - 16) == *(void *)(v10 - 48);
      if (v12 || (uint64_t result = sub_23AAE4190(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      long long v14 = *(_OWORD *)(v10 - 56);
      long long v13 = *(_OWORD *)(v10 - 40);
      *(unsigned char *)(v10 - 32) = *(unsigned char *)v10;
      v10 -= 32;
      uint64_t v15 = *(void *)(v10 + 8);
      uint64_t v16 = *(void *)(v10 + 16);
      uint64_t v17 = *(void *)(v10 + 24);
      _OWORD *v11 = v14;
      v11[1] = v13;
      *(void *)(v10 - 24) = v15;
      *(void *)(v10 - 16) = v16;
      *(void *)(v10 - 8) = v17;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23AAE35F4(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __src;
  uint64_t v7 = __dst;
  int64_t v8 = __src - __dst;
  int64_t v9 = __src - __dst + 31;
  if (__src - __dst >= 0) {
    int64_t v9 = __src - __dst;
  }
  uint64_t v10 = v9 >> 5;
  uint64_t v11 = a3 - (void)__src;
  uint64_t v12 = a3 - (void)__src + 31;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v12 = a3 - (void)__src;
  }
  uint64_t v13 = v12 >> 5;
  if (v10 >= v13)
  {
    uint64_t v19 = 32 * v13;
    if (a4 != __src || &__src[v19] <= a4) {
      memmove(a4, __src, 32 * v13);
    }
    uint64_t v15 = &v4[v19];
    if (v7 >= v6 || v11 < 32) {
      goto LABEL_48;
    }
    uint64_t v20 = (char *)(a3 - 32);
    while (1)
    {
      uint64_t v21 = v20 + 32;
      uint64_t v22 = v6 - 32;
      BOOL v23 = *((void *)v15 - 4) == *((void *)v6 - 4) && *((void *)v15 - 3) == *((void *)v6 - 3);
      if (v23 || (sub_23AAE4190() & 1) == 0)
      {
        uint64_t v22 = v15 - 32;
        if (v21 != v15)
        {
          v15 -= 32;
LABEL_45:
          long long v25 = *((_OWORD *)v22 + 1);
          *(_OWORD *)uint64_t v20 = *(_OWORD *)v22;
          *((_OWORD *)v20 + 1) = v25;
          goto LABEL_46;
        }
        BOOL v24 = v20 >= v15;
        v15 -= 32;
        if (v24) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v21 != v6)
        {
          v6 -= 32;
          goto LABEL_45;
        }
        BOOL v24 = v20 >= v6;
        v6 -= 32;
        if (v24) {
          goto LABEL_45;
        }
      }
LABEL_46:
      if (v6 > v7)
      {
        v20 -= 32;
        if (v15 > v4) {
          continue;
        }
      }
      goto LABEL_48;
    }
  }
  size_t v14 = 32 * v10;
  if (a4 != __dst || &__dst[v14] <= a4) {
    memmove(a4, __dst, v14);
  }
  uint64_t v15 = &v4[v14];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      BOOL v16 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
      if (v16 || (sub_23AAE4190() & 1) == 0) {
        break;
      }
      uint64_t v17 = v6;
      BOOL v16 = v7 == v6;
      v6 += 32;
      if (!v16) {
        goto LABEL_20;
      }
LABEL_21:
      v7 += 32;
      if (v4 >= v15 || (unint64_t)v6 >= a3) {
        goto LABEL_23;
      }
    }
    uint64_t v17 = v4;
    BOOL v16 = v7 == v4;
    v4 += 32;
    if (v16) {
      goto LABEL_21;
    }
LABEL_20:
    long long v18 = *((_OWORD *)v17 + 1);
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
    *((_OWORD *)v7 + 1) = v18;
    goto LABEL_21;
  }
LABEL_23:
  uint64_t v6 = v7;
LABEL_48:
  size_t v26 = (v15 - v4 + (v15 - v4 < 0 ? 0x1FuLL : 0)) & 0xFFFFFFFFFFFFFFE0;
  if (v6 != v4 || v6 >= &v4[v26]) {
    memmove(v6, v4, v26);
  }
  return 1;
}

char *sub_23AAE3824(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A58A40);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  size_t v14 = a4 + 32;
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

char *sub_23AAE3920(uint64_t a1)
{
  return sub_23AAE3824(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_23AAE3934(uint64_t a1)
{
  return sub_23AADD7F0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_23AAE3948(uint64_t a1)
{
  return sub_23AAE2BB4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23AAE395C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return 0;
  }
  uint64_t v6 = 0;
  for (uint64_t i = (void *)(a1 + 40); ; i += 4)
  {
    BOOL v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (sub_23AAE4190() & 1) != 0) {
      break;
    }
    if (v3 == ++v6) {
      return 0;
    }
  }
  return v6;
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23AAE3A34()
{
  return sub_23AAE181C(*(void (**)(uint64_t *, void))(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_23AAE3A50()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23AAE3A60()
{
  return MEMORY[0x270EF0E30]();
}

uint64_t sub_23AAE3A70()
{
  return MEMORY[0x270EF0F40]();
}

uint64_t sub_23AAE3A80()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23AAE3A90()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_23AAE3AA0()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_23AAE3AB0()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_23AAE3AC0()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_23AAE3AD0()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_23AAE3AE0()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_23AAE3AF0()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_23AAE3B00()
{
  return MEMORY[0x270EFED00]();
}

uint64_t sub_23AAE3B10()
{
  return MEMORY[0x270EFF130]();
}

uint64_t sub_23AAE3B20()
{
  return MEMORY[0x270EFF398]();
}

uint64_t sub_23AAE3B30()
{
  return MEMORY[0x270EFF3B0]();
}

uint64_t sub_23AAE3B40()
{
  return MEMORY[0x270EFF5A0]();
}

uint64_t sub_23AAE3B50()
{
  return MEMORY[0x270EFFB78]();
}

uint64_t sub_23AAE3B60()
{
  return MEMORY[0x270F00A28]();
}

uint64_t sub_23AAE3B70()
{
  return MEMORY[0x270F00A38]();
}

uint64_t sub_23AAE3B80()
{
  return MEMORY[0x270F00D88]();
}

uint64_t sub_23AAE3B90()
{
  return MEMORY[0x270F00D98]();
}

uint64_t sub_23AAE3BA0()
{
  return MEMORY[0x270F00E58]();
}

uint64_t sub_23AAE3BB0()
{
  return MEMORY[0x270F00E60]();
}

uint64_t sub_23AAE3BC0()
{
  return MEMORY[0x270F00ED0]();
}

uint64_t sub_23AAE3BD0()
{
  return MEMORY[0x270F00EE8]();
}

uint64_t sub_23AAE3BE0()
{
  return MEMORY[0x270F01068]();
}

uint64_t sub_23AAE3BF0()
{
  return MEMORY[0x270F01220]();
}

uint64_t sub_23AAE3C00()
{
  return MEMORY[0x270F01230]();
}

uint64_t sub_23AAE3C10()
{
  return MEMORY[0x270F01240]();
}

uint64_t sub_23AAE3C20()
{
  return MEMORY[0x270F01260]();
}

uint64_t sub_23AAE3C30()
{
  return MEMORY[0x270F01278]();
}

uint64_t sub_23AAE3C40()
{
  return MEMORY[0x270F01518]();
}

uint64_t sub_23AAE3C50()
{
  return MEMORY[0x270F016A8]();
}

uint64_t sub_23AAE3C60()
{
  return MEMORY[0x270F01808]();
}

uint64_t sub_23AAE3C70()
{
  return MEMORY[0x270F02298]();
}

uint64_t sub_23AAE3C80()
{
  return MEMORY[0x270F022A8]();
}

uint64_t sub_23AAE3C90()
{
  return MEMORY[0x270F022E8]();
}

uint64_t sub_23AAE3CA0()
{
  return MEMORY[0x270F02760]();
}

uint64_t sub_23AAE3CB0()
{
  return MEMORY[0x270F029E8]();
}

uint64_t sub_23AAE3CC0()
{
  return MEMORY[0x270F02A28]();
}

uint64_t sub_23AAE3CD0()
{
  return MEMORY[0x270F02A80]();
}

uint64_t sub_23AAE3CE0()
{
  return MEMORY[0x270F02B40]();
}

uint64_t sub_23AAE3CF0()
{
  return MEMORY[0x270F02BB8]();
}

uint64_t sub_23AAE3D00()
{
  return MEMORY[0x270F02BF0]();
}

uint64_t sub_23AAE3D10()
{
  return MEMORY[0x270F02C90]();
}

uint64_t sub_23AAE3D20()
{
  return MEMORY[0x270F02CC8]();
}

uint64_t sub_23AAE3D30()
{
  return MEMORY[0x270F02DD0]();
}

uint64_t sub_23AAE3D40()
{
  return MEMORY[0x270F03000]();
}

uint64_t sub_23AAE3D50()
{
  return MEMORY[0x270F030B0]();
}

uint64_t sub_23AAE3D60()
{
  return MEMORY[0x270F03258]();
}

uint64_t sub_23AAE3D70()
{
  return MEMORY[0x270F032C8]();
}

uint64_t sub_23AAE3D80()
{
  return MEMORY[0x270F032D8]();
}

uint64_t sub_23AAE3D90()
{
  return MEMORY[0x270F032F8]();
}

uint64_t sub_23AAE3DA0()
{
  return MEMORY[0x270F036B8]();
}

uint64_t sub_23AAE3DB0()
{
  return MEMORY[0x270F039A8]();
}

uint64_t sub_23AAE3DC0()
{
  return MEMORY[0x270F03D68]();
}

uint64_t sub_23AAE3DD0()
{
  return MEMORY[0x270F03F60]();
}

uint64_t sub_23AAE3DE0()
{
  return MEMORY[0x270F042F0]();
}

uint64_t sub_23AAE3DF0()
{
  return MEMORY[0x270F04308]();
}

uint64_t sub_23AAE3E00()
{
  return MEMORY[0x270F04318]();
}

uint64_t sub_23AAE3E10()
{
  return MEMORY[0x270F04328]();
}

uint64_t sub_23AAE3E20()
{
  return MEMORY[0x270F04370]();
}

uint64_t sub_23AAE3E30()
{
  return MEMORY[0x270F04658]();
}

uint64_t sub_23AAE3E40()
{
  return MEMORY[0x270F04688]();
}

uint64_t sub_23AAE3E50()
{
  return MEMORY[0x270F04710]();
}

uint64_t sub_23AAE3E60()
{
  return MEMORY[0x270F04810]();
}

uint64_t sub_23AAE3E70()
{
  return MEMORY[0x270F04828]();
}

uint64_t sub_23AAE3E80()
{
  return MEMORY[0x270F04838]();
}

uint64_t sub_23AAE3E90()
{
  return MEMORY[0x270F04840]();
}

uint64_t sub_23AAE3EA0()
{
  return MEMORY[0x270F048A8]();
}

uint64_t sub_23AAE3EB0()
{
  return MEMORY[0x270F04C98]();
}

uint64_t sub_23AAE3EC0()
{
  return MEMORY[0x270F04D48]();
}

uint64_t sub_23AAE3ED0()
{
  return MEMORY[0x270F05080]();
}

uint64_t sub_23AAE3EE0()
{
  return MEMORY[0x270F05138]();
}

uint64_t sub_23AAE3EF0()
{
  return MEMORY[0x270F05230]();
}

uint64_t sub_23AAE3F00()
{
  return MEMORY[0x270F053C0]();
}

uint64_t sub_23AAE3F10()
{
  return MEMORY[0x270FA0970]();
}

uint64_t sub_23AAE3F20()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_23AAE3F30()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_23AAE3F40()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_23AAE3F50()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_23AAE3F60()
{
  return MEMORY[0x270FA0AD0]();
}

uint64_t sub_23AAE3F70()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_23AAE3F80()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23AAE3F90()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23AAE3FA0()
{
  return MEMORY[0x270EF1A38]();
}

uint64_t sub_23AAE3FB0()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_23AAE3FC0()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_23AAE3FD0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23AAE3FE0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23AAE3FF0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23AAE4000()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_23AAE4010()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23AAE4020()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23AAE4030()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23AAE4040()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_23AAE4050()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23AAE4060()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23AAE4070()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23AAE4080()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_23AAE4090()
{
  return MEMORY[0x270FA0C78]();
}

uint64_t sub_23AAE40A0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_23AAE40B0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23AAE40C0()
{
  return MEMORY[0x270FA2ED0]();
}

uint64_t sub_23AAE40D0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_23AAE40E0()
{
  return MEMORY[0x270EF2498]();
}

uint64_t sub_23AAE40F0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_23AAE4100()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23AAE4110()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_23AAE4120()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23AAE4130()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23AAE4140()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23AAE4150()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23AAE4160()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23AAE4170()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23AAE4180()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23AAE4190()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23AAE41A0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_23AAE41B0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23AAE41C0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23AAE41D0()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_23AAE41E0()
{
  return MEMORY[0x270F9FC90]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_destroyWeak(id *location)
{
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}