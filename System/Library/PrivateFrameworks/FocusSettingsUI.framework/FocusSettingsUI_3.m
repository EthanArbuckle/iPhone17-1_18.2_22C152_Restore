void *sub_220EDD744(void *a1, void *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_220F30E48();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  v12 = a3[6];
  *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_220F30D08();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  v17 = a3[7];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_OWORD *)v18 = *(_OWORD *)v19;
  v18[16] = v19[16];
  return a1;
}

void *sub_220EDD8F8(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, (uint64_t *)&unk_267F2E330);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      uint64_t v11 = sub_220F30E48();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v12 = a3[5];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  *(void *)((char *)a1 + v12) = *(void *)((char *)a2 + v12);
  swift_release();
  *((void *)v13 + 1) = *((void *)v14 + 1);
  if (a1 != a2)
  {
    uint64_t v15 = a3[6];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    sub_220D25B68((uint64_t)a1 + v15, &qword_267F2EC20);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC20);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_220F30D08();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[7];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  char v23 = v22[16];
  *(_OWORD *)v21 = *(_OWORD *)v22;
  v21[16] = v23;
  sub_220D359A4();
  return a1;
}

uint64_t sub_220EDDB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220EDDB18);
}

uint64_t sub_220EDDB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA08);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 2147483646)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC30);
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a3 + 24);
    return v13(v15, a2, v14);
  }
}

uint64_t sub_220EDDC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220EDDC6C);
}

uint64_t sub_220EDDC6C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA08);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 2147483646)
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC30);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for AddAppFiltersView()
{
  uint64_t result = qword_267F350A0;
  if (!qword_267F350A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_220EDDDEC()
{
  sub_220D273AC();
  if (v0 <= 0x3F)
  {
    sub_220EDDEC4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_220EDDEC4()
{
  if (!qword_267F2EC48)
  {
    sub_220F30D08();
    unint64_t v0 = sub_220F30AE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F2EC48);
    }
  }
}

uint64_t sub_220EDDF1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220EDDF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v45 = a2;
  uint64_t v36 = sub_220F311C8();
  uint64_t v3 = *(void *)(v36 - 8);
  MEMORY[0x270FA5388](v36);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F350B8);
  MEMORY[0x270FA5388](v44);
  v43 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F350F0);
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  MEMORY[0x270FA5388](v7);
  v39 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F350C8);
  uint64_t v37 = *(void *)(v9 - 8);
  uint64_t v38 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F350D0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F350E8);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a1;
  uint64_t v46 = a1;
  sub_220F317F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F350F8);
  sub_220EE47B0();
  sub_220F30A98();
  id v19 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
  uint64_t v20 = MEMORY[0x223C74C60](v19);
  char v21 = sub_220F31818();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v14, v18, v15);
  v22 = &v14[*(int *)(v12 + 36)];
  *(void *)v22 = v20;
  v22[8] = v21;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v23 = v36;
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F19698], v36);
  unint64_t v24 = sub_220EE46E4();
  sub_220F31DA8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v23);
  sub_220D25B68((uint64_t)v14, &qword_267F350D0);
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v49 = sub_220F30408();
  uint64_t v50 = v25;
  uint64_t v47 = v12;
  unint64_t v48 = v24;
  swift_getOpaqueTypeConformance2();
  sub_220D292B8();
  uint64_t v27 = v38;
  v26 = v39;
  sub_220F31C88();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v11, v27);
  uint64_t v29 = v40;
  uint64_t v28 = v41;
  uint64_t v30 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v43, v26, v41);
  v31 = (uint64_t (**)())(v30 + *(int *)(v44 + 36));
  *v31 = sub_220ECEE74;
  v31[1] = 0;
  v31[2] = 0;
  v31[3] = 0;
  uint64_t v32 = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v26, v28);
  MEMORY[0x270FA5388](v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA50);
  sub_220EE45E4();
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2EA58);
  uint64_t v34 = sub_220D25FB0(&qword_267F33DC0, &qword_267F2EA58);
  uint64_t v49 = v33;
  uint64_t v50 = v34;
  swift_getOpaqueTypeConformance2();
  sub_220F31E28();
  return sub_220D25B68(v30, &qword_267F350B8);
}

uint64_t sub_220EDE594(uint64_t a1)
{
  uint64_t v2 = sub_220F31548();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA58);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_220F31528();
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F338D0);
  sub_220D25FB0(&qword_267F33DE0, (uint64_t *)&unk_267F338D0);
  sub_220F30B28();
  uint64_t v7 = sub_220D25FB0(&qword_267F33DC0, &qword_267F2EA58);
  MEMORY[0x223C74350](v6, v3, v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_220EDE75C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddAppFiltersView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  v9[0] = sub_220F30408();
  v9[1] = v5;
  sub_220EE538C(a1, (uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_220EE53F4((uint64_t)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  sub_220D292B8();
  return sub_220F321C8();
}

uint64_t sub_220EDE910()
{
  uint64_t v0 = sub_220F323B8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (long long *)((char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = sub_220F30D08();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v30 - v9;
  id v11 = objc_msgSend(self, sel_currentDevice);
  id v12 = objc_msgSend(v11, sel_userInterfaceIdiom);

  if (v12 == (id)1)
  {
    id v13 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v13, sel_bounds);
    double v15 = v14;
    double v17 = v16;

    if (v17 < v15) {
      double v15 = v17;
    }
    type metadata accessor for AddAppFiltersView();
    sub_220F117D8((uint64_t)v10);
    if (v15 > 768.0)
    {
      (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x263F18D38], v4);
      sub_220EE50B8(&qword_267F2ECA8, MEMORY[0x263F18D80]);
      char v18 = sub_220F32698();
      id v19 = *(void (**)(char *, uint64_t))(v5 + 8);
      v19(v7, v4);
      v19(v10, v4);
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ECA0);
      sub_220F323C8();
      uint64_t v20 = (void (**)(long long *, uint64_t, uint64_t))(v1 + 104);
      uint64_t v21 = swift_allocObject();
      if (v18)
      {
        *(_OWORD *)(v21 + 16) = xmmword_220F35390;
        long long v30 = xmmword_220F353A0;
        *uint64_t v3 = xmmword_220F353A0;
        uint64_t v22 = *MEMORY[0x263F1B8C8];
        uint64_t v23 = *v20;
        (*v20)(v3, v22, v0);
        sub_220F323D8();
        *uint64_t v3 = v30;
        v23(v3, v22, v0);
      }
      else
      {
        *(_OWORD *)(v21 + 16) = xmmword_220F353B0;
        long long v30 = xmmword_220F353A0;
        *uint64_t v3 = xmmword_220F353A0;
        uint64_t v27 = *MEMORY[0x263F1B8C8];
        uint64_t v28 = *v20;
        (*v20)(v3, v27, v0);
        sub_220F323D8();
        *uint64_t v3 = v30;
        v28(v3, v27, v0);
        sub_220F323D8();
        *uint64_t v3 = v30;
        v28(v3, v27, v0);
      }
      goto LABEL_12;
    }
  }
  else
  {
    type metadata accessor for AddAppFiltersView();
    sub_220F117D8((uint64_t)v10);
  }
  char v24 = sub_220F30CF8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ECA0);
  sub_220F323C8();
  uint64_t v21 = swift_allocObject();
  if (v24)
  {
    *(_OWORD *)(v21 + 16) = xmmword_220F35110;
    *uint64_t v3 = xmmword_220F353A0;
    (*(void (**)(long long *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F1B8C8], v0);
  }
  else
  {
    *(_OWORD *)(v21 + 16) = xmmword_220F35390;
    long long v30 = xmmword_220F353A0;
    *uint64_t v3 = xmmword_220F353A0;
    uint64_t v25 = *MEMORY[0x263F1B8C8];
    v26 = *(void (**)(long long *, uint64_t, uint64_t))(v1 + 104);
    v26(v3, v25, v0);
    sub_220F323D8();
    *uint64_t v3 = v30;
    v26(v3, v25, v0);
  }
LABEL_12:
  sub_220F323D8();
  return v21;
}

uint64_t sub_220EDEF78@<X0>(char **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v89 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35138);
  v87 = *(uint64_t **)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35140);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35130);
  MEMORY[0x270FA5388](v9 - 8);
  id v11 = (uint64_t *)((char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35120);
  MEMORY[0x270FA5388](v88);
  id v13 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  double v16 = (char *)&v82 - v15;
  uint64_t v17 = *(void *)(sub_220EDF988() + 16);
  swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(sub_220EDFC88() + 16);
  uint64_t result = swift_bridgeObjectRelease();
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else if (v17 + v18 < 1)
  {
    *id v11 = sub_220F32468();
    v11[1] = v35;
    uint64_t v36 = (uint64_t)v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35148) + 44);
    sub_220F30B48();
    char v37 = sub_220F31818();
    sub_220F30A88();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    uint64_t v46 = v87;
    ((void (*)(char *, char *, uint64_t))v87[2])(v8, v5, v3);
    uint64_t v47 = &v8[*(int *)(v6 + 36)];
    *uint64_t v47 = v37;
    *((void *)v47 + 1) = v39;
    *((void *)v47 + 2) = v41;
    *((void *)v47 + 3) = v43;
    *((void *)v47 + 4) = v45;
    v47[40] = 0;
    ((void (*)(char *, uint64_t))v46[1])(v5, v3);
    sub_220D39114((uint64_t)v8, v36, &qword_267F35140);
    uint64_t v48 = sub_220F32468();
    sub_220F0C740(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, INFINITY, 0, v48, v49);
    sub_220D25B68((uint64_t)v11, &qword_267F35130);
    sub_220D39114((uint64_t)v13, (uint64_t)v16, &qword_267F35120);
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35150);
    MEMORY[0x270FA5388](v50);
    sub_220D26548((uint64_t)v16, (uint64_t)&v82 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_267F35120);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F35110);
    sub_220D25FB0(&qword_267F35108, &qword_267F35110);
    sub_220EE4850();
    sub_220F31488();
    return sub_220D25B68((uint64_t)v16, &qword_267F35120);
  }
  else
  {
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35158);
    v87 = &v82;
    MEMORY[0x270FA5388](v20 - 8);
    v86 = v21;
    uint64_t v22 = (char *)&v82 - (((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = *(void *)(sub_220EDFC88() + 16);
    swift_bridgeObjectRelease();
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35160);
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)(v24 - 8);
    if (v23)
    {
      MEMORY[0x270FA5388](v24);
      uint64_t v28 = (char *)&v82 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35190);
      MEMORY[0x270FA5388](v29 - 8);
      v31 = (char *)&v82 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(void *)v31 = sub_220F31358();
      *((void *)v31 + 1) = 0;
      v31[16] = 0;
      uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35198);
      sub_220EDFF88(a1, &v31[*(int *)(v32 + 44)]);
      char v33 = sub_220F31808();
      sub_220D26548((uint64_t)v31, (uint64_t)v28, &qword_267F35190);
      uint64_t v34 = &v28[*(int *)(v25 + 36)];
      *uint64_t v34 = v33;
      *(_OWORD *)(v34 + 8) = 0u;
      *(_OWORD *)(v34 + 24) = 0u;
      v34[40] = 1;
      sub_220D25B68((uint64_t)v31, &qword_267F35190);
      sub_220D39114((uint64_t)v28, (uint64_t)v22, &qword_267F35160);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v22, 0, 1, v25);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v22, 1, 1, v24);
    }
    uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35168);
    v85 = &v82;
    uint64_t v53 = *(void *)(*(void *)(v52 - 8) + 64);
    MEMORY[0x270FA5388](v52 - 8);
    unint64_t v54 = (v53 + 15) & 0xFFFFFFFFFFFFFFF0;
    v55 = (char *)&v82 - v54;
    uint64_t v56 = *(void *)(sub_220EDF988() + 16);
    swift_bridgeObjectRelease();
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35170);
    uint64_t v58 = v57;
    uint64_t v59 = 1;
    uint64_t v60 = *(void *)(v57 - 8);
    if (v56)
    {
      v83 = &v82;
      MEMORY[0x270FA5388](v57);
      v84 = v22;
      v62 = (char *)&v82 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35180);
      uint64_t v82 = (uint64_t)&v82;
      MEMORY[0x270FA5388](v63 - 8);
      v65 = (char *)&v82 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
      *(void *)v65 = sub_220F31358();
      *((void *)v65 + 1) = 0;
      v65[16] = 0;
      uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35188);
      sub_220EE2784((uint64_t)a1, &v65[*(int *)(v66 + 44)]);
      char v67 = sub_220F31808();
      sub_220D26548((uint64_t)v65, (uint64_t)v62, &qword_267F35180);
      v68 = &v62[*(int *)(v58 + 36)];
      char *v68 = v67;
      *(_OWORD *)(v68 + 8) = 0u;
      *(_OWORD *)(v68 + 24) = 0u;
      v68[40] = 1;
      uint64_t v69 = (uint64_t)v65;
      unint64_t v54 = (v53 + 15) & 0xFFFFFFFFFFFFFFF0;
      sub_220D25B68(v69, &qword_267F35180);
      uint64_t v70 = (uint64_t)v62;
      uint64_t v22 = v84;
      sub_220D39114(v70, (uint64_t)v55, &qword_267F35170);
      uint64_t v59 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56))(v55, v59, 1, v58);
    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35110);
    v84 = (char *)&v82;
    MEMORY[0x270FA5388](v71);
    v73 = (char *)&v82 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
    v83 = &v82;
    MEMORY[0x270FA5388](v74);
    v76 = (char *)&v82 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v77 = sub_220D26548((uint64_t)v22, (uint64_t)v76, &qword_267F35158);
    v86 = &v82;
    MEMORY[0x270FA5388](v77);
    v78 = (char *)&v82 - v54;
    sub_220D26548((uint64_t)v55, (uint64_t)v78, &qword_267F35168);
    sub_220D26548((uint64_t)v76, (uint64_t)v73, &qword_267F35158);
    uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35178);
    sub_220D26548((uint64_t)v78, (uint64_t)&v73[*(int *)(v79 + 48)], &qword_267F35168);
    sub_220D25B68((uint64_t)v78, &qword_267F35168);
    sub_220D25B68((uint64_t)v76, &qword_267F35158);
    uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35150);
    MEMORY[0x270FA5388](v80);
    sub_220D26548((uint64_t)v73, (uint64_t)&v82 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_267F35110);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F35108, &qword_267F35110);
    sub_220EE4850();
    sub_220F31488();
    sub_220D25B68((uint64_t)v73, &qword_267F35110);
    sub_220D25B68((uint64_t)v55, &qword_267F35168);
    return sub_220D25B68((uint64_t)v22, &qword_267F35158);
  }
  return result;
}

uint64_t sub_220EDF988()
{
  uint64_t v1 = type metadata accessor for FocusSystemConfigurationAction(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v19 = (uint64_t)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17 - v5;
  if (*(void *)(v0 + *(int *)(type metadata accessor for AddAppFiltersView() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_220F309B8();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v7 = v20;
    uint64_t v8 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v9 = *(void *)(v7 + 16);
    if (!v9)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      return v8;
    }
    unint64_t v10 = 0;
    uint64_t v18 = v2;
    while (v10 < *(void *)(v7 + 16))
    {
      unint64_t v11 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
      uint64_t v12 = *(void *)(v2 + 72);
      sub_220EE538C(v7 + v11 + v12 * v10, (uint64_t)v6, type metadata accessor for FocusSystemConfigurationAction);
      if (v6[*(int *)(v1 + 20)])
      {
        sub_220EE532C((uint64_t)v6, type metadata accessor for FocusSystemConfigurationAction);
      }
      else
      {
        uint64_t v13 = v1;
        sub_220EE53F4((uint64_t)v6, v19, type metadata accessor for FocusSystemConfigurationAction);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_220E879DC(0, *(void *)(v8 + 16) + 1, 1);
        }
        uint64_t v8 = v20;
        unint64_t v15 = *(void *)(v20 + 16);
        unint64_t v14 = *(void *)(v20 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_220E879DC(v14 > 1, v15 + 1, 1);
          uint64_t v8 = v20;
        }
        *(void *)(v8 + 16) = v15 + 1;
        sub_220EE53F4(v19, v8 + v11 + v15 * v12, type metadata accessor for FocusSystemConfigurationAction);
        uint64_t v1 = v13;
        uint64_t v2 = v18;
      }
      if (v9 == ++v10)
      {
        uint64_t v8 = v20;
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220EDFC88()
{
  uint64_t v1 = type metadata accessor for FocusConfigurationAction(0);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v19 = (uint64_t)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v17 - v5;
  if (*(void *)(v0 + *(int *)(type metadata accessor for AddAppFiltersView() + 20)))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_220F309B8();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v7 = v20;
    uint64_t v8 = MEMORY[0x263F8EE78];
    uint64_t v20 = MEMORY[0x263F8EE78];
    uint64_t v9 = *(void *)(v7 + 16);
    if (!v9)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      return v8;
    }
    unint64_t v10 = 0;
    uint64_t v18 = v2;
    while (v10 < *(void *)(v7 + 16))
    {
      unint64_t v11 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
      uint64_t v12 = *(void *)(v2 + 72);
      sub_220EE538C(v7 + v11 + v12 * v10, (uint64_t)v6, type metadata accessor for FocusConfigurationAction);
      if (v6[*(int *)(v1 + 20)])
      {
        sub_220EE532C((uint64_t)v6, type metadata accessor for FocusConfigurationAction);
      }
      else
      {
        uint64_t v13 = v1;
        sub_220EE53F4((uint64_t)v6, v19, type metadata accessor for FocusConfigurationAction);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          sub_220E87A18(0, *(void *)(v8 + 16) + 1, 1);
        }
        uint64_t v8 = v20;
        unint64_t v15 = *(void *)(v20 + 16);
        unint64_t v14 = *(void *)(v20 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_220E87A18(v14 > 1, v15 + 1, 1);
          uint64_t v8 = v20;
        }
        *(void *)(v8 + 16) = v15 + 1;
        sub_220EE53F4(v19, v8 + v11 + v15 * v12, type metadata accessor for FocusConfigurationAction);
        uint64_t v1 = v13;
        uint64_t v2 = v18;
      }
      if (v9 == ++v10)
      {
        uint64_t v8 = v20;
        goto LABEL_14;
      }
    }
    __break(1u);
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220EDFF88@<X0>(char **a1@<X0>, void *a2@<X8>)
{
  v109 = a1;
  v102 = a2;
  uint64_t v99 = sub_220F31578();
  MEMORY[0x270FA5388](v99);
  v100 = (char *)&v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBC8);
  MEMORY[0x270FA5388](v104);
  v108 = (uint64_t *)((char *)&v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C78);
  MEMORY[0x270FA5388](v103);
  v92 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C80);
  MEMORY[0x270FA5388](v106);
  uint64_t v107 = (uint64_t)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C70);
  MEMORY[0x270FA5388](v105);
  uint64_t v101 = (uint64_t)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v110 = (uint64_t)&v81 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v112 = (uint64_t)&v81 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v111 = (uint64_t)&v81 - v15;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v98 = v114;
  int v97 = v115;
  uint64_t v96 = v116;
  int v95 = v117;
  uint64_t v94 = v118;
  uint64_t v93 = v119;
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v126 = sub_220F30408();
  uint64_t v127 = v16;
  unint64_t v85 = sub_220D292B8();
  uint64_t v17 = sub_220F31B28();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_220F319E8();
  uint64_t v22 = sub_220F31AF8();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release();
  sub_220D357E0(v17, v19, v21);
  swift_bridgeObjectRelease();
  uint64_t v83 = sub_220F31AD8();
  uint64_t v29 = *(void *)(v83 - 8);
  uint64_t v82 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56);
  v84 = (char **)(v29 + 56);
  uint64_t v30 = (uint64_t)v6;
  v82(v6, 1, 1, v83);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v32 = (uint64_t)v108;
  uint64_t v33 = (uint64_t)v108 + *(int *)(v104 + 28);
  uint64_t v81 = v6;
  sub_220D26548((uint64_t)v6, v33, &qword_267F2EBF0);
  *(void *)uint64_t v32 = KeyPath;
  uint64_t v34 = (uint64_t)v92;
  sub_220D26548(v32, (uint64_t)&v92[*(int *)(v103 + 36)], &qword_267F2EBC8);
  *(void *)uint64_t v34 = v22;
  *(void *)(v34 + 8) = v24;
  *(unsigned char *)(v34 + 16) = v26 & 1;
  *(void *)(v34 + 24) = v28;
  sub_220D3570C(v22, v24, v26 & 1);
  swift_bridgeObjectRetain();
  sub_220D25B68(v32, &qword_267F2EBC8);
  sub_220D25B68(v30, &qword_267F2EBF0);
  sub_220D357E0(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  uint64_t v35 = sub_220F31FE8();
  uint64_t v36 = swift_getKeyPath();
  uint64_t v37 = v107;
  sub_220D26548(v34, v107, &qword_267F34C78);
  uint64_t v38 = (uint64_t *)(v37 + *(int *)(v106 + 36));
  *uint64_t v38 = v36;
  v38[1] = v35;
  sub_220D25B68(v34, &qword_267F34C78);
  LOBYTE(v35) = sub_220F31808();
  uint64_t v39 = v112;
  sub_220D26548(v37, v112, &qword_267F34C80);
  uint64_t v40 = v39 + *(int *)(v105 + 36);
  *(unsigned char *)uint64_t v40 = v35;
  *(_OWORD *)(v40 + 8) = 0u;
  *(_OWORD *)(v40 + 24) = 0u;
  *(unsigned char *)(v40 + 40) = 1;
  sub_220D25B68(v37, &qword_267F34C80);
  sub_220D39114(v39, v111, &qword_267F34C70);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v91 = v120;
  int v90 = v121;
  uint64_t v89 = v122;
  int v88 = v123;
  uint64_t v87 = v124;
  uint64_t v86 = v125;
  uint64_t v126 = sub_220EE0D38();
  uint64_t v127 = v41;
  uint64_t v42 = sub_220F31B28();
  uint64_t v44 = v43;
  char v46 = v45 & 1;
  sub_220F319D8();
  uint64_t v47 = sub_220F31AF8();
  uint64_t v49 = v48;
  LOBYTE(v32) = v50;
  uint64_t v52 = v51;
  swift_release();
  LOBYTE(v28) = v32 & 1;
  sub_220D357E0(v42, v44, v46);
  swift_bridgeObjectRelease();
  uint64_t v53 = (uint64_t)v81;
  v82(v81, 1, 1, v83);
  uint64_t v54 = swift_getKeyPath();
  v55 = v108;
  sub_220D26548(v53, (uint64_t)v108 + *(int *)(v104 + 28), &qword_267F2EBF0);
  uint64_t *v55 = v54;
  sub_220D26548((uint64_t)v55, v34 + *(int *)(v103 + 36), &qword_267F2EBC8);
  *(void *)uint64_t v34 = v47;
  *(void *)(v34 + 8) = v49;
  *(unsigned char *)(v34 + 16) = v28;
  *(void *)(v34 + 24) = v52;
  sub_220D3570C(v47, v49, v28);
  swift_bridgeObjectRetain();
  sub_220D25B68((uint64_t)v55, &qword_267F2EBC8);
  sub_220D25B68(v53, &qword_267F2EBF0);
  sub_220D357E0(v47, v49, v28);
  swift_bridgeObjectRelease();
  uint64_t v56 = sub_220F31FF8();
  uint64_t v57 = swift_getKeyPath();
  uint64_t v58 = v107;
  sub_220D26548(v34, v107, &qword_267F34C78);
  uint64_t v59 = (uint64_t *)(v58 + *(int *)(v106 + 36));
  *uint64_t v59 = v57;
  v59[1] = v56;
  sub_220D25B68(v34, &qword_267F34C78);
  LOBYTE(v56) = sub_220F31808();
  uint64_t v60 = v110;
  sub_220D26548(v58, v110, &qword_267F34C80);
  uint64_t v61 = v60 + *(int *)(v105 + 36);
  *(unsigned char *)uint64_t v61 = v56;
  *(_OWORD *)(v61 + 8) = 0u;
  *(_OWORD *)(v61 + 24) = 0u;
  *(unsigned char *)(v61 + 40) = 1;
  sub_220D25B68(v58, &qword_267F34C80);
  sub_220D39114(v60, v112, &qword_267F34C70);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v107 = v126;
  LODWORD(v106) = v127;
  uint64_t v105 = v128;
  LODWORD(v104) = v129;
  uint64_t v103 = v130;
  v92 = v131;
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F351A0);
  v108 = (uint64_t *)&v81;
  uint64_t v81 = (char *)v62;
  uint64_t v63 = *(void **)(v62 - 8);
  uint64_t v64 = v63[8];
  MEMORY[0x270FA5388](v62);
  unint64_t v85 = (v64 + 15) & 0xFFFFFFFFFFFFFFF0;
  v65 = (char *)&v81 - v85;
  uint64_t v82 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_220EDE910();
  v84 = &v81;
  MEMORY[0x270FA5388](v82);
  sub_220F31348();
  int v113 = 0;
  sub_220EE50B8(&qword_267F30150, MEMORY[0x263F19D28]);
  sub_220F32FC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F351A8);
  sub_220EE4B18(&qword_267F351B0, &qword_267F351A8, (void (*)(void))sub_220EE4ADC);
  uint64_t v83 = (uint64_t)v65;
  sub_220F324D8();
  sub_220D26548(v111, v60, &qword_267F34C70);
  uint64_t v66 = v101;
  uint64_t v67 = sub_220D26548(v112, v101, &qword_267F34C70);
  v109 = &v81;
  __n128 v68 = MEMORY[0x270FA5388](v67);
  uint64_t v69 = (char *)&v81 - v85;
  uint64_t v70 = (void (*)(char *, char *, uint64_t, __n128))v63[2];
  v70((char *)&v81 - v85, v65, v62, v68);
  uint64_t v71 = v102;
  void *v102 = 0;
  *((unsigned char *)v71 + 8) = 1;
  v71[2] = v98;
  *((unsigned char *)v71 + 24) = v97;
  v71[4] = v96;
  *((unsigned char *)v71 + 40) = v95;
  uint64_t v72 = v93;
  v71[6] = v94;
  v71[7] = v72;
  v73 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F351E8);
  sub_220D26548(v60, (uint64_t)v71 + v73[12], &qword_267F34C70);
  uint64_t v74 = (char *)v71 + v73[16];
  *(void *)uint64_t v74 = 0;
  v74[8] = 1;
  *((void *)v74 + 2) = v91;
  v74[24] = v90;
  *((void *)v74 + 4) = v89;
  v74[40] = v88;
  uint64_t v75 = v86;
  *((void *)v74 + 6) = v87;
  *((void *)v74 + 7) = v75;
  sub_220D26548(v66, (uint64_t)v71 + v73[20], &qword_267F34C70);
  v76 = (char *)v71 + v73[24];
  *(void *)v76 = 0;
  v76[8] = 1;
  *((void *)v76 + 2) = v107;
  v76[24] = v106;
  *((void *)v76 + 4) = v105;
  v76[40] = v104;
  uint64_t v77 = v92;
  *((void *)v76 + 6) = v103;
  *((void *)v76 + 7) = v77;
  v78 = v81;
  ((void (*)(char *, char *, char *))v70)((char *)v71 + v73[28], v69, v81);
  uint64_t v79 = (void (*)(uint64_t, char *))v63[1];
  v79(v83, v78);
  sub_220D25B68(v112, &qword_267F34C70);
  sub_220D25B68(v111, &qword_267F34C70);
  v79((uint64_t)v69, v78);
  sub_220D25B68(v66, &qword_267F34C70);
  return sub_220D25B68(v110, &qword_267F34C70);
}

uint64_t sub_220EE0D38()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for AddAppFiltersView() + 20));
  if (!v1)
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E88();
    __break(1u);
    JUMPOUT(0x220EE14E8);
  }
  if (*(void *)(v1 + 24))
  {
    swift_retain();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_220F309B8();
    swift_release();
    swift_release();
    uint64_t v2 = swift_allocObject();
    swift_weakInit();
    type metadata accessor for ActivityConfigurationManager();
    swift_allocObject();
    *(void *)(v1 + 24) = sub_220D06AF4(v16, v17, (uint64_t)sub_220D2A5A0, v2);
    swift_retain();
    swift_release();
  }
  swift_retain();
  id v3 = sub_220D07240();
  swift_release();
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_mode);

    id v5 = objc_msgSend(v4, sel_semanticType);
    swift_release();

    switch((unint64_t)v5)
    {
      case 0uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 1uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 2uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 3uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 4uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 5uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 6uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 7uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
        goto LABEL_36;
      case 8uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_34;
        }
LABEL_36:
        swift_once();
LABEL_34:
        uint64_t v14 = sub_220F30408();
        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
    swift_release();
LABEL_10:
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    sub_220F30408();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F33B30);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_220F35110;
    if (*(void *)(v1 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v7 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v1 + 24) = sub_220D06AF4(v16, v17, (uint64_t)sub_220D2A5A0, v7);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v8 = sub_220D07240();
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = objc_msgSend(v8, sel_mode, 0xE000000000000000);

      id v11 = objc_msgSend(v10, sel_name);
      uint64_t v9 = (void *)sub_220F32768();
      unint64_t v13 = v12;
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      unint64_t v13 = 0xE000000000000000;
    }
    *(void *)(v6 + 56) = MEMORY[0x263F8D310];
    *(void *)(v6 + 64) = sub_220D2A5A8();
    *(void *)(v6 + 32) = v9;
    *(void *)(v6 + 40) = v13;
    uint64_t v14 = sub_220F32738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v14;
}

uint64_t sub_220EE150C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddAppFiltersView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  sub_220F30E78();
  swift_getKeyPath();
  sub_220F30E98();
  swift_release();
  swift_release();
  uint64_t v8 = v10;
  long long v9 = v11;
  sub_220EE538C(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_220EE53F4((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED78);
  sub_220F30638();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F351C0);
  sub_220D35F9C();
  sub_220EE4ADC();
  sub_220D3612C();
  return sub_220F32358();
}

uint64_t sub_220EE1754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6A0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D26548(a1, (uint64_t)v8, (uint64_t *)&unk_267F2F6A0);
  sub_220EE1808((uint64_t)v8, a2, a3);
  return sub_220D25B68((uint64_t)v8, (uint64_t *)&unk_267F2F6A0);
}

uint64_t sub_220EE1808@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_220F31278();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F351F0);
  MEMORY[0x270FA5388](v48);
  uint64_t v47 = (uint64_t)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F351E0);
  uint64_t v51 = *(void *)(v8 - 8);
  uint64_t v52 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F351D0);
  uint64_t v53 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  char v50 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v49 = (uint64_t)&v41 - v14;
  uint64_t v15 = type metadata accessor for FocusConfigurationAction(0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6A0);
  uint64_t v19 = a1;
  MEMORY[0x223C75070]();
  LOBYTE(a1) = v17[*(int *)(v15 + 20)];
  sub_220EE532C((uint64_t)v17, type metadata accessor for FocusConfigurationAction);
  if (a1)
  {
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v45 = v11;
    uint64_t v46 = a3;
    MEMORY[0x223C75070](v18);
    char v21 = (uint64_t *)&v17[*(int *)(v15 + 32)];
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    swift_bridgeObjectRetain();
    uint64_t v42 = type metadata accessor for FocusConfigurationAction;
    sub_220EE532C((uint64_t)v17, type metadata accessor for FocusConfigurationAction);
    uint64_t v24 = _s15FocusSettingsUI12InstalledAppC16bundleIdentifierACSS_tcfC_0(v22, v23);
    MEMORY[0x270FA5388](v24);
    *(&v41 - 4) = v19;
    *(&v41 - 3) = v25;
    unint64_t v39 = a2;
    uint64_t v43 = v25;
    sub_220EE1E08(v25, a2, v47);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F351F8);
    sub_220EE4C84();
    sub_220EE4D54();
    uint64_t v44 = v10;
    sub_220F30C78();
    sub_220F31268();
    sub_220F31258();
    MEMORY[0x223C75070](v18);
    sub_220E0AD50((uint64_t)v17);
    char v26 = v42;
    sub_220EE532C((uint64_t)v17, v42);
    sub_220F31248();
    swift_bridgeObjectRelease();
    sub_220F31258();
    MEMORY[0x223C75070](v18);
    sub_220E0AE5C((uint64_t)v17);
    uint64_t v28 = v27;
    sub_220EE532C((uint64_t)v17, v26);
    if (!v28)
    {
      if (qword_267F2E160 != -1) {
        swift_once();
      }
      unint64_t v39 = 0xE000000000000000;
      sub_220F30408();
    }
    uint64_t v29 = v44;
    sub_220F31248();
    swift_bridgeObjectRelease();
    sub_220F31258();
    sub_220F31298();
    __int16 v40 = 256;
    unint64_t v39 = 0;
    uint64_t v30 = sub_220F31B18();
    uint64_t v32 = v31;
    char v34 = v33 & 1;
    sub_220D25FB0(&qword_267F351D8, &qword_267F351E0);
    uint64_t v35 = (uint64_t)v50;
    uint64_t v36 = v52;
    sub_220F31CE8();
    swift_release();
    sub_220D357E0(v30, v32, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v36);
    uint64_t v37 = v49;
    sub_220D39114(v35, v49, &qword_267F351D0);
    a3 = v46;
    sub_220D39114(v37, v46, &qword_267F351D0);
    uint64_t v20 = 0;
    uint64_t v11 = v45;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(a3, v20, 1, v11);
}

uint64_t sub_220EE1E08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v55 = a3;
  uint64_t v4 = type metadata accessor for AddAppFiltersView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v54 = v4 - 8;
  uint64_t v50 = v5;
  uint64_t v49 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v48 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6A0);
  MEMORY[0x270FA5388](v7);
  uint64_t v47 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for FocusConfigurationAction(0);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v43 - v14;
  uint64_t v16 = type metadata accessor for AppConfigurationHostView(0);
  uint64_t v17 = (int *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (uint64_t *)((char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F351F0);
  MEMORY[0x270FA5388](v52);
  uint64_t v53 = (uint64_t)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(void *)(a1 + 24);
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v46 = v21;
  swift_bridgeObjectRetain();
  MEMORY[0x223C75070](v7);
  uint64_t v23 = &v15[*(int *)(v10 + 36)];
  uint64_t v24 = *((void *)v23 + 1);
  uint64_t v45 = *(void *)v23;
  swift_bridgeObjectRetain();
  sub_220EE532C((uint64_t)v15, type metadata accessor for FocusConfigurationAction);
  MEMORY[0x223C75070](v7);
  uint64_t v25 = &v12[*(int *)(v10 + 40)];
  uint64_t v26 = *((void *)v25 + 1);
  uint64_t v44 = *(void *)v25;
  swift_bridgeObjectRetain();
  sub_220EE532C((uint64_t)v12, type metadata accessor for FocusConfigurationAction);
  uint64_t v27 = (uint64_t)v47;
  sub_220F322D8();
  uint64_t v28 = v51;
  uint64_t v29 = v48;
  sub_220EE538C(v51, v48, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  unint64_t v30 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v31 = swift_allocObject();
  sub_220EE53F4(v29, v31 + v30, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  *uint64_t v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = (uint64_t *)((char *)v19 + v17[7]);
  *uint64_t v32 = v46;
  v32[1] = v22;
  char v33 = (uint64_t *)((char *)v19 + v17[8]);
  *char v33 = v45;
  v33[1] = v24;
  char v34 = (uint64_t *)((char *)v19 + v17[9]);
  *char v34 = v44;
  v34[1] = v26;
  sub_220D39114(v27, (uint64_t)v19 + v17[10], (uint64_t *)&unk_267F2F6A0);
  uint64_t v35 = (uint64_t *)((char *)v19 + v17[11]);
  *uint64_t v35 = sub_220EE4E40;
  v35[1] = v31;
  uint64_t v36 = (char *)v19 + v17[12];
  char v56 = 0;
  sub_220F32148();
  uint64_t v37 = v58;
  *uint64_t v36 = v57;
  *((void *)v36 + 1) = v37;
  uint64_t v38 = *(void *)(v28 + *(int *)(v54 + 28));
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  if (v38)
  {
    swift_retain();
    uint64_t v39 = sub_220F30938();
    uint64_t v40 = v53;
    sub_220EE538C((uint64_t)v19, v53, type metadata accessor for AppConfigurationHostView);
    uint64_t v41 = (uint64_t *)(v40 + *(int *)(v52 + 36));
    *uint64_t v41 = v39;
    v41[1] = v38;
    sub_220EE532C((uint64_t)v19, type metadata accessor for AppConfigurationHostView);
    return sub_220D39114(v40, v55, &qword_267F351F0);
  }
  else
  {
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EE2328@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v40 = a2;
  uint64_t v41 = a3;
  uint64_t v4 = type metadata accessor for FocusConfigurationAction(0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for FilterGridItem();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F351F8);
  MEMORY[0x270FA5388](v39);
  uint64_t v38 = (uint64_t)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6A0);
  MEMORY[0x223C75070]();
  uint64_t v12 = sub_220E0AD50((uint64_t)v6);
  uint64_t v36 = v13;
  uint64_t v37 = v12;
  sub_220EE532C((uint64_t)v6, type metadata accessor for FocusConfigurationAction);
  MEMORY[0x223C75070](v11);
  uint64_t v14 = sub_220E0AE5C((uint64_t)v6);
  uint64_t v16 = v15;
  sub_220EE532C((uint64_t)v6, type metadata accessor for FocusConfigurationAction);
  if (v16)
  {
    uint64_t v35 = v14;
  }
  else
  {
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_220F30408();
    uint64_t v16 = v17;
  }
  type metadata accessor for AppIconCache();
  sub_220EE50B8((unint64_t *)&qword_267F301C0, (void (*)(uint64_t))type metadata accessor for AppIconCache);
  swift_retain();
  uint64_t v18 = sub_220F30EA8();
  uint64_t v20 = v19;
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t *v9 = sub_220F30EA8();
  v9[1] = v22;
  uint64_t v23 = (uint64_t *)((char *)v9 + v7[5]);
  *uint64_t v23 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v24 = (uint64_t *)((char *)v9 + v7[6]);
  *uint64_t v24 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = (uint64_t *)((char *)v9 + v7[7]);
  uint64_t v26 = v36;
  *uint64_t v25 = v37;
  v25[1] = v26;
  uint64_t v27 = (uint64_t *)((char *)v9 + v7[8]);
  *uint64_t v27 = v35;
  v27[1] = v16;
  *(uint64_t *)((char *)v9 + v7[9]) = 0;
  uint64_t v28 = (char *)v9 + v7[10];
  *(void *)uint64_t v28 = a1;
  *((void *)v28 + 1) = 0x4038000000000000;
  *((void *)v28 + 2) = v18;
  *((void *)v28 + 3) = v20;
  *((void *)v28 + 4) = KeyPath;
  v28[40] = 0;
  *((unsigned char *)v9 + v7[11]) = 0;
  *((unsigned char *)v9 + v7[12]) = 1;
  *((unsigned char *)v9 + v7[13]) = 1;
  *((unsigned char *)v9 + v7[14]) = 1;
  type metadata accessor for AddAppFiltersView();
  uint64_t v29 = sub_220F30AF8();
  uint64_t v30 = sub_220F30938();
  uint64_t v31 = v38;
  sub_220EE538C((uint64_t)v9, v38, (uint64_t (*)(void))type metadata accessor for FilterGridItem);
  uint64_t v32 = (uint64_t *)(v31 + *(int *)(v39 + 36));
  *uint64_t v32 = v30;
  v32[1] = v29;
  sub_220EE532C((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for FilterGridItem);
  return sub_220D39114(v31, v41, &qword_267F351F8);
}

uint64_t sub_220EE2784@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v100 = a1;
  uint64_t v104 = a2;
  uint64_t v101 = sub_220F31578();
  MEMORY[0x270FA5388](v101);
  v102 = (char **)((char *)&v82 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBC8);
  MEMORY[0x270FA5388](v106);
  uint64_t v110 = (uint64_t *)((char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBF0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C78);
  MEMORY[0x270FA5388](v105);
  uint64_t v93 = (char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C80);
  MEMORY[0x270FA5388](v108);
  uint64_t v109 = (uint64_t)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C70);
  MEMORY[0x270FA5388](v107);
  uint64_t v103 = (uint64_t)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v111 = (uint64_t)&v82 - v11;
  MEMORY[0x270FA5388](v12);
  uint64_t v113 = (uint64_t)&v82 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v112 = (uint64_t)&v82 - v15;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v99 = v115;
  int v98 = v116;
  uint64_t v97 = v117;
  int v96 = v118;
  uint64_t v95 = v119;
  uint64_t v94 = v120;
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v127 = sub_220F30408();
  uint64_t v128 = v16;
  unint64_t v86 = sub_220D292B8();
  uint64_t v17 = sub_220F31B28();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_220F319E8();
  uint64_t v22 = sub_220F31AF8();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release();
  char v29 = v26 & 1;
  sub_220D357E0(v17, v19, v21);
  swift_bridgeObjectRelease();
  uint64_t v84 = sub_220F31AD8();
  uint64_t v30 = *(void *)(v84 - 8);
  uint64_t v83 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56);
  unint64_t v85 = (char **)(v30 + 56);
  uint64_t v31 = (uint64_t)v6;
  v83(v6, 1, 1, v84);
  uint64_t KeyPath = swift_getKeyPath();
  char v33 = v110;
  uint64_t v34 = (uint64_t)v110 + *(int *)(v106 + 28);
  uint64_t v82 = v6;
  sub_220D26548((uint64_t)v6, v34, &qword_267F2EBF0);
  *char v33 = KeyPath;
  uint64_t v35 = (uint64_t)v93;
  sub_220D26548((uint64_t)v33, (uint64_t)&v93[*(int *)(v105 + 36)], &qword_267F2EBC8);
  *(void *)uint64_t v35 = v22;
  *(void *)(v35 + 8) = v24;
  *(unsigned char *)(v35 + 16) = v29;
  *(void *)(v35 + 24) = v28;
  sub_220D3570C(v22, v24, v29);
  swift_bridgeObjectRetain();
  sub_220D25B68((uint64_t)v33, &qword_267F2EBC8);
  sub_220D25B68(v31, &qword_267F2EBF0);
  sub_220D357E0(v22, v24, v29);
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_220F31FE8();
  uint64_t v37 = swift_getKeyPath();
  uint64_t v38 = v109;
  sub_220D26548(v35, v109, &qword_267F34C78);
  uint64_t v39 = (uint64_t *)(v38 + *(int *)(v108 + 36));
  uint64_t *v39 = v37;
  v39[1] = v36;
  sub_220D25B68(v35, &qword_267F34C78);
  LOBYTE(v36) = sub_220F31808();
  uint64_t v40 = v113;
  sub_220D26548(v38, v113, &qword_267F34C80);
  uint64_t v41 = v40 + *(int *)(v107 + 36);
  *(unsigned char *)uint64_t v41 = v36;
  *(_OWORD *)(v41 + 8) = 0u;
  *(_OWORD *)(v41 + 24) = 0u;
  *(unsigned char *)(v41 + 40) = 1;
  sub_220D25B68(v38, &qword_267F34C80);
  sub_220D39114(v40, v112, &qword_267F34C70);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v92 = v121;
  int v91 = v122;
  uint64_t v90 = v123;
  int v89 = v124;
  uint64_t v88 = v125;
  uint64_t v87 = v126;
  uint64_t v127 = sub_220F30408();
  uint64_t v128 = v42;
  uint64_t v43 = sub_220F31B28();
  uint64_t v45 = v44;
  char v47 = v46 & 1;
  sub_220F319D8();
  uint64_t v48 = sub_220F31AF8();
  uint64_t v50 = v49;
  LOBYTE(v17) = v51;
  uint64_t v53 = v52;
  swift_release();
  sub_220D357E0(v43, v45, v47);
  swift_bridgeObjectRelease();
  uint64_t v54 = (uint64_t)v82;
  v83(v82, 1, 1, v84);
  uint64_t v55 = swift_getKeyPath();
  char v56 = v110;
  sub_220D26548(v54, (uint64_t)v110 + *(int *)(v106 + 28), &qword_267F2EBF0);
  *char v56 = v55;
  sub_220D26548((uint64_t)v56, v35 + *(int *)(v105 + 36), &qword_267F2EBC8);
  *(void *)uint64_t v35 = v48;
  *(void *)(v35 + 8) = v50;
  *(unsigned char *)(v35 + 16) = v17 & 1;
  *(void *)(v35 + 24) = v53;
  sub_220D3570C(v48, v50, v17 & 1);
  swift_bridgeObjectRetain();
  sub_220D25B68((uint64_t)v56, &qword_267F2EBC8);
  sub_220D25B68(v54, &qword_267F2EBF0);
  sub_220D357E0(v48, v50, v17 & 1);
  swift_bridgeObjectRelease();
  uint64_t v57 = sub_220F31FF8();
  uint64_t v58 = swift_getKeyPath();
  uint64_t v59 = v109;
  sub_220D26548(v35, v109, &qword_267F34C78);
  uint64_t v60 = (uint64_t *)(v59 + *(int *)(v108 + 36));
  *uint64_t v60 = v58;
  v60[1] = v57;
  sub_220D25B68(v35, &qword_267F34C78);
  LOBYTE(v57) = sub_220F31808();
  uint64_t v61 = v111;
  sub_220D26548(v59, v111, &qword_267F34C80);
  uint64_t v62 = v61 + *(int *)(v107 + 36);
  *(unsigned char *)uint64_t v62 = v57;
  *(_OWORD *)(v62 + 8) = 0u;
  *(_OWORD *)(v62 + 24) = 0u;
  *(unsigned char *)(v62 + 40) = 1;
  sub_220D25B68(v59, &qword_267F34C80);
  sub_220D39114(v61, v113, &qword_267F34C70);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v109 = v127;
  LODWORD(v108) = v128;
  uint64_t v107 = v129;
  LODWORD(v106) = v130;
  uint64_t v105 = v131;
  uint64_t v93 = v132;
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35218);
  uint64_t v110 = (uint64_t *)&v82;
  uint64_t v82 = (char *)v63;
  uint64_t v64 = *(void **)(v63 - 8);
  uint64_t v65 = v64[8];
  MEMORY[0x270FA5388](v63);
  unint64_t v86 = (v65 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v66 = (char *)&v82 - v86;
  uint64_t v83 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_220EDE910();
  unint64_t v85 = &v82;
  MEMORY[0x270FA5388](v83);
  sub_220F31348();
  int v114 = 0;
  sub_220EE50B8(&qword_267F30150, MEMORY[0x263F19D28]);
  sub_220F32FC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35220);
  sub_220EE4B18(&qword_267F35228, &qword_267F35220, (void (*)(void))sub_220EE4E90);
  uint64_t v84 = (uint64_t)v66;
  sub_220F324D8();
  sub_220D26548(v112, v61, &qword_267F34C70);
  uint64_t v67 = v103;
  uint64_t v68 = sub_220D26548(v113, v103, &qword_267F34C70);
  v102 = &v82;
  __n128 v69 = MEMORY[0x270FA5388](v68);
  uint64_t v70 = (char *)&v82 - v86;
  uint64_t v71 = (void (*)(char *, char *, uint64_t, __n128))v64[2];
  v71((char *)&v82 - v86, v66, v63, v69);
  uint64_t v72 = v104;
  *uint64_t v104 = 0;
  *((unsigned char *)v72 + 8) = 1;
  v72[2] = v99;
  *((unsigned char *)v72 + 24) = v98;
  v72[4] = v97;
  *((unsigned char *)v72 + 40) = v96;
  uint64_t v73 = v94;
  v72[6] = v95;
  v72[7] = v73;
  uint64_t v74 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35250);
  sub_220D26548(v61, (uint64_t)v72 + v74[12], &qword_267F34C70);
  uint64_t v75 = (char *)v72 + v74[16];
  *(void *)uint64_t v75 = 0;
  v75[8] = 1;
  *((void *)v75 + 2) = v92;
  v75[24] = v91;
  *((void *)v75 + 4) = v90;
  v75[40] = v89;
  uint64_t v76 = v87;
  *((void *)v75 + 6) = v88;
  *((void *)v75 + 7) = v76;
  sub_220D26548(v67, (uint64_t)v72 + v74[20], &qword_267F34C70);
  uint64_t v77 = (char *)v72 + v74[24];
  *(void *)uint64_t v77 = 0;
  v77[8] = 1;
  *((void *)v77 + 2) = v109;
  v77[24] = v108;
  *((void *)v77 + 4) = v107;
  v77[40] = v106;
  v78 = v93;
  *((void *)v77 + 6) = v105;
  *((void *)v77 + 7) = v78;
  uint64_t v79 = v82;
  ((void (*)(char *, char *, char *))v71)((char *)v72 + v74[28], v70, v82);
  uint64_t v80 = (void (*)(uint64_t, char *))v64[1];
  v80(v84, v79);
  sub_220D25B68(v113, &qword_267F34C70);
  sub_220D25B68(v112, &qword_267F34C70);
  v80((uint64_t)v70, v79);
  sub_220D25B68(v67, &qword_267F34C70);
  return sub_220D25B68(v111, &qword_267F34C70);
}

uint64_t sub_220EE3570(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AddAppFiltersView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  sub_220F30E78();
  swift_getKeyPath();
  sub_220F30E98();
  swift_release();
  swift_release();
  uint64_t v8 = v10;
  long long v9 = v11;
  sub_220EE538C(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  sub_220EE53F4((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EDD0);
  sub_220F30638();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35238);
  sub_220D36278();
  sub_220EE4E90();
  sub_220D36408();
  return sub_220F32358();
}

uint64_t sub_220EE37B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35258);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FocusSystemConfigurationAction(0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  long long v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35238);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6D0);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D26548(a1, (uint64_t)v17, (uint64_t *)&unk_267F2F6D0);
  MEMORY[0x223C75070](v15);
  LODWORD(v15) = v11[*(int *)(v9 + 28)];
  uint64_t v18 = sub_220EE532C((uint64_t)v11, type metadata accessor for FocusSystemConfigurationAction);
  if (v15 == 1)
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35248);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 1, 1, v19);
  }
  else
  {
    MEMORY[0x270FA5388](v18);
    *(&v22 - 2) = (uint64_t)v17;
    *(&v22 - 1) = a2;
    sub_220EE3ADC(a2, (uint64_t)v7);
    type metadata accessor for FilterGridItem();
    sub_220EE50B8(&qword_267F2EE98, (void (*)(uint64_t))type metadata accessor for FilterGridItem);
    sub_220EE4FE8();
    sub_220F30C78();
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35248);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 0, 1, v20);
  }
  sub_220D39114((uint64_t)v14, v23, &qword_267F35238);
  return sub_220D25B68((uint64_t)v17, (uint64_t *)&unk_267F2F6D0);
}

uint64_t sub_220EE3ADC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v50 = a2;
  uint64_t v2 = type metadata accessor for AddAppFiltersView();
  uint64_t v3 = v2 - 8;
  uint64_t v46 = *(void *)(v2 - 8);
  uint64_t v45 = *(void *)(v46 + 64);
  MEMORY[0x270FA5388](v2);
  uint64_t v44 = (uint64_t)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6D0);
  MEMORY[0x270FA5388](v5);
  uint64_t v43 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for FocusSystemConfigurationAction(0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v41 - v12;
  uint64_t v14 = type metadata accessor for SystemConfigurationHostView(0);
  uint64_t v15 = (int *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (uint64_t *)((char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35258);
  __n128 v18 = MEMORY[0x270FA5388](v48);
  uint64_t v49 = (uint64_t)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x223C75070](v5, v18);
  id v20 = *(id *)&v13[*(int *)(v8 + 40)];
  sub_220EE532C((uint64_t)v13, type metadata accessor for FocusSystemConfigurationAction);
  id v21 = objc_msgSend(v20, sel_title);

  uint64_t v22 = sub_220F32768();
  uint64_t v41 = v23;
  uint64_t v42 = v22;

  MEMORY[0x223C75070](v5);
  uint64_t v24 = &v10[*(int *)(v8 + 36)];
  uint64_t v26 = *(void *)v24;
  uint64_t v25 = *((void *)v24 + 1);
  swift_bridgeObjectRetain();
  sub_220EE532C((uint64_t)v10, type metadata accessor for FocusSystemConfigurationAction);
  uint64_t v27 = (uint64_t)v43;
  sub_220F322D8();
  uint64_t v28 = v47;
  uint64_t v29 = v44;
  sub_220EE538C(v47, v44, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  unint64_t v30 = (*(unsigned __int8 *)(v46 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
  uint64_t v31 = swift_allocObject();
  sub_220EE53F4(v29, v31 + v30, (uint64_t (*)(void))type metadata accessor for AddAppFiltersView);
  uint64_t *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = (uint64_t *)((char *)v17 + v15[7]);
  uint64_t v33 = v41;
  *uint64_t v32 = v42;
  v32[1] = v33;
  uint64_t v34 = (uint64_t *)((char *)v17 + v15[8]);
  *uint64_t v34 = v26;
  v34[1] = v25;
  sub_220D39114(v27, (uint64_t)v17 + v15[9], (uint64_t *)&unk_267F2F6D0);
  uint64_t v35 = (uint64_t *)((char *)v17 + v15[10]);
  *uint64_t v35 = sub_220EE4E40;
  v35[1] = v31;
  uint64_t v36 = *(void *)(v28 + *(int *)(v3 + 28));
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  if (v36)
  {
    swift_retain();
    uint64_t v37 = sub_220F30938();
    uint64_t v38 = v49;
    sub_220EE538C((uint64_t)v17, v49, type metadata accessor for SystemConfigurationHostView);
    uint64_t v39 = (uint64_t *)(v38 + *(int *)(v48 + 36));
    uint64_t *v39 = v37;
    v39[1] = v36;
    sub_220EE532C((uint64_t)v17, type metadata accessor for SystemConfigurationHostView);
    return sub_220D39114(v38, v50, &qword_267F35258);
  }
  else
  {
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

void sub_220EE3FC8(char a1)
{
  uint64_t v2 = sub_220F30E48();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_220F115A8((uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    MEMORY[0x223C75070](v3);
    sub_220F30E38();
    sub_220F322B8();
    sub_220D25B68((uint64_t)v5, &qword_267F2EA00);
  }
}

uint64_t sub_220EE40D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v39 = a1;
  uint64_t v1 = type metadata accessor for FocusSystemConfigurationAction(0);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v36 - v5;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v36 - v8;
  uint64_t v10 = (int *)type metadata accessor for FilterGridItem();
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t *)((char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2F6D0);
  MEMORY[0x223C75070]();
  id v14 = *(id *)&v9[*(int *)(v1 + 32)];
  sub_220EE532C((uint64_t)v9, type metadata accessor for FocusSystemConfigurationAction);
  id v15 = objc_msgSend(v14, sel_title);

  uint64_t v16 = sub_220F32768();
  uint64_t v37 = v17;
  uint64_t v38 = v16;

  MEMORY[0x223C75070](v13);
  id v18 = *(id *)&v6[*(int *)(v1 + 32)];
  sub_220EE532C((uint64_t)v6, type metadata accessor for FocusSystemConfigurationAction);
  id v19 = objc_msgSend(v18, sel_subtitle);

  if (v19)
  {
    uint64_t v20 = sub_220F32768();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v22 = 0;
  }
  uint64_t v23 = v39;
  MEMORY[0x223C75070](v13);
  id v24 = objc_msgSend(*(id *)&v3[*(int *)(v1 + 32)], sel_icon);
  uint64_t v25 = v24;
  if (v24)
  {
    id v26 = objc_msgSend(v24, sel_systemName);

    if (v26)
    {
      sub_220F32768();

      uint64_t v25 = (void *)sub_220F320A8();
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  uint64_t v28 = v37;
  uint64_t v27 = v38;
  sub_220EE532C((uint64_t)v3, type metadata accessor for FocusSystemConfigurationAction);
  type metadata accessor for ActivityConfigViewModel();
  sub_220EE50B8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *uint64_t v12 = sub_220F30EA8();
  v12[1] = v29;
  unint64_t v30 = (uint64_t *)((char *)v12 + v10[5]);
  *unint64_t v30 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v31 = (uint64_t *)((char *)v12 + v10[6]);
  uint64_t *v31 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = (uint64_t *)((char *)v12 + v10[7]);
  *uint64_t v32 = v27;
  v32[1] = v28;
  uint64_t v33 = (uint64_t *)((char *)v12 + v10[8]);
  *uint64_t v33 = v20;
  v33[1] = v22;
  *(uint64_t *)((char *)v12 + v10[9]) = (uint64_t)v25;
  uint64_t v34 = (_OWORD *)((char *)v12 + v10[10]);
  *(_OWORD *)((char *)v34 + 25) = 0u;
  *uint64_t v34 = 0u;
  v34[1] = 0u;
  *((unsigned char *)v12 + v10[11]) = 0;
  *((unsigned char *)v12 + v10[12]) = 1;
  *((unsigned char *)v12 + v10[13]) = 1;
  *((unsigned char *)v12 + v10[14]) = 1;
  return sub_220EE53F4((uint64_t)v12, v23, (uint64_t (*)(void))type metadata accessor for FilterGridItem);
}

uint64_t sub_220EE44B4()
{
  return sub_220F30C98();
}

uint64_t sub_220EE45DC@<X0>(uint64_t a1@<X8>)
{
  return sub_220EDDF38(*(void *)(v1 + 16), a1);
}

unint64_t sub_220EE45E4()
{
  unint64_t result = qword_267F350C0;
  if (!qword_267F350C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F350B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F350C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F350D0);
    sub_220EE46E4();
    swift_getOpaqueTypeConformance2();
    sub_220D292B8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F350C0);
  }
  return result;
}

unint64_t sub_220EE46E4()
{
  unint64_t result = qword_267F350D8;
  if (!qword_267F350D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F350D0);
    sub_220D25FB0(&qword_267F350E0, &qword_267F350E8);
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F350D8);
  }
  return result;
}

uint64_t sub_220EE47A8@<X0>(uint64_t a1@<X8>)
{
  return sub_220EDEF78(*(char ***)(v1 + 16), a1);
}

unint64_t sub_220EE47B0()
{
  unint64_t result = qword_267F35100;
  if (!qword_267F35100)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F350F8);
    sub_220D25FB0(&qword_267F35108, &qword_267F35110);
    sub_220EE4850();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35100);
  }
  return result;
}

unint64_t sub_220EE4850()
{
  unint64_t result = qword_267F35118;
  if (!qword_267F35118)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35120);
    sub_220D25FB0(&qword_267F35128, &qword_267F35130);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35118);
  }
  return result;
}

uint64_t sub_220EE48F0()
{
  return sub_220EDE594(*(void *)(v0 + 16));
}

uint64_t sub_220EE48F8()
{
  return sub_220EDE75C(*(void *)(v0 + 16));
}

void sub_220EE4904()
{
}

unint64_t *sub_220EE4960(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_220ED1108((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_220ED1108((unint64_t *)v7, v4, v2);
    swift_release();
    MEMORY[0x223C76830](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_220EE4AD4()
{
  return sub_220EE150C(*(void *)(v0 + 16));
}

uint64_t sub_220EE4ADC()
{
  return sub_220EE4B18(&qword_267F351B8, &qword_267F351C0, (void (*)(void))sub_220EE4B84);
}

uint64_t sub_220EE4B18(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_220EE4B84()
{
  unint64_t result = qword_267F351C8;
  if (!qword_267F351C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F351D0);
    sub_220D25FB0(&qword_267F351D8, &qword_267F351E0);
    sub_220EE50B8((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F351C8);
  }
  return result;
}

uint64_t sub_220EE4C60(uint64_t a1)
{
  return sub_220EE4F4C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_220EE1754);
}

uint64_t sub_220EE4C78@<X0>(uint64_t a1@<X8>)
{
  return sub_220EE2328(*(void *)(v1 + 24), *(void *)(v1 + 32), a1);
}

unint64_t sub_220EE4C84()
{
  unint64_t result = qword_267F35200;
  if (!qword_267F35200)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F351F8);
    sub_220EE50B8(&qword_267F2EE98, (void (*)(uint64_t))type metadata accessor for FilterGridItem);
    sub_220D25FB0((unint64_t *)&qword_267F2EEB0, (uint64_t *)&unk_267F338A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35200);
  }
  return result;
}

unint64_t sub_220EE4D54()
{
  unint64_t result = qword_267F35208;
  if (!qword_267F35208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F351F0);
    sub_220EE50B8(&qword_267F35210, (void (*)(uint64_t))type metadata accessor for AppConfigurationHostView);
    sub_220D25FB0((unint64_t *)&qword_267F2EEA0, &qword_267F2EEA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35208);
  }
  return result;
}

uint64_t sub_220EE4E50()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_220EE4E88()
{
  return sub_220EE3570(*(void *)(v0 + 16));
}

unint64_t sub_220EE4E90()
{
  unint64_t result = qword_267F35230;
  if (!qword_267F35230)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35238);
    sub_220D25FB0(&qword_267F35240, &qword_267F35248);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35230);
  }
  return result;
}

uint64_t sub_220EE4F34(uint64_t a1)
{
  return sub_220EE4F4C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_220EE37B8);
}

uint64_t sub_220EE4F4C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for AddAppFiltersView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

uint64_t sub_220EE4FE0@<X0>(uint64_t a1@<X8>)
{
  return sub_220EE40D8(a1);
}

unint64_t sub_220EE4FE8()
{
  unint64_t result = qword_267F35260;
  if (!qword_267F35260)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35258);
    sub_220EE50B8(&qword_267F35268, (void (*)(uint64_t))type metadata accessor for SystemConfigurationHostView);
    sub_220D25FB0((unint64_t *)&qword_267F2EEA0, &qword_267F2EEA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35260);
  }
  return result;
}

uint64_t sub_220EE50B8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroyTm_19()
{
  uint64_t v1 = type metadata accessor for AddAppFiltersView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v8 = sub_220F30E48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  swift_release();
  uint64_t v9 = v5 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC20);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30D08();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  }
  else
  {
    swift_release();
  }
  sub_220D359A4();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

void sub_220EE52C8(char a1)
{
}

uint64_t sub_220EE532C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_220EE538C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220EE53F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_220EE545C()
{
  return sub_220D25FB0(&qword_267F35270, &qword_267F35278);
}

uint64_t sub_220EE5498@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *a1 = sub_220F30EA8();
  a1[1] = v2;
  uint64_t v3 = (int *)type metadata accessor for FacesAndPagesPicker(0);
  uint64_t v4 = (uint64_t *)((char *)a1 + v3[5]);
  *uint64_t v4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v5 = (uint64_t *)((char *)a1 + v3[6]);
  uint64_t *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = (uint64_t *)((char *)a1 + v3[7]);
  *uint64_t v6 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (char *)a1 + v3[8];
  sub_220F32148();
  *uint64_t v7 = v17;
  *((void *)v7 + 1) = v18;
  uint64_t v8 = (char *)a1 + v3[9];
  sub_220F32148();
  *uint64_t v8 = v17;
  *((void *)v8 + 1) = v18;
  uint64_t v9 = (char *)a1 + v3[10];
  sub_220F32148();
  char *v9 = v17;
  *((void *)v9 + 1) = v18;
  uint64_t v10 = (char *)a1 + v3[11];
  sub_220F32148();
  char *v10 = v17;
  *((void *)v10 + 1) = v18;
  uint64_t v11 = (char *)a1 + v3[12];
  sub_220F32148();
  *uint64_t v11 = v17;
  *((void *)v11 + 1) = v18;
  uint64_t v12 = (char *)a1 + v3[13];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35290);
  sub_220F32148();
  *(void *)uint64_t v12 = v17;
  v12[8] = v18;
  *((void *)v12 + 2) = v19;
  uint64_t v13 = (char *)a1 + v3[14];
  sub_220F32148();
  char *v13 = v17;
  *((void *)v13 + 1) = v18;
  id v14 = (char *)a1 + v3[15];
  sub_220F32148();
  char *v14 = v17;
  *((void *)v14 + 1) = v18;
  id v15 = (char *)a1 + v3[16];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35298);
  uint64_t result = sub_220F32148();
  *(void *)id v15 = v17;
  v15[8] = v18;
  *((void *)v15 + 2) = v19;
  return result;
}

uint64_t type metadata accessor for FacesAndPagesPicker(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F352A0);
}

void sub_220EE57B0()
{
  qword_267F35280 = 0x4060400000000000;
}

void sub_220EE57C4()
{
  qword_267F35288 = 0x4066800000000000;
}

uint64_t sub_220EE57D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v82 = a1;
  uint64_t v3 = type metadata accessor for FacesAndPagesPicker(0);
  uint64_t v84 = *(void *)(v3 - 8);
  uint64_t v4 = *(void *)(v84 + 64);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v65 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F352B0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v85 = (uint64_t (*)(void))__swift_instantiateConcreteTypeFromMangledName(&qword_267F352B8);
  MEMORY[0x270FA5388](v85);
  uint64_t v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F352C0);
  MEMORY[0x270FA5388](v73);
  id v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F352C8);
  MEMORY[0x270FA5388](v74);
  uint64_t v76 = (uint64_t)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F352D0);
  MEMORY[0x270FA5388](v80);
  uint64_t v81 = (uint64_t)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F352D8);
  MEMORY[0x270FA5388](v78);
  uint64_t v79 = (uint64_t)&v65 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F352E0);
  MEMORY[0x270FA5388](v75);
  uint64_t v77 = (uint64_t)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v11 = sub_220F31228();
  *((void *)v11 + 1) = 0;
  v11[16] = 0;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F352E8);
  sub_220EE6248(v1, &v11[*(int *)(v20 + 44)]);
  uint64_t v21 = v1 + *(int *)(v3 + 64);
  uint64_t v22 = *(void *)v21;
  char v23 = *(unsigned char *)(v21 + 8);
  uint64_t v24 = *(void *)(v21 + 16);
  *(void *)&long long v88 = v22;
  BYTE8(v88) = v23;
  *(void *)&long long v89 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F352F0);
  sub_220F32158();
  char v25 = v87;
  sub_220EFDE78(v2, (uint64_t)v8, type metadata accessor for FacesAndPagesPicker);
  if (v25)
  {
    id v26 = &v8[*(int *)(v3 + 60)];
    char v27 = *v26;
    uint64_t v28 = *((void *)v26 + 1);
    LOBYTE(v88) = v27;
    *((void *)&v88 + 1) = v28;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
    sub_220F32158();
    sub_220EE6678(v86);
  }
  sub_220EFDEE0((uint64_t)v8, type metadata accessor for FacesAndPagesPicker);
  sub_220F32468();
  sub_220F30E68();
  sub_220D26548((uint64_t)v11, (uint64_t)v13, &qword_267F352B0);
  uint64_t v29 = &v13[*((int *)v85 + 9)];
  long long v30 = v93;
  *((_OWORD *)v29 + 4) = v92;
  *((_OWORD *)v29 + 5) = v30;
  *((_OWORD *)v29 + 6) = v94;
  long long v31 = v89;
  *(_OWORD *)uint64_t v29 = v88;
  *((_OWORD *)v29 + 1) = v31;
  long long v32 = v91;
  *((_OWORD *)v29 + 2) = v90;
  *((_OWORD *)v29 + 3) = v32;
  sub_220D25B68((uint64_t)v11, &qword_267F352B0);
  uint64_t v72 = v2;
  unint64_t v85 = type metadata accessor for FacesAndPagesPicker;
  sub_220EFDE78(v2, (uint64_t)v5, type metadata accessor for FacesAndPagesPicker);
  uint64_t v33 = *(unsigned __int8 *)(v84 + 80);
  uint64_t v34 = (v33 + 16) & ~v33;
  uint64_t v83 = v33 | 7;
  uint64_t v84 = v34 + v4;
  uint64_t v35 = swift_allocObject();
  sub_220EFF25C((uint64_t)v5, v35 + v34, type metadata accessor for FacesAndPagesPicker);
  sub_220D26548((uint64_t)v13, (uint64_t)v15, &qword_267F352B8);
  uint64_t v36 = (uint64_t (**)())&v15[*(int *)(v73 + 36)];
  *uint64_t v36 = sub_220EFD6FC;
  v36[1] = (uint64_t (*)())v35;
  v36[2] = 0;
  v36[3] = 0;
  sub_220D25B68((uint64_t)v13, &qword_267F352B8);
  sub_220EFDE78(v2, (uint64_t)v5, type metadata accessor for FacesAndPagesPicker);
  uint64_t v37 = swift_allocObject();
  uint64_t v38 = v34;
  uint64_t v70 = v34;
  __n128 v69 = type metadata accessor for FacesAndPagesPicker;
  sub_220EFF25C((uint64_t)v5, v37 + v34, type metadata accessor for FacesAndPagesPicker);
  uint64_t v39 = v76;
  sub_220D26548((uint64_t)v15, v76, &qword_267F352C0);
  uint64_t v40 = (void *)(v39 + *((int *)v74 + 9));
  *uint64_t v40 = 0;
  v40[1] = 0;
  v40[2] = sub_220EFDA60;
  v40[3] = v37;
  sub_220D25B68((uint64_t)v15, &qword_267F352C0);
  uint64_t v65 = sub_220F32AA8();
  uint64_t v74 = &v65;
  uint64_t v41 = *(void *)(v65 - 8);
  uint64_t v71 = *(void *)(v41 + 64);
  MEMORY[0x270FA5388](v65);
  unint64_t v73 = (v42 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v43 = (char *)&v65 - v73;
  id v68 = self;
  id v44 = objc_msgSend(v68, sel_defaultCenter);
  sub_220F32AB8();

  uint64_t v45 = v72;
  sub_220EFDE78(v72, (uint64_t)v5, v85);
  uint64_t v46 = swift_allocObject();
  sub_220EFF25C((uint64_t)v5, v46 + v38, type metadata accessor for FacesAndPagesPicker);
  uint64_t v47 = v77;
  sub_220D26548(v39, v77, &qword_267F352C8);
  uint64_t v48 = v75;
  uint64_t v49 = v47 + *(int *)(v75 + 52);
  uint64_t v50 = v41;
  uint64_t v66 = *(void (**)(uint64_t, char *, uint64_t))(v41 + 16);
  uint64_t v67 = v41 + 16;
  uint64_t v51 = v65;
  v66(v49, v43, v65);
  uint64_t v52 = (uint64_t (**)(uint64_t))(v47 + *(int *)(v48 + 56));
  *uint64_t v52 = sub_220EFDB0C;
  v52[1] = (uint64_t (*)(uint64_t))v46;
  uint64_t v53 = *(void (**)(char *, uint64_t))(v50 + 8);
  v53(v43, v51);
  uint64_t v54 = sub_220D25B68(v39, &qword_267F352C8);
  *(void *)&double v55 = MEMORY[0x270FA5388](v54).n128_u64[0];
  char v56 = (char *)&v65 - v73;
  id v57 = objc_msgSend(v68, sel_defaultCenter, v55);
  sub_220F32AB8();

  sub_220EFDE78(v45, (uint64_t)v5, v85);
  uint64_t v58 = swift_allocObject();
  sub_220EFF25C((uint64_t)v5, v58 + v70, v69);
  uint64_t v59 = v79;
  sub_220D26548(v47, v79, &qword_267F352E0);
  uint64_t v60 = v78;
  v66(v59 + *(int *)(v78 + 52), v56, v51);
  uint64_t v61 = (uint64_t (**)(uint64_t))(v59 + *(int *)(v60 + 56));
  *uint64_t v61 = sub_220EFDB3C;
  v61[1] = (uint64_t (*)(uint64_t))v58;
  v53(v56, v51);
  sub_220D25B68(v47, &qword_267F352E0);
  LOBYTE(v58) = sub_220F31878();
  uint64_t v62 = v81;
  sub_220D26548(v59, v81, &qword_267F352D8);
  uint64_t v63 = v62 + *(int *)(v80 + 36);
  *(unsigned char *)uint64_t v63 = v58;
  *(_OWORD *)(v63 + 8) = 0u;
  *(_OWORD *)(v63 + 24) = 0u;
  *(unsigned char *)(v63 + 40) = 1;
  sub_220D25B68(v59, &qword_267F352D8);
  return sub_220D39114(v62, v82, &qword_267F352D0);
}

uint64_t sub_220EE6248@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v60 = a2;
  uint64_t v3 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v4 = (int *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (uint64_t *)&v49[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35300);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v59 = &v49[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v49[-v11];
  MEMORY[0x270FA5388](v13);
  id v15 = &v49[-v14];
  uint64_t v16 = (int *)type metadata accessor for FacesAndPagesPicker(0);
  uint64_t v17 = (char *)(a1 + v16[8]);
  char v18 = *v17;
  uint64_t v19 = *((void *)v17 + 1);
  char v61 = v18;
  uint64_t v62 = v19;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  sub_220F32178();
  uint64_t v57 = v64;
  uint64_t v58 = v63;
  int v56 = v65;
  uint64_t v20 = (char *)(a1 + v16[9]);
  char v21 = *v20;
  uint64_t v22 = *((void *)v20 + 1);
  char v61 = v21;
  uint64_t v62 = v22;
  sub_220F32178();
  uint64_t v54 = v64;
  uint64_t v55 = v63;
  int v53 = v65;
  char v23 = (char *)(a1 + v16[10]);
  char v24 = *v23;
  uint64_t v25 = *((void *)v23 + 1);
  char v61 = v24;
  uint64_t v62 = v25;
  sub_220F32178();
  uint64_t v51 = v64;
  uint64_t v52 = v63;
  int v50 = v65;
  id v26 = (char *)(a1 + v16[15]);
  char v27 = *v26;
  uint64_t v28 = *((void *)v26 + 1);
  LOBYTE(v63) = v27;
  uint64_t v64 = v28;
  sub_220F32158();
  char v29 = v61;
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *uint64_t v6 = sub_220F30EA8();
  v6[1] = v30;
  long long v31 = (uint64_t *)((char *)v6 + v4[7]);
  uint64_t *v31 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  long long v32 = (char *)v6 + v4[8];
  uint64_t v33 = v57;
  *(void *)long long v32 = v58;
  *((void *)v32 + 1) = v33;
  v32[16] = v56;
  uint64_t v34 = (char *)v6 + v4[9];
  uint64_t v35 = v54;
  *(void *)uint64_t v34 = v55;
  *((void *)v34 + 1) = v35;
  v34[16] = v53;
  uint64_t v36 = (char *)v6 + v4[10];
  uint64_t v37 = v51;
  *(void *)uint64_t v36 = v52;
  *((void *)v36 + 1) = v37;
  v36[16] = v50;
  *((unsigned char *)v6 + v4[11]) = v29;
  uint64_t v38 = (uint64_t *)((char *)v6 + v4[12]);
  *uint64_t v38 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v39 = (char *)(a1 + v16[12]);
  char v40 = *v39;
  uint64_t v41 = *((void *)v39 + 1);
  LOBYTE(v63) = v40;
  uint64_t v64 = v41;
  sub_220F32158();
  if (v61) {
    double v42 = 1.0;
  }
  else {
    double v42 = 0.0;
  }
  sub_220EFDE78((uint64_t)v6, (uint64_t)v12, type metadata accessor for FacesAndPagesPicker.contents);
  *(double *)&v12[*(int *)(v8 + 44)] = v42;
  sub_220EFDEE0((uint64_t)v6, type metadata accessor for FacesAndPagesPicker.contents);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F35300);
  uint64_t v43 = v59;
  sub_220D26548((uint64_t)v15, (uint64_t)v59, &qword_267F35300);
  id v44 = v60;
  *uint64_t v60 = 0;
  *((unsigned char *)v44 + 8) = 1;
  uint64_t v45 = v44;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35308);
  sub_220D26548((uint64_t)v43, (uint64_t)v45 + *(int *)(v46 + 48), &qword_267F35300);
  uint64_t v47 = (uint64_t)v45 + *(int *)(v46 + 64);
  *(void *)uint64_t v47 = 0;
  *(unsigned char *)(v47 + 8) = 1;
  sub_220D25B68((uint64_t)v15, &qword_267F35300);
  return sub_220D25B68((uint64_t)v43, &qword_267F35300);
}

void sub_220EE6678(char a1)
{
  id v2 = objc_msgSend(self, sel_mainScreen);
  objc_msgSend(v2, sel_bounds);
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGRectGetWidth(v13);
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGRectGetHeight(v14);
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  CGRectGetWidth(v15);
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  CGRectGetHeight(v16);
  id v11 = objc_msgSend(self, sel_currentDevice);
  id v12 = objc_msgSend(v11, sel_userInterfaceIdiom);

  if (v12 == (id)1)
  {
    if (a1)
    {
      if (qword_267F2E150 == -1) {
        return;
      }
    }
    else if (qword_267F2E158 == -1)
    {
      return;
    }
    swift_once();
  }
}

void sub_220EE683C(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for FacesAndPagesPicker(0);
  uint64_t v59 = *(uint64_t **)(v2 - 8);
  uint64_t v3 = v59[8];
  MEMORY[0x270FA5388](v2);
  double v5 = (char *)a1 + *(int *)(v4 + 56);
  char v6 = *v5;
  uint64_t v7 = *((void *)v5 + 1);
  LOBYTE(aBlock) = *v5;
  uint64_t v63 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  sub_220F32158();
  if ((v68 & 1) == 0)
  {
    id v8 = objc_msgSend(self, sel_currentDevice);
    objc_msgSend(v8, sel_beginGeneratingDeviceOrientationNotifications);

    LOBYTE(aBlock) = v6;
    uint64_t v63 = v7;
    LOBYTE(v68) = 1;
    sub_220F32168();
  }
  id v9 = objc_msgSend(self, sel_sharedApplication);
  id v10 = objc_msgSend(v9, sel_connectedScenes);

  sub_220D25F48(0, &qword_267F31958);
  sub_220ED130C();
  uint64_t v11 = sub_220F32948();

  id v12 = (void *)sub_220DD4F88(v11);
  swift_bridgeObjectRelease();
  uint64_t v60 = (uint64_t *)((char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v12)
  {
    self;
    CGRect v13 = (void *)swift_dynamicCastObjCClass();
    if (v13)
    {
      id v61 = v13;
      id v14 = objc_msgSend(v13, sel_interfaceOrientation);
      char v15 = 0;
      goto LABEL_8;
    }
  }
  id v14 = 0;
  id v61 = 0;
  char v15 = 1;
LABEL_8:
  CGRect v16 = (char *)a1 + *(int *)(v2 + 52);
  char v18 = v16[8];
  uint64_t v19 = (uint64_t (*)(uint64_t))*((void *)v16 + 2);
  uint64_t aBlock = *(void *)v16;
  uint64_t v17 = aBlock;
  LOBYTE(v63) = v18;
  uint64_t v64 = v19;
  uint64_t v68 = (uint64_t)v14;
  char v69 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F352F8);
  sub_220F32168();
  uint64_t aBlock = v17;
  LOBYTE(v63) = v18;
  uint64_t v64 = v19;
  sub_220F32158();
  if (v69) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v68;
  }
  sub_220EE7138(v20);
  char v21 = (char *)a1 + *(int *)(v2 + 44);
  uint64_t v23 = *((void *)v21 + 1);
  LOBYTE(aBlock) = *v21;
  char v22 = aBlock;
  uint64_t v63 = v23;
  sub_220F32158();
  int v24 = v68;
  LOBYTE(aBlock) = v22;
  uint64_t v63 = v23;
  LOBYTE(v68) = 1;
  sub_220F32168();
  if (v24 == 1)
  {
    if (v61)
    {
      uint64_t v25 = (uint64_t)objc_msgSend(v61, sel_interfaceOrientation);
      uint64_t v26 = *a1;
      if (*a1) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v25 = 1;
      uint64_t v26 = *a1;
      if (*a1)
      {
LABEL_14:
        swift_retain();
        sub_220DEDD08(v25);
        swift_release();
        swift_retain();
        sub_220DE92DC();
        swift_release();
        if (!*(void *)(v26
                        + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshotsForSuggestedPages))
        {
          swift_retain();
          sub_220DE9E7C(0);
          swift_release();
        }
        swift_retain();
        sub_220DED35C(v25);
        swift_release();
        if ((sub_220DF8FA4() & 1) == 0) {
          goto LABEL_19;
        }
        uint64_t v27 = qword_267F2E0E8;
        swift_retain();
        if (v27 == -1)
        {
LABEL_18:
          swift_getKeyPath();
          swift_getKeyPath();
          sub_220F309B8();
          swift_release();
          swift_release();
          uint64_t v28 = aBlock;
          uint64_t v29 = v63;
          uint64_t v30 = swift_allocObject();
          swift_weakInit();
          swift_retain();
          sub_220E4A13C(v28, v29, (uint64_t)sub_220DF9344, v30);
          swift_release();
          swift_bridgeObjectRelease();
          swift_release_n();
LABEL_19:
          sub_220D25F48(0, (unint64_t *)&qword_267F33D60);
          uint64_t v57 = sub_220F32A68();
          uint64_t v31 = sub_220F325C8();
          uint64_t v58 = &v52;
          uint64_t v55 = v31;
          uint64_t v32 = *(void *)(v31 - 8);
          MEMORY[0x270FA5388](v31);
          int v53 = &v52;
          MEMORY[0x270FA5388](v33);
          uint64_t v35 = (char *)&v52 - v34;
          sub_220F325B8();
          MEMORY[0x223C753D0](v35, 0.5);
          uint64_t v36 = *(void (**)(uint64_t *, uint64_t))(v32 + 8);
          uint64_t v54 = v32 + 8;
          int v56 = v36;
          v36((uint64_t *)v35, v31);
          uint64_t v37 = (uint64_t)a1;
          uint64_t v38 = (uint64_t)v60;
          sub_220EFDE78(v37, (uint64_t)v60, type metadata accessor for FacesAndPagesPicker);
          unint64_t v39 = (*((unsigned __int8 *)v59 + 80) + 16) & ~(unint64_t)*((unsigned __int8 *)v59 + 80);
          uint64_t v40 = swift_allocObject();
          sub_220EFF25C(v38, v40 + v39, type metadata accessor for FacesAndPagesPicker);
          uint64_t v66 = sub_220EFDD68;
          uint64_t v67 = v40;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v63 = 1107296256;
          uint64_t v64 = sub_220DCDDB4;
          unsigned __int8 v65 = &block_descriptor_16;
          uint64_t v41 = _Block_copy(&aBlock);
          swift_release();
          uint64_t v42 = sub_220F325A8();
          uint64_t v60 = &v52;
          uint64_t v43 = *(void *)(v42 - 8);
          MEMORY[0x270FA5388](v42);
          uint64_t v45 = (char *)&v52 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_220F32598();
          uint64_t v46 = sub_220F32578();
          uint64_t v59 = &v52;
          uint64_t v47 = *(void *)(v46 - 8);
          MEMORY[0x270FA5388](v46);
          uint64_t v49 = (char *)&v52 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
          uint64_t aBlock = MEMORY[0x263F8EE78];
          sub_220EFDDAC((unint64_t *)&qword_267F2F550, MEMORY[0x270FCDA10]);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E570);
          sub_220D25FB0((unint64_t *)&qword_267F2F560, (uint64_t *)&unk_267F2E570);
          sub_220F32BE8();
          int v50 = v53;
          uint64_t v51 = (void *)v57;
          MEMORY[0x223C757F0](v53, v45, v49, v41);
          _Block_release(v41);

          (*(void (**)(char *, uint64_t))(v47 + 8))(v49, v46);
          (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v42);
          v56(v50, v55);
          return;
        }
LABEL_23:
        swift_once();
        goto LABEL_18;
      }
    }
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E88();
    __break(1u);
    goto LABEL_23;
  }
}

uint64_t sub_220EE7138(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for FacesAndPagesPicker(0);
  MEMORY[0x270FA5388](v4);
  char v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_220F30928();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL IsPortrait = UIInterfaceOrientationIsPortrait(a1);
  uint64_t v12 = v1 + *(int *)(v4 + 60);
  char v13 = *(unsigned char *)v12;
  uint64_t v14 = *(void *)(v12 + 8);
  LOBYTE(v41) = v13;
  uint64_t v42 = v14;
  BOOL v37 = IsPortrait;
  LOBYTE(v39) = IsPortrait;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  sub_220F32168();
  if (qword_267F2E118 != -1) {
    swift_once();
  }
  uint64_t v15 = __swift_project_value_buffer(v7, (uint64_t)qword_267F41E80);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v15, v7);
  os_log_type_t v16 = sub_220F329C8();
  sub_220EFDE78(v1, (uint64_t)v6, type metadata accessor for FacesAndPagesPicker);
  uint64_t v17 = sub_220F30908();
  if (os_log_type_enabled(v17, v16))
  {
    uint64_t v35 = v7;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v36 = v1;
    uint64_t v19 = (uint8_t *)v18;
    uint64_t v34 = swift_slowAlloc();
    double v39 = *(double *)&v34;
    *(_DWORD *)uint64_t v19 = 136315138;
    uint64_t v20 = &v6[*(int *)(v4 + 60)];
    char v21 = *v20;
    uint64_t v22 = *((void *)v20 + 1);
    LOBYTE(v41) = v21;
    uint64_t v42 = v22;
    sub_220F32158();
    if (v38) {
      uint64_t v23 = 0x7469617274726F70;
    }
    else {
      uint64_t v23 = 0x70616373646E616CLL;
    }
    if (v38) {
      unint64_t v24 = 0xE800000000000000;
    }
    else {
      unint64_t v24 = 0xE900000000000065;
    }
    uint64_t v41 = sub_220D166C8(v23, v24, (uint64_t *)&v39);
    sub_220F32B58();
    swift_bridgeObjectRelease();
    sub_220EFDEE0((uint64_t)v6, type metadata accessor for FacesAndPagesPicker);
    _os_log_impl(&dword_220D02000, v17, v16, "Updating lock screen and home page views based on orientation %s", v19, 0xCu);
    uint64_t v25 = v34;
    swift_arrayDestroy();
    MEMORY[0x223C76830](v25, -1, -1);
    uint64_t v26 = v19;
    uint64_t v2 = v36;
    MEMORY[0x223C76830](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v35);
  }
  else
  {
    sub_220EFDEE0((uint64_t)v6, type metadata accessor for FacesAndPagesPicker);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  sub_220EE6678(v37);
  uint64_t v27 = v2 + *(int *)(v4 + 64);
  uint64_t v28 = *(void *)v27;
  char v29 = *(unsigned char *)(v27 + 8);
  uint64_t v30 = *(void *)(v27 + 16);
  uint64_t v41 = v28;
  LOBYTE(v42) = v29;
  uint64_t v43 = v30;
  double v39 = v31 + 40.0;
  char v40 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F352F0);
  return sub_220F32168();
}

uint64_t sub_220EE753C()
{
  return swift_release();
}

uint64_t sub_220EE75B4()
{
  return sub_220F32168();
}

uint64_t sub_220EE7628()
{
  id v0 = objc_msgSend(self, sel_currentDevice);
  objc_msgSend(v0, sel_endGeneratingDeviceOrientationNotifications);

  type metadata accessor for FacesAndPagesPicker(0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  sub_220F32168();
  return sub_220F32168();
}

void sub_220EE7700(uint64_t a1, uint64_t *a2)
{
  id v3 = objc_msgSend(self, sel_sharedApplication);
  id v4 = objc_msgSend(v3, sel_connectedScenes);

  sub_220D25F48(0, &qword_267F31958);
  sub_220ED130C();
  uint64_t v5 = sub_220F32948();

  char v6 = (void *)sub_220DD4F88(v5);
  swift_bridgeObjectRelease();
  if (!v6)
  {
    uint64_t v8 = 0;
LABEL_6:
    uint64_t v9 = 1;
    goto LABEL_7;
  }
  self;
  uint64_t v7 = (void *)swift_dynamicCastObjCClass();
  uint64_t v8 = v7;
  if (!v7)
  {

    goto LABEL_6;
  }
  uint64_t v9 = (uint64_t)objc_msgSend(v7, sel_interfaceOrientation);
LABEL_7:
  type metadata accessor for FacesAndPagesPicker(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F352F8);
  sub_220F32158();
  if ((v13 & 1) == 0 && v9 == v12)
  {
LABEL_13:

    return;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    swift_retain();
    sub_220DED35C(v9);
    swift_release();
    swift_retain();
    sub_220DEDD08(v9);
    swift_release();
    if (*(void *)(v10
                   + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshotsForSuggestedPages))
    {
      swift_retain();
      unint64_t v11 = swift_bridgeObjectRetain();
      sub_220DE86EC(v11, 0.5);
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_retain();
    sub_220DE7C40();
    swift_release();
    sub_220F32168();
    sub_220EE7138(v9);
    goto LABEL_13;
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  sub_220F30E88();
  __break(1u);
}

uint64_t sub_220EE798C(uint64_t a1, void *a2)
{
  if (*a2)
  {
    swift_retain();
    sub_220DE92DC();
    swift_release();
    swift_retain();
    sub_220DE9E7C(0);
    swift_release();
    type metadata accessor for FacesAndPagesPicker(0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
    uint64_t result = sub_220F32158();
    if ((v4 & 1) == 0)
    {
      id v3 = objc_msgSend(self, sel_currentDevice);
      objc_msgSend(v3, sel_beginGeneratingDeviceOrientationNotifications);

      return sub_220F32168();
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EE7AE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = *v1;
  if (*v1)
  {
    if (*(void *)(v7 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v8 = v25[0];
      uint64_t v9 = v25[1];
      uint64_t v10 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v7 + 24) = sub_220D06AF4(v8, v9, (uint64_t)sub_220D2A5A0, v10);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v11 = sub_220D07240();
    swift_release();
    if (v11)
    {
      id v12 = objc_msgSend(v11, sel_mode);

      id v11 = objc_msgSend(v12, sel_semanticType);
      swift_release();

      LOBYTE(v11) = v11 == (id)2;
    }
    else
    {
      swift_release();
    }
    uint64_t v13 = sub_220F31218();
    uint64_t v14 = sub_220F31348();
    sub_220EFDE78(v2, (uint64_t)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FacesAndPagesPicker.contents);
    unint64_t v15 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v16 = swift_allocObject();
    sub_220EFF25C((uint64_t)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for FacesAndPagesPicker.contents);
    *(unsigned char *)(v16 + v15 + v6) = (_BYTE)v11;
    *a1 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35330);
    uint64_t v18 = (char *)a1 + v17[9];
    uint64_t result = swift_getKeyPath();
    *(void *)uint64_t v18 = result;
    v18[8] = 0;
    uint64_t v20 = (char *)a1 + v17[10];
    *(void *)uint64_t v20 = 0x4028000000000000;
    v20[8] = 0;
    char v21 = (char *)a1 + v17[11];
    *(void *)char v21 = 0;
    v21[8] = 0;
    uint64_t v22 = (uint64_t (**)@<X0>(uint64_t@<X8>))((char *)a1 + v17[12]);
    char *v22 = sub_220EFF2C4;
    v22[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v16;
    uint64_t v23 = (char *)a1 + v17[13];
    *(void *)uint64_t v23 = v13;
    v23[8] = 0;
    unint64_t v24 = (char *)a1 + v17[14];
    *(void *)unint64_t v24 = v14;
    v24[8] = 0;
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EE7E8C@<X0>(void *a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v208 = a3;
  uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35338);
  uint64_t v189 = *(void *)(v191 - 8);
  MEMORY[0x270FA5388](v191);
  v188 = (char *)&v154 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35340);
  uint64_t v192 = *(void *)(v193 - 8);
  MEMORY[0x270FA5388](v193);
  v190 = (char *)&v154 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v197 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35348);
  MEMORY[0x270FA5388](v197);
  v194 = (char *)&v154 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  v196 = (char *)&v154 - v9;
  uint64_t v201 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35350);
  uint64_t v200 = *(void *)(v201 - 8);
  MEMORY[0x270FA5388](v201);
  v199 = (char *)&v154 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v198 = (char *)&v154 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35358);
  MEMORY[0x270FA5388](v13 - 8);
  v207 = (uint64_t *)((char *)&v154 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v154 - v16;
  uint64_t v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35360);
  uint64_t v173 = *(void *)(v175 - 8);
  MEMORY[0x270FA5388](v175);
  v171 = (char *)&v154 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35368);
  uint64_t v176 = *(void *)(v177 - 8);
  MEMORY[0x270FA5388](v177);
  v174 = (char *)&v154 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35370);
  MEMORY[0x270FA5388](v182);
  v178 = (char *)&v154 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  v183 = (char *)&v154 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35378);
  uint64_t v203 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  v179 = (char *)&v154 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35380);
  MEMORY[0x270FA5388](v25 - 8);
  uint64_t v27 = (char *)&v154 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v28);
  v202 = (char *)&v154 - v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35388);
  MEMORY[0x270FA5388](v30 - 8);
  v213 = (uint64_t *)((char *)&v154 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v32);
  uint64_t v215 = (uint64_t)&v154 - v33;
  v211 = (uint64_t *)sub_220F30E28();
  uint64_t v210 = *(v211 - 1);
  MEMORY[0x270FA5388](v211);
  v209 = (char *)&v154 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v204 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v35 = *(void *)(v204 - 8);
  uint64_t v36 = *(void *)(v35 + 64);
  MEMORY[0x270FA5388](v204);
  uint64_t v172 = (uint64_t)&v154 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v37);
  double v39 = (char *)&v154 - v38;
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35390);
  uint64_t v180 = *(void *)(v181 - 8);
  MEMORY[0x270FA5388](v181);
  uint64_t v41 = (char *)&v154 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35398);
  MEMORY[0x270FA5388](v42 - 8);
  uint64_t v206 = v43;
  uint64_t v214 = (uint64_t)&v154 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*a1) {
    goto LABEL_21;
  }
  BOOL v44 = sub_220DF878C();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353A0);
  uint64_t v46 = *(void *)(v45 - 8);
  v212 = v17;
  v205 = v39;
  if (v44)
  {
    uint64_t v169 = v45;
    LODWORD(v170) = a2;
    uint64_t v184 = v23;
    v185 = v27;
    v167 = &v154;
    uint64_t v168 = v46;
    MEMORY[0x270FA5388](v45);
    v166 = (char *)&v154 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
    v165 = &v154;
    MEMORY[0x270FA5388](v48);
    v161 = (char *)&v154 - v49;
    uint64_t v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35428);
    v164 = &v154;
    uint64_t v163 = *(void *)(v162 - 8);
    MEMORY[0x270FA5388](v162);
    v159 = (char *)&v154 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35430);
    v160 = &v154;
    MEMORY[0x270FA5388](v51);
    int v53 = (char *)&v154 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
    v158 = type metadata accessor for FacesAndPagesPicker.contents;
    sub_220EFDE78((uint64_t)a1, (uint64_t)v39, type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v186 = v35;
    uint64_t v54 = *(unsigned __int8 *)(v35 + 80);
    uint64_t v55 = (v54 + 16) & ~v54;
    uint64_t v187 = v36;
    uint64_t v157 = v55 + v36;
    uint64_t v156 = v54 | 7;
    uint64_t v56 = swift_allocObject();
    v155 = type metadata accessor for FacesAndPagesPicker.contents;
    uint64_t v57 = sub_220EFF25C((uint64_t)v39, v56 + v55, type metadata accessor for FacesAndPagesPicker.contents);
    MEMORY[0x270FA5388](v57);
    uint64_t v58 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F35438);
    sub_220D25FB0(&qword_267F35440, &qword_267F35438);
    sub_220F321A8();
    uint64_t v59 = sub_220F32AA8();
    uint64_t v154 = (uint64_t)&v154;
    uint64_t v60 = *(void *)(v59 - 8);
    MEMORY[0x270FA5388](v59);
    uint64_t v62 = (char *)&v154 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
    id v63 = objc_msgSend(self, sel_defaultCenter, v154);
    sub_220F32AB8();

    v195 = v58;
    uint64_t v64 = (uint64_t)v58;
    double v39 = v205;
    sub_220EFDE78(v64, (uint64_t)v205, v158);
    uint64_t v65 = swift_allocObject();
    sub_220EFF25C((uint64_t)v39, v65 + v55, v155);
    uint64_t v66 = v180;
    uint64_t v67 = v181;
    (*(void (**)(char *, char *, uint64_t))(v180 + 16))(v53, v41, v181);
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(&v53[*(int *)(v51 + 52)], v62, v59);
    uint64_t v68 = (uint64_t (**)(uint64_t))&v53[*(int *)(v51 + 56)];
    char *v68 = sub_220EFF92C;
    v68[1] = (uint64_t (*)(uint64_t))v65;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v62, v59);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v41, v67);
    char v69 = v209;
    sub_220F30E18();
    uint64_t v70 = sub_220D25FB0(&qword_267F35448, &qword_267F35430);
    uint64_t v71 = sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    uint64_t v72 = v159;
    unint64_t v73 = v211;
    sub_220F31BA8();
    (*(void (**)(char *, uint64_t *))(v210 + 8))(v69, v73);
    sub_220D25B68((uint64_t)v53, &qword_267F35430);
    uint64_t v229 = v51;
    v230 = v73;
    uint64_t v74 = (uint64_t)v161;
    uint64_t v231 = v70;
    uint64_t v232 = v71;
    swift_getOpaqueTypeConformance2();
    uint64_t v75 = v162;
    sub_220F31C38();
    (*(void (**)(char *, uint64_t))(v163 + 8))(v72, v75);
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    uint64_t v229 = sub_220F30408();
    v230 = v76;
    sub_220D292B8();
    uint64_t v77 = (uint64_t)v166;
    uint64_t v78 = v169;
    sub_220F30D58();
    swift_bridgeObjectRelease();
    sub_220D25B68(v74, &qword_267F353A0);
    uint64_t v79 = v214;
    sub_220D39114(v77, v214, &qword_267F353A0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v168 + 56))(v79, 0, 1, v78);
    uint64_t v17 = v212;
    a1 = v195;
    uint64_t v36 = v187;
    uint64_t v35 = v186;
    uint64_t v27 = v185;
    uint64_t v23 = v184;
    if ((v170 & 1) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353B0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v110 - 8) + 56))(v215, 1, 1, v110);
    goto LABEL_14;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(v214, 1, 1, v45);
  if (a2) {
    goto LABEL_13;
  }
LABEL_6:
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v80 = *a1;
  if (!*a1)
  {
LABEL_21:
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
    return result;
  }
  uint64_t v181 = v223;
  LODWORD(v180) = v224;
  uint64_t v170 = v225;
  LODWORD(v169) = v226;
  v167 = v227;
  uint64_t v168 = v228;
  uint64_t v81 = 1;
  if (*(unsigned char *)(v80 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshotsLoaded))
  {
    uint64_t v184 = v23;
    v185 = v27;
    sub_220EFDE78((uint64_t)a1, (uint64_t)v39, type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v186 = v35;
    uint64_t v82 = *(unsigned __int8 *)(v35 + 80);
    uint64_t v83 = (v82 + 16) & ~v82;
    uint64_t v187 = v36;
    v165 = (uint64_t *)(v82 | 7);
    uint64_t v84 = swift_allocObject();
    v166 = (char *)v83;
    uint64_t v85 = sub_220EFF25C((uint64_t)v39, v84 + v83, type metadata accessor for FacesAndPagesPicker.contents);
    MEMORY[0x270FA5388](v85);
    v195 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F35400);
    sub_220D25FB0(&qword_267F35408, &qword_267F35400);
    uint64_t v86 = v171;
    sub_220F321A8();
    char v87 = v209;
    sub_220F30E18();
    uint64_t v88 = sub_220D25FB0(&qword_267F35410, &qword_267F35360);
    uint64_t v89 = sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    long long v90 = v174;
    uint64_t v91 = v175;
    long long v92 = v211;
    sub_220F31BA8();
    (*(void (**)(char *, uint64_t *))(v210 + 8))(v87, v92);
    (*(void (**)(char *, uint64_t))(v173 + 8))(v86, v91);
    uint64_t v229 = v91;
    v230 = v92;
    uint64_t v231 = v88;
    uint64_t v232 = v89;
    swift_getOpaqueTypeConformance2();
    uint64_t v93 = (uint64_t)v178;
    uint64_t v94 = v177;
    sub_220F31C38();
    (*(void (**)(char *, uint64_t))(v176 + 8))(v90, v94);
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    uint64_t v229 = sub_220F30408();
    v230 = v95;
    sub_220D292B8();
    sub_220F30D58();
    swift_bridgeObjectRelease();
    sub_220D25B68(v93, &qword_267F35370);
    a1 = v195;
    int v96 = (char *)v195 + *(int *)(v204 + 24);
    uint64_t v97 = *(void *)v96;
    int v98 = (uint64_t *)*((void *)v96 + 1);
    LOBYTE(v96) = v96[16];
    uint64_t v219 = v97;
    v220 = v98;
    LOBYTE(v221) = (_BYTE)v96;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
    sub_220F322D8();
    uint64_t v177 = v229;
    LODWORD(v178) = v231;
    sub_220EFDE78((uint64_t)a1, (uint64_t)v39, type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v99 = swift_allocObject();
    uint64_t v100 = v166;
    sub_220EFF25C((uint64_t)v39, (uint64_t)&v166[v99], type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v101 = v172;
    sub_220EFDE78((uint64_t)a1, v172, type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v102 = swift_allocObject();
    sub_220EFF25C(v101, (uint64_t)&v100[v102], type metadata accessor for FacesAndPagesPicker.contents);
    sub_220EFF720(&qword_267F35418, &qword_267F35370, &qword_267F35360, &qword_267F35410);
    sub_220EFF86C();
    uint64_t v103 = v179;
    uint64_t v104 = (uint64_t)v183;
    sub_220F31DE8();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    sub_220D25B68(v104, &qword_267F35370);
    uint64_t v23 = v184;
    (*(void (**)(char *, char *, uint64_t))(v203 + 32))(v202, v103, v184);
    uint64_t v81 = 0;
    uint64_t v17 = v212;
    uint64_t v36 = v187;
    uint64_t v35 = v186;
    uint64_t v27 = v185;
  }
  uint64_t v105 = (uint64_t)v202;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v203 + 56))(v202, v81, 1, v23);
  sub_220D26548(v105, (uint64_t)v27, &qword_267F35380);
  uint64_t v106 = v213;
  void *v213 = 0;
  *((unsigned char *)v106 + 8) = 1;
  v106[2] = v181;
  *((unsigned char *)v106 + 24) = v180;
  v106[4] = v170;
  *((unsigned char *)v106 + 40) = v169;
  uint64_t v107 = v168;
  v106[6] = v167;
  v106[7] = v107;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353A8);
  sub_220D26548((uint64_t)v27, (uint64_t)v106 + *(int *)(v108 + 48), &qword_267F35380);
  sub_220D25B68(v105, &qword_267F35380);
  sub_220D25B68((uint64_t)v27, &qword_267F35380);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353B0);
  (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v109 - 8) + 56))(v106, 0, 1, v109);
  sub_220D39114((uint64_t)v106, v215, &qword_267F35388);
LABEL_14:
  if (!*a1) {
    goto LABEL_21;
  }
  if (sub_220DF8FA4())
  {
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v203 = v229;
    LODWORD(v202) = v230;
    v195 = (void *)v231;
    LODWORD(v187) = v232;
    uint64_t v186 = v233;
    v185 = v234;
    sub_220EFDE78((uint64_t)a1, (uint64_t)v39, type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v111 = *(unsigned __int8 *)(v35 + 80);
    uint64_t v112 = (v111 + 16) & ~v111;
    uint64_t v184 = v112 + v36;
    v183 = (char *)(v111 | 7);
    uint64_t v113 = swift_allocObject();
    uint64_t v114 = sub_220EFF25C((uint64_t)v39, v113 + v112, type metadata accessor for FacesAndPagesPicker.contents);
    MEMORY[0x270FA5388](v114);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F353C8);
    sub_220D25FB0(&qword_267F353D0, &qword_267F353C8);
    uint64_t v115 = v188;
    sub_220F321A8();
    unsigned __int8 v116 = v209;
    sub_220F30E18();
    uint64_t v117 = sub_220D25FB0(&qword_267F353D8, &qword_267F35338);
    uint64_t v118 = sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    uint64_t v119 = v190;
    uint64_t v120 = v191;
    uint64_t v121 = v211;
    sub_220F31BA8();
    (*(void (**)(char *, uint64_t *))(v210 + 8))(v116, v121);
    (*(void (**)(char *, uint64_t))(v189 + 8))(v115, v120);
    uint64_t v219 = v120;
    v220 = v121;
    uint64_t v221 = v117;
    uint64_t v222 = v118;
    uint64_t v122 = (uint64_t)v194;
    swift_getOpaqueTypeConformance2();
    uint64_t v123 = v193;
    sub_220F31C38();
    (*(void (**)(char *, uint64_t))(v192 + 8))(v119, v123);
    uint64_t v124 = (uint64_t)a1;
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    uint64_t v219 = sub_220F30408();
    v220 = v125;
    sub_220D292B8();
    uint64_t v126 = (uint64_t)v196;
    sub_220F30D58();
    swift_bridgeObjectRelease();
    sub_220D25B68(v122, &qword_267F35348);
    uint64_t v127 = v124 + *(int *)(v204 + 32);
    uint64_t v128 = *(void *)v127;
    uint64_t v129 = *(void *)(v127 + 8);
    LOBYTE(v127) = *(unsigned char *)(v127 + 16);
    uint64_t v216 = v128;
    uint64_t v217 = v129;
    char v218 = v127;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
    sub_220F322D8();
    uint64_t v130 = (uint64_t)v205;
    sub_220EFDE78(v124, (uint64_t)v205, type metadata accessor for FacesAndPagesPicker.contents);
    uint64_t v131 = swift_allocObject();
    sub_220EFF25C(v130, v131 + v112, type metadata accessor for FacesAndPagesPicker.contents);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F353E0);
    sub_220EFF720(&qword_267F353E8, &qword_267F35348, &qword_267F35338, &qword_267F353D8);
    sub_220D25FB0(&qword_267F353F0, &qword_267F353E0);
    v132 = v199;
    sub_220F31DE8();
    swift_release();
    swift_release();
    swift_release();
    sub_220D25B68(v126, &qword_267F35348);
    uint64_t v133 = v200;
    v134 = v198;
    uint64_t v135 = v201;
    (*(void (**)(char *, char *, uint64_t))(v200 + 32))(v198, v132, v201);
    v136 = *(void (**)(void, void, void))(v133 + 16);
    v136(v132, v134, v135);
    uint64_t v137 = (uint64_t)v207;
    void *v207 = 0;
    *(unsigned char *)(v137 + 8) = 1;
    *(void *)(v137 + 16) = v203;
    *(unsigned char *)(v137 + 24) = (_BYTE)v202;
    *(void *)(v137 + 32) = v195;
    *(unsigned char *)(v137 + 40) = v187;
    v138 = v185;
    *(void *)(v137 + 48) = v186;
    *(void *)(v137 + 56) = v138;
    uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353F8);
    v136(v137 + *(int *)(v139 + 48), v132, v135);
    v140 = *(void (**)(void, void))(v133 + 8);
    v140(v134, v135);
    v140(v132, v135);
    uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353B8);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v141 - 8) + 56))(v137, 0, 1, v141);
    uint64_t v142 = (uint64_t)v212;
    uint64_t v143 = sub_220D39114(v137, (uint64_t)v212, &qword_267F35358);
  }
  else
  {
    uint64_t v142 = (uint64_t)v17;
    uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353B8);
    uint64_t v143 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v144 - 8) + 56))(v17, 1, 1, v144);
    uint64_t v137 = (uint64_t)v207;
  }
  v211 = &v154;
  MEMORY[0x270FA5388](v143);
  v146 = (char *)&v154 - ((v145 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = v214;
  sub_220D26548(v214, (uint64_t)v146, &qword_267F35398);
  uint64_t v148 = v215;
  v149 = v213;
  sub_220D26548(v215, (uint64_t)v213, &qword_267F35388);
  sub_220D26548(v142, v137, &qword_267F35358);
  uint64_t v150 = v208;
  sub_220D26548((uint64_t)v146, v208, &qword_267F35398);
  uint64_t v151 = v142;
  uint64_t v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F353C0);
  sub_220D26548((uint64_t)v149, v150 + *(int *)(v152 + 48), &qword_267F35388);
  sub_220D26548(v137, v150 + *(int *)(v152 + 64), &qword_267F35358);
  sub_220D25B68(v151, &qword_267F35358);
  sub_220D25B68(v148, &qword_267F35388);
  sub_220D25B68(v147, &qword_267F35398);
  sub_220D25B68(v137, &qword_267F35358);
  sub_220D25B68((uint64_t)v149, &qword_267F35388);
  return sub_220D25B68((uint64_t)v146, &qword_267F35398);
}

void sub_220EE9F00()
{
  id v1 = objc_msgSend(self, sel_sharedApplication);
  id v2 = objc_msgSend(v1, sel_connectedScenes);

  sub_220D25F48(0, &qword_267F31958);
  sub_220ED130C();
  uint64_t v3 = sub_220F32948();

  uint64_t v4 = (void *)sub_220DD4F88(v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    self;
    uint64_t v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      if (*v0)
      {
        uint64_t v6 = v5;
        swift_retain();
        sub_220DECB5C(v6);

        swift_release();
      }
      else
      {
        type metadata accessor for ActivityConfigViewModel();
        sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
        sub_220F30E88();
        __break(1u);
      }
      return;
    }
  }
  if (qword_267F2E118 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_220F30928();
  __swift_project_value_buffer(v7, (uint64_t)qword_267F41E80);
  os_log_type_t v8 = sub_220F329E8();
  log = sub_220F30908();
  if (os_log_type_enabled(log, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_220D02000, log, v8, "Unable to present lock screen controller because window scene is nil", v9, 2u);
    MEMORY[0x223C76830](v9, -1, -1);
  }
}

uint64_t sub_220EEA148@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35458);
  MEMORY[0x270FA5388](v76);
  uint64_t v68 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_220F31238();
  uint64_t v65 = *(void *)(v5 - 8);
  uint64_t v66 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35460);
  MEMORY[0x270FA5388](v64);
  uint64_t v9 = (uint64_t *)((char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35468);
  uint64_t v10 = *(void *)(v67 - 8);
  MEMORY[0x270FA5388](v67);
  uint64_t v12 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v78 = (char *)&v63 - v14;
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35470);
  MEMORY[0x270FA5388](v70);
  uint64_t v75 = (uint64_t)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35478);
  MEMORY[0x270FA5388](v74);
  id v63 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for ChooseLabel(0);
  MEMORY[0x270FA5388](v69);
  uint64_t v18 = (uint64_t *)((char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v19);
  uint64_t v72 = (uint64_t)&v63 - v20;
  uint64_t v21 = type metadata accessor for LockScreenColoringBookView(0);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v63 - v25;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35480);
  MEMORY[0x270FA5388](v27 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v71 = (char *)&v63 - v30;
  uint64_t v31 = a1;
  uint64_t v32 = *a1;
  if (!*a1) {
    goto LABEL_13;
  }
  uint64_t v73 = v29;
  uint64_t v77 = a2;
  unint64_t v33 = *(void *)(v32 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_lockScreenSnapshots);
  if (v33 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_220F32E48()) {
      goto LABEL_4;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    uint64_t v52 = type metadata accessor for FacesAndPagesPicker.contents(0);
    sub_220EEC420(*((unsigned char *)v31 + *(int *)(v52 + 36)), v26);
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    *uint64_t v18 = sub_220F30EA8();
    v18[1] = v53;
    uint64_t v54 = v69;
    uint64_t v55 = (uint64_t *)((char *)v18 + *(int *)(v69 + 20));
    uint64_t *v55 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v18 + *(int *)(v54 + 24)) = 0;
    uint64_t v56 = v72;
    sub_220EFF25C((uint64_t)v18, v72, type metadata accessor for ChooseLabel);
    sub_220EFDE78((uint64_t)v26, (uint64_t)v23, type metadata accessor for LockScreenColoringBookView);
    sub_220EFDE78(v56, (uint64_t)v18, type metadata accessor for ChooseLabel);
    uint64_t v57 = (uint64_t)v63;
    sub_220EFDE78((uint64_t)v23, (uint64_t)v63, type metadata accessor for LockScreenColoringBookView);
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354B8);
    sub_220EFDE78((uint64_t)v18, v57 + *(int *)(v58 + 48), type metadata accessor for ChooseLabel);
    sub_220EFDEE0((uint64_t)v18, type metadata accessor for ChooseLabel);
    sub_220EFDEE0((uint64_t)v23, type metadata accessor for LockScreenColoringBookView);
    sub_220D26548(v57, v75, &qword_267F35478);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F354A0, &qword_267F35458);
    sub_220D25FB0(&qword_267F354A8, &qword_267F35478);
    uint64_t v51 = (uint64_t)v71;
    sub_220F31488();
    sub_220D25B68(v57, &qword_267F35478);
    sub_220EFDEE0(v56, type metadata accessor for ChooseLabel);
    sub_220EFDEE0((uint64_t)v26, type metadata accessor for LockScreenColoringBookView);
    goto LABEL_10;
  }
  uint64_t v34 = *(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v34) {
    goto LABEL_9;
  }
LABEL_4:
  if ((v33 & 0xC000000000000001) != 0)
  {
    uint64_t v35 = (char *)MEMORY[0x223C75B40](0, v33);
    goto LABEL_7;
  }
  if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v35 = (char *)*(id *)(v33 + 32);
LABEL_7:
    uint64_t v36 = v35;
    id v63 = v35;
    swift_bridgeObjectRelease();
    uint64_t *v9 = sub_220F32418();
    v9[1] = v37;
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35488);
    sub_220EEABB4(v31, v36, (uint64_t)v9 + *(int *)(v38 + 44));
    uint64_t v40 = v65;
    uint64_t v39 = v66;
    (*(void (**)(char *, void, uint64_t))(v65 + 104))(v7, *MEMORY[0x263F19790], v66);
    sub_220D25FB0(&qword_267F35490, &qword_267F35460);
    sub_220F31C08();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v39);
    sub_220D25B68((uint64_t)v9, &qword_267F35460);
    uint64_t v41 = v78;
    uint64_t v42 = v67;
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v78, v12, v67);
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    *uint64_t v18 = sub_220F30EA8();
    v18[1] = v43;
    uint64_t v44 = v69;
    uint64_t v45 = (uint64_t *)((char *)v18 + *(int *)(v69 + 20));
    *uint64_t v45 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v18 + *(int *)(v44 + 24)) = 1;
    uint64_t v46 = v72;
    sub_220EFF25C((uint64_t)v18, v72, type metadata accessor for ChooseLabel);
    uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v47(v12, v41, v42);
    sub_220EFDE78(v46, (uint64_t)v18, type metadata accessor for ChooseLabel);
    uint64_t v48 = (uint64_t)v68;
    v47(v68, v12, v42);
    uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35498);
    sub_220EFDE78((uint64_t)v18, v48 + *(int *)(v49 + 48), type metadata accessor for ChooseLabel);
    sub_220EFDEE0((uint64_t)v18, type metadata accessor for ChooseLabel);
    uint64_t v50 = *(void (**)(char *, uint64_t))(v10 + 8);
    v50(v12, v42);
    sub_220D26548(v48, v75, &qword_267F35458);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F354A0, &qword_267F35458);
    sub_220D25FB0(&qword_267F354A8, &qword_267F35478);
    uint64_t v51 = (uint64_t)v71;
    sub_220F31488();

    sub_220D25B68(v48, &qword_267F35458);
    sub_220EFDEE0(v46, type metadata accessor for ChooseLabel);
    v50(v78, v42);
LABEL_10:
    uint64_t v59 = v73;
    sub_220D26548(v51, v73, &qword_267F35480);
    uint64_t v60 = v77;
    *uint64_t v77 = 0;
    *((unsigned char *)v60 + 8) = 0;
    uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354B0);
    sub_220D26548(v59, (uint64_t)v60 + *(int *)(v61 + 48), &qword_267F35480);
    sub_220D25B68(v51, &qword_267F35480);
    return sub_220D25B68(v59, &qword_267F35480);
  }
  __break(1u);
LABEL_13:
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220EEABB4@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v70 = a3;
  uint64_t v4 = sub_220F30E28();
  uint64_t v68 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v67 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v59 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v60 = v7;
  uint64_t v61 = (uint64_t)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354E0);
  uint64_t v64 = *(void *)(v8 - 8);
  uint64_t v65 = v8;
  MEMORY[0x270FA5388](v8);
  id v63 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354E8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v66 = (char *)&v57 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354F0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (uint64_t *)((char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354F8);
  MEMORY[0x270FA5388](v19);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v57 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v57 - v25;
  uint64_t v27 = a1;
  uint64_t v28 = *a1;
  if (*a1)
  {
    uint64_t v62 = v24;
    uint64_t v69 = v4;
    unint64_t v29 = *(void *)(v28 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_lockScreenSnapshots);
    if (v29 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_220F32E48();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    *uint64_t v18 = sub_220F32418();
    v18[1] = v31;
    uint64_t v32 = (uint64_t)v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35500) + 44);
    sub_220EEB300(v30 > 1, v27, v58, v32);
    char v33 = sub_220F31868();
    sub_220F30A88();
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    sub_220D26548((uint64_t)v18, (uint64_t)v22, &qword_267F354F0);
    uint64_t v42 = &v22[*(int *)(v19 + 36)];
    *uint64_t v42 = v33;
    *((void *)v42 + 1) = v35;
    *((void *)v42 + 2) = v37;
    *((void *)v42 + 3) = v39;
    *((void *)v42 + 4) = v41;
    v42[40] = 0;
    sub_220D25B68((uint64_t)v18, &qword_267F354F0);
    sub_220D39114((uint64_t)v22, (uint64_t)v26, &qword_267F354F8);
    uint64_t v43 = v61;
    sub_220EFDE78((uint64_t)v27, v61, type metadata accessor for FacesAndPagesPicker.contents);
    unint64_t v44 = (*(unsigned __int8 *)(v59 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    uint64_t v45 = swift_allocObject();
    sub_220EFF25C(v43, v45 + v44, type metadata accessor for FacesAndPagesPicker.contents);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F35508);
    sub_220F01720(&qword_267F35510, &qword_267F35508, (void (*)(void))sub_220EFF9C8);
    uint64_t v46 = v63;
    sub_220F321A8();
    uint64_t v47 = v67;
    sub_220F30E18();
    sub_220D25FB0(&qword_267F35520, &qword_267F354E0);
    sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    uint64_t v48 = v65;
    uint64_t v49 = v69;
    sub_220F31BA8();
    (*(void (**)(char *, uint64_t))(v68 + 8))(v47, v49);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v46, v48);
    uint64_t v50 = v66;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v66, v13, v10);
    uint64_t v51 = v62;
    sub_220D26548((uint64_t)v26, v62, &qword_267F354F8);
    uint64_t v52 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v52(v13, v50, v10);
    uint64_t v53 = v70;
    sub_220D26548(v51, v70, &qword_267F354F8);
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35528);
    v52((char *)(v53 + *(int *)(v54 + 48)), v13, v10);
    uint64_t v55 = *(void (**)(char *, uint64_t))(v11 + 8);
    v55(v50, v10);
    sub_220D25B68((uint64_t)v26, &qword_267F354F8);
    v55(v13, v10);
    return sub_220D25B68(v51, &qword_267F354F8);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EEB300@<X0>(int a1@<W0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  LODWORD(v96) = a1;
  uint64_t v7 = sub_220F31EB8();
  uint64_t v93 = *(void *)(v7 - 8);
  uint64_t v94 = v7;
  MEMORY[0x270FA5388](v7);
  long long v92 = (char *)&v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310);
  MEMORY[0x270FA5388](v87);
  uint64_t v89 = (uint64_t)&v79 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_220F30E58();
  MEMORY[0x270FA5388](v10);
  uint64_t v83 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_220F32088();
  uint64_t v12 = *(void *)(v81 - 8);
  MEMORY[0x270FA5388](v81);
  uint64_t v14 = (char *)&v79 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35530);
  MEMORY[0x270FA5388](v82);
  uint64_t v88 = (char *)&v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35538);
  MEMORY[0x270FA5388](v86);
  uint64_t v91 = (uint64_t)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v85 = (uint64_t)&v79 - v18;
  MEMORY[0x270FA5388](v19);
  uint64_t v90 = (uint64_t)&v79 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35540);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v79 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35548);
  uint64_t v25 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (char *)&v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35550);
  MEMORY[0x270FA5388](v28 - 8);
  __n128 v30 = MEMORY[0x270FA5388](v29);
  uint64_t v95 = a4;
  uint64_t v84 = v31;
  uint64_t v97 = (uint64_t)&v79 - v32;
  if ((v96 & 1) == 0)
  {
    (*(void (**)(__n128))(v25 + 56))(v30);
    goto LABEL_8;
  }
  uint64_t v96 = (uint64_t)a3;
  if (*a2)
  {
    uint64_t v33 = *(void *)(*a2 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_lockScreenSnapshots);
    uint64_t v79 = v10;
    if ((v33 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      id v34 = (id)MEMORY[0x223C75B40](1, v33);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (*(void *)((v33 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
      {
        __break(1u);
        goto LABEL_17;
      }
      id v34 = *(id *)(v33 + 40);
    }
    *(void *)uint64_t v23 = sub_220F31348();
    *((void *)v23 + 1) = 0;
    v23[16] = 1;
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35560);
    sub_220EEBD10(v34, (uint64_t)a2, (uint64_t)&v23[*(int *)(v35 + 44)]);
    char v36 = sub_220F31848();
    sub_220F30A88();
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    sub_220D26548((uint64_t)v23, (uint64_t)v27, &qword_267F35540);

    uint64_t v45 = &v27[*(int *)(v24 + 36)];
    *uint64_t v45 = v36;
    *((void *)v45 + 1) = v38;
    *((void *)v45 + 2) = v40;
    *((void *)v45 + 3) = v42;
    *((void *)v45 + 4) = v44;
    v45[40] = 0;
    sub_220D25B68((uint64_t)v23, &qword_267F35540);
    uint64_t v46 = (uint64_t)v27;
    uint64_t v47 = v97;
    sub_220D39114(v46, v97, &qword_267F35548);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v25 + 56))(v47, 0, 1, v24);
    uint64_t v10 = v79;
    a3 = (void *)v96;
LABEL_8:
    id v48 = a3;
    sub_220F32058();
    uint64_t v49 = v81;
    (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x263F1B4B8], v81);
    uint64_t v96 = sub_220F320D8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v49);
    LODWORD(v27) = *((unsigned __int8 *)a2 + *(int *)(type metadata accessor for FacesAndPagesPicker.contents(0) + 36));
    id v50 = objc_msgSend(self, sel_currentDevice);
    id v51 = objc_msgSend(v50, sel_userInterfaceIdiom);

    if (v51 != (id)1) {
      goto LABEL_14;
    }
    if (v27)
    {
      if (qword_267F2E150 == -1) {
        goto LABEL_14;
      }
    }
    else if (qword_267F2E158 == -1)
    {
LABEL_14:
      sub_220EE6678((char)v27);
      sub_220F32468();
      sub_220F30BA8();
      uint64_t v81 = v98;
      int v80 = v99;
      uint64_t v52 = v100;
      char v53 = v101;
      uint64_t v54 = v102;
      uint64_t v55 = v103;
      uint64_t v56 = *(int *)(v10 + 20);
      uint64_t v57 = v83;
      uint64_t v58 = &v83[v56];
      uint64_t v59 = *MEMORY[0x263F19860];
      uint64_t v60 = sub_220F312A8();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v60 - 8) + 104))(v58, v59, v60);
      __asm { FMOV            V0.2D, #13.0 }
      *uint64_t v57 = _Q0;
      uint64_t v66 = (uint64_t (*)(void))MEMORY[0x263F19048];
      uint64_t v67 = v89;
      sub_220EFDE78((uint64_t)v57, v89, MEMORY[0x263F19048]);
      uint64_t v68 = (uint64_t)v88;
      *(_WORD *)(v67 + *(int *)(v87 + 36)) = 256;
      sub_220D26548(v67, v68 + *(int *)(v82 + 36), &qword_267F2F310);
      *(void *)uint64_t v68 = v96;
      *(void *)(v68 + 8) = 0;
      *(_WORD *)(v68 + 16) = 1;
      *(void *)(v68 + 24) = v81;
      *(unsigned char *)(v68 + 32) = v80;
      *(void *)(v68 + 40) = v52;
      *(unsigned char *)(v68 + 48) = v53;
      *(void *)(v68 + 56) = v54;
      *(void *)(v68 + 64) = v55;
      swift_retain();
      sub_220D25B68(v67, &qword_267F2F310);
      sub_220EFDEE0((uint64_t)v57, v66);
      swift_release();
      (*(void (**)(char *, void, uint64_t))(v93 + 104))(v92, *MEMORY[0x263F1B388], v94);
      uint64_t v69 = sub_220F32018();
      uint64_t v70 = v85;
      sub_220D26548(v68, v85, &qword_267F35530);
      uint64_t v71 = v70 + *(int *)(v86 + 36);
      *(void *)uint64_t v71 = v69;
      *(_OWORD *)(v71 + 8) = xmmword_220F3D4C0;
      *(void *)(v71 + 24) = 0x4018000000000000;
      sub_220D25B68(v68, &qword_267F35530);
      uint64_t v72 = v90;
      sub_220D39114(v70, v90, &qword_267F35538);
      uint64_t v73 = v97;
      uint64_t v74 = v84;
      sub_220D26548(v97, v84, &qword_267F35550);
      uint64_t v75 = v91;
      sub_220D26548(v72, v91, &qword_267F35538);
      uint64_t v76 = v95;
      sub_220D26548(v74, v95, &qword_267F35550);
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35558);
      sub_220D26548(v75, v76 + *(int *)(v77 + 48), &qword_267F35538);
      sub_220D25B68(v72, &qword_267F35538);
      sub_220D25B68(v73, &qword_267F35550);
      sub_220D25B68(v75, &qword_267F35538);
      return sub_220D25B68(v74, &qword_267F35550);
    }
LABEL_17:
    swift_once();
    goto LABEL_14;
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220EEBD10@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v65 = a3;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310);
  MEMORY[0x270FA5388](v64);
  uint64_t v63 = (uint64_t)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_220F30E58();
  MEMORY[0x270FA5388](v56);
  uint64_t v7 = (_OWORD *)((char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_220F32088();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35530);
  MEMORY[0x270FA5388](v55);
  uint64_t v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35568);
  MEMORY[0x270FA5388](v59);
  uint64_t v62 = (uint64_t)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35570);
  MEMORY[0x270FA5388](v60);
  uint64_t v61 = (uint64_t)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35578);
  MEMORY[0x270FA5388](v58);
  uint64_t v57 = (uint64_t)&v51 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = a1;
  sub_220F32058();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F1B4B8], v8);
  uint64_t v54 = sub_220F320D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  int v18 = *(unsigned __int8 *)(a2 + *(int *)(type metadata accessor for FacesAndPagesPicker.contents(0) + 36));
  id v19 = objc_msgSend(self, sel_currentDevice);
  id v20 = objc_msgSend(v19, sel_userInterfaceIdiom);

  if (v20 == (id)1)
  {
    if (v18)
    {
      if (qword_267F2E150 == -1) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
    if (qword_267F2E158 != -1) {
LABEL_8:
    }
      swift_once();
  }
LABEL_7:
  sub_220EE6678(v18);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v53 = v66;
  char v21 = v67;
  uint64_t v52 = v68;
  char v22 = v69;
  uint64_t v23 = v70;
  uint64_t v24 = v71;
  uint64_t v25 = (uint64_t)v7;
  uint64_t v26 = (char *)v7 + *(int *)(v56 + 20);
  uint64_t v27 = *MEMORY[0x263F19860];
  uint64_t v28 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 104))(v26, v27, v28);
  __asm { FMOV            V0.2D, #13.0 }
  *uint64_t v7 = _Q0;
  id v34 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v35 = (uint64_t)v7;
  uint64_t v36 = v63;
  sub_220EFDE78(v35, v63, MEMORY[0x263F19048]);
  *(_WORD *)(v36 + *(int *)(v64 + 36)) = 256;
  sub_220D26548(v36, (uint64_t)&v13[*(int *)(v55 + 36)], &qword_267F2F310);
  *(void *)uint64_t v13 = v54;
  *((void *)v13 + 1) = 0;
  *((_WORD *)v13 + 8) = 1;
  *((void *)v13 + 3) = v53;
  v13[32] = v21;
  *((void *)v13 + 5) = v52;
  v13[48] = v22;
  *((void *)v13 + 7) = v23;
  *((void *)v13 + 8) = v24;
  swift_retain();
  sub_220D25B68(v36, &qword_267F2F310);
  sub_220EFDEE0(v25, v34);
  swift_release();
  sub_220F32548();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v41 = v62;
  sub_220D26548((uint64_t)v13, v62, &qword_267F35530);
  uint64_t v42 = (int64x2_t *)(v41 + *(int *)(v59 + 36));
  *uint64_t v42 = vdupq_n_s64(0x3FECCCCCCCCCCCCDuLL);
  v42[1].i64[0] = v38;
  v42[1].i64[1] = v40;
  sub_220D25B68((uint64_t)v13, &qword_267F35530);
  sub_220F32548();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v47 = v61;
  sub_220D26548(v41, v61, &qword_267F35568);
  id v48 = (void *)(v47 + *(int *)(v60 + 36));
  *id v48 = 0xBFAACEE9F37BEBD6;
  v48[1] = v44;
  v48[2] = v46;
  sub_220D25B68(v41, &qword_267F35568);
  uint64_t v49 = v57;
  sub_220D26548(v47, v57, &qword_267F35570);
  *(void *)(v49 + *(int *)(v58 + 36)) = 0x3FE6666666666666;
  sub_220D25B68(v47, &qword_267F35570);
  return sub_220D39114(v49, v65, &qword_267F35578);
}

uint64_t sub_220EEC37C(void *a1)
{
  if (*a1)
  {
    swift_retain();
    sub_220DEE9E0();
    return swift_release();
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EEC420@<X0>(char a1@<W0>, unsigned char *a2@<X8>)
{
  *a2 = a1;
  uint64_t v3 = type metadata accessor for LockScreenColoringBookView(0);
  v28[0] = &a2[*(int *)(v3 + 20)];
  uint64_t v4 = sub_220F303F8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FB70);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_220F30718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FB78);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_220F30728();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  uint64_t v16 = sub_220F303D8();
  __n128 v17 = MEMORY[0x270FA5388](v16);
  (*(void (**)(char *, char *, uint64_t, __n128))(v5 + 16))((char *)v28 - v7, (char *)v28 - v7, v4, v17);
  sub_220F32148();
  (*(void (**)(char *, uint64_t))(v5 + 8))((char *)v28 - v7, v4);
  int v18 = (uint64_t *)&a2[*(int *)(v3 + 24)];
  sub_220D25F48(0, &qword_267F354C0);
  id v19 = objc_msgSend(self, sel_currentRunLoop, v28[0]);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354C8);
  MEMORY[0x270FA5388](v20 - 8);
  char v22 = (char *)v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_220F32B28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 1, 1, v23);
  uint64_t v24 = sub_220F32AD8();

  sub_220D25B68((uint64_t)v22, &qword_267F354C8);
  uint64_t v29 = v24;
  sub_220F32AC8();
  sub_220EFDDAC(&qword_267F354D0, MEMORY[0x270FA9C90]);
  uint64_t v25 = sub_220F30958();
  swift_release();
  v28[1] = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F354D8);
  uint64_t result = sub_220F32148();
  uint64_t v27 = v30;
  *int v18 = v29;
  v18[1] = v27;
  return result;
}

void sub_220EEC880(uint64_t a1, void *a2)
{
  if (qword_267F2E118 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_220F30928();
  __swift_project_value_buffer(v3, (uint64_t)qword_267F41E80);
  uint64_t v4 = sub_220F30908();
  os_log_type_t v5 = sub_220F329F8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_220D02000, v4, v5, "Faces and Pages configuration view will resign active", v6, 2u);
    MEMORY[0x223C76830](v6, -1, -1);
  }

  if (*a2)
  {
    unint64_t v7 = *(void **)(*a2 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_postersController);
    if (v7)
    {
      objc_msgSend(v7, sel_handleHostSceneTransitionedFromActiveState);
    }
    else
    {
      swift_retain();
      oslog = sub_220F30908();
      os_log_type_t v8 = sub_220F329F8();
      if (os_log_type_enabled(oslog, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_220D02000, oslog, v8, "PRUIModalController does not exist when transitioning from active state", v9, 2u);
        MEMORY[0x223C76830](v9, -1, -1);
      }
      swift_release();
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E88();
    __break(1u);
  }
}

uint64_t sub_220EECA9C()
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
  MEMORY[0x223C75070](&v1);
  sub_220F322B8();
  swift_release();
  return swift_release();
}

uint64_t sub_220EECB58@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35588);
  MEMORY[0x270FA5388](v4);
  char v69 = (char *)v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_220F31238();
  uint64_t v64 = *(void *)(v6 - 8);
  uint64_t v65 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v63 = (char *)v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35590);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (void *)((char *)v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35598);
  uint64_t v67 = *(void *)(v11 - 8);
  uint64_t v68 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v66 = (char *)v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v79 = (char *)v62 - v14;
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355A0);
  MEMORY[0x270FA5388](v72);
  uint64_t v74 = (uint64_t)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355A8);
  MEMORY[0x270FA5388](v16);
  v62[0] = (char *)v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for ChooseLabel(0);
  MEMORY[0x270FA5388](v71);
  id v19 = (void *)((char *)v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v20);
  uint64_t v80 = (uint64_t)v62 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355B0);
  MEMORY[0x270FA5388](v22 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v75 = (char *)v62 - v25;
  uint64_t v70 = a1;
  uint64_t v26 = *a1;
  if (!*a1) {
    goto LABEL_32;
  }
  v62[1] = v8;
  uint64_t v73 = v16;
  uint64_t v76 = v24;
  uint64_t v27 = *(void *)(v26 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshots);
  uint64_t v81 = MEMORY[0x263F8EE78];
  uint64_t v77 = v4;
  uint64_t v78 = a2;
  if ((unint64_t)v27 >> 62)
  {
    if (v27 < 0) {
      uint64_t v16 = v27;
    }
    else {
      uint64_t v16 = v27 & 0xFFFFFFFFFFFFFF8;
    }
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v28 = sub_220F32E48();
    if (v28) {
      goto LABEL_4;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v16 = MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_retain();
  swift_bridgeObjectRetain();
  if (!v28) {
    goto LABEL_18;
  }
LABEL_4:
  if (v28 < 1)
  {
    __break(1u);
    goto LABEL_30;
  }
  for (uint64_t i = 0; i != v28; ++i)
  {
    if ((v27 & 0xC000000000000001) != 0)
    {
      uint64_t v30 = MEMORY[0x223C75B40](i, v27);
    }
    else
    {
      uint64_t v30 = *(void *)(v27 + 8 * i + 32);
      swift_retain();
    }
    if (*(unsigned char *)(v30 + 49) == 1)
    {
      sub_220F32DB8();
      sub_220F32DE8();
      sub_220F32DF8();
      sub_220F32DC8();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v16 = v81;
LABEL_19:
  swift_release();
  if ((v16 & 0x8000000000000000) == 0 && (v16 & 0x4000000000000000) == 0)
  {
    if (*(void *)(v16 + 16)) {
      goto LABEL_22;
    }
LABEL_27:
    swift_release();
    char v51 = *((unsigned char *)v70 + *(int *)(type metadata accessor for FacesAndPagesPicker.contents(0) + 36));
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    *id v19 = sub_220F30EA8();
    v19[1] = v52;
    uint64_t v53 = v71;
    uint64_t v54 = (uint64_t *)((char *)v19 + *(int *)(v71 + 20));
    *uint64_t v54 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v19 + *(int *)(v53 + 24)) = 0;
    uint64_t v55 = v80;
    sub_220EFF25C((uint64_t)v19, v80, type metadata accessor for ChooseLabel);
    sub_220EFDE78(v55, (uint64_t)v19, type metadata accessor for ChooseLabel);
    uint64_t v56 = v62[0];
    *(unsigned char *)v62[0] = v51;
    uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355E8);
    sub_220EFDE78((uint64_t)v19, v56 + *(int *)(v57 + 48), type metadata accessor for ChooseLabel);
    sub_220EFDEE0((uint64_t)v19, type metadata accessor for ChooseLabel);
    sub_220D26548(v56, v74, &qword_267F355A8);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F355D0, &qword_267F35588);
    sub_220D25FB0(&qword_267F355D8, &qword_267F355A8);
    uint64_t v49 = (uint64_t)v75;
    sub_220F31488();
    sub_220D25B68(v56, &qword_267F355A8);
    sub_220EFDEE0(v55, type metadata accessor for ChooseLabel);
    goto LABEL_28;
  }
  swift_bridgeObjectRetain();
  uint64_t v50 = sub_220F32E48();
  swift_release();
  if (!v50) {
    goto LABEL_27;
  }
LABEL_22:
  if ((v16 & 0xC000000000000001) != 0)
  {
LABEL_30:
    uint64_t v31 = MEMORY[0x223C75B40](0, v16);
    goto LABEL_25;
  }
  if (*(void *)(v16 + 16))
  {
    uint64_t v31 = *(void *)(v16 + 32);
    swift_retain();
LABEL_25:
    swift_release();
    v62[0] = v31;
    uint64_t *v10 = sub_220F32418();
    v10[1] = v32;
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355B8);
    sub_220EED630(v70, v31, (uint64_t)v10 + *(int *)(v33 + 44));
    uint64_t v35 = v63;
    uint64_t v34 = v64;
    uint64_t v36 = v65;
    (*(void (**)(char *, void, uint64_t))(v64 + 104))(v63, *MEMORY[0x263F19790], v65);
    sub_220D25FB0(&qword_267F355C0, &qword_267F35590);
    uint64_t v37 = v66;
    sub_220F31C08();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
    sub_220D25B68((uint64_t)v10, &qword_267F35590);
    uint64_t v38 = v67;
    uint64_t v39 = v68;
    uint64_t v40 = v79;
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v79, v37, v68);
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    *id v19 = sub_220F30EA8();
    v19[1] = v41;
    uint64_t v42 = v71;
    uint64_t v43 = (uint64_t *)((char *)v19 + *(int *)(v71 + 20));
    uint64_t *v43 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)v19 + *(int *)(v42 + 24)) = 1;
    uint64_t v44 = v80;
    sub_220EFF25C((uint64_t)v19, v80, type metadata accessor for ChooseLabel);
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    v45(v37, v40, v39);
    sub_220EFDE78(v44, (uint64_t)v19, type metadata accessor for ChooseLabel);
    uint64_t v46 = (uint64_t)v69;
    v45(v69, v37, v39);
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355C8);
    sub_220EFDE78((uint64_t)v19, v46 + *(int *)(v47 + 48), type metadata accessor for ChooseLabel);
    sub_220EFDEE0((uint64_t)v19, type metadata accessor for ChooseLabel);
    id v48 = *(void (**)(char *, uint64_t))(v38 + 8);
    v48(v37, v39);
    sub_220D26548(v46, v74, &qword_267F35588);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F355D0, &qword_267F35588);
    sub_220D25FB0(&qword_267F355D8, &qword_267F355A8);
    uint64_t v49 = (uint64_t)v75;
    sub_220F31488();
    swift_release();
    sub_220D25B68(v46, &qword_267F35588);
    sub_220EFDEE0(v80, type metadata accessor for ChooseLabel);
    v48(v79, v39);
LABEL_28:
    uint64_t v58 = v76;
    sub_220D26548(v49, v76, &qword_267F355B0);
    uint64_t v59 = v78;
    void *v78 = 0;
    *((unsigned char *)v59 + 8) = 0;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355E0);
    sub_220D26548(v58, (uint64_t)v59 + *(int *)(v60 + 48), &qword_267F355B0);
    sub_220D25B68(v49, &qword_267F355B0);
    return sub_220D25B68(v58, &qword_267F355B0);
  }
  __break(1u);
LABEL_32:
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220EED630@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v5 = sub_220F30E28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v74 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v75 = v10;
  uint64_t v76 = (uint64_t)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354E0);
  uint64_t v81 = *(void *)(v11 - 8);
  uint64_t v82 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v80 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354E8);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v69 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v83 = (char *)&v69 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355F0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (uint64_t *)((char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F355F8);
  MEMORY[0x270FA5388](v22);
  MEMORY[0x270FA5388](v23);
  uint64_t v25 = (char *)&v69 - v24;
  MEMORY[0x270FA5388](v26);
  uint64_t v77 = a1;
  uint64_t v30 = *a1;
  if (!v30) {
    goto LABEL_22;
  }
  uint64_t v72 = v27;
  uint64_t v78 = (uint64_t)&v69 - v28;
  uint64_t v79 = v29;
  uint64_t v84 = v8;
  uint64_t v85 = v16;
  uint64_t v86 = v6;
  uint64_t v87 = v14;
  unint64_t v31 = *(void *)(v30 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshots);
  uint64_t v88 = a3;
  uint64_t v89 = MEMORY[0x263F8EE78];
  if (v31 >> 62)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_220F32E48();
    if (v32) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v32 = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
    swift_bridgeObjectRetain();
    if (v32)
    {
LABEL_4:
      if (v32 >= 1)
      {
        uint64_t v70 = v5;
        uint64_t v71 = v13;
        for (uint64_t i = 0; i != v32; ++i)
        {
          if ((v31 & 0xC000000000000001) != 0)
          {
            uint64_t v34 = MEMORY[0x223C75B40](i, v31);
          }
          else
          {
            uint64_t v34 = *(void *)(v31 + 8 * i + 32);
            swift_retain();
          }
          if (*(unsigned char *)(v34 + 49) == 1)
          {
            sub_220F32DB8();
            sub_220F32DE8();
            sub_220F32DF8();
            sub_220F32DC8();
          }
          else
          {
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        uint64_t v35 = v89;
        uint64_t v13 = v71;
        uint64_t v5 = v70;
        goto LABEL_16;
      }
      __break(1u);
LABEL_22:
      type metadata accessor for ActivityConfigViewModel();
      sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
      uint64_t result = sub_220F30E88();
      __break(1u);
      return result;
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v35 = MEMORY[0x263F8EE78];
LABEL_16:
  swift_release();
  uint64_t v37 = v86;
  uint64_t v36 = v87;
  if (v35 < 0 || (v35 & 0x4000000000000000) != 0)
  {
    uint64_t v38 = v5;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_220F32E48();
    swift_release();
  }
  else
  {
    uint64_t v38 = v5;
    uint64_t v39 = *(void *)(v35 + 16);
  }
  swift_release();
  uint64_t *v21 = sub_220F32418();
  v21[1] = v40;
  uint64_t v41 = (uint64_t)v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35600) + 44);
  uint64_t v42 = (uint64_t)v77;
  sub_220EEDEC0(v39 > 1, (uint64_t)v77, v73, v41);
  char v43 = sub_220F31868();
  sub_220F30A88();
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  sub_220D26548((uint64_t)v21, (uint64_t)v25, &qword_267F355F0);
  uint64_t v52 = &v25[*(int *)(v72 + 36)];
  *uint64_t v52 = v43;
  *((void *)v52 + 1) = v45;
  *((void *)v52 + 2) = v47;
  *((void *)v52 + 3) = v49;
  *((void *)v52 + 4) = v51;
  v52[40] = 0;
  sub_220D25B68((uint64_t)v21, &qword_267F355F0);
  uint64_t v53 = v78;
  sub_220D39114((uint64_t)v25, v78, &qword_267F355F8);
  uint64_t v54 = v42;
  uint64_t v55 = v76;
  sub_220EFDE78(v54, v76, type metadata accessor for FacesAndPagesPicker.contents);
  unint64_t v56 = (*(unsigned __int8 *)(v74 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
  uint64_t v57 = swift_allocObject();
  sub_220EFF25C(v55, v57 + v56, type metadata accessor for FacesAndPagesPicker.contents);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35508);
  sub_220F01720(&qword_267F35510, &qword_267F35508, (void (*)(void))sub_220EFF9C8);
  uint64_t v58 = v80;
  sub_220F321A8();
  uint64_t v59 = v84;
  sub_220F30E18();
  sub_220D25FB0(&qword_267F35520, &qword_267F354E0);
  sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
  uint64_t v60 = v85;
  uint64_t v61 = v82;
  sub_220F31BA8();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v59, v38);
  (*(void (**)(char *, uint64_t))(v81 + 8))(v58, v61);
  uint64_t v62 = v83;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v83, v60, v13);
  uint64_t v63 = v79;
  sub_220D26548(v53, v79, &qword_267F355F8);
  uint64_t v64 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
  v64(v60, v62, v13);
  uint64_t v65 = v88;
  sub_220D26548(v63, v88, &qword_267F355F8);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35608);
  v64((char *)(v65 + *(int *)(v66 + 48)), v60, v13);
  uint64_t v67 = *(void (**)(char *, uint64_t))(v36 + 8);
  v67(v62, v13);
  sub_220D25B68(v53, &qword_267F355F8);
  v67(v60, v13);
  return sub_220D25B68(v63, &qword_267F355F8);
}

uint64_t sub_220EEDEC0@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v75 = a3;
  uint64_t v78 = a4;
  uint64_t v74 = sub_220F31EB8();
  uint64_t v72 = *(void *)(v74 - 8);
  MEMORY[0x270FA5388](v74);
  uint64_t v73 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (int *)type metadata accessor for HomeScreenPageView();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35610);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v77 = (uint64_t)&v65 - v14;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (uint64_t)&v65 - v16;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35618);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35620);
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v71 = (uint64_t)&v65 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35628);
  MEMORY[0x270FA5388](v24 - 8);
  __n128 v26 = MEMORY[0x270FA5388](v25);
  uint64_t v76 = v27;
  uint64_t v79 = a2;
  uint64_t v80 = (uint64_t)&v65 - v28;
  if ((a1 & 1) == 0)
  {
    (*(void (**)(__n128))(v22 + 56))(v26);
    uint64_t v29 = v10;
LABEL_25:
    (*(void (**)(char *, void, uint64_t))(v72 + 104))(v73, *MEMORY[0x263F1B388], v74);
    swift_retain();
    a2 = sub_220F32018();
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t *v9 = sub_220F30EA8();
    v9[1] = v46;
    uint64_t v47 = (uint64_t *)((char *)v9 + v7[5]);
    *uint64_t v47 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    swift_storeEnumTagMultiPayload();
    uint64_t v48 = (uint64_t *)((char *)v9 + v7[6]);
    uint64_t v81 = 0;
    sub_220F32148();
    uint64_t v49 = *((void *)&v82 + 1);
    *uint64_t v48 = v82;
    v48[1] = v49;
    uint64_t v50 = (char *)v9 + v7[7];
    LOBYTE(v81) = 0;
    sub_220F32148();
    uint64_t v51 = *((void *)&v82 + 1);
    *uint64_t v50 = v82;
    *((void *)v50 + 1) = v51;
    uint64_t v52 = (uint64_t *)((char *)v9 + v7[8]);
    type metadata accessor for HomeScreenSnapshot();
    sub_220F0000C(&qword_267F2F378, (void (*)(uint64_t))type metadata accessor for HomeScreenSnapshot);
    *uint64_t v52 = sub_220F30CA8();
    v52[1] = v53;
    uint64_t v54 = (_OWORD *)((char *)v9 + v7[9]);
    v54[4] = 0u;
    v54[5] = 0u;
    v54[2] = 0u;
    v54[3] = 0u;
    *uint64_t v54 = 0u;
    v54[1] = 0u;
    *((unsigned char *)v9 + v7[11]) = 0;
    uint64_t v55 = (char *)v9 + v7[12];
    *(void *)uint64_t v55 = a2;
    *(_OWORD *)(v55 + 8) = xmmword_220F3D4C0;
    *((void *)v55 + 3) = 0x4018000000000000;
    *(uint64_t *)((char *)v9 + v7[10]) = 0x402A000000000000;
    LODWORD(a2) = *(unsigned __int8 *)(v79 + *(int *)(type metadata accessor for FacesAndPagesPicker.contents(0) + 36));
    id v56 = objc_msgSend(self, sel_currentDevice);
    id v57 = objc_msgSend(v56, sel_userInterfaceIdiom);

    if (v57 != (id)1)
    {
      uint64_t v10 = v78;
      goto LABEL_31;
    }
    if (a2)
    {
      uint64_t v10 = v78;
      if (qword_267F2E150 == -1) {
        goto LABEL_31;
      }
      goto LABEL_35;
    }
    uint64_t v10 = v78;
    if (qword_267F2E158 == -1)
    {
LABEL_31:
      sub_220EE6678(a2);
      sub_220F32468();
      sub_220F30BA8();
      uint64_t v58 = v77;
      sub_220EFDE78((uint64_t)v9, v77, (uint64_t (*)(void))type metadata accessor for HomeScreenPageView);
      uint64_t v59 = (_OWORD *)(v58 + *(int *)(v29 + 36));
      long long v60 = v83;
      *uint64_t v59 = v82;
      v59[1] = v60;
      v59[2] = v84;
      sub_220EFDEE0((uint64_t)v9, (uint64_t (*)(void))type metadata accessor for HomeScreenPageView);
      sub_220D39114(v58, v17, &qword_267F35610);
      uint64_t v61 = v80;
      uint64_t v62 = v76;
      sub_220D26548(v80, v76, &qword_267F35628);
      sub_220D26548(v17, v12, &qword_267F35610);
      sub_220D26548(v62, v10, &qword_267F35628);
      uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35630);
      sub_220D26548(v12, v10 + *(int *)(v63 + 48), &qword_267F35610);
      sub_220D25B68(v17, &qword_267F35610);
      sub_220D25B68(v61, &qword_267F35628);
      sub_220D25B68(v12, &qword_267F35610);
      return sub_220D25B68(v62, &qword_267F35628);
    }
LABEL_35:
    swift_once();
    goto LABEL_31;
  }
  uint64_t v66 = v22;
  uint64_t v29 = *(void *)a2;
  if (*(void *)a2)
  {
    uint64_t v69 = v17;
    uint64_t v70 = v12;
    uint64_t v17 = *(void *)(v29 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshots);
    *(void *)&long long v82 = MEMORY[0x263F8EE78];
    uint64_t v67 = v21;
    uint64_t v68 = v10;
    if ((unint64_t)v17 >> 62)
    {
      if (v17 < 0) {
        LOBYTE(a2) = v17;
      }
      else {
        LOBYTE(a2) = v17 & 0xF8;
      }
      swift_retain();
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_220F32E48();
      if (v12) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v12 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_retain();
      swift_bridgeObjectRetain();
      if (v12)
      {
LABEL_5:
        if (v12 < 1) {
          goto LABEL_34;
        }
        uint64_t v65 = v29;
        a2 = 0;
        do
        {
          if ((v17 & 0xC000000000000001) != 0)
          {
            uint64_t v30 = MEMORY[0x223C75B40](a2, v17);
          }
          else
          {
            uint64_t v30 = *(void *)(v17 + 8 * a2 + 32);
            swift_retain();
          }
          if (*(unsigned char *)(v30 + 49) == 1)
          {
            sub_220F32DB8();
            uint64_t v10 = *(void *)(v82 + 16);
            sub_220F32DE8();
            sub_220F32DF8();
            sub_220F32DC8();
          }
          else
          {
            swift_release();
          }
          ++a2;
        }
        while (v12 != a2);
        swift_bridgeObjectRelease();
        uint64_t v31 = v82;
        uint64_t v29 = v65;
LABEL_21:
        swift_release();
        uint64_t v12 = v70;
        uint64_t v17 = v69;
        if ((v31 & 0xC000000000000001) != 0)
        {
          MEMORY[0x223C75B40](1, v31);
          goto LABEL_24;
        }
        if (*(void *)(v31 + 16) >= 2uLL)
        {
          swift_retain();
LABEL_24:
          swift_release();
          *(void *)uint64_t v20 = sub_220F31348();
          *((void *)v20 + 1) = 0;
          v20[16] = 1;
          uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35638);
          sub_220EEE8C8(v79, (uint64_t)&v20[*(int *)(v32 + 44)]);
          char v33 = sub_220F31848();
          sub_220F30A88();
          uint64_t v35 = v34;
          uint64_t v37 = v36;
          uint64_t v39 = v38;
          uint64_t v41 = v40;
          uint64_t v42 = v71;
          sub_220D26548((uint64_t)v20, v71, &qword_267F35618);
          swift_release();
          uint64_t v43 = v67;
          uint64_t v44 = v42 + *(int *)(v67 + 36);
          *(unsigned char *)uint64_t v44 = v33;
          *(void *)(v44 + 8) = v35;
          *(void *)(v44 + 16) = v37;
          *(void *)(v44 + 24) = v39;
          *(void *)(v44 + 32) = v41;
          *(unsigned char *)(v44 + 40) = 0;
          sub_220D25B68((uint64_t)v20, &qword_267F35618);
          uint64_t v45 = v80;
          sub_220D39114(v42, v80, &qword_267F35620);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v66 + 56))(v45, 0, 1, v43);
          uint64_t v29 = v68;
          goto LABEL_25;
        }
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v31 = MEMORY[0x263F8EE78];
    goto LABEL_21;
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220EEE8C8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v42 = a1;
  uint64_t v47 = a2;
  uint64_t v2 = type metadata accessor for HomeScreenPageView();
  uint64_t v3 = (int *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35610);
  MEMORY[0x270FA5388](v43);
  uint64_t v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35640);
  MEMORY[0x270FA5388](v45);
  uint64_t v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35648);
  MEMORY[0x270FA5388](v46);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35650);
  MEMORY[0x270FA5388](v44);
  uint64_t v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  uint64_t v14 = sub_220F31F68();
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t *v5 = sub_220F30EA8();
  v5[1] = v15;
  uint64_t v16 = (uint64_t *)((char *)v5 + v3[7]);
  uint64_t *v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (uint64_t *)((char *)v5 + v3[8]);
  uint64_t v48 = 0;
  sub_220F32148();
  uint64_t v18 = *((void *)&v49 + 1);
  void *v17 = v49;
  v17[1] = v18;
  uint64_t v19 = (char *)v5 + v3[9];
  LOBYTE(v48) = 0;
  sub_220F32148();
  uint64_t v20 = *((void *)&v49 + 1);
  *uint64_t v19 = v49;
  *((void *)v19 + 1) = v20;
  uint64_t v21 = (uint64_t *)((char *)v5 + v3[10]);
  type metadata accessor for HomeScreenSnapshot();
  sub_220F0000C(&qword_267F2F378, (void (*)(uint64_t))type metadata accessor for HomeScreenSnapshot);
  uint64_t *v21 = sub_220F30CA8();
  v21[1] = v22;
  uint64_t v23 = (_OWORD *)((char *)v5 + v3[11]);
  v23[4] = 0u;
  v23[5] = 0u;
  v23[2] = 0u;
  v23[3] = 0u;
  *uint64_t v23 = 0u;
  v23[1] = 0u;
  *((unsigned char *)v5 + v3[13]) = 0;
  uint64_t v24 = (uint64_t *)((char *)v5 + v3[14]);
  *uint64_t v24 = v14;
  v24[1] = 0;
  v24[2] = 0;
  v24[3] = 0;
  *(uint64_t *)((char *)v5 + v3[12]) = 0x402A000000000000;
  int v25 = *(unsigned __int8 *)(v42 + *(int *)(type metadata accessor for FacesAndPagesPicker.contents(0) + 36));
  id v26 = objc_msgSend(self, sel_currentDevice);
  id v27 = objc_msgSend(v26, sel_userInterfaceIdiom);

  if (v27 == (id)1)
  {
    if (v25)
    {
      if (qword_267F2E150 == -1) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
    if (qword_267F2E158 != -1) {
LABEL_8:
    }
      swift_once();
  }
LABEL_7:
  sub_220EE6678(v25);
  sub_220F32468();
  sub_220F30BA8();
  sub_220EFDE78((uint64_t)v5, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HomeScreenPageView);
  uint64_t v28 = &v7[*(int *)(v43 + 36)];
  long long v29 = v50;
  *(_OWORD *)uint64_t v28 = v49;
  *((_OWORD *)v28 + 1) = v29;
  *((_OWORD *)v28 + 2) = v51;
  sub_220EFDEE0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HomeScreenPageView);
  sub_220F32548();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_220D26548((uint64_t)v7, (uint64_t)v9, &qword_267F35610);
  uint64_t v34 = (int64x2_t *)&v9[*(int *)(v45 + 36)];
  *uint64_t v34 = vdupq_n_s64(0x3FECCCCCCCCCCCCDuLL);
  v34[1].i64[0] = v31;
  v34[1].i64[1] = v33;
  sub_220D25B68((uint64_t)v7, &qword_267F35610);
  sub_220F32548();
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  sub_220D26548((uint64_t)v9, (uint64_t)v11, &qword_267F35640);
  uint64_t v39 = &v11[*(int *)(v46 + 36)];
  *(void *)uint64_t v39 = 0x3FAACEE9F37BEBD6;
  *((void *)v39 + 1) = v36;
  *((void *)v39 + 2) = v38;
  sub_220D25B68((uint64_t)v9, &qword_267F35640);
  sub_220D26548((uint64_t)v11, (uint64_t)v13, &qword_267F35648);
  *(void *)&v13[*(int *)(v44 + 36)] = 0x3FE6666666666666;
  sub_220D25B68((uint64_t)v11, &qword_267F35648);
  return sub_220D39114((uint64_t)v13, v47, &qword_267F35650);
}

uint64_t sub_220EEEE80(void *a1)
{
  if (*a1)
  {
    swift_retain();
    sub_220DEC3C8();
    swift_release();
    swift_retain();
    sub_220DEB4E0(MEMORY[0x263F8EE78]);
    swift_release();
    swift_retain();
    sub_220DE9E7C(1);
    return swift_release();
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

__n128 sub_220EEEF54@<Q0>(__n128 *a1@<X8>)
{
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  a1->n128_u64[0] = sub_220F30EA8();
  a1->n128_u64[1] = v2;
  __asm { FMOV            V0.2D, #-10.0 }
  a1[1] = result;
  return result;
}

uint64_t sub_220EEEFCC(void *a1)
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
  MEMORY[0x223C75070](&v6);
  if (v6 == 1)
  {
    LOBYTE(v6) = 0;
    return sub_220F322B8();
  }
  if (!*a1) {
    goto LABEL_16;
  }
  unint64_t v3 = *(void *)(*a1 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_homeScreenSnapshots);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_220F32E48();
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_6:
      if (v4 >= 1)
      {
        uint64_t v5 = 0;
        do
        {
          if ((v3 & 0xC000000000000001) != 0) {
            MEMORY[0x223C75B40](v5, v3);
          }
          else {
            swift_retain();
          }
          ++v5;
          swift_getKeyPath();
          swift_getKeyPath();
          sub_220F309C8();
        }
        while (v4 != v5);
        return swift_bridgeObjectRelease();
      }
      __break(1u);
LABEL_16:
      type metadata accessor for ActivityConfigViewModel();
      sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
      uint64_t result = sub_220F30E88();
      __break(1u);
      return result;
    }
  }
  return swift_bridgeObjectRelease();
}

double sub_220EEF1C4@<D0>(_OWORD *a1@<X8>)
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
  sub_220F322D8();
  sub_220F322D8();
  sub_220E692D4(v6, *((uint64_t *)&v6 + 1), v7, v6, *((uint64_t *)&v6 + 1), v7, 1, 1, (uint64_t)&v6);
  long long v2 = v9;
  a1[2] = v8;
  a1[3] = v2;
  long long v3 = v11;
  a1[4] = v10;
  a1[5] = v3;
  double result = *(double *)&v6;
  long long v5 = v7;
  *a1 = v6;
  a1[1] = v5;
  return result;
}

uint64_t sub_220EEF2B4()
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
  MEMORY[0x223C75070](&v1);
  sub_220F322B8();
  swift_release();
  return swift_release();
}

uint64_t sub_220EEF370@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = sub_220F31348();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  return a3(a1);
}

uint64_t sub_220EEF3D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35668);
  MEMORY[0x270FA5388](v69);
  uint64_t v65 = (uint64_t)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35670);
  MEMORY[0x270FA5388](v5 - 8);
  long long v7 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  long long v10 = (uint64_t *)((char *)&v63 - v9);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35678);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v64 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v63 - v14;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35680);
  MEMORY[0x270FA5388](v66);
  uint64_t v68 = (uint64_t)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35688);
  MEMORY[0x270FA5388](v67);
  uint64_t v18 = (_OWORD *)((char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = type metadata accessor for ChooseLabel(0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (uint64_t *)((char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (uint64_t)a1;
  uint64_t v25 = *a1;
  if (*a1)
  {
    uint64_t v70 = a2;
    uint64_t v71 = (uint64_t)&v63 - v23;
    uint64_t v26 = *(void *)(v25 + OBJC_IVAR____TtC15FocusSettingsUI23ActivityConfigViewModel_selectedWatchFace);
    if (v26)
    {
      swift_retain();
      *(void *)uint64_t v15 = sub_220F31348();
      *((void *)v15 + 1) = 0;
      v15[16] = 1;
      id v27 = &v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F356A8) + 44)];
      uint64_t *v10 = sub_220F32418();
      v10[1] = v28;
      uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356B0);
      sub_220EEFC64(v26, v24, (uint64_t)v10 + *(int *)(v29 + 44));
      sub_220D26548((uint64_t)v10, (uint64_t)v7, &qword_267F35670);
      *(void *)id v27 = 0;
      v27[8] = 0;
      uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356B8);
      sub_220D26548((uint64_t)v7, (uint64_t)&v27[*(int *)(v30 + 48)], &qword_267F35670);
      sub_220D25B68((uint64_t)v10, &qword_267F35670);
      sub_220D25B68((uint64_t)v7, &qword_267F35670);
      type metadata accessor for ActivityConfigViewModel();
      sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
      uint64_t *v21 = sub_220F30EA8();
      v21[1] = v31;
      uint64_t v32 = (uint64_t *)((char *)v21 + *(int *)(v19 + 20));
      *uint64_t v32 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
      swift_storeEnumTagMultiPayload();
      *((unsigned char *)v21 + *(int *)(v19 + 24)) = 1;
      uint64_t v33 = v71;
      sub_220EFF25C((uint64_t)v21, v71, type metadata accessor for ChooseLabel);
      uint64_t v34 = v64;
      sub_220D26548((uint64_t)v15, v64, &qword_267F35678);
      sub_220EFDE78(v33, (uint64_t)v21, type metadata accessor for ChooseLabel);
      uint64_t v35 = v65;
      sub_220D26548(v34, v65, &qword_267F35678);
      uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356C0);
      sub_220EFDE78((uint64_t)v21, v35 + *(int *)(v36 + 48), type metadata accessor for ChooseLabel);
      sub_220EFDEE0((uint64_t)v21, type metadata accessor for ChooseLabel);
      sub_220D25B68(v34, &qword_267F35678);
      sub_220D26548(v35, v68, &qword_267F35668);
      swift_storeEnumTagMultiPayload();
      sub_220D25FB0(&qword_267F35698, &qword_267F35668);
      sub_220D25FB0(&qword_267F356A0, &qword_267F35688);
      sub_220F31488();
      swift_release();
      sub_220D25B68(v35, &qword_267F35668);
      sub_220EFDEE0(v33, type metadata accessor for ChooseLabel);
      return sub_220D25B68((uint64_t)v15, &qword_267F35678);
    }
    else
    {
      uint64_t v38 = sub_220F31348();
      sub_220EFFA5C((uint64_t)v101);
      uint64_t v39 = v101[0];
      uint64_t v40 = v101[1];
      uint64_t v41 = v101[2];
      uint64_t v42 = v101[3];
      uint64_t v43 = v101[4];
      uint64_t v44 = v101[5];
      uint64_t v45 = v101[6];
      char v46 = sub_220F31848();
      sub_220F30A88();
      uint64_t v48 = v47;
      uint64_t v50 = v49;
      uint64_t v52 = v51;
      uint64_t v54 = v53;
      char v74 = 1;
      char v73 = 0;
      char v72 = 0;
      type metadata accessor for ActivityConfigViewModel();
      sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
      uint64_t *v21 = sub_220F30EA8();
      v21[1] = v55;
      id v56 = (uint64_t *)((char *)v21 + *(int *)(v19 + 20));
      *id v56 = swift_getKeyPath();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
      swift_storeEnumTagMultiPayload();
      *((unsigned char *)v21 + *(int *)(v19 + 24)) = 0;
      uint64_t v57 = v71;
      sub_220EFF25C((uint64_t)v21, v71, type metadata accessor for ChooseLabel);
      sub_220EFDE78(v57, (uint64_t)v21, type metadata accessor for ChooseLabel);
      v75[0] = v38;
      v75[1] = 0;
      LOBYTE(v76) = 1;
      uint64_t v77 = 0;
      LOBYTE(v78) = 0;
      *((void *)&v78 + 1) = v39;
      *(void *)&long long v79 = v40;
      *((void *)&v79 + 1) = v41;
      *(void *)&long long v80 = v42;
      *((void *)&v80 + 1) = v43;
      *(void *)&long long v81 = v44;
      *((void *)&v81 + 1) = v45;
      LOBYTE(v82) = v46;
      *((void *)&v82 + 1) = v48;
      *(void *)&v83[0] = v50;
      *((void *)&v83[0] + 1) = v52;
      *(void *)&v83[1] = v54;
      BYTE8(v83[1]) = 0;
      long long v58 = v76;
      *uint64_t v18 = (unint64_t)v38;
      v18[1] = v58;
      *(_OWORD *)((char *)v18 + 121) = *(_OWORD *)((char *)v83 + 9);
      long long v59 = v83[0];
      v18[6] = v82;
      v18[7] = v59;
      long long v60 = v81;
      v18[4] = v80;
      v18[5] = v60;
      long long v61 = v79;
      v18[2] = v78;
      v18[3] = v61;
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35690);
      sub_220EFDE78((uint64_t)v21, (uint64_t)v18 + *(int *)(v62 + 48), type metadata accessor for ChooseLabel);
      swift_retain();
      swift_retain();
      swift_retain();
      sub_220EFFC58((uint64_t)v75);
      sub_220EFDEE0((uint64_t)v21, type metadata accessor for ChooseLabel);
      v84[0] = v38;
      v84[1] = 0;
      char v85 = 1;
      uint64_t v86 = 0;
      char v87 = 0;
      uint64_t v88 = v39;
      uint64_t v89 = v40;
      uint64_t v90 = v41;
      uint64_t v91 = v42;
      uint64_t v92 = v43;
      uint64_t v93 = v44;
      uint64_t v94 = v45;
      char v95 = v46;
      uint64_t v96 = v48;
      uint64_t v97 = v50;
      uint64_t v98 = v52;
      uint64_t v99 = v54;
      char v100 = 0;
      sub_220EFFCA0((uint64_t)v84);
      sub_220D26548((uint64_t)v18, v68, &qword_267F35688);
      swift_storeEnumTagMultiPayload();
      sub_220D25FB0(&qword_267F35698, &qword_267F35668);
      sub_220D25FB0(&qword_267F356A0, &qword_267F35688);
      sub_220F31488();
      sub_220D25B68((uint64_t)v18, &qword_267F35688);
      sub_220EFDEE0(v71, type metadata accessor for ChooseLabel);
      swift_release();
      swift_release();
      return swift_release();
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EEFC64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v121 = a3;
  uint64_t v122 = a2;
  uint64_t v4 = sub_220F30E28();
  uint64_t v119 = *(void *)(v4 - 8);
  uint64_t v120 = v4;
  MEMORY[0x270FA5388](v4);
  unsigned __int8 v116 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v108 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v109 = v7;
  uint64_t v110 = (uint64_t)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354E0);
  uint64_t v112 = *(void *)(v114 - 8);
  MEMORY[0x270FA5388](v114);
  uint64_t v111 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354E8);
  uint64_t v117 = *(void *)(v9 - 8);
  uint64_t v118 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v115 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v113 = (char *)&v99 - v12;
  uint64_t v13 = sub_220F30AD8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v99 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v99 - v18;
  uint64_t v20 = sub_220F30E58();
  uint64_t v21 = v20 - 8;
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (_OWORD *)((char *)&v99 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A10);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356C8);
  MEMORY[0x270FA5388](v27 - 8);
  uint64_t v29 = (uint64_t *)((char *)&v99 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356D0);
  MEMORY[0x270FA5388](v99);
  uint64_t v103 = (char *)&v99 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356D8);
  MEMORY[0x270FA5388](v31 - 8);
  uint64_t v105 = (uint64_t)&v99 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356E0);
  MEMORY[0x270FA5388](v102);
  uint64_t v104 = (uint64_t)&v99 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356E8);
  MEMORY[0x270FA5388](v101);
  uint64_t v107 = (uint64_t)&v99 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v100 = (uint64_t)&v99 - v36;
  MEMORY[0x270FA5388](v37);
  uint64_t v106 = (uint64_t)&v99 - v38;
  *uint64_t v29 = sub_220F32468();
  v29[1] = v39;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356F0);
  sub_220EF0814(a1, (uint64_t)v29 + *(int *)(v40 + 44));
  uint64_t v41 = (char *)v23 + *(int *)(v21 + 28);
  uint64_t v42 = *MEMORY[0x263F19860];
  uint64_t v43 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v41, v42, v43);
  __asm { FMOV            V0.2D, #17.0 }
  *uint64_t v23 = _Q0;
  sub_220F11B30((uint64_t)v19);
  (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x263F18508], v13);
  char v49 = sub_220F30AC8();
  uint64_t v50 = *(void (**)(char *, uint64_t))(v14 + 8);
  v50(v16, v13);
  v50(v19, v13);
  if (v49)
  {
    uint64_t v51 = sub_220F31F08();
  }
  else
  {
    id v52 = objc_msgSend(self, sel_systemGray3Color);
    uint64_t v51 = MEMORY[0x223C74C60](v52);
  }
  uint64_t v53 = v51;
  sub_220F30B18();
  uint64_t v54 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v23, (uint64_t)v26, MEMORY[0x263F19048]);
  uint64_t v55 = &v26[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A30) + 36)];
  long long v56 = v124;
  *(_OWORD *)uint64_t v55 = v123;
  *((_OWORD *)v55 + 1) = v56;
  *((void *)v55 + 4) = v125;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A38);
  *(void *)&v26[*(int *)(v57 + 52)] = v53;
  *(_WORD *)&v26[*(int *)(v57 + 56)] = 256;
  uint64_t v58 = sub_220F32468();
  uint64_t v60 = v59;
  long long v61 = (uint64_t *)&v26[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A40) + 36)];
  *long long v61 = v58;
  v61[1] = v60;
  sub_220EFDEE0((uint64_t)v23, v54);
  uint64_t v62 = sub_220F32468();
  uint64_t v64 = v63;
  uint64_t v65 = (uint64_t)v103;
  uint64_t v66 = (uint64_t)&v103[*(int *)(v99 + 36)];
  sub_220D26548((uint64_t)v26, v66, &qword_267F30A10);
  uint64_t v67 = (uint64_t *)(v66 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A08) + 36));
  *uint64_t v67 = v62;
  v67[1] = v64;
  sub_220D26548((uint64_t)v29, v65, &qword_267F356C8);
  sub_220D25B68((uint64_t)v26, &qword_267F30A10);
  sub_220D25B68((uint64_t)v29, &qword_267F356C8);
  uint64_t v68 = v105;
  sub_220D26548(v65, v105, &qword_267F356D0);
  sub_220D25B68(v65, &qword_267F356D0);
  char v69 = sub_220F31808();
  sub_220F30A88();
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v78 = v104;
  sub_220D26548(v68, v104, &qword_267F356D8);
  uint64_t v79 = v78 + *(int *)(v102 + 36);
  *(unsigned char *)uint64_t v79 = v69;
  *(void *)(v79 + 8) = v71;
  *(void *)(v79 + 16) = v73;
  *(void *)(v79 + 24) = v75;
  *(void *)(v79 + 32) = v77;
  *(unsigned char *)(v79 + 40) = 0;
  sub_220D25B68(v68, &qword_267F356D8);
  uint64_t v80 = v100;
  sub_220D26548(v78, v100, &qword_267F356E0);
  *(_WORD *)(v80 + *(int *)(v101 + 36)) = 256;
  sub_220D25B68(v78, &qword_267F356E0);
  uint64_t v81 = v106;
  sub_220D39114(v80, v106, &qword_267F356E8);
  uint64_t v82 = v110;
  sub_220EFDE78(v122, v110, type metadata accessor for FacesAndPagesPicker.contents);
  unint64_t v83 = (*(unsigned __int8 *)(v108 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
  uint64_t v84 = swift_allocObject();
  sub_220EFF25C(v82, v84 + v83, type metadata accessor for FacesAndPagesPicker.contents);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35508);
  sub_220F01720(&qword_267F35510, &qword_267F35508, (void (*)(void))sub_220EFF9C8);
  char v85 = v111;
  sub_220F321A8();
  uint64_t v86 = v116;
  sub_220F30E18();
  sub_220D25FB0(&qword_267F35520, &qword_267F354E0);
  sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
  uint64_t v87 = v114;
  uint64_t v88 = v115;
  uint64_t v89 = v120;
  sub_220F31BA8();
  (*(void (**)(char *, uint64_t))(v119 + 8))(v86, v89);
  (*(void (**)(char *, uint64_t))(v112 + 8))(v85, v87);
  uint64_t v91 = v117;
  uint64_t v90 = v118;
  uint64_t v92 = v113;
  (*(void (**)(char *, char *, uint64_t))(v117 + 32))(v113, v88, v118);
  uint64_t v93 = v107;
  sub_220D26548(v81, v107, &qword_267F356E8);
  uint64_t v94 = *(void (**)(char *, char *, uint64_t))(v91 + 16);
  v94(v88, v92, v90);
  uint64_t v95 = v121;
  sub_220D26548(v93, v121, &qword_267F356E8);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F356F8);
  v94((char *)(v95 + *(int *)(v96 + 48)), v88, v90);
  uint64_t v97 = *(void (**)(char *, uint64_t))(v91 + 8);
  v97(v92, v90);
  sub_220D25B68(v81, &qword_267F356E8);
  v97(v88, v90);
  return sub_220D25B68(v93, &qword_267F356E8);
}

uint64_t sub_220EF0814@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v122 = a1;
  uint64_t v131 = a2;
  uint64_t v117 = sub_220F31EB8();
  uint64_t v116 = *(void *)(v117 - 8);
  MEMORY[0x270FA5388](v117);
  uint64_t v114 = (char *)&v100 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = sub_220F32088();
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v104 = (char *)&v100 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35700);
  MEMORY[0x270FA5388](v107);
  uint64_t v109 = (char *)&v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35708);
  MEMORY[0x270FA5388](v108);
  uint64_t v112 = (uint64_t)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35710);
  MEMORY[0x270FA5388](v110);
  uint64_t v113 = (uint64_t)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35718);
  MEMORY[0x270FA5388](v130);
  uint64_t v111 = (uint64_t)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v115 = (uint64_t)&v100 - v9;
  uint64_t v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35720);
  MEMORY[0x270FA5388](v125);
  uint64_t v128 = (uint64_t)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F320C0);
  MEMORY[0x270FA5388](v100);
  uint64_t v102 = (uint64_t)&v100 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F320C8);
  MEMORY[0x270FA5388](v126);
  uint64_t v101 = (uint64_t)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v103 = (uint64_t)&v100 - v14;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35728);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v129 = (uint64_t)&v100 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v127 = (char *)&v100 - v18;
  uint64_t v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310);
  MEMORY[0x270FA5388](v132);
  uint64_t v20 = (char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_220F30E58();
  MEMORY[0x270FA5388](v21);
  uint64_t v23 = (char *)&v100 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F337E8);
  uint64_t v25 = v24 - 8;
  MEMORY[0x270FA5388](v24);
  uint64_t v27 = (uint64_t *)((char *)&v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F337F0);
  uint64_t v29 = v28 - 8;
  MEMORY[0x270FA5388](v28);
  uint64_t v31 = (char *)&v100 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v32);
  uint64_t v34 = (char *)&v100 - v33;
  id v35 = objc_msgSend(self, sel_blackColor);
  uint64_t v36 = sub_220F31EC8();
  uint64_t v121 = v21;
  uint64_t v37 = &v23[*(int *)(v21 + 20)];
  uint64_t v38 = *MEMORY[0x263F19860];
  uint64_t v39 = sub_220F312A8();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(void (**)(char *, void, uint64_t))(v40 + 104);
  unsigned int v120 = v38;
  uint64_t v42 = v38;
  uint64_t v43 = v39;
  uint64_t v119 = v41;
  uint64_t v118 = v40 + 104;
  v41(v37, v42, v39);
  __asm { FMOV            V0.2D, #17.0 }
  *(_OWORD *)uint64_t v23 = _Q0;
  char v49 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v23, (uint64_t)v20, MEMORY[0x263F19048]);
  *(_WORD *)&v20[*(int *)(v132 + 36)] = 256;
  sub_220D26548((uint64_t)v20, (uint64_t)v27 + *(int *)(v25 + 44), &qword_267F2F310);
  *uint64_t v27 = v36;
  swift_retain();
  sub_220D25B68((uint64_t)v20, &qword_267F2F310);
  sub_220EFDEE0((uint64_t)v23, v49);
  swift_release();
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v27, (uint64_t)v31, &qword_267F337E8);
  uint64_t v50 = &v31[*(int *)(v29 + 44)];
  long long v51 = v134;
  *(_OWORD *)uint64_t v50 = v133;
  *((_OWORD *)v50 + 1) = v51;
  *((_OWORD *)v50 + 2) = v135;
  sub_220D25B68((uint64_t)v27, &qword_267F337E8);
  long long v124 = v31;
  long long v123 = v34;
  sub_220D39114((uint64_t)v31, (uint64_t)v34, &qword_267F337F0);
  id v52 = *(void **)(v122 + OBJC_IVAR____TtC15FocusSettingsUI9WatchFace_faceImage);
  if (v52)
  {
    id v53 = v52;
    sub_220F32058();
    uint64_t v54 = v105;
    uint64_t v55 = v104;
    uint64_t v56 = v106;
    (*(void (**)(char *, void, uint64_t))(v105 + 104))(v104, *MEMORY[0x263F1B4B8], v106);
    uint64_t v57 = sub_220F320D8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v54 + 8))(v55, v56);
    uint64_t v58 = sub_220F31F48();
    LOBYTE(v54) = sub_220F31818();
    v119(&v23[*(int *)(v121 + 20)], v120, v43);
    __asm { FMOV            V0.2D, #13.0 }
    *(_OWORD *)uint64_t v23 = _Q0;
    uint64_t v60 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_220EFDE78((uint64_t)v23, (uint64_t)v20, MEMORY[0x263F19048]);
    *(_WORD *)&v20[*(int *)(v132 + 36)] = 256;
    uint64_t v61 = (uint64_t)v109;
    sub_220D26548((uint64_t)v20, (uint64_t)&v109[*(int *)(v107 + 36)], &qword_267F2F310);
    *(void *)uint64_t v61 = v57;
    *(void *)(v61 + 8) = 0;
    *(_WORD *)(v61 + 16) = 1;
    *(void *)(v61 + 24) = v58;
    *(unsigned char *)(v61 + 32) = v54;
    swift_retain();
    swift_retain();
    sub_220D25B68((uint64_t)v20, &qword_267F2F310);
    sub_220EFDEE0((uint64_t)v23, v60);
    swift_release();
    swift_release();
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v62 = v112;
    sub_220D26548(v61, v112, &qword_267F35700);
    uint64_t v63 = (_OWORD *)(v62 + *(int *)(v108 + 36));
    long long v64 = v137;
    *uint64_t v63 = v136;
    v63[1] = v64;
    v63[2] = v138;
    sub_220D25B68(v61, &qword_267F35700);
    (*(void (**)(char *, void, uint64_t))(v116 + 104))(v114, *MEMORY[0x263F1B388], v117);
    uint64_t v65 = sub_220F32018();
    uint64_t v66 = v113;
    sub_220D26548(v62, v113, &qword_267F35708);
    uint64_t v67 = v66 + *(int *)(v110 + 36);
    *(void *)uint64_t v67 = v65;
    *(_OWORD *)(v67 + 8) = xmmword_220F3D4C0;
    *(void *)(v67 + 24) = 0x4018000000000000;
    sub_220D25B68(v62, &qword_267F35708);
    LOBYTE(v65) = sub_220F31818();
    sub_220F30A88();
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;
    uint64_t v75 = v74;
    uint64_t v76 = v111;
    sub_220D26548(v66, v111, &qword_267F35710);
    uint64_t v77 = v76 + *(int *)(v130 + 36);
    *(unsigned char *)uint64_t v77 = v65;
    *(void *)(v77 + 8) = v69;
    *(void *)(v77 + 16) = v71;
    *(void *)(v77 + 24) = v73;
    *(void *)(v77 + 32) = v75;
    *(unsigned char *)(v77 + 40) = 0;
    sub_220D25B68(v66, &qword_267F35710);
    uint64_t v78 = &qword_267F35718;
    uint64_t v79 = v115;
    sub_220D39114(v76, v115, &qword_267F35718);
    sub_220D26548(v79, v128, &qword_267F35718);
    swift_storeEnumTagMultiPayload();
    sub_220F01720(&qword_267F35730, &qword_267F35718, (void (*)(void))sub_220EFFD20);
    sub_220EFFEC0();
    uint64_t v80 = (uint64_t)v127;
    sub_220F31488();

    uint64_t v81 = v79;
  }
  else
  {
    v119(&v23[*(int *)(v121 + 20)], v120, v43);
    __asm { FMOV            V0.2D, #13.0 }
    *(_OWORD *)uint64_t v23 = _Q0;
    sub_220F32468();
    sub_220F30BA8();
    unint64_t v83 = (uint64_t (*)(void))MEMORY[0x263F19048];
    uint64_t v84 = v102;
    sub_220EFDE78((uint64_t)v23, v102, MEMORY[0x263F19048]);
    char v85 = (_OWORD *)(v84 + *(int *)(v100 + 36));
    long long v86 = v137;
    _OWORD *v85 = v136;
    v85[1] = v86;
    v85[2] = v138;
    sub_220EFDEE0((uint64_t)v23, v83);
    id v87 = objc_msgSend(self, sel_quaternarySystemFillColor);
    uint64_t v88 = MEMORY[0x223C74C60](v87);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v90 = v101;
    sub_220D26548(v84, v101, &qword_267F320C0);
    uint64_t v91 = (uint64_t *)(v90 + *(int *)(v126 + 36));
    *uint64_t v91 = KeyPath;
    v91[1] = v88;
    sub_220D25B68(v84, &qword_267F320C0);
    uint64_t v78 = &qword_267F320C8;
    uint64_t v92 = v90;
    uint64_t v93 = v103;
    sub_220D39114(v92, v103, &qword_267F320C8);
    sub_220D26548(v93, v128, &qword_267F320C8);
    swift_storeEnumTagMultiPayload();
    sub_220F01720(&qword_267F35730, &qword_267F35718, (void (*)(void))sub_220EFFD20);
    sub_220EFFEC0();
    uint64_t v80 = (uint64_t)v127;
    sub_220F31488();
    uint64_t v81 = v93;
  }
  sub_220D25B68(v81, v78);
  uint64_t v94 = (uint64_t)v123;
  uint64_t v95 = (uint64_t)v124;
  sub_220D26548((uint64_t)v123, (uint64_t)v124, &qword_267F337F0);
  uint64_t v96 = v129;
  sub_220D26548(v80, v129, &qword_267F35728);
  uint64_t v97 = v131;
  sub_220D26548(v95, v131, &qword_267F337F0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35770);
  sub_220D26548(v96, v97 + *(int *)(v98 + 48), &qword_267F35728);
  sub_220D25B68(v80, &qword_267F35728);
  sub_220D25B68(v94, &qword_267F337F0);
  sub_220D25B68(v96, &qword_267F35728);
  return sub_220D25B68(v95, &qword_267F337F0);
}

uint64_t sub_220EF163C(void *a1)
{
  if (*a1)
  {
    uint64_t v1 = qword_267F2E0E8;
    swift_retain();
    if (v1 != -1) {
      swift_once();
    }
    uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32D80);
    MEMORY[0x270FA5388](v2 - 8);
    uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v5 = sub_220F30638();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_220F309B8();
    swift_release();
    swift_release();
    uint64_t v6 = v10[0];
    uint64_t v7 = v10[1];
    uint64_t v8 = swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_220E4DF78((uint64_t)v4, v6, v7, (uint64_t)sub_220DF933C, v8);
    swift_bridgeObjectRelease();
    swift_release();
    sub_220D25B68((uint64_t)v4, &qword_267F32D80);
    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220EF1870()
{
  return sub_220F30C98();
}

uint64_t sub_220EF1904@<X0>(void *a1@<X8>)
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
  sub_220F322D8();
  type metadata accessor for ActivityConfigViewModel();
  sub_220F0000C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t v2 = sub_220F30EA8();
  return sub_220E70AB0(v2, v3, v5, v6, v7, a1);
}

uint64_t sub_220EF19E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED48);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_220F31EB8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_220F31F88();
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v49 = v93;
  uint64_t v50 = v91;
  int v44 = v94;
  int v45 = v92;
  uint64_t v47 = v96;
  uint64_t v48 = v95;
  uint64_t v46 = sub_220F31EA8();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F1B388], v5);
  uint64_t v51 = sub_220F32018();
  id v9 = objc_msgSend(self, sel_quaternaryLabelColor);
  uint64_t v43 = MEMORY[0x223C74C60](v9);
  sub_220F30B18();
  double v10 = v97;
  unsigned int v11 = v98;
  unsigned int v42 = v99;
  uint64_t v12 = v100;
  uint64_t v13 = v101;
  uint64_t v14 = v102;
  uint64_t v41 = sub_220F32468();
  uint64_t v56 = v15;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v54 = v103;
  uint64_t v55 = v105;
  uint64_t v17 = v107;
  uint64_t v16 = v108;
  uint64_t v38 = v107;
  uint64_t v39 = v108;
  unsigned __int8 v112 = v104;
  unsigned __int8 v110 = v106;
  uint64_t v40 = sub_220F32078();
  sub_220F31918();
  uint64_t v18 = sub_220F318F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v4, 1, 1, v18);
  uint64_t v19 = sub_220F31958();
  sub_220D25B68((uint64_t)v4, &qword_267F2ED48);
  uint64_t v20 = swift_getKeyPath();
  uint64_t v21 = sub_220F31EA8();
  uint64_t v22 = swift_getKeyPath();
  *(_DWORD *)((char *)&v60 + 10) = v113;
  HIWORD(v60) = v114;
  *(_DWORD *)((char *)&v62 + 9) = *(_DWORD *)v111;
  HIDWORD(v62) = *(_DWORD *)&v111[3];
  *(_DWORD *)((char *)&v63 + 9) = *(_DWORD *)v109;
  HIDWORD(v63) = *(_DWORD *)&v109[3];
  char v68 = v45;
  char v66 = v44;
  *(_WORD *)(a1 + 14) = v70;
  *(_DWORD *)(a1 + 10) = v69;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)&v67[3];
  *(_DWORD *)(a1 + 25) = *(_DWORD *)v67;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v65[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v65;
  *(void *)(a1 + 16) = v50;
  *(unsigned char *)(a1 + 24) = v68;
  *(void *)(a1 + 32) = v49;
  *(unsigned char *)(a1 + 40) = v66;
  uint64_t v23 = v47;
  *(void *)(a1 + 48) = v48;
  *(void *)(a1 + 56) = v23;
  *(void *)(a1 + 104) = 0x4000000000000000;
  *(void *)(a1 + 240) = v40;
  *(void *)(a1 + 248) = v20;
  *(void *)(a1 + 256) = v19;
  *(void *)(a1 + 264) = v22;
  unsigned __int8 v24 = v112;
  LODWORD(v49) = v112;
  unsigned __int8 v25 = v110;
  LODWORD(v50) = v110;
  *(double *)&long long v57 = v10 * 0.5;
  *((double *)&v57 + 1) = v10;
  LODWORD(v4) = v42;
  *(void *)&long long v58 = __PAIR64__(v42, v11);
  *((void *)&v58 + 1) = v12;
  uint64_t v26 = v13;
  *(void *)&long long v59 = v13;
  *((void *)&v59 + 1) = v14;
  uint64_t v27 = v43;
  *(void *)&long long v60 = v43;
  *(void *)(a1 + 272) = v21;
  WORD4(v60) = 256;
  uint64_t v28 = v41;
  *(void *)&long long v61 = v41;
  *((void *)&v61 + 1) = v56;
  *(void *)&long long v62 = v54;
  BYTE8(v62) = v24;
  *(void *)&long long v63 = v55;
  BYTE8(v63) = v25;
  *(void *)&long long v64 = v17;
  *((void *)&v64 + 1) = v16;
  long long v29 = v57;
  long long v30 = v58;
  long long v31 = v60;
  *(_OWORD *)(a1 + 144) = v59;
  *(_OWORD *)(a1 + 160) = v31;
  *(_OWORD *)(a1 + 112) = v29;
  *(_OWORD *)(a1 + 128) = v30;
  long long v32 = v61;
  long long v33 = v62;
  long long v34 = v64;
  *(_OWORD *)(a1 + 208) = v63;
  *(_OWORD *)(a1 + 224) = v34;
  *(_OWORD *)(a1 + 176) = v32;
  *(_OWORD *)(a1 + 192) = v33;
  uint64_t v35 = KeyPath;
  *(void *)a1 = v53;
  *(_WORD *)(a1 + 8) = 256;
  uint64_t v36 = v46;
  *(void *)(a1 + 64) = v35;
  *(void *)(a1 + 72) = v36;
  *(void *)(a1 + 80) = v51;
  *(_OWORD *)(a1 + 88) = xmmword_220F38D90;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_220E18414((uint64_t)&v57);
  v71[0] = v10 * 0.5;
  v71[1] = v10;
  unsigned int v72 = v11;
  int v73 = (int)v4;
  uint64_t v74 = v12;
  uint64_t v75 = v26;
  uint64_t v76 = v14;
  uint64_t v77 = v27;
  __int16 v78 = 256;
  int v79 = v113;
  __int16 v80 = v114;
  uint64_t v81 = v28;
  uint64_t v82 = v56;
  uint64_t v83 = v54;
  char v84 = v49;
  *(_DWORD *)&v85[3] = *(_DWORD *)&v111[3];
  *(_DWORD *)char v85 = *(_DWORD *)v111;
  uint64_t v86 = v55;
  char v87 = v50;
  *(_DWORD *)uint64_t v88 = *(_DWORD *)v109;
  *(_DWORD *)&v88[3] = *(_DWORD *)&v109[3];
  uint64_t v89 = v38;
  uint64_t v90 = v39;
  sub_220E1844C((uint64_t)v71);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_220EF1F68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_220F32468();
  uint64_t v4 = v3;
  sub_220EF19E8((uint64_t)__src);
  *a1 = v2;
  a1[1] = v4;
  return memcpy(a1 + 2, __src, 0x118uLL);
}

uint64_t sub_220EF1FC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v55 = a1;
  uint64_t v54 = sub_220F30D18();
  uint64_t v52 = *(void *)(v54 - 8);
  MEMORY[0x270FA5388](v54);
  uint64_t v53 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F357B0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  id v9 = (uint64_t *)((char *)&v50 - v8);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F357B8);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F357C0);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v51 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F357C8);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v12 = sub_220F31208();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v20 = (uint64_t)&v12[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F357D0) + 44)];
  uint64_t *v9 = sub_220F32468();
  v9[1] = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F357D8);
  sub_220EF2498((long long *)v2, (uint64_t)v9 + *(int *)(v22 + 44));
  char v23 = sub_220F31828();
  sub_220F30A88();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_220D26548((uint64_t)v9, (uint64_t)v6, &qword_267F357B0);
  sub_220D26548((uint64_t)v6, v20, &qword_267F357B0);
  uint64_t v32 = v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F357E0) + 48);
  *(unsigned char *)uint64_t v32 = v23;
  *(void *)(v32 + 8) = v25;
  *(void *)(v32 + 16) = v27;
  *(void *)(v32 + 24) = v29;
  *(void *)(v32 + 32) = v31;
  *(unsigned char *)(v32 + 40) = 0;
  sub_220D25B68((uint64_t)v9, &qword_267F357B0);
  sub_220D25B68((uint64_t)v6, &qword_267F357B0);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v35 = v52;
  long long v34 = v53;
  uint64_t v36 = v54;
  (*(void (**)(char *, void, uint64_t))(v52 + 104))(v53, *MEMORY[0x263F18DC8], v54);
  uint64_t v37 = *(int *)(v14 + 44);
  uint64_t v38 = (uint64_t)v51;
  uint64_t v39 = (uint64_t *)&v51[v37];
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F357E8);
  (*(void (**)(char *, char *, uint64_t))(v35 + 16))((char *)v39 + *(int *)(v40 + 28), v34, v36);
  uint64_t *v39 = KeyPath;
  sub_220D26548((uint64_t)v12, v38, &qword_267F357B8);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
  sub_220D25B68((uint64_t)v12, &qword_267F357B8);
  long long v56 = *(_OWORD *)(v2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F357F0);
  sub_220F32158();
  uint64_t v41 = v57;
  uint64_t v42 = swift_allocObject();
  long long v43 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v42 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v42 + 32) = v43;
  *(_OWORD *)(v42 + 48) = *(_OWORD *)(v2 + 32);
  *(void *)(v42 + 64) = *(void *)(v2 + 48);
  sub_220D26548(v38, (uint64_t)v19, &qword_267F357C0);
  *(void *)&v19[*(int *)(v17 + 60)] = v41;
  int v44 = (uint64_t (**)(uint64_t))&v19[*(int *)(v17 + 64)];
  *int v44 = sub_220F014D0;
  v44[1] = (uint64_t (*)(uint64_t))v42;
  sub_220F014D8(v2);
  sub_220D25B68(v38, &qword_267F357C0);
  uint64_t v45 = swift_allocObject();
  long long v46 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v45 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v45 + 32) = v46;
  *(_OWORD *)(v45 + 48) = *(_OWORD *)(v2 + 32);
  *(void *)(v45 + 64) = *(void *)(v2 + 48);
  uint64_t v47 = v55;
  sub_220D26548((uint64_t)v19, v55, &qword_267F357C8);
  uint64_t v48 = (uint64_t (**)())(v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F357F8) + 36));
  *uint64_t v48 = sub_220F0156C;
  v48[1] = (uint64_t (*)())v45;
  v48[2] = 0;
  v48[3] = 0;
  sub_220F014D8(v2);
  return sub_220D25B68((uint64_t)v19, &qword_267F357C8);
}

uint64_t sub_220EF2498@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v157 = a1;
  uint64_t v151 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35808);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v145 = (void *)((char *)v129 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35810) - 8;
  MEMORY[0x270FA5388](v159);
  uint64_t v146 = (uint64_t)v129 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v160 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35818) - 8;
  MEMORY[0x270FA5388](v160);
  uint64_t v147 = (uint64_t)v129 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35820) - 8;
  MEMORY[0x270FA5388](v148);
  uint64_t v150 = (uint64_t)v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v149 = (uint64_t)v129 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v158 = (uint64_t)v129 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v166 = (uint64_t)v129 - v12;
  uint64_t v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35828) - 8;
  MEMORY[0x270FA5388](v141);
  uint64_t v140 = (uint64_t)v129 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35830) - 8;
  MEMORY[0x270FA5388](v143);
  uint64_t v142 = (uint64_t)v129 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35838) - 8;
  MEMORY[0x270FA5388](v144);
  uint64_t v156 = (uint64_t)v129 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v163 = (uint64_t)v129 - v17;
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F320C0) - 8;
  MEMORY[0x270FA5388](v155);
  uint64_t v131 = (uint64_t)v129 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F320C8) - 8;
  MEMORY[0x270FA5388](v139);
  uint64_t v162 = (uint64_t)v129 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v167 = (uint64_t)v129 - v21;
  uint64_t v22 = sub_220F30E58() - 8;
  *(void *)&long long v154 = v22;
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)v129 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A30);
  uint64_t v26 = v25 - 8;
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)v129 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35840);
  uint64_t v30 = v29 - 8;
  MEMORY[0x270FA5388](v29);
  uint64_t v32 = (char *)v129 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35848) - 8;
  MEMORY[0x270FA5388](v138);
  uint64_t v164 = (uint64_t)v129 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v34);
  uint64_t v165 = (uint64_t)v129 - v35;
  uint64_t v36 = &v24[*(int *)(v22 + 28)];
  unsigned int v152 = *MEMORY[0x263F19860];
  uint64_t v37 = v152;
  uint64_t v153 = sub_220F312A8();
  uint64_t v38 = *(void *)(v153 - 8);
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 104);
  uint64_t v40 = v38 + 104;
  v39(v36, v37, v153);
  v129[1] = v40;
  uint64_t v130 = v39;
  __asm { FMOV            V0.2D, #17.0 }
  *(_OWORD *)uint64_t v24 = _Q0;
  sub_220F30B18();
  long long v46 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v24, (uint64_t)v28, MEMORY[0x263F19048]);
  uint64_t v47 = &v28[*(int *)(v26 + 44)];
  long long v48 = v176;
  *(_OWORD *)uint64_t v47 = v175;
  *((_OWORD *)v47 + 1) = v48;
  *((void *)v47 + 4) = v177;
  sub_220EFDEE0((uint64_t)v24, v46);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v28, (uint64_t)v32, &qword_267F30A30);
  uint64_t v49 = &v32[*(int *)(v30 + 44)];
  long long v50 = v179;
  *(_OWORD *)uint64_t v49 = v178;
  *((_OWORD *)v49 + 1) = v50;
  *((_OWORD *)v49 + 2) = v180;
  sub_220D25B68((uint64_t)v28, &qword_267F30A30);
  id v161 = self;
  uint64_t v51 = MEMORY[0x223C74C60](objc_msgSend(v161, sel_systemGray3Color));
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v53 = v164;
  sub_220D26548((uint64_t)v32, v164, &qword_267F35840);
  uint64_t v54 = (uint64_t *)(v53 + *(int *)(v138 + 44));
  *uint64_t v54 = KeyPath;
  v54[1] = v51;
  sub_220D25B68((uint64_t)v32, &qword_267F35840);
  sub_220D39114(v53, v165, &qword_267F35848);
  v39(&v24[*(int *)(v154 + 28)], v152, v153);
  __asm { FMOV            V0.2D, #11.0 }
  *(_OWORD *)uint64_t v24 = _Q0;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v56 = v131;
  sub_220EFDE78((uint64_t)v24, v131, v46);
  uint64_t v57 = (_OWORD *)(v56 + *(int *)(v155 + 44));
  long long v58 = v182;
  *uint64_t v57 = v181;
  v57[1] = v58;
  v57[2] = v183;
  sub_220EFDEE0((uint64_t)v24, v46);
  id v59 = v161;
  uint64_t v60 = MEMORY[0x223C74C60](objc_msgSend(v161, sel_quaternarySystemFillColor));
  uint64_t v61 = swift_getKeyPath();
  uint64_t v62 = v162;
  sub_220D26548(v56, v162, &qword_267F320C0);
  long long v63 = (uint64_t *)(v62 + *(int *)(v139 + 44));
  *long long v63 = v61;
  v63[1] = v60;
  sub_220D25B68(v56, &qword_267F320C0);
  sub_220D39114(v62, v167, &qword_267F320C8);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v139 = v184;
  LODWORD(v138) = v185;
  uint64_t v137 = v186;
  int v136 = v187;
  uint64_t v134 = v189;
  uint64_t v135 = v188;
  long long v64 = v59;
  uint64_t v133 = MEMORY[0x223C74C60](objc_msgSend(v59, sel_systemGray3Color));
  uint64_t v132 = swift_getKeyPath();
  v130(&v24[*(int *)(v154 + 28)], v152, v153);
  __asm { FMOV            V0.2D, #0.5 }
  *(_OWORD *)uint64_t v24 = _Q0;
  sub_220F32468();
  sub_220F30BA8();
  sub_220EFDE78((uint64_t)v24, v56, v46);
  char v66 = (_OWORD *)(v56 + *(int *)(v155 + 44));
  long long v67 = v191;
  *char v66 = v190;
  v66[1] = v67;
  v66[2] = v192;
  sub_220EFDEE0((uint64_t)v24, v46);
  uint64_t v68 = v140;
  sub_220D26548(v56, v140, &qword_267F320C0);
  uint64_t v69 = *(int *)(v141 + 44);
  long long v154 = xmmword_220F406A0;
  *(_OWORD *)(v68 + v69) = xmmword_220F406A0;
  sub_220D25B68(v56, &qword_267F320C0);
  __int16 v70 = v157;
  long long v71 = v157[1];
  long long v168 = *v157;
  long long v169 = v71;
  uint64_t v170 = *((void *)v157 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35800);
  sub_220F32158();
  double v72 = (v174 * 6.0 + 180.0) * 0.0174532925;
  sub_220F32548();
  uint64_t v74 = v73;
  uint64_t v76 = v75;
  uint64_t v77 = v142;
  sub_220D26548(v68, v142, &qword_267F35828);
  uint64_t v78 = v77 + *(int *)(v143 + 44);
  *(double *)uint64_t v78 = v72;
  *(void *)(v78 + 8) = v74;
  *(void *)(v78 + 16) = v76;
  sub_220D25B68(v68, &qword_267F35828);
  uint64_t v79 = MEMORY[0x223C74C60](objc_msgSend(v64, sel_systemGray3Color));
  uint64_t v80 = swift_getKeyPath();
  uint64_t v81 = v156;
  sub_220D26548(v77, v156, &qword_267F35830);
  uint64_t v82 = (uint64_t *)(v81 + *(int *)(v144 + 44));
  *uint64_t v82 = v80;
  v82[1] = v79;
  sub_220D25B68(v77, &qword_267F35830);
  sub_220D39114(v81, v163, &qword_267F35838);
  uint64_t v83 = sub_220F32458();
  char v84 = v145;
  *uint64_t v145 = v83;
  v84[1] = v85;
  uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35850);
  sub_220EF3440(0x4038000000000000, 0x4035000000000000, (uint64_t)v84 + *(int *)(v155 + 44));
  uint64_t v86 = v146;
  sub_220D26548((uint64_t)v84, v146, &qword_267F35808);
  *(_OWORD *)(v86 + *(int *)(v159 + 44)) = v154;
  sub_220D25B68((uint64_t)v84, &qword_267F35808);
  long long v87 = v70[1];
  long long v168 = *v70;
  long long v169 = v87;
  uint64_t v170 = *((void *)v70 + 4);
  sub_220F32158();
  double v88 = v172 * 6.0 + 180.0;
  long long v89 = v70[1];
  long long v168 = *v70;
  long long v169 = v89;
  uint64_t v170 = *((void *)v70 + 4);
  sub_220F32158();
  double v90 = (v88 + v173 * 0.1) * 0.0174532925;
  sub_220F32548();
  uint64_t v92 = v91;
  uint64_t v94 = v93;
  uint64_t v95 = v147;
  sub_220D26548(v86, v147, &qword_267F35810);
  uint64_t v96 = v95 + *(int *)(v160 + 44);
  *(double *)uint64_t v96 = v90;
  *(void *)(v96 + 8) = v92;
  *(void *)(v96 + 16) = v94;
  sub_220D25B68(v86, &qword_267F35810);
  uint64_t v97 = MEMORY[0x223C74C60](objc_msgSend(v161, sel_systemGray3Color));
  uint64_t v98 = swift_getKeyPath();
  uint64_t v99 = v158;
  sub_220D26548(v95, v158, &qword_267F35818);
  uint64_t v100 = v148;
  uint64_t v101 = (uint64_t *)(v99 + *(int *)(v148 + 44));
  *uint64_t v101 = v98;
  v101[1] = v97;
  sub_220D25B68(v95, &qword_267F35818);
  sub_220D39114(v99, v166, &qword_267F35820);
  uint64_t *v84 = sub_220F32458();
  v84[1] = v102;
  sub_220EF3440(0x4030000000000000, 0x402A000000000000, (uint64_t)v84 + *(int *)(v155 + 44));
  sub_220D26548((uint64_t)v84, v86, &qword_267F35808);
  *(_OWORD *)(v86 + *(int *)(v159 + 44)) = xmmword_220F406B0;
  sub_220D25B68((uint64_t)v84, &qword_267F35808);
  long long v103 = v157[1];
  long long v168 = *v157;
  long long v169 = v103;
  unsigned __int8 v104 = v157;
  uint64_t v170 = *((void *)v157 + 4);
  sub_220F32158();
  double v105 = v171 * 30.0 + 180.0;
  long long v106 = v104[1];
  long long v168 = *v104;
  long long v169 = v106;
  uint64_t v170 = *((void *)v104 + 4);
  sub_220F32158();
  double v107 = (v105 + v172 * 0.5) * 0.0174532925;
  sub_220F32548();
  uint64_t v109 = v108;
  uint64_t v111 = v110;
  sub_220D26548(v86, v95, &qword_267F35810);
  uint64_t v112 = v95 + *(int *)(v160 + 44);
  *(double *)uint64_t v112 = v107;
  *(void *)(v112 + 8) = v109;
  *(void *)(v112 + 16) = v111;
  sub_220D25B68(v86, &qword_267F35810);
  uint64_t v113 = MEMORY[0x223C74C60](objc_msgSend(v161, sel_systemGray3Color));
  uint64_t v114 = swift_getKeyPath();
  uint64_t v115 = v149;
  sub_220D26548(v95, v149, &qword_267F35818);
  uint64_t v116 = (uint64_t *)(v115 + *(int *)(v100 + 44));
  *uint64_t v116 = v114;
  v116[1] = v113;
  sub_220D25B68(v95, &qword_267F35818);
  sub_220D39114(v115, v99, &qword_267F35820);
  uint64_t v117 = v164;
  sub_220D26548(v165, v164, &qword_267F35848);
  uint64_t v118 = v162;
  sub_220D26548(v167, v162, &qword_267F320C8);
  uint64_t v119 = v156;
  sub_220D26548(v163, v156, &qword_267F35838);
  uint64_t v120 = v115;
  sub_220D26548(v166, v115, &qword_267F35820);
  uint64_t v121 = v150;
  sub_220D26548(v99, v150, &qword_267F35820);
  uint64_t v122 = v117;
  uint64_t v123 = v151;
  sub_220D26548(v122, v151, &qword_267F35848);
  long long v124 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35858);
  sub_220D26548(v118, v123 + v124[12], &qword_267F320C8);
  uint64_t v125 = v123 + v124[16];
  *(void *)uint64_t v125 = v139;
  *(unsigned char *)(v125 + 8) = v138;
  *(void *)(v125 + 16) = v137;
  *(unsigned char *)(v125 + 24) = v136;
  uint64_t v127 = v133;
  uint64_t v126 = v134;
  *(void *)(v125 + 32) = v135;
  *(void *)(v125 + 40) = v126;
  *(void *)(v125 + 48) = v132;
  *(void *)(v125 + 56) = v127;
  sub_220D26548(v119, v123 + v124[20], &qword_267F35838);
  sub_220D26548(v120, v123 + v124[24], &qword_267F35820);
  sub_220D26548(v121, v123 + v124[28], &qword_267F35820);
  swift_retain_n();
  swift_retain_n();
  sub_220D25B68(v158, &qword_267F35820);
  sub_220D25B68(v166, &qword_267F35820);
  sub_220D25B68(v163, &qword_267F35838);
  swift_release();
  swift_release();
  sub_220D25B68(v167, &qword_267F320C8);
  sub_220D25B68(v165, &qword_267F35848);
  sub_220D25B68(v121, &qword_267F35820);
  sub_220D25B68(v120, &qword_267F35820);
  sub_220D25B68(v119, &qword_267F35838);
  swift_release();
  swift_release();
  sub_220D25B68(v162, &qword_267F320C8);
  return sub_220D25B68(v164, &qword_267F35848);
}

uint64_t sub_220EF3440@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v44 = a3;
  uint64_t v41 = a1;
  uint64_t v3 = sub_220F30E58();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v38[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F320C0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v42 = &v38[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v38[-v11];
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = &v38[-v14];
  MEMORY[0x270FA5388](v16);
  uint64_t v40 = &v38[-v17];
  uint64_t v18 = &v6[*(int *)(v4 + 28)];
  unsigned int v39 = *MEMORY[0x263F19860];
  uint64_t v19 = v39;
  uint64_t v20 = sub_220F312A8();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104);
  v21(v18, v19, v20);
  __asm { FMOV            V0.2D, #0.25 }
  *(_OWORD *)uint64_t v6 = _Q0;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v27 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v6, (uint64_t)v15, MEMORY[0x263F19048]);
  uint64_t v28 = &v15[*(int *)(v8 + 44)];
  long long v29 = v46;
  *uint64_t v28 = v45;
  v28[1] = v29;
  void v28[2] = v47;
  sub_220EFDEE0((uint64_t)v6, v27);
  uint64_t v30 = v40;
  sub_220D39114((uint64_t)v15, (uint64_t)v40, &qword_267F320C0);
  v21(&v6[*(int *)(v4 + 28)], v39, v20);
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)uint64_t v6 = _Q0;
  sub_220F32468();
  sub_220F30BA8();
  sub_220EFDE78((uint64_t)v6, (uint64_t)v12, v27);
  uint64_t v32 = &v12[*(int *)(v8 + 44)];
  long long v33 = v49;
  *uint64_t v32 = v48;
  v32[1] = v33;
  v32[2] = v50;
  sub_220EFDEE0((uint64_t)v6, v27);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F320C0);
  sub_220D26548((uint64_t)v30, (uint64_t)v12, &qword_267F320C0);
  uint64_t v34 = v42;
  sub_220D26548((uint64_t)v15, (uint64_t)v42, &qword_267F320C0);
  uint64_t v35 = v44;
  sub_220D26548((uint64_t)v12, v44, &qword_267F320C0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35860);
  sub_220D26548((uint64_t)v34, v35 + *(int *)(v36 + 48), &qword_267F320C0);
  sub_220D25B68((uint64_t)v15, &qword_267F320C0);
  sub_220D25B68((uint64_t)v30, &qword_267F320C0);
  sub_220D25B68((uint64_t)v34, &qword_267F320C0);
  return sub_220D25B68((uint64_t)v12, &qword_267F320C0);
}

uint64_t sub_220EF3788(uint64_t a1)
{
  uint64_t v2 = sub_220F30D18();
  __n128 v3 = MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t, __n128))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_220F30FC8();
}

uint64_t sub_220EF3850(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v2 = sub_220F30718();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F306A8();
  uint64_t v6 = sub_220F305B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F305A8();
  uint64_t v10 = sub_220F306F8();
  uint64_t v11 = *(void *)(v10 - 8);
  __n128 v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t, __n128))(v11 + 104))(v14, *MEMORY[0x263F078D0], v10, v12);
  uint64_t v15 = sub_220F30708();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_220F32488();
  uint64_t v19 = v18;
  uint64_t v20 = v5;
  uint64_t v21 = v9;
  uint64_t v22 = v15;
  sub_220F30BF8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_220EF3ADC(int a1)
{
  LODWORD(v30) = a1;
  uint64_t v1 = sub_220F30718();
  uint64_t v36 = *(void *)(v1 - 8);
  uint64_t v37 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F306A8();
  uint64_t v4 = sub_220F305B8();
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F305A8();
  uint64_t v7 = sub_220F306F8();
  uint64_t v8 = *(void **)(v7 - 8);
  uint64_t v9 = v8[8];
  __n128 v10 = MEMORY[0x270FA5388](v7);
  unint64_t v11 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  __n128 v12 = (void (*)(char *, void, uint64_t, __n128))v8[13];
  v12((char *)&v29 - v11, *MEMORY[0x263F078D0], v7, v10);
  uint64_t v13 = v6;
  uint64_t v32 = v3;
  uint64_t v31 = sub_220F30708();
  uint64_t v14 = (uint64_t (*)(char *, uint64_t))v8[1];
  uint64_t v15 = v14((char *)&v29 - v11, v7);
  if (v30)
  {
    uint64_t v16 = sub_220F32488();
    MEMORY[0x270FA5388](v16);
    uint64_t v17 = (void (*)(char *, void, uint64_t, __n128))v32;
    *(&v29 - 4) = (void (*)(char *, void, uint64_t, __n128))v33;
    *(&v29 - 3) = v17;
    uint64_t v18 = (void (*)(char *, void, uint64_t, __n128))v31;
    *(&v29 - 2) = (void (*)(char *, void, uint64_t, __n128))v13;
    *(&v29 - 1) = v18;
    sub_220F30BF8();
    swift_release();
  }
  else
  {
    uint64_t v30 = &v29;
    __n128 v19 = MEMORY[0x270FA5388](v15);
    uint64_t v20 = *MEMORY[0x263F07888];
    long long v29 = v12;
    v12((char *)&v29 - v11, v20, v7, v19);
    uint64_t v21 = v32;
    uint64_t v22 = sub_220F30708();
    uint64_t v23 = v14((char *)&v29 - v11, v7);
    uint64_t v30 = &v29;
    __n128 v24 = MEMORY[0x270FA5388](v23);
    uint64_t v25 = (char *)&v29 - v11;
    uint64_t v17 = (void (*)(char *, void, uint64_t, __n128))v21;
    v29(v25, *MEMORY[0x263F078B8], v7, v24);
    uint64_t v26 = sub_220F30708();
    v14(v25, v7);
    long long v27 = v33[1];
    long long v42 = *v33;
    long long v43 = v27;
    uint64_t v44 = *((void *)v33 + 4);
    double v38 = (double)v22;
    double v39 = (double)v26;
    double v40 = (double)v31;
    double v41 = (double)v31;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F35800);
    sub_220F32168();
  }
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
  return (*(uint64_t (**)(void (*)(char *, void, uint64_t, __n128), uint64_t))(v36 + 8))(v17, v37);
}

uint64_t sub_220EF3EEC(long long *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = a4;
  v20[1] = a3;
  v20[2] = a2;
  uint64_t v5 = sub_220F306F8();
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = v6[8];
  __n128 v8 = MEMORY[0x270FA5388](v5);
  unint64_t v9 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = *MEMORY[0x263F07888];
  v20[0] = v6[13];
  ((void (*)(char *, uint64_t, uint64_t, __n128))v20[0])((char *)v20 - v9, v10, v5, v8);
  uint64_t v21 = sub_220F30708();
  unint64_t v11 = (uint64_t (*)(char *, uint64_t))v6[1];
  uint64_t v12 = v11((char *)v20 - v9, v5);
  __n128 v13 = MEMORY[0x270FA5388](v12);
  ((void (*)(char *, void, uint64_t, __n128))v20[0])((char *)v20 - v9, *MEMORY[0x263F078B8], v5, v13);
  uint64_t v14 = sub_220F30708();
  v11((char *)v20 - v9, v5);
  if (v22) {
    double v15 = (double)v22;
  }
  else {
    double v15 = 0.01;
  }
  double v16 = (double)v21;
  long long v17 = a1[1];
  long long v23 = *a1;
  long long v24 = v17;
  uint64_t v25 = *((void *)a1 + 4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35800);
  sub_220F32158();
  long long v18 = a1[1];
  long long v23 = *a1;
  long long v24 = v18;
  uint64_t v25 = *((void *)a1 + 4);
  double v26 = v16;
  double v27 = (double)v14;
  double v28 = v15;
  double v29 = v29 + 1.0;
  return sub_220F32168();
}

uint64_t sub_220EF410C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v62 = a1;
  uint64_t v1 = sub_220F30E58();
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (_OWORD *)((char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F320C0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  __n128 v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35828);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B08) - 8;
  MEMORY[0x270FA5388](v61);
  uint64_t v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v63 = (uint64_t)&v52 - v16;
  id v54 = self;
  uint64_t v60 = MEMORY[0x223C74C60](objc_msgSend(v54, sel_systemBackgroundColor));
  sub_220F30B18();
  double v17 = v67;
  unsigned int v57 = v68;
  unsigned int v66 = v69;
  uint64_t v18 = v70;
  uint64_t v56 = v71;
  uint64_t v19 = v72;
  double v20 = v67 * 0.5;
  uint64_t v21 = sub_220F32468();
  uint64_t v58 = v22;
  uint64_t v59 = v21;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v23 = v75;
  uint64_t v53 = v75;
  uint64_t v55 = v77;
  uint64_t v64 = v73;
  uint64_t v65 = v78;
  unsigned __int8 v85 = v74;
  unsigned __int8 v83 = v76;
  long long v24 = (char *)v4 + *(int *)(v2 + 28);
  uint64_t v25 = *MEMORY[0x263F19860];
  uint64_t v26 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 104))(v24, v25, v26);
  __asm { FMOV            V0.2D, #2.0 }
  *uint64_t v4 = _Q0;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v32 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v4, (uint64_t)v8, MEMORY[0x263F19048]);
  long long v33 = &v8[*(int *)(v6 + 44)];
  long long v34 = v80;
  *(_OWORD *)long long v33 = v79;
  *((_OWORD *)v33 + 1) = v34;
  *((_OWORD *)v33 + 2) = v81;
  sub_220EFDEE0((uint64_t)v4, v32);
  sub_220D26548((uint64_t)v8, (uint64_t)v12, &qword_267F320C0);
  *(_OWORD *)&v12[*(int *)(v10 + 44)] = xmmword_220F3C110;
  sub_220D25B68((uint64_t)v8, &qword_267F320C0);
  uint64_t v35 = MEMORY[0x223C74C60](objc_msgSend(v54, sel_systemGray3Color));
  uint64_t KeyPath = swift_getKeyPath();
  sub_220D26548((uint64_t)v12, (uint64_t)v14, &qword_267F35828);
  uint64_t v37 = (uint64_t *)&v14[*(int *)(v61 + 44)];
  *uint64_t v37 = KeyPath;
  v37[1] = v35;
  sub_220D25B68((uint64_t)v12, &qword_267F35828);
  uint64_t v38 = v63;
  sub_220D39114((uint64_t)v14, v63, &qword_267F35B08);
  LOBYTE(v6) = v85;
  LODWORD(v54) = v85;
  LOBYTE(v35) = v83;
  LODWORD(v61) = v83;
  sub_220D26548(v38, (uint64_t)v14, &qword_267F35B08);
  *(double *)&long long v88 = v20;
  *((double *)&v88 + 1) = v17;
  LODWORD(v25) = v57;
  *(void *)&long long v89 = __PAIR64__(v66, v57);
  *((void *)&v89 + 1) = v18;
  uint64_t v39 = v56;
  *(void *)&long long v90 = v56;
  *((void *)&v90 + 1) = v19;
  uint64_t v40 = v59;
  uint64_t v41 = v60;
  *(void *)&long long v91 = v60;
  WORD4(v91) = 256;
  *(_DWORD *)((char *)&v91 + 10) = v86;
  HIWORD(v91) = v87;
  uint64_t v42 = v58;
  *(void *)&long long v92 = v59;
  *((void *)&v92 + 1) = v58;
  *(void *)&long long v93 = v64;
  BYTE8(v93) = v6;
  *(_DWORD *)((char *)&v93 + 9) = *(_DWORD *)v84;
  HIDWORD(v93) = *(_DWORD *)&v84[3];
  *(void *)&long long v94 = v23;
  BYTE8(v94) = v35;
  *(_DWORD *)((char *)&v94 + 9) = *(_DWORD *)v82;
  HIDWORD(v94) = *(_DWORD *)&v82[3];
  uint64_t v43 = v55;
  *(void *)&long long v95 = v55;
  *((void *)&v95 + 1) = v65;
  long long v44 = v91;
  long long v45 = v62;
  void v62[2] = v90;
  v45[3] = v44;
  long long v46 = v89;
  *long long v45 = v88;
  v45[1] = v46;
  long long v47 = v92;
  long long v48 = v93;
  long long v49 = v95;
  v45[6] = v94;
  v45[7] = v49;
  v45[4] = v47;
  v45[5] = v48;
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B10);
  sub_220D26548((uint64_t)v14, (uint64_t)v45 + *(int *)(v50 + 48), &qword_267F35B08);
  sub_220E18414((uint64_t)&v88);
  sub_220D25B68(v63, &qword_267F35B08);
  sub_220D25B68((uint64_t)v14, &qword_267F35B08);
  *(double *)uint64_t v96 = v20;
  *(double *)&v96[1] = v17;
  int v97 = v25;
  unsigned int v98 = v66;
  uint64_t v99 = v18;
  uint64_t v100 = v39;
  uint64_t v101 = v19;
  uint64_t v102 = v41;
  __int16 v103 = 256;
  int v104 = v86;
  __int16 v105 = v87;
  uint64_t v106 = v40;
  uint64_t v107 = v42;
  uint64_t v108 = v64;
  char v109 = (char)v54;
  *(_DWORD *)&v110[3] = *(_DWORD *)&v84[3];
  *(_DWORD *)uint64_t v110 = *(_DWORD *)v84;
  uint64_t v111 = v53;
  char v112 = v61;
  *(_DWORD *)uint64_t v113 = *(_DWORD *)v82;
  *(_DWORD *)&v113[3] = *(_DWORD *)&v82[3];
  uint64_t v114 = v43;
  uint64_t v115 = v65;
  return sub_220E1844C((uint64_t)v96);
}

uint64_t sub_220EF46DC@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_220F32468();
  a1[1] = v2;
  uint64_t v3 = (uint64_t *)((char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35AF8) + 44));
  *uint64_t v3 = sub_220F32468();
  v3[1] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B00);
  return sub_220EF410C((uint64_t *)((char *)v3 + *(int *)(v5 + 44)));
}

uint64_t sub_220EF4738@<X0>(uint64_t a1@<X8>)
{
  return sub_220EF1FC0(a1);
}

uint64_t sub_220EF477C@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  int v115 = a1;
  uint64_t v114 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35868);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35870);
  MEMORY[0x270FA5388](v99);
  uint64_t v6 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35878);
  MEMORY[0x270FA5388](v102);
  uint64_t v104 = (uint64_t)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35880);
  MEMORY[0x270FA5388](v103);
  uint64_t v106 = (uint64_t)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35888);
  MEMORY[0x270FA5388](v113);
  __int16 v105 = (char *)&v97 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v107 = (uint64_t)&v97 - v11;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35890);
  MEMORY[0x270FA5388](v111);
  uint64_t v112 = (uint64_t)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_220F30E58();
  MEMORY[0x270FA5388](v108);
  uint64_t v110 = (char *)&v97 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35898);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F358A0);
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F358A8);
  MEMORY[0x270FA5388](v97);
  uint64_t v21 = (char *)&v97 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F358B0);
  MEMORY[0x270FA5388](v98);
  uint64_t v23 = (char *)&v97 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F358B8);
  MEMORY[0x270FA5388](v109);
  uint64_t v100 = (char *)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v25);
  uint64_t v101 = (uint64_t)&v97 - v26;
  double v27 = self;
  id v28 = objc_msgSend(v27, sel_currentDevice);
  id v29 = objc_msgSend(v28, sel_userInterfaceIdiom);

  uint64_t v30 = sub_220F31348();
  if (v29 != (id)1)
  {
    *(void *)uint64_t v4 = v30;
    *((void *)v4 + 1) = 0;
    v4[16] = 0;
    uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F358C0);
    sub_220EF7C08((uint64_t)&v4[*(int *)(v45 + 44)]);
    char v46 = sub_220F31828();
    sub_220F30A88();
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t v54 = v53;
    sub_220D26548((uint64_t)v4, (uint64_t)v6, &qword_267F35868);
    uint64_t v55 = &v6[*(int *)(v99 + 36)];
    char *v55 = v46;
    *((void *)v55 + 1) = v48;
    *((void *)v55 + 2) = v50;
    *((void *)v55 + 3) = v52;
    *((void *)v55 + 4) = v54;
    v55[40] = 0;
    sub_220D25B68((uint64_t)v4, &qword_267F35868);
    id v56 = objc_msgSend(v27, sel_currentDevice);
    id v57 = objc_msgSend(v56, sel_userInterfaceIdiom);

    char v58 = v115;
    if (v57 == (id)1)
    {
      if (v115)
      {
        if (qword_267F2E150 == -1) {
          goto LABEL_13;
        }
        goto LABEL_16;
      }
      if (qword_267F2E158 != -1) {
LABEL_16:
      }
        swift_once();
    }
LABEL_13:
    sub_220EE6678(v58 & 1);
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v80 = v104;
    sub_220D26548((uint64_t)v6, v104, &qword_267F35870);
    long long v81 = (_OWORD *)(v80 + *(int *)(v102 + 36));
    long long v82 = v117;
    *long long v81 = v116;
    v81[1] = v82;
    v81[2] = v118;
    sub_220D25B68((uint64_t)v6, &qword_267F35870);
    id v83 = objc_msgSend(self, sel_quaternarySystemFillColor);
    uint64_t v84 = MEMORY[0x223C74C60](v83);
    char v85 = sub_220F31818();
    uint64_t v86 = v106;
    sub_220D26548(v80, v106, &qword_267F35878);
    uint64_t v87 = v86 + *(int *)(v103 + 36);
    *(void *)uint64_t v87 = v84;
    *(unsigned char *)(v87 + 8) = v85;
    sub_220D25B68(v80, &qword_267F35878);
    long long v88 = v110;
    long long v89 = &v110[*(int *)(v108 + 20)];
    uint64_t v90 = *MEMORY[0x263F19860];
    uint64_t v91 = sub_220F312A8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v91 - 8) + 104))(v89, v90, v91);
    __asm { FMOV            V0.2D, #13.0 }
    *long long v88 = _Q0;
    uint64_t v93 = (uint64_t)v105;
    uint64_t v94 = (uint64_t)&v105[*(int *)(v113 + 36)];
    long long v95 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_220EFDE78((uint64_t)v88, v94, MEMORY[0x263F19048]);
    *(_WORD *)(v94 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
    sub_220D26548(v86, v93, &qword_267F35880);
    sub_220EFDEE0((uint64_t)v88, v95);
    sub_220D25B68(v86, &qword_267F35880);
    uint64_t v77 = &qword_267F35888;
    uint64_t v79 = v107;
    sub_220D39114(v93, v107, &qword_267F35888);
    sub_220D26548(v79, v112, &qword_267F35888);
    swift_storeEnumTagMultiPayload();
    sub_220F015B4();
    sub_220F0183C();
    goto LABEL_14;
  }
  *(void *)uint64_t v16 = v30;
  *((void *)v16 + 1) = 0;
  v16[16] = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35918);
  char v32 = v115 & 1;
  sub_220EF5340(v115 & 1, (uint64_t)&v16[*(int *)(v31 + 44)]);
  char v33 = sub_220F31808();
  sub_220F30A88();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_220D26548((uint64_t)v16, (uint64_t)v19, &qword_267F35898);
  uint64_t v42 = &v19[*(int *)(v17 + 36)];
  *uint64_t v42 = v33;
  *((void *)v42 + 1) = v35;
  *((void *)v42 + 2) = v37;
  *((void *)v42 + 3) = v39;
  *((void *)v42 + 4) = v41;
  v42[40] = 0;
  sub_220D25B68((uint64_t)v16, &qword_267F35898);
  id v43 = objc_msgSend(v27, sel_currentDevice);
  id v44 = objc_msgSend(v43, sel_userInterfaceIdiom);

  if (v44 == (id)1)
  {
    if (v115)
    {
      if (qword_267F2E150 == -1) {
        goto LABEL_11;
      }
      goto LABEL_15;
    }
    if (qword_267F2E158 != -1) {
LABEL_15:
    }
      swift_once();
  }
LABEL_11:
  sub_220EE6678(v32);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v19, (uint64_t)v21, &qword_267F358A0);
  uint64_t v59 = &v21[*(int *)(v97 + 36)];
  long long v60 = v117;
  *(_OWORD *)uint64_t v59 = v116;
  *((_OWORD *)v59 + 1) = v60;
  *((_OWORD *)v59 + 2) = v118;
  sub_220D25B68((uint64_t)v19, &qword_267F358A0);
  id v61 = objc_msgSend(self, sel_quaternarySystemFillColor);
  uint64_t v62 = MEMORY[0x223C74C60](v61);
  char v63 = sub_220F31818();
  sub_220D26548((uint64_t)v21, (uint64_t)v23, &qword_267F358A8);
  uint64_t v64 = &v23[*(int *)(v98 + 36)];
  *(void *)uint64_t v64 = v62;
  v64[8] = v63;
  sub_220D25B68((uint64_t)v21, &qword_267F358A8);
  uint64_t v65 = v110;
  unsigned int v66 = &v110[*(int *)(v108 + 20)];
  uint64_t v67 = *MEMORY[0x263F19860];
  uint64_t v68 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v68 - 8) + 104))(v66, v67, v68);
  __asm { FMOV            V0.2D, #13.0 }
  _OWORD *v65 = _Q0;
  uint64_t v74 = (uint64_t)v100;
  uint64_t v75 = (uint64_t)&v100[*(int *)(v109 + 36)];
  unsigned __int8 v76 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v65, v75, MEMORY[0x263F19048]);
  *(_WORD *)(v75 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
  sub_220D26548((uint64_t)v23, v74, &qword_267F358B0);
  sub_220EFDEE0((uint64_t)v65, v76);
  sub_220D25B68((uint64_t)v23, &qword_267F358B0);
  uint64_t v77 = &qword_267F358B8;
  uint64_t v78 = v74;
  uint64_t v79 = v101;
  sub_220D39114(v78, v101, &qword_267F358B8);
  sub_220D26548(v79, v112, &qword_267F358B8);
  swift_storeEnumTagMultiPayload();
  sub_220F015B4();
  sub_220F0183C();
LABEL_14:
  sub_220F31488();
  return sub_220D25B68(v79, v77);
}

uint64_t sub_220EF5340@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  LODWORD(v179) = a1;
  uint64_t v187 = a2;
  uint64_t v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35920);
  MEMORY[0x270FA5388](v186);
  uint64_t v3 = (char *)&v145 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35928);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v170 = (uint64_t *)((char *)&v145 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35930);
  MEMORY[0x270FA5388](v169);
  uint64_t v174 = (uint64_t)&v145 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v180 = (uint64_t)&v145 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35938);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v173 = (uint64_t)&v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v145 - v12;
  uint64_t v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35940);
  MEMORY[0x270FA5388](v183);
  uint64_t v185 = (uint64_t)&v145 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35948);
  MEMORY[0x270FA5388](v184);
  uint64_t v16 = (char *)&v145 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35950);
  MEMORY[0x270FA5388](v17 - 8);
  double v172 = (uint64_t *)((char *)&v145 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35958);
  MEMORY[0x270FA5388](v171);
  uint64_t v176 = (uint64_t)&v145 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v177 = (uint64_t)&v145 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35960);
  MEMORY[0x270FA5388](v22 - 8);
  uint64_t v175 = (uint64_t)&v145 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v145 - v25;
  uint64_t v27 = sub_220F30E58();
  MEMORY[0x270FA5388](v27);
  id v29 = (_OWORD *)((char *)&v145 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  MEMORY[0x270FA5388](v30);
  char v32 = (char *)&v145 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8);
  MEMORY[0x270FA5388](v168);
  uint64_t v34 = (char *)&v145 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v35);
  uint64_t v178 = (uint64_t)&v145 - v36;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35968);
  MEMORY[0x270FA5388](v37 - 8);
  uint64_t v182 = (uint64_t)&v145 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v39);
  long long v181 = (char *)&v145 - v40;
  sub_220F32468();
  if (v179)
  {
    sub_220F30BA8();
    uint64_t v167 = v188;
    int v166 = v189;
    uint64_t v165 = v190;
    int v164 = v191;
    uint64_t v162 = v193;
    uint64_t v163 = v192;
    uint64_t v41 = (char *)v29 + *(int *)(v27 + 20);
    uint64_t v42 = *MEMORY[0x263F19860];
    uint64_t v43 = sub_220F312A8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v41, v42, v43);
    __asm { FMOV            V0.2D, #4.0 }
    *id v29 = _Q0;
    id v49 = objc_msgSend(self, sel_systemGray3Color);
    uint64_t v50 = MEMORY[0x223C74C60](v49);
    uint64_t v51 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_220EFDE78((uint64_t)v29, (uint64_t)v32, MEMORY[0x263F19048]);
    *(void *)&v32[*(int *)(v30 + 52)] = v50;
    *(_WORD *)&v32[*(int *)(v30 + 56)] = 256;
    sub_220EFDEE0((uint64_t)v29, v51);
    sub_220F32468();
    sub_220F30BA8();
    sub_220D26548((uint64_t)v32, (uint64_t)v34, &qword_267F2ED30);
    uint64_t v52 = &v34[*(int *)(v168 + 36)];
    long long v53 = v195;
    *(_OWORD *)uint64_t v52 = v194;
    *((_OWORD *)v52 + 1) = v53;
    *((_OWORD *)v52 + 2) = v196;
    sub_220D25B68((uint64_t)v32, &qword_267F2ED30);
    uint64_t v54 = v178;
    sub_220D39114((uint64_t)v34, v178, &qword_267F30AE8);
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v168 = v197;
    LODWORD(v161) = v198;
    uint64_t v160 = v199;
    LODWORD(v159) = v200;
    uint64_t v157 = v202;
    uint64_t v158 = v201;
    *(void *)uint64_t v26 = sub_220F31228();
    *((void *)v26 + 1) = 0x4014000000000000;
    v26[16] = 0;
    uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359A0);
    sub_220EF63AC((uint64_t)&v26[*(int *)(v55 + 44)]);
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v155 = v203;
    int v154 = v204;
    uint64_t v153 = v205;
    int v152 = v206;
    uint64_t v150 = v208;
    uint64_t v151 = v207;
    int v56 = sub_220EF6AFC();
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v179 = 0;
    uint64_t v180 = 0;
    uint64_t v173 = 0;
    uint64_t v174 = 0;
    uint64_t v169 = 0;
    uint64_t v170 = 0;
    uint64_t v59 = 0;
    uint64_t v60 = 0;
    id v61 = (uint64_t *)v26;
    uint64_t v62 = (uint64_t)v34;
    LODWORD(v156) = v56;
    if (v56)
    {
      uint64_t v57 = sub_220F31228();
      sub_220F32468();
      uint64_t v58 = 1;
      sub_220F30BA8();
      uint64_t v179 = v210;
      uint64_t v180 = v209;
      uint64_t v173 = v212;
      uint64_t v174 = v211;
      uint64_t v169 = v214;
      uint64_t v170 = v213;
      uint64_t v59 = sub_220F31228();
      uint64_t v60 = 0x4024000000000000;
    }
    uint64_t v146 = v58;
    uint64_t v147 = v57;
    uint64_t v148 = v60;
    uint64_t v149 = v59;
    uint64_t v63 = sub_220F32468();
    uint64_t v64 = v172;
    *double v172 = v63;
    v64[1] = v65;
    uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359A8);
    sub_220EF6FDC((uint64_t)v64 + *(int *)(v66 + 44));
    char v67 = sub_220F31818();
    sub_220F30A88();
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    uint64_t v73 = v72;
    uint64_t v75 = v74;
    uint64_t v76 = v176;
    sub_220D26548((uint64_t)v64, v176, &qword_267F35950);
    uint64_t v77 = v76 + *(int *)(v171 + 36);
    *(unsigned char *)uint64_t v77 = v67;
    *(void *)(v77 + 8) = v69;
    *(void *)(v77 + 16) = v71;
    *(void *)(v77 + 24) = v73;
    *(void *)(v77 + 32) = v75;
    *(unsigned char *)(v77 + 40) = 0;
    sub_220D25B68((uint64_t)v64, &qword_267F35950);
    uint64_t v78 = v177;
    sub_220D39114(v76, v177, &qword_267F35958);
    sub_220D26548(v54, v62, &qword_267F30AE8);
    uint64_t v79 = v175;
    sub_220D26548((uint64_t)v61, v175, &qword_267F35960);
    sub_220D26548(v78, v76, &qword_267F35958);
    *(void *)uint64_t v16 = 0;
    v16[8] = 1;
    *((void *)v16 + 2) = v167;
    v16[24] = v166;
    *((void *)v16 + 4) = v165;
    v16[40] = v164;
    uint64_t v80 = v162;
    *((void *)v16 + 6) = v163;
    *((void *)v16 + 7) = v80;
    uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359B0);
    double v172 = v61;
    long long v82 = (int *)v81;
    sub_220D26548(v62, (uint64_t)&v16[*(int *)(v81 + 48)], &qword_267F30AE8);
    id v83 = &v16[v82[16]];
    *(void *)id v83 = 0;
    v83[8] = 1;
    *((void *)v83 + 2) = v168;
    v83[24] = v161;
    *((void *)v83 + 4) = v160;
    v83[40] = v159;
    uint64_t v84 = v157;
    *((void *)v83 + 6) = v158;
    *((void *)v83 + 7) = v84;
    sub_220D26548(v79, (uint64_t)&v16[v82[20]], &qword_267F35960);
    char v85 = &v16[v82[24]];
    *(void *)char v85 = 0;
    v85[8] = 1;
    *((void *)v85 + 2) = v155;
    v85[24] = v154;
    *((void *)v85 + 4) = v153;
    v85[40] = v152;
    uint64_t v86 = v150;
    *((void *)v85 + 6) = v151;
    *((void *)v85 + 7) = v86;
    uint64_t v87 = &v16[v82[28]];
    uint64_t v88 = v148;
    *(void *)uint64_t v87 = v147;
    *((void *)v87 + 1) = v88;
    *((void *)v87 + 2) = 0;
    *((void *)v87 + 3) = 0;
    uint64_t v89 = v180;
    *((void *)v87 + 4) = v146;
    *((void *)v87 + 5) = v89;
    uint64_t v90 = v174;
    *((void *)v87 + 6) = v179;
    *((void *)v87 + 7) = v90;
    uint64_t v91 = v170;
    *((void *)v87 + 8) = v173;
    *((void *)v87 + 9) = v91;
    uint64_t v92 = v149;
    *((void *)v87 + 10) = v169;
    *((void *)v87 + 11) = v92;
    *((void *)v87 + 12) = v88;
    v87[104] = 0;
    v87[105] = (v156 & 1) == 0;
    uint64_t v93 = &v16[v82[32]];
    *(void *)uint64_t v93 = 0;
    v93[8] = 1;
    sub_220D26548(v76, (uint64_t)&v16[v82[36]], &qword_267F35958);
    sub_220D25B68(v76, &qword_267F35958);
    sub_220D25B68(v79, &qword_267F35960);
    sub_220D25B68(v62, &qword_267F30AE8);
    sub_220D26548((uint64_t)v16, v185, &qword_267F35948);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F35988, &qword_267F35948);
    sub_220D25FB0(&qword_267F35990, &qword_267F35920);
    uint64_t v94 = (uint64_t)v181;
    sub_220F31488();
    sub_220D25B68((uint64_t)v16, &qword_267F35948);
    sub_220D25B68(v78, &qword_267F35958);
    sub_220D25B68((uint64_t)v172, &qword_267F35960);
    uint64_t v95 = v178;
    uint64_t v96 = &qword_267F30AE8;
  }
  else
  {
    sub_220F30BA8();
    uint64_t v178 = v197;
    LODWORD(v177) = v198;
    uint64_t v176 = v199;
    LODWORD(v175) = v200;
    uint64_t v171 = v202;
    double v172 = v201;
    *(void *)uint64_t v13 = sub_220F31228();
    *((void *)v13 + 1) = 0x4014000000000000;
    v13[16] = 0;
    uint64_t v97 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35970) + 44);
    uint64_t v179 = (uint64_t)v13;
    sub_220EF7338((uint64_t)&v13[v97]);
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v167 = v203;
    int v166 = v204;
    uint64_t v165 = v205;
    int v164 = v206;
    uint64_t v162 = v208;
    uint64_t v163 = v207;
    int v98 = sub_220EF6AFC();
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    uint64_t v103 = 0;
    uint64_t v104 = 0;
    __int16 v105 = 0;
    uint64_t v106 = 0;
    uint64_t v107 = 0;
    uint64_t v108 = 0;
    LODWORD(v168) = v98;
    if (v98)
    {
      uint64_t v99 = sub_220F31228();
      sub_220F32468();
      uint64_t v100 = 1;
      sub_220F30BA8();
      uint64_t v101 = v209;
      uint64_t v102 = v210;
      uint64_t v103 = v211;
      uint64_t v104 = v212;
      __int16 v105 = v213;
      uint64_t v106 = v214;
      uint64_t v107 = sub_220F31228();
      uint64_t v108 = 0x4030000000000000;
    }
    uint64_t v156 = v104;
    uint64_t v157 = v106;
    uint64_t v158 = (void *)v103;
    uint64_t v159 = v99;
    uint64_t v160 = v108;
    uint64_t v161 = v107;
    uint64_t v109 = sub_220F32468();
    uint64_t v110 = (uint64_t)v170;
    *uint64_t v170 = v109;
    *(void *)(v110 + 8) = v111;
    uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35978);
    sub_220EF78AC(v110 + *(int *)(v112 + 44));
    char v113 = sub_220F31818();
    sub_220F30A88();
    uint64_t v115 = v114;
    uint64_t v117 = v116;
    uint64_t v119 = v118;
    uint64_t v121 = v120;
    uint64_t v122 = v174;
    sub_220D26548(v110, v174, &qword_267F35928);
    uint64_t v123 = v122 + *(int *)(v169 + 36);
    *(unsigned char *)uint64_t v123 = v113;
    *(void *)(v123 + 8) = v115;
    *(void *)(v123 + 16) = v117;
    *(void *)(v123 + 24) = v119;
    *(void *)(v123 + 32) = v121;
    *(unsigned char *)(v123 + 40) = 0;
    sub_220D25B68(v110, &qword_267F35928);
    uint64_t v124 = v180;
    sub_220D39114(v122, v180, &qword_267F35930);
    uint64_t v125 = v173;
    sub_220D26548(v179, v173, &qword_267F35938);
    sub_220D26548(v124, v122, &qword_267F35930);
    *(void *)uint64_t v3 = 0;
    v3[8] = 1;
    *((void *)v3 + 2) = v178;
    v3[24] = v177;
    *((void *)v3 + 4) = v176;
    v3[40] = v175;
    uint64_t v126 = v171;
    *((void *)v3 + 6) = v172;
    *((void *)v3 + 7) = v126;
    uint64_t v127 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35980);
    sub_220D26548(v125, (uint64_t)&v3[v127[12]], &qword_267F35938);
    uint64_t v128 = &v3[v127[16]];
    *(void *)uint64_t v128 = 0;
    v128[8] = 1;
    *((void *)v128 + 2) = v167;
    v128[24] = v166;
    *((void *)v128 + 4) = v165;
    v128[40] = v164;
    uint64_t v129 = v162;
    *((void *)v128 + 6) = v163;
    *((void *)v128 + 7) = v129;
    uint64_t v130 = &v3[v127[20]];
    uint64_t v131 = v158;
    uint64_t v132 = v160;
    *(void *)uint64_t v130 = v159;
    *((void *)v130 + 1) = v132;
    *((void *)v130 + 2) = 0;
    *((void *)v130 + 3) = 0;
    *((void *)v130 + 4) = v100;
    *((void *)v130 + 5) = v101;
    *((void *)v130 + 6) = v102;
    *((void *)v130 + 7) = v131;
    *((void *)v130 + 8) = v156;
    *((void *)v130 + 9) = v105;
    uint64_t v133 = v161;
    *((void *)v130 + 10) = v157;
    *((void *)v130 + 11) = v133;
    *((void *)v130 + 12) = v132;
    v130[104] = 0;
    v130[105] = (v168 & 1) == 0;
    uint64_t v134 = &v3[v127[24]];
    *(void *)uint64_t v134 = 0;
    v134[8] = 1;
    sub_220D26548(v122, (uint64_t)&v3[v127[28]], &qword_267F35930);
    sub_220D25B68(v122, &qword_267F35930);
    sub_220D25B68(v125, &qword_267F35938);
    sub_220D26548((uint64_t)v3, v185, &qword_267F35920);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F35988, &qword_267F35948);
    sub_220D25FB0(&qword_267F35990, &qword_267F35920);
    uint64_t v94 = (uint64_t)v181;
    sub_220F31488();
    sub_220D25B68((uint64_t)v3, &qword_267F35920);
    sub_220D25B68(v180, &qword_267F35930);
    uint64_t v95 = v179;
    uint64_t v96 = &qword_267F35938;
  }
  sub_220D25B68(v95, v96);
  sub_220EF6AFC();
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v186 = v215;
  char v135 = v216;
  uint64_t v136 = v217;
  char v137 = v218;
  uint64_t v138 = v219;
  uint64_t v139 = v220;
  uint64_t v140 = v182;
  sub_220D26548(v94, v182, &qword_267F35968);
  uint64_t v141 = v94;
  uint64_t v142 = v187;
  sub_220D26548(v140, v187, &qword_267F35968);
  uint64_t v143 = v142 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35998) + 48);
  *(void *)uint64_t v143 = 0;
  *(unsigned char *)(v143 + 8) = 1;
  *(void *)(v143 + 16) = v186;
  *(unsigned char *)(v143 + 24) = v135;
  *(void *)(v143 + 32) = v136;
  *(unsigned char *)(v143 + 40) = v137;
  *(void *)(v143 + 48) = v138;
  *(void *)(v143 + 56) = v139;
  sub_220D25B68(v141, &qword_267F35968);
  return sub_220D25B68(v140, &qword_267F35968);
}

uint64_t sub_220EF63AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = a1;
  uint64_t v1 = sub_220F30E58();
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (_OWORD *)((char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v39 - v14;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359C8);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v21 = (char *)&v39 - v20;
  *(void *)uint64_t v21 = sub_220F31348();
  *((void *)v21 + 1) = 0x4014000000000000;
  v21[16] = 0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359D0);
  sub_220EF6750(0x4032000000000000, (uint64_t)&v21[*(int *)(v22 + 44)]);
  uint64_t v23 = (char *)v4 + *(int *)(v2 + 28);
  uint64_t v24 = *MEMORY[0x263F19860];
  uint64_t v25 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(v23, v24, v25);
  __asm { FMOV            V0.2D, #3.0 }
  *uint64_t v4 = _Q0;
  id v31 = objc_msgSend(self, sel_systemGray3Color);
  uint64_t v32 = MEMORY[0x223C74C60](v31);
  uint64_t v33 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v4, (uint64_t)v8, MEMORY[0x263F19048]);
  *(void *)&v8[*(int *)(v6 + 60)] = v32;
  *(_WORD *)&v8[*(int *)(v6 + 64)] = 256;
  sub_220EFDEE0((uint64_t)v4, v33);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v8, (uint64_t)v12, &qword_267F2ED30);
  uint64_t v34 = &v12[*(int *)(v10 + 44)];
  long long v35 = v42;
  *(_OWORD *)uint64_t v34 = v41;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v43;
  sub_220D25B68((uint64_t)v8, &qword_267F2ED30);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F30AE8);
  sub_220D26548((uint64_t)v21, (uint64_t)v18, &qword_267F359C8);
  sub_220D26548((uint64_t)v15, (uint64_t)v12, &qword_267F30AE8);
  uint64_t v36 = v40;
  sub_220D26548((uint64_t)v18, v40, &qword_267F359C8);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359D8);
  sub_220D26548((uint64_t)v12, v36 + *(int *)(v37 + 48), &qword_267F30AE8);
  sub_220D25B68((uint64_t)v15, &qword_267F30AE8);
  sub_220D25B68((uint64_t)v21, &qword_267F359C8);
  sub_220D25B68((uint64_t)v12, &qword_267F30AE8);
  return sub_220D25B68((uint64_t)v18, &qword_267F359C8);
}

uint64_t sub_220EF6750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v2 = sub_220F30E58();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (__n128 *)((char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v40 - v15;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359E0);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v40 - v21;
  *(void *)uint64_t v22 = sub_220F31228();
  *((void *)v22 + 1) = 0x4014000000000000;
  v22[16] = 0;
  uint64_t v23 = (uint64_t)&v22[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F359E8) + 44)];
  __asm { FMOV            V0.2D, #3.0 }
  __n128 v40 = _Q0;
  sub_220EF86B4(0x4032000000000000, v23, _Q0);
  id v29 = (char *)v5 + *(int *)(v3 + 28);
  uint64_t v30 = *MEMORY[0x263F19860];
  uint64_t v31 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v29, v30, v31);
  __n128 *v5 = v40;
  id v32 = objc_msgSend(self, sel_systemGray3Color);
  uint64_t v33 = MEMORY[0x223C74C60](v32);
  uint64_t v34 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v5, (uint64_t)v9, MEMORY[0x263F19048]);
  *(void *)&v9[*(int *)(v7 + 60)] = v33;
  *(_WORD *)&v9[*(int *)(v7 + 64)] = 256;
  sub_220EFDEE0((uint64_t)v5, v34);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v9, (uint64_t)v13, &qword_267F2ED30);
  long long v35 = &v13[*(int *)(v11 + 44)];
  long long v36 = v44;
  *(_OWORD *)long long v35 = v43;
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v45;
  sub_220D25B68((uint64_t)v9, &qword_267F2ED30);
  sub_220D39114((uint64_t)v13, (uint64_t)v16, &qword_267F30AE8);
  sub_220D26548((uint64_t)v22, (uint64_t)v19, &qword_267F359E0);
  sub_220D26548((uint64_t)v16, (uint64_t)v13, &qword_267F30AE8);
  uint64_t v37 = v42;
  sub_220D26548((uint64_t)v19, v42, &qword_267F359E0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359F0);
  sub_220D26548((uint64_t)v13, v37 + *(int *)(v38 + 48), &qword_267F30AE8);
  sub_220D25B68((uint64_t)v16, &qword_267F30AE8);
  sub_220D25B68((uint64_t)v22, &qword_267F359E0);
  sub_220D25B68((uint64_t)v13, &qword_267F30AE8);
  return sub_220D25B68((uint64_t)v19, &qword_267F359E0);
}

uint64_t sub_220EF6AFC()
{
  id v0 = objc_msgSend(self, sel_sharedApplication);
  id v1 = objc_msgSend(v0, sel_connectedScenes);

  unint64_t v2 = sub_220D25F48(0, &qword_267F31958);
  sub_220ED130C();
  uint64_t v3 = sub_220F32948();

  if ((v3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = (unint64_t *)MEMORY[0x263F8EE88];
    unint64_t v35 = MEMORY[0x263F8EE88];
    sub_220F32C28();
    uint64_t v5 = sub_220F32CB8();
    if (v5)
    {
      do
      {
        uint64_t v33 = v5;
        swift_dynamicCast();
        if (objc_msgSend(v34, sel_activationState, v33))
        {
        }
        else
        {
          unint64_t v6 = v35;
          unint64_t v7 = *(void *)(v35 + 16);
          if (*(void *)(v35 + 24) <= v7)
          {
            sub_220D18EC4(v7 + 1);
            unint64_t v6 = v35;
          }
          uint64_t v8 = sub_220F32AF8();
          unint64_t v9 = v6 + 56;
          uint64_t v10 = -1 << *(unsigned char *)(v6 + 32);
          unint64_t v11 = v8 & ~v10;
          unint64_t v12 = v11 >> 6;
          if (((-1 << v11) & ~*(void *)(v6 + 56 + 8 * (v11 >> 6))) != 0)
          {
            unint64_t v13 = __clz(__rbit64((-1 << v11) & ~*(void *)(v6 + 56 + 8 * (v11 >> 6)))) | v11 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            char v14 = 0;
            unint64_t v15 = (unint64_t)(63 - v10) >> 6;
            do
            {
              if (++v12 == v15 && (v14 & 1) != 0)
              {
                __break(1u);
                goto LABEL_41;
              }
              BOOL v16 = v12 == v15;
              if (v12 == v15) {
                unint64_t v12 = 0;
              }
              v14 |= v16;
              uint64_t v17 = *(void *)(v9 + 8 * v12);
            }
            while (v17 == -1);
            unint64_t v13 = __clz(__rbit64(~v17)) + (v12 << 6);
          }
          *(void *)(v9 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
          *(void *)(*(void *)(v6 + 48) + 8 * v13) = v34;
          ++*(void *)(v6 + 16);
        }
        uint64_t v5 = sub_220F32CB8();
      }
      while (v5);
      uint64_t v4 = (unint64_t *)v35;
    }
    swift_release();
  }
  else
  {
    uint64_t v4 = sub_220EFDC00(v3);
  }
  sub_220EC888C((uint64_t)v4);
  unint64_t v2 = v18;
  swift_release();
  if (!(v2 >> 62))
  {
    if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_25;
    }
LABEL_42:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_41:
  swift_bridgeObjectRetain();
  uint64_t v27 = sub_220F32E48();
  swift_bridgeObjectRelease();
  if (!v27) {
    goto LABEL_42;
  }
LABEL_25:
  if ((v2 & 0xC000000000000001) != 0)
  {
    id v19 = (id)MEMORY[0x223C75B40](0, v2);
  }
  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    id v19 = *(id *)(v2 + 32);
  }
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  id v21 = objc_msgSend(v20, sel_windows);

  sub_220D25F48(0, &qword_267F34B88);
  unint64_t v2 = sub_220F32858();

  unint64_t v35 = MEMORY[0x263F8EE78];
  if (!(v2 >> 62))
  {
    uint64_t v22 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v22) {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_220F32E48();
  swift_bridgeObjectRelease();
  if (v22)
  {
LABEL_30:
    if (v22 < 1)
    {
      __break(1u);
      goto LABEL_57;
    }
    for (uint64_t i = 0; i != v22; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v24 = (id)MEMORY[0x223C75B40](i, v2);
      }
      else {
        id v24 = *(id *)(v2 + 8 * i + 32);
      }
      uint64_t v25 = v24;
      if (objc_msgSend(v24, sel_isKeyWindow))
      {
        sub_220F32DB8();
        sub_220F32DE8();
        sub_220F32DF8();
        sub_220F32DC8();
      }
      else
      {
      }
    }
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v2 = v35;
    if ((v35 & 0x8000000000000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v2 = MEMORY[0x263F8EE78];
  if ((MEMORY[0x263F8EE78] & 0x8000000000000000) != 0) {
    goto LABEL_53;
  }
LABEL_47:
  if ((v2 & 0x4000000000000000) != 0)
  {
LABEL_53:
    swift_bridgeObjectRetain();
    uint64_t v32 = sub_220F32E48();
    uint64_t result = swift_release();
    if (!v32) {
      goto LABEL_54;
    }
    goto LABEL_49;
  }
  if (!*(void *)(v2 + 16))
  {
LABEL_54:
    swift_release();
    return 0;
  }
LABEL_49:
  if ((v2 & 0xC000000000000001) != 0)
  {
LABEL_57:
    id v28 = (id)MEMORY[0x223C75B40](0, v2);
    goto LABEL_52;
  }
  if (*(void *)(v2 + 16))
  {
    id v28 = *(id *)(v2 + 32);
LABEL_52:
    id v29 = v28;
    swift_release();
    objc_msgSend(v29, sel_safeAreaInsets);
    double v31 = v30;

    return v31 > 0.0;
  }
  __break(1u);
  return result;
}

uint64_t sub_220EF6FDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_220F30E58();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (_OWORD *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v15 = (char *)&v38 - v14;
  uint64_t v38 = sub_220F31228();
  BOOL v16 = (char *)v5 + *(int *)(v3 + 28);
  uint64_t v17 = *MEMORY[0x263F19860];
  uint64_t v18 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  __asm { FMOV            V0.2D, #4.0 }
  _OWORD *v5 = _Q0;
  id v24 = objc_msgSend(self, sel_systemGray3Color);
  uint64_t v25 = MEMORY[0x223C74C60](v24);
  sub_220F30B18();
  uint64_t v26 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v5, (uint64_t)v8, MEMORY[0x263F19048]);
  uint64_t v27 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A30) + 36)];
  long long v28 = v40;
  *(_OWORD *)uint64_t v27 = v39;
  *((_OWORD *)v27 + 1) = v28;
  *((void *)v27 + 4) = v41;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A38);
  *(void *)&v8[*(int *)(v29 + 52)] = v25;
  *(_WORD *)&v8[*(int *)(v29 + 56)] = 256;
  uint64_t v30 = sub_220F32468();
  uint64_t v32 = v31;
  uint64_t v33 = (uint64_t *)&v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A40) + 36)];
  *uint64_t v33 = v30;
  v33[1] = v32;
  sub_220EFDEE0((uint64_t)v5, v26);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v8, (uint64_t)v12, &qword_267F30A10);
  id v34 = &v12[*(int *)(v10 + 44)];
  long long v35 = v43;
  *(_OWORD *)id v34 = v42;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v44;
  sub_220D25B68((uint64_t)v8, &qword_267F30A10);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F359B8);
  sub_220D26548((uint64_t)v15, (uint64_t)v12, &qword_267F359B8);
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = 0x4024000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359C0);
  sub_220D26548((uint64_t)v12, a1 + *(int *)(v36 + 48), &qword_267F359B8);
  sub_220D25B68((uint64_t)v15, &qword_267F359B8);
  return sub_220D25B68((uint64_t)v12, &qword_267F359B8);
}

uint64_t sub_220EF7338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v58 = a1;
  uint64_t v1 = sub_220F30E58() - 8;
  uint64_t v52 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8) - 8;
  MEMORY[0x270FA5388](v54);
  uint64_t v57 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v56 = (uint64_t)&v48 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v48 - v12;
  MEMORY[0x270FA5388](v14);
  uint64_t v53 = (uint64_t)&v48 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359C8);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v55 = (uint64_t)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v48 - v19;
  *(void *)uint64_t v20 = sub_220F31348();
  *((void *)v20 + 1) = 0x4014000000000000;
  v20[16] = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359D0);
  sub_220EF6750(0x4033000000000000, (uint64_t)&v20[*(int *)(v21 + 44)]);
  uint64_t v22 = &v3[*(int *)(v1 + 28)];
  unsigned int v50 = *MEMORY[0x263F19860];
  uint64_t v23 = v50;
  uint64_t v24 = sub_220F312A8();
  uint64_t v25 = *(void *)(v24 - 8);
  id v49 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 104);
  uint64_t v51 = v25 + 104;
  v49(v22, v23, v24);
  __asm { FMOV            V0.2D, #3.0 }
  long long v48 = _Q0;
  *(_OWORD *)uint64_t v3 = _Q0;
  uint64_t v31 = self;
  uint64_t v32 = MEMORY[0x223C74C60](objc_msgSend(v31, sel_systemGray3Color));
  uint64_t v33 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v3, (uint64_t)v7, MEMORY[0x263F19048]);
  *(void *)&v7[*(int *)(v5 + 60)] = v32;
  *(_WORD *)&v7[*(int *)(v5 + 64)] = 256;
  sub_220EFDEE0((uint64_t)v3, v33);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v7, (uint64_t)v13, &qword_267F2ED30);
  uint64_t v34 = v54;
  long long v35 = &v13[*(int *)(v54 + 44)];
  long long v36 = v60;
  *(_OWORD *)long long v35 = v59;
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v61;
  sub_220D25B68((uint64_t)v7, &qword_267F2ED30);
  uint64_t v37 = v53;
  sub_220D39114((uint64_t)v13, v53, &qword_267F30AE8);
  v49(&v3[*(int *)(v52 + 28)], v50, v24);
  *(_OWORD *)uint64_t v3 = v48;
  uint64_t v38 = MEMORY[0x223C74C60](objc_msgSend(v31, sel_systemGray3Color));
  sub_220EFDE78((uint64_t)v3, (uint64_t)v7, v33);
  *(void *)&v7[*(int *)(v5 + 60)] = v38;
  *(_WORD *)&v7[*(int *)(v5 + 64)] = 256;
  sub_220EFDEE0((uint64_t)v3, v33);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v39 = v56;
  sub_220D26548((uint64_t)v7, v56, &qword_267F2ED30);
  long long v40 = (_OWORD *)(v39 + *(int *)(v34 + 44));
  long long v41 = v63;
  *long long v40 = v62;
  v40[1] = v41;
  v40[2] = v64;
  sub_220D25B68((uint64_t)v7, &qword_267F2ED30);
  sub_220D39114(v39, (uint64_t)v13, &qword_267F30AE8);
  uint64_t v42 = v55;
  sub_220D26548((uint64_t)v20, v55, &qword_267F359C8);
  uint64_t v43 = v37;
  sub_220D26548(v37, v39, &qword_267F30AE8);
  uint64_t v44 = v57;
  sub_220D26548((uint64_t)v13, v57, &qword_267F30AE8);
  uint64_t v45 = v58;
  sub_220D26548(v42, v58, &qword_267F359C8);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A08);
  sub_220D26548(v39, v45 + *(int *)(v46 + 48), &qword_267F30AE8);
  sub_220D26548(v44, v45 + *(int *)(v46 + 64), &qword_267F30AE8);
  sub_220D25B68((uint64_t)v13, &qword_267F30AE8);
  sub_220D25B68(v43, &qword_267F30AE8);
  sub_220D25B68((uint64_t)v20, &qword_267F359C8);
  sub_220D25B68(v44, &qword_267F30AE8);
  sub_220D25B68(v39, &qword_267F30AE8);
  return sub_220D25B68(v42, &qword_267F359C8);
}

uint64_t sub_220EF78AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_220F30E58();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (_OWORD *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v38 = sub_220F31228();
  uint64_t v16 = (char *)v5 + *(int *)(v3 + 28);
  uint64_t v17 = *MEMORY[0x263F19860];
  uint64_t v18 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  __asm { FMOV            V0.2D, #4.0 }
  _OWORD *v5 = _Q0;
  id v24 = objc_msgSend(self, sel_systemGray3Color);
  uint64_t v25 = MEMORY[0x223C74C60](v24);
  sub_220F30B18();
  uint64_t v26 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v5, (uint64_t)v8, MEMORY[0x263F19048]);
  uint64_t v27 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A30) + 36)];
  long long v28 = v40;
  *(_OWORD *)uint64_t v27 = v39;
  *((_OWORD *)v27 + 1) = v28;
  *((void *)v27 + 4) = v41;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A38);
  *(void *)&v8[*(int *)(v29 + 52)] = v25;
  *(_WORD *)&v8[*(int *)(v29 + 56)] = 256;
  uint64_t v30 = sub_220F32468();
  uint64_t v32 = v31;
  uint64_t v33 = (uint64_t *)&v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A40) + 36)];
  *uint64_t v33 = v30;
  v33[1] = v32;
  sub_220EFDEE0((uint64_t)v5, v26);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v8, (uint64_t)v12, &qword_267F30A10);
  uint64_t v34 = &v12[*(int *)(v10 + 44)];
  long long v35 = v43;
  *(_OWORD *)uint64_t v34 = v42;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v44;
  sub_220D25B68((uint64_t)v8, &qword_267F30A10);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F359B8);
  sub_220D26548((uint64_t)v15, (uint64_t)v12, &qword_267F359B8);
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = 0x4030000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A00);
  sub_220D26548((uint64_t)v12, a1 + *(int *)(v36 + 48), &qword_267F359B8);
  sub_220D25B68((uint64_t)v15, &qword_267F359B8);
  return sub_220D25B68((uint64_t)v12, &qword_267F359B8);
}

uint64_t sub_220EF7C08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v105 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A10);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (uint64_t *)((char *)&v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A18);
  MEMORY[0x270FA5388](v4);
  uint64_t v104 = (uint64_t)&v81 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v103 = (uint64_t)&v81 - v7;
  uint64_t v8 = sub_220F30E58();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (__n128 *)((char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v81 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8);
  MEMORY[0x270FA5388](v94);
  uint64_t v15 = (char *)&v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v81 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A20);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v81 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  uint64_t v106 = (uint64_t)&v81 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359E0);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v102 = (uint64_t)&v81 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  long long v28 = (char *)&v81 - v27;
  *(void *)long long v28 = sub_220F31228();
  *((void *)v28 + 1) = 0x4018000000000000;
  v28[16] = 0;
  uint64_t v29 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F359E8) + 44);
  uint64_t v101 = v28;
  __asm { FMOV            V0.2D, #4.0 }
  __n128 v93 = _Q0;
  sub_220EF86B4(0x403C000000000000, (uint64_t)&v28[v29], _Q0);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v100 = v107;
  int v99 = v108;
  uint64_t v98 = v109;
  int v97 = v110;
  uint64_t v96 = v111;
  uint64_t v95 = v112;
  if (sub_220EF6AFC())
  {
    long long v35 = (char *)v10 + *(int *)(v8 + 20);
    uint64_t v36 = *MEMORY[0x263F19860];
    uint64_t v37 = sub_220F312A8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v37 - 8) + 104))(v35, v36, v37);
    __n128 *v10 = v93;
    id v38 = objc_msgSend(self, sel_systemGray3Color);
    uint64_t v39 = MEMORY[0x223C74C60](v38);
    long long v40 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_220EFDE78((uint64_t)v10, (uint64_t)v13, MEMORY[0x263F19048]);
    *(void *)&v13[*(int *)(v11 + 52)] = v39;
    *(_WORD *)&v13[*(int *)(v11 + 56)] = 256;
    sub_220EFDEE0((uint64_t)v10, v40);
    sub_220F32468();
    sub_220F30BA8();
    sub_220D26548((uint64_t)v13, (uint64_t)v15, &qword_267F2ED30);
    uint64_t v41 = &v15[*(int *)(v94 + 36)];
    long long v42 = v114;
    *(_OWORD *)uint64_t v41 = v113;
    *((_OWORD *)v41 + 1) = v42;
    *((_OWORD *)v41 + 2) = v115;
    sub_220D25B68((uint64_t)v13, &qword_267F2ED30);
    sub_220D39114((uint64_t)v15, (uint64_t)v18, &qword_267F30AE8);
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v43 = (uint64_t)v21;
    uint64_t v44 = v116;
    LOBYTE(v39) = v117;
    uint64_t v94 = (uint64_t)v3;
    v93.n128_u64[0] = v4;
    uint64_t v45 = v118;
    char v46 = v119;
    uint64_t v48 = v120;
    uint64_t v47 = v121;
    sub_220D26548((uint64_t)v18, (uint64_t)v15, &qword_267F30AE8);
    sub_220D26548((uint64_t)v15, v43, &qword_267F30AE8);
    uint64_t v49 = v43 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35A40) + 48);
    *(void *)uint64_t v49 = 0;
    *(unsigned char *)(v49 + 8) = 1;
    *(void *)(v49 + 16) = v44;
    uint64_t v21 = (char *)v43;
    *(unsigned char *)(v49 + 24) = v39;
    *(void *)(v49 + 32) = v45;
    uint64_t v4 = v93.n128_u64[0];
    uint64_t v3 = (void *)v94;
    *(unsigned char *)(v49 + 40) = v46;
    *(void *)(v49 + 48) = v48;
    *(void *)(v49 + 56) = v47;
    sub_220D25B68((uint64_t)v18, &qword_267F30AE8);
    sub_220D25B68((uint64_t)v15, &qword_267F30AE8);
    uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A28);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v43, 0, 1, v50);
    sub_220D39114(v43, v106, &qword_267F35A20);
  }
  else
  {
    uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A28);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v106, 1, 1, v51);
  }
  uint64_t v94 = sub_220F31228();
  sub_220F32468();
  sub_220F30BA8();
  v93.n128_u64[0] = v122;
  int v92 = v123;
  uint64_t v91 = v124;
  int v90 = v125;
  uint64_t v89 = v126;
  uint64_t v88 = v127;
  uint64_t v87 = sub_220F31228();
  *uint64_t v3 = sub_220F32468();
  v3[1] = v52;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A30);
  sub_220EF8B48((uint64_t)v3 + *(int *)(v53 + 44));
  char v54 = sub_220F31818();
  sub_220F30A88();
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v63 = v104;
  sub_220D26548((uint64_t)v3, v104, &qword_267F35A10);
  uint64_t v64 = v63 + *(int *)(v4 + 36);
  *(unsigned char *)uint64_t v64 = v54;
  *(void *)(v64 + 8) = v56;
  *(void *)(v64 + 16) = v58;
  *(void *)(v64 + 24) = v60;
  *(void *)(v64 + 32) = v62;
  *(unsigned char *)(v64 + 40) = 0;
  sub_220D25B68((uint64_t)v3, &qword_267F35A10);
  uint64_t v65 = v103;
  sub_220D39114(v63, v103, &qword_267F35A18);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v86 = v128;
  int v85 = v129;
  uint64_t v84 = v130;
  int v83 = v131;
  uint64_t v82 = v132;
  uint64_t v81 = v133;
  uint64_t v66 = (uint64_t)v101;
  uint64_t v67 = v102;
  sub_220D26548((uint64_t)v101, v102, &qword_267F359E0);
  uint64_t v68 = v106;
  sub_220D26548(v106, (uint64_t)v21, &qword_267F35A20);
  sub_220D26548(v65, v63, &qword_267F35A18);
  uint64_t v69 = (uint64_t)v21;
  uint64_t v70 = v105;
  sub_220D26548(v67, v105, &qword_267F359E0);
  uint64_t v71 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35A38);
  uint64_t v72 = v70 + v71[12];
  *(void *)uint64_t v72 = 0;
  *(unsigned char *)(v72 + 8) = 1;
  *(void *)(v72 + 16) = v100;
  *(unsigned char *)(v72 + 24) = v99;
  *(void *)(v72 + 32) = v98;
  *(unsigned char *)(v72 + 40) = v97;
  uint64_t v73 = v95;
  *(void *)(v72 + 48) = v96;
  *(void *)(v72 + 56) = v73;
  sub_220D26548(v69, v70 + v71[16], &qword_267F35A20);
  uint64_t v74 = v70 + v71[20];
  *(void *)uint64_t v74 = v94;
  *(void *)(v74 + 8) = 0x4014000000000000;
  *(unsigned char *)(v74 + 16) = 0;
  uint64_t v75 = v70 + v71[24];
  *(void *)uint64_t v75 = 0;
  *(unsigned char *)(v75 + 8) = 1;
  *(void *)(v75 + 16) = v93.n128_u64[0];
  *(unsigned char *)(v75 + 24) = v92;
  *(void *)(v75 + 32) = v91;
  *(unsigned char *)(v75 + 40) = v90;
  *(void *)(v75 + 48) = v89;
  *(void *)(v75 + 56) = v88;
  uint64_t v76 = v70 + v71[28];
  *(void *)uint64_t v76 = v87;
  *(void *)(v76 + 8) = 0x4014000000000000;
  *(unsigned char *)(v76 + 16) = 0;
  uint64_t v77 = v70 + v71[32];
  *(void *)uint64_t v77 = 0;
  *(unsigned char *)(v77 + 8) = 1;
  sub_220D26548(v63, v70 + v71[36], &qword_267F35A18);
  uint64_t v78 = v70 + v71[40];
  *(void *)uint64_t v78 = 0;
  *(unsigned char *)(v78 + 8) = 1;
  *(void *)(v78 + 16) = v86;
  *(unsigned char *)(v78 + 24) = v85;
  *(void *)(v78 + 32) = v84;
  *(unsigned char *)(v78 + 40) = v83;
  uint64_t v79 = v81;
  *(void *)(v78 + 48) = v82;
  *(void *)(v78 + 56) = v79;
  sub_220D25B68(v65, &qword_267F35A18);
  sub_220D25B68(v68, &qword_267F35A20);
  sub_220D25B68(v66, &qword_267F359E0);
  sub_220D25B68(v63, &qword_267F35A18);
  sub_220D25B68(v69, &qword_267F35A20);
  return sub_220D25B68(v67, &qword_267F359E0);
}

uint64_t sub_220EF86B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q0>)
{
  uint64_t v42 = a1;
  __n128 v46 = a3;
  uint64_t v45 = a2;
  uint64_t v3 = sub_220F30E58();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (__n128 *)((char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8) - 8;
  MEMORY[0x270FA5388](v47);
  uint64_t v44 = (uint64_t)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v41 = (uint64_t)&v38 - v13;
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)&v38 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v43 = (uint64_t)&v38 - v18;
  uint64_t v19 = (char *)v6 + *(int *)(v4 + 28);
  unsigned int v40 = *MEMORY[0x263F19860];
  uint64_t v20 = v40;
  uint64_t v21 = sub_220F312A8();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 104);
  uint64_t v38 = v22 + 104;
  v39(v19, v20, v21);
  *uint64_t v6 = v46;
  uint64_t v23 = self;
  uint64_t v24 = MEMORY[0x223C74C60](objc_msgSend(v23, sel_systemGray3Color));
  uint64_t v25 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v6, (uint64_t)v10, MEMORY[0x263F19048]);
  *(void *)&v10[*(int *)(v8 + 60)] = v24;
  *(_WORD *)&v10[*(int *)(v8 + 64)] = 256;
  sub_220EFDEE0((uint64_t)v6, v25);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v10, (uint64_t)v16, &qword_267F2ED30);
  uint64_t v26 = &v16[*(int *)(v47 + 44)];
  long long v27 = v49;
  *(_OWORD *)uint64_t v26 = v48;
  *((_OWORD *)v26 + 1) = v27;
  *((_OWORD *)v26 + 2) = v50;
  sub_220D25B68((uint64_t)v10, &qword_267F2ED30);
  uint64_t v28 = v43;
  sub_220D39114((uint64_t)v16, v43, &qword_267F30AE8);
  v39((char *)v6 + *(int *)(v4 + 28), v40, v21);
  *uint64_t v6 = v46;
  uint64_t v29 = MEMORY[0x223C74C60](objc_msgSend(v23, sel_systemGray3Color));
  sub_220EFDE78((uint64_t)v6, (uint64_t)v10, v25);
  *(void *)&v10[*(int *)(v8 + 60)] = v29;
  *(_WORD *)&v10[*(int *)(v8 + 64)] = 256;
  sub_220EFDEE0((uint64_t)v6, v25);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v30 = v41;
  sub_220D26548((uint64_t)v10, v41, &qword_267F2ED30);
  uint64_t v31 = (_OWORD *)(v30 + *(int *)(v47 + 44));
  long long v32 = v52;
  _OWORD *v31 = v51;
  v31[1] = v32;
  v31[2] = v53;
  sub_220D25B68((uint64_t)v10, &qword_267F2ED30);
  sub_220D39114(v30, (uint64_t)v16, &qword_267F30AE8);
  uint64_t v33 = v28;
  sub_220D26548(v28, v30, &qword_267F30AE8);
  uint64_t v34 = v44;
  sub_220D26548((uint64_t)v16, v44, &qword_267F30AE8);
  uint64_t v35 = v45;
  sub_220D26548(v30, v45, &qword_267F30AE8);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359F8);
  sub_220D26548(v34, v35 + *(int *)(v36 + 48), &qword_267F30AE8);
  sub_220D25B68((uint64_t)v16, &qword_267F30AE8);
  sub_220D25B68(v33, &qword_267F30AE8);
  sub_220D25B68(v34, &qword_267F30AE8);
  return sub_220D25B68(v30, &qword_267F30AE8);
}

uint64_t sub_220EF8B48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_220F30E58();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (_OWORD *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A10);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F359B8);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v38 - v14;
  uint64_t v38 = sub_220F31228();
  uint64_t v16 = (char *)v5 + *(int *)(v3 + 28);
  uint64_t v17 = *MEMORY[0x263F19860];
  uint64_t v18 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 104))(v16, v17, v18);
  __asm { FMOV            V0.2D, #4.0 }
  _OWORD *v5 = _Q0;
  id v24 = objc_msgSend(self, sel_systemGray3Color);
  uint64_t v25 = MEMORY[0x223C74C60](v24);
  sub_220F30B18();
  uint64_t v26 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v5, (uint64_t)v8, MEMORY[0x263F19048]);
  long long v27 = &v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A30) + 36)];
  long long v28 = v40;
  *(_OWORD *)long long v27 = v39;
  *((_OWORD *)v27 + 1) = v28;
  *((void *)v27 + 4) = v41;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A38);
  *(void *)&v8[*(int *)(v29 + 52)] = v25;
  *(_WORD *)&v8[*(int *)(v29 + 56)] = 256;
  uint64_t v30 = sub_220F32468();
  uint64_t v32 = v31;
  uint64_t v33 = (uint64_t *)&v8[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A40) + 36)];
  *uint64_t v33 = v30;
  v33[1] = v32;
  sub_220EFDEE0((uint64_t)v5, v26);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v8, (uint64_t)v12, &qword_267F30A10);
  uint64_t v34 = &v12[*(int *)(v10 + 44)];
  long long v35 = v43;
  *(_OWORD *)uint64_t v34 = v42;
  *((_OWORD *)v34 + 1) = v35;
  *((_OWORD *)v34 + 2) = v44;
  sub_220D25B68((uint64_t)v8, &qword_267F30A10);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F359B8);
  sub_220D26548((uint64_t)v15, (uint64_t)v12, &qword_267F359B8);
  *(void *)a1 = v38;
  *(void *)(a1 + 8) = 0x4014000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A48);
  sub_220D26548((uint64_t)v12, a1 + *(int *)(v36 + 48), &qword_267F359B8);
  sub_220D25B68((uint64_t)v15, &qword_267F359B8);
  return sub_220D25B68((uint64_t)v12, &qword_267F359B8);
}

uint64_t sub_220EF8EA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B18);
  MEMORY[0x270FA5388](v32);
  uint64_t v2 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_220F30E58();
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (_OWORD *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8);
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v32 - v14;
  id v16 = objc_msgSend(self, sel_currentDevice, v32, v33);
  id v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

  uint64_t v18 = (char *)v6 + *(int *)(v4 + 28);
  uint64_t v19 = *MEMORY[0x263F19860];
  uint64_t v20 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 104))(v18, v19, v20);
  if (v17 == (id)1) {
    __asm { FMOV            V0.2D, #1.5 }
  }
  else {
    __asm { FMOV            V0.2D, #3.0 }
  }
  *uint64_t v6 = _Q0;
  id v26 = objc_msgSend(self, sel_systemGray3Color);
  uint64_t v27 = MEMORY[0x223C74C60](v26);
  long long v28 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v6, (uint64_t)v9, MEMORY[0x263F19048]);
  *(void *)&v9[*(int *)(v7 + 52)] = v27;
  *(_WORD *)&v9[*(int *)(v7 + 56)] = 256;
  sub_220EFDEE0((uint64_t)v6, v28);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v9, (uint64_t)v12, &qword_267F2ED30);
  uint64_t v29 = &v12[*(int *)(v10 + 36)];
  long long v30 = v35;
  *(_OWORD *)uint64_t v29 = v34;
  *((_OWORD *)v29 + 1) = v30;
  *((_OWORD *)v29 + 2) = v36;
  sub_220D25B68((uint64_t)v9, &qword_267F2ED30);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F30AE8);
  sub_220D26548((uint64_t)v15, (uint64_t)v2, &qword_267F30AE8);
  swift_storeEnumTagMultiPayload();
  sub_220DA5F1C();
  sub_220F31488();
  return sub_220D25B68((uint64_t)v15, &qword_267F30AE8);
}

uint64_t sub_220EF931C@<X0>(uint64_t a1@<X8>)
{
  return sub_220EF477C(*v1, a1);
}

uint64_t sub_220EF9324@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v79 = a1;
  uint64_t v78 = type metadata accessor for LockScreenColoringBookView(0);
  uint64_t v76 = *(void *)(v78 - 8);
  MEMORY[0x270FA5388](v78);
  uint64_t v77 = v3;
  uint64_t v75 = (uint64_t)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = (uint64_t (*)(void))sub_220F30E58();
  MEMORY[0x270FA5388](v72);
  uint64_t v71 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A50);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v66 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A58);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A60);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A68);
  MEMORY[0x270FA5388](v67);
  id v16 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A70);
  MEMORY[0x270FA5388](v68);
  uint64_t v18 = (char *)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A78);
  MEMORY[0x270FA5388](v70);
  uint64_t v69 = (uint64_t)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A80);
  MEMORY[0x270FA5388](v73);
  uint64_t v74 = (uint64_t)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v7 = sub_220F31348();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A88);
  sub_220EF9B40((uint64_t)&v7[*(int *)(v21 + 44)]);
  char v22 = sub_220F31828();
  sub_220F30A88();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_220D26548((uint64_t)v7, (uint64_t)v11, &qword_267F35A50);
  uint64_t v31 = &v11[*(int *)(v9 + 44)];
  char *v31 = v22;
  *((void *)v31 + 1) = v24;
  *((void *)v31 + 2) = v26;
  *((void *)v31 + 3) = v28;
  *((void *)v31 + 4) = v30;
  v31[40] = 0;
  sub_220D25B68((uint64_t)v7, &qword_267F35A50);
  int v32 = *v2;
  id v33 = objc_msgSend(self, sel_currentDevice);
  id v34 = objc_msgSend(v33, sel_userInterfaceIdiom);

  if (v34 == (id)1)
  {
    if (v32)
    {
      if (qword_267F2E150 == -1) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
    if (qword_267F2E158 != -1) {
LABEL_8:
    }
      swift_once();
  }
LABEL_7:
  sub_220EE6678(v32);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v11, (uint64_t)v14, &qword_267F35A58);
  long long v35 = &v14[*(int *)(v12 + 36)];
  long long v36 = v84;
  *(_OWORD *)long long v35 = v83;
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v85;
  sub_220D25B68((uint64_t)v11, &qword_267F35A58);
  id v37 = objc_msgSend(self, sel_quaternarySystemFillColor);
  uint64_t v38 = MEMORY[0x223C74C60](v37);
  char v39 = sub_220F31818();
  sub_220D26548((uint64_t)v14, (uint64_t)v16, &qword_267F35A60);
  long long v40 = &v16[*(int *)(v67 + 36)];
  *(void *)long long v40 = v38;
  v40[8] = v39;
  sub_220D25B68((uint64_t)v14, &qword_267F35A60);
  uint64_t v41 = v71;
  long long v42 = &v71[*((int *)v72 + 5)];
  uint64_t v43 = *MEMORY[0x263F19860];
  uint64_t v44 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 104))(v42, v43, v44);
  __asm { FMOV            V0.2D, #13.0 }
  *uint64_t v41 = _Q0;
  uint64_t v50 = (uint64_t)&v18[*(int *)(v68 + 36)];
  long long v51 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220EFDE78((uint64_t)v41, v50, MEMORY[0x263F19048]);
  *(_WORD *)(v50 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
  sub_220D26548((uint64_t)v16, (uint64_t)v18, &qword_267F35A68);
  sub_220EFDEE0((uint64_t)v41, v51);
  sub_220D25B68((uint64_t)v16, &qword_267F35A68);
  uint64_t v72 = type metadata accessor for LockScreenColoringBookView;
  uint64_t v52 = v75;
  sub_220EFDE78((uint64_t)v2, v75, type metadata accessor for LockScreenColoringBookView);
  unint64_t v53 = (*(unsigned __int8 *)(v76 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80);
  uint64_t v54 = swift_allocObject();
  sub_220EFF25C(v52, v54 + v53, type metadata accessor for LockScreenColoringBookView);
  uint64_t v55 = v69;
  sub_220D26548((uint64_t)v18, v69, &qword_267F35A70);
  uint64_t v56 = (uint64_t (**)())(v55 + *(int *)(v70 + 36));
  *uint64_t v56 = sub_220F01A4C;
  v56[1] = (uint64_t (*)())v54;
  v56[2] = 0;
  v56[3] = 0;
  sub_220D25B68((uint64_t)v18, &qword_267F35A70);
  uint64_t v57 = &v2[*(int *)(v78 + 24)];
  uint64_t v59 = *(void *)v57;
  uint64_t v58 = *((void *)v57 + 1);
  uint64_t v80 = v59;
  uint64_t v81 = v58;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F357F0);
  sub_220F32158();
  uint64_t v60 = v82;
  sub_220EFDE78((uint64_t)v2, v52, v72);
  uint64_t v61 = swift_allocObject();
  sub_220EFF25C(v52, v61 + v53, type metadata accessor for LockScreenColoringBookView);
  uint64_t v62 = v74;
  sub_220D26548(v55, v74, &qword_267F35A78);
  uint64_t v63 = v73;
  *(void *)(v62 + *(int *)(v73 + 52)) = v60;
  uint64_t v64 = (uint64_t (**)())(v62 + *(int *)(v63 + 56));
  *uint64_t v64 = sub_220F01C04;
  v64[1] = (uint64_t (*)())v61;
  sub_220D25B68(v55, &qword_267F35A78);
  return sub_220D39114(v62, v79, &qword_267F35A80);
}

uint64_t sub_220EF9B40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v90 = a1;
  uint64_t v81 = sub_220F30E58();
  MEMORY[0x270FA5388](v81);
  long long v83 = (char *)&v81 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  MEMORY[0x270FA5388](v82);
  uint64_t v86 = (uint64_t)&v81 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30AE8);
  MEMORY[0x270FA5388](v85);
  uint64_t v88 = (uint64_t)&v81 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v84 = (uint64_t)&v81 - v5;
  MEMORY[0x270FA5388](v6);
  uint64_t v87 = (uint64_t)&v81 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A20);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v92 = (uint64_t)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v91 = (uint64_t)&v81 - v11;
  uint64_t v12 = (__CFString *)sub_220F32728();
  uint64_t v13 = self;
  id v14 = objc_msgSend(v13, sel_currentDevice);
  id v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  id v93 = v13;
  if (v15)
  {
    id v16 = objc_msgSend(v13, sel_currentDevice);
    id v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

    double v18 = 17.0;
    if (v17 == (id)1) {
      double v18 = 22.0;
    }
  }
  else
  {
    double v18 = 22.0;
  }
  CTFontCreateWithNameAndOptions(v12, v18, 0, 0x20000uLL);

  uint64_t v19 = sub_220F319F8();
  v103[0] = sub_220EFA490();
  v103[1] = v20;
  sub_220D292B8();
  uint64_t v21 = sub_220F31B28();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  swift_retain();
  uint64_t v26 = sub_220F31AF8();
  uint64_t v28 = v27;
  char v30 = v29;
  uint64_t v96 = v19;
  swift_release();
  sub_220D357E0(v21, v23, v25);
  swift_bridgeObjectRelease();
  uint64_t v31 = self;
  MEMORY[0x223C74C60](objc_msgSend(v31, sel_systemGray3Color));
  uint64_t v32 = sub_220F31A98();
  id v34 = v33;
  int v89 = v35;
  uint64_t v95 = v36;
  swift_release();
  sub_220D357E0(v26, v28, v30 & 1);
  swift_bridgeObjectRelease();
  id v37 = v93;
  id v38 = objc_msgSend(v93, sel_currentDevice);
  id v39 = objc_msgSend(v38, sel_userInterfaceIdiom);

  if (v39
    && (id v40 = objc_msgSend(v37, sel_currentDevice),
        id v41 = objc_msgSend(v40, sel_userInterfaceIdiom),
        v40,
        v41 != (id)1))
  {
    sub_220F01C60((uint64_t)v100);
  }
  else
  {
    uint64_t v42 = sub_220F31228();
    sub_220EFA90C(v97);
    LOBYTE(v107) = 0;
    memcpy(&v99[7], v97, 0x180uLL);
    v100[0] = v42;
    v100[1] = 0x4008000000000000;
    char v101 = 0;
    memcpy(v102, v99, sizeof(v102));
    nullsub_1(v100);
  }
  sub_220D39114((uint64_t)v100, (uint64_t)v103, &qword_267F35A90);
  char v43 = sub_220EF6AFC();
  uint64_t v94 = v32;
  if (v43)
  {
    uint64_t v44 = v83;
    uint64_t v45 = &v83[*(int *)(v81 + 20)];
    uint64_t v46 = *MEMORY[0x263F19860];
    uint64_t v47 = sub_220F312A8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v47 - 8) + 104))(v45, v46, v47);
    __asm { FMOV            V0.2D, #1.0 }
    *uint64_t v44 = _Q0;
    uint64_t v53 = MEMORY[0x223C74C60](objc_msgSend(v31, sel_systemGray3Color));
    uint64_t v54 = (uint64_t (*)(void))MEMORY[0x263F19048];
    uint64_t v55 = v86;
    sub_220EFDE78((uint64_t)v44, v86, MEMORY[0x263F19048]);
    uint64_t v56 = v82;
    *(void *)(v55 + *(int *)(v82 + 52)) = v53;
    *(_WORD *)(v55 + *(int *)(v56 + 56)) = 256;
    sub_220EFDEE0((uint64_t)v44, v54);
    id v57 = objc_msgSend(v37, sel_currentDevice);
    objc_msgSend(v57, sel_userInterfaceIdiom);

    sub_220F32468();
    sub_220F30BA8();
    uint64_t v58 = v84;
    sub_220D26548(v55, v84, &qword_267F2ED30);
    uint64_t v59 = (_OWORD *)(v58 + *(int *)(v85 + 36));
    long long v60 = v105;
    *uint64_t v59 = v104;
    v59[1] = v60;
    v59[2] = v106;
    sub_220D25B68(v55, &qword_267F2ED30);
    uint64_t v61 = v87;
    sub_220D39114(v58, v87, &qword_267F30AE8);
    id v62 = objc_msgSend(v37, sel_currentDevice);
    objc_msgSend(v62, sel_userInterfaceIdiom);

    sub_220F32468();
    sub_220F30BA8();
    uint64_t v86 = v107;
    char v63 = v108;
    uint64_t v64 = v109;
    char v65 = v110;
    id v93 = v34;
    uint64_t v67 = v111;
    uint64_t v66 = v112;
    uint64_t v68 = v61;
    uint64_t v69 = v61;
    uint64_t v70 = v88;
    sub_220D26548(v68, v88, &qword_267F30AE8);
    uint64_t v71 = v92;
    sub_220D26548(v70, v92, &qword_267F30AE8);
    uint64_t v72 = v71 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35A40) + 48);
    *(void *)uint64_t v72 = 0;
    *(unsigned char *)(v72 + 8) = 1;
    *(void *)(v72 + 16) = v86;
    *(unsigned char *)(v72 + 24) = v63;
    *(void *)(v72 + 32) = v64;
    *(unsigned char *)(v72 + 40) = v65;
    *(void *)(v72 + 48) = v67;
    *(void *)(v72 + 56) = v66;
    id v34 = v93;
    sub_220D25B68(v69, &qword_267F30AE8);
    sub_220D25B68(v70, &qword_267F30AE8);
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A28);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v73 - 8) + 56))(v71, 0, 1, v73);
    uint64_t v74 = v91;
    sub_220D39114(v71, v91, &qword_267F35A20);
  }
  else
  {
    uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A28);
    uint64_t v74 = v91;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56))(v91, 1, 1, v75);
    uint64_t v71 = v92;
  }
  uint64_t v76 = v90;
  char v77 = v89 & 1;
  char v98 = v89 & 1;
  sub_220D39114((uint64_t)v103, (uint64_t)v97, &qword_267F35A90);
  sub_220D26548(v74, v71, &qword_267F35A20);
  uint64_t v78 = v94;
  *(void *)uint64_t v76 = v94;
  *(void *)(v76 + 8) = v34;
  *(unsigned char *)(v76 + 16) = v77;
  *(void *)(v76 + 24) = v95;
  sub_220D39114((uint64_t)v97, (uint64_t)v99, &qword_267F35A90);
  sub_220D39114((uint64_t)v99, v76 + 32, &qword_267F35A90);
  *(void *)(v76 + 440) = 0;
  *(unsigned char *)(v76 + 448) = 1;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35A98);
  sub_220D26548(v71, v76 + *(int *)(v79 + 80), &qword_267F35A20);
  sub_220D3570C(v78, (uint64_t)v34, v77);
  swift_bridgeObjectRetain();
  sub_220F01D24((uint64_t)v99, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_220F01CA0);
  sub_220D3570C(v78, (uint64_t)v34, v77);
  swift_bridgeObjectRetain();
  swift_release();
  sub_220D25B68(v74, &qword_267F35A20);
  sub_220D357E0(v78, (uint64_t)v34, v77);
  swift_bridgeObjectRelease();
  sub_220D25B68(v71, &qword_267F35A20);
  sub_220D39114((uint64_t)v97, (uint64_t)v100, &qword_267F35A90);
  sub_220F01D24((uint64_t)v100, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_220F01DD0);
  sub_220D357E0(v78, (uint64_t)v34, v98);
  return swift_bridgeObjectRelease();
}

uint64_t sub_220EFA490()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08788]), sel_init);
  uint64_t v1 = sub_220F30678();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F30658();
  uint64_t v5 = (void *)sub_220F30648();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  objc_msgSend(v0, sel_setLocale_, v5);

  uint64_t v6 = (void *)sub_220F32728();
  id v31 = v0;
  objc_msgSend(v0, sel_setLocalizedDateFormatFromTemplate_, v6);

  uint64_t v28 = sub_220F305B8();
  char v30 = v27;
  uint64_t v7 = *(void *)(v28 - 8);
  MEMORY[0x270FA5388](v28);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FB50);
  char v29 = v27;
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_220F30718();
  v27[2] = v27;
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  id v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F306A8();
  uint64_t v17 = sub_220F303F8();
  v27[1] = v27;
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LockScreenColoringBookView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  sub_220F32158();
  sub_220F306D8();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  uint64_t v21 = v28;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v28) == 1)
  {
    sub_220F305A8();
    sub_220D25B68((uint64_t)v12, &qword_267F2FB50);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v21);
  }
  uint64_t v22 = (void *)sub_220F30578();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
  id v23 = v31;
  id v24 = objc_msgSend(v31, sel_stringFromDate_, v22);

  uint64_t v25 = sub_220F32768();
  return v25;
}

uint64_t sub_220EFA90C@<X0>(void *a1@<X8>)
{
  uint64_t v1 = self;
  uint64_t v14 = MEMORY[0x223C74C60](objc_msgSend(v1, sel_systemGray3Color));
  sub_220F30B18();
  uint64_t v2 = sub_220F32468();
  uint64_t v15 = v3;
  uint64_t v16 = v2;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v13 = MEMORY[0x223C74C60](objc_msgSend(v1, sel_systemGray3Color));
  sub_220F30B18();
  uint64_t v10 = sub_220F32468();
  uint64_t v12 = v4;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v5 = MEMORY[0x223C74C60](objc_msgSend(v1, sel_systemGray3Color));
  sub_220F30B18();
  uint64_t v6 = sub_220F32468();
  uint64_t v8 = v7;
  sub_220F32468();
  sub_220F30BA8();
  *(double *)uint64_t v45 = v21 * 0.5;
  *((double *)v45 + 1) = v21;
  v45[1] = v22;
  v45[2] = v23;
  *(void *)&long long v46 = v14;
  WORD4(v46) = 256;
  *(void *)&long long v47 = v16;
  *((void *)&v47 + 1) = v15;
  *(void *)&long long v48 = v24;
  BYTE8(v48) = v25;
  *(void *)&long long v49 = v26;
  BYTE8(v49) = v27;
  long long v50 = v28;
  *(double *)long long v51 = v29 * 0.5;
  *((double *)v51 + 1) = v29;
  v51[1] = v30;
  v51[2] = v31;
  *(void *)&long long v52 = v13;
  WORD4(v52) = 256;
  *(void *)&long long v53 = v10;
  *((void *)&v53 + 1) = v12;
  *(void *)&long long v54 = v32;
  BYTE8(v54) = v33;
  *(void *)&long long v55 = v34;
  BYTE8(v55) = v35;
  long long v56 = v36;
  *(double *)id v57 = v37 * 0.5;
  *((double *)v57 + 1) = v37;
  v57[1] = v38;
  v57[2] = v39;
  *(void *)&long long v58 = v5;
  WORD4(v58) = 256;
  *(void *)&long long v59 = v6;
  *((void *)&v59 + 1) = v8;
  *(void *)&long long v60 = v40;
  BYTE8(v60) = v41;
  *(void *)&long long v61 = v42;
  BYTE8(v61) = v43;
  long long v62 = v44;
  __src[4] = v47;
  __src[5] = v48;
  __src[6] = v49;
  __src[7] = v28;
  __src[0] = v45[0];
  __src[1] = v22;
  __src[2] = v23;
  __src[3] = v46;
  __src[10] = v31;
  __src[11] = v52;
  __src[8] = v51[0];
  __src[9] = v30;
  __src[14] = v55;
  __src[15] = v36;
  __src[12] = v53;
  __src[13] = v54;
  __src[18] = v39;
  __src[19] = v58;
  __src[16] = v57[0];
  __src[17] = v38;
  __src[22] = v61;
  __src[23] = v44;
  __src[20] = v59;
  __src[21] = v60;
  memcpy(a1, __src, 0x180uLL);
  v64[0] = v37 * 0.5;
  v64[1] = v37;
  long long v65 = v38;
  long long v66 = v39;
  uint64_t v67 = v5;
  __int16 v68 = 256;
  uint64_t v69 = v6;
  uint64_t v70 = v8;
  uint64_t v71 = v40;
  char v72 = v41;
  uint64_t v73 = v42;
  char v74 = v43;
  long long v75 = v44;
  sub_220E18414((uint64_t)v45);
  sub_220E18414((uint64_t)v51);
  sub_220E18414((uint64_t)v57);
  sub_220E1844C((uint64_t)v64);
  v76[0] = v29 * 0.5;
  v76[1] = v29;
  long long v77 = v30;
  long long v78 = v31;
  uint64_t v79 = v13;
  __int16 v80 = 256;
  uint64_t v81 = v10;
  uint64_t v82 = v12;
  uint64_t v83 = v32;
  char v84 = v33;
  uint64_t v85 = v34;
  char v86 = v35;
  long long v87 = v36;
  sub_220E1844C((uint64_t)v76);
  v88[0] = v21 * 0.5;
  v88[1] = v21;
  long long v89 = v22;
  long long v90 = v23;
  uint64_t v91 = v14;
  __int16 v92 = 256;
  int v93 = v19;
  __int16 v94 = v20;
  uint64_t v95 = v16;
  uint64_t v96 = v15;
  uint64_t v97 = v24;
  char v98 = v25;
  *(_DWORD *)&v99[3] = *(_DWORD *)&v18[3];
  *(_DWORD *)int v99 = *(_DWORD *)v18;
  uint64_t v100 = v26;
  char v101 = v27;
  *(_DWORD *)uint64_t v102 = *(_DWORD *)v17;
  *(_DWORD *)&v102[3] = *(_DWORD *)&v17[3];
  long long v103 = v28;
  return sub_220E1844C((uint64_t)v88);
}

uint64_t sub_220EFAF30()
{
  uint64_t v0 = sub_220F30718();
  uint64_t v27 = *(void *)(v0 - 8);
  uint64_t v28 = v0;
  MEMORY[0x270FA5388](v0);
  long long v22 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F306A8();
  uint64_t v2 = sub_220F305B8();
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  MEMORY[0x270FA5388](v2);
  double v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F305A8();
  uint64_t v4 = sub_220F306F8();
  uint64_t v5 = *(void **)(v4 - 8);
  uint64_t v6 = v5[8];
  __n128 v7 = MEMORY[0x270FA5388](v4);
  unint64_t v24 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v8 = (char *)&v19 - v24;
  uint64_t v9 = *MEMORY[0x263F07888];
  long long v23 = (void (*)(char *, uint64_t, uint64_t, __n128))v5[13];
  v23((char *)&v19 - v24, v9, v4, v7);
  sub_220F30708();
  __int16 v20 = (void (*)(char *, uint64_t))v5[1];
  v20(v8, v4);
  type metadata accessor for LockScreenColoringBookView(0);
  uint64_t v10 = sub_220F303F8();
  uint64_t v11 = *(void *)(*(void *)(v10 - 8) + 64);
  MEMORY[0x270FA5388](v10 - 8);
  unint64_t v19 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  sub_220F32158();
  sub_220F30388();
  uint64_t v12 = sub_220F32168();
  __n128 v13 = MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v19 - v24;
  v23((char *)&v19 - v24, *MEMORY[0x263F078B8], v4, v13);
  uint64_t v16 = v21;
  uint64_t v15 = v22;
  sub_220F30708();
  uint64_t v17 = ((uint64_t (*)(char *, uint64_t))v20)(v14, v4);
  MEMORY[0x270FA5388](v17);
  sub_220F32158();
  sub_220F303C8();
  sub_220F32168();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v16, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v15, v28);
}

double sub_220EFB2E0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v39 = sub_220F31318();
  uint64_t v3 = *(void *)(v39 - 8);
  MEMORY[0x270FA5388](v39);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = type metadata accessor for ChooseLabel(0);
  uint64_t v6 = *(int *)(v37 + 24);
  uint64_t v38 = v1;
  if (*(unsigned char *)(v1 + v6) == 1)
  {
    if (qword_267F2E160 == -1) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  if (qword_267F2E160 != -1) {
LABEL_10:
  }
    swift_once();
LABEL_5:
  *(void *)&long long v49 = sub_220F30408();
  *((void *)&v49 + 1) = v7;
  sub_220D292B8();
  uint64_t v8 = sub_220F31B28();
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  sub_220F31EA8();
  uint64_t v34 = sub_220F31A98();
  uint64_t v35 = v13;
  char v15 = v14;
  uint64_t v36 = v16;
  swift_release();
  uint64_t v17 = v15 & 1;
  sub_220D357E0(v8, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  sub_220F11AF8((uint64_t)v5);
  char v19 = sub_220F31308();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v39);
  if (v19) {
    goto LABEL_8;
  }
  __int16 v20 = self;
  id v21 = objc_msgSend(v20, sel_mainScreen);
  objc_msgSend(v21, sel_nativeScale);
  double v23 = v22;

  id v24 = objc_msgSend(v20, sel_mainScreen);
  objc_msgSend(v24, sel_scale);
  double v26 = v25;

  if (v26 < v23)
  {
LABEL_8:
    uint64_t v40 = v34;
    uint64_t v41 = v35;
    uint64_t v42 = v17;
    uint64_t v43 = v36;
    uint64_t v44 = KeyPath;
    long long v45 = 1uLL;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    char v48 = 1;
  }
  else
  {
    uint64_t v27 = swift_getKeyPath();
    uint64_t v40 = v34;
    uint64_t v41 = v35;
    uint64_t v42 = v17;
    uint64_t v43 = v36;
    uint64_t v44 = KeyPath;
    long long v45 = xmmword_220F34220;
    uint64_t v46 = v27;
    uint64_t v47 = 0x3FE0000000000000;
    char v48 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35AA0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F33E50);
  sub_220F01E5C();
  sub_220E60308();
  sub_220F31488();
  uint64_t v28 = v53;
  char v29 = v54;
  double result = *(double *)&v49;
  long long v31 = v50;
  long long v32 = v51;
  long long v33 = v52;
  *(_OWORD *)a1 = v49;
  *(_OWORD *)(a1 + 16) = v31;
  *(_OWORD *)(a1 + 32) = v32;
  *(_OWORD *)(a1 + 48) = v33;
  *(void *)(a1 + 64) = v28;
  *(unsigned char *)(a1 + 72) = v29;
  return result;
}

uint64_t sub_220EFB6E0()
{
  return sub_220F31058();
}

uint64_t sub_220EFB704()
{
  return sub_220F31058();
}

uint64_t sub_220EFB728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_220EFB790(a1, a2, a3, a4, MEMORY[0x263F19448]);
}

uint64_t sub_220EFB740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_220EFB790(a1, a2, a3, a4, MEMORY[0x263F19448]);
}

uint64_t sub_220EFB76C()
{
  return sub_220F31008();
}

uint64_t sub_220EFB790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D26548(a1, (uint64_t)v9, &qword_267F32370);
  return a5(v9);
}

uint64_t sub_220EFB834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_220EFB790(a1, a2, a3, a4, MEMORY[0x263F193D0]);
}

uint64_t *sub_220EFB860(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[6];
    uint64_t v13 = (uint64_t *)((char *)v7 + v12);
    char v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_220F315C8();
      uint64_t v16 = *(void *)(v15 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v16 + 16))(v13, v14, v15);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      }
    }
    else
    {
      void *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    char v19 = (uint64_t *)((char *)v7 + v18);
    __int16 v20 = (uint64_t *)((char *)a2 + v18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v21 = sub_220F315C8();
      uint64_t v22 = *(void *)(v21 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v22 + 16))(v19, v20, v21);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      }
    }
    else
    {
      *char v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v24 = a3[8];
    uint64_t v25 = a3[9];
    double v26 = (char *)v7 + v24;
    uint64_t v27 = (char *)a2 + v24;
    char *v26 = *v27;
    *((void *)v26 + 1) = *((void *)v27 + 1);
    uint64_t v28 = (char *)v7 + v25;
    char v29 = (char *)a2 + v25;
    *uint64_t v28 = *v29;
    *((void *)v28 + 1) = *((void *)v29 + 1);
    uint64_t v30 = a3[10];
    uint64_t v31 = a3[11];
    long long v32 = (char *)v7 + v30;
    long long v33 = (char *)a2 + v30;
    *long long v32 = *v33;
    *((void *)v32 + 1) = *((void *)v33 + 1);
    uint64_t v34 = (char *)v7 + v31;
    uint64_t v35 = (char *)a2 + v31;
    *uint64_t v34 = *v35;
    *((void *)v34 + 1) = *((void *)v35 + 1);
    uint64_t v36 = a3[12];
    uint64_t v37 = a3[13];
    uint64_t v38 = (char *)v7 + v36;
    uint64_t v39 = (char *)a2 + v36;
    *uint64_t v38 = *v39;
    *((void *)v38 + 1) = *((void *)v39 + 1);
    uint64_t v40 = (char *)v7 + v37;
    uint64_t v41 = (char *)a2 + v37;
    *(void *)uint64_t v40 = *(void *)v41;
    v40[8] = v41[8];
    *((void *)v40 + 2) = *((void *)v41 + 2);
    uint64_t v42 = a3[14];
    uint64_t v43 = a3[15];
    uint64_t v44 = (char *)v7 + v42;
    long long v45 = (char *)a2 + v42;
    *uint64_t v44 = *v45;
    *((void *)v44 + 1) = *((void *)v45 + 1);
    uint64_t v46 = (char *)v7 + v43;
    uint64_t v47 = (char *)a2 + v43;
    *uint64_t v46 = *v47;
    *((void *)v46 + 1) = *((void *)v47 + 1);
    uint64_t v48 = a3[16];
    long long v49 = (char *)v7 + v48;
    long long v50 = (char *)a2 + v48;
    *(void *)long long v49 = *(void *)v50;
    v49[8] = v50[8];
    *((void *)v49 + 2) = *((void *)v50 + 2);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_220EFBD4C(uint64_t a1, int *a2)
{
  swift_release();
  uint64_t v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F315C8();
    uint64_t v8 = *(void *)(v7 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = a1 + a2[7];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F315C8();
    uint64_t v11 = *(void *)(v10 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10)) {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_220EFC000(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_220F315C8();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)((char *)a1 + v17);
  char v19 = (void *)((char *)a2 + v17);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v20 = sub_220F315C8();
    uint64_t v21 = *(void *)(v20 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
      memcpy(v18, v19, *(void *)(*(void *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  else
  {
    *uint64_t v18 = *v19;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = a3[8];
  uint64_t v24 = a3[9];
  uint64_t v25 = (char *)a1 + v23;
  double v26 = (char *)a2 + v23;
  *uint64_t v25 = *v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  uint64_t v27 = (char *)a1 + v24;
  uint64_t v28 = (char *)a2 + v24;
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  uint64_t v29 = a3[10];
  uint64_t v30 = a3[11];
  uint64_t v31 = (char *)a1 + v29;
  long long v32 = (char *)a2 + v29;
  char *v31 = *v32;
  *((void *)v31 + 1) = *((void *)v32 + 1);
  long long v33 = (char *)a1 + v30;
  uint64_t v34 = (char *)a2 + v30;
  *long long v33 = *v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  uint64_t v35 = a3[12];
  uint64_t v36 = a3[13];
  uint64_t v37 = (char *)a1 + v35;
  uint64_t v38 = (char *)a2 + v35;
  *uint64_t v37 = *v38;
  *((void *)v37 + 1) = *((void *)v38 + 1);
  uint64_t v39 = (char *)a1 + v36;
  uint64_t v40 = (char *)a2 + v36;
  *(void *)uint64_t v39 = *(void *)v40;
  v39[8] = v40[8];
  *((void *)v39 + 2) = *((void *)v40 + 2);
  uint64_t v41 = a3[14];
  uint64_t v42 = a3[15];
  uint64_t v43 = (char *)a1 + v41;
  uint64_t v44 = (char *)a2 + v41;
  char *v43 = *v44;
  *((void *)v43 + 1) = *((void *)v44 + 1);
  long long v45 = (char *)a1 + v42;
  uint64_t v46 = (char *)a2 + v42;
  *long long v45 = *v46;
  *((void *)v45 + 1) = *((void *)v46 + 1);
  uint64_t v47 = a3[16];
  uint64_t v48 = (char *)a1 + v47;
  long long v49 = (char *)a2 + v47;
  *(void *)uint64_t v48 = *(void *)v49;
  v48[8] = v49[8];
  *((void *)v48 + 2) = *((void *)v49 + 2);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_220EFC490(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_220D25B68((uint64_t)a1 + v6, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    sub_220D25B68((uint64_t)a1 + v10, &qword_267F32358);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_220F315C8();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      }
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v16 = a3[7];
    uint64_t v17 = (void *)((char *)a1 + v16);
    uint64_t v18 = (void *)((char *)a2 + v16);
    sub_220D25B68((uint64_t)a1 + v16, &qword_267F32358);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_220F315C8();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
    }
    else
    {
      void *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v22 = a3[8];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  *uint64_t v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_retain();
  swift_release();
  uint64_t v25 = a3[9];
  double v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  char *v26 = *v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_retain();
  swift_release();
  uint64_t v28 = a3[10];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  *uint64_t v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[11];
  long long v32 = (char *)a1 + v31;
  long long v33 = (char *)a2 + v31;
  *long long v32 = *v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_retain();
  swift_release();
  uint64_t v34 = a3[12];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  *uint64_t v35 = *v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  swift_retain();
  swift_release();
  uint64_t v37 = a3[13];
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  uint64_t v40 = *(void *)v39;
  v38[8] = v39[8];
  *(void *)uint64_t v38 = v40;
  *((void *)v38 + 2) = *((void *)v39 + 2);
  swift_retain();
  swift_release();
  uint64_t v41 = a3[14];
  uint64_t v42 = (char *)a1 + v41;
  uint64_t v43 = (char *)a2 + v41;
  *uint64_t v42 = *v43;
  *((void *)v42 + 1) = *((void *)v43 + 1);
  swift_retain();
  swift_release();
  uint64_t v44 = a3[15];
  long long v45 = (char *)a1 + v44;
  uint64_t v46 = (char *)a2 + v44;
  *long long v45 = *v46;
  *((void *)v45 + 1) = *((void *)v46 + 1);
  swift_retain();
  swift_release();
  uint64_t v47 = a3[16];
  uint64_t v48 = (char *)a1 + v47;
  long long v49 = (char *)a2 + v47;
  uint64_t v50 = *(void *)v49;
  v48[8] = v49[8];
  *(void *)uint64_t v48 = v50;
  *((void *)v48 + 2) = *((void *)v49 + 2);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_220EFC9D0(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30AD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_220F315C8();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v12, v13, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v21 = sub_220F315C8();
    uint64_t v22 = *(void *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
      memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v19, v20, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v24 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v24) = *(_OWORD *)((char *)a2 + v24);
  uint64_t v25 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  *(_OWORD *)((char *)a1 + v25) = *(_OWORD *)((char *)a2 + v25);
  uint64_t v26 = a3[13];
  *(_OWORD *)((char *)a1 + a3[12]) = *(_OWORD *)((char *)a2 + a3[12]);
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  *((void *)v27 + 2) = *((void *)v28 + 2);
  *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
  uint64_t v29 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  *(_OWORD *)((char *)a1 + v29) = *(_OWORD *)((char *)a2 + v29);
  uint64_t v30 = a3[16];
  uint64_t v31 = (char *)a1 + v30;
  long long v32 = (char *)a2 + v30;
  *((void *)v31 + 2) = *((void *)v32 + 2);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  return a1;
}

void *sub_220EFCDB4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_220D25B68((uint64_t)a1 + v6, &qword_267F33C90);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220F30AD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = a3[6];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    sub_220D25B68((uint64_t)a1 + v11, &qword_267F32358);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_220F315C8();
      uint64_t v16 = *(void *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15))
      {
        uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v12, v13, v15);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v12, 0, 1, v15);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
    uint64_t v18 = a3[7];
    uint64_t v19 = (char *)a1 + v18;
    uint64_t v20 = (char *)a2 + v18;
    sub_220D25B68((uint64_t)a1 + v18, &qword_267F32358);
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_220F315C8();
      uint64_t v23 = *(void *)(v22 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v20, 1, v22))
      {
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v19, v20, v22);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v19, 0, 1, v22);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v19, v20, *(void *)(*(void *)(v21 - 8) + 64));
    }
  }
  uint64_t v25 = a3[8];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  char *v26 = *v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_release();
  uint64_t v28 = a3[9];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  *uint64_t v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_release();
  uint64_t v31 = a3[10];
  long long v32 = (char *)a1 + v31;
  long long v33 = (char *)a2 + v31;
  *long long v32 = *v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_release();
  uint64_t v34 = a3[11];
  uint64_t v35 = (char *)a1 + v34;
  uint64_t v36 = (char *)a2 + v34;
  *uint64_t v35 = *v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  swift_release();
  uint64_t v37 = a3[12];
  uint64_t v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  *uint64_t v38 = *v39;
  *((void *)v38 + 1) = *((void *)v39 + 1);
  swift_release();
  uint64_t v40 = a3[13];
  uint64_t v41 = (char *)a1 + v40;
  uint64_t v42 = (char *)a2 + v40;
  *(void *)uint64_t v41 = *(void *)v42;
  v41[8] = v42[8];
  *((void *)v41 + 2) = *((void *)v42 + 2);
  swift_release();
  uint64_t v43 = a3[14];
  uint64_t v44 = (char *)a1 + v43;
  long long v45 = (char *)a2 + v43;
  *uint64_t v44 = *v45;
  *((void *)v44 + 1) = *((void *)v45 + 1);
  swift_release();
  uint64_t v46 = a3[15];
  uint64_t v47 = (char *)a1 + v46;
  uint64_t v48 = (char *)a2 + v46;
  *uint64_t v47 = *v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  swift_release();
  uint64_t v49 = a3[16];
  uint64_t v50 = (char *)a1 + v49;
  long long v51 = (char *)a2 + v49;
  *(void *)uint64_t v50 = *(void *)v51;
  v50[8] = v51[8];
  *((void *)v50 + 2) = *((void *)v51 + 2);
  swift_release();
  return a1;
}

uint64_t sub_220EFD2C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220EFD2D8);
}

uint64_t sub_220EFD2D8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32380);
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_220EFD418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220EFD42C);
}

void *sub_220EFD42C(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *double result = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32380);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void sub_220EFD560()
{
  sub_220F00B14(319, (unint64_t *)&qword_267F2FD98, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_220EFD680();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_220EFD680()
{
  if (!qword_267F323A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F32370);
    unint64_t v0 = sub_220F30AE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F323A0);
    }
  }
}

uint64_t sub_220EFD6DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220EFD6FC()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t))sub_220EE683C);
}

uint64_t objectdestroyTm_20()
{
  uint64_t v1 = (int *)type metadata accessor for FacesAndPagesPicker(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  swift_release();
  uint64_t v6 = v0 + v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_220F315C8();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
  }
  else
  {
    swift_release();
  }
  uint64_t v11 = v5 + v1[7];
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_220F315C8();
    uint64_t v13 = *(void *)(v12 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12)) {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220EFDA60()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t))sub_220EE7628);
}

uint64_t sub_220EFDA8C(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *(void *)(a1(0) - 8);
  uint64_t v4 = v2 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return a2(v4);
}

uint64_t sub_220EFDB0C(uint64_t a1)
{
  return sub_220EFDB68(a1, type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t, uint64_t))sub_220EE7700);
}

uint64_t sub_220EFDB3C(uint64_t a1)
{
  return sub_220EFDB68(a1, type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t, uint64_t))sub_220EE798C);
}

uint64_t sub_220EFDB68(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(a2(0) - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return a3(a1, v6);
}

BOOL UIInterfaceOrientationIsPortrait(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

unint64_t *sub_220EFDC00(uint64_t isStackAllocationSafe)
{
  uint64_t v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x263EF8340];
  char v3 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v4 = (unint64_t)((1 << v3) + 63) >> 6;
  size_t v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x270FA5388](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    uint64_t v6 = sub_220ED1108((void *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1) {
      swift_willThrow();
    }
  }
  else
  {
    uint64_t v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    uint64_t v6 = sub_220ED1108((unint64_t *)v7, v4, v2);
    swift_release();
    MEMORY[0x223C76830](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_220EFDD68()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker, (uint64_t (*)(uint64_t))sub_220EE753C);
}

uint64_t block_copy_helper_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_16()
{
  return swift_release();
}

uint64_t sub_220EFDDAC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220EFDDFC()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_220EFDE34()
{
  return sub_220EE75B4();
}

uint64_t type metadata accessor for FacesAndPagesPicker.contents(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35310);
}

uint64_t sub_220EFDE78(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220EFDEE0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_220EFDF40(void *a1, void *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    uint64_t v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)uint64_t v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    v14[16] = v15[16];
    uint64_t v17 = (char *)a1 + v13;
    uint64_t v18 = (char *)a2 + v13;
    uint64_t v19 = *((void *)v18 + 1);
    *(void *)uint64_t v17 = *(void *)v18;
    *((void *)v17 + 1) = v19;
    v17[16] = v18[16];
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    uint64_t v22 = (char *)a1 + v20;
    uint64_t v23 = (char *)a2 + v20;
    v22[16] = v23[16];
    uint64_t v24 = *((void *)v23 + 1);
    *(void *)uint64_t v22 = *(void *)v23;
    *((void *)v22 + 1) = v24;
    uint64_t v25 = a3[10];
    uint64_t v26 = (void *)((char *)a1 + v25);
    uint64_t v27 = (void *)((char *)a2 + v25);
    *((unsigned char *)a1 + v21) = *((unsigned char *)a2 + v21);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      void *v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_220EFE194(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F31318();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    return v8(v6, v7);
  }
  else
  {
    return swift_release();
  }
}

void *sub_220EFE30C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
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
  v13[16] = v14[16];
  uint64_t v16 = (char *)a1 + v12;
  uint64_t v17 = (char *)a2 + v12;
  uint64_t v18 = *((void *)v17 + 1);
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = v18;
  v16[16] = v17[16];
  uint64_t v19 = a3[8];
  uint64_t v20 = a3[9];
  uint64_t v21 = (char *)a1 + v19;
  uint64_t v22 = (char *)a2 + v19;
  v21[16] = v22[16];
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = v23;
  uint64_t v24 = a3[10];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  *((unsigned char *)a1 + v20) = *((unsigned char *)a2 + v20);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v27 = sub_220F31318();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  else
  {
    *uint64_t v25 = *v26;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_220EFE508(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_220D25B68((uint64_t)a1 + v6, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  v11[16] = v12[16];
  uint64_t v13 = a3[7];
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_retain();
  swift_release();
  v14[16] = v15[16];
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
  swift_retain();
  swift_release();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  v17[16] = v18[16];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  if (a1 != a2)
  {
    uint64_t v19 = a3[10];
    uint64_t v20 = (void *)((char *)a1 + v19);
    uint64_t v21 = (void *)((char *)a2 + v19);
    sub_220D25B68((uint64_t)a1 + v19, (uint64_t *)&unk_267F2E250);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v22 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v22 - 8) + 16))(v20, v21, v22);
    }
    else
    {
      *uint64_t v20 = *v21;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_220EFE78C(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30AD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  uint64_t v14 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  v15[16] = v16[16];
  uint64_t v17 = a3[8];
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v17;
  uint64_t v20 = (char *)a2 + v17;
  long long v21 = *(_OWORD *)v20;
  v19[16] = v20[16];
  LOBYTE(v20) = *((unsigned char *)a2 + v18);
  *(_OWORD *)uint64_t v19 = v21;
  *((unsigned char *)a1 + v18) = (_BYTE)v20;
  uint64_t v22 = a3[10];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v26 = sub_220F31318();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
  }
  return a1;
}

void *sub_220EFE968(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_220D25B68((uint64_t)a1 + v6, &qword_267F33C90);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220F30AD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  v12[16] = v13[16];
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  v15[16] = v16[16];
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  swift_release();
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_release();
  v18[16] = v19[16];
  *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
  if (a1 != a2)
  {
    uint64_t v20 = a3[10];
    long long v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    sub_220D25B68((uint64_t)a1 + v20, (uint64_t *)&unk_267F2E250);
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_220F31318();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_220EFEBD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220EFEBE8);
}

uint64_t sub_220EFEBE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[6] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[10];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_220EFED24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220EFED38);
}

uint64_t sub_220EFED38(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[10];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

void sub_220EFEE74()
{
  sub_220F00B14(319, (unint64_t *)&qword_267F2FD98, MEMORY[0x263F18520], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F)
  {
    sub_220F00B14(319, (unint64_t *)&qword_267F2EAF8, MEMORY[0x263F19A00], MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t sub_220EFEFC4()
{
  unint64_t result = qword_267F35320;
  if (!qword_267F35320)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F352D0);
    sub_220D25FB0(&qword_267F35328, &qword_267F352D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35320);
  }
  return result;
}

uint64_t sub_220EFF064()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220EFF080()
{
  uint64_t v1 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_220F31318();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v4 + v3 + 1, v2 | 7);
}

uint64_t sub_220EFF25C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_220EFF2C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for FacesAndPagesPicker.contents(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  int v5 = *(unsigned __int8 *)(v1 + v4 + *(void *)(v3 + 64));
  return sub_220EE7E8C((void *)(v1 + v4), v5, a1);
}

uint64_t sub_220EFF364()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_220EEF2B4);
}

uint64_t sub_220EFF390@<X0>(uint64_t a1@<X8>)
{
  return sub_220EEF370(*(void *)(v1 + 16), &qword_267F35660, (uint64_t (*)(uint64_t))sub_220EEF3D0, a1);
}

uint64_t objectdestroy_48Tm_0()
{
  uint64_t v1 = type metadata accessor for FacesAndPagesPicker.contents(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_220F31318();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220EFF5A4()
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  return sub_220EF1870();
}

uint64_t sub_220EFF618()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_220EECA9C);
}

uint64_t sub_220EFF644@<X0>(uint64_t a1@<X8>)
{
  return sub_220EEF370(*(void *)(v1 + 16), &qword_267F35580, (uint64_t (*)(uint64_t))sub_220EECB58, a1);
}

uint64_t sub_220EFF680()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_220EEEFCC);
}

double sub_220EFF6B0@<D0>(_OWORD *a1@<X8>)
{
  type metadata accessor for FacesAndPagesPicker.contents(0);
  return sub_220EEF1C4(a1);
}

uint64_t sub_220EFF720(unint64_t *a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    sub_220F30E28();
    sub_220D25FB0(a4, a3);
    sub_220F0000C(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    swift_getOpaqueTypeConformance2();
    sub_220F0000C((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_220EFF86C()
{
  unint64_t result = qword_267F35420;
  if (!qword_267F35420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35420);
  }
  return result;
}

uint64_t sub_220EFF8C4()
{
  return sub_220F01A78((void (*)(void))type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(void))sub_220EE9F00);
}

uint64_t sub_220EFF8F0@<X0>(uint64_t a1@<X8>)
{
  return sub_220EEF370(*(void *)(v1 + 16), &qword_267F35450, (uint64_t (*)(uint64_t))sub_220EEA148, a1);
}

uint64_t sub_220EFF92C(uint64_t a1)
{
  return sub_220EFDB68(a1, type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t, uint64_t))sub_220EEC880);
}

uint64_t type metadata accessor for ChooseLabel(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35798);
}

uint64_t type metadata accessor for LockScreenColoringBookView(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35780);
}

uint64_t sub_220EFF99C()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_220EEC37C);
}

unint64_t sub_220EFF9C8()
{
  unint64_t result = qword_267F35518;
  if (!qword_267F35518)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35518);
  }
  return result;
}

uint64_t sub_220EFFA28()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_220EEEE80);
}

uint64_t sub_220EFFA54@<X0>(void *a1@<X8>)
{
  return sub_220EF1904(a1);
}

double sub_220EFFA5C@<D0>(uint64_t a1@<X8>)
{
  long long v15 = 0u;
  long long v16 = 0u;
  sub_220F32148();
  long long v14 = v17;
  uint64_t v2 = v18;
  uint64_t v3 = v19;
  uint64_t v4 = v20;
  sub_220D25F48(0, &qword_267F354C0);
  id v5 = objc_msgSend(self, sel_currentRunLoop);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F354C8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_220F32B28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = sub_220F32AD8();

  sub_220D25B68((uint64_t)v8, &qword_267F354C8);
  *(void *)&long long v17 = v10;
  sub_220F32AC8();
  sub_220EFDDAC(&qword_267F354D0, MEMORY[0x270FA9C90]);
  uint64_t v11 = sub_220F30958();
  swift_release();
  *(void *)&long long v15 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F354D8);
  sub_220F32148();
  long long v12 = v17;
  double result = *(double *)&v14;
  *(_OWORD *)a1 = v14;
  *(void *)(a1 + 16) = v2;
  *(void *)(a1 + 24) = v3;
  *(void *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 40) = v12;
  return result;
}

uint64_t sub_220EFFC58(uint64_t a1)
{
  return a1;
}

uint64_t sub_220EFFCA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_220EFFCEC()
{
  return sub_220EFDA8C(type metadata accessor for FacesAndPagesPicker.contents, (uint64_t (*)(uint64_t))sub_220EF163C);
}

uint64_t sub_220EFFD20()
{
  return sub_220F01720(&qword_267F35738, &qword_267F35710, (void (*)(void))sub_220EFFD50);
}

uint64_t sub_220EFFD50()
{
  return sub_220F01720(&qword_267F35740, &qword_267F35708, (void (*)(void))sub_220EFFD80);
}

unint64_t sub_220EFFD80()
{
  unint64_t result = qword_267F35748;
  if (!qword_267F35748)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35700);
    sub_220EFFE20();
    sub_220D25FB0(&qword_267F2FEC0, &qword_267F2F310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35748);
  }
  return result;
}

unint64_t sub_220EFFE20()
{
  unint64_t result = qword_267F35750;
  if (!qword_267F35750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35758);
    sub_220D7EC30();
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35750);
  }
  return result;
}

unint64_t sub_220EFFEC0()
{
  unint64_t result = qword_267F35760;
  if (!qword_267F35760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F320C8);
    sub_220EFFF60();
    sub_220D25FB0(&qword_267F2EA98, &qword_267F2EAA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35760);
  }
  return result;
}

unint64_t sub_220EFFF60()
{
  unint64_t result = qword_267F35768;
  if (!qword_267F35768)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F320C0);
    sub_220F0000C((unint64_t *)&qword_267F309B8, MEMORY[0x263F19048]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35768);
  }
  return result;
}

uint64_t sub_220F0000C(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for WatchColoringBookView.Time()
{
  return &type metadata for WatchColoringBookView.Time;
}

uint64_t destroy for WatchColoringBookView()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WatchColoringBookView(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for WatchColoringBookView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for WatchColoringBookView(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WatchColoringBookView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WatchColoringBookView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WatchColoringBookView()
{
  return &type metadata for WatchColoringBookView;
}

unsigned char *storeEnumTagSinglePayload for HomeScreenColoringBookView(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x220F00360);
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

ValueMetadata *type metadata accessor for HomeScreenColoringBookView()
{
  return &type metadata for HomeScreenColoringBookView;
}

uint64_t *sub_220F00398(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    unsigned int v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = *(int *)(a3 + 20);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_220F303F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
    *(void *)&v8[*(int *)(v11 + 28)] = *(void *)&v9[*(int *)(v11 + 28)];
    uint64_t v12 = *(int *)(a3 + 24);
    uint64_t v13 = (uint64_t *)((char *)v4 + v12);
    long long v14 = (uint64_t *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_220F004B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_220F303F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  swift_release();
  swift_release();
  return swift_release();
}

unsigned char *sub_220F00558(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_220F303F8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

unsigned char *sub_220F00624(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_220F303F8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  swift_retain();
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)&a1[v11] = *v13;
  swift_retain();
  swift_release();
  *((void *)v12 + 1) = v13[1];
  swift_retain();
  swift_release();
  return a1;
}

unsigned char *sub_220F00714(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_220F303F8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  *(_OWORD *)&a1[*(int *)(a3 + 24)] = *(_OWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

unsigned char *sub_220F007C4(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_220F303F8();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  *(void *)&v7[*(int *)(v10 + 28)] = *(void *)&v8[*(int *)(v10 + 28)];
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)&a1[v11] = *v13;
  swift_release();
  *((void *)v12 + 1) = v13[1];
  swift_release();
  return a1;
}

uint64_t sub_220F0089C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F008B0);
}

uint64_t sub_220F008B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t sub_220F00978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F0098C);
}

uint64_t sub_220F0098C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_220F00A50()
{
  sub_220F00B14(319, &qword_267F35790, MEMORY[0x270FA81E0], MEMORY[0x263F1B5D0]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_220F00B14(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

void *sub_220F00B78(void *a1, void *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_220F00CAC(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F31318();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

void *sub_220F00D64(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F31318();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_220F00E48(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_220D25B68((uint64_t)a1 + v6, (uint64_t *)&unk_267F2E250);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_220F00F58(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F31318();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_220F01048(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 20);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_220D25B68((uint64_t)a1 + v6, (uint64_t *)&unk_267F2E250);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220F31318();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_220F01160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F01174);
}

uint64_t sub_220F01174(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    unint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_220F01234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F01248);
}

void *sub_220F01248(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_220F012F4()
{
  sub_220F00B14(319, (unint64_t *)&qword_267F2EAF8, MEMORY[0x263F19A00], MEMORY[0x263F185C8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for DeletionBadge()
{
  return &type metadata for DeletionBadge;
}

uint64_t sub_220F013D4()
{
  return sub_220D25FB0(&qword_267F357A8, &qword_267F35330);
}

uint64_t sub_220F01410()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F0142C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F01448()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F01464()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F01480()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F014A4()
{
  return sub_220F30FB8();
}

uint64_t sub_220F014D0(uint64_t a1)
{
  return sub_220EF3850(a1, v1 + 16);
}

uint64_t sub_220F014D8(uint64_t a1)
{
  return a1;
}

uint64_t objectdestroy_113Tm_0()
{
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_220F0156C()
{
  return sub_220EF3ADC(0);
}

uint64_t sub_220F01594()
{
  return sub_220EF3EEC(*(long long **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

unint64_t sub_220F015B4()
{
  unint64_t result = qword_267F358C8;
  if (!qword_267F358C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F358B8);
    sub_220F01654();
    sub_220D25FB0(&qword_267F2FEC0, &qword_267F2F310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F358C8);
  }
  return result;
}

unint64_t sub_220F01654()
{
  unint64_t result = qword_267F358D0;
  if (!qword_267F358D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F358B0);
    sub_220F01720(&qword_267F358D8, &qword_267F358A8, (void (*)(void))sub_220F0179C);
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F358D0);
  }
  return result;
}

uint64_t sub_220F01720(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_220F0179C()
{
  unint64_t result = qword_267F358E0;
  if (!qword_267F358E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F358A0);
    sub_220D25FB0(&qword_267F358E8, &qword_267F35898);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F358E0);
  }
  return result;
}

unint64_t sub_220F0183C()
{
  unint64_t result = qword_267F358F0;
  if (!qword_267F358F0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35888);
    sub_220F018DC();
    sub_220D25FB0(&qword_267F2FEC0, &qword_267F2F310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F358F0);
  }
  return result;
}

unint64_t sub_220F018DC()
{
  unint64_t result = qword_267F358F8;
  if (!qword_267F358F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35880);
    sub_220F01720(&qword_267F35900, &qword_267F35878, (void (*)(void))sub_220F019A8);
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F358F8);
  }
  return result;
}

unint64_t sub_220F019A8()
{
  unint64_t result = qword_267F35908;
  if (!qword_267F35908)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35870);
    sub_220D25FB0(&qword_267F35910, &qword_267F35868);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35908);
  }
  return result;
}

uint64_t sub_220F01A4C()
{
  return sub_220F01A78((void (*)(void))type metadata accessor for LockScreenColoringBookView, sub_220EFAF30);
}

uint64_t sub_220F01A78(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t objectdestroy_120Tm()
{
  uint64_t v1 = type metadata accessor for LockScreenColoringBookView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 20);
  uint64_t v7 = sub_220F303F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35778);
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_220F01C04()
{
  return sub_220EFAF30();
}

double sub_220F01C60(uint64_t a1)
{
  *(void *)(a1 + 400) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_220F01CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_220F01D24(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  long long v12 = *(_OWORD *)(a1 + 368);
  long long v13 = *(_OWORD *)(a1 + 384);
  long long v10 = *(_OWORD *)(a1 + 336);
  long long v11 = *(_OWORD *)(a1 + 352);
  long long v8 = *(_OWORD *)(a1 + 304);
  long long v9 = *(_OWORD *)(a1 + 320);
  long long v6 = *(_OWORD *)(a1 + 272);
  long long v7 = *(_OWORD *)(a1 + 288);
  long long v4 = *(_OWORD *)(a1 + 240);
  long long v5 = *(_OWORD *)(a1 + 256);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    v8,
    *((void *)&v8 + 1),
    v9,
    *((void *)&v9 + 1),
    v10,
    *((void *)&v10 + 1),
    v11,
    *((void *)&v11 + 1),
    v12,
    *((void *)&v12 + 1),
    v13,
    *((void *)&v13 + 1),
    *(void *)(a1 + 400));
  return a1;
}

uint64_t sub_220F01DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a8)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

unint64_t sub_220F01E5C()
{
  unint64_t result = qword_267F35AA8;
  if (!qword_267F35AA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35AA0);
    sub_220E60308();
    sub_220D25FB0(&qword_267F32FA8, &qword_267F32FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35AA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for WatchColoringBookView.DigitalCrown()
{
  return &type metadata for WatchColoringBookView.DigitalCrown;
}

ValueMetadata *type metadata accessor for HomeScreenColoringBookView.ColoringBookIconView()
{
  return &type metadata for HomeScreenColoringBookView.ColoringBookIconView;
}

uint64_t sub_220F01F24()
{
  return sub_220D25FB0(&qword_267F35AB0, &qword_267F35AB8);
}

unint64_t sub_220F01F64()
{
  unint64_t result = qword_267F35AC0;
  if (!qword_267F35AC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F357F8);
    sub_220D25FB0(&qword_267F35AC8, &qword_267F357C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35AC0);
  }
  return result;
}

uint64_t sub_220F02004()
{
  return sub_220F02054(&qword_267F35AD0, &qword_267F35AD8, (void (*)(void))sub_220F015B4, (void (*)(void))sub_220F0183C);
}

uint64_t sub_220F02054(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
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

uint64_t sub_220F020DC()
{
  return sub_220D25FB0(&qword_267F35AE0, &qword_267F35A80);
}

uint64_t sub_220F02118()
{
  return sub_220F02054(&qword_267F35AE8, &qword_267F35AF0, (void (*)(void))sub_220F01E5C, (void (*)(void))sub_220E60308);
}

uint64_t sub_220F02168()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F02184()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F021A0()
{
  return sub_220D25FB0(&qword_267F35B20, &qword_267F35B28);
}

unint64_t sub_220F021E0()
{
  unint64_t result = qword_267F35B30;
  if (!qword_267F35B30)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35B38);
    sub_220DA5F1C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35B30);
  }
  return result;
}

uint64_t sub_220F02254()
{
  return sub_220F01594();
}

void *sub_220F0226C(void *a1, void *a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F30AD8();
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

void *sub_220F02388(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
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

void *sub_220F02454(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_220F30AD8();
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

void *sub_220F02538(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F30AD8();
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

void *sub_220F0260C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, &qword_267F33C90);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F30AD8();
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

uint64_t sub_220F026F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F0270C);
}

uint64_t sub_220F0270C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
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

uint64_t sub_220F027E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F027F4);
}

uint64_t sub_220F027F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
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

uint64_t type metadata accessor for exceptionsPlatter(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35B40);
}

void sub_220F028D4()
{
  sub_220D7A610();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for addExceptionButtonStyle()
{
  return &type metadata for addExceptionButtonStyle;
}

uint64_t sub_220F02978()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F02994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v74 = a2;
  uint64_t v3 = sub_220F312F8();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v71 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_220F31988();
  uint64_t v63 = *(void *)(v5 - 8);
  uint64_t v64 = v5;
  MEMORY[0x270FA5388](v5);
  long long v62 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BB8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (uint64_t *)((char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BC0);
  MEMORY[0x270FA5388](v10 - 8);
  long long v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = v12;
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v61 - v14;
  uint64_t v69 = (uint64_t)&v61 - v14;
  uint64_t *v9 = sub_220F32418();
  v9[1] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BC8);
  sub_220F03054(a1, (uint64_t)v9 + *(int *)(v17 + 44));
  sub_220D25FB0(&qword_267F35BD0, &qword_267F35BB8);
  sub_220F31D48();
  sub_220D25B68((uint64_t)v9, &qword_267F35BB8);
  sub_220D39114((uint64_t)v12, (uint64_t)v15, &qword_267F35BC0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BD8);
  uint64_t v68 = *(void *)(*(void *)(v18 - 8) + 64);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v66 = (uint64_t)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v67 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x270FA5388](v20);
  long long v65 = (char *)&v61 - v21;
  *(void *)&v92[0] = sub_220F03BB0();
  *((void *)&v92[0] + 1) = v22;
  sub_220D292B8();
  uint64_t v23 = sub_220F31B28();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  sub_220F31FE8();
  uint64_t v28 = sub_220F31A98();
  uint64_t v30 = v29;
  char v32 = v31;
  swift_release();
  LOBYTE(v9) = v32 & 1;
  sub_220D357E0(v23, v25, v27);
  swift_bridgeObjectRelease();
  sub_220F318A8();
  uint64_t v34 = v62;
  uint64_t v33 = v63;
  uint64_t v35 = v64;
  (*(void (**)(char *, void, uint64_t))(v63 + 104))(v62, *MEMORY[0x263F1A680], v64);
  sub_220F319B8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
  sub_220F318D8();
  swift_release();
  uint64_t v36 = sub_220F31AF8();
  uint64_t v38 = v37;
  LOBYTE(v34) = v39;
  uint64_t v41 = v40;
  swift_release();
  sub_220D357E0(v28, v30, (char)v9);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v43 = swift_getKeyPath();
  uint64_t v44 = swift_getKeyPath();
  LOBYTE(v28) = sub_220F31808();
  sub_220F30A88();
  char v91 = v34 & 1;
  char v87 = 0;
  char v83 = 0;
  *(void *)&long long v75 = v36;
  *((void *)&v75 + 1) = v38;
  LOBYTE(v76) = v34 & 1;
  *(_DWORD *)((char *)&v76 + 1) = *(_DWORD *)v90;
  DWORD1(v76) = *(_DWORD *)&v90[3];
  *((void *)&v76 + 1) = v41;
  LOWORD(v77) = 256;
  *(_DWORD *)((char *)&v77 + 2) = v88;
  WORD3(v77) = v89;
  *((void *)&v77 + 1) = KeyPath;
  *(void *)&long long v78 = 4;
  BYTE8(v78) = 0;
  *(_DWORD *)((char *)&v78 + 9) = *(_DWORD *)v86;
  HIDWORD(v78) = *(_DWORD *)&v86[3];
  *(void *)&long long v79 = v43;
  *((void *)&v79 + 1) = 0x3FE3333333333333;
  *(void *)&long long v80 = v44;
  BYTE8(v80) = 1;
  *(_DWORD *)((char *)&v80 + 9) = *(_DWORD *)v85;
  HIDWORD(v80) = *(_DWORD *)&v85[3];
  LOBYTE(v81) = v28;
  DWORD1(v81) = *(_DWORD *)&v84[3];
  *(_DWORD *)((char *)&v81 + 1) = *(_DWORD *)v84;
  *((void *)&v81 + 1) = v45;
  *(void *)&v82[0] = v46;
  *((void *)&v82[0] + 1) = v47;
  *(void *)&v82[1] = v48;
  BYTE8(v82[1]) = 0;
  uint64_t v49 = v71;
  sub_220F312E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BE0);
  sub_220F061AC(&qword_267F35BE8, &qword_267F35BE0, (void (*)(void))sub_220F06228);
  uint64_t v50 = (uint64_t)v65;
  sub_220F31D78();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v49, v73);
  v92[6] = v81;
  v93[0] = v82[0];
  *(_OWORD *)((char *)v93 + 9) = *(_OWORD *)((char *)v82 + 9);
  v92[2] = v77;
  v92[3] = v78;
  v92[4] = v79;
  v92[5] = v80;
  v92[0] = v75;
  v92[1] = v76;
  sub_220D9BB20((uint64_t)v92);
  uint64_t v51 = v66;
  sub_220D39114(v50, v66, &qword_267F35BD8);
  uint64_t v53 = v69;
  uint64_t v52 = (uint64_t)v70;
  uint64_t v54 = sub_220D26548(v69, (uint64_t)v70, &qword_267F35BC0);
  MEMORY[0x270FA5388](v54);
  long long v55 = (char *)&v61 - v67;
  sub_220D26548(v51, (uint64_t)&v61 - v67, &qword_267F35BD8);
  uint64_t v56 = v52;
  uint64_t v57 = v52;
  uint64_t v58 = v74;
  sub_220D26548(v56, v74, &qword_267F35BC0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C20);
  sub_220D26548((uint64_t)v55, v58 + *(int *)(v59 + 48), &qword_267F35BD8);
  sub_220D25B68(v51, &qword_267F35BD8);
  sub_220D25B68(v53, &qword_267F35BC0);
  sub_220D25B68((uint64_t)v55, &qword_267F35BD8);
  return sub_220D25B68(v57, &qword_267F35BC0);
}

uint64_t sub_220F03054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v87 = (char *)a2;
  uint64_t v88 = a1;
  uint64_t v2 = sub_220F31EB8();
  uint64_t v85 = *(void *)(v2 - 8);
  uint64_t v86 = v2;
  MEMORY[0x270FA5388](v2);
  *(void *)&long long v84 = (char *)&v71 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED48);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C30);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C38);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C40);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v20 = (char *)&v71 - v19;
  uint64_t *v9 = sub_220F32448();
  v9[1] = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C48);
  sub_220F036F4((uint64_t)v9 + *(int *)(v22 + 44));
  char v23 = sub_220F31808();
  sub_220F30A88();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_220D26548((uint64_t)v9, (uint64_t)v13, &qword_267F35C30);
  char v32 = &v13[*(int *)(v11 + 44)];
  *char v32 = v23;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = v27;
  *((void *)v32 + 3) = v29;
  *((void *)v32 + 4) = v31;
  v32[40] = 0;
  sub_220D25B68((uint64_t)v9, &qword_267F35C30);
  char v33 = sub_220F31828();
  sub_220F30A88();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_220D26548((uint64_t)v13, (uint64_t)v17, &qword_267F35C38);
  uint64_t v42 = &v17[*(int *)(v15 + 44)];
  *uint64_t v42 = v33;
  *((void *)v42 + 1) = v35;
  *((void *)v42 + 2) = v37;
  *((void *)v42 + 3) = v39;
  *((void *)v42 + 4) = v41;
  v42[40] = 0;
  sub_220D25B68((uint64_t)v13, &qword_267F35C38);
  uint64_t v43 = (uint64_t)v20;
  sub_220D39114((uint64_t)v17, (uint64_t)v20, &qword_267F35C40);
  if (sub_220F04EC0()) {
    uint64_t v44 = sub_220F31F98();
  }
  else {
    uint64_t v44 = sub_220F31F78();
  }
  uint64_t v89 = v44;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v45 = v128;
  uint64_t v46 = v130;
  uint64_t v71 = v128;
  uint64_t v72 = v130;
  int v80 = v131;
  int v81 = v129;
  uint64_t v82 = v133;
  uint64_t v83 = v132;
  sub_220F04EC0();
  uint64_t v78 = sub_220F32078();
  sub_220F31908();
  uint64_t v47 = sub_220F318F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v47 - 8) + 56))(v6, 1, 1, v47);
  uint64_t v79 = sub_220F31958();
  sub_220D25B68((uint64_t)v6, &qword_267F2ED48);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v48 = sub_220F32468();
  uint64_t v75 = v49;
  uint64_t v76 = v48;
  uint64_t v88 = sub_220F31F88();
  uint64_t v50 = swift_getKeyPath();
  uint64_t v73 = v50;
  (*(void (**)(void, void, uint64_t))(v85 + 104))(v84, *MEMORY[0x263F1B388], v86);
  uint64_t v51 = sub_220F32018();
  unsigned __int8 v93 = v81;
  unsigned __int8 v91 = v80;
  uint64_t v74 = v43;
  sub_220D26548(v43, (uint64_t)v17, &qword_267F35C40);
  unsigned __int8 v52 = v93;
  LODWORD(v85) = v93;
  unsigned __int8 v53 = v91;
  LODWORD(v86) = v91;
  uint64_t v54 = (uint64_t)v87;
  sub_220D26548((uint64_t)v17, (uint64_t)v87, &qword_267F35C40);
  uint64_t v55 = v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35C50) + 48);
  *(void *)&long long v96 = v89;
  WORD4(v96) = 256;
  *(_DWORD *)((char *)&v96 + 10) = v94;
  HIWORD(v96) = v95;
  *(void *)&long long v97 = v45;
  BYTE8(v97) = v52;
  *(_DWORD *)((char *)&v97 + 9) = *(_DWORD *)v92;
  HIDWORD(v97) = *(_DWORD *)&v92[3];
  *(void *)&long long v98 = v46;
  BYTE8(v98) = v53;
  HIDWORD(v98) = *(_DWORD *)&v90[3];
  *(_DWORD *)((char *)&v98 + 9) = *(_DWORD *)v90;
  uint64_t v56 = v83;
  char v87 = v17;
  uint64_t v57 = v82;
  *(void *)&long long v99 = v83;
  *((void *)&v99 + 1) = v82;
  uint64_t v58 = KeyPath;
  uint64_t v59 = v78;
  *(void *)&long long v100 = v78;
  *((void *)&v100 + 1) = KeyPath;
  uint64_t v60 = v79;
  uint64_t v61 = v75;
  uint64_t v62 = v76;
  *(void *)&long long v101 = v79;
  *((void *)&v101 + 1) = v76;
  *(void *)&long long v102 = v75;
  *((void *)&v102 + 1) = v50;
  *(void *)&long long v103 = v88;
  *((void *)&v103 + 1) = v51;
  long long v84 = xmmword_220F3E250;
  long long v104 = xmmword_220F3E250;
  uint64_t v105 = 0x4000000000000000;
  long long v63 = v97;
  *(_OWORD *)uint64_t v55 = v96;
  *(_OWORD *)(v55 + 16) = v63;
  long long v64 = v98;
  long long v65 = v99;
  long long v66 = v101;
  *(_OWORD *)(v55 + 64) = v100;
  *(_OWORD *)(v55 + 80) = v66;
  *(_OWORD *)(v55 + 32) = v64;
  *(_OWORD *)(v55 + 48) = v65;
  long long v67 = v102;
  long long v68 = v103;
  long long v69 = v104;
  *(void *)(v55 + 144) = 0x4000000000000000;
  *(_OWORD *)(v55 + 112) = v68;
  *(_OWORD *)(v55 + 128) = v69;
  *(_OWORD *)(v55 + 96) = v67;
  sub_220F06418((uint64_t)&v96);
  sub_220D25B68(v74, &qword_267F35C40);
  uint64_t v106 = v89;
  __int16 v107 = 256;
  int v108 = v94;
  __int16 v109 = v95;
  uint64_t v110 = v71;
  char v111 = v85;
  *(_DWORD *)uint64_t v112 = *(_DWORD *)v92;
  *(_DWORD *)&v112[3] = *(_DWORD *)&v92[3];
  uint64_t v113 = v72;
  char v114 = v86;
  *(_DWORD *)long long v115 = *(_DWORD *)v90;
  *(_DWORD *)&v115[3] = *(_DWORD *)&v90[3];
  uint64_t v116 = v56;
  uint64_t v117 = v57;
  uint64_t v118 = v59;
  uint64_t v119 = v58;
  uint64_t v120 = v60;
  uint64_t v121 = v62;
  uint64_t v122 = v61;
  uint64_t v123 = v73;
  uint64_t v124 = v88;
  uint64_t v125 = v51;
  long long v126 = v84;
  uint64_t v127 = 0x4000000000000000;
  sub_220F0649C((uint64_t)&v106);
  return sub_220D25B68((uint64_t)v87, &qword_267F35C40);
}

uint64_t sub_220F036F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v50 = a1;
  uint64_t v49 = sub_220F31EB8();
  uint64_t v46 = *(void *)(v49 - 8);
  MEMORY[0x270FA5388](v49);
  uint64_t v45 = (char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C58) - 8;
  MEMORY[0x270FA5388](v48);
  uint64_t v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v47 = (uint64_t)&v43 - v5;
  uint64_t v6 = type metadata accessor for ExceptionsOnboardingView.OnboardingCard(0);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (uint64_t *)((char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v43 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C60);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C68);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v44 = (uint64_t)&v43 - v21;
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  sub_220F06548((uint64_t)v8, (uint64_t)v11);
  sub_220F32528();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  sub_220F065AC((uint64_t)v11, (uint64_t)v15, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  uint64_t v26 = (int64x2_t *)&v15[*(int *)(v13 + 44)];
  int64x2_t *v26 = vdupq_n_s64(0x3FEB333333333333uLL);
  v26[1].i64[0] = v23;
  v26[1].i64[1] = v25;
  sub_220F06614((uint64_t)v11, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  LOBYTE(v13) = sub_220F31828();
  sub_220F30A88();
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  sub_220D26548((uint64_t)v15, (uint64_t)v19, &qword_267F35C60);
  uint64_t v35 = &v19[*(int *)(v17 + 44)];
  *uint64_t v35 = v13;
  *((void *)v35 + 1) = v28;
  *((void *)v35 + 2) = v30;
  *((void *)v35 + 3) = v32;
  *((void *)v35 + 4) = v34;
  v35[40] = 0;
  sub_220D25B68((uint64_t)v15, &qword_267F35C60);
  uint64_t v36 = v44;
  sub_220D39114((uint64_t)v19, v44, &qword_267F35C68);
  *uint64_t v8 = swift_getKeyPath();
  swift_storeEnumTagMultiPayload();
  sub_220F06548((uint64_t)v8, (uint64_t)v11);
  (*(void (**)(char *, void, uint64_t))(v46 + 104))(v45, *MEMORY[0x263F1B388], v49);
  uint64_t v37 = sub_220F32018();
  sub_220F065AC((uint64_t)v11, (uint64_t)v3, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  uint64_t v38 = &v3[*(int *)(v48 + 44)];
  *(void *)uint64_t v38 = v37;
  *(_OWORD *)(v38 + 8) = xmmword_220F38620;
  *((void *)v38 + 3) = 0x4010000000000000;
  sub_220F06614((uint64_t)v11, type metadata accessor for ExceptionsOnboardingView.OnboardingCard);
  uint64_t v39 = v47;
  sub_220D39114((uint64_t)v3, v47, &qword_267F35C58);
  sub_220D26548(v36, (uint64_t)v19, &qword_267F35C68);
  sub_220D26548(v39, (uint64_t)v3, &qword_267F35C58);
  uint64_t v40 = v50;
  sub_220D26548((uint64_t)v19, v50, &qword_267F35C68);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C70);
  sub_220D26548((uint64_t)v3, v40 + *(int *)(v41 + 48), &qword_267F35C58);
  sub_220D25B68(v39, &qword_267F35C58);
  sub_220D25B68(v36, &qword_267F35C68);
  sub_220D25B68((uint64_t)v3, &qword_267F35C58);
  return sub_220D25B68((uint64_t)v19, &qword_267F35C68);
}

uint64_t sub_220F03BB0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C28);
  sub_220F32158();
  BOOL v0 = sub_220F04EC0();
  if (v2 == 1)
  {
    if (v0)
    {
      if (qword_267F2E160 != -1) {
        swift_once();
      }
    }
    else if (qword_267F2E160 != -1)
    {
      swift_once();
    }
  }
  else if (v0)
  {
    if (qword_267F2E160 != -1) {
      swift_once();
    }
  }
  else if (qword_267F2E160 != -1)
  {
    swift_once();
  }
  return sub_220F30408();
}

uint64_t sub_220F03D68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v62 = sub_220F30E58() - 8;
  MEMORY[0x270FA5388](v62);
  uint64_t v61 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C88);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C90);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C98);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (uint64_t *)((char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35CA0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35CA8);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v12 = sub_220F32468();
  v12[1] = v20;
  uint64_t v21 = (uint64_t)v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35CB0) + 44);
  *(void *)uint64_t v5 = sub_220F31228();
  *((void *)v5 + 1) = 0x4020000000000000;
  v5[16] = 0;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35CB8);
  sub_220F041F0(v1, (uint64_t)&v5[*(int *)(v22 + 44)]);
  char v23 = sub_220F31808();
  sub_220F30A88();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_220D26548((uint64_t)v5, (uint64_t)v9, &qword_267F35C88);
  uint64_t v32 = &v9[*(int *)(v7 + 44)];
  *uint64_t v32 = v23;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = v27;
  *((void *)v32 + 3) = v29;
  *((void *)v32 + 4) = v31;
  v32[40] = 0;
  sub_220D25B68((uint64_t)v5, &qword_267F35C88);
  LOBYTE(v7) = sub_220F31878();
  sub_220F30A88();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_220D26548((uint64_t)v9, v21, &qword_267F35C90);
  uint64_t v41 = v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35CC0) + 36);
  *(unsigned char *)uint64_t v41 = v7;
  *(void *)(v41 + 8) = v34;
  *(void *)(v41 + 16) = v36;
  *(void *)(v41 + 24) = v38;
  *(void *)(v41 + 32) = v40;
  *(unsigned char *)(v41 + 40) = 0;
  sub_220D25B68((uint64_t)v9, &qword_267F35C90);
  sub_220D26548((uint64_t)v12, (uint64_t)v15, &qword_267F35C98);
  sub_220D25B68((uint64_t)v12, &qword_267F35C98);
  id v42 = objc_msgSend(self, sel_systemGray5Color);
  uint64_t v43 = MEMORY[0x223C74C60](v42);
  char v44 = sub_220F31818();
  sub_220D26548((uint64_t)v15, (uint64_t)v19, &qword_267F35CA0);
  uint64_t v45 = &v19[*(int *)(v17 + 44)];
  *(void *)uint64_t v45 = v43;
  v45[8] = v44;
  sub_220D25B68((uint64_t)v15, &qword_267F35CA0);
  uint64_t v46 = v61;
  uint64_t v47 = &v61[*(int *)(v62 + 28)];
  uint64_t v48 = *MEMORY[0x263F19860];
  uint64_t v49 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v49 - 8) + 104))(v47, v48, v49);
  __asm { FMOV            V0.2D, #13.0 }
  *uint64_t v46 = _Q0;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35CC8);
  uint64_t v56 = v63;
  uint64_t v57 = v63 + *(int *)(v55 + 36);
  uint64_t v58 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220F065AC((uint64_t)v46, v57, MEMORY[0x263F19048]);
  *(_WORD *)(v57 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
  sub_220D26548((uint64_t)v19, v56, &qword_267F35CA8);
  sub_220F06614((uint64_t)v46, v58);
  return sub_220D25B68((uint64_t)v19, &qword_267F35CA8);
}

uint64_t sub_220F041F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30878);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v42 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v41 = (uint64_t *)((char *)&v35 - v7);
  uint64_t v8 = sub_220F30AD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)&v35 - v13;
  uint64_t v15 = sub_220F32088();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F32078();
  (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, *MEMORY[0x263F1B4B8], v15);
  uint64_t v39 = sub_220F320D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  uint64_t v40 = a1;
  sub_220F11B30((uint64_t)v14);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F18508], v8);
  char v19 = sub_220F30AC8();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v11, v8);
  v20(v14, v8);
  if (v19)
  {
    id v21 = objc_msgSend(self, sel_systemBackgroundColor);
    uint64_t v22 = MEMORY[0x223C74C60](v21);
  }
  else
  {
    uint64_t v22 = sub_220F31FF8();
  }
  uint64_t v38 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v37 = v43;
  int v36 = v44;
  uint64_t v24 = v45;
  char v25 = v46;
  uint64_t v26 = v47;
  uint64_t v35 = v48;
  uint64_t v27 = sub_220F31358();
  uint64_t v28 = (uint64_t)v41;
  *uint64_t v41 = v27;
  *(void *)(v28 + 8) = 0x4018000000000000;
  *(unsigned char *)(v28 + 16) = 0;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30880);
  sub_220F04628(v40, v28 + *(int *)(v29 + 44));
  uint64_t v30 = v42;
  sub_220D26548(v28, v42, &qword_267F30878);
  uint64_t v31 = v38;
  *(void *)a2 = v39;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(void *)(a2 + 24) = KeyPath;
  *(void *)(a2 + 32) = v31;
  *(void *)(a2 + 40) = v37;
  *(unsigned char *)(a2 + 48) = v36;
  *(void *)(a2 + 56) = v24;
  *(unsigned char *)(a2 + 64) = v25;
  uint64_t v32 = v35;
  *(void *)(a2 + 72) = v26;
  *(void *)(a2 + 80) = v32;
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35CD0);
  sub_220D26548(v30, a2 + *(int *)(v33 + 48), &qword_267F30878);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_220D25B68(v28, &qword_267F30878);
  sub_220D25B68(v30, &qword_267F30878);
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_220F04628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v111 = a2;
  uint64_t v3 = sub_220F30AD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v87 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v87 - v8;
  uint64_t v10 = sub_220F30E58();
  MEMORY[0x270FA5388](v10);
  char v87 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (_OWORD *)((char *)&v87 - v13);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F304D8);
  MEMORY[0x270FA5388](v112);
  uint64_t v108 = (uint64_t)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v97 = (uint64_t)&v87 - v17;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F304E0);
  MEMORY[0x270FA5388](v106);
  uint64_t v110 = (uint64_t)&v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v104 = (uint64_t)&v87 - v20;
  MEMORY[0x270FA5388](v21);
  uint64_t v109 = (uint64_t)&v87 - v22;
  MEMORY[0x270FA5388](v23);
  char v25 = (char *)&v87 - v24;
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30890);
  MEMORY[0x270FA5388](v96);
  uint64_t v107 = (uint64_t)&v87 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v95 = (uint64_t)&v87 - v28;
  MEMORY[0x270FA5388](v29);
  uint64_t v102 = (uint64_t)&v87 - v30;
  uint64_t v98 = v10;
  uint64_t v31 = (char *)v14 + *(int *)(v10 + 20);
  uint64_t v32 = *MEMORY[0x263F19860];
  uint64_t v33 = sub_220F312A8();
  uint64_t v34 = *(void *)(v33 - 8);
  uint64_t v35 = *(void (**)(char *, void, uint64_t))(v34 + 104);
  unsigned int v94 = v32;
  uint64_t v93 = v33;
  __int16 v92 = v35;
  uint64_t v91 = v34 + 104;
  ((void (*)(char *, uint64_t))v35)(v31, v32);
  __asm { FMOV            V0.2D, #2.75 }
  long long v89 = _Q0;
  _OWORD *v14 = _Q0;
  uint64_t v101 = a1;
  sub_220F11B30((uint64_t)v9);
  uint64_t v41 = *(void (**)(void))(v4 + 104);
  unsigned int v90 = *MEMORY[0x263F18508];
  uint64_t v88 = (void (*)(char *, void, uint64_t))v41;
  v41(v6);
  LOBYTE(v31) = sub_220F30AC8();
  uint64_t v42 = *(void (**)(char *, uint64_t))(v4 + 8);
  long long v100 = v6;
  v42(v6, v3);
  long long v99 = v9;
  uint64_t v105 = v3;
  uint64_t v103 = v4 + 8;
  v42(v9, v3);
  uint64_t v43 = v87;
  if (v31)
  {
    id v44 = objc_msgSend(self, sel_systemBackgroundColor);
    uint64_t v45 = MEMORY[0x223C74C60](v44);
  }
  else
  {
    uint64_t v45 = sub_220F31FF8();
  }
  uint64_t v46 = v45;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v48 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v49 = v97;
  sub_220F065AC((uint64_t)v14, v97, MEMORY[0x263F19048]);
  uint64_t v50 = (uint64_t *)(v49 + *(int *)(v112 + 36));
  *uint64_t v50 = KeyPath;
  v50[1] = v46;
  sub_220F06614((uint64_t)v14, v48);
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548(v49, (uint64_t)v25, &qword_267F304D8);
  uint64_t v51 = v106;
  unsigned __int8 v52 = &v25[*(int *)(v106 + 36)];
  long long v53 = v114;
  *(_OWORD *)unsigned __int8 v52 = v113;
  *((_OWORD *)v52 + 1) = v53;
  *((_OWORD *)v52 + 2) = v115;
  sub_220D25B68(v49, &qword_267F304D8);
  char v54 = sub_220F31868();
  sub_220F30A88();
  uint64_t v56 = v55;
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v63 = v95;
  sub_220D26548((uint64_t)v25, v95, &qword_267F304E0);
  uint64_t v64 = v63 + *(int *)(v96 + 36);
  *(unsigned char *)uint64_t v64 = v54;
  *(void *)(v64 + 8) = v56;
  *(void *)(v64 + 16) = v58;
  *(void *)(v64 + 24) = v60;
  *(void *)(v64 + 32) = v62;
  *(unsigned char *)(v64 + 40) = 0;
  sub_220D25B68((uint64_t)v25, &qword_267F304E0);
  uint64_t v65 = v102;
  sub_220D39114(v63, v102, &qword_267F30890);
  uint64_t v66 = (uint64_t)v43;
  v92(&v43[*(int *)(v98 + 20)], v94, v93);
  *(_OWORD *)uint64_t v43 = v89;
  uint64_t v67 = (uint64_t)v99;
  sub_220F11B30((uint64_t)v99);
  long long v68 = v100;
  uint64_t v69 = v105;
  v88(v100, v90, v105);
  char v70 = sub_220F30AC8();
  v42(v68, v69);
  v42((char *)v67, v69);
  if (v70)
  {
    id v71 = objc_msgSend(self, sel_systemBackgroundColor);
    uint64_t v72 = MEMORY[0x223C74C60](v71);
  }
  else
  {
    uint64_t v72 = sub_220F31FF8();
  }
  uint64_t v73 = v72;
  uint64_t v74 = swift_getKeyPath();
  uint64_t v75 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v76 = v108;
  sub_220F065AC(v66, v108, MEMORY[0x263F19048]);
  long long v77 = (uint64_t *)(v76 + *(int *)(v112 + 36));
  *long long v77 = v74;
  v77[1] = v73;
  sub_220F06614(v66, v75);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v78 = v104;
  sub_220D26548(v76, v104, &qword_267F304D8);
  uint64_t v79 = (_OWORD *)(v78 + *(int *)(v51 + 36));
  long long v80 = v117;
  *uint64_t v79 = v116;
  v79[1] = v80;
  v79[2] = v118;
  sub_220D25B68(v76, &qword_267F304D8);
  uint64_t v81 = v109;
  sub_220D39114(v78, v109, &qword_267F304E0);
  uint64_t v82 = v107;
  sub_220D26548(v65, v107, &qword_267F30890);
  uint64_t v83 = v110;
  sub_220D26548(v81, v110, &qword_267F304E0);
  uint64_t v84 = v111;
  sub_220D26548(v82, v111, &qword_267F30890);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30898);
  sub_220D26548(v83, v84 + *(int *)(v85 + 48), &qword_267F304E0);
  sub_220D25B68(v81, &qword_267F304E0);
  sub_220D25B68(v65, &qword_267F30890);
  sub_220D25B68(v83, &qword_267F304E0);
  return sub_220D25B68(v82, &qword_267F30890);
}

BOOL sub_220F04EC0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35C28);
  sub_220F32158();
  uint64_t v1 = *v0;
  if (v3 == 1)
  {
    if (v1 != 2)
    {
      if (v1 != 1)
      {
        if (!v1) {
          return 0;
        }
        goto LABEL_9;
      }
      return 1;
    }
  }
  else if (v1 != 2)
  {
    if (v1 != 1)
    {
      if (!v1) {
        return 0;
      }
      goto LABEL_9;
    }
    return 1;
  }
LABEL_9:
  if (v0[4]) {
    return 0;
  }
  return v0[3] == 5;
}

uint64_t sub_220F04F68()
{
  uint64_t v1 = sub_220F31238();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v5 = *(_OWORD *)(v0 + 48);
  v12[2] = *(_OWORD *)(v0 + 32);
  v12[3] = v5;
  uint64_t v13 = *(void *)(v0 + 64);
  long long v6 = *(_OWORD *)(v0 + 16);
  v12[0] = *(_OWORD *)v0;
  v12[1] = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BA0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_220F31348();
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 0;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35BA8);
  sub_220F02994((uint64_t)v12, (uint64_t)&v9[*(int *)(v10 + 44)]);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F19790], v1);
  sub_220D25FB0(&qword_267F35BB0, &qword_267F35BA0);
  sub_220F31C08();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_220D25B68((uint64_t)v9, &qword_267F35BA0);
}

uint64_t sub_220F05140@<X0>(uint64_t a1@<X8>)
{
  uint64_t v73 = a1;
  uint64_t v1 = sub_220F31EB8();
  uint64_t v68 = *(void *)(v1 - 8);
  uint64_t v69 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v67 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_220F30AD8();
  uint64_t v65 = *(void *)(v3 - 8);
  uint64_t v66 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v64 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v63 = (uint64_t)&v60 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A10);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v72 = (uint64_t)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v70 = (uint64_t)&v60 - v10;
  MEMORY[0x270FA5388](v11);
  uint64_t v71 = (uint64_t)&v60 - v12;
  uint64_t v13 = sub_220F30E58();
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v62 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (long long *)((char *)&v60 - v17);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED30);
  uint64_t v20 = v19 - 8;
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v74 = (uint64_t)&v60 - v24;
  char v25 = (char *)v18 + *(int *)(v14 + 28);
  unsigned int v61 = *MEMORY[0x263F19860];
  uint64_t v26 = v61;
  uint64_t v27 = sub_220F312A8();
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v27 - 8) + 104);
  v28(v25, v26, v27);
  __asm { FMOV            V0.2D, #12.0 }
  long long v60 = _Q0;
  *uint64_t v18 = _Q0;
  uint64_t v34 = sub_220F05744();
  uint64_t v35 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220F065AC((uint64_t)v18, (uint64_t)v22, MEMORY[0x263F19048]);
  *(void *)&v22[*(int *)(v20 + 60)] = v34;
  uint64_t v36 = *(int *)(v20 + 64);
  uint64_t v37 = (uint64_t)v22;
  uint64_t v38 = v62;
  *(_WORD *)(v37 + v36) = 256;
  sub_220F06614((uint64_t)v18, v35);
  sub_220D39114(v37, v74, &qword_267F2ED30);
  v28(&v38[*(int *)(v14 + 28)], v61, v27);
  *(_OWORD *)uint64_t v38 = v60;
  uint64_t v39 = v63;
  sub_220F11B30(v63);
  uint64_t v40 = v64;
  uint64_t v41 = v65;
  uint64_t v42 = v66;
  (*(void (**)(char *, void, uint64_t))(v65 + 104))(v64, *MEMORY[0x263F18508], v66);
  sub_220F30AC8();
  uint64_t v43 = *(void (**)(char *, uint64_t))(v41 + 8);
  v43(v40, v42);
  v43((char *)v39, v42);
  (*(void (**)(char *, void, uint64_t))(v68 + 104))(v67, *MEMORY[0x263F1B388], v69);
  uint64_t v44 = sub_220F32018();
  sub_220F30B18();
  uint64_t v45 = (uint64_t (*)(void))MEMORY[0x263F19048];
  uint64_t v46 = v70;
  sub_220F065AC((uint64_t)v38, v70, MEMORY[0x263F19048]);
  uint64_t v47 = v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A30) + 36);
  long long v48 = v76;
  *(_OWORD *)uint64_t v47 = v75;
  *(_OWORD *)(v47 + 16) = v48;
  *(void *)(v47 + 32) = v77;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30A38);
  *(void *)(v46 + *(int *)(v49 + 52)) = v44;
  *(_WORD *)(v46 + *(int *)(v49 + 56)) = 256;
  uint64_t v50 = sub_220F32468();
  uint64_t v52 = v51;
  long long v53 = (uint64_t *)(v46 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F30A40) + 36));
  *long long v53 = v50;
  v53[1] = v52;
  sub_220F06614((uint64_t)v38, v45);
  uint64_t v54 = v71;
  sub_220D39114(v46, v71, &qword_267F30A10);
  uint64_t v55 = v74;
  sub_220D26548(v74, v37, &qword_267F2ED30);
  uint64_t v56 = v72;
  sub_220D26548(v54, v72, &qword_267F30A10);
  uint64_t v57 = v73;
  sub_220D26548(v37, v73, &qword_267F2ED30);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B58);
  sub_220D26548(v56, v57 + *(int *)(v58 + 48), &qword_267F30A10);
  sub_220D25B68(v54, &qword_267F30A10);
  sub_220D25B68(v55, &qword_267F2ED30);
  sub_220D25B68(v56, &qword_267F30A10);
  return sub_220D25B68(v37, &qword_267F2ED30);
}

uint64_t sub_220F05744()
{
  uint64_t v1 = sub_220F30AD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v14 - v6;
  if ((*(unsigned char *)(v0 + *(int *)(type metadata accessor for exceptionsPlatter(0) + 20)) & 1) == 0)
  {
    id v12 = objc_msgSend(self, sel_secondarySystemGroupedBackgroundColor);
    JUMPOUT(0x223C74C60);
  }
  sub_220F11B30((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F18508], v1);
  char v8 = sub_220F30AC8();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v4, v1);
  v9(v7, v1);
  uint64_t v10 = self;
  if (v8) {
    id v11 = objc_msgSend(v10, sel_systemGroupedBackgroundColor);
  }
  else {
    id v11 = objc_msgSend(v10, sel_secondarySystemGroupedBackgroundColor);
  }
  return MEMORY[0x223C74C60](v11);
}

uint64_t sub_220F05910@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_220F32468();
  a1[1] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B50);
  return sub_220F05140((uint64_t)a1 + *(int *)(v3 + 44));
}

uint64_t sub_220F05954@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v1 = sub_220F31608();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B60);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B68);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  id v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35B70);
  uint64_t v14 = v13 - 8;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F31618();
  if (sub_220F31628()) {
    double v17 = 0.45;
  }
  else {
    double v17 = 1.0;
  }
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v8, v4, v1);
  *(double *)&v8[*(int *)(v6 + 44)] = v17;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (sub_220F31628()) {
    double v18 = 0.98;
  }
  else {
    double v18 = 1.0;
  }
  sub_220F32548();
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_220D26548((uint64_t)v8, (uint64_t)v12, &qword_267F35B60);
  uint64_t v23 = &v12[*(int *)(v10 + 44)];
  *(double *)uint64_t v23 = v18;
  *((double *)v23 + 1) = v18;
  *((void *)v23 + 2) = v20;
  *((void *)v23 + 3) = v22;
  sub_220D25B68((uint64_t)v8, &qword_267F35B60);
  uint64_t v24 = sub_220F324A8();
  char v25 = sub_220F31628();
  sub_220D26548((uint64_t)v12, (uint64_t)v16, &qword_267F35B68);
  uint64_t v26 = &v16[*(int *)(v14 + 44)];
  *(void *)uint64_t v26 = v24;
  v26[8] = v25 & 1;
  sub_220D25B68((uint64_t)v12, &qword_267F35B68);
  return sub_220D39114((uint64_t)v16, v29, &qword_267F35B70);
}

uint64_t sub_220F05C28()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F05C44()
{
  return sub_220D25FB0(&qword_267F35B78, &qword_267F35B80);
}

unint64_t sub_220F05C84()
{
  unint64_t result = qword_267F35B88;
  if (!qword_267F35B88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35B70);
    sub_220F061AC(&qword_267F35B90, &qword_267F35B68, (void (*)(void))sub_220F05D50);
    sub_220D25FB0(&qword_267F341E8, &qword_267F341F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35B88);
  }
  return result;
}

uint64_t sub_220F05D50()
{
  return sub_220F061AC(&qword_267F35B98, &qword_267F35B60, (void (*)(void))sub_220F05D80);
}

unint64_t sub_220F05D80()
{
  unint64_t result = qword_267F341E0;
  if (!qword_267F341E0)
  {
    sub_220F31608();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F341E0);
  }
  return result;
}

uint64_t sub_220F05DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  sub_220F32148();
  sub_220F32148();
  uint64_t result = sub_220F32148();
  *(void *)a4 = a1;
  *(unsigned char *)(a4 + 8) = v9;
  *(void *)(a4 + 16) = v10;
  *(void *)(a4 + 24) = a2;
  *(unsigned char *)(a4 + 32) = a3 & 1;
  *(unsigned char *)(a4 + 40) = v9;
  *(void *)(a4 + 48) = v10;
  *(unsigned char *)(a4 + 56) = v9;
  *(void *)(a4 + 64) = v10;
  return result;
}

uint64_t destroy for ExceptionsOnboardingView()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for ExceptionsOnboardingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ExceptionsOnboardingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ExceptionsOnboardingView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ExceptionsOnboardingView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 72)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ExceptionsOnboardingView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 72) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ExceptionsOnboardingView()
{
  return &type metadata for ExceptionsOnboardingView;
}

uint64_t sub_220F06178()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F061AC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_220F06228()
{
  unint64_t result = qword_267F35BF0;
  if (!qword_267F35BF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35BF8);
    sub_220F062C8();
    sub_220D25FB0(&qword_267F30800, (uint64_t *)&unk_267F33E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35BF0);
  }
  return result;
}

unint64_t sub_220F062C8()
{
  unint64_t result = qword_267F35C00;
  if (!qword_267F35C00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35C08);
    sub_220F06368();
    sub_220D25FB0(&qword_267F32FA8, &qword_267F32FB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35C00);
  }
  return result;
}

unint64_t sub_220F06368()
{
  unint64_t result = qword_267F35C10;
  if (!qword_267F35C10)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35C18);
    sub_220D2A4EC();
    sub_220D25FB0(&qword_267F30F08, (uint64_t *)&unk_267F33E60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35C10);
  }
  return result;
}

uint64_t sub_220F06418(uint64_t a1)
{
  return a1;
}

uint64_t sub_220F0649C(uint64_t a1)
{
  return a1;
}

uint64_t type metadata accessor for ExceptionsOnboardingView.OnboardingCard(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35C78);
}

uint64_t sub_220F06548(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ExceptionsOnboardingView.OnboardingCard(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220F065AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220F06614(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_220F06674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F06688);
}

uint64_t sub_220F06688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);
  return v5(a1, a2, v4);
}

uint64_t sub_220F066F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F0670C);
}

uint64_t sub_220F0670C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  return v5(a1, a2, a2, v4);
}

uint64_t sub_220F06780()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F06800()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220F06820()
{
  unint64_t result = qword_267F35CD8;
  if (!qword_267F35CD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35CC8);
    sub_220F068C0();
    sub_220D25FB0(&qword_267F2FEC0, &qword_267F2F310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35CD8);
  }
  return result;
}

unint64_t sub_220F068C0()
{
  unint64_t result = qword_267F35CE0;
  if (!qword_267F35CE0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35CA8);
    sub_220F06960();
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35CE0);
  }
  return result;
}

unint64_t sub_220F06960()
{
  unint64_t result = qword_267F35CE8;
  if (!qword_267F35CE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35CA0);
    sub_220D25FB0(&qword_267F35CF0, &qword_267F35C98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35CE8);
  }
  return result;
}

uint64_t sub_220F06A00()
{
  return sub_220DCE6A0();
}

uint64_t destroy for DrivingAutoreplyLink()
{
  swift_release();
  sub_220D359A4();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DrivingAutoreplyLink(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_220D35934();
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v10;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DrivingAutoreplyLink(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_220D35934();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_220D359A4();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DrivingAutoreplyLink(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = v5;
  sub_220D359A4();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DrivingAutoreplyLink(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DrivingAutoreplyLink(uint64_t result, int a2, int a3)
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DrivingAutoreplyLink()
{
  return &type metadata for DrivingAutoreplyLink;
}

uint64_t sub_220F06D18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F06D34()
{
  return sub_220F30C68();
}

uint64_t sub_220F06EE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for AutoReplyRow();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (void *)((char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for CarStatus();
  sub_220F09A08(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
  sub_220F30B08();
  swift_getKeyPath();
  sub_220F30CC8();
  swift_release();
  swift_release();
  if (*a1)
  {
    uint64_t v7 = v11[5];
    *(_OWORD *)uint64_t v11 = *(_OWORD *)&v11[3];
    swift_retain();
    id v8 = sub_220DE6F00();
    swift_release();
    *uint64_t v6 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = (char *)v6 + *(int *)(v4 + 20);
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v11;
    *((void *)v9 + 2) = v7;
    *(uint64_t *)((char *)v6 + *(int *)(v4 + 24)) = (uint64_t)v8;
    return sub_220F071F0((uint64_t)v6, a2);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F09A08((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F070F4()
{
  return sub_220F06D34();
}

uint64_t sub_220F07138@<X0>(uint64_t a1@<X8>)
{
  return sub_220F06EE4(*(void **)(v1 + 16), a1);
}

uint64_t type metadata accessor for AutoReplyRow()
{
  uint64_t result = qword_267F35D10;
  if (!qword_267F35D10) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_220F0718C()
{
  unint64_t result = qword_267F35D08;
  if (!qword_267F35D08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35D08);
  }
  return result;
}

uint64_t sub_220F071F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutoReplyRow();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *initializeBufferWithCopyOfBuffer for AutoReplyView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for AutoReplyView()
{
  return swift_release();
}

void *assignWithCopy for AutoReplyView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for AutoReplyView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for AutoReplyView()
{
  return &type metadata for AutoReplyView;
}

uint64_t *sub_220F07314(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F31318();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (uint64_t *)((char *)v4 + v9);
    id v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    v11[2] = v12[2];
    *(uint64_t *)((char *)v4 + v10) = *(uint64_t *)((char *)a2 + v10);
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

void *sub_220F07458(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F31318();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  void v9[2] = v10[2];
  *(void *)((char *)a1 + v8) = *(void *)((char *)a2 + v8);
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_220F07550(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_220E791EC((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  swift_retain();
  swift_release();
  return a1;
}

char *sub_220F07688(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F31318();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((void *)v10 + 2) = *((void *)v11 + 2);
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *sub_220F07774(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_220E791EC((uint64_t)a1);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F31318();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_release();
  return a1;
}

uint64_t sub_220F0789C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F078B0);
}

uint64_t sub_220F078B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_220F07978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F0798C);
}

uint64_t sub_220F0798C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_220F07A50()
{
  sub_220DD4B48();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_220F07AF0()
{
  return sub_220D25FB0(&qword_267F35D20, &qword_267F35D28);
}

uint64_t sub_220F07B2C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F07B48@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for AutoReplyRow();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x270FA5388](v3 - 8);
  sub_220F097D4(v1, (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  sub_220F071F0((uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  uint64_t v8 = sub_220F31228();
  uint64_t v9 = sub_220F31358();
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  unint64_t v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35D30);
  uint64_t v11 = (char *)a1 + v10[9];
  uint64_t result = swift_getKeyPath();
  *(void *)uint64_t v11 = result;
  v11[8] = 0;
  uint64_t v13 = (char *)a1 + v10[10];
  *(void *)uint64_t v13 = 0;
  v13[8] = 0;
  uint64_t v14 = (char *)a1 + v10[11];
  *(void *)uint64_t v14 = 0;
  v14[8] = 0;
  uint64_t v15 = (uint64_t (**)@<X0>(uint64_t@<X8>))((char *)a1 + v10[12]);
  *uint64_t v15 = sub_220F09970;
  v15[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v7;
  uint64_t v16 = (char *)a1 + v10[13];
  *(void *)uint64_t v16 = v8;
  v16[8] = 0;
  double v17 = (char *)a1 + v10[14];
  *(void *)double v17 = v9;
  v17[8] = 0;
  return result;
}

uint64_t sub_220F07CEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = sub_220F31228();
  sub_220F07F30((uint64_t)&v35);
  uint64_t v28 = *((void *)&v35 + 1);
  uint64_t v29 = v35;
  char v27 = v36;
  uint64_t v30 = v37;
  uint64_t v32 = v38;
  char v31 = v39;
  uint64_t v4 = (long long *)(a1 + *(int *)(type metadata accessor for AutoReplyRow() + 20));
  long long v5 = *v4;
  uint64_t v6 = *((void *)v4 + 2);
  long long v35 = v5;
  uint64_t v36 = v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D38);
  MEMORY[0x223C75070](&v34, v7);
  *(void *)&long long v35 = sub_220F080F4(v34);
  *((void *)&v35 + 1) = v8;
  sub_220D292B8();
  uint64_t v9 = sub_220F31B28();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  sub_220F318C8();
  uint64_t v14 = sub_220F31AF8();
  uint64_t v16 = v15;
  char v18 = v17;
  swift_release();
  sub_220D357E0(v9, v11, v13);
  swift_bridgeObjectRelease();
  LODWORD(v35) = sub_220F315B8();
  uint64_t v19 = sub_220F31AA8();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  sub_220D357E0(v14, v16, v18 & 1);
  swift_bridgeObjectRelease();
  LOBYTE(v35) = v27;
  *(void *)a2 = v33;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = v29;
  *(void *)(a2 + 32) = v28;
  *(unsigned char *)(a2 + 40) = v27;
  *(void *)(a2 + 48) = v30;
  *(void *)(a2 + 56) = v32;
  *(unsigned char *)(a2 + 64) = v31;
  *(void *)(a2 + 72) = 0;
  *(unsigned char *)(a2 + 80) = 1;
  *(void *)(a2 + 88) = v19;
  *(void *)(a2 + 96) = v21;
  *(unsigned char *)(a2 + 104) = v25;
  *(void *)(a2 + 112) = v23;
  sub_220D3570C(v29, v28, v27);
  swift_bridgeObjectRetain();
  sub_220D3570C(v19, v21, v25);
  swift_bridgeObjectRetain();
  sub_220D357E0(v19, v21, v25);
  swift_bridgeObjectRelease();
  sub_220D357E0(v29, v28, v35);
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F07F30@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  sub_220F30408();
  sub_220D292B8();
  uint64_t v2 = sub_220F31B28();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_220F318C8();
  uint64_t v7 = sub_220F31AF8();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_220D357E0(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_220F31FE8();
  uint64_t v13 = sub_220F31A98();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_220D357E0(v7, v9, v12);
  swift_bridgeObjectRelease();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = 0;
  *(unsigned char *)(a1 + 40) = 0;
  sub_220D3570C(v13, v15, v17 & 1);
  swift_bridgeObjectRetain();
  sub_220D357E0(v13, v15, v17 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F080F4(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      if (qword_267F2E160 != -1) {
        goto LABEL_11;
      }
      goto LABEL_10;
    case 2:
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 3:
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 4:
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
LABEL_11:
      swift_once();
LABEL_10:
      uint64_t result = sub_220F30408();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_220F082E0@<X0>(char *a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D50);
  uint64_t v46 = *(void *)(v1 - 8);
  uint64_t v47 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v50 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v49 = (char *)&v41 - v4;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D58);
  uint64_t v42 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v43 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  long long v48 = (char *)&v41 - v7;
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v55 = sub_220F30408();
  uint64_t v56 = v8;
  sub_220D292B8();
  uint64_t v60 = sub_220F31B28();
  uint64_t v61 = v9;
  char v62 = v10 & 1;
  uint64_t v63 = v11;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_220F309B8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v55 = sub_220F08908(v55);
  uint64_t v56 = v12;
  uint64_t v13 = sub_220F31B28();
  uint64_t v41 = (uint64_t)&v41;
  uint64_t v55 = v13;
  uint64_t v56 = v14;
  char v57 = v15 & 1;
  uint64_t v58 = v16;
  __int16 v59 = 256;
  MEMORY[0x270FA5388](v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAB0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35D68);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35D70);
  uint64_t v19 = sub_220F311B8();
  uint64_t v20 = sub_220D25FB0(&qword_267F35D78, &qword_267F35D70);
  uint64_t v51 = v18;
  uint64_t v52 = v19;
  uint64_t v53 = v20;
  uint64_t v54 = MEMORY[0x263F19670];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v51 = v17;
  uint64_t v52 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_220D2A4EC();
  uint64_t v22 = v48;
  sub_220F32378();
  uint64_t v55 = sub_220F30408();
  uint64_t v56 = v23;
  uint64_t v55 = sub_220F31B28();
  uint64_t v56 = v24;
  char v57 = v25 & 1;
  uint64_t v58 = v26;
  MEMORY[0x270FA5388](v55);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D80);
  sub_220D25FB0(&qword_267F35D88, &qword_267F35D80);
  char v27 = v49;
  sub_220F32368();
  uint64_t v28 = v42;
  uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  uint64_t v30 = v43;
  uint64_t v31 = v44;
  v29(v43, v22, v44);
  uint64_t v33 = v46;
  uint64_t v32 = v47;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
  v34(v50, v27, v47);
  long long v35 = v45;
  v29(v45, v30, v31);
  uint64_t v36 = &v35[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35D90) + 48)];
  uint64_t v37 = v50;
  v34(v36, v50, v32);
  uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
  v38(v49, v32);
  char v39 = *(void (**)(char *, uint64_t))(v28 + 8);
  v39(v48, v31);
  v38(v37, v32);
  return ((uint64_t (*)(char *, uint64_t))v39)(v30, v31);
}

uint64_t sub_220F08908(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      if (qword_267F2E160 != -1) {
        goto LABEL_11;
      }
      goto LABEL_10;
    case 2:
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 3:
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    case 4:
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
LABEL_11:
      swift_once();
LABEL_10:
      uint64_t result = sub_220F30408();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t sub_220F08AF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_220F311B8();
  uint64_t v19 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D70);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D68);
  uint64_t v17 = *(void *)(v8 - 8);
  uint64_t v18 = v8;
  MEMORY[0x270FA5388](v8);
  char v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_220F30408();
  uint64_t v27 = v11;
  type metadata accessor for CarStatus();
  sub_220F09A08(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
  sub_220F30CB8();
  swift_getKeyPath();
  sub_220F30CC8();
  swift_release();
  swift_release();
  long long v24 = v21;
  uint64_t v25 = v22;
  type metadata accessor for CARAutoReplyAudience(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35DA8);
  sub_220F09A08(&qword_267F35DB0, type metadata accessor for CARAutoReplyAudience);
  sub_220D25FB0(&qword_267F35DB8, &qword_267F35DA8);
  sub_220D292B8();
  sub_220F32228();
  sub_220F311A8();
  uint64_t v12 = sub_220D25FB0(&qword_267F35D78, &qword_267F35D70);
  uint64_t v13 = MEMORY[0x263F19670];
  sub_220F31BD8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)&long long v21 = v4;
  *((void *)&v21 + 1) = v1;
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v18;
  sub_220F31C18();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v10, v14);
}

uint64_t sub_220F08F70@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  sub_220F30408();
  sub_220D292B8();
  uint64_t v2 = sub_220F31B28();
  uint64_t v31 = v3;
  uint64_t v32 = v2;
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_220F30408();
  uint64_t v28 = sub_220F31B28();
  uint64_t v29 = v8;
  uint64_t v30 = v9;
  char v11 = v10 & 1;
  sub_220F30408();
  uint64_t v12 = sub_220F31B28();
  uint64_t v25 = v13;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  char v16 = v15 & 1;
  uint64_t v33 = sub_220F30408();
  uint64_t v17 = sub_220F31B28();
  uint64_t v23 = v18;
  uint64_t v24 = v17;
  char v20 = v19 & 1;
  *(void *)a1 = v32;
  *(void *)(a1 + 8) = v31;
  *(unsigned char *)(a1 + 16) = v7;
  *(_DWORD *)(a1 + 20) = *(_DWORD *)((char *)&v33 + 3);
  *(_DWORD *)(a1 + 17) = v33;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = 1;
  *(unsigned char *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)&v46[3];
  *(_DWORD *)(a1 + 41) = *(_DWORD *)v46;
  *(void *)(a1 + 48) = 1;
  *(_WORD *)(a1 + 56) = 0;
  *(_WORD *)(a1 + 62) = v45;
  *(_DWORD *)(a1 + 58) = v44;
  *(void *)(a1 + 64) = v28;
  *(void *)(a1 + 72) = v29;
  *(unsigned char *)(a1 + 80) = v11;
  *(_DWORD *)(a1 + 84) = *(_DWORD *)&v43[3];
  *(_DWORD *)(a1 + 81) = *(_DWORD *)v43;
  *(void *)(a1 + 88) = v30;
  *(void *)(a1 + 96) = 3;
  *(unsigned char *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 108) = *(_DWORD *)&v42[3];
  *(_DWORD *)(a1 + 105) = *(_DWORD *)v42;
  *(void *)(a1 + 112) = 3;
  *(_WORD *)(a1 + 120) = 0;
  *(_WORD *)(a1 + 126) = v41;
  *(_DWORD *)(a1 + 122) = v40;
  *(void *)(a1 + 128) = v26;
  *(void *)(a1 + 136) = v25;
  *(unsigned char *)(a1 + 144) = v16;
  *(_DWORD *)(a1 + 148) = *(_DWORD *)&v39[3];
  *(_DWORD *)(a1 + 145) = *(_DWORD *)v39;
  *(void *)(a1 + 152) = v27;
  *(void *)(a1 + 160) = 4;
  *(unsigned char *)(a1 + 168) = 0;
  *(_DWORD *)(a1 + 172) = *(_DWORD *)&v38[3];
  *(_DWORD *)(a1 + 169) = *(_DWORD *)v38;
  *(void *)(a1 + 176) = 4;
  *(_WORD *)(a1 + 184) = 0;
  *(_WORD *)(a1 + 190) = v37;
  *(_DWORD *)(a1 + 186) = v36;
  *(void *)(a1 + 192) = v17;
  *(void *)(a1 + 200) = v18;
  *(unsigned char *)(a1 + 208) = v19 & 1;
  *(_DWORD *)(a1 + 212) = *(_DWORD *)&v35[3];
  *(_DWORD *)(a1 + 209) = *(_DWORD *)v35;
  *(void *)(a1 + 216) = v21;
  *(void *)(a1 + 224) = 2;
  *(unsigned char *)(a1 + 232) = 0;
  *(_DWORD *)(a1 + 236) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a1 + 233) = *(_DWORD *)v34;
  *(void *)(a1 + 240) = 2;
  *(_WORD *)(a1 + 248) = 0;
  sub_220D3570C(v32, v31, v7);
  swift_bridgeObjectRetain();
  sub_220D3570C(v28, v29, v11);
  swift_bridgeObjectRetain();
  sub_220D3570C(v26, v25, v16);
  swift_bridgeObjectRetain();
  sub_220D3570C(v24, v23, v20);
  swift_bridgeObjectRetain();
  sub_220D357E0(v24, v23, v20);
  swift_bridgeObjectRelease();
  sub_220D357E0(v26, v25, v16);
  swift_bridgeObjectRelease();
  sub_220D357E0(v28, v29, v11);
  swift_bridgeObjectRelease();
  sub_220D357E0(v32, v31, v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F093B0@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_220F32468();
  a1[1] = v2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35D98);
  return sub_220F09408((char *)a1 + *(int *)(v3 + 44));
}

uint64_t sub_220F09408@<X0>(char *a1@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v1 = sub_220F30AB8();
  uint64_t v31 = *(void *)(v1 - 8);
  uint64_t v2 = v31;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v32 = (char *)&v31 - v6;
  type metadata accessor for CarStatus();
  sub_220F09A08(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
  sub_220F30CB8();
  swift_getKeyPath();
  sub_220F30CC8();
  swift_release();
  swift_release();
  sub_220F30AA8();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_220F309B8();
  swift_release();
  swift_release();
  swift_release();
  sub_220D292B8();
  uint64_t v7 = sub_220F31B28();
  uint64_t v9 = v8;
  char v11 = v10;
  uint64_t v13 = v12;
  char v14 = sub_220F31818();
  sub_220F30A88();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  uint64_t v24 = v32;
  v23(v4, v32, v1);
  LOBYTE(v35) = v11 & 1;
  char v34 = 0;
  uint64_t v25 = v33;
  v23(v33, v4, v1);
  uint64_t v26 = &v25[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35DA0) + 48)];
  char v27 = v35;
  char v28 = v34;
  *(void *)uint64_t v26 = v7;
  *((void *)v26 + 1) = v9;
  v26[16] = v27;
  *((void *)v26 + 3) = v13;
  *((void *)v26 + 4) = 0;
  v26[40] = v14;
  *((void *)v26 + 6) = v16;
  *((void *)v26 + 7) = v18;
  *((void *)v26 + 8) = v20;
  *((void *)v26 + 9) = v22;
  v26[80] = v28;
  sub_220D3570C(v7, v9, v27);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v31 + 8);
  swift_bridgeObjectRetain();
  v29(v24, v1);
  sub_220D357E0(v7, v9, v35);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v29)(v4, v1);
}

uint64_t sub_220F09720()
{
  return sub_220F31A28();
}

uint64_t sub_220F097B8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F097D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AutoReplyRow();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_220F09838()
{
  uint64_t v1 = *(void *)(type metadata accessor for AutoReplyRow() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F31318();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220F09970@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for AutoReplyRow() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_220F07CEC(v4, a1);
}

uint64_t sub_220F099E8@<X0>(char *a1@<X8>)
{
  return sub_220F082E0(a1);
}

uint64_t sub_220F099F0@<X0>(uint64_t a1@<X8>)
{
  return sub_220F08AF0(a1);
}

uint64_t sub_220F099F8@<X0>(uint64_t *a1@<X8>)
{
  return sub_220F093B0(a1);
}

uint64_t sub_220F09A08(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220F09A50()
{
  return sub_220D25FB0(&qword_267F35DC0, &qword_267F35D30);
}

uint64_t sub_220F09A8C()
{
  return sub_220D25FB0(&qword_267F35DC8, &qword_267F35DD0);
}

uint64_t _s8SentinelCMa()
{
  return self;
}

id sub_220F09AF0()
{
  _s8SentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_267F41ED0 = (uint64_t)result;
  return result;
}

uint64_t *sub_220F09B48(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    char v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[6];
    uint64_t v13 = a3[7];
    char v14 = (char *)a1 + v12;
    uint64_t v15 = (char *)a2 + v12;
    uint64_t v16 = *((void *)v15 + 1);
    *(void *)char v14 = *(void *)v15;
    *((void *)v14 + 1) = v16;
    v14[16] = v15[16];
    uint64_t v17 = (uint64_t *)((char *)a1 + v13);
    uint64_t v18 = (uint64_t *)((char *)a2 + v13);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_220F315C8();
      uint64_t v20 = *(void *)(v19 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
      {
        uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      }
    }
    else
    {
      void *v17 = *v18;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_220F09DD0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  uint64_t v6 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F315C8();
    uint64_t v10 = *(void *)(v7 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
    if (!result)
    {
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
      return v9(v6, v7);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

void *sub_220F09F8C(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  char v14 = (char *)a2 + v11;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = v15;
  v13[16] = v14[16];
  uint64_t v16 = (void *)((char *)a1 + v12);
  uint64_t v17 = (void *)((char *)a2 + v12);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_220F315C8();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  else
  {
    void *v16 = *v17;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_220F0A1C4(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_220D25B68((uint64_t)a1 + v6, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  v11[16] = v12[16];
  if (a1 != a2)
  {
    uint64_t v13 = a3[7];
    char v14 = (void *)((char *)a1 + v13);
    uint64_t v15 = (void *)((char *)a2 + v13);
    sub_220D25B68((uint64_t)a1 + v13, &qword_267F32358);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_220F315C8();
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      }
    }
    else
    {
      void *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_220F0A460(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F30AD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v11;
  char v14 = (char *)a2 + v11;
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  uint64_t v15 = (char *)a1 + v12;
  uint64_t v16 = (char *)a2 + v12;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = sub_220F315C8();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
      memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v15, v16, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
  }
  return a1;
}

void *sub_220F0A6A0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_220D25B68((uint64_t)a1 + v6, &qword_267F33C90);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220F30AD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  v12[16] = v13[16];
  if (a1 != a2)
  {
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    sub_220D25B68((uint64_t)a1 + v14, &qword_267F32358);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_220F315C8();
      uint64_t v19 = *(void *)(v18 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18))
      {
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32370);
        memcpy(v15, v16, *(void *)(*(void *)(v20 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v15, v16, v18);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v15, 0, 1, v18);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_220F0A93C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F0A950);
}

uint64_t sub_220F0A950(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + a3[5];
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v12 = *(void *)(a1 + a3[6] + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32380);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a3[7];
    return v14(v16, a2, v15);
  }
}

uint64_t sub_220F0AA8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F0AAA0);
}

uint64_t sub_220F0AAA0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + a4[5];
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F32380);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + a4[7];
    return v14(v16, a2, a2, v15);
  }
  return result;
}

uint64_t type metadata accessor for FocusNameAndAppearanceView(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35DE0);
}

void sub_220F0ABFC()
{
  sub_220E43A38(319, (unint64_t *)&qword_267F2FD98, MEMORY[0x263F18520]);
  if (v0 <= 0x3F)
  {
    sub_220EFD680();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_220F0ACF4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    uint64_t v7 = a1;
    a1[1] = a2[1];
    uint64_t v8 = a3[5];
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    }
    else
    {
      void *v9 = *v10;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v12 = a3[6];
    uint64_t v13 = (uint64_t *)((char *)v7 + v12);
    uint64_t v14 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      void *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    uint64_t v18 = (char *)v7 + v16;
    uint64_t v19 = (char *)a2 + v16;
    *uint64_t v18 = *v19;
    *((void *)v18 + 1) = *((void *)v19 + 1);
    uint64_t v20 = (char *)v7 + v17;
    uint64_t v21 = (char *)a2 + v17;
    *uint64_t v20 = *v21;
    *((void *)v20 + 1) = *((void *)v21 + 1);
    swift_retain();
  }
  swift_retain();
  return v7;
}

uint64_t sub_220F0AEEC(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F31318();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return swift_release();
}

void *sub_220F0B024(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F31318();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (char *)a1 + v15;
  uint64_t v18 = (char *)a2 + v15;
  char *v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  uint64_t v19 = (char *)a1 + v16;
  uint64_t v20 = (char *)a2 + v16;
  *uint64_t v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_220F0B1CC(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_220D25B68((uint64_t)a1 + v6, (uint64_t *)&unk_267F2E250);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220F31318();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)((char *)a1 + v10);
    uint64_t v12 = (void *)((char *)a2 + v10);
    sub_220D25B68((uint64_t)a1 + v10, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *uint64_t v15 = *v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_retain();
  swift_release();
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *uint64_t v18 = *v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_220F0B3C8(_OWORD *a1, _OWORD *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_220F31318();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_220F30AD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v16) = *(_OWORD *)((char *)a2 + v16);
  return a1;
}

void *sub_220F0B560(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  if (a1 != a2)
  {
    uint64_t v6 = a3[5];
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_220D25B68((uint64_t)a1 + v6, (uint64_t *)&unk_267F2E250);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_220F31318();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = a3[6];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    sub_220D25B68((uint64_t)a1 + v11, &qword_267F33C90);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_220F30AD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  char *v17 = *v18;
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  uint64_t v19 = a3[8];
  uint64_t v20 = (char *)a1 + v19;
  uint64_t v21 = (char *)a2 + v19;
  *uint64_t v20 = *v21;
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_release();
  return a1;
}

uint64_t sub_220F0B764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F0B778);
}

uint64_t sub_220F0B778(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
    uint64_t v10 = *(void *)(v9 - 8);
    if (*(_DWORD *)(v10 + 84) == a2)
    {
      uint64_t v11 = v9;
      uint64_t v12 = (char *)a1 + *(int *)(a3 + 20);
      uint64_t v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
      return v13(v12, a2, v11);
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
      uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
      uint64_t v16 = v14;
      uint64_t v17 = (char *)a1 + *(int *)(a3 + 24);
      return v15(v17, a2, v16);
    }
  }
}

uint64_t sub_220F0B8B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F0B8CC);
}

void *sub_220F0B8CC(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *uint64_t result = a2;
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

uint64_t type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F35DF0);
}

void sub_220F0BA20()
{
  sub_220E43A38(319, (unint64_t *)&qword_267F2EAF8, MEMORY[0x263F19A00]);
  if (v0 <= 0x3F)
  {
    sub_220E43A38(319, (unint64_t *)&qword_267F2FD98, MEMORY[0x263F18520]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t sub_220F0BB30()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_220F0BB4C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BE94(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F2F018, &qword_267F2EFF8).n128_u64[0];
  return result;
}

double sub_220F0BBA8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BC0C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, (uint64_t (*)(void))type metadata accessor for HomeScreenPageView, &qword_267F2F370).n128_u64[0];
  return result;
}

__n128 sub_220F0BC0C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t (*a16)(void), uint64_t *a17)
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
    sub_220F329E8();
    char v28 = (void *)sub_220F317D8();
    sub_220F308F8();

    uint64_t v19 = a17;
  }
  sub_220F30E68();
  sub_220F13060(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *uint64_t v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

double sub_220F0BDDC@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0C79C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F30430, &qword_267F30438).n128_u64[0];
  return result;
}

double sub_220F0BE38@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BE94(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F30418, &qword_267F30420).n128_u64[0];
  return result;
}

__n128 sub_220F0BE94@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
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
    sub_220F329E8();
    char v28 = (void *)sub_220F317D8();
    sub_220F308F8();

    uint64_t v19 = a17;
  }
  sub_220F30E68();
  sub_220D26548(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *uint64_t v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_220F0C064@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_220F329E8();
    uint64_t v23 = (void *)sub_220F317D8();
    sub_220F308F8();
  }
  sub_220F30E68();
  long long v24 = v13[1];
  long long v36 = *v13;
  long long v37 = v24;
  sub_220F134CC((uint64_t)&v36, (uint64_t)v39);
  uint64_t v38 = *((void *)&v37 + 1);
  uint64_t v34 = *((void *)v13 + 4);
  char v35 = *((unsigned char *)v13 + 40);
  long long v25 = v13[1];
  *a9 = *v13;
  a9[1] = v25;
  *(_OWORD *)((char *)a9 + 25) = *(long long *)((char *)v13 + 25);
  a9[8] = v32;
  a9[9] = v33;
  a9[3] = v27;
  a9[4] = v28;
  a9[6] = v30;
  a9[7] = v31;
  a9[5] = v29;
  sub_220F13528((uint64_t)v39);
  sub_220D824A0((uint64_t)&v38);
  return sub_220D46C10((uint64_t)&v34);
}

uint64_t sub_220F0C240@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_220F329E8();
    uint64_t v23 = (void *)sub_220F317D8();
    sub_220F308F8();
  }
  sub_220F30E68();
  long long v24 = v13[7];
  a9[6] = v13[6];
  a9[7] = v24;
  *(_OWORD *)((char *)a9 + 121) = *(_OWORD *)((char *)v13 + 121);
  long long v25 = v13[3];
  a9[2] = v13[2];
  a9[3] = v25;
  long long v26 = v13[5];
  a9[4] = v13[4];
  a9[5] = v26;
  long long v27 = v13[1];
  *a9 = *v13;
  a9[1] = v27;
  a9[13] = v33;
  a9[14] = v34;
  a9[15] = v35;
  a9[9] = v29;
  a9[10] = v30;
  a9[11] = v31;
  a9[12] = v32;
  return sub_220E33C54((uint64_t)v13);
}

double sub_220F0C410@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BE94(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F32898, &qword_267F328A0).n128_u64[0];
  return result;
}

double sub_220F0C46C@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BE94(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F329C8, &qword_267F329D0).n128_u64[0];
  return result;
}

double sub_220F0C4C8@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BE94(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F33578, &qword_267F33570).n128_u64[0];
  return result;
}

uint64_t sub_220F0C524@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_220F329E8();
    uint64_t v23 = (void *)sub_220F317D8();
    sub_220F308F8();
  }
  sub_220F30E68();
  uint64_t v24 = *v13;
  long long v36 = *(_OWORD *)(v13 + 1);
  uint64_t v38 = v24;
  sub_220D39114((uint64_t)&v36 + 8, (uint64_t)v37, &qword_267F35EF8);
  long long v34 = *(_OWORD *)(v13 + 3);
  sub_220D39114((uint64_t)&v34 + 8, (uint64_t)v35, &qword_267F35F00);
  long long v25 = *((_OWORD *)v13 + 1);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 88) = v30;
  *(_OWORD *)(a9 + 104) = v31;
  *(_OWORD *)(a9 + 120) = v32;
  *(_OWORD *)(a9 + 136) = v33;
  *(_OWORD *)(a9 + 40) = v27;
  *(_OWORD *)(a9 + 56) = v28;
  *(void *)(a9 + 32) = v13[4];
  *(_OWORD *)(a9 + 72) = v29;
  sub_220D46C10((uint64_t)&v38);
  swift_retain();
  sub_220D46C10((uint64_t)v37);
  swift_retain();
  return sub_220D46C10((uint64_t)v35);
}

double sub_220F0C740@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  *(void *)&double result = sub_220F0BE94(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_267F35130, &qword_267F35120).n128_u64[0];
  return result;
}

__n128 sub_220F0C79C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a16;
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
    sub_220F329E8();
    long long v28 = (void *)sub_220F317D8();
    sub_220F308F8();

    uint64_t v19 = a16;
  }
  sub_220F30E68();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 16))(a9, v17, v29);
  long long v30 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(a17) + 36));
  v30[4] = v36;
  v30[5] = v37;
  v30[6] = v38;
  *long long v30 = v32;
  v30[1] = v33;
  __n128 result = v35;
  v30[2] = v34;
  v30[3] = v35;
  return result;
}

void sub_220F0C998()
{
  qword_267F35DD8 = 0x404E000000000000;
}

uint64_t sub_220F0C9A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F304C0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
  sub_220F32D38();
  swift_bridgeObjectRelease();
  unint64_t v8 = 0xD00000000000002FLL;
  unint64_t v9 = 0x8000000220F48A20;
  sub_220F0CB10();
  sub_220F327E8();
  swift_bridgeObjectRelease();
  sub_220F30538();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_220F30548();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (result != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_220F0CB10()
{
  uint64_t v1 = *v0;
  if (!*v0)
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E88();
    __break(1u);
    JUMPOUT(0x220F0D334);
  }
  if (*(void *)(v1 + 24))
  {
    swift_retain();
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_220F309B8();
    swift_release();
    swift_release();
    uint64_t v2 = swift_allocObject();
    swift_weakInit();
    type metadata accessor for ActivityConfigurationManager();
    swift_allocObject();
    *(void *)(v1 + 24) = sub_220D06AF4(v16, v17, (uint64_t)sub_220D2A5A0, v2);
    swift_retain();
    swift_release();
  }
  swift_retain();
  id v3 = sub_220D07240();
  swift_release();
  if (v3)
  {
    id v4 = objc_msgSend(v3, sel_mode);

    id v5 = objc_msgSend(v4, sel_semanticType);
    swift_release();

    switch((unint64_t)v5)
    {
      case 0uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 1uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 2uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 3uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 4uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 5uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 6uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 7uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 8uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
        goto LABEL_38;
      case 9uLL:
        if (qword_267F2E160 == -1) {
          goto LABEL_36;
        }
LABEL_38:
        swift_once();
LABEL_36:
        uint64_t v14 = sub_220F30408();
        break;
      default:
        goto LABEL_10;
    }
  }
  else
  {
    swift_release();
LABEL_10:
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    sub_220F30408();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F33B30);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_220F35110;
    if (*(void *)(v1 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v7 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v1 + 24) = sub_220D06AF4(v16, v17, (uint64_t)sub_220D2A5A0, v7);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v8 = sub_220D07240();
    unint64_t v9 = v8;
    if (v8)
    {
      id v10 = objc_msgSend(v8, sel_mode, 0xE000000000000000);

      id v11 = objc_msgSend(v10, sel_name);
      unint64_t v9 = (void *)sub_220F32768();
      unint64_t v13 = v12;
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      unint64_t v13 = 0xE000000000000000;
    }
    *(void *)(v6 + 56) = MEMORY[0x263F8D310];
    *(void *)(v6 + 64) = sub_220D2A5A8();
    *(void *)(v6 + 32) = v9;
    *(void *)(v6 + 40) = v13;
    uint64_t v14 = sub_220F32738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v14;
}

uint64_t sub_220F0D35C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v60 = a1;
  uint64_t v3 = sub_220F32618();
  uint64_t v71 = *(void *)(v3 - 8);
  uint64_t v72 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v70 = (void *)((char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for FocusNameAndAppearanceView(0);
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v6 = *(void *)(v68 + 64);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E10);
  MEMORY[0x270FA5388](v7);
  unint64_t v9 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35E18);
  uint64_t v10 = *((void *)v69 - 1);
  MEMORY[0x270FA5388](v69);
  unint64_t v12 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E20);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E28);
  MEMORY[0x270FA5388](v59);
  uint64_t v58 = (char *)v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)unint64_t v9 = sub_220F31348();
  *((void *)v9 + 1) = 0;
  unsigned char v9[16] = 1;
  uint64_t v17 = (uint64_t)&v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F35E30) + 44)];
  char v57 = v2;
  sub_220F0DE04(v2, v17);
  sub_220F13060((uint64_t)v2, (uint64_t)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FocusNameAndAppearanceView);
  unint64_t v18 = (*(unsigned __int8 *)(v68 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v68 + 80);
  uint64_t v19 = swift_allocObject();
  sub_220F125E4((uint64_t)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18);
  sub_220D25FB0(&qword_267F35E38, &qword_267F35E10);
  sub_220F31C28();
  swift_release();
  sub_220D25B68((uint64_t)v9, &qword_267F35E10);
  uint64_t v20 = sub_220F32468();
  __n128 v22 = sub_220F0C79C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v15, 0.0, 1, INFINITY, 0, v20, v21, &qword_267F35E18, &qword_267F35E20);
  (*(void (**)(char *, char *, __n128))(v10 + 8))(v12, v69, v22);
  sub_220F12660();
  sub_220F31C38();
  sub_220D25B68((uint64_t)v15, &qword_267F35E20);
  uint64_t v23 = v70;
  *uint64_t v70 = 0xD00000000000001CLL;
  v23[1] = 0x8000000220F46B60;
  (*(void (**)(void))(v71 + 104))();
  uint64_t v56 = sub_220F304D8();
  uint64_t v68 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v69 = (char *)v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_220F32718();
  uint64_t v67 = *(void *)(*(void *)(v25 - 8) + 64);
  MEMORY[0x270FA5388](v25 - 8);
  unint64_t v66 = (v26 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_220F326B8();
  uint64_t v27 = sub_220F30678();
  uint64_t v65 = *(void *)(*(void *)(v27 - 8) + 64);
  MEMORY[0x270FA5388](v27 - 8);
  unint64_t v64 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_220F30668();
  uint64_t v29 = sub_220F304C8();
  uint64_t v63 = *(void *)(*(void *)(v29 - 8) + 64);
  __n128 v30 = MEMORY[0x270FA5388](v29);
  unint64_t v62 = (v31 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v32 = *MEMORY[0x263F06D10];
  long long v34 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v33 + 104);
  v52[0] = v33 + 104;
  uint64_t v61 = v34;
  unsigned int v53 = v32;
  uint64_t v54 = v29;
  v34((char *)v52 - v62, v32, v29, v30);
  sub_220F304E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33D10);
  uint64_t v35 = swift_allocObject();
  uint64_t v55 = v35;
  *(_OWORD *)(v35 + 16) = xmmword_220F35390;
  MEMORY[0x270FA5388](v35);
  uint64_t v36 = sub_220F326B8();
  MEMORY[0x270FA5388](v36);
  uint64_t v37 = sub_220F30668();
  __n128 v38 = MEMORY[0x270FA5388](v37);
  v61((char *)v52 - v62, v32, v29, v38);
  sub_220F304E8();
  uint64_t v39 = sub_220F326F8();
  v52[1] = v52;
  MEMORY[0x270FA5388](v39 - 8);
  sub_220F326E8();
  sub_220F326D8();
  sub_220F0CB10();
  sub_220F326C8();
  swift_bridgeObjectRelease();
  uint64_t v40 = sub_220F326D8();
  MEMORY[0x270FA5388](v40);
  uint64_t v41 = sub_220F32708();
  MEMORY[0x270FA5388](v41);
  uint64_t v42 = sub_220F30668();
  __n128 v43 = MEMORY[0x270FA5388](v42);
  v61((char *)v52 - v62, v53, v54, v43);
  sub_220F304E8();
  uint64_t v44 = sub_220F30548();
  uint64_t v45 = *(void *)(v44 - 8);
  MEMORY[0x270FA5388](v44);
  uint64_t v47 = (char *)v52 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F0C9A8((uint64_t)v47);
  sub_220F1273C();
  uint64_t v49 = v69;
  long long v48 = v70;
  uint64_t v50 = (uint64_t)v58;
  sub_220F31B38();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v44);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v49, v56);
  (*(void (**)(void *, uint64_t))(v71 + 8))(v48, v72);
  return sub_220D25B68(v50, &qword_267F35E28);
}

uint64_t sub_220F0DE04@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v161 = a1;
  uint64_t v157 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E50);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v158 = (uint64_t)v125 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v156 = (char *)v125 - v5;
  uint64_t v153 = sub_220F312F8();
  uint64_t v152 = *(void *)(v153 - 8);
  MEMORY[0x270FA5388](v153);
  uint64_t v151 = (char *)v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E58);
  uint64_t v149 = *(void *)(v150 - 8);
  MEMORY[0x270FA5388](v150);
  uint64_t v146 = (char *)v125 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E60);
  MEMORY[0x270FA5388](v147);
  uint64_t v148 = (char *)v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E68);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v155 = (char *)v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v154 = (uint64_t)v125 - v12;
  uint64_t v142 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E70);
  uint64_t v128 = *(void *)(v142 - 8);
  MEMORY[0x270FA5388](v142);
  uint64_t OpaqueTypeConformance2 = (char *)v125 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (char *)v125 - v15;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E78);
  MEMORY[0x270FA5388](v140);
  uint64_t v141 = (uint64_t)v125 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v134 = sub_220F315F8();
  uint64_t v133 = *(void *)(v134 - 8);
  MEMORY[0x270FA5388](v134);
  uint64_t v132 = (void *)((char *)v125 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v135 = type metadata accessor for FocusNameAndAppearanceView(0);
  uint64_t v136 = *(void *)(v135 - 8);
  uint64_t v19 = *(void *)(v136 + 64);
  MEMORY[0x270FA5388](v135);
  uint64_t v20 = sub_220F31718();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  uint64_t v23 = (char *)v125 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = (int *)type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent(0);
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (void *)((char *)v125 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2E2A0);
  uint64_t v137 = *(void *)(v138 - 8);
  MEMORY[0x270FA5388](v138);
  uint64_t v159 = (char *)v125 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E80);
  uint64_t v131 = *(void *)(v139 - 8);
  MEMORY[0x270FA5388](v139);
  unsigned __int8 v129 = (char *)v125 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v29);
  uint64_t v130 = (char *)v125 - v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E88);
  MEMORY[0x270FA5388](v31 - 8);
  uint64_t v145 = (uint64_t)v125 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v33);
  uint64_t v160 = (uint64_t)v125 - v34;
  id v35 = objc_msgSend(self, sel_currentDevice);
  id v36 = objc_msgSend(v35, sel_userInterfaceIdiom);

  type metadata accessor for ActivityConfigViewModel();
  v125[1] = sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  uint64_t *v26 = sub_220F30EA8();
  v26[1] = v37;
  __n128 v38 = (uint64_t *)((char *)v26 + v24[5]);
  *__n128 v38 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v39 = (uint64_t *)((char *)v26 + v24[6]);
  uint64_t *v39 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v40 = (char *)v26 + v24[7];
  uint64_t v144 = (uint64_t)v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = v19;
  LOBYTE(v173) = 0;
  sub_220F32148();
  uint64_t v41 = v163;
  *uint64_t v40 = v162;
  *((void *)v40 + 1) = v41;
  if (v36)
  {
    uint64_t v42 = (char *)v26 + v24[8];
    LOBYTE(v173) = 0;
    sub_220F32148();
    uint64_t v43 = v163;
    *uint64_t v42 = v162;
    *((void *)v42 + 1) = v43;
    sub_220F316F8();
    uint64_t v44 = sub_220F127E8(&qword_267F2E2B0, (void (*)(uint64_t))type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent);
    sub_220F31D58();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    sub_220F130C8((uint64_t)v26, type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent);
    uint64_t v45 = (uint64_t)v161;
    uint64_t v46 = (char *)v161 + *(int *)(v135 + 24);
    uint64_t v47 = *(void *)v46;
    uint64_t v48 = *((void *)v46 + 1);
    LOBYTE(v46) = v46[16];
    uint64_t v173 = v47;
    uint64_t v174 = v48;
    char v175 = (char)v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
    sub_220F322D8();
    uint64_t v128 = v163;
    LODWORD(v135) = v164;
    sub_220F13060(v45, (uint64_t)v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FocusNameAndAppearanceView);
    unint64_t v49 = (*(unsigned __int8 *)(v136 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v136 + 80);
    uint64_t v136 = *(unsigned __int8 *)(v136 + 80);
    uint64_t v50 = swift_allocObject();
    sub_220F125E4((uint64_t)v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v50 + v49);
    uint64_t v51 = sub_220F32188();
    uint64_t v52 = v132;
    uint64_t *v132 = v51;
    uint64_t v53 = v133;
    uint64_t v54 = v134;
    (*(void (**)(uint64_t *, void, uint64_t))(v133 + 104))(v52, *MEMORY[0x263F1A030], v134);
    uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2E2A8);
    uint64_t v162 = (uint64_t)v24;
    uint64_t v163 = v44;
    uint64_t OpaqueTypeConformance2 = (char *)swift_getOpaqueTypeConformance2();
    unint64_t v124 = sub_220D25714();
    uint64_t v55 = v138;
    uint64_t v56 = v129;
    char v57 = v159;
    sub_220F31BE8();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t *, uint64_t))(v53 + 8))(v52, v54);
    (*(void (**)(char *, uint64_t))(v137 + 8))(v57, v55);
    uint64_t v58 = v131;
    uint64_t v59 = v130;
    uint64_t v60 = v56;
    uint64_t v61 = v139;
    (*(void (**)(char *, char *, uint64_t))(v131 + 32))(v130, v60, v139);
    (*(void (**)(uint64_t, char *, uint64_t))(v58 + 16))(v141, v59, v61);
    swift_storeEnumTagMultiPayload();
    uint64_t v162 = v55;
    uint64_t v163 = v126;
    unint64_t v62 = OpaqueTypeConformance2;
    int v164 = OpaqueTypeConformance2;
    unint64_t v165 = v124;
    swift_getOpaqueTypeConformance2();
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35E90);
    uint64_t v64 = sub_220D25FB0(&qword_267F35E98, &qword_267F35E90);
    uint64_t v162 = v55;
    uint64_t v163 = v63;
    int v164 = v62;
    unint64_t v165 = v64;
    swift_getOpaqueTypeConformance2();
    sub_220F31488();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v59, v61);
  }
  else
  {
    uint64_t v65 = v24[8];
    uint64_t v134 = (uint64_t)v16;
    unint64_t v66 = (char *)v26 + v65;
    LOBYTE(v173) = 0;
    sub_220F32148();
    uint64_t v67 = v163;
    *unint64_t v66 = v162;
    *((void *)v66 + 1) = v67;
    sub_220F316F8();
    uint64_t v68 = sub_220F127E8(&qword_267F2E2B0, (void (*)(uint64_t))type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent);
    sub_220F31D58();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    sub_220F130C8((uint64_t)v26, type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent);
    uint64_t v69 = (uint64_t)v161;
    uint64_t v70 = (char *)v161 + *(int *)(v135 + 24);
    uint64_t v71 = *(void *)v70;
    uint64_t v72 = *((void *)v70 + 1);
    LOBYTE(v70) = v70[16];
    uint64_t v173 = v71;
    uint64_t v174 = v72;
    char v175 = (char)v70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
    sub_220F322D8();
    sub_220F13060(v69, (uint64_t)v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for FocusNameAndAppearanceView);
    uint64_t v73 = *(unsigned __int8 *)(v136 + 80);
    uint64_t v74 = swift_allocObject();
    sub_220F125E4((uint64_t)v125 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v74 + ((v73 + 16) & ~v73));
    uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E90);
    uint64_t v162 = (uint64_t)v24;
    uint64_t v163 = v68;
    uint64_t v122 = swift_getOpaqueTypeConformance2();
    uint64_t v123 = sub_220D25FB0(&qword_267F35E98, &qword_267F35E90);
    long long v76 = OpaqueTypeConformance2;
    uint64_t v77 = v138;
    uint64_t v78 = v159;
    sub_220F31DE8();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v137 + 8))(v78, v77);
    uint64_t v79 = v128;
    uint64_t v80 = v134;
    uint64_t v81 = v142;
    (*(void (**)(uint64_t, char *, uint64_t))(v128 + 32))(v134, v76, v142);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v79 + 16))(v141, v80, v81);
    swift_storeEnumTagMultiPayload();
    uint64_t v82 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2E2A8);
    unint64_t v83 = sub_220D25714();
    uint64_t v162 = v77;
    uint64_t v163 = v82;
    int v164 = (char *)v122;
    unint64_t v165 = v83;
    swift_getOpaqueTypeConformance2();
    uint64_t v162 = v77;
    uint64_t v163 = v75;
    int v164 = (char *)v122;
    unint64_t v165 = v123;
    swift_getOpaqueTypeConformance2();
    sub_220F31488();
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v80, v81);
    uint64_t v136 = v73;
  }
  uint64_t v162 = sub_220F0CB10();
  uint64_t v163 = v84;
  sub_220D292B8();
  uint64_t v85 = sub_220F31B28();
  uint64_t v141 = v85;
  uint64_t v87 = v86;
  long long v89 = v88;
  uint64_t v159 = v88;
  char v91 = v90 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v142 = KeyPath;
  uint64_t v93 = sub_220F31FE8();
  uint64_t v94 = swift_getKeyPath();
  uint64_t v95 = sub_220F318E8();
  uint64_t v96 = swift_getKeyPath();
  uint64_t v162 = v85;
  uint64_t v163 = v87;
  LOBYTE(v164) = v91;
  unint64_t v165 = (unint64_t)v89;
  __int16 v166 = 256;
  uint64_t v167 = KeyPath;
  char v168 = 1;
  uint64_t v169 = v94;
  uint64_t v170 = v93;
  uint64_t v171 = v96;
  uint64_t v172 = v95;
  sub_220F31908();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F35EA0);
  sub_220F12A64();
  uint64_t v97 = v146;
  sub_220F31B78();
  sub_220D357E0(v141, v87, v91);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v98 = swift_getKeyPath();
  uint64_t v99 = v149;
  uint64_t v100 = (uint64_t)v148;
  uint64_t v101 = v150;
  (*(void (**)(char *, char *, uint64_t))(v149 + 16))(v148, v97, v150);
  uint64_t v102 = v100 + *(int *)(v147 + 36);
  *(void *)uint64_t v102 = v98;
  *(void *)(v102 + 8) = 4;
  *(unsigned char *)(v102 + 16) = 0;
  (*(void (**)(char *, uint64_t))(v99 + 8))(v97, v101);
  uint64_t v103 = v151;
  sub_220F312E8();
  sub_220F12C4C();
  uint64_t v104 = (uint64_t)v155;
  sub_220F31D78();
  (*(void (**)(char *, uint64_t))(v152 + 8))(v103, v153);
  sub_220D25B68(v100, &qword_267F35E60);
  uint64_t v105 = v154;
  sub_220D39114(v104, v154, &qword_267F35E68);
  uint64_t v106 = (uint64_t)v161;
  if (*v161)
  {
    swift_retain();
    BOOL v107 = sub_220DD88D0();
    swift_release();
    uint64_t v108 = (uint64_t)v156;
    uint64_t v109 = v144;
    if (v107)
    {
      sub_220F13060(v106, v144, type metadata accessor for FocusNameAndAppearanceView);
      unint64_t v110 = (v136 + 16) & ~(unint64_t)v136;
      uint64_t v111 = swift_allocObject();
      sub_220F125E4(v109, v111 + v110);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F33E50);
      sub_220E60308();
      sub_220F321A8();
      uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35ED8);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v112 - 8) + 56))(v108, 0, 1, v112);
    }
    else
    {
      uint64_t v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35ED8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v113 - 8) + 56))(v108, 1, 1, v113);
    }
    uint64_t v114 = v160;
    uint64_t v115 = v145;
    sub_220D26548(v160, v145, &qword_267F35E88);
    sub_220D26548(v105, v104, &qword_267F35E68);
    uint64_t v116 = v158;
    sub_220D26548(v108, v158, &qword_267F35E50);
    uint64_t v117 = v105;
    uint64_t v118 = v157;
    sub_220D26548(v115, v157, &qword_267F35E88);
    uint64_t v119 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F35EE0);
    uint64_t v120 = v118 + v119[12];
    *(void *)uint64_t v120 = 0;
    *(unsigned char *)(v120 + 8) = 1;
    sub_220D26548(v104, v118 + v119[16], &qword_267F35E68);
    sub_220D26548(v116, v118 + v119[20], &qword_267F35E50);
    sub_220D25B68(v108, &qword_267F35E50);
    sub_220D25B68(v117, &qword_267F35E68);
    sub_220D25B68(v114, &qword_267F35E88);
    sub_220D25B68(v116, &qword_267F35E50);
    sub_220D25B68(v104, &qword_267F35E68);
    return sub_220D25B68(v115, &qword_267F35E88);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F0F2E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FocusNameAndAppearanceView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ActivityEditView(0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2E2A8);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  if (*a1)
  {
    uint64_t v45 = v5;
    uint64_t v46 = v6;
    if (*(void *)(v14 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v15 = v57;
      uint64_t v16 = v58;
      uint64_t v17 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v14 + 24) = sub_220D06AF4(v15, v16, (uint64_t)sub_220D2A5A0, v17);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v18 = sub_220D07240();
    swift_release();
    uint64_t v48 = v10;
    uint64_t v49 = a2;
    uint64_t v47 = v13;
    if (v18)
    {
      id v19 = objc_msgSend(v18, sel_mode);

      id v44 = objc_msgSend(v19, sel_semanticType);
      swift_release();
    }
    else
    {
      swift_release();
      id v44 = 0;
    }
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E78();
    swift_getKeyPath();
    sub_220F30E98();
    swift_release();
    swift_release();
    if (*a1)
    {
      uint64_t v42 = v58;
      uint64_t v43 = v57;
      uint64_t v41 = v59;
      uint64_t v40 = v60;
      swift_retain();
      BOOL v39 = sub_220DD8A98();
      swift_release();
      sub_220F30E78();
      swift_getKeyPath();
      sub_220F30E98();
      swift_release();
      swift_release();
      uint64_t v38 = v53;
      uint64_t v20 = v55;
      uint64_t v37 = v54;
      uint64_t v21 = v56;
      sub_220F30E78();
      swift_getKeyPath();
      sub_220F30E98();
      swift_release();
      swift_release();
      if (*a1)
      {
        char v22 = v18 == 0;
        unint64_t v24 = v51;
        unint64_t v23 = v52;
        __n128 v36 = v50;
        swift_retain();
        uint64_t v25 = sub_220DD8878();
        swift_release();
        swift_retain();
        uint64_t v26 = sub_220DD884C();
        swift_release();
        sub_220F13060((uint64_t)a1, (uint64_t)v7, type metadata accessor for FocusNameAndAppearanceView);
        unint64_t v27 = (*(unsigned __int8 *)(v45 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80);
        uint64_t v28 = swift_allocObject();
        sub_220F125E4((uint64_t)v7, v28 + v27);
        uint64_t v35 = v28;
        *((void *)&v34 + 1) = v37;
        *(void *)&long long v34 = v38;
        uint64_t v29 = v48;
        ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(0, (uint64_t)v44, v22, v43, v42, v41, v40, v39, v48, v34, v20, v21, v36, v24, v23, v25, v26, (uint64_t)sub_220E61094, 0,
          (uint64_t)sub_220F13004,
          v35);
        uint64_t v30 = sub_220F32468();
        uint64_t v31 = (uint64_t)v47;
        sub_220F0BC0C(0.0, 1, 400.0, 0, 0.0, 1, 0.0, 1, (uint64_t)v47, 600.0, 0, 0.0, 1, v30, v32, type metadata accessor for ActivityEditView, &qword_267F2E2A8);
        sub_220F130C8((uint64_t)v29, type metadata accessor for ActivityEditView);
        return sub_220D39114(v31, v49, &qword_267F2E2A8);
      }
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E88();
    __break(1u);
  }
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

void sub_220F0F958(void *a1@<X8>)
{
  sub_220DD8388();
  id v2 = sub_220D07240();
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(v2, sel_mode);

    id v5 = objc_msgSend(v4, sel_name);
    uint64_t v3 = (void *)sub_220F32768();
    unint64_t v7 = v6;
    swift_release();
  }
  else
  {
    swift_release();
    unint64_t v7 = 0xE000000000000000;
  }
  *a1 = v3;
  a1[1] = v7;
}

uint64_t sub_220F0FA10(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  type metadata accessor for ActivityConfigViewModel();
  sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  swift_bridgeObjectRetain();
  sub_220F30948();
  sub_220F30968();
  swift_release();
  sub_220DD8388();
  sub_220D0729C(v1, v2);
  return swift_release();
}

uint64_t sub_220F0FADC()
{
  return sub_220F30C98();
}

uint64_t sub_220F0FB44@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for FocusNameAndAppearanceView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = type metadata accessor for ActivityEditView(0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35EE8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = *a1;
  if (*a1)
  {
    uint64_t v15 = *(void *)(v14 + 24);
    uint64_t v49 = (uint64_t)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v50 = v11;
    uint64_t v47 = v5;
    uint64_t v48 = v6;
    if (v15)
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v16 = v61;
      uint64_t v17 = v62;
      uint64_t v18 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v14 + 24) = sub_220D06AF4(v16, v17, (uint64_t)sub_220D2A5A0, v18);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v19 = sub_220D07240();
    swift_release();
    if (v19)
    {
      id v20 = objc_msgSend(v19, sel_mode);

      id v46 = objc_msgSend(v20, sel_semanticType);
      swift_release();
    }
    else
    {
      swift_release();
      id v46 = 0;
    }
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E78();
    swift_getKeyPath();
    sub_220F30E98();
    swift_release();
    swift_release();
    if (*a1)
    {
      unint64_t v51 = v13;
      unint64_t v52 = v9;
      uint64_t v53 = a2;
      uint64_t v45 = v61;
      uint64_t v44 = v62;
      uint64_t v43 = v63;
      uint64_t v42 = v64;
      swift_retain();
      BOOL v41 = sub_220DD8A98();
      swift_release();
      sub_220F30E78();
      swift_getKeyPath();
      sub_220F30E98();
      swift_release();
      swift_release();
      uint64_t v40 = v57;
      uint64_t v21 = v59;
      uint64_t v39 = v58;
      uint64_t v22 = v60;
      sub_220F30E78();
      swift_getKeyPath();
      sub_220F30E98();
      swift_release();
      swift_release();
      if (*a1)
      {
        char v23 = v19 == 0;
        unint64_t v25 = v55;
        unint64_t v24 = v56;
        __n128 v38 = v54;
        swift_retain();
        uint64_t v26 = sub_220DD8878();
        swift_release();
        swift_retain();
        uint64_t v27 = sub_220DD884C();
        swift_release();
        uint64_t v28 = v49;
        sub_220F13060((uint64_t)a1, v49, type metadata accessor for FocusNameAndAppearanceView);
        unint64_t v29 = (*(unsigned __int8 *)(v47 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
        uint64_t v30 = swift_allocObject();
        sub_220F125E4(v28, v30 + v29);
        *((void *)&v37 + 1) = v39;
        *(void *)&long long v37 = v40;
        uint64_t v31 = v52;
        ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(0, (uint64_t)v46, v23, v45, v44, v43, v42, v41, v52, v37, v21, v22, v38, v25, v24, v26, v27, (uint64_t)sub_220E61094, 0,
          (uint64_t)sub_220F13004,
          v30);
        id v32 = objc_msgSend(self, sel_systemGroupedBackgroundColor);
        uint64_t v33 = MEMORY[0x223C74C60](v32);
        LOBYTE(v30) = sub_220F31818();
        uint64_t v34 = (uint64_t)v51;
        sub_220F13060((uint64_t)v31, (uint64_t)v51, type metadata accessor for ActivityEditView);
        uint64_t v35 = v34 + *(int *)(v50 + 36);
        *(void *)uint64_t v35 = v33;
        *(unsigned char *)(v35 + 8) = v30;
        sub_220F130C8((uint64_t)v31, type metadata accessor for ActivityEditView);
        return sub_220D39114(v34, v53, &qword_267F35EE8);
      }
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    sub_220F30E88();
    __break(1u);
  }
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220F101D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10 = *a7;
  if (*a7)
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_220F30948();
    sub_220F30968();
    swift_release();
    if (!*(void *)(v10 + 24))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v25 = a1;
      uint64_t v17 = a4;
      uint64_t v18 = a3;
      uint64_t v19 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v10 + 24) = sub_220D06AF4(v27, v28, a8, v19);
      swift_retain();
      a3 = v18;
      a4 = v17;
      a1 = v25;
      swift_release();
    }
    swift_retain();
    sub_220D0729C(a1, a2);
    swift_release();
    swift_release();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_220F30948();
    sub_220F30968();
    swift_release();
    if (!*(void *)(v10 + 24))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v20 = a6;
      uint64_t v21 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      uint64_t v22 = v21;
      a6 = v20;
      *(void *)(v10 + 24) = sub_220D06AF4(v27, v28, a9, v22);
      swift_retain();
      swift_release();
    }
    swift_retain();
    sub_220D07734(a3, a4);
    swift_release();
    swift_release();
    swift_retain();
    swift_bridgeObjectRetain();
    sub_220F30948();
    sub_220F30968();
    swift_release();
    if (!*(void *)(v10 + 24))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v23 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v10 + 24) = sub_220D06AF4(v27, v28, a10, v23);
      swift_retain();
      swift_release();
    }
    swift_retain();
    sub_220D07CF4(a5, a6);
    swift_release();
    return swift_release();
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F10664()
{
  type metadata accessor for FocusNameAndAppearanceView(0);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
  MEMORY[0x223C75070](&v1);
  sub_220F322B8();
  swift_release();
  return swift_release();
}

uint64_t sub_220F10720@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  sub_220F30408();
  sub_220D292B8();
  uint64_t v2 = sub_220F31B28();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_220F31998();
  uint64_t v7 = sub_220F31AF8();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_220D357E0(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_220F31EA8();
  uint64_t v13 = sub_220F31A98();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_220D357E0(v7, v9, v12);
  swift_bridgeObjectRelease();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = result;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_220F108BC(void *a1)
{
  if (*a1)
  {
    swift_retain();
    BOOL v1 = sub_220DD88D0();
    uint64_t result = swift_release();
    if (v1)
    {
      type metadata accessor for FocusNameAndAppearanceView(0);
      swift_retain();
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F300E0);
      MEMORY[0x223C75070](&v3);
      sub_220F322B8();
      swift_release();
      return swift_release();
    }
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F109F8()
{
  BOOL v1 = v0;
  uint64_t v2 = *v0;
  if (*v0)
  {
    if (*(void *)(v2 + 24))
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v3 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v2 + 24) = sub_220D06AF4(v9, v10, (uint64_t)sub_220D2A5A0, v3);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v4 = sub_220D07240();
    swift_release();
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_mode);

      id v6 = objc_msgSend(v5, sel_semanticType);
      swift_release();

      BOOL v7 = v6 == (id)9;
    }
    else
    {
      swift_release();
      BOOL v7 = 0;
    }
    sub_220F32468();
    sub_220F10CA4(v7, v1, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F35E00);
    sub_220D25FB0(&qword_267F35E08, &qword_267F35E00);
    sub_220F31D48();
    return sub_220F124D8((uint64_t)v11);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F10CA4@<X0>(int a1@<W0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_220F32088();
  uint64_t v54 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v53 = (char *)v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_220F30AD8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v46 - v13;
  v46[1] = a2;
  uint64_t v15 = *a2;
  if (*a2)
  {
    swift_retain();
    uint64_t v16 = (uint64_t)sub_220DE6F00();
    swift_release();
    if (!v16) {
      uint64_t v16 = sub_220F31FF8();
    }
    uint64_t v55 = v6;
    if (qword_267F2E168 != -1) {
      swift_once();
    }
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v52 = v70;
    int v51 = v71;
    uint64_t v50 = v72;
    int v49 = v73;
    uint64_t v48 = v74;
    uint64_t v47 = v75;
    uint64_t v17 = *(void *)(v15 + 24);
    int v57 = a1;
    uint64_t v56 = v16;
    if (v17)
    {
      swift_retain();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_220F309B8();
      swift_release();
      swift_release();
      uint64_t v18 = v76;
      uint64_t v19 = v77;
      uint64_t v20 = swift_allocObject();
      swift_weakInit();
      type metadata accessor for ActivityConfigurationManager();
      swift_allocObject();
      *(void *)(v15 + 24) = sub_220D06AF4(v18, v19, (uint64_t)sub_220D2A5A0, v20);
      swift_retain();
      swift_release();
    }
    swift_retain();
    id v21 = sub_220D07240();
    if (v21
      && (uint64_t v22 = v21,
          id v23 = objc_msgSend(v21, sel_mode),
          v22,
          id v24 = objc_msgSend(v23, sel_symbolImageName),
          v23,
          v24))
    {
      unint64_t v25 = sub_220F32768();
      uint64_t v27 = v26;
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      swift_release();
      uint64_t v27 = 0x8000000220F43D30;
      unint64_t v25 = 0xD000000000000012;
    }
    type metadata accessor for FocusNameAndAppearanceView.MastheadLeadImageContent(0);
    sub_220F11840(&qword_267F33C90, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v14);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F184F8], v8);
    char v28 = sub_220F30AC8();
    unint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
    v29(v11, v8);
    v29(v14, v8);
    _s15FocusSettingsUI14ActivitySourceV25inverseVariantIfAvailable3for17isDarkColorSchemeS2S_SbtFZ_0(v25, v27, v28 & 1);
    swift_bridgeObjectRelease();
    sub_220F320A8();
    uint64_t v30 = v54;
    uint64_t v31 = v53;
    uint64_t v32 = v55;
    (*(void (**)(char *, void, uint64_t))(v54 + 104))(v53, *MEMORY[0x263F1B4B8], v55);
    uint64_t v33 = sub_220F320D8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
    uint64_t v34 = sub_220F31F88();
    uint64_t KeyPath = swift_getKeyPath();
    sub_220F32468();
    uint64_t result = sub_220F30BA8();
    uint64_t v37 = v76;
    uint64_t v38 = v78;
    char v39 = v57 & 1;
    char v40 = v51;
    char v68 = v51;
    char v41 = v49;
    char v66 = v49;
    char v64 = 1;
    char v61 = v77;
    char v59 = v79;
    *(_DWORD *)(a3 + 1) = *(_DWORD *)v69;
    *(_DWORD *)(a3 + 4) = *(_DWORD *)&v69[3];
    *(_DWORD *)(a3 + 25) = *(_DWORD *)v67;
    *(_DWORD *)(a3 + 28) = *(_DWORD *)&v67[3];
    *(_DWORD *)(a3 + 41) = *(_DWORD *)v65;
    *(_DWORD *)(a3 + 44) = *(_DWORD *)&v65[3];
    *(_DWORD *)(a3 + 82) = v62;
    *(_WORD *)(a3 + 86) = v63;
    char v42 = v61;
    *(_DWORD *)(a3 + 113) = *(_DWORD *)v60;
    *(_DWORD *)(a3 + 116) = *(_DWORD *)&v60[3];
    char v43 = v59;
    *(_DWORD *)(a3 + 132) = *(_DWORD *)&v58[3];
    *(_DWORD *)(a3 + 129) = *(_DWORD *)v58;
    *(unsigned char *)a3 = v39;
    uint64_t v44 = v52;
    *(void *)(a3 + 8) = v56;
    *(void *)(a3 + 16) = v44;
    *(unsigned char *)(a3 + 24) = v40;
    *(void *)(a3 + 32) = v50;
    *(unsigned char *)(a3 + 40) = v41;
    uint64_t v45 = v47;
    *(void *)(a3 + 48) = v48;
    *(void *)(a3 + 56) = v45;
    *(void *)(a3 + 64) = v33;
    *(void *)(a3 + 72) = 0;
    *(unsigned char *)(a3 + 80) = 1;
    *(unsigned char *)(a3 + 81) = 0;
    *(void *)(a3 + 88) = KeyPath;
    *(void *)(a3 + 96) = v34;
    *(void *)(a3 + 104) = v37;
    *(unsigned char *)(a3 + 112) = v42;
    *(void *)(a3 + 120) = v38;
    *(unsigned char *)(a3 + 128) = v43;
    *(_OWORD *)(a3 + 136) = v80;
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F127E8((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

double sub_220F113B8@<D0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FDF0);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_220F35390;
    *(void *)(v5 + 32) = a2;
    swift_retain();
    *(void *)(v5 + 40) = sub_220F31F38();
    *(void *)&long long v7 = v5;
    sub_220F32878();
    sub_220F32558();
    sub_220F32568();
    MEMORY[0x223C75170](v5);
    sub_220F30C48();
  }
  else
  {
    swift_retain();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FDD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FDE8);
  sub_220D25FB0(&qword_267F2FDC8, &qword_267F2FDD0);
  sub_220D25FB0(&qword_267F2FDE0, &qword_267F2FDE8);
  sub_220F31488();
  double result = *(double *)&v7;
  *(_OWORD *)a3 = v7;
  *(_OWORD *)(a3 + 16) = v8;
  *(void *)(a3 + 32) = v9;
  *(_WORD *)(a3 + 40) = v10;
  *(unsigned char *)(a3 + 42) = v11;
  return result;
}

double sub_220F1157C@<D0>(uint64_t a1@<X8>)
{
  return sub_220F113B8(*(unsigned char *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_220F1158C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F115A8@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11DA4((uint64_t *)&unk_267F2E330, &qword_267F2EA00, 0xD000000000000019, 0x8000000220F48A70, a1);
}

uint64_t sub_220F115D4(uint64_t a1, char a2)
{
  uint64_t v4 = sub_220F31178();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_220F329E8();
  uint64_t v9 = sub_220F317D8();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    char v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v15 = v12;
    *(_DWORD *)char v11 = 136315138;
    uint64_t v14 = sub_220D166C8(1819242306, 0xE400000000000000, &v15);
    sub_220F32B58();
    _os_log_impl(&dword_220D02000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C76830](v12, -1, -1);
    MEMORY[0x223C76830](v11, -1, -1);
  }

  sub_220F31168();
  swift_getAtKeyPath();
  sub_220D33490(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_220F117D8@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11840(&qword_267F2EC20, MEMORY[0x263F18D80], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t sub_220F11818@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11840(&qword_267F2EFC0, MEMORY[0x270FA9950], 0x7261646E656C6143, 0xE800000000000000, a1);
}

uint64_t sub_220F11840@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_220F31178();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D26548(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_220F329E8();
    id v21 = sub_220F317D8();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v26 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v27 = a5;
      id v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v30 = v24;
      *(_DWORD *)id v23 = 136315138;
      uint64_t v29 = sub_220D166C8(v28, v26, &v30);
      sub_220F32B58();
      _os_log_impl(&dword_220D02000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C76830](v24, -1, -1);
      MEMORY[0x223C76830](v23, -1, -1);
    }

    sub_220F31168();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_220F11AF8@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11840((uint64_t *)&unk_267F2E250, MEMORY[0x263F19A00], 0xD000000000000013, 0x8000000220F48A50, a1);
}

uint64_t sub_220F11B30@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11840(&qword_267F33C90, MEMORY[0x263F18520], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

double sub_220F11B6C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_220F31178();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_220F329E8();
  uint64_t v9 = sub_220F317D8();
  os_log_type_t v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    double v15 = *(double *)&v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    uint64_t v14 = sub_220D166C8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v15);
    sub_220F32B58();
    _os_log_impl(&dword_220D02000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C76830](v12, -1, -1);
    MEMORY[0x223C76830](v11, -1, -1);
  }

  sub_220F31168();
  swift_getAtKeyPath();
  sub_220D33490(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_220F11D78@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11DA4(&qword_267F32358, &qword_267F32370, 0xD000000000000020, 0x8000000220F48AC0, a1);
}

uint64_t sub_220F11DA4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_220F31178();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x270FA5388]();
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220D26548(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_220D39114((uint64_t)v16, a5, a2);
  }
  os_log_type_t v18 = sub_220F329E8();
  uint64_t v19 = sub_220F317D8();
  if (os_log_type_enabled(v19, v18))
  {
    unint64_t v24 = a4;
    uint64_t v20 = swift_slowAlloc();
    uint64_t v25 = a5;
    id v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v28 = v22;
    *(_DWORD *)id v21 = 136315138;
    uint64_t v27 = sub_220D166C8(v26, v24, &v28);
    sub_220F32B58();
    _os_log_impl(&dword_220D02000, v19, v18, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C76830](v22, -1, -1);
    MEMORY[0x223C76830](v21, -1, -1);
  }

  sub_220F31168();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_220F1202C@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11840(&qword_267F32428, MEMORY[0x263F19A18], 0xD000000000000013, 0x8000000220F48AF0, a1);
}

uint64_t sub_220F12064(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = sub_220F31178();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_220D7E608(a1);
  }
  else
  {
    swift_retain();
    os_log_type_t v10 = sub_220F329E8();
    uint64_t v11 = sub_220F317D8();
    os_log_type_t v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      uint64_t v17 = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      v16[0] = v13 + 4;
      v16[1] = sub_220D166C8(0xD000000000000012, 0x8000000220F489E0, &v17);
      sub_220F32B58();
      _os_log_impl(&dword_220D02000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C76830](v14, -1, -1);
      MEMORY[0x223C76830](v13, -1, -1);
    }

    sub_220F31168();
    swift_getAtKeyPath();
    sub_220E51C68(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v17;
  }
  return a1;
}

uint64_t sub_220F1228C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_220F31178();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_220F329E8();
    uint64_t v9 = sub_220F317D8();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v15 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v14 = sub_220D166C8(0xD000000000000026, 0x8000000220F48A90, &v15);
      sub_220F32B58();
      _os_log_impl(&dword_220D02000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C76830](v12, -1, -1);
      MEMORY[0x223C76830](v11, -1, -1);
    }

    sub_220F31168();
    swift_getAtKeyPath();
    sub_220D33490(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v15;
  }
  return a1;
}

uint64_t sub_220F124A0()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_220F124D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_220F12530@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220F30F98();
  *a1 = result;
  return result;
}

uint64_t sub_220F1255C()
{
  return sub_220F30FA8();
}

uint64_t sub_220F12588@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220F30F98();
  *a1 = result;
  return result;
}

uint64_t sub_220F125B4()
{
  return sub_220F30FA8();
}

uint64_t sub_220F125E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FocusNameAndAppearanceView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220F12648()
{
  return sub_220F12D3C((uint64_t (*)(uint64_t))sub_220F108BC);
}

unint64_t sub_220F12660()
{
  unint64_t result = qword_267F35E40;
  if (!qword_267F35E40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35E20);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35E10);
    sub_220D25FB0(&qword_267F35E38, &qword_267F35E10);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35E40);
  }
  return result;
}

unint64_t sub_220F1273C()
{
  unint64_t result = qword_267F35E48;
  if (!qword_267F35E48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35E28);
    sub_220F12660();
    sub_220F127E8((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35E48);
  }
  return result;
}

uint64_t sub_220F127E8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t objectdestroy_14Tm_2()
{
  uint64_t v1 = type metadata accessor for FocusNameAndAppearanceView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_release();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F32358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_220F315C8();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220F12A3C()
{
  return sub_220F12DCC((uint64_t (*)(uint64_t))sub_220F0F2E0);
}

unint64_t sub_220F12A64()
{
  unint64_t result = qword_267F35EA8;
  if (!qword_267F35EA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35EA0);
    sub_220F12B04();
    sub_220D25FB0(&qword_267F2FF68, (uint64_t *)&unk_267F33E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35EA8);
  }
  return result;
}

unint64_t sub_220F12B04()
{
  unint64_t result = qword_267F35EB0;
  if (!qword_267F35EB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35EB8);
    sub_220F12BA4();
    sub_220D25FB0(&qword_267F2EA98, &qword_267F2EAA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35EB0);
  }
  return result;
}

unint64_t sub_220F12BA4()
{
  unint64_t result = qword_267F35EC0;
  if (!qword_267F35EC0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35EC8);
    sub_220D2A4EC();
    sub_220D25FB0(&qword_267F30800, (uint64_t *)&unk_267F33E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35EC0);
  }
  return result;
}

unint64_t sub_220F12C4C()
{
  unint64_t result = qword_267F35ED0;
  if (!qword_267F35ED0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35E60);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35EA0);
    sub_220F12A64();
    swift_getOpaqueTypeConformance2();
    sub_220D25FB0(&qword_267F30F08, (uint64_t *)&unk_267F33E60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35ED0);
  }
  return result;
}

uint64_t sub_220F12D24()
{
  return sub_220F12D3C((uint64_t (*)(uint64_t))sub_220F10664);
}

uint64_t sub_220F12D3C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for FocusNameAndAppearanceView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_220F12DB4()
{
  return sub_220F12DCC((uint64_t (*)(uint64_t))sub_220F0FADC);
}

uint64_t sub_220F12DCC(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for FocusNameAndAppearanceView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  return a1(v3);
}

uint64_t sub_220F12E50@<X0>(uint64_t a1@<X8>)
{
  return sub_220F0FB44(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_220F12E58()
{
  unint64_t result = qword_267F35EF0;
  if (!qword_267F35EF0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35EE8);
    sub_220F127E8((unint64_t *)&unk_267F2E2C0, (void (*)(uint64_t))type metadata accessor for ActivityEditView);
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35EF0);
  }
  return result;
}

unint64_t sub_220F12F30@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_220DE6380();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_220F12F5C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_62Tm(a1, a2, a3, a4, sub_220DE6520);
}

uint64_t sub_220F12F74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_220DE6948();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_220F12FA0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_62Tm(a1, a2, a3, a4, sub_220DE6AD8);
}

uint64_t keypath_set_62Tm(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v7 = *a1;
  uint64_t v6 = a1[1];
  swift_bridgeObjectRetain();
  return a5(v7, v6);
}

uint64_t sub_220F13004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_220F1312C(a1, a2, a3, a4, a5, a6, (uint64_t)sub_220D2A5A0, (uint64_t)sub_220D2A5A0, (uint64_t)sub_220D2A5A0);
}

uint64_t sub_220F13060(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220F130C8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_220F1312C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v18 = *(void *)(type metadata accessor for FocusNameAndAppearanceView(0) - 8);
  return sub_220F101D8(a1, a2, a3, a4, a5, a6, (uint64_t *)(v9 + ((*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))), a7, a8, a9);
}

uint64_t initializeBufferWithCopyOfBuffer for FocusNameAndAppearanceView.MastheadCircleFill(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for FocusNameAndAppearanceView.MastheadCircleFill(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for FocusNameAndAppearanceView.MastheadCircleFill(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for FocusNameAndAppearanceView.MastheadCircleFill()
{
  return &type metadata for FocusNameAndAppearanceView.MastheadCircleFill;
}

unint64_t sub_220F132C0()
{
  unint64_t result = qword_267F35F08;
  if (!qword_267F35F08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35F10);
    sub_220D25FB0(&qword_267F35E08, &qword_267F35E00);
    sub_220F127E8((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35F08);
  }
  return result;
}

uint64_t sub_220F13390()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F133EC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220F1340C()
{
  unint64_t result = qword_267F35F18;
  if (!qword_267F35F18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35F20);
    sub_220D25FB0(&qword_267F2FDC8, &qword_267F2FDD0);
    sub_220D25FB0(&qword_267F2FDE0, &qword_267F2FDE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F35F18);
  }
  return result;
}

uint64_t sub_220F134CC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_220F13528(uint64_t a1)
{
  return a1;
}

uint64_t sub_220F13560()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  uint64_t v3 = v0 + OBJC_IVAR____TtC15FocusSettingsUI18PeopleSearchFilter__query;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F530);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC15FocusSettingsUI18PeopleSearchFilter__filteredPeople;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_267F35F50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocClassInstance();
}

uint64_t sub_220F1368C()
{
  return type metadata accessor for PeopleSearchFilter();
}

uint64_t type metadata accessor for PeopleSearchFilter()
{
  uint64_t result = qword_267F35F38;
  if (!qword_267F35F38) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_220F136E0()
{
  sub_220DF0938();
  if (v0 <= 0x3F)
  {
    sub_220F137B8();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_220F137B8()
{
  if (!qword_267F35F48)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F33C20);
    unint64_t v0 = sub_220F309D8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267F35F48);
    }
  }
}

uint64_t sub_220F13814@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PeopleSearchFilter();
  uint64_t result = sub_220F30948();
  *a1 = result;
  return result;
}

void sub_220F13854(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for ActivityConfigViewModel();
  sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *a3 = sub_220F30EA8();
  a3[1] = v6;
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F30E98);
  uint64_t v8 = (uint64_t *)((char *)a3 + v7[9]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (uint64_t *)((char *)a3 + v7[10]);
  void *v9 = a1;
  v9[1] = a2;
  os_log_type_t v10 = (uint64_t *)((char *)a3 + v7[11]);
  void *v10 = 0xD000000000000011;
  v10[1] = 0x8000000220F48C20;
  uint64_t v11 = v7[13];
  uint64_t v12 = v7[14];
  uint64_t v13 = qword_267F2E160;
  id v14 = a2;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = (uint64_t *)((char *)a3 + v12);
  uint64_t v16 = (uint64_t *)((char *)a3 + v11);
  uint64_t v17 = sub_220F30408();
  uint64_t v18 = (uint64_t *)((char *)a3 + v7[12]);
  *uint64_t v18 = v17;
  v18[1] = v19;
  uint64_t *v16 = sub_220F30408();
  v16[1] = v20;

  *uint64_t v15 = 0xD00000000000001FLL;
  v15[1] = 0x8000000220F48C60;
}

void sub_220F13A4C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for ActivityConfigViewModel();
  sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *a3 = sub_220F30EA8();
  a3[1] = v6;
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F30FA8);
  uint64_t v8 = (uint64_t *)((char *)a3 + v7[9]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (uint64_t *)((char *)a3 + v7[10]);
  void *v9 = a1;
  v9[1] = a2;
  os_log_type_t v10 = (uint64_t *)((char *)a3 + v7[11]);
  void *v10 = 0xD000000000000011;
  v10[1] = 0x8000000220F48CD0;
  uint64_t v11 = v7[13];
  uint64_t v12 = v7[14];
  uint64_t v13 = qword_267F2E160;
  id v14 = a2;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = (uint64_t *)((char *)a3 + v12);
  uint64_t v16 = (uint64_t *)((char *)a3 + v11);
  uint64_t v17 = sub_220F30408();
  uint64_t v18 = (uint64_t *)((char *)a3 + v7[12]);
  *uint64_t v18 = v17;
  v18[1] = v19;
  uint64_t *v16 = sub_220F30408();
  v16[1] = v20;

  *uint64_t v15 = 0xD000000000000023;
  v15[1] = 0x8000000220F48D10;
}

void sub_220F13C44(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for ActivityConfigViewModel();
  sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *a3 = sub_220F30EA8();
  a3[1] = v6;
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F30F50);
  uint64_t v8 = (uint64_t *)((char *)a3 + v7[9]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (uint64_t *)((char *)a3 + v7[10]);
  void *v9 = a1;
  v9[1] = a2;
  uint64_t v10 = v7[13];
  uint64_t v11 = v7[14];
  uint64_t v12 = (uint64_t *)((char *)a3 + v7[11]);
  *uint64_t v12 = 0x7265776F70;
  v12[1] = 0xE500000000000000;
  uint64_t v13 = qword_267F2E160;
  id v14 = a2;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = (uint64_t *)((char *)a3 + v11);
  uint64_t v16 = (uint64_t *)((char *)a3 + v10);
  uint64_t v17 = sub_220F30408();
  uint64_t v18 = (uint64_t *)((char *)a3 + v7[12]);
  *uint64_t v18 = v17;
  v18[1] = v19;
  uint64_t *v16 = sub_220F30408();
  v16[1] = v20;

  *uint64_t v15 = 0xD00000000000001DLL;
  v15[1] = 0x8000000220F48CB0;
}

void sub_220F13E38(char a1@<W0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  type metadata accessor for ActivityConfigViewModel();
  sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *a3 = sub_220F30EA8();
  a3[1] = v6;
  uint64_t v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F30E60);
  uint64_t v8 = (uint64_t *)((char *)a3 + v7[9]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = v7[13];
  uint64_t v10 = v7[14];
  uint64_t v11 = (uint64_t *)((char *)a3 + v7[10]);
  *uint64_t v11 = a1 & 1;
  v11[1] = a2;
  uint64_t v12 = (uint64_t *)((char *)a3 + v7[11]);
  *uint64_t v12 = 0xD000000000000013;
  v12[1] = 0x8000000220F48BC0;
  uint64_t v13 = qword_267F2E160;
  id v14 = a2;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v15 = (uint64_t *)((char *)a3 + v10);
  uint64_t v16 = (uint64_t *)((char *)a3 + v9);
  uint64_t v17 = sub_220F30408();
  uint64_t v18 = (uint64_t *)((char *)a3 + v7[12]);
  *uint64_t v18 = v17;
  v18[1] = v19;
  uint64_t *v16 = sub_220F30408();
  v16[1] = v20;

  *uint64_t v15 = 0xD00000000000001ELL;
  v15[1] = 0x8000000220F48C00;
}

uint64_t sub_220F14030@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  long long v21 = *(_OWORD *)a1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(unsigned int *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(unsigned char *)(a1 + 48) & 1;
  type metadata accessor for ActivityConfigViewModel();
  sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  *a2 = sub_220F30EA8();
  a2[1] = v10;
  uint64_t v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F30DD8);
  uint64_t v12 = (uint64_t *)((char *)a2 + v11[9]);
  *uint64_t v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (char *)a2 + v11[10];
  *(_OWORD *)uint64_t v13 = v21;
  *((void *)v13 + 2) = v4;
  *((void *)v13 + 3) = v5;
  *((void *)v13 + 4) = v6;
  *((void *)v13 + 5) = v7;
  *((void *)v13 + 6) = v9;
  *((void *)v13 + 7) = v8;
  uint64_t v14 = v11[13];
  uint64_t v15 = v11[14];
  uint64_t v16 = (char *)a2 + v11[11];
  strcpy(v16, "location.fill");
  *((_WORD *)v16 + 7) = -4864;
  long long v22 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)((char *)a2 + v11[12]) = v22;
  sub_220DB6524(a1);
  sub_220D9BD90((uint64_t)&v22);
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v17 = (uint64_t *)((char *)a2 + v15);
  uint64_t v18 = (uint64_t *)((char *)a2 + v14);
  *uint64_t v18 = sub_220F30408();
  v18[1] = v19;
  uint64_t result = sub_220D4F940(a1);
  void *v17 = 0xD000000000000020;
  v17[1] = 0x8000000220F48B90;
  return result;
}

void sub_220F14248()
{
  sub_220DD4B48();
  if (v0 <= 0x3F)
  {
    sub_220F32B38();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_220F14330(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_220F31318();
  uint64_t v7 = *(void *)(v6 - 8);
  int v8 = *(_DWORD *)(v7 + 80);
  uint64_t v9 = v8 & 0xF8 | 7;
  if (*(void *)(v7 + 64) <= 8uLL) {
    uint64_t v10 = 8;
  }
  else {
    uint64_t v10 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  uint64_t v11 = v10 + 1;
  uint64_t v12 = *(void *)(a3 + 16);
  uint64_t v13 = *(void *)(v12 - 8);
  int v14 = *(_DWORD *)(v13 + 80);
  uint64_t v15 = v14;
  uint64_t v16 = (v10 + 1 + (((v8 & 0xF8) + 23) & ~v9) + v15) & ~v15;
  if (*(_DWORD *)(v13 + 84)) {
    uint64_t v17 = *(void *)(v13 + 64);
  }
  else {
    uint64_t v17 = *(void *)(v13 + 64) + 1;
  }
  int v18 = (v14 | v8) & 0x100000;
  uint64_t v19 = *a2;
  *a1 = *a2;
  if ((v14 | (unint64_t)v9) != 7
    || v18 != 0
    || ((((((((v17 + 7 + v16) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    a1 = (uint64_t *)(v19
                   + (((v14 | (unint64_t)v9) + 16) & ~(v14 | (unint64_t)v9)));
    swift_retain();
  }
  else
  {
    uint64_t v45 = v6;
    size_t __n = v17;
    uint64_t v47 = v17 + 7;
    uint64_t v48 = v12;
    uint64_t v22 = ~v9;
    a1[1] = a2[1];
    uint64_t v23 = (char *)a1 + v9;
    unint64_t v24 = (char *)a2 + v9;
    uint64_t v25 = (void *)((unint64_t)(v23 + 16) & v22);
    uint64_t v26 = (unsigned __int8 *)((unint64_t)(v24 + 16) & v22);
    unsigned int v27 = v26[v10];
    swift_retain();
    if (v27 >= 2)
    {
      if (v10 <= 3) {
        uint64_t v28 = v10;
      }
      else {
        uint64_t v28 = 4;
      }
      switch(v28)
      {
        case 1:
          int v29 = *v26;
          goto LABEL_25;
        case 2:
          int v29 = *(unsigned __int16 *)v26;
          goto LABEL_25;
        case 3:
          int v29 = *(unsigned __int16 *)v26 | (v26[2] << 16);
          goto LABEL_25;
        case 4:
          int v29 = *(_DWORD *)v26;
LABEL_25:
          int v30 = (v29 | ((v27 - 2) << (8 * v10))) + 2;
          unsigned int v31 = v29 + 2;
          if (v10 >= 4) {
            unsigned int v27 = v31;
          }
          else {
            unsigned int v27 = v30;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v32 = ~v15;
    if (v27 == 1)
    {
      (*(void (**)(void *, unsigned __int8 *, uint64_t))(v7 + 16))(v25, v26, v45);
      char v33 = 1;
    }
    else
    {
      *uint64_t v25 = *(void *)v26;
      swift_retain();
      char v33 = 0;
    }
    *((unsigned char *)v25 + v10) = v33;
    uint64_t v34 = (void *)(((unint64_t)v25 + v11 + v15) & v32);
    uint64_t v35 = (const void *)((unint64_t)&v26[v11 + v15] & v32);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v35, 1, v48))
    {
      memcpy(v34, v35, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v34, v35, v48);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v34, 0, 1, v48);
    }
    __n128 v36 = (void *)(((unint64_t)v34 + v47) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v37 = (void *)(((unint64_t)v35 + v47) & 0xFFFFFFFFFFFFFFF8);
    *__n128 v36 = *v37;
    v36[1] = v37[1];
    uint64_t v38 = (void *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
    char v39 = (void *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
    *uint64_t v38 = *v39;
    v38[1] = v39[1];
    char v40 = (void *)(((unint64_t)v38 + 23) & 0xFFFFFFFFFFFFFFF8);
    char v41 = (void *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
    *char v40 = *v41;
    v40[1] = v41[1];
    char v42 = (void *)(((unint64_t)v40 + 23) & 0xFFFFFFFFFFFFFFF8);
    char v43 = (void *)(((unint64_t)v41 + 23) & 0xFFFFFFFFFFFFFFF8);
    *char v42 = *v43;
    v42[1] = v43[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_220F146F0(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = sub_220F31318();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80) & 0xF8 | 7;
  uint64_t v7 = (unsigned __int8 *)((a1 + v6 + 16) & ~v6);
  if (*(void *)(v5 + 64) <= 8uLL) {
    uint64_t v8 = 8;
  }
  else {
    uint64_t v8 = *(void *)(v5 + 64);
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
        goto LABEL_13;
      case 2:
        int v12 = *(unsigned __int16 *)v7;
        goto LABEL_13;
      case 3:
        int v12 = *(unsigned __int16 *)v7 | (v7[2] << 16);
        goto LABEL_13;
      case 4:
        int v12 = *(_DWORD *)v7;
LABEL_13:
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
  if (v9 == 1) {
    (*(void (**)(unsigned __int8 *, uint64_t))(v5 + 8))(v7, v4);
  }
  else {
    swift_release();
  }
  int v14 = &v7[v8];
  uint64_t v15 = *(void *)(a2 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  unint64_t v17 = (unint64_t)&v14[*(unsigned __int8 *)(v16 + 80) + 1] & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v15)) {
    (*(void (**)(unint64_t, uint64_t))(v16 + 8))(v17, v15);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_220F14944(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = sub_220F31318();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80) & 0xF8;
  uint64_t v10 = v9 + 23;
  unint64_t v11 = (unint64_t)a1 + v9 + 23;
  unint64_t v12 = ~v9 & 0xFFFFFFFFFFFFFFF8;
  int v13 = (void *)(v11 & v12);
  int v14 = (unsigned __int8 *)(((unint64_t)a2 + v10) & v12);
  if (*(void *)(v8 + 64) <= 8uLL) {
    uint64_t v15 = 8;
  }
  else {
    uint64_t v15 = *(void *)(*(void *)(v7 - 8) + 64);
  }
  unsigned int v16 = v14[v15];
  swift_retain();
  if (v16 >= 2)
  {
    if (v15 <= 3) {
      uint64_t v17 = v15;
    }
    else {
      uint64_t v17 = 4;
    }
    switch(v17)
    {
      case 1:
        int v18 = *v14;
        goto LABEL_13;
      case 2:
        int v18 = *(unsigned __int16 *)v14;
        goto LABEL_13;
      case 3:
        int v18 = *(unsigned __int16 *)v14 | (v14[2] << 16);
        goto LABEL_13;
      case 4:
        int v18 = *(_DWORD *)v14;
LABEL_13:
        int v19 = (v18 | ((v16 - 2) << (8 * v15))) + 2;
        unsigned int v20 = v18 + 2;
        if (v15 >= 4) {
          unsigned int v16 = v20;
        }
        else {
          unsigned int v16 = v19;
        }
        break;
      default:
        break;
    }
  }
  if (v16 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v8 + 16))(v13, v14, v7);
    char v21 = 1;
  }
  else
  {
    void *v13 = *(void *)v14;
    swift_retain();
    char v21 = 0;
  }
  *((unsigned char *)v13 + v15) = v21;
  uint64_t v22 = *(void *)(a3 + 16);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = v15 + 1 + v24;
  uint64_t v26 = (void *)(((unint64_t)v13 + v25) & ~v24);
  unsigned int v27 = (const void *)((unint64_t)&v14[v25] & ~v24);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v27, 1, v22))
  {
    int v28 = *(_DWORD *)(v23 + 84);
    uint64_t v29 = *(void *)(v23 + 64);
    if (v28) {
      size_t v30 = *(void *)(v23 + 64);
    }
    else {
      size_t v30 = v29 + 1;
    }
    memcpy(v26, v27, v30);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 16))(v26, v27, v22);
    uint64_t v32 = *(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56);
    uint64_t v31 = v23 + 56;
    v32(v26, 0, 1, v22);
    int v28 = *(_DWORD *)(v31 + 28);
    uint64_t v29 = *(void *)(v31 + 8);
  }
  if (v28) {
    uint64_t v33 = v29;
  }
  else {
    uint64_t v33 = v29 + 1;
  }
  uint64_t v34 = (void *)(((unint64_t)v26 + v33 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v35 = (void *)(((unint64_t)v27 + v33 + 7) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v34 = *v35;
  v34[1] = v35[1];
  __n128 v36 = (void *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v37 = (void *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  *__n128 v36 = *v37;
  v36[1] = v37[1];
  uint64_t v38 = (void *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  char v39 = (void *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v38 = *v39;
  v38[1] = v39[1];
  char v40 = (void *)(((unint64_t)v38 + 23) & 0xFFFFFFFFFFFFFFF8);
  char v41 = (void *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  *char v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_220F14C84(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = sub_220F31318();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v9 = v8 + 23;
  unint64_t v10 = (unint64_t)a1 + v8 + 23;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = (unsigned __int8 *)(v10 & v11);
  int v13 = (unsigned __int8 *)(((unint64_t)a2 + v9) & v11);
  if (*(void *)(v7 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  if (v12 != v13)
  {
    uint64_t v15 = v6;
    unsigned int v16 = v12[v14];
    unsigned int v17 = v16 - 2;
    if (v16 >= 2)
    {
      if (v14 <= 3) {
        uint64_t v18 = v14;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *v12;
          goto LABEL_14;
        case 2:
          int v19 = *(unsigned __int16 *)v12;
          goto LABEL_14;
        case 3:
          int v19 = *(unsigned __int16 *)(v10 & v11) | (*(unsigned __int8 *)((v10 & v11) + 2) << 16);
          goto LABEL_14;
        case 4:
          int v19 = *(_DWORD *)v12;
LABEL_14:
          int v20 = (v19 | (v17 << (8 * v14))) + 2;
          unsigned int v16 = v19 + 2;
          if (v14 < 4) {
            unsigned int v16 = v20;
          }
          break;
        default:
          break;
      }
    }
    if (v16 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(v12, v6);
    }
    else {
      swift_release();
    }
    unsigned int v21 = v13[v14];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v14 <= 3) {
        uint64_t v23 = v14;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *v13;
          goto LABEL_28;
        case 2:
          int v24 = *(unsigned __int16 *)v13;
          goto LABEL_28;
        case 3:
          int v24 = *(unsigned __int16 *)v13 | (v13[2] << 16);
          goto LABEL_28;
        case 4:
          int v24 = *(_DWORD *)v13;
LABEL_28:
          int v25 = (v24 | (v22 << (8 * v14))) + 2;
          unsigned int v21 = v24 + 2;
          if (v14 < 4) {
            unsigned int v21 = v25;
          }
          break;
        default:
          break;
      }
    }
    if (v21 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 16))(v12, v13, v15);
      v12[v14] = 1;
    }
    else
    {
      *(void *)unint64_t v12 = *(void *)v13;
      v12[v14] = 0;
      swift_retain();
    }
  }
  uint64_t v26 = *(void *)(a3 + 16);
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = v14 + v28 + 1;
  size_t v30 = (void *)((unint64_t)&v12[v29] & ~v28);
  uint64_t v31 = (void *)((unint64_t)&v13[v29] & ~v28);
  uint64_t v32 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v27 + 48);
  int v33 = v32(v30, 1, v26);
  int v34 = v32(v31, 1, v26);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v27 + 16))(v30, v31, v26);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v27 + 56))(v30, 0, 1, v26);
      goto LABEL_44;
    }
    int v35 = *(_DWORD *)(v27 + 84);
    size_t v36 = *(void *)(v27 + 64);
  }
  else
  {
    if (!v34)
    {
      (*(void (**)(void *, void *, uint64_t))(v27 + 24))(v30, v31, v26);
      goto LABEL_44;
    }
    (*(void (**)(void *, uint64_t))(v27 + 8))(v30, v26);
    int v35 = *(_DWORD *)(v27 + 84);
    size_t v36 = *(void *)(v27 + 64);
  }
  if (v35) {
    size_t v37 = v36;
  }
  else {
    size_t v37 = v36 + 1;
  }
  memcpy(v30, v31, v37);
LABEL_44:
  if (*(_DWORD *)(v27 + 84)) {
    uint64_t v38 = *(void *)(v27 + 64);
  }
  else {
    uint64_t v38 = *(void *)(v27 + 64) + 1;
  }
  char v39 = (void *)(((unint64_t)v30 + v38 + 7) & 0xFFFFFFFFFFFFFFF8);
  char v40 = (void *)(((unint64_t)v31 + v38 + 7) & 0xFFFFFFFFFFFFFFF8);
  void *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v41 = (void *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  char v42 = (void *)(((unint64_t)v40 + 23) & 0xFFFFFFFFFFFFFFF8);
  *char v41 = *v42;
  v41[1] = v42[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v43 = (void *)(((unint64_t)v41 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v44 = (void *)(((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8);
  void *v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = (void *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFFFF8);
  id v46 = (void *)(((unint64_t)v44 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_220F15128(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = sub_220F31318();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v9 = v8 + 23;
  unint64_t v10 = (unint64_t)a1 + v8 + 23;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = (void *)(v10 & v11);
  int v13 = (unsigned __int8 *)(((unint64_t)a2 + v9) & v11);
  if (*(void *)(v7 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  unsigned int v15 = v13[v14];
  unsigned int v16 = v15 - 2;
  if (v15 >= 2)
  {
    if (v14 <= 3) {
      uint64_t v17 = v14;
    }
    else {
      uint64_t v17 = 4;
    }
    switch(v17)
    {
      case 1:
        int v18 = *v13;
        goto LABEL_13;
      case 2:
        int v18 = *(unsigned __int16 *)v13;
        goto LABEL_13;
      case 3:
        int v18 = *(unsigned __int16 *)v13 | (v13[2] << 16);
        goto LABEL_13;
      case 4:
        int v18 = *(_DWORD *)v13;
LABEL_13:
        int v19 = (v18 | (v16 << (8 * v14))) + 2;
        unsigned int v15 = v18 + 2;
        if (v14 < 4) {
          unsigned int v15 = v19;
        }
        break;
      default:
        break;
    }
  }
  if (v15 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v7 + 32))(v12, v13, v6);
    char v20 = 1;
  }
  else
  {
    char v20 = 0;
    *unint64_t v12 = *(void *)v13;
  }
  *((unsigned char *)v12 + v14) = v20;
  uint64_t v21 = v14 + 1;
  uint64_t v22 = *(void *)(a3 + 16);
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned __int8 *)(v23 + 80);
  uint64_t v25 = v21 + v24;
  uint64_t v26 = (void *)(((unint64_t)v12 + v25) & ~v24);
  uint64_t v27 = (const void *)((unint64_t)&v13[v25] & ~v24);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v27, 1, v22))
  {
    int v28 = *(_DWORD *)(v23 + 84);
    uint64_t v29 = *(void *)(v23 + 64);
    if (v28) {
      size_t v30 = *(void *)(v23 + 64);
    }
    else {
      size_t v30 = v29 + 1;
    }
    memcpy(v26, v27, v30);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v26, v27, v22);
    uint64_t v32 = *(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56);
    uint64_t v31 = v23 + 56;
    v32(v26, 0, 1, v22);
    int v28 = *(_DWORD *)(v31 + 28);
    uint64_t v29 = *(void *)(v31 + 8);
  }
  if (v28) {
    uint64_t v33 = v29;
  }
  else {
    uint64_t v33 = v29 + 1;
  }
  int v34 = (_OWORD *)(((unint64_t)v26 + v33 + 7) & 0xFFFFFFFFFFFFFFF8);
  int v35 = (_OWORD *)(((unint64_t)v27 + v33 + 7) & 0xFFFFFFFFFFFFFFF8);
  *int v34 = *v35;
  size_t v36 = (_OWORD *)(((unint64_t)v34 + 23) & 0xFFFFFFFFFFFFFFF8);
  size_t v37 = (_OWORD *)(((unint64_t)v35 + 23) & 0xFFFFFFFFFFFFFFF8);
  *size_t v36 = *v37;
  uint64_t v38 = (_OWORD *)(((unint64_t)v36 + 23) & 0xFFFFFFFFFFFFFFF8);
  char v39 = (_OWORD *)(((unint64_t)v37 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v38 = *v39;
  *(_OWORD *)(((unint64_t)v38 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v39 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_220F153F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  uint64_t v6 = sub_220F31318();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(_DWORD *)(v7 + 80) & 0xF8;
  uint64_t v9 = v8 + 23;
  unint64_t v10 = (unint64_t)a1 + v8 + 23;
  unint64_t v11 = ~v8 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v12 = (unsigned __int8 *)(v10 & v11);
  int v13 = (unsigned __int8 *)(((unint64_t)a2 + v9) & v11);
  if (*(void *)(v7 + 64) <= 8uLL) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = *(void *)(*(void *)(v6 - 8) + 64);
  }
  if (v12 != v13)
  {
    uint64_t v15 = v6;
    unsigned int v16 = v12[v14];
    unsigned int v17 = v16 - 2;
    if (v16 >= 2)
    {
      if (v14 <= 3) {
        uint64_t v18 = v14;
      }
      else {
        uint64_t v18 = 4;
      }
      switch(v18)
      {
        case 1:
          int v19 = *v12;
          goto LABEL_14;
        case 2:
          int v19 = *(unsigned __int16 *)v12;
          goto LABEL_14;
        case 3:
          int v19 = *(unsigned __int16 *)(v10 & v11) | (*(unsigned __int8 *)((v10 & v11) + 2) << 16);
          goto LABEL_14;
        case 4:
          int v19 = *(_DWORD *)v12;
LABEL_14:
          int v20 = (v19 | (v17 << (8 * v14))) + 2;
          unsigned int v16 = v19 + 2;
          if (v14 < 4) {
            unsigned int v16 = v20;
          }
          break;
        default:
          break;
      }
    }
    if (v16 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v7 + 8))(v12, v6);
    }
    else {
      swift_release();
    }
    unsigned int v21 = v13[v14];
    unsigned int v22 = v21 - 2;
    if (v21 >= 2)
    {
      if (v14 <= 3) {
        uint64_t v23 = v14;
      }
      else {
        uint64_t v23 = 4;
      }
      switch(v23)
      {
        case 1:
          int v24 = *v13;
          goto LABEL_28;
        case 2:
          int v24 = *(unsigned __int16 *)v13;
          goto LABEL_28;
        case 3:
          int v24 = *(unsigned __int16 *)v13 | (v13[2] << 16);
          goto LABEL_28;
        case 4:
          int v24 = *(_DWORD *)v13;
LABEL_28:
          int v25 = (v24 | (v22 << (8 * v14))) + 2;
          unsigned int v21 = v24 + 2;
          if (v14 < 4) {
            unsigned int v21 = v25;
          }
          break;
        default:
          break;
      }
    }
    if (v21 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v7 + 32))(v12, v13, v15);
      char v26 = 1;
    }
    else
    {
      char v26 = 0;
      *(void *)unint64_t v12 = *(void *)v13;
    }
    v12[v14] = v26;
  }
  uint64_t v27 = *(void *)(a3 + 16);
  uint64_t v28 = *(void *)(v27 - 8);
  uint64_t v29 = *(unsigned __int8 *)(v28 + 80);
  uint64_t v30 = v14 + v29 + 1;
  uint64_t v31 = (void *)((unint64_t)&v12[v30] & ~v29);
  uint64_t v32 = (void *)((unint64_t)&v13[v30] & ~v29);
  uint64_t v33 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  int v34 = v33(v31, 1, v27);
  int v35 = v33(v32, 1, v27);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v31, v32, v27);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v31, 0, 1, v27);
      goto LABEL_45;
    }
    int v36 = *(_DWORD *)(v28 + 84);
    size_t v37 = *(void *)(v28 + 64);
  }
  else
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v31, v32, v27);
      goto LABEL_45;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v31, v27);
    int v36 = *(_DWORD *)(v28 + 84);
    size_t v37 = *(void *)(v28 + 64);
  }
  if (v36) {
    size_t v38 = v37;
  }
  else {
    size_t v38 = v37 + 1;
  }
  memcpy(v31, v32, v38);
LABEL_45:
  if (*(_DWORD *)(v28 + 84)) {
    uint64_t v39 = *(void *)(v28 + 64);
  }
  else {
    uint64_t v39 = *(void *)(v28 + 64) + 1;
  }
  char v40 = (void *)(((unint64_t)v31 + v39 + 7) & 0xFFFFFFFFFFFFFFF8);
  char v41 = (void *)(((unint64_t)v32 + v39 + 7) & 0xFFFFFFFFFFFFFFF8);
  *char v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRelease();
  char v42 = (void *)(((unint64_t)v40 + 23) & 0xFFFFFFFFFFFFFFF8);
  char v43 = (void *)(((unint64_t)v41 + 23) & 0xFFFFFFFFFFFFFFF8);
  *char v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRelease();
  uint64_t v44 = (void *)(((unint64_t)v42 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v45 = (void *)(((unint64_t)v43 + 23) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v44 = *v45;
  v44[1] = v45[1];
  swift_bridgeObjectRelease();
  id v46 = (void *)(((unint64_t)v44 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v47 = (void *)(((unint64_t)v45 + 23) & 0xFFFFFFFFFFFFFFF8);
  *id v46 = *v47;
  v46[1] = v47[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_220F1586C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(sub_220F31318() - 8);
  if (*(void *)(v6 + 64) <= 8uLL) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = *(void *)(v6 + 64);
  }
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  int v9 = *(_DWORD *)(v8 + 84);
  if (v9) {
    unsigned int v10 = v9 - 1;
  }
  else {
    unsigned int v10 = 0;
  }
  if (v10 <= 0x7FFFFFFF) {
    unsigned int v11 = 0x7FFFFFFF;
  }
  else {
    unsigned int v11 = v10;
  }
  int v12 = *(_DWORD *)(v6 + 80);
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = *(void *)(v8 + 64);
  if (!v9) {
    ++v14;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v15 = v12 & 0xF8;
  uint64_t v16 = v15 | 7;
  uint64_t v17 = v7 + v13 + 1;
  uint64_t v18 = v14 + 7;
  if (v11 < a2)
  {
    unint64_t v19 = ((((((((v18 + ((v17 + ((v15 + 23) & ~v16)) & ~v13)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
          + 23) & 0xFFFFFFFFFFFFFFF8)
        + 16;
    if ((v19 & 0xFFFFFFF8) != 0) {
      unsigned int v20 = 2;
    }
    else {
      unsigned int v20 = a2 - v11 + 1;
    }
    if (v20 >= 0x10000) {
      unsigned int v21 = 4;
    }
    else {
      unsigned int v21 = 2;
    }
    if (v20 < 0x100) {
      unsigned int v21 = 1;
    }
    if (v20 >= 2) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    switch(v22)
    {
      case 1:
        int v23 = *((unsigned __int8 *)a1 + v19);
        if (!*((unsigned char *)a1 + v19)) {
          break;
        }
        goto LABEL_30;
      case 2:
        int v23 = *(unsigned __int16 *)((char *)a1 + v19);
        if (*(_WORD *)((char *)a1 + v19)) {
          goto LABEL_30;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x220F15AB8);
      case 4:
        int v23 = *(_DWORD *)((char *)a1 + v19);
        if (!v23) {
          break;
        }
LABEL_30:
        int v25 = v23 - 1;
        if ((v19 & 0xFFFFFFF8) != 0)
        {
          int v25 = 0;
          int v26 = *a1;
        }
        else
        {
          int v26 = 0;
        }
        return v11 + (v26 | v25) + 1;
      default:
        break;
    }
  }
  uint64_t v27 = (v17 + (((unint64_t)a1 + v16 + 16) & ~v16)) & ~v13;
  if (v10 < 0x7FFFFFFF)
  {
    unint64_t v29 = *(void *)(((v18 + v27) & 0xFFFFFFFFFFFFFFF8) + 8);
    if (v29 >= 0xFFFFFFFF) {
      LODWORD(v29) = -1;
    }
    return (v29 + 1);
  }
  else
  {
    unsigned int v28 = (*(uint64_t (**)(uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 48))(v27);
    if (v28 >= 2) {
      return v28 - 1;
    }
    else {
      return 0;
    }
  }
}

void sub_220F15ACC(_DWORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v8 = 0;
  uint64_t v9 = *(void *)(sub_220F31318() - 8);
  uint64_t v10 = 8;
  if (*(void *)(v9 + 64) > 8uLL) {
    uint64_t v10 = *(void *)(v9 + 64);
  }
  uint64_t v11 = *(void *)(*(void *)(a4 + 16) - 8);
  int v12 = *(_DWORD *)(v11 + 84);
  int v13 = *(_DWORD *)(v9 + 80);
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  unsigned int v15 = v12 - 1;
  if (!v12) {
    unsigned int v15 = 0;
  }
  if (v15 <= 0x7FFFFFFF) {
    unsigned int v16 = 0x7FFFFFFF;
  }
  else {
    unsigned int v16 = v15;
  }
  uint64_t v17 = v13 & 0xF8;
  uint64_t v18 = v17 | 7;
  uint64_t v19 = v10 + v14 + 1;
  uint64_t v20 = v19 + ((v17 + 23) & ~(v17 | 7));
  if (v12) {
    size_t v21 = *(void *)(v11 + 64);
  }
  else {
    size_t v21 = *(void *)(v11 + 64) + 1;
  }
  unint64_t v22 = ((((((((v21 + 7 + (v20 & ~v14)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 16;
  if (v16 < a3)
  {
    if (((((((((v21 + 7 + (v20 & ~v14)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      unsigned int v23 = a3 - v16 + 1;
    else {
      unsigned int v23 = 2;
    }
    if (v23 >= 0x10000) {
      int v24 = 4;
    }
    else {
      int v24 = 2;
    }
    if (v23 < 0x100) {
      int v24 = 1;
    }
    if (v23 >= 2) {
      int v8 = v24;
    }
    else {
      int v8 = 0;
    }
  }
  if (a2 > v16)
  {
    if (((((((((v21 + 7 + (v20 & ~v14)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      int v25 = a2 - v16;
    else {
      int v25 = 1;
    }
    if (((((((((v21 + 7 + (v20 & ~v14)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v26 = ~v16 + a2;
      bzero(a1, ((((((((v21 + 7 + (v20 & ~v14)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v26;
    }
    switch(v8)
    {
      case 1:
        *((unsigned char *)a1 + v22) = v25;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v22) = v25;
        return;
      case 3:
        goto LABEL_61;
      case 4:
        *(_DWORD *)((char *)a1 + v22) = v25;
        return;
      default:
        return;
    }
  }
  uint64_t v27 = ~v14;
  switch(v8)
  {
    case 1:
      *((unsigned char *)a1 + v22) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 2:
      *(_WORD *)((char *)a1 + v22) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_38;
    case 3:
LABEL_61:
      __break(1u);
      JUMPOUT(0x220F15E08);
    case 4:
      *(_DWORD *)((char *)a1 + v22) = 0;
      goto LABEL_37;
    default:
LABEL_37:
      if (a2)
      {
LABEL_38:
        unsigned int v28 = (unsigned char *)((v19 + (((unint64_t)a1 + v18 + 16) & ~v18)) & v27);
        if (v15 < 0x7FFFFFFF)
        {
          uint64_t v32 = (void *)((unint64_t)&v28[v21 + 7] & 0xFFFFFFFFFFFFFFF8);
          if ((a2 & 0x80000000) != 0)
          {
            *uint64_t v32 = a2 ^ 0x80000000;
            v32[1] = 0;
          }
          else
          {
            v32[1] = a2 - 1;
          }
        }
        else if (v15 >= a2)
        {
          uint64_t v33 = *(void (**)(unsigned char *, void))(v11 + 56);
          v33(v28, a2 + 1);
        }
        else
        {
          if (v21 <= 3) {
            int v29 = ~(-1 << (8 * v21));
          }
          else {
            int v29 = -1;
          }
          if (v21)
          {
            int v30 = v29 & (~v15 + a2);
            if (v21 <= 3) {
              int v31 = v21;
            }
            else {
              int v31 = 4;
            }
            bzero(v28, v21);
            switch(v31)
            {
              case 2:
                *(_WORD *)unsigned int v28 = v30;
                break;
              case 3:
                *(_WORD *)unsigned int v28 = v30;
                void v28[2] = BYTE2(v30);
                break;
              case 4:
                *(_DWORD *)unsigned int v28 = v30;
                break;
              default:
                *unsigned int v28 = v30;
                break;
            }
          }
        }
      }
      return;
  }
}

uint64_t type metadata accessor for TriggerRowView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_220F15E58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F15E9C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TriggerCardLeadingImageModifier();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v18 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF78);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  int v13 = (uint64_t *)((char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_220F320A8();
  *uint64_t v6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  sub_220D588F8((uint64_t)v6, (uint64_t)v9);
  sub_220D5895C((uint64_t)v9, (uint64_t)v13 + *(int *)(v11 + 44));
  uint64_t *v13 = v14;
  sub_220D589C0((uint64_t)v9);
  uint64_t KeyPath = swift_getKeyPath();
  sub_220D26548((uint64_t)v13, a2, &qword_267F2EF78);
  unsigned int v16 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF80) + 36));
  uint64_t *v16 = KeyPath;
  v16[1] = a1;
  swift_retain();
  return sub_220D25B68((uint64_t)v13, &qword_267F2EF78);
}

uint64_t sub_220F16058@<X0>(uint64_t a1@<X8>)
{
  return sub_220F15E9C(*(void *)(v1 + 16), a1);
}

uint64_t sub_220F16064@<X0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  sub_220F32158();
  if (v13)
  {
    if (qword_267F2E160 != -1) {
      swift_once();
    }
  }
  else if (qword_267F2E160 != -1)
  {
    swift_once();
  }
  sub_220F30408();
  sub_220D292B8();
  uint64_t v2 = sub_220F31B28();
  uint64_t v4 = v3;
  char v6 = v5;
  uint64_t v8 = v7;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v10 = sub_220F31FF8();
  uint64_t v11 = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v6 & 1;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 1;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v10;
  *(void *)(a1 + 72) = result;
  *(unsigned char *)(a1 + 80) = 2;
  return result;
}

uint64_t sub_220F161FC@<X0>(uint64_t a1@<X8>)
{
  return sub_220F11AF8(a1);
}

uint64_t sub_220F16224@<X0>(uint64_t a1@<X8>)
{
  return sub_220F16064(a1);
}

uint64_t sub_220F16230@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35FD8);
  uint64_t v93 = *(void *)(v4 - 8);
  uint64_t v94 = v4;
  MEMORY[0x270FA5388](v4);
  __int16 v92 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35FE0);
  MEMORY[0x270FA5388](v104);
  uint64_t v96 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v95 = (char *)&v85 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v97 = (uint64_t)&v85 - v10;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35FE8);
  MEMORY[0x270FA5388](v102);
  uint64_t v103 = (uint64_t)&v85 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_220F31718();
  uint64_t v99 = *(void *)(v12 - 8);
  uint64_t v100 = v12;
  MEMORY[0x270FA5388](v12);
  uint64_t v98 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35FF0);
  MEMORY[0x270FA5388](v14 - 8);
  unsigned int v16 = (char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F35FF8);
  MEMORY[0x270FA5388](v86);
  uint64_t v18 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36000);
  uint64_t v87 = *(void *)(v19 - 8);
  uint64_t v88 = v19;
  MEMORY[0x270FA5388](v19);
  size_t v21 = (char *)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36008);
  MEMORY[0x270FA5388](v101);
  char v90 = (char *)&v85 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  long long v89 = (char *)&v85 - v24;
  MEMORY[0x270FA5388](v25);
  uint64_t v91 = (uint64_t)&v85 - v26;
  uint64_t v27 = sub_220F31318();
  uint64_t v28 = *(void *)(v27 - 8);
  MEMORY[0x270FA5388](v27);
  int v30 = (char *)&v85 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = a1;
  uint64_t v32 = v2;
  sub_220F11AF8((uint64_t)v30);
  char v33 = sub_220F31308();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v27);
  if (v33)
  {
    *(void *)unsigned int v16 = sub_220F31358();
    *((void *)v16 + 1) = 0;
    v16[16] = 1;
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36050);
    uint64_t v35 = v31;
    sub_220F16C2C(v32, *(void *)(v31 + 16), *(void *)(v31 + 24), (uint64_t)&v16[*(int *)(v34 + 44)]);
    char v36 = sub_220F31808();
    sub_220F30A88();
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    sub_220D26548((uint64_t)v16, (uint64_t)v18, &qword_267F35FF0);
    uint64_t v45 = v86;
    id v46 = &v18[*(int *)(v86 + 36)];
    *id v46 = v36;
    *((void *)v46 + 1) = v38;
    *((void *)v46 + 2) = v40;
    *((void *)v46 + 3) = v42;
    *((void *)v46 + 4) = v44;
    v46[40] = 0;
    sub_220D25B68((uint64_t)v16, &qword_267F35FF0);
    uint64_t v47 = v98;
    sub_220F31708();
    unint64_t v48 = sub_220F18930();
    sub_220F31D58();
    (*(void (**)(char *, uint64_t))(v99 + 8))(v47, v100);
    sub_220D25B68((uint64_t)v18, &qword_267F35FF8);
    v109[0] = v45;
    v109[1] = v48;
    swift_getOpaqueTypeConformance2();
    uint64_t v49 = (uint64_t)v90;
    uint64_t v50 = v88;
    sub_220F31C38();
    (*(void (**)(char *, uint64_t))(v87 + 8))(v21, v50);
    v109[0] = sub_220F17990(v35);
    v109[1] = v51;
    sub_220D292B8();
    uint64_t v52 = sub_220F31B28();
    uint64_t v54 = v53;
    LOBYTE(v45) = v55 & 1;
    uint64_t v56 = (uint64_t)v89;
    sub_220F30D48();
    sub_220D357E0(v52, v54, v45);
    swift_bridgeObjectRelease();
    int v57 = &qword_267F36008;
    sub_220D25B68(v49, &qword_267F36008);
    uint64_t v58 = v91;
    sub_220D39114(v56, v91, &qword_267F36008);
    sub_220D26548(v58, v103, &qword_267F36008);
    swift_storeEnumTagMultiPayload();
    sub_220F189D0(&qword_267F36030, &qword_267F36008, &qword_267F35FF8, (void (*)(void))sub_220F18930);
    sub_220F189D0(&qword_267F36048, &qword_267F35FE0, &qword_267F36010, (void (*)(void))sub_220F18718);
    sub_220F31488();
    uint64_t v59 = v58;
  }
  else
  {
    uint64_t v60 = sub_220F31228();
    sub_220F17C50(v32, *(void *)(v31 + 16), *(void *)(v31 + 24), (uint64_t)v107);
    v108[312] = 0;
    memcpy(&v108[7], v107, 0x131uLL);
    char v61 = sub_220F31878();
    sub_220F30A88();
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    v108[320] = 0;
    v106[0] = v60;
    v106[1] = 0;
    LOBYTE(v106[2]) = 0;
    memcpy((char *)&v106[2] + 1, v108, 0x138uLL);
    LOBYTE(v106[42]) = v61;
    v106[43] = v63;
    v106[44] = v65;
    v106[45] = v67;
    v106[46] = v69;
    LOBYTE(v106[47]) = 0;
    uint64_t v70 = v98;
    sub_220F31708();
    uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36010);
    unint64_t v72 = sub_220F18718();
    unsigned __int8 v73 = v92;
    sub_220F31D58();
    (*(void (**)(char *, uint64_t))(v99 + 8))(v70, v100);
    memcpy(v109, v106, 0x179uLL);
    sub_220F187B8((uint64_t)v109);
    v106[0] = v71;
    v106[1] = v72;
    swift_getOpaqueTypeConformance2();
    uint64_t v74 = (uint64_t)v96;
    uint64_t v75 = v94;
    sub_220F31C38();
    (*(void (**)(char *, uint64_t))(v93 + 8))(v73, v75);
    v106[0] = sub_220F17990(v31);
    v106[1] = v76;
    sub_220D292B8();
    uint64_t v77 = sub_220F31B28();
    uint64_t v79 = v78;
    char v81 = v80 & 1;
    uint64_t v82 = (uint64_t)v95;
    sub_220F30D48();
    sub_220D357E0(v77, v79, v81);
    swift_bridgeObjectRelease();
    int v57 = &qword_267F35FE0;
    sub_220D25B68(v74, &qword_267F35FE0);
    uint64_t v83 = v97;
    sub_220D39114(v82, v97, &qword_267F35FE0);
    sub_220D26548(v83, v103, &qword_267F35FE0);
    swift_storeEnumTagMultiPayload();
    sub_220F189D0(&qword_267F36030, &qword_267F36008, &qword_267F35FF8, (void (*)(void))sub_220F18930);
    sub_220F189D0(&qword_267F36048, &qword_267F35FE0, &qword_267F36010, (void (*)(void))sub_220F18718);
    sub_220F31488();
    uint64_t v59 = v83;
  }
  return sub_220D25B68(v59, v57);
}

uint64_t sub_220F16C2C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v61 = a4;
  uint64_t v7 = sub_220F32B38();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v55 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F820);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v64 = (uint64_t)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v15 = (char *)&v55 - v14;
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v55 - v17;
  *(void *)uint64_t v15 = sub_220F31228();
  *((void *)v15 + 1) = 0;
  v15[16] = 0;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F828);
  sub_220F17284(a1, (uint64_t)&v15[*(int *)(v19 + 44)]);
  uint64_t v63 = v18;
  sub_220D39114((uint64_t)v15, (uint64_t)v18, &qword_267F2F820);
  uint64_t v20 = type metadata accessor for TriggerRowView();
  if (*(void *)&a1[*(int *)(v20 + 52) + 8])
  {
    uint64_t v72 = sub_220F31228();
    sub_220F177FC((uint64_t)&v73);
    uint64_t v70 = v74;
    uint64_t v71 = v73;
    uint64_t v69 = v75;
    uint64_t v67 = v77;
    uint64_t v68 = v76;
    uint64_t v65 = v79;
    uint64_t v66 = v78;
    uint64_t v60 = v80;
    uint64_t v21 = 1;
    int v59 = v81;
  }
  else
  {
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    uint64_t v21 = 0;
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v60 = 0;
    int v59 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, &a1[*(int *)(v20 + 40)], v7);
  uint64_t v22 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v10, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    char v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v10, a2);
    if (v23)
    {
      if (qword_267F2E160 == -1) {
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  if (qword_267F2E160 != -1) {
LABEL_11:
  }
    swift_once();
LABEL_10:
  uint64_t v73 = sub_220F30408();
  uint64_t v74 = v24;
  sub_220D292B8();
  uint64_t v25 = sub_220F31B28();
  uint64_t v57 = v26;
  uint64_t v62 = v27;
  char v29 = v28 & 1;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v56 = sub_220F31FF8();
  uint64_t v31 = swift_getKeyPath();
  uint64_t v32 = swift_getKeyPath();
  uint64_t v33 = v64;
  sub_220D26548((uint64_t)v63, v64, &qword_267F2F820);
  uint64_t v34 = v33;
  uint64_t v35 = v61;
  sub_220D26548(v34, v61, &qword_267F2F820);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36058);
  uint64_t v37 = v35 + *(int *)(v36 + 48);
  uint64_t v38 = v72;
  *(void *)uint64_t v37 = v72;
  *(void *)(v37 + 8) = 0;
  uint64_t v72 = v38;
  uint64_t v39 = v21;
  uint64_t v58 = v21;
  uint64_t v40 = v71;
  *(void *)(v37 + 16) = v21;
  *(void *)(v37 + 24) = v40;
  uint64_t v41 = v40;
  uint64_t v71 = v40;
  uint64_t v42 = v70;
  *(void *)(v37 + 32) = v70;
  uint64_t v43 = v42;
  uint64_t v70 = v42;
  uint64_t v44 = v69;
  *(void *)(v37 + 40) = v69;
  char v45 = v44;
  uint64_t v69 = v44;
  uint64_t v46 = v68;
  *(void *)(v37 + 48) = v68;
  uint64_t v47 = v46;
  uint64_t v68 = v46;
  uint64_t v48 = v67;
  *(void *)(v37 + 56) = v67;
  uint64_t v67 = v48;
  uint64_t v49 = v66;
  *(void *)(v37 + 64) = v66;
  uint64_t v66 = v49;
  uint64_t v50 = v65;
  *(void *)(v37 + 72) = v65;
  uint64_t v65 = v50;
  *(void *)(v37 + 80) = v60;
  *(unsigned char *)(v37 + 88) = v59;
  uint64_t v51 = v35 + *(int *)(v36 + 64);
  uint64_t v52 = v57;
  *(void *)uint64_t v51 = v25;
  *(void *)(v51 + 8) = v52;
  *(unsigned char *)(v51 + 16) = v29;
  *(void *)(v51 + 24) = v62;
  *(void *)(v51 + 32) = KeyPath;
  uint64_t v55 = KeyPath;
  *(void *)(v51 + 40) = 1;
  *(unsigned char *)(v51 + 48) = 0;
  uint64_t v53 = v56;
  *(void *)(v51 + 56) = v31;
  *(void *)(v51 + 64) = v53;
  *(void *)(v51 + 72) = v32;
  *(unsigned char *)(v51 + 80) = 2;
  sub_220F18D0C(v38, 0, v39, v41, v43, v45, v47);
  sub_220D3570C(v25, v52, v29);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_220D25B68((uint64_t)v63, &qword_267F2F820);
  sub_220D357E0(v25, v52, v29);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_220F18D64(v72, 0, v58, v71, v70, v69, v68);
  return sub_220D25B68(v64, &qword_267F2F820);
}

uint64_t sub_220F17284@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v67 = a2;
  uint64_t v3 = type metadata accessor for TriggerCardLeadingImageModifier();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v62 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF78);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (uint64_t *)((char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF80);
  MEMORY[0x270FA5388](v63);
  uint64_t v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF88);
  MEMORY[0x270FA5388](v64);
  uint64_t v66 = (uint64_t)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v62 - v17;
  MEMORY[0x270FA5388](v19);
  uint64_t v65 = (uint64_t)&v62 - v20;
  uint64_t v21 = type metadata accessor for TriggerRowView();
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_220F320A8();
  uint64_t *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  sub_220D588F8((uint64_t)v5, (uint64_t)v8);
  sub_220D5895C((uint64_t)v8, (uint64_t)v12 + *(int *)(v10 + 44));
  *uint64_t v12 = v22;
  sub_220D589C0((uint64_t)v8);
  if (*a1)
  {
    swift_retain();
    id v23 = sub_220DE6F00();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    sub_220D26548((uint64_t)v12, (uint64_t)v14, &qword_267F2EF78);
    uint64_t v25 = (uint64_t *)&v14[*(int *)(v63 + 36)];
    *uint64_t v25 = KeyPath;
    v25[1] = (uint64_t)v23;
    sub_220D25B68((uint64_t)v12, &qword_267F2EF78);
    LOBYTE(KeyPath) = sub_220F31868();
    sub_220F30A88();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    sub_220D26548((uint64_t)v14, (uint64_t)v18, &qword_267F2EF80);
    uint64_t v34 = &v18[*(int *)(v64 + 36)];
    *uint64_t v34 = KeyPath;
    *((void *)v34 + 1) = v27;
    *((void *)v34 + 2) = v29;
    *((void *)v34 + 3) = v31;
    *((void *)v34 + 4) = v33;
    v34[40] = 0;
    sub_220D25B68((uint64_t)v14, &qword_267F2EF80);
    uint64_t v35 = v65;
    sub_220D39114((uint64_t)v18, v65, &qword_267F2EF88);
    uint64_t v36 = (void *)((char *)a1 + *(int *)(v21 + 48));
    uint64_t v37 = v36[1];
    uint64_t v68 = *v36;
    uint64_t v69 = v37;
    sub_220D292B8();
    swift_bridgeObjectRetain();
    uint64_t v38 = sub_220F31B28();
    uint64_t v40 = v39;
    char v42 = v41 & 1;
    sub_220F318C8();
    uint64_t v43 = sub_220F31AF8();
    uint64_t v45 = v44;
    char v47 = v46;
    swift_release();
    sub_220D357E0(v38, v40, v42);
    swift_bridgeObjectRelease();
    sub_220F31FE8();
    uint64_t v48 = sub_220F31A98();
    uint64_t v50 = v49;
    char v52 = v51;
    uint64_t v54 = v53;
    swift_release();
    v52 &= 1u;
    sub_220D357E0(v43, v45, v47 & 1);
    swift_bridgeObjectRelease();
    uint64_t v55 = swift_getKeyPath();
    uint64_t v56 = v66;
    sub_220D26548(v35, v66, &qword_267F2EF88);
    uint64_t v57 = v67;
    sub_220D26548(v56, v67, &qword_267F2EF88);
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F838);
    uint64_t v59 = v57 + *(int *)(v58 + 48);
    *(void *)uint64_t v59 = v48;
    *(void *)(v59 + 8) = v50;
    *(unsigned char *)(v59 + 16) = v52;
    *(void *)(v59 + 24) = v54;
    *(void *)(v59 + 32) = v55;
    *(void *)(v59 + 40) = 0;
    *(unsigned char *)(v59 + 48) = 1;
    uint64_t v60 = v57 + *(int *)(v58 + 64);
    *(void *)uint64_t v60 = 0;
    *(unsigned char *)(v60 + 8) = 1;
    sub_220D3570C(v48, v50, v52);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_220D25B68(v35, &qword_267F2EF88);
    sub_220D357E0(v48, v50, v52);
    swift_release();
    swift_bridgeObjectRelease();
    return sub_220D25B68(v56, &qword_267F2EF88);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F177FC@<X0>(uint64_t a1@<X8>)
{
  sub_220D292B8();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_220F31B28();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_220F319D8();
  uint64_t v7 = sub_220F31AF8();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  char v12 = v11 & 1;
  sub_220D357E0(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_220F31FF8();
  uint64_t v13 = sub_220F31A98();
  uint64_t v15 = v14;
  char v17 = v16;
  uint64_t v19 = v18;
  swift_release();
  sub_220D357E0(v7, v9, v12);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  *(unsigned char *)(a1 + 16) = v17 & 1;
  *(void *)(a1 + 24) = v19;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = 0;
  *(unsigned char *)(a1 + 64) = 1;
  sub_220D3570C(v13, v15, v17 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_220D357E0(v13, v15, v17 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F17990(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_220F31318();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F11AF8((uint64_t)v7);
  sub_220F31308();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = sub_220F18AB4(a1);
  uint64_t v10 = v9;
  char v11 = (uint64_t *)(v2 + *(int *)(a1 + 52));
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36060);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220F353B0;
  uint64_t v15 = (uint64_t *)(v2 + *(int *)(a1 + 48));
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  *(void *)(inited + 32) = *v15;
  *(void *)(inited + 40) = v16;
  *(void *)(inited + 48) = v13;
  *(void *)(inited + 56) = v12;
  *(void *)(inited + 64) = v8;
  *(void *)(inited + 72) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  uint64_t v18 = sub_220E8A724(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v20 = v18[2];
  unint64_t v19 = v18[3];
  unint64_t v21 = v20 + 1;
  if (v20 >= v19 >> 1) {
    uint64_t v18 = sub_220E8A724((void *)(v19 > 1), v20 + 1, 1, v18);
  }
  v18[2] = v21;
  uint64_t v22 = &v18[2 * v20];
  v22[4] = v17;
  v22[5] = v16;
  if (v12)
  {
    unint64_t v23 = v18[3];
    swift_bridgeObjectRetain();
    if (v21 >= v23 >> 1) {
      uint64_t v18 = sub_220E8A724((void *)(v23 > 1), v20 + 2, 1, v18);
    }
    v18[2] = v20 + 2;
    uint64_t v24 = &v18[2 * v21];
    v24[4] = v13;
    v24[5] = v12;
  }
  if (v10)
  {
    unint64_t v25 = v18[2];
    unint64_t v26 = v18[3];
    swift_bridgeObjectRetain();
    if (v25 >= v26 >> 1) {
      uint64_t v18 = sub_220E8A724((void *)(v26 > 1), v25 + 1, 1, v18);
    }
    v18[2] = v25 + 1;
    uint64_t v27 = &v18[2 * v25];
    v27[4] = v8;
    v27[5] = v10;
  }
  swift_release();
  v30[1] = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C20);
  sub_220D25FB0(&qword_267F36068, &qword_267F33C20);
  uint64_t v28 = sub_220F32688();
  swift_bridgeObjectRelease();
  return v28;
}

uint64_t sub_220F17C50@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_220F32B38();
  uint64_t v52 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v52 - v9;
  uint64_t v53 = a3;
  uint64_t v11 = type metadata accessor for TriggerRowView();
  uint64_t v12 = (void *)((char *)a1 + *(int *)(v11 + 44));
  uint64_t v13 = v12[1];
  if (*a1)
  {
    uint64_t v14 = v11;
    uint64_t v55 = *v12;
    swift_bridgeObjectRetain();
    swift_retain();
    id v15 = sub_220DE6F00();
    swift_release();
    uint64_t v71 = v13;
    if (v15) {
      uint64_t v72 = (uint64_t)v15;
    }
    else {
      uint64_t v72 = sub_220F31EA8();
    }
    uint64_t v16 = v8;
    int v54 = sub_220F31868();
    sub_220F30A88();
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    uint64_t v59 = sub_220F31358();
    uint64_t v25 = v53;
    sub_220F183E8((uint64_t)a1, (uint64_t)v88);
    uint64_t v56 = *(void *)&v88[8];
    uint64_t v57 = *(void *)v88;
    uint64_t v61 = *(void *)&v88[32];
    uint64_t v62 = *(void *)&v88[24];
    uint64_t v60 = *(void *)&v88[40];
    uint64_t v69 = *(void *)&v88[64];
    uint64_t v70 = *(void *)&v88[56];
    uint64_t v67 = *(void *)&v88[80];
    uint64_t v68 = *(void *)&v88[72];
    uint64_t v65 = *(void *)&v88[96];
    uint64_t v66 = *(void *)&v88[88];
    int v63 = v88[48];
    int v64 = v88[104];
    char v111 = 1;
    int v58 = v88[16];
    char v110 = v88[16];
    char v109 = v88[48];
    unint64_t v26 = (char *)a1 + *(int *)(v14 + 40);
    uint64_t v27 = v52;
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v10, v26, v16);
    uint64_t v28 = *(void *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v10, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v16);
    }
    else
    {
      char v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 48))(a2, v25);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v10, a2);
      if (v29)
      {
        if (qword_267F2E160 == -1) {
          goto LABEL_11;
        }
        goto LABEL_12;
      }
    }
    if (qword_267F2E160 == -1)
    {
LABEL_11:
      uint64_t v30 = sub_220F30408();
      uint64_t v31 = v55;
      *(void *)uint64_t v88 = v30;
      *(void *)&v88[8] = v32;
      sub_220D292B8();
      uint64_t v33 = sub_220F31B28();
      uint64_t v35 = v34;
      uint64_t v37 = v36;
      char v39 = v38 & 1;
      LODWORD(v52) = v38 & 1;
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v55 = sub_220F31FF8();
      uint64_t v53 = swift_getKeyPath();
      uint64_t v41 = swift_getKeyPath();
      v75[0] = v114[0];
      *(_DWORD *)((char *)v75 + 3) = *(_DWORD *)((char *)v114 + 3);
      v74[0] = *(_DWORD *)v113;
      *(_DWORD *)((char *)v74 + 3) = *(_DWORD *)&v113[3];
      v73[0] = *(_DWORD *)v112;
      *(_DWORD *)((char *)v73 + 3) = *(_DWORD *)&v112[3];
      DWORD1(v77) = *(_DWORD *)((char *)v114 + 3);
      *(_DWORD *)((char *)&v77 + 1) = v114[0];
      HIDWORD(v78) = *(_DWORD *)&v113[3];
      *(_DWORD *)((char *)&v78 + 9) = *(_DWORD *)v113;
      HIDWORD(v80) = *(_DWORD *)&v112[3];
      *(_DWORD *)((char *)&v80 + 9) = *(_DWORD *)v112;
      long long v76 = (unint64_t)v59;
      LOBYTE(v77) = 1;
      *((void *)&v77 + 1) = v57;
      *(void *)&long long v78 = v56;
      BYTE8(v78) = v58;
      *(void *)&long long v79 = v62;
      *((void *)&v79 + 1) = v61;
      *(void *)&long long v80 = v60;
      BYTE8(v80) = v63;
      *(void *)&long long v81 = v70;
      *((void *)&v81 + 1) = v69;
      *(void *)&long long v82 = v68;
      *((void *)&v82 + 1) = v67;
      *(void *)&long long v83 = v66;
      *((void *)&v83 + 1) = v65;
      char v89 = 0;
      v88[135] = v64;
      char v42 = v64;
      *(_OWORD *)&v88[119] = v83;
      *(_OWORD *)&v88[103] = v82;
      *(_OWORD *)&v88[87] = v81;
      *(_OWORD *)&unsigned char v88[7] = (unint64_t)v59;
      *(_OWORD *)&v88[71] = v80;
      *(_OWORD *)&v88[55] = v79;
      *(_OWORD *)&v88[39] = v78;
      *(_OWORD *)&v88[23] = v77;
      char v86 = v39;
      *(unsigned char *)(a4 + 24) = v54;
      *(unsigned char *)(a4 + 64) = v89;
      *(void *)(a4 + 193) = *(void *)&v88[128];
      *(unsigned char *)(a4 + 240) = v39;
      char v87 = 1;
      char v85 = 0;
      *(unsigned char *)(a4 + 216) = 1;
      *(void *)(a4 + 264) = 1;
      *(unsigned char *)(a4 + 272) = 0;
      *(unsigned char *)(a4 + 304) = 2;
      uint64_t v43 = v71;
      uint64_t v44 = v72;
      *(void *)a4 = v31;
      *(void *)(a4 + 8) = v43;
      *(void *)(a4 + 16) = v44;
      uint64_t v72 = v44;
      *(void *)(a4 + 32) = v18;
      *(void *)(a4 + 40) = v20;
      *(void *)(a4 + 48) = v22;
      *(void *)(a4 + 56) = v24;
      long long v45 = *(_OWORD *)&v88[16];
      *(_OWORD *)(a4 + 65) = *(_OWORD *)v88;
      long long v46 = *(_OWORD *)&v88[32];
      long long v47 = *(_OWORD *)&v88[48];
      long long v48 = *(_OWORD *)&v88[80];
      *(_OWORD *)(a4 + 129) = *(_OWORD *)&v88[64];
      *(_OWORD *)(a4 + 113) = v47;
      *(_OWORD *)(a4 + 97) = v46;
      *(_OWORD *)(a4 + 81) = v45;
      long long v49 = *(_OWORD *)&v88[96];
      *(_OWORD *)(a4 + 177) = *(_OWORD *)&v88[112];
      *(_OWORD *)(a4 + 161) = v49;
      *(_OWORD *)(a4 + 145) = v48;
      *(void *)(a4 + 208) = 0;
      *(void *)(a4 + 224) = v33;
      *(void *)(a4 + 232) = v35;
      *(void *)(a4 + 248) = v37;
      *(void *)(a4 + 256) = KeyPath;
      uint64_t v50 = v55;
      *(void *)(a4 + 280) = v53;
      *(void *)(a4 + 288) = v50;
      *(void *)(a4 + 296) = v41;
      char v84 = v42;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_220F18DBC((uint64_t)&v76);
      LOBYTE(v44) = v52;
      sub_220D3570C(v33, v35, v52);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_220D357E0(v33, v35, v44);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      v90[0] = v59;
      v90[1] = 0;
      char v91 = 1;
      *(_DWORD *)__int16 v92 = v75[0];
      *(_DWORD *)&v92[3] = *(_DWORD *)((char *)v75 + 3);
      uint64_t v93 = v57;
      uint64_t v94 = v56;
      char v95 = v58;
      *(_DWORD *)uint64_t v96 = v74[0];
      *(_DWORD *)&v96[3] = *(_DWORD *)((char *)v74 + 3);
      uint64_t v97 = v62;
      uint64_t v98 = v61;
      uint64_t v99 = v60;
      char v100 = v63;
      *(_DWORD *)&v101[3] = *(_DWORD *)((char *)v73 + 3);
      *(_DWORD *)uint64_t v101 = v73[0];
      uint64_t v102 = v70;
      uint64_t v103 = v69;
      uint64_t v104 = v68;
      uint64_t v105 = v67;
      uint64_t v106 = v66;
      uint64_t v107 = v65;
      char v108 = v64;
      sub_220F18EA4((uint64_t)v90);
      swift_release();
      return swift_bridgeObjectRelease();
    }
LABEL_12:
    swift_once();
    goto LABEL_11;
  }
  type metadata accessor for ActivityConfigViewModel();
  sub_220F1938C((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
  swift_bridgeObjectRetain();
  uint64_t result = sub_220F30E88();
  __break(1u);
  return result;
}

uint64_t sub_220F183E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v39 = type metadata accessor for TriggerRowView();
  sub_220D292B8();
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_220F31B28();
  uint64_t v5 = v4;
  char v7 = v6 & 1;
  sub_220F318C8();
  uint64_t v8 = sub_220F31AF8();
  uint64_t v10 = v9;
  char v12 = v11;
  swift_release();
  sub_220D357E0(v3, v5, v7);
  swift_bridgeObjectRelease();
  sub_220F31FE8();
  uint64_t v13 = sub_220F31A98();
  uint64_t v44 = v14;
  uint64_t v45 = v15;
  char v17 = v16;
  swift_release();
  sub_220D357E0(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  if (*(void *)(a1 + *(int *)(v39 + 52) + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_220F31B28();
    uint64_t v20 = v19;
    char v22 = v21 & 1;
    sub_220F319D8();
    char v37 = v17;
    uint64_t v23 = sub_220F31AF8();
    uint64_t v25 = v24;
    char v27 = v26;
    swift_release();
    sub_220D357E0(v18, v20, v22);
    swift_bridgeObjectRelease();
    sub_220F31FF8();
    uint64_t v28 = sub_220F31A98();
    uint64_t v40 = v29;
    uint64_t v42 = v28;
    LOBYTE(v20) = v30;
    uint64_t v38 = v31;
    swift_release();
    uint64_t v32 = v20 & 1;
    uint64_t v33 = v23;
    char v17 = v37;
    sub_220D357E0(v33, v25, v27 & 1);
    swift_bridgeObjectRelease();
    uint64_t v34 = swift_getKeyPath();
    char v35 = 1;
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v42 = 0;
    uint64_t v32 = 0;
    uint64_t v38 = 0;
    uint64_t v34 = 0;
    char v35 = 0;
  }
  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v44;
  *(unsigned char *)(a2 + 16) = v17 & 1;
  *(void *)(a2 + 24) = v45;
  *(void *)(a2 + 32) = KeyPath;
  *(void *)(a2 + 40) = 0;
  *(unsigned char *)(a2 + 48) = 1;
  *(void *)(a2 + 56) = v42;
  *(void *)(a2 + 64) = v40;
  *(void *)(a2 + 72) = v32;
  *(void *)(a2 + 80) = v38;
  *(void *)(a2 + 88) = v34;
  *(void *)(a2 + 96) = 0;
  *(unsigned char *)(a2 + 104) = v35;
  sub_220D3570C(v13, v44, v17 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_220F18E54(v42, v40, v32, v38);
  sub_220F188E0(v42, v40, v32, v38);
  sub_220D357E0(v13, v44, v17 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_220F18718()
{
  unint64_t result = qword_267F36018;
  if (!qword_267F36018)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36010);
    sub_220D25FB0(&qword_267F36020, &qword_267F36028);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36018);
  }
  return result;
}

uint64_t sub_220F187B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 128);
  char v4 = *(unsigned char *)(a1 + 136);
  uint64_t v5 = *(void *)(a1 + 184);
  uint64_t v6 = *(void *)(a1 + 192);
  uint64_t v8 = *(void *)(a1 + 200);
  uint64_t v9 = *(void *)(a1 + 176);
  uint64_t v11 = *(void *)(a1 + 256);
  uint64_t v12 = *(void *)(a1 + 248);
  char v10 = *(unsigned char *)(a1 + 264);
  swift_release();
  swift_bridgeObjectRelease();
  sub_220D357E0(v2, v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  sub_220F188E0(v9, v5, v6, v8);
  sub_220D357E0(v12, v11, v10);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_220F188E0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_220D357E0(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_220F18930()
{
  unint64_t result = qword_267F36038;
  if (!qword_267F36038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F35FF8);
    sub_220D25FB0(&qword_267F36040, &qword_267F35FF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36038);
  }
  return result;
}

uint64_t sub_220F189D0(unint64_t *a1, uint64_t *a2, uint64_t *a3, void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    a4();
    swift_getOpaqueTypeConformance2();
    sub_220F1938C((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_220F18AB4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = sub_220F32B38();
  uint64_t v5 = *(void *)(v4 - 8);
  __n128 v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v12 - v7;
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16))((char *)&v12 - v7, v1 + *(int *)(a1 + 40), v4, v6);
  uint64_t v9 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    char v10 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48))(v3);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v8, v3);
    if (v10)
    {
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
      goto LABEL_8;
    }
  }
  if (qword_267F2E160 != -1) {
LABEL_8:
  }
    swift_once();
  return sub_220F30408();
}

uint64_t sub_220F18D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  if (a7)
  {
    sub_220D3570C(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_220F18D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  if (a7)
  {
    sub_220D357E0(a4, a5, a6 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_220F18DBC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 104);
  sub_220D3570C(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_220F18E54(v2, v3, v4, v5);
  return a1;
}

uint64_t sub_220F18E54(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_220D3570C(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_220F18EA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 104);
  sub_220D357E0(*(void *)(a1 + 24), *(void *)(a1 + 32), *(unsigned char *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_220F188E0(v2, v3, v4, v5);
  return a1;
}

void *assignWithCopy for TriggerRowViewLeadingImage(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for TriggerRowViewLeadingImage()
{
  return &type metadata for TriggerRowViewLeadingImage;
}

uint64_t assignWithCopy for TriggerRowViewEnablementIndicator(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for TriggerRowViewEnablementIndicator(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TriggerRowViewEnablementIndicator(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TriggerRowViewEnablementIndicator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TriggerRowViewEnablementIndicator()
{
  return &type metadata for TriggerRowViewEnablementIndicator;
}

unint64_t sub_220F190F4()
{
  unint64_t result = qword_267F36070;
  if (!qword_267F36070)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36078);
    sub_220F189D0(&qword_267F36030, &qword_267F36008, &qword_267F35FF8, (void (*)(void))sub_220F18930);
    sub_220F189D0(&qword_267F36048, &qword_267F35FE0, &qword_267F36010, (void (*)(void))sub_220F18718);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36070);
  }
  return result;
}

uint64_t sub_220F191C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F191E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F19200()
{
  return sub_220F1923C((unint64_t *)&qword_267F36080, &qword_267F2EF80, (void (*)(void))sub_220F192E0);
}

uint64_t sub_220F1923C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_220D25FB0(&qword_267F2EA98, &qword_267F2EAA0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_220F192E0()
{
  unint64_t result = qword_267F36088;
  if (!qword_267F36088)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2EF78);
    sub_220F1938C(&qword_267F343D0, (void (*)(uint64_t))type metadata accessor for TriggerCardLeadingImageModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36088);
  }
  return result;
}

uint64_t sub_220F1938C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_220F193D8()
{
  unint64_t result = qword_267F36090;
  if (!qword_267F36090)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36098);
    sub_220F1923C(&qword_267F360A0, &qword_267F360A8, (void (*)(void))sub_220E60308);
    sub_220D25FB0(&qword_267F30800, (uint64_t *)&unk_267F33E80);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36090);
  }
  return result;
}

uint64_t sub_220F1949C()
{
  unint64_t v1 = *(void *)(v0 + 16);
  sub_220F32F68();
  swift_bridgeObjectRetain();
  sub_220F327B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220F1EA88((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_220F32FB8();
}

uint64_t sub_220F19520(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_220F327B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220F1EA88(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F19598()
{
  unint64_t v1 = *(void *)(v0 + 16);
  sub_220F32F68();
  swift_bridgeObjectRetain();
  sub_220F327B8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_220F1EA88((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_220F32FB8();
}

unint64_t sub_220F19618(void *a1, void *a2)
{
  unint64_t v2 = a1[2];
  uint64_t v3 = a2[2];
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_220F32EF8() & 1) == 0) {
    return 0;
  }
  return sub_220DE1594(v2, v3);
}

id sub_220F1976C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp()
{
  return self;
}

uint64_t sub_220F19814(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = v13 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    uint64_t v6 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = a2[5];
    *(void *)(a1 + 32) = a2[4];
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = a2[6];
    *(unsigned char *)(a1 + 56) = *((unsigned char *)a2 + 56);
    uint64_t v8 = a2[9];
    *(void *)(a1 + 64) = a2[8];
    *(void *)(a1 + 72) = v8;
    uint64_t v9 = a2[11];
    uint64_t v10 = *(int *)(a3 + 40);
    uint64_t v15 = (void *)(a1 + v10);
    uint64_t v11 = (uint64_t *)((char *)a2 + v10);
    *(void *)(a1 + 80) = a2[10];
    *(void *)(a1 + 88) = v9;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v15, v11, v12);
    }
    else
    {
      *uint64_t v15 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_220F199CC(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    return v6(v4, v5);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_220F19AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  uint64_t v9 = *(int *)(a3 + 40);
  uint64_t v13 = (void *)(a1 + v9);
  uint64_t v10 = (void *)(a2 + v9);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v13, v10, v11);
  }
  else
  {
    void *v13 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_220F19C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 40);
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_220D25B68(a1 + v6, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_220F19DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  uint64_t v5 = *(int *)(a3 + 40);
  uint64_t v6 = (const void *)(a2 + v5);
  uint64_t v7 = (void *)(a1 + v5);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_220F30AD8();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v6, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v6, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t sub_220F19EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v8 = *(int *)(a3 + 40);
    uint64_t v9 = (void *)(a1 + v8);
    uint64_t v10 = (const void *)(a2 + v8);
    sub_220D25B68(a1 + v8, &qword_267F33C90);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_220F30AD8();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_220F1A074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F1A088);
}

uint64_t sub_220F1A088(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 40);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_220F1A13C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F1A150);
}

uint64_t sub_220F1A150(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 40);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for SuggestionsAppsPickerView()
{
  uint64_t result = qword_267F360C0;
  if (!qword_267F360C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_220F1A248()
{
  sub_220D7A610();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_220F1A304()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F1A320@<X0>(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v2 = sub_220F314E8();
  uint64_t v30 = *(void *)(v2 - 8);
  uint64_t v31 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v28 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_220F314F8();
  uint64_t v34 = *(void *)(v4 - 8);
  uint64_t v35 = v4;
  MEMORY[0x270FA5388](v4);
  char v27 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_220F30CE8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F360D0);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F360D8);
  uint64_t v32 = *(void *)(v14 - 8);
  uint64_t v33 = v14;
  MEMORY[0x270FA5388](v14);
  char v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F360E0);
  sub_220D25FB0(&qword_267F360E8, &qword_267F360E0);
  sub_220F31A28();
  sub_220F30CD8();
  uint64_t v17 = sub_220D25FB0(&qword_267F360F0, &qword_267F360D0);
  uint64_t v29 = v16;
  sub_220F31E58();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v18 = v27;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v19 = *(void *)(v26 + 88);
  long long v38 = *(_OWORD *)(v26 + 72);
  uint64_t v39 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F30558);
  sub_220F32178();
  uint64_t v20 = v28;
  sub_220F314D8();
  sub_220F314C8();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v20, v31);
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  *(void *)&long long v38 = sub_220F30408();
  *((void *)&v38 + 1) = v21;
  uint64_t v40 = v10;
  uint64_t v41 = v6;
  uint64_t v42 = v17;
  uint64_t v43 = MEMORY[0x263F18B88];
  swift_getOpaqueTypeConformance2();
  sub_220D292B8();
  uint64_t v22 = v33;
  uint64_t v23 = v29;
  sub_220F31B98();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v35);
  return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v23, v22);
}

uint64_t sub_220F1A874@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v70 = a2;
  uint64_t v3 = type metadata accessor for SuggestionsAppsPickerView();
  uint64_t v62 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v63 = v4;
  uint64_t v64 = (uint64_t)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F360F8);
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v69 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v67 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v66 = (char *)&v53 - v8;
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36100);
  MEMORY[0x270FA5388](v58);
  uint64_t v55 = (uint64_t)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36108);
  MEMORY[0x270FA5388](v59);
  int v54 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36110);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36118);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36120);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v61 = (uint64_t)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v53 - v21;
  MEMORY[0x270FA5388](v23);
  uint64_t v56 = (uint64_t)&v53 - v24;
  MEMORY[0x270FA5388](v25);
  uint64_t v60 = (uint64_t)&v53 - v26;
  *(void *)uint64_t v13 = sub_220F31348();
  *((void *)v13 + 1) = 0;
  v13[16] = 0;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36128);
  sub_220F1B06C(a1, (uint64_t)&v13[*(int *)(v27 + 44)]);
  sub_220F30B58();
  uint64_t v28 = sub_220D25FB0(&qword_267F36130, &qword_267F36110);
  uint64_t v57 = v11;
  sub_220F31CB8();
  sub_220D25B68((uint64_t)v13, &qword_267F36110);
  long long v29 = *(_OWORD *)(a1 + 72);
  uint64_t v65 = a1;
  uint64_t v30 = *(void *)(a1 + 88);
  long long v71 = v29;
  uint64_t v72 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F30558);
  sub_220F32158();
  uint64_t v32 = v73;
  unint64_t v31 = v74;
  swift_bridgeObjectRelease();
  uint64_t v33 = HIBYTE(v31) & 0xF;
  if ((v31 & 0x2000000000000000) == 0) {
    uint64_t v33 = v32 & 0xFFFFFFFFFFFFLL;
  }
  if (v33)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v55, v17, v14);
    swift_storeEnumTagMultiPayload();
    sub_220F1E690();
    *(void *)&long long v71 = v57;
    *((void *)&v71 + 1) = v28;
    swift_getOpaqueTypeConformance2();
    sub_220F31488();
  }
  else
  {
    id v34 = objc_msgSend(self, sel_systemBackgroundColor);
    *(void *)&long long v71 = MEMORY[0x223C74C60](v34);
    swift_retain();
    uint64_t v35 = sub_220F32298();
    uint64_t v36 = (uint64_t)v54;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v54, v17, v14);
    swift_release();
    *(void *)(v36 + *(int *)(v59 + 36)) = v35;
    sub_220D26548(v36, v55, &qword_267F36108);
    swift_storeEnumTagMultiPayload();
    sub_220F1E690();
    *(void *)&long long v71 = v57;
    *((void *)&v71 + 1) = v28;
    swift_getOpaqueTypeConformance2();
    sub_220F31488();
    sub_220D25B68(v36, &qword_267F36108);
  }
  uint64_t v37 = v56;
  sub_220D39114((uint64_t)v22, v56, &qword_267F36120);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  uint64_t v38 = v60;
  sub_220D39114(v37, v60, &qword_267F36120);
  uint64_t v39 = v65;
  *(void *)&long long v71 = sub_220F1CEF4();
  uint64_t v40 = v64;
  sub_220F1F008(v39, v64, (uint64_t (*)(void))type metadata accessor for SuggestionsAppsPickerView);
  unint64_t v41 = (*(unsigned __int8 *)(v62 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
  uint64_t v42 = swift_allocObject();
  sub_220F1E794(v40, v42 + v41);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36150);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36158);
  sub_220D25FB0(&qword_267F36160, &qword_267F36150);
  sub_220F1E878();
  sub_220F1EA34();
  uint64_t v43 = v66;
  sub_220F32358();
  uint64_t v44 = v61;
  sub_220D26548(v38, v61, &qword_267F36120);
  long long v46 = v67;
  uint64_t v45 = v68;
  long long v47 = *(void (**)(char *, char *, uint64_t))(v68 + 16);
  uint64_t v48 = v69;
  v47(v67, v43, v69);
  uint64_t v49 = v70;
  sub_220D26548(v44, v70, &qword_267F36120);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361A0);
  v47((char *)(v49 + *(int *)(v50 + 48)), v46, v48);
  char v51 = *(void (**)(char *, uint64_t))(v45 + 8);
  v51(v43, v48);
  sub_220D25B68(v38, &qword_267F36120);
  v51(v46, v48);
  return sub_220D25B68(v44, &qword_267F36120);
}

uint64_t sub_220F1B06C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v98 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B8);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v97 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_220F30E58();
  MEMORY[0x270FA5388](v95);
  uint64_t v96 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_220F30AD8();
  uint64_t v92 = *(void *)(v6 - 8);
  uint64_t v93 = v6;
  MEMORY[0x270FA5388](v6);
  char v89 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v88 = (uint64_t)&v77 - v9;
  uint64_t v80 = sub_220F31578();
  MEMORY[0x270FA5388](v80);
  long long v83 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_220F323B8();
  uint64_t v78 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (_OWORD *)((char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361C0);
  uint64_t v81 = *(void *)(v82 - 8);
  MEMORY[0x270FA5388](v82);
  uint64_t v15 = (char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361C8);
  MEMORY[0x270FA5388](v79);
  uint64_t v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361D0);
  MEMORY[0x270FA5388](v84);
  uint64_t v90 = (uint64_t)&v77 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361D8);
  MEMORY[0x270FA5388](v85);
  uint64_t v94 = (uint64_t)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  char v87 = (char *)&v77 - v21;
  MEMORY[0x270FA5388](v22);
  uint64_t v91 = (uint64_t)&v77 - v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361E0);
  MEMORY[0x270FA5388](v24 - 8);
  uint64_t v26 = (char *)&v77 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361E8);
  MEMORY[0x270FA5388](v27);
  long long v29 = (char *)&v77 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&v77 - v31;
  long long v33 = *(_OWORD *)(a1 + 72);
  uint64_t v86 = a1;
  uint64_t v34 = *(void *)(a1 + 88);
  long long v99 = v33;
  uint64_t v100 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F30558);
  sub_220F32158();
  uint64_t v36 = v101;
  unint64_t v35 = v102;
  swift_bridgeObjectRelease();
  uint64_t v37 = HIBYTE(v35) & 0xF;
  if ((v35 & 0x2000000000000000) == 0) {
    uint64_t v37 = v36 & 0xFFFFFFFFFFFFLL;
  }
  if (v37)
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v98, 1, 1, v38);
  }
  else
  {
    *(void *)uint64_t v26 = sub_220F31228();
    *((void *)v26 + 1) = 0;
    v26[16] = 0;
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361F8);
    sub_220F1BB84((uint64_t)&v26[*(int *)(v40 + 44)]);
    char v41 = sub_220F31808();
    sub_220D26548((uint64_t)v26, (uint64_t)v29, &qword_267F361E0);
    uint64_t v42 = &v29[*(int *)(v27 + 36)];
    *uint64_t v42 = v41;
    *(_OWORD *)(v42 + 8) = 0u;
    *(_OWORD *)(v42 + 24) = 0u;
    v42[40] = 1;
    sub_220D25B68((uint64_t)v26, &qword_267F361E0);
    long long v77 = v32;
    sub_220D39114((uint64_t)v29, (uint64_t)v32, &qword_267F361E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ECA0);
    sub_220F323C8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_220F35110;
    _OWORD *v13 = xmmword_220F37E70;
    (*(void (**)(_OWORD *, void, uint64_t))(v78 + 104))(v13, *MEMORY[0x263F1B8C0], v11);
    uint64_t v43 = sub_220F323D8();
    MEMORY[0x270FA5388](v43);
    sub_220F31348();
    LODWORD(v99) = 0;
    sub_220F1F528(&qword_267F30150, MEMORY[0x263F19D28]);
    sub_220F32FC8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F36200);
    sub_220F1EEEC();
    sub_220F324D8();
    char v44 = sub_220F31818();
    uint64_t v45 = v81;
    uint64_t v46 = v82;
    (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v17, v15, v82);
    long long v47 = &v17[*(int *)(v79 + 36)];
    *long long v47 = v44;
    *(_OWORD *)(v47 + 8) = 0u;
    *(_OWORD *)(v47 + 24) = 0u;
    v47[40] = 1;
    (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v46);
    type metadata accessor for SuggestionsAppsPickerView();
    uint64_t v48 = v88;
    sub_220F11B30(v88);
    uint64_t v50 = v92;
    uint64_t v49 = v93;
    char v51 = v89;
    (*(void (**)(char *, void, uint64_t))(v92 + 104))(v89, *MEMORY[0x263F184F8], v93);
    char v52 = sub_220F30AC8();
    uint64_t v53 = *(void (**)(char *, uint64_t))(v50 + 8);
    v53(v51, v49);
    v53((char *)v48, v49);
    int v54 = self;
    uint64_t v55 = &selRef_secondarySystemGroupedBackgroundColor;
    if ((v52 & 1) == 0) {
      uint64_t v55 = &selRef_systemGroupedBackgroundColor;
    }
    uint64_t v56 = MEMORY[0x223C74C60]([v54 *v55]);
    char v57 = sub_220F31818();
    uint64_t v58 = v90;
    sub_220D26548((uint64_t)v17, v90, &qword_267F361C8);
    uint64_t v59 = v58 + *(int *)(v84 + 36);
    *(void *)uint64_t v59 = v56;
    *(unsigned char *)(v59 + 8) = v57;
    sub_220D25B68((uint64_t)v17, &qword_267F361C8);
    uint64_t v60 = v96;
    uint64_t v61 = &v96[*(int *)(v95 + 20)];
    uint64_t v62 = *MEMORY[0x263F19860];
    uint64_t v63 = sub_220F312A8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v63 - 8) + 104))(v61, v62, v63);
    __asm { FMOV            V0.2D, #12.0 }
    *uint64_t v60 = _Q0;
    uint64_t v69 = (uint64_t)v87;
    uint64_t v70 = (uint64_t)&v87[*(int *)(v85 + 36)];
    sub_220F1F008((uint64_t)v60, v70, MEMORY[0x263F19048]);
    *(_WORD *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
    sub_220D26548(v58, v69, &qword_267F361D0);
    sub_220D7E618((uint64_t)v60);
    sub_220D25B68(v58, &qword_267F361D0);
    uint64_t v71 = v91;
    sub_220D39114(v69, v91, &qword_267F361D8);
    uint64_t v72 = (uint64_t)v77;
    sub_220D26548((uint64_t)v77, (uint64_t)v29, &qword_267F361E8);
    uint64_t v73 = v94;
    sub_220D26548(v71, v94, &qword_267F361D8);
    uint64_t v74 = v97;
    sub_220D26548((uint64_t)v29, v97, &qword_267F361E8);
    uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36210);
    sub_220D26548(v73, v74 + *(int *)(v75 + 48), &qword_267F361D8);
    sub_220D25B68(v71, &qword_267F361D8);
    sub_220D25B68(v72, &qword_267F361E8);
    sub_220D25B68(v73, &qword_267F361D8);
    sub_220D25B68((uint64_t)v29, &qword_267F361E8);
    uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361F0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v76 - 8) + 56))(v74, 0, 1, v76);
    return sub_220D39114(v74, v98, &qword_267F361B8);
  }
}

uint64_t sub_220F1BB84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v52 = a1;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBC8);
  MEMORY[0x270FA5388](v46);
  uint64_t v50 = (uint64_t *)((char *)&v43 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBF0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v48 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F34C78);
  MEMORY[0x270FA5388](v44);
  uint64_t v5 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36228);
  MEMORY[0x270FA5388](v47);
  uint64_t v51 = (uint64_t)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v45 = (uint64_t)&v43 - v8;
  MEMORY[0x270FA5388](v9);
  uint64_t v49 = (uint64_t)&v43 - v10;
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_220F30408();
  uint64_t v54 = v11;
  sub_220D292B8();
  uint64_t v12 = sub_220F31B28();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  sub_220F319D8();
  uint64_t v17 = sub_220F31AF8();
  uint64_t v19 = v18;
  char v21 = v20;
  swift_release();
  sub_220D357E0(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_220F31FF8();
  uint64_t v22 = sub_220F31A98();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release();
  v26 &= 1u;
  sub_220D357E0(v17, v19, v21 & 1);
  swift_bridgeObjectRelease();
  uint64_t v29 = *MEMORY[0x263F1A7B8];
  uint64_t v30 = sub_220F31AD8();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = (uint64_t)v48;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 104))(v48, v29, v30);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v31 + 56))(v32, 0, 1, v30);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v34 = v50;
  sub_220D26548(v32, (uint64_t)v50 + *(int *)(v46 + 28), &qword_267F2EBF0);
  *uint64_t v34 = KeyPath;
  sub_220D26548((uint64_t)v34, (uint64_t)&v5[*(int *)(v44 + 36)], &qword_267F2EBC8);
  *(void *)uint64_t v5 = v22;
  *((void *)v5 + 1) = v24;
  v5[16] = v26;
  *((void *)v5 + 3) = v28;
  sub_220D3570C(v22, v24, v26);
  swift_bridgeObjectRetain();
  sub_220D25B68((uint64_t)v34, &qword_267F2EBC8);
  sub_220D25B68(v32, &qword_267F2EBF0);
  sub_220D357E0(v22, v24, v26);
  swift_bridgeObjectRelease();
  uint64_t v35 = swift_getKeyPath();
  uint64_t v36 = v45;
  sub_220D26548((uint64_t)v5, v45, &qword_267F34C78);
  uint64_t v37 = v36 + *(int *)(v47 + 36);
  *(void *)uint64_t v37 = v35;
  *(void *)(v37 + 8) = 1;
  *(unsigned char *)(v37 + 16) = 0;
  sub_220D25B68((uint64_t)v5, &qword_267F34C78);
  uint64_t v38 = v49;
  sub_220D39114(v36, v49, &qword_267F36228);
  uint64_t v39 = v51;
  sub_220D26548(v38, v51, &qword_267F36228);
  uint64_t v40 = v52;
  sub_220D26548(v39, v52, &qword_267F36228);
  uint64_t v41 = v40 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F36230) + 48);
  *(void *)uint64_t v41 = 0;
  *(unsigned char *)(v41 + 8) = 1;
  sub_220D25B68(v38, &qword_267F36228);
  return sub_220D25B68(v39, &qword_267F36228);
}

uint64_t sub_220F1C09C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SuggestionsAppsPickerView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](v2 - 8);
  unint64_t v5 = *(void *)(a1 + 40);
  v13[2] = a1;
  swift_bridgeObjectRetain();
  v13[8] = sub_220EB4BC0((uint64_t (*)(uint64_t *))sub_220F1F070, v13, v5);
  sub_220F1F008(a1, (uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SuggestionsAppsPickerView);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_220F1E794((uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2E4B0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36218);
  sub_220D25FB0(&qword_267F361A8, &qword_267F2E4B0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F30170);
  uint64_t v9 = sub_220F30E28();
  uint64_t v10 = sub_220D25FB0(&qword_267F30168, &qword_267F30170);
  uint64_t v11 = sub_220F1F528(&qword_267F2EC90, MEMORY[0x263F18FD0]);
  v13[4] = v8;
  v13[5] = v9;
  v13[6] = v10;
  v13[7] = v11;
  swift_getOpaqueTypeConformance2();
  sub_220F1F528(&qword_267F36220, (void (*)(uint64_t))type metadata accessor for InstalledApp);
  return sub_220F32358();
}

BOOL sub_220F1C344(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  char v4 = sub_220EAE778(v2, v3);
  swift_bridgeObjectRelease();
  return (v4 & 1) == 0;
}

uint64_t sub_220F1C3A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v24 = a3;
  uint64_t v5 = sub_220F30E28();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  uint64_t v23 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for SuggestionsAppsPickerView();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30170);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  char v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *a1;
  sub_220F1F008(a2, (uint64_t)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SuggestionsAppsPickerView);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v18 = swift_allocObject();
  sub_220F1E794((uint64_t)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
  *(void *)(v18 + ((v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = v16;
  uint64_t v25 = v16;
  uint64_t v26 = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F30198);
  sub_220D822F8();
  sub_220F321A8();
  sub_220F30E18();
  sub_220D25FB0(&qword_267F30168, &qword_267F30170);
  sub_220F1F528(&qword_267F2EC90, MEMORY[0x263F18FD0]);
  uint64_t v19 = v22;
  sub_220F31BA8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_220F1C6D4(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v5 = a1[4];
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B0);
  MEMORY[0x223C75070](&v13);
  char v7 = sub_220EB526C(a2, v13);
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x223C75070](&v13, v6);
    sub_220E05808(a2);
    swift_release();
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    MEMORY[0x223C75070](&v9, v6);
    sub_220D1743C(&v13, a2);
    swift_release();
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
  }
  sub_220F322B8();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_220F1C840@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v46 = a3;
  uint64_t v43 = sub_220F312F8();
  uint64_t v45 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v44 = &v34[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for SuggestionsAppsPickerView();
  uint64_t v41 = *(void *)(v6 - 8);
  uint64_t v7 = *(void *)(v41 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = &v34[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = (int *)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F301B0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (uint64_t *)&v34[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F30198);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v42 = &v34[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for AppIconCache();
  sub_220F1F528((unint64_t *)&qword_267F301C0, (void (*)(uint64_t))type metadata accessor for AppIconCache);
  swift_retain();
  uint64_t v14 = sub_220F30EA8();
  uint64_t v39 = v15;
  uint64_t v40 = v14;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v17 = *(void *)(a1 + 24);
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v36 = KeyPath;
  uint64_t v37 = v17;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_220F31EA8();
  uint64_t v47 = *(void *)(a2 + 16);
  long long v48 = *(_OWORD *)(a2 + 24);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B0);
  MEMORY[0x223C75070](&v49);
  int v35 = sub_220EB526C(a1, v49);
  swift_bridgeObjectRelease();
  sub_220F1F008(a2, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for SuggestionsAppsPickerView);
  unint64_t v20 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  unint64_t v21 = (v7 + v20 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v22 = swift_allocObject();
  sub_220F1E794((uint64_t)v8, v22 + v20);
  *(void *)(v22 + v21) = a1;
  *uint64_t v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  uint64_t v23 = (char *)v11 + v9[9];
  *(void *)uint64_t v23 = a1;
  *((void *)v23 + 1) = 0x4050000000000000;
  uint64_t v24 = v39;
  *((void *)v23 + 2) = v40;
  *((void *)v23 + 3) = v24;
  *((void *)v23 + 4) = v36;
  v23[40] = 0;
  uint64_t v25 = (uint64_t *)((char *)v11 + v9[10]);
  *uint64_t v25 = v37;
  v25[1] = v18;
  uint64_t v26 = (uint64_t *)((char *)v11 + v9[11]);
  void *v26 = 0x72616D6B63656863;
  v26[1] = 0xE90000000000006BLL;
  *(uint64_t *)((char *)v11 + v9[12]) = v38;
  uint64_t v27 = (char *)v11 + v9[13];
  LOBYTE(v49) = v35 & 1;
  swift_retain();
  sub_220F32148();
  uint64_t v28 = v48;
  *uint64_t v27 = v47;
  *((void *)v27 + 1) = v28;
  uint64_t v29 = (uint64_t (**)(char))((char *)v11 + v9[14]);
  *uint64_t v29 = sub_220F1F484;
  v29[1] = (uint64_t (*)(char))v22;
  uint64_t v47 = *(void *)(a2 + 16);
  long long v48 = *(_OWORD *)(a2 + 24);
  MEMORY[0x223C75070](&v49, v19);
  LOBYTE(v27) = sub_220EB526C(a1, v49);
  swift_bridgeObjectRelease();
  if (v27)
  {
    uint64_t v30 = v44;
    sub_220F312B8();
    uint64_t v31 = v43;
  }
  else
  {
    uint64_t v47 = MEMORY[0x263F8EE78];
    sub_220F1F528((unint64_t *)&unk_267F301D0, MEMORY[0x263F19938]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FF10);
    sub_220D25FB0(&qword_267F301E0, &qword_267F2FF10);
    uint64_t v30 = v44;
    uint64_t v31 = v43;
    sub_220F32BE8();
  }
  sub_220D25FB0(&qword_267F301A8, (uint64_t *)&unk_267F301B0);
  uint64_t v32 = (uint64_t)v42;
  sub_220F31D78();
  (*(void (**)(unsigned char *, uint64_t))(v45 + 8))(v30, v31);
  sub_220D25B68((uint64_t)v11, (uint64_t *)&unk_267F301B0);
  return sub_220D39114(v32, v46, &qword_267F30198);
}

uint64_t sub_220F1CDB0(char a1, void *a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v5 = a2[3];
    uint64_t v6 = a2[4];
    uint64_t v12 = a2[2];
    uint64_t v4 = v12;
    uint64_t v13 = v5;
    uint64_t v14 = v6;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B0);
    MEMORY[0x223C75070](&v11);
    sub_220D1743C(&v15, a3);
    swift_release();
    uint64_t v12 = v4;
    uint64_t v13 = v5;
    uint64_t v14 = v6;
  }
  else
  {
    uint64_t v7 = a2[2];
    uint64_t v8 = a2[3];
    uint64_t v9 = a2[4];
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B0);
    MEMORY[0x223C75070](&v15);
    sub_220E05808(a3);
    swift_release();
    uint64_t v12 = v7;
    uint64_t v13 = v8;
    uint64_t v14 = v9;
    uint64_t v11 = v15;
  }
  sub_220F322B8();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_220F1CEF4()
{
  id v2 = objc_msgSend(self, sel_currentCollation);
  swift_retain();
  unint64_t v3 = sub_220EB5374();
  swift_release();
  if (v3 >> 62) {
    goto LABEL_53;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  unint64_t v5 = MEMORY[0x263F8EE78];
  if (v4)
  {
    unint64_t v57 = MEMORY[0x263F8EE78];
    sub_220F32DD8();
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_55;
    }
    uint64_t v6 = 0;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v7 = MEMORY[0x223C75B40](v6, v3);
      }
      else
      {
        uint64_t v7 = *(void *)(v3 + 8 * v6 + 32);
        swift_retain();
      }
      ++v6;
      uint64_t v8 = (objc_class *)type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp();
      uint64_t v9 = (char *)objc_allocWithZone(v8);
      *(void *)&v9[OBJC_IVAR____TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp_installedApp] = v7;
      uint64_t v10 = *(void *)(v7 + 32);
      uint64_t v11 = &v9[OBJC_IVAR____TtCV15FocusSettingsUI25SuggestionsAppsPickerView19WrappedInstalledApp_displayName];
      *(void *)uint64_t v11 = *(void *)(v7 + 24);
      *((void *)v11 + 1) = v10;
      v56.receiver = v9;
      v56.super_class = v8;
      swift_bridgeObjectRetain();
      objc_msgSendSuper2(&v56, sel_init);
      sub_220F32DB8();
      sub_220F32DE8();
      sub_220F32DF8();
      sub_220F32DC8();
    }
    while (v4 != v6);
    unint64_t v12 = v57;
    swift_bridgeObjectRelease();
    unint64_t v5 = MEMORY[0x263F8EE78];
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v12 = MEMORY[0x263F8EE78];
  }
  sub_220EAE964(v12);
  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_220F32848();
  swift_bridgeObjectRelease();
  uint64_t v53 = sel_displayName;
  id v14 = objc_msgSend(v2, sel_sortedArrayFromArray_collationStringSelector_, v13, sel_displayName);

  uint64_t v15 = sub_220F32858();
  unint64_t v1 = sub_220F1DD34(v15);
  swift_bridgeObjectRelease();
  if (!v1)
  {

    return MEMORY[0x263F8EE78];
  }
  id v16 = objc_msgSend(v2, sel_sectionTitles);
  unint64_t v0 = (void *)sub_220F32858();

  int64_t v17 = v0[2];
  id v55 = v2;
  if (v17)
  {
    unint64_t v57 = v5;
    sub_220E87AB4(0, v17, 0);
    unint64_t v3 = v57;
    uint64_t v51 = v0;
    v0 += 5;
    do
    {
      uint64_t v18 = *(v0 - 1);
      uint64_t v19 = *v0;
      unint64_t v57 = v3;
      unint64_t v21 = *(void *)(v3 + 16);
      unint64_t v20 = *(void *)(v3 + 24);
      swift_bridgeObjectRetain();
      if (v21 >= v20 >> 1)
      {
        sub_220E87AB4(v20 > 1, v21 + 1, 1);
        unint64_t v3 = v57;
      }
      v0 += 2;
      *(void *)(v3 + 16) = v21 + 1;
      uint64_t v22 = (void *)(v3 + 24 * v21);
      v22[4] = v18;
      v22[5] = v19;
      v22[6] = MEMORY[0x263F8EE78];
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    id v2 = v55;
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v3 = MEMORY[0x263F8EE78];
  }
  unint64_t v57 = v3;
  if (v1 >> 62)
  {
LABEL_55:
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_220F32E48();
    swift_bridgeObjectRelease();
    if (!v24)
    {
LABEL_56:
      swift_bridgeObjectRelease();
      unint64_t v0 = *(void **)(v3 + 16);
      if (v0) {
        goto LABEL_38;
      }
      goto LABEL_57;
    }
    goto LABEL_23;
  }
  uint64_t v24 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v24) {
    goto LABEL_56;
  }
LABEL_23:
  if (v24 < 1)
  {
    __break(1u);
LABEL_59:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_220F32E48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v30) {
      goto LABEL_60;
    }
LABEL_40:
    if (v0 != (void *)1)
    {
      uint64_t v31 = (void *)(v3 + 72);
      uint64_t v30 = 1;
      do
      {
        if (*v31 >> 62)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v1 = sub_220F32E48();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (!v1) {
            goto LABEL_60;
          }
        }
        else
        {
          unint64_t v1 = *(void *)((*v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!v1) {
            goto LABEL_60;
          }
        }
        uint64_t v32 = (void *)(v30 + 1);
        if (__OFADD__(v30, 1)) {
          goto LABEL_52;
        }
        ++v30;
        v31 += 3;
      }
      while (v32 != v0);
    }
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v30 = (uint64_t)v0;
LABEL_62:
    int64_t v33 = *(void *)(v3 + 16);
    if (v33 < v30) {
      goto LABEL_91;
    }
LABEL_63:
    sub_220E09E54(v30, v33);

    return v57;
  }
  uint64_t v25 = 0;
  unint64_t v0 = (void *)(v1 & 0xC000000000000001);
  do
  {
    if (v0) {
      id v26 = (id)MEMORY[0x223C75B40](v25, v1);
    }
    else {
      id v26 = *(id *)(v1 + 8 * v25 + 32);
    }
    uint64_t v27 = v26;
    unint64_t v28 = (unint64_t)objc_msgSend(v2, sel_sectionForObject_collationStringSelector_, v26, v53, v51);
    swift_retain();
    if (swift_isUniquelyReferenced_nonNull_native())
    {
      if ((v28 & 0x8000000000000000) != 0) {
        goto LABEL_51;
      }
    }
    else
    {
      unint64_t v3 = (unint64_t)sub_220E07D78((void *)v3);
      if ((v28 & 0x8000000000000000) != 0) {
        goto LABEL_51;
      }
    }
    if (v28 >= *(void *)(v3 + 16))
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      swift_bridgeObjectRetain();
      uint64_t v4 = sub_220F32E48();
      swift_bridgeObjectRelease();
      goto LABEL_3;
    }
    MEMORY[0x223C75600]();
    if (*(void *)((*(void *)(v3 + 24 * v28 + 48) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)(v3 + 24 * v28 + 48) & 0xFFFFFFFFFFFFFF8)
                                                                                                  + 0x18) >> 1)
      sub_220F32888();
    ++v25;
    sub_220F328A8();
    sub_220F32878();

    id v2 = v55;
  }
  while (v24 != v25);
  swift_bridgeObjectRelease();
  unint64_t v57 = v3;
  unint64_t v0 = *(void **)(v3 + 16);
  if (!v0)
  {
LABEL_57:
    int64_t v33 = 0;
    uint64_t v30 = 0;
    goto LABEL_63;
  }
LABEL_38:
  unint64_t v29 = *(void *)(v3 + 48);
  if (v29 >> 62) {
    goto LABEL_59;
  }
  uint64_t v30 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v30) {
    goto LABEL_40;
  }
LABEL_60:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v34 = v30 + 1;
  if (__OFADD__(v30, 1)) {
    goto LABEL_92;
  }
  if ((void *)v34 == v0) {
    goto LABEL_62;
  }
  uint64_t v35 = 24 * v30;
  uint64_t v36 = v30 + 1;
  uint64_t v52 = v30 + 1;
  while (2)
  {
    if ((v34 & 0x8000000000000000) == 0)
    {
      if ((unint64_t)v36 >= *(void *)(v3 + 16)) {
        goto LABEL_84;
      }
      uint64_t v37 = (void *)(v3 + v35);
      unint64_t v38 = *(void *)(v3 + v35 + 72);
      if (v38 >> 62)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_220F32E48();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v50) {
          goto LABEL_69;
        }
      }
      else if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_69:
        if (v36 != v30)
        {
          if (v30 < 0) {
            goto LABEL_87;
          }
          unint64_t v39 = *(void *)(v3 + 16);
          if (v30 >= v39) {
            goto LABEL_88;
          }
          if (v36 >= (uint64_t)v39) {
            goto LABEL_89;
          }
          uint64_t v40 = (uint64_t *)(v3 + 32 + 24 * v30);
          uint64_t v41 = v40[1];
          uint64_t v54 = *v40;
          uint64_t v42 = v40[2];
          uint64_t v44 = v37[7];
          uint64_t v43 = v37[8];
          uint64_t v45 = v37[9];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v3 = (unint64_t)sub_220E07D78((void *)v3);
          }
          uint64_t v46 = (void *)(v3 + 24 * v30);
          v46[4] = v44;
          v46[5] = v43;
          v46[6] = v45;
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v36 >= *(void *)(v3 + 16)) {
            goto LABEL_90;
          }
          uint64_t v47 = (void *)(v3 + v35);
          v47[7] = v54;
          v47[8] = v41;
          v47[9] = v42;
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          unint64_t v57 = v3;
          id v2 = v55;
          uint64_t v34 = v52;
        }
        if (__OFADD__(v30++, 1)) {
          goto LABEL_86;
        }
      }
      uint64_t v49 = v36 + 1;
      if (__OFADD__(v36, 1)) {
        goto LABEL_85;
      }
      v35 += 24;
      ++v36;
      if (v49 == *(void *)(v3 + 16)) {
        goto LABEL_62;
      }
      continue;
    }
    break;
  }
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
  return result;
}

uint64_t sub_220F1D6AC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F30558);
  sub_220F32158();
  unint64_t v2 = sub_220F1EB58(v5, v6, v1);
  swift_bridgeObjectRelease();
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_220F32E48();
    swift_bridgeObjectRelease();
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  if (*(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    sub_220D292B8();
    swift_bridgeObjectRetain();
    sub_220F31B28();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36178);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36188);
  sub_220F1E900();
  sub_220F1E96C();
  sub_220F32378();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F1D840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SuggestionsAppsPickerView();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4 - 8);
  v10[1] = a1;
  swift_getKeyPath();
  sub_220F1F008(a2, (uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SuggestionsAppsPickerView);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  sub_220F1E794((uint64_t)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2E4B0);
  sub_220D25FB0(&qword_267F361A8, &qword_267F2E4B0);
  sub_220F1F528(&qword_267F2E4A8, (void (*)(uint64_t))type metadata accessor for InstalledApp);
  sub_220F1E9E0();
  return sub_220F32348();
}

uint64_t sub_220F1DA20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for SuggestionsAppsPickerView();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v9 = *a1;
  uint64_t v15 = *(void *)(a2 + 16);
  long long v16 = *(_OWORD *)(a2 + 24);
  swift_retain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B0);
  MEMORY[0x223C75070](&v17, v10);
  char v11 = sub_220EB526C(v9, v17);
  swift_bridgeObjectRelease();
  sub_220F1F008(a2, (uint64_t)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for SuggestionsAppsPickerView);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  sub_220F1E794((uint64_t)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v13 + v12);
  *(void *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8)) = v9;
  *(void *)a3 = sub_220D3029C;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = v9;
  *(unsigned char *)(a3 + 32) = v11 & 1;
  *(void *)(a3 + 40) = sub_220F1EE58;
  *(void *)(a3 + 48) = v13;
  return swift_retain();
}

uint64_t sub_220F1DBC8(uint64_t a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  uint64_t v12 = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F361B0);
  MEMORY[0x223C75070](&v13);
  char v7 = sub_220EB526C(a1, v13);
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x223C75070](&v13, v6);
    sub_220E05808(a1);
    swift_release();
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    uint64_t v9 = v13;
  }
  else
  {
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    MEMORY[0x223C75070](&v9, v6);
    sub_220D1743C(&v13, a1);
    swift_release();
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    uint64_t v12 = v5;
  }
  sub_220F322B8();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_220F1DD34(uint64_t a1)
{
  uint64_t v6 = MEMORY[0x263F8EE78];
  uint64_t v2 = *(void *)(a1 + 16);
  sub_220F32DD8();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_220D246B8(i, (uint64_t)v5);
    type metadata accessor for SuggestionsAppsPickerView.WrappedInstalledApp();
    if (!swift_dynamicCast()) {
      break;
    }
    sub_220F32DB8();
    sub_220F32DE8();
    sub_220F32DF8();
    sub_220F32DC8();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_220F1DE2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_220F31228();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36250);
  return sub_220F1DE7C(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_220F1DE7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v59 = a2;
  uint64_t v3 = sub_220F312F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_220F32088();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36258);
  MEMORY[0x270FA5388](v11 - 8);
  objc_super v56 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36260);
  MEMORY[0x270FA5388](v55);
  uint64_t v58 = (uint64_t)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  long long v16 = (char *)&v54 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v60 = (uint64_t)&v54 - v18;
  uint64_t v57 = a1;
  char v19 = *(unsigned char *)(a1 + 32);
  sub_220F32078();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F1B4B8], v7);
  uint64_t v20 = sub_220F320D8();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if (v19)
  {
    uint64_t v22 = sub_220F31EA8();
  }
  else
  {
    id v21 = objc_msgSend(self, sel_tertiaryLabelColor);
    uint64_t v22 = MEMORY[0x223C74C60](v21);
  }
  uint64_t v23 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  sub_220F318C8();
  uint64_t v25 = sub_220F318D8();
  swift_release();
  uint64_t v26 = swift_getKeyPath();
  long long v63 = (unint64_t)v20;
  LOWORD(v64) = 1;
  *((void *)&v64 + 1) = KeyPath;
  *(void *)&long long v65 = v23;
  *((void *)&v65 + 1) = v26;
  uint64_t v66 = v25;
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F36290);
    uint64_t v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_220F35110;
    sub_220F312B8();
    uint64_t v61 = v27;
  }
  else
  {
    uint64_t v61 = MEMORY[0x263F8EE78];
  }
  sub_220F1F528((unint64_t *)&unk_267F301D0, MEMORY[0x263F19938]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FF10);
  sub_220D25FB0(&qword_267F301E0, &qword_267F2FF10);
  sub_220F32BE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36268);
  sub_220F1FAAC();
  uint64_t v28 = (uint64_t)v56;
  sub_220F31D78();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_220F32468();
  sub_220F30BA8();
  sub_220D26548(v28, (uint64_t)v16, &qword_267F36258);
  unint64_t v29 = &v16[*(int *)(v55 + 36)];
  long long v30 = v64;
  *(_OWORD *)unint64_t v29 = v63;
  *((_OWORD *)v29 + 1) = v30;
  *((_OWORD *)v29 + 2) = v65;
  sub_220D25B68(v28, &qword_267F36258);
  uint64_t v31 = v60;
  sub_220D39114((uint64_t)v16, v60, &qword_267F36260);
  uint64_t v32 = *(void *)(v57 + 24);
  type metadata accessor for AppIconCache();
  sub_220F1F528((unint64_t *)&qword_267F301C0, (void (*)(uint64_t))type metadata accessor for AppIconCache);
  swift_retain();
  uint64_t v55 = sub_220F30EA8();
  objc_super v56 = v33;
  uint64_t v54 = swift_getKeyPath();
  uint64_t v34 = sub_220F30AF8();
  uint64_t v35 = sub_220F30938();
  uint64_t v36 = *(void *)(v32 + 32);
  uint64_t v61 = *(void *)(v32 + 24);
  uint64_t v62 = v36;
  sub_220D292B8();
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_220F31B28();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  char v43 = v42 & 1;
  uint64_t v44 = v31;
  uint64_t v45 = v58;
  sub_220D26548(v44, v58, &qword_267F36260);
  LOBYTE(v61) = 0;
  uint64_t v46 = v59;
  sub_220D26548(v45, v59, &qword_267F36260);
  uint64_t v47 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F36288);
  uint64_t v48 = v46 + v47[12];
  *(void *)uint64_t v48 = v32;
  *(void *)(v48 + 8) = 0x403D000000000000;
  uint64_t v49 = v56;
  *(void *)(v48 + 16) = v55;
  *(void *)(v48 + 24) = v49;
  uint64_t v50 = v54;
  *(void *)(v48 + 32) = v54;
  *(unsigned char *)(v48 + 40) = 0;
  *(void *)(v48 + 48) = v35;
  *(void *)(v48 + 56) = v34;
  uint64_t v51 = v46 + v47[16];
  *(void *)uint64_t v51 = v37;
  *(void *)(v51 + 8) = v39;
  *(unsigned char *)(v51 + 16) = v43;
  *(void *)(v51 + 24) = v41;
  uint64_t v52 = v46 + v47[20];
  *(void *)uint64_t v52 = 0;
  *(unsigned char *)(v52 + 8) = 1;
  swift_retain();
  swift_retain();
  sub_220D33390(v50, 0);
  swift_retain();
  swift_retain();
  sub_220D3570C(v37, v39, v43);
  swift_bridgeObjectRetain();
  sub_220D25B68(v60, &qword_267F36260);
  sub_220D357E0(v37, v39, v43);
  swift_bridgeObjectRelease();
  LOBYTE(v41) = v61;
  swift_release();
  swift_release();
  sub_220D33490(v50, v41);
  swift_release();
  swift_release();
  return sub_220D25B68(v45, &qword_267F36260);
}

uint64_t sub_220F1E5B8()
{
  return sub_220F321A8();
}

uint64_t sub_220F1E688@<X0>(uint64_t a1@<X8>)
{
  return sub_220F1A874(*(void *)(v1 + 16), a1);
}

unint64_t sub_220F1E690()
{
  unint64_t result = qword_267F36138;
  if (!qword_267F36138)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36108);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36110);
    sub_220D25FB0(&qword_267F36130, &qword_267F36110);
    swift_getOpaqueTypeConformance2();
    sub_220D25FB0(&qword_267F36140, &qword_267F36148);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36138);
  }
  return result;
}

uint64_t sub_220F1E794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for SuggestionsAppsPickerView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_220F1E7F8(uint64_t a1)
{
  type metadata accessor for SuggestionsAppsPickerView();
  return sub_220F1D6AC(a1);
}

unint64_t sub_220F1E878()
{
  unint64_t result = qword_267F36168;
  if (!qword_267F36168)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36158);
    sub_220F1E900();
    sub_220F1E96C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36168);
  }
  return result;
}

unint64_t sub_220F1E900()
{
  unint64_t result = qword_267F36170;
  if (!qword_267F36170)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36178);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36170);
  }
  return result;
}

unint64_t sub_220F1E96C()
{
  unint64_t result = qword_267F36180;
  if (!qword_267F36180)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36188);
    sub_220F1E9E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36180);
  }
  return result;
}

unint64_t sub_220F1E9E0()
{
  unint64_t result = qword_267F36190;
  if (!qword_267F36190)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36190);
  }
  return result;
}

unint64_t sub_220F1EA34()
{
  unint64_t result = qword_267F36198;
  if (!qword_267F36198)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36198);
  }
  return result;
}

uint64_t sub_220F1EA88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_220F32E48();
    swift_bridgeObjectRelease();
    sub_220F32F78();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_220F32E48();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return result;
    }
  }
  else
  {
    uint64_t result = sub_220F32F78();
    uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return result;
    }
  }
  if (v4 < 1)
  {
    __break(1u);
  }
  else if ((a2 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      MEMORY[0x223C75B40](i, a2);
      uint64_t result = swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_220F1EB58(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v15 = MEMORY[0x263F8EE78];
  if (!(a3 >> 62))
  {
    uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    return v15;
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_220F32E48();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_26;
  }
LABEL_3:
  if (v6 >= 1)
  {
    if ((a3 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = 0;
      if ((a2 & 0x2000000000000000) != 0) {
        uint64_t v9 = HIBYTE(a2) & 0xF;
      }
      else {
        uint64_t v9 = a1 & 0xFFFFFFFFFFFFLL;
      }
      do
      {
        MEMORY[0x223C75B40](v8, a3);
        sub_220D292B8();
        if ((sub_220F32BC8() & 1) != 0 || !v9)
        {
          uint64_t v10 = swift_retain();
          MEMORY[0x223C75600](v10);
          if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_220F32888();
          }
          sub_220F328A8();
          sub_220F32878();
        }
        ++v8;
        swift_unknownObjectRelease();
      }
      while (v6 != v8);
    }
    else
    {
      sub_220D292B8();
      uint64_t v11 = 0;
      uint64_t v12 = HIBYTE(a2) & 0xF;
      if ((a2 & 0x2000000000000000) == 0) {
        uint64_t v12 = a1 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v14 = v12;
      do
      {
        swift_retain();
        if ((sub_220F32BC8() & 1) != 0 || !v14)
        {
          uint64_t v13 = swift_retain();
          MEMORY[0x223C75600](v13);
          if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_220F32888();
          }
          sub_220F328A8();
          sub_220F32878();
        }
        ++v11;
        swift_release();
      }
      while (v6 != v11);
    }
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_220F1EDC8()
{
  return sub_220F1D840(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_220F1EDD4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_220F1DA20(a1, v6, a2);
}

uint64_t sub_220F1EE58()
{
  uint64_t v1 = *(void *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  return sub_220F1DBC8(*(void *)(v0
                                 + ((*(void *)(v1 + 64)
                                   + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
                                   + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_220F1EEE4()
{
  return sub_220F1C09C(*(void *)(v0 + 16));
}

unint64_t sub_220F1EEEC()
{
  unint64_t result = qword_267F36208;
  if (!qword_267F36208)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36200);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F30170);
    sub_220F30E28();
    sub_220D25FB0(&qword_267F30168, &qword_267F30170);
    sub_220F1F528(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36208);
  }
  return result;
}

uint64_t sub_220F1F008(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

BOOL sub_220F1F070(uint64_t *a1)
{
  return sub_220F1C344(a1, *(void *)(v1 + 16));
}

uint64_t objectdestroyTm_21()
{
  uint64_t v1 = (int *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220F1F1EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  return sub_220F1C3A0(a1, v6, a2);
}

uint64_t sub_220F1F270()
{
  uint64_t v1 = *(void *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_220F1C6D4((void *)(v0 + v2), v3);
}

uint64_t sub_220F1F2FC@<X0>(uint64_t a1@<X8>)
{
  return sub_220F1C840(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

uint64_t objectdestroy_16Tm()
{
  uint64_t v1 = (int *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)v1 + 64);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = v0 + v3 + v1[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_220F1F484(char a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for SuggestionsAppsPickerView() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_220F1CDB0(a1, (void *)(v1 + v4), v5);
}

uint64_t sub_220F1F528(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t destroy for SuggestionsAppsPickerView.AppSelectionRow()
{
  sub_220D359A4();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_220D35934();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = a2[3];
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  uint64_t v7 = a2[5];
  uint64_t v8 = a2[6];
  *(void *)(a1 + 40) = v7;
  *(void *)(a1 + 48) = v8;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_220D35934();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_220D359A4();
  *(void *)(a1 + 24) = a2[3];
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *((unsigned char *)a2 + 32);
  uint64_t v7 = a2[6];
  *(void *)(a1 + 40) = a2[5];
  *(void *)(a1 + 48) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_220D359A4();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SuggestionsAppsPickerView.AppSelectionRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SuggestionsAppsPickerView.AppSelectionRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SuggestionsAppsPickerView.AppSelectionRow()
{
  return &type metadata for SuggestionsAppsPickerView.AppSelectionRow;
}

uint64_t destroy for SuggestionsAppsPickerView.AppCollation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s15FocusSettingsUI25SuggestionsAppsPickerViewV12AppCollationVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for SuggestionsAppsPickerView.AppCollation(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SuggestionsAppsPickerView.AppCollation(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SuggestionsAppsPickerView.AppCollation()
{
  return &type metadata for SuggestionsAppsPickerView.AppCollation;
}

uint64_t sub_220F1F938()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220F1FA24()
{
  unint64_t result = qword_267F36238;
  if (!qword_267F36238)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36238);
  }
  return result;
}

uint64_t sub_220F1FA78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F1FA94@<X0>(uint64_t a1@<X8>)
{
  return sub_220F1DE2C(*(void *)(v1 + 16), a1);
}

unint64_t sub_220F1FAAC()
{
  unint64_t result = qword_267F36270;
  if (!qword_267F36270)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36268);
    sub_220F1FB4C();
    sub_220D25FB0(&qword_267F2FF68, (uint64_t *)&unk_267F33E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36270);
  }
  return result;
}

unint64_t sub_220F1FB4C()
{
  unint64_t result = qword_267F36278;
  if (!qword_267F36278)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36280);
    sub_220D7EC30();
    sub_220D25FB0(&qword_267F2EA98, &qword_267F2EAA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36278);
  }
  return result;
}

uint64_t sub_220F1FBEC()
{
  return sub_220D25FB0(&qword_267F36298, &qword_267F362A0);
}

uint64_t destroy for DrivingListSection()
{
  sub_220D359A4();
  return swift_release();
}

uint64_t initializeWithCopy for DrivingListSection(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_220D35934();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  uint64_t v7 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v7;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DrivingListSection(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = a2[1];
  char v6 = *((unsigned char *)a2 + 16);
  sub_220D35934();
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = v6;
  sub_220D359A4();
  *(void *)(a1 + 24) = a2[3];
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t assignWithTake for DrivingListSection(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v4;
  sub_220D359A4();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for DrivingListSection(uint64_t a1, unsigned int a2)
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
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DrivingListSection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
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

ValueMetadata *type metadata accessor for DrivingListSection()
{
  return &type metadata for DrivingListSection;
}

uint64_t sub_220F1FE7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F1FE98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBF0);
  MEMORY[0x270FA5388](v4 - 8);
  char v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362D0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362C0);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v9 = sub_220F31348();
  *((void *)v9 + 1) = 0x4018000000000000;
  unsigned char v9[16] = 0;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362D8);
  sub_220F20220(a1, (uint64_t)&v9[*(int *)(v13 + 44)]);
  sub_220D25FB0(&qword_267F362C8, &qword_267F362D0);
  sub_220F31C38();
  sub_220D25B68((uint64_t)v9, &qword_267F362D0);
  uint64_t v14 = sub_220F31AD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  uint64_t KeyPath = swift_getKeyPath();
  long long v16 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F362A8) + 36));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBC8);
  sub_220D26548((uint64_t)v6, (uint64_t)v16 + *(int *)(v17 + 28), &qword_267F2EBF0);
  uint64_t *v16 = KeyPath;
  sub_220D26548((uint64_t)v12, a2, &qword_267F362C0);
  sub_220D25B68((uint64_t)v6, &qword_267F2EBF0);
  return sub_220D25B68((uint64_t)v12, &qword_267F362C0);
}

uint64_t sub_220F20104@<X0>(uint64_t *a1@<X8>)
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_220F30408();
  uint64_t v4 = v3;
  uint64_t result = sub_220F30408();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = result;
  a1[3] = v6;
  a1[4] = 0xD000000000000016;
  a1[5] = 0x8000000220F48E60;
  a1[6] = 0xD000000000000016;
  a1[7] = 0x8000000220F48E80;
  return result;
}

uint64_t sub_220F20220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v68 = a2;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362E0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362E8);
  MEMORY[0x270FA5388](v67);
  uint64_t v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)&v56 - v8;
  uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362F0);
  MEMORY[0x270FA5388](v65);
  uint64_t v66 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_220F30E28();
  uint64_t v60 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F362F8);
  uint64_t v57 = *(void *)(v14 - 8);
  uint64_t v58 = v14;
  MEMORY[0x270FA5388](v14);
  long long v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36300);
  uint64_t v59 = *(void *)(v62 - 8);
  MEMORY[0x270FA5388](v62);
  uint64_t v18 = (char *)&v56 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36308);
  MEMORY[0x270FA5388](v64);
  uint64_t v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v61 = (uint64_t)&v56 - v22;
  id v23 = objc_msgSend(self, sel_currentDevice);
  id v24 = objc_msgSend(v23, sel_userInterfaceIdiom);

  if (v24)
  {
    *(void *)uint64_t v4 = sub_220F31228();
    *((void *)v4 + 1) = 0x4030000000000000;
    v4[16] = 0;
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36310);
    sub_220F21290(v63, (uint64_t)&v4[*(int *)(v25 + 44)]);
    char v26 = sub_220F31878();
    sub_220F30A88();
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    sub_220D26548((uint64_t)v4, (uint64_t)v6, &qword_267F362E0);
    uint64_t v35 = &v6[*(int *)(v67 + 36)];
    *uint64_t v35 = v26;
    *((void *)v35 + 1) = v28;
    *((void *)v35 + 2) = v30;
    *((void *)v35 + 3) = v32;
    *((void *)v35 + 4) = v34;
    v35[40] = 0;
    sub_220D25B68((uint64_t)v4, &qword_267F362E0);
    uint64_t v36 = &qword_267F362E8;
    sub_220D39114((uint64_t)v6, (uint64_t)v9, &qword_267F362E8);
    sub_220D26548((uint64_t)v9, v66, &qword_267F362E8);
    swift_storeEnumTagMultiPayload();
    sub_220F22CF4();
    sub_220F22E18();
    sub_220F31488();
    uint64_t v37 = (uint64_t)v9;
  }
  else
  {
    uint64_t v56 = v11;
    uint64_t v38 = v63;
    type metadata accessor for CarStatus();
    sub_220F23528(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
    sub_220F30AF8();
    uint64_t v69 = sub_220F30CA8();
    uint64_t v70 = v39;
    MEMORY[0x270FA5388](v69);
    *(&v56 - 2) = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F36338);
    sub_220D25FB0(&qword_267F36340, &qword_267F36338);
    sub_220F22EC0();
    sub_220F30C78();
    sub_220F30E18();
    sub_220D25FB0(&qword_267F36320, &qword_267F362F8);
    sub_220F23528(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    uint64_t v40 = v58;
    uint64_t v41 = v56;
    sub_220F31BA8();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v13, v41);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v16, v40);
    char v42 = sub_220F31878();
    sub_220F30A88();
    uint64_t v44 = v43;
    uint64_t v46 = v45;
    uint64_t v48 = v47;
    uint64_t v50 = v49;
    uint64_t v51 = v59;
    uint64_t v52 = v62;
    (*(void (**)(char *, char *, uint64_t))(v59 + 16))(v20, v18, v62);
    uint64_t v53 = &v20[*(int *)(v64 + 36)];
    *uint64_t v53 = v42;
    *((void *)v53 + 1) = v44;
    *((void *)v53 + 2) = v46;
    *((void *)v53 + 3) = v48;
    *((void *)v53 + 4) = v50;
    v53[40] = 0;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v18, v52);
    uint64_t v36 = &qword_267F36308;
    uint64_t v54 = v61;
    sub_220D39114((uint64_t)v20, v61, &qword_267F36308);
    sub_220D26548(v54, v66, &qword_267F36308);
    swift_storeEnumTagMultiPayload();
    sub_220F22CF4();
    sub_220F22E18();
    sub_220F31488();
    uint64_t v37 = v54;
  }
  return sub_220D25B68(v37, v36);
}

uint64_t sub_220F2096C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_220F31228();
  *(void *)(a2 + 8) = 0x4028000000000000;
  *(unsigned char *)(a2 + 16) = 0;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36350);
  return sub_220F209BC(a1, a2 + *(int *)(v4 + 44));
}

uint64_t sub_220F209BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v46 = a2;
  uint64_t v3 = type metadata accessor for DrivingListSection.CarImage();
  MEMORY[0x270FA5388](v3);
  uint64_t v51 = (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v37 - v6);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v37 - v9;
  if (*(void *)(a1 + 24))
  {
    swift_retain();
    id v11 = sub_220DE6F00();
    swift_release();
    *uint64_t v7 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v7 + *(int *)(v3 + 20)) = (uint64_t)v11;
    sub_220F232B8((uint64_t)v7, (uint64_t)v10, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    uint64_t v47 = sub_220F31358();
    sub_220F20D38((uint64_t)&v66);
    uint64_t v12 = v66;
    uint64_t v13 = v67;
    uint64_t v41 = v67;
    uint64_t v42 = v66;
    LOBYTE(v11) = v68;
    uint64_t v48 = v71;
    uint64_t v49 = v69;
    char v14 = v72;
    uint64_t v39 = v73;
    uint64_t v40 = v70;
    uint64_t v50 = v74;
    uint64_t v15 = v78;
    uint64_t v37 = v77;
    uint64_t v38 = v76;
    uint64_t v16 = (uint64_t)v10;
    uint64_t v45 = v10;
    char v17 = v79;
    char v56 = 1;
    unsigned __int8 v55 = v68;
    int v43 = v68;
    int v44 = v72;
    char v54 = v72;
    char v53 = v75;
    char v52 = v79;
    char v18 = v75;
    uint64_t v19 = v51;
    sub_220F23320(v16, v51, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    uint64_t v20 = v19;
    uint64_t v21 = v46;
    sub_220F23320(v20, v46, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36358);
    uint64_t v23 = v21 + *(int *)(v22 + 48);
    v57[0] = v47;
    v57[1] = 0;
    LOBYTE(v58) = 1;
    *((void *)&v58 + 1) = v12;
    *(void *)&long long v59 = v13;
    BYTE8(v59) = (_BYTE)v11;
    uint64_t v24 = v40;
    *(void *)&long long v60 = v49;
    *((void *)&v60 + 1) = v40;
    *(void *)&long long v61 = v48;
    BYTE8(v61) = v14;
    uint64_t v25 = v38;
    uint64_t v26 = v39;
    *(void *)&long long v62 = v39;
    *((void *)&v62 + 1) = v50;
    LOBYTE(v63) = v18;
    uint64_t v27 = v37;
    *((void *)&v63 + 1) = v38;
    *(void *)&long long v64 = v37;
    *((void *)&v64 + 1) = v15;
    char v65 = v17;
    long long v28 = (unint64_t)v47;
    long long v29 = v58;
    long long v30 = v60;
    *(_OWORD *)(v23 + 32) = v59;
    *(_OWORD *)(v23 + 48) = v30;
    *(_OWORD *)uint64_t v23 = v28;
    *(_OWORD *)(v23 + 16) = v29;
    long long v31 = v61;
    long long v32 = v62;
    long long v33 = v63;
    long long v34 = v64;
    *(unsigned char *)(v23 + 128) = v17;
    *(_OWORD *)(v23 + 96) = v33;
    *(_OWORD *)(v23 + 112) = v34;
    *(_OWORD *)(v23 + 64) = v31;
    *(_OWORD *)(v23 + 80) = v32;
    uint64_t v35 = v21 + *(int *)(v22 + 64);
    *(void *)uint64_t v35 = 0;
    *(unsigned char *)(v35 + 8) = 1;
    sub_220D58A6C((uint64_t)v57);
    sub_220F23388((uint64_t)v45, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    uint64_t v66 = v47;
    uint64_t v67 = 0;
    unsigned __int8 v68 = 1;
    uint64_t v69 = v42;
    uint64_t v70 = v41;
    LOBYTE(v71) = v43;
    uint64_t v72 = v49;
    uint64_t v73 = v24;
    uint64_t v74 = v48;
    char v75 = v44;
    uint64_t v76 = v26;
    uint64_t v77 = v50;
    LOBYTE(v78) = v18;
    uint64_t v79 = v25;
    uint64_t v80 = v27;
    uint64_t v81 = v15;
    char v82 = v17;
    sub_220D58AF8((uint64_t)&v66);
    return sub_220F23388(v51, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F23528((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F20D38@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_220F30408();
  sub_220D292B8();
  uint64_t v2 = sub_220F31B28();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_220F318C8();
  uint64_t v7 = sub_220F31AF8();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_220D357E0(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_220F31FE8();
  uint64_t v12 = sub_220F31A98();
  uint64_t v36 = v13;
  uint64_t v37 = v12;
  char v15 = v14;
  uint64_t v38 = v16;
  swift_release();
  sub_220D357E0(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  type metadata accessor for CarStatus();
  sub_220F23528(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
  sub_220F30AF8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_220F309B8();
  swift_release();
  swift_release();
  swift_release();
  sub_220F2112C(v39);
  uint64_t v17 = sub_220F31B28();
  uint64_t v19 = v18;
  char v21 = v20 & 1;
  sub_220F319D8();
  uint64_t v22 = sub_220F31AF8();
  uint64_t v24 = v23;
  char v26 = v25;
  swift_release();
  sub_220D357E0(v17, v19, v21);
  swift_bridgeObjectRelease();
  sub_220F31FF8();
  uint64_t v27 = sub_220F31A98();
  uint64_t v29 = v28;
  LOBYTE(v7) = v30;
  uint64_t v32 = v31;
  swift_release();
  LOBYTE(v7) = v7 & 1;
  sub_220D357E0(v22, v24, v26 & 1);
  swift_bridgeObjectRelease();
  uint64_t v33 = swift_getKeyPath();
  *(void *)a1 = v37;
  *(void *)(a1 + 8) = v36;
  *(unsigned char *)(a1 + 16) = v15 & 1;
  *(void *)(a1 + 24) = v38;
  *(void *)(a1 + 32) = KeyPath;
  *(void *)(a1 + 40) = 0;
  *(unsigned char *)(a1 + 48) = 1;
  *(void *)(a1 + 56) = v27;
  *(void *)(a1 + 64) = v29;
  *(unsigned char *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = v32;
  *(void *)(a1 + 88) = v33;
  *(void *)(a1 + 96) = 0;
  *(unsigned char *)(a1 + 104) = 1;
  sub_220D3570C(v37, v36, v15 & 1);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_220D3570C(v27, v29, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_220D357E0(v27, v29, v7);
  swift_release();
  swift_bridgeObjectRelease();
  sub_220D357E0(v37, v36, v15 & 1);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F2112C(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
      goto LABEL_11;
    case 1:
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
LABEL_11:
      swift_once();
      return sub_220F30408();
    case 2:
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
      goto LABEL_11;
  }
  return 0;
}

uint64_t sub_220F21290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for DrivingListSection.CarImage();
  MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (uint64_t *)((char *)&v30 - v6);
  MEMORY[0x270FA5388](v8);
  char v11 = (char *)&v30 - v10;
  if (*(void *)(a1 + 24))
  {
    uint64_t v31 = a2;
    uint64_t v32 = v9;
    swift_retain();
    id v12 = sub_220DE6F00();
    swift_release();
    *uint64_t v7 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)v7 + *(int *)(v4 + 20)) = (uint64_t)v12;
    sub_220F232B8((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    uint64_t v33 = sub_220F30408();
    uint64_t v34 = v13;
    sub_220D292B8();
    uint64_t v14 = sub_220F31B28();
    uint64_t v16 = v15;
    char v18 = v17 & 1;
    sub_220F318B8();
    uint64_t v19 = sub_220F31AF8();
    uint64_t v21 = v20;
    char v23 = v22;
    uint64_t v25 = v24;
    swift_release();
    v23 &= 1u;
    sub_220D357E0(v14, v16, v18);
    swift_bridgeObjectRelease();
    uint64_t v26 = v32;
    sub_220F23320((uint64_t)v11, v32, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    uint64_t v27 = v31;
    sub_220F23320(v26, v31, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    uint64_t v28 = v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F36360) + 48);
    *(void *)uint64_t v28 = v19;
    *(void *)(v28 + 8) = v21;
    *(unsigned char *)(v28 + 16) = v23;
    *(void *)(v28 + 24) = v25;
    sub_220D3570C(v19, v21, v23);
    swift_bridgeObjectRetain();
    sub_220F23388((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
    sub_220D357E0(v19, v21, v23);
    swift_bridgeObjectRelease();
    return sub_220F23388(v26, (uint64_t (*)(void))type metadata accessor for DrivingListSection.CarImage);
  }
  else
  {
    type metadata accessor for ActivityConfigViewModel();
    sub_220F23528((unint64_t *)&qword_267F2E260, (void (*)(uint64_t))type metadata accessor for ActivityConfigViewModel);
    uint64_t result = sub_220F30E88();
    __break(1u);
  }
  return result;
}

uint64_t sub_220F215D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for TriggerCardLeadingImageModifier();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF78);
  uint64_t v10 = v9 - 8;
  MEMORY[0x270FA5388](v9);
  id v12 = (uint64_t *)((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_220F32078();
  uint64_t *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E250);
  swift_storeEnumTagMultiPayload();
  sub_220F232B8((uint64_t)v5, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for TriggerCardLeadingImageModifier);
  sub_220F23320((uint64_t)v8, (uint64_t)v12 + *(int *)(v10 + 44), (uint64_t (*)(void))type metadata accessor for TriggerCardLeadingImageModifier);
  *id v12 = v13;
  sub_220F23388((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for TriggerCardLeadingImageModifier);
  uint64_t v14 = *(void *)(v1 + *(int *)(type metadata accessor for DrivingListSection.CarImage() + 20));
  uint64_t KeyPath = swift_getKeyPath();
  sub_220D26548((uint64_t)v12, a1, &qword_267F2EF78);
  uint64_t v16 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EF80) + 36));
  uint64_t *v16 = KeyPath;
  v16[1] = v14;
  swift_retain();
  return sub_220D25B68((uint64_t)v12, &qword_267F2EF78);
}

uint64_t sub_220F217BC()
{
  long long v1 = v0[1];
  long long v4 = *v0;
  long long v5 = v1;
  uint64_t v6 = *((void *)v0 + 4);
  sub_220F20104(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F362A8);
  sub_220D33D98();
  sub_220F21868();
  return sub_220F32368();
}

uint64_t sub_220F21860@<X0>(uint64_t a1@<X8>)
{
  return sub_220F1FE98(*(void *)(v1 + 16), a1);
}

unint64_t sub_220F21868()
{
  unint64_t result = qword_267F362B0;
  if (!qword_267F362B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F362A8);
    sub_220F21908();
    sub_220D25FB0(&qword_267F2EBC0, &qword_267F2EBC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F362B0);
  }
  return result;
}

unint64_t sub_220F21908()
{
  unint64_t result = qword_267F362B8;
  if (!qword_267F362B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F362C0);
    sub_220D25FB0(&qword_267F362C8, &qword_267F362D0);
    sub_220F23528((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F362B8);
  }
  return result;
}

uint64_t sub_220F219D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36388);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36390);
  sub_220D25FB0(&qword_267F36398, &qword_267F36390);
  sub_220F31A28();
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_220F30408();
  uint64_t v14 = v8;
  sub_220D25FB0(&qword_267F363A0, &qword_267F36388);
  sub_220D292B8();
  sub_220F31C88();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_220F21BF0@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  char v54 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F333C8);
  uint64_t v55 = *(void *)(v3 - 8);
  uint64_t v56 = v3;
  MEMORY[0x270FA5388](v3);
  long long v58 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v57 = (char *)&v49 - v6;
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F363A8);
  uint64_t v52 = *(void *)(v53 - 8);
  MEMORY[0x270FA5388](v53);
  uint64_t v51 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v49 - v9;
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v63 = sub_220F30408();
  uint64_t v64 = v11;
  unint64_t v12 = sub_220D292B8();
  uint64_t v70 = sub_220F31B28();
  uint64_t v71 = v13;
  char v72 = v14 & 1;
  uint64_t v73 = v15;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_220F309B8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v63 = sub_220F222C8(v63);
  uint64_t v64 = v16;
  unint64_t v49 = v12;
  uint64_t v17 = sub_220F31B28();
  uint64_t v19 = v18;
  char v21 = v20;
  uint64_t v23 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v63 = v17;
  uint64_t v64 = v19;
  char v65 = v21 & 1;
  uint64_t v66 = v23;
  uint64_t v67 = KeyPath;
  uint64_t v68 = 0;
  char v69 = 1;
  MEMORY[0x270FA5388](KeyPath);
  uint64_t v50 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F363B0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F33E50);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F363B8);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F363C0);
  uint64_t v27 = sub_220F311B8();
  uint64_t v28 = sub_220D25FB0(&qword_267F363C8, &qword_267F363C0);
  uint64_t v59 = v26;
  uint64_t v60 = v27;
  uint64_t v61 = v28;
  uint64_t v62 = MEMORY[0x263F19670];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v59 = v25;
  uint64_t v60 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  sub_220E60308();
  sub_220F32378();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_220F309B8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v30 = v10;
  uint64_t v63 = sub_220F30408();
  uint64_t v64 = v31;
  uint64_t v63 = sub_220F31B28();
  uint64_t v64 = v32;
  char v65 = v33 & 1;
  uint64_t v66 = v34;
  MEMORY[0x270FA5388](v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA90);
  sub_220D25FB0((unint64_t *)&unk_267F33EB0, &qword_267F2EA90);
  uint64_t v35 = v57;
  sub_220F32398();
  uint64_t v36 = v52;
  uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  uint64_t v38 = v51;
  uint64_t v39 = v53;
  v37(v51, v30, v53);
  uint64_t v40 = v55;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v50 = v30;
  uint64_t v42 = v56;
  v41(v58, v35, v56);
  int v43 = v54;
  v37(v54, v38, v39);
  int v44 = &v43[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F363D0) + 48)];
  uint64_t v45 = v58;
  v41(v44, v58, v42);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v40 + 8);
  v46(v57, v42);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v36 + 8);
  v47(v50, v39);
  v46(v45, v42);
  return ((uint64_t (*)(char *, uint64_t))v47)(v38, v39);
}

uint64_t sub_220F222C8(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
      goto LABEL_11;
    case 1:
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
LABEL_11:
      swift_once();
      return sub_220F30408();
    case 2:
      if (qword_267F2E160 == -1) {
        return sub_220F30408();
      }
      goto LABEL_11;
  }
  return 0;
}

uint64_t sub_220F22430@<X0>(uint64_t a1@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v1 = sub_220F311B8();
  uint64_t v19 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F363C0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F363B8);
  uint64_t v17 = *(void *)(v8 - 8);
  uint64_t v18 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v26 = sub_220F30408();
  uint64_t v27 = v11;
  type metadata accessor for CarStatus();
  sub_220F23528(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
  sub_220F30CB8();
  swift_getKeyPath();
  sub_220F30CC8();
  swift_release();
  swift_release();
  long long v24 = v21;
  uint64_t v25 = v22;
  type metadata accessor for CARAutomaticDNDTriggerPreference(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F363D8);
  sub_220F23528(&qword_267F363E0, type metadata accessor for CARAutomaticDNDTriggerPreference);
  sub_220D25FB0(&qword_267F363E8, &qword_267F363D8);
  sub_220D292B8();
  sub_220F32228();
  sub_220F311A8();
  uint64_t v12 = sub_220D25FB0(&qword_267F363C8, &qword_267F363C0);
  uint64_t v13 = MEMORY[0x263F19670];
  sub_220F31BD8();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(void *)&long long v21 = v4;
  *((void *)&v21 + 1) = v1;
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  swift_getOpaqueTypeConformance2();
  uint64_t v14 = v18;
  sub_220F31C18();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v10, v14);
}

uint64_t sub_220F228B0@<X0>(uint64_t a1@<X8>)
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  sub_220F30408();
  sub_220D292B8();
  uint64_t v20 = sub_220F31B28();
  uint64_t v21 = v2;
  uint64_t v22 = v3;
  char v5 = v4 & 1;
  sub_220F30408();
  uint64_t v6 = sub_220F31B28();
  uint64_t v8 = v7;
  uint64_t v19 = v9;
  char v11 = v10 & 1;
  sub_220F30408();
  uint64_t v12 = sub_220F31B28();
  uint64_t v14 = v13;
  char v16 = v15 & 1;
  *(void *)a1 = v20;
  *(void *)(a1 + 8) = v22;
  *(unsigned char *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v21;
  *(void *)(a1 + 32) = 2;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 2;
  *(_WORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v8;
  *(unsigned char *)(a1 + 80) = v11;
  *(void *)(a1 + 88) = v19;
  *(void *)(a1 + 96) = 1;
  *(unsigned char *)(a1 + 104) = 0;
  *(void *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = v12;
  *(void *)(a1 + 136) = v13;
  *(unsigned char *)(a1 + 144) = v15 & 1;
  *(void *)(a1 + 152) = v17;
  *(void *)(a1 + 160) = 0;
  *(unsigned char *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  *(_WORD *)(a1 + 184) = 0;
  sub_220D3570C(v20, v22, v5);
  swift_bridgeObjectRetain();
  sub_220D3570C(v6, v8, v11);
  swift_bridgeObjectRetain();
  sub_220D3570C(v12, v14, v16);
  swift_bridgeObjectRetain();
  sub_220D357E0(v12, v14, v16);
  swift_bridgeObjectRelease();
  sub_220D357E0(v6, v8, v11);
  swift_bridgeObjectRelease();
  sub_220D357E0(v20, v22, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_220F22B6C()
{
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  sub_220F30408();
  type metadata accessor for CarStatus();
  sub_220F23528(&qword_267F35CF8, (void (*)(uint64_t))type metadata accessor for CarStatus);
  sub_220F30CB8();
  swift_getKeyPath();
  sub_220F30CC8();
  swift_release();
  swift_release();
  sub_220D292B8();
  return sub_220F32248();
}

uint64_t sub_220F22CE4()
{
  return sub_220F219D8(*v0, v0[1]);
}

unint64_t sub_220F22CF4()
{
  unint64_t result = qword_267F36318;
  if (!qword_267F36318)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36308);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F362F8);
    sub_220F30E28();
    sub_220D25FB0(&qword_267F36320, &qword_267F362F8);
    sub_220F23528(&qword_267F2EC90, MEMORY[0x263F18FD0]);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36318);
  }
  return result;
}

unint64_t sub_220F22E18()
{
  unint64_t result = qword_267F36328;
  if (!qword_267F36328)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F362E8);
    sub_220D25FB0(&qword_267F36330, &qword_267F362E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36328);
  }
  return result;
}

uint64_t sub_220F22EB8@<X0>(uint64_t a1@<X8>)
{
  return sub_220F2096C(*(void *)(v1 + 16), a1);
}

unint64_t sub_220F22EC0()
{
  unint64_t result = qword_267F36348;
  if (!qword_267F36348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36348);
  }
  return result;
}

uint64_t type metadata accessor for DrivingListSection.CarImage()
{
  uint64_t result = qword_267F36368;
  if (!qword_267F36368) {
    return swift_getSingletonMetadata();
  }
  return result;
}

ValueMetadata *type metadata accessor for DrivingOptionsView()
{
  return &type metadata for DrivingOptionsView;
}

uint64_t sub_220F22F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F22F9C);
}

uint64_t sub_220F22F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
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
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_220F2306C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F23080);
}

uint64_t sub_220F23080(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAE0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

void sub_220F23140()
{
  sub_220DD4B48();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_220F231D8()
{
  unint64_t result = qword_267F36378;
  if (!qword_267F36378)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36380);
    sub_220D33D98();
    sub_220F21868();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36378);
  }
  return result;
}

uint64_t sub_220F23260()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F2327C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F23298@<X0>(char *a1@<X8>)
{
  return sub_220F21BF0(*(char **)(v1 + 16), a1);
}

uint64_t sub_220F232A0@<X0>(uint64_t a1@<X8>)
{
  return sub_220F22430(a1);
}

uint64_t sub_220F232B0()
{
  return sub_220F22B6C();
}

uint64_t sub_220F232B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_220F23320(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_220F23388(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_220F233F0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_220F23488()
{
  unint64_t result = qword_267F36080;
  if (!qword_267F36080)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2EF80);
    sub_220F192E0();
    sub_220D25FB0(&qword_267F2EA98, &qword_267F2EAA0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36080);
  }
  return result;
}

uint64_t sub_220F23528(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_220F23570()
{
  return sub_220F30FF8();
}

__n128 ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>, long long a10, uint64_t a11, uint64_t a12, __n128 a13, unint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  char v41 = a1 & 1;
  *a9 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  long long v24 = (int *)type metadata accessor for ActivityEditView(0);
  uint64_t v25 = (char *)a9 + v24[7];
  *(void *)uint64_t v25 = 0;
  v25[8] = 1;
  uint64_t v26 = (char *)a9 + v24[11];
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAD8);
  sub_220F32148();
  *(void *)uint64_t v26 = v46;
  *(_OWORD *)(v26 + 8) = v47;
  uint64_t v27 = (char *)a9 + v24[13];
  LOBYTE(v48) = 0;
  sub_220F32148();
  *uint64_t v27 = v46;
  *((void *)v27 + 1) = v47;
  uint64_t v28 = (uint64_t *)((char *)a9 + v24[18]);
  *uint64_t v28 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  swift_storeEnumTagMultiPayload();
  *((unsigned char *)a9 + v24[6]) = v41;
  *(void *)uint64_t v25 = a2;
  v25[8] = a3 & 1;
  *((unsigned char *)a9 + v24[5]) = a8;
  *(uint64_t *)((char *)a9 + v24[14]) = a16;
  *(uint64_t *)((char *)a9 + v24[15]) = a17;
  uint64_t v29 = (uint64_t *)((char *)a9 + v24[16]);
  *uint64_t v29 = a20;
  v29[1] = a21;
  uint64_t v30 = (uint64_t *)((char *)a9 + v24[17]);
  *uint64_t v30 = a18;
  v30[1] = a19;
  swift_retain();
  swift_retain();
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F300D8);
  MEMORY[0x223C75070](&v48);
  uint64_t v32 = v48;
  uint64_t v33 = v49;
  swift_bridgeObjectRelease();
  swift_release();
  *(void *)uint64_t v26 = v32;
  *((void *)v26 + 1) = v33;
  *((void *)v26 + 2) = 0;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  MEMORY[0x223C75070](&v48, v31);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v34 = v49;
  uint64_t v35 = (uint64_t *)((char *)a9 + v24[12]);
  *uint64_t v35 = v48;
  v35[1] = v34;
  v35[2] = 0;
  uint64_t v36 = (uint64_t *)((char *)a9 + v24[8]);
  *uint64_t v36 = a4;
  v36[1] = a5;
  v36[2] = a6;
  v36[3] = a7;
  uint64_t v37 = (char *)a9 + v24[9];
  *(_OWORD *)uint64_t v37 = a10;
  *((void *)v37 + 2) = a11;
  *((void *)v37 + 3) = a12;
  uint64_t v38 = (__n128 *)((char *)a9 + v24[10]);
  __n128 result = a13;
  *uint64_t v38 = a13;
  v38[1].n128_u64[0] = a14;
  v38[1].n128_u64[1] = a15;
  return result;
}

uint64_t type metadata accessor for ActivityEditView(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F36450);
}

void sub_220F238DC()
{
  qword_267F363F0 = 0x404C000000000000;
}

void sub_220F238EC()
{
  qword_267F363F8 = 0x4057000000000000;
}

void sub_220F238FC()
{
  qword_267F36400 = 0x404C000000000000;
}

void sub_220F2390C()
{
  qword_267F36408 = 0x4034000000000000;
}

void sub_220F2391C()
{
  qword_267F36410 = 0x4045000000000000;
}

void sub_220F2392C()
{
  qword_267F36418 = 0x4008000000000000;
}

void sub_220F2393C()
{
  qword_267F36420 = 0x404A000000000000;
}

void sub_220F2394C()
{
  qword_267F36428 = 0x4030000000000000;
}

void sub_220F2395C()
{
  qword_267F36430 = 0x4040000000000000;
}

BOOL static ActivityEditView.Use.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ActivityEditView.Use.hash(into:)()
{
  return sub_220F32F78();
}

uint64_t ActivityEditView.Use.hashValue.getter()
{
  return sub_220F32FB8();
}

uint64_t property wrapper backing initializer of ActivityEditView.internalTextName()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EAD8);
  sub_220F32148();
  return v1;
}

uint64_t property wrapper backing initializer of ActivityEditView.originalName()
{
  sub_220F32148();
  return v1;
}

uint64_t property wrapper backing initializer of ActivityEditView.disabledDoneButton()
{
  sub_220F32148();
  return v1;
}

uint64_t sub_220F23AA8()
{
  return sub_220F30FF8();
}

double ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:onCommit:)@<D0>(char a1@<W0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t *a9@<X8>, long long a10, uint64_t a11, uint64_t a12, __n128 a13, unint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  *(void *)&double result = ActivityEditView.init(use:semanticType:textName:canEditName:symbolImageName:tintColorName:usedSymbolImageNames:usedNames:isScrolling:onCommit:)(a1 & 1, a2, a3 & 1, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, (uint64_t)sub_220E61094, 0,
                         a18,
                         a19).n128_u64[0];
  return result;
}

uint64_t ActivityEditView.body.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_220F23B30(v1, a1);
}

uint64_t sub_220F23B30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36498);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364B8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36488);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for ActivityEditView(0);
  if (*(unsigned char *)(a1 + *(int *)(v14 + 24)))
  {
    sub_220F23E7C((uint64_t)v6);
    sub_220D26548((uint64_t)v6, (uint64_t)v9, &qword_267F36498);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F36480, &qword_267F36488);
    sub_220D25FB0(&qword_267F36490, &qword_267F36498);
    sub_220F31488();
    return sub_220D25B68((uint64_t)v6, &qword_267F36498);
  }
  else
  {
    v16[1] = a2;
    MEMORY[0x270FA5388](v14);
    v16[-2] = a1;
    sub_220F317F8();
    sub_220D25FB0(&qword_267F36490, &qword_267F36498);
    sub_220F30A98();
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
    swift_storeEnumTagMultiPayload();
    sub_220D25FB0(&qword_267F36480, &qword_267F36488);
    sub_220F31488();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_220F23E7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v132 = a1;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364C0);
  MEMORY[0x270FA5388](v130);
  uint64_t v131 = (uint64_t)&v101 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_220F30E58();
  MEMORY[0x270FA5388](v113);
  uint64_t v114 = (char *)&v101 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364C8);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v115 = (char *)&v101 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364D0);
  MEMORY[0x270FA5388](v129);
  uint64_t v101 = (uint64_t)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  uint64_t v122 = (uint64_t)&v101 - v8;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364D8);
  uint64_t v105 = *(void *)(v106 - 8);
  MEMORY[0x270FA5388](v106);
  uint64_t v104 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364E0);
  MEMORY[0x270FA5388](v102);
  char v108 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364E8);
  MEMORY[0x270FA5388](v103);
  char v109 = (char *)&v101 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364F0);
  MEMORY[0x270FA5388](v107);
  uint64_t v111 = (uint64_t)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F364F8);
  MEMORY[0x270FA5388](v126);
  uint64_t v110 = (uint64_t)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v112 = (uint64_t)&v101 - v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36500);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v128 = (uint64_t)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v127 = (char *)&v101 - v19;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36508);
  MEMORY[0x270FA5388](v20 - 8);
  uint64_t v22 = (char *)&v101 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36510);
  uint64_t v24 = v23 - 8;
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v101 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v27);
  uint64_t v133 = (uint64_t)&v101 - v28;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36518);
  MEMORY[0x270FA5388](v29 - 8);
  uint64_t v31 = (uint64_t *)((char *)&v101 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36520);
  uint64_t v33 = v32 - 8;
  MEMORY[0x270FA5388](v32);
  uint64_t v35 = (char *)&v101 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v36);
  uint64_t v38 = (char *)&v101 - v37;
  uint64_t *v31 = sub_220F32468();
  v31[1] = v39;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36528);
  sub_220F25C84(v1, (uint64_t)v31 + *(int *)(v40 + 44));
  char v41 = sub_220F31818();
  sub_220D26548((uint64_t)v31, (uint64_t)v35, &qword_267F36518);
  uint64_t v42 = &v35[*(int *)(v33 + 44)];
  *uint64_t v42 = v41;
  *(_OWORD *)(v42 + 8) = 0u;
  *(_OWORD *)(v42 + 24) = 0u;
  v42[40] = 1;
  uint64_t v43 = (uint64_t)v31;
  uint64_t v44 = (uint64_t)v115;
  sub_220D25B68(v43, &qword_267F36518);
  uint64_t v123 = v35;
  uint64_t v125 = v38;
  sub_220D39114((uint64_t)v35, (uint64_t)v38, &qword_267F36520);
  *(void *)uint64_t v22 = sub_220F31348();
  *((void *)v22 + 1) = 0;
  v22[16] = 1;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36530);
  sub_220F26E10((uint64_t)&v22[*(int *)(v45 + 44)]);
  LOBYTE(v33) = sub_220F31808();
  sub_220D26548((uint64_t)v22, (uint64_t)v26, &qword_267F36508);
  uint64_t v46 = &v26[*(int *)(v24 + 44)];
  *uint64_t v46 = v33;
  *(_OWORD *)(v46 + 8) = 0u;
  *(_OWORD *)(v46 + 24) = 0u;
  v46[40] = 1;
  sub_220D25B68((uint64_t)v22, &qword_267F36508);
  unint64_t v124 = v26;
  sub_220D39114((uint64_t)v26, v133, &qword_267F36510);
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v121 = v136;
  int v120 = v137;
  uint64_t v119 = v138;
  int v118 = v139;
  uint64_t v117 = v140;
  uint64_t v116 = v141;
  LOBYTE(v33) = *(unsigned char *)(v1 + *(int *)(type metadata accessor for ActivityEditView(0) + 24));
  sub_220F24C7C(v44);
  if (v33)
  {
    char v47 = sub_220F31808();
    uint64_t v48 = v101;
    sub_220D26548(v44, v101, &qword_267F364C8);
    uint64_t v49 = v48 + *(int *)(v129 + 36);
    *(unsigned char *)uint64_t v49 = v47;
    *(_OWORD *)(v49 + 8) = 0u;
    *(_OWORD *)(v49 + 24) = 0u;
    *(unsigned char *)(v49 + 40) = 1;
    sub_220D25B68(v44, &qword_267F364C8);
    uint64_t v50 = &qword_267F364D0;
    uint64_t v51 = v48;
    uint64_t v52 = v122;
    sub_220D39114(v51, v122, &qword_267F364D0);
    sub_220D26548(v52, v131, &qword_267F364D0);
    swift_storeEnumTagMultiPayload();
    sub_220F2E640(&qword_267F36538, &qword_267F364F8, (void (*)(void))sub_220F2E3FC);
    sub_220F2E640(&qword_267F36558, &qword_267F364D0, (void (*)(void))sub_220F2E6C0);
  }
  else
  {
    char v54 = sub_220F31818();
    uint64_t v55 = v122;
    sub_220D26548(v44, v122, &qword_267F364C8);
    uint64_t v56 = v55 + *(int *)(v129 + 36);
    *(unsigned char *)uint64_t v56 = v54;
    *(_OWORD *)(v56 + 8) = 0u;
    *(_OWORD *)(v56 + 24) = 0u;
    *(unsigned char *)(v56 + 40) = 1;
    uint64_t v57 = sub_220D25B68(v44, &qword_267F364C8);
    MEMORY[0x270FA5388](v57);
    *(&v101 - 2) = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F080);
    sub_220F2E640(&qword_267F36558, &qword_267F364D0, (void (*)(void))sub_220F2E6C0);
    uint64_t v58 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2F088);
    uint64_t v59 = sub_220D25FB0(&qword_267F2F090, &qword_267F2F088);
    uint64_t v134 = v58;
    uint64_t v135 = v59;
    swift_getOpaqueTypeConformance2();
    uint64_t v60 = v104;
    sub_220F31E28();
    sub_220D25B68(v55, &qword_267F364D0);
    uint64_t v61 = sub_220F25AB8();
    char v62 = sub_220F31818();
    uint64_t v63 = v105;
    uint64_t v64 = (uint64_t)v108;
    uint64_t v65 = v106;
    (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v108, v60, v106);
    uint64_t v66 = v64 + *(int *)(v102 + 36);
    *(void *)uint64_t v66 = v61;
    *(unsigned char *)(v66 + 8) = v62;
    (*(void (**)(char *, uint64_t))(v63 + 8))(v60, v65);
    uint64_t v67 = v114;
    uint64_t v68 = &v114[*(int *)(v113 + 20)];
    uint64_t v69 = *MEMORY[0x263F19860];
    uint64_t v70 = sub_220F312A8();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v70 - 8) + 104))(v68, v69, v70);
    __asm { FMOV            V0.2D, #12.0 }
    *uint64_t v67 = _Q0;
    uint64_t v76 = (uint64_t)v109;
    uint64_t v77 = (uint64_t)&v109[*(int *)(v103 + 36)];
    uint64_t v78 = (uint64_t (*)(void))MEMORY[0x263F19048];
    sub_220F2E770((uint64_t)v67, v77, MEMORY[0x263F19048]);
    *(_WORD *)(v77 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
    sub_220D26548(v64, v76, &qword_267F364E0);
    sub_220F2E850((uint64_t)v67, v78);
    sub_220D25B68(v64, &qword_267F364E0);
    LOBYTE(v77) = sub_220F31808();
    uint64_t v79 = v111;
    sub_220D26548(v76, v111, &qword_267F364E8);
    uint64_t v80 = v79 + *(int *)(v107 + 36);
    *(unsigned char *)uint64_t v80 = v77;
    *(_OWORD *)(v80 + 8) = 0u;
    *(_OWORD *)(v80 + 24) = 0u;
    *(unsigned char *)(v80 + 40) = 1;
    sub_220D25B68(v76, &qword_267F364E8);
    LOBYTE(v77) = sub_220F31838();
    sub_220F30A88();
    uint64_t v82 = v81;
    uint64_t v84 = v83;
    uint64_t v86 = v85;
    uint64_t v88 = v87;
    uint64_t v89 = v110;
    sub_220D26548(v79, v110, &qword_267F364F0);
    uint64_t v90 = v89 + *(int *)(v126 + 36);
    *(unsigned char *)uint64_t v90 = v77;
    *(void *)(v90 + 8) = v82;
    *(void *)(v90 + 16) = v84;
    *(void *)(v90 + 24) = v86;
    *(void *)(v90 + 32) = v88;
    *(unsigned char *)(v90 + 40) = 0;
    sub_220D25B68(v79, &qword_267F364F0);
    uint64_t v50 = &qword_267F364F8;
    uint64_t v52 = v112;
    sub_220D39114(v89, v112, &qword_267F364F8);
    sub_220D26548(v52, v131, &qword_267F364F8);
    swift_storeEnumTagMultiPayload();
    sub_220F2E640(&qword_267F36538, &qword_267F364F8, (void (*)(void))sub_220F2E3FC);
  }
  uint64_t v53 = (uint64_t)v127;
  sub_220F31488();
  sub_220D25B68(v52, v50);
  uint64_t v91 = (uint64_t)v125;
  uint64_t v92 = (uint64_t)v123;
  sub_220D26548((uint64_t)v125, (uint64_t)v123, &qword_267F36520);
  uint64_t v93 = v133;
  uint64_t v94 = (uint64_t)v124;
  sub_220D26548(v133, (uint64_t)v124, &qword_267F36510);
  uint64_t v95 = v128;
  sub_220D26548(v53, v128, &qword_267F36500);
  uint64_t v96 = v132;
  sub_220D26548(v92, v132, &qword_267F36520);
  uint64_t v97 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_267F36578);
  sub_220D26548(v94, v96 + v97[12], &qword_267F36510);
  uint64_t v98 = v96 + v97[16];
  *(void *)uint64_t v98 = 0;
  *(unsigned char *)(v98 + 8) = 1;
  *(void *)(v98 + 16) = v121;
  *(unsigned char *)(v98 + 24) = v120;
  *(void *)(v98 + 32) = v119;
  *(unsigned char *)(v98 + 40) = v118;
  uint64_t v99 = v116;
  *(void *)(v98 + 48) = v117;
  *(void *)(v98 + 56) = v99;
  sub_220D26548(v95, v96 + v97[20], &qword_267F36500);
  sub_220D25B68(v53, &qword_267F36500);
  sub_220D25B68(v93, &qword_267F36510);
  sub_220D25B68(v91, &qword_267F36520);
  sub_220D25B68(v95, &qword_267F36500);
  sub_220D25B68(v94, &qword_267F36510);
  return sub_220D25B68(v92, &qword_267F36520);
}

uint64_t sub_220F24C7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v1 = sub_220F31578();
  MEMORY[0x270FA5388](v1);
  uint64_t v2 = sub_220F323B8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (uint64_t *)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36570);
  uint64_t v6 = *(void *)(v24 - 8);
  MEMORY[0x270FA5388](v24);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ECA0);
  sub_220F323C8();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_220F35110;
  if (qword_267F2E1A0 != -1) {
    swift_once();
  }
  void *v5 = qword_267F36420;
  v5[1] = 0x7FF0000000000000;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F1B8C0], v2);
  uint64_t v9 = sub_220F323D8();
  if (qword_267F2E1A8 != -1) {
    uint64_t v9 = swift_once();
  }
  MEMORY[0x270FA5388](v9);
  sub_220F31348();
  int v26 = 0;
  sub_220F2EC9C(&qword_267F30150, MEMORY[0x263F19D28]);
  sub_220F32FC8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F36580);
  sub_220D25FB0(&qword_267F36588, &qword_267F36580);
  sub_220F324D8();
  char v10 = sub_220F31828();
  sub_220F30A88();
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v24;
  uint64_t v19 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v25, v8, v24);
  uint64_t v21 = v19 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F364C8) + 36);
  *(unsigned char *)uint64_t v21 = v10;
  *(void *)(v21 + 8) = v12;
  *(void *)(v21 + 16) = v14;
  *(void *)(v21 + 24) = v16;
  *(void *)(v21 + 32) = v18;
  *(unsigned char *)(v21 + 40) = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v20);
}

uint64_t sub_220F250D8(uint64_t a1)
{
  uint64_t v2 = sub_220F31548();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F088);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_220F31538();
  uint64_t v10 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F0A0);
  sub_220D43914();
  sub_220F30B28();
  uint64_t v7 = sub_220D25FB0(&qword_267F2F090, &qword_267F2F088);
  MEMORY[0x223C74350](v6, v3, v7);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_220F2527C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for ActivityEditView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F338D0);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_267F2E160 != -1) {
    swift_once();
  }
  uint64_t v23 = sub_220F30408();
  uint64_t v24 = v11;
  sub_220F2E770(a1, (uint64_t)&v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for ActivityEditView);
  unint64_t v12 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v13 = swift_allocObject();
  sub_220F2EEE4((uint64_t)&v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], v13 + v12, type metadata accessor for ActivityEditView);
  sub_220D292B8();
  sub_220F321C8();
  uint64_t v14 = a1 + *(int *)(v4 + 52);
  char v15 = *(unsigned char *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  LOBYTE(v23) = v15;
  uint64_t v24 = v16;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  sub_220F32158();
  char v17 = v22[15];
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v19 = swift_allocObject();
  *(unsigned char *)(v19 + 16) = v17;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 16))(a2, v10, v7);
  uint64_t v20 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F0A0) + 36));
  *uint64_t v20 = KeyPath;
  v20[1] = (uint64_t)sub_220D39048;
  v20[2] = v19;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

void *sub_220F25584()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_220F30E48();
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ActivityEditView(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = v11;
  unint64_t v12 = (long long *)(v0 + v11[11]);
  uint64_t v13 = *((void *)v12 + 2);
  long long v61 = *v12;
  *(void *)&long long v62 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBE0);
  double result = (void *)sub_220F32158();
  if (*((void *)&v63 + 1))
  {
    uint64_t v55 = v7;
    uint64_t v56 = v5;
    uint64_t v57 = v4;
    long long v61 = v63;
    uint64_t v15 = (uint64_t)v10;
    uint64_t v16 = sub_220F30328();
    uint64_t v58 = v54;
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(void *)(v17 + 64);
    MEMORY[0x270FA5388](v16);
    sub_220F30318();
    v54[1] = sub_220D292B8();
    uint64_t v19 = sub_220F32B88();
    uint64_t v59 = v1;
    uint64_t v21 = v20;
    uint64_t v22 = *(void (**)(char *, void))(v17 + 8);
    v54[0] = v16;
    uint64_t v23 = v16;
    uint64_t v24 = v15;
    uint64_t v25 = v22;
    v22((char *)v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v23);
    swift_bridgeObjectRelease();
    uint64_t v26 = *((void *)v12 + 2);
    long long v61 = *v12;
    *(void *)&long long v62 = v26;
    *(void *)&long long v63 = v19;
    *((void *)&v63 + 1) = v21;
    uint64_t v27 = v59;
    sub_220F32168();
    BOOL v28 = sub_220F2A0F8();
    sub_220F2E770(v27, v15, type metadata accessor for ActivityEditView);
    if (v28)
    {
      sub_220F2E850(v15, type metadata accessor for ActivityEditView);
LABEL_11:
      uint64_t v53 = (uint64_t)v55;
      sub_220F115A8((uint64_t)v55);
      MEMORY[0x223C75070](v56);
      sub_220F30E38();
      sub_220F322B8();
      return (void *)sub_220D25B68(v53, &qword_267F2EA00);
    }
    uint64_t v29 = v60;
    uint64_t v30 = v24 + v60[11];
    uint64_t v31 = *(void *)(v30 + 16);
    long long v61 = *(_OWORD *)v30;
    *(void *)&long long v62 = v31;
    uint64_t v32 = sub_220F32158();
    if (*((void *)&v63 + 1))
    {
      uint64_t v33 = v24;
      uint64_t v34 = *(void *)(v24 + v60[15]);
      long long v61 = v63;
      MEMORY[0x270FA5388](v32);
      sub_220F30318();
      uint64_t v35 = sub_220F32B88();
      uint64_t v37 = v36;
      uint64_t v27 = v59;
      v25((char *)v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), v54[0]);
      swift_bridgeObjectRelease();
      uint64_t v29 = v60;
      char v38 = sub_220EB4E6C(v35, v37, v34);
      swift_bridgeObjectRelease();
      sub_220F2E850(v33, type metadata accessor for ActivityEditView);
      if (v38) {
        goto LABEL_11;
      }
    }
    else
    {
      sub_220F2E850(v24, type metadata accessor for ActivityEditView);
    }
    uint64_t v39 = *(void (**)(void, void, uint64_t, uint64_t, void, void))(v27 + v29[16]);
    uint64_t v40 = v27 + v29[8];
    long long v41 = *(_OWORD *)v40;
    uint64_t v43 = *(void *)(v40 + 16);
    uint64_t v42 = *(void *)(v40 + 24);
    long long v61 = v41;
    *(void *)&long long v62 = v43;
    *((void *)&v62 + 1) = v42;
    uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F300D8);
    MEMORY[0x223C75070](&v63, v44);
    long long v45 = v63;
    uint64_t v46 = v27 + v29[9];
    uint64_t v47 = *(void *)(v46 + 8);
    *(void *)&long long v61 = *(void *)v46;
    *((void *)&v61 + 1) = v47;
    long long v62 = *(_OWORD *)(v46 + 16);
    uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
    double result = MEMORY[0x223C75070](&v63);
    uint64_t v49 = *((void *)&v63 + 1);
    if (*((void *)&v63 + 1))
    {
      uint64_t v50 = v63;
      uint64_t v51 = v27 + v29[10];
      uint64_t v52 = *(void *)(v51 + 8);
      *(void *)&long long v61 = *(void *)v51;
      *((void *)&v61 + 1) = v52;
      long long v62 = *(_OWORD *)(v51 + 16);
      double result = MEMORY[0x223C75070](&v63, v48);
      if (*((void *)&v63 + 1))
      {
        v39(v45, *((void *)&v45 + 1), v50, v49, v63, *((void *)&v63 + 1));
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_220F25AB8()
{
  uint64_t v1 = sub_220F30AD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v14 - v6;
  if ((*(unsigned char *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 24)) & 1) == 0)
  {
    id v12 = objc_msgSend(self, sel_secondarySystemGroupedBackgroundColor);
    JUMPOUT(0x223C74C60);
  }
  sub_220F11B30((uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F184F8], v1);
  char v8 = sub_220F30AC8();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v4, v1);
  v9(v7, v1);
  uint64_t v10 = self;
  if (v8) {
    id v11 = objc_msgSend(v10, sel_secondarySystemGroupedBackgroundColor);
  }
  else {
    id v11 = objc_msgSend(v10, sel_systemGroupedBackgroundColor);
  }
  return MEMORY[0x223C74C60](v11);
}

void *sub_220F25C84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36680);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v76 = (uint64_t *)((char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36688);
  uint64_t v85 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v75 = (uint64_t)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36690);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v87 = (uint64_t)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v88 = (uint64_t)&v74 - v10;
  uint64_t v11 = sub_220F32088();
  uint64_t v89 = *(void *)(v11 - 8);
  uint64_t v90 = v11;
  MEMORY[0x270FA5388](v11);
  uint64_t v83 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_220F30AD8();
  uint64_t v13 = *(void *)(v91 - 8);
  MEMORY[0x270FA5388](v91);
  uint64_t v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v74 - v17;
  uint64_t v97 = (int *)type metadata accessor for ActivityEditView(0);
  uint64_t v19 = a1 + v97[10];
  uint64_t v20 = *(void *)(v19 + 8);
  uint64_t v109 = *(void *)v19;
  uint64_t v110 = v20;
  long long v111 = *(_OWORD *)(v19 + 16);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
  MEMORY[0x223C75070](&v98);
  uint64_t v22 = *((void *)&v98 + 1);
  if (*((void *)&v98 + 1))
  {
    uint64_t v23 = a1;
    uint64_t v24 = v98;
    uint64_t v25 = qword_267F2E1D8;
    swift_bridgeObjectRetain();
    if (v25 != -1) {
      swift_once();
    }
    uint64_t v26 = off_267F36440;
    if (*((void *)off_267F36440 + 2))
    {
      unint64_t v27 = sub_220E81218(v24, v22);
      if (v28)
      {
        uint64_t v96 = *(void *)(v26[7] + 8 * v27);
        swift_retain();
        swift_bridgeObjectRelease_n();
        a1 = v23;
        goto LABEL_9;
      }
    }
    swift_bridgeObjectRelease_n();
    a1 = v23;
  }
  uint64_t v96 = sub_220F31FF8();
LABEL_9:
  if (qword_267F2E178 != -1) {
    swift_once();
  }
  uint64_t v86 = v5;
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v92 = v148;
  uint64_t v93 = v150;
  int v81 = v151;
  int v82 = v149;
  uint64_t v94 = v153;
  uint64_t v95 = v152;
  uint64_t v29 = a1 + v97[9];
  uint64_t v30 = *(void *)(v29 + 8);
  uint64_t v109 = *(void *)v29;
  uint64_t v110 = v30;
  long long v111 = *(_OWORD *)(v29 + 16);
  double result = MEMORY[0x223C75070](&v98, v21);
  uint64_t v32 = *((void *)&v98 + 1);
  if (*((void *)&v98 + 1))
  {
    uint64_t v33 = a1;
    uint64_t v34 = v98;
    sub_220F11B30((uint64_t)v18);
    uint64_t v35 = v91;
    (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F184F8], v91);
    char v36 = sub_220F30AC8();
    uint64_t v37 = *(void (**)(char *, uint64_t))(v13 + 8);
    v37(v15, v35);
    v37(v18, v35);
    _s15FocusSettingsUI14ActivitySourceV25inverseVariantIfAvailable3for17isDarkColorSchemeS2S_SbtFZ_0(v34, v32, v36 & 1);
    swift_bridgeObjectRelease();
    sub_220F320A8();
    uint64_t v39 = v89;
    uint64_t v38 = v90;
    uint64_t v40 = v83;
    (*(void (**)(char *, void, uint64_t))(v89 + 104))(v83, *MEMORY[0x263F1B4B8], v90);
    uint64_t v91 = sub_220F320D8();
    swift_release();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v38);
    if (qword_267F2E170 != -1) {
      swift_once();
    }
    sub_220F32468();
    sub_220F30BA8();
    uint64_t v79 = v154;
    unsigned __int8 v41 = v155;
    uint64_t v42 = v156;
    unsigned __int8 v43 = v157;
    uint64_t v90 = v158;
    uint64_t v83 = v159;
    uint64_t v80 = sub_220F31F88();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v89 = sub_220F32468();
    uint64_t v77 = v44;
    unsigned __int8 v145 = v82;
    unsigned __int8 v143 = v81;
    uint64_t v45 = 1;
    unsigned __int8 v141 = 1;
    unsigned __int8 v138 = v41;
    unsigned __int8 v136 = v43;
    uint64_t v46 = v86;
    if ((*(unsigned char *)(v33 + v97[6]) & 1) == 0)
    {
      uint64_t v47 = v33 + v97[7];
      if ((*(unsigned char *)(v47 + 8) & 1) == 0 && (unint64_t)(*(void *)v47 + 1) >= 2)
      {
        uint64_t v48 = sub_220F31348();
        uint64_t v49 = (uint64_t)v76;
        uint64_t *v76 = v48;
        *(void *)(v49 + 8) = 0;
        *(unsigned char *)(v49 + 16) = 1;
        uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366A0);
        sub_220F266F8(v33, v49 + *(int *)(v50 + 44));
        uint64_t v51 = swift_getKeyPath();
        uint64_t v52 = v75;
        sub_220D26548(v49, v75, &qword_267F36680);
        uint64_t v53 = v52 + *(int *)(v46 + 36);
        *(void *)uint64_t v53 = v51;
        *(unsigned char *)(v53 + 8) = 2;
        sub_220D25B68(v49, &qword_267F36680);
        sub_220D39114(v52, v88, &qword_267F36688);
        uint64_t v45 = 0;
      }
    }
    uint64_t v54 = v88;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v85 + 56))(v88, v45, 1, v46);
    unsigned __int8 v55 = v145;
    LODWORD(v86) = v145;
    unsigned __int8 v56 = v143;
    LODWORD(v97) = v143;
    unsigned __int8 v57 = v141;
    LODWORD(v85) = v141;
    unsigned __int8 v58 = v138;
    unsigned __int8 v59 = v136;
    int v81 = v138;
    int v82 = v136;
    uint64_t v60 = v87;
    sub_220D26548(v54, v87, &qword_267F36690);
    *(void *)&long long v98 = v96;
    WORD4(v98) = 256;
    *(_DWORD *)((char *)&v98 + 10) = v146;
    HIWORD(v98) = v147;
    *(void *)&long long v99 = v92;
    BYTE8(v99) = v55;
    *(_DWORD *)((char *)&v99 + 9) = *(_DWORD *)v144;
    HIDWORD(v99) = *(_DWORD *)&v144[3];
    *(void *)&long long v100 = v93;
    BYTE8(v100) = v56;
    *(_DWORD *)((char *)&v100 + 9) = *(_DWORD *)v142;
    HIDWORD(v100) = *(_DWORD *)&v142[3];
    *(void *)&long long v101 = v95;
    *((void *)&v101 + 1) = v94;
    long long v102 = (unint64_t)v91;
    LOWORD(v103) = v57;
    WORD3(v103) = v140;
    *(_DWORD *)((char *)&v103 + 2) = v139;
    uint64_t v62 = KeyPath;
    uint64_t v61 = v79;
    *((void *)&v103 + 1) = v79;
    LOBYTE(v104) = v58;
    *(_DWORD *)((char *)&v104 + 1) = *(_DWORD *)v137;
    DWORD1(v104) = *(_DWORD *)&v137[3];
    *((void *)&v104 + 1) = v42;
    LOBYTE(v105) = v59;
    *(_DWORD *)((char *)&v105 + 1) = *(_DWORD *)v135;
    DWORD1(v105) = *(_DWORD *)&v135[3];
    uint64_t v64 = v83;
    long long v63 = (_OWORD *)v84;
    *((void *)&v105 + 1) = v90;
    *(void *)&long long v106 = v83;
    uint64_t v76 = v42;
    uint64_t v65 = v80;
    *((void *)&v106 + 1) = KeyPath;
    *(void *)&long long v107 = v80;
    uint64_t v66 = v77;
    *((void *)&v107 + 1) = v89;
    uint64_t v108 = v77;
    *(void *)(v84 + 160) = v77;
    long long v67 = v99;
    *long long v63 = v98;
    v63[1] = v67;
    long long v68 = v107;
    v63[8] = v106;
    v63[9] = v68;
    long long v69 = v100;
    long long v70 = v101;
    long long v71 = v103;
    v63[4] = v102;
    v63[5] = v71;
    v63[2] = v69;
    v63[3] = v70;
    long long v72 = v105;
    v63[6] = v104;
    v63[7] = v72;
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36698);
    sub_220D26548(v60, (uint64_t)v63 + *(int *)(v73 + 48), &qword_267F36690);
    sub_220F2FB08((uint64_t)&v98);
    sub_220D25B68(v54, &qword_267F36690);
    sub_220D25B68(v60, &qword_267F36690);
    uint64_t v109 = v96;
    LOWORD(v110) = 256;
    *(_DWORD *)((char *)&v110 + 2) = v146;
    HIWORD(v110) = v147;
    *(void *)&long long v111 = v92;
    BYTE8(v111) = v86;
    *(_DWORD *)((char *)&v111 + 9) = *(_DWORD *)v144;
    HIDWORD(v111) = *(_DWORD *)&v144[3];
    uint64_t v112 = v93;
    char v113 = (char)v97;
    *(_DWORD *)uint64_t v114 = *(_DWORD *)v142;
    *(_DWORD *)&_DWORD v114[3] = *(_DWORD *)&v142[3];
    uint64_t v115 = v95;
    uint64_t v116 = v94;
    uint64_t v117 = v91;
    uint64_t v118 = 0;
    char v119 = v85;
    char v120 = 0;
    __int16 v122 = v140;
    int v121 = v139;
    uint64_t v123 = v61;
    char v124 = v81;
    *(_DWORD *)uint64_t v125 = *(_DWORD *)v137;
    *(_DWORD *)&v125[3] = *(_DWORD *)&v137[3];
    uint64_t v126 = v76;
    char v127 = v82;
    *(_DWORD *)&v128[3] = *(_DWORD *)&v135[3];
    *(_DWORD *)uint64_t v128 = *(_DWORD *)v135;
    uint64_t v129 = v90;
    uint64_t v130 = v64;
    uint64_t v131 = v62;
    uint64_t v132 = v65;
    uint64_t v133 = v89;
    uint64_t v134 = v66;
    return (void *)sub_220F2FB5C((uint64_t)&v109);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static Color.activityColor(_:)(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = qword_267F2E1D8;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = off_267F36440;
  if (*((void *)off_267F36440 + 2) && (unint64_t v6 = sub_220E81218(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(v5[7] + 8 * v6);
    swift_retain();
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_220F266F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366A8);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366B0);
  uint64_t v8 = v7 - 8;
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v19 - v12;
  *(void *)unint64_t v6 = sub_220F31228();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366B8);
  sub_220F268EC(a1, &v6[*(int *)(v14 + 44)]);
  sub_220F31368();
  sub_220F311F8();
  sub_220F30BA8();
  sub_220D26548((uint64_t)v6, (uint64_t)v10, &qword_267F366A8);
  uint64_t v15 = &v10[*(int *)(v8 + 44)];
  long long v16 = v19[1];
  *(_OWORD *)uint64_t v15 = v19[0];
  *((_OWORD *)v15 + 1) = v16;
  *((_OWORD *)v15 + 2) = v19[2];
  sub_220D25B68((uint64_t)v6, &qword_267F366A8);
  sub_220D39114((uint64_t)v10, (uint64_t)v13, &qword_267F366B0);
  sub_220D26548((uint64_t)v13, (uint64_t)v10, &qword_267F366B0);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366C0);
  sub_220D26548((uint64_t)v10, a2 + *(int *)(v17 + 48), &qword_267F366B0);
  sub_220D25B68((uint64_t)v13, &qword_267F366B0);
  return sub_220D25B68((uint64_t)v10, &qword_267F366B0);
}

uint64_t sub_220F268EC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v39 = a2;
  uint64_t v3 = sub_220F31568();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  uint64_t v38 = v4;
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for ActivityEditView(0);
  uint64_t v34 = *(void *)(v7 - 8);
  uint64_t v8 = *(void *)(v34 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2F168);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366C8);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v35 = v12;
  uint64_t v36 = v13;
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366D0);
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v22 = (char *)&v34 - v21;
  sub_220F30A48();
  uint64_t v23 = sub_220F30A68();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v11, 0, 1, v23);
  sub_220F2E770(a1, (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  unint64_t v24 = (*(unsigned __int8 *)(v34 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  uint64_t v25 = swift_allocObject();
  sub_220F2EEE4((uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v25 + v24, type metadata accessor for ActivityEditView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F366D8);
  sub_220D25FB0(&qword_267F366E0, &qword_267F366D8);
  sub_220F32198();
  sub_220F31558();
  sub_220D25FB0(&qword_267F366E8, &qword_267F366C8);
  sub_220F2EC9C(&qword_267F31708, MEMORY[0x263F19CE8]);
  uint64_t v26 = v35;
  uint64_t v27 = v37;
  sub_220F31BA8();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v27);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v26);
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v19, v16);
  char v28 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  v28(v19, v22, v16);
  uint64_t v29 = v39;
  void *v39 = 0;
  *((unsigned char *)v29 + 8) = 1;
  uint64_t v30 = (char *)v29;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F366F0);
  v28(&v30[*(int *)(v31 + 48)], v19, v16);
  uint64_t v32 = *(void (**)(char *, uint64_t))(v17 + 8);
  v32(v22, v16);
  return ((uint64_t (*)(char *, uint64_t))v32)(v19, v16);
}

uint64_t sub_220F26E10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v35 = a1;
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36610);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v36 = (uint64_t)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v37 = (uint64_t)&v30 - v4;
  sub_220F27130((uint64_t)&v30 - v4);
  if (sub_220F27C54())
  {
    if (qword_267F2E160 != -1) {
      swift_once();
    }
    sub_220F30408();
    sub_220F319D8();
    uint64_t v5 = sub_220F31AF8();
    uint64_t v7 = v6;
    char v9 = v8;
    swift_bridgeObjectRelease();
    swift_release();
    sub_220F31EE8();
    uint64_t v10 = sub_220F31A98();
    uint64_t v33 = v11;
    uint64_t v34 = v10;
    char v13 = v12;
    uint64_t v32 = v14;
    swift_release();
    uint64_t v15 = v13 & 1;
    sub_220D357E0(v5, v7, v9 & 1);
    swift_bridgeObjectRelease();
    unsigned __int8 v16 = sub_220F31808();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v18 = v16;
    uint64_t v30 = 2;
    uint64_t v31 = KeyPath;
    uint64_t v19 = 1;
    uint64_t v20 = 256;
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v15 = 0;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v20 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v30 = 0;
  }
  uint64_t v21 = v36;
  sub_220D26548(v37, v36, &qword_267F36610);
  uint64_t v22 = v35;
  sub_220D26548(v21, v35, &qword_267F36610);
  uint64_t v23 = v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F36618) + 48);
  uint64_t v25 = v33;
  uint64_t v24 = v34;
  *(void *)uint64_t v23 = v34;
  *(void *)(v23 + 8) = v25;
  *(void *)(v23 + 16) = v15;
  char v26 = v15;
  uint64_t v28 = v31;
  uint64_t v27 = v32;
  *(void *)(v23 + 24) = v32;
  *(void *)(v23 + 32) = v20;
  *(void *)(v23 + 40) = v18;
  *(_OWORD *)(v23 + 48) = 0u;
  *(_OWORD *)(v23 + 64) = 0u;
  *(void *)(v23 + 80) = v19;
  *(void *)(v23 + 88) = v28;
  *(void *)(v23 + 96) = v30;
  *(unsigned char *)(v23 + 104) = 0;
  sub_220F2F300(v24, v25, v26, v27);
  sub_220D25B68(v37, &qword_267F36610);
  sub_220F2F350(v24, v25, v26, v27);
  return sub_220D25B68(v21, &qword_267F36610);
}

uint64_t sub_220F27130@<X0>(uint64_t a1@<X8>)
{
  uint64_t v110 = a1;
  uint64_t v108 = sub_220F30E58();
  MEMORY[0x270FA5388](v108);
  uint64_t v109 = (char *)&v86 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36620);
  uint64_t v92 = *(void *)(v96 - 8);
  MEMORY[0x270FA5388](v96);
  uint64_t v90 = (char *)&v86 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36628);
  MEMORY[0x270FA5388](v88);
  uint64_t v97 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36630);
  MEMORY[0x270FA5388](v98);
  uint64_t v94 = (uint64_t)&v86 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36638);
  uint64_t v100 = *(void *)(v102 - 8);
  MEMORY[0x270FA5388](v102);
  uint64_t v93 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36640);
  MEMORY[0x270FA5388](v89);
  long long v99 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36648);
  MEMORY[0x270FA5388](v91);
  uint64_t v103 = (uint64_t)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36650);
  MEMORY[0x270FA5388](v95);
  uint64_t v105 = (uint64_t)&v86 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36658);
  MEMORY[0x270FA5388](v101);
  uint64_t v106 = (uint64_t)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36660);
  MEMORY[0x270FA5388](v104);
  uint64_t v107 = (uint64_t)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = type metadata accessor for ActivityEditView(0);
  uint64_t v12 = *(void *)(v87 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  MEMORY[0x270FA5388](v87);
  sub_220F2E770(v1, (uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  sub_220F328F8();
  uint64_t v14 = sub_220F328E8();
  uint64_t v15 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = swift_allocObject();
  uint64_t v17 = MEMORY[0x263F8F500];
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v17;
  uint64_t v18 = v1;
  sub_220F2EEE4((uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + ((v15 + 32) & ~v15), type metadata accessor for ActivityEditView);
  sub_220F2E770(v1, (uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  uint64_t v19 = sub_220F328E8();
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = v19;
  void v20[3] = MEMORY[0x263F8F500];
  v20[4] = 40;
  sub_220F2EEE4((uint64_t)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v20 + ((v15 + 40) & ~v15), type metadata accessor for ActivityEditView);
  sub_220F322E8();
  uint64_t v21 = v113;
  uint64_t v22 = qword_267F2E160;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  if (v22 != -1) {
    swift_once();
  }
  uint64_t v111 = sub_220F30408();
  uint64_t v112 = v23;
  sub_220D292B8();
  sub_220F31B28();
  uint64_t v24 = v90;
  sub_220F324F8();
  uint64_t v25 = (char *)(v18 + *(int *)(v87 + 20));
  uint64_t v87 = v21;
  char v26 = *v25;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = (v26 & 1) == 0;
  uint64_t v29 = v92;
  uint64_t v30 = (uint64_t)v97;
  uint64_t v31 = v96;
  (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v97, v24, v96);
  uint64_t v32 = (uint64_t *)(v30 + *(int *)(v88 + 36));
  *uint64_t v32 = KeyPath;
  v32[1] = (uint64_t)sub_220D47A38;
  v32[2] = v28;
  (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v31);
  sub_220F31968();
  sub_220F31908();
  uint64_t v33 = sub_220F31978();
  swift_release();
  uint64_t v34 = swift_getKeyPath();
  uint64_t v35 = v94;
  sub_220D26548(v30, v94, &qword_267F36628);
  uint64_t v36 = v98;
  uint64_t v37 = (uint64_t *)(v35 + *(int *)(v98 + 36));
  *uint64_t v37 = v34;
  v37[1] = v33;
  sub_220D25B68(v30, &qword_267F36628);
  unint64_t v38 = sub_220F2F99C();
  uint64_t v39 = v93;
  MEMORY[0x223C74B30](1, v36, v38);
  sub_220D25B68(v35, &qword_267F36630);
  uint64_t v40 = swift_getKeyPath();
  uint64_t v42 = (uint64_t)v99;
  uint64_t v41 = v100;
  uint64_t v43 = v102;
  (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v99, v39, v102);
  uint64_t v44 = v42 + *(int *)(v89 + 36);
  *(void *)uint64_t v44 = v40;
  *(unsigned char *)(v44 + 8) = 1;
  (*(void (**)(char *, uint64_t))(v41 + 8))(v39, v43);
  uint64_t v45 = sub_220F283B0();
  uint64_t v46 = swift_getKeyPath();
  uint64_t v47 = v103;
  sub_220D26548(v42, v103, &qword_267F36640);
  uint64_t v48 = (uint64_t *)(v47 + *(int *)(v91 + 36));
  *uint64_t v48 = v46;
  v48[1] = v45;
  sub_220D25B68(v42, &qword_267F36640);
  LOBYTE(v45) = sub_220F31808();
  sub_220F30A88();
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v56 = v55;
  uint64_t v57 = v105;
  sub_220D26548(v47, v105, &qword_267F36648);
  uint64_t v58 = v57 + *(int *)(v95 + 36);
  *(unsigned char *)uint64_t v58 = v45;
  *(void *)(v58 + 8) = v50;
  *(void *)(v58 + 16) = v52;
  *(void *)(v58 + 24) = v54;
  *(void *)(v58 + 32) = v56;
  *(unsigned char *)(v58 + 40) = 0;
  sub_220D25B68(v47, &qword_267F36648);
  LOBYTE(v45) = sub_220F31878();
  sub_220F30A88();
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v67 = v106;
  sub_220D26548(v57, v106, &qword_267F36650);
  uint64_t v68 = v67 + *(int *)(v101 + 36);
  *(unsigned char *)uint64_t v68 = v45;
  *(void *)(v68 + 8) = v60;
  *(void *)(v68 + 16) = v62;
  *(void *)(v68 + 24) = v64;
  *(void *)(v68 + 32) = v66;
  *(unsigned char *)(v68 + 40) = 0;
  sub_220D25B68(v57, &qword_267F36650);
  uint64_t v69 = sub_220F25AB8();
  LOBYTE(v46) = sub_220F31818();
  uint64_t v70 = v107;
  sub_220D26548(v67, v107, &qword_267F36658);
  uint64_t v71 = v70 + *(int *)(v104 + 36);
  *(void *)uint64_t v71 = v69;
  *(unsigned char *)(v71 + 8) = v46;
  sub_220D25B68(v67, &qword_267F36658);
  long long v72 = v109;
  uint64_t v73 = &v109[*(int *)(v108 + 20)];
  uint64_t v74 = *MEMORY[0x263F19860];
  uint64_t v75 = sub_220F312A8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v75 - 8) + 104))(v73, v74, v75);
  __asm { FMOV            V0.2D, #12.0 }
  *long long v72 = _Q0;
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36610);
  uint64_t v82 = v110;
  uint64_t v83 = v110 + *(int *)(v81 + 36);
  uint64_t v84 = (uint64_t (*)(void))MEMORY[0x263F19048];
  sub_220F2E770((uint64_t)v72, v83, MEMORY[0x263F19048]);
  *(_WORD *)(v83 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2F310) + 36)) = 256;
  sub_220D26548(v70, v82, &qword_267F36660);
  sub_220F2E850((uint64_t)v72, v84);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return sub_220D25B68(v70, &qword_267F36660);
}

uint64_t sub_220F27C54()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = (long long *)(v0 + *(int *)(v1 + 44));
  uint64_t v3 = *((void *)v2 + 2);
  long long v14 = *v2;
  uint64_t v15 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBE0);
  sub_220F32158();
  char v4 = BYTE8(v16);
  if (*((void *)&v16 + 1))
  {
    uint64_t v5 = *(void *)(v0 + *(int *)(v1 + 60));
    long long v14 = v16;
    uint64_t v6 = sub_220F30328();
    uint64_t v7 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v6);
    uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_220F30318();
    sub_220D292B8();
    uint64_t v10 = sub_220F32B88();
    uint64_t v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    swift_bridgeObjectRelease();
    char v4 = sub_220EB4E6C(v10, v12, v5);
    swift_bridgeObjectRelease();
  }
  return v4 & 1;
}

uint64_t sub_220F27DD0@<X0>(void *a1@<X8>)
{
  type metadata accessor for ActivityEditView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBE0);
  uint64_t result = sub_220F32158();
  uint64_t v3 = v5;
  unint64_t v4 = v6;
  if (!v6)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0xE000000000000000;
  }
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_220F27E54(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (int *)type metadata accessor for ActivityEditView(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v62 - v12;
  uint64_t v15 = *a1;
  unint64_t v14 = a1[1];
  swift_bridgeObjectRetain();
  uint64_t v17 = sub_220E08C24(a4, v15, v14, v16);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = MEMORY[0x223C75570](v17, v19, v21, v23);
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  uint64_t v27 = a5 + v8[11];
  uint64_t v28 = *(void *)(v27 + 16);
  long long v68 = *(_OWORD *)v27;
  uint64_t v69 = v28;
  *(void *)&long long v71 = v24;
  *((void *)&v71 + 1) = v26;
  swift_bridgeObjectRetain();
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBE0);
  sub_220F32168();
  LOBYTE(v17) = sub_220F2A0F8();
  sub_220F2E770(a5, (uint64_t)v13, type metadata accessor for ActivityEditView);
  if (v17)
  {
    sub_220F2E850((uint64_t)v13, type metadata accessor for ActivityEditView);
LABEL_5:
    swift_bridgeObjectRelease();
    uint64_t v38 = a5 + v8[12];
    long long v39 = *(_OWORD *)v38;
    uint64_t v40 = *(void *)(v38 + 16);
    long long v68 = v39;
    uint64_t v69 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F30558);
    sub_220F32158();
    uint64_t v26 = *((void *)&v71 + 1);
    uint64_t v24 = v71;
    goto LABEL_7;
  }
  uint64_t v30 = &v13[v8[11]];
  uint64_t v31 = *((void *)v30 + 2);
  long long v68 = *(_OWORD *)v30;
  uint64_t v69 = v31;
  sub_220F32158();
  if (*((void *)&v71 + 1))
  {
    uint64_t v65 = *(void *)&v13[v8[15]];
    long long v68 = v71;
    uint64_t v63 = sub_220F30328();
    uint64_t v64 = &v62;
    uint64_t v32 = *(void *)(v63 - 8);
    MEMORY[0x270FA5388](v63);
    uint64_t v66 = v29;
    uint64_t v34 = (char *)&v62 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_220F30318();
    sub_220D292B8();
    uint64_t v35 = sub_220F32B88();
    uint64_t v67 = v10;
    uint64_t v37 = v36;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v63);
    swift_bridgeObjectRelease();
    LOBYTE(v35) = sub_220EB4E6C(v35, v37, v65);
    uint64_t v10 = v67;
    swift_bridgeObjectRelease();
    sub_220F2E850((uint64_t)v13, type metadata accessor for ActivityEditView);
    if ((v35 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  sub_220F2E850((uint64_t)v13, type metadata accessor for ActivityEditView);
LABEL_7:
  uint64_t v41 = a5 + v8[8];
  long long v42 = *(_OWORD *)v41;
  uint64_t v44 = *(void *)(v41 + 16);
  uint64_t v43 = *(void *)(v41 + 24);
  long long v68 = v42;
  uint64_t v69 = v44;
  uint64_t v70 = v43;
  *(void *)&long long v71 = v24;
  *((void *)&v71 + 1) = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F300D8);
  sub_220F322B8();
  BOOL v45 = sub_220F2A0F8();
  sub_220F2E770(a5, (uint64_t)v10, type metadata accessor for ActivityEditView);
  if (v45)
  {
    char v46 = 1;
  }
  else
  {
    uint64_t v47 = &v10[v8[11]];
    uint64_t v48 = *((void *)v47 + 2);
    long long v68 = *(_OWORD *)v47;
    uint64_t v69 = v48;
    sub_220F32158();
    if (*((void *)&v71 + 1))
    {
      uint64_t v67 = *(char **)&v10[v8[15]];
      long long v68 = v71;
      uint64_t v49 = v10;
      uint64_t v50 = sub_220F30328();
      uint64_t v51 = *(void *)(v50 - 8);
      MEMORY[0x270FA5388](v50);
      uint64_t v53 = (char *)&v62 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_220F30318();
      sub_220D292B8();
      uint64_t v54 = sub_220F32B88();
      uint64_t v56 = v55;
      uint64_t v57 = v50;
      uint64_t v10 = v49;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v57);
      swift_bridgeObjectRelease();
      char v46 = sub_220EB4E6C(v54, v56, (uint64_t)v67);
      swift_bridgeObjectRelease();
    }
    else
    {
      char v46 = 0;
    }
  }
  sub_220F2E850((uint64_t)v10, type metadata accessor for ActivityEditView);
  uint64_t v58 = a5 + v8[13];
  char v59 = *(unsigned char *)v58;
  uint64_t v60 = *(void *)(v58 + 8);
  LOBYTE(v68) = v59;
  *((void *)&v68 + 1) = v60;
  LOBYTE(v71) = v46 & 1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F30110);
  return sub_220F32168();
}

uint64_t sub_220F283B0()
{
  type metadata accessor for ActivityEditView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
  MEMORY[0x223C75070](&v9, v0);
  uint64_t v1 = v10;
  if (!v10) {
    return 0;
  }
  uint64_t v2 = v9;
  uint64_t v3 = qword_267F2E1D8;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  unint64_t v4 = off_267F36440;
  if (*((void *)off_267F36440 + 2) && (unint64_t v5 = sub_220E81218(v2, v1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(v4[7] + 8 * v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = 0;
  }
  swift_bridgeObjectRelease_n();
  return v7;
}

uint64_t sub_220F284A8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36590);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v56 = (char *)v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v55 = (char *)v48 - v6;
  uint64_t v7 = type metadata accessor for ActivityEditView(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v10 = (char *)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36598);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v49 = (char *)v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v16 = (char *)v48 - v15;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (char *)v48 - v18;
  if (qword_267F2E1D0 != -1) {
    swift_once();
  }
  uint64_t v57 = v19;
  uint64_t v53 = v12;
  uint64_t v54 = v11;
  uint64_t v20 = swift_bridgeObjectRetain();
  uint64_t v21 = sub_220D21368(v20);
  swift_bridgeObjectRelease();
  v58[0] = (uint64_t)v21;
  swift_retain();
  sub_220F2B51C(v58);
  swift_release();
  swift_getKeyPath();
  sub_220F2E770(a1, (uint64_t)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for ActivityEditView);
  uint64_t v22 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v23 = (v22 + 16) & ~v22;
  v48[0] = v22 | 7;
  v48[1] = v23 + v9;
  uint64_t v24 = swift_allocObject();
  sub_220F2EEE4((uint64_t)v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v24 + v23, type metadata accessor for ActivityEditView);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F365A0);
  sub_220D25FB0(&qword_267F365A8, &qword_267F33C20);
  unint64_t OpaqueTypeConformance2 = sub_220F2EB48();
  v48[2] = v25;
  sub_220F32348();
  uint64_t v26 = (*(uint64_t (**)(char *, char *, uint64_t))(v53 + 32))(v57, v16, v54);
  if (qword_267F2E080 != -1) {
    uint64_t v26 = swift_once();
  }
  uint64_t v27 = static ActivitySource.allSymbolImagenames;
  MEMORY[0x270FA5388](v26);
  swift_bridgeObjectRetain();
  v58[4] = sub_220EB4A48((uint64_t)sub_220F2ECE4, (uint64_t)&v48[-4], v27);
  swift_getKeyPath();
  sub_220F2E770(a1, (uint64_t)v10, type metadata accessor for ActivityEditView);
  uint64_t v28 = swift_allocObject();
  sub_220F2EEE4((uint64_t)v10, v28 + v23, type metadata accessor for ActivityEditView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F365C8);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F365D0);
  uint64_t v30 = sub_220F31568();
  unint64_t v31 = sub_220F2EDEC();
  uint64_t v32 = sub_220F2EC9C(&qword_267F31708, MEMORY[0x263F19CE8]);
  v58[0] = v29;
  v58[1] = v30;
  v58[2] = v31;
  v58[3] = v32;
  unint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v33 = v55;
  sub_220F32348();
  uint64_t v35 = v53;
  uint64_t v34 = v54;
  uint64_t v36 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  uint64_t v37 = v49;
  v36(v49, v57, v54);
  uint64_t v39 = v51;
  uint64_t v38 = v52;
  uint64_t v40 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
  v40(v56, v33, v52);
  uint64_t v41 = v50;
  v36(v50, v37, v34);
  long long v42 = &v41[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F365F0) + 48)];
  uint64_t v43 = v56;
  v40(v42, v56, v38);
  uint64_t v44 = *(void (**)(char *, uint64_t))(v39 + 8);
  v44(v55, v38);
  BOOL v45 = *(void (**)(char *, uint64_t))(v35 + 8);
  v45(v57, v34);
  v44(v43, v38);
  return ((uint64_t (*)(char *, uint64_t))v45)(v37, v34);
}

uint64_t static Color.allSystemColors.getter()
{
  if (qword_267F2E1D0 != -1) {
    swift_once();
  }
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_220D21368(v0);
  swift_bridgeObjectRelease();
  uint64_t v3 = v1;
  swift_retain();
  sub_220F2B51C((uint64_t *)&v3);
  swift_release();
  return (uint64_t)v3;
}

uint64_t sub_220F28BE4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v62 = a3;
  uint64_t v61 = sub_220F312F8();
  uint64_t v60 = *(void *)(v61 - 8);
  MEMORY[0x270FA5388](v61);
  char v59 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_220F31568();
  uint64_t v65 = *(void *)(v71 - 8);
  MEMORY[0x270FA5388](v71);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = type metadata accessor for ActivityEditView(0);
  uint64_t v8 = *(void *)(v69 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  MEMORY[0x270FA5388](v69);
  uint64_t v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F365B8);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  uint64_t v64 = v12;
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F36600);
  uint64_t v67 = *(void *)(v15 - 8);
  uint64_t v68 = v15;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F365A0);
  MEMORY[0x270FA5388](v58);
  uint64_t v70 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v57 = (char *)&v56 - v20;
  uint64_t v22 = *a1;
  uint64_t v21 = a1[1];
  sub_220F2E770(a2, (uint64_t)v10, type metadata accessor for ActivityEditView);
  unint64_t v23 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v24 = (v9 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v25 + v23;
  uint64_t v27 = a2;
  sub_220F2EEE4((uint64_t)v10, v26, type metadata accessor for ActivityEditView);
  uint64_t v28 = (uint64_t *)(v25 + v24);
  *uint64_t v28 = v22;
  v28[1] = v21;
  uint64_t v72 = v22;
  uint64_t v73 = v21;
  uint64_t v74 = a2;
  sub_220F2F2AC();
  swift_bridgeObjectRetain();
  sub_220F321A8();
  sub_220F31558();
  uint64_t v29 = sub_220D25FB0(&qword_267F365C0, &qword_267F365B8);
  uint64_t v30 = sub_220F2EC9C(&qword_267F31708, MEMORY[0x263F19CE8]);
  uint64_t v66 = v17;
  uint64_t v31 = v63;
  uint64_t v32 = v71;
  sub_220F31BA8();
  uint64_t v33 = v7;
  uint64_t v34 = v31;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v33, v32);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v14, v31);
  uint64_t v35 = qword_267F2E1D8;
  swift_bridgeObjectRetain();
  if (v35 != -1) {
    swift_once();
  }
  uint64_t v36 = v22;
  uint64_t v37 = v21;
  if (*((void *)off_267F36440 + 2))
  {
    sub_220E81218(v22, v21);
    uint64_t v36 = v22;
    uint64_t v37 = v21;
    if (v38)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      sub_220DB8304();
      uint64_t v39 = (void *)sub_220F32AE8();
      uint64_t v40 = (CGColor *)objc_msgSend(v39, sel_CGColor);

      uint64_t v41 = AXNameFromColor(v40);
      uint64_t v36 = sub_220F32768();
      uint64_t v37 = v42;
      uint64_t v32 = v71;
      swift_release_n();
    }
  }
  uint64_t v78 = v36;
  uint64_t v79 = v37;
  uint64_t v75 = v34;
  uint64_t v76 = v32;
  *(void *)&long long v77 = v29;
  *((void *)&v77 + 1) = v30;
  swift_getOpaqueTypeConformance2();
  sub_220D292B8();
  uint64_t v43 = (uint64_t)v70;
  uint64_t v44 = v68;
  BOOL v45 = v66;
  sub_220F31CF8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v45, v44);
  uint64_t v46 = v27 + *(int *)(v69 + 40);
  uint64_t v47 = *(void *)(v46 + 8);
  uint64_t v75 = *(void *)v46;
  uint64_t v76 = v47;
  long long v77 = *(_OWORD *)(v46 + 16);
  swift_bridgeObjectRetain();
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
  MEMORY[0x223C75070](&v78, v48);
  if (!v79)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (v22 != v78 || v79 != v21)
  {
    char v49 = sub_220F32EF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v49) {
      goto LABEL_12;
    }
LABEL_13:
    uint64_t v75 = MEMORY[0x263F8EE78];
    sub_220F2EC9C((unint64_t *)&unk_267F301D0, MEMORY[0x263F19938]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FF10);
    sub_220D25FB0(&qword_267F301E0, &qword_267F2FF10);
    uint64_t v50 = v59;
    uint64_t v52 = v61;
    sub_220F32BE8();
    uint64_t v51 = v62;
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_12:
  uint64_t v50 = v59;
  sub_220F312B8();
  uint64_t v51 = v62;
  uint64_t v52 = v61;
LABEL_14:
  uint64_t v53 = v60;
  uint64_t v54 = (uint64_t)v57;
  sub_220F30D98();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v52);
  sub_220D25B68(v43, &qword_267F365A0);
  return sub_220D39114(v54, v51, &qword_267F365A0);
}

void sub_220F29420(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityEditView(0);
  if (((*(uint64_t (**)(void))(a1 + *(int *)(v2 + 68)))() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
    sub_220F322B8();
  }
  id v3 = objc_msgSend(self, sel_sharedApplication);
  objc_msgSend(v3, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);
}

uint64_t sub_220F2950C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  type metadata accessor for ActivityEditView(0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
  MEMORY[0x223C75070](&v10, v6);
  if (v11)
  {
    if (v10 == a1 && v11 == a2) {
      char v8 = 1;
    }
    else {
      char v8 = sub_220F32EF8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = 0;
  }
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = v8 & 1;
  return swift_bridgeObjectRetain();
}

uint64_t static Color.accessibilityColorNameForSystemColorName(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = qword_267F2E1D8;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  if (*((void *)off_267F36440 + 2))
  {
    sub_220E81218(a1, a2);
    if (v5)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      sub_220DB8304();
      uint64_t v6 = (void *)sub_220F32AE8();
      uint64_t v7 = (CGColor *)objc_msgSend(v6, sel_CGColor);

      char v8 = AXNameFromColor(v7);
      a1 = sub_220F32768();
      swift_release_n();
    }
  }
  return a1;
}

uint64_t sub_220F29700@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v54 = a3;
  uint64_t v5 = sub_220F31568();
  uint64_t v52 = *(void *)(v5 - 8);
  uint64_t v53 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v51 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_220F312F8();
  uint64_t v50 = *(void *)(v42 - 8);
  MEMORY[0x270FA5388](v42);
  uint64_t v41 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ActivityEditView(0);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = *(void *)(v8 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F365E8);
  uint64_t v44 = *(void *)(v43 - 8);
  MEMORY[0x270FA5388](v43);
  uint64_t v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F365D0);
  MEMORY[0x270FA5388](v49);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v48 = (char *)&v41 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F365C8);
  uint64_t v46 = *(void *)(v19 - 8);
  uint64_t v47 = v19;
  MEMORY[0x270FA5388](v19);
  BOOL v45 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *a1;
  unint64_t v22 = a1[1];
  sub_220F2E770(a2, (uint64_t)v12, type metadata accessor for ActivityEditView);
  unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v25 = swift_allocObject();
  sub_220F2EEE4((uint64_t)v12, v25 + v23, type metadata accessor for ActivityEditView);
  uint64_t v26 = (uint64_t *)(v25 + v24);
  uint64_t *v26 = v21;
  v26[1] = v22;
  uint64_t v55 = v21;
  unint64_t v56 = v22;
  uint64_t v57 = a2;
  type metadata accessor for SystemImageView(0);
  sub_220F2EC9C(&qword_267F365F8, (void (*)(uint64_t))type metadata accessor for SystemImageView);
  swift_bridgeObjectRetain();
  uint64_t v27 = (uint64_t)v16;
  sub_220F321A8();
  uint64_t v58 = _s15FocusSettingsUI14ActivitySourceV17accessibilityName3forS2S_tFZ_0(v21, v22);
  uint64_t v59 = v28;
  sub_220D25FB0(&qword_267F365E0, &qword_267F365E8);
  sub_220D292B8();
  uint64_t v29 = v43;
  sub_220F31CF8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v14, v29);
  uint64_t v30 = a2 + *(int *)(v9 + 44);
  uint64_t v31 = *(void *)(v30 + 8);
  uint64_t v58 = *(void *)v30;
  uint64_t v59 = v31;
  long long v60 = *(_OWORD *)(v30 + 16);
  swift_bridgeObjectRetain();
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
  MEMORY[0x223C75070](&v61, v32);
  if (!v62)
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = v42;
    uint64_t v34 = v41;
    goto LABEL_8;
  }
  if (v21 != v61 || v62 != v22)
  {
    char v35 = sub_220F32EF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v33 = v42;
    uint64_t v34 = v41;
    if (v35) {
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v58 = MEMORY[0x263F8EE78];
    sub_220F2EC9C((unint64_t *)&unk_267F301D0, MEMORY[0x263F19938]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FF10);
    sub_220D25FB0(&qword_267F301E0, &qword_267F2FF10);
    sub_220F32BE8();
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = v42;
  uint64_t v34 = v41;
LABEL_7:
  sub_220F312B8();
LABEL_9:
  uint64_t v36 = (uint64_t)v48;
  sub_220F30D98();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v34, v33);
  sub_220D25B68(v27, &qword_267F365D0);
  uint64_t v37 = v51;
  sub_220F31558();
  sub_220F2EDEC();
  sub_220F2EC9C(&qword_267F31708, MEMORY[0x263F19CE8]);
  char v38 = v45;
  uint64_t v39 = v53;
  sub_220F31BA8();
  (*(void (**)(char *, uint64_t))(v52 + 8))(v37, v39);
  sub_220D25B68(v36, &qword_267F365D0);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v46 + 32))(v54, v38, v47);
}

void sub_220F29E50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ActivityEditView(0);
  if (((*(uint64_t (**)(void))(a1 + *(int *)(v2 + 68)))() & 1) == 0)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
    sub_220F322B8();
  }
  id v3 = objc_msgSend(self, sel_sharedApplication);
  objc_msgSend(v3, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);
}

uint64_t sub_220F29F3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for SystemImageView(0);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (void *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)v20 - v12;
  uint64_t v14 = a3 + *(int *)(type metadata accessor for ActivityEditView(0) + 36);
  uint64_t v15 = *(void *)(v14 + 8);
  v20[0] = *(void *)v14;
  v20[1] = v15;
  long long v21 = *(_OWORD *)(v14 + 16);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EC98);
  MEMORY[0x223C75070](&v22, v16);
  if (v23)
  {
    if (v22 == a1 && v23 == a2) {
      char v17 = 1;
    }
    else {
      char v17 = sub_220F32EF8();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = 0;
  }
  uint64_t *v10 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = (uint64_t *)((char *)v10 + *(int *)(v8 + 20));
  *uint64_t v18 = a1;
  v18[1] = a2;
  *((unsigned char *)v10 + *(int *)(v8 + 24)) = v17 & 1;
  sub_220F2EEE4((uint64_t)v10, (uint64_t)v13, type metadata accessor for SystemImageView);
  sub_220F2EEE4((uint64_t)v13, a4, type metadata accessor for SystemImageView);
  return swift_bridgeObjectRetain();
}

BOOL sub_220F2A0F8()
{
  uint64_t v1 = (long long *)(v0 + *(int *)(type metadata accessor for ActivityEditView(0) + 44));
  uint64_t v2 = *((void *)v1 + 2);
  long long v12 = *v1;
  uint64_t v13 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EBE0);
  sub_220F32158();
  if (!*((void *)&v14 + 1)) {
    return 1;
  }
  long long v12 = v14;
  uint64_t v3 = sub_220F30328();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_220F30318();
  sub_220D292B8();
  uint64_t v7 = sub_220F32B88();
  unint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  return v10 == 0;
}

uint64_t sub_220F2A26C()
{
  return sub_220F322B8();
}

__n128 sub_220F2A310@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_220F32468();
  uint64_t v4 = v3;
  sub_220F2A3AC((uint64_t)&v16);
  uint64_t v5 = v16;
  char v6 = v17;
  char v7 = v18;
  uint64_t v8 = v19;
  char v9 = v20;
  uint64_t v10 = v21;
  char v11 = v22;
  __n128 result = v25;
  uint64_t v13 = v26;
  long long v14 = v23;
  long long v15 = v24;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 25) = v7;
  *(void *)(a1 + 32) = v8;
  *(unsigned char *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(unsigned char *)(a1 + 56) = v11;
  *(_OWORD *)(a1 + 64) = v14;
  *(_OWORD *)(a1 + 80) = v15;
  *(__n128 *)(a1 + 96) = result;
  *(void *)(a1 + 112) = v13;
  return result;
}

uint64_t sub_220F2A3AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED48);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_267F2E1C8 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_267F41EE8;
  uint64_t v6 = qword_267F2E1B0;
  swift_retain();
  if (v6 != -1) {
    swift_once();
  }
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v7 = v20;
  char v8 = v21;
  uint64_t v9 = v22;
  char v10 = v23;
  uint64_t v18 = v25;
  uint64_t v19 = v24;
  uint64_t v11 = sub_220F320A8();
  if (qword_267F2E188 != -1) {
    swift_once();
  }
  sub_220F31948();
  uint64_t v12 = sub_220F318F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v4, 1, 1, v12);
  uint64_t v13 = sub_220F31958();
  sub_220D25B68((uint64_t)v4, &qword_267F2ED48);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v15 = sub_220F31FF8();
  uint64_t result = swift_getKeyPath();
  *(void *)a1 = v5;
  *(_WORD *)(a1 + 8) = 256;
  *(void *)(a1 + 16) = v7;
  *(unsigned char *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 40) = v10;
  uint64_t v17 = v18;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v17;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = KeyPath;
  *(void *)(a1 + 80) = v13;
  *(void *)(a1 + 88) = result;
  *(void *)(a1 + 96) = v15;
  return result;
}

uint64_t sub_220F2A61C@<X0>(uint64_t a1@<X8>)
{
  return sub_220F23B30(v1, a1);
}

uint64_t sub_220F2A624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (a3) {
    uint64_t v7 = sub_220F31EF8();
  }
  else {
    uint64_t v7 = sub_220F31F68();
  }
  uint64_t v8 = v7;
  if (qword_267F2E198 != -1) {
    swift_once();
  }
  sub_220F30B18();
  double v9 = v65;
  int v10 = v66;
  int v11 = DWORD1(v66);
  uint64_t v12 = *((void *)&v66 + 1);
  long long v13 = v67;
  uint64_t v14 = sub_220F32468();
  uint64_t v38 = v15;
  uint64_t v39 = v14;
  if (qword_267F2E180 != -1) {
    swift_once();
  }
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v36 = v70;
  uint64_t v37 = v68;
  uint64_t v34 = *((void *)&v72 + 1);
  uint64_t v35 = v72;
  char v64 = v69;
  char v63 = v71;
  uint64_t v16 = qword_267F2E1D8;
  swift_bridgeObjectRetain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = off_267F36440;
  if (*((void *)off_267F36440 + 2) && (unint64_t v18 = sub_220E81218(a1, a2), (v19 & 1) != 0))
  {
    uint64_t v33 = *(void *)(v17[7] + 8 * v18);
    swift_retain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = sub_220F31F08();
  }
  if (qword_267F2E190 != -1) {
    swift_once();
  }
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v20 = v73;
  char v21 = v74;
  uint64_t v22 = v75;
  char v23 = v76;
  char v24 = v64;
  char v25 = v63;
  *(double *)uint64_t v40 = v65 * 0.5;
  *((double *)v40 + 1) = v65;
  v40[1] = v66;
  v40[2] = v67;
  *(void *)&long long v41 = v8;
  WORD4(v41) = 256;
  *(void *)&long long v42 = v39;
  *((void *)&v42 + 1) = v38;
  *(void *)&long long v43 = v68;
  BYTE8(v43) = v64;
  *(void *)&long long v44 = v70;
  BYTE8(v44) = v63;
  long long v45 = v72;
  long long v26 = v40[0];
  long long v27 = v66;
  long long v28 = v41;
  *(_OWORD *)(a4 + 32) = v67;
  *(_OWORD *)(a4 + 48) = v28;
  *(_OWORD *)a4 = v26;
  *(_OWORD *)(a4 + 16) = v27;
  long long v29 = v42;
  long long v30 = v43;
  long long v31 = v45;
  *(_OWORD *)(a4 + 96) = v44;
  *(_OWORD *)(a4 + 112) = v31;
  *(_OWORD *)(a4 + 64) = v29;
  *(_OWORD *)(a4 + 80) = v30;
  char v47 = v21;
  char v46 = v23;
  *(void *)(a4 + 128) = v33;
  *(_WORD *)(a4 + 136) = 256;
  *(void *)(a4 + 144) = v20;
  *(unsigned char *)(a4 + 152) = v21;
  *(void *)(a4 + 160) = v22;
  *(unsigned char *)(a4 + 168) = v23;
  *(_OWORD *)(a4 + 176) = v77;
  sub_220E18414((uint64_t)v40);
  v48[0] = v9 * 0.5;
  v48[1] = v9;
  int v49 = v10;
  int v50 = v11;
  uint64_t v51 = v12;
  long long v52 = v13;
  uint64_t v53 = v8;
  __int16 v54 = 256;
  uint64_t v55 = v39;
  uint64_t v56 = v38;
  uint64_t v57 = v37;
  char v58 = v24;
  uint64_t v59 = v36;
  char v60 = v25;
  uint64_t v61 = v35;
  uint64_t v62 = v34;
  return sub_220E1844C((uint64_t)v48);
}

double sub_220F2A980@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  uint64_t v6 = sub_220F32468();
  uint64_t v8 = v7;
  sub_220F2A624(v3, v4, v5, (uint64_t)v16);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  long long v9 = v24;
  *(_OWORD *)(a1 + 144) = v23;
  *(_OWORD *)(a1 + 160) = v9;
  long long v10 = v26;
  *(_OWORD *)(a1 + 176) = v25;
  *(_OWORD *)(a1 + 192) = v10;
  long long v11 = v20;
  *(_OWORD *)(a1 + 80) = v19;
  *(_OWORD *)(a1 + 96) = v11;
  long long v12 = v22;
  *(_OWORD *)(a1 + 112) = v21;
  *(_OWORD *)(a1 + 128) = v12;
  long long v13 = v16[1];
  *(_OWORD *)(a1 + 16) = v16[0];
  *(_OWORD *)(a1 + 32) = v13;
  double result = *(double *)&v17;
  long long v15 = v18;
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = v15;
  return result;
}

uint64_t sub_220F2AA1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2ED48);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = *(int *)(type metadata accessor for SystemImageView(0) + 24);
  if (*(unsigned char *)(a1 + v53) == 1) {
    uint64_t v7 = sub_220F31EF8();
  }
  else {
    uint64_t v7 = sub_220F31F68();
  }
  uint64_t v60 = v7;
  if (qword_267F2E198 != -1) {
    swift_once();
  }
  sub_220F30B18();
  double v8 = v98;
  unsigned int v9 = v99;
  unsigned int v57 = v100;
  uint64_t v10 = v101;
  uint64_t v61 = v102;
  uint64_t v11 = v103;
  uint64_t v12 = sub_220F32468();
  uint64_t v58 = v13;
  uint64_t v59 = v12;
  if (qword_267F2E180 != -1) {
    swift_once();
  }
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v14 = v106;
  uint64_t v56 = v108;
  uint64_t v54 = v104;
  uint64_t v55 = v109;
  unsigned __int8 v95 = v105;
  unsigned __int8 v93 = v107;
  uint64_t v15 = sub_220F2E1C4();
  uint64_t v16 = qword_267F2E190;
  uint64_t v52 = v15;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  sub_220F32468();
  sub_220F30BA8();
  uint64_t v51 = v110;
  int v50 = v111;
  uint64_t v49 = v112;
  int v48 = v113;
  uint64_t v46 = v115;
  uint64_t v47 = v114;
  swift_bridgeObjectRetain();
  uint64_t v45 = sub_220F320A8();
  if (qword_267F2E188 != -1) {
    swift_once();
  }
  sub_220F31948();
  uint64_t v17 = sub_220F318F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v6, 1, 1, v17);
  uint64_t v44 = sub_220F31958();
  sub_220D25B68((uint64_t)v6, &qword_267F2ED48);
  uint64_t KeyPath = swift_getKeyPath();
  if (*(unsigned char *)(a1 + v53) == 1) {
    uint64_t v18 = sub_220F31EF8();
  }
  else {
    uint64_t v18 = sub_220F31FF8();
  }
  uint64_t v53 = v18;
  uint64_t v19 = swift_getKeyPath();
  int v41 = v95;
  int v42 = v93;
  *(double *)&long long v62 = v8 * 0.5;
  *((double *)&v62 + 1) = v8;
  unsigned int v20 = v57;
  *(void *)&long long v63 = __PAIR64__(v57, v9);
  *((void *)&v63 + 1) = v10;
  *(void *)&long long v64 = v61;
  *((void *)&v64 + 1) = v11;
  unsigned int v40 = v9;
  uint64_t v22 = v59;
  uint64_t v21 = v60;
  *(void *)&long long v65 = v60;
  WORD4(v65) = 256;
  *(_DWORD *)((char *)&v65 + 10) = v96;
  HIWORD(v65) = v97;
  uint64_t v23 = v58;
  *(void *)&long long v66 = v59;
  *((void *)&v66 + 1) = v58;
  uint64_t v24 = v54;
  *(void *)&long long v67 = v54;
  BYTE8(v67) = v95;
  *(_DWORD *)((char *)&v67 + 9) = *(_DWORD *)v94;
  HIDWORD(v67) = *(_DWORD *)&v94[3];
  *(void *)&long long v68 = v14;
  BYTE8(v68) = v93;
  *(_DWORD *)((char *)&v68 + 9) = *(_DWORD *)v92;
  HIDWORD(v68) = *(_DWORD *)&v92[3];
  uint64_t v25 = v56;
  uint64_t v39 = v14;
  uint64_t v26 = v55;
  *(void *)&long long v69 = v56;
  *((void *)&v69 + 1) = v55;
  long long v27 = v62;
  long long v28 = v63;
  long long v29 = v65;
  *(_OWORD *)(a2 + 32) = v64;
  *(_OWORD *)(a2 + 48) = v29;
  *(_OWORD *)a2 = v27;
  *(_OWORD *)(a2 + 16) = v28;
  long long v30 = v66;
  long long v31 = v67;
  long long v32 = v69;
  *(_OWORD *)(a2 + 96) = v68;
  *(_OWORD *)(a2 + 112) = v32;
  *(_OWORD *)(a2 + 64) = v30;
  *(_OWORD *)(a2 + 80) = v31;
  char v33 = v50;
  char v71 = v50;
  char v34 = v48;
  char v70 = v48;
  *(void *)(a2 + 128) = v52;
  *(_WORD *)(a2 + 136) = 256;
  *(void *)(a2 + 144) = v51;
  *(unsigned char *)(a2 + 152) = v33;
  *(void *)(a2 + 160) = v49;
  *(unsigned char *)(a2 + 168) = v34;
  uint64_t v35 = v46;
  *(void *)(a2 + 176) = v47;
  *(void *)(a2 + 184) = v35;
  uint64_t v36 = KeyPath;
  *(void *)(a2 + 192) = v45;
  *(void *)(a2 + 200) = v36;
  *(void *)(a2 + 208) = v44;
  *(void *)(a2 + 216) = v19;
  *(void *)(a2 + 224) = v53;
  sub_220E18414((uint64_t)&v62);
  v72[0] = v8 * 0.5;
  v72[1] = v8;
  unsigned int v73 = v40;
  unsigned int v74 = v20;
  uint64_t v75 = v10;
  uint64_t v76 = v61;
  uint64_t v77 = v11;
  uint64_t v78 = v21;
  __int16 v79 = 256;
  int v80 = v96;
  __int16 v81 = v97;
  uint64_t v82 = v22;
  uint64_t v83 = v23;
  uint64_t v84 = v24;
  char v85 = v41;
  *(_DWORD *)&v86[3] = *(_DWORD *)&v94[3];
  *(_DWORD *)uint64_t v86 = *(_DWORD *)v94;
  uint64_t v87 = v39;
  char v88 = v42;
  *(_DWORD *)uint64_t v89 = *(_DWORD *)v92;
  *(_DWORD *)&v89[3] = *(_DWORD *)&v92[3];
  uint64_t v90 = v25;
  uint64_t v91 = v26;
  return sub_220E1844C((uint64_t)v72);
}

__n128 sub_220F2AF68@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_220F32468();
  uint64_t v5 = v4;
  sub_220F2AA1C(v1, (uint64_t)v13);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v5;
  long long v6 = v13[13];
  *(_OWORD *)(a1 + 208) = v13[12];
  *(_OWORD *)(a1 + 224) = v6;
  *(void *)(a1 + 240) = v14;
  long long v7 = v13[9];
  *(_OWORD *)(a1 + 144) = v13[8];
  *(_OWORD *)(a1 + 160) = v7;
  long long v8 = v13[11];
  *(_OWORD *)(a1 + 176) = v13[10];
  *(_OWORD *)(a1 + 192) = v8;
  long long v9 = v13[5];
  *(_OWORD *)(a1 + 80) = v13[4];
  *(_OWORD *)(a1 + 96) = v9;
  long long v10 = v13[7];
  *(_OWORD *)(a1 + 112) = v13[6];
  *(_OWORD *)(a1 + 128) = v10;
  long long v11 = v13[1];
  *(_OWORD *)(a1 + 16) = v13[0];
  *(_OWORD *)(a1 + 32) = v11;
  __n128 result = (__n128)v13[3];
  *(_OWORD *)(a1 + 48) = v13[2];
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t sub_220F2AFF4()
{
  uint64_t result = sub_220F31ED8();
  qword_267F41ED8 = result;
  return result;
}

uint64_t sub_220F2B028()
{
  uint64_t v0 = sub_220F31EB8();
  __n128 v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, __n128))(v4 + 104))(v3, *MEMORY[0x263F1B388], v1);
  uint64_t result = MEMORY[0x223C74DD0](v3, 0.117647059, 0.211764706, 0.329411765, 1.0);
  qword_267F41EE0 = result;
  return result;
}

uint64_t sub_220F2B110()
{
  id v0 = objc_msgSend(self, sel_quaternaryLabelColor);
  MEMORY[0x223C74C60](v0);
  uint64_t v1 = sub_220F31FD8();
  uint64_t result = swift_release();
  qword_267F41EE8 = v1;
  return result;
}

unint64_t sub_220F2B174()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F364B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220F41F10;
  *(void *)(inited + 32) = 0x65546D6574737973;
  *(void *)(inited + 40) = 0xEF726F6C6F436C61;
  *(void *)(inited + 48) = sub_220F31F38();
  *(void *)(inited + 56) = 0x6C426D6574737973;
  *(void *)(inited + 64) = 0xEF726F6C6F436575;
  *(void *)(inited + 72) = sub_220F31EF8();
  *(void *)(inited + 80) = 0x72476D6574737973;
  *(void *)(inited + 88) = 0xEF726F6C6F437961;
  *(void *)(inited + 96) = sub_220F31F08();
  *(void *)(inited + 104) = 0xD000000000000010;
  *(void *)(inited + 112) = 0x8000000220F490B0;
  *(void *)(inited + 120) = sub_220F31F78();
  *(void *)(inited + 128) = 0xD000000000000011;
  *(void *)(inited + 136) = 0x8000000220F490D0;
  *(void *)(inited + 144) = sub_220F31FA8();
  *(void *)(inited + 152) = 0xD000000000000011;
  *(void *)(inited + 160) = 0x8000000220F490F0;
  *(void *)(inited + 168) = sub_220F31F98();
  strcpy((char *)(inited + 176), "systemRedColor");
  *(unsigned char *)(inited + 191) = -18;
  *(void *)(inited + 192) = sub_220F31EE8();
  *(void *)(inited + 200) = 0x69506D6574737973;
  *(void *)(inited + 208) = 0xEF726F6C6F436B6ELL;
  *(void *)(inited + 216) = sub_220F31F28();
  *(void *)(inited + 224) = 0xD000000000000011;
  *(void *)(inited + 232) = 0x8000000220F49110;
  *(void *)(inited + 240) = sub_220F31FB8();
  *(void *)(inited + 248) = 0xD000000000000010;
  *(void *)(inited + 256) = 0x8000000220F49130;
  *(void *)(inited + 264) = sub_220F31F58();
  unint64_t result = sub_220D14F24(inited);
  qword_267F36438 = result;
  return result;
}

void *sub_220F2B338()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F364B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_220F41F20;
  *(void *)(inited + 32) = 0x65546D6574737973;
  *(void *)(inited + 40) = 0xEF726F6C6F436C61;
  *(void *)(inited + 48) = sub_220F31F38();
  *(void *)(inited + 56) = 0x6C426D6574737973;
  *(void *)(inited + 64) = 0xEF726F6C6F436575;
  *(void *)(inited + 72) = sub_220F31EF8();
  *(void *)(inited + 80) = 0x72476D6574737973;
  *(void *)(inited + 88) = 0xEF726F6C6F437961;
  *(void *)(inited + 96) = sub_220F31F08();
  *(void *)(inited + 104) = 0xD000000000000010;
  *(void *)(inited + 112) = 0x8000000220F490B0;
  *(void *)(inited + 120) = sub_220F31F78();
  *(void *)(inited + 128) = 0xD000000000000011;
  *(void *)(inited + 136) = 0x8000000220F490D0;
  *(void *)(inited + 144) = sub_220F31FA8();
  *(void *)(inited + 152) = 0xD000000000000011;
  *(void *)(inited + 160) = 0x8000000220F490F0;
  *(void *)(inited + 168) = sub_220F31F98();
  strcpy((char *)(inited + 176), "systemRedColor");
  *(unsigned char *)(inited + 191) = -18;
  *(void *)(inited + 192) = sub_220F31EE8();
  *(void *)(inited + 200) = 0x69506D6574737973;
  *(void *)(inited + 208) = 0xEF726F6C6F436B6ELL;
  *(void *)(inited + 216) = sub_220F31F28();
  *(void *)(inited + 224) = 0xD000000000000011;
  *(void *)(inited + 232) = 0x8000000220F49110;
  *(void *)(inited + 240) = sub_220F31FB8();
  *(void *)(inited + 248) = 0xD000000000000010;
  *(void *)(inited + 256) = 0x8000000220F49130;
  *(void *)(inited + 264) = sub_220F31F58();
  *(void *)(inited + 272) = 0x694D6D6574737973;
  *(void *)(inited + 280) = 0xEF726F6C6F43746ELL;
  *(void *)(inited + 288) = sub_220F31F18();
  unint64_t result = (void *)sub_220D14F24(inited);
  off_267F36440 = result;
  return result;
}

uint64_t sub_220F2B51C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_220DF70A0(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  uint64_t result = sub_220F2B588(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_220F2B588(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_220F32EC8();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_220F2BC74(0, v3, 1, a1);
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
    goto LABEL_160;
  }
  uint64_t v105 = result;
  uint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *(void *)(MEMORY[0x263F8EE78] + 16);
      long long v11 = (char *)MEMORY[0x263F8EE78];
LABEL_118:
      uint64_t v94 = v11;
      uint64_t v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          __int16 v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_220F2BD44((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            __int16 v97 = sub_220DF66B4((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          unsigned int v100 = &v97[16 * v96 + 32];
          *(void *)unsigned int v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          uint64_t v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(void *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v104 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = sub_220F32898();
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  long long v11 = (char *)MEMORY[0x263F8EE78];
  uint64_t v106 = v3;
  while (1)
  {
    uint64_t v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = sub_220F32EF8();
      uint64_t v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ sub_220F32EF8()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      uint64_t v22 = v20 + 1;
      uint64_t v9 = v20;
      uint64_t v20 = v22;
    }
    while (v22 < v3);
    uint64_t v20 = v22;
LABEL_36:
    uint64_t v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        uint64_t v27 = v20;
        uint64_t v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      uint64_t v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v11 = sub_220DF6254(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      long long v11 = sub_220DF6254((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    int v42 = v11 + 32;
    long long v43 = &v11[16 * v41 + 32];
    *(void *)long long v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      uint64_t v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          unsigned int v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            __int16 v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        long long v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        long long v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        uint64_t v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        char v85 = v11;
        uint64_t v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        char v88 = v42;
        unint64_t v89 = v44;
        uint64_t v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_220F2BD44((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)uint64_t v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        long long v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        int v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        uint64_t v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      uint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    uint64_t v32 = v3;
  }
  else {
    uint64_t v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      char v33 = (void *)(v10 + 16 * v9);
      do
      {
        char v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v37 = v13;
        uint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_220F32EF8() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)uint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      uint64_t v9 = v32;
    }
    goto LABEL_67;
  }
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
  uint64_t result = sub_220F32E18();
  __break(1u);
  return result;
}

uint64_t sub_220F2BC74(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    uint64_t v9 = (uint64_t *)(v7 + 16 * v4);
    uint64_t result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (uint64_t result = sub_220F32EF8(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      uint64_t result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_220F2BD44(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      uint64_t v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          uint64_t v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (sub_220F32EF8() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            uint64_t v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (sub_220F32EF8() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      uint64_t v27 = v7;
    }
LABEL_50:
    sub_220DF65F8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = sub_220F32E98();
  __break(1u);
  return result;
}

unint64_t sub_220F2BFE4()
{
  unint64_t result = qword_267F36448;
  if (!qword_267F36448)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36448);
  }
  return result;
}

uint64_t sub_220F2C038()
{
  return swift_getOpaqueTypeConformance2();
}

void *initializeBufferWithCopyOfBuffer for ActivityEditView(void *a1, void *a2, int *a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v10 = a3[7];
    uint64_t v11 = a3[8];
    uint64_t v12 = (char *)a1 + v10;
    uint64_t v13 = (char *)a2 + v10;
    *(void *)uint64_t v12 = *(void *)v13;
    v12[8] = v13[8];
    uint64_t v14 = (void *)((char *)a1 + v11);
    BOOL v15 = (void *)((char *)a2 + v11);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    uint64_t v54 = v15[3];
    v14[2] = v15[2];
    v14[3] = v54;
    uint64_t v17 = a3[9];
    uint64_t v18 = a3[10];
    int v19 = (void *)((char *)a1 + v17);
    uint64_t v20 = (void *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    *int v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = v20[3];
    v19[2] = v20[2];
    _OWORD v19[3] = v22;
    BOOL v23 = (void *)((char *)a1 + v18);
    uint64_t v24 = (void *)((char *)a2 + v18);
    uint64_t v55 = v24[1];
    *BOOL v23 = *v24;
    v23[1] = v55;
    uint64_t v56 = v24[3];
    v23[2] = v24[2];
    v23[3] = v56;
    uint64_t v25 = a3[11];
    uint64_t v26 = a3[12];
    uint64_t v27 = (void *)((char *)a1 + v25);
    uint64_t v28 = (void *)((char *)a2 + v25);
    uint64_t v29 = v28[1];
    *uint64_t v27 = *v28;
    v27[1] = v29;
    v27[2] = v28[2];
    uint64_t v30 = (void *)((char *)a1 + v26);
    uint64_t v31 = (void *)((char *)a2 + v26);
    uint64_t v32 = v31[1];
    *uint64_t v30 = *v31;
    v30[1] = v32;
    void v30[2] = v31[2];
    uint64_t v33 = a3[13];
    uint64_t v34 = a3[14];
    uint64_t v35 = (char *)a1 + v33;
    uint64_t v36 = (char *)a2 + v33;
    *uint64_t v35 = *v36;
    *((void *)v35 + 1) = *((void *)v36 + 1);
    *(void *)((char *)a1 + v34) = *(void *)((char *)a2 + v34);
    uint64_t v37 = a3[16];
    *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
    uint64_t v38 = (void *)((char *)a1 + v37);
    BOOL v39 = (void *)((char *)a2 + v37);
    uint64_t v53 = v39[1];
    *uint64_t v38 = *v39;
    v38[1] = v53;
    uint64_t v40 = a3[17];
    uint64_t v41 = a3[18];
    int v42 = (void *)((char *)a1 + v40);
    long long v43 = (void *)((char *)a2 + v40);
    uint64_t v44 = v43[1];
    uint64_t v45 = (void *)((char *)a2 + v41);
    uint64_t v46 = (void *)((char *)a1 + v41);
    *int v42 = *v43;
    v42[1] = v44;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v46 = *v45;
    if (EnumCaseMultiPayload == 1)
    {
      v46[1] = v45[1];
      swift_retain();
      swift_retain();
      uint64_t v48 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
      uint64_t v49 = (char *)v46 + v48;
      uint64_t v50 = (char *)v45 + v48;
      uint64_t v51 = sub_220F30E48();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ActivityEditView(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 72);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v9 = sub_220F30E48();
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    return v10(v8, v9);
  }
  return result;
}

void *initializeWithCopy for ActivityEditView(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *((unsigned char *)a1 + v7) = *((unsigned char *)a2 + v7);
  uint64_t v8 = a3[7];
  uint64_t v9 = a3[8];
  uint64_t v10 = (char *)a1 + v8;
  uint64_t v11 = (char *)a2 + v8;
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = (void *)((char *)a1 + v9);
  uint64_t v13 = (void *)((char *)a2 + v9);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v52 = v13[3];
  v12[2] = v13[2];
  v12[3] = v52;
  uint64_t v15 = a3[9];
  uint64_t v16 = a3[10];
  uint64_t v17 = (void *)((char *)a1 + v15);
  uint64_t v18 = (void *)((char *)a2 + v15);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = v18[3];
  v17[2] = v18[2];
  v17[3] = v20;
  uint64_t v21 = (void *)((char *)a1 + v16);
  uint64_t v22 = (void *)((char *)a2 + v16);
  uint64_t v53 = v22[1];
  void *v21 = *v22;
  v21[1] = v53;
  uint64_t v54 = v22[3];
  v21[2] = v22[2];
  v21[3] = v54;
  uint64_t v23 = a3[11];
  uint64_t v24 = a3[12];
  uint64_t v25 = (void *)((char *)a1 + v23);
  uint64_t v26 = (void *)((char *)a2 + v23);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  void v25[2] = v26[2];
  uint64_t v28 = (void *)((char *)a1 + v24);
  uint64_t v29 = (void *)((char *)a2 + v24);
  uint64_t v30 = v29[1];
  *uint64_t v28 = *v29;
  v28[1] = v30;
  void v28[2] = v29[2];
  uint64_t v31 = a3[13];
  uint64_t v32 = a3[14];
  uint64_t v33 = (char *)a1 + v31;
  uint64_t v34 = (char *)a2 + v31;
  *uint64_t v33 = *v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  *(void *)((char *)a1 + v32) = *(void *)((char *)a2 + v32);
  uint64_t v35 = a3[16];
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  uint64_t v36 = (void *)((char *)a1 + v35);
  uint64_t v37 = (void *)((char *)a2 + v35);
  uint64_t v51 = v37[1];
  *uint64_t v36 = *v37;
  v36[1] = v51;
  uint64_t v38 = a3[17];
  uint64_t v39 = a3[18];
  uint64_t v40 = (void *)((char *)a1 + v38);
  uint64_t v41 = (void *)((char *)a2 + v38);
  uint64_t v42 = v41[1];
  long long v43 = (void *)((char *)a2 + v39);
  uint64_t v44 = (void *)((char *)a1 + v39);
  *uint64_t v40 = *v41;
  v40[1] = v42;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *uint64_t v44 = *v43;
  if (EnumCaseMultiPayload == 1)
  {
    v44[1] = v43[1];
    swift_retain();
    swift_retain();
    uint64_t v46 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v47 = (char *)v44 + v46;
    uint64_t v48 = (char *)v43 + v46;
    uint64_t v49 = sub_220F30E48();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 16))(v47, v48, v49);
  }
  else
  {
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *assignWithCopy for ActivityEditView(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
  *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  v8[8] = v9[8];
  *(void *)uint64_t v8 = v10;
  uint64_t v11 = a3[8];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_retain();
  swift_release();
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  v12[2] = v13[2];
  v12[3] = v13[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[9];
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_retain();
  swift_release();
  v15[1] = v16[1];
  swift_retain();
  swift_release();
  v15[2] = v16[2];
  v15[3] = v16[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[10];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  v18[2] = v19[2];
  v18[3] = v19[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[11];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (char *)a2 + v20;
  void *v21 = *(void *)((char *)a2 + v20);
  v21[1] = *(void *)((char *)a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = *((void *)v22 + 2);
  swift_retain();
  swift_release();
  uint64_t v23 = a3[12];
  uint64_t v24 = (void *)((char *)a1 + v23);
  uint64_t v25 = (char *)a2 + v23;
  *uint64_t v24 = *(void *)((char *)a2 + v23);
  v24[1] = *(void *)((char *)a2 + v23 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24[2] = *((void *)v25 + 2);
  swift_retain();
  swift_release();
  uint64_t v26 = a3[13];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_retain();
  swift_release();
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)((char *)a1 + a3[15]) = *(void *)((char *)a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v29 = a3[16];
  uint64_t v30 = (void *)((char *)a1 + v29);
  uint64_t v31 = (void *)((char *)a2 + v29);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  swift_retain();
  swift_release();
  uint64_t v33 = a3[17];
  uint64_t v34 = (void *)((char *)a1 + v33);
  uint64_t v35 = (void *)((char *)a2 + v33);
  uint64_t v36 = v35[1];
  *uint64_t v34 = *v35;
  v34[1] = v36;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v37 = a3[18];
    uint64_t v38 = (void *)((char *)a1 + v37);
    uint64_t v39 = (void *)((char *)a2 + v37);
    sub_220D25B68((uint64_t)a1 + v37, (uint64_t *)&unk_267F2E330);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *uint64_t v38 = *v39;
    if (EnumCaseMultiPayload == 1)
    {
      v38[1] = v39[1];
      swift_retain();
      swift_retain();
      uint64_t v41 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
      uint64_t v42 = (char *)v38 + v41;
      long long v43 = (char *)v39 + v41;
      uint64_t v44 = sub_220F30E48();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
    }
    else
    {
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *initializeWithTake for ActivityEditView(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F30AD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = a3[8];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  uint64_t v13 = &a1[v10];
  uint64_t v14 = &a2[v10];
  long long v15 = *((_OWORD *)v14 + 1);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  *((_OWORD *)v13 + 1) = v15;
  uint64_t v16 = a3[9];
  uint64_t v17 = a3[10];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  long long v20 = *((_OWORD *)v19 + 1);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *((_OWORD *)v18 + 1) = v20;
  uint64_t v21 = &a1[v17];
  uint64_t v22 = &a2[v17];
  long long v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  uint64_t v24 = a3[11];
  uint64_t v25 = a3[12];
  uint64_t v26 = &a1[v24];
  uint64_t v27 = &a2[v24];
  long long v28 = *(_OWORD *)v27;
  *((void *)v26 + 2) = *((void *)v27 + 2);
  *(_OWORD *)uint64_t v26 = v28;
  uint64_t v29 = &a1[v25];
  uint64_t v30 = &a2[v25];
  *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
  *((void *)v29 + 2) = *((void *)v30 + 2);
  uint64_t v31 = a3[14];
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  *(void *)&a1[v31] = *(void *)&a2[v31];
  uint64_t v32 = a3[16];
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  uint64_t v33 = a3[17];
  uint64_t v34 = a3[18];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  *(_OWORD *)&a1[v32] = *(_OWORD *)&a2[v32];
  *(_OWORD *)&a1[v33] = *(_OWORD *)&a2[v33];
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v38 = *((void *)v36 + 1);
    *(void *)uint64_t v35 = *(void *)v36;
    *((void *)v35 + 1) = v38;
    uint64_t v39 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v40 = &v35[v39];
    uint64_t v41 = &v36[v39];
    uint64_t v42 = sub_220F30E48();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 32))(v40, v41, v42);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v35, v36, *(void *)(*(void *)(v37 - 8) + 64));
  }
  return a1;
}

char *assignWithTake for ActivityEditView(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, &qword_267F33C90);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F30AD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[6];
  a1[a3[5]] = a2[a3[5]];
  a1[v8] = a2[v8];
  uint64_t v9 = a3[7];
  uint64_t v10 = a3[8];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  *(void *)uint64_t v11 = *(void *)v12;
  v11[8] = v12[8];
  uint64_t v13 = &a1[v10];
  uint64_t v14 = &a2[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  swift_release();
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_release();
  uint64_t v15 = *((void *)v14 + 3);
  *((void *)v13 + 2) = *((void *)v14 + 2);
  *((void *)v13 + 3) = v15;
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  *(void *)&a1[v16] = *(void *)&a2[v16];
  swift_release();
  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_release();
  uint64_t v19 = *((void *)v18 + 3);
  *((void *)v17 + 2) = *((void *)v18 + 2);
  *((void *)v17 + 3) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[10];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  swift_release();
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  uint64_t v23 = *((void *)v22 + 3);
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[11];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  uint64_t v27 = *(void *)&a2[v24 + 8];
  *(void *)uint64_t v25 = *(void *)&a2[v24];
  *((void *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  *((void *)v25 + 2) = *((void *)v26 + 2);
  swift_release();
  uint64_t v28 = a3[12];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  uint64_t v31 = *(void *)&a2[v28 + 8];
  *(void *)uint64_t v29 = *(void *)&a2[v28];
  *((void *)v29 + 1) = v31;
  swift_bridgeObjectRelease();
  *((void *)v29 + 2) = *((void *)v30 + 2);
  swift_release();
  uint64_t v32 = a3[13];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  *uint64_t v33 = *v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  swift_release();
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[15]] = *(void *)&a2[a3[15]];
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  swift_release();
  *(_OWORD *)&a1[a3[17]] = *(_OWORD *)&a2[a3[17]];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v35 = a3[18];
    uint64_t v36 = &a1[v35];
    uint64_t v37 = &a2[v35];
    sub_220D25B68((uint64_t)&a1[v35], (uint64_t *)&unk_267F2E330);
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v39 = *((void *)v37 + 1);
      *(void *)uint64_t v36 = *(void *)v37;
      *((void *)v36 + 1) = v39;
      uint64_t v40 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
      uint64_t v41 = &v36[v40];
      uint64_t v42 = &v37[v40];
      uint64_t v43 = sub_220F30E48();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 32))(v41, v42, v43);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityEditView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F2D374);
}

uint64_t sub_220F2D374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 32) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA08);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 72);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityEditView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F2D4C0);
}

uint64_t sub_220F2D4C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 32) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA08);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 72);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_220F2D5F8()
{
  sub_220D7A610();
  if (v0 <= 0x3F)
  {
    sub_220D273AC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unsigned char *storeEnumTagSinglePayload for ActivityEditView.Use(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x220F2D7ECLL);
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

ValueMetadata *type metadata accessor for ActivityEditView.Use()
{
  return &type metadata for ActivityEditView.Use;
}

unint64_t sub_220F2D828()
{
  unint64_t result = qword_267F36460;
  if (!qword_267F36460)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36468);
    sub_220F2D89C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36460);
  }
  return result;
}

unint64_t sub_220F2D89C()
{
  unint64_t result = qword_267F36470;
  if (!qword_267F36470)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36478);
    sub_220D25FB0(&qword_267F36480, &qword_267F36488);
    sub_220D25FB0(&qword_267F36490, &qword_267F36498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36470);
  }
  return result;
}

void *sub_220F2D960(void *a1, void *a2, uint64_t a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (void *)((char *)a1 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *uint64_t v11 = *v12;
    v11[1] = v13;
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_220F2DA90(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_bridgeObjectRelease();
}

void *sub_220F2DB34(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_220F30AD8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_220F2DC14(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, &qword_267F33C90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_220F30AD8();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

char *sub_220F2DD24(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_220F30AD8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  a1[v8] = a2[v8];
  return a1;
}

char *sub_220F2DE00(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_220D25B68((uint64_t)a1, &qword_267F33C90);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_220F30AD8();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_220F2DF08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_220F2DF1C);
}

uint64_t sub_220F2DF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_220F2DFE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_220F2DFF8);
}

uint64_t sub_220F2DFF8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267F2FD80);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for SystemImageView(uint64_t a1)
{
  return sub_220D29234(a1, (uint64_t *)&unk_267F364A0);
}

void sub_220F2E0DC()
{
  sub_220D7A610();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for SystemColorView()
{
  return &type metadata for SystemColorView;
}

uint64_t sub_220F2E18C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F2E1A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_220F2E1C4()
{
  uint64_t v1 = sub_220F30AD8();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  unsigned int v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v7 = (char *)&v12 - v6;
  if (*(unsigned char *)(v0 + *(int *)(type metadata accessor for SystemImageView(0) + 24)) == 1)
  {
    sub_220F11B30((uint64_t)v7);
    (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F184F8], v1);
    char v8 = sub_220F30AC8();
    uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
    v9(v4, v1);
    v9(v7, v1);
    if (v8)
    {
      if (qword_267F2E1C0 != -1) {
        swift_once();
      }
      unint64_t v10 = &qword_267F41EE0;
    }
    else
    {
      if (qword_267F2E1B8 != -1) {
        swift_once();
      }
      unint64_t v10 = &qword_267F41ED8;
    }
  }
  else
  {
    if (qword_267F2E1C8 != -1) {
      swift_once();
    }
    unint64_t v10 = &qword_267F41EE8;
  }
  return *v10;
}

uint64_t sub_220F2E3D8@<X0>(uint64_t a1@<X8>)
{
  return sub_220F23E7C(a1);
}

uint64_t sub_220F2E3FC()
{
  return sub_220F2E640(&qword_267F36540, &qword_267F364F0, (void (*)(void))sub_220F2E424);
}

unint64_t sub_220F2E424()
{
  unint64_t result = qword_267F36548;
  if (!qword_267F36548)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F364E8);
    sub_220F2E4C4();
    sub_220D25FB0(&qword_267F2FEC0, &qword_267F2F310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36548);
  }
  return result;
}

unint64_t sub_220F2E4C4()
{
  unint64_t result = qword_267F36550;
  if (!qword_267F36550)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F364E0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F364D0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2F080);
    sub_220F2E640(&qword_267F36558, &qword_267F364D0, (void (*)(void))sub_220F2E6C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F2F088);
    sub_220D25FB0(&qword_267F2F090, &qword_267F2F088);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_220D25FB0(&qword_267F2EBD0, &qword_267F2EBD8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36550);
  }
  return result;
}

uint64_t sub_220F2E640(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_220F2E6C0()
{
  unint64_t result = qword_267F36560;
  if (!qword_267F36560)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F364C8);
    sub_220D25FB0(&qword_267F36568, &qword_267F36570);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36560);
  }
  return result;
}

uint64_t sub_220F2E760()
{
  return sub_220F250D8(*(void *)(v0 + 16));
}

uint64_t sub_220F2E768@<X0>(uint64_t a1@<X8>)
{
  return sub_220F2527C(*(void *)(v1 + 16), a1);
}

uint64_t sub_220F2E770(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_220F2E7DC()
{
  return sub_220F25584();
}

uint64_t sub_220F2E840()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

uint64_t sub_220F2E850(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_220F2E8B0@<X0>(char *a1@<X8>)
{
  return sub_220F284A8(*(void *)(v1 + 16), a1);
}

uint64_t objectdestroyTm_22()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v9 = sub_220F30E48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220F2EB30(uint64_t a1)
{
  return sub_220F2ED58(a1, (uint64_t (*)(uint64_t, uint64_t))sub_220F28BE4);
}

unint64_t sub_220F2EB48()
{
  unint64_t result = qword_267F365B0;
  if (!qword_267F365B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F365A0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F365B8);
    sub_220F31568();
    sub_220D25FB0(&qword_267F365C0, &qword_267F365B8);
    sub_220F2EC9C(&qword_267F31708, MEMORY[0x263F19CE8]);
    swift_getOpaqueTypeConformance2();
    sub_220F2EC9C((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F365B0);
  }
  return result;
}

uint64_t sub_220F2EC9C(unint64_t *a1, void (*a2)(uint64_t))
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

BOOL sub_220F2ECE4(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = type metadata accessor for ActivityEditView(0);
  return (sub_220EB4E6C(v3, v4, *(void *)(v2 + *(int *)(v5 + 56))) & 1) == 0;
}

uint64_t sub_220F2ED40(uint64_t a1)
{
  return sub_220F2ED58(a1, (uint64_t (*)(uint64_t, uint64_t))sub_220F29700);
}

uint64_t sub_220F2ED58(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for ActivityEditView(0) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a2(a1, v5);
}

unint64_t sub_220F2EDEC()
{
  unint64_t result = qword_267F365D8;
  if (!qword_267F365D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F365D0);
    sub_220D25FB0(&qword_267F365E0, &qword_267F365E8);
    sub_220F2EC9C((unint64_t *)&qword_267F33EC0, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F365D8);
  }
  return result;
}

uint64_t sub_220F2EEC0()
{
  return sub_220F2F1FC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220F29E50);
}

uint64_t sub_220F2EED8@<X0>(uint64_t a1@<X8>)
{
  return sub_220F29F3C(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_220F2EEE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_40Tm()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v9 = sub_220F30E48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 16, v2 | 7);
}

uint64_t sub_220F2F1E4()
{
  return sub_220F2F1FC((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_220F29420);
}

uint64_t sub_220F2F1FC(uint64_t (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for ActivityEditView(0) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = v1 + v3;
  uint64_t v5 = (uint64_t *)(v1 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  return a1(v4, v6, v7);
}

uint64_t sub_220F2F2A0@<X0>(uint64_t a1@<X8>)
{
  return sub_220F2950C(*(void *)(v1 + 16), *(void *)(v1 + 24), a1);
}

unint64_t sub_220F2F2AC()
{
  unint64_t result = qword_267F36608;
  if (!qword_267F36608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36608);
  }
  return result;
}

uint64_t sub_220F2F300(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_220D3570C(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_220F2F350(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_220D357E0(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_220F2F3A8()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v9 = sub_220F30E48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220F2F624@<X0>(void *a1@<X8>)
{
  type metadata accessor for ActivityEditView(0);
  return sub_220F27DD0(a1);
}

uint64_t sub_220F2F698()
{
  uint64_t v1 = type metadata accessor for ActivityEditView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 40) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F33C90);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_220F30AD8();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 72);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267F2E330);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  swift_release();
  if (EnumCaseMultiPayload == 1)
  {
    swift_release();
    uint64_t v8 = v6 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_267F2EA00) + 32);
    uint64_t v9 = sub_220F30E48();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_220F2F914(uint64_t *a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for ActivityEditView(0) - 8);
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (uint64_t)v1 + ((*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_220F27E54(a1, v4, v5, v6, v7);
}

uint64_t sub_220F2F98C()
{
  return MEMORY[0x270FA0238](v0, 17, 7);
}

unint64_t sub_220F2F99C()
{
  unint64_t result = qword_267F36668;
  if (!qword_267F36668)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36630);
    sub_220F2FA3C();
    sub_220D25FB0(&qword_267F2FF68, (uint64_t *)&unk_267F33E70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36668);
  }
  return result;
}

unint64_t sub_220F2FA3C()
{
  unint64_t result = qword_267F36670;
  if (!qword_267F36670)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_267F36628);
    sub_220D25FB0(&qword_267F36678, &qword_267F36620);
    sub_220D25FB0(&qword_267F2EF58, &qword_267F2EF60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F36670);
  }
  return result;
}

uint64_t sub_220F2FB08(uint64_t a1)
{
  return a1;
}

uint64_t sub_220F2FB5C(uint64_t a1)
{
  return a1;
}

uint64_t sub_220F2FBB8()
{
  type metadata accessor for ActivityEditView(0);
  return sub_220F2A26C();
}

uint64_t sub_220F2FC18()
{
  return sub_220D25FB0(&qword_267F366F8, &qword_267F36700);
}

uint64_t sub_220F2FC54()
{
  return sub_220D25FB0(&qword_267F36708, (uint64_t *)&unk_267F36710);
}

BOOL __isOSVersionAtLeast(int a1, int a2, int a3)
{
  if (qword_267F41CD0 == -1)
  {
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_267F41CD0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v6 = _MergedGlobals < a1;
    if (_MergedGlobals > a1) {
      return 1;
    }
  }
  if (v6) {
    return 0;
  }
  if (dword_267F41CC4 > a2) {
    return 1;
  }
  return dword_267F41CC4 >= a2 && dword_267F41CC8 >= a3;
}

uint64_t compatibilityInitializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(1);
}

uint64_t __isPlatformVersionAtLeast(uint64_t a1, int a2, int a3, int a4)
{
  if (qword_267F41CD8 == -1)
  {
    if (qword_267F41CE0) {
      return _availability_version_check();
    }
  }
  else
  {
    dispatch_once_f(&qword_267F41CD8, 0, (dispatch_function_t)initializeAvailabilityCheck);
    if (qword_267F41CE0) {
      return _availability_version_check();
    }
  }
  if (qword_267F41CD0 == -1)
  {
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  else
  {
    dispatch_once_f(&qword_267F41CD0, 0, (dispatch_function_t)compatibilityInitializeAvailabilityCheck);
    BOOL v8 = _MergedGlobals < a2;
    if (_MergedGlobals > a2) {
      return 1;
    }
  }
  if (v8) {
    return 0;
  }
  if (dword_267F41CC4 > a3) {
    return 1;
  }
  return dword_267F41CC4 >= a3 && dword_267F41CC8 >= a4;
}

uint64_t initializeAvailabilityCheck()
{
  return _initializeAvailabilityCheck(0);
}

uint64_t _initializeAvailabilityCheck(uint64_t result)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v1 = qword_267F41CE0;
  if (qword_267F41CE0) {
    BOOL v2 = result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2)
  {
    if (MEMORY[0x263EF8368])
    {
      uint64_t v1 = MEMORY[0x270FA5398];
      qword_267F41CE0 = MEMORY[0x270FA5398];
    }
    if (!v1 || result != 0)
    {
      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        uint64_t v4 = *(unsigned __int8 **)result;
        unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          uint64_t v5 = (uint64_t (*)(void))result;
          unint64_t v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            uint64_t v7 = (uint64_t (*)(void, uint64_t, void, void))result;
            unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              BOOL v8 = (uint64_t (*)(void, const char *, uint64_t, unsigned __int8 *))result;
              unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  unint64_t v10 = (uint64_t (*)(uint64_t))result;
                  unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    uint64_t v11 = (uint64_t (*)(void))result;
                    unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    uint64_t v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      unint64_t result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        uint64_t v12 = (FILE *)result;
                        unint64_t result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          uint64_t v13 = (FILE *)result;
                          uint64_t v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          uint64_t v14 = MEMORY[0x223C76060](v13);
                          if (v14 < 0)
                          {
                            uint64_t v16 = 0;
                          }
                          else
                          {
                            size_t v15 = v14;
                            rewind(v13);
                            uint64_t v16 = malloc(v15);
                            if (v16)
                            {
                              uint64_t v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                uint64_t v17 = v5(0);
                                if (v17)
                                {
                                  uint64_t v18 = v17;
                                  uint64_t v19 = v13;
                                  if (v6) {
                                    uint64_t v20 = ((uint64_t (*)(void, uint64_t, void, void, void))v6)(0, v17, 0, 0, 0);
                                  }
                                  else {
                                    uint64_t v20 = v7(0, v17, 0, 0);
                                  }
                                  uint64_t v21 = v20;
                                  if (v20)
                                  {
                                    uint64_t v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      uint64_t v23 = v22;
                                      uint64_t v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        uint64_t v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984)) {
                                            sscanf(v29, "%d.%d.%d", &_MergedGlobals, &dword_267F41CC4, &dword_267F41CC8);
                                          }
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    uint64_t v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  uint64_t v19 = v13;
                                }
                                uint64_t v16 = v26;
                              }
                              else
                              {
                                uint64_t v16 = v26;
                                uint64_t v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          uint64_t v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
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
    }
  }
  return result;
}

uint64_t sub_220F302E8()
{
  return MEMORY[0x270EEDF58]();
}

uint64_t sub_220F302F8()
{
  return MEMORY[0x270EEDFB0]();
}

uint64_t sub_220F30308()
{
  return MEMORY[0x270EEE128]();
}

uint64_t sub_220F30318()
{
  return MEMORY[0x270EEE180]();
}

uint64_t sub_220F30328()
{
  return MEMORY[0x270EEE250]();
}

uint64_t sub_220F30338()
{
  return MEMORY[0x270EEE370]();
}

uint64_t sub_220F30348()
{
  return MEMORY[0x270EEE3C8]();
}

uint64_t sub_220F30358()
{
  return MEMORY[0x270EEE770]();
}

uint64_t sub_220F30368()
{
  return MEMORY[0x270EEE788]();
}

uint64_t sub_220F30378()
{
  return MEMORY[0x270EEE7C0]();
}

uint64_t sub_220F30388()
{
  return MEMORY[0x270EEE7D0]();
}

uint64_t sub_220F30398()
{
  return MEMORY[0x270EEE7E0]();
}

uint64_t sub_220F303A8()
{
  return MEMORY[0x270EEE7F8]();
}

uint64_t sub_220F303B8()
{
  return MEMORY[0x270EEE820]();
}

uint64_t sub_220F303C8()
{
  return MEMORY[0x270EEE830]();
}

uint64_t sub_220F303D8()
{
  return MEMORY[0x270EEE888]();
}

uint64_t sub_220F303E8()
{
  return MEMORY[0x270EEE8C0]();
}

uint64_t sub_220F303F8()
{
  return MEMORY[0x270EEE8F0]();
}

uint64_t sub_220F30408()
{
  return MEMORY[0x270EEEEB8]();
}

uint64_t sub_220F30418()
{
  return MEMORY[0x270EEF338]();
}

uint64_t sub_220F30428()
{
  return MEMORY[0x270EEF350]();
}

uint64_t sub_220F30438()
{
  return MEMORY[0x270EEF370]();
}

uint64_t sub_220F30448()
{
  return MEMORY[0x270EEF3A0]();
}

uint64_t sub_220F30458()
{
  return MEMORY[0x270EEF3C8]();
}

uint64_t sub_220F30468()
{
  return MEMORY[0x270EEF3E8]();
}

uint64_t sub_220F30478()
{
  return MEMORY[0x270EEF430]();
}

uint64_t sub_220F30488()
{
  return MEMORY[0x270EEF458]();
}

uint64_t sub_220F30498()
{
  return MEMORY[0x270EEF468]();
}

uint64_t sub_220F304A8()
{
  return MEMORY[0x270EEF838]();
}

uint64_t sub_220F304B8()
{
  return MEMORY[0x270EEF860]();
}

uint64_t sub_220F304C8()
{
  return MEMORY[0x270EEF878]();
}

uint64_t sub_220F304D8()
{
  return MEMORY[0x270EEF8B8]();
}

uint64_t sub_220F304E8()
{
  return MEMORY[0x270EEF8E0]();
}

uint64_t sub_220F304F8()
{
  return MEMORY[0x270EEFA20]();
}

uint64_t sub_220F30508()
{
  return MEMORY[0x270EEFCA8]();
}

uint64_t sub_220F30518()
{
  return MEMORY[0x270EEFD20]();
}

uint64_t sub_220F30528()
{
  return MEMORY[0x270EEFE28]();
}

uint64_t sub_220F30538()
{
  return MEMORY[0x270EEFF08]();
}

uint64_t sub_220F30548()
{
  return MEMORY[0x270EEFF70]();
}

uint64_t sub_220F30558()
{
  return MEMORY[0x270EF0128]();
}

uint64_t sub_220F30568()
{
  return MEMORY[0x270EF0170]();
}

uint64_t sub_220F30578()
{
  return MEMORY[0x270EF0990]();
}

uint64_t sub_220F30588()
{
  return MEMORY[0x270EF0B90]();
}

uint64_t sub_220F30598()
{
  return MEMORY[0x270EF0BB0]();
}

uint64_t sub_220F305A8()
{
  return MEMORY[0x270EF0C28]();
}

uint64_t sub_220F305B8()
{
  return MEMORY[0x270EF0C38]();
}

uint64_t sub_220F305C8()
{
  return MEMORY[0x270EF0C50]();
}

uint64_t sub_220F305D8()
{
  return MEMORY[0x270EF0C60]();
}

uint64_t sub_220F305E8()
{
  return MEMORY[0x270EF0C90]();
}

uint64_t sub_220F305F8()
{
  return MEMORY[0x270EF0CA8]();
}

uint64_t sub_220F30608()
{
  return MEMORY[0x270EF0CC0]();
}

uint64_t sub_220F30618()
{
  return MEMORY[0x270EF0CD0]();
}

uint64_t sub_220F30628()
{
  return MEMORY[0x270EF0D00]();
}

uint64_t sub_220F30638()
{
  return MEMORY[0x270EF0D10]();
}

uint64_t sub_220F30648()
{
  return MEMORY[0x270EF0EE8]();
}

uint64_t sub_220F30658()
{
  return MEMORY[0x270EF0EF0]();
}

uint64_t sub_220F30668()
{
  return MEMORY[0x270EF0FA8]();
}

uint64_t sub_220F30678()
{
  return MEMORY[0x270EF10B0]();
}

uint64_t sub_220F30688()
{
  return MEMORY[0x270EF1128]();
}

uint64_t sub_220F30698()
{
  return MEMORY[0x270EF1250]();
}

uint64_t sub_220F306A8()
{
  return MEMORY[0x270EF12D8]();
}

uint64_t sub_220F306B8()
{
  return MEMORY[0x270EF1318]();
}

uint64_t sub_220F306C8()
{
  return MEMORY[0x270EF1338]();
}

uint64_t sub_220F306D8()
{
  return MEMORY[0x270EF1370]();
}

uint64_t sub_220F306E8()
{
  return MEMORY[0x270EF13E0]();
}

uint64_t sub_220F306F8()
{
  return MEMORY[0x270EF1420]();
}

uint64_t sub_220F30708()
{
  return MEMORY[0x270EF1438]();
}

uint64_t sub_220F30718()
{
  return MEMORY[0x270EF1448]();
}

uint64_t sub_220F30728()
{
  return MEMORY[0x270EF1610]();
}

uint64_t sub_220F30738()
{
  return MEMORY[0x270EF16E8]();
}

uint64_t sub_220F30748()
{
  return MEMORY[0x270EF1708]();
}

uint64_t sub_220F30758()
{
  return MEMORY[0x270F816F8]();
}

uint64_t sub_220F30768()
{
  return MEMORY[0x270F81740]();
}

uint64_t sub_220F30778()
{
  return MEMORY[0x270EF1740]();
}

uint64_t sub_220F30788()
{
  return MEMORY[0x270FA1160]();
}

uint64_t sub_220F30798()
{
  return MEMORY[0x270EF17A8]();
}

uint64_t sub_220F307A8()
{
  return MEMORY[0x270EF17C0]();
}

uint64_t sub_220F307B8()
{
  return MEMORY[0x270EF17C8]();
}

uint64_t sub_220F307C8()
{
  return MEMORY[0x270EF17D8]();
}

uint64_t sub_220F307D8()
{
  return MEMORY[0x270F28690]();
}

uint64_t sub_220F307E8()
{
  return MEMORY[0x270F73438]();
}

uint64_t sub_220F307F8()
{
  return MEMORY[0x270F73440]();
}

uint64_t sub_220F30808()
{
  return MEMORY[0x270F73448]();
}

uint64_t sub_220F30818()
{
  return MEMORY[0x270F73450]();
}

uint64_t sub_220F30828()
{
  return MEMORY[0x270F73458]();
}

uint64_t sub_220F30838()
{
  return MEMORY[0x270F73460]();
}

uint64_t sub_220F30848()
{
  return MEMORY[0x270F73490]();
}

uint64_t sub_220F30858()
{
  return MEMORY[0x270F73498]();
}

uint64_t sub_220F30868()
{
  return MEMORY[0x270F734A0]();
}

uint64_t sub_220F30878()
{
  return MEMORY[0x270F734A8]();
}

uint64_t sub_220F30888()
{
  return MEMORY[0x270F2F908]();
}

uint64_t sub_220F30898()
{
  return MEMORY[0x270F2F940]();
}

uint64_t sub_220F308A8()
{
  return MEMORY[0x270F2F958]();
}

uint64_t sub_220F308B8()
{
  return MEMORY[0x270F2F988]();
}

uint64_t sub_220F308C8()
{
  return MEMORY[0x270F2F9B0]();
}

uint64_t sub_220F308D8()
{
  return MEMORY[0x270F2F9B8]();
}

uint64_t sub_220F308E8()
{
  return MEMORY[0x270F2FAA0]();
}

uint64_t sub_220F308F8()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_220F30908()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_220F30918()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_220F30928()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_220F30938()
{
  return MEMORY[0x270EFEB58]();
}

uint64_t sub_220F30948()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_220F30958()
{
  return MEMORY[0x270EE3CC0]();
}

uint64_t sub_220F30968()
{
  return MEMORY[0x270EE3CE0]();
}

uint64_t sub_220F30978()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_220F30988()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_220F30998()
{
  return MEMORY[0x270EE3DB8]();
}

uint64_t sub_220F309A8()
{
  return MEMORY[0x270EE3DD0]();
}

uint64_t sub_220F309B8()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_220F309C8()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_220F309D8()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_220F309E8()
{
  return MEMORY[0x270EE3E18]();
}

uint64_t sub_220F309F8()
{
  return MEMORY[0x270EE3F78]();
}

uint64_t sub_220F30A08()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_220F30A18()
{
  return MEMORY[0x270EE4010]();
}

uint64_t sub_220F30A28()
{
  return MEMORY[0x270EFEBA0]();
}

uint64_t sub_220F30A38()
{
  return MEMORY[0x270EFEBB8]();
}

uint64_t sub_220F30A48()
{
  return MEMORY[0x270EFEC68]();
}

uint64_t sub_220F30A58()
{
  return MEMORY[0x270EFEC70]();
}

uint64_t sub_220F30A68()
{
  return MEMORY[0x270EFEC88]();
}

uint64_t sub_220F30A78()
{
  return MEMORY[0x270EFECB8]();
}

uint64_t sub_220F30A88()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_220F30A98()
{
  return MEMORY[0x270EFEDF8]();
}

uint64_t sub_220F30AA8()
{
  return MEMORY[0x270EFEE80]();
}

uint64_t sub_220F30AB8()
{
  return MEMORY[0x270EFEE88]();
}

uint64_t sub_220F30AC8()
{
  return MEMORY[0x270EFEF10]();
}

uint64_t sub_220F30AD8()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_220F30AE8()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_220F30AF8()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_220F30B08()
{
  return MEMORY[0x270EFF118]();
}

uint64_t sub_220F30B18()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_220F30B28()
{
  return MEMORY[0x270EFF170]();
}

uint64_t sub_220F30B38()
{
  return MEMORY[0x270EFF380]();
}

uint64_t sub_220F30B48()
{
  return MEMORY[0x270EFF3B8]();
}

uint64_t sub_220F30B58()
{
  return MEMORY[0x270EFF4C8]();
}

uint64_t sub_220F30B68()
{
  return MEMORY[0x270EFF4F0]();
}

uint64_t sub_220F30B78()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_220F30B88()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_220F30B98()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_220F30BA8()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_220F30BB8()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_220F30BC8()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_220F30BD8()
{
  return MEMORY[0x270EFF780]();
}

uint64_t sub_220F30BE8()
{
  return MEMORY[0x270EFF7B0]();
}

uint64_t sub_220F30BF8()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_220F30C08()
{
  return MEMORY[0x270EFF9A0]();
}

uint64_t sub_220F30C28()
{
  return MEMORY[0x270EFF9D0]();
}

uint64_t sub_220F30C38()
{
  return MEMORY[0x270EFF9E0]();
}

uint64_t sub_220F30C48()
{
  return MEMORY[0x270EFFA68]();
}

uint64_t sub_220F30C58()
{
  return MEMORY[0x270EFFAB0]();
}

uint64_t sub_220F30C68()
{
  return MEMORY[0x270EFFAB8]();
}

uint64_t sub_220F30C78()
{
  return MEMORY[0x270EFFAC0]();
}

uint64_t sub_220F30C88()
{
  return MEMORY[0x270EFFAD0]();
}

uint64_t sub_220F30C98()
{
  return MEMORY[0x270EFFB68]();
}

uint64_t sub_220F30CA8()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_220F30CB8()
{
  return MEMORY[0x270EFFB88]();
}

uint64_t sub_220F30CC8()
{
  return MEMORY[0x270EFFBA0]();
}

uint64_t sub_220F30CD8()
{
  return MEMORY[0x270EFFBB8]();
}

uint64_t sub_220F30CE8()
{
  return MEMORY[0x270EFFBC0]();
}

uint64_t sub_220F30CF8()
{
  return MEMORY[0x270EFFEB0]();
}

uint64_t sub_220F30D08()
{
  return MEMORY[0x270EFFEE0]();
}

uint64_t sub_220F30D18()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_220F30D28()
{
  return MEMORY[0x270F00068]();
}

uint64_t sub_220F30D38()
{
  return MEMORY[0x270F00070]();
}

uint64_t sub_220F30D48()
{
  return MEMORY[0x270F000C8]();
}

uint64_t sub_220F30D58()
{
  return MEMORY[0x270F000D0]();
}

uint64_t sub_220F30D68()
{
  return MEMORY[0x270F00100]();
}

uint64_t sub_220F30D78()
{
  return MEMORY[0x270F00118]();
}

uint64_t sub_220F30D88()
{
  return MEMORY[0x270F00120]();
}

uint64_t sub_220F30D98()
{
  return MEMORY[0x270F00138]();
}

uint64_t sub_220F30DA8()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_220F30DB8()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_220F30DC8()
{
  return MEMORY[0x270F00228]();
}

uint64_t sub_220F30DD8()
{
  return MEMORY[0x270F00230]();
}

uint64_t sub_220F30DE8()
{
  return MEMORY[0x270F00388]();
}

uint64_t sub_220F30DF8()
{
  return MEMORY[0x270F003C0]();
}

uint64_t sub_220F30E08()
{
  return MEMORY[0x270F003C8]();
}

uint64_t sub_220F30E18()
{
  return MEMORY[0x270F004D0]();
}

uint64_t sub_220F30E28()
{
  return MEMORY[0x270F004E8]();
}

uint64_t sub_220F30E38()
{
  return MEMORY[0x270F00528]();
}

uint64_t sub_220F30E48()
{
  return MEMORY[0x270F00530]();
}

uint64_t sub_220F30E58()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_220F30E68()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_220F30E78()
{
  return MEMORY[0x270F00820]();
}

uint64_t sub_220F30E88()
{
  return MEMORY[0x270F00828]();
}

uint64_t sub_220F30E98()
{
  return MEMORY[0x270F00838]();
}

uint64_t sub_220F30EA8()
{
  return MEMORY[0x270F00840]();
}

uint64_t sub_220F30EB8()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_220F30EC8()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_220F30ED8()
{
  return MEMORY[0x270F008B8]();
}

uint64_t sub_220F30EE8()
{
  return MEMORY[0x270F008C0]();
}

uint64_t sub_220F30EF8()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_220F30F08()
{
  return MEMORY[0x270F00900]();
}

uint64_t sub_220F30F18()
{
  return MEMORY[0x270F00908]();
}

uint64_t sub_220F30F28()
{
  return MEMORY[0x270F00910]();
}

uint64_t sub_220F30F38()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_220F30F48()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_220F30F58()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_220F30F68()
{
  return MEMORY[0x270F00998]();
}

uint64_t sub_220F30F78()
{
  return MEMORY[0x270F00A00]();
}

uint64_t sub_220F30F88()
{
  return MEMORY[0x270F00A18]();
}

uint64_t sub_220F30F98()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_220F30FA8()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_220F30FB8()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_220F30FC8()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_220F30FD8()
{
  return MEMORY[0x270F00A78]();
}

uint64_t sub_220F30FE8()
{
  return MEMORY[0x270F00A88]();
}

uint64_t sub_220F30FF8()
{
  return MEMORY[0x270F00AC0]();
}

uint64_t sub_220F31008()
{
  return MEMORY[0x270F00B18]();
}

uint64_t sub_220F31018()
{
  return MEMORY[0x270F00B38]();
}

uint64_t sub_220F31028()
{
  return MEMORY[0x270F00B40]();
}

uint64_t sub_220F31038()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_220F31048()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_220F31058()
{
  return MEMORY[0x270F00BC8]();
}

uint64_t sub_220F31068()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_220F31078()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_220F31088()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_220F31098()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_220F310A8()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_220F310B8()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_220F310C8()
{
  return MEMORY[0x270F00DC0]();
}

uint64_t sub_220F310D8()
{
  return MEMORY[0x270F00DD0]();
}

uint64_t sub_220F310E8()
{
  return MEMORY[0x270F00E18]();
}

uint64_t sub_220F310F8()
{
  return MEMORY[0x270F00E20]();
}

uint64_t sub_220F31108()
{
  return MEMORY[0x270F00E38]();
}

uint64_t sub_220F31118()
{
  return MEMORY[0x270F00E40]();
}

uint64_t sub_220F31128()
{
  return MEMORY[0x270F00E50]();
}

uint64_t sub_220F31138()
{
  return MEMORY[0x270F00E68]();
}

uint64_t sub_220F31148()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_220F31158()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_220F31168()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_220F31178()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_220F31188()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_220F31198()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_220F311A8()
{
  return MEMORY[0x270F00F50]();
}

uint64_t sub_220F311B8()
{
  return MEMORY[0x270F00F68]();
}

uint64_t sub_220F311C8()
{
  return MEMORY[0x270F00F88]();
}

uint64_t sub_220F311D8()
{
  return MEMORY[0x270F00FE8]();
}

uint64_t sub_220F311E8()
{
  return MEMORY[0x270F00FF8]();
}

uint64_t sub_220F311F8()
{
  return MEMORY[0x270F01038]();
}

uint64_t sub_220F31208()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_220F31218()
{
  return MEMORY[0x270F01060]();
}

uint64_t sub_220F31228()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_220F31238()
{
  return MEMORY[0x270F01130]();
}

uint64_t sub_220F31248()
{
  return MEMORY[0x270F01228]();
}

uint64_t sub_220F31258()
{
  return MEMORY[0x270F01238]();
}

uint64_t sub_220F31268()
{
  return MEMORY[0x270F01248]();
}

uint64_t sub_220F31278()
{
  return MEMORY[0x270F01258]();
}

uint64_t sub_220F31288()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_220F31298()
{
  return MEMORY[0x270F01280]();
}

uint64_t sub_220F312A8()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_220F312B8()
{
  return MEMORY[0x270F013D0]();
}

uint64_t sub_220F312C8()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_220F312D8()
{
  return MEMORY[0x270F01430]();
}

uint64_t sub_220F312E8()
{
  return MEMORY[0x270F01440]();
}

uint64_t sub_220F312F8()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_220F31308()
{
  return MEMORY[0x270F01498]();
}

uint64_t sub_220F31318()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_220F31328()
{
  return MEMORY[0x270F014B0]();
}

uint64_t sub_220F31338()
{
  return MEMORY[0x270F014B8]();
}

uint64_t sub_220F31348()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_220F31358()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_220F31368()
{
  return MEMORY[0x270F01528]();
}

uint64_t sub_220F31378()
{
  return MEMORY[0x270F015D0]();
}

uint64_t sub_220F31388()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_220F31398()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_220F313A8()
{
  return MEMORY[0x270F01648]();
}

uint64_t sub_220F313B8()
{
  return MEMORY[0x270F016A0]();
}

uint64_t sub_220F313C8()
{
  return MEMORY[0x270F016E0]();
}

uint64_t sub_220F313D8()
{
  return MEMORY[0x270F016F8]();
}

uint64_t sub_220F313E8()
{
  return MEMORY[0x270F01708]();
}

uint64_t sub_220F31408()
{
  return MEMORY[0x270F01728]();
}

uint64_t sub_220F31418()
{
  return MEMORY[0x270F01738]();
}

uint64_t sub_220F31428()
{
  return MEMORY[0x270F01748]();
}

uint64_t sub_220F31438()
{
  return MEMORY[0x270F01758]();
}

uint64_t sub_220F31448()
{
  return MEMORY[0x270F01768]();
}

uint64_t sub_220F31458()
{
  return MEMORY[0x270F01778]();
}

uint64_t sub_220F31478()
{
  return MEMORY[0x270F017F8]();
}

uint64_t sub_220F31488()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_220F31498()
{
  return MEMORY[0x270F01818]();
}

uint64_t sub_220F314A8()
{
  return MEMORY[0x270F01878]();
}

uint64_t sub_220F314B8()
{
  return MEMORY[0x270F01888]();
}

uint64_t sub_220F314C8()
{
  return MEMORY[0x270F01980]();
}

uint64_t sub_220F314D8()
{
  return MEMORY[0x270F01988]();
}

uint64_t sub_220F314E8()
{
  return MEMORY[0x270F01998]();
}

uint64_t sub_220F314F8()
{
  return MEMORY[0x270F019B0]();
}

uint64_t sub_220F31508()
{
  return MEMORY[0x270F019E8]();
}

uint64_t sub_220F31518()
{
  return MEMORY[0x270F019F0]();
}

uint64_t sub_220F31528()
{
  return MEMORY[0x270F01A28]();
}

uint64_t sub_220F31538()
{
  return MEMORY[0x270F01A40]();
}

uint64_t sub_220F31548()
{
  return MEMORY[0x270F01A78]();
}

uint64_t sub_220F31558()
{
  return MEMORY[0x270F01B20]();
}

uint64_t sub_220F31568()
{
  return MEMORY[0x270F01B30]();
}

uint64_t sub_220F31578()
{
  return MEMORY[0x270F01BA0]();
}

uint64_t sub_220F31588()
{
  return MEMORY[0x270F01C08]();
}

uint64_t sub_220F31598()
{
  return MEMORY[0x270F01C10]();
}

uint64_t sub_220F315A8()
{
  return MEMORY[0x270F01C18]();
}

uint64_t sub_220F315B8()
{
  return MEMORY[0x270F01D38]();
}

uint64_t sub_220F315C8()
{
  return MEMORY[0x270F01E68]();
}

uint64_t sub_220F315D8()
{
  return MEMORY[0x270F01F00]();
}

uint64_t sub_220F315E8()
{
  return MEMORY[0x270F01F10]();
}

uint64_t sub_220F315F8()
{
  return MEMORY[0x270F02078]();
}

uint64_t sub_220F31608()
{
  return MEMORY[0x270F020E8]();
}

uint64_t sub_220F31618()
{
  return MEMORY[0x270F020F0]();
}

uint64_t sub_220F31628()
{
  return MEMORY[0x270F02100]();
}

uint64_t sub_220F31638()
{
  return MEMORY[0x270F02120]();
}

uint64_t sub_220F31648()
{
  return MEMORY[0x270F02128]();
}

uint64_t sub_220F31658()
{
  return MEMORY[0x270F021E0]();
}

uint64_t sub_220F31668()
{
  return MEMORY[0x270F021E8]();
}

uint64_t sub_220F31678()
{
  return MEMORY[0x270F021F0]();
}

uint64_t sub_220F31688()
{
  return MEMORY[0x270F021F8]();
}

uint64_t sub_220F31698()
{
  return MEMORY[0x270F02208]();
}

uint64_t sub_220F316A8()
{
  return MEMORY[0x270F02210]();
}

uint64_t sub_220F316B8()
{
  return MEMORY[0x270F02218]();
}

uint64_t sub_220F316C8()
{
  return MEMORY[0x270F022B0]();
}

uint64_t sub_220F316D8()
{
  return MEMORY[0x270F022B8]();
}

uint64_t sub_220F316E8()
{
  return MEMORY[0x270F02370]();
}

uint64_t sub_220F316F8()
{
  return MEMORY[0x270F02380]();
}

uint64_t sub_220F31708()
{
  return MEMORY[0x270F02390]();
}

uint64_t sub_220F31718()
{
  return MEMORY[0x270F023A0]();
}

uint64_t sub_220F31728()
{
  return MEMORY[0x270F02418]();
}

uint64_t sub_220F31738()
{
  return MEMORY[0x270F026A0]();
}

uint64_t sub_220F31748()
{
  return MEMORY[0x270F026B0]();
}

uint64_t sub_220F31758()
{
  return MEMORY[0x270F026C8]();
}

uint64_t sub_220F31778()
{
  return MEMORY[0x270F026E0]();
}

uint64_t sub_220F31788()
{
  return MEMORY[0x270F026F0]();
}

uint64_t sub_220F31798()
{
  return MEMORY[0x270F02700]();
}

uint64_t sub_220F317B8()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_220F317C8()
{
  return MEMORY[0x270F02988]();
}

uint64_t sub_220F317D8()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_220F317E8()
{
  return MEMORY[0x270F029F0]();
}

uint64_t sub_220F317F8()
{
  return MEMORY[0x270F02A00]();
}

uint64_t sub_220F31808()
{
  return MEMORY[0x270F02A20]();
}

uint64_t sub_220F31818()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_220F31828()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_220F31838()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_220F31848()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_220F31858()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_220F31868()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_220F31878()
{
  return MEMORY[0x270F02A90]();
}

uint64_t sub_220F31888()
{
  return MEMORY[0x270F02A98]();
}

uint64_t sub_220F31898()
{
  return MEMORY[0x270F02AA8]();
}

uint64_t sub_220F318A8()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_220F318B8()
{
  return MEMORY[0x270F02AE8]();
}

uint64_t sub_220F318C8()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_220F318D8()
{
  return MEMORY[0x270F02B50]();
}

uint64_t sub_220F318E8()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_220F318F8()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_220F31908()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_220F31918()
{
  return MEMORY[0x270F02BE0]();
}

uint64_t sub_220F31928()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_220F31938()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_220F31948()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_220F31958()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_220F31968()
{
  return MEMORY[0x270F02C88]();
}

uint64_t sub_220F31978()
{
  return MEMORY[0x270F02C98]();
}

uint64_t sub_220F31988()
{
  return MEMORY[0x270F02CB0]();
}

uint64_t sub_220F31998()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_220F319A8()
{
  return MEMORY[0x270F02CD0]();
}

uint64_t sub_220F319B8()
{
  return MEMORY[0x270F02CE8]();
}

uint64_t sub_220F319C8()
{
  return MEMORY[0x270F02CF8]();
}

uint64_t sub_220F319D8()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_220F319E8()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_220F319F8()
{
  return MEMORY[0x270F02D50]();
}

uint64_t sub_220F31A08()
{
  return MEMORY[0x270F02D60]();
}

uint64_t sub_220F31A18()
{
  return MEMORY[0x270F02D68]();
}

uint64_t sub_220F31A28()
{
  return MEMORY[0x270F02DC8]();
}

uint64_t sub_220F31A38()
{
  return MEMORY[0x270F02DE8]();
}

uint64_t sub_220F31A48()
{
  return MEMORY[0x270F02E88]();
}

uint64_t sub_220F31A58()
{
  return MEMORY[0x270F02EA8]();
}

uint64_t sub_220F31A68()
{
  return MEMORY[0x270F02EC0]();
}

uint64_t sub_220F31A78()
{
  return MEMORY[0x270F02F08]();
}

uint64_t sub_220F31A88()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_220F31A98()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_220F31AA8()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_220F31AB8()
{
  return MEMORY[0x270F03050]();
}

uint64_t sub_220F31AC8()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_220F31AD8()
{
  return MEMORY[0x270F03088]();
}

uint64_t sub_220F31AE8()
{
  return MEMORY[0x270F03090]();
}

uint64_t sub_220F31AF8()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_220F31B08()
{
  return MEMORY[0x270F03150]();
}

uint64_t sub_220F31B18()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_220F31B28()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_220F31B38()
{
  return MEMORY[0x270F5D078]();
}

uint64_t sub_220F31B48()
{
  return MEMORY[0x270F03290]();
}

uint64_t sub_220F31B58()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_220F31B68()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_220F31B78()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_220F31B88()
{
  return MEMORY[0x270F033C8]();
}

uint64_t sub_220F31B98()
{
  return MEMORY[0x270F033E0]();
}

uint64_t sub_220F31BA8()
{
  return MEMORY[0x270F03438]();
}

uint64_t sub_220F31BB8()
{
  return MEMORY[0x270F03448]();
}

uint64_t sub_220F31BC8()
{
  return MEMORY[0x270F034A0]();
}

uint64_t sub_220F31BD8()
{
  return MEMORY[0x270F034F0]();
}

uint64_t sub_220F31BE8()
{
  return MEMORY[0x270F03500]();
}

uint64_t sub_220F31BF8()
{
  return MEMORY[0x270F03548]();
}

uint64_t sub_220F31C08()
{
  return MEMORY[0x270F035A0]();
}

uint64_t sub_220F31C18()
{
  return MEMORY[0x270F035C0]();
}

uint64_t sub_220F31C28()
{
  return MEMORY[0x270F035E0]();
}

uint64_t sub_220F31C38()
{
  return MEMORY[0x270F03630]();
}

uint64_t sub_220F31C48()
{
  return MEMORY[0x270F036B0]();
}

uint64_t sub_220F31C58()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_220F31C68()
{
  return MEMORY[0x270F03790]();
}

uint64_t sub_220F31C78()
{
  return MEMORY[0x270F037F8]();
}

uint64_t sub_220F31C88()
{
  return MEMORY[0x270F03810]();
}

uint64_t sub_220F31C98()
{
  return MEMORY[0x270F03878]();
}

uint64_t sub_220F31CA8()
{
  return MEMORY[0x270F03880]();
}

uint64_t sub_220F31CB8()
{
  return MEMORY[0x270F03898]();
}

uint64_t sub_220F31CC8()
{
  return MEMORY[0x270F03900]();
}

uint64_t sub_220F31CD8()
{
  return MEMORY[0x270F03998]();
}

uint64_t sub_220F31CE8()
{
  return MEMORY[0x270F039A0]();
}

uint64_t sub_220F31CF8()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_220F31D08()
{
  return MEMORY[0x270F03A20]();
}

uint64_t sub_220F31D18()
{
  return MEMORY[0x270F03A28]();
}

uint64_t sub_220F31D28()
{
  return MEMORY[0x270F03A68]();
}

uint64_t sub_220F31D38()
{
  return MEMORY[0x270F03AF0]();
}

uint64_t sub_220F31D48()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_220F31D58()
{
  return MEMORY[0x270F03BC0]();
}

uint64_t sub_220F31D68()
{
  return MEMORY[0x270F03C58]();
}

uint64_t sub_220F31D78()
{
  return MEMORY[0x270F03CC0]();
}

uint64_t sub_220F31D88()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_220F31D98()
{
  return MEMORY[0x270F03DB8]();
}

uint64_t sub_220F31DA8()
{
  return MEMORY[0x270F03E60]();
}

uint64_t sub_220F31DB8()
{
  return MEMORY[0x270F03EF8]();
}

uint64_t sub_220F31DC8()
{
  return MEMORY[0x270F03F10]();
}

uint64_t sub_220F31DD8()
{
  return MEMORY[0x270F03F68]();
}

uint64_t sub_220F31DE8()
{
  return MEMORY[0x270F04008]();
}

uint64_t sub_220F31DF8()
{
  return MEMORY[0x270F040D0]();
}

uint64_t sub_220F31E08()
{
  return MEMORY[0x270F040D8]();
}

uint64_t sub_220F31E18()
{
  return MEMORY[0x270F04110]();
}

uint64_t sub_220F31E28()
{
  return MEMORY[0x270F04128]();
}

uint64_t sub_220F31E38()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_220F31E48()
{
  return MEMORY[0x270F04248]();
}

uint64_t sub_220F31E58()
{
  return MEMORY[0x270F04278]();
}

uint64_t sub_220F31E68()
{
  return MEMORY[0x270F042E0]();
}

uint64_t sub_220F31E78()
{
  return MEMORY[0x270F04320]();
}

uint64_t sub_220F31E88()
{
  return MEMORY[0x270F04330]();
}

uint64_t sub_220F31E98()
{
  return MEMORY[0x270F04378]();
}

uint64_t sub_220F31EA8()
{
  return MEMORY[0x270F04388]();
}

uint64_t sub_220F31EB8()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_220F31EC8()
{
  return MEMORY[0x270F86A80]();
}

uint64_t sub_220F31ED8()
{
  return MEMORY[0x270F043C8]();
}

uint64_t sub_220F31EE8()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_220F31EF8()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_220F31F08()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_220F31F18()
{
  return MEMORY[0x270F04438]();
}

uint64_t sub_220F31F28()
{
  return MEMORY[0x270F04440]();
}

uint64_t sub_220F31F38()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_220F31F48()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_220F31F58()
{
  return MEMORY[0x270F04468]();
}

uint64_t sub_220F31F68()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_220F31F78()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_220F31F88()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_220F31F98()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_220F31FA8()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_220F31FB8()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_220F31FC8()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_220F31FD8()
{
  return MEMORY[0x270F044E8]();
}

uint64_t sub_220F31FE8()
{
  return MEMORY[0x270F044F0]();
}

uint64_t sub_220F31FF8()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_220F32008()
{
  return MEMORY[0x270F04570]();
}

uint64_t sub_220F32018()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_220F32028()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_220F32038()
{
  return MEMORY[0x270F04608]();
}

uint64_t sub_220F32048()
{
  return MEMORY[0x270F04620]();
}

uint64_t sub_220F32058()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_220F32068()
{
  return MEMORY[0x270F04638]();
}

uint64_t sub_220F32078()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_220F32088()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_220F32098()
{
  return MEMORY[0x270F046A8]();
}

uint64_t sub_220F320A8()
{
  return MEMORY[0x270F046C8]();
}

uint64_t sub_220F320B8()
{
  return MEMORY[0x270F046E8]();
}

uint64_t sub_220F320C8()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_220F320D8()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_220F32108()
{
  return MEMORY[0x270F047D8]();
}

uint64_t sub_220F32128()
{
  return MEMORY[0x270F047E8]();
}

uint64_t sub_220F32148()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_220F32158()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_220F32168()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_220F32178()
{
  return MEMORY[0x270F04848]();
}

uint64_t sub_220F32188()
{
  return MEMORY[0x270F04870]();
}

uint64_t sub_220F32198()
{
  return MEMORY[0x270F04890]();
}

uint64_t sub_220F321A8()
{
  return MEMORY[0x270F048B0]();
}

uint64_t sub_220F321B8()
{
  return MEMORY[0x270F048D0]();
}

uint64_t sub_220F321C8()
{
  return MEMORY[0x270F048E8]();
}

uint64_t sub_220F321D8()
{
  return MEMORY[0x270F04900]();
}

uint64_t sub_220F321E8()
{
  return MEMORY[0x270F04950]();
}

uint64_t sub_220F321F8()
{
  return MEMORY[0x270F04960]();
}

uint64_t sub_220F32208()
{
  return MEMORY[0x270F049A8]();
}

uint64_t sub_220F32218()
{
  return MEMORY[0x270F049C0]();
}

uint64_t sub_220F32228()
{
  return MEMORY[0x270F049E0]();
}

uint64_t sub_220F32238()
{
  return MEMORY[0x270F04A40]();
}

uint64_t sub_220F32248()
{
  return MEMORY[0x270F04AE0]();
}

uint64_t sub_220F32258()
{
  return MEMORY[0x270F04AF0]();
}

uint64_t sub_220F32268()
{
  return MEMORY[0x270F04AF8]();
}

uint64_t sub_220F32278()
{
  return MEMORY[0x270F04B08]();
}

uint64_t sub_220F32288()
{
  return MEMORY[0x270F04B10]();
}

uint64_t sub_220F32298()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_220F322A8()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_220F322B8()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_220F322C8()
{
  return MEMORY[0x270F04B58]();
}

uint64_t sub_220F322D8()
{
  return MEMORY[0x270F04B68]();
}

uint64_t sub_220F322E8()
{
  return MEMORY[0x270F04B80]();
}

uint64_t sub_220F322F8()
{
  return MEMORY[0x270F04B90]();
}

uint64_t sub_220F32308()
{
  return MEMORY[0x270F04BF8]();
}

uint64_t sub_220F32318()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_220F32328()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_220F32338()
{
  return MEMORY[0x270F04C80]();
}

uint64_t sub_220F32348()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_220F32358()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_220F32368()
{
  return MEMORY[0x270F04D40]();
}

uint64_t sub_220F32378()
{
  return MEMORY[0x270F04D50]();
}

uint64_t sub_220F32388()
{
  return MEMORY[0x270F04D68]();
}

uint64_t sub_220F32398()
{
  return MEMORY[0x270F04D70]();
}

uint64_t sub_220F323A8()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_220F323B8()
{
  return MEMORY[0x270F04EF0]();
}

uint64_t sub_220F323C8()
{
  return MEMORY[0x270F04F00]();
}

uint64_t sub_220F323D8()
{
  return MEMORY[0x270F04F10]();
}

uint64_t sub_220F323E8()
{
  return MEMORY[0x270F04F90]();
}

uint64_t sub_220F323F8()
{
  return MEMORY[0x270F04F98]();
}

uint64_t sub_220F32408()
{
  return MEMORY[0x270F04FB0]();
}

uint64_t sub_220F32418()
{
  return MEMORY[0x270F05010]();
}

uint64_t sub_220F32428()
{
  return MEMORY[0x270F05020]();
}

uint64_t sub_220F32438()
{
  return MEMORY[0x270F05030]();
}

uint64_t sub_220F32448()
{
  return MEMORY[0x270F05058]();
}

uint64_t sub_220F32458()
{
  return MEMORY[0x270F05068]();
}

uint64_t sub_220F32468()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_220F32478()
{
  return MEMORY[0x270F050D0]();
}

uint64_t sub_220F32488()
{
  return MEMORY[0x270F05110]();
}

uint64_t sub_220F32498()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_220F324A8()
{
  return MEMORY[0x270F05148]();
}

uint64_t sub_220F324B8()
{
  return MEMORY[0x270F05160]();
}

uint64_t sub_220F324C8()
{
  return MEMORY[0x270F051A8]();
}

uint64_t sub_220F324D8()
{
  return MEMORY[0x270F05200]();
}

uint64_t sub_220F324E8()
{
  return MEMORY[0x270F05228]();
}

uint64_t sub_220F324F8()
{
  return MEMORY[0x270F052B8]();
}

uint64_t sub_220F32508()
{
  return MEMORY[0x270F05320]();
}

uint64_t sub_220F32518()
{
  return MEMORY[0x270F05330]();
}

uint64_t sub_220F32528()
{
  return MEMORY[0x270F05398]();
}

uint64_t sub_220F32538()
{
  return MEMORY[0x270F053B8]();
}

uint64_t sub_220F32548()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_220F32558()
{
  return MEMORY[0x270F053D0]();
}

uint64_t sub_220F32568()
{
  return MEMORY[0x270F053D8]();
}

uint64_t sub_220F32578()
{
  return MEMORY[0x270FA09A0]();
}

uint64_t sub_220F32588()
{
  return MEMORY[0x270FA09C8]();
}

uint64_t sub_220F32598()
{
  return MEMORY[0x270FA09F0]();
}

uint64_t sub_220F325A8()
{
  return MEMORY[0x270FA0A50]();
}

uint64_t sub_220F325B8()
{
  return MEMORY[0x270FA0AB8]();
}

uint64_t sub_220F325C8()
{
  return MEMORY[0x270FA0AF8]();
}

uint64_t sub_220F325D8()
{
  return MEMORY[0x270FA0B58]();
}

uint64_t sub_220F325E8()
{
  return MEMORY[0x270FA0B68]();
}

uint64_t sub_220F325F8()
{
  return MEMORY[0x270FA0B90]();
}

uint64_t sub_220F32608()
{
  return MEMORY[0x270FA0BC0]();
}

uint64_t sub_220F32618()
{
  return MEMORY[0x270F5D090]();
}

uint64_t sub_220F32628()
{
  return MEMORY[0x270EF1810]();
}

uint64_t sub_220F32638()
{
  return MEMORY[0x270EF1848]();
}

uint64_t sub_220F32648()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_220F32658()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_220F32668()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_220F32678()
{
  return MEMORY[0x270F9D3E0]();
}

uint64_t sub_220F32688()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_220F32698()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_220F326A8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_220F326B8()
{
  return MEMORY[0x270EF18C8]();
}

uint64_t sub_220F326C8()
{
  return MEMORY[0x270EF1900]();
}

uint64_t sub_220F326D8()
{
  return MEMORY[0x270EF1920]();
}

uint64_t sub_220F326E8()
{
  return MEMORY[0x270EF1930]();
}

uint64_t sub_220F326F8()
{
  return MEMORY[0x270EF1940]();
}

uint64_t sub_220F32708()
{
  return MEMORY[0x270EF1948]();
}

uint64_t sub_220F32718()
{
  return MEMORY[0x270EF1960]();
}

uint64_t sub_220F32728()
{
  return MEMORY[0x270EF19A8]();
}

uint64_t sub_220F32738()
{
  return MEMORY[0x270EF19C0]();
}

uint64_t sub_220F32748()
{
  return MEMORY[0x270EF19D0]();
}

uint64_t sub_220F32758()
{
  return MEMORY[0x270EF19D8]();
}

uint64_t sub_220F32768()
{
  return MEMORY[0x270EF19F0]();
}

uint64_t sub_220F32778()
{
  return MEMORY[0x270EF1A40]();
}

uint64_t sub_220F32788()
{
  return MEMORY[0x270EF1A48]();
}

uint64_t sub_220F32798()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_220F327A8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_220F327B8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_220F327C8()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_220F327D8()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_220F327E8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_220F327F8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_220F32808()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_220F32828()
{
  return MEMORY[0x270EF1B78]();
}

uint64_t sub_220F32838()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_220F32848()
{
  return MEMORY[0x270EF1B90]();
}

uint64_t sub_220F32858()
{
  return MEMORY[0x270EF1BB0]();
}

uint64_t sub_220F32868()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_220F32878()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_220F32888()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_220F32898()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_220F328A8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_220F328B8()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_220F328C8()
{
  return MEMORY[0x270FA1E48]();
}

uint64_t sub_220F328E8()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_220F328F8()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_220F32908()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_220F32918()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_220F32938()
{
  return MEMORY[0x270EF1CA0]();
}

uint64_t sub_220F32948()
{
  return MEMORY[0x270EF1CC8]();
}

uint64_t sub_220F32958()
{
  return MEMORY[0x270F9DEB0]();
}

uint64_t sub_220F32968()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_220F32978()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_220F32988()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_220F32998()
{
  return MEMORY[0x270EF1DC0]();
}

uint64_t sub_220F329A8()
{
  return MEMORY[0x270EF1E00]();
}

uint64_t sub_220F329B8()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_220F329C8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_220F329D8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_220F329E8()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_220F329F8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_220F32A08()
{
  return MEMORY[0x270FA0C28]();
}

uint64_t sub_220F32A18()
{
  return MEMORY[0x270FA0C58]();
}

uint64_t sub_220F32A28()
{
  return MEMORY[0x270FA0C80]();
}

uint64_t sub_220F32A38()
{
  return MEMORY[0x270FA0C88]();
}

uint64_t sub_220F32A48()
{
  return MEMORY[0x270FA0CD8]();
}

uint64_t sub_220F32A58()
{
  return MEMORY[0x270FA0D48]();
}

uint64_t sub_220F32A68()
{
  return MEMORY[0x270FA0D68]();
}

uint64_t sub_220F32A78()
{
  return MEMORY[0x270FA0D98]();
}

uint64_t sub_220F32A88()
{
  return MEMORY[0x270FA0DC0]();
}

uint64_t sub_220F32A98()
{
  return MEMORY[0x270FA0DD8]();
}

uint64_t sub_220F32AA8()
{
  return MEMORY[0x270EF2008]();
}

uint64_t sub_220F32AB8()
{
  return MEMORY[0x270EF2018]();
}

uint64_t sub_220F32AC8()
{
  return MEMORY[0x270EF2158]();
}

uint64_t sub_220F32AD8()
{
  return MEMORY[0x270EF2168]();
}

uint64_t sub_220F32AE8()
{
  return MEMORY[0x270F05438]();
}

uint64_t sub_220F32AF8()
{
  return MEMORY[0x270FA1178]();
}

uint64_t sub_220F32B08()
{
  return MEMORY[0x270FA1188]();
}

uint64_t sub_220F32B18()
{
  return MEMORY[0x270FA1198]();
}

uint64_t sub_220F32B28()
{
  return MEMORY[0x270EF2308]();
}

uint64_t sub_220F32B38()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_220F32B48()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_220F32B58()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_220F32B68()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_220F32B78()
{
  return MEMORY[0x270EF2468]();
}

uint64_t sub_220F32B88()
{
  return MEMORY[0x270EF2480]();
}

uint64_t sub_220F32B98()
{
  return MEMORY[0x270EF24E8]();
}

uint64_t sub_220F32BA8()
{
  return MEMORY[0x270EF2500]();
}

uint64_t sub_220F32BB8()
{
  return MEMORY[0x270EF2510]();
}

uint64_t sub_220F32BC8()
{
  return MEMORY[0x270EF2520]();
}

uint64_t sub_220F32BD8()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_220F32BE8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_220F32BF8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_220F32C08()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_220F32C18()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_220F32C28()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_220F32C38()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_220F32C48()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_220F32C58()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_220F32C68()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_220F32C78()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_220F32C88()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_220F32C98()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_220F32CB8()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_220F32CC8()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_220F32CD8()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_220F32CE8()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_220F32CF8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_220F32D08()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_220F32D18()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_220F32D28()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_220F32D38()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_220F32D48()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_220F32D58()
{
  return MEMORY[0x270F9E9D8]();
}

uint64_t sub_220F32D68()
{
  return MEMORY[0x270F9EA30]();
}

uint64_t sub_220F32D78()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_220F32D88()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_220F32D98()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_220F32DB8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_220F32DC8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_220F32DD8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_220F32DE8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_220F32DF8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_220F32E08()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_220F32E18()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_220F32E28()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_220F32E38()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_220F32E48()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_220F32E58()
{
  return MEMORY[0x270F9F088]();
}

uint64_t sub_220F32E68()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_220F32E78()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_220F32E88()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_220F32E98()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_220F32EA8()
{
  return MEMORY[0x270F9F1A8]();
}

uint64_t sub_220F32EB8()
{
  return MEMORY[0x270F9F4C0]();
}

uint64_t sub_220F32EC8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_220F32ED8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_220F32EE8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_220F32EF8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_220F32F08()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_220F32F18()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_220F32F28()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_220F32F38()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_220F32F48()
{
  return MEMORY[0x270EF2688]();
}

uint64_t sub_220F32F68()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_220F32F78()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_220F32F88()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_220F32F98()
{
  return MEMORY[0x270F9FC78]();
}

uint64_t sub_220F32FA8()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_220F32FB8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_220F32FC8()
{
  return MEMORY[0x270FA00C0]();
}

uint64_t sub_220F32FD8()
{
  return MEMORY[0x270FA0128]();
}

NSString *__cdecl AXNameFromColor(CGColorRef color)
{
  return (NSString *)MEMORY[0x270EE0650](color);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x270EE9B00](name, matrix, options, size);
}

uint64_t DNDModeSemanticTypeToString()
{
  return MEMORY[0x270F26778]();
}

uint64_t DNDResolvedImpactsAvailabilitySetting()
{
  return MEMORY[0x270F26780]();
}

uint64_t DNDResolvedInterruptionSuppressionMode()
{
  return MEMORY[0x270F26788]();
}

uint64_t DNDStringFromOperatingSystemVersion()
{
  return MEMORY[0x270F26798]();
}

uint64_t DNDSystemColorNameForModeSemanticType()
{
  return MEMORY[0x270F267A0]();
}

uint64_t DNDSystemImageNameForModeSemanticType()
{
  return MEMORY[0x270F267A8]();
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E30](*(void *)&port);
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  MEMORY[0x270EF58B8]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

uint64_t MapsSuggestionsCurrentBestLocation()
{
  return MEMORY[0x270F49678]();
}

uint64_t MapsSuggestionsLocationForMapItem()
{
  return MEMORY[0x270F49680]();
}

uint64_t PSPassbookImage()
{
  return MEMORY[0x270F552B0]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x270F77130]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _availability_version_check()
{
  return MEMORY[0x270ED7F40]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9338]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
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

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

void rewind(FILE *a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x270FA04B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
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