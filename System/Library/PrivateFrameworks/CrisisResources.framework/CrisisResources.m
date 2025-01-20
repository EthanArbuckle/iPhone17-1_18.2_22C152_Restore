uint64_t CrisisResource.resourceType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t CrisisResource.name.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.phoneNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.smsNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.website.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for CrisisResource() + 32);

  return sub_24C861170(v3, a1);
}

uint64_t type metadata accessor for CrisisResource()
{
  uint64_t result = qword_2697F7230;
  if (!qword_2697F7230) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_24C861170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
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

uint64_t CrisisResource.websearchQuery.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.languageCode.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.countryCode.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 44));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CrisisResource.city.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CrisisResource() + 48));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24C86131C(char a1)
{
  return *(void *)&aResourcename[8 * a1];
}

BOOL sub_24C86133C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24C861350()
{
  return sub_24C8669B0();
}

uint64_t sub_24C861398()
{
  return sub_24C8669A0();
}

uint64_t sub_24C8613C4()
{
  return sub_24C8669B0();
}

uint64_t sub_24C861408()
{
  return sub_24C86131C(*v0);
}

uint64_t sub_24C861410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_24C8631F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24C861438()
{
  return 0;
}

void sub_24C861444(unsigned char *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_24C861450(uint64_t a1)
{
  unint64_t v2 = sub_24C861804();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24C86148C(uint64_t a1)
{
  unint64_t v2 = sub_24C861804();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t CrisisResource.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24C861804();
  sub_24C8669D0();
  v10[15] = *v3;
  v10[14] = 0;
  sub_24C861858();
  sub_24C866920();
  if (!v2)
  {
    v10[13] = 1;
    sub_24C8668F0();
    v10[12] = 2;
    sub_24C8668F0();
    v10[11] = 3;
    sub_24C8668F0();
    type metadata accessor for CrisisResource();
    v10[10] = 4;
    sub_24C8666B0();
    sub_24C861F9C(&qword_2697F7210);
    sub_24C866900();
    v10[9] = 5;
    sub_24C8668F0();
    v10[8] = 6;
    sub_24C866910();
    v10[7] = 7;
    sub_24C866910();
    v10[6] = 8;
    sub_24C8668F0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24C861804()
{
  unint64_t result = qword_2697F7200;
  if (!qword_2697F7200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7200);
  }
  return result;
}

unint64_t sub_24C861858()
{
  unint64_t result = qword_2697F7208;
  if (!qword_2697F7208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7208);
  }
  return result;
}

uint64_t CrisisResource.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v36 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7218);
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  MEMORY[0x270FA5388]();
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CrisisResource();
  MEMORY[0x270FA5388]();
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1[3];
  v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_24C861804();
  sub_24C8669C0();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
  }
  uint64_t v13 = v37;
  char v48 = 0;
  sub_24C861F48();
  sub_24C8668E0();
  v14 = (int *)v9;
  char *v11 = v49;
  char v47 = 1;
  uint64_t v15 = sub_24C8668B0();
  uint64_t v16 = v13;
  uint64_t v17 = (uint64_t)v39;
  *((void *)v11 + 1) = v15;
  *((void *)v11 + 2) = v18;
  char v46 = 2;
  *((void *)v11 + 3) = sub_24C8668B0();
  *((void *)v11 + 4) = v19;
  char v45 = 3;
  *((void *)v11 + 5) = sub_24C8668B0();
  *((void *)v11 + 6) = v20;
  sub_24C8666B0();
  char v44 = 4;
  sub_24C861F9C(&qword_2697F7228);
  sub_24C8668C0();
  sub_24C861FE0((uint64_t)v5, (uint64_t)&v11[v14[8]]);
  char v43 = 5;
  uint64_t v21 = sub_24C8668B0();
  v22 = (uint64_t *)&v11[v14[9]];
  uint64_t *v22 = v21;
  v22[1] = v23;
  char v42 = 6;
  uint64_t v24 = sub_24C8668D0();
  v25 = (uint64_t *)&v11[v14[10]];
  uint64_t *v25 = v24;
  v25[1] = v26;
  char v41 = 7;
  uint64_t v27 = sub_24C8668D0();
  v28 = (uint64_t *)&v11[v14[11]];
  uint64_t *v28 = v27;
  v28[1] = v29;
  char v40 = 8;
  uint64_t v30 = sub_24C8668B0();
  uint64_t v32 = v31;
  (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v38);
  v33 = (uint64_t *)&v11[v14[12]];
  uint64_t *v33 = v30;
  v33[1] = v32;
  sub_24C862048((uint64_t)v11, v36);
  __swift_destroy_boxed_opaque_existential_1(v17);
  return sub_24C8620AC((uint64_t)v11);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24C861EE8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24C861F48()
{
  unint64_t result = qword_2697F7220;
  if (!qword_2697F7220)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7220);
  }
  return result;
}

uint64_t sub_24C861F9C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24C8666B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24C861FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C862048(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CrisisResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24C8620AC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CrisisResource();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24C862108@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return CrisisResource.init(from:)(a1, a2);
}

uint64_t sub_24C862120(void *a1)
{
  return CrisisResource.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for CrisisResource(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    uint64_t v7 = a2[2];
    a1[1] = a2[1];
    a1[2] = v7;
    uint64_t v8 = a2[4];
    a1[3] = a2[3];
    a1[4] = v8;
    uint64_t v9 = a2[6];
    uint64_t v10 = a3[8];
    __dst = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    a1[5] = a2[5];
    a1[6] = v9;
    uint64_t v12 = sub_24C8666B0();
    uint64_t v13 = *(void *)(v12 - 8);
    v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v33(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
      memcpy(__dst, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    uint64_t v16 = a3[9];
    uint64_t v17 = a3[10];
    uint64_t v18 = (uint64_t *)((char *)v4 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)v4 + v17);
    v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = a3[11];
    uint64_t v25 = a3[12];
    uint64_t v26 = (uint64_t *)((char *)v4 + v24);
    uint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = (uint64_t *)((char *)v4 + v25);
    uint64_t v30 = (uint64_t *)((char *)a2 + v25);
    uint64_t v31 = v30[1];
    *uint64_t v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for CrisisResource(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_24C8666B0();
  uint64_t v6 = *(void *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  uint64_t v8 = a3[8];
  __dst = (void *)(a1 + v8);
  uint64_t v9 = (const void *)(a2 + v8);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v10 = sub_24C8666B0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
    memcpy(__dst, v9, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  uint64_t v14 = a3[9];
  uint64_t v15 = a3[10];
  uint64_t v16 = (void *)(a1 + v14);
  uint64_t v17 = (void *)(a2 + v14);
  uint64_t v18 = v17[1];
  *uint64_t v16 = *v17;
  v16[1] = v18;
  uint64_t v19 = (void *)(a1 + v15);
  uint64_t v20 = (void *)(a2 + v15);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = a3[11];
  uint64_t v23 = a3[12];
  uint64_t v24 = (void *)(a1 + v22);
  uint64_t v25 = (void *)(a2 + v22);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  uint64_t v27 = (void *)(a1 + v23);
  uint64_t v28 = (void *)(a2 + v23);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (void *)(a2 + v6);
  uint64_t v9 = sub_24C8666B0();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  int v12 = v11(v7, 1, v9);
  int v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
    memcpy(v7, v8, *(void *)(*(void *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  uint64_t v15 = a3[9];
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (void *)(a2 + v15);
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[10];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (void *)(a2 + v18);
  *uint64_t v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[11];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  void *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[12];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (void *)(a2 + v24);
  void *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  uint64_t v6 = a3[8];
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_24C8666B0();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  uint64_t v12 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  uint64_t v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  return a1;
}

uint64_t assignWithTake for CrisisResource(uint64_t a1, uint64_t a2, int *a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = a3[8];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (void *)(a2 + v9);
  uint64_t v12 = sub_24C8666B0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  int v15 = v14(v10, 1, v12);
  int v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v10, v11, v12);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
    memcpy(v10, v11, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  uint64_t v18 = a3[9];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (uint64_t *)(a2 + v18);
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  *uint64_t v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[10];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (uint64_t *)(a2 + v23);
  uint64_t v27 = *v25;
  uint64_t v26 = v25[1];
  *uint64_t v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  uint64_t v28 = a3[11];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (uint64_t *)(a2 + v28);
  uint64_t v32 = *v30;
  uint64_t v31 = v30[1];
  *uint64_t v29 = v32;
  v29[1] = v31;
  swift_bridgeObjectRelease();
  uint64_t v33 = a3[12];
  v34 = (void *)(a1 + v33);
  uint64_t v35 = (uint64_t *)(a2 + v33);
  uint64_t v37 = *v35;
  uint64_t v36 = v35[1];
  void *v34 = v37;
  v34[1] = v36;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CrisisResource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_24C862C80);
}

uint64_t sub_24C862C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 40) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CrisisResource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24C862D60);
}

uint64_t sub_24C862D60(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 32);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  }
  return result;
}

void sub_24C862E28()
{
  sub_24C862EDC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_24C862EDC()
{
  if (!qword_2697F7240)
  {
    sub_24C8666B0();
    unint64_t v0 = sub_24C866820();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_2697F7240);
    }
  }
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CrisisResource.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CrisisResource.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x24C8630A0);
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

uint64_t sub_24C8630C8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24C8630D4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CrisisResource.CodingKeys()
{
  return &type metadata for CrisisResource.CodingKeys;
}

unint64_t sub_24C8630F0()
{
  unint64_t result = qword_2697F7248;
  if (!qword_2697F7248)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7248);
  }
  return result;
}

unint64_t sub_24C863148()
{
  unint64_t result = qword_2697F7250;
  if (!qword_2697F7250)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7250);
  }
  return result;
}

unint64_t sub_24C8631A0()
{
  unint64_t result = qword_2697F7258;
  if (!qword_2697F7258)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7258);
  }
  return result;
}

uint64_t sub_24C8631F4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656372756F736572 && a2 == 0xEC00000065707954;
  if (v3 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6D754E656E6F6870 && a2 == 0xEB00000000726562 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65626D754E736D73 && a2 == 0xE900000000000072 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65746973626577 && a2 == 0xE700000000000000 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6372616573626577 && a2 == 0xEE00797265755168 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x65676175676E616CLL && a2 == 0xEC00000065646F43 || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL || (sub_24C866940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 2037672291 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    char v6 = sub_24C866940();
    swift_bridgeObjectRelease();
    if (v6) {
      return 8;
    }
    else {
      return 9;
    }
  }
}

uint64_t CrisisResourcesProvider.getCrisisResources(resourceType:isoCountryCode:locale:locality:)(int a1, uint64_t a2, uint8_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v82 = a5;
  uint64_t v80 = a2;
  LODWORD(v86) = a1;
  uint64_t v85 = sub_24C8666B0();
  uint64_t v77 = *(void *)(v85 - 8);
  MEMORY[0x270FA5388](v85);
  v84 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24C866720();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v88 = ((char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = sub_24C866740();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  v76 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v68 - v17;
  if (qword_2697F71E8 != -1) {
    swift_once();
  }
  uint64_t v19 = __swift_project_value_buffer(v13, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v74 = v14 + 16;
  uint64_t v75 = v19;
  v73 = v20;
  v20(v18, v19, v13);
  uint64_t v21 = *(void (**)(NSObject *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v81 = a4;
  v21(v88, a4, v10);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = v13;
  uint64_t v23 = a6;
  uint64_t v24 = sub_24C866730();
  os_log_type_t v25 = sub_24C8667F0();
  int v78 = v25;
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v27 = v10;
  uint64_t v79 = v14;
  if (v26)
  {
    uint64_t v28 = swift_slowAlloc();
    v87 = a3;
    v71 = v18;
    uint64_t v72 = v22;
    uint64_t v29 = v28;
    uint64_t v70 = swift_slowAlloc();
    unint64_t v91 = v70;
    *(_DWORD *)uint64_t v29 = 136315906;
    LOBYTE(v89) = (_BYTE)v86;
    os_log_t v69 = v24;
    uint64_t v30 = sub_24C866780();
    uint64_t v89 = sub_24C864C64(v30, v31, (uint64_t *)&v91);
    sub_24C866830();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v32 = v80;
    uint64_t v89 = sub_24C864C64(v80, (unint64_t)v87, (uint64_t *)&v91);
    sub_24C866830();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v29 + 22) = 2080;
    sub_24C8652BC(&qword_2697F7278, MEMORY[0x263F07690]);
    uint64_t v33 = v88;
    uint64_t v34 = sub_24C866930();
    uint64_t v89 = sub_24C864C64(v34, v35, (uint64_t *)&v91);
    sub_24C866830();
    swift_bridgeObjectRelease();
    (*(void (**)(NSObject *, uint64_t))(v11 + 8))(v33, v27);
    *(_WORD *)(v29 + 32) = 2080;
    uint64_t v36 = v82;
    if (v23) {
      uint64_t v37 = v82;
    }
    else {
      uint64_t v37 = 0x3E6C696E3CLL;
    }
    if (v23) {
      unint64_t v38 = v23;
    }
    else {
      unint64_t v38 = 0xE500000000000000;
    }
    swift_bridgeObjectRetain();
    uint64_t v89 = sub_24C864C64(v37, v38, (uint64_t *)&v91);
    uint64_t v39 = (uint64_t)v84;
    sub_24C866830();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v40 = v69;
    _os_log_impl(&dword_24C85F000, v69, (os_log_type_t)v78, "Retrieving crisis resource with resourceType: %s, isoCountryCode: %s, locale: %s, locality: %s", (uint8_t *)v29, 0x2Au);
    uint64_t v41 = v70;
    swift_arrayDestroy();
    MEMORY[0x2532FD420](v41, -1, -1);
    a3 = v87;
    MEMORY[0x2532FD420](v29, -1, -1);

    char v42 = *(void (**)(char *, uint64_t))(v79 + 8);
    uint64_t v43 = v72;
    v42(v71, v72);
    uint64_t v44 = v32;
    uint64_t v45 = v86;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(NSObject *, uint64_t))(v11 + 8))(v88, v10);

    swift_bridgeObjectRelease_n();
    char v42 = *(void (**)(char *, uint64_t))(v14 + 8);
    v42(v18, v22);
    uint64_t v43 = v22;
    uint64_t v36 = v82;
    uint64_t v44 = v80;
    uint64_t v45 = v86;
    uint64_t v39 = (uint64_t)v84;
  }
  uint64_t v46 = v83;
  sub_24C863E90(v45, v44, a3, v81, v36, v23, v39);
  if (!v46)
  {
    uint64_t v47 = sub_24C8666C0();
    unint64_t v49 = v48;
    sub_24C866680();
    swift_allocObject();
    sub_24C866670();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7260);
    sub_24C864B20();
    sub_24C866660();
    swift_release();
    uint64_t v36 = v91;
    v51 = v76;
    uint64_t v52 = v43;
    v73(v76, v75, v43);
    swift_bridgeObjectRetain_n();
    v53 = sub_24C866730();
    os_log_type_t v54 = sub_24C8667F0();
    v88 = v53;
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v56 = swift_slowAlloc();
      v87 = (uint8_t *)swift_slowAlloc();
      unint64_t v91 = (unint64_t)v87;
      *(_DWORD *)uint64_t v56 = 134218242;
      uint64_t v89 = *(void *)(v36 + 16);
      v86 = &v90;
      sub_24C866830();
      swift_bridgeObjectRelease();
      *(_WORD *)(v56 + 12) = 2080;
      uint64_t v83 = v56 + 14;
      uint64_t v57 = type metadata accessor for CrisisResource();
      uint64_t v58 = swift_bridgeObjectRetain();
      uint64_t v59 = MEMORY[0x2532FCF60](v58, v57);
      uint64_t v72 = v52;
      os_log_type_t v60 = v54;
      uint64_t v61 = v59;
      unint64_t v63 = v62;
      swift_bridgeObjectRelease();
      uint64_t v89 = sub_24C864C64(v61, v63, (uint64_t *)&v91);
      sub_24C866830();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v64 = v88;
      _os_log_impl(&dword_24C85F000, v88, v60, "Retrieved %ld resource(s): %s", (uint8_t *)v56, 0x16u);
      unint64_t v65 = (unint64_t)v87;
      swift_arrayDestroy();
      MEMORY[0x2532FD420](v65, -1, -1);
      MEMORY[0x2532FD420](v56, -1, -1);
      sub_24C864C0C(v47, v49);

      v66 = v76;
      uint64_t v67 = v72;
    }
    else
    {
      sub_24C864C0C(v47, v49);
      swift_bridgeObjectRelease_n();

      v66 = v51;
      uint64_t v67 = v52;
    }
    v42(v66, v67);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v84, v85);
  }
  return v36;
}

void sub_24C863E90(uint64_t a1@<X0>, uint64_t a2@<X1>, uint8_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v76 = a6;
  uint64_t v64 = a5;
  uint64_t v73 = a2;
  uint64_t v74 = a3;
  uint64_t v70 = a1;
  uint64_t v69 = a7;
  uint64_t v8 = sub_24C866720();
  uint64_t v71 = *(void *)(v8 - 8);
  uint64_t v72 = v8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v77 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24C866740();
  uint64_t v79 = *(void *)(v10 - 8);
  uint64_t v80 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v75 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v63 = (char *)&v63 - v13;
  uint64_t v14 = sub_24C866690();
  uint64_t v67 = *(void *)(v14 - 8);
  uint64_t v68 = v14;
  MEMORY[0x270FA5388](v14);
  v66 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F71F0);
  MEMORY[0x270FA5388](v16 - 8);
  unint64_t v65 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7288);
  MEMORY[0x270FA5388](v18 - 8);
  uint64_t v20 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_24C866700();
  uint64_t v22 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_24C8666E0();
  BOOL v26 = *(char **)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  uint64_t v28 = (char *)&v63 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BundleHelper();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v78 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24C866710();
  sub_24C8666F0();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v26 + 6))(v20, 1, v25) == 1)
  {
    sub_24C865398((uint64_t)v20);
    if (qword_2697F71E8 != -1) {
      swift_once();
    }
    uint64_t v30 = v80;
    uint64_t v31 = __swift_project_value_buffer(v80, (uint64_t)static Logger.crisisResources);
    swift_beginAccess();
    uint64_t v32 = v79;
    uint64_t v33 = v75;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 16))(v75, v31, v30);
    uint64_t v34 = v71;
    uint64_t v35 = v72;
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v77, a4, v72);
    uint64_t v36 = sub_24C866730();
    os_log_type_t v37 = sub_24C866800();
    if (os_log_type_enabled(v36, v37))
    {
      unint64_t v38 = (uint8_t *)swift_slowAlloc();
      uint64_t v76 = swift_slowAlloc();
      uint64_t v82 = v76;
      uint64_t v39 = v77;
      *(_DWORD *)unint64_t v38 = 136315138;
      uint64_t v74 = v38 + 4;
      sub_24C8652BC(&qword_2697F7278, MEMORY[0x263F07690]);
      uint64_t v40 = sub_24C866930();
      uint64_t v85 = sub_24C864C64(v40, v41, &v82);
      sub_24C866830();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v39, v35);
      _os_log_impl(&dword_24C85F000, v36, v37, "No languageCode found in locale: %s", v38, 0xCu);
      uint64_t v42 = v76;
      swift_arrayDestroy();
      MEMORY[0x2532FD420](v42, -1, -1);
      MEMORY[0x2532FD420](v38, -1, -1);

      (*(void (**)(char *, uint64_t))(v79 + 8))(v33, v80);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v34 + 8))(v77, v35);

      (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v30);
    }
    uint64_t v46 = v78;
    sub_24C8653F8();
    swift_allocError();
    *uint64_t v47 = 0;
    swift_willThrow();
  }
  else
  {
    uint64_t v77 = v26;
    (*((void (**)(char *, char *, uint64_t))v26 + 4))(v28, v20, v25);
    v84[0] = 0;
    v84[1] = 0xE000000000000000;
    sub_24C866850();
    swift_bridgeObjectRelease();
    strcpy((char *)v84, "ResourceData/");
    HIWORD(v84[1]) = -4864;
    uint64_t v44 = v79;
    uint64_t v43 = v80;
    uint64_t v45 = v78;
    sub_24C8667A0();
    swift_bridgeObjectRelease();
    sub_24C8667A0();
    uint64_t v75 = v28;
    sub_24C8666D0();
    sub_24C8667A0();
    swift_bridgeObjectRelease();
    sub_24C8667A0();
    sub_24C8667A0();
    sub_24C8667A0();
    uint64_t v82 = v84[0];
    unint64_t v83 = v84[1];
    if (v76)
    {
      v84[0] = v64;
      v84[1] = v76;
      swift_bridgeObjectRetain();
      sub_24C8667A0();
      sub_24C8667A0();
      swift_bridgeObjectRelease();
    }
    unint64_t v48 = (void *)sub_24C866760();
    unint64_t v49 = (void *)sub_24C866760();
    swift_bridgeObjectRetain();
    v50 = (void *)sub_24C866760();
    swift_bridgeObjectRelease();
    id v51 = objc_msgSend(v45, sel_pathForResource_ofType_inDirectory_, v48, v49, v50);

    if (v51)
    {
      sub_24C866770();
      swift_bridgeObjectRelease();

      uint64_t v52 = sub_24C8666B0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v65, 1, 1, v52);
      (*(void (**)(char *, void, uint64_t))(v67 + 104))(v66, *MEMORY[0x263F06E50], v68);
      sub_24C8666A0();

      (*((void (**)(char *, uint64_t))v77 + 1))(v75, v25);
    }
    else
    {
      if (qword_2697F71E8 != -1) {
        swift_once();
      }
      uint64_t v53 = __swift_project_value_buffer(v43, (uint64_t)static Logger.crisisResources);
      swift_beginAccess();
      os_log_type_t v54 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v63, v53, v43);
      unint64_t v55 = v83;
      uint64_t v76 = v82;
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_24C866730();
      os_log_type_t v57 = sub_24C866800();
      if (os_log_type_enabled(v56, v57))
      {
        uint64_t v74 = (uint8_t *)v25;
        uint64_t v58 = (uint8_t *)swift_slowAlloc();
        uint64_t v59 = v44;
        uint64_t v60 = swift_slowAlloc();
        uint64_t v85 = v60;
        *(_DWORD *)uint64_t v58 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v81 = sub_24C864C64(v76, v55, &v85);
        uint64_t v25 = (uint64_t)v74;
        uint64_t v45 = v78;
        sub_24C866830();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24C85F000, v56, v57, "Failed to resolve bundle resource path in directory: %s", v58, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2532FD420](v60, -1, -1);
        MEMORY[0x2532FD420](v58, -1, -1);

        (*(void (**)(char *, uint64_t))(v59 + 8))(v54, v80);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v44 + 8))(v54, v43);
      }
      uint64_t v61 = v77;
      sub_24C8653F8();
      swift_allocError();
      *unint64_t v62 = 2;
      swift_willThrow();

      (*((void (**)(char *, uint64_t))v61 + 1))(v75, v25);
    }
  }
}

uint64_t sub_24C864AC0(int a1, uint64_t a2, uint8_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return CrisisResourcesProvider.getCrisisResources(resourceType:isoCountryCode:locale:locality:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_24C864AD8()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_24C864B20()
{
  unint64_t result = qword_2697F7268;
  if (!qword_2697F7268)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2697F7260);
    sub_24C8652BC(&qword_2697F7270, (void (*)(uint64_t))type metadata accessor for CrisisResource);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7268);
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

uint64_t sub_24C864C0C(uint64_t a1, unint64_t a2)
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

uint64_t sub_24C864C64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24C864D38(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24C865338((uint64_t)v12, *a3);
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
      sub_24C865338((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24C864D38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24C866840();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24C864EF4(a5, a6);
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
  uint64_t v8 = sub_24C866870();
  if (!v8)
  {
    sub_24C866880();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24C866890();
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

uint64_t sub_24C864EF4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24C864F8C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24C86516C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24C86516C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24C864F8C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24C865104(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24C866860();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24C866880();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24C8667B0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24C866890();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24C866880();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24C865104(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7280);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24C86516C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7280);
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
  uint64_t result = sub_24C866890();
  __break(1u);
  return result;
}

uint64_t sub_24C8652BC(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for CrisisResourcesProvider()
{
  return &type metadata for CrisisResourcesProvider;
}

uint64_t type metadata accessor for BundleHelper()
{
  return self;
}

uint64_t sub_24C865338(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24C865398(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697F7288);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24C8653F8()
{
  unint64_t result = qword_2697F7290;
  if (!qword_2697F7290)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F7290);
  }
  return result;
}

uint64_t Logger.crisisResources.unsafeMutableAddressor()
{
  if (qword_2697F71E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24C866740();

  return __swift_project_value_buffer(v0, (uint64_t)static Logger.crisisResources);
}

void sub_24C8654B0()
{
  algn_2697F7A48[7] = -18;
}

void sub_24C8654E0()
{
  qword_2697F7A50 = 0x6552736973697243;
  *(void *)algn_2697F7A58 = 0xEF73656372756F73;
}

uint64_t sub_24C865510()
{
  sub_24C865980();
  if (qword_2697F71D0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_2697F71D8;
  swift_bridgeObjectRetain();
  if (v0 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_24C866810();
  static Log.crisisResources = result;
  return result;
}

uint64_t *Log.crisisResources.unsafeMutableAddressor()
{
  if (qword_2697F71E0 != -1) {
    swift_once();
  }
  return &static Log.crisisResources;
}

id static Log.crisisResources.getter()
{
  if (qword_2697F71E0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static Log.crisisResources;

  return v0;
}

uint64_t sub_24C865694()
{
  uint64_t v0 = sub_24C866740();
  __swift_allocate_value_buffer(v0, static Logger.crisisResources);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.crisisResources);
  if (qword_2697F71E0 != -1) {
    swift_once();
  }
  id v1 = (id)static Log.crisisResources;
  return sub_24C866750();
}

uint64_t static Logger.crisisResources.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2697F71E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24C866740();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static Logger.crisisResources.setter(uint64_t a1)
{
  if (qword_2697F71E8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_24C866740();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static Logger.crisisResources.modify())()
{
  if (qword_2697F71E8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_24C866740();
  __swift_project_value_buffer(v0, (uint64_t)static Logger.crisisResources);
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

unint64_t sub_24C865980()
{
  unint64_t result = qword_2697F7298;
  if (!qword_2697F7298)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2697F7298);
  }
  return result;
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

unint64_t CrisisResourceType.asDirectoryName.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x73416C6175786553;
      break;
    case 2:
      unint64_t result = 0x6F436E6F73696F50;
      break;
    case 3:
    case 5:
      unint64_t result = 0xD000000000000010;
      break;
    case 4:
      unint64_t result = 0x65486C61746E654DLL;
      break;
    case 6:
      unint64_t result = 1296126787;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t CrisisResourceType.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000019;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
      unint64_t result = 0x68206C61746E656DLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 1835103075;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_24C865BFC(unsigned __int8 *a1, char *a2)
{
  return sub_24C865C08(*a1, *a2);
}

uint64_t sub_24C865C08(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000019;
  unint64_t v3 = 0x800000024C867210;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000019;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0xD00000000000001CLL;
      unint64_t v6 = "sexual assault crisis center";
      goto LABEL_7;
    case 2:
      unint64_t v5 = 0xD000000000000015;
      unint64_t v6 = "poison control center";
      goto LABEL_7;
    case 3:
      unint64_t v6 = "domestic violence hotline";
      goto LABEL_7;
    case 4:
      unint64_t v3 = 0xED000068746C6165;
      unint64_t v5 = 0x68206C61746E656DLL;
      break;
    case 5:
      unint64_t v5 = 0xD000000000000011;
      unint64_t v6 = "general emergency";
LABEL_7:
      unint64_t v3 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      break;
    case 6:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1835103075;
      break;
    default:
      break;
  }
  unint64_t v7 = 0x800000024C867210;
  switch(a2)
  {
    case 1:
      unint64_t v2 = 0xD00000000000001CLL;
      int64_t v8 = "sexual assault crisis center";
      goto LABEL_16;
    case 2:
      unint64_t v2 = 0xD000000000000015;
      int64_t v8 = "poison control center";
      goto LABEL_16;
    case 3:
      int64_t v8 = "domestic violence hotline";
      goto LABEL_16;
    case 4:
      unint64_t v7 = 0xED000068746C6165;
      if (v5 != 0x68206C61746E656DLL) {
        goto LABEL_21;
      }
      goto LABEL_18;
    case 5:
      unint64_t v2 = 0xD000000000000011;
      int64_t v8 = "general emergency";
LABEL_16:
      unint64_t v7 = (unint64_t)(v8 - 32) | 0x8000000000000000;
      goto LABEL_17;
    case 6:
      unint64_t v7 = 0xE400000000000000;
      if (v5 != 1835103075) {
        goto LABEL_21;
      }
      goto LABEL_18;
    default:
LABEL_17:
      if (v5 != v2) {
        goto LABEL_21;
      }
LABEL_18:
      if (v3 == v7) {
        char v9 = 1;
      }
      else {
LABEL_21:
      }
        char v9 = sub_24C866940();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_24C865E04()
{
  return sub_24C865F28();
}

uint64_t sub_24C865E10()
{
  return sub_24C865E18();
}

uint64_t sub_24C865E18()
{
  sub_24C866790();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24C865F20()
{
  return sub_24C865F28();
}

uint64_t sub_24C865F28()
{
  return sub_24C8669B0();
}

uint64_t sub_24C86604C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _s15CrisisResources0A12ResourceTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_24C86607C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CrisisResourceType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24C8660A8()
{
  return sub_24C8667D0();
}

uint64_t sub_24C866108()
{
  return sub_24C8667C0();
}

uint64_t _s15CrisisResources0A12ResourceTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0 = sub_24C8668A0();
  swift_bridgeObjectRelease();
  if (v0 >= 7) {
    return 7;
  }
  else {
    return v0;
  }
}

unint64_t sub_24C8661A8()
{
  unint64_t result = qword_2697F72A0;
  if (!qword_2697F72A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F72A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CrisisResourceType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CrisisResourceType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
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
        JUMPOUT(0x24C866358);
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
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CrisisResourceType()
{
  return &type metadata for CrisisResourceType;
}

unint64_t sub_24C866390()
{
  unint64_t result = qword_2697F72A8;
  if (!qword_2697F72A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F72A8);
  }
  return result;
}

BOOL static CrisisResourceError.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t CrisisResourceError.hash(into:)()
{
  return sub_24C8669A0();
}

uint64_t CrisisResourceError.hashValue.getter()
{
  return sub_24C8669B0();
}

unint64_t sub_24C866468()
{
  unint64_t result = qword_2697F72B0;
  if (!qword_2697F72B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2697F72B0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for CrisisResourceError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CrisisResourceError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x24C866628);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CrisisResourceError()
{
  return &type metadata for CrisisResourceError;
}

uint64_t sub_24C866660()
{
  return MEMORY[0x270EEF238]();
}

uint64_t sub_24C866670()
{
  return MEMORY[0x270EEF250]();
}

uint64_t sub_24C866680()
{
  return MEMORY[0x270EEF268]();
}

uint64_t sub_24C866690()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_24C8666A0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_24C8666B0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_24C8666C0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_24C8666D0()
{
  return MEMORY[0x270EF0DB8]();
}

uint64_t sub_24C8666E0()
{
  return MEMORY[0x270EF0DD8]();
}

uint64_t sub_24C8666F0()
{
  return MEMORY[0x270EF1008]();
}

uint64_t sub_24C866700()
{
  return MEMORY[0x270EF1060]();
}

uint64_t sub_24C866710()
{
  return MEMORY[0x270EF1080]();
}

uint64_t sub_24C866720()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_24C866730()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24C866740()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24C866750()
{
  return MEMORY[0x270FA2E30]();
}

uint64_t sub_24C866760()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24C866770()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24C866780()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24C866790()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24C8667A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24C8667B0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24C8667C0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_24C8667D0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_24C8667E0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24C8667F0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24C866800()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24C866810()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_24C866820()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24C866830()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24C866840()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24C866850()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_24C866860()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24C866870()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24C866880()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24C866890()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24C8668A0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_24C8668B0()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_24C8668C0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_24C8668D0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_24C8668E0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_24C8668F0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_24C866900()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_24C866910()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_24C866920()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_24C866930()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24C866940()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24C866950()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24C866960()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24C866970()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24C866980()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24C866990()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24C8669A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24C8669B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24C8669C0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24C8669D0()
{
  return MEMORY[0x270F9FD98]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
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