uint64_t View.workoutPreview(_:isPresented:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a6;
  v22 = a5;
  v10 = sub_2467306A0();
  v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388]();
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (int *)type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  MEMORY[0x270FA5388]();
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  *(void *)&v16[v14[6]] = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v13, v10);
  v17 = &v16[v14[5]];
  *(void *)v17 = a2;
  *((void *)v17 + 1) = a3;
  v17[16] = a4;
  v18 = v14[7];
  v19 = objc_allocWithZone((Class)sub_2467306D0());
  swift_retain();
  swift_retain();
  *(void *)&v16[v18] = objc_msgSend(v19, sel_init);
  MEMORY[0x24C537260](v16, v22, v14, v23);
  return sub_24672EF50((uint64_t)v16);
}

uint64_t type metadata accessor for WorkoutPreviewPresentingOverlayModifier()
{
  uint64_t result = qword_268F9E1E8;
  if (!qword_268F9E1E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24672E618(uint64_t a1)
{
  uint64_t v2 = sub_246730770();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  sub_24672EC64((uint64_t)v5);
  uint64_t v8 = a1;
  sub_246730760();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_24672E71C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_2467306A0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v15 = a2 + *(int *)(v4 + 20);
    uint64_t v16 = *(void *)v15;
    uint64_t v17 = *(void *)(v15 + 8);
    LOBYTE(v15) = *(unsigned char *)(v15 + 16);
    uint64_t v28 = v16;
    uint64_t v29 = v17;
    char v30 = v15;
    id v27 = a1;
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E200);
    MEMORY[0x24C537280](&v31, v18);
    if (v31 == 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a2, v11);
      sub_24672FC98(a2, (uint64_t)v10);
      uint64_t v19 = *(unsigned __int8 *)(v5 + 80);
      uint64_t v26 = v12;
      uint64_t v20 = (v19 + 16) & ~v19;
      uint64_t v21 = swift_allocObject();
      sub_24672FD00((uint64_t)v10, v21 + v20);
      sub_24672FC98(a2, (uint64_t)v8);
      uint64_t v22 = swift_allocObject();
      sub_24672FD00((uint64_t)v8, v22 + v20);
      v23 = v27;
      sub_2467306C0();

      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v11);
    }
    else
    {
      v24 = v27;
      sub_2467306B0();
    }
  }
}

uint64_t sub_24672E9E4()
{
  return sub_2467307C0();
}

uint64_t sub_24672EA4C(uint64_t result)
{
  if ((result & 1) == 0)
  {
    type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E200);
    return sub_2467307C0();
  }
  return result;
}

uint64_t sub_24672EAC4()
{
  return sub_246730710();
}

uint64_t sub_24672EAE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = v2 + *(int *)(v5 + 28);
  uint64_t v7 = *(void *)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  LOBYTE(v6) = *(unsigned char *)(v6 + 16);
  uint64_t v14 = v7;
  uint64_t v15 = v8;
  char v16 = v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E200);
  MEMORY[0x24C537280](&v17, v9);
  LOBYTE(v14) = v17;
  sub_24672FC98(v2, (uint64_t)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v11 = swift_allocObject();
  sub_24672FD00((uint64_t)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E208);
  sub_24672FD7C();
  sub_2467307A0();
  return swift_release();
}

uint64_t sub_24672EC64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_246730750();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2467300BC(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_246730770();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = sub_2467307E0();
    uint64_t v13 = sub_246730780();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_246730124(0xD000000000000022, 0x8000000246730E90, &v17);
      _os_log_impl(&dword_24672C000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24C537510](v15, -1, -1);
      MEMORY[0x24C537510](v14, -1, -1);
    }

    sub_246730740();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24672EEE8()
{
  return sub_246730730();
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

uint64_t sub_24672EF50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24672EFAC()
{
  return swift_getWitnessTable();
}

unint64_t sub_24672F018()
{
  unint64_t result = qword_268F9E1D8;
  if (!qword_268F9E1D8)
  {
    type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9E1D8);
  }
  return result;
}

uint64_t *sub_24672F070(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2467306A0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    v10[16] = v11[16];
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_246730770();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
    }
    else
    {
      *uint64_t v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[7];
    uint64_t v18 = *(void **)((char *)a2 + v17);
    *(uint64_t *)((char *)a1 + v17) = (uint64_t)v18;
    id v19 = v18;
  }
  return a1;
}

void sub_24672F1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2467306A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_246730770();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = *(void **)(a1 + *(int *)(a2 + 28));
}

uint64_t sub_24672F2FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467306A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  uint64_t v11 = *(void *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  *(void *)(v9 + 8) = v11;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_246730770();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  else
  {
    *uint64_t v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v15 = a3[7];
  uint64_t v16 = *(void **)(a2 + v15);
  *(void *)(a1 + v15) = v16;
  id v17 = v16;
  return a1;
}

uint64_t sub_24672F438(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467306A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_retain();
  swift_release();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  if (a1 != a2)
  {
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_24672F5AC(a1 + v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_246730770();
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
  uint64_t v15 = *(void **)(a2 + v14);
  uint64_t v16 = *(void **)(a1 + v14);
  *(void *)(a1 + v14) = v15;
  id v17 = v15;

  return a1;
}

uint64_t sub_24672F5AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24672F60C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467306A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  uint64_t v11 = (void *)(a1 + v8);
  uint64_t v12 = (const void *)(a2 + v8);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v14 = sub_246730770();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
  }
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_24672F748(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_2467306A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_release();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  swift_release();
  *(unsigned char *)(v8 + 16) = *(unsigned char *)(v9 + 16);
  if (a1 != a2)
  {
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (const void *)(a2 + v10);
    sub_24672F5AC(a1 + v10);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_246730770();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
  }
  uint64_t v15 = a3[7];
  uint64_t v16 = *(void **)(a1 + v15);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);

  return a1;
}

uint64_t sub_24672F8B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24672F8CC);
}

uint64_t sub_24672F8CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2467306A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1E0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_24672FA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24672FA14);
}

uint64_t sub_24672FA14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_2467306A0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1E0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_24672FB48()
{
  sub_2467306A0();
  if (v0 <= 0x3F)
  {
    sub_24672FC24();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24672FC24()
{
  if (!qword_268F9E1F8)
  {
    sub_246730770();
    unint64_t v0 = sub_2467306E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268F9E1F8);
    }
  }
}

uint64_t sub_24672FC7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24672FC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24672FD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24672FD64()
{
  return sub_24672FE44(sub_24672E618);
}

unint64_t sub_24672FD7C()
{
  unint64_t result = qword_268F9E210;
  if (!qword_268F9E210)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268F9E208);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268F9E210);
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

void sub_24672FE20(void *a1)
{
  sub_24672E71C(a1, *(void *)(v1 + 16));
}

uint64_t sub_24672FE2C()
{
  return sub_24672FE44((uint64_t (*)(uint64_t))sub_24672E9E4);
}

uint64_t sub_24672FE44(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for WorkoutPreviewPresentingOverlayModifier() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = type metadata accessor for WorkoutPreviewPresentingOverlayModifier();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = sub_2467306A0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  swift_release();
  swift_release();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_246730770();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v3 + v4, v2 | 7);
}

uint64_t sub_24673003C(uint64_t a1)
{
  type metadata accessor for WorkoutPreviewPresentingOverlayModifier();

  return sub_24672EA4C(a1);
}

uint64_t sub_2467300BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E1D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_246730124(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_2467301F8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_246730348((uint64_t)v12, *a3);
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
      sub_246730348((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2467301F8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_2467303A4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_246730800();
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

uint64_t sub_246730348(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2467303A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24673043C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_246730540(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_246730540((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24673043C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_2467304D8(v2, 0);
      uint64_t result = sub_2467307F0();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_2467307D0();
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

void *sub_2467304D8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E218);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_246730540(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268F9E218);
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

uint64_t sub_246730630()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2467306A0()
{
  return MEMORY[0x270F07BB0]();
}

uint64_t sub_2467306B0()
{
  return MEMORY[0x270F872D8]();
}

uint64_t sub_2467306C0()
{
  return MEMORY[0x270F872E0]();
}

uint64_t sub_2467306D0()
{
  return MEMORY[0x270F872E8]();
}

uint64_t sub_2467306E0()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_2467306F0()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_246730700()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_246730710()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_246730720()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_246730730()
{
  return MEMORY[0x270F00D10]();
}

uint64_t sub_246730740()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_246730750()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_246730760()
{
  return MEMORY[0x270F02948]();
}

uint64_t sub_246730770()
{
  return MEMORY[0x270F02950]();
}

uint64_t sub_246730780()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_246730790()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_2467307A0()
{
  return MEMORY[0x270F041A0]();
}

uint64_t sub_2467307B0()
{
  return MEMORY[0x270F04B30]();
}

uint64_t sub_2467307C0()
{
  return MEMORY[0x270F04B48]();
}

uint64_t sub_2467307D0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2467307E0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_2467307F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_246730800()
{
  return MEMORY[0x270F9EB28]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

void objc_release(id a1)
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}