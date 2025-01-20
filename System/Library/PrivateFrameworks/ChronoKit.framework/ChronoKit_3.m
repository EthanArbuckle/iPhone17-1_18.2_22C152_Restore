uint64_t sub_1DA97E700(id *a1)
{
  uint64_t v1;

  sub_1DA837668(a1, v1);
  return 1;
}

uint64_t sub_1DA97E744(id *a1)
{
  v2[3] = a1;
  return sub_1DA7F0690(a1, (void (*)(uint64_t *__return_ptr, uint64_t, char *))sub_1DA97F274, (uint64_t)v2);
}

uint64_t sub_1DA97E780@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE67048);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_1DA98B968();
  if (!v2)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE67040);
    sub_1DA980004();
    sub_1DA989318();
    uint64_t v10 = *(void *)(v9 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    sub_1DA989918();
    char v11 = v14[0];
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    BOOL v12 = sub_1DA7EE210(a1);
    sub_1DA7A19A4(&v15, (uint64_t)v14);
    type metadata accessor for ControlEntryContent();
    uint64_t v13 = swift_allocObject();
    uint64_t result = sub_1DA7A19A4(v14, v13 + 16);
    *(unsigned char *)(v13 + 56) = v11;
    *(unsigned char *)(v13 + 57) = v12;
    *a2 = v13;
  }
  return result;
}

void *sub_1DA97E9C4(id *a1)
{
  uint64_t v3 = v1;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66AF0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DA98B9E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  char v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1DA989478();
  MEMORY[0x1F4188790](v12);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  v19 = (char *)&v44 - v18;
  if (*(unsigned char *)(v3 + 160) != 1)
  {
    v23 = (void *)type metadata accessor for ControlsCacheManager.CacheManagementError(0);
    sub_1DA97F290(&qword_1EA8E6BA0, (void (*)(uint64_t))type metadata accessor for ControlsCacheManager.CacheManagementError);
    swift_allocError();
LABEL_7:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return v23;
  }
  uint64_t v48 = v9;
  uint64_t v49 = v8;
  v51 = v17;
  uint64_t v52 = v16;
  v50 = v7;
  sub_1DA7A1A44(v3 + 40, (uint64_t)&v53);
  unint64_t v20 = v54;
  v21 = v55;
  __swift_project_boxed_opaque_existential_0(&v53, v54);
  char v22 = ((uint64_t (*)(id *, unint64_t, _UNKNOWN **))v21[5])(a1, v20, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v53);
  if ((v22 & 1) == 0)
  {
    v23 = (void *)type metadata accessor for ControlsCacheManager.CacheManagementError(0);
    sub_1DA97F290(&qword_1EA8E6BA0, (void (*)(uint64_t))type metadata accessor for ControlsCacheManager.CacheManagementError);
    swift_allocError();
    sub_1DA8DBDE4((uint64_t)a1, v27);
    goto LABEL_7;
  }
  v23 = (void *)v3;
  sub_1DA7EF6E0(a1, (uint64_t)v19);
  if (!v2)
  {
    swift_beginAccess();
    sub_1DA7A1A44(v3 + 120, (uint64_t)&v53);
    v24 = v55;
    __swift_project_boxed_opaque_existential_0(&v53, v54);
    id v25 = objc_msgSend(*a1, sel_extensionIdentity);
    v26 = (void (*)(void))v24[2];
    id v47 = v25;
    v26();

    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v53);
    id v29 = *(id *)(v3 + 16);
    sub_1DA989418();
    v30 = (void *)sub_1DA9893A8();
    v46 = (void (*)(char *, uint64_t))v51[1];
    id v47 = v51 + 1;
    v46(v14, v52);
    *(void *)&long long v53 = 0;
    unsigned __int8 v31 = objc_msgSend(v29, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v30, 1, 0, &v53);

    v32 = (id)v53;
    if (v31)
    {
      *(void *)&long long v53 = ControlEntryKey.description.getter();
      *((void *)&v53 + 1) = v33;
      sub_1DA98C148();
      sub_1DA97F290(qword_1EBE62D08, MEMORY[0x1E4F276F0]);
      uint64_t v34 = v52;
      sub_1DA98CDD8();
      sub_1DA98C148();
      swift_bridgeObjectRelease();
      uint64_t v44 = *((void *)&v53 + 1);
      uint64_t v45 = v53;
      ((void (**)(char *, char *, uint64_t))v51)[2](v14, v19, v34);
      uint64_t v35 = v48;
      uint64_t v36 = v49;
      uint64_t v37 = (uint64_t)v50;
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v50, v11, v49);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v35 + 56))(v37, 0, 1, v36);
      v38 = *(void (**)(char *, uint64_t))(v35 + 8);
      id v39 = *(id *)(v3 + 16);
      v38(v11, v36);
      uint64_t v40 = v52;
      v46(v19, v52);
      unint64_t v54 = sub_1DA7F1A00();
      v55 = &off_1F34D9A48;
      *(void *)&long long v53 = v39;
      type metadata accessor for DataProtectedArchiveFilePromise(0);
      v23 = (void *)swift_allocObject();
      v41 = (char *)v23 + OBJC_IVAR____TtC9ChronoKit31DataProtectedArchiveFilePromise_intermediates;
      uint64_t v42 = type metadata accessor for DataProtectedArchiveFilePromise.Intermediates(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56))(v41, 1, 1, v42);
      uint64_t v43 = v44;
      v23[2] = v45;
      v23[3] = v43;
      ((void (**)(char *, char *, uint64_t))v51)[4]((char *)v23 + OBJC_IVAR____TtC9ChronoKit31DataProtectedArchiveFilePromise_destination, v14, v40);
      sub_1DA7A19A4(&v53, (uint64_t)(v23 + 4));
      sub_1DA7F1A40((uint64_t)v50, (uint64_t)v23 + OBJC_IVAR____TtC9ChronoKit31DataProtectedArchiveFilePromise_protectionLevel);
    }
    else
    {
      v23 = v32;
      sub_1DA9892D8();

      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v11, v49);
      v46(v19, v52);
    }
  }
  return v23;
}

uint64_t ControlsCacheManager.__allocating_init(identifier:cacheKeyProvider:cacheURLProvider:protectionLevelProvider:fileManager:forReading:)(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, char a7)
{
  uint64_t v15 = *(void *)(a4 + 24);
  uint64_t v14 = *(void *)(a4 + 32);
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1(a4, v15);
  double v17 = MEMORY[0x1F4188790](v16);
  v19 = (char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v20 + 16))(v19, v17);
  uint64_t v21 = sub_1DA97F3C0(a1, a2, a3, (uint64_t)v19, a5, a6, a7, v23[1], v15, v14);
  __swift_destroy_boxed_opaque_existential_1(a4);
  return v21;
}

uint64_t type metadata accessor for ControlsCacheManager(uint64_t a1)
{
  return sub_1DA7A88D4(a1, (uint64_t *)&unk_1EBE668E0);
}

uint64_t ControlsCacheManager.init(identifier:cacheKeyProvider:cacheURLProvider:protectionLevelProvider:fileManager:forReading:)(uint64_t a1, uint64_t a2, long long *a3, long long *a4, long long *a5, uint64_t a6, char a7)
{
  *(unsigned char *)(v7 + 160) = a7 ^ 1;
  *(void *)(v7 + 24) = a1;
  *(void *)(v7 + 32) = a2;
  sub_1DA7A19A4(a3, v7 + 40);
  sub_1DA7A19A4(a4, v7 + 80);
  sub_1DA7A19A4(a5, v7 + 120);
  *(void *)(v7 + 16) = a6;
  return v7;
}

uint64_t type metadata accessor for ControlsCacheManager.CacheManagementError(uint64_t a1)
{
  return sub_1DA7A88D4(a1, (uint64_t *)&unk_1EA8E6BA8);
}

uint64_t sub_1DA97F274@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DA97E780(*(void *)(v1 + 24), a1);
}

uint64_t sub_1DA97F290(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t ControlsCacheManager.deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  return v0;
}

uint64_t ControlsCacheManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);

  return swift_deallocClassInstance();
}

uint64_t sub_1DA97F370@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  v5[3] = a1;
  uint64_t result = sub_1DA7F0690(a1, (void (*)(uint64_t *__return_ptr, uint64_t, char *))sub_1DA980060, (uint64_t)v5);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_1DA97F3C0(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v21 = a9;
  uint64_t v22 = a10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a9 - 8) + 32))(boxed_opaque_existential_1, a4, a9);
  type metadata accessor for ControlsCacheManager(0);
  uint64_t v18 = swift_allocObject();
  *(unsigned char *)(v18 + 160) = a7 ^ 1;
  *(void *)(v18 + 24) = a1;
  *(void *)(v18 + 32) = a2;
  sub_1DA7A19A4(a3, v18 + 40);
  sub_1DA7A19A4(&v20, v18 + 80);
  sub_1DA7A19A4(a5, v18 + 120);
  *(void *)(v18 + 16) = a6;
  return v18;
}

uint64_t sub_1DA97F4A8(uint64_t a1)
{
  uint64_t result = sub_1DA97F290(&qword_1EBE5A9C0, (void (*)(uint64_t))type metadata accessor for ControlsCacheManager);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1DA97F500()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for ControlsCacheManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ControlsCacheManager);
}

uint64_t dispatch thunk of ControlsCacheManager.urls(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 432))();
}

char *sub_1DA97F590(char *a1, char **a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *(void *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      char v11 = *a2;
      *(void *)a1 = *a2;
      uint64_t v12 = *(int *)(type metadata accessor for ControlEntryKey() + 20);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = (char *)a2 + v12;
      uint64_t v15 = v11;
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B90);
      uint64_t v17 = *(void *)(v16 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, v16))
      {
        uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66BC0);
        memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v13, v14, v16);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
      }
      goto LABEL_10;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v8 = *a2;
      *(void *)a1 = *a2;
      uint64_t v9 = v8;
LABEL_10:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

void sub_1DA97F768(id *a1)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {

    v4 = (char *)a1 + *(int *)(type metadata accessor for ControlEntryKey() + 20);
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B90);
    uint64_t v7 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v5))
    {
      uint64_t v6 = *(void (**)(char *, uint64_t))(v7 + 8);
      v6(v4, v5);
    }
  }
  else if (!EnumCaseMultiPayload)
  {
    id v3 = *a1;
  }
}

void **sub_1DA97F874(void **a1, void **a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    uint64_t v10 = *(int *)(type metadata accessor for ControlEntryKey() + 20);
    char v11 = (char *)a1 + v10;
    uint64_t v12 = (char *)a2 + v10;
    id v13 = v9;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B90);
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66BC0);
      memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v12, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
    }
    goto LABEL_8;
  }
  if (!EnumCaseMultiPayload)
  {
    uint64_t v7 = *a2;
    *a1 = *a2;
    id v8 = v7;
LABEL_8:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void **sub_1DA97FA08(void **a1, void **a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1DA97FBC0((uint64_t)a1, type metadata accessor for ControlsCacheManager.CacheManagementError);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = *a2;
      *a1 = *a2;
      uint64_t v10 = *(int *)(type metadata accessor for ControlEntryKey() + 20);
      char v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      id v13 = v9;
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B90);
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14))
      {
        uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66BC0);
        memcpy(v11, v12, *(void *)(*(void *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v11, v12, v14);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
      }
      goto LABEL_9;
    }
    if (!EnumCaseMultiPayload)
    {
      uint64_t v7 = *a2;
      *a1 = *a2;
      id v8 = v7;
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1DA97FBC0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1DA97FC20(void *a1, void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    uint64_t v6 = *(int *)(type metadata accessor for ControlEntryKey() + 20);
    uint64_t v7 = (char *)a1 + v6;
    id v8 = (char *)a2 + v6;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B90);
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66BC0);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_1DA97FD90(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1DA97FBC0((uint64_t)a1, type metadata accessor for ControlsCacheManager.CacheManagementError);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      uint64_t v6 = *(int *)(type metadata accessor for ControlEntryKey() + 20);
      uint64_t v7 = (char *)a1 + v6;
      id v8 = (char *)a2 + v6;
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B90);
      uint64_t v10 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      {
        uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66BC0);
        memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DA97FF24()
{
  uint64_t result = type metadata accessor for ControlEntryKey();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_1DA97FFBC()
{
  return sub_1DA97F290(&qword_1EA8E6BA0, (void (*)(uint64_t))type metadata accessor for ControlsCacheManager.CacheManagementError);
}

unint64_t sub_1DA980004()
{
  unint64_t result = qword_1EBE67038;
  if (!qword_1EBE67038)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBE67040);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBE67038);
  }
  return result;
}

uint64_t sub_1DA980060@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DA97F274(a1);
}

uint64_t sub_1DA980078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  swift_beginAccess();
  uint64_t v4 = sub_1DA98B9E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1DA9800FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA809D14(&OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType, a1);
}

uint64_t sub_1DA980108(uint64_t a1)
{
  return sub_1DA98109C(a1, &OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType);
}

uint64_t (*sub_1DA980114())()
{
  return j__swift_endAccess;
}

uint64_t FixedDataProtectionProvider.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  uint64_t v4 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t FixedDataProtectionProvider.init(_:)(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  uint64_t v4 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t sub_1DA98026C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  swift_beginAccess();
  uint64_t v4 = sub_1DA98B9E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t FixedDataProtectionProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  uint64_t v2 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t FixedDataProtectionProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  uint64_t v2 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1DA980404@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  swift_beginAccess();
  uint64_t v4 = sub_1DA98B9E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1DA98048C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType;
  swift_beginAccess();
  uint64_t v4 = sub_1DA98B9E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1DA980524@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA809D14(&OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel, a1);
}

uint64_t sub_1DA980530(uint64_t a1)
{
  return sub_1DA98109C(a1, &OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel);
}

uint64_t (*sub_1DA98053C())()
{
  return j_j__swift_endAccess;
}

uint64_t ClientDataProtectionLevelProvider.__allocating_init(defaultLevel:extensionProvider:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1DA7BA440(a2, v4 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_extensionProvider, &qword_1EBE66950);
  uint64_t v5 = v4 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel;
  uint64_t v6 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a1, v6);
  return v4;
}

uint64_t ClientDataProtectionLevelProvider.init(defaultLevel:extensionProvider:)(uint64_t a1, uint64_t a2)
{
  sub_1DA7BA440(a2, v2 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_extensionProvider, &qword_1EBE66950);
  uint64_t v4 = v2 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel;
  uint64_t v5 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a1, v5);
  return v2;
}

uint64_t sub_1DA9806D4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v8 = sub_1DA98B9E8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v45 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66AF0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v44 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v43 - v14;
  sub_1DA980D9C(v2 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_extensionProvider, (uint64_t)v48);
  uint64_t v16 = v49;
  if (v49)
  {
    uint64_t v46 = v2;
    uint64_t v17 = a2;
    uint64_t v18 = v50;
    __swift_project_boxed_opaque_existential_0(v48, v49);
    uint64_t v19 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v18 + 8))(a1, v16, v18);
    if (v3)
    {

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
      uint64_t v4 = 0;
LABEL_4:
      a2 = v17;
      uint64_t v5 = v46;
      goto LABEL_6;
    }
    unsigned __int8 v31 = (void *)v19;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
    if (!v31) {
      goto LABEL_4;
    }
    objc_msgSend(v31, sel_dataProtectionLevel);
    sub_1DA98BA08();

    a2 = v17;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v15, 1, v8) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v17, v15, v8);
    }
    sub_1DA7A1AE0((uint64_t)v15, &qword_1EBE66AF0);
    uint64_t v5 = v46;
  }
  else
  {
    sub_1DA7A1AE0((uint64_t)v48, &qword_1EBE66950);
  }
LABEL_6:
  if (objc_msgSend(a1, sel_isRemote))
  {
    uint64_t v20 = v5 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel;
    swift_beginAccess();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a2, v20, v8);
  }
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66CF0);
  sub_1DA9899C8();
  swift_endAccess();
  id v22 = objc_allocWithZone(MEMORY[0x1E4F223A0]);
  id v23 = sub_1DA865E90();
  if (!v4)
  {
    uint64_t v33 = v23;
    if (!v23) {
      goto LABEL_10;
    }
    uint64_t v46 = v5;
    uint64_t v34 = a2;
    id v35 = objc_msgSend(v23, sel_entitlements);
    uint64_t v36 = (void *)sub_1DA98C008();
    sub_1DA981800();
    id v37 = objc_msgSend(v35, sel_objectForKey_ofClass_, v36, swift_getObjCClassFromMetadata());

    if (v37)
    {
      sub_1DA98C8C8();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v47, 0, sizeof(v47));
    }
    uint64_t v39 = (uint64_t)v44;
    v38 = v45;
    sub_1DA7BA440((uint64_t)v47, (uint64_t)v48, &qword_1EBE66B48);
    if (v49)
    {
      type metadata accessor for FileProtectionType(0);
      if ((swift_dynamicCast() & 1) != 0 && v51)
      {
        id v40 = v51;
        sub_1DA98B9F8();

        goto LABEL_30;
      }
    }
    else
    {
      sub_1DA7A1AE0((uint64_t)v48, &qword_1EBE66B48);
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v39, 1, 1, v8);
LABEL_30:

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v39, 1, v8) == 1)
    {
      uint64_t v41 = v46 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v38, v41, v8);
      sub_1DA7A1AE0(v39, &qword_1EBE66AF0);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v34, v38, v8);
    }
    else
    {
      uint64_t v42 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 32);
      v42(v38, v39, v8);
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v42)(v34, v38, v8);
    }
  }

LABEL_10:
  if (qword_1EBE58FE8 != -1) {
    swift_once();
  }
  uint64_t v24 = sub_1DA989F38();
  __swift_project_value_buffer(v24, (uint64_t)qword_1EBE6F090);
  id v25 = a1;
  v26 = sub_1DA989F18();
  os_log_type_t v27 = sub_1DA98C528();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    id v29 = (void *)swift_slowAlloc();
    *(_DWORD *)v28 = 138543362;
    v48[0] = v25;
    v30 = v25;
    sub_1DA98C858();
    *id v29 = v25;

    _os_log_impl(&dword_1DA795000, v26, v27, "Extension not found for %{public}@", v28, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE63260);
    swift_arrayDestroy();
    MEMORY[0x1E0178DA0](v29, -1, -1);
    MEMORY[0x1E0178DA0](v28, -1, -1);
  }
  else
  {

    v26 = v25;
  }

  sub_1DA93B894();
  swift_allocError();
  void *v32 = 6;
  return swift_willThrow();
}

uint64_t sub_1DA980D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66950);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ClientDataProtectionLevelProvider.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel;
  uint64_t v2 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_1DA7A1AE0(v0 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_extensionProvider, &qword_1EBE66950);
  return v0;
}

uint64_t ClientDataProtectionLevelProvider.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel;
  uint64_t v2 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_1DA7A1AE0(v0 + OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_extensionProvider, &qword_1EBE66950);

  return swift_deallocClassInstance();
}

uint64_t sub_1DA980F38@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA80B184(&OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel, a1);
}

uint64_t sub_1DA980F44@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DA9806D4(a1, a2);
}

uint64_t sub_1DA980F68(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = sub_1DA98B9E8();
  uint64_t v9 = *(void *)(v8 - 8);
  double v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v9 + 16))(v12, a1, v8, v10);
  uint64_t v13 = *a2 + *a5;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v13, v12, v8);
  return swift_endAccess();
}

uint64_t sub_1DA981084@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA809D14(&OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel, a1);
}

uint64_t sub_1DA981090(uint64_t a1)
{
  return sub_1DA98109C(a1, &OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel);
}

uint64_t sub_1DA98109C(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  uint64_t v5 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(v4, a1, v5);
  return swift_endAccess();
}

uint64_t (*sub_1DA981124())()
{
  return j_j__swift_endAccess;
}

uint64_t ExtensionDataProtectionLevelProvider.__allocating_init(extensionManager:default:)(long long *a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  sub_1DA7A19A4(a1, v4 + 16);
  uint64_t v5 = v4 + OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel;
  uint64_t v6 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(v5, a2, v6);
  return v4;
}

uint64_t ExtensionDataProtectionLevelProvider.init(extensionManager:default:)(long long *a1, uint64_t a2)
{
  sub_1DA7A19A4(a1, v2 + 16);
  uint64_t v4 = v2 + OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel;
  uint64_t v5 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(v4, a2, v5);
  return v2;
}

uint64_t sub_1DA981294@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66AF0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_1DA7A1A44(v2 + 16, (uint64_t)v29);
  uint64_t v9 = v30;
  uint64_t v10 = v31;
  __swift_project_boxed_opaque_existential_0(v29, v30);
  ExtensionManaging.extension(for:)((uint64_t)a1, v9, v10);
  if (v28)
  {
    sub_1DA7A19A4(&v27, (uint64_t)v32);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    uint64_t v11 = v33;
    uint64_t v12 = v34;
    __swift_project_boxed_opaque_existential_0(v32, v33);
    (*(void (**)(uint64_t, uint64_t))(v12 + 112))(v11, v12);
    uint64_t v13 = sub_1DA98B9E8();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) == 1)
    {
      sub_1DA7A1AE0((uint64_t)v8, &qword_1EBE66AF0);
      uint64_t v15 = v3 + OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel;
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(a2, v15, v13);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(a2, v8, v13);
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    sub_1DA7A1AE0((uint64_t)&v27, &qword_1EBE58E50);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    if (objc_msgSend(a1, sel_isRemote))
    {
      uint64_t v16 = v3 + OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel;
      swift_beginAccess();
      uint64_t v17 = sub_1DA98B9E8();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16))(a2, v16, v17);
    }
    else
    {
      if (qword_1EBE58FE8 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_1DA989F38();
      __swift_project_value_buffer(v19, (uint64_t)qword_1EBE6F090);
      uint64_t v20 = a1;
      uint64_t v21 = sub_1DA989F18();
      os_log_type_t v22 = sub_1DA98C528();
      if (os_log_type_enabled(v21, v22))
      {
        id v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = (void *)swift_slowAlloc();
        *(_DWORD *)id v23 = 138543362;
        v32[0] = v20;
        id v25 = v20;
        sub_1DA98C858();
        *uint64_t v24 = v20;

        _os_log_impl(&dword_1DA795000, v21, v22, "Extension not found for %{public}@", v23, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE63260);
        swift_arrayDestroy();
        MEMORY[0x1E0178DA0](v24, -1, -1);
        MEMORY[0x1E0178DA0](v23, -1, -1);
      }
      else
      {

        uint64_t v21 = v20;
      }

      sub_1DA93B894();
      swift_allocError();
      void *v26 = 6;
      return swift_willThrow();
    }
  }
}

uint64_t ExtensionDataProtectionLevelProvider.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel;
  uint64_t v2 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ExtensionDataProtectionLevelProvider.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel;
  uint64_t v2 = sub_1DA98B9E8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1DA9817D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA80B184(&OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel, a1);
}

uint64_t sub_1DA9817DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DA981294(a1, a2);
}

unint64_t sub_1DA981800()
{
  unint64_t result = qword_1EBE66B38;
  if (!qword_1EBE66B38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EBE66B38);
  }
  return result;
}

uint64_t sub_1DA981840@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DA809ADC(a1, &OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType, a2);
}

uint64_t sub_1DA981860(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1DA980F68(a1, a2, a3, a4, &OBJC_IVAR____TtC9ChronoKit27FixedDataProtectionProvider_protectionType);
}

uint64_t sub_1DA981880@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DA809ADC(a1, &OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel, a2);
}

uint64_t sub_1DA9818A0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1DA980F68(a1, a2, a3, a4, &OBJC_IVAR____TtC9ChronoKit33ClientDataProtectionLevelProvider_defaultLevel);
}

uint64_t sub_1DA9818C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + 16;
  swift_beginAccess();
  return sub_1DA7A1A44(v3, a2);
}

uint64_t sub_1DA981914@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DA809ADC(a1, &OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel, a2);
}

uint64_t sub_1DA981934(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_1DA980F68(a1, a2, a3, a4, &OBJC_IVAR____TtC9ChronoKit36ExtensionDataProtectionLevelProvider_defaultLevel);
}

uint64_t dispatch thunk of DataProtectionLevelProviding.defaultLevel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of DataProtectionLevelProviding.protectionType(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t sub_1DA981990()
{
  return type metadata accessor for FixedDataProtectionProvider(0);
}

uint64_t type metadata accessor for FixedDataProtectionProvider(uint64_t a1)
{
  return sub_1DA7A88D4(a1, (uint64_t *)&unk_1EBE63380);
}

uint64_t sub_1DA9819B8()
{
  uint64_t result = sub_1DA98B9E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for FixedDataProtectionProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for FixedDataProtectionProvider);
}

uint64_t dispatch thunk of FixedDataProtectionProvider.defaultLevel.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 88))();
}

uint64_t dispatch thunk of FixedDataProtectionProvider.protectionType.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of FixedDataProtectionProvider.protectionType.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of FixedDataProtectionProvider.protectionType.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of FixedDataProtectionProvider.__allocating_init(_:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FixedDataProtectionProvider.protectionType(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1DA981B3C()
{
  return type metadata accessor for ClientDataProtectionLevelProvider(0);
}

uint64_t type metadata accessor for ClientDataProtectionLevelProvider(uint64_t a1)
{
  return sub_1DA7A88D4(a1, (uint64_t *)&unk_1EBE66960);
}

uint64_t sub_1DA981B64()
{
  uint64_t result = sub_1DA98B9E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ClientDataProtectionLevelProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ClientDataProtectionLevelProvider);
}

uint64_t dispatch thunk of ClientDataProtectionLevelProvider.defaultLevel.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ClientDataProtectionLevelProvider.defaultLevel.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ClientDataProtectionLevelProvider.defaultLevel.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ClientDataProtectionLevelProvider.__allocating_init(defaultLevel:extensionProvider:)()
{
  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ClientDataProtectionLevelProvider.protectionType(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_1DA981CCC()
{
  return type metadata accessor for ExtensionDataProtectionLevelProvider(0);
}

uint64_t type metadata accessor for ExtensionDataProtectionLevelProvider(uint64_t a1)
{
  return sub_1DA7A88D4(a1, (uint64_t *)&unk_1EBE59FC0);
}

uint64_t sub_1DA981CF4()
{
  uint64_t result = sub_1DA98B9E8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ExtensionDataProtectionLevelProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for ExtensionDataProtectionLevelProvider);
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.extensionManager.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 96))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.extensionManager.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.extensionManager.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.defaultLevel.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.defaultLevel.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.defaultLevel.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.__allocating_init(extensionManager:default:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ExtensionDataProtectionLevelProvider.protectionType(for:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t DuetWidgetViewIdentity.init(configuration:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = a1;
  uint64_t v4 = sub_1DA800D64(v3);
  uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  id v7 = objc_msgSend(v3, sel_uniqueIdentifier);
  sub_1DA98C038();

  sub_1DA7DF7A0();
  uint64_t v10 = sub_1DA98C8A8();
  uint64_t v11 = v8;
  sub_1DA98C148();
  swift_bridgeObjectRetain();
  sub_1DA98C148();

  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease_n();
  *a2 = v4;
  a2[1] = v6;
  a2[2] = (uint64_t)v3;
  a2[3] = v10;
  a2[4] = v11;
  return result;
}

uint64_t static DuetWidgetViewIdentity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
    return 1;
  }
  else {
    return sub_1DA98CE58();
  }
}

uint64_t DuetWidgetViewIdentity.budgetIdentity.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

id DuetWidgetViewIdentity.configuration.getter()
{
  return *(id *)(v0 + 16);
}

uint64_t DuetWidgetViewIdentity.identifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static DuetWidgetViewIdentity.identifierString(from:uniqueViewID:)()
{
  sub_1DA7DF7A0();
  uint64_t v1 = sub_1DA98C8A8();
  sub_1DA98C148();
  swift_bridgeObjectRetain();
  sub_1DA98C148();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t DuetWidgetViewIdentity.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_1DA98C108();

  return swift_bridgeObjectRelease();
}

uint64_t DuetWidgetViewIdentity.hashValue.getter()
{
  return sub_1DA98CF68();
}

uint64_t sub_1DA9821E8()
{
  return sub_1DA98CF68();
}

uint64_t sub_1DA982244()
{
  swift_bridgeObjectRetain();
  sub_1DA98C108();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1DA98229C()
{
  return sub_1DA98CF68();
}

uint64_t sub_1DA9822F4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) == *(void *)(a2 + 24) && *(void *)(a1 + 32) == *(void *)(a2 + 32)) {
    return 1;
  }
  else {
    return sub_1DA98CE58();
  }
}

unint64_t sub_1DA982328()
{
  unint64_t result = qword_1EA8E6BB8;
  if (!qword_1EA8E6BB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8E6BB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DuetWidgetViewIdentity()
{
  return &type metadata for DuetWidgetViewIdentity;
}

void sub_1DA98238C(int a1, int a2)
{
  int v57 = a1;
  LODWORD(v58) = a2;
  uint64_t v3 = sub_1DA98AAD8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DA98AB88();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  unint64_t v54 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)v52 - v11;
  uint64_t v13 = sub_1DA98AB68();
  uint64_t v55 = *(void *)(v13 - 8);
  uint64_t v56 = v13;
  MEMORY[0x1F4188790](v13);
  long long v53 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)v52 - v16;
  uint64_t v18 = self;
  if (objc_msgSend(v18, sel_isSupported))
  {
    uint64_t v19 = type metadata accessor for SecureHostingController();
    sub_1DA98725C(&qword_1EBE63CB8, (void (*)(uint64_t))type metadata accessor for SecureHostingController);
    v52[2] = v2;
    v52[1] = v19;
    sub_1DA98A968();
    sub_1DA98AB78();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) == *MEMORY[0x1E4F3DA98])
    {
      (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
      uint64_t v20 = swift_projectBox();
      uint64_t v22 = v55;
      uint64_t v21 = v56;
      (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v17, v20, v56);
      swift_release();
      int v23 = sub_1DA98AB18();
      int v24 = sub_1DA98AB38();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v21);
      char v25 = v57;
      char v26 = (char)v58;
      if ((v23 ^ v57) & 1) != 0 || ((v24 ^ v58)) {
        goto LABEL_12;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      char v25 = v57;
      char v26 = (char)v58;
      if (v57 & 1) != 0 || (v58)
      {
LABEL_12:
        uint64_t v30 = v53;
        sub_1DA98AB58();
        sub_1DA98AB28();
        sub_1DA98AB48();
        if (qword_1EBE62C50 != -1) {
          swift_once();
        }
        uint64_t v31 = sub_1DA989F38();
        __swift_project_value_buffer(v31, (uint64_t)qword_1EBE6F300);
        v32 = sub_1DA989F18();
        os_log_type_t v33 = sub_1DA98C518();
        if (os_log_type_enabled(v32, v33))
        {
          uint64_t v34 = swift_slowAlloc();
          *(_DWORD *)uint64_t v34 = 67109376;
          LODWORD(aBlock[0]) = v25 & 1;
          sub_1DA98C858();
          *(_WORD *)(v34 + 8) = 1024;
          LODWORD(aBlock[0]) = v26 & 1;
          sub_1DA98C858();
          _os_log_impl(&dword_1DA795000, v32, v33, "RenderBox hosting configured - async? %{BOOL}d, opaque: %{BOOL}d", (uint8_t *)v34, 0xEu);
          MEMORY[0x1E0178DA0](v34, -1, -1);
        }

        objc_msgSend(v18, sel_setAllowsRenderingInBackground_, 1);
        v61 = &type metadata for FeatureFlags.SpringBoard;
        v62 = (uint64_t (*)(void, void, void, void))sub_1DA8001A4();
        LOBYTE(aBlock[0]) = 0;
        char v35 = sub_1DA989888();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
        id v36 = objc_msgSend(self, sel_standardUserDefaults);
        id v37 = (void *)sub_1DA98C008();
        id v38 = objc_msgSend(v36, sel_objectForKey_, v37);

        if (v38)
        {
          sub_1DA98C8C8();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v64, 0, 32);
        }
        sub_1DA7C6354((uint64_t)v64, (uint64_t)aBlock);
        if (v61)
        {
          sub_1DA8E38F8();
          if (swift_dynamicCast())
          {
            id v40 = v59;
            objc_msgSend(v59, sel_intValue);

LABEL_27:
            LOBYTE(aBlock[0]) = 0;
            sub_1DA98AB08();
LABEL_28:
            sub_1DA98AAE8();
            sub_1DA98A978();
            uint64_t v41 = (void (*)(void *, void))sub_1DA98A958();
            sub_1DA98AAF8();
            v41(aBlock, 0);
            if (sub_1DA98A948())
            {
              self;
              uint64_t v42 = (void *)swift_dynamicCastObjCClass();
              if (v42)
              {
                uint64_t v43 = v42;
                objc_msgSend(v42, sel_setNeedsSynchronousUpdate_, 1);
                objc_msgSend(v43, sel_setNeedsDisplay);
                id v44 = objc_msgSend(v43, sel_statisticsHandler);
                if (v44)
                {
                  _Block_release(v44);
                  (*(void (**)(char *, uint64_t))(v55 + 8))(v30, v56);
                  swift_unknownObjectRelease();
                  return;
                }
                uint64_t v48 = sub_1DA989F18();
                os_log_type_t v49 = sub_1DA98C518();
                if (os_log_type_enabled(v48, v49))
                {
                  uint64_t v50 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)uint64_t v50 = 0;
                  _os_log_impl(&dword_1DA795000, v48, v49, "Attaching layer statistics handler", v50, 2u);
                  MEMORY[0x1E0178DA0](v50, -1, -1);
                }

                objc_msgSend(v43, sel_resetStatistics_alpha_, 11, 0.0);
                v62 = CGSizeMake;
                uint64_t v63 = 0;
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 1107296256;
                aBlock[2] = sub_1DA7FDA68;
                v61 = (ValueMetadata *)&block_descriptor_20;
                id v51 = _Block_copy(aBlock);
                objc_msgSend(v43, sel_setStatisticsHandler_, v51);
                _Block_release(v51);
                swift_unknownObjectRelease();
                goto LABEL_36;
              }
              swift_unknownObjectRelease();
            }
            uint64_t v45 = sub_1DA989F18();
            os_log_type_t v46 = sub_1DA98C548();
            if (os_log_type_enabled(v45, v46))
            {
              id v47 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v47 = 0;
              _os_log_impl(&dword_1DA795000, v45, v46, "RenderBox unable to attach layer statistics", v47, 2u);
              MEMORY[0x1E0178DA0](v47, -1, -1);
            }

LABEL_36:
            (*(void (**)(char *, uint64_t))(v55 + 8))(v30, v56);
            return;
          }
        }
        else
        {
          sub_1DA7A1AE0((uint64_t)aBlock, &qword_1EBE66B48);
        }
        if ((v35 & 1) == 0) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (qword_1EBE62C50 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1DA989F38();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EBE6F300);
    v58 = sub_1DA989F18();
    os_log_type_t v28 = sub_1DA98C548();
    if (os_log_type_enabled(v58, v28))
    {
      id v29 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v29 = 67240192;
      LODWORD(aBlock[0]) = 0;
      sub_1DA98C858();
      _os_log_impl(&dword_1DA795000, v58, v28, "RenderBox hosting disabled (isSupported=%{BOOL,public}d)", v29, 8u);
      MEMORY[0x1E0178DA0](v29, -1, -1);
    }
    else
    {
      uint64_t v39 = v58;
    }
  }
}

uint64_t sub_1DA982D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v87 = a2;
  uint64_t v70 = sub_1DA98A3F8();
  uint64_t v73 = *(void *)(v70 - 8);
  MEMORY[0x1F4188790](v70);
  uint64_t v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DA98A388();
  uint64_t v71 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v8 = (char *)&v67 - v7;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBE64F20);
  uint64_t v91 = v6;
  uint64_t v9 = sub_1DA98A388();
  uint64_t v74 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v72 = (char *)&v67 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBE637C8);
  uint64_t v90 = v9;
  uint64_t v11 = sub_1DA98A388();
  uint64_t v76 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  v75 = (char *)&v67 - v12;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EBE61D70);
  uint64_t v89 = v11;
  uint64_t v13 = sub_1DA98A388();
  uint64_t v80 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  v78 = (char *)&v67 - v14;
  uint64_t v86 = v15;
  uint64_t v16 = sub_1DA98A388();
  uint64_t v82 = *(void *)(v16 - 8);
  MEMORY[0x1F4188790](v16);
  v77 = (char *)&v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  v79 = (char *)&v67 - v19;
  uint64_t v81 = v20;
  uint64_t v21 = sub_1DA98C838();
  uint64_t v84 = *(void *)(v21 - 8);
  uint64_t v85 = v21;
  MEMORY[0x1F4188790](v21);
  int v23 = (char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  v88 = (char *)&v67 - v25;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_1DA98A0C8();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v26 = MEMORY[0x1E4F3DB58];
  if (v123)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56))(v23, 1, 1, v81);
    uint64_t v83 = *(void *)(a1 + 24);
    uint64_t v100 = v83;
    uint64_t v101 = v26;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v28 = sub_1DA7A0410(&qword_1EBE64F18, &qword_1EBE64F20);
    uint64_t v98 = WitnessTable;
    uint64_t v99 = v28;
    uint64_t v29 = swift_getWitnessTable();
    uint64_t v30 = sub_1DA7A0410(&qword_1EBE637C0, &qword_1EBE637C8);
    uint64_t v96 = v29;
    uint64_t v97 = v30;
    uint64_t v31 = swift_getWitnessTable();
    uint64_t v32 = sub_1DA7A0410(&qword_1EBE61D68, &qword_1EBE61D70);
    uint64_t v94 = v31;
    uint64_t v95 = v32;
    uint64_t v92 = swift_getWitnessTable();
    uint64_t v93 = v32;
    swift_getWitnessTable();
  }
  else
  {
    uint64_t v68 = v2;
    v69 = v23;
    sub_1DA98ADA8();
    uint64_t v33 = *(void *)(a1 + 24);
    sub_1DA98B0F8();
    swift_getKeyPath();
    v123 = (void *)MEMORY[0x1E4FBC860];
    sub_1DA98725C((unint64_t *)&qword_1EBE62DE8, MEMORY[0x1E4F3CD58]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE630C8);
    sub_1DA7A0410(&qword_1EBE630D0, &qword_1EBE630C8);
    uint64_t v34 = v70;
    sub_1DA98C918();
    uint64_t v83 = v33;
    uint64_t v121 = v33;
    uint64_t v122 = v26;
    uint64_t v67 = MEMORY[0x1E4F3CC28];
    uint64_t v35 = v91;
    uint64_t v36 = swift_getWitnessTable();
    id v37 = v72;
    sub_1DA98B018();
    swift_release();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v5, v34);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v8, v35);
    swift_getKeyPath();
    v123 = *(void **)(*(void *)(v68 + 8) + 16);
    id v38 = v123;
    uint64_t v73 = MEMORY[0x1E4F3DF28];
    uint64_t v39 = sub_1DA7A0410(&qword_1EBE64F18, &qword_1EBE64F20);
    uint64_t v119 = v36;
    uint64_t v120 = v39;
    id v40 = v38;
    uint64_t v41 = v90;
    uint64_t v42 = swift_getWitnessTable();
    uint64_t v43 = v75;
    sub_1DA98B018();

    swift_release();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v37, v41);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1DA98A0C8();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v44 = sub_1DA7A0410(&qword_1EBE637C0, &qword_1EBE637C8);
    uint64_t v117 = v42;
    uint64_t v118 = v44;
    uint64_t v45 = v89;
    uint64_t v46 = swift_getWitnessTable();
    id v47 = v78;
    sub_1DA98B018();
    swift_release();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v43, v45);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1DA98A0C8();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v48 = sub_1DA7A0410(&qword_1EBE61D68, &qword_1EBE61D70);
    uint64_t v115 = v46;
    uint64_t v116 = v48;
    uint64_t v49 = v86;
    uint64_t v50 = swift_getWitnessTable();
    id v51 = v77;
    sub_1DA98B018();
    swift_release();
    (*(void (**)(char *, uint64_t))(v80 + 8))(v47, v49);
    uint64_t v113 = v50;
    uint64_t v114 = v48;
    uint64_t v52 = v81;
    swift_getWitnessTable();
    long long v53 = v79;
    sub_1DA875B4C(v51);
    uint64_t v54 = v82;
    uint64_t v55 = *(void (**)(char *, uint64_t))(v82 + 8);
    v55(v51, v52);
    int v23 = v69;
    sub_1DA875B4C(v53);
    v55(v53, v52);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v54 + 56))(v23, 0, 1, v52);
  }
  uint64_t v56 = v84;
  uint64_t v57 = v85;
  (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v88, v23, v85);
  v58 = *(void (**)(char *, uint64_t))(v56 + 8);
  v58(v23, v57);
  uint64_t v111 = v83;
  uint64_t v112 = MEMORY[0x1E4F3DB58];
  uint64_t v59 = swift_getWitnessTable();
  uint64_t v60 = sub_1DA7A0410(&qword_1EBE64F18, &qword_1EBE64F20);
  uint64_t v109 = v59;
  uint64_t v110 = v60;
  uint64_t v61 = swift_getWitnessTable();
  uint64_t v62 = sub_1DA7A0410(&qword_1EBE637C0, &qword_1EBE637C8);
  uint64_t v107 = v61;
  uint64_t v108 = v62;
  uint64_t v63 = swift_getWitnessTable();
  uint64_t v64 = sub_1DA7A0410(&qword_1EBE61D68, &qword_1EBE61D70);
  uint64_t v105 = v63;
  uint64_t v106 = v64;
  uint64_t v103 = swift_getWitnessTable();
  uint64_t v104 = v64;
  uint64_t v102 = swift_getWitnessTable();
  swift_getWitnessTable();
  v65 = v88;
  sub_1DA875B4C(v88);
  return ((uint64_t (*)(char *, uint64_t))v58)(v65, v57);
}

uint64_t sub_1DA983950(uint64_t a1)
{
  uint64_t v2 = sub_1DA98A3F8();
  double v3 = MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return sub_1DA98A508();
}

uint64_t sub_1DA983A18@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  type metadata accessor for _RootContentViewModel();
  sub_1DA98725C(&qword_1EBE63C70, (void (*)(uint64_t))type metadata accessor for _RootContentViewModel);
  *a3 = sub_1DA98A318();
  a3[1] = v6;
  uint64_t v7 = (char *)a3 + *(int *)(type metadata accessor for _RootContentView() + 36);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 32);

  return v8(v7, a1, a2);
}

uint64_t sub_1DA983B00()
{
  return sub_1DA983B3C();
}

uint64_t sub_1DA983B14()
{
  return sub_1DA983B3C();
}

uint64_t sub_1DA983B28()
{
  return sub_1DA983B3C();
}

uint64_t sub_1DA983B3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DA98A0C8();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DA983BAC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9ChronoKitP33_992D30927223C086533C8ABE6E41643C21_RootContentViewModel__isHidden;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61D28);
  double v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC9ChronoKitP33_992D30927223C086533C8ABE6E41643C21_RootContentViewModel__isSnapshotting, v2);
  v3(v0 + OBJC_IVAR____TtC9ChronoKitP33_992D30927223C086533C8ABE6E41643C21_RootContentViewModel__animationsPaused, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1DA983CAC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for _RootContentViewModel();
  uint64_t result = sub_1DA989FD8();
  *a1 = result;
  return result;
}

id LiveWidgetContentViewController.widget.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_widget);
}

id LiveWidgetContentViewController.metrics.getter()
{
  return *(id *)(v0 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_metrics);
}

uint64_t LiveWidgetContentViewController.viewModel.getter()
{
  return swift_retain();
}

uint64_t sub_1DA983D1C()
{
  return sub_1DA984424();
}

void sub_1DA983D30(char a1)
{
  v1[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting] = a1;
  double v3 = &v1[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent];
  swift_beginAccess();
  if (*v3 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1DA98A0C8();
    swift_release();
    swift_release();
    if (v20 != (a1 & 1))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v20) = a1 & 1;
      swift_retain();
      sub_1DA98A0D8();
      if (qword_1EBE62C50 != -1) {
        swift_once();
      }
      uint64_t v4 = sub_1DA989F38();
      __swift_project_value_buffer(v4, (uint64_t)qword_1EBE6F300);
      uint64_t v5 = v1;
      uint64_t v6 = sub_1DA989F18();
      os_log_type_t v7 = sub_1DA98C548();
      if (os_log_type_enabled(v6, v7))
      {
        uint64_t v8 = swift_slowAlloc();
        uint64_t v19 = swift_slowAlloc();
        uint64_t v20 = v19;
        *(_DWORD *)uint64_t v8 = 136315650;
        id v9 = objc_msgSend(v5, sel_description);
        uint64_t v10 = sub_1DA98C038();
        unint64_t v12 = v11;

        sub_1DA8C5E00(v10, v12, &v20);
        sub_1DA98C858();

        swift_bridgeObjectRelease();
        *(_WORD *)(v8 + 12) = 2080;
        id v13 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_widget], sel__loggingIdentifierWithMetrics_, *(void *)&v5[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_metrics]);
        uint64_t v14 = sub_1DA98C038();
        unint64_t v16 = v15;

        sub_1DA8C5E00(v14, v16, &v20);
        sub_1DA98C858();

        swift_bridgeObjectRelease();
        *(_WORD *)(v8 + 22) = 2080;
        if (a1) {
          uint64_t v17 = 1702195828;
        }
        else {
          uint64_t v17 = 0x65736C6166;
        }
        if (a1) {
          unint64_t v18 = 0xE400000000000000;
        }
        else {
          unint64_t v18 = 0xE500000000000000;
        }
        sub_1DA8C5E00(v17, v18, &v20);
        sub_1DA98C858();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1DA795000, v6, v7, "%s - %s - isSnapshotting = %s", (uint8_t *)v8, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x1E0178DA0](v19, -1, -1);
        MEMORY[0x1E0178DA0](v8, -1, -1);
      }
      else
      {
      }
    }
  }
}

void (*sub_1DA9840D0(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DA98A0C8();
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 9);
  return sub_1DA98417C;
}

void sub_1DA98417C(uint64_t a1)
{
}

void sub_1DA9841A4(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (unsigned char *)(*a2 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent);
  swift_beginAccess();
  unsigned char *v4 = v2;
  sub_1DA983D30(*(unsigned char *)(v3 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting));
  sub_1DA98449C(*(unsigned char *)(v3 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused));
}

uint64_t sub_1DA98421C()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent);
  swift_beginAccess();
  return *v1;
}

void sub_1DA984264(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent);
  swift_beginAccess();
  *uint64_t v3 = a1;
  sub_1DA983D30(*(unsigned char *)(v1 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting));
  sub_1DA98449C(*(unsigned char *)(v1 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused));
}

void (*sub_1DA9842D8(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DA984338;
}

void sub_1DA984338(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 24);
    sub_1DA983D30(*(unsigned char *)(v4 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting));
    sub_1DA98449C(*(unsigned char *)(v4 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused));
  }
}

uint64_t sub_1DA984388@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DA98A0C8();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_1DA984410()
{
  return sub_1DA984424();
}

uint64_t sub_1DA984424()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DA98A0C8();
  swift_release();
  swift_release();
  return v1;
}

void sub_1DA98449C(char a1)
{
  char v2 = v1;
  v2[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused] = a1;
  uint64_t v4 = &v2[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent];
  swift_beginAccess();
  if (*v4 == 1)
  {
    char v5 = v2[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference] | a1;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_1DA98A0C8();
    swift_release();
    swift_release();
    if ((v5 & 1) != LOBYTE(v24[0]))
    {
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v24[0]) = v5 & 1;
      swift_retain();
      sub_1DA98A0D8();
      id v6 = *(id *)&v2[OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController];
      os_log_type_t v7 = (void (*)(uint64_t *, void))sub_1DA98AA08();
      sub_1DA98AAF8();
      v7(v24, 0);

      id v8 = objc_msgSend(v2, sel_view);
      if (v8)
      {
        id v9 = v8;
        objc_msgSend(v8, sel_setNeedsLayout);

        if (qword_1EBE62C50 != -1) {
          swift_once();
        }
        uint64_t v10 = sub_1DA989F38();
        __swift_project_value_buffer(v10, (uint64_t)qword_1EBE6F300);
        unint64_t v11 = v2;
        unint64_t v12 = sub_1DA989F18();
        os_log_type_t v13 = sub_1DA98C548();
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v14 = swift_slowAlloc();
          uint64_t v15 = swift_slowAlloc();
          v24[0] = v15;
          *(_DWORD *)uint64_t v14 = 136315650;
          id v16 = objc_msgSend(v11, sel_description);
          uint64_t v17 = sub_1DA98C038();
          unint64_t v19 = v18;

          sub_1DA8C5E00(v17, v19, v24);
          sub_1DA98C858();

          swift_bridgeObjectRelease();
          *(_WORD *)(v14 + 12) = 2080;
          id v20 = objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_widget], sel__loggingIdentifierWithMetrics_, *(void *)&v11[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_metrics]);
          uint64_t v21 = sub_1DA98C038();
          unint64_t v23 = v22;

          sub_1DA8C5E00(v21, v23, v24);
          sub_1DA98C858();

          swift_bridgeObjectRelease();
          *(_WORD *)(v14 + 22) = 1024;
          sub_1DA98C858();
          _os_log_impl(&dword_1DA795000, v12, v13, "%s - %s - DisabledAnimations = %{BOOL}d", (uint8_t *)v14, 0x1Cu);
          swift_arrayDestroy();
          MEMORY[0x1E0178DA0](v15, -1, -1);
          MEMORY[0x1E0178DA0](v14, -1, -1);
        }
        else
        {
        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

void (*sub_1DA9848BC(uint64_t a1))(uint64_t a1)
{
  *(void *)a1 = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DA98A0C8();
  swift_release();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 9);
  return sub_1DA984968;
}

void sub_1DA984968(uint64_t a1)
{
}

uint64_t sub_1DA984990()
{
  return sub_1DA8982F4();
}

char *LiveWidgetContentViewController.__allocating_init(widget:metrics:viewModel:)(void *a1, void *a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  id v8 = sub_1DA985CC4(a1, a2, a3);

  swift_release();
  return v8;
}

char *LiveWidgetContentViewController.init(widget:metrics:viewModel:)(void *a1, void *a2, uint64_t a3)
{
  char v5 = sub_1DA985CC4(a1, a2, a3);

  swift_release();
  return v5;
}

void sub_1DA984A6C(char *a1, uint64_t a2)
{
  char v2 = *a1;
  uint64_t v3 = a2 + 16;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E0178E80](v3);
  if (v4)
  {
    char v5 = (void *)v4;
    *(unsigned char *)(v4 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference) = v2;
    sub_1DA98449C(*(unsigned char *)(v4 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused));
  }
}

id LiveWidgetContentViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void LiveWidgetContentViewController.init(coder:)()
{
  v0[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting] = 0;
  v0[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent] = 0;
  v0[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused] = 0;
  *(void *)&v0[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver] = 0;
  v0[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference] = 0;

  sub_1DA98CBB8();
  __break(1u);
}

uint64_t sub_1DA984C6C()
{
  swift_release();
  swift_release();

  return swift_release();
}

id LiveWidgetContentViewController.__deallocating_deinit()
{
  uint64_t v1 = OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver;
  if (*(void *)&v0[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver])
  {
    swift_retain();
    sub_1DA989FA8();
    swift_release();
  }
  *(void *)&v0[v1] = 0;
  swift_release();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1DA984E00()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_isContentTransparent);
  swift_beginAccess();
  return *v1;
}

void sub_1DA984E4C(char a1)
{
  objc_super v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_isContentTransparent);
  swift_beginAccess();
  *objc_super v3 = a1;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController__renderEngine) & 1) == 0)
  {
    id v4 = *(id *)(v1 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController);
    sub_1DA98238C(1, (a1 & 1) == 0);
  }
}

void (*sub_1DA984EE4(void *a1))(void *a1, char a2)
{
  objc_super v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = v1;
  v3[5] = sub_1DA814960();
  return sub_1DA984F40;
}

void sub_1DA984F40(void *a1, char a2)
{
  objc_super v3 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = v3[4];
    if ((*(unsigned char *)(v4 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController__renderEngine) & 1) == 0)
    {
      char v5 = *(void **)(v4 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController);
      id v6 = (char *)(v4 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_isContentTransparent);
      swift_beginAccess();
      char v7 = *v6;
      id v8 = v5;
      sub_1DA98238C(1, (v7 & 1) == 0);
    }
  }

  free(v3);
}

uint64_t sub_1DA985008(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  MEMORY[0x1F4188790](a1);
  char v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for _RootContentView();
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (void *)((char *)v16 - v9);
  uint64_t v11 = swift_retain();
  a1(v11);
  sub_1DA983A18((uint64_t)v7, a3, v10);
  swift_getWitnessTable();
  uint64_t v12 = sub_1DA98B348();
  os_log_type_t v13 = *(void **)(v3 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController);
  v16[1] = v12;
  id v14 = v13;
  swift_retain();
  sub_1DA98AA48();

  return swift_release();
}

void sub_1DA985190()
{
  sub_1DA98B348();
  id v1 = *(id *)(v0 + OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController);
  swift_retain();
  sub_1DA98AA48();

  swift_release();
  sub_1DA898AB4();
}

void sub_1DA985220(char a1)
{
  char v2 = v1;
  int v3 = a1 & 1;
  uint64_t v4 = sub_1DA98AB88();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  char v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = &v2[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground];
  swift_beginAccess();
  int v12 = *v11;
  if (v12 != v3)
  {
    uint64_t v13 = *(void *)&v2[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_viewModel];
    id v14 = (char *)(v13 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_isForeground);
    swift_beginAccess();
    char v15 = *v14;
    char *v14 = v12;
    sub_1DA88F60C(v15);
    int v16 = *v11;
    uint64_t v17 = v2;
    unint64_t v18 = sub_1DA989F18();
    os_log_type_t v19 = sub_1DA98C518();
    BOOL v20 = os_log_type_enabled(v18, v19);
    if (v16 == 1)
    {
      if (v20)
      {
        uint64_t v36 = v17;
        uint64_t v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v38 = v35;
        *(_DWORD *)uint64_t v21 = 136446210;
        uint64_t v34 = v21 + 4;
        uint64_t v22 = v13 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_logIdentifier;
        uint64_t v24 = *(void *)(v13 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_logIdentifier);
        unint64_t v23 = *(void *)(v22 + 8);
        swift_bridgeObjectRetain();
        uint64_t v37 = sub_1DA8C5E00(v24, v23, &v38);
        sub_1DA98C858();

        uint64_t v17 = v36;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1DA795000, v18, v19, "[%{public}s] Enabling RenderBox default update interval (if necessary) because foreground.", v21, 0xCu);
        uint64_t v25 = v35;
        swift_arrayDestroy();
        MEMORY[0x1E0178DA0](v25, -1, -1);
        MEMORY[0x1E0178DA0](v21, -1, -1);

LABEL_8:
        uint64_t v31 = *(void **)&v17[OBJC_IVAR____TtC9ChronoKit31BaseWidgetContentViewController_hostingController];
        type metadata accessor for SecureHostingController();
        sub_1DA98725C(&qword_1EBE63CB8, (void (*)(uint64_t))type metadata accessor for SecureHostingController);
        id v32 = v31;
        sub_1DA98A968();
        sub_1DA98AAF8();
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
        sub_1DA98A978();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);

        return;
      }
    }
    else if (v20)
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      uint64_t v38 = v35;
      uint64_t v36 = v17;
      *(_DWORD *)uint64_t v26 = 136446210;
      uint64_t v34 = v26 + 4;
      uint64_t v27 = v13 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_logIdentifier;
      uint64_t v28 = *(void *)(v13 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_logIdentifier);
      unint64_t v29 = *(void *)(v27 + 8);
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_1DA8C5E00(v28, v29, &v38);
      uint64_t v17 = v36;
      sub_1DA98C858();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DA795000, v18, v19, "[%{public}s] Disabling RenderBox update interval (if necessary) because background.", v26, 0xCu);
      uint64_t v30 = v35;
      swift_arrayDestroy();
      MEMORY[0x1E0178DA0](v30, -1, -1);
      MEMORY[0x1E0178DA0](v26, -1, -1);

      goto LABEL_8;
    }

    goto LABEL_8;
  }
}

uint64_t sub_1DA98571C()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground);
  swift_beginAccess();
  return *v1;
}

void sub_1DA985764(char a1)
{
  int v3 = (char *)(v1 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground);
  swift_beginAccess();
  char v4 = *v3;
  *int v3 = a1;
  sub_1DA985220(v4);
}

void (*sub_1DA9857C0(void *a1))(uint64_t a1)
{
  int v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground;
  v3[3] = v1;
  v3[4] = v4;
  uint64_t v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return sub_1DA985840;
}

void sub_1DA985840(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v2 = *(void *)(*(void *)a1 + 32);
  char v4 = *(unsigned char *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(v3 + v2);
  *(unsigned char *)(v3 + v2) = v4;
  sub_1DA985220(v5);

  free(v1);
}

uint64_t sub_1DA985890(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1 & 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1DA98A0D8();
}

uint64_t sub_1DA9859D4(char a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for LiveWidgetContentViewController();
  objc_msgSendSuper2(&v4, sel_viewDidDisappear_, a1 & 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_1DA98A0D8();
}

uint64_t sub_1DA985B20@<X0>(unsigned char *a1@<X8>)
{
  return sub_1DA7B992C(a1);
}

uint64_t sub_1DA985B48()
{
  return sub_1DA7B99BC();
}

uint64_t sub_1DA985B70@<X0>(unsigned char *a1@<X8>)
{
  return sub_1DA7B992C(a1);
}

uint64_t sub_1DA985B98()
{
  return sub_1DA7B99BC();
}

uint64_t sub_1DA985BC0(void *a1, void *a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  swift_beginAccess();
  id v5 = a1;
  id v6 = a2;
  sub_1DA98A088();
  swift_endAccess();
  swift_beginAccess();
  sub_1DA98A088();
  swift_endAccess();
  swift_beginAccess();
  sub_1DA98A088();
  swift_endAccess();
  return v2;
}

char *sub_1DA985CC4(void *a1, void *a2, uint64_t a3)
{
  objc_super v4 = v3;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE63AC0);
  MEMORY[0x1F4188790](v40);
  uint64_t v39 = (uint64_t)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  uint64_t v41 = (uint64_t *)((char *)&v36 - v10);
  v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__isSnapshotting] = 0;
  v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent] = 0;
  v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__areAnimationsPaused] = 0;
  uint64_t v11 = OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver;
  *(void *)&v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver] = 0;
  uint64_t v37 = OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference;
  v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__cachedAnimationsDisabledPreference] = 0;
  *(void *)&v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_widget] = a1;
  *(void *)&v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_metrics] = a2;
  *(void *)&v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_viewModel] = a3;
  v4[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground] = 0;
  uint64_t v38 = type metadata accessor for _RootContentViewModel();
  swift_allocObject();
  id v12 = a1;
  id v13 = a2;
  id v14 = v12;
  id v15 = v13;
  int v16 = v4;
  swift_retain();
  uint64_t v17 = sub_1DA985BC0(v14, v15);

  *(void *)&v16[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__rootViewModel] = v17;
  if (qword_1EBE66028 != -1) {
    swift_once();
  }
  uint64_t v18 = *(void *)(*((void *)off_1EBE66018 + 16) + 88);
  os_log_type_t v19 = *(os_unfair_lock_s **)(v18 + 16);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v19);
  LOBYTE(v19) = sub_1DA7AE76C();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(v18 + 16));
  swift_release();
  swift_release();
  v4[v37] = v19 & 1;
  *(void *)&v4[v11] = 0;
  swift_release();
  objc_msgSend(v14, sel_family);
  LOBYTE(v19) = sub_1DA8A0514();
  BOOL v20 = v16;
  uint64_t v21 = v41;
  uint64_t v22 = (char *)v41 + *(int *)(v40 + 36);
  uint64_t v43 = 0;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE63830);
  sub_1DA98B268();
  *((_OWORD *)v22 + 1) = v42;
  uint64_t v43 = 0;
  sub_1DA98B268();
  *((_OWORD *)v22 + 2) = v42;
  v22[48] = 0;
  *((void *)v22 + 7) = 0;
  uint64_t v23 = a3 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_logger;
  uint64_t v24 = &v22[*(int *)(type metadata accessor for LiveWidgetEntryView() + 36)];
  uint64_t v25 = sub_1DA989F38();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16))(v24, v23, v25);
  type metadata accessor for LiveWidgetEntryViewModel(0);
  sub_1DA98725C(&qword_1EBE63D60, (void (*)(uint64_t))type metadata accessor for LiveWidgetEntryViewModel);
  *(void *)uint64_t v22 = sub_1DA98A318();
  *((void *)v22 + 1) = v26;
  sub_1DA98725C(&qword_1EBE63C70, (void (*)(uint64_t))type metadata accessor for _RootContentViewModel);
  uint64_t v27 = sub_1DA98A318();
  uint64_t v29 = v28;

  *uint64_t v21 = v27;
  v21[1] = v29;
  sub_1DA9872A4((uint64_t)v21, v39);
  sub_1DA7A0410(&qword_1EBE63AB8, (uint64_t *)&unk_1EBE63AC0);
  uint64_t v30 = sub_1DA98B348();
  uint64_t v31 = (char *)(a3 + OBJC_IVAR____TtC9ChronoKit24LiveWidgetEntryViewModel_isContentTransparent);
  swift_beginAccess();
  id v32 = sub_1DA8140A8(v30, v19 & 1, *v31, 1);
  uint64_t v43 = *(void *)(*((void *)off_1EBE66018 + 16) + 72);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v33 = v32;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE66B58);
  sub_1DA7A0410(&qword_1EBE66B50, &qword_1EBE66B58);
  uint64_t v34 = sub_1DA98A1A8();
  swift_release();
  swift_release();
  *(void *)&v33[OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController__animationsDisabledPreferenceObserver] = v34;
  swift_release();
  sub_1DA98449C(0);

  sub_1DA7A1AE0((uint64_t)v21, (uint64_t *)&unk_1EBE63AC0);
  return v33;
}

uint64_t type metadata accessor for LiveWidgetContentViewController()
{
  return self;
}

uint64_t type metadata accessor for _RootContentView()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_1DA986258@<X0>(unsigned char *a1@<X8>)
{
  return sub_1DA7B992C(a1);
}

uint64_t sub_1DA986280()
{
  return sub_1DA7B99BC();
}

uint64_t sub_1DA9862A8@<X0>(unsigned char *a1@<X8>)
{
  return sub_1DA984388(a1);
}

void sub_1DA9862D0(char *a1)
{
}

uint64_t sub_1DA9862F8@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_hasAnimatableContent, a2);
}

uint64_t sub_1DA986308@<X0>(unsigned char *a1@<X8>)
{
  return sub_1DA984388(a1);
}

void sub_1DA986330(char *a1)
{
}

uint64_t sub_1DA986358@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground, a2);
}

void sub_1DA986364(char *a1, void *a2)
{
  char v2 = *a1;
  uint64_t v3 = (char *)(*a2 + OBJC_IVAR____TtC9ChronoKit31LiveWidgetContentViewController_isForeground);
  swift_beginAccess();
  char v4 = *v3;
  *uint64_t v3 = v2;
  sub_1DA985220(v4);
}

uint64_t sub_1DA9863C4()
{
  return type metadata accessor for _RootContentViewModel();
}

uint64_t type metadata accessor for _RootContentViewModel()
{
  uint64_t result = qword_1EBE63C78;
  if (!qword_1EBE63C78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1DA986418()
{
  sub_1DA8A2E54();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for LiveWidgetContentViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for LiveWidgetContentViewController);
}

uint64_t dispatch thunk of LiveWidgetContentViewController.isSnapshotting.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.isSnapshotting.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.isSnapshotting.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.hasAnimatableContent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.hasAnimatableContent.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.hasAnimatableContent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.areAnimationsPaused.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.areAnimationsPaused.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.areAnimationsPaused.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.requestLaunch()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x238))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.__allocating_init(widget:metrics:viewModel:)()
{
  return (*(uint64_t (**)(void))(v0 + 576))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.updateContentView<A>(content:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x248))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.invalidate()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.isForeground.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x258))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.isForeground.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of LiveWidgetContentViewController.isForeground.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & *v0) + 0x268))();
}

uint64_t sub_1DA98686C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1DA986908(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    id v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_1DA986A10(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);

  return v5(v6);
}

void *sub_1DA986A84(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_retain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_1DA986B14(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_1DA986BAC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_1DA986C1C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_1DA986CA4(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
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
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
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
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 1);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
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

void sub_1DA986E44(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
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
      JUMPOUT(0x1DA9870A4);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
          os_log_type_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t sub_1DA9870CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DA987110()
{
  return sub_1DA98A4F8();
}

uint64_t sub_1DA987138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DA98A838();
  *a1 = result;
  return result;
}

uint64_t sub_1DA987164(id *a1)
{
  id v1 = *a1;
  return sub_1DA98A848();
}

uint64_t sub_1DA987194@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DA98A758();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1DA9871C4()
{
  return sub_1DA98A768();
}

uint64_t sub_1DA9871EC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DA98A778();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1DA98721C()
{
  return sub_1DA98A788();
}

uint64_t block_copy_helper_20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_20()
{
  return swift_release();
}

uint64_t sub_1DA98725C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DA9872A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE63AC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DA98730C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x1F4186498](v0, 24, 7);
}

void sub_1DA987344(char *a1)
{
  sub_1DA984A6C(a1, v1);
}

uint64_t sub_1DA98734C()
{
  return swift_getWitnessTable();
}

uint64_t sub_1DA987540(uint64_t a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = a2 >> 62;
  uint64_t v3 = MEMORY[0x1E4FBC860];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_43;
      }
      uint64_t v4 = HIDWORD(a1) - (int)a1;
LABEL_6:
      if (!v4) {
        return v3;
      }
      uint64_t v29 = MEMORY[0x1E4FBC860];
      int64_t v7 = v4 & ~(v4 >> 63);
      sub_1DA7F7A64(0, v7, 0);
      uint64_t v3 = v29;
      if (v2)
      {
        if (v2 == 1) {
          uint64_t v8 = (int)a1;
        }
        else {
          uint64_t v8 = *(void *)(a1 + 16);
        }
        if (v4 < 0)
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
        }
      }
      else
      {
        if (v4 < 0) {
          goto LABEL_45;
        }
        uint64_t v8 = 0;
      }
      int v25 = v2;
      do
      {
        if (!v7)
        {
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          goto LABEL_42;
        }
        if (v2)
        {
          if (v2 == 1)
          {
            if (v8 < (int)a1 || v8 >= a1 >> 32) {
              goto LABEL_36;
            }
            uint64_t v9 = sub_1DA9891A8();
            if (!v9) {
              goto LABEL_46;
            }
            uint64_t v10 = v9;
            uint64_t v11 = sub_1DA9891D8();
            uint64_t v12 = v8 - v11;
            if (__OFSUB__(v8, v11)) {
              goto LABEL_39;
            }
          }
          else
          {
            if (v8 < *(void *)(a1 + 16)) {
              goto LABEL_38;
            }
            if (v8 >= *(void *)(a1 + 24)) {
              goto LABEL_40;
            }
            uint64_t v14 = sub_1DA9891A8();
            if (!v14) {
              goto LABEL_47;
            }
            uint64_t v10 = v14;
            uint64_t v15 = sub_1DA9891D8();
            uint64_t v12 = v8 - v15;
            if (__OFSUB__(v8, v15)) {
              goto LABEL_41;
            }
          }
          char v13 = *(unsigned char *)(v10 + v12);
        }
        else
        {
          if (v8 >= BYTE6(a2)) {
            goto LABEL_37;
          }
          uint64_t v26 = a1;
          int v27 = a2;
          __int16 v28 = WORD2(a2);
          char v13 = *((unsigned char *)&v26 + v8);
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE58FD8);
        uint64_t v16 = swift_allocObject();
        *(_OWORD *)(v16 + 16) = xmmword_1DA990050;
        *(void *)(v16 + 56) = MEMORY[0x1E4FBC358];
        *(void *)(v16 + 64) = MEMORY[0x1E4FBC3B0];
        *(unsigned char *)(v16 + 32) = v13;
        unint64_t v2 = sub_1DA98C068();
        uint64_t v18 = v17;
        uint64_t v29 = v3;
        unint64_t v20 = *(void *)(v3 + 16);
        unint64_t v19 = *(void *)(v3 + 24);
        if (v20 >= v19 >> 1)
        {
          sub_1DA7F7A64(v19 > 1, v20 + 1, 1);
          uint64_t v3 = v29;
        }
        *(void *)(v3 + 16) = v20 + 1;
        uint64_t v21 = v3 + 16 * v20;
        *(void *)(v21 + 32) = v2;
        *(void *)(v21 + 40) = v18;
        ++v8;
        --v7;
        --v4;
        LODWORD(v2) = v25;
      }
      while (v4);
      return v3;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      uint64_t v4 = v5 - v6;
      if (!__OFSUB__(v5, v6)) {
        goto LABEL_6;
      }
      goto LABEL_44;
    case 3uLL:
      return v3;
    default:
      uint64_t v4 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t PushToken.init(subscriptionIdentifier:environmentName:topic:token:expirationDate:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  uint64_t v17 = *a5;
  uint64_t v16 = a5[1];
  uint64_t v18 = (uint64_t)a9 + *(int *)(type metadata accessor for PushToken() + 32);
  uint64_t v19 = sub_1DA989638();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = a3;
  a9[5] = a4;
  a9[6] = v17;
  a9[7] = v16;
  *a9 = a6;
  a9[1] = a7;

  return sub_1DA85A1E0(a8, v18);
}

uint64_t type metadata accessor for PushToken()
{
  uint64_t result = qword_1EBE59FE0;
  if (!qword_1EBE59FE0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t PushToken.token.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_1DA79ED98(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t PushToken.token.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1DA79DA70(*(void *)v2, *(void *)(v2 + 8));
  *(void *)uint64_t v2 = a1;
  *(void *)(v2 + 8) = a2;
  return result;
}

uint64_t (*PushToken.token.modify())()
{
  return CGSizeMake;
}

uint64_t PushToken.subscriptionIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushToken.subscriptionIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*PushToken.subscriptionIdentifier.modify())()
{
  return CGSizeMake;
}

uint64_t PushToken.environmentName.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PushToken.environmentName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t (*PushToken.environmentName.modify())()
{
  return CGSizeMake;
}

uint64_t PushToken.topic.getter@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 56);
  *a1 = *(void *)(v1 + 48);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t PushToken.topic.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 48) = v2;
  *(void *)(v1 + 56) = v3;
  return result;
}

uint64_t (*PushToken.topic.modify())()
{
  return CGSizeMake;
}

uint64_t PushToken.expirationDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PushToken() + 32);

  return sub_1DA85A178(v3, a1);
}

uint64_t PushToken.expirationDate.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for PushToken() + 32);

  return sub_1DA85A1E0(a1, v3);
}

double (*PushToken.expirationDate.modify())(void, void, void, void)
{
  return CGSizeMake;
}

uint64_t PushToken.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
  MEMORY[0x1F4188790](v2);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  unint64_t v6 = v1[1];
  sub_1DA79ED98(v5, v6);
  uint64_t v7 = sub_1DA987540(v5, v6);
  sub_1DA79DA70(v5, v6);
  uint64_t v12 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE62A40);
  sub_1DA7BE9FC();
  sub_1DA98BFC8();
  swift_bridgeObjectRelease();
  uint64_t v12 = 0;
  unint64_t v13 = 0xE000000000000000;
  sub_1DA98CA18();
  sub_1DA98C148();
  swift_bridgeObjectRetain();
  sub_1DA98C148();
  swift_bridgeObjectRelease();
  sub_1DA98C148();
  swift_bridgeObjectRetain();
  sub_1DA98C148();
  swift_bridgeObjectRelease();
  sub_1DA98C148();
  uint64_t v8 = v1[7];
  v11[0] = v1[6];
  v11[1] = v8;
  swift_bridgeObjectRetain();
  sub_1DA98C148();
  sub_1DA98C148();
  swift_bridgeObjectRelease();
  sub_1DA98C148();
  sub_1DA98C148();
  swift_bridgeObjectRelease();
  sub_1DA98C148();
  uint64_t v9 = type metadata accessor for PushToken();
  sub_1DA85A178((uint64_t)v1 + *(int *)(v9 + 32), (uint64_t)v4);
  sub_1DA98C0A8();
  sub_1DA98C148();
  swift_bridgeObjectRelease();
  return v12;
}

BOOL _s9ChronoKit9PushTokenV2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = sub_1DA989638();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBE61CC8);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
  MEMORY[0x1F4188790](v11 - 8);
  unint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v34 - v15;
  MEMORY[0x1F4188790](v17);
  uint64_t v19 = (char *)&v34 - v18;
  if ((sub_1DA816D7C(*a1, a1[1], *a2, a2[1]) & 1) == 0) {
    return 0;
  }
  if (a1[2] == a2[2] && a1[3] == a2[3] || (v20 = sub_1DA98CE58(), BOOL result = 0, (v20 & 1) != 0))
  {
    if (a1[4] == a2[4] && a1[5] == a2[5] || (v22 = sub_1DA98CE58(), BOOL result = 0, (v22 & 1) != 0))
    {
      if (a1[6] == a2[6] && a1[7] == a2[7] || (v23 = sub_1DA98CE58(), BOOL result = 0, (v23 & 1) != 0))
      {
        uint64_t v35 = v7;
        uint64_t v24 = v5;
        uint64_t v25 = type metadata accessor for PushToken();
        sub_1DA85A178((uint64_t)a1 + *(int *)(v25 + 32), (uint64_t)v19);
        uint64_t v26 = *(int *)(v25 + 32);
        uint64_t v27 = v24;
        sub_1DA85A178((uint64_t)a2 + v26, (uint64_t)v16);
        uint64_t v28 = (uint64_t)&v10[*(int *)(v8 + 48)];
        sub_1DA85A178((uint64_t)v19, (uint64_t)v10);
        sub_1DA85A178((uint64_t)v16, v28);
        uint64_t v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
        if (v29((uint64_t)v10, 1, v4) == 1)
        {
          sub_1DA7A1AE0((uint64_t)v16, &qword_1EBE61CC0);
          sub_1DA7A1AE0((uint64_t)v19, &qword_1EBE61CC0);
          if (v29(v28, 1, v4) == 1)
          {
            sub_1DA7A1AE0((uint64_t)v10, &qword_1EBE61CC0);
            return 1;
          }
        }
        else
        {
          sub_1DA85A178((uint64_t)v10, (uint64_t)v13);
          if (v29(v28, 1, v4) != 1)
          {
            uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 32);
            uint64_t v31 = v35;
            v30(v35, v28, v4);
            sub_1DA988E94();
            char v32 = sub_1DA98BFF8();
            uint64_t v33 = *(void (**)(char *, uint64_t))(v27 + 8);
            v33(v31, v4);
            sub_1DA7A1AE0((uint64_t)v16, &qword_1EBE61CC0);
            sub_1DA7A1AE0((uint64_t)v19, &qword_1EBE61CC0);
            v33(v13, v4);
            sub_1DA7A1AE0((uint64_t)v10, &qword_1EBE61CC0);
            return (v32 & 1) != 0;
          }
          sub_1DA7A1AE0((uint64_t)v16, &qword_1EBE61CC0);
          sub_1DA7A1AE0((uint64_t)v19, &qword_1EBE61CC0);
          (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v4);
        }
        sub_1DA7A1AE0((uint64_t)v10, (uint64_t *)&unk_1EBE61CC8);
        return 0;
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PushToken(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    sub_1DA79ED98(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[3];
    a1[2] = a2[2];
    a1[3] = v9;
    uint64_t v10 = a2[5];
    a1[4] = a2[4];
    a1[5] = v10;
    uint64_t v11 = a2[6];
    uint64_t v12 = a2[7];
    uint64_t v13 = *(int *)(a3 + 32);
    uint64_t v14 = (char *)a2 + v13;
    uint64_t v15 = (char *)a1 + v13;
    a1[6] = v11;
    a1[7] = v12;
    uint64_t v16 = sub_1DA989638();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v18(v14, 1, v16))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
      memcpy(v15, v14, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v15, v14, v16);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
    }
  }
  return a1;
}

uint64_t destroy for PushToken(uint64_t a1, uint64_t a2)
{
  sub_1DA79DA70(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 32);
  uint64_t v5 = sub_1DA989638();
  uint64_t v8 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
  if (!result)
  {
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
    return v7(v4, v5);
  }
  return result;
}

uint64_t *initializeWithCopy for PushToken(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1DA79ED98(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[3];
  a1[2] = a2[2];
  a1[3] = v8;
  uint64_t v9 = a2[5];
  a1[4] = a2[4];
  a1[5] = v9;
  uint64_t v10 = a2[6];
  uint64_t v11 = a2[7];
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = (char *)a2 + v12;
  uint64_t v14 = (char *)a1 + v12;
  a1[6] = v10;
  a1[7] = v11;
  uint64_t v15 = sub_1DA989638();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v17(v13, 1, v15))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
    memcpy(v14, v13, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v14, v13, v15);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  }
  return a1;
}

uint64_t *assignWithCopy for PushToken(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  sub_1DA79ED98(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  sub_1DA79DA70(v8, v9);
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 32);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = sub_1DA989638();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  LODWORD(v7) = v15(v11, 1, v13);
  int v16 = v15(v12, 1, v13);
  if (!v7)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

_OWORD *initializeWithTake for PushToken(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  long long v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 32);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DA989638();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
    memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t *assignWithTake for PushToken(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_1DA79DA70(v6, v7);
  uint64_t v8 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 56);
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)(a2 + v11);
  uint64_t v14 = sub_1DA989638();
  uint64_t v15 = *(void *)(v14 - 8);
  int v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  int v17 = v16(v12, 1, v14);
  int v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
    memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PushToken(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DA988C7C);
}

uint64_t sub_1DA988C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 32);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PushToken(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DA988D44);
}

uint64_t sub_1DA988D44(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBE61CC0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 32);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1DA988DF0()
{
  sub_1DA85A9C4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_1DA988E94()
{
  unint64_t result = qword_1EBE61CB0;
  if (!qword_1EBE61CB0)
  {
    sub_1DA989638();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EBE61CB0);
  }
  return result;
}

void __getWFLinkActionWorkflowRunnerClientClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *VoiceShortcutClientLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CHKShortcutsSoftLinking.m", 10, @"%s", *a1);

  __break(1u);
}

void __getWFLinkActionWorkflowRunnerClientClass_block_invoke_cold_2()
{
  unint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"Class getWFLinkActionWorkflowRunnerClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CHKShortcutsSoftLinking.m", 11, @"Unable to find class %s", "WFLinkActionWorkflowRunnerClient");

  __break(1u);
  sub_1DA988FE8();
}

uint64_t sub_1DA988FE8()
{
  return MEMORY[0x1F40E2D28]();
}

uint64_t sub_1DA988FF8()
{
  return MEMORY[0x1F40E2D30]();
}

uint64_t sub_1DA989008()
{
  return MEMORY[0x1F40E2D68]();
}

uint64_t sub_1DA989018()
{
  return MEMORY[0x1F40E2D70]();
}

uint64_t sub_1DA989028()
{
  return MEMORY[0x1F40E2D88]();
}

uint64_t sub_1DA989038()
{
  return MEMORY[0x1F40E2DA8]();
}

uint64_t sub_1DA989048()
{
  return MEMORY[0x1F40E2DB8]();
}

uint64_t sub_1DA989058()
{
  return MEMORY[0x1F40E2DD0]();
}

uint64_t sub_1DA989068()
{
  return MEMORY[0x1F40E2DE0]();
}

uint64_t sub_1DA989078()
{
  return MEMORY[0x1F40E2DF0]();
}

uint64_t sub_1DA989088()
{
  return MEMORY[0x1F40E2E00]();
}

uint64_t sub_1DA989098()
{
  return MEMORY[0x1F40E2E08]();
}

uint64_t sub_1DA9890A8()
{
  return MEMORY[0x1F40E2E28]();
}

uint64_t sub_1DA9890B8()
{
  return MEMORY[0x1F40E2E50]();
}

uint64_t sub_1DA9890C8()
{
  return MEMORY[0x1F40E3038]();
}

uint64_t sub_1DA9890D8()
{
  return MEMORY[0x1F40E3060]();
}

uint64_t sub_1DA9890E8()
{
  return MEMORY[0x1F40E3070]();
}

uint64_t sub_1DA9890F8()
{
  return MEMORY[0x1F40E3128]();
}

uint64_t sub_1DA989108()
{
  return MEMORY[0x1F40E3150]();
}

uint64_t sub_1DA989118()
{
  return MEMORY[0x1F40E3160]();
}

uint64_t sub_1DA989128()
{
  return MEMORY[0x1F40E32B0]();
}

uint64_t sub_1DA989138()
{
  return MEMORY[0x1F40E32F8]();
}

uint64_t sub_1DA989148()
{
  return MEMORY[0x1F40E3420]();
}

uint64_t sub_1DA989158()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1DA989168()
{
  return MEMORY[0x1F40E34D0]();
}

uint64_t sub_1DA989178()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1DA989188()
{
  return MEMORY[0x1F40E37C0]();
}

uint64_t sub_1DA989198()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1DA9891A8()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1DA9891B8()
{
  return MEMORY[0x1F40E37F0]();
}

uint64_t sub_1DA9891C8()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1DA9891D8()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1DA9891E8()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1DA9891F8()
{
  return MEMORY[0x1F40E3A90]();
}

uint64_t sub_1DA989208()
{
  return MEMORY[0x1F40E3A98]();
}

uint64_t sub_1DA989218()
{
  return MEMORY[0x1F40E3AB0]();
}

uint64_t sub_1DA989228()
{
  return MEMORY[0x1F40E3AC0]();
}

uint64_t sub_1DA989238()
{
  return MEMORY[0x1F40E3B70]();
}

uint64_t sub_1DA989248()
{
  return MEMORY[0x1F40E3FC8]();
}

uint64_t sub_1DA989258()
{
  return MEMORY[0x1F40E4008]();
}

uint64_t sub_1DA989268()
{
  return MEMORY[0x1F40E41E0]();
}

uint64_t sub_1DA989278()
{
  return MEMORY[0x1F40E4210]();
}

uint64_t sub_1DA989288()
{
  return MEMORY[0x1F40E4220]();
}

uint64_t sub_1DA989298()
{
  return MEMORY[0x1F40E44C8]();
}

uint64_t sub_1DA9892A8()
{
  return MEMORY[0x1F40E44F0]();
}

uint64_t sub_1DA9892B8()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1DA9892C8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1DA9892D8()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1DA9892E8()
{
  return MEMORY[0x1F40E46D0]();
}

uint64_t sub_1DA9892F8()
{
  return MEMORY[0x1F40E4878]();
}

uint64_t sub_1DA989308()
{
  return MEMORY[0x1F40E48D8]();
}

uint64_t sub_1DA989318()
{
  return MEMORY[0x1F4111220]();
}

uint64_t sub_1DA989328()
{
  return MEMORY[0x1F4111228]();
}

uint64_t sub_1DA989338()
{
  return MEMORY[0x1F4111230]();
}

uint64_t sub_1DA989348()
{
  return MEMORY[0x1F4111238]();
}

uint64_t sub_1DA989358()
{
  return MEMORY[0x1F4111240]();
}

uint64_t sub_1DA989368()
{
  return MEMORY[0x1F40E48F8]();
}

uint64_t sub_1DA989378()
{
  return MEMORY[0x1F40E4908]();
}

uint64_t sub_1DA989388()
{
  return MEMORY[0x1F40E4918]();
}

uint64_t sub_1DA989398()
{
  return MEMORY[0x1F40E4970]();
}

uint64_t sub_1DA9893A8()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1DA9893B8()
{
  return MEMORY[0x1F40E49A8]();
}

uint64_t sub_1DA9893C8()
{
  return MEMORY[0x1F40E49B0]();
}

uint64_t sub_1DA9893D8()
{
  return MEMORY[0x1F40E49B8]();
}

uint64_t sub_1DA9893E8()
{
  return MEMORY[0x1F4187830]();
}

uint64_t sub_1DA9893F8()
{
  return MEMORY[0x1F40E49E0]();
}

uint64_t sub_1DA989408()
{
  return MEMORY[0x1F40E49E8]();
}

uint64_t sub_1DA989418()
{
  return MEMORY[0x1F40E4A28]();
}

uint64_t sub_1DA989428()
{
  return MEMORY[0x1F40E4A50]();
}

uint64_t sub_1DA989438()
{
  return MEMORY[0x1F40E4A70]();
}

uint64_t sub_1DA989448()
{
  return MEMORY[0x1F40E4AA8]();
}

uint64_t sub_1DA989458()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1DA989468()
{
  return MEMORY[0x1F40E4B58]();
}

uint64_t sub_1DA989478()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1DA989488()
{
  return MEMORY[0x1F40E4BC8]();
}

uint64_t sub_1DA989498()
{
  return MEMORY[0x1F40E4BE0]();
}

uint64_t sub_1DA9894A8()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1DA9894B8()
{
  return MEMORY[0x1F40E4CA8]();
}

uint64_t sub_1DA9894C8()
{
  return MEMORY[0x1F40E4CD8]();
}

uint64_t sub_1DA9894D8()
{
  return MEMORY[0x1F40E4D58]();
}

uint64_t sub_1DA9894E8()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1DA9894F8()
{
  return MEMORY[0x1F40E4ED0]();
}

uint64_t sub_1DA989508()
{
  return MEMORY[0x1F40E4EE0]();
}

uint64_t sub_1DA989518()
{
  return MEMORY[0x1F40E4EF0]();
}

uint64_t sub_1DA989528()
{
  return MEMORY[0x1F40E5088]();
}

uint64_t sub_1DA989538()
{
  return MEMORY[0x1F40E50A8]();
}

uint64_t sub_1DA989548()
{
  return MEMORY[0x1F40E50E0]();
}

uint64_t sub_1DA989558()
{
  return MEMORY[0x1F40E5158]();
}

uint64_t sub_1DA989568()
{
  return MEMORY[0x1F40E5188]();
}

uint64_t sub_1DA989578()
{
  return MEMORY[0x1F40E5198]();
}

uint64_t sub_1DA989588()
{
  return MEMORY[0x1F40E51A8]();
}

uint64_t sub_1DA989598()
{
  return MEMORY[0x1F40E51C0]();
}

uint64_t sub_1DA9895A8()
{
  return MEMORY[0x1F40E51D8]();
}

uint64_t sub_1DA9895B8()
{
  return MEMORY[0x1F40E51F0]();
}

uint64_t sub_1DA9895C8()
{
  return MEMORY[0x1F40E52A0]();
}

uint64_t sub_1DA9895D8()
{
  return MEMORY[0x1F40E52B0]();
}

uint64_t sub_1DA9895E8()
{
  return MEMORY[0x1F40E52C0]();
}

uint64_t sub_1DA9895F8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t _s9ChronoKit27RemoteActivityArchiveBudgetV08activityF2ID0gF4Type14windowDuration07maximumK00lF9PerWindow9startDate09remainingF0AC10Foundation4UUIDV_AA0cdefI0OS2dSiAK0P0VSiSgtcfcfA4__0()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1DA989618()
{
  return MEMORY[0x1F40E5328]();
}

uint64_t sub_1DA989628()
{
  return MEMORY[0x1F40E5378]();
}

uint64_t sub_1DA989638()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1DA989648()
{
  return MEMORY[0x1F40E53A0]();
}

uint64_t sub_1DA989658()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1DA989668()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1DA989678()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t _s9ChronoKit26RemoteActivitySubscriptionV2id10activityID12hostIdentity0G5Owner7metrics6family16subscriptionType12creationDateAC10Foundation4UUIDV_SS0A8Services012DeviceScopedJ0VyAO15TypedIdentifierVyAO0xO0O10WidgetHostOGGAC0D9OwnershipO0yB00D17MetricsDefinitionVA0_0D6FamilyOAC0deO0OAL0Q0VSgtcfcfA__0()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1DA989698()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1DA9896A8()
{
  return MEMORY[0x1F40E5540]();
}

uint64_t sub_1DA9896B8()
{
  return MEMORY[0x1F40E5578]();
}

uint64_t sub_1DA9896C8()
{
  return MEMORY[0x1F40E5648]();
}

uint64_t sub_1DA9896D8()
{
  return MEMORY[0x1F40E57F8]();
}

uint64_t sub_1DA9896E8()
{
  return MEMORY[0x1F40E5840]();
}

uint64_t sub_1DA9896F8()
{
  return MEMORY[0x1F40E5868]();
}

uint64_t sub_1DA989708()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1DA989718()
{
  return MEMORY[0x1F40E5D28]();
}

uint64_t sub_1DA989728()
{
  return MEMORY[0x1F40E5D38]();
}

uint64_t sub_1DA989738()
{
  return MEMORY[0x1F40E5D60]();
}

uint64_t sub_1DA989748()
{
  return MEMORY[0x1F40E5D70]();
}

uint64_t sub_1DA989758()
{
  return MEMORY[0x1F40D3298]();
}

uint64_t sub_1DA989768()
{
  return MEMORY[0x1F40D3338]();
}

uint64_t sub_1DA989778()
{
  return MEMORY[0x1F40D3340]();
}

uint64_t sub_1DA989788()
{
  return MEMORY[0x1F40D3348]();
}

uint64_t sub_1DA989798()
{
  return MEMORY[0x1F40D3430]();
}

uint64_t sub_1DA9897A8()
{
  return MEMORY[0x1F40D3440]();
}

uint64_t sub_1DA9897B8()
{
  return MEMORY[0x1F40D3448]();
}

uint64_t sub_1DA9897C8()
{
  return MEMORY[0x1F40D3450]();
}

uint64_t sub_1DA9897D8()
{
  return MEMORY[0x1F40D3458]();
}

uint64_t sub_1DA9897E8()
{
  return MEMORY[0x1F40D3678]();
}

uint64_t sub_1DA9897F8()
{
  return MEMORY[0x1F40D3680]();
}

uint64_t sub_1DA989808()
{
  return MEMORY[0x1F40D3698]();
}

uint64_t sub_1DA989818()
{
  return MEMORY[0x1F40D36A0]();
}

uint64_t sub_1DA989828()
{
  return MEMORY[0x1F40D36A8]();
}

uint64_t sub_1DA989838()
{
  return MEMORY[0x1F40D36B0]();
}

uint64_t sub_1DA989848()
{
  return MEMORY[0x1F40D36C0]();
}

uint64_t sub_1DA989858()
{
  return MEMORY[0x1F40D3798]();
}

uint64_t sub_1DA989868()
{
  return MEMORY[0x1F40D37A0]();
}

uint64_t sub_1DA989878()
{
  return MEMORY[0x1F40D3948]();
}

uint64_t sub_1DA989888()
{
  return MEMORY[0x1F4119150]();
}

uint64_t sub_1DA989898()
{
  return MEMORY[0x1F4111250]();
}

uint64_t sub_1DA9898A8()
{
  return MEMORY[0x1F4111258]();
}

uint64_t sub_1DA9898B8()
{
  return MEMORY[0x1F4111278]();
}

uint64_t sub_1DA9898C8()
{
  return MEMORY[0x1F4111280]();
}

uint64_t sub_1DA9898D8()
{
  return MEMORY[0x1F4111288]();
}

uint64_t sub_1DA9898E8()
{
  return MEMORY[0x1F4111290]();
}

uint64_t sub_1DA9898F8()
{
  return MEMORY[0x1F4111298]();
}

uint64_t sub_1DA989908()
{
  return MEMORY[0x1F41112A0]();
}

uint64_t sub_1DA989918()
{
  return MEMORY[0x1F41112A8]();
}

uint64_t sub_1DA989928()
{
  return MEMORY[0x1F41112B0]();
}

uint64_t sub_1DA989938()
{
  return MEMORY[0x1F4111358]();
}

uint64_t sub_1DA989948()
{
  return MEMORY[0x1F4111360]();
}

uint64_t sub_1DA989958()
{
  return MEMORY[0x1F4111368]();
}

uint64_t sub_1DA989968()
{
  return MEMORY[0x1F4111370]();
}

uint64_t sub_1DA989978()
{
  return MEMORY[0x1F41113B0]();
}

uint64_t sub_1DA989988()
{
  return MEMORY[0x1F41113B8]();
}

uint64_t sub_1DA989998()
{
  return MEMORY[0x1F41113C0]();
}

uint64_t sub_1DA9899A8()
{
  return MEMORY[0x1F41113D0]();
}

uint64_t sub_1DA9899B8()
{
  return MEMORY[0x1F41113E0]();
}

uint64_t sub_1DA9899C8()
{
  return MEMORY[0x1F41113E8]();
}

uint64_t sub_1DA9899D8()
{
  return MEMORY[0x1F41113F0]();
}

uint64_t sub_1DA9899E8()
{
  return MEMORY[0x1F41113F8]();
}

uint64_t sub_1DA9899F8()
{
  return MEMORY[0x1F4111408]();
}

uint64_t sub_1DA989A08()
{
  return MEMORY[0x1F4111420]();
}

uint64_t sub_1DA989A18()
{
  return MEMORY[0x1F4111468]();
}

uint64_t sub_1DA989A28()
{
  return MEMORY[0x1F4111478]();
}

uint64_t sub_1DA989A38()
{
  return MEMORY[0x1F4111480]();
}

uint64_t sub_1DA989A48()
{
  return MEMORY[0x1F4111490]();
}

uint64_t sub_1DA989A58()
{
  return MEMORY[0x1F4111498]();
}

uint64_t sub_1DA989A68()
{
  return MEMORY[0x1F41114A8]();
}

uint64_t sub_1DA989A78()
{
  return MEMORY[0x1F41114B8]();
}

uint64_t sub_1DA989A88()
{
  return MEMORY[0x1F41114C0]();
}

uint64_t sub_1DA989A98()
{
  return MEMORY[0x1F41114D8]();
}

uint64_t sub_1DA989AA8()
{
  return MEMORY[0x1F41114E0]();
}

uint64_t sub_1DA989AB8()
{
  return MEMORY[0x1F41114E8]();
}

uint64_t sub_1DA989AC8()
{
  return MEMORY[0x1F4111518]();
}

uint64_t sub_1DA989AD8()
{
  return MEMORY[0x1F4111520]();
}

uint64_t sub_1DA989AE8()
{
  return MEMORY[0x1F4111528]();
}

uint64_t sub_1DA989AF8()
{
  return MEMORY[0x1F4111578]();
}

uint64_t sub_1DA989B08()
{
  return MEMORY[0x1F4111580]();
}

uint64_t sub_1DA989B18()
{
  return MEMORY[0x1F4111588]();
}

uint64_t sub_1DA989B28()
{
  return MEMORY[0x1F4111598]();
}

uint64_t sub_1DA989B38()
{
  return MEMORY[0x1F41115A0]();
}

uint64_t sub_1DA989B48()
{
  return MEMORY[0x1F41115C8]();
}

uint64_t sub_1DA989B58()
{
  return MEMORY[0x1F41115D0]();
}

uint64_t sub_1DA989B68()
{
  return MEMORY[0x1F4111658]();
}

uint64_t sub_1DA989B78()
{
  return MEMORY[0x1F4111660]();
}

uint64_t sub_1DA989B88()
{
  return MEMORY[0x1F4111668]();
}

uint64_t sub_1DA989B98()
{
  return MEMORY[0x1F4186958]();
}

uint64_t sub_1DA989BA8()
{
  return MEMORY[0x1F4186968]();
}

uint64_t sub_1DA989BB8()
{
  return MEMORY[0x1F4186978]();
}

uint64_t sub_1DA989BC8()
{
  return MEMORY[0x1F41498D8]();
}

uint64_t sub_1DA989BD8()
{
  return MEMORY[0x1F41498E0]();
}

uint64_t sub_1DA989BE8()
{
  return MEMORY[0x1F41498F8]();
}

uint64_t sub_1DA989BF8()
{
  return MEMORY[0x1F4149900]();
}

uint64_t sub_1DA989C08()
{
  return MEMORY[0x1F4149908]();
}

uint64_t sub_1DA989C18()
{
  return MEMORY[0x1F4149910]();
}

uint64_t sub_1DA989C28()
{
  return MEMORY[0x1F4149918]();
}

uint64_t sub_1DA989C38()
{
  return MEMORY[0x1F4149920]();
}

uint64_t sub_1DA989C48()
{
  return MEMORY[0x1F4149928]();
}

uint64_t sub_1DA989C58()
{
  return MEMORY[0x1F4149938]();
}

uint64_t sub_1DA989C68()
{
  return MEMORY[0x1F4149940]();
}

uint64_t sub_1DA989C78()
{
  return MEMORY[0x1F4149948]();
}

uint64_t sub_1DA989C88()
{
  return MEMORY[0x1F4149950]();
}

uint64_t sub_1DA989C98()
{
  return MEMORY[0x1F4149958]();
}

uint64_t sub_1DA989CA8()
{
  return MEMORY[0x1F4149960]();
}

uint64_t sub_1DA989CB8()
{
  return MEMORY[0x1F4149968]();
}

uint64_t sub_1DA989CC8()
{
  return MEMORY[0x1F4149970]();
}

uint64_t sub_1DA989CD8()
{
  return MEMORY[0x1F4149978]();
}

uint64_t sub_1DA989CE8()
{
  return MEMORY[0x1F4149A08]();
}

uint64_t sub_1DA989CF8()
{
  return MEMORY[0x1F4149A10]();
}

uint64_t sub_1DA989D08()
{
  return MEMORY[0x1F4149A18]();
}

uint64_t sub_1DA989D18()
{
  return MEMORY[0x1F4149A20]();
}

uint64_t sub_1DA989D28()
{
  return MEMORY[0x1F4149AF8]();
}

uint64_t sub_1DA989D38()
{
  return MEMORY[0x1F4149B00]();
}

uint64_t sub_1DA989D48()
{
  return MEMORY[0x1F4149B08]();
}

uint64_t sub_1DA989D58()
{
  return MEMORY[0x1F4149B10]();
}

uint64_t sub_1DA989D68()
{
  return MEMORY[0x1F4149B18]();
}

uint64_t sub_1DA989D78()
{
  return MEMORY[0x1F4149B20]();
}

uint64_t sub_1DA989D88()
{
  return MEMORY[0x1F4149B30]();
}

uint64_t sub_1DA989D98()
{
  return MEMORY[0x1F4149B38]();
}

uint64_t sub_1DA989DA8()
{
  return MEMORY[0x1F4149B40]();
}

uint64_t sub_1DA989DB8()
{
  return MEMORY[0x1F4149B50]();
}

uint64_t sub_1DA989DC8()
{
  return MEMORY[0x1F4149B60]();
}

uint64_t sub_1DA989DD8()
{
  return MEMORY[0x1F4149B78]();
}

uint64_t sub_1DA989DE8()
{
  return MEMORY[0x1F4149B80]();
}

uint64_t sub_1DA989DF8()
{
  return MEMORY[0x1F41879F0]();
}

uint64_t sub_1DA989E08()
{
  return MEMORY[0x1F4187A18]();
}

uint64_t sub_1DA989E18()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1DA989E28()
{
  return MEMORY[0x1F4188508]();
}

uint64_t sub_1DA989E38()
{
  return MEMORY[0x1F4188510]();
}

uint64_t sub_1DA989E48()
{
  return MEMORY[0x1F4188560]();
}

uint64_t sub_1DA989E58()
{
  return MEMORY[0x1F4188570]();
}

uint64_t sub_1DA989E68()
{
  return MEMORY[0x1F4188578]();
}

uint64_t sub_1DA989E78()
{
  return MEMORY[0x1F4188580]();
}

uint64_t sub_1DA989E88()
{
  return MEMORY[0x1F4188588]();
}

uint64_t sub_1DA989E98()
{
  return MEMORY[0x1F4188590]();
}

uint64_t sub_1DA989EA8()
{
  return MEMORY[0x1F41885B0]();
}

uint64_t sub_1DA989EB8()
{
  return MEMORY[0x1F41885D0]();
}

uint64_t sub_1DA989EC8()
{
  return MEMORY[0x1F41885E0]();
}

uint64_t sub_1DA989ED8()
{
  return MEMORY[0x1F4188650]();
}

uint64_t sub_1DA989EE8()
{
  return MEMORY[0x1F4188658]();
}

uint64_t sub_1DA989EF8()
{
  return MEMORY[0x1F4188660]();
}

uint64_t sub_1DA989F08()
{
  return MEMORY[0x1F4188668]();
}

uint64_t sub_1DA989F18()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DA989F28()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DA989F38()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DA989F48()
{
  return MEMORY[0x1F41886B0]();
}

uint64_t sub_1DA989F58()
{
  return MEMORY[0x1F4188490]();
}

uint64_t sub_1DA989F68()
{
  return MEMORY[0x1F41884A8]();
}

uint64_t sub_1DA989F78()
{
  return MEMORY[0x1F40D68C8]();
}

uint64_t sub_1DA989F88()
{
  return MEMORY[0x1F40D6918]();
}

uint64_t sub_1DA989F98()
{
  return MEMORY[0x1F40D6940]();
}

uint64_t sub_1DA989FA8()
{
  return MEMORY[0x1F40D6950]();
}

uint64_t sub_1DA989FB8()
{
  return MEMORY[0x1F40D6960]();
}

uint64_t sub_1DA989FC8()
{
  return MEMORY[0x1F40D6988]();
}

uint64_t sub_1DA989FD8()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1DA989FE8()
{
  return MEMORY[0x1F40D6A08]();
}

uint64_t sub_1DA989FF8()
{
  return MEMORY[0x1F40D6A18]();
}

uint64_t sub_1DA98A008()
{
  return MEMORY[0x1F40D6A20]();
}

uint64_t sub_1DA98A018()
{
  return MEMORY[0x1F40D6A28]();
}

uint64_t sub_1DA98A028()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1DA98A038()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1DA98A048()
{
  return MEMORY[0x1F40D6AB0]();
}

uint64_t sub_1DA98A058()
{
  return MEMORY[0x1F40D6AB8]();
}

uint64_t sub_1DA98A068()
{
  return MEMORY[0x1F40D6AC0]();
}

uint64_t sub_1DA98A078()
{
  return MEMORY[0x1F40D6B68]();
}

uint64_t sub_1DA98A088()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1DA98A098()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1DA98A0A8()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1DA98A0B8()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1DA98A0C8()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1DA98A0D8()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1DA98A0E8()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1DA98A0F8()
{
  return MEMORY[0x1F40D6BD8]();
}

uint64_t sub_1DA98A108()
{
  return MEMORY[0x1F40D6BE0]();
}

uint64_t sub_1DA98A118()
{
  return MEMORY[0x1F40D6C10]();
}

uint64_t sub_1DA98A128()
{
  return MEMORY[0x1F40D6C50]();
}

uint64_t sub_1DA98A138()
{
  return MEMORY[0x1F40D6C98]();
}

uint64_t sub_1DA98A148()
{
  return MEMORY[0x1F40D6D10]();
}

uint64_t sub_1DA98A158()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1DA98A168()
{
  return MEMORY[0x1F40D6D90]();
}

uint64_t sub_1DA98A178()
{
  return MEMORY[0x1F40D6DA0]();
}

uint64_t sub_1DA98A188()
{
  return MEMORY[0x1F40D6DB8]();
}

uint64_t sub_1DA98A198()
{
  return MEMORY[0x1F40D6DF0]();
}

uint64_t sub_1DA98A1A8()
{
  return MEMORY[0x1F40D6E18]();
}

uint64_t sub_1DA98A1B8()
{
  return MEMORY[0x1F40D6E28]();
}

uint64_t sub_1DA98A1C8()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_1DA98A1D8()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_1DA98A1E8()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1DA98A1F8()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1DA98A208()
{
  return MEMORY[0x1F40F80D8]();
}

uint64_t sub_1DA98A218()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1DA98A228()
{
  return MEMORY[0x1F40F8220]();
}

uint64_t sub_1DA98A238()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1DA98A248()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1DA98A258()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1DA98A268()
{
  return MEMORY[0x1F40F83D8]();
}

uint64_t sub_1DA98A278()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1DA98A288()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1DA98A298()
{
  return MEMORY[0x1F40F8550]();
}

uint64_t sub_1DA98A2A8()
{
  return MEMORY[0x1F40F8560]();
}

uint64_t sub_1DA98A2B8()
{
  return MEMORY[0x1F40F8578]();
}

uint64_t sub_1DA98A2C8()
{
  return MEMORY[0x1F40F85B0]();
}

uint64_t sub_1DA98A2D8()
{
  return MEMORY[0x1F40F85B8]();
}

uint64_t sub_1DA98A2E8()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1DA98A2F8()
{
  return MEMORY[0x1F40F8728]();
}

uint64_t sub_1DA98A308()
{
  return MEMORY[0x1F40F8738]();
}

uint64_t sub_1DA98A318()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1DA98A328()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_1DA98A338()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_1DA98A348()
{
  return MEMORY[0x1F40F8938]();
}

uint64_t sub_1DA98A358()
{
  return MEMORY[0x1F40F8940]();
}

uint64_t sub_1DA98A368()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1DA98A378()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_1DA98A388()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1DA98A398()
{
  return MEMORY[0x1F40F8CE0]();
}

uint64_t sub_1DA98A3A8()
{
  return MEMORY[0x1F40F8DB0]();
}

uint64_t sub_1DA98A3B8()
{
  return MEMORY[0x1F40F8E18]();
}

uint64_t sub_1DA98A3C8()
{
  return MEMORY[0x1F40F8E30]();
}

uint64_t sub_1DA98A3D8()
{
  return MEMORY[0x1F40F8E38]();
}

uint64_t sub_1DA98A3E8()
{
  return MEMORY[0x1F40F8E50]();
}

uint64_t sub_1DA98A3F8()
{
  return MEMORY[0x1F40F8E70]();
}

uint64_t sub_1DA98A408()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1DA98A418()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1DA98A428()
{
  return MEMORY[0x1F40F8F68]();
}

uint64_t sub_1DA98A438()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1DA98A448()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1DA98A458()
{
  return MEMORY[0x1F40F9150]();
}

uint64_t sub_1DA98A468()
{
  return MEMORY[0x1F40F9178]();
}

uint64_t sub_1DA98A478()
{
  return MEMORY[0x1F40F91C0]();
}

uint64_t sub_1DA98A488()
{
  return MEMORY[0x1F40F91C8]();
}

uint64_t sub_1DA98A498()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1DA98A4A8()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1DA98A4B8()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1DA98A4C8()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_1DA98A4D8()
{
  return MEMORY[0x1F40F92F8]();
}

uint64_t sub_1DA98A4E8()
{
  return MEMORY[0x1F40F9300]();
}

uint64_t sub_1DA98A4F8()
{
  return MEMORY[0x1F40F9320]();
}

uint64_t sub_1DA98A508()
{
  return MEMORY[0x1F40F9328]();
}

uint64_t sub_1DA98A518()
{
  return MEMORY[0x1F40F9330]();
}

uint64_t sub_1DA98A528()
{
  return MEMORY[0x1F40F9398]();
}

uint64_t sub_1DA98A538()
{
  return MEMORY[0x1F40F93A0]();
}

uint64_t sub_1DA98A548()
{
  return MEMORY[0x1F40F9418]();
}

uint64_t sub_1DA98A558()
{
  return MEMORY[0x1F40F94D0]();
}

uint64_t sub_1DA98A568()
{
  return MEMORY[0x1F40F94D8]();
}

uint64_t sub_1DA98A578()
{
  return MEMORY[0x1F40F94E0]();
}

uint64_t sub_1DA98A588()
{
  return MEMORY[0x1F40F94E8]();
}

uint64_t sub_1DA98A598()
{
  return MEMORY[0x1F40F9518]();
}

uint64_t sub_1DA98A5A8()
{
  return MEMORY[0x1F40F9520]();
}

uint64_t sub_1DA98A5B8()
{
  return MEMORY[0x1F40F9528]();
}

uint64_t sub_1DA98A5C8()
{
  return MEMORY[0x1F40F9530]();
}

uint64_t sub_1DA98A5D8()
{
  return MEMORY[0x1F40F9540]();
}

uint64_t sub_1DA98A5E8()
{
  return MEMORY[0x1F40F9548]();
}

uint64_t sub_1DA98A5F8()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1DA98A608()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1DA98A618()
{
  return MEMORY[0x1F40F9598]();
}

uint64_t sub_1DA98A628()
{
  return MEMORY[0x1F40F95D0]();
}

uint64_t sub_1DA98A638()
{
  return MEMORY[0x1F40F9630]();
}

uint64_t sub_1DA98A648()
{
  return MEMORY[0x1F4103EE0]();
}

uint64_t sub_1DA98A658()
{
  return MEMORY[0x1F4103F08]();
}

uint64_t sub_1DA98A668()
{
  return MEMORY[0x1F4103F18]();
}

uint64_t sub_1DA98A678()
{
  return MEMORY[0x1F4103F20]();
}

uint64_t sub_1DA98A688()
{
  return MEMORY[0x1F4103F30]();
}

uint64_t sub_1DA98A698()
{
  return MEMORY[0x1F4103F40]();
}

uint64_t sub_1DA98A6A8()
{
  return MEMORY[0x1F4103F50]();
}

uint64_t sub_1DA98A6B8()
{
  return MEMORY[0x1F4103F58]();
}

uint64_t sub_1DA98A6C8()
{
  return MEMORY[0x1F4103F60]();
}

uint64_t sub_1DA98A6D8()
{
  return MEMORY[0x1F4103F68]();
}

uint64_t sub_1DA98A6E8()
{
  return MEMORY[0x1F4103F70]();
}

uint64_t sub_1DA98A6F8()
{
  return MEMORY[0x1F4103F78]();
}

uint64_t sub_1DA98A708()
{
  return MEMORY[0x1F4103F80]();
}

uint64_t sub_1DA98A718()
{
  return MEMORY[0x1F4103F88]();
}

uint64_t sub_1DA98A728()
{
  return MEMORY[0x1F4103F98]();
}

uint64_t sub_1DA98A738()
{
  return MEMORY[0x1F4103FA0]();
}

uint64_t sub_1DA98A748()
{
  return MEMORY[0x1F4103FA8]();
}

uint64_t sub_1DA98A758()
{
  return MEMORY[0x1F4103FD0]();
}

uint64_t sub_1DA98A768()
{
  return MEMORY[0x1F4103FD8]();
}

uint64_t sub_1DA98A778()
{
  return MEMORY[0x1F4103FE0]();
}

uint64_t sub_1DA98A788()
{
  return MEMORY[0x1F4103FE8]();
}

uint64_t sub_1DA98A798()
{
  return MEMORY[0x1F4103FF0]();
}

uint64_t sub_1DA98A7A8()
{
  return MEMORY[0x1F4103FF8]();
}

uint64_t sub_1DA98A7B8()
{
  return MEMORY[0x1F4104020]();
}

uint64_t sub_1DA98A7C8()
{
  return MEMORY[0x1F4104028]();
}

uint64_t sub_1DA98A7D8()
{
  return MEMORY[0x1F4104030]();
}

uint64_t sub_1DA98A7E8()
{
  return MEMORY[0x1F4104038]();
}

uint64_t sub_1DA98A7F8()
{
  return MEMORY[0x1F4104050]();
}

uint64_t sub_1DA98A808()
{
  return MEMORY[0x1F4104058]();
}

uint64_t sub_1DA98A818()
{
  return MEMORY[0x1F4104060]();
}

uint64_t sub_1DA98A828()
{
  return MEMORY[0x1F4104068]();
}

uint64_t sub_1DA98A838()
{
  return MEMORY[0x1F4104070]();
}

uint64_t sub_1DA98A848()
{
  return MEMORY[0x1F4104078]();
}

uint64_t sub_1DA98A858()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1DA98A868()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1DA98A878()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1DA98A888()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1DA98A898()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1DA98A8A8()
{
  return MEMORY[0x1F40F99C8]();
}

uint64_t sub_1DA98A8B8()
{
  return MEMORY[0x1F40F9A58]();
}

uint64_t sub_1DA98A8C8()
{
  return MEMORY[0x1F40F9A60]();
}

uint64_t sub_1DA98A8D8()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_1DA98A8E8()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1DA98A8F8()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1DA98A908()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1DA98A918()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1DA98A928()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1DA98A938()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1DA98A948()
{
  return MEMORY[0x1F40F9B90]();
}

uint64_t sub_1DA98A958()
{
  return MEMORY[0x1F40F9B98]();
}

uint64_t sub_1DA98A968()
{
  return MEMORY[0x1F40F9BA0]();
}

uint64_t sub_1DA98A978()
{
  return MEMORY[0x1F40F9BA8]();
}

uint64_t sub_1DA98A988()
{
  return MEMORY[0x1F40F9C78]();
}

uint64_t sub_1DA98A998()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1DA98A9A8()
{
  return MEMORY[0x1F40F9CC8]();
}

uint64_t sub_1DA98A9B8()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1DA98A9C8()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1DA98A9D8()
{
  return MEMORY[0x1F40F9CF0]();
}

uint64_t sub_1DA98A9E8()
{
  return MEMORY[0x1F40F9D98]();
}

uint64_t sub_1DA98A9F8()
{
  return MEMORY[0x1F40F9DF0]();
}

uint64_t sub_1DA98AA08()
{
  return MEMORY[0x1F40F9DF8]();
}

uint64_t sub_1DA98AA18()
{
  return MEMORY[0x1F40F9E00]();
}

uint64_t sub_1DA98AA28()
{
  return MEMORY[0x1F40F9E10]();
}

uint64_t sub_1DA98AA38()
{
  return MEMORY[0x1F40F9E28]();
}

uint64_t sub_1DA98AA48()
{
  return MEMORY[0x1F40F9E30]();
}

uint64_t sub_1DA98AA58()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1DA98AA68()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1DA98AA78()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1DA98AA88()
{
  return MEMORY[0x1F40FA320]();
}

uint64_t sub_1DA98AA98()
{
  return MEMORY[0x1F40FA328]();
}

uint64_t sub_1DA98AAA8()
{
  return MEMORY[0x1F40FA330]();
}

uint64_t sub_1DA98AAB8()
{
  return MEMORY[0x1F40FA338]();
}

uint64_t sub_1DA98AAC8()
{
  return MEMORY[0x1F40FA3B8]();
}

uint64_t sub_1DA98AAD8()
{
  return MEMORY[0x1F40FA498]();
}

uint64_t sub_1DA98AAE8()
{
  return MEMORY[0x1F40FA4A0]();
}

uint64_t sub_1DA98AAF8()
{
  return MEMORY[0x1F40FA4A8]();
}

uint64_t sub_1DA98AB08()
{
  return MEMORY[0x1F40FA4B0]();
}

uint64_t sub_1DA98AB18()
{
  return MEMORY[0x1F40FA4B8]();
}

uint64_t sub_1DA98AB28()
{
  return MEMORY[0x1F40FA4C0]();
}

uint64_t sub_1DA98AB38()
{
  return MEMORY[0x1F40FA4C8]();
}

uint64_t sub_1DA98AB48()
{
  return MEMORY[0x1F40FA4D0]();
}

uint64_t sub_1DA98AB58()
{
  return MEMORY[0x1F40FA4D8]();
}

uint64_t sub_1DA98AB68()
{
  return MEMORY[0x1F40FA4E0]();
}

uint64_t sub_1DA98AB78()
{
  return MEMORY[0x1F40FA4E8]();
}

uint64_t sub_1DA98AB88()
{
  return MEMORY[0x1F40FA4F0]();
}

uint64_t sub_1DA98AB98()
{
  return MEMORY[0x1F40FA678]();
}

uint64_t sub_1DA98ABA8()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1DA98ABB8()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1DA98ABC8()
{
  return MEMORY[0x1F40FA980]();
}

uint64_t sub_1DA98ABD8()
{
  return MEMORY[0x1F40FA988]();
}

uint64_t sub_1DA98ABE8()
{
  return MEMORY[0x1F40FA990]();
}

uint64_t sub_1DA98ABF8()
{
  return MEMORY[0x1F40FA998]();
}

uint64_t sub_1DA98AC08()
{
  return MEMORY[0x1F40FA9A0]();
}

uint64_t sub_1DA98AC18()
{
  return MEMORY[0x1F40FA9A8]();
}

uint64_t sub_1DA98AC28()
{
  return MEMORY[0x1F40FA9B0]();
}

uint64_t sub_1DA98AC38()
{
  return MEMORY[0x1F40FA9B8]();
}

uint64_t sub_1DA98AC48()
{
  return MEMORY[0x1F40FA9D0]();
}

uint64_t sub_1DA98AC58()
{
  return MEMORY[0x1F40FA9D8]();
}

uint64_t sub_1DA98AC68()
{
  return MEMORY[0x1F40FA9E0]();
}

uint64_t sub_1DA98AC78()
{
  return MEMORY[0x1F40FA9E8]();
}

uint64_t sub_1DA98AC88()
{
  return MEMORY[0x1F40FA9F0]();
}

uint64_t sub_1DA98AC98()
{
  return MEMORY[0x1F40FA9F8]();
}

uint64_t sub_1DA98ACA8()
{
  return MEMORY[0x1F40FAA00]();
}

uint64_t sub_1DA98ACB8()
{
  return MEMORY[0x1F40FAA10]();
}

uint64_t sub_1DA98ACC8()
{
  return MEMORY[0x1F40FAA18]();
}

uint64_t sub_1DA98ACD8()
{
  return MEMORY[0x1F41040B8]();
}

uint64_t sub_1DA98ACE8()
{
  return MEMORY[0x1F41040C0]();
}

uint64_t sub_1DA98ACF8()
{
  return MEMORY[0x1F40FAA78]();
}

uint64_t sub_1DA98AD08()
{
  return MEMORY[0x1F40FAA80]();
}

uint64_t sub_1DA98AD18()
{
  return MEMORY[0x1F40FAA88]();
}

uint64_t sub_1DA98AD28()
{
  return MEMORY[0x1F40FAA90]();
}

uint64_t sub_1DA98AD38()
{
  return MEMORY[0x1F40FABE8]();
}

uint64_t sub_1DA98AD48()
{
  return MEMORY[0x1F40FAD30]();
}

uint64_t sub_1DA98AD58()
{
  return MEMORY[0x1F40FAD38]();
}

uint64_t sub_1DA98AD68()
{
  return MEMORY[0x1F40FAD40]();
}

uint64_t sub_1DA98AD78()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1DA98AD88()
{
  return MEMORY[0x1F40FAD78]();
}

uint64_t sub_1DA98AD98()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1DA98ADA8()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1DA98ADB8()
{
  return MEMORY[0x1F40FAE78]();
}

uint64_t sub_1DA98ADC8()
{
  return MEMORY[0x1F40FAE80]();
}

uint64_t sub_1DA98ADD8()
{
  return MEMORY[0x1F40FAE88]();
}

uint64_t sub_1DA98ADE8()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1DA98ADF8()
{
  return MEMORY[0x1F40FAF28]();
}

uint64_t sub_1DA98AE08()
{
  return MEMORY[0x1F40FAF40]();
}

uint64_t sub_1DA98AE18()
{
  return MEMORY[0x1F40FAF58]();
}

uint64_t sub_1DA98AE28()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1DA98AE38()
{
  return MEMORY[0x1F40FAFD0]();
}

uint64_t sub_1DA98AE48()
{
  return MEMORY[0x1F40FAFE0]();
}

uint64_t sub_1DA98AE58()
{
  return MEMORY[0x1F40FAFF0]();
}

uint64_t sub_1DA98AE68()
{
  return MEMORY[0x1F40FB010]();
}

uint64_t sub_1DA98AE78()
{
  return MEMORY[0x1F40FB028]();
}

uint64_t sub_1DA98AE88()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1DA98AE98()
{
  return MEMORY[0x1F40FB088]();
}

uint64_t sub_1DA98AEA8()
{
  return MEMORY[0x1F40FB0F0]();
}

uint64_t sub_1DA98AEB8()
{
  return MEMORY[0x1F40FB108]();
}

uint64_t sub_1DA98AEC8()
{
  return MEMORY[0x1F40FB118]();
}

uint64_t sub_1DA98AED8()
{
  return MEMORY[0x1F40FB300]();
}

uint64_t sub_1DA98AEE8()
{
  return MEMORY[0x1F40FB3B0]();
}

uint64_t sub_1DA98AEF8()
{
  return MEMORY[0x1F40FB3C0]();
}

uint64_t sub_1DA98AF08()
{
  return MEMORY[0x1F40FB3F8]();
}

uint64_t sub_1DA98AF18()
{
  return MEMORY[0x1F40FB408]();
}

uint64_t sub_1DA98AF28()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1DA98AF38()
{
  return MEMORY[0x1F40FB478]();
}

uint64_t sub_1DA98AF48()
{
  return MEMORY[0x1F40FB4C0]();
}

uint64_t sub_1DA98AF58()
{
  return MEMORY[0x1F40FB4E0]();
}

uint64_t sub_1DA98AF68()
{
  return MEMORY[0x1F40FB520]();
}

uint64_t sub_1DA98AF78()
{
  return MEMORY[0x1F40FB530]();
}

uint64_t sub_1DA98AF88()
{
  return MEMORY[0x1F40FB548]();
}

uint64_t sub_1DA98AF98()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1DA98AFA8()
{
  return MEMORY[0x1F40FB560]();
}

uint64_t sub_1DA98AFB8()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1DA98AFC8()
{
  return MEMORY[0x1F40FB598]();
}

uint64_t sub_1DA98AFD8()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1DA98AFE8()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1DA98AFF8()
{
  return MEMORY[0x1F40FB638]();
}

uint64_t sub_1DA98B008()
{
  return MEMORY[0x1F40FB648]();
}

uint64_t sub_1DA98B018()
{
  return MEMORY[0x1F40FB720]();
}

uint64_t sub_1DA98B028()
{
  return MEMORY[0x1F40FB7F8]();
}

uint64_t sub_1DA98B038()
{
  return MEMORY[0x1F40FB800]();
}

uint64_t sub_1DA98B048()
{
  return MEMORY[0x1F40FB828]();
}

uint64_t sub_1DA98B058()
{
  return MEMORY[0x1F40FB850]();
}

uint64_t sub_1DA98B068()
{
  return MEMORY[0x1F40FB8F8]();
}

uint64_t sub_1DA98B078()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1DA98B088()
{
  return MEMORY[0x1F40FB950]();
}

uint64_t sub_1DA98B098()
{
  return MEMORY[0x1F40FB9C8]();
}

uint64_t sub_1DA98B0A8()
{
  return MEMORY[0x1F40FBB00]();
}

uint64_t sub_1DA98B0B8()
{
  return MEMORY[0x1F40FBB98]();
}

uint64_t sub_1DA98B0C8()
{
  return MEMORY[0x1F40FBBB0]();
}

uint64_t sub_1DA98B0D8()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_1DA98B0E8()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1DA98B0F8()
{
  return MEMORY[0x1F40FBDB0]();
}

uint64_t sub_1DA98B108()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1DA98B118()
{
  return MEMORY[0x1F40FC098]();
}

uint64_t sub_1DA98B128()
{
  return MEMORY[0x1F40FC0B0]();
}

uint64_t sub_1DA98B138()
{
  return MEMORY[0x1F40FC0C0]();
}

uint64_t sub_1DA98B148()
{
  return MEMORY[0x1F40FC0F0]();
}

uint64_t sub_1DA98B158()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1DA98B168()
{
  return MEMORY[0x1F40FC190]();
}

uint64_t sub_1DA98B178()
{
  return MEMORY[0x1F40FC2D8]();
}

uint64_t sub_1DA98B188()
{
  return MEMORY[0x1F40FC310]();
}

uint64_t sub_1DA98B198()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_1DA98B1A8()
{
  return MEMORY[0x1F40FC368]();
}

uint64_t sub_1DA98B1B8()
{
  return MEMORY[0x1F40FC370]();
}

uint64_t sub_1DA98B1C8()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1DA98B1D8()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1DA98B1E8()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1DA98B1F8()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_1DA98B208()
{
  return MEMORY[0x1F40FC4A8]();
}

uint64_t sub_1DA98B218()
{
  return MEMORY[0x1F40FC4C0]();
}

uint64_t sub_1DA98B228()
{
  return MEMORY[0x1F40FC4E8]();
}

uint64_t sub_1DA98B238()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1DA98B248()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1DA98B258()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1DA98B268()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1DA98B278()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1DA98B288()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1DA98B298()
{
  return MEMORY[0x1F40FC7C8]();
}

uint64_t sub_1DA98B2A8()
{
  return MEMORY[0x1F40FC7D0]();
}

uint64_t sub_1DA98B2B8()
{
  return MEMORY[0x1F40FC7E8]();
}

uint64_t sub_1DA98B2C8()
{
  return MEMORY[0x1F40FC7F8]();
}

uint64_t sub_1DA98B2D8()
{
  return MEMORY[0x1F40FC808]();
}

uint64_t sub_1DA98B2E8()
{
  return MEMORY[0x1F40FC820]();
}

uint64_t sub_1DA98B2F8()
{
  return MEMORY[0x1F40FC830]();
}

uint64_t sub_1DA98B308()
{
  return MEMORY[0x1F40FC8B8]();
}

uint64_t sub_1DA98B318()
{
  return MEMORY[0x1F40FC8C8]();
}

uint64_t sub_1DA98B328()
{
  return MEMORY[0x1F40FC8E0]();
}

uint64_t sub_1DA98B338()
{
  return MEMORY[0x1F40FC8E8]();
}

uint64_t sub_1DA98B348()
{
  return MEMORY[0x1F40FC8F8]();
}

uint64_t sub_1DA98B358()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1DA98B368()
{
  return MEMORY[0x1F40FC970]();
}

uint64_t sub_1DA98B378()
{
  return MEMORY[0x1F40FC9D0]();
}

uint64_t sub_1DA98B388()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_1DA98B398()
{
  return MEMORY[0x1F40FCC20]();
}

uint64_t sub_1DA98B3A8()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1DA98B3B8()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1DA98B3C8()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_1DA98B3D8()
{
  return MEMORY[0x1F40FCC88]();
}

uint64_t sub_1DA98B3E8()
{
  return MEMORY[0x1F40FCD10]();
}

uint64_t sub_1DA98B3F8()
{
  return MEMORY[0x1F40FCE58]();
}

uint64_t sub_1DA98B408()
{
  return MEMORY[0x1F40FCE60]();
}

uint64_t sub_1DA98B418()
{
  return MEMORY[0x1F40FCE88]();
}

uint64_t sub_1DA98B428()
{
  return MEMORY[0x1F4186C60]();
}

uint64_t sub_1DA98B438()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1DA98B448()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t _s9ChronoKit16LayerSnapshotterC8snapshot7request16qualityOfService17completionHandleryAA15SnapshotRequestVyAC09SupportedC0OG_8Dispatch0O3QoSVyAC6ResultOctFfA0__0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1DA98B468()
{
  return MEMORY[0x1F4186D08]();
}

uint64_t sub_1DA98B478()
{
  return MEMORY[0x1F4186D18]();
}

uint64_t sub_1DA98B488()
{
  return MEMORY[0x1F4186D28]();
}

uint64_t sub_1DA98B498()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1DA98B4A8()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DA98B4B8()
{
  return MEMORY[0x1F4186E10]();
}

uint64_t sub_1DA98B4C8()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1DA98B4D8()
{
  return MEMORY[0x1F4186E38]();
}

uint64_t sub_1DA98B4E8()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1DA98B4F8()
{
  return MEMORY[0x1F4186E68]();
}

uint64_t sub_1DA98B518()
{
  return MEMORY[0x1F4186E80]();
}

uint64_t sub_1DA98B528()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1DA98B538()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1DA98B548()
{
  return MEMORY[0x1F4104108]();
}

uint64_t sub_1DA98B558()
{
  return MEMORY[0x1F4104128]();
}

uint64_t sub_1DA98B568()
{
  return MEMORY[0x1F4104130]();
}

uint64_t sub_1DA98B578()
{
  return MEMORY[0x1F4104158]();
}

uint64_t sub_1DA98B588()
{
  return MEMORY[0x1F4104160]();
}

uint64_t sub_1DA98B598()
{
  return MEMORY[0x1F4104170]();
}

uint64_t sub_1DA98B5A8()
{
  return MEMORY[0x1F4104178]();
}

uint64_t sub_1DA98B5B8()
{
  return MEMORY[0x1F4104180]();
}

uint64_t sub_1DA98B5C8()
{
  return MEMORY[0x1F4104198]();
}

uint64_t sub_1DA98B5D8()
{
  return MEMORY[0x1F41041A0]();
}

uint64_t sub_1DA98B5E8()
{
  return MEMORY[0x1F41041A8]();
}

uint64_t sub_1DA98B5F8()
{
  return MEMORY[0x1F41041B0]();
}

uint64_t sub_1DA98B608()
{
  return MEMORY[0x1F41041B8]();
}

uint64_t sub_1DA98B618()
{
  return MEMORY[0x1F41041C0]();
}

uint64_t sub_1DA98B628()
{
  return MEMORY[0x1F41041C8]();
}

uint64_t sub_1DA98B638()
{
  return MEMORY[0x1F41041D0]();
}

uint64_t sub_1DA98B648()
{
  return MEMORY[0x1F41041D8]();
}

uint64_t sub_1DA98B658()
{
  return MEMORY[0x1F41041F8]();
}

uint64_t sub_1DA98B668()
{
  return MEMORY[0x1F4104200]();
}

uint64_t sub_1DA98B678()
{
  return MEMORY[0x1F4104208]();
}

uint64_t sub_1DA98B688()
{
  return MEMORY[0x1F4104228]();
}

uint64_t sub_1DA98B698()
{
  return MEMORY[0x1F4104230]();
}

uint64_t sub_1DA98B6A8()
{
  return MEMORY[0x1F4104238]();
}

uint64_t sub_1DA98B6B8()
{
  return MEMORY[0x1F4104240]();
}

uint64_t sub_1DA98B6C8()
{
  return MEMORY[0x1F4104248]();
}

uint64_t sub_1DA98B6D8()
{
  return MEMORY[0x1F4104250]();
}

uint64_t sub_1DA98B6E8()
{
  return MEMORY[0x1F4104258]();
}

uint64_t sub_1DA98B6F8()
{
  return MEMORY[0x1F4104260]();
}

uint64_t sub_1DA98B708()
{
  return MEMORY[0x1F4104268]();
}

uint64_t sub_1DA98B738()
{
  return MEMORY[0x1F41042A0]();
}

uint64_t sub_1DA98B748()
{
  return MEMORY[0x1F41042B0]();
}

uint64_t sub_1DA98B758()
{
  return MEMORY[0x1F41042C0]();
}

uint64_t sub_1DA98B768()
{
  return MEMORY[0x1F41042C8]();
}

uint64_t sub_1DA98B778()
{
  return MEMORY[0x1F41042D0]();
}

uint64_t sub_1DA98B788()
{
  return MEMORY[0x1F41042E8]();
}

uint64_t sub_1DA98B798()
{
  return MEMORY[0x1F41042F0]();
}

uint64_t sub_1DA98B7A8()
{
  return MEMORY[0x1F41042F8]();
}

uint64_t sub_1DA98B7B8()
{
  return MEMORY[0x1F4104300]();
}

uint64_t sub_1DA98B7C8()
{
  return MEMORY[0x1F4104320]();
}

uint64_t sub_1DA98B7D8()
{
  return MEMORY[0x1F4104328]();
}

uint64_t sub_1DA98B7E8()
{
  return MEMORY[0x1F4104330]();
}

uint64_t sub_1DA98B7F8()
{
  return MEMORY[0x1F4104338]();
}

uint64_t sub_1DA98B808()
{
  return MEMORY[0x1F4104348]();
}

uint64_t sub_1DA98B818()
{
  return MEMORY[0x1F4104350]();
}

uint64_t sub_1DA98B828()
{
  return MEMORY[0x1F41043E0]();
}

uint64_t sub_1DA98B838()
{
  return MEMORY[0x1F41043E8]();
}

uint64_t sub_1DA98B848()
{
  return MEMORY[0x1F41043F0]();
}

uint64_t sub_1DA98B858()
{
  return MEMORY[0x1F4104400]();
}

uint64_t sub_1DA98B868()
{
  return MEMORY[0x1F4104408]();
}

uint64_t sub_1DA98B878()
{
  return MEMORY[0x1F4104410]();
}

uint64_t sub_1DA98B888()
{
  return MEMORY[0x1F4104418]();
}

uint64_t sub_1DA98B898()
{
  return MEMORY[0x1F4104420]();
}

uint64_t sub_1DA98B8A8()
{
  return MEMORY[0x1F4104428]();
}

uint64_t sub_1DA98B8B8()
{
  return MEMORY[0x1F4104430]();
}

uint64_t sub_1DA98B8C8()
{
  return MEMORY[0x1F4104438]();
}

uint64_t sub_1DA98B8D8()
{
  return MEMORY[0x1F4104448]();
}

uint64_t sub_1DA98B8E8()
{
  return MEMORY[0x1F4104450]();
}

uint64_t sub_1DA98B8F8()
{
  return MEMORY[0x1F4104458]();
}

uint64_t sub_1DA98B908()
{
  return MEMORY[0x1F41044B8]();
}

uint64_t sub_1DA98B918()
{
  return MEMORY[0x1F41044D8]();
}

uint64_t sub_1DA98B928()
{
  return MEMORY[0x1F41044E8]();
}

uint64_t sub_1DA98B938()
{
  return MEMORY[0x1F41044F8]();
}

uint64_t sub_1DA98B948()
{
  return MEMORY[0x1F4104518]();
}

uint64_t sub_1DA98B958()
{
  return MEMORY[0x1F4104560]();
}

uint64_t sub_1DA98B968()
{
  return MEMORY[0x1F41045B8]();
}

uint64_t sub_1DA98B978()
{
  return MEMORY[0x1F41045E0]();
}

uint64_t sub_1DA98B988()
{
  return MEMORY[0x1F41045E8]();
}

uint64_t sub_1DA98B998()
{
  return MEMORY[0x1F41045F0]();
}

uint64_t sub_1DA98B9A8()
{
  return MEMORY[0x1F41045F8]();
}

uint64_t sub_1DA98B9B8()
{
  return MEMORY[0x1F4104630]();
}

uint64_t sub_1DA98B9C8()
{
  return MEMORY[0x1F4104648]();
}

uint64_t sub_1DA98B9D8()
{
  return MEMORY[0x1F4104650]();
}

uint64_t sub_1DA98B9E8()
{
  return MEMORY[0x1F4104658]();
}

uint64_t sub_1DA98B9F8()
{
  return MEMORY[0x1F4104660]();
}

uint64_t sub_1DA98BA08()
{
  return MEMORY[0x1F4104668]();
}

uint64_t sub_1DA98BA18()
{
  return MEMORY[0x1F4104678]();
}

uint64_t sub_1DA98BA28()
{
  return MEMORY[0x1F4104680]();
}

uint64_t sub_1DA98BA38()
{
  return MEMORY[0x1F41046A0]();
}

uint64_t sub_1DA98BA48()
{
  return MEMORY[0x1F41046B0]();
}

uint64_t sub_1DA98BA58()
{
  return MEMORY[0x1F41046B8]();
}

uint64_t sub_1DA98BA68()
{
  return MEMORY[0x1F41046D8]();
}

uint64_t sub_1DA98BA78()
{
  return MEMORY[0x1F4104868]();
}

uint64_t sub_1DA98BA88()
{
  return MEMORY[0x1F4104878]();
}

uint64_t sub_1DA98BA98()
{
  return MEMORY[0x1F4104880]();
}

uint64_t sub_1DA98BAA8()
{
  return MEMORY[0x1F4104888]();
}

uint64_t sub_1DA98BAB8()
{
  return MEMORY[0x1F4104890]();
}

uint64_t sub_1DA98BAC8()
{
  return MEMORY[0x1F4104898]();
}

uint64_t sub_1DA98BAD8()
{
  return MEMORY[0x1F41048A0]();
}

uint64_t sub_1DA98BAE8()
{
  return MEMORY[0x1F41048A8]();
}

uint64_t sub_1DA98BAF8()
{
  return MEMORY[0x1F41048B0]();
}

uint64_t sub_1DA98BB08()
{
  return MEMORY[0x1F41048B8]();
}

uint64_t sub_1DA98BB18()
{
  return MEMORY[0x1F41048C0]();
}

uint64_t sub_1DA98BB28()
{
  return MEMORY[0x1F41048C8]();
}

uint64_t sub_1DA98BB38()
{
  return MEMORY[0x1F4104938]();
}

uint64_t sub_1DA98BB48()
{
  return MEMORY[0x1F4104948]();
}

uint64_t sub_1DA98BB58()
{
  return MEMORY[0x1F4104950]();
}

uint64_t sub_1DA98BB68()
{
  return MEMORY[0x1F4104960]();
}

uint64_t sub_1DA98BB78()
{
  return MEMORY[0x1F4104970]();
}

uint64_t sub_1DA98BB88()
{
  return MEMORY[0x1F4104978]();
}

uint64_t sub_1DA98BB98()
{
  return MEMORY[0x1F4104988]();
}

uint64_t sub_1DA98BBA8()
{
  return MEMORY[0x1F41049A0]();
}

uint64_t sub_1DA98BBB8()
{
  return MEMORY[0x1F41049A8]();
}

uint64_t sub_1DA98BBC8()
{
  return MEMORY[0x1F41049B0]();
}

uint64_t sub_1DA98BBD8()
{
  return MEMORY[0x1F41049B8]();
}

uint64_t sub_1DA98BBE8()
{
  return MEMORY[0x1F41049C0]();
}

uint64_t sub_1DA98BBF8()
{
  return MEMORY[0x1F41049C8]();
}

uint64_t sub_1DA98BC08()
{
  return MEMORY[0x1F41049D0]();
}

uint64_t sub_1DA98BC18()
{
  return MEMORY[0x1F4104A00]();
}

uint64_t sub_1DA98BC28()
{
  return MEMORY[0x1F4104A18]();
}

uint64_t sub_1DA98BC38()
{
  return MEMORY[0x1F4104A28]();
}

uint64_t sub_1DA98BC48()
{
  return MEMORY[0x1F4104A30]();
}

uint64_t sub_1DA98BC58()
{
  return MEMORY[0x1F4104A38]();
}

uint64_t sub_1DA98BC68()
{
  return MEMORY[0x1F4104A40]();
}

uint64_t sub_1DA98BC78()
{
  return MEMORY[0x1F4104A48]();
}

uint64_t sub_1DA98BC88()
{
  return MEMORY[0x1F4104A58]();
}

uint64_t sub_1DA98BC98()
{
  return MEMORY[0x1F4104A70]();
}

uint64_t sub_1DA98BCA8()
{
  return MEMORY[0x1F4104AA8]();
}

uint64_t sub_1DA98BCB8()
{
  return MEMORY[0x1F4104AB0]();
}

uint64_t sub_1DA98BCC8()
{
  return MEMORY[0x1F4104AC0]();
}

uint64_t sub_1DA98BCD8()
{
  return MEMORY[0x1F4104AC8]();
}

uint64_t sub_1DA98BCE8()
{
  return MEMORY[0x1F4104AD0]();
}

uint64_t sub_1DA98BCF8()
{
  return MEMORY[0x1F4104AD8]();
}

uint64_t sub_1DA98BD08()
{
  return MEMORY[0x1F4104AE0]();
}

uint64_t sub_1DA98BD18()
{
  return MEMORY[0x1F4104AE8]();
}

uint64_t sub_1DA98BD28()
{
  return MEMORY[0x1F4104B00]();
}

uint64_t sub_1DA98BD38()
{
  return MEMORY[0x1F4104B18]();
}

uint64_t sub_1DA98BD48()
{
  return MEMORY[0x1F4104B20]();
}

uint64_t sub_1DA98BD58()
{
  return MEMORY[0x1F4104B28]();
}

uint64_t sub_1DA98BD68()
{
  return MEMORY[0x1F4104B40]();
}

uint64_t sub_1DA98BD78()
{
  return MEMORY[0x1F4104B48]();
}

uint64_t sub_1DA98BD88()
{
  return MEMORY[0x1F4104B50]();
}

uint64_t sub_1DA98BD98()
{
  return MEMORY[0x1F4104B68]();
}

uint64_t sub_1DA98BDA8()
{
  return MEMORY[0x1F4104B70]();
}

uint64_t sub_1DA98BDB8()
{
  return MEMORY[0x1F4104B78]();
}

uint64_t sub_1DA98BDC8()
{
  return MEMORY[0x1F4104B80]();
}

uint64_t sub_1DA98BDD8()
{
  return MEMORY[0x1F4104B88]();
}

uint64_t sub_1DA98BDE8()
{
  return MEMORY[0x1F4104B90]();
}

uint64_t sub_1DA98BDF8()
{
  return MEMORY[0x1F4104B98]();
}

uint64_t sub_1DA98BE08()
{
  return MEMORY[0x1F4104BA0]();
}

uint64_t sub_1DA98BE18()
{
  return MEMORY[0x1F4104BA8]();
}

uint64_t sub_1DA98BE28()
{
  return MEMORY[0x1F4104BB0]();
}

uint64_t sub_1DA98BE38()
{
  return MEMORY[0x1F4104BB8]();
}

uint64_t sub_1DA98BE48()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1DA98BE58()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1DA98BE68()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DA98BE78()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t sub_1DA98BE88()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DA98BE98()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1DA98BEA8()
{
  return MEMORY[0x1F4183320]();
}

uint64_t sub_1DA98BEB8()
{
  return MEMORY[0x1F4183348]();
}

uint64_t sub_1DA98BEC8()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1DA98BED8()
{
  return MEMORY[0x1F4183370]();
}

uint64_t sub_1DA98BEE8()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1DA98BEF8()
{
  return MEMORY[0x1F4183408]();
}

uint64_t sub_1DA98BF08()
{
  return MEMORY[0x1F4183420]();
}

uint64_t sub_1DA98BF18()
{
  return MEMORY[0x1F4183440]();
}

uint64_t sub_1DA98BF28()
{
  return MEMORY[0x1F4183468]();
}

uint64_t sub_1DA98BF38()
{
  return MEMORY[0x1F4183470]();
}

uint64_t sub_1DA98BF48()
{
  return MEMORY[0x1F4183480]();
}

uint64_t sub_1DA98BF58()
{
  return MEMORY[0x1F41834A0]();
}

uint64_t sub_1DA98BF68()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1DA98BF78()
{
  return MEMORY[0x1F41834F0]();
}

uint64_t sub_1DA98BF88()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1DA98BF98()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1DA98BFA8()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1DA98BFB8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1DA98BFC8()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DA98BFD8()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1DA98BFE8()
{
  return MEMORY[0x1F4183748]();
}

uint64_t sub_1DA98BFF8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DA98C008()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DA98C018()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1DA98C028()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1DA98C038()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DA98C048()
{
  return MEMORY[0x1F40E61E8]();
}

uint64_t sub_1DA98C058()
{
  return MEMORY[0x1F40E61F8]();
}

uint64_t sub_1DA98C068()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1DA98C078()
{
  return MEMORY[0x1F40E6268]();
}

uint64_t sub_1DA98C088()
{
  return MEMORY[0x1F40E62A0]();
}

uint64_t sub_1DA98C098()
{
  return MEMORY[0x1F40E62E8]();
}

uint64_t sub_1DA98C0A8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1DA98C0B8()
{
  return MEMORY[0x1F41838A0]();
}

uint64_t sub_1DA98C0C8()
{
  return MEMORY[0x1F41838B0]();
}

uint64_t sub_1DA98C0D8()
{
  return MEMORY[0x1F41838B8]();
}

uint64_t sub_1DA98C0E8()
{
  return MEMORY[0x1F41838D8]();
}

uint64_t sub_1DA98C0F8()
{
  return MEMORY[0x1F4183908]();
}

uint64_t sub_1DA98C108()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DA98C118()
{
  return MEMORY[0x1F41839F0]();
}

uint64_t sub_1DA98C128()
{
  return MEMORY[0x1F41839F8]();
}

uint64_t sub_1DA98C138()
{
  return MEMORY[0x1F4183A08]();
}

uint64_t sub_1DA98C148()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DA98C158()
{
  return MEMORY[0x1F4183A60]();
}

uint64_t sub_1DA98C168()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DA98C178()
{
  return MEMORY[0x1F4183B38]();
}

uint64_t sub_1DA98C188()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1DA98C198()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1DA98C1A8()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1DA98C1B8()
{
  return MEMORY[0x1F4183BB8]();
}

uint64_t sub_1DA98C1C8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_1DA98C1D8()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1DA98C1E8()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1DA98C1F8()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_1DA98C208()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_1DA98C218()
{
  return MEMORY[0x1F4183C70]();
}

uint64_t sub_1DA98C228()
{
  return MEMORY[0x1F4183C78]();
}

uint64_t sub_1DA98C238()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1DA98C248()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1DA98C258()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1DA98C268()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1DA98C278()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1DA98C288()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DA98C298()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1DA98C2A8()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DA98C2B8()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_1DA98C2C8()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1DA98C2D8()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1DA98C2E8()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1DA98C2F8()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1DA98C308()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1DA98C318()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1DA98C328()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1DA98C338()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1DA98C348()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1DA98C358()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1DA98C368()
{
  return MEMORY[0x1F4183F98]();
}

uint64_t sub_1DA98C378()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1DA98C388()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1DA98C398()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1DA98C3A8()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1DA98C3B8()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1DA98C3C8()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1DA98C3D8()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1DA98C3E8()
{
  return MEMORY[0x1F4184100]();
}

uint64_t sub_1DA98C3F8()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1DA98C408()
{
  return MEMORY[0x1F4184160]();
}

uint64_t sub_1DA98C418()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1DA98C428()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1DA98C438()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1DA98C448()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1DA98C458()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1DA98C468()
{
  return MEMORY[0x1F4184328]();
}

uint64_t sub_1DA98C478()
{
  return MEMORY[0x1F4184330]();
}

uint64_t sub_1DA98C488()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1DA98C498()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1DA98C4A8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1DA98C4B8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1DA98C4C8()
{
  return MEMORY[0x1F4184580]();
}

uint64_t sub_1DA98C4D8()
{
  return MEMORY[0x1F40E6538]();
}

uint64_t sub_1DA98C4E8()
{
  return MEMORY[0x1F40E6560]();
}

uint64_t sub_1DA98C4F8()
{
  return MEMORY[0x1F40E6628]();
}

uint64_t sub_1DA98C508()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1DA98C518()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1DA98C528()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DA98C538()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1DA98C548()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DA98C558()
{
  return MEMORY[0x1F4104BE0]();
}

uint64_t sub_1DA98C568()
{
  return MEMORY[0x1F4104BE8]();
}

uint64_t sub_1DA98C578()
{
  return MEMORY[0x1F40E66C8]();
}

uint64_t sub_1DA98C588()
{
  return MEMORY[0x1F40E66D8]();
}

uint64_t sub_1DA98C598()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1DA98C5A8()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1DA98C5B8()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1DA98C5C8()
{
  return MEMORY[0x1F4187048]();
}

uint64_t sub_1DA98C5D8()
{
  return MEMORY[0x1F4187058]();
}

uint64_t sub_1DA98C5E8()
{
  return MEMORY[0x1F4187088]();
}

uint64_t sub_1DA98C5F8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1DA98C608()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1DA98C618()
{
  return MEMORY[0x1F41870D8]();
}

uint64_t sub_1DA98C628()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1DA98C638()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1DA98C648()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1DA98C658()
{
  return MEMORY[0x1F4187130]();
}

uint64_t sub_1DA98C668()
{
  return MEMORY[0x1F4187168]();
}

uint64_t sub_1DA98C678()
{
  return MEMORY[0x1F41871D0]();
}

uint64_t sub_1DA98C688()
{
  return MEMORY[0x1F4187218]();
}

uint64_t sub_1DA98C698()
{
  return MEMORY[0x1F4187248]();
}

uint64_t sub_1DA98C6A8()
{
  return MEMORY[0x1F4188708]();
}

uint64_t sub_1DA98C6B8()
{
  return MEMORY[0x1F4188710]();
}

uint64_t sub_1DA98C6C8()
{
  return MEMORY[0x1F4188718]();
}

uint64_t sub_1DA98C6D8()
{
  return MEMORY[0x1F41116F0]();
}

uint64_t sub_1DA98C6E8()
{
  return MEMORY[0x1F41116F8]();
}

uint64_t sub_1DA98C6F8()
{
  return MEMORY[0x1F4111710]();
}

uint64_t sub_1DA98C708()
{
  return MEMORY[0x1F4111720]();
}

uint64_t sub_1DA98C718()
{
  return MEMORY[0x1F40E6798]();
}

uint64_t sub_1DA98C728()
{
  return MEMORY[0x1F40E67A0]();
}

uint64_t sub_1DA98C738()
{
  return MEMORY[0x1F41872C0]();
}

uint64_t sub_1DA98C748()
{
  return MEMORY[0x1F40E6800]();
}

uint64_t sub_1DA98C758()
{
  return MEMORY[0x1F40E6808]();
}

uint64_t sub_1DA98C768()
{
  return MEMORY[0x1F40E6810]();
}

uint64_t sub_1DA98C778()
{
  return MEMORY[0x1F4104C00]();
}

uint64_t sub_1DA98C788()
{
  return MEMORY[0x1F40E68F8]();
}

uint64_t sub_1DA98C798()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1DA98C7A8()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1DA98C7B8()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1DA98C7C8()
{
  return MEMORY[0x1F40E6A98]();
}

uint64_t sub_1DA98C7D8()
{
  return MEMORY[0x1F40E6AB0]();
}

uint64_t sub_1DA98C7E8()
{
  return MEMORY[0x1F40E6AF0]();
}

uint64_t sub_1DA98C7F8()
{
  return MEMORY[0x1F4188720]();
}

uint64_t sub_1DA98C808()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1DA98C818()
{
  return MEMORY[0x1F4188758]();
}

uint64_t sub_1DA98C828()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1DA98C838()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1DA98C848()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1DA98C858()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DA98C868()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1DA98C878()
{
  return MEMORY[0x1F40E6BB0]();
}

uint64_t sub_1DA98C888()
{
  return MEMORY[0x1F40E6C50]();
}

uint64_t sub_1DA98C898()
{
  return MEMORY[0x1F40E6C68]();
}

uint64_t sub_1DA98C8A8()
{
  return MEMORY[0x1F40E6C80]();
}

uint64_t sub_1DA98C8B8()
{
  return MEMORY[0x1F40E6C98]();
}

uint64_t sub_1DA98C8C8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1DA98C8D8()
{
  return MEMORY[0x1F41849B0]();
}

uint64_t sub_1DA98C8E8()
{
  return MEMORY[0x1F4184A78]();
}

uint64_t sub_1DA98C908()
{
  return MEMORY[0x1F4184B10]();
}

uint64_t sub_1DA98C918()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DA98C928()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1DA98C938()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1DA98C948()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1DA98C958()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1DA98C968()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1DA98C988()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1DA98C998()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1DA98C9A8()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1DA98C9B8()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1DA98C9C8()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1DA98C9D8()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1DA98C9E8()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1DA98C9F8()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1DA98CA08()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1DA98CA18()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DA98CA28()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DA98CA38()
{
  return MEMORY[0x1F4184D20]();
}

uint64_t sub_1DA98CA48()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1DA98CA58()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DA98CA68()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1DA98CA78()
{
  return MEMORY[0x1F4184DD0]();
}

uint64_t sub_1DA98CA88()
{
  return MEMORY[0x1F4184DF0]();
}

uint64_t sub_1DA98CA98()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DA98CAA8()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1DA98CAB8()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1DA98CAC8()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DA98CAD8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1DA98CAE8()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1DA98CAF8()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1DA98CB08()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1DA98CB18()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1DA98CB28()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1DA98CB38()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1DA98CB48()
{
  return MEMORY[0x1F4185008]();
}

uint64_t sub_1DA98CB58()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1DA98CB68()
{
  return MEMORY[0x1F41851A8]();
}

uint64_t sub_1DA98CB78()
{
  return MEMORY[0x1F41851F8]();
}

uint64_t sub_1DA98CB88()
{
  return MEMORY[0x1F4185270]();
}

uint64_t sub_1DA98CB98()
{
  return MEMORY[0x1F4185278]();
}

uint64_t sub_1DA98CBA8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DA98CBB8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1DA98CBC8()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1DA98CBD8()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DA98CBE8()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DA98CBF8()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DA98CC08()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DA98CC18()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DA98CC28()
{
  return MEMORY[0x1F41853D0]();
}

uint64_t sub_1DA98CC38()
{
  return MEMORY[0x1F41853F8]();
}

uint64_t sub_1DA98CC58()
{
  return MEMORY[0x1F41854C8]();
}

uint64_t sub_1DA98CC68()
{
  return MEMORY[0x1F41854D8]();
}

uint64_t sub_1DA98CC78()
{
  return MEMORY[0x1F41854E0]();
}

uint64_t sub_1DA98CC88()
{
  return MEMORY[0x1F41854F8]();
}

uint64_t sub_1DA98CC98()
{
  return MEMORY[0x1F4185528]();
}

uint64_t sub_1DA98CCA8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_1DA98CCB8()
{
  return MEMORY[0x1F4185570]();
}

uint64_t sub_1DA98CCC8()
{
  return MEMORY[0x1F4185578]();
}

uint64_t sub_1DA98CCD8()
{
  return MEMORY[0x1F4185588]();
}

uint64_t sub_1DA98CCE8()
{
  return MEMORY[0x1F4185590]();
}

uint64_t sub_1DA98CCF8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_1DA98CD08()
{
  return MEMORY[0x1F41855D0]();
}

uint64_t sub_1DA98CD18()
{
  return MEMORY[0x1F41855E0]();
}

uint64_t sub_1DA98CD28()
{
  return MEMORY[0x1F41855E8]();
}

uint64_t sub_1DA98CD38()
{
  return MEMORY[0x1F4185608]();
}

uint64_t sub_1DA98CD48()
{
  return MEMORY[0x1F4185628]();
}

uint64_t sub_1DA98CD58()
{
  return MEMORY[0x1F4185658]();
}

uint64_t sub_1DA98CD68()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_1DA98CD78()
{
  return MEMORY[0x1F4185698]();
}

uint64_t sub_1DA98CD88()
{
  return MEMORY[0x1F41856A0]();
}

uint64_t sub_1DA98CD98()
{
  return MEMORY[0x1F41856B0]();
}

uint64_t sub_1DA98CDA8()
{
  return MEMORY[0x1F41856B8]();
}

uint64_t sub_1DA98CDB8()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_1DA98CDC8()
{
  return MEMORY[0x1F41856F8]();
}

uint64_t sub_1DA98CDD8()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1DA98CDE8()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_1DA98CDF8()
{
  return MEMORY[0x1F41859A8]();
}

uint64_t sub_1DA98CE08()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1DA98CE18()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1DA98CE28()
{
  return MEMORY[0x1F4185A18]();
}

uint64_t sub_1DA98CE38()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1DA98CE48()
{
  return MEMORY[0x1F4185A38]();
}

uint64_t sub_1DA98CE58()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DA98CE68()
{
  return MEMORY[0x1F4185A48]();
}

uint64_t sub_1DA98CE78()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1DA98CE88()
{
  return MEMORY[0x1F4185CF8]();
}

uint64_t sub_1DA98CE98()
{
  return MEMORY[0x1F4185D10]();
}

uint64_t sub_1DA98CEA8()
{
  return MEMORY[0x1F4185D68]();
}

uint64_t sub_1DA98CEB8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1DA98CEC8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DA98CED8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1DA98CEE8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1DA98CEF8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1DA98CF08()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1DA98CF18()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DA98CF28()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1DA98CF38()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1DA98CF48()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1DA98CF58()
{
  return MEMORY[0x1F4185EF0]();
}

uint64_t sub_1DA98CF68()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1DA98CF78()
{
  return MEMORY[0x1F4185F00]();
}

uint64_t sub_1DA98CF88()
{
  return MEMORY[0x1F4185F10]();
}

uint64_t sub_1DA98CF98()
{
  return MEMORY[0x1F4185F40]();
}

uint64_t sub_1DA98CFA8()
{
  return MEMORY[0x1F4185F48]();
}

uint64_t sub_1DA98CFB8()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_1DA98CFC8()
{
  return MEMORY[0x1F4185FF0]();
}

uint64_t sub_1DA98CFF8()
{
  return MEMORY[0x1F4186318]();
}

uint64_t BSBundleIDForAuditToken()
{
  return MEMORY[0x1F410C170]();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x1F410C1B0]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1F410C288]();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return MEMORY[0x1F40F4AB8]();
}

uint64_t CAMLEncodeLayerTreeToPathWithOptions()
{
  return MEMORY[0x1F40F4C00]();
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

Boolean CFRunLoopContainsObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  return MEMORY[0x1F40D8080](rl, observer, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1F40D80A0](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1F40D80D8](allocator, activities, repeats, order, callout, context);
}

CGDataConsumerRef CGDataConsumerCreateWithURL(CFURLRef url)
{
  return (CGDataConsumerRef)MEMORY[0x1F40DA2C8](url);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithDataConsumer(CGDataConsumerRef consumer, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9748](consumer, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CHSPlatformFromDYLDPlatform()
{
  return MEMORY[0x1F4111780]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1F4111798]();
}

uint64_t CHSWidgetRelevanceServiceCacheDirectory()
{
  return MEMORY[0x1F41117C8]();
}

uint64_t DMIsMigrationNeeded()
{
  return MEMORY[0x1F41173D0]();
}

uint64_t DMPerformMigrationIfNeeded()
{
  return MEMORY[0x1F41173E0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1F4166AF0]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1F410C6E8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
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

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x1F40CBD38]();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

void exit(int a1)
{
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_transaction_get_description()
{
  return MEMORY[0x1F40CD5A8]();
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1F4186580]();
}

uint64_t swift_getExtendedExistentialTypeMetadata()
{
  return MEMORY[0x1F4186598]();
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

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x1F4186698]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
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