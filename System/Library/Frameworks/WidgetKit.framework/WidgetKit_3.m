uint64_t sub_191CDEB50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    v2 = sub_191CDEDB4;
  }
  else {
    v2 = sub_191CDEC64;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_191CDEC64()
{
  uint64_t v1 = v0[10];
  sub_191CE17B4(&qword_1E92E2488, (void (*)(uint64_t))type metadata accessor for ControlArchiveStorage);
  uint64_t v2 = sub_191CF5258();
  if (v1)
  {
    sub_191CE1E44(v0[7], type metadata accessor for ControlArchiveStorage);
    swift_task_dealloc();
    v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    sub_191CE1E44(v0[7], type metadata accessor for ControlArchiveStorage);
    swift_task_dealloc();
    v8 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
    return v8(v6, v7);
  }
}

uint64_t sub_191CDEDB4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_191CDEE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a5;
  v6[18] = a6;
  v6[15] = a3;
  v6[16] = a4;
  v6[13] = a1;
  v6[14] = a2;
  v6[19] = *(void *)(type metadata accessor for ControlTemplateType() - 8);
  v6[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBB8);
  v6[21] = swift_task_alloc();
  v6[22] = type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator.Iterator(0);
  v6[23] = swift_task_alloc();
  uint64_t v9 = sub_191CF4058();
  v6[24] = v9;
  v6[25] = *(void *)(v9 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  v6[28] = swift_task_alloc();
  v6[29] = type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator(0);
  v6[30] = swift_task_alloc();
  type metadata accessor for BundleStub();
  v6[31] = swift_task_alloc();
  uint64_t v10 = sub_191CF3178();
  v6[32] = v10;
  v6[33] = *(void *)(v10 - 8);
  v6[34] = swift_task_alloc();
  v6[35] = type metadata accessor for ControlArchiveStorageMetadata(0);
  v6[36] = swift_task_alloc();
  v13 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a6 + 8) + **(int **)(a6 + 8));
  v11 = (void *)swift_task_alloc();
  v6[37] = v11;
  void *v11 = v6;
  v11[1] = sub_191CDF13C;
  return v13(a5, a6);
}

uint64_t sub_191CDF13C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 304) = a1;
  swift_task_dealloc();
  if (v1)
  {
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
    v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x1F4188298](sub_191CDF30C, 0, 0);
  }
}

uint64_t sub_191CDF30C()
{
  uint64_t v80 = v0;
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void **)(v0 + 128);
  id v3 = *(id *)(v0 + 120);
  id v4 = v2;
  swift_retain();
  sub_191CF3168();
  BundleStub.init(_:)((uint64_t)objc_msgSend(v3, sel_extensionIdentity), v1);
  if (qword_1EB44BA38 != -1) {
    swift_once();
  }
  v5 = *(int **)(v0 + 280);
  uint64_t v6 = *(void *)(v0 + 288);
  uint64_t v7 = *(void *)(v0 + 264);
  uint64_t v9 = *(void *)(v0 + 248);
  uint64_t v8 = *(void *)(v0 + 256);
  uint64_t v67 = *(void *)(v0 + 304);
  uint64_t v68 = *(void *)(v0 + 232);
  uint64_t v65 = *(void *)(v0 + 272);
  uint64_t v66 = *(void *)(v0 + 224);
  uint64_t v10 = *(void *)(v0 + 200);
  uint64_t v71 = *(void *)(v0 + 192);
  v76 = *(uint64_t **)(v0 + 184);
  uint64_t v73 = *(void *)(v0 + 176);
  uint64_t v12 = *(void *)(v0 + 120);
  v11 = *(void **)(v0 + 128);
  v69 = *(void ***)(v0 + 240);
  swift_beginAccess();
  uint64_t v13 = qword_1EB44BA48;
  *(void *)(v6 + v5[6]) = v12;
  sub_191CE1DDC(v9, v6, (uint64_t (*)(void))type metadata accessor for BundleStub);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6 + v5[8], v65, v8);
  *(void *)(v6 + v5[5]) = v13;
  v79 = v11;
  id v14 = v11;
  WidgetEnvironment.filterForControlArchiving()();
  sub_191CE1E44(v9, (uint64_t (*)(void))type metadata accessor for BundleStub);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v65, v8);

  *(void *)(v6 + v5[7]) = v11;
  *(void *)(v6 + v5[9]) = v67;
  id v15 = v11;
  _s9WidgetKit0A11EnvironmentV14makeEnumerator4withAC0c6ValuesE0V7SwiftUI0cG0V_tFfA__0();
  v16 = (char *)v69 + *(int *)(v68 + 20);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  *(void *)(v0 + 312) = v17;
  *(void *)(v0 + 320) = (v10 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v17(v16, v66, v71);
  *v69 = v15;
  v18 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  *(void *)(v0 + 328) = v18;
  *(void *)(v0 + 336) = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v18(v66, v71);
  *(void *)(v0 + 344) = sub_191CE0434();
  v19 = *v69;
  uint64_t v20 = *(int *)(v73 + 20);
  *(_DWORD *)(v0 + 100) = v20;
  v17((char *)v76 + v20, (uint64_t)v16, v71);
  id v21 = v19;
  uint64_t v22 = MEMORY[0x1E4FBC860];
  uint64_t v23 = sub_191B4EA70(MEMORY[0x1E4FBC860]);
  v79 = v21;
  id v24 = v21;
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_191B4FF68(&v79, v23);
  unint64_t v27 = v26;
  uint64_t v29 = v28;

  swift_bridgeObjectRelease();
  uint64_t *v76 = v25;
  v76[1] = v27;
  v76[2] = v29;
  if (!(v27 >> 62))
  {
    uint64_t v30 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    unint64_t v31 = v30 - 1;
    if (v30 >= 1) {
      goto LABEL_5;
    }
LABEL_16:
    uint64_t v39 = *(void *)(v0 + 200);
    swift_bridgeObjectRelease();
    (*(void (**)(void, uint64_t, uint64_t, void))(v39 + 56))(*(void *)(v0 + 168), 1, 1, *(void *)(v0 + 192));
LABEL_19:
    uint64_t v48 = *(void *)(v0 + 288);
    uint64_t v49 = *(void *)(v0 + 240);
    uint64_t v50 = *(void *)(v0 + 184);
    uint64_t v51 = *(void *)(v0 + 104);
    swift_release();
    swift_release();
    sub_191CE1E44(v50, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator.Iterator);
    sub_191CE1E44(v49, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator);
    sub_191CE1EA4(v48, v51, type metadata accessor for ControlArchiveStorageMetadata);
    uint64_t v52 = type metadata accessor for ControlArchiveStorage(0);
    *(void *)(v51 + *(int *)(v52 + 20)) = MEMORY[0x1E4FBC860];
    *(_DWORD *)(v51 + *(int *)(v52 + 24)) = 2;
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
    v53 = *(uint64_t (**)(void))(v0 + 8);
    return v53();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v38 = sub_191CF6018();
  swift_bridgeObjectRelease();
  unint64_t v31 = v38 - 1;
  if (v38 < 1) {
    goto LABEL_16;
  }
LABEL_5:
  *(void *)(v0 + 352) = v22;
  sub_191B3CC80(v31);
  if ((v32 & 1) == 0)
  {
    v33 = *(void **)(v0 + 184);
    swift_bridgeObjectRelease();
    void *v33 = v22;
    swift_bridgeObjectRelease();
    v33[1] = v22;
    swift_bridgeObjectRelease();
    v33[2] = v22;
  }
  uint64_t result = (*(uint64_t (**)(void, void, void))(v0 + 312))(*(void *)(v0 + 216), *(void *)(v0 + 184) + *(int *)(v0 + 100), *(void *)(v0 + 192));
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_191CF6018();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v35) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v35 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v35) {
      goto LABEL_18;
    }
  }
  if (v35 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v35; ++i)
  {
    if ((v27 & 0xC000000000000001) != 0)
    {
      uint64_t v37 = MEMORY[0x192FE4B60](i, v27);
    }
    else
    {
      uint64_t v37 = *(void *)(v27 + 8 * i + 32);
      swift_retain();
    }
    (*(void (**)(void))(**(void **)(v37 + 16) + 112))(*(void *)(v0 + 216));
    swift_release();
  }
LABEL_18:
  uint64_t v40 = *(void *)(v0 + 216);
  uint64_t v41 = *(void *)(v0 + 192);
  uint64_t v42 = *(void *)(v0 + 200);
  uint64_t v43 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  v44 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32);
  v44(v43, v40, v41);
  v45 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v42 + 56);
  *(void *)(v0 + 360) = v45;
  v45(v43, 0, 1, v41);
  int v46 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v43, 1, v41);
  uint64_t v47 = *(void *)(v0 + 344);
  if (v46 == 1) {
    goto LABEL_19;
  }
  v44(*(void *)(v0 + 208), *(void *)(v0 + 168), *(void *)(v0 + 192));
  if (v47)
  {
    swift_retain();
    sub_191CF4DB8();
    unsigned int v72 = v54;
    unsigned int v77 = v55;
    unsigned int v70 = v56;
    unsigned int v74 = v57;
    swift_release();
    v58.i64[0] = v72;
    v58.i64[1] = v70;
    int8x16_t v59 = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)__PAIR64__(v74, v77), 0x20uLL), v58);
  }
  else
  {
    int8x16_t v59 = 0uLL;
  }
  uint64_t v78 = *(void *)(v0 + 144);
  BOOL v60 = *(void *)(v0 + 344) == 0;
  *(int8x16_t *)(v0 + 80) = v59;
  *(unsigned char *)(v0 + 96) = v60;
  sub_191B163D4();
  sub_191CF4078();
  v75 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v78 + 16) + **(int **)(v78 + 16));
  v61 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v61;
  void *v61 = v0;
  v61[1] = sub_191CDFB04;
  uint64_t v62 = *(void *)(v0 + 208);
  uint64_t v63 = *(void *)(v0 + 136);
  uint64_t v64 = *(void *)(v0 + 144);
  return v75(v0 + 16, v62, v63, v64);
}

uint64_t sub_191CDFB04()
{
  *(void *)(*(void *)v1 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_191CE02C0;
  }
  else
  {
    uint64_t v2 = sub_191CDFC20;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_191CDFC20()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 40);
  id v3 = __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
  uint64_t v4 = *(void *)(v2 - 8);
  v5 = (char *)swift_task_alloc();
  (*(void (**)(char *, void *, uint64_t))(v4 + 16))(v5, v3, v2);
  ControlTemplateType.init<A>(_:)(v5, v2, v1);
  swift_task_dealloc();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v7 = *(void *)(v0 + 352);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    unint64_t v7 = sub_191B40BDC(0, *(void *)(v7 + 16) + 1, 1, *(void *)(v0 + 352));
  }
  unint64_t v9 = *(void *)(v7 + 16);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v9 >= v8 >> 1) {
    unint64_t v7 = sub_191B40BDC(v8 > 1, v9 + 1, 1, v7);
  }
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 328);
  uint64_t v11 = *(void *)(v0 + 208);
  uint64_t v13 = *(void *)(v0 + 184);
  uint64_t v12 = *(void *)(v0 + 192);
  uint64_t v15 = *(void *)(v0 + 152);
  uint64_t v14 = *(void *)(v0 + 160);
  *(void *)(v7 + 16) = v9 + 1;
  sub_191CE1EA4(v14, v7+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(void *)(v15 + 72) * v9, (uint64_t (*)(void))type metadata accessor for ControlTemplateType);
  v10(v11, v12);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  unint64_t v16 = *(void *)(v13 + 8);
  if (!(v16 >> 62))
  {
    uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v17 > 0) {
      goto LABEL_7;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    (*(void (**)(void, uint64_t, uint64_t, void))(v0 + 360))(*(void *)(v0 + 168), 1, 1, *(void *)(v0 + 192));
LABEL_21:
    uint64_t v33 = *(void *)(v0 + 288);
    uint64_t v34 = *(void *)(v0 + 240);
    uint64_t v35 = *(void *)(v0 + 184);
    uint64_t v36 = *(void *)(v0 + 104);
    swift_release();
    swift_release();
    sub_191CE1E44(v35, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator.Iterator);
    sub_191CE1E44(v34, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator);
    sub_191CE1EA4(v33, v36, type metadata accessor for ControlArchiveStorageMetadata);
    uint64_t v37 = type metadata accessor for ControlArchiveStorage(0);
    *(void *)(v36 + *(int *)(v37 + 20)) = v7;
    *(_DWORD *)(v36 + *(int *)(v37 + 24)) = 2;
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
    uint64_t v38 = *(uint64_t (**)(void))(v0 + 8);
    return v38();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_191CF6018();
  swift_bridgeObjectRelease();
  if (v17 <= 0) {
    goto LABEL_18;
  }
LABEL_7:
  *(void *)(v0 + 352) = v7;
  sub_191B3CC80(v17 - 1);
  if ((v18 & 1) == 0)
  {
    v19 = *(void **)(v0 + 184);
    swift_bridgeObjectRelease();
    uint64_t v20 = MEMORY[0x1E4FBC860];
    void *v19 = MEMORY[0x1E4FBC860];
    swift_bridgeObjectRelease();
    v19[1] = v20;
    swift_bridgeObjectRelease();
    v19[2] = v20;
  }
  uint64_t result = (*(uint64_t (**)(void, void, void))(v0 + 312))(*(void *)(v0 + 216), *(void *)(v0 + 184) + *(int *)(v0 + 100), *(void *)(v0 + 192));
  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_191CF6018();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v22 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v22) {
      goto LABEL_20;
    }
  }
  if (v22 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v22; ++i)
  {
    if ((v16 & 0xC000000000000001) != 0)
    {
      uint64_t v24 = MEMORY[0x192FE4B60](i, v16);
    }
    else
    {
      uint64_t v24 = *(void *)(v16 + 8 * i + 32);
      swift_retain();
    }
    (*(void (**)(void))(**(void **)(v24 + 16) + 112))(*(void *)(v0 + 216));
    swift_release();
  }
LABEL_20:
  uint64_t v25 = *(void *)(v0 + 216);
  uint64_t v26 = *(void *)(v0 + 192);
  uint64_t v27 = *(void *)(v0 + 200);
  uint64_t v28 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease();
  uint64_t v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32);
  v29(v28, v25, v26);
  uint64_t v30 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v27 + 56);
  *(void *)(v0 + 360) = v30;
  v30(v28, 0, 1, v26);
  int v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 48))(v28, 1, v26);
  uint64_t v32 = *(void *)(v0 + 344);
  if (v31 == 1) {
    goto LABEL_21;
  }
  v29(*(void *)(v0 + 208), *(void *)(v0 + 168), *(void *)(v0 + 192));
  if (v32)
  {
    swift_retain();
    sub_191CF4DB8();
    unsigned int v51 = v39;
    unsigned int v54 = v40;
    unsigned int v50 = v41;
    unsigned int v52 = v42;
    swift_release();
    v43.i64[0] = v51;
    v43.i64[1] = v50;
    int8x16_t v44 = vorrq_s8((int8x16_t)vshll_n_s32((int32x2_t)__PAIR64__(v52, v54), 0x20uLL), v43);
  }
  else
  {
    int8x16_t v44 = 0uLL;
  }
  uint64_t v55 = *(void *)(v0 + 144);
  BOOL v45 = *(void *)(v0 + 344) == 0;
  *(int8x16_t *)(v0 + 80) = v44;
  *(unsigned char *)(v0 + 96) = v45;
  sub_191B163D4();
  sub_191CF4078();
  v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 + 16) + **(int **)(v55 + 16));
  int v46 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v46;
  *int v46 = v0;
  v46[1] = sub_191CDFB04;
  uint64_t v47 = *(void *)(v0 + 208);
  uint64_t v48 = *(void *)(v0 + 136);
  uint64_t v49 = *(void *)(v0 + 144);
  return v53(v0 + 16, v47, v48, v49);
}

uint64_t sub_191CE02C0()
{
  uint64_t v1 = (void (*)(uint64_t, uint64_t))v0[41];
  uint64_t v2 = v0[36];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[26];
  uint64_t v6 = v0[23];
  uint64_t v5 = v0[24];
  swift_release();
  swift_release();
  v1(v4, v5);
  sub_191CE1E44(v6, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator.Iterator);
  sub_191CE1E44(v3, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator);
  sub_191CE1E44(v2, type metadata accessor for ControlArchiveStorageMetadata);
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
  unint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_191CE0434()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB449C70);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB449C68);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  unint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_191CF3078();
  uint64_t v41 = *(void *)(v9 - 8);
  uint64_t v42 = v9;
  MEMORY[0x1F4188790](v9);
  unsigned int v40 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(v0, sel_extensionIdentity);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB44AB40);
  sub_191CF34D8();
  swift_endAccess();

  id v12 = objc_allocWithZone(MEMORY[0x1E4F223A0]);
  id v13 = sub_191C77E90();
  uint64_t v23 = v13;
  if (v13)
  {
    unsigned int v39 = v8;
    id v24 = objc_msgSend(v13, sel_infoDictionary);
    uint64_t v25 = (void *)sub_191CF5318();
    sub_191C08BA0();
    id v26 = objc_msgSend(v24, sel_objectForKey_ofClass_, v25, swift_getObjCClassFromMetadata());

    if (v26)
    {
      sub_191CF5C58();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
    unint64_t v8 = v39;
    sub_191BC2C50((uint64_t)&v43, (uint64_t)v45);
    if (v46)
    {
      if (swift_dynamicCast())
      {
        id v31 = objc_msgSend(v23, sel_URL);
        uint64_t v32 = v40;
        sub_191CF3048();

        id v33 = objc_allocWithZone(MEMORY[0x1E4F28B50]);
        uint64_t v34 = (void *)sub_191CF3038();
        objc_msgSend(v33, sel_initWithURL_, v34);

        (*(void (**)(char *, uint64_t))(v41 + 8))(v32, v42);
        uint64_t v21 = sub_191CF4E08();

        return v21;
      }
    }
    else
    {

      sub_191B01770((uint64_t)v45, (uint64_t *)&unk_1EB44BC90);
    }
  }
  id v14 = objc_msgSend(v1, sel_extensionIdentity);
  uint64_t v15 = (uint64_t)v14 + *MEMORY[0x1E4F58B78];
  swift_beginAccess();
  sub_191CE1C74(v15, (uint64_t)v4);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_191B01770((uint64_t)v4, qword_1EB449C70);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v16 = sub_191CF34D8();
    uint64_t v18 = v17;
    id v19 = objc_allocWithZone(MEMORY[0x1E4F223C8]);
    id v20 = sub_191CE1CDC(v16, v18, 0);
    uint64_t v27 = v20;
    if (v20)
    {
      id v28 = objc_msgSend(v20, sel_infoDictionary);
      uint64_t v29 = (void *)sub_191CF5318();
      sub_191C08BA0();
      id v30 = objc_msgSend(v28, sel_objectForKey_ofClass_, v29, swift_getObjCClassFromMetadata());

      if (v30)
      {
        sub_191CF5C58();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v43 = 0u;
        long long v44 = 0u;
      }
      sub_191BC2C50((uint64_t)&v43, (uint64_t)v45);
      if (v46)
      {
        if (swift_dynamicCast())
        {
          id v35 = objc_msgSend(v27, sel_URL);
          uint64_t v36 = v40;
          sub_191CF3048();

          id v37 = objc_allocWithZone(MEMORY[0x1E4F28B50]);
          uint64_t v38 = (void *)sub_191CF3038();
          objc_msgSend(v37, sel_initWithURL_, v38);

          (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v42);
          uint64_t v21 = sub_191CF4E08();

          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          return v21;
        }
      }
      else
      {

        sub_191B01770((uint64_t)v45, (uint64_t *)&unk_1EB44BC90);
      }
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return 0;
}

uint64_t static ControlArchiver.archive<A>(control:environment:dataSource:fileHandle:)(void *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v21[3] = a4;
  uint64_t v12 = type metadata accessor for ControlArchiveStorage(0);
  MEMORY[0x1F4188790](v12);
  id v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *a2;
  v21[0] = v15;
  if (WidgetEnvironment.enumeratedCount()() < 1)
  {
    sub_191B16380();
    swift_allocError();
    *(void *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = 0;
    *(unsigned char *)(v17 + 16) = 3;
    return swift_willThrow();
  }
  else
  {
    uint64_t result = sub_191CE0C9C(a3, a1, v15, a5, a6, (uint64_t)v14);
    if (!v6)
    {
      sub_191CE17B4(&qword_1E92E2488, (void (*)(uint64_t))type metadata accessor for ControlArchiveStorage);
      uint64_t v18 = sub_191CF5258();
      unint64_t v20 = v19;
      v21[0] = v18;
      v21[1] = v19;
      sub_191B1632C();
      sub_191CF58D8();
      sub_191CE1E44((uint64_t)v14, type metadata accessor for ControlArchiveStorage);
      return sub_191B1603C(v18, v20);
    }
  }
  return result;
}

uint64_t sub_191CE0C9C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  id v59 = a2;
  id v60 = a3;
  uint64_t v57 = a6;
  uint64_t v63 = sub_191CF4058();
  uint64_t v65 = *(void *)(v63 - 8);
  MEMORY[0x1F4188790](v63);
  uint64_t v64 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator(0);
  MEMORY[0x1F4188790](v61);
  uint64_t v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for BundleStub();
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v58 = (uint64_t)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_191CF3178();
  uint64_t v62 = *(void *)(v15 - 8);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for ControlArchiveStorageMetadata(0);
  MEMORY[0x1F4188790](v18);
  unint64_t v20 = (char *)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a4;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
  if (!v6)
  {
    uint64_t v23 = (int *)v18;
    unsigned int v51 = v20;
    uint64_t v52 = v21;
    uint64_t v53 = 0;
    unsigned int v54 = v12;
    uint64_t v55 = a1;
    uint64_t v56 = a5;
    id v24 = (void *)result;
    id v25 = v59;
    id v26 = v60;
    id v60 = v24;
    swift_retain();
    sub_191CF3168();
    id v27 = objc_msgSend(v25, sel_extensionIdentity);
    uint64_t v28 = v58;
    BundleStub.init(_:)((uint64_t)v27, v58);
    uint64_t v29 = v17;
    if (qword_1EB44BA38 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v30 = (uint64_t)v51;
    *(void *)&v51[v23[6]] = v25;
    uint64_t v31 = qword_1EB44BA48;
    sub_191CE1DDC(v28, v30, (uint64_t (*)(void))type metadata accessor for BundleStub);
    uint64_t v32 = v62;
    (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v30 + v23[8], v29, v15);
    *(void *)(v30 + v23[5]) = v31;
    id v66 = v26;
    id v33 = v26;
    WidgetEnvironment.filterForControlArchiving()();
    uint64_t v34 = v28;
    uint64_t v35 = v30;
    sub_191CE1E44(v34, (uint64_t (*)(void))type metadata accessor for BundleStub);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v15);

    uint64_t v36 = v66;
    *(void *)(v35 + v23[7]) = v66;
    *(void *)(v35 + v23[9]) = v60;
    uint64_t v37 = sub_191CE0434();
    id v38 = v36;
    unsigned int v39 = v64;
    _s9WidgetKit0A11EnvironmentV14makeEnumerator4withAC0c6ValuesE0V7SwiftUI0cG0V_tFfA__0();
    unsigned int v40 = v54;
    uint64_t v41 = v65;
    uint64_t v42 = v63;
    (*(void (**)(char *, char *, uint64_t))(v65 + 16))((char *)v54 + *(int *)(v61 + 20), v39, v63);
    *unsigned int v40 = v38;
    uint64_t v43 = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v39, v42);
    MEMORY[0x1F4188790](v43);
    uint64_t v44 = v53;
    uint64_t v45 = v56;
    *(&v50 - 4) = v52;
    *(&v50 - 3) = v45;
    uint64_t v46 = v55;
    *(&v50 - 2) = v37;
    *(&v50 - 1) = v46;
    uint64_t v47 = sub_191CDE0F4((void (*)(char *, void **))sub_191CE1DB8, (uint64_t)(&v50 - 6));
    swift_release();
    sub_191CE1E44((uint64_t)v40, type metadata accessor for WidgetEnvironment.EnvironmentValuesEnumerator);
    if (v44)
    {
      sub_191CE1E44(v35, type metadata accessor for ControlArchiveStorageMetadata);
      return swift_release();
    }
    else
    {
      swift_release();
      uint64_t v48 = v35;
      uint64_t v49 = v57;
      sub_191CE1EA4(v48, v57, type metadata accessor for ControlArchiveStorageMetadata);
      uint64_t result = type metadata accessor for ControlArchiveStorage(0);
      *(void *)(v49 + *(int *)(result + 20)) = v47;
      *(_DWORD *)(v49 + *(int *)(result + 24)) = 2;
    }
  }
  return result;
}

uint64_t sub_191CE11F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v32 = a5;
  uint64_t v28 = a6;
  uint64_t v11 = sub_191CF4058();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  if (a2)
  {
    sub_191CF4DB8();
    v17.i64[0] = v15;
    v17.i64[1] = v16;
    v19.i32[1] = v18;
    int8x16_t v20 = vorrq_s8((int8x16_t)vshll_n_s32(v19, 0x20uLL), v17);
  }
  else
  {
    int8x16_t v20 = 0uLL;
  }
  int8x16_t v29 = v20;
  BOOL v30 = a2 == 0;
  sub_191B163D4();
  sub_191CF4078();
  (*(void (**)(int8x16_t *__return_ptr, char *, uint64_t, uint64_t))(a4 + 16))(&v29, v14, a3, a4);
  if (v6)
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    *uint64_t v32 = v6;
  }
  else
  {
    uint64_t v22 = v31;
    uint64_t v23 = __swift_project_boxed_opaque_existential_1(&v29, v31);
    MEMORY[0x1F4188790](v23);
    id v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v26 + 16))(v25);
    ControlTemplateType.init<A>(_:)(v25, v22, v28);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
  }
  return result;
}

uint64_t static ControlUnarchiver.unarchive(url:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_191CF3088();
  if (!v1)
  {
    uint64_t v5 = result;
    unint64_t v6 = v4;
    static ControlUnarchiver.unarchive(data:)(a1);
    return sub_191B1603C(v5, v6);
  }
  return result;
}

uint64_t static ControlUnarchiver.unarchive(data:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ControlArchiveStorage(0);
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  unint64_t v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  unint64_t v8 = (char *)v20 - v7;
  sub_191CE17B4(&qword_1E92E2198, (void (*)(uint64_t))type metadata accessor for ControlArchiveStorage);
  uint64_t result = sub_191CF56D8();
  if (!v1)
  {
    sub_191CE1DDC((uint64_t)v8, (uint64_t)v6, type metadata accessor for ControlArchiveStorage);
    uint64_t v10 = type metadata accessor for StorageBackedControlArchive(0);
    uint64_t v11 = swift_allocObject();
    sub_191CE1DDC((uint64_t)v6, v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive_originatingBundle, (uint64_t (*)(void))type metadata accessor for BundleStub);
    uint64_t v12 = (int *)type metadata accessor for ControlArchiveStorageMetadata(0);
    *(void *)(v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive_systemVersion) = *(void *)&v6[v12[5]];
    uint64_t v13 = &v6[v12[8]];
    uint64_t v14 = v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive_creationDate;
    uint64_t v15 = sub_191CF3178();
    (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v14, v13, v15);
    unsigned int v16 = *(void **)&v6[v12[7]];
    *(void *)(v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive_environment) = v16;
    int8x16_t v17 = *(void **)&v6[v12[6]];
    *(void *)(v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive_control) = v17;
    *(void *)(v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive_state) = *(void *)&v6[v12[9]];
    sub_191CE1EA4((uint64_t)v6, v11 + OBJC_IVAR____TtC9WidgetKit27StorageBackedControlArchive__storage, type metadata accessor for ControlArchiveStorage);
    a1[3] = v10;
    a1[4] = sub_191CE17B4(&qword_1E92E21D8, (void (*)(uint64_t))type metadata accessor for StorageBackedControlArchive);
    *a1 = v11;
    id v18 = v16;
    id v19 = v17;
    swift_retain();
    return sub_191CE1E44((uint64_t)v8, type metadata accessor for ControlArchiveStorage);
  }
  return result;
}

uint64_t sub_191CE17B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t dispatch thunk of AsyncControlArchiveDataSource.getState()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 8) + **(int **)(a2 + 8));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_191B8A874;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AsyncControlArchiveDataSource.makeTemplate(environment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 + 16) + **(int **)(a4 + 16));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v9;
  *uint64_t v9 = v4;
  v9[1] = sub_191B0A348;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of ControlArchiveDataSource.getState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ControlArchiveDataSource.makeTemplate(environment:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

ValueMetadata *type metadata accessor for ControlArchiver()
{
  return &type metadata for ControlArchiver;
}

ValueMetadata *type metadata accessor for ControlUnarchiver()
{
  return &type metadata for ControlUnarchiver;
}

uint64_t sub_191CE1A70(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 - 1 <= 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ControlArchivingError(uint64_t a1)
{
  return sub_191CE1A9C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_191CE1A9C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 - 1 <= 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s9WidgetKit21ControlArchivingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_191CE1A70(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ControlArchivingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_191CE1A70(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_191CE1A9C(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ControlArchivingError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_191CE1A9C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlArchivingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ControlArchivingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_191CE1C30(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_191CE1C48(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ControlArchivingError()
{
  return &type metadata for ControlArchivingError;
}

uint64_t sub_191CE1C74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB449C70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_191CE1CDC(uint64_t a1, uint64_t a2, char a3)
{
  v10[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)sub_191CF5318();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_191CF2FE8();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_191CE1DB8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_191CE11F0(a1, v3[4], v3[2], v3[3], a2, a3);
}

uint64_t sub_191CE1DDC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_191CE1E44(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_191CE1EA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t PlaceholderArchivingDataSource.__allocating_init(source:)(long long *a1)
{
  uint64_t v2 = swift_allocObject();
  sub_191B004A8(a1, v2 + 16);
  return v2;
}

uint64_t PlaceholderArchivingDataSource.init(source:)(long long *a1)
{
  sub_191B004A8(a1, v1 + 16);
  return v1;
}

uint64_t sub_191CE1F70()
{
  return sub_191CF3498();
}

uint64_t sub_191CE1FA8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v6 = type metadata accessor for ControlTemplateType();
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v2 + 2;
  uint64_t v11 = v2[5];
  uint64_t v10 = v2[6];
  __swift_project_boxed_opaque_existential_1(v9, v11);
  uint64_t result = ControlArchive.template(in:)(a1, v11, v10);
  if (!v3)
  {
    ControlTemplateType.asPlaceholderTemplate()(a2);
    return sub_191CE2078((uint64_t)v8);
  }
  return result;
}

uint64_t sub_191CE2078(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ControlTemplateType();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t PlaceholderArchivingDataSource.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t PlaceholderArchivingDataSource.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);

  return swift_deallocClassInstance();
}

uint64_t sub_191CE212C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v6 = type metadata accessor for ControlTemplateType();
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  uint64_t v10 = (void *)(*v2 + 16);
  uint64_t v11 = *(void *)(*v2 + 40);
  uint64_t v12 = *(void *)(v9 + 48);
  __swift_project_boxed_opaque_existential_1(v10, v11);
  uint64_t result = ControlArchive.template(in:)(a1, v11, v12);
  if (!v3)
  {
    ControlTemplateType.asPlaceholderTemplate()(a2);
    return sub_191CE2078((uint64_t)v8);
  }
  return result;
}

uint64_t type metadata accessor for PlaceholderArchivingDataSource()
{
  return self;
}

uint64_t method lookup function for PlaceholderArchivingDataSource(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for PlaceholderArchivingDataSource);
}

uint64_t dispatch thunk of PlaceholderArchivingDataSource.__allocating_init(source:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PlaceholderArchivingDataSource.getState()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of PlaceholderArchivingDataSource.makeTemplate(environment:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_191CE22C0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_191CE22E4(a1, a2);
}

uint64_t sub_191CE22E4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(char **)(v2 + 16);
  uint64_t v7 = &v6[OBJC_IVAR___CHKWidgetEnvironment_tuples];
  uint64_t v8 = swift_beginAccess();
  if (*(void *)(*(void *)v7 + 16)
    && (uint64_t v9 = v6,
        WidgetEnvironment.findEnumeratedIndex(matching:ignoring:)(a1, MEMORY[0x1E4FBC860]),
        char v11 = v10,
        v9,
        (v11 & 1) != 0))
  {
    uint64_t v14 = type metadata accessor for ViewableTimelineEntry();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
  else
  {
    uint64_t v12 = *(void *)(v3 + OBJC_IVAR____TtC9WidgetKit20WidgetViewCollection_viewableEntries);
    MEMORY[0x1F4188790](v8);
    swift_bridgeObjectRetain();
    sub_191AF9098((uint64_t (*)(uint64_t))sub_191CE5B7C, v12, a2);
    return swift_bridgeObjectRelease();
  }
}

uint64_t TimelineViewCollection.viewableEntry(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(a4 + 104))(a1, a2, MEMORY[0x1E4FBC860], a3);
}

uint64_t sub_191CE2484(uint64_t a1, uint64_t a2)
{
  return sub_191CE24A8(a1, a2);
}

uint64_t sub_191CE24A8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_191BEB190();
  unint64_t v7 = v6;
  char v8 = v5;
  if (v9)
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    if (v5) {
      goto LABEL_5;
    }
    goto LABEL_7;
  }
  unint64_t v10 = result;
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = sub_191AF8920(v11);
  uint64_t result = swift_bridgeObjectRelease();
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v10 >= *(void *)(v12 + 16))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_191AFEE28(v12 + 40 * v10 + 32, a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v8)
  {
LABEL_5:
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return result;
  }
LABEL_7:
  uint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = sub_191AF8920(v13);
  uint64_t result = swift_bridgeObjectRelease();
  if ((v7 & 0x8000000000000000) != 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v7 >= *(void *)(v14 + 16))
  {
LABEL_15:
    __break(1u);
    return result;
  }
  sub_191AFEE28(v14 + 40 * v7 + 32, a2);

  return swift_bridgeObjectRelease();
}

unint64_t TimelineViewCollection.entriesBookending(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result = sub_191CE2B9C(a3, a4, a5);
  unint64_t v12 = v11;
  char v13 = v10;
  if (v14)
  {
    *(void *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v15 = result;
    unint64_t result = sub_191CE3A70(&v15, a4, a5, a1);
    if (v13)
    {
LABEL_3:
      *(void *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return result;
    }
  }
  unint64_t v15 = v12;
  return sub_191CE3A70(&v15, a4, a5, a2);
}

double sub_191CE26B8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  v27[1] = a6;
  uint64_t v13 = *(void *)(a4 - 8);
  MEMORY[0x1F4188790](a1);
  unint64_t v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_191CF3178();
  uint64_t v16 = *(void *)(v28 - 8);
  MEMORY[0x1F4188790](v28);
  id v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a5 + 8))(a3, a5);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a2, a4);
  uint64_t v19 = sub_191CF5038();
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(a5 + 16))(v29, a3, a5);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 8))(a1, a3);
  uint64_t v20 = v29[0];
  uint64_t v21 = v29[1];
  LOBYTE(a2) = v30;
  uint64_t v22 = (int *)type metadata accessor for ViewableTimelineEntry();
  uint64_t v23 = a7 + v22[7];
  uint64_t v24 = type metadata accessor for WidgetViewMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v23, 1, 1, v24);
  (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a7, v18, v28);
  *(void *)(a7 + v22[5]) = v19;
  uint64_t v25 = a7 + v22[6];
  *(void *)uint64_t v25 = v20;
  *(void *)(v25 + 8) = v21;
  *(unsigned char *)(v25 + 16) = a2;
  double result = 0.0;
  *(_OWORD *)(a7 + v22[8]) = xmmword_191CF8430;
  return result;
}

uint64_t ViewableTimelineEntry.init(date:view:relevance:viewMetadata:entryData:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13 = *a3;
  uint64_t v14 = a3[1];
  char v15 = *((unsigned char *)a3 + 16);
  uint64_t v16 = sub_191CF3178();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(a7, a1, v16);
  uint64_t v17 = (int *)type metadata accessor for ViewableTimelineEntry();
  *(void *)(a7 + v17[5]) = a2;
  uint64_t v18 = a7 + v17[6];
  *(void *)uint64_t v18 = v13;
  *(void *)(v18 + 8) = v14;
  *(unsigned char *)(v18 + 16) = v15;
  uint64_t result = sub_191B015B0(a4, a7 + v17[7], &qword_1EB44A180);
  uint64_t v20 = (void *)(a7 + v17[8]);
  *uint64_t v20 = a5;
  v20[1] = a6;
  return result;
}

double sub_191CE2A38@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1F4188790](a1);
  char v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191CF3108();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t v9 = sub_191CF5038();
  char v10 = (int *)type metadata accessor for ViewableTimelineEntry();
  uint64_t v11 = a3 + v10[7];
  uint64_t v12 = type metadata accessor for WidgetViewMetadata();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  *(void *)(a3 + v10[5]) = v9;
  uint64_t v13 = a3 + v10[6];
  *(void *)uint64_t v13 = 0;
  *(void *)(v13 + 8) = 0;
  *(unsigned char *)(v13 + 16) = 1;
  double result = 0.0;
  *(_OWORD *)(a3 + v10[8]) = xmmword_191CF8430;
  return result;
}

uint64_t sub_191CE2B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 56);
  uint64_t v7 = v6(a2, a3);
  v16[2] = a1;
  uint64_t v8 = sub_191BED0B4((uint64_t (*)(uint64_t))sub_191BED094, (uint64_t)v16, v7);
  char v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t v11 = v6(a2, a3);
  if (v10)
  {
    uint64_t v12 = *(void *)(v11 + 16);
    swift_bridgeObjectRelease();
    BOOL v13 = v12 == 0;
LABEL_8:
    char v18 = v10 & 1;
    BOOL v17 = v13;
    return v8;
  }
  uint64_t v14 = *(void *)(v6(a2, a3) + 16);
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if (__OFSUB__(v14 - 1, v8))
  {
    __break(1u);
  }
  else
  {
    if (v14 - 1 == v8)
    {
      BOOL v13 = 1;
      goto LABEL_8;
    }
    if (!__OFADD__(v8, 1))
    {
      BOOL v13 = 0;
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_191CE2CEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return TimelineViewCollection.viewableEntry(for:in:)(a1, a2, a3, a4);
}

uint64_t ViewableTimelineEntry.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_191CF3178();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t ViewableTimelineEntry.view.getter()
{
  type metadata accessor for ViewableTimelineEntry();

  return swift_retain();
}

__n128 ViewableTimelineEntry.relevance.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v3 = (__n128 *)(v1 + *(int *)(type metadata accessor for ViewableTimelineEntry() + 24));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a1 = *v3;
  a1[1].n128_u8[0] = v4;
  return result;
}

uint64_t ViewableTimelineEntry.viewMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for ViewableTimelineEntry() + 28);

  return sub_191CE3B48(v3, a1);
}

uint64_t ViewableTimelineEntry.entryData.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for ViewableTimelineEntry() + 32);
  uint64_t v2 = *(void *)v1;
  sub_191B169E8(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

__n128 sub_191CE2E6C@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3 = (__n128 *)(v2 + *(int *)(a1 + 24));
  unsigned __int8 v4 = v3[1].n128_u8[0];
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_191CE2E88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v50 = a3;
  uint64_t v6 = sub_191CF2EA8();
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v43 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = *(void *)(a1 - 8);
  MEMORY[0x1F4188790](v7);
  char v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  MEMORY[0x1F4188790](v11 - 8);
  BOOL v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for TimelineReloadPolicy();
  MEMORY[0x1F4188790](v14 - 8);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_191CF3178();
  uint64_t v49 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v44 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v42 - v21;
  MEMORY[0x1F4188790](v20);
  uint64_t v24 = (char *)&v42 - v23;
  uint64_t v25 = a2;
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  sub_191B015B0((uint64_t)v16, (uint64_t)v13, &qword_1EB44B520);
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  uint64_t v27 = v10;
  uint64_t v28 = v10;
  uint64_t v29 = v49;
  uint64_t v47 = v3;
  v26(v28, v3, a1);
  int v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48))(v13, 1, v17);
  uint64_t v48 = v25;
  if (v30 == 1)
  {
    uint64_t v31 = v43;
    (*(void (**)(uint64_t, uint64_t))(v25 + 48))(a1, v25);
    sub_191CF2E68();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v31, v46);
    uint64_t v32 = v27;
    uint64_t v33 = a1;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v32, a1);
    sub_191C0B9B8((uint64_t)v13);
  }
  else
  {
    uint64_t v34 = v27;
    uint64_t v33 = a1;
    (*(void (**)(char *, uint64_t))(v51 + 8))(v34, a1);
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v24, v13, v17);
  }
  sub_191CF3118();
  char v35 = sub_191CF3158();
  uint64_t v36 = *(void (**)(char *, uint64_t))(v29 + 8);
  v36(v22, v17);
  if (v35)
  {
    uint64_t v37 = 1;
    uint64_t v38 = v50;
  }
  else
  {
    unsigned int v39 = v44;
    (*(void (**)(uint64_t))(v48 + 40))(v33);
    sub_191CE3BB0();
    if (sub_191CF52A8()) {
      unsigned int v40 = v39;
    }
    else {
      unsigned int v40 = v24;
    }
    uint64_t v38 = v50;
    (*(void (**)(uint64_t, char *, uint64_t))(v29 + 16))(v50, v40, v17);
    v36(v39, v17);
    uint64_t v37 = 0;
  }
  v36(v24, v17);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v38, v37, 1, v17);
}

uint64_t TimelineViewCollection.effectiveReloadDate.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_191CF3178();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  BOOL v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x1F4188790](v11);
  uint64_t v16 = (char *)&v23 - v15;
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v23 - v17;
  sub_191CE2E88(a1, a2, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_191C0B9B8((uint64_t)v8);
    uint64_t v19 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v18, v8, v9);
    (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a1, a2);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
    sub_191CF3128();
    uint64_t v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v13, v9);
    sub_191CE3BB0();
    if (sub_191CF52A8()) {
      uint64_t v21 = v16;
    }
    else {
      uint64_t v21 = v18;
    }
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 16))(a3, v21, v9);
    v20(v16, v9);
    v20(v18, v9);
    uint64_t v19 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a3, v19, 1, v9);
}

uint64_t TimelineViewCollection.staleDate.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191CE2E88(a1, a2, (uint64_t)v8);
  uint64_t v9 = sub_191CF3178();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_191C0B9B8((uint64_t)v8);
    uint64_t v11 = 1;
  }
  else
  {
    sub_191CF3128();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    uint64_t v11 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a3, v11, 1, v9);
}

uint64_t TimelineViewCollection.isStale.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_191CF3178();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v17 - v12;
  TimelineViewCollection.staleDate.getter(a1, a2, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_191C0B9B8((uint64_t)v6);
    char v14 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    sub_191CF3168();
    char v14 = sub_191CF3148();
    uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
    v15(v11, v7);
    v15(v13, v7);
  }
  return v14 & 1;
}

BOOL sub_191CE393C(void *a1)
{
  uint64_t v2 = sub_191CF3178();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1[3];
  uint64_t v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  sub_191CE3BB0();
  LOBYTE(a1) = sub_191CF5298();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (a1 & 1) == 0;
}

uint64_t sub_191CE3A70@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  unint64_t v5 = *a1;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a2, a3);
  if ((v5 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v5 < *(void *)(result + 16))
  {
    sub_191AFEE28(result + 40 * v5 + 32, a4);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ViewableTimelineEntry()
{
  uint64_t result = qword_1EB44B7A8;
  if (!qword_1EB44B7A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_191CE3B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_191CE3BB0()
{
  unint64_t result = qword_1EB447138;
  if (!qword_1EB447138)
  {
    sub_191CF3178();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB447138);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for ViewableTimelineEntry(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_191CF3178();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
    v9[16] = v10[16];
    uint64_t v11 = a3[7];
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for WidgetViewMetadata();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
    swift_retain();
    if (v16(v13, 1, v14))
    {
      uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180);
      memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      *uint64_t v12 = *v13;
      *(_WORD *)(v12 + 1) = *(_WORD *)(v13 + 1);
      uint64_t v19 = *(int *)(v14 + 28);
      __dst = &v12[v19];
      uint64_t v20 = &v13[v19];
      uint64_t v21 = sub_191CF3078();
      uint64_t v22 = *(void *)(v21 - 8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
      {
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
        memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v22 + 16))(__dst, v20, v21);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
      }
      uint64_t v24 = *(int *)(v14 + 32);
      uint64_t v25 = &v12[v24];
      uint64_t v26 = &v13[v24];
      uint64_t v27 = sub_191CF4898();
      uint64_t v28 = *(void *)(v27 - 8);
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
      {
        uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40);
        memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
      }
      else
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v28 + 16))(v25, v26, v27);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      }
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    uint64_t v30 = a3[8];
    uint64_t v31 = (char *)a1 + v30;
    uint64_t v32 = (char *)a2 + v30;
    unint64_t v33 = *((void *)v32 + 1);
    if (v33 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
    }
    else
    {
      uint64_t v34 = *(void *)v32;
      sub_191B15F88(*(void *)v32, *((void *)v32 + 1));
      *(void *)uint64_t v31 = v34;
      *((void *)v31 + 1) = v33;
    }
  }
  return a1;
}

uint64_t destroy for ViewableTimelineEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_191CF3178();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  uint64_t v6 = type metadata accessor for WidgetViewMetadata();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = v5 + *(int *)(v6 + 28);
    uint64_t v9 = sub_191CF3078();
    uint64_t v10 = *(void *)(v9 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    }
    uint64_t v11 = v5 + *(int *)(v6 + 32);
    uint64_t v12 = sub_191CF4898();
    uint64_t v13 = *(void *)(v12 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
    if (!result) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    }
  }
  uint64_t v14 = (uint64_t *)(a1 + *(int *)(a2 + 32));
  unint64_t v15 = v14[1];
  if (v15 >> 60 != 15)
  {
    uint64_t v16 = *v14;
    return sub_191B1603C(v16, v15);
  }
  return result;
}

uint64_t initializeWithCopy for ViewableTimelineEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_191CF3178();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  uint64_t v10 = a3[7];
  uint64_t v11 = (unsigned char *)(a1 + v10);
  uint64_t v12 = (unsigned char *)(a2 + v10);
  uint64_t v13 = type metadata accessor for WidgetViewMetadata();
  uint64_t v14 = *(void *)(v13 - 8);
  unint64_t v15 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v14 + 48);
  swift_retain();
  if (v15(v12, 1, v13))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180);
    memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    unsigned char *v11 = *v12;
    *(_WORD *)(v11 + 1) = *(_WORD *)(v12 + 1);
    uint64_t v17 = *(int *)(v13 + 28);
    __dst = &v11[v17];
    uint64_t v18 = &v12[v17];
    uint64_t v19 = sub_191CF3078();
    uint64_t v20 = *(void *)(v19 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
      memcpy(__dst, v18, *(void *)(*(void *)(v21 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v20 + 16))(__dst, v18, v19);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v20 + 56))(__dst, 0, 1, v19);
    }
    uint64_t v22 = *(int *)(v13 + 32);
    uint64_t v23 = &v11[v22];
    uint64_t v24 = &v12[v22];
    uint64_t v25 = sub_191CF4898();
    uint64_t v26 = *(void *)(v25 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40);
      memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  uint64_t v28 = a3[8];
  uint64_t v29 = a1 + v28;
  uint64_t v30 = (uint64_t *)(a2 + v28);
  unint64_t v31 = v30[1];
  if (v31 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v29 = *(_OWORD *)v30;
  }
  else
  {
    uint64_t v32 = *v30;
    sub_191B15F88(*v30, v30[1]);
    *(void *)uint64_t v29 = v32;
    *(void *)(v29 + 8) = v31;
  }
  return a1;
}

uint64_t assignWithCopy for ViewableTimelineEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_191CF3178();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_retain();
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (long long *)(a2 + v7);
  long long v10 = *v9;
  *(unsigned char *)(v8 + 16) = *((unsigned char *)v9 + 16);
  *(_OWORD *)uint64_t v8 = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = (unsigned char *)(a1 + v11);
  uint64_t v13 = (unsigned char *)(a2 + v11);
  uint64_t v14 = type metadata accessor for WidgetViewMetadata();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (v18)
    {
      sub_191B29B14((uint64_t)v12);
      goto LABEL_7;
    }
    *uint64_t v12 = *v13;
    v12[1] = v13[1];
    v12[2] = v13[2];
    uint64_t v27 = *(int *)(v14 + 28);
    uint64_t v28 = &v12[v27];
    __dsta = &v13[v27];
    uint64_t v29 = sub_191CF3078();
    uint64_t v57 = *(void *)(v29 - 8);
    uint64_t v58 = v28;
    uint64_t v30 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v57 + 48);
    LODWORD(v28) = v30(v28, 1, v29);
    int v31 = v30(__dsta, 1, v29);
    if (v28)
    {
      if (!v31)
      {
        (*(void (**)(void *, unsigned char *, uint64_t))(v57 + 16))(v58, __dsta, v29);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v57 + 56))(v58, 0, 1, v29);
        goto LABEL_30;
      }
      size_t v32 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8) + 64);
      unint64_t v33 = v58;
    }
    else
    {
      if (!v31)
      {
        (*(void (**)(void *, unsigned char *, uint64_t))(v57 + 24))(v58, __dsta, v29);
        goto LABEL_30;
      }
      (*(void (**)(void *, uint64_t))(v57 + 8))(v58, v29);
      size_t v32 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8) + 64);
      unint64_t v33 = v58;
    }
    memcpy(v33, __dsta, v32);
LABEL_30:
    uint64_t v49 = *(int *)(v14 + 32);
    uint64_t v50 = &v12[v49];
    uint64_t v51 = &v13[v49];
    uint64_t v52 = sub_191CF4898();
    uint64_t v53 = *(void *)(v52 - 8);
    unsigned int v54 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v53 + 48);
    int v55 = v54(v50, 1, v52);
    int v56 = v54(v51, 1, v52);
    if (v55)
    {
      if (!v56)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v53 + 16))(v50, v51, v52);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v53 + 56))(v50, 0, 1, v52);
        goto LABEL_17;
      }
    }
    else
    {
      if (!v56)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v53 + 24))(v50, v51, v52);
        goto LABEL_17;
      }
      (*(void (**)(unsigned char *, uint64_t))(v53 + 8))(v50, v52);
    }
    size_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40) - 8) + 64);
    uint64_t v25 = v50;
    uint64_t v26 = v51;
LABEL_8:
    memcpy(v25, v26, v24);
    goto LABEL_17;
  }
  if (v18)
  {
LABEL_7:
    size_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180) - 8) + 64);
    uint64_t v25 = v12;
    uint64_t v26 = v13;
    goto LABEL_8;
  }
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  v12[2] = v13[2];
  uint64_t v19 = *(int *)(v14 + 28);
  __dst = &v12[v19];
  uint64_t v20 = &v13[v19];
  uint64_t v21 = sub_191CF3078();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(__dst, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v22 + 16))(__dst, v20, v21);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
  }
  uint64_t v34 = *(int *)(v14 + 32);
  char v35 = &v12[v34];
  uint64_t v36 = &v13[v34];
  uint64_t v37 = sub_191CF4898();
  uint64_t v38 = *(void *)(v37 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v38 + 48))(v36, 1, v37))
  {
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40);
    memcpy(v35, v36, *(void *)(*(void *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v38 + 16))(v35, v36, v37);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v38 + 56))(v35, 0, 1, v37);
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_17:
  uint64_t v40 = a3[8];
  uint64_t v41 = (uint64_t *)(a1 + v40);
  uint64_t v42 = (uint64_t *)(a2 + v40);
  unint64_t v43 = *(void *)(a2 + v40 + 8);
  if (*(void *)(a1 + v40 + 8) >> 60 != 15)
  {
    if (v43 >> 60 != 15)
    {
      uint64_t v45 = *v42;
      sub_191B15F88(v45, v43);
      uint64_t v46 = *v41;
      unint64_t v47 = v41[1];
      *uint64_t v41 = v45;
      v41[1] = v43;
      sub_191B1603C(v46, v47);
      return a1;
    }
    sub_191B71DDC((uint64_t)v41);
    goto LABEL_22;
  }
  if (v43 >> 60 == 15)
  {
LABEL_22:
    *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
    return a1;
  }
  uint64_t v44 = *v42;
  sub_191B15F88(v44, v43);
  *uint64_t v41 = v44;
  v41[1] = v43;
  return a1;
}

uint64_t initializeWithTake for ViewableTimelineEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_191CF3178();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  uint64_t v10 = a3[7];
  uint64_t v11 = (unsigned char *)(a1 + v10);
  uint64_t v12 = (unsigned char *)(a2 + v10);
  uint64_t v13 = type metadata accessor for WidgetViewMetadata();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
  }
  else
  {
    unsigned char *v11 = *v12;
    *(_WORD *)(v11 + 1) = *(_WORD *)(v12 + 1);
    uint64_t v16 = *(int *)(v13 + 28);
    __dst = &v11[v16];
    int v17 = &v12[v16];
    uint64_t v18 = sub_191CF3078();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
      memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 32))(__dst, v17, v18);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
    }
    uint64_t v21 = *(int *)(v13 + 32);
    uint64_t v22 = &v11[v21];
    uint64_t v23 = &v12[v21];
    uint64_t v24 = sub_191CF4898();
    uint64_t v25 = *(void *)(v24 - 8);
    if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
    {
      uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40);
      memcpy(v22, v23, *(void *)(*(void *)(v26 - 8) + 64));
    }
    else
    {
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for ViewableTimelineEntry(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_191CF3178();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = a3[7];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = (unsigned char *)(a1 + v8);
  uint64_t v12 = (unsigned char *)(a2 + v8);
  uint64_t v13 = type metadata accessor for WidgetViewMetadata();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (v17)
    {
      sub_191B29B14((uint64_t)v11);
      goto LABEL_7;
    }
    unsigned char *v11 = *v12;
    v11[1] = v12[1];
    v11[2] = v12[2];
    uint64_t v26 = *(int *)(v13 + 28);
    uint64_t v27 = &v11[v26];
    __dsta = &v12[v26];
    uint64_t v28 = sub_191CF3078();
    uint64_t v54 = *(void *)(v28 - 8);
    int v55 = v27;
    uint64_t v29 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v54 + 48);
    LODWORD(v27) = v29(v27, 1, v28);
    int v30 = v29(__dsta, 1, v28);
    if (v27)
    {
      if (!v30)
      {
        (*(void (**)(void *, unsigned char *, uint64_t))(v54 + 32))(v55, __dsta, v28);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v54 + 56))(v55, 0, 1, v28);
        goto LABEL_28;
      }
      size_t v31 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8) + 64);
      size_t v32 = v55;
    }
    else
    {
      if (!v30)
      {
        (*(void (**)(void *, unsigned char *, uint64_t))(v54 + 40))(v55, __dsta, v28);
        goto LABEL_28;
      }
      (*(void (**)(void *, uint64_t))(v54 + 8))(v55, v28);
      size_t v31 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8) + 64);
      size_t v32 = v55;
    }
    memcpy(v32, __dsta, v31);
LABEL_28:
    uint64_t v46 = *(int *)(v13 + 32);
    unint64_t v47 = &v11[v46];
    uint64_t v48 = &v12[v46];
    uint64_t v49 = sub_191CF4898();
    uint64_t v50 = *(void *)(v49 - 8);
    uint64_t v51 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v50 + 48);
    int v52 = v51(v47, 1, v49);
    int v53 = v51(v48, 1, v49);
    if (v52)
    {
      if (!v53)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v50 + 32))(v47, v48, v49);
        (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
        goto LABEL_17;
      }
    }
    else
    {
      if (!v53)
      {
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v50 + 40))(v47, v48, v49);
        goto LABEL_17;
      }
      (*(void (**)(unsigned char *, uint64_t))(v50 + 8))(v47, v49);
    }
    size_t v23 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40) - 8) + 64);
    uint64_t v24 = v47;
    uint64_t v25 = v48;
LABEL_8:
    memcpy(v24, v25, v23);
    goto LABEL_17;
  }
  if (v17)
  {
LABEL_7:
    size_t v23 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180) - 8) + 64);
    uint64_t v24 = v11;
    uint64_t v25 = v12;
    goto LABEL_8;
  }
  unsigned char *v11 = *v12;
  *(_WORD *)(v11 + 1) = *(_WORD *)(v12 + 1);
  uint64_t v18 = *(int *)(v13 + 28);
  __dst = &v11[v18];
  uint64_t v19 = &v12[v18];
  uint64_t v20 = sub_191CF3078();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
  {
    uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(__dst, v19, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v21 + 32))(__dst, v19, v20);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
  }
  uint64_t v33 = *(int *)(v13 + 32);
  uint64_t v34 = &v11[v33];
  char v35 = &v12[v33];
  uint64_t v36 = sub_191CF4898();
  uint64_t v37 = *(void *)(v36 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
  {
    uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44AF40);
    memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v37 + 32))(v34, v35, v36);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
  }
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_17:
  uint64_t v39 = a3[8];
  uint64_t v40 = (uint64_t *)(a1 + v39);
  uint64_t v41 = (uint64_t *)(a2 + v39);
  unint64_t v42 = *(void *)(a1 + v39 + 8);
  if (v42 >> 60 != 15)
  {
    unint64_t v43 = v41[1];
    if (v43 >> 60 != 15)
    {
      uint64_t v44 = *v40;
      *uint64_t v40 = *v41;
      v40[1] = v43;
      sub_191B1603C(v44, v42);
      return a1;
    }
    sub_191B71DDC((uint64_t)v40);
  }
  *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
  return a1;
}

uint64_t getEnumTagSinglePayload for ViewableTimelineEntry(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_191CE5660);
}

uint64_t sub_191CE5660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_191CF3178();
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
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t storeEnumTagSinglePayload for ViewableTimelineEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_191CE57A4);
}

uint64_t sub_191CE57A4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_191CF3178();
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
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A180);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_191CE58D4()
{
  sub_191CF3178();
  if (v0 <= 0x3F)
  {
    sub_191CE59BC();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_191CE59BC()
{
  if (!qword_1EB44A188)
  {
    type metadata accessor for WidgetViewMetadata();
    unint64_t v0 = sub_191CF5BC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB44A188);
    }
  }
}

uint64_t sub_191CE5A14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TimelineViewCollection.originatingBundle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TimelineViewCollection.widget.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TimelineViewCollection.metrics.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TimelineViewCollection.environment.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TimelineViewCollection.creationDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TimelineViewCollection.dateRange.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TimelineViewCollection.entries.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TimelineViewCollection.reloadPolicy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of TimelineViewCollection.protectionLevel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of TimelineViewCollection.requiresReload.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of TimelineViewCollection.copyWithoutRenderData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of TimelineViewCollection.viewableEntry(for:in:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of TimelineViewCollection.viewableEntry(for:in:ignoringEnvironmentKeys:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 104))();
}

uint64_t dispatch thunk of TimelineViewCollection.entriesBookending(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 112))();
}

uint64_t dispatch thunk of ArchivableTimelineViewCollection.enumeratedViewableEntriesAndEnvironments()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_191CE5B7C()
{
  return sub_191AF906C() & 1;
}

uint64_t sub_191CE5B9C(uint64_t a1, uint64_t a2)
{
  return (*(void *)a1 == *(void *)a2) & ~(*(unsigned __int8 *)(a1 + 8) ^ *(unsigned __int8 *)(a2 + 8));
}

uint64_t ActivityArchivedViewCollection.ViewIndex.description.getter()
{
  return sub_191CF62C8();
}

uint64_t static ActivityArchivedViewCollection.ViewIndex.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*(void *)a1 == *(void *)a2) {
      char v2 = *(unsigned char *)(a2 + 8);
    }
    else {
      char v2 = 0;
    }
    if ((v2 & 1) == 0) {
      return 0;
    }
  }
  else
  {
    if (*(void *)a1 == *(void *)a2) {
      char v4 = *(unsigned char *)(a2 + 8);
    }
    else {
      char v4 = 1;
    }
    if (v4) {
      return 0;
    }
  }
  return 1;
}

uint64_t sub_191CE5C44(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*(void *)a1 == *(void *)a2) {
      int v2 = *(unsigned __int8 *)(a2 + 8);
    }
    else {
      int v2 = 0;
    }
    if (v2 == 1) {
      return 1;
    }
  }
  else
  {
    if (*(void *)a1 == *(void *)a2) {
      char v4 = *(unsigned char *)(a2 + 8);
    }
    else {
      char v4 = 1;
    }
    if ((v4 & 1) == 0) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_191CE5C80()
{
  return sub_191CF62C8();
}

void ActivityArchivedViewCollection.ViewEntry.viewIndex.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(unsigned char *)(a1 + 8) = v2;
}

uint64_t ActivityArchivedViewCollection.ViewEntry.view.getter()
{
  return swift_retain();
}

__n128 ActivityArchivedViewCollection.ViewEntry.metadata.getter@<Q0>(uint64_t a1@<X8>)
{
  __int16 v2 = *(_WORD *)(v1 + 104);
  char v3 = *(unsigned char *)(v1 + 106);
  long long v4 = *(_OWORD *)(v1 + 40);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 24);
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(v1 + 72);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 56);
  *(_OWORD *)(a1 + 48) = v5;
  __n128 result = *(__n128 *)(v1 + 88);
  *(__n128 *)(a1 + 64) = result;
  *(unsigned char *)(a1 + 82) = v3;
  *(_WORD *)(a1 + 80) = v2;
  return result;
}

double ActivityArchivedViewCollection.ViewEntry.metrics.getter@<D0>(uint64_t a1@<X8>)
{
  double result = *(double *)(v1 + 144);
  long long v3 = *(_OWORD *)(v1 + 128);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(a1 + 16) = v3;
  *(double *)(a1 + 32) = result;
  return result;
}

uint64_t ActivityArchivedViewCollection.payloadID.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48) + 60));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ActivityArchivedViewCollection.isAlerting.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48) + 64));
}

uint64_t ActivityArchivedViewCollection.isChatty.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48) + 68));
}

id ActivityArchivedViewCollection.environment.getter@<X0>(void *a1@<X8>)
{
  long long v3 = *(void **)(v1 + *(int *)(type metadata accessor for ActivityViewStates.Metadata(0) + 20));
  *a1 = v3;

  return v3;
}

id ActivityArchivedViewCollection.jindoKeyColor.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
  MEMORY[0x1F4188790](v1 - 8);
  long long v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  sub_191B01614(v0 + *(int *)(v4 + 52), (uint64_t)v3, &qword_1E92E07C8);
  uint64_t v5 = type metadata accessor for JindoViewStates.Metadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) == 1)
  {
    sub_191B01770((uint64_t)v3, &qword_1E92E07C8);
    return 0;
  }
  else
  {
    char v7 = v3[32];
    char v8 = v3[33];
    sub_191CE8250((uint64_t)v3, type metadata accessor for JindoViewStates.Metadata);
    id v6 = 0;
    if ((v8 & 1) == 0 && (v7 & 1) == 0)
    {
      uint64_t v9 = (void *)sub_191CF4DC8();
      id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1618]), sel_initWithCGColor_, v9);
    }
  }
  return v6;
}

uint64_t ActivityArchivedViewCollection.jindoWidgetURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  sub_191B01614(v1 + *(int *)(v6 + 52), (uint64_t)v5, &qword_1E92E07C8);
  uint64_t v7 = type metadata accessor for JindoViewStates.Metadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) == 1)
  {
    sub_191B01770((uint64_t)v5, &qword_1E92E07C8);
    uint64_t v8 = sub_191CF3078();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(a1, 1, 1, v8);
  }
  else
  {
    sub_191B01614((uint64_t)&v5[*(int *)(v7 + 28)], a1, (uint64_t *)&unk_1EB44BBA8);
    return sub_191CE8250((uint64_t)v5, type metadata accessor for JindoViewStates.Metadata);
  }
}

void ActivityArchivedViewCollection.init(contentsOf:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_191CF44B8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)v13 - v10;
  id v12 = a1;
  sub_191CF4448();
  if (v2)
  {
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    sub_191CE6238((unint64_t)v9, a2);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
}

uint64_t sub_191CE6238@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v46 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for JindoViewStates.Metadata(0);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v42 = (uint64_t)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for ActivityArchivedViewCollection();
  uint64_t v12 = a2 + *(int *)(v11 + 24);
  uint64_t v13 = type metadata accessor for JindoArchivedViewCollection();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, void, uint64_t, uint64_t))(v14 + 56);
  uint64_t v40 = v13;
  uint64_t v41 = (void *)v12;
  uint64_t v38 = v14 + 56;
  uint64_t v39 = v15;
  ((void (*)(uint64_t, uint64_t, uint64_t))v15)(v12, 1, 1);
  uint64_t v16 = *(int *)(v11 + 20);
  uint64_t v47 = a2;
  uint64_t v17 = a2 + v16;
  uint64_t v18 = sub_191CF44B8();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v36 = *(void (**)(uint64_t, unint64_t))(v19 + 16);
  uint64_t v37 = v17;
  uint64_t v43 = v18;
  v36(v17, a1);
  sub_191CF2E28();
  swift_allocObject();
  sub_191CF2E18();
  unint64_t v20 = a1;
  uint64_t v21 = sub_191CF4458();
  if (v22 >> 60 == 15)
  {
    __break(1u);
    sub_191B170C8(v17, a1);
    swift_release();
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    uint64_t v23 = v21;
    unint64_t v24 = v22;
    sub_191CEB0A0();
    sub_191CF2E08();
    unint64_t v25 = v20;
    uint64_t v26 = v43;
    (*(void (**)(unint64_t, uint64_t))(v19 + 8))(v25, v43);
    sub_191B170C8(v23, v24);
    swift_release();
    uint64_t v27 = v47;
    sub_191B015B0((uint64_t)v10, v47, &qword_1E92E0B48);
    uint64_t v28 = v46;
    sub_191B01614(v27 + *(int *)(v8 + 52), v46, &qword_1E92E07C8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v28, 1, v45) == 1)
    {
      return sub_191B01770(v28, &qword_1E92E07C8);
    }
    else
    {
      uint64_t v30 = v28;
      uint64_t v31 = v42;
      sub_191CEB0FC(v30, v42);
      size_t v32 = v41;
      sub_191B01770((uint64_t)v41, &qword_1E92E0B90);
      uint64_t v33 = *(void *)(v27 + *(int *)(v8 + 56));
      uint64_t v34 = v40;
      sub_191CEB0FC(v31, (uint64_t)v32 + *(int *)(v40 + 20));
      ((void (*)(char *, uint64_t, uint64_t))v36)((char *)v32 + *(int *)(v34 + 24), v37, v26);
      *size_t v32 = v33;
      return v39(v32, 0, 1, v34);
    }
  }
  return result;
}

uint64_t ActivityArchivedViewCollection.init(contentsOf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v4 = sub_191CF3078();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_191CF44B8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)&v16 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_191CF4438();
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_191CE6238((unint64_t)v12, v17);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

uint64_t ActivityArchivedViewCollection.init(contentsOf:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_191CF44B8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v13 = (char *)&v15 - v12;
  sub_191B15F88(a1, a2);
  sub_191CF4498();
  if (v3) {
    return sub_191B1603C(a1, a2);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  sub_191CE6238((unint64_t)v11, a3);
  sub_191B1603C(a1, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t ActivityArchivedViewCollection.metrics(viewIndex:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (void *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = *(void *)a1;
  if (*(unsigned char *)(a1 + 8) != 1)
  {
    uint64_t v15 = type metadata accessor for ActivityArchivedViewCollection();
    sub_191B01614(v2 + *(int *)(v15 + 24), (uint64_t)v7, &qword_1E92E0B90);
    uint64_t v16 = type metadata accessor for JindoArchivedViewCollection();
    uint64_t result = (*(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v7, 1, v16);
    if (result != 1)
    {
      uint64_t result = v8 - *v7;
      if (!__OFSUB__(v8, *v7))
      {
        uint64_t v17 = *(void *)((char *)v7 + *(int *)(v16 + 20) + 8);
        if (*(void *)(v17 + 16))
        {
          unint64_t v18 = sub_191B1CBF4(result);
          if (v19)
          {
            uint64_t v20 = *(void *)(v17 + 56) + 88 * v18;
            long long v21 = *(_OWORD *)v20;
            long long v24 = *(_OWORD *)(v20 + 16);
            long long v25 = v21;
            uint64_t v22 = *(void *)(v20 + 32);
            uint64_t result = sub_191CE8250((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
            long long v23 = v24;
            *(_OWORD *)a2 = v25;
            *(_OWORD *)(a2 + 16) = v23;
            *(void *)(a2 + 32) = v22;
            *(unsigned char *)(a2 + 40) = 0;
            return result;
          }
        }
        uint64_t result = sub_191CE8250((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
        *(_OWORD *)a2 = 0u;
        *(_OWORD *)(a2 + 16) = 0u;
        *(void *)(a2 + 32) = 0;
        goto LABEL_12;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  uint64_t result = type metadata accessor for ActivityViewStates.Metadata(0);
  uint64_t v10 = *(void *)(v2 + *(int *)(result + 28));
  if (*(void *)(v10 + 16))
  {
    uint64_t result = sub_191B1CBF4(v8);
    if (v11)
    {
      uint64_t v12 = *(void *)(v10 + 56) + 88 * result;
      uint64_t v13 = *(void *)(v12 + 32);
      long long v14 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)a2 = *(_OWORD *)v12;
      *(_OWORD *)(a2 + 16) = v14;
      *(void *)(a2 + 32) = v13;
      *(unsigned char *)(a2 + 40) = 0;
      return result;
    }
  }
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
LABEL_12:
  *(unsigned char *)(a2 + 40) = 1;
  return result;
}

uint64_t ActivityArchivedViewCollection.index(for:environmentAtIndex:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  int v7 = *a1;
  uint64_t result = type metadata accessor for ActivityViewStates.Metadata(0);
  uint64_t v9 = *(void *)(v4 + *(int *)(result + 24));
  uint64_t v10 = *(void *)(v9 + 16);
  if (!v10) {
    goto LABEL_12;
  }
  uint64_t v11 = 0;
  uint64_t v12 = v9 + 32;
  while (1)
  {
    int v13 = *(unsigned __int8 *)(v12 + v11);
    if (v13 != 4) {
      break;
    }
    if (v7 == 4) {
      goto LABEL_8;
    }
LABEL_4:
    if (v10 == ++v11) {
      goto LABEL_12;
    }
  }
  if (v7 == 4 || v13 != v7) {
    goto LABEL_4;
  }
LABEL_8:
  uint64_t result = WidgetEnvironment.enumeratedCount()();
  uint64_t v14 = v11 * result;
  if ((unsigned __int128)(v11 * (__int128)result) >> 64 != (v11 * result) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v15 = v14 + a2;
  if (__OFADD__(v14, a2))
  {
LABEL_15:
    __break(1u);
    return result;
  }
  type metadata accessor for ActivityArchivedViewCollection();
  sub_191CF44B8();
  sub_191CEB058(&qword_1E92E1008, MEMORY[0x1E4F3D720]);
  sub_191CF5788();
  sub_191CF57E8();
  uint64_t result = sub_191CF57D8();
  if (v15 < result)
  {
    *(void *)a3 = v15;
    char v16 = 1;
    goto LABEL_13;
  }
LABEL_12:
  *(void *)a3 = 0;
  char v16 = -1;
LABEL_13:
  *(unsigned char *)(a3 + 8) = v16;
  return result;
}

void ActivityArchivedViewCollection.index(for:in:ignoring:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, int64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
  MEMORY[0x1F4188790](v13 - 8);
  uint64_t v15 = (id *)((char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v16 = *a1;
  if (v16 == 4)
  {
    id v29 = *(id *)(v5 + *(int *)(type metadata accessor for ActivityViewStates.Metadata(0) + 20));
    uint64_t v17 = WidgetEnvironment.findEnumeratedIndex(matching:ignoring:)(a2, a3);
    if ((v18 & 1) == 0)
    {
      LOBYTE(v29) = 4;
      ActivityArchivedViewCollection.index(for:environmentAtIndex:)((unsigned __int8 *)&v29, (uint64_t)v17, a4);
      return;
    }
    goto LABEL_10;
  }
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  sub_191B01614(v5 + *(int *)(v19 + 52), (uint64_t)v15, &qword_1E92E07C8);
  uint64_t v20 = type metadata accessor for JindoViewStates.Metadata(0);
  if ((*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v20 - 8) + 48))(v15, 1, v20) == 1)
  {
    long long v21 = &qword_1E92E07C8;
    uint64_t v22 = (uint64_t)v15;
LABEL_9:
    sub_191B01770(v22, v21);
    goto LABEL_10;
  }
  id v23 = *v15;
  sub_191CE8250((uint64_t)v15, type metadata accessor for JindoViewStates.Metadata);
  id v29 = v23;
  long long v24 = WidgetEnvironment.findEnumeratedIndex(matching:ignoring:)(a2, a3);
  char v26 = v25;

  if ((v26 & 1) == 0)
  {
    uint64_t v27 = type metadata accessor for ActivityArchivedViewCollection();
    sub_191B01614(v5 + *(int *)(v27 + 24), (uint64_t)v12, &qword_1E92E0B90);
    uint64_t v28 = type metadata accessor for JindoArchivedViewCollection();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v28 - 8) + 48))(v12, 1, v28) == 1)
    {
      long long v21 = &qword_1E92E0B90;
      uint64_t v22 = (uint64_t)v12;
      goto LABEL_9;
    }
    JindoArchivedViewCollection.index(for:environmentAtIndex:)((WidgetKit::JindoViewTag)v16, (Swift::Int)v24);
    sub_191CE8250((uint64_t)v12, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
    if ((v30 & 1) == 0)
    {
      *(void *)a4 = v29;
      *(unsigned char *)(a4 + 8) = 0;
      return;
    }
  }
LABEL_10:
  *(void *)a4 = 0;
  *(unsigned char *)(a4 + 8) = -1;
}

uint64_t ActivityArchivedViewCollection.viewEntry(for:in:ignoring:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, int64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v7 = *a1;
  LOBYTE(v13[0]) = *a1;
  ActivityArchivedViewCollection.index(for:in:ignoring:)((unsigned __int8 *)v13, a2, a3, (uint64_t)v17);
  if (BYTE8(v17[0]) == 255)
  {
    *(void *)&v17[0] = 0;
    *((void *)&v17[0] + 1) = 0xE000000000000000;
    sub_191CF5D88();
    sub_191CF53B8();
    if (v7 != 4)
    {
      *(void *)&v13[0] = 0x2D6F646E696ALL;
      *((void *)&v13[0] + 1) = 0xE600000000000000;
      sub_191CF53B8();
      swift_bridgeObjectRelease();
    }
    sub_191BB2F2C();
    sub_191CF53B8();
    swift_bridgeObjectRelease();
    sub_191CF53B8();
    sub_191CF4058();
    sub_191CEB058(&qword_1E92E58B8, MEMORY[0x1E4F3D2F8]);
    sub_191CF62C8();
    sub_191CF53B8();
    swift_bridgeObjectRelease();
    sub_191CF53B8();
    uint64_t v9 = sub_191CF5C78();
    MEMORY[0x192FE42B0](a3, v9);
    sub_191CF53B8();
    swift_bridgeObjectRelease();
    long long v10 = v17[0];
    uint64_t v11 = sub_191CF5338();
    sub_191BDA6B4(v11, v12, 1301, 0, v10, *((uint64_t *)&v10 + 1));
    return swift_willThrow();
  }
  else
  {
    uint64_t v15 = *(void *)&v17[0];
    char v16 = BYTE8(v17[0]) & 1;
    uint64_t result = sub_191CE731C((uint64_t)&v15, (uint64_t)v17);
    if (!v4)
    {
      v13[6] = v17[6];
      v13[7] = v17[7];
      v13[8] = v17[8];
      uint64_t v14 = v18;
      void v13[2] = v17[2];
      v13[3] = v17[3];
      v13[4] = v17[4];
      v13[5] = v17[5];
      v13[0] = v17[0];
      v13[1] = v17[1];
      nullsub_1(v13);
      return sub_191B015B0((uint64_t)v13, a4, &qword_1E92E0BA0);
    }
  }
  return result;
}

uint64_t sub_191CE731C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  v99 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v89 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0AA8);
  MEMORY[0x1F4188790](v12 - 8);
  uint64_t v14 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_191CF3AD8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v102 = v15;
  uint64_t v103 = v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v17);
  uint64_t v22 = (char *)&v89 - v21;
  uint64_t v23 = MEMORY[0x1F4188790](v20);
  v100 = (char *)&v89 - v24;
  MEMORY[0x1F4188790](v23);
  v101 = (char *)&v89 - v25;
  uint64_t v26 = *(void *)a1;
  int v27 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v28 = type metadata accessor for ActivityArchivedViewCollection();
  if ((v27 & 1) == 0)
  {
    uint64_t v97 = a2;
    uint64_t v38 = v4 + *(int *)(v28 + 24);
    sub_191B01614(v38, (uint64_t)v11, &qword_1E92E0B90);
    uint64_t v39 = type metadata accessor for JindoArchivedViewCollection();
    uint64_t v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 48);
    if (v40(v11, 1, v39) == 1)
    {
      sub_191B01770((uint64_t)v11, &qword_1E92E0B90);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v103 + 56))(v14, 1, 1, v102);
    }
    else
    {
      int v98 = v27;
      sub_191CF44A8();
      uint64_t result = sub_191CE8250((uint64_t)v11, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
      if (v3) {
        return result;
      }
      uint64_t v44 = v102;
      uint64_t v43 = v103;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v103 + 56))(v14, 0, 1, v102);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v14, 1, v44) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v101, v14, v44);
        uint64_t v45 = v99;
        sub_191B01614(v38, (uint64_t)v99, &qword_1E92E0B90);
        if (v40(v45, 1, v39) == 1)
        {
          sub_191B01770((uint64_t)v45, &qword_1E92E0B90);
          uint64_t v46 = v103;
        }
        else
        {
          uint64_t result = v26 - *(void *)v45;
          if (__OFSUB__(v26, *(void *)v45))
          {
            __break(1u);
            return result;
          }
          uint64_t v78 = *(void *)&v45[*(int *)(v39 + 20) + 8];
          uint64_t v68 = v97;
          uint64_t v46 = v103;
          if (*(void *)(v78 + 16))
          {
            unint64_t v79 = sub_191B1CBF4(result);
            if (v80)
            {
              uint64_t v81 = *(void *)(v78 + 56) + 88 * v79;
              uint64_t v54 = *(void *)v81;
              uint64_t v55 = *(void *)(v81 + 8);
              uint64_t v56 = *(void *)(v81 + 16);
              uint64_t v57 = *(void *)(v81 + 24);
              uint64_t v58 = *(void *)(v81 + 32);
              uint64_t v82 = *(void *)(v81 + 44);
              uint64_t v89 = *(void *)(v81 + 52);
              uint64_t v95 = *(unsigned __int8 *)(v81 + 60);
              int v83 = *(unsigned __int8 *)(v81 + 61);
              uint64_t v96 = *(void *)(v81 + 64);
              uint64_t v94 = *(void *)(v81 + 72);
              int v92 = *(unsigned __int8 *)(v81 + 80);
              int v93 = v83;
              int v84 = *(unsigned __int8 *)(v81 + 81);
              int v90 = *(unsigned __int8 *)(v81 + 82);
              int v91 = v84;
              sub_191CE8250((uint64_t)v45, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
              v85 = v101;
              char v86 = sub_191CF3AB8();
              (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v100, v85, v44);
              sub_191CEB058(&qword_1E92E1868, MEMORY[0x1E4F3C880]);
              uint64_t v64 = sub_191CF5038();
              uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v85, v44);
              uint64_t v60 = v89;
              unint64_t v65 = v86 & 1 | (unint64_t)(v82 << 32);
              *((void *)&v87 + 1) = v89;
              *(void *)&long long v87 = v82;
              uint64_t v66 = v87 >> 32;
              goto LABEL_17;
            }
          }
          sub_191CE8250((uint64_t)v45, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
        }
        sub_191B8A264();
        swift_allocError();
        unsigned char *v88 = 1;
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v101, v44);
      }
    }
    sub_191B01770((uint64_t)v14, &qword_1E92E0AA8);
    sub_191B8A264();
    swift_allocError();
    *uint64_t v41 = 1;
    return swift_willThrow();
  }
  int v98 = v27;
  sub_191CF44A8();
  if (v3)
  {
    if (qword_1E92E1198 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_191CF3858();
    __swift_project_value_buffer(v29, (uint64_t)qword_1E92F24A8);
    id v30 = v3;
    id v31 = v3;
    size_t v32 = sub_191CF3838();
    os_log_type_t v33 = sub_191CF5928();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = swift_slowAlloc();
      uint64_t v35 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 134349314;
      uint64_t v104 = v26;
      sub_191CF5C08();
      *(_WORD *)(v34 + 12) = 2114;
      id v36 = v3;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v104 = v37;
      sub_191CF5C08();
      *uint64_t v35 = v37;

      _os_log_impl(&dword_191AF4000, v32, v33, "Failed to fetch view from archive at index %{public}ld: %{public}@", (uint8_t *)v34, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E23C0);
      swift_arrayDestroy();
      MEMORY[0x192FE5F00](v35, -1, -1);
      MEMORY[0x192FE5F00](v34, -1, -1);
    }
    else
    {
    }
    return swift_willThrow();
  }
  uint64_t v47 = v103;
  uint64_t v48 = v19;
  uint64_t v49 = v102;
  (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v22, v48, v102);
  uint64_t v50 = *(void *)(v4 + *(int *)(type metadata accessor for ActivityViewStates.Metadata(0) + 28));
  if (!*(void *)(v50 + 16) || (unint64_t v51 = sub_191B1CBF4(v26), (v52 & 1) == 0))
  {
    sub_191B8A264();
    swift_allocError();
    *unsigned int v77 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v22, v49);
  }
  uint64_t v53 = *(void *)(v50 + 56) + 88 * v51;
  uint64_t v54 = *(void *)v53;
  uint64_t v55 = *(void *)(v53 + 8);
  uint64_t v56 = *(void *)(v53 + 16);
  uint64_t v57 = *(void *)(v53 + 24);
  uint64_t v58 = *(void *)(v53 + 32);
  uint64_t v97 = a2;
  uint64_t v59 = *(void *)(v53 + 44);
  uint64_t v60 = *(void *)(v53 + 52);
  uint64_t v95 = *(unsigned __int8 *)(v53 + 60);
  int v61 = *(unsigned __int8 *)(v53 + 61);
  uint64_t v96 = *(void *)(v53 + 64);
  uint64_t v94 = *(void *)(v53 + 72);
  int v92 = *(unsigned __int8 *)(v53 + 80);
  int v93 = v61;
  int v62 = *(unsigned __int8 *)(v53 + 81);
  int v90 = *(unsigned __int8 *)(v53 + 82);
  int v91 = v62;
  char v63 = sub_191CF3AB8();
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v100, v22, v49);
  sub_191CEB058(&qword_1E92E1868, MEMORY[0x1E4F3C880]);
  uint64_t v64 = sub_191CF5038();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v22, v49);
  unint64_t v65 = v63 & 1 | (unint64_t)(v59 << 32);
  *((void *)&v67 + 1) = v60;
  *(void *)&long long v67 = v59;
  uint64_t v66 = v67 >> 32;
  uint64_t v68 = v97;
LABEL_17:
  *(void *)uint64_t v68 = v26;
  *(unsigned char *)(v68 + 8) = v98;
  *((void *)&v70 + 1) = v95;
  *(void *)&long long v70 = v60;
  uint64_t v69 = v70 >> 32;
  __int16 v71 = v92;
  uint64_t v72 = 0x10000000000;
  if (!v93) {
    uint64_t v72 = 0;
  }
  *(void *)(v68 + 16) = v64;
  uint64_t v73 = v72 | v69;
  if (v91) {
    __int16 v74 = 256;
  }
  else {
    __int16 v74 = 0;
  }
  *(void *)(v68 + 24) = v54;
  *(void *)(v68 + 32) = v55;
  BOOL v75 = v90 != 0;
  *(void *)(v68 + 40) = v56;
  *(void *)(v68 + 48) = v57;
  *(void *)(v68 + 56) = v58;
  *(void *)(v68 + 64) = v65;
  *(void *)(v68 + 72) = v66;
  uint64_t v76 = v96;
  *(void *)(v68 + 80) = v73;
  *(void *)(v68 + 88) = v76;
  *(void *)(v68 + 96) = v94;
  *(unsigned char *)(v68 + 106) = v75;
  *(_WORD *)(v68 + 104) = v74 | v71;
  *(void *)(v68 + 112) = v54;
  *(void *)(v68 + 120) = v55;
  *(void *)(v68 + 128) = v56;
  *(void *)(v68 + 136) = v57;
  *(void *)(v68 + 144) = v58;
  return result;
}

uint64_t ActivityArchivedViewCollection.viewState(for:environmentAtIndex:)@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBB8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_191CF4058();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v30) = *a1;
  ActivityArchivedViewCollection.index(for:environmentAtIndex:)((unsigned __int8 *)&v30, a2, (uint64_t)v42);
  if (BYTE8(v42[0]) == 255)
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E58C0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a3, 1, 1, v14);
  }
  else
  {
    v29[0] = v13;
    uint64_t v40 = *(void *)&v42[0];
    char v41 = BYTE8(v42[0]) & 1;
    uint64_t v16 = v44;
    uint64_t result = sub_191CE731C((uint64_t)&v40, (uint64_t)v42);
    if (!v16)
    {
      long long v36 = v42[6];
      long long v37 = v42[7];
      long long v38 = v42[8];
      uint64_t v39 = v43;
      long long v32 = v42[2];
      long long v33 = v42[3];
      long long v34 = v42[4];
      long long v35 = v42[5];
      long long v30 = v42[0];
      long long v31 = v42[1];
      v29[1] = *(void *)(v3 + *(int *)(type metadata accessor for ActivityViewStates.Metadata(0) + 20));
      WidgetEnvironment.environmentValues(at:)(a2, (uint64_t)v9);
      uint64_t v17 = v11;
      int v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
      uint64_t v19 = a3;
      if (v18 == 1)
      {
        sub_191CE82B0((uint64_t)&v30);
        sub_191B01770((uint64_t)v9, (uint64_t *)&unk_1EB44BBB8);
        uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E58C0);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(a3, 1, 1, v20);
      }
      else
      {
        uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 32);
        uint64_t v22 = (char *)v29[0];
        v21(v29[0], v9, v10);
        uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E58C0);
        uint64_t v24 = v19 + *(int *)(v23 + 48);
        long long v25 = v37;
        *(_OWORD *)(v19 + 96) = v36;
        *(_OWORD *)(v19 + 112) = v25;
        *(_OWORD *)(v19 + 128) = v38;
        *(void *)(v19 + 144) = v39;
        long long v26 = v33;
        *(_OWORD *)(v19 + 32) = v32;
        *(_OWORD *)(v19 + 48) = v26;
        long long v27 = v35;
        *(_OWORD *)(v19 + 64) = v34;
        *(_OWORD *)(v19 + 80) = v27;
        long long v28 = v31;
        *(_OWORD *)uint64_t v19 = v30;
        *(_OWORD *)(v19 + 16) = v28;
        v21(v24, v22, v10);
        return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v19, 0, 1, v23);
      }
    }
  }
  return result;
}

uint64_t ActivityArchivedViewCollection.archivedFamily.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = type metadata accessor for ActivityViewStates.Metadata(0);
  *a1 = *(unsigned char *)(v1 + *(int *)(result + 32));
  return result;
}

uint64_t _s9WidgetKit30ActivityArchivedViewCollectionV0E5EntryV2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  long long v3 = *(_OWORD *)(a1 + 5);
  uint64_t v4 = a1[7];
  long long v5 = *((_OWORD *)a1 + 4);
  long long v6 = *((_OWORD *)a1 + 5);
  uint64_t v7 = a1[12];
  int v8 = *((unsigned __int8 *)a1 + 106);
  int v9 = *((unsigned __int16 *)a1 + 52);
  CGFloat x = *((double *)a1 + 14);
  uint64_t v11 = a1[15];
  uint64_t v12 = a1[16];
  uint64_t v13 = a1[17];
  CGFloat v14 = *((double *)a1 + 18);
  CGSize v15 = *(CGSize *)(a2 + 24);
  long long v16 = *(_OWORD *)(a2 + 40);
  uint64_t v17 = *(void *)(a2 + 56);
  uint64_t v18 = *(void *)(a2 + 64);
  uint64_t v19 = *(void *)(a2 + 72);
  uint64_t v20 = *(void *)(a2 + 80);
  long long v21 = *(_OWORD *)(a2 + 88);
  int v22 = *(unsigned __int8 *)(a2 + 106);
  int v23 = *(unsigned __int16 *)(a2 + 104);
  CGFloat v24 = *(double *)(a2 + 112);
  CGFloat v25 = *(double *)(a2 + 120);
  CGFloat v26 = *(double *)(a2 + 128);
  CGFloat v27 = *(double *)(a2 + 136);
  double v28 = *(double *)(a2 + 144);
  if (a1[1])
  {
    if (v2 == *(void *)a2) {
      int v29 = *(unsigned __int8 *)(a2 + 8);
    }
    else {
      int v29 = 0;
    }
    if (v29 != 1) {
      return 0;
    }
  }
  else
  {
    if (v2 == *(void *)a2) {
      char v30 = *(unsigned char *)(a2 + 8);
    }
    else {
      char v30 = 1;
    }
    if (v30) {
      return 0;
    }
  }
  if (v5 != 2)
  {
    v51[0] = *(_OWORD *)(a1 + 3);
    v51[1] = v3;
    int v31 = v9 | (v8 << 16);
    long long v53 = v5;
    long long v54 = v6;
    uint64_t v52 = v4;
    uint64_t v55 = v7;
    __int16 v56 = v31;
    char v57 = BYTE2(v31);
    if (v18 != 2)
    {
      rect1.origin.y = v14;
      char v43 = v18 & 1;
      rect1.size = v15;
      long long v41 = v16;
      *((void *)&v33 + 1) = v19;
      *(void *)&long long v33 = v18;
      uint64_t v32 = v33 >> 32;
      uint64_t v42 = v17;
      *((void *)&v33 + 1) = v20;
      *(void *)&long long v33 = v19;
      uint64_t v44 = v32;
      uint64_t v45 = v33 >> 32;
      char v46 = BYTE4(v20);
      char v47 = BYTE5(v20) & 1;
      int v34 = v23 | (v22 << 16);
      long long v48 = v21;
      __int16 v49 = v34 & 0x1FF;
      char v50 = BYTE2(v34) & 1;
      rect1.origin.CGFloat x = x;
      char v35 = _s9WidgetKit25ActivityViewEntryMetadataV2eeoiySbAC_ACtFZ_0((uint64_t)v51, (uint64_t)&rect1.size);
      CGFloat x = rect1.origin.x;
      if (v35) {
        goto LABEL_16;
      }
    }
    return 0;
  }
  *(void *)&rect1.origin.y = a1[18];
  if (v18 != 2) {
    return 0;
  }
LABEL_16:
  uint64_t v36 = v11;
  uint64_t v37 = v12;
  uint64_t v38 = v13;
  v58.origin.CGFloat x = v24;
  v58.origin.y = v25;
  v58.size.width = v26;
  v58.size.height = v27;
  LODWORD(result) = CGRectEqualToRect(*(CGRect *)&x, v58);
  if (rect1.origin.y == v28) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t type metadata accessor for ActivityArchivedViewCollection()
{
  uint64_t result = qword_1E92E07D8;
  if (!qword_1E92E07D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_191CE8250(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_191CE82B0(uint64_t a1)
{
  return a1;
}

void *initializeBufferWithCopyOfBuffer for ActivityArchivedViewCollection(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (void *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_191CF31D8();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    int v8 = (int *)type metadata accessor for ActivityViewStates.Metadata(0);
    uint64_t v9 = v8[5];
    uint64_t v10 = *(void **)((char *)a2 + v9);
    *(void *)((char *)a1 + v9) = v10;
    *(void *)((char *)a1 + v8[6]) = *(void *)((char *)a2 + v8[6]);
    *(void *)((char *)a1 + v8[7]) = *(void *)((char *)a2 + v8[7]);
    *((unsigned char *)a1 + v8[8]) = *((unsigned char *)a2 + v8[8]);
    id v11 = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
    uint64_t v13 = v12[13];
    CGFloat v14 = (void **)((char *)a1 + v13);
    CGSize v15 = (void **)((char *)a2 + v13);
    uint64_t v16 = type metadata accessor for JindoViewStates.Metadata(0);
    uint64_t v17 = *(void *)(v16 - 8);
    if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
    {
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
      memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      uint64_t v20 = v16;
      long long v21 = *v15;
      int v22 = v15[1];
      *CGFloat v14 = *v15;
      v14[1] = v22;
      *((_OWORD *)v14 + 1) = *((_OWORD *)v15 + 1);
      *((_WORD *)v14 + 16) = *((_WORD *)v15 + 16);
      uint64_t v62 = v20;
      uint64_t v23 = *(int *)(v20 + 28);
      __dst = (char *)v14 + v23;
      uint64_t v60 = (char *)v15 + v23;
      uint64_t v24 = sub_191CF3078();
      uint64_t v55 = *(void *)(v24 - 8);
      CGRect v58 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48);
      id v25 = v21;
      swift_bridgeObjectRetain();
      if (v58(v60, 1, v24))
      {
        uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
        memcpy(__dst, v60, *(void *)(*(void *)(v26 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v55 + 16))(__dst, v60, v24);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v55 + 56))(__dst, 0, 1, v24);
      }
      uint64_t v16 = v62;
      (*(void (**)(void **, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v62);
    }
    *(void *)((char *)a1 + v12[14]) = *(void *)((char *)a2 + v12[14]);
    uint64_t v27 = v12[15];
    double v28 = (void *)((char *)a1 + v27);
    int v29 = (void *)((char *)a2 + v27);
    uint64_t v30 = v29[1];
    *double v28 = *v29;
    v28[1] = v30;
    *((unsigned char *)a1 + v12[16]) = *((unsigned char *)a2 + v12[16]);
    *((unsigned char *)a1 + v12[17]) = *((unsigned char *)a2 + v12[17]);
    uint64_t v31 = *(int *)(a3 + 20);
    uint64_t v32 = (char *)a1 + v31;
    long long v33 = (char *)a2 + v31;
    uint64_t v34 = sub_191CF44B8();
    char v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
    swift_bridgeObjectRetain();
    v35(v32, v33, v34);
    uint64_t v36 = *(int *)(a3 + 24);
    uint64_t v37 = (void *)((char *)a1 + v36);
    uint64_t v38 = (void *)((char *)a2 + v36);
    uint64_t v39 = type metadata accessor for JindoArchivedViewCollection();
    uint64_t v40 = *(void *)(v39 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39))
    {
      uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
      memcpy(v37, v38, *(void *)(*(void *)(v41 - 8) + 64));
    }
    else
    {
      uint64_t v56 = v34;
      uint64_t v59 = v35;
      *uint64_t v37 = *v38;
      uint64_t v42 = *(int *)(v39 + 20);
      char v63 = (char *)v37;
      char v43 = (char *)v37 + v42;
      uint64_t v44 = (char *)v38 + v42;
      uint64_t v45 = *(void **)v44;
      uint64_t v46 = *((void *)v44 + 1);
      *(void *)char v43 = *(void *)v44;
      *((void *)v43 + 1) = v46;
      *((_OWORD *)v43 + 1) = *((_OWORD *)v44 + 1);
      *((_WORD *)v43 + 16) = *((_WORD *)v44 + 16);
      uint64_t v47 = *(int *)(v16 + 28);
      long long v54 = &v43[v47];
      long long v48 = &v44[v47];
      uint64_t v49 = sub_191CF3078();
      uint64_t v50 = *(void *)(v49 - 8);
      int v61 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
      id v51 = v45;
      swift_bridgeObjectRetain();
      if (v61(v48, 1, v49))
      {
        uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
        memcpy(v54, v48, *(void *)(*(void *)(v52 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v54, v48, v49);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v54, 0, 1, v49);
      }
      v59(&v63[*(int *)(v39 + 24)], (char *)v38 + *(int *)(v39 + 24), v56);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v40 + 56))(v63, 0, 1, v39);
    }
  }
  return a1;
}

uint64_t destroy for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_191CF31D8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v5 = (id *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48) + 52));
  uint64_t v6 = type metadata accessor for JindoViewStates.Metadata(0);
  if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6))
  {

    swift_bridgeObjectRelease();
    uint64_t v7 = (char *)v5 + *(int *)(v6 + 28);
    uint64_t v8 = sub_191CF3078();
    uint64_t v9 = *(void *)(v8 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = a1 + *(int *)(a2 + 20);
  uint64_t v11 = sub_191CF44B8();
  uint64_t v20 = *(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  v20(v10, v11);
  uint64_t v12 = a1 + *(int *)(a2 + 24);
  uint64_t v13 = type metadata accessor for JindoArchivedViewCollection();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13);
  if (!result)
  {
    CGSize v15 = (id *)(v12 + *(int *)(v13 + 20));

    swift_bridgeObjectRelease();
    uint64_t v16 = (char *)v15 + *(int *)(v6 + 28);
    uint64_t v17 = sub_191CF3078();
    uint64_t v18 = *(void *)(v17 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17)) {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v16, v17);
    }
    uint64_t v19 = v12 + *(int *)(v13 + 24);
    return ((uint64_t (*)(uint64_t, uint64_t))v20)(v19, v11);
  }
  return result;
}

uint64_t initializeWithCopy for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_191CF31D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for ActivityViewStates.Metadata(0);
  uint64_t v8 = v7[5];
  uint64_t v9 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v9;
  *(void *)(a1 + v7[6]) = *(void *)(a2 + v7[6]);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  id v10 = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  uint64_t v12 = v11[13];
  uint64_t v13 = (void **)(a1 + v12);
  CGFloat v14 = (void **)(a2 + v12);
  uint64_t v15 = type metadata accessor for JindoViewStates.Metadata(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
    memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    uint64_t v18 = v15;
    uint64_t v19 = *v14;
    uint64_t v20 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v20;
    *((_OWORD *)v13 + 1) = *((_OWORD *)v14 + 1);
    *((_WORD *)v13 + 16) = *((_WORD *)v14 + 16);
    uint64_t v59 = v18;
    uint64_t v21 = *(int *)(v18 + 28);
    uint64_t v56 = (char *)v14 + v21;
    __dst = (char *)v13 + v21;
    uint64_t v22 = sub_191CF3078();
    uint64_t v23 = *(void *)(v22 - 8);
    long long v54 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
    id v24 = v19;
    swift_bridgeObjectRetain();
    if (v54(v56, 1, v22))
    {
      uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
      memcpy(__dst, v56, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 16))(__dst, v56, v22);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(__dst, 0, 1, v22);
    }
    uint64_t v15 = v59;
    (*(void (**)(void **, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v59);
  }
  *(void *)(a1 + v11[14]) = *(void *)(a2 + v11[14]);
  uint64_t v26 = v11[15];
  uint64_t v27 = (void *)(a1 + v26);
  double v28 = (void *)(a2 + v26);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  *(unsigned char *)(a1 + v11[16]) = *(unsigned char *)(a2 + v11[16]);
  *(unsigned char *)(a1 + v11[17]) = *(unsigned char *)(a2 + v11[17]);
  uint64_t v30 = *(int *)(a3 + 20);
  uint64_t v31 = a1 + v30;
  uint64_t v32 = a2 + v30;
  uint64_t v33 = sub_191CF44B8();
  uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16);
  swift_bridgeObjectRetain();
  v34(v31, v32, v33);
  uint64_t v35 = *(int *)(a3 + 24);
  uint64_t v36 = (void *)(a1 + v35);
  uint64_t v37 = (void *)(a2 + v35);
  uint64_t v38 = type metadata accessor for JindoArchivedViewCollection();
  uint64_t v39 = *(void *)(v38 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
  {
    uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
    memcpy(v36, v37, *(void *)(*(void *)(v40 - 8) + 64));
  }
  else
  {
    uint64_t v57 = v33;
    uint64_t v60 = (void (*)(char *, char *, uint64_t))v34;
    int v61 = (char *)v36;
    *uint64_t v36 = *v37;
    uint64_t v41 = *(int *)(v38 + 20);
    uint64_t v42 = (char *)v36 + v41;
    char v43 = (char *)v37 + v41;
    uint64_t v44 = *(void **)v43;
    uint64_t v45 = *((void *)v43 + 1);
    *(void *)uint64_t v42 = *(void *)v43;
    *((void *)v42 + 1) = v45;
    *((_OWORD *)v42 + 1) = *((_OWORD *)v43 + 1);
    *((_WORD *)v42 + 16) = *((_WORD *)v43 + 16);
    uint64_t v46 = *(int *)(v15 + 28);
    uint64_t v55 = &v42[v46];
    uint64_t v47 = &v43[v46];
    uint64_t v48 = sub_191CF3078();
    uint64_t v49 = *(void *)(v48 - 8);
    long long v53 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48);
    id v50 = v44;
    swift_bridgeObjectRetain();
    if (v53(v47, 1, v48))
    {
      uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
      memcpy(v55, v47, *(void *)(*(void *)(v51 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v55, v47, v48);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v55, 0, 1, v48);
    }
    v60(&v61[*(int *)(v38 + 24)], (char *)v37 + *(int *)(v38 + 24), v57);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v61, 0, 1, v38);
  }
  return a1;
}

uint64_t assignWithCopy for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_191CF31D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24))(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for ActivityViewStates.Metadata(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(void *)(a1 + v6[6]) = *(void *)(a2 + v6[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  uint64_t v12 = v11[13];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for JindoViewStates.Metadata(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  uint64_t v96 = (int *)v15;
  if (!v18)
  {
    if (!v19)
    {
      uint64_t v31 = *(void **)v14;
      uint64_t v32 = *(void **)v13;
      *(void *)uint64_t v13 = *(void *)v14;
      id v33 = v31;

      *(void *)(v13 + 8) = *(void *)(v14 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      long long v34 = *(_OWORD *)(v14 + 16);
      *(_WORD *)(v13 + 32) = *(_WORD *)(v14 + 32);
      *(_OWORD *)(v13 + 16) = v34;
      uint64_t v35 = *(int *)(v15 + 28);
      uint64_t v36 = (void *)(v13 + v35);
      uint64_t v37 = (void *)(v14 + v35);
      uint64_t v38 = sub_191CF3078();
      uint64_t v39 = *(void *)(v38 - 8);
      uint64_t v40 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v39 + 48);
      int v91 = v36;
      LODWORD(v36) = v40(v36, 1, v38);
      int v41 = v40(v37, 1, v38);
      if (v36)
      {
        if (!v41)
        {
          (*(void (**)(void *, void *, uint64_t))(v39 + 16))(v91, v37, v38);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v39 + 56))(v91, 0, 1, v38);
          goto LABEL_14;
        }
        size_t v28 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8)
                        + 64);
        uint64_t v29 = v91;
        uint64_t v30 = v37;
      }
      else
      {
        if (!v41)
        {
          (*(void (**)(void *, void *, uint64_t))(v39 + 24))(v91, v37, v38);
          goto LABEL_14;
        }
        (*(void (**)(void *, uint64_t))(v39 + 8))(v91, v38);
        size_t v28 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8)
                        + 64);
        uint64_t v29 = v91;
        uint64_t v30 = v37;
      }
LABEL_8:
      memcpy(v29, v30, v28);
      goto LABEL_14;
    }
    sub_191CE8250(v13, type metadata accessor for JindoViewStates.Metadata);
LABEL_7:
    size_t v28 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8) - 8) + 64);
    uint64_t v29 = (void *)v13;
    uint64_t v30 = (const void *)v14;
    goto LABEL_8;
  }
  if (v19) {
    goto LABEL_7;
  }
  uint64_t v20 = v15;
  uint64_t v21 = *(void **)v14;
  *(void *)uint64_t v13 = *(void *)v14;
  *(void *)(v13 + 8) = *(void *)(v14 + 8);
  long long v22 = *(_OWORD *)(v14 + 16);
  *(_WORD *)(v13 + 32) = *(_WORD *)(v14 + 32);
  *(_OWORD *)(v13 + 16) = v22;
  uint64_t v23 = *(int *)(v20 + 28);
  int v90 = (const void *)(v14 + v23);
  __dst = (void *)(v13 + v23);
  uint64_t v24 = sub_191CF3078();
  uint64_t v25 = *(void *)(v24 - 8);
  v88 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v25 + 48);
  id v26 = v21;
  swift_bridgeObjectRetain();
  if (v88(v90, 1, v24))
  {
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(__dst, v90, *(void *)(*(void *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v25 + 16))(__dst, v90, v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(__dst, 0, 1, v24);
  }
  (*(void (**)(uint64_t, void, uint64_t, int *))(v16 + 56))(v13, 0, 1, v96);
LABEL_14:
  *(void *)(a1 + v11[14]) = *(void *)(a2 + v11[14]);
  uint64_t v42 = v11[15];
  char v43 = (void *)(a1 + v42);
  uint64_t v44 = (void *)(a2 + v42);
  *char v43 = *v44;
  v43[1] = v44[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v11[16]) = *(unsigned char *)(a2 + v11[16]);
  *(unsigned char *)(a1 + v11[17]) = *(unsigned char *)(a2 + v11[17]);
  uint64_t v45 = *(int *)(a3 + 20);
  uint64_t v46 = a1 + v45;
  uint64_t v47 = a2 + v45;
  uint64_t v48 = sub_191CF44B8();
  uint64_t v92 = *(void *)(v48 - 8);
  __dsta = (void *)v48;
  uint64_t v49 = *(void (**)(uint64_t, uint64_t))(v92 + 24);
  v49(v46, v47);
  uint64_t v50 = *(int *)(a3 + 24);
  uint64_t v51 = (char *)(a2 + v50);
  uint64_t v52 = (char *)(a1 + v50);
  uint64_t v53 = type metadata accessor for JindoArchivedViewCollection();
  uint64_t v54 = *(void *)(v53 - 8);
  uint64_t v55 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v54 + 48);
  LODWORD(v47) = v55(v52, 1, v53);
  __srca = v51;
  int v56 = v55(v51, 1, v53);
  if (!v47)
  {
    int v93 = v49;
    if (v56)
    {
      sub_191CE8250((uint64_t)v52, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
      goto LABEL_20;
    }
    *(void *)uint64_t v52 = *(void *)v51;
    uint64_t v70 = *(int *)(v53 + 20);
    __int16 v71 = &v52[v70];
    uint64_t v72 = &v51[v70];
    uint64_t v73 = *(void **)&v51[v70];
    __int16 v74 = *(void **)v71;
    *(void *)__int16 v71 = v73;
    id v75 = v73;

    *((void *)v71 + 1) = *((void *)v72 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    long long v76 = *((_OWORD *)v72 + 1);
    *((_WORD *)v71 + 16) = *((_WORD *)v72 + 16);
    *((_OWORD *)v71 + 1) = v76;
    uint64_t v77 = v96[7];
    uint64_t v78 = &v71[v77];
    unint64_t v79 = &v72[v77];
    uint64_t v80 = sub_191CF3078();
    uint64_t v81 = *(void *)(v80 - 8);
    uint64_t v82 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v81 + 48);
    int v98 = v78;
    LODWORD(v78) = v82(v78, 1, v80);
    int v83 = v82(v79, 1, v80);
    if (v78)
    {
      int v84 = (void (*)(char *, char *, void *))v93;
      if (!v83)
      {
        (*(void (**)(char *, char *, uint64_t))(v81 + 16))(v98, v79, v80);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v81 + 56))(v98, 0, 1, v80);
        goto LABEL_35;
      }
      size_t v85 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8) + 64);
      char v86 = v98;
    }
    else
    {
      int v84 = (void (*)(char *, char *, void *))v93;
      if (!v83)
      {
        (*(void (**)(char *, char *, uint64_t))(v81 + 24))(v98, v79, v80);
        goto LABEL_35;
      }
      (*(void (**)(char *, uint64_t))(v81 + 8))(v98, v80);
      size_t v85 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8) + 64);
      char v86 = v98;
    }
    memcpy(v86, v79, v85);
LABEL_35:
    v84(&v52[*(int *)(v53 + 24)], &__srca[*(int *)(v53 + 24)], __dsta);
    return a1;
  }
  if (v56)
  {
LABEL_20:
    uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
    memcpy(v52, v51, *(void *)(*(void *)(v69 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v52 = *(void *)v51;
  uint64_t v57 = *(int *)(v53 + 20);
  uint64_t v89 = v52;
  CGRect v58 = &v52[v57];
  uint64_t v59 = &v51[v57];
  uint64_t v60 = *(void **)v59;
  *(void *)CGRect v58 = *(void *)v59;
  *((void *)v58 + 1) = *((void *)v59 + 1);
  long long v61 = *((_OWORD *)v59 + 1);
  *((_WORD *)v58 + 16) = *((_WORD *)v59 + 16);
  *((_OWORD *)v58 + 1) = v61;
  uint64_t v62 = v96[7];
  uint64_t v97 = &v58[v62];
  char v63 = &v59[v62];
  uint64_t v64 = sub_191CF3078();
  uint64_t v65 = *(void *)(v64 - 8);
  uint64_t v66 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48);
  id v67 = v60;
  swift_bridgeObjectRetain();
  if (v66(v63, 1, v64))
  {
    uint64_t v68 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(v97, v63, *(void *)(*(void *)(v68 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v97, v63, v64);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v65 + 56))(v97, 0, 1, v64);
  }
  (*(void (**)(char *, char *, void *))(v92 + 16))(&v89[*(int *)(v53 + 24)], &__srca[*(int *)(v53 + 24)], __dsta);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v89, 0, 1, v53);
  return a1;
}

uint64_t initializeWithTake for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_191CF31D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = (int *)type metadata accessor for ActivityViewStates.Metadata(0);
  *(void *)(a1 + v7[5]) = *(void *)(a2 + v7[5]);
  *(void *)(a1 + v7[6]) = *(void *)(a2 + v7[6]);
  *(void *)(a1 + v7[7]) = *(void *)(a2 + v7[7]);
  *(unsigned char *)(a1 + v7[8]) = *(unsigned char *)(a2 + v7[8]);
  uint64_t v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  uint64_t v9 = v8[13];
  id v10 = (_OWORD *)(a1 + v9);
  uint64_t v11 = (_OWORD *)(a2 + v9);
  uint64_t v12 = type metadata accessor for JindoViewStates.Metadata(0);
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8);
    memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
  }
  else
  {
    long long v15 = v11[1];
    *id v10 = *v11;
    v10[1] = v15;
    *((_WORD *)v10 + 16) = *((_WORD *)v11 + 16);
    uint64_t v16 = *(int *)(v12 + 28);
    __dst = (char *)v10 + v16;
    uint64_t v17 = (char *)v11 + v16;
    uint64_t v18 = sub_191CF3078();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
      memcpy(__dst, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 32))(__dst, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
    }
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  }
  *(void *)(a1 + v8[14]) = *(void *)(a2 + v8[14]);
  *(_OWORD *)(a1 + v8[15]) = *(_OWORD *)(a2 + v8[15]);
  *(unsigned char *)(a1 + v8[16]) = *(unsigned char *)(a2 + v8[16]);
  *(unsigned char *)(a1 + v8[17]) = *(unsigned char *)(a2 + v8[17]);
  uint64_t v21 = *(int *)(a3 + 20);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = sub_191CF44B8();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 32);
  v25(v22, v23, v24);
  uint64_t v26 = *(int *)(a3 + 24);
  uint64_t v27 = (void *)(a1 + v26);
  size_t v28 = (void *)(a2 + v26);
  uint64_t v29 = type metadata accessor for JindoArchivedViewCollection();
  uint64_t v30 = *(void *)(v29 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
    memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
  }
  else
  {
    *uint64_t v27 = *v28;
    uint64_t v32 = *(int *)(v29 + 20);
    id v33 = (char *)v27 + v32;
    long long v34 = (char *)v28 + v32;
    long long v35 = *((_OWORD *)v34 + 1);
    *(_OWORD *)id v33 = *(_OWORD *)v34;
    *((_OWORD *)v33 + 1) = v35;
    *((_WORD *)v33 + 16) = *((_WORD *)v34 + 16);
    uint64_t v36 = *(int *)(v12 + 28);
    uint64_t v42 = (void (*)(char *, char *, uint64_t))v25;
    __dsta = &v33[v36];
    uint64_t v37 = &v34[v36];
    uint64_t v38 = sub_191CF3078();
    uint64_t v39 = *(void *)(v38 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38))
    {
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
      memcpy(__dsta, v37, *(void *)(*(void *)(v40 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v39 + 32))(__dsta, v37, v38);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(__dsta, 0, 1, v38);
    }
    v42((char *)v27 + *(int *)(v29 + 24), (char *)v28 + *(int *)(v29 + 24), v24);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  return a1;
}

uint64_t assignWithTake for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_191CF31D8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a1, a2, v5);
  uint64_t v6 = (int *)type metadata accessor for ActivityViewStates.Metadata(0);
  uint64_t v7 = v6[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  *(void *)(a1 + v6[6]) = *(void *)(a2 + v6[6]);
  swift_bridgeObjectRelease();
  *(void *)(a1 + v6[7]) = *(void *)(a2 + v6[7]);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v6[8]) = *(unsigned char *)(a2 + v6[8]);
  uint64_t v9 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  uint64_t v10 = v9[13];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for JindoViewStates.Metadata(0);
  uint64_t v14 = *(void *)(v13 - 8);
  long long v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  size_t v85 = (int *)v13;
  if (!v16)
  {
    if (!v17)
    {
      size_t v28 = *(void **)v11;
      *(void *)uint64_t v11 = *(void *)v12;

      *(void *)(v11 + 8) = *(void *)(v12 + 8);
      swift_bridgeObjectRelease();
      *(_OWORD *)(v11 + 16) = *(_OWORD *)(v12 + 16);
      *(_WORD *)(v11 + 32) = *(_WORD *)(v12 + 32);
      uint64_t v29 = *(int *)(v13 + 28);
      uint64_t v30 = (void *)(v11 + v29);
      uint64_t v31 = (void *)(v12 + v29);
      uint64_t v32 = sub_191CF3078();
      uint64_t v33 = *(void *)(v32 - 8);
      long long v34 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v33 + 48);
      uint64_t v81 = v30;
      LODWORD(v30) = v34(v30, 1, v32);
      int v35 = v34(v31, 1, v32);
      if (v30)
      {
        if (!v35)
        {
          (*(void (**)(void *, void *, uint64_t))(v33 + 32))(v81, v31, v32);
          (*(void (**)(void *, void, uint64_t, uint64_t))(v33 + 56))(v81, 0, 1, v32);
          goto LABEL_14;
        }
        size_t v25 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8)
                        + 64);
        uint64_t v26 = v81;
        uint64_t v27 = v31;
      }
      else
      {
        if (!v35)
        {
          (*(void (**)(void *, void *, uint64_t))(v33 + 40))(v81, v31, v32);
          goto LABEL_14;
        }
        (*(void (**)(void *, uint64_t))(v33 + 8))(v81, v32);
        size_t v25 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8) - 8)
                        + 64);
        uint64_t v26 = v81;
        uint64_t v27 = v31;
      }
LABEL_8:
      memcpy(v26, v27, v25);
      goto LABEL_14;
    }
    sub_191CE8250(v11, type metadata accessor for JindoViewStates.Metadata);
LABEL_7:
    size_t v25 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E92E07C8) - 8) + 64);
    uint64_t v26 = (void *)v11;
    uint64_t v27 = (const void *)v12;
    goto LABEL_8;
  }
  if (v17) {
    goto LABEL_7;
  }
  long long v18 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(_OWORD *)(v11 + 16) = v18;
  *(_WORD *)(v11 + 32) = *(_WORD *)(v12 + 32);
  uint64_t v19 = *(int *)(v13 + 28);
  uint64_t v20 = (void *)(v11 + v19);
  uint64_t v21 = (const void *)(v12 + v19);
  uint64_t v22 = sub_191CF3078();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_14:
  *(void *)(a1 + v9[14]) = *(void *)(a2 + v9[14]);
  uint64_t v36 = v9[15];
  uint64_t v37 = (void *)(a1 + v36);
  uint64_t v38 = (uint64_t *)(a2 + v36);
  uint64_t v40 = *v38;
  uint64_t v39 = v38[1];
  *uint64_t v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + v9[16]) = *(unsigned char *)(a2 + v9[16]);
  *(unsigned char *)(a1 + v9[17]) = *(unsigned char *)(a2 + v9[17]);
  uint64_t v41 = *(int *)(a3 + 20);
  uint64_t v42 = a1 + v41;
  uint64_t v43 = a2 + v41;
  uint64_t v44 = sub_191CF44B8();
  uint64_t v82 = *(void *)(v44 - 8);
  uint64_t v84 = v44;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t))(v82 + 40);
  v45(v42, v43);
  uint64_t v46 = *(int *)(a3 + 24);
  uint64_t v47 = (char *)(a1 + v46);
  uint64_t v48 = (char *)(a2 + v46);
  uint64_t v49 = type metadata accessor for JindoArchivedViewCollection();
  uint64_t v50 = *(void *)(v49 - 8);
  uint64_t v51 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v50 + 48);
  uint64_t v52 = v47;
  LODWORD(v47) = v51(v47, 1, v49);
  __srca = v48;
  int v53 = v51(v48, 1, v49);
  if (!v47)
  {
    int v83 = v45;
    if (v53)
    {
      sub_191CE8250((uint64_t)v52, (uint64_t (*)(void))type metadata accessor for JindoArchivedViewCollection);
      goto LABEL_20;
    }
    *(void *)uint64_t v52 = *(void *)v48;
    uint64_t v65 = *(int *)(v49 + 20);
    uint64_t v80 = v52;
    uint64_t v66 = &v52[v65];
    id v67 = &v48[v65];
    uint64_t v68 = *(void **)&v52[v65];
    *(void *)&v52[v65] = *(void *)&v48[v65];

    *((void *)v66 + 1) = *((void *)v67 + 1);
    swift_bridgeObjectRelease();
    *((_OWORD *)v66 + 1) = *((_OWORD *)v67 + 1);
    *((_WORD *)v66 + 16) = *((_WORD *)v67 + 16);
    uint64_t v69 = v85[7];
    uint64_t v70 = &v66[v69];
    __int16 v71 = &v67[v69];
    uint64_t v72 = sub_191CF3078();
    uint64_t v73 = *(void *)(v72 - 8);
    __int16 v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
    id v75 = v70;
    LODWORD(v70) = v74(v70, 1, v72);
    int v76 = v74(v71, 1, v72);
    if (v70)
    {
      uint64_t v77 = (void (*)(char *, char *, uint64_t))v83;
      if (!v76)
      {
        (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v75, v71, v72);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v73 + 56))(v75, 0, 1, v72);
LABEL_31:
        v77(&v80[*(int *)(v49 + 24)], &__srca[*(int *)(v49 + 24)], v84);
        return a1;
      }
    }
    else
    {
      uint64_t v77 = (void (*)(char *, char *, uint64_t))v83;
      if (!v76)
      {
        (*(void (**)(char *, char *, uint64_t))(v73 + 40))(v75, v71, v72);
        goto LABEL_31;
      }
      (*(void (**)(char *, uint64_t))(v73 + 8))(v75, v72);
    }
    uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(v75, v71, *(void *)(*(void *)(v78 - 8) + 64));
    goto LABEL_31;
  }
  if (v53)
  {
LABEL_20:
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
    memcpy(v52, v48, *(void *)(*(void *)(v64 - 8) + 64));
    return a1;
  }
  *(void *)uint64_t v52 = *(void *)v48;
  uint64_t v54 = *(int *)(v49 + 20);
  uint64_t v55 = &v52[v54];
  int v56 = &v48[v54];
  long long v57 = *((_OWORD *)v56 + 1);
  *(_OWORD *)uint64_t v55 = *(_OWORD *)v56;
  *((_OWORD *)v55 + 1) = v57;
  *((_WORD *)v55 + 16) = *((_WORD *)v56 + 16);
  uint64_t v58 = v85[7];
  uint64_t v59 = &v55[v58];
  uint64_t v60 = &v56[v58];
  uint64_t v61 = sub_191CF3078();
  uint64_t v62 = *(void *)(v61 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v62 + 48))(v60, 1, v61))
  {
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44BBA8);
    memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v59, v60, v61);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v62 + 56))(v59, 0, 1, v61);
  }
  (*(void (**)(char *, char *, uint64_t))(v82 + 32))(&v52[*(int *)(v49 + 24)], &v48[*(int *)(v49 + 24)], v84);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v50 + 56))(v52, 0, 1, v49);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_191CEA870);
}

uint64_t sub_191CEA870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_191CF44B8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
  long long v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48);
  uint64_t v16 = v14;
  uint64_t v17 = a1 + *(int *)(a3 + 24);

  return v15(v17, a2, v16);
}

uint64_t storeEnumTagSinglePayload for ActivityArchivedViewCollection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_191CEA9D8);
}

uint64_t sub_191CEA9D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B48);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_5:
    return v11(v12, a2, a2, v10);
  }
  uint64_t v13 = sub_191CF44B8();
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E0B90);
  uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56);
  uint64_t v18 = v16;
  uint64_t v19 = a1 + *(int *)(a4 + 24);

  return v17(v19, a2, a2, v18);
}

void sub_191CEAB38()
{
  sub_191CEAC3C();
  if (v0 <= 0x3F)
  {
    sub_191CF44B8();
    if (v1 <= 0x3F)
    {
      sub_191CEAD28();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_191CEAC3C()
{
  if (!qword_1E92E0B50)
  {
    type metadata accessor for ActivityViewStates(255);
    type metadata accessor for JindoViewStates(255);
    sub_191CEB058(&qword_1E92E0B30, (void (*)(uint64_t))type metadata accessor for ActivityViewStates);
    sub_191CEB058((unint64_t *)&qword_1E92E0B18, (void (*)(uint64_t))type metadata accessor for JindoViewStates);
    unint64_t v0 = type metadata accessor for CompositeViewStates.Metadata();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E92E0B50);
    }
  }
}

void sub_191CEAD28()
{
  if (!qword_1E92E0B98)
  {
    type metadata accessor for JindoArchivedViewCollection();
    unint64_t v0 = sub_191CF5BC8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1E92E0B98);
    }
  }
}

ValueMetadata *type metadata accessor for ActivityArchivedViewCollection.ViewIndex()
{
  return &type metadata for ActivityArchivedViewCollection.ViewIndex;
}

uint64_t destroy for ActivityArchivedViewCollection.ViewEntry()
{
  return swift_release();
}

uint64_t initializeWithCopy for ActivityArchivedViewCollection.ViewEntry(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 103) = *(_DWORD *)(a2 + 103);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  long long v3 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ActivityArchivedViewCollection.ViewEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(unsigned char *)(a1 + 8) = *((unsigned char *)a2 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 16) = a2[2];
  swift_retain();
  swift_release();
  long long v5 = *(_OWORD *)(a2 + 3);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(a1 + 24) = v5;
  long long v6 = *(_OWORD *)(a2 + 7);
  long long v7 = *(_OWORD *)(a2 + 9);
  long long v8 = *(_OWORD *)(a2 + 11);
  *(_DWORD *)(a1 + 103) = *(_DWORD *)((char *)a2 + 103);
  *(_OWORD *)(a1 + 88) = v8;
  *(_OWORD *)(a1 + 72) = v7;
  *(_OWORD *)(a1 + 56) = v6;
  *(void *)(a1 + 112) = a2[14];
  *(void *)(a1 + 120) = a2[15];
  *(void *)(a1 + 128) = a2[16];
  *(void *)(a1 + 136) = a2[17];
  *(void *)(a1 + 144) = a2[18];
  return a1;
}

__n128 __swift_memcpy152_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = *(__n128 *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  long long v8 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for ActivityArchivedViewCollection.ViewEntry(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_DWORD *)(a1 + 103) = *(_DWORD *)(a2 + 103);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  long long v4 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v4;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityArchivedViewCollection.ViewEntry(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 152)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityArchivedViewCollection.ViewEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 152) = 1;
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
    *(unsigned char *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityArchivedViewCollection.ViewEntry()
{
  return &type metadata for ActivityArchivedViewCollection.ViewEntry;
}

ValueMetadata *type metadata accessor for ActivityArchivedViewCollection.ViewIndex.Base()
{
  return &type metadata for ActivityArchivedViewCollection.ViewIndex.Base;
}

uint64_t sub_191CEB058(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_191CEB0A0()
{
  unint64_t result = qword_1E92E0B40;
  if (!qword_1E92E0B40)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92E0B48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92E0B40);
  }
  return result;
}

uint64_t sub_191CEB0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JindoViewStates.Metadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_191CEB160(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
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

void sub_191CEB2BC(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
      JUMPOUT(0x191CEB4D4);
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

uint64_t type metadata accessor for TemplateDescriptorPreference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_191CEB514()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_191CEB558(uint64_t a1)
{
  long long v6 = *(_OWORD *)(a1 + 16);
  uint64_t v4 = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v5);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(boxed_opaque_existential_1, v1);
  sub_191B54CBC();
  sub_191CF45C8();
  return sub_191B54DCC((uint64_t)v5);
}

uint64_t sub_191CEB608()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_191CEB668()
{
  uint64_t result = swift_getKeyPath();
  qword_1EB44C9D8 = result;
  return result;
}

uint64_t sub_191CEB690()
{
  type metadata accessor for WidgetEnvironment.AnyKey();
  uint64_t v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A8C8);
  uint64_t result = swift_allocObject();
  *(void *)(v0 + 16) = result;
  qword_1EB44C9C0 = v0;
  *(void *)algn_1EB44C9C8 = 0xD000000000000010;
  qword_1EB44C9D0 = 0x8000000191D0DDA0;
  return result;
}

ValueMetadata *type metadata accessor for ShowsWidgetLabelKey()
{
  return &type metadata for ShowsWidgetLabelKey;
}

uint64_t sub_191CEB718()
{
  if (qword_1EB44A838 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_191CEB774()
{
  if (qword_1EB44A860 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB44C9C0;
  swift_retain();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t TimelineReloadPolicy.date.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_191C0B950(v1, a1);
}

uint64_t TimelineReloadPolicy.date.setter(uint64_t a1)
{
  return sub_191CEB810(a1, v1);
}

uint64_t sub_191CEB810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*TimelineReloadPolicy.date.modify())()
{
  return nullsub_1;
}

uint64_t sub_191CEB898()
{
  uint64_t v0 = type metadata accessor for TimelineReloadPolicy();
  __swift_allocate_value_buffer(v0, qword_1EB4493A0);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EB4493A0);
  uint64_t v2 = sub_191CF3178();
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(v1, 1, 1, v2);
}

uint64_t static TimelineReloadPolicy.atEnd.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_191CEBAB0(&qword_1EB448F68, (uint64_t)qword_1EB4493A0, a1);
}

uint64_t type metadata accessor for TimelineReloadPolicy()
{
  uint64_t result = qword_1EB44B798;
  if (!qword_1EB44B798) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_191CEB99C()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for TimelineReloadPolicy();
  __swift_allocate_value_buffer(v3, qword_1EB44B1D8);
  uint64_t v4 = __swift_project_value_buffer(v3, (uint64_t)qword_1EB44B1D8);
  sub_191CF3118();
  uint64_t v5 = sub_191CF3178();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 0, 1, v5);
  return sub_191BDDFC8((uint64_t)v2, v4);
}

uint64_t static TimelineReloadPolicy.never.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_191CEBAB0(&qword_1EB44B1C0, (uint64_t)qword_1EB44B1D8, a1);
}

uint64_t sub_191CEBAB0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for TimelineReloadPolicy();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);

  return sub_191CC54C8(v6, a3);
}

uint64_t static TimelineReloadPolicy.after(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_191CF3178();
  uint64_t v7 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v4);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56);

  return v5(a2, 0, 1, v4);
}

uint64_t sub_191CEBBE8()
{
  return 1702125924;
}

uint64_t sub_191CEBBF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 1702125924 && a2 == 0xE400000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_191CF6348();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_191CEBC80(uint64_t a1)
{
  unint64_t v2 = sub_191CEC5C4();

  return MEMORY[0x1F41862A8](a1, v2);
}

uint64_t sub_191CEBCBC(uint64_t a1)
{
  unint64_t v2 = sub_191CEC5C4();

  return MEMORY[0x1F41862B0](a1, v2);
}

uint64_t TimelineReloadPolicy.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB44A338);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_191CEC5C4();
  sub_191CF6528();
  sub_191CF3178();
  sub_191CED128((unint64_t *)&unk_1EB44BA50);
  sub_191CF6208();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t TimelineReloadPolicy.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v16 = (uint64_t)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB447250);
  uint64_t v15 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  size_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for TimelineReloadPolicy();
  MEMORY[0x1F4188790](v9 - 8);
  int v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_191CF3178();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_191CEC5C4();
  sub_191CF6508();
  if (!v2)
  {
    sub_191CED128(&qword_1EB448DB8);
    sub_191CF6108();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v6);
    sub_191CEB810(v16, (uint64_t)v11);
    sub_191CC54C8((uint64_t)v11, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return sub_191CEC618((uint64_t)v11);
}

uint64_t sub_191CEC0CC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return TimelineReloadPolicy.init(from:)(a1, a2);
}

uint64_t sub_191CEC0E4(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(qword_1EB44A338);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_191CEC5C4();
  sub_191CF6528();
  sub_191CF3178();
  sub_191CED128((unint64_t *)&unk_1EB44BA50);
  sub_191CF6208();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL _s9WidgetKit20TimelineReloadPolicyV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_191CF3178();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E1AC0);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8);
  int v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  uint64_t v13 = MEMORY[0x1F4188790](v12 - 8);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x1F4188790](v13);
  uint64_t v18 = (char *)&v26 - v17;
  MEMORY[0x1F4188790](v16);
  uint64_t v20 = (char *)&v26 - v19;
  sub_191C0B950(a1, (uint64_t)&v26 - v19);
  sub_191C0B950(a2, (uint64_t)v18);
  uint64_t v21 = (uint64_t)&v11[*(int *)(v9 + 56)];
  sub_191C0B950((uint64_t)v20, (uint64_t)v11);
  sub_191C0B950((uint64_t)v18, v21);
  uint64_t v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22((uint64_t)v11, 1, v4) == 1)
  {
    sub_191B01770((uint64_t)v18, &qword_1EB44B520);
    sub_191B01770((uint64_t)v20, &qword_1EB44B520);
    if (v22(v21, 1, v4) == 1)
    {
      sub_191B01770((uint64_t)v11, &qword_1EB44B520);
      return 1;
    }
    goto LABEL_6;
  }
  sub_191C0B950((uint64_t)v11, (uint64_t)v15);
  if (v22(v21, 1, v4) == 1)
  {
    sub_191B01770((uint64_t)v18, &qword_1EB44B520);
    sub_191B01770((uint64_t)v20, &qword_1EB44B520);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v15, v4);
LABEL_6:
    sub_191B01770((uint64_t)v11, &qword_1E92E1AC0);
    return 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v21, v4);
  sub_191CED128((unint64_t *)&qword_1E92E1AB8);
  char v23 = sub_191CF52F8();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v7, v4);
  sub_191B01770((uint64_t)v18, &qword_1EB44B520);
  sub_191B01770((uint64_t)v20, &qword_1EB44B520);
  v24(v15, v4);
  sub_191B01770((uint64_t)v11, &qword_1EB44B520);
  return (v23 & 1) != 0;
}

unint64_t sub_191CEC5C4()
{
  unint64_t result = qword_1EB44A4E8;
  if (!qword_1EB44A4E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB44A4E8);
  }
  return result;
}

uint64_t sub_191CEC618(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TimelineReloadPolicy();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for TimelineReloadPolicy(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520) - 8);
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
    uint64_t v7 = sub_191CF3178();
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

uint64_t destroy for TimelineReloadPolicy(uint64_t a1)
{
  uint64_t v2 = sub_191CF3178();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *initializeWithCopy for TimelineReloadPolicy(void *a1, const void *a2)
{
  uint64_t v4 = sub_191CF3178();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithCopy for TimelineReloadPolicy(void *a1, void *a2)
{
  uint64_t v4 = sub_191CF3178();
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

void *initializeWithTake for TimelineReloadPolicy(void *a1, const void *a2)
{
  uint64_t v4 = sub_191CF3178();
  uint64_t v5 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, v4))
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  return a1;
}

void *assignWithTake for TimelineReloadPolicy(void *a1, void *a2)
{
  uint64_t v4 = sub_191CF3178();
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
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
    memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, v4);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimelineReloadPolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_191CECDC8);
}

uint64_t sub_191CECDC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TimelineReloadPolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_191CECE4C);
}

uint64_t sub_191CECE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44B520);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

void sub_191CECEC0()
{
  sub_191B6EC84();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unsigned char *storeEnumTagSinglePayload for TimelineReloadPolicy.CodingKeys(unsigned char *result, int a2, int a3)
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
      JUMPOUT(0x191CECFE8);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimelineReloadPolicy.CodingKeys()
{
  return &type metadata for TimelineReloadPolicy.CodingKeys;
}

unint64_t sub_191CED024()
{
  unint64_t result = qword_1E92E58C8;
  if (!qword_1E92E58C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92E58C8);
  }
  return result;
}

unint64_t sub_191CED07C()
{
  unint64_t result = qword_1EB44A4F8;
  if (!qword_1EB44A4F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB44A4F8);
  }
  return result;
}

unint64_t sub_191CED0D4()
{
  unint64_t result = qword_1EB44A4F0;
  if (!qword_1EB44A4F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB44A4F0);
  }
  return result;
}

uint64_t sub_191CED128(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_191CF3178();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL ActivityMetrics.isUnitScale.getter()
{
  return *(double *)(v0 + 24) == 1.0;
}

double ActivityMetrics.rawSizePixelAligned(with:)(double a1)
{
  *(void *)&double result = *(_OWORD *)&vmulq_n_f64(vrndmq_f64(vdivq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 / a1 * 0.5), 0), *v1), (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 / a1), 0))), 1.0 / a1);
  return result;
}

double ActivityMetrics.effectiveCornerRadius.getter()
{
  return *(double *)(v0 + 16) * *(double *)(v0 + 24);
}

float64_t ActivityMetrics.effectiveSizePixelAligned(with:)(double a1)
{
  double v3 = v1[1].f64[1];
  float64x2_t v4 = vmulq_n_f64(*v1, v3);
  if (v3 != 1.0) {
    *(void *)&v4.f64[0] = *(_OWORD *)&vmulq_n_f64(vrndmq_f64(vdivq_f64(vaddq_f64((float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 / a1 * 0.5), 0), v4), (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 / a1), 0))), 1.0 / a1);
  }
  return v4.f64[0];
}

double ActivityMetrics.cornerRadius.getter()
{
  return *(double *)(v0 + 16);
}

double ActivityMetrics.scaleFactor.getter()
{
  return *(double *)(v0 + 24);
}

ValueMetadata *type metadata accessor for ActivityMetrics()
{
  return &type metadata for ActivityMetrics;
}

void sub_191CED230()
{
  qword_1E92E0688 = (uint64_t)&unk_1EE29C160;
}

uint64_t WidgetExtensionPointNames.getter()
{
  if (qword_1E92E0718 != -1) {
    swift_once();
  }

  return swift_bridgeObjectRetain();
}

void NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(uint64_t a1)
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA80]), sel_init);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    do
    {
      ++v4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44C730);
      objc_msgSend(v2, sel_addObject_, sub_191CF63B8());
      swift_unknownObjectRelease();
    }
    while (v3 != v4);
    swift_bridgeObjectRelease();
  }
  id v5 = v2;
  sub_191CF56F8();

  sub_191CF5FC8();
  __break(1u);
}

void sub_191CED46C()
{
  uint64_t v0 = self;
  uint64_t v1 = &unk_1EE2B2938;
  id v2 = objc_msgSend(v0, sel_interfaceWithProtocol_, v1);

  qword_1EB44AD10 = (uint64_t)v2;
}

id sub_191CED4D4()
{
  id result = sub_191CED4F4();
  qword_1EB44C5A8 = (uint64_t)result;
  return result;
}

id sub_191CED4F4()
{
  id v0 = objc_msgSend(self, sel_interfaceWithProtocol_, &unk_1EE2B0BA0);
  sub_191BCB984();
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_191CF8420;
  uint64_t v2 = sub_191B016E0(0, (unint64_t *)&unk_1EB44C720);
  *(void *)(inited + 32) = v2;
  *(void *)(inited + 40) = sub_191B016E0(0, &qword_1EB44C5B0);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(inited);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v3 = swift_initStackObject();
  *(_OWORD *)(v3 + 16) = xmmword_191CF8410;
  *(void *)(v3 + 32) = type metadata accessor for DescriptorFetchResult();
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v3);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v4 = swift_initStackObject();
  *(_OWORD *)(v4 + 16) = xmmword_191CF8410;
  *(void *)(v4 + 32) = sub_191B016E0(0, &qword_1EB44C6D8);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v4);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v5 = swift_initStackObject();
  *(_OWORD *)(v5 + 16) = xmmword_191CF8410;
  *(void *)(v5 + 32) = sub_191B016E0(0, &qword_1EB44C6D0);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v5);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_191CF8410;
  *(void *)(v6 + 32) = type metadata accessor for ModifyControlStateRequest();
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v6);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v7 = swift_initStackObject();
  *(_OWORD *)(v7 + 16) = xmmword_191CF8410;
  uint64_t v8 = sub_191B016E0(0, (unint64_t *)&qword_1EB44C740);
  *(void *)(v7 + 32) = v8;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v7);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_191CF8420;
  *(void *)(v9 + 32) = v2;
  *(void *)(v9 + 40) = type metadata accessor for ControlTemplateRequest();
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v9);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v10 = swift_initStackObject();
  *(_OWORD *)(v10 + 16) = xmmword_191CF8410;
  *(void *)(v10 + 32) = v8;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v10);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v11 = swift_initStackObject();
  *(_OWORD *)(v11 + 16) = xmmword_191CF8420;
  *(void *)(v11 + 32) = v2;
  *(void *)(v11 + 40) = type metadata accessor for PlaceholderRequest();
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v11);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v12 = swift_initStackObject();
  *(_OWORD *)(v12 + 16) = xmmword_191CF8410;
  *(void *)(v12 + 32) = v8;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v12);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v13 = swift_initStackObject();
  *(_OWORD *)(v13 + 16) = xmmword_191CF8420;
  *(void *)(v13 + 32) = v2;
  *(void *)(v13 + 40) = type metadata accessor for TimelineRequest();
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v13);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v14 = swift_initStackObject();
  *(_OWORD *)(v14 + 16) = xmmword_191CF8410;
  *(void *)(v14 + 32) = v8;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v14);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v15 = swift_initStackObject();
  *(_OWORD *)(v15 + 16) = xmmword_191CF8410;
  *(void *)(v15 + 32) = sub_191B016E0(0, &qword_1EB44C370);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v15);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v16 = swift_initStackObject();
  *(_OWORD *)(v16 + 16) = xmmword_191CF8410;
  *(void *)(v16 + 32) = sub_191B016E0(0, &qword_1EB44C680);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v16);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v17 = swift_initStackObject();
  *(_OWORD *)(v17 + 16) = xmmword_191CF8410;
  *(void *)(v17 + 32) = v8;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v17);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v18 = swift_initStackObject();
  *(_OWORD *)(v18 + 16) = xmmword_191CF8420;
  *(void *)(v18 + 32) = v2;
  *(void *)(v18 + 40) = type metadata accessor for ActivityWidgetRequest(0);
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v18);
  swift_setDeallocating();
  sub_191BCB984();
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = xmmword_191CF8410;
  *(void *)(v19 + 32) = v8;
  NSXPCInterface.setClasses(_:for:argumentIndex:ofReply:)(v19);
  swift_setDeallocating();
  return v0;
}

id sub_191CEDA8C(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

id sub_191CEDBC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44BA60);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v9 = (void *)sub_191CF5528();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  sub_191C2BA14(a2, (uint64_t)v8);
  uint64_t v10 = sub_191CF31D8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    uint64_t v12 = (void *)sub_191CF3198();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  uint64_t v13 = (objc_class *)type metadata accessor for _WidgetExtensionBaseContext();
  v17.receiver = v3;
  v17.super_class = v13;
  id v14 = objc_msgSendSuper2(&v17, sel_initWithInputItems_contextUUID_, v9, v12);

  id v15 = v14;
  sub_191C2BA7C(a2);
  if (v15) {

  }
  return v15;
}

id sub_191CEDE84(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44BA60);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v11 = (void *)sub_191CF5528();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = 0;
  }
  sub_191C2BA14(a3, (uint64_t)v10);
  uint64_t v12 = sub_191CF31D8();
  uint64_t v13 = *(void *)(v12 - 8);
  id v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    id v14 = (void *)sub_191CF3198();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  id v15 = (objc_class *)type metadata accessor for _WidgetExtensionBaseContext();
  v19.receiver = v4;
  v19.super_class = v15;
  id v16 = objc_msgSendSuper2(&v19, sel_initWithInputItems_listenerEndpoint_contextUUID_, v11, a2, v14);

  id v17 = v16;
  sub_191C2BA7C(a3);
  if (v17) {

  }
  return v17;
}

id sub_191CEE160()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _WidgetExtensionBaseContext();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _WidgetExtensionBaseContext()
{
  return self;
}

uint64_t dispatch thunk of ViewStates.count.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of ViewStates.makeMetadata()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of ViewStates.updateState<A>(at:host:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of ViewStates.filteredImage(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

ValueMetadata *type metadata accessor for DynamicIslandBackground()
{
  return &type metadata for DynamicIslandBackground;
}

uint64_t sub_191CEE264(uint64_t a1)
{
  uint64_t v1 = (void (*)(void))MEMORY[0x1F4188790](a1);
  v1();
  return sub_191CF5038();
}

uint64_t sub_191CEE2F8(uint64_t a1)
{
  MEMORY[0x1F4188790](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_191CF3A48();
}

uint64_t sub_191CEE3C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a4 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](a1);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  (*(void (**)(char *))(v11 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v12 = sub_191CF3A48();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2, a4);
  sub_191CF5048();
  return v12;
}

ValueMetadata *type metadata accessor for DynamicIslandBackgroundModifier()
{
  return &type metadata for DynamicIslandBackgroundModifier;
}

uint64_t *initializeBufferWithCopyOfBuffer for DynamicIslandBackground.Storage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_191B9CDAC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for DynamicIslandBackground.Storage(uint64_t a1)
{
  return sub_191B9CDF8(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *_s9WidgetKit23DynamicIslandBackgroundV7StorageOwca_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_191B9CDAC(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_191B9CDF8(v5, v6);
  return a1;
}

uint64_t *assignWithTake for DynamicIslandBackground.Storage(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_191B9CDF8(v3, v4);
  return a1;
}

uint64_t _s9WidgetKit23DynamicIslandBackgroundV7StorageOwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x3FFD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 16381);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 50) >> 12) | (4
                                                           * ((*(void *)(a1 + 8) >> 50) & 0xC00 | ((*(void *)(a1 + 8) & 7) << 7) | (*(void *)a1 >> 57) & 0x78 | *(void *)a1 & 7))) ^ 0x3FFF;
  if (v3 >> 2 >= 0xFFF) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s9WidgetKit23DynamicIslandBackgroundV7StorageOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x3FFC)
  {
    *(void *)id result = a2 - 16381;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x3FFD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x3FFD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      unint64_t v3 = (-a2 >> 2) & 0xFFF | ((-a2 & 0x3FFF) << 12);
      *(void *)id result = (v3 | (v3 << 57)) & 0xF000000000000007;
      *(void *)(result + 8) = ((v3 >> 7) | (v3 << 50)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_191CEE70C(void *a1)
{
  uint64_t v1 = a1[1] >> 62;
  if (v1 == 3) {
    return (*a1 >> 3) + 3;
  }
  else {
    return v1;
  }
}

uint64_t sub_191CEE728(uint64_t result)
{
  *(void *)(result + 8) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

void *sub_191CEE738(void *result, uint64_t a2)
{
  if (a2 < 3)
  {
    uint64_t v2 = result[1] & 0xFFFFFFFFFFFFFF8 | (a2 << 62);
    *result &= 0xFFFFFFFFFFFFFF8uLL;
    result[1] = v2;
  }
  else
  {
    *id result = 8 * (a2 - 3);
    result[1] = 0xC000000000000000;
  }
  return result;
}

ValueMetadata *type metadata accessor for DynamicIslandBackground.Storage()
{
  return &type metadata for DynamicIslandBackground.Storage;
}

uint64_t sub_191CEE778()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_191CEE794@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v51 = a1;
  uint64_t v56 = a4;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E11E0);
  MEMORY[0x1F4188790](v47);
  uint64_t v43 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E12C8);
  MEMORY[0x1F4188790](v45);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E12F0);
  MEMORY[0x1F4188790](v55);
  uint64_t v48 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E11F0);
  MEMORY[0x1F4188790](v46);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E1200);
  MEMORY[0x1F4188790](v44);
  uint64_t v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E12D0);
  MEMORY[0x1F4188790](v52);
  uint64_t v54 = (uint64_t)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E12C0);
  MEMORY[0x1F4188790](v14);
  id v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E12E0);
  MEMORY[0x1F4188790](v53);
  uint64_t v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E1310);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  unint64_t v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  char v23 = (char *)&v43 - v22;
  unint64_t v49 = a3;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v39 = v50;
      swift_retain();
      char v40 = sub_191CF4948();
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v10, v51, v19);
      uint64_t v41 = &v10[*(int *)(v46 + 36)];
      *(void *)uint64_t v41 = v39;
      v41[8] = v40;
      sub_191B01614((uint64_t)v10, (uint64_t)v7, &qword_1E92E11F0);
      swift_storeEnumTagMultiPayload();
      sub_191CEEFB8();
      sub_191CEF07C();
      swift_retain();
      uint64_t v42 = (uint64_t)v48;
      sub_191CF44D8();
      sub_191B01614(v42, v54, &qword_1E92E12F0);
      swift_storeEnumTagMultiPayload();
      sub_191CEF140();
      sub_191CEF2A4();
      sub_191CF44D8();
      sub_191B9CDF8(v39, v49);
      sub_191B01770(v42, &qword_1E92E12F0);
      uint64_t v29 = (uint64_t)v10;
      uint64_t v30 = &qword_1E92E11F0;
      return sub_191B01770(v29, v30);
    case 2uLL:
      unint64_t v31 = v49;
      unint64_t v32 = v49 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v43, v51, v19);
      uint64_t v34 = v33 + *(int *)(v47 + 36);
      uint64_t v35 = v50;
      *(void *)uint64_t v34 = v50;
      *(void *)(v34 + 8) = v32;
      *(_WORD *)(v34 + 16) = 256;
      sub_191B01614(v33, (uint64_t)v7, &qword_1E92E11E0);
      swift_storeEnumTagMultiPayload();
      sub_191B9CDAC(v35, v31);
      sub_191CEEFB8();
      sub_191CEF07C();
      swift_retain();
      swift_retain();
      uint64_t v36 = (uint64_t)v48;
      sub_191CF44D8();
      sub_191B01614(v36, v54, &qword_1E92E12F0);
      swift_storeEnumTagMultiPayload();
      sub_191CEF140();
      sub_191CEF2A4();
      sub_191CF44D8();
      swift_release();
      swift_release();
      sub_191B01770(v36, &qword_1E92E12F0);
      uint64_t v29 = v33;
      uint64_t v30 = &qword_1E92E11E0;
      return sub_191B01770(v29, v30);
    case 3uLL:
      uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
      v37((char *)&v43 - v22, v51, v19);
      v37(v16, (uint64_t)v23, v19);
      swift_storeEnumTagMultiPayload();
      sub_191B00398(&qword_1E92E1308, &qword_1E92E1310);
      sub_191CEF1E0();
      sub_191CF44D8();
      sub_191B01614((uint64_t)v18, v54, &qword_1E92E12E0);
      swift_storeEnumTagMultiPayload();
      sub_191CEF140();
      sub_191CEF2A4();
      sub_191CF44D8();
      sub_191B01770((uint64_t)v18, &qword_1E92E12E0);
      return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    default:
      uint64_t v24 = v50;
      swift_retain();
      uint64_t v25 = sub_191CF5088();
      uint64_t v27 = v26;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v12, v51, v19);
      size_t v28 = (uint64_t *)&v12[*(int *)(v44 + 36)];
      *size_t v28 = v24;
      v28[1] = v25;
      v28[2] = v27;
      sub_191B01614((uint64_t)v12, (uint64_t)v16, &qword_1E92E1200);
      swift_storeEnumTagMultiPayload();
      sub_191B00398(&qword_1E92E1308, &qword_1E92E1310);
      sub_191CEF1E0();
      swift_retain();
      sub_191CF44D8();
      sub_191B01614((uint64_t)v18, v54, &qword_1E92E12E0);
      swift_storeEnumTagMultiPayload();
      sub_191CEF140();
      sub_191CEF2A4();
      sub_191CF44D8();
      sub_191B9CDF8(v24, v49);
      sub_191B01770((uint64_t)v18, &qword_1E92E12E0);
      uint64_t v29 = (uint64_t)v12;
      uint64_t v30 = &qword_1E92E1200;
      return sub_191B01770(v29, v30);
  }
}

uint64_t sub_191CEEFB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_191CEE794(a1, *(void *)v2, *(void *)(v2 + 8), a2);
}

unint64_t sub_191CEEFB8()
{
  unint64_t result = qword_1E92E11E8;
  if (!qword_1E92E11E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92E11F0);
    sub_191B00398(&qword_1E92E1308, &qword_1E92E1310);
    sub_191B00398(&qword_1E92E1338, &qword_1E92E1340);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92E11E8);
  }
  return result;
}

unint64_t sub_191CEF07C()
{
  unint64_t result = qword_1E92E11D8;
  if (!qword_1E92E11D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92E11E0);
    sub_191B00398(&qword_1E92E1308, &qword_1E92E1310);
    sub_191B00398(&qword_1E92E1328, &qword_1E92E1330);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92E11D8);
  }
  return result;
}

unint64_t sub_191CEF140()
{
  unint64_t result = qword_1E92E12D8;
  if (!qword_1E92E12D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92E12E0);
    sub_191B00398(&qword_1E92E1308, &qword_1E92E1310);
    sub_191CEF1E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92E12D8);
  }
  return result;
}

unint64_t sub_191CEF1E0()
{
  unint64_t result = qword_1E92E11F8;
  if (!qword_1E92E11F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E92E1200);
    sub_191B00398(&qword_1E92E1308, &qword_1E92E1310);
    sub_191B00398(&qword_1E92E12B0, &qword_1E92E12B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E92E11F8);
  }
  return result;
}

uint64_t sub_191CEF2A4()
{
  return sub_191CEF2E0(&qword_1E92E12E8, &qword_1E92E12F0, (void (*)(void))sub_191CEEFB8, (void (*)(void))sub_191CEF07C);
}

uint64_t sub_191CEF2E0(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
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

uint64_t sub_191CEF368()
{
  return sub_191CEF2E0(&qword_1E92E12F8, &qword_1E92E1300, (void (*)(void))sub_191CEF140, (void (*)(void))sub_191CEF2A4);
}

uint64_t sub_191CEF3C4(uint64_t a1)
{
  if (!*v1) {
    return MEMORY[0x1E4FBC860];
  }
  MEMORY[0x1F4188790](a1);
  type metadata accessor for WidgetRelevanceEntry();
  sub_191CF5618();
  sub_191CEFEFC();
  swift_getWitnessTable();
  return sub_191CF5458();
}

uint64_t sub_191CEF4B4()
{
  uint64_t v1 = sub_191CF2D68();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  unint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92E27F0);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (uint64_t *)((char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44A150) - 8;
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *v0;
  uint64_t result = MEMORY[0x1E4FBC860];
  if (*v0)
  {
    uint64_t v32 = MEMORY[0x1E4FBC860];
    uint64_t v14 = *(void *)(v12 + 16);
    if (v14)
    {
      uint64_t v15 = v12 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
      uint64_t v16 = *(void *)(v9 + 72);
      uint64_t v30 = (void (**)(char *, uint64_t *, uint64_t))(v2 + 32);
      uint64_t v31 = v16;
      uint64_t v29 = (void (**)(char *, uint64_t))(v2 + 8);
      uint64_t v27 = v12;
      swift_bridgeObjectRetain();
      size_t v28 = v4;
      while (1)
      {
        sub_191B01614(v15, (uint64_t)v11, (uint64_t *)&unk_1EB44A150);
        sub_191B01614((uint64_t)v11, (uint64_t)v7, &qword_1E92E27F0);
        if (swift_getEnumCaseMultiPayload() != 1) {
          break;
        }
        unint64_t v17 = v7[1];
        if (!v17)
        {
          id v23 = objc_msgSend(self, sel_ungrouped);
LABEL_12:
          id v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F58EA8]), sel_initWithAttribute_intentReference_, v23, 0);

          uint64_t v26 = sub_191CEFF3C((uint64_t)v11);
          if (v25)
          {
            MEMORY[0x192FE4280](v26);
            if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_191CF5588();
            }
            sub_191CF55D8();
            sub_191CF5558();
          }
          goto LABEL_5;
        }
        if (v17 != 1)
        {
          uint64_t v18 = *v7;
          id v19 = objc_allocWithZone(MEMORY[0x1E4F58EB0]);
          uint64_t v20 = v5;
          uint64_t v21 = v1;
          unint64_t v22 = (void *)sub_191CF5318();
          sub_191C047E0(v18, v17);
          id v23 = objc_msgSend(v19, sel_initWithNamedGroupIdentifier_, v22);

          uint64_t v1 = v21;
          uint64_t v5 = v20;
          unint64_t v4 = v28;
          goto LABEL_12;
        }
        sub_191CEFF3C((uint64_t)v11);
LABEL_5:
        v15 += v31;
        if (!--v14)
        {
          swift_bridgeObjectRelease();
          return v32;
        }
      }
      (*v30)(v4, v7, v1);
      uint64_t v24 = (void *)sub_191CF2D58();
      id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F58EC8]), sel_initWithRelevantContext_, v24);

      (*v29)(v4, v1);
      goto LABEL_12;
    }
  }
  return result;
}

uint64_t sub_191CEF86C(uint64_t a1)
{
  v24[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = type metadata accessor for WidgetRelevanceEntry();
  uint64_t v4 = sub_191CF5BC8();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v23 - v7;
  uint64_t v9 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v11 = (void *)((char *)v23 - v10);
  id v12 = *v1;
  if (!*v1) {
    return MEMORY[0x1E4FBC860];
  }
  v24[0] = *v1;
  sub_191CF5618();
  swift_getWitnessTable();
  sub_191CF5828();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v8, 1, v3) != 1)
  {
    (*(void (**)(uint64_t *, char *, uint64_t))(v9 + 32))(v11, v8, v3);
    uint64_t v14 = self;
    uint64_t v15 = *v11;
    v24[0] = 0;
    id v16 = objc_msgSend(v14, sel__schemaDataFromIntent_error_, v15, v24);
    unint64_t v17 = v16;
    if (v24[0])
    {
      id v18 = v24[0];

      swift_willThrow();
    }
    else if (v16)
    {
      uint64_t v19 = sub_191CF30C8();
      unint64_t v20 = v21;

      goto LABEL_10;
    }
    uint64_t v19 = 0;
    unint64_t v20 = 0xF000000000000000;
LABEL_10:
    v23[0] = v23;
    v24[0] = v12;
    MEMORY[0x1F4188790](v16);
    v23[-4] = v2;
    v23[-3] = v19;
    v23[-2] = v20;
    sub_191CEFEFC();
    swift_getWitnessTable();
    uint64_t v13 = sub_191CF5458();
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v3);
    sub_191B170C8(v19, v20);
    return v13;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return MEMORY[0x1E4FBC860];
}

void sub_191CEFBC0(void *a1@<X8>)
{
  id v2 = objc_msgSend(self, sel_mainBundle);
  id v3 = objc_msgSend(v2, sel_bundleIdentifier);

  if (v3)
  {
    sub_191CF5338();

    sub_191CF2D18();
    sub_191CF2C98();
    id v4 = objc_allocWithZone(MEMORY[0x1E4F302B8]);
    uint64_t v5 = (void *)sub_191CF5318();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    uint64_t v6 = sub_191CF6328();
    __swift_project_boxed_opaque_existential_1(v13, v13[3]);
    id v7 = objc_msgSend(v4, sel_initWithAppBundleIdentifier_linkAction_linkActionMetadata_, v5, v6, sub_191CF6328());
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F58D00]), sel_initWithIntent_, v7);
    uint64_t v9 = type metadata accessor for WidgetRelevanceEntry();
    id v10 = sub_191C04584(v9);
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F58EA8]), sel_initWithAttribute_intentReference_, v10, v8);
    }
    else
    {

      id v12 = 0;
    }
    *a1 = v12;
  }
  else
  {
    __break(1u);
  }
}

void sub_191CEFDC8(id *a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v8 = type metadata accessor for WidgetRelevanceEntry();
  id v9 = sub_191C04584(v8);
  if (v9)
  {
    id v10 = v9;
    id v11 = *a1;
    if (a3 >> 60 == 15)
    {
      id v12 = 0;
    }
    else
    {
      sub_191B169E8(a2, a3);
      id v12 = (void *)sub_191CF30A8();
      sub_191B170C8(a2, a3);
    }
    id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F58D00]), sel_initWithIntent_schemaData_, v11, v12);

    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F58EA8]), sel_initWithAttribute_intentReference_, v10, v14);
  }
  else
  {
    id v13 = 0;
  }
  *a4 = v13;
}

void sub_191CEFEDC(id *a1@<X0>, void *a2@<X8>)
{
  sub_191CEFDC8(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

unint64_t sub_191CEFEFC()
{
  unint64_t result = qword_1EB44ABD0;
  if (!qword_1EB44ABD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB44ABD0);
  }
  return result;
}

uint64_t sub_191CEFF3C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB44A150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_191CEFF9C(void *a1@<X8>)
{
}

uint64_t dispatch thunk of TogglableAppIntent.isOn.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TogglableAppIntent.isOn.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of TogglableAppIntent.isOn.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SetValueAppIntent.newValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SetValueAppIntent.newValue.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SetValueAppIntent.newValue.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t EnvironmentValues._widgetRenderScheme.getter()
{
  sub_191B4F68C();

  return sub_191CF4068();
}

uint64_t EnvironmentValues._widgetRenderScheme.setter()
{
  return sub_191CF4078();
}

uint64_t sub_191CF0118()
{
  uint64_t result = swift_getKeyPath();
  qword_1EB44C918 = result;
  return result;
}

uint64_t sub_191CF0140()
{
  type metadata accessor for WidgetEnvironment.AnyKey();
  uint64_t v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44A628);
  uint64_t result = swift_allocObject();
  *(void *)(v0 + 16) = result;
  qword_1EB44C900 = v0;
  *(void *)algn_1EB44C908 = 0xD000000000000012;
  qword_1EB44C910 = 0x8000000191D12EC0;
  return result;
}

uint64_t sub_191CF01B8()
{
  if (qword_1EB44A570 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_191CF0214()
{
  if (qword_1EB44A6A8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB44C900;
  swift_retain();
  swift_bridgeObjectRetain();
  return v0;
}

void sub_191CF0294(uint64_t a1@<X8>)
{
  uint64_t v1 = qword_1E92E5938;
  *(unsigned char *)a1 = byte_1E92E5930;
  *(void *)(a1 + 8) = v1;
}

uint64_t sub_191CF02B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_191C0417C();

  return MEMORY[0x1F40F8670](a1, a2, a3, a4, v8);
}

void (*EnvironmentValues._widgetRenderScheme.modify(void *a1))(char **a1)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_191B4F68C();
  sub_191CF4068();
  return sub_191CF038C;
}

void sub_191CF038C(char **a1)
{
  uint64_t v1 = *a1;
  char v2 = **a1;
  uint64_t v3 = *((void *)*a1 + 1);
  BOOL v4 = v3 != 1;
  v1[16] = v2;
  *((void *)v1 + 3) = v3;
  sub_191CF4078();
  v1[16] = v4;
  sub_191BA09FC();
  sub_191CF4078();
  v1[16] = v2;
  sub_191AF6A58();
  sub_191CF4078();

  free(v1);
}

ValueMetadata *_s32WidgetRenderSchemeEnvironmentKeyVMa()
{
  return &_s32WidgetRenderSchemeEnvironmentKeyVN;
}

ValueMetadata *type metadata accessor for WidgetRenderSchemeKey()
{
  return &type metadata for WidgetRenderSchemeKey;
}

unint64_t sub_191CF0470()
{
  unint64_t result = qword_1EB44A658;
  if (!qword_1EB44A658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB44A658);
  }
  return result;
}

unint64_t sub_191CF04C8()
{
  unint64_t result = qword_1EB44A660;
  if (!qword_1EB44A660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB44A660);
  }
  return result;
}

unint64_t sub_191CF0520()
{
  unint64_t result = qword_1EB44A650;
  if (!qword_1EB44A650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB44A650);
  }
  return result;
}

void TimelineProviderContext.EnvironmentVariants.init(_:)(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t KeyPath = swift_getKeyPath();
  id v16 = v3;
  uint64_t v5 = sub_191AFA674(KeyPath);

  swift_release();
  if (v5)
  {
    unint64_t v6 = MEMORY[0x1E4FBC860];
    unint64_t v20 = MEMORY[0x1E4FBC860];
    uint64_t v7 = *(void *)(v5 + 16);
    if (v7)
    {
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)(v5 + 8 * i + 32))
        {
          uint64_t v9 = swift_retain();
          MEMORY[0x192FE4280](v9);
          if (*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_191CF5588();
          }
          sub_191CF55D8();
          sub_191CF5558();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v10 = v20;
    }
    else
    {
      unint64_t v10 = MEMORY[0x1E4FBC860];
    }
    swift_bridgeObjectRelease();
    unint64_t v19 = v6;
    unint64_t v20 = v6;
    unint64_t v18 = v6;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_191CF6018();
      if (v13) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v13 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v13)
      {
LABEL_14:
        if (v13 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v14 = 0;
        do
        {
          if ((v10 & 0xC000000000000001) != 0)
          {
            uint64_t v15 = MEMORY[0x192FE4B60](v14, v10);
          }
          else
          {
            uint64_t v15 = *(void *)(v10 + 8 * v14 + 32);
            swift_retain();
          }
          ++v14;
          uint64_t v17 = v15;
          sub_191CF0BDC((uint64_t)&v17, &v20, &v19, &v18);
          swift_release();
        }
        while (v13 != v14);
        swift_bridgeObjectRelease_n();
        uint64_t v5 = v19;
        unint64_t v11 = v20;
        unint64_t v12 = v18;
        goto LABEL_23;
      }
    }
    swift_bridgeObjectRelease_n();
    unint64_t v12 = MEMORY[0x1E4FBC860];
    uint64_t v5 = MEMORY[0x1E4FBC860];
    unint64_t v11 = MEMORY[0x1E4FBC860];
LABEL_23:
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
  unint64_t v11 = 0;
  unint64_t v12 = 0;
LABEL_24:
  *a2 = v16;
  a2[1] = v11;
  a2[2] = v5;
  a2[3] = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void TimelineProviderContext.init(environmentVariants:family:isPreview:archiveVersion:)(uint64_t a1@<X0>, char *a2@<X1>, char a3@<W2>, char *a4@<X3>, uint64_t a5@<X8>)
{
  id v7 = *(id *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void *)(a1 + 24);
  unint64_t v10 = *a2;
  if (v10 >= 0xD) {
    goto LABEL_22;
  }
  char v11 = *a2;
  if (((0x13BFu >> v10) & 1) == 0) {
    goto LABEL_22;
  }
  char v13 = *a4;
  char v28 = byte_191D0C2A6[v10];
  uint64_t KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain_n();
  id v15 = v7;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v7 = v15;
  uint64_t v16 = sub_191CF1288(KeyPath, (unint64_t)v7, v6, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  if (v16)
  {
    if (*(void *)(v16 + 16)) {
      double v17 = *(double *)(v16 + 32);
    }
    else {
      double v17 = 2.0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    double v17 = 2.0;
  }
  uint64_t v18 = swift_getKeyPath();
  unint64_t v19 = sub_191CF18E4(v18, v7, v6, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  uint64_t v20 = 0;
  if (!v19)
  {
    uint64_t v24 = 0;
    goto LABEL_19;
  }
  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_191CF6018();
    swift_bridgeObjectRelease();
    if (v26) {
      goto LABEL_12;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t v24 = 0;
    goto LABEL_19;
  }
  if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_18;
  }
LABEL_12:
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v21 = (id)MEMORY[0x192FE4B60](0, v19);
    goto LABEL_15;
  }
  if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v21 = *(id *)(v19 + 32);
LABEL_15:
    unint64_t v22 = v21;
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel__rawLayoutInsetAdjustedSizePixelAlignedForDisplayScale_, v17);
    uint64_t v24 = v23;
    uint64_t v20 = v25;

LABEL_19:
    *(void *)a5 = v7;
    *(void *)(a5 + 8) = v6;
    *(void *)(a5 + 16) = v8;
    *(void *)(a5 + 24) = v9;
    *(unsigned char *)(a5 + 32) = v28;
    *(unsigned char *)(a5 + 33) = v11;
    *(unsigned char *)(a5 + 34) = a3 & 1;
    *(void *)(a5 + 40) = v24;
    *(void *)(a5 + 48) = v20;
    *(unsigned char *)(a5 + 56) = v13;
    return;
  }
  __break(1u);
LABEL_22:
  swift_bridgeObjectRetain();
  id v27 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_191CF6338();
  __break(1u);
}

uint64_t sub_191CF0A90@<X0>(void *a1@<X8>)
{
  sub_191B4F378();
  uint64_t result = sub_191CF4068();
  *a1 = v3;
  return result;
}

uint64_t sub_191CF0AE0@<X0>(void *a1@<X8>)
{
  sub_191B4F378();
  uint64_t result = sub_191CF4068();
  *a1 = v3;
  return result;
}

uint64_t sub_191CF0B30()
{
  uint64_t v0 = swift_retain();
  return EnvironmentValues._localizations.setter(v0);
}

uint64_t sub_191CF0B5C()
{
  uint64_t v0 = swift_retain();
  return EnvironmentValues._localizations.setter(v0);
}

uint64_t sub_191CF0B88@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_191CF3D68();
  *a1 = v3;
  return result;
}

uint64_t sub_191CF0BB4()
{
  return sub_191CF3D78();
}

uint64_t sub_191CF0BDC(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v52 = a2;
  uint64_t v53 = a4;
  unint64_t v49 = a3;
  uint64_t v51 = sub_191CF3B98();
  uint64_t v56 = *(void *)(v51 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v51);
  uint64_t v47 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v55 = (char *)&v47 - v6;
  uint64_t v48 = sub_191CF32D8();
  uint64_t v7 = *(void *)(v48 - 8);
  MEMORY[0x1F4188790](v48);
  uint64_t v54 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB44BD28);
  MEMORY[0x1F4188790](v9 - 8);
  char v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_191CF32C8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x1F4188790](v14);
  unint64_t v19 = (char *)&v47 - v18;
  MEMORY[0x1F4188790](v17);
  id v21 = (char *)&v47 - v20;
  id v50 = (id)sub_191CF5528();
  uint64_t LikeCurrentWithBundleLocalizations = _CFLocaleCreateLikeCurrentWithBundleLocalizations();
  if (LikeCurrentWithBundleLocalizations)
  {
    uint64_t v23 = (void *)LikeCurrentWithBundleLocalizations;
    sub_191CF3238();

    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v24(v11, v19, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v24(v21, v11, v12);
      goto LABEL_6;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_191CF3268();
  sub_191B6C3B0((uint64_t)v11);
LABEL_6:
  uint64_t v25 = v47;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v21, v12);
  uint64_t v26 = v52;
  unint64_t v27 = *v52;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v26 = v27;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v27 = sub_191B41B7C(0, *(void *)(v27 + 16) + 1, 1, v27);
    *uint64_t v52 = v27;
  }
  unint64_t v30 = *(void *)(v27 + 16);
  unint64_t v29 = *(void *)(v27 + 24);
  if (v30 >= v29 >> 1)
  {
    unint64_t v27 = sub_191B41B7C(v29 > 1, v30 + 1, 1, v27);
    *uint64_t v52 = v27;
  }
  *(void *)(v27 + 16) = v30 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v27+ ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))+ *(void *)(v13 + 72) * v30, v16, v12);
  sub_191CF32B8();
  uint64_t v31 = v49;
  unint64_t v32 = *v49;
  char v33 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v31 = v32;
  if ((v33 & 1) == 0)
  {
    unint64_t v32 = sub_191B41B48(0, *(void *)(v32 + 16) + 1, 1, v32);
    *uint64_t v31 = v32;
  }
  unint64_t v35 = *(void *)(v32 + 16);
  unint64_t v34 = *(void *)(v32 + 24);
  if (v35 >= v34 >> 1)
  {
    unint64_t v32 = sub_191B41B48(v34 > 1, v35 + 1, 1, v32);
    *uint64_t v31 = v32;
  }
  *(void *)(v32 + 16) = v35 + 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v32+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(void *)(v7 + 72) * v35, v54, v48);
  sub_191CF3208();
  uint64_t v36 = sub_191CF3218();
  swift_bridgeObjectRelease();
  uint64_t v37 = (unsigned int *)MEMORY[0x1E4F3CBE8];
  if (v36 != 2) {
    uint64_t v37 = (unsigned int *)MEMORY[0x1E4F3CBD8];
  }
  uint64_t v38 = v56;
  uint64_t v39 = v51;
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v25, *v37, v51);
  char v40 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
  v40(v55, v25, v39);
  uint64_t v41 = v53;
  unint64_t v42 = *v53;
  char v43 = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v41 = v42;
  if ((v43 & 1) == 0)
  {
    unint64_t v42 = sub_191B41B14(0, *(void *)(v42 + 16) + 1, 1, v42);
    *uint64_t v53 = v42;
  }
  unint64_t v45 = *(void *)(v42 + 16);
  unint64_t v44 = *(void *)(v42 + 24);
  if (v45 >= v44 >> 1)
  {
    unint64_t v42 = sub_191B41B14(v44 > 1, v45 + 1, 1, v42);
    *uint64_t v53 = v42;
  }
  *(void *)(v42 + 16) = v45 + 1;
  v40((char *)(v42+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v45), v55, v39);

  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v21, v12);
}

uint64_t sub_191CF1234@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_191CF3D68();
  *a1 = v3;
  return result;
}

uint64_t sub_191CF1260()
{
  return sub_191CF3D78();
}

uint64_t sub_191CF1288(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_191CF39E8();
  uint64_t v56 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191CF5C78();
  uint64_t KeyPath = swift_getKeyPath();
  char v14 = MEMORY[0x192FE49D0](a1, KeyPath);
  swift_release();
  if (v14)
  {
    if (a3)
    {
      int64_t v15 = *(void *)(a3 + 16);
      goto LABEL_10;
    }
    return 0;
  }
  uint64_t v16 = swift_getKeyPath();
  uint64_t v17 = MEMORY[0x192FE49D0](a1, v16);
  swift_release();
  if (v17)
  {
    if (!a4) {
      return 0;
    }
    int64_t v15 = *(void *)(a4 + 16);
LABEL_10:
    uint64_t v58 = MEMORY[0x1E4FBC860];
    sub_191AFB9DC(0, v15, 0);
    unint64_t v10 = v58;
    if (!v15) {
      return v10;
    }
    goto LABEL_11;
  }
  uint64_t v18 = swift_getKeyPath();
  char v19 = MEMORY[0x192FE49D0](a1, v18);
  swift_release();
  if (v19)
  {
    if (!a5) {
      return 0;
    }
    int64_t v15 = *(void *)(a5 + 16);
    goto LABEL_10;
  }
  uint64_t v21 = swift_getKeyPath();
  char v22 = MEMORY[0x192FE49D0](a1, v21);
  swift_release();
  if (v22)
  {
    uint64_t v23 = swift_getKeyPath();
    id v24 = (id)a2;
    unint64_t v10 = sub_191AFA454(v23);

    swift_release();
    if (!v10) {
      return v10;
    }
    if (v10 >> 62) {
      goto LABEL_49;
    }
    uint64_t v25 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v25)
    {
LABEL_50:
      swift_bridgeObjectRelease();
      uint64_t v27 = MEMORY[0x1E4FBC860];
LABEL_51:
      unint64_t v10 = sub_191C5C1E8(v27);
      swift_bridgeObjectRelease();
      return v10;
    }
    while (1)
    {
      uint64_t v58 = MEMORY[0x1E4FBC860];
      sub_191AFB9DC(0, v25 & ~(v25 >> 63), 0);
      if ((v25 & 0x8000000000000000) == 0)
      {
        uint64_t v26 = 0;
        uint64_t v27 = v58;
        do
        {
          if ((v10 & 0xC000000000000001) != 0) {
            id v28 = (id)MEMORY[0x192FE4B60](v26, v10);
          }
          else {
            id v28 = *(id *)(v10 + 8 * v26 + 32);
          }
          unint64_t v29 = v28;
          objc_msgSend(v28, sel_scale);
          uint64_t v31 = v30;

          uint64_t v58 = v27;
          unint64_t v33 = *(void *)(v27 + 16);
          unint64_t v32 = *(void *)(v27 + 24);
          if (v33 >= v32 >> 1)
          {
            sub_191AFB9DC(v32 > 1, v33 + 1, 1);
            uint64_t v27 = v58;
          }
          ++v26;
          *(void *)(v27 + 16) = v33 + 1;
          *(void *)(v27 + 8 * v33 + 32) = v31;
        }
        while (v25 != v26);
        swift_bridgeObjectRelease();
        goto LABEL_51;
      }
      __break(1u);
LABEL_53:
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_191CF6018();
      swift_bridgeObjectRelease();
LABEL_31:
      uint64_t v39 = MEMORY[0x1E4FBC860];
      if (!v38) {
        break;
      }
      uint64_t v60 = MEMORY[0x1E4FBC860];
      sub_191AFB9A0(0, v38 & ~(v38 >> 63), 0);
      if (v38 < 0)
      {
        __break(1u);
LABEL_55:
        uint64_t v58 = 0;
        unint64_t v59 = 0xE000000000000000;
        sub_191CF5D88();
        sub_191CF53B8();
        uint64_t v57 = v17;
        type metadata accessor for CHSDisplayGamut(0);
        sub_191CF5F38();
        uint64_t result = sub_191CF5FC8();
        __break(1u);
        return result;
      }
      uint64_t v40 = 0;
      uint64_t v41 = v60;
      unint64_t v55 = a2 & 0xC000000000000001;
      unsigned int v52 = *MEMORY[0x1E4F3C6F8];
      unint64_t v42 = (void (**)(char *, uint64_t, unint64_t))(v56 + 104);
      unsigned int v54 = *MEMORY[0x1E4F3C700];
      uint64_t v53 = v56 + 32;
      while (v38 != v40)
      {
        if (v55) {
          id v43 = (id)MEMORY[0x192FE4B60](v40, a2);
        }
        else {
          id v43 = *(id *)(a2 + 8 * v40 + 32);
        }
        unint64_t v44 = v43;
        unint64_t v45 = a2;
        id v46 = objc_msgSend(v43, sel_colorGamut);
        uint64_t v47 = v54;
        if (v46)
        {
          uint64_t v17 = (uint64_t)v46;
          uint64_t v47 = v52;
          if (v46 != (id)1) {
            goto LABEL_55;
          }
        }
        (*v42)(v12, v47, v10);

        uint64_t v60 = v41;
        unint64_t v49 = *(void *)(v41 + 16);
        unint64_t v48 = *(void *)(v41 + 24);
        uint64_t v17 = v49 + 1;
        if (v49 >= v48 >> 1)
        {
          sub_191AFB9A0(v48 > 1, v49 + 1, 1);
          uint64_t v41 = v60;
        }
        ++v40;
        *(void *)(v41 + 16) = v17;
        (*(void (**)(unint64_t, char *, unint64_t))(v56 + 32))(v41+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v49, v12, v10);
        a2 = v45;
        if (v38 == v40)
        {
          swift_bridgeObjectRelease();
          uint64_t v39 = MEMORY[0x1E4FBC860];
          goto LABEL_46;
        }
      }
      __break(1u);
LABEL_49:
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_191CF6018();
      swift_bridgeObjectRelease();
      if (!v25) {
        goto LABEL_50;
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v41 = MEMORY[0x1E4FBC860];
LABEL_46:
    int64_t v50 = *(void *)(v41 + 16);
    uint64_t v58 = v39;
    sub_191AFB9DC(0, v50, 0);
    unint64_t v10 = v58;
    swift_bridgeObjectRelease();
    if (!v50) {
      return v10;
    }
LABEL_11:
    swift_release();
    return 0;
  }
  uint64_t v34 = swift_getKeyPath();
  char v35 = MEMORY[0x192FE49D0](a1, v34);
  swift_release();
  if (v35)
  {
    uint64_t v36 = swift_getKeyPath();
    id v37 = (id)a2;
    a2 = sub_191AFA454(v36);

    swift_release();
    if (a2)
    {
      if (a2 >> 62) {
        goto LABEL_53;
      }
      uint64_t v38 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_31;
    }
    return 0;
  }
  return sub_191AFA694(a1);
}

uint64_t sub_191CF18E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_191CF39E8();
  uint64_t v56 = *(void *)(v10 - 8);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191CF5C78();
  unint64_t KeyPath = swift_getKeyPath();
  char v14 = MEMORY[0x192FE49D0](a1, KeyPath);
  swift_release();
  if (v14)
  {
    if (a3)
    {
      unint64_t v58 = MEMORY[0x1E4FBC860];
      uint64_t v15 = *(void *)(a3 + 16);
      goto LABEL_10;
    }
    return 0;
  }
  uint64_t v16 = swift_getKeyPath();
  uint64_t v17 = MEMORY[0x192FE49D0](a1, v16);
  swift_release();
  if (v17)
  {
    if (!a4) {
      return 0;
    }
    unint64_t v58 = MEMORY[0x1E4FBC860];
    uint64_t v15 = *(void *)(a4 + 16);
LABEL_10:
    sub_191CF5EB8();
    unint64_t v10 = v58;
    if (!v15) {
      return v10;
    }
    goto LABEL_11;
  }
  uint64_t v18 = swift_getKeyPath();
  char v19 = MEMORY[0x192FE49D0](a1, v18);
  swift_release();
  if (v19)
  {
    if (!a5) {
      return 0;
    }
    unint64_t v58 = MEMORY[0x1E4FBC860];
    uint64_t v15 = *(void *)(a5 + 16);
    goto LABEL_10;
  }
  uint64_t v21 = swift_getKeyPath();
  char v22 = MEMORY[0x192FE49D0](a1, v21);
  swift_release();
  if (v22)
  {
    uint64_t v23 = swift_getKeyPath();
    id v24 = a2;
    unint64_t v10 = sub_191AFA454(v23);

    swift_release();
    if (!v10) {
      return v10;
    }
    if (v10 >> 62) {
      goto LABEL_49;
    }
    uint64_t v25 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v25)
    {
      while (1)
      {
        unint64_t v58 = MEMORY[0x1E4FBC860];
        sub_191AFB9DC(0, v25 & ~(v25 >> 63), 0);
        if ((v25 & 0x8000000000000000) == 0)
        {
          uint64_t v26 = 0;
          unint64_t v27 = v58;
          do
          {
            if ((v10 & 0xC000000000000001) != 0) {
              id v28 = (id)MEMORY[0x192FE4B60](v26, v10);
            }
            else {
              id v28 = *(id *)(v10 + 8 * v26 + 32);
            }
            unint64_t v29 = v28;
            objc_msgSend(v28, sel_scale);
            uint64_t v31 = v30;

            unint64_t v58 = v27;
            unint64_t v33 = *(void *)(v27 + 16);
            unint64_t v32 = *(void *)(v27 + 24);
            if (v33 >= v32 >> 1)
            {
              sub_191AFB9DC(v32 > 1, v33 + 1, 1);
              unint64_t v27 = v58;
            }
            ++v26;
            *(void *)(v27 + 16) = v33 + 1;
            *(void *)(v27 + 8 * v33 + 32) = v31;
          }
          while (v25 != v26);
          swift_bridgeObjectRelease();
          goto LABEL_51;
        }
        __break(1u);
LABEL_54:
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_191CF6018();
        swift_bridgeObjectRelease();
LABEL_31:
        unint64_t v39 = MEMORY[0x1E4FBC860];
        if (!v38) {
          break;
        }
        uint64_t v60 = MEMORY[0x1E4FBC860];
        sub_191AFB9A0(0, v38 & ~(v38 >> 63), 0);
        if (v38 < 0)
        {
          __break(1u);
LABEL_56:
          unint64_t v58 = 0;
          unint64_t v59 = 0xE000000000000000;
          sub_191CF5D88();
          sub_191CF53B8();
          uint64_t v57 = v17;
          type metadata accessor for CHSDisplayGamut(0);
          sub_191CF5F38();
          uint64_t result = sub_191CF5FC8();
          __break(1u);
          return result;
        }
        uint64_t v40 = 0;
        uint64_t v41 = v60;
        unint64_t v55 = KeyPath & 0xC000000000000001;
        unsigned int v52 = *MEMORY[0x1E4F3C6F8];
        unint64_t v42 = (void (**)(char *, uint64_t, unint64_t))(v56 + 104);
        unsigned int v54 = *MEMORY[0x1E4F3C700];
        uint64_t v53 = v56 + 32;
        while (v38 != v40)
        {
          if (v55) {
            id v43 = (id)MEMORY[0x192FE4B60](v40, KeyPath);
          }
          else {
            id v43 = *(id *)(KeyPath + 8 * v40 + 32);
          }
          unint64_t v44 = v43;
          id v45 = objc_msgSend(v43, sel_colorGamut);
          uint64_t v46 = v54;
          if (v45)
          {
            uint64_t v17 = (uint64_t)v45;
            uint64_t v46 = v52;
            if (v45 != (id)1) {
              goto LABEL_56;
            }
          }
          (*v42)(v12, v46, v10);

          uint64_t v60 = v41;
          unint64_t v48 = *(void *)(v41 + 16);
          unint64_t v47 = *(void *)(v41 + 24);
          uint64_t v17 = v48 + 1;
          if (v48 >= v47 >> 1)
          {
            sub_191AFB9A0(v47 > 1, v48 + 1, 1);
            uint64_t v41 = v60;
          }
          ++v40;
          *(void *)(v41 + 16) = v17;
          (*(void (**)(unint64_t, char *, unint64_t))(v56 + 32))(v41+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v48, v12, v10);
          if (v38 == v40)
          {
            swift_bridgeObjectRelease();
            unint64_t v39 = MEMORY[0x1E4FBC860];
            goto LABEL_46;
          }
        }
        __break(1u);
LABEL_49:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_191CF6018();
        swift_bridgeObjectRelease();
        if (!v25) {
          goto LABEL_50;
        }
      }
      swift_bridgeObjectRelease();
      uint64_t v41 = MEMORY[0x1E4FBC860];
LABEL_46:
      unint64_t v58 = v39;
      uint64_t v49 = *(void *)(v41 + 16);
      sub_191CF5EB8();
      unint64_t v10 = v58;
      swift_bridgeObjectRelease();
      if (!v49) {
        return v10;
      }
    }
    else
    {
LABEL_50:
      swift_bridgeObjectRelease();
      unint64_t v27 = MEMORY[0x1E4FBC860];
LABEL_51:
      unint64_t v58 = MEMORY[0x1E4FBC860];
      sub_191CF5EB8();
      uint64_t v50 = *(void *)(v27 + 16);
      unint64_t v10 = v58;
      swift_bridgeObjectRelease();
      if (!v50) {
        return v10;
      }
    }
LABEL_11:
    swift_release();
    return 0;
  }
  uint64_t v34 = swift_getKeyPath();
  char v35 = MEMORY[0x192FE49D0](a1, v34);
  swift_release();
  if (v35)
  {
    uint64_t v36 = swift_getKeyPath();
    id v37 = a2;
    unint64_t KeyPath = sub_191AFA454(v36);

    swift_release();
    if (KeyPath)
    {
      if (KeyPath >> 62) {
        goto LABEL_54;
      }
      uint64_t v38 = *(void *)((KeyPath & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_31;
    }
    return 0;
  }
  return sub_191AFA438(a1);
}

uint64_t sub_191CF1F54()
{
  return sub_191CF3FA8();
}

uint64_t sub_191CF1F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_191CF1FDC(a1, a2, a3, a4, MEMORY[0x1E4F27A78], MEMORY[0x1E4F3D220]);
}

uint64_t sub_191CF1FB8()
{
  return sub_191CF3FE8();
}

uint64_t sub_191CF1FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(char *))
{
  uint64_t v8 = a5(0);
  MEMORY[0x1F4188790](v8);
  unint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

uint64_t sub_191CF20AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_191CF1FDC(a1, a2, a3, a4, MEMORY[0x1E4F27CA0], MEMORY[0x1E4F3D268]);
}

uint64_t _s9WidgetKit23TimelineProviderContextV19EnvironmentVariantsV13dynamicMemberSayxGSgs15WritableKeyPathCy7SwiftUI0F6ValuesVxG_tcluig_0(uint64_t *a1)
{
  uint64_t v49 = *a1;
  unint64_t v3 = sub_191CF39E8();
  uint64_t v48 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)v1;
  uint64_t v7 = *(void *)(v1 + 8);
  unint64_t v9 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  sub_191CF5C78();
  uint64_t KeyPath = swift_getKeyPath();
  char v11 = MEMORY[0x192FE49D0](a1, KeyPath);
  swift_release();
  if (v11)
  {
    if (v7)
    {
      sub_191CF32C8();
LABEL_10:
      return sub_191CF60A8();
    }
    return 0;
  }
  uint64_t v12 = swift_getKeyPath();
  char v13 = MEMORY[0x192FE49D0](a1, v12);
  swift_release();
  if (v13)
  {
    if (v9)
    {
      sub_191CF32D8();
      goto LABEL_10;
    }
    return 0;
  }
  uint64_t v14 = swift_getKeyPath();
  char v15 = MEMORY[0x192FE49D0](a1, v14);
  swift_release();
  if (v15)
  {
    if (v8)
    {
      sub_191CF3B98();
      goto LABEL_10;
    }
    return 0;
  }
  uint64_t v17 = swift_getKeyPath();
  char v18 = MEMORY[0x192FE49D0](a1, v17);
  swift_release();
  if ((v18 & 1) == 0)
  {
    uint64_t v30 = swift_getKeyPath();
    char v31 = MEMORY[0x192FE49D0](a1, v30);
    swift_release();
    if ((v31 & 1) == 0) {
      return sub_191B2E658();
    }
    uint64_t v32 = swift_getKeyPath();
    id v33 = v6;
    unint64_t v9 = sub_191AFA454(v32);

    swift_release();
    if (!v9) {
      return 0;
    }
    if (v9 >> 62) {
      goto LABEL_48;
    }
    uint64_t v34 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v34) {
      goto LABEL_30;
    }
LABEL_49:
    swift_bridgeObjectRelease();
    uint64_t v45 = sub_191CF60A8();
    swift_bridgeObjectRelease();
    return v45;
  }
  uint64_t v19 = swift_getKeyPath();
  id v20 = v6;
  unint64_t v3 = sub_191AFA454(v19);

  swift_release();
  if (!v3) {
    return 0;
  }
  if (v3 >> 62) {
    goto LABEL_45;
  }
  uint64_t v21 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v21) {
    goto LABEL_49;
  }
  while (1)
  {
    uint64_t v51 = MEMORY[0x1E4FBC860];
    sub_191AFB9DC(0, v21 & ~(v21 >> 63), 0);
    if ((v21 & 0x8000000000000000) == 0)
    {
      uint64_t v22 = 0;
      uint64_t v23 = v51;
      do
      {
        if ((v3 & 0xC000000000000001) != 0) {
          id v24 = (id)MEMORY[0x192FE4B60](v22, v3);
        }
        else {
          id v24 = *(id *)(v3 + 8 * v22 + 32);
        }
        uint64_t v25 = v24;
        objc_msgSend(v24, sel_scale, v46);
        uint64_t v27 = v26;

        uint64_t v51 = v23;
        unint64_t v29 = *(void *)(v23 + 16);
        unint64_t v28 = *(void *)(v23 + 24);
        if (v29 >= v28 >> 1)
        {
          sub_191AFB9DC(v28 > 1, v29 + 1, 1);
          uint64_t v23 = v51;
        }
        ++v22;
        *(void *)(v23 + 16) = v29 + 1;
        *(void *)(v23 + 8 * v29 + 32) = v27;
      }
      while (v21 != v22);
      goto LABEL_49;
    }
    __break(1u);
LABEL_48:
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_191CF6018();
    swift_bridgeObjectRelease();
    if (!v34) {
      goto LABEL_49;
    }
LABEL_30:
    uint64_t v53 = MEMORY[0x1E4FBC860];
    sub_191AFB9A0(0, v34 & ~(v34 >> 63), 0);
    if (v34 < 0) {
      break;
    }
    uint64_t v35 = 0;
    uint64_t v36 = v53;
    unint64_t v47 = v9 & 0xC000000000000001;
    LODWORD(v46) = *MEMORY[0x1E4F3C6F8];
    id v37 = (void (**)(char *, uint64_t, unint64_t))(v48 + 104);
    HIDWORD(v46) = *MEMORY[0x1E4F3C700];
    unint64_t v38 = v9;
    while (v34 != v35)
    {
      if (v47) {
        id v39 = (id)MEMORY[0x192FE4B60](v35, v9);
      }
      else {
        id v39 = *(id *)(v9 + 8 * v35 + 32);
      }
      uint64_t v40 = v39;
      id v41 = objc_msgSend(v39, sel_colorGamut, v46);
      uint64_t v42 = HIDWORD(v46);
      if (v41)
      {
        unint64_t v9 = (unint64_t)v41;
        uint64_t v42 = v46;
        if (v41 != (id)1) {
          goto LABEL_51;
        }
      }
      (*v37)(v5, v42, v3);

      uint64_t v53 = v36;
      unint64_t v44 = *(void *)(v36 + 16);
      unint64_t v43 = *(void *)(v36 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_191AFB9A0(v43 > 1, v44 + 1, 1);
        uint64_t v36 = v53;
      }
      ++v35;
      *(void *)(v36 + 16) = v44 + 1;
      (*(void (**)(unint64_t, char *, unint64_t))(v48 + 32))(v36+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(void *)(v48 + 72) * v44, v5, v3);
      unint64_t v9 = v38;
      if (v34 == v35) {
        goto LABEL_49;
      }
    }
    __break(1u);
LABEL_45:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_191CF6018();
    swift_bridgeObjectRelease();
    if (!v21) {
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_51:
  uint64_t v51 = 0;
  unint64_t v52 = 0xE000000000000000;
  sub_191CF5D88();
  sub_191CF53B8();
  unint64_t v50 = v9;
  type metadata accessor for CHSDisplayGamut(0);
  sub_191CF5F38();
  uint64_t result = sub_191CF5FC8();
  __break(1u);
  return result;
}

uint64_t TimelineProviderContext.environmentVariants.getter@<X0>(void *a1@<X8>)
{
  unint64_t v3 = *(void **)v1;
  uint64_t v2 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  *a1 = *(void *)v1;
  a1[1] = v2;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  id v6 = v3;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

void TimelineProviderContext.family.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 32);
}

void TimelineProviderContext.internalFamily.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 33);
}

uint64_t TimelineProviderContext.isPreview.getter()
{
  return *(unsigned __int8 *)(v0 + 34);
}

double TimelineProviderContext.displaySize.getter()
{
  return *(double *)(v0 + 40);
}

void TimelineProviderContext.archiveVersion.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 56);
}

uint64_t initializeWithCopy for TimelineProviderContext(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TimelineProviderContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for TimelineProviderContext(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

ValueMetadata *type metadata accessor for TimelineProviderContext()
{
  return &type metadata for TimelineProviderContext;
}

uint64_t _s9WidgetKit23TimelineProviderContextV19EnvironmentVariantsVwxx_0(id *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for TimelineProviderContext.EnvironmentVariants(void *a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TimelineProviderContext.EnvironmentVariants(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for TimelineProviderContext.EnvironmentVariants(uint64_t a1, _OWORD *a2)
{
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for TimelineProviderContext.EnvironmentVariants()
{
  return &type metadata for TimelineProviderContext.EnvironmentVariants;
}

uint64_t sub_191CF2BE8()
{
  return MEMORY[0x1F40D3BA0]();
}

uint64_t sub_191CF2C18()
{
  return MEMORY[0x1F40D3BE8]();
}

uint64_t sub_191CF2C38()
{
  return MEMORY[0x1F40D3BF8]();
}

uint64_t sub_191CF2C58()
{
  return MEMORY[0x1F4111210]();
}

uint64_t sub_191CF2C68()
{
  return MEMORY[0x1F4111218]();
}

uint64_t sub_191CF2C78()
{
  return MEMORY[0x1F40D3C10]();
}

uint64_t sub_191CF2C88()
{
  return MEMORY[0x1F40D3C18]();
}

uint64_t sub_191CF2C98()
{
  return MEMORY[0x1F40D3C30]();
}

uint64_t sub_191CF2CA8()
{
  return MEMORY[0x1F40D3C40]();
}

uint64_t sub_191CF2CB8()
{
  return MEMORY[0x1F40D3C48]();
}

uint64_t sub_191CF2CC8()
{
  return MEMORY[0x1F40D3C60]();
}

uint64_t sub_191CF2CE8()
{
  return MEMORY[0x1F40D3C88]();
}

uint64_t sub_191CF2D18()
{
  return MEMORY[0x1F40D3CB0]();
}

uint64_t sub_191CF2D28()
{
  return MEMORY[0x1F40D3CC0]();
}

uint64_t sub_191CF2D48()
{
  return MEMORY[0x1F40D4020]();
}

uint64_t sub_191CF2D58()
{
  return MEMORY[0x1F40D4208]();
}

uint64_t sub_191CF2D68()
{
  return MEMORY[0x1F40D4210]();
}

uint64_t sub_191CF2D78()
{
  return MEMORY[0x1F40D4410]();
}

uint64_t sub_191CF2DB8()
{
  return MEMORY[0x1F40D4818]();
}

uint64_t sub_191CF2DC8()
{
  return MEMORY[0x1F40D4870]();
}

uint64_t sub_191CF2DE8()
{
  return MEMORY[0x1F40D4990]();
}

uint64_t sub_191CF2DF8()
{
  return MEMORY[0x1F40D4A10]();
}

uint64_t sub_191CF2E08()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_191CF2E18()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_191CF2E28()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_191CF2E38()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_191CF2E48()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_191CF2E58()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_191CF2E68()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_191CF2E78()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_191CF2E88()
{
  return MEMORY[0x1F40E34F0]();
}

uint64_t sub_191CF2E98()
{
  return MEMORY[0x1F40E3520]();
}

uint64_t sub_191CF2EA8()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_191CF2EB8()
{
  return MEMORY[0x1F40E3618]();
}

uint64_t sub_191CF2ED8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_191CF2EE8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_191CF2EF8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_191CF2F08()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_191CF2F18()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_191CF2F28()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_191CF2F38()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_191CF2F48()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_191CF2F58()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_191CF2F68()
{
  return MEMORY[0x1F40E41E8]();
}

uint64_t sub_191CF2F78()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_191CF2F88()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_191CF2F98()
{
  return MEMORY[0x1F40E4228]();
}

uint64_t sub_191CF2FA8()
{
  return MEMORY[0x1F40E4240]();
}

uint64_t sub_191CF2FB8()
{
  return MEMORY[0x1F40E4260]();
}

uint64_t sub_191CF2FC8()
{
  return MEMORY[0x1F40E4270]();
}

uint64_t sub_191CF2FD8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_191CF2FE8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_191CF2FF8()
{
  return MEMORY[0x1F40E4570]();
}

uint64_t sub_191CF3008()
{
  return MEMORY[0x1F40E45B8]();
}

uint64_t sub_191CF3018()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_191CF3028()
{
  return MEMORY[0x1F40E4930]();
}

uint64_t sub_191CF3038()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_191CF3048()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_191CF3058()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_191CF3068()
{
  return MEMORY[0x1F40E4B20]();
}

uint64_t sub_191CF3078()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_191CF3088()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_191CF3098()
{
  return MEMORY[0x1F40E4C30]();
}

uint64_t sub_191CF30A8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_191CF30B8()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_191CF30C8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_191CF30D8()
{
  return MEMORY[0x1F40E4E60]();
}

uint64_t sub_191CF30E8()
{
  return MEMORY[0x1F40E4E70]();
}

uint64_t sub_191CF30F8()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_191CF3108()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_191CF3118()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_191CF3128()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_191CF3138()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_191CF3148()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_191CF3158()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_191CF3168()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_191CF3178()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_191CF3188()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_191CF3198()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t _s9WidgetKit30ActivityArchivedViewCollectionV2eeoiySbAC_ACtFZ_0()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_191CF31B8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_191CF31C8()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_191CF31D8()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_191CF31E8()
{
  return MEMORY[0x1F40E5568]();
}

uint64_t sub_191CF31F8()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_191CF3208()
{
  return MEMORY[0x1F40E55A0]();
}

uint64_t sub_191CF3218()
{
  return MEMORY[0x1F40E5628]();
}

uint64_t sub_191CF3228()
{
  return MEMORY[0x1F40E5638]();
}

uint64_t sub_191CF3238()
{
  return MEMORY[0x1F40E5698]();
}

uint64_t sub_191CF3248()
{
  return MEMORY[0x1F40E56F0]();
}

uint64_t sub_191CF3258()
{
  return MEMORY[0x1F40E5700]();
}

uint64_t sub_191CF3268()
{
  return MEMORY[0x1F40E5728]();
}

uint64_t sub_191CF3278()
{
  return MEMORY[0x1F40E57D8]();
}

uint64_t sub_191CF3288()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_191CF3298()
{
  return MEMORY[0x1F40E5838]();
}

uint64_t sub_191CF32A8()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_191CF32B8()
{
  return MEMORY[0x1F40E5850]();
}

uint64_t sub_191CF32C8()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_191CF32D8()
{
  return MEMORY[0x1F40E5B18]();
}

uint64_t sub_191CF32E8()
{
  return MEMORY[0x1F40E5D08]();
}

uint64_t sub_191CF32F8()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_191CF3308()
{
  return MEMORY[0x1F40E5D38]();
}

uint64_t sub_191CF3318()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_191CF3328()
{
  return MEMORY[0x1F40D32F0]();
}

uint64_t sub_191CF3338()
{
  return MEMORY[0x1F40D32F8]();
}

uint64_t sub_191CF3348()
{
  return MEMORY[0x1F40D3308]();
}

uint64_t sub_191CF3358()
{
  return MEMORY[0x1F40D3330]();
}

uint64_t sub_191CF3368()
{
  return MEMORY[0x1F40D3338]();
}

uint64_t sub_191CF3378()
{
  return MEMORY[0x1F40D3340]();
}

uint64_t sub_191CF3388()
{
  return MEMORY[0x1F40D3420]();
}

uint64_t sub_191CF3398()
{
  return MEMORY[0x1F40D3428]();
}

uint64_t sub_191CF33A8()
{
  return MEMORY[0x1F40D3430]();
}

uint64_t sub_191CF33B8()
{
  return MEMORY[0x1F40D3438]();
}

uint64_t sub_191CF33C8()
{
  return MEMORY[0x1F40D3440]();
}

uint64_t sub_191CF33D8()
{
  return MEMORY[0x1F40D3520]();
}

uint64_t sub_191CF33E8()
{
  return MEMORY[0x1F40D3528]();
}

uint64_t sub_191CF33F8()
{
  return MEMORY[0x1F40D3808]();
}

uint64_t sub_191CF3408()
{
  return MEMORY[0x1F40D3850]();
}

uint64_t sub_191CF3418()
{
  return MEMORY[0x1F40D9648]();
}

uint64_t sub_191CF3428()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_191CF3438()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_191CF3448()
{
  return MEMORY[0x1F4119158]();
}

uint64_t sub_191CF3458()
{
  return MEMORY[0x1F4119160]();
}

uint64_t sub_191CF3468()
{
  return MEMORY[0x1F4111250]();
}

uint64_t sub_191CF3478()
{
  return MEMORY[0x1F4111258]();
}

uint64_t sub_191CF3488()
{
  return MEMORY[0x1F4111380]();
}

uint64_t sub_191CF3498()
{
  return MEMORY[0x1F4111388]();
}

uint64_t sub_191CF34A8()
{
  return MEMORY[0x1F4111398]();
}

uint64_t sub_191CF34B8()
{
  return MEMORY[0x1F41113A0]();
}

uint64_t sub_191CF34C8()
{
  return MEMORY[0x1F41113E0]();
}

uint64_t sub_191CF34D8()
{
  return MEMORY[0x1F41113E8]();
}

uint64_t sub_191CF34E8()
{
  return MEMORY[0x1F41113F8]();
}

uint64_t sub_191CF34F8()
{
  return MEMORY[0x1F4111420]();
}

uint64_t sub_191CF3508()
{
  return MEMORY[0x1F4111598]();
}

uint64_t sub_191CF3518()
{
  return MEMORY[0x1F41115A0]();
}

uint64_t sub_191CF3528()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_191CF3538()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_191CF3548()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_191CF3558()
{
  return MEMORY[0x1F4149AB8]();
}

uint64_t sub_191CF3568()
{
  return MEMORY[0x1F4149AC0]();
}

uint64_t sub_191CF3578()
{
  return MEMORY[0x1F4149AD8]();
}

uint64_t sub_191CF3588()
{
  return MEMORY[0x1F40E0900]();
}

uint64_t sub_191CF3598()
{
  return MEMORY[0x1F40E0908]();
}

uint64_t sub_191CF35A8()
{
  return MEMORY[0x1F40E0910]();
}

uint64_t sub_191CF35B8()
{
  return MEMORY[0x1F40E0918]();
}

uint64_t sub_191CF35C8()
{
  return MEMORY[0x1F40E0920]();
}

uint64_t sub_191CF35D8()
{
  return MEMORY[0x1F40E0928]();
}

uint64_t sub_191CF35E8()
{
  return MEMORY[0x1F40E0930]();
}

uint64_t sub_191CF35F8()
{
  return MEMORY[0x1F40E0938]();
}

uint64_t sub_191CF3608()
{
  return MEMORY[0x1F40E0940]();
}

uint64_t sub_191CF3618()
{
  return MEMORY[0x1F40E0948]();
}

uint64_t sub_191CF3628()
{
  return MEMORY[0x1F40E0950]();
}

uint64_t sub_191CF3638()
{
  return MEMORY[0x1F40E0960]();
}

uint64_t sub_191CF3648()
{
  return MEMORY[0x1F40E0968]();
}

uint64_t sub_191CF3658()
{
  return MEMORY[0x1F40E0970]();
}

uint64_t sub_191CF3668()
{
  return MEMORY[0x1F40E0988]();
}

uint64_t sub_191CF3678()
{
  return MEMORY[0x1F40E09A0]();
}

uint64_t sub_191CF3688()
{
  return MEMORY[0x1F40E09A8]();
}

uint64_t sub_191CF3698()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_191CF36A8()
{
  return MEMORY[0x1F40E0608]();
}

uint64_t sub_191CF36B8()
{
  return MEMORY[0x1F40E0610]();
}

uint64_t sub_191CF36C8()
{
  return MEMORY[0x1F40E0668]();
}

uint64_t sub_191CF36E8()
{
  return MEMORY[0x1F40E0690]();
}

uint64_t sub_191CF36F8()
{
  return MEMORY[0x1F4187918]();
}

uint64_t sub_191CF3708()
{
  return MEMORY[0x1F4187948]();
}

uint64_t sub_191CF3718()
{
  return MEMORY[0x1F4187950]();
}

uint64_t sub_191CF3728()
{
  return MEMORY[0x1F4187970]();
}

uint64_t sub_191CF3738()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_191CF3748()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_191CF3758()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_191CF3768()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_191CF3778()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_191CF3788()
{
  return MEMORY[0x1F4188568]();
}

uint64_t sub_191CF3798()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_191CF37A8()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_191CF37B8()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_191CF37C8()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_191CF37D8()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_191CF37E8()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_191CF37F8()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_191CF3808()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_191CF3818()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_191CF3828()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_191CF3838()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_191CF3848()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_191CF3858()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_191CF3868()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_191CF3878()
{
  return MEMORY[0x1F4186B90]();
}

uint64_t sub_191CF3888()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_191CF3898()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_191CF38A8()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_191CF38B8()
{
  return MEMORY[0x1F40D6B48]();
}

uint64_t sub_191CF38C8()
{
  return MEMORY[0x1F40D6B70]();
}

uint64_t sub_191CF38D8()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_191CF38E8()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_191CF38F8()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_191CF3908()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_191CF3918()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_191CF3928()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_191CF3938()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_191CF3948()
{
  return MEMORY[0x1F40F7E70]();
}

uint64_t sub_191CF3958()
{
  return MEMORY[0x1F40F7FE0]();
}

uint64_t sub_191CF3968()
{
  return MEMORY[0x1F40F7FE8]();
}

uint64_t sub_191CF3978()
{
  return MEMORY[0x1F40F7FF0]();
}

uint64_t sub_191CF3988()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_191CF3998()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_191CF39A8()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_191CF39B8()
{
  return MEMORY[0x1F40F81D8]();
}

uint64_t sub_191CF39C8()
{
  return MEMORY[0x1F40F81E0]();
}

uint64_t sub_191CF39D8()
{
  return MEMORY[0x1F40F81E8]();
}

uint64_t sub_191CF39E8()
{
  return MEMORY[0x1F40F8220]();
}

uint64_t sub_191CF39F8()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_191CF3A08()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_191CF3A18()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_191CF3A28()
{
  return MEMORY[0x1F40F83C0]();
}

uint64_t sub_191CF3A38()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_191CF3A48()
{
  return MEMORY[0x1F40F83F0]();
}

uint64_t sub_191CF3A58()
{
  return MEMORY[0x1F40F8468]();
}

uint64_t sub_191CF3A68()
{
  return MEMORY[0x1F40F85A0]();
}

uint64_t sub_191CF3A78()
{
  return MEMORY[0x1F40F85A8]();
}

uint64_t sub_191CF3A88()
{
  return MEMORY[0x1F40F85B8]();
}

uint64_t sub_191CF3A98()
{
  return MEMORY[0x1F40F85D8]();
}

uint64_t sub_191CF3AA8()
{
  return MEMORY[0x1F40F85E0]();
}

uint64_t sub_191CF3AB8()
{
  return MEMORY[0x1F40F85E8]();
}

uint64_t sub_191CF3AC8()
{
  return MEMORY[0x1F40F85F0]();
}

uint64_t sub_191CF3AD8()
{
  return MEMORY[0x1F40F85F8]();
}

uint64_t sub_191CF3AE8()
{
  return MEMORY[0x1F40F8630]();
}

uint64_t sub_191CF3AF8()
{
  return MEMORY[0x1F40F8638]();
}

uint64_t sub_191CF3B08()
{
  return MEMORY[0x1F40F8658]();
}

uint64_t sub_191CF3B28()
{
  return MEMORY[0x1F40F8688]();
}

uint64_t sub_191CF3B58()
{
  return MEMORY[0x1F40F86A0]();
}

uint64_t sub_191CF3B68()
{
  return MEMORY[0x1F40F86A8]();
}

uint64_t sub_191CF3B78()
{
  return MEMORY[0x1F40F86B0]();
}

uint64_t sub_191CF3B88()
{
  return MEMORY[0x1F40F86B8]();
}

uint64_t sub_191CF3B98()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_191CF3BA8()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_191CF3BB8()
{
  return MEMORY[0x1F40F8C58]();
}

uint64_t sub_191CF3BE8()
{
  return MEMORY[0x1F40F8CD0]();
}

uint64_t sub_191CF3BF8()
{
  return MEMORY[0x1F40F8CD8]();
}

uint64_t sub_191CF3C08()
{
  return MEMORY[0x1F40F8CE0]();
}

uint64_t sub_191CF3C18()
{
  return MEMORY[0x1F40F8DA8]();
}

uint64_t sub_191CF3C28()
{
  return MEMORY[0x1F40F8E38]();
}

uint64_t sub_191CF3C38()
{
  return MEMORY[0x1F40F8E50]();
}

uint64_t sub_191CF3C48()
{
  return MEMORY[0x1F40F8E58]();
}

uint64_t sub_191CF3C58()
{
  return MEMORY[0x1F40F8E60]();
}

uint64_t sub_191CF3C68()
{
  return MEMORY[0x1F40F8E70]();
}

uint64_t sub_191CF3C78()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_191CF3C88()
{
  return MEMORY[0x1F40F8F28]();
}

uint64_t sub_191CF3C98()
{
  return MEMORY[0x1F40F8F30]();
}

uint64_t sub_191CF3CA8()
{
  return MEMORY[0x1F40F8F38]();
}

uint64_t sub_191CF3CB8()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_191CF3CC8()
{
  return MEMORY[0x1F40F9018]();
}

uint64_t sub_191CF3CD8()
{
  return MEMORY[0x1F40F9028]();
}

uint64_t sub_191CF3CE8()
{
  return MEMORY[0x1F40F9030]();
}

uint64_t sub_191CF3CF8()
{
  return MEMORY[0x1F40F9038]();
}

uint64_t sub_191CF3D08()
{
  return MEMORY[0x1F40F9078]();
}

uint64_t sub_191CF3D18()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_191CF3D28()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_191CF3D38()
{
  return MEMORY[0x1F40F9150]();
}

uint64_t sub_191CF3D48()
{
  return MEMORY[0x1F40F91D0]();
}

uint64_t sub_191CF3D58()
{
  return MEMORY[0x1F40F91D8]();
}

uint64_t sub_191CF3D68()
{
  return MEMORY[0x1F40F91E0]();
}

uint64_t sub_191CF3D78()
{
  return MEMORY[0x1F40F91F8]();
}

uint64_t sub_191CF3D88()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_191CF3D98()
{
  return MEMORY[0x1F40F9210]();
}

uint64_t sub_191CF3DA8()
{
  return MEMORY[0x1F40F9220]();
}

uint64_t sub_191CF3DB8()
{
  return MEMORY[0x1F40F9228]();
}

uint64_t sub_191CF3DC8()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_191CF3DD8()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_191CF3DE8()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_191CF3DF8()
{
  return MEMORY[0x1F40F92B8]();
}

uint64_t sub_191CF3E08()
{
  return MEMORY[0x1F40F92F8]();
}

uint64_t sub_191CF3E18()
{
  return MEMORY[0x1F40F9300]();
}

uint64_t sub_191CF3E28()
{
  return MEMORY[0x1F40F9320]();
}

uint64_t sub_191CF3E38()
{
  return MEMORY[0x1F40F9340]();
}

uint64_t sub_191CF3E48()
{
  return MEMORY[0x1F40F9350]();
}

uint64_t sub_191CF3E58()
{
  return MEMORY[0x1F40F9388]();
}

uint64_t sub_191CF3E68()
{
  return MEMORY[0x1F40F9390]();
}

uint64_t sub_191CF3E78()
{
  return MEMORY[0x1F40F9398]();
}

uint64_t sub_191CF3E88()
{
  return MEMORY[0x1F40F93A0]();
}

uint64_t sub_191CF3E98()
{
  return MEMORY[0x1F40F93D8]();
}

uint64_t sub_191CF3EA8()
{
  return MEMORY[0x1F40F9418]();
}

uint64_t sub_191CF3EB8()
{
  return MEMORY[0x1F40F9468]();
}

uint64_t sub_191CF3EC8()
{
  return MEMORY[0x1F40F94C0]();
}

uint64_t sub_191CF3ED8()
{
  return MEMORY[0x1F40F94C8]();
}

uint64_t sub_191CF3EE8()
{
  return MEMORY[0x1F40F94D0]();
}

uint64_t sub_191CF3EF8()
{
  return MEMORY[0x1F40F94D8]();
}

uint64_t sub_191CF3F08()
{
  return MEMORY[0x1F40F94E0]();
}

uint64_t sub_191CF3F18()
{
  return MEMORY[0x1F40F94E8]();
}

uint64_t sub_191CF3F28()
{
  return MEMORY[0x1F40F9510]();
}

uint64_t sub_191CF3F38()
{
  return MEMORY[0x1F40F9518]();
}

uint64_t sub_191CF3F48()
{
  return MEMORY[0x1F40F9520]();
}

uint64_t sub_191CF3F58()
{
  return MEMORY[0x1F40F9538]();
}

uint64_t sub_191CF3F68()
{
  return MEMORY[0x1F40F9540]();
}

uint64_t sub_191CF3F78()
{
  return MEMORY[0x1F40F9548]();
}

uint64_t sub_191CF3F88()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_191CF3F98()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_191CF3FA8()
{
  return MEMORY[0x1F40F9598]();
}

uint64_t sub_191CF3FB8()
{
  return MEMORY[0x1F40F95A8]();
}

uint64_t sub_191CF3FC8()
{
  return MEMORY[0x1F40F95C0]();
}

uint64_t sub_191CF3FD8()
{
  return MEMORY[0x1F40F95C8]();
}

uint64_t sub_191CF3FE8()
{
  return MEMORY[0x1F40F95D8]();
}

uint64_t sub_191CF3FF8()
{
  return MEMORY[0x1F40F95E8]();
}

uint64_t sub_191CF4008()
{
  return MEMORY[0x1F40F96A0]();
}

uint64_t sub_191CF4018()
{
  return MEMORY[0x1F40F96A8]();
}

uint64_t sub_191CF4028()
{
  return MEMORY[0x1F40F96B0]();
}

uint64_t sub_191CF4038()
{
  return MEMORY[0x1F40F96B8]();
}

uint64_t _s9WidgetKit0A11EnvironmentV14makeEnumerator4withAC0c6ValuesE0V7SwiftUI0cG0V_tFfA__0()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_191CF4058()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_191CF4068()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_191CF4078()
{
  return MEMORY[0x1F40F9708]();
}

uint64_t sub_191CF4098()
{
  return MEMORY[0x1F40F9728]();
}

uint64_t sub_191CF40A8()
{
  return MEMORY[0x1F40F9730]();
}

uint64_t sub_191CF40B8()
{
  return MEMORY[0x1F40F9738]();
}

uint64_t sub_191CF40C8()
{
  return MEMORY[0x1F40F9740]();
}

uint64_t sub_191CF40D8()
{
  return MEMORY[0x1F40F9748]();
}

uint64_t sub_191CF40E8()
{
  return MEMORY[0x1F40F9750]();
}

uint64_t sub_191CF40F8()
{
  return MEMORY[0x1F40F9758]();
}

uint64_t sub_191CF4108()
{
  return MEMORY[0x1F40F9760]();
}

uint64_t sub_191CF4118()
{
  return MEMORY[0x1F40F9768]();
}

uint64_t sub_191CF4128()
{
  return MEMORY[0x1F40F9770]();
}

uint64_t sub_191CF4138()
{
  return MEMORY[0x1F40F9778]();
}

uint64_t sub_191CF4148()
{
  return MEMORY[0x1F40F9780]();
}

uint64_t sub_191CF4158()
{
  return MEMORY[0x1F40F9788]();
}

uint64_t sub_191CF4168()
{
  return MEMORY[0x1F40F9790]();
}

uint64_t sub_191CF4178()
{
  return MEMORY[0x1F40F9798]();
}

uint64_t sub_191CF4188()
{
  return MEMORY[0x1F40F97A0]();
}

uint64_t sub_191CF4198()
{
  return MEMORY[0x1F40F97A8]();
}

uint64_t sub_191CF41A8()
{
  return MEMORY[0x1F40F9808]();
}

uint64_t sub_191CF41B8()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_191CF41C8()
{
  return MEMORY[0x1F40F98D8]();
}

uint64_t sub_191CF41D8()
{
  return MEMORY[0x1F40F98E0]();
}

uint64_t sub_191CF41E8()
{
  return MEMORY[0x1F40F98E8]();
}

uint64_t sub_191CF41F8()
{
  return MEMORY[0x1F40F98F0]();
}

uint64_t sub_191CF4208()
{
  return MEMORY[0x1F40F98F8]();
}

uint64_t sub_191CF4218()
{
  return MEMORY[0x1F40F9900]();
}

uint64_t sub_191CF4228()
{
  return MEMORY[0x1F40F9908]();
}

uint64_t sub_191CF4238()
{
  return MEMORY[0x1F40F9910]();
}

uint64_t sub_191CF4248()
{
  return MEMORY[0x1F40F9918]();
}

uint64_t sub_191CF4258()
{
  return MEMORY[0x1F40F9920]();
}

uint64_t sub_191CF4268()
{
  return MEMORY[0x1F40F9928]();
}

uint64_t sub_191CF4278()
{
  return MEMORY[0x1F40F9930]();
}

uint64_t sub_191CF4288()
{
  return MEMORY[0x1F40F9938]();
}

uint64_t sub_191CF4298()
{
  return MEMORY[0x1F40F9940]();
}

uint64_t sub_191CF42A8()
{
  return MEMORY[0x1F40F9948]();
}

uint64_t sub_191CF42B8()
{
  return MEMORY[0x1F40F9950]();
}

uint64_t sub_191CF42C8()
{
  return MEMORY[0x1F40F9958]();
}

uint64_t sub_191CF42D8()
{
  return MEMORY[0x1F40F9960]();
}

uint64_t sub_191CF42E8()
{
  return MEMORY[0x1F40F9968]();
}

uint64_t sub_191CF42F8()
{
  return MEMORY[0x1F40F9970]();
}

uint64_t sub_191CF4308()
{
  return MEMORY[0x1F40F9978]();
}

uint64_t sub_191CF4318()
{
  return MEMORY[0x1F40F9980]();
}

uint64_t sub_191CF4328()
{
  return MEMORY[0x1F40F9988]();
}

uint64_t sub_191CF4338()
{
  return MEMORY[0x1F40F9990]();
}

uint64_t sub_191CF4348()
{
  return MEMORY[0x1F40F9998]();
}

uint64_t sub_191CF4358()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_191CF4368()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_191CF4378()
{
  return MEMORY[0x1F40F9B70]();
}

uint64_t sub_191CF4388()
{
  return MEMORY[0x1F40F9C78]();
}

uint64_t sub_191CF4398()
{
  return MEMORY[0x1F40F9C88]();
}

uint64_t sub_191CF43A8()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_191CF43B8()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_191CF43C8()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_191CF43D8()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_191CF43E8()
{
  return MEMORY[0x1F40F9F10]();
}

uint64_t sub_191CF43F8()
{
  return MEMORY[0x1F40F9F18]();
}

uint64_t sub_191CF4408()
{
  return MEMORY[0x1F40F9F20]();
}

uint64_t sub_191CF4418()
{
  return MEMORY[0x1F40F9F28]();
}

uint64_t sub_191CF4428()
{
  return MEMORY[0x1F40F9F30]();
}

uint64_t sub_191CF4438()
{
  return MEMORY[0x1F40F9F38]();
}

uint64_t sub_191CF4448()
{
  return MEMORY[0x1F40F9F40]();
}

uint64_t sub_191CF4458()
{
  return MEMORY[0x1F40F9F48]();
}

uint64_t sub_191CF4468()
{
  return MEMORY[0x1F40F9F50]();
}

uint64_t sub_191CF4478()
{
  return MEMORY[0x1F40F9F58]();
}

uint64_t sub_191CF4488()
{
  return MEMORY[0x1F40F9F60]();
}

uint64_t sub_191CF4498()
{
  return MEMORY[0x1F40F9F68]();
}

uint64_t sub_191CF44A8()
{
  return MEMORY[0x1F40F9F70]();
}

uint64_t sub_191CF44B8()
{
  return MEMORY[0x1F40F9F78]();
}

uint64_t sub_191CF44C8()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_191CF44D8()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_191CF44E8()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_191CF44F8()
{
  return MEMORY[0x1F40F9FC0]();
}

uint64_t sub_191CF4508()
{
  return MEMORY[0x1F40F9FC8]();
}

uint64_t sub_191CF4518()
{
  return MEMORY[0x1F40F9FD0]();
}

uint64_t sub_191CF4528()
{
  return MEMORY[0x1F40F9FD8]();
}

uint64_t sub_191CF4538()
{
  return MEMORY[0x1F40F9FE0]();
}

uint64_t sub_191CF4548()
{
  return MEMORY[0x1F40F9FE8]();
}

uint64_t sub_191CF4558()
{
  return MEMORY[0x1F40F9FF0]();
}

uint64_t sub_191CF4568()
{
  return MEMORY[0x1F40FA1C0]();
}

uint64_t sub_191CF4578()
{
  return MEMORY[0x1F40FA1C8]();
}

uint64_t sub_191CF4588()
{
  return MEMORY[0x1F40FA1D0]();
}

uint64_t sub_191CF4598()
{
  return MEMORY[0x1F40FA1D8]();
}

uint64_t sub_191CF45A8()
{
  return MEMORY[0x1F40FA240]();
}

uint64_t sub_191CF45B8()
{
  return MEMORY[0x1F40FA248]();
}

uint64_t sub_191CF45C8()
{
  return MEMORY[0x1F40FA250]();
}

uint64_t sub_191CF45D8()
{
  return MEMORY[0x1F40FA258]();
}

uint64_t sub_191CF45E8()
{
  return MEMORY[0x1F40FA260]();
}

uint64_t sub_191CF45F8()
{
  return MEMORY[0x1F40FA268]();
}

uint64_t sub_191CF4608()
{
  return MEMORY[0x1F40FA310]();
}

uint64_t sub_191CF4618()
{
  return MEMORY[0x1F40FA318]();
}

uint64_t sub_191CF4628()
{
  return MEMORY[0x1F40FA330]();
}

uint64_t sub_191CF4638()
{
  return MEMORY[0x1F40FA338]();
}

uint64_t sub_191CF4648()
{
  return MEMORY[0x1F40FA358]();
}

uint64_t sub_191CF4658()
{
  return MEMORY[0x1F40FA360]();
}

uint64_t sub_191CF4668()
{
  return MEMORY[0x1F40FA388]();
}

uint64_t sub_191CF4678()
{
  return MEMORY[0x1F40FA5F0]();
}

uint64_t sub_191CF4688()
{
  return MEMORY[0x1F40FA610]();
}

uint64_t sub_191CF4698()
{
  return MEMORY[0x1F40FA618]();
}

uint64_t sub_191CF46C8()
{
  return MEMORY[0x1F40FA670]();
}

uint64_t sub_191CF46D8()
{
  return MEMORY[0x1F40FA678]();
}

uint64_t sub_191CF46E8()
{
  return MEMORY[0x1F40FA7A0]();
}

uint64_t sub_191CF46F8()
{
  return MEMORY[0x1F40FA7A8]();
}

uint64_t sub_191CF4708()
{
  return MEMORY[0x1F40FA7B0]();
}

uint64_t sub_191CF4718()
{
  return MEMORY[0x1F40FA820]();
}

uint64_t sub_191CF4728()
{
  return MEMORY[0x1F40FA890]();
}

uint64_t sub_191CF4738()
{
  return MEMORY[0x1F40FA898]();
}

uint64_t sub_191CF4748()
{
  return MEMORY[0x1F40FA8A0]();
}

uint64_t sub_191CF4758()
{
  return MEMORY[0x1F40FA990]();
}

uint64_t sub_191CF4768()
{
  return MEMORY[0x1F40FA9C0]();
}

uint64_t sub_191CF4778()
{
  return MEMORY[0x1F40FA9C8]();
}

uint64_t sub_191CF4788()
{
  return MEMORY[0x1F40FA9D0]();
}

uint64_t sub_191CF4798()
{
  return MEMORY[0x1F40FAA08]();
}

uint64_t sub_191CF47A8()
{
  return MEMORY[0x1F40FAA18]();
}

uint64_t sub_191CF47B8()
{
  return MEMORY[0x1F40FAA20]();
}

uint64_t sub_191CF47C8()
{
  return MEMORY[0x1F40FAA28]();
}

uint64_t sub_191CF47D8()
{
  return MEMORY[0x1F40FAA30]();
}

uint64_t sub_191CF47E8()
{
  return MEMORY[0x1F40FAA38]();
}

uint64_t sub_191CF47F8()
{
  return MEMORY[0x1F40FAA40]();
}

uint64_t sub_191CF4808()
{
  return MEMORY[0x1F40FAA48]();
}

uint64_t sub_191CF4818()
{
  return MEMORY[0x1F40FAA50]();
}

uint64_t sub_191CF4828()
{
  return MEMORY[0x1F40FAA58]();
}

uint64_t sub_191CF4838()
{
  return MEMORY[0x1F40FAA60]();
}

uint64_t sub_191CF4848()
{
  return MEMORY[0x1F40FAA68]();
}

uint64_t sub_191CF4858()
{
  return MEMORY[0x1F40FAA70]();
}

uint64_t sub_191CF4868()
{
  return MEMORY[0x1F40FAA78]();
}

uint64_t sub_191CF4878()
{
  return MEMORY[0x1F40FAA80]();
}

uint64_t sub_191CF4888()
{
  return MEMORY[0x1F40FAA88]();
}

uint64_t sub_191CF4898()
{
  return MEMORY[0x1F40FAA90]();
}

uint64_t sub_191CF48A8()
{
  return MEMORY[0x1F40FAA98]();
}

uint64_t sub_191CF48B8()
{
  return MEMORY[0x1F40FAAA0]();
}

uint64_t sub_191CF48C8()
{
  return MEMORY[0x1F40FAAD0]();
}

uint64_t sub_191CF48D8()
{
  return MEMORY[0x1F40FAAD8]();
}

uint64_t sub_191CF48E8()
{
  return MEMORY[0x1F40FAC20]();
}

uint64_t sub_191CF48F8()
{
  return MEMORY[0x1F40FAC28]();
}

uint64_t sub_191CF4908()
{
  return MEMORY[0x1F40FACA0]();
}

uint64_t sub_191CF4918()
{
  return MEMORY[0x1F40FACD8]();
}

uint64_t sub_191CF4928()
{
  return MEMORY[0x1F40FACE0]();
}

uint64_t sub_191CF4938()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_191CF4948()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_191CF4958()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_191CF4968()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_191CF4978()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_191CF4988()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_191CF4998()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_191CF49A8()
{
  return MEMORY[0x1F40FAEA0]();
}

uint64_t sub_191CF49B8()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_191CF49C8()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_191CF49D8()
{
  return MEMORY[0x1F40FAF70]();
}

uint64_t sub_191CF49E8()
{
  return MEMORY[0x1F40FAF78]();
}

uint64_t sub_191CF49F8()
{
  return MEMORY[0x1F40FAF80]();
}

uint64_t sub_191CF4A08()
{
  return MEMORY[0x1F40FAF98]();
}

uint64_t sub_191CF4A18()
{
  return MEMORY[0x1F40FAFA0]();
}

uint64_t sub_191CF4A28()
{
  return MEMORY[0x1F40FAFB0]();
}

uint64_t sub_191CF4A38()
{
  return MEMORY[0x1F40FAFC0]();
}

uint64_t sub_191CF4A48()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_191CF4A58()
{
  return MEMORY[0x1F40FAFF0]();
}

uint64_t sub_191CF4A68()
{
  return MEMORY[0x1F40FB000]();
}

uint64_t sub_191CF4A78()
{
  return MEMORY[0x1F40FB050]();
}

uint64_t sub_191CF4A88()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_191CF4A98()
{
  return MEMORY[0x1F40FB090]();
}

uint64_t sub_191CF4AA8()
{
  return MEMORY[0x1F40FB098]();
}

uint64_t sub_191CF4AB8()
{
  return MEMORY[0x1F40FB0A0]();
}

uint64_t sub_191CF4AC8()
{
  return MEMORY[0x1F40FB0A8]();
}

uint64_t sub_191CF4AD8()
{
  return MEMORY[0x1F40FB0B8]();
}

uint64_t sub_191CF4AE8()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_191CF4AF8()
{
  return MEMORY[0x1F40FB268]();
}

uint64_t sub_191CF4B08()
{
  return MEMORY[0x1F40FB290]();
}

uint64_t sub_191CF4B18()
{
  return MEMORY[0x1F40FB2A0]();
}

uint64_t sub_191CF4B28()
{
  return MEMORY[0x1F40FB2D0]();
}

uint64_t sub_191CF4B38()
{
  return MEMORY[0x1F40FB2F8]();
}

uint64_t sub_191CF4B48()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_191CF4B58()
{
  return MEMORY[0x1F40FB3D0]();
}

uint64_t sub_191CF4B68()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_191CF4B78()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_191CF4B88()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_191CF4B98()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_191CF4BA8()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_191CF4BB8()
{
  return MEMORY[0x1F40FB658]();
}

uint64_t sub_191CF4BC8()
{
  return MEMORY[0x1F40FB720]();
}

uint64_t sub_191CF4BD8()
{
  return MEMORY[0x1F40FB7E0]();
}

uint64_t sub_191CF4BE8()
{
  return MEMORY[0x1F40FB8D0]();
}

uint64_t sub_191CF4BF8()
{
  return MEMORY[0x1F40FB8D8]();
}

uint64_t sub_191CF4C08()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_191CF4C18()
{
  return MEMORY[0x1F40FB960]();
}

uint64_t sub_191CF4C28()
{
  return MEMORY[0x1F40FB9A0]();
}

uint64_t sub_191CF4C38()
{
  return MEMORY[0x1F40FBA30]();
}

uint64_t sub_191CF4C48()
{
  return MEMORY[0x1F40FBAC8]();
}

uint64_t sub_191CF4C58()
{
  return MEMORY[0x1F40FBB10]();
}

uint64_t sub_191CF4C68()
{
  return MEMORY[0x1F40FBB60]();
}

uint64_t sub_191CF4C78()
{
  return MEMORY[0x1F40FBCE0]();
}

uint64_t sub_191CF4C88()
{
  return MEMORY[0x1F40FBCE8]();
}

uint64_t sub_191CF4C98()
{
  return MEMORY[0x1F40FBD08]();
}

uint64_t sub_191CF4CA8()
{
  return MEMORY[0x1F40FBDE8]();
}

uint64_t sub_191CF4CB8()
{
  return MEMORY[0x1F40FBE20]();
}

uint64_t sub_191CF4CC8()
{
  return MEMORY[0x1F40FBEA8]();
}

uint64_t sub_191CF4CD8()
{
  return MEMORY[0x1F40FBF48]();
}

uint64_t sub_191CF4CE8()
{
  return MEMORY[0x1F40FBF50]();
}

uint64_t sub_191CF4CF8()
{
  return MEMORY[0x1F40FBF78]();
}

uint64_t sub_191CF4D08()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_191CF4D18()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_191CF4D28()
{
  return MEMORY[0x1F40FC0E8]();
}

uint64_t sub_191CF4D38()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_191CF4D48()
{
  return MEMORY[0x1F40FC190]();
}

uint64_t sub_191CF4D58()
{
  return MEMORY[0x1F40FC1D8]();
}

uint64_t sub_191CF4D68()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_191CF4D78()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_191CF4D88()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_191CF4D98()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_191CF4DA8()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_191CF4DB8()
{
  return MEMORY[0x1F40FC460]();
}

uint64_t sub_191CF4DC8()
{
  return MEMORY[0x1F40FC468]();
}

uint64_t sub_191CF4DD8()
{
  return MEMORY[0x1F40FC478]();
}

uint64_t sub_191CF4DE8()
{
  return MEMORY[0x1F40FC498]();
}

uint64_t sub_191CF4DF8()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_191CF4E08()
{
  return MEMORY[0x1F40FC4C8]();
}

uint64_t sub_191CF4E18()
{
  return MEMORY[0x1F40FC4D8]();
}

uint64_t sub_191CF4E28()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_191CF4E38()
{
  return MEMORY[0x1F40FC510]();
}

uint64_t sub_191CF4E48()
{
  return MEMORY[0x1F40FC520]();
}

uint64_t sub_191CF4E58()
{
  return MEMORY[0x1F40FC530]();
}

uint64_t sub_191CF4E68()
{
  return MEMORY[0x1F40FC548]();
}

uint64_t sub_191CF4E78()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_191CF4E88()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_191CF4E98()
{
  return MEMORY[0x1F40FC580]();
}

uint64_t sub_191CF4EA8()
{
  return MEMORY[0x1F40FC590]();
}

uint64_t sub_191CF4EB8()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_191CF4EC8()
{
  return MEMORY[0x1F40FC5A8]();
}

uint64_t sub_191CF4ED8()
{
  return MEMORY[0x1F40FC5B8]();
}

uint64_t sub_191CF4EE8()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_191CF4EF8()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_191CF4F08()
{
  return MEMORY[0x1F40FC5F0]();
}

uint64_t sub_191CF4F28()
{
  return MEMORY[0x1F40FC638]();
}

uint64_t sub_191CF4F38()
{
  return MEMORY[0x1F40FC640]();
}

uint64_t sub_191CF4F48()
{
  return MEMORY[0x1F40FC648]();
}

uint64_t sub_191CF4F78()
{
  return MEMORY[0x1F40FC6A0]();
}

uint64_t sub_191CF4F98()
{
  return MEMORY[0x1F40FC6C8]();
}

uint64_t sub_191CF4FB8()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_191CF4FC8()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_191CF4FD8()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_191CF4FE8()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_191CF4FF8()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_191CF5008()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_191CF5018()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_191CF5028()
{
  return MEMORY[0x1F40FC8D8]();
}

uint64_t sub_191CF5038()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_191CF5048()
{
  return MEMORY[0x1F40FCA80]();
}

uint64_t sub_191CF5058()
{
  return MEMORY[0x1F40FCB98]();
}

uint64_t sub_191CF5068()
{
  return MEMORY[0x1F40FCBD8]();
}

uint64_t sub_191CF5078()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_191CF5088()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_191CF5098()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_191CF50A8()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_191CF50B8()
{
  return MEMORY[0x1F40FCDB8]();
}

uint64_t sub_191CF50C8()
{
  return MEMORY[0x1F40FCDC0]();
}

uint64_t sub_191CF50D8()
{
  return MEMORY[0x1F40FCDC8]();
}

uint64_t sub_191CF50E8()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_191CF50F8()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_191CF5108()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_191CF5118()
{
  return MEMORY[0x1F4101CC8]();
}

uint64_t sub_191CF5128()
{
  return MEMORY[0x1F4101CD0]();
}

uint64_t sub_191CF5138()
{
  return MEMORY[0x1F4101CD8]();
}

uint64_t sub_191CF5148()
{
  return MEMORY[0x1F4101CE0]();
}

uint64_t sub_191CF5158()
{
  return MEMORY[0x1F4186C78]();
}

uint64_t sub_191CF5168()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_191CF5178()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_191CF5188()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_191CF5198()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_191CF51A8()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_191CF51B8()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_191CF51C8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_191CF51D8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_191CF51E8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_191CF51F8()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_191CF5208()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_191CF5218()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_191CF5228()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_191CF5238()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_191CF5248()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_191CF5258()
{
  return MEMORY[0x1F41116B8]();
}

uint64_t sub_191CF5268()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_191CF5278()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_191CF5288()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_191CF5298()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_191CF52A8()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_191CF52B8()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_191CF52C8()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_191CF52D8()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_191CF52E8()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_191CF52F8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_191CF5308()
{
  return MEMORY[0x1F40E6068]();
}

uint64_t sub_191CF5318()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_191CF5328()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_191CF5338()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_191CF5348()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_191CF5358()
{
  return MEMORY[0x1F40E62E0]();
}

uint64_t sub_191CF5368()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_191CF5378()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_191CF5388()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_191CF5398()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_191CF53A8()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_191CF53B8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_191CF53C8()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_191CF53D8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_191CF53E8()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_191CF53F8()
{
  return MEMORY[0x1F4183B48]();
}

uint64_t sub_191CF5408()
{
  return MEMORY[0x1F4183B50]();
}

uint64_t sub_191CF5418()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_191CF5438()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_191CF5448()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_191CF5458()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_191CF5468()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_191CF5478()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_191CF5488()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_191CF5498()
{
  return MEMORY[0x1F4183C68]();
}

uint64_t sub_191CF54A8()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_191CF54B8()
{
  return MEMORY[0x1F4183CF0]();
}

uint64_t sub_191CF54C8()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_191CF54D8()
{
  return MEMORY[0x1F4183D80]();
}

uint64_t sub_191CF54E8()
{
  return MEMORY[0x1F4183D98]();
}

uint64_t sub_191CF54F8()
{
  return MEMORY[0x1F4183DF8]();
}

uint64_t sub_191CF5508()
{
  return MEMORY[0x1F4183E10]();
}

uint64_t sub_191CF5518()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_191CF5528()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_191CF5538()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_191CF5548()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_191CF5558()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_191CF5568()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_191CF5578()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_191CF5588()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_191CF55A8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_191CF55B8()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_191CF55C8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_191CF55D8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_191CF55E8()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_191CF55F8()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_191CF5608()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_191CF5618()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_191CF5628()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_191CF5638()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_191CF5648()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_191CF5658()
{
  return MEMORY[0x1F4187C00]();
}

uint64_t sub_191CF5668()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_191CF5678()
{
  return MEMORY[0x1F4187C10]();
}

uint64_t sub_191CF5688()
{
  return MEMORY[0x1F4187C98]();
}

uint64_t sub_191CF5698()
{
  return MEMORY[0x1F4187CA0]();
}

uint64_t sub_191CF56A8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_191CF56B8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_191CF56C8()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_191CF56D8()
{
  return MEMORY[0x1F41116C0]();
}

uint64_t sub_191CF56E8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_191CF56F8()
{
  return MEMORY[0x1F40E6448]();
}

uint64_t sub_191CF5708()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_191CF5718()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_191CF5728()
{
  return MEMORY[0x1F41842A0]();
}

uint64_t sub_191CF5768()
{
  return MEMORY[0x1F41842C0]();
}

uint64_t sub_191CF5788()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_191CF5798()
{
  return MEMORY[0x1F4188440]();
}

uint64_t sub_191CF57A8()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_191CF57B8()
{
  return MEMORY[0x1F4184308]();
}

uint64_t sub_191CF57C8()
{
  return MEMORY[0x1F4184310]();
}

uint64_t sub_191CF57D8()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_191CF57E8()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_191CF57F8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_191CF5808()
{
  return MEMORY[0x1F4184348]();
}

uint64_t sub_191CF5828()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_191CF5838()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_191CF5848()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_191CF5858()
{
  return MEMORY[0x1F4184438]();
}

uint64_t sub_191CF5868()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_191CF5878()
{
  return MEMORY[0x1F4184480]();
}

uint64_t sub_191CF5888()
{
  return MEMORY[0x1F41845A0]();
}

uint64_t sub_191CF5898()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_191CF58A8()
{
  return MEMORY[0x1F40D9698]();
}

uint64_t sub_191CF58B8()
{
  return MEMORY[0x1F40D96A0]();
}

uint64_t sub_191CF58C8()
{
  return MEMORY[0x1F40D96C0]();
}

uint64_t sub_191CF58D8()
{
  return MEMORY[0x1F40E6598]();
}

uint64_t sub_191CF58E8()
{
  return MEMORY[0x1F40E65A0]();
}

uint64_t sub_191CF58F8()
{
  return MEMORY[0x1F40E65D0]();
}

uint64_t sub_191CF5908()
{
  return MEMORY[0x1F40E09B0]();
}

uint64_t sub_191CF5918()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_191CF5928()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_191CF5938()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_191CF5948()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_191CF5958()
{
  return MEMORY[0x1F41116C8]();
}

uint64_t sub_191CF5968()
{
  return MEMORY[0x1F41116D0]();
}

uint64_t sub_191CF5978()
{
  return MEMORY[0x1F41116D8]();
}

uint64_t sub_191CF5988()
{
  return MEMORY[0x1F40E6660]();
}

uint64_t sub_191CF5998()
{
  return MEMORY[0x1F40E66B8]();
}

uint64_t sub_191CF59A8()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_191CF59B8()
{
  return MEMORY[0x1F40E66F8]();
}

uint64_t sub_191CF59C8()
{
  return MEMORY[0x1F4186F90]();
}

uint64_t sub_191CF59D8()
{
  return MEMORY[0x1F4186FB0]();
}

uint64_t sub_191CF59E8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_191CF59F8()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_191CF5A08()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_191CF5A18()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_191CF5A28()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_191CF5A38()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_191CF5A48()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_191CF5A58()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_191CF5A68()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_191CF5A78()
{
  return MEMORY[0x1F41116F8]();
}

uint64_t sub_191CF5A88()
{
  return MEMORY[0x1F4111720]();
}

uint64_t sub_191CF5A98()
{
  return MEMORY[0x1F40FCF10]();
}

uint64_t sub_191CF5AA8()
{
  return MEMORY[0x1F40D9728]();
}

uint64_t sub_191CF5AB8()
{
  return MEMORY[0x1F40D9730]();
}

uint64_t sub_191CF5AC8()
{
  return MEMORY[0x1F40E6858]();
}

uint64_t sub_191CF5AD8()
{
  return MEMORY[0x1F40E6860]();
}

uint64_t sub_191CF5AE8()
{
  return MEMORY[0x1F40E6868]();
}

uint64_t sub_191CF5AF8()
{
  return MEMORY[0x1F40E6880]();
}

uint64_t sub_191CF5B08()
{
  return MEMORY[0x1F4111750]();
}

uint64_t sub_191CF5B18()
{
  return MEMORY[0x1F4111758]();
}

uint64_t sub_191CF5B28()
{
  return MEMORY[0x1F4166810]();
}

uint64_t sub_191CF5B38()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_191CF5B48()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_191CF5B58()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_191CF5B68()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_191CF5B78()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_191CF5B88()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_191CF5B98()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_191CF5BA8()
{
  return MEMORY[0x1F41845F8]();
}

uint64_t sub_191CF5BB8()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_191CF5BC8()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_191CF5BD8()
{
  return MEMORY[0x1F40E6B68]();
}

uint64_t sub_191CF5BE8()
{
  return MEMORY[0x1F41846D8]();
}

uint64_t sub_191CF5BF8()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_191CF5C08()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_191CF5C18()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_191CF5C28()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_191CF5C38()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_191CF5C48()
{
  return MEMORY[0x1F4184960]();
}

uint64_t sub_191CF5C58()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_191CF5C68()
{
  return MEMORY[0x1F41849A8]();
}

uint64_t sub_191CF5C78()
{
  return MEMORY[0x1F41849B0]();
}

uint64_t sub_191CF5C98()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_191CF5CA8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_191CF5CB8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_191CF5CC8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_191CF5CD8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_191CF5CE8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_191CF5CF8()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_191CF5D08()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_191CF5D18()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_191CF5D28()
{
  return MEMORY[0x1F4184C28]();
}

uint64_t sub_191CF5D38()
{
  return MEMORY[0x1F4184C40]();
}

uint64_t sub_191CF5D48()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_191CF5D58()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_191CF5D68()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_191CF5D78()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_191CF5D88()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_191CF5D98()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_191CF5DA8()
{
  return MEMORY[0x1F4184D00]();
}

uint64_t sub_191CF5DB8()
{
  return MEMORY[0x1F4184D08]();
}

uint64_t sub_191CF5DC8()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_191CF5DD8()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_191CF5DE8()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_191CF5DF8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_191CF5E08()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_191CF5E18()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_191CF5E28()
{
  return MEMORY[0x1F4184DE8]();
}

uint64_t sub_191CF5E38()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_191CF5E48()
{
  return MEMORY[0x1F4184DF8]();
}

uint64_t sub_191CF5E58()
{
  return MEMORY[0x1F4184E18]();
}

uint64_t sub_191CF5E68()
{
  return MEMORY[0x1F4184E40]();
}

uint64_t sub_191CF5E78()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_191CF5E88()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_191CF5E98()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_191CF5EA8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_191CF5EB8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_191CF5EC8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_191CF5ED8()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_191CF5EE8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_191CF5EF8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_191CF5F08()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_191CF5F18()
{
  return MEMORY[0x1F4184FF0]();
}

uint64_t sub_191CF5F28()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_191CF5F38()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_191CF5F48()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_191CF5F58()
{
  return MEMORY[0x1F41850B0]();
}

uint64_t sub_191CF5F68()
{
  return MEMORY[0x1F41850C0]();
}

uint64_t sub_191CF5F78()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_191CF5F88()
{
  return MEMORY[0x1F4185238]();
}

uint64_t sub_191CF5F98()
{
  return MEMORY[0x1F4185260]();
}

uint64_t sub_191CF5FA8()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_191CF5FB8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_191CF5FC8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_191CF5FD8()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_191CF5FE8()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_191CF5FF8()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_191CF6008()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_191CF6018()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_191CF6028()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_191CF6038()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_191CF6048()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_191CF6058()
{
  return MEMORY[0x1F4185378]();
}

uint64_t sub_191CF6068()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_191CF6078()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_191CF6088()
{
  return MEMORY[0x1F41853A8]();
}

uint64_t sub_191CF6098()
{
  return MEMORY[0x1F41854B0]();
}

uint64_t sub_191CF60A8()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_191CF60B8()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_191CF60C8()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_191CF60D8()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_191CF60E8()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_191CF60F8()
{
  return MEMORY[0x1F4185500]();
}

uint64_t sub_191CF6108()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_191CF6118()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_191CF6128()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_191CF6138()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_191CF6148()
{
  return MEMORY[0x1F4185580]();
}

uint64_t sub_191CF6158()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_191CF6168()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_191CF6178()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_191CF6188()
{
  return MEMORY[0x1F41855B0]();
}

uint64_t sub_191CF6198()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_191CF61A8()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_191CF61B8()
{
  return MEMORY[0x1F41855E8]();
}

uint64_t sub_191CF61C8()
{
  return MEMORY[0x1F41855F0]();
}

uint64_t sub_191CF61D8()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_191CF61E8()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_191CF61F8()
{
  return MEMORY[0x1F4185630]();
}

uint64_t sub_191CF6208()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_191CF6218()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_191CF6228()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_191CF6238()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_191CF6248()
{
  return MEMORY[0x1F41856A8]();
}

uint64_t sub_191CF6258()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_191CF6268()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_191CF6278()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_191CF6288()
{
  return MEMORY[0x1F41856D8]();
}

uint64_t sub_191CF6298()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_191CF62A8()
{
  return MEMORY[0x1F4185710]();
}

uint64_t sub_191CF62B8()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_191CF62C8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_191CF6308()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_191CF6318()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_191CF6328()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_191CF6338()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_191CF6348()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_191CF6358()
{
  return MEMORY[0x1F4185A88]();
}

uint64_t sub_191CF6368()
{
  return MEMORY[0x1F4185B20]();
}

uint64_t sub_191CF6378()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_191CF6388()
{
  return MEMORY[0x1F4185CF8]();
}

uint64_t sub_191CF63A8()
{
  return MEMORY[0x1F4185D38]();
}

uint64_t sub_191CF63B8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_191CF63C8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_191CF63D8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_191CF6408()
{
  return MEMORY[0x1F40E6E30]();
}

uint64_t sub_191CF6418()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_191CF6428()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_191CF6438()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_191CF6448()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_191CF6458()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_191CF6468()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_191CF6478()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_191CF6488()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_191CF6498()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_191CF64A8()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_191CF64B8()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_191CF64C8()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_191CF64D8()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_191CF64E8()
{
  return MEMORY[0x1F4185FB8]();
}

uint64_t sub_191CF64F8()
{
  return MEMORY[0x1F4185FC0]();
}

uint64_t sub_191CF6508()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_191CF6518()
{
  return MEMORY[0x1F4185FE0]();
}

uint64_t sub_191CF6528()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_191CF6538()
{
  return MEMORY[0x1F4186008]();
}

uint64_t sub_191CF6568()
{
  return MEMORY[0x1F4186318]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1F410C278]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1F410C310]();
}

uint64_t BSPIDIsBeingDebugged()
{
  return MEMORY[0x1F410C4B8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1F40DA8E8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetIdentifier()
{
  return MEMORY[0x1F40DA950]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CHSEdgeInsetsFromRect()
{
  return MEMORY[0x1F4111768]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1F4111798]();
}

uint64_t CHSWidgetFamilyIsValid()
{
  return MEMORY[0x1F41117A0]();
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1F41117C0]();
}

CTFontDescriptorRef CTFontDescriptorCreateCopyWithAttributes(CTFontDescriptorRef original, CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF3C0](original, attributes);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x1F40DF410]();
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return MEMORY[0x1F40DF428]();
}

uint64_t CTFontHasExuberatedLineHeight()
{
  return MEMORY[0x1F40DF5E0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSStringFromCHSWidgetBackgroundViewPolicy()
{
  return MEMORY[0x1F41117E0]();
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFLocaleCreateLikeCurrentWithBundleLocalizations()
{
  return MEMORY[0x1F40D8E70]();
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1F40CBE10]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1F40CBE18]();
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1F40CBE28]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1F4186498]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1F4186508]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1F4186568]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1F4186620]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1F41866C0]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x1F41866F0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x1F4186788]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x1F4188268]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1F41868A0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1F41868B8]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1F41868C0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1F41868C8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1F41868E8]();
}